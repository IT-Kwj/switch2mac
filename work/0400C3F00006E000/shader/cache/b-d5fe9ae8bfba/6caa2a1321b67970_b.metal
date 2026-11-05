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
    texture2d<float> fp_t_tcb_18 [[id(5)]];
    sampler fp_t_tcb_18Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_14 [[id(7)]];
    sampler fp_t_tcb_14Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_12 [[id(9)]];
    sampler fp_t_tcb_12Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_1A [[id(11)]];
    sampler fp_t_tcb_1ASmplr [[id(12)]];
    texture2d_array<float> fp_t_tcb_C [[id(13)]];
    sampler fp_t_tcb_CSmplr [[id(14)]];
    texture2d<float> fp_t_tcb_E [[id(15)]];
    sampler fp_t_tcb_ESmplr [[id(16)]];
    texture2d<float> fp_t_tcb_16 [[id(17)]];
    sampler fp_t_tcb_16Smplr [[id(18)]];
    texture2d_array<float> fp_t_tcb_10 [[id(19)]];
    sampler fp_t_tcb_10Smplr [[id(20)]];
    sampler fp_t_tcb_8Smplr_w [[id(21)]];
    sampler fp_t_tcb_18Smplr_w [[id(22)]];
    sampler fp_t_tcb_1ASmplr_w [[id(23)]];
    sampler fp_t_tcb_ESmplr_w [[id(24)]];
    sampler fp_t_tcb_16Smplr_w [[id(25)]];
    sampler fp_t_tcb_10Smplr_w [[id(26)]];
    constant dm_border_t* dm_border [[id(27)]];
};

struct main0_out
{
    float4 m_64 [[color(0)]];
    float4 m_66 [[color(1)]];
};

struct main0_in
{
    float4 m_57 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_55 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _73 = gl_FragCoord.w;
    float _75 = in.m_55.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_55.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / _73;
    float _89 = _87 * _79;
    float _91 = _87 * _85;
    float _93 = _89 + (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float2 _1329 = float2(_89, _91);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1329, float2(0.0), isnan(_1329))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1329, float2(0.0), isnan(_1329))).x;
    float _97 = _91 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1344 = float2(_93, _91);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1344, float2(0.0), isnan(_1344))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1344, float2(0.0), isnan(_1344))).x;
    float2 _1352 = float2(_89, _97);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1352, float2(0.0), isnan(_1352))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1352, float2(0.0), isnan(_1352))).x;
    float _103 = in.m_57.y;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_57.x;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_59.y;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_59.x;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_61.x;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = in.m_61.y;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = _87 * _107;
    float _141 = _87 * _113;
    float _143 = _87 * _119;
    float _145 = _87 * _125;
    float _147 = _87 * _131;
    float _149 = _87 * _137;
    float _151 = -_95;
    float _153 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _155 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[41].x, _153);
    float _157 = _155 * _139;
    float _159 = _155 * _141;
    float _161 = _157 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _163 = _157 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _165 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[32].x, _161);
    float _167 = -_101;
    float _169 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _171 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[41].x, _169);
    float _173 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[30].x, _163);
    float _175 = -_99;
    float _177 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _179 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[41].x, _177);
    float _181 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[32].z, _165);
    float _183 = -_159;
    float _185 = fma(_171, _147, _183);
    float _187 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[30].z, _173);
    float _189 = -_159;
    float _191 = fma(_179, _145, _189);
    float _193 = _181 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _195 = -_157;
    float _197 = fma(_179, _143, _195);
    float _199 = _187 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _201 = -_155;
    float _203 = _201 + _179;
    float _205 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _207 = _193 + _205;
    float _209 = -_157;
    float _211 = fma(_171, _149, _209);
    float _213 = -_155;
    float _215 = _213 + _171;
    float _217 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _219 = _199 + _217;
    float _221 = _207 * _207;
    float _223 = _203 * _185;
    float _225 = _197 * _215;
    float _227 = fma(_219, _219, _221);
    float _229 = -_223;
    float _231 = fma(_191, _215, _229);
    float _233 = -_225;
    float _235 = fma(_203, _211, _233);
    float _237 = _191 * _211;
    float _239 = sqrt(_227);
    float _241 = _231 * _231;
    float _243 = -_237;
    float _245 = fma(_197, _185, _243);
    float _247 = fma(_235, _235, _241);
    float _249 = fma(_245, _245, _247);
    float _251 = _157 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _253 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[31].x, _251);
    float _255 = rsqrt(_249);
    bool _259 = _239 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _261 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[31].z, _253);
    float _263 = _261 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    float _265 = _251;
    float _267 = _215;
    float _269 = _193;
    if (!_259)
    {
        _265 = _199;
    }
    float _271 = _265;
    float _273 = _235 * _255;
    float _275 = _231 * _255;
    float _277 = _245 * _255;
    float _279 = _271;
    if (!_259)
    {
        _267 = _263;
    }
    float _281 = _267;
    bool _283 = !_259;
    float _285 = _281;
    if (!_283)
    {
        float _287 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _289 = _239 + _287;
        float _291 = _263 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _293 = rsqrt(_227);
        float _295 = -_263;
        float _297 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _299 = _295 + _297;
        float _301 = abs(_291);
        float _303 = abs(_289);
        float _305 = precise::max(_301, _303);
        float _307 = _299 * _299;
        bool _309 = _305 >= 16.0;
        float _311 = _219 * _293;
        float _313 = _207 * _293;
        float _315 = -_219;
        float _317 = fma(_311, (*spvDescriptorSet0.fp_c3)._m0[41].z, _315);
        float _319 = _289;
        float _321 = _291;
        if (_309)
        {
            float _323 = _289 * 0.0625;
            _319 = _323;
        }
        float _325 = _319;
        if (_309)
        {
            float _327 = _291 * 0.0625;
            _321 = _327;
        }
        float _329 = _321;
        float _331 = -_207;
        float _333 = fma(_313, (*spvDescriptorSet0.fp_c3)._m0[41].z, _331);
        float _335 = fma(_317, _317, _307);
        float _337 = abs(_325);
        bool _339 = _337 != 0.0;
        bool _341 = isnan(_337);
        bool _343 = _339 || _341;
        bool _345 = isnan(0.0);
        bool _347 = _343 || _345;
        float _349 = fma(_333, _333, _335);
        float _351 = abs(_329);
        bool _353 = _351 == 0.0;
        float _355 = abs(_329);
        bool _357 = _355 == 0.0;
        bool _359 = !_347;
        bool _361 = _357 && _359;
        float _363 = sqrt(_349);
        bool _365 = false;
        int _368 = as_type<int>(_333);
        if (_361)
        {
            bool _370 = as_type<int>(_329) >= 0;
            _365 = _370;
        }
        bool _372 = _365;
        int _374 = _372 ? (-1) : 0;
        if (_361)
        {
            int _376 = _372 ? 0 : 1078530011;
            _368 = _376;
        }
        int _378 = _368;
        int _380 = _378;
        if (_361)
        {
            int _382 = int(0x80000000) & as_type<int>(_325);
            int _384 = _378 | _382;
            _380 = _384;
        }
        int _386 = _380;
        bool _388 = !_347;
        bool _390 = _388 && _353;
        int _392 = _386;
        float _394 = as_type<float>(_386);
        if (!_390)
        {
            float _396 = abs(_325);
            bool _398 = _396 != as_type<float>(0x7f800000u /* inf */);
            bool _400 = isnan(_396);
            bool _402 = _398 || _400;
            bool _404 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _406 = _402 || _404;
            float _408 = abs(_329);
            bool _410 = _408 == as_type<float>(0x7f800000u /* inf */);
            float _412 = abs(_329);
            bool _414 = _412 == as_type<float>(0x7f800000u /* inf */);
            bool _416 = !_406;
            bool _418 = _414 && _416;
            if (_418)
            {
                bool _420 = as_type<int>(_329) >= 0;
                _374 = _420 ? (-1) : 0;
            }
            int _422 = _374;
            if (_418)
            {
                _392 = 1075235812;
            }
            int _424 = _392;
            int _426 = _424;
            if (_418)
            {
                int _428 = ~_422;
                int _430 = (_428 != 0) ? _424 : 1061752795;
                _426 = _430;
            }
            int _432 = _426;
            float _434 = as_type<float>(_432);
            if (_418)
            {
                int _436 = int(0x80000000) & as_type<int>(_325);
                int _438 = _432 | _436;
                _434 = as_type<float>(_438);
            }
            float _440 = _434;
            bool _442 = !_406;
            bool _444 = _442 && _410;
            _394 = _440;
            if (!_444)
            {
                float _446 = abs(_325);
                float _448 = abs(_329);
                float _450 = precise::max(_446, _448);
                float _452 = abs(_325);
                float _454 = abs(_329);
                float _456 = precise::min(_452, _454);
                float _458 = 1.0 / _450;
                float _460 = abs(_325);
                float _462 = abs(_329);
                bool _464 = _460 > _462;
                bool _466 = as_type<int>(_329) >= 0;
                float _468 = _456 * _458;
                float _470 = abs(_325);
                float _472 = abs(_329);
                float _474 = _470 + _472;
                int _476 = as_type<int>(_325) & int(0x80000000);
                float _478 = _468 * _468;
                bool _480 = _474 > as_type<float>(0x7f800000u /* inf */);
                bool _482 = isnan(_474);
                bool _484 = _480 || _482;
                bool _486 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _488 = _484 || _486;
                float _490 = _478 + 11.33538818359375;
                float _492 = fma(_478, _490, 28.84246826171875);
                float _494 = fma(_478, _492, 19.6966705322265625);
                float _496 = fma(_478, -0.82336294651031494140625, -5.674867153167724609375);
                float _498 = fma(_478, _496, -6.565555095672607421875);
                float _500 = 1.0 / _494;
                float _502 = _478 * _498;
                float _504 = _468 * _502;
                float _506 = fma(_504, _500, _468);
                float _508 = _506;
                _394 = _474;
                if (_464)
                {
                    float _510 = -_506;
                    float _512 = _510 + 1.57079637050628662109375;
                    _508 = _512;
                }
                float _514 = _508;
                int _516 = as_type<int>(_514);
                if (!_466)
                {
                    float _518 = -_514;
                    float _520 = _518 + 3.1415927410125732421875;
                    _516 = as_type<int>(_520);
                }
                int _522 = _516;
                if (!_488)
                {
                    int _524 = _476 | _522;
                    _394 = as_type<float>(_524);
                }
            }
        }
        float _526 = _394;
        float _528 = fma(_526, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _530 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _532 = _363 + _530;
        float _534 = fma(_311, _528, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _536 = fma(_313, _528, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _279 = _534;
        _269 = _536;
        _285 = _532;
    }
    float _538 = _279;
    float _540 = _269;
    float _542 = _285;
    float _544 = fma(_538, 6.2500002968590706586837768554688e-05, 0.5);
    float _546 = fma(_540, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2034 = float2(_544, _546);
    float _548 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2034, float2(0.0), isnan(_2034))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2034, float2(0.0), isnan(_2034))).x;
    float _550 = _275 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _552 = fma(_273, (*spvDescriptorSet0.fp_c3)._m0[35].x, _550);
    float _554 = fma(_277, (*spvDescriptorSet0.fp_c3)._m0[35].z, _552);
    float _556 = -_554;
    float _558 = fma(_556, _554, 1.0);
    float _560 = -_554;
    float _562 = fma(_560, (*spvDescriptorSet0.fp_c3)._m0[35].z, _277);
    float _564 = -_554;
    float _566 = fma(_564, (*spvDescriptorSet0.fp_c3)._m0[35].y, _275);
    float _568 = -_554;
    float _570 = fma(_568, (*spvDescriptorSet0.fp_c3)._m0[35].x, _273);
    float _572 = _558 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _574 = fma(_562, _572, _155);
    float _576 = fma(_566, _572, _157);
    float _578 = fma(_570, _572, _159);
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
    int _602 = _600 + 16;
    uint _605 = uint(int(uint(_602) >> uint(2)));
    uint _607 = uint(int(uint(int(_605)) >> uint(2)));
    int _609 = int(_605) & 3;
    float _611 = (*spvDescriptorSet0.fp_c3)._m0[int(_607)][_609];
    int _613 = int(_605) + 1;
    uint _615 = uint(int(uint(_613) >> uint(2)));
    int _617 = _613 & 3;
    float _619 = (*spvDescriptorSet0.fp_c3)._m0[int(_615)][_617];
    uint _621 = uint(int(uint(_600) >> uint(2)));
    uint _623 = uint(int(uint(int(_621)) >> uint(2)));
    int _625 = int(_621) & 3;
    float _627 = (*spvDescriptorSet0.fp_c3)._m0[int(_623)][_625];
    int _629 = int(_621) + 1;
    uint _631 = uint(int(uint(_629) >> uint(2)));
    int _633 = _629 & 3;
    float _635 = (*spvDescriptorSet0.fp_c3)._m0[int(_631)][_633];
    int _637 = _600 + 24;
    uint _639 = uint(int(uint(_637) >> uint(2)));
    uint _641 = uint(int(uint(int(_639)) >> uint(2)));
    int _643 = int(_639) & 3;
    float _645 = (*spvDescriptorSet0.fp_c3)._m0[int(_641)][_643];
    int _647 = int(_639) + 1;
    uint _649 = uint(int(uint(_647) >> uint(2)));
    int _651 = _647 & 3;
    float _653 = (*spvDescriptorSet0.fp_c3)._m0[int(_649)][_651];
    int _655 = _600 + 32;
    uint _657 = uint(int(uint(_655) >> uint(2)));
    uint _659 = uint(int(uint(int(_657)) >> uint(2)));
    int _661 = int(_657) & 3;
    float _663 = (*spvDescriptorSet0.fp_c3)._m0[int(_659)][_661];
    int _665 = int(_657) + 1;
    uint _667 = uint(int(uint(_665) >> uint(2)));
    int _669 = _665 & 3;
    float _671 = (*spvDescriptorSet0.fp_c3)._m0[int(_667)][_669];
    int _673 = _600 + 48;
    uint _675 = uint(int(uint(_673) >> uint(2)));
    uint _677 = uint(int(uint(int(_675)) >> uint(2)));
    int _679 = int(_675) & 3;
    float _681 = (*spvDescriptorSet0.fp_c3)._m0[int(_677)][_679];
    int _683 = int(_675) + 1;
    uint _685 = uint(int(uint(_683) >> uint(2)));
    int _687 = _683 & 3;
    float _689 = (*spvDescriptorSet0.fp_c3)._m0[int(_685)][_687];
    int _691 = _600 + 8;
    uint _693 = uint(int(uint(_691) >> uint(2)));
    uint _695 = uint(int(uint(int(_693)) >> uint(2)));
    int _697 = int(_693) & 3;
    float _699 = (*spvDescriptorSet0.fp_c3)._m0[int(_695)][_697];
    int _701 = int(_693) + 1;
    uint _703 = uint(int(uint(_701) >> uint(2)));
    int _705 = _701 & 3;
    float _707 = (*spvDescriptorSet0.fp_c3)._m0[int(_703)][_705];
    float _709 = _576 * _619;
    int _711 = _600 + 40;
    uint _713 = uint(int(uint(_711) >> uint(2)));
    uint _715 = uint(int(uint(int(_713)) >> uint(2)));
    int _717 = int(_713) & 3;
    float _719 = (*spvDescriptorSet0.fp_c3)._m0[int(_715)][_717];
    int _721 = int(_713) + 1;
    uint _723 = uint(int(uint(_721) >> uint(2)));
    int _725 = _721 & 3;
    float _727 = (*spvDescriptorSet0.fp_c3)._m0[int(_723)][_725];
    float _729 = fma(_578, _611, _709);
    float _731 = _576 * _635;
    int _733 = _600 + 56;
    uint _735 = uint(int(uint(_733) >> uint(2)));
    uint _737 = uint(int(uint(int(_735)) >> uint(2)));
    int _739 = int(_735) & 3;
    float _741 = (*spvDescriptorSet0.fp_c3)._m0[int(_737)][_739];
    int _743 = int(_735) + 1;
    uint _745 = uint(int(uint(_743) >> uint(2)));
    int _747 = _743 & 3;
    float _749 = (*spvDescriptorSet0.fp_c3)._m0[int(_745)][_747];
    float _751 = fma(_578, _627, _731);
    float _753 = fma(_574, _645, _729);
    float2 _2392 = float2(_89, _91);
    float4 _756 = spvDescriptorSet0.fp_t_tcb_14.gather(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2392, float2(0.0), isnan(_2392)), int2(0), component::x).xyzw;
    float _758 = _756.x;
    float _760 = _756.y;
    float _762 = _756.z;
    float _764 = _756.w;
    float _766 = _753 + _653;
    float _768 = fma(_540, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float _770 = _576 * _671;
    float _772 = fma(_578, _663, _770);
    float _774 = rint(_594);
    float _776 = precise::max(_774, 0.0);
    uint _778 = uint(_776);
    uint _780 = clamp(_778, 0u, 65535u);
    float _782 = _576 * _689;
    float _784 = fma(_578, _681, _782);
    float _786 = fma(_574, _699, _751);
    float _788 = fma(_574, _719, _772);
    float _790 = _786 + _707;
    float _792 = _788 + _727;
    float _794 = fma(_538, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _796 = fma(_574, _741, _784);
    float _798 = _796 + _749;
    float2 _2469 = float2(_89, _91);
    float4 _800 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2469, float2(0.0), isnan(_2469)), int2(0), component::w).xyzw;
    float _802 = _800.x;
    float _804 = _800.y;
    float _806 = _800.z;
    float _808 = _800.w;
    float2 _2485 = float2(_794, _768);
    float _810 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2485, float2(0.0), isnan(_2485))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2485, float2(0.0), isnan(_2485))).x;
    float _812 = 1.0 / _798;
    float _814 = _790 * _812;
    float _816 = _766 * _812;
    float _818 = _792 * _812;
    float _820 = precise::clamp(_818, 0.0, 1.0);
    float3 _2510 = float3(_814, _816, float(int(_780)));
    float3 _2514 = select(_2510, float3(0.0), isnan(_2510));
    float _822 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2514.xy, uint(rint(_2514.z)), _820);
    float2 _2520 = float2(_89, _91);
    float _824 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2520, float2(0.0), isnan(_2520))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2520, float2(0.0), isnan(_2520))).x;
    float2 _2528 = float2(_544, _546);
    float _826 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2528, float2(0.0), isnan(_2528)), level(_548)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2528, float2(0.0), isnan(_2528)), level(_548)).x;
    float _828 = _89 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _830 = _91 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _832 = abs(_155);
    float _834 = log2(_832);
    float _836 = precise::min(_155, -1.0000000116860974230803549289703e-07);
    float _838 = floor(_828);
    float _840 = floor(_830);
    float _842 = _834 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _844 = -_838;
    float _846 = _828 + _844;
    float _848 = exp2(_842);
    float _850 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _852 = _846 + _850;
    float _854 = -_840;
    float _856 = _830 + _854;
    float _858 = -_852;
    float _860 = _858 + 1.0;
    float _862 = 1.0 / _836;
    float _864 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _866 = _856 + _864;
    float _868 = -_866;
    float _870 = _868 + 1.0;
    float _872 = _866 * _860;
    float _874 = _852 * _866;
    float _876 = _852 * _870;
    float _878 = _860 * _870;
    float _880 = fma(_848, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _882 = precise::clamp(_880, 0.0, 1.0);
    float _884 = fma(_882, -2.0, 3.0);
    float _886 = _882 * _882;
    float _888 = _886 * _884;
    float _890 = -_758;
    float _892 = fma(_890, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _894 = -_760;
    float _896 = fma(_894, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _898 = -_762;
    float _900 = fma(_898, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _902 = -_764;
    float _904 = fma(_902, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _906 = _862 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _908 = 1.0 / _896;
    float _910 = 1.0 / _892;
    float _912 = 1.0 / _900;
    float _914 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _916 = -_155;
    float _918 = fma(_908, _914, _916);
    float _920 = _542 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _922 = abs(_918);
    float _924 = _922 * _906;
    float _926 = -_888;
    float _928 = _926 + 1.0;
    float _930 = fma(_538, (*spvDescriptorSet0.fp_c5)._m0[101].x, _920);
    float _932 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _934 = -_155;
    float _936 = fma(_910, _932, _934);
    float _938 = 1.0 / _904;
    float _940 = fma(_928, (*spvDescriptorSet0.fp_c3)._m0[44].w, _888);
    float _942 = abs(_936);
    float _944 = _942 * _906;
    float _946 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _948 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _950 = -_155;
    float _952 = fma(_912, _948, _950);
    float _954 = exp2(_924);
    float _956 = precise::max(0.0, _946);
    float _958 = abs(_952);
    float _960 = _958 * _906;
    float _962 = _940 * _956;
    float _964 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _966 = -_155;
    float _968 = fma(_938, _964, _966);
    float _970 = exp2(_944);
    float _972 = fma(_540, (*spvDescriptorSet0.fp_c5)._m0[101].z, _930);
    float _974 = abs(_968);
    float _976 = _974 * _906;
    float _978 = _542 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _980 = _972 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _982 = abs(_874);
    float _984 = _982 * _954;
    float _986 = exp2(_960);
    float _988 = fma(_538, (*spvDescriptorSet0.fp_c5)._m0[102].x, _978);
    float _990 = fma(_540, (*spvDescriptorSet0.fp_c5)._m0[102].z, _988);
    float _992 = exp2(_976);
    float _994 = abs(_872);
    float _996 = _994 * _970;
    float _998 = _990 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1000 = _996 + _984;
    float _1002 = trunc(_980);
    int _1004 = int(_1002);
    float _1006 = abs(_876);
    float _1008 = _1006 * _986;
    bool _1010 = _155 >= (-8000.0);
    bool _1012 = isnan(_155);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan(-8000.0);
    bool _1018 = _1014 || _1016;
    float _1020 = float(_1018);
    float _1022 = _1008 + _1000;
    float _1024 = abs(_878);
    float _1026 = _1024 * _992;
    float _1028 = trunc(_998);
    int _1030 = int(_1028);
    float _1032 = _1026 + _1022;
    float _1034 = -_1026;
    bool _1036 = _1022 != _1034;
    bool _1038 = isnan(_1022);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan(_1034);
    bool _1044 = _1040 || _1042;
    int _1046 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1048 = _1004 + _1046;
    int _1050 = _1048 + 1;
    float _1052 = 1.0 / _1032;
    bool _1054 = _1050 >= 0;
    bool _1056 = _1050 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1058 = !_1054;
    bool _1060 = _1056 || _1058;
    int _1062 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1064 = _1030 + _1062;
    int _1066 = _1064 + 1;
    bool _1068 = _1066 < 0;
    bool _1070 = _1068 || _1060;
    bool _1072 = _1066 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1074 = _1072 || _1070;
    float _1076 = _984 * _1052;
    float _1078 = _996 * _1052;
    float _1080 = _1020 * _962;
    float _1082 = _1008 * _1052;
    float _1084 = _1044 ? _1076 : 0.25;
    float _1086 = _1044 ? _1078 : 0.25;
    float _1088 = _1084 * _804;
    float _1090 = _1084;
    if (_1074)
    {
        _1090 = 1.0;
    }
    float _1092 = _1090;
    float _1094 = _1092;
    if (!_1074)
    {
        int _1096 = _1066 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1098 = _1096 + _1050;
        float _1100 = floor(_980);
        int _1102 = _1098 << 2;
        int _1104 = _1098 >> 2;
        int _1106 = 12 & _1102;
        int _1108 = _1104 << 4;
        int _1110 = _1108 + _1106;
        float _1112 = floor(_998);
        uint _1114 = uint(int(uint(_1110) >> uint(2)));
        uint _1116 = uint(int(uint(int(_1114)) >> uint(2)));
        int _1118 = int(_1114) & 3;
        float _1120 = (*spvDescriptorSet0.fp_c5)._m0[int(_1116)][_1118];
        float _1122 = -_1112;
        float _1124 = _998 + _1122;
        float _1126 = -_1100;
        float _1128 = _980 + _1126;
        float _1130 = rint(_1120);
        float _1132 = precise::max(_1130, 0.0);
        uint _1134 = uint(_1132);
        uint _1136 = clamp(_1134, 0u, 65535u);
        float3 _2986 = float3(_1128, _1124, float(int(_1136)));
        float3 _2988 = select(_2986, float3(0.0), isnan(_2986));
        float _1138 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, _2988.xy, uint(rint(_2988.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, _2988.xy, uint(rint(_2988.z)), level(0.0)).x;
        int _1140 = _1098 << 4;
        int _1142 = _1140 + 1648;
        int _1144 = _1110 + 8048;
        uint _1146 = uint(int(uint(_1144) >> uint(2)));
        uint _1148 = uint(int(uint(int(_1146)) >> uint(2)));
        int _1150 = int(_1146) & 3;
        float _1152 = (*spvDescriptorSet0.fp_c5)._m0[int(_1148)][_1150];
        uint _1154 = uint(int(uint(_1142) >> uint(2)));
        uint _1156 = uint(int(uint(int(_1154)) >> uint(2)));
        int _1158 = int(_1154) & 3;
        float _1160 = (*spvDescriptorSet0.fp_c5)._m0[int(_1156)][_1158];
        int _1162 = int(_1154) + 1;
        uint _1164 = uint(int(uint(_1162) >> uint(2)));
        int _1166 = _1162 & 3;
        float _1168 = (*spvDescriptorSet0.fp_c5)._m0[int(_1164)][_1166];
        int _1170 = _1142 + 8;
        uint _1172 = uint(int(uint(_1170) >> uint(2)));
        uint _1174 = uint(int(uint(int(_1172)) >> uint(2)));
        int _1176 = int(_1172) & 3;
        float _1178 = (*spvDescriptorSet0.fp_c5)._m0[int(_1174)][_1176];
        int _1180 = int(_1172) + 1;
        uint _1182 = uint(int(uint(_1180) >> uint(2)));
        int _1184 = _1180 & 3;
        float _1186 = (*spvDescriptorSet0.fp_c5)._m0[int(_1182)][_1184];
        float _1188 = _542 * _1168;
        float _1190 = 1.0 / _1152;
        float _1192 = fma(_538, _1160, _1188);
        float _1194 = _1152 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1196 = fma(_540, _1178, _1192);
        float _1198 = _1196 + _1186;
        float _1200 = precise::clamp(_1198, 0.0, 1.0);
        float _1202 = -_1200;
        float _1204 = _1202 + _1138;
        float _1206 = fma(_1190, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1204);
        float _1208 = _1194 * _1206;
        float _1210 = exp2(_1208);
        float _1212 = 0.0 + _1210;
        float _1214 = precise::clamp(_1212, 0.0, 1.0);
        _1094 = _1214;
    }
    float _1216 = _1094;
    float _1218 = _1026 * _1052;
    float _1220 = -_155;
    float _1222 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1224 = _1220 + _1222;
    float _1226 = precise::min(_1216, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1228 = fma(_1086, _802, _1088);
    float _1230 = _1044 ? _1082 : 0.25;
    float _1232 = _1080 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _1234 = -_810;
    float _1236 = _1234 + 1.0;
    float _1238 = abs(_826);
    float _1240 = _1238 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _1242 = _1224 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1244 = precise::clamp(_1242, 0.0, 1.0);
    float _1246 = -_1226;
    float _1248 = _1246 + 1.0;
    float _1250 = _1044 ? _1218 : 0.25;
    float _1252 = fma(_1230, _806, _1228);
    float _1254 = _1236 * _1232;
    float _1256 = precise::clamp(_1254, 0.0, 1.0);
    float _1258 = -_1240;
    float _1260 = fma(_1020, _1258, 1.0);
    float _1262 = -_155;
    float _1264 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1266 = _1262 + _1264;
    float _1268 = fma(_1244, _1248, _1226);
    float _1270 = -_1256;
    float _1272 = fma(_1270, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _1274 = -_822;
    float _1276 = _1274 + 1.0;
    float _1278 = _1266 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1280 = precise::clamp(_1278, 0.0, 1.0);
    float _1282 = fma(_1250, _808, _1252);
    float _1284 = precise::min(_1260, 1.0);
    float _1286 = fma(_1280, _1276, _822);
    float _1288 = precise::min(_1284, _1272);
    float _1290 = precise::min(_1282, 1.0);
    out.m_64.x = _1286;
    out.m_64.y = _1268;
    out.m_64.z = _1290;
    out.m_64.w = _1288;
    out.m_66.x = _824;
    out.m_66.y = 0.5;
    out.m_66.z = 0.5;
    out.m_66.w = 1.0;
    return out;
}

