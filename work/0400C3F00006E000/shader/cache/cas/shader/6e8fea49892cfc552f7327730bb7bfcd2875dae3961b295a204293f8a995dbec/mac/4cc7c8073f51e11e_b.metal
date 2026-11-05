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
    texture2d<float> fp_t_tcb_1A [[id(7)]];
    sampler fp_t_tcb_1ASmplr [[id(8)]];
    texture2d<float> fp_t_tcb_14 [[id(9)]];
    sampler fp_t_tcb_14Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_12 [[id(11)]];
    sampler fp_t_tcb_12Smplr [[id(12)]];
    texture2d<float> fp_t_tcb_1C [[id(13)]];
    sampler fp_t_tcb_1CSmplr [[id(14)]];
    texture2d_array<float> fp_t_tcb_C [[id(15)]];
    sampler fp_t_tcb_CSmplr [[id(16)]];
    texture2d<float> fp_t_tcb_E [[id(17)]];
    sampler fp_t_tcb_ESmplr [[id(18)]];
    texture2d<float> fp_t_tcb_16 [[id(19)]];
    sampler fp_t_tcb_16Smplr [[id(20)]];
    texture2d<float> fp_t_tcb_18 [[id(21)]];
    sampler fp_t_tcb_18Smplr [[id(22)]];
    texture2d_array<float> fp_t_tcb_10 [[id(23)]];
    sampler fp_t_tcb_10Smplr [[id(24)]];
    sampler fp_t_tcb_8Smplr_w [[id(25)]];
    sampler fp_t_tcb_ASmplr_w [[id(26)]];
    sampler fp_t_tcb_1ASmplr_w [[id(27)]];
    sampler fp_t_tcb_1CSmplr_w [[id(28)]];
    sampler fp_t_tcb_ESmplr_w [[id(29)]];
    sampler fp_t_tcb_16Smplr_w [[id(30)]];
    sampler fp_t_tcb_18Smplr_w [[id(31)]];
    sampler fp_t_tcb_10Smplr_w [[id(32)]];
    constant dm_border_t* dm_border [[id(33)]];
};

struct main0_out
{
    float4 m_68 [[color(0)]];
    float4 m_70 [[color(1)]];
};

struct main0_in
{
    float4 m_61 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _77 = gl_FragCoord.w;
    float _79 = in.m_59.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_59.y;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = 1.0 / _77;
    float _93 = _91 * _83;
    float _95 = _91 * _89;
    float _97 = _93 + (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float2 _1358 = float2(_93, _95);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1358, float2(0.0), isnan(_1358))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1358, float2(0.0), isnan(_1358))).x;
    float _101 = _95 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1373 = float2(_97, _95);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1373, float2(0.0), isnan(_1373))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1373, float2(0.0), isnan(_1373))).x;
    float2 _1381 = float2(_93, _101);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1381, float2(0.0), isnan(_1381))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1381, float2(0.0), isnan(_1381))).x;
    float _107 = in.m_61.y;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_61.x;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_63.x;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_63.y;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_65.x;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_65.y;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = _91 * _111;
    float _145 = _91 * _117;
    float _147 = _91 * _123;
    float _149 = _91 * _135;
    float _151 = -_99;
    float _153 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _155 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[41].x, _153);
    float _157 = _155 * _143;
    float _159 = _155 * _145;
    float _161 = -_103;
    float _163 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _165 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[41].x, _163);
    float _167 = _91 * _129;
    float _169 = _157 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _171 = _157 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _173 = -_105;
    float _175 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _177 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[41].x, _175);
    float _179 = _91 * _141;
    float _181 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[32].x, _169);
    float _183 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[30].x, _171);
    float _185 = -_157;
    float _187 = fma(_165, _167, _185);
    float _189 = -_159;
    float _191 = fma(_165, _147, _189);
    float _193 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[32].z, _181);
    float _195 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[30].z, _183);
    float _197 = -_155;
    float _199 = _197 + _165;
    float _201 = -_157;
    float _203 = fma(_177, _179, _201);
    float _205 = _193 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _207 = _195 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _209 = -_159;
    float _211 = fma(_177, _149, _209);
    float _213 = -_155;
    float _215 = _213 + _177;
    float _217 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _219 = _205 + _217;
    float _221 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _223 = _207 + _221;
    float _225 = _199 * _211;
    float _227 = _187 * _215;
    float _229 = _219 * _219;
    float _231 = -_225;
    float _233 = fma(_191, _215, _231);
    float _235 = -_227;
    float _237 = fma(_199, _203, _235);
    float _239 = fma(_223, _223, _229);
    float _241 = _191 * _203;
    float _243 = _233 * _233;
    float _245 = sqrt(_239);
    float _247 = -_241;
    float _249 = fma(_187, _211, _247);
    float _251 = fma(_237, _237, _243);
    float _253 = fma(_249, _249, _251);
    float _255 = _157 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _257 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[31].x, _255);
    float _259 = rsqrt(_253);
    float _261 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[31].z, _257);
    bool _265 = _245 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _267 = _261 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    float _269 = _237 * _259;
    float _271 = _233 * _259;
    float _273 = _249 * _259;
    float _275 = _255;
    float _277 = _205;
    float _279 = _267;
    if (!_265)
    {
        _275 = _207;
    }
    float _281 = _275;
    bool _283 = !_265;
    float _285 = _281;
    if (!_283)
    {
        float _287 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _289 = _245 + _287;
        float _291 = _267 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _293 = rsqrt(_239);
        float _295 = -_267;
        float _297 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _299 = _295 + _297;
        float _301 = abs(_291);
        float _303 = abs(_289);
        float _305 = precise::max(_301, _303);
        float _307 = _299 * _299;
        bool _309 = _305 >= 16.0;
        float _311 = _223 * _293;
        float _313 = _219 * _293;
        float _315 = -_223;
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
        float _331 = -_219;
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
                float _468 = abs(_325);
                float _470 = abs(_329);
                float _472 = _468 + _470;
                int _474 = as_type<int>(_325) & int(0x80000000);
                bool _476 = _472 > as_type<float>(0x7f800000u /* inf */);
                bool _478 = isnan(_472);
                bool _480 = _476 || _478;
                bool _482 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _484 = _480 || _482;
                float _486 = _456 * _458;
                float _488 = _486 * _486;
                float _490 = _488 + 11.33538818359375;
                float _492 = fma(_488, _490, 28.84246826171875);
                float _494 = fma(_488, _492, 19.6966705322265625);
                float _496 = fma(_488, -0.82336294651031494140625, -5.674867153167724609375);
                float _498 = fma(_488, _496, -6.565555095672607421875);
                float _500 = 1.0 / _494;
                float _502 = _488 * _498;
                float _504 = _486 * _502;
                float _506 = fma(_504, _500, _486);
                float _508 = _506;
                _394 = _472;
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
                if (!_484)
                {
                    int _524 = _474 | _522;
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
        _285 = _534;
        _277 = _536;
        _279 = _532;
    }
    float _538 = _285;
    float _540 = _277;
    float _542 = _279;
    float2 _2050 = float2(_93, _95);
    float2 _546 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2050, float2(0.0), isnan(_2050))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2050, float2(0.0), isnan(_2050))).xy;
    float _548 = _546.x;
    float _550 = _546.y;
    float _552 = fma(_538, 6.2500002968590706586837768554688e-05, 0.5);
    float _554 = fma(_540, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2068 = float2(_552, _554);
    float _556 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2068, float2(0.0), isnan(_2068))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2068, float2(0.0), isnan(_2068))).x;
    float _558 = _271 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _560 = fma(_269, (*spvDescriptorSet0.fp_c3)._m0[35].x, _558);
    float _562 = fma(_273, (*spvDescriptorSet0.fp_c3)._m0[35].z, _560);
    float _564 = -_562;
    float _566 = fma(_564, _562, 1.0);
    float _568 = -_562;
    float _570 = fma(_568, (*spvDescriptorSet0.fp_c3)._m0[35].z, _273);
    float _572 = -_562;
    float _574 = fma(_572, (*spvDescriptorSet0.fp_c3)._m0[35].x, _269);
    float _576 = -_562;
    float _578 = fma(_576, (*spvDescriptorSet0.fp_c3)._m0[35].y, _271);
    float _580 = _566 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _582 = fma(_570, _580, _155);
    float _584 = fma(_578, _580, _157);
    float _586 = fma(_574, _580, _159);
    float _588 = -_582;
    bool _590 = _588 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _592 = float(_590);
    float _594 = -_582;
    bool _596 = _594 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _598 = float(_596);
    float _600 = _592 + _598;
    float _602 = precise::min(_600, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _604 = trunc(_602);
    int _606 = int(_604);
    float _608 = rint(_602);
    float _610 = precise::max(_608, 0.0);
    uint _613 = uint(_610);
    uint _615 = clamp(_613, 0u, 65535u);
    int _617 = _606 << 6;
    int _619 = _617 + 48;
    uint _621 = uint(int(uint(_619) >> uint(2)));
    uint _623 = uint(int(uint(int(_621)) >> uint(2)));
    int _625 = int(_621) & 3;
    float _627 = (*spvDescriptorSet0.fp_c3)._m0[int(_623)][_625];
    int _629 = int(_621) + 1;
    uint _631 = uint(int(uint(_629) >> uint(2)));
    int _633 = _629 & 3;
    float _635 = (*spvDescriptorSet0.fp_c3)._m0[int(_631)][_633];
    int _637 = _617 + 56;
    uint _639 = uint(int(uint(_637) >> uint(2)));
    uint _641 = uint(int(uint(int(_639)) >> uint(2)));
    int _643 = int(_639) & 3;
    float _645 = (*spvDescriptorSet0.fp_c3)._m0[int(_641)][_643];
    int _647 = int(_639) + 1;
    uint _649 = uint(int(uint(_647) >> uint(2)));
    int _651 = _647 & 3;
    float _653 = (*spvDescriptorSet0.fp_c3)._m0[int(_649)][_651];
    int _655 = _617 + 16;
    uint _657 = uint(int(uint(_655) >> uint(2)));
    uint _659 = uint(int(uint(int(_657)) >> uint(2)));
    int _661 = int(_657) & 3;
    float _663 = (*spvDescriptorSet0.fp_c3)._m0[int(_659)][_661];
    int _665 = int(_657) + 1;
    uint _667 = uint(int(uint(_665) >> uint(2)));
    int _669 = _665 & 3;
    float _671 = (*spvDescriptorSet0.fp_c3)._m0[int(_667)][_669];
    int _673 = _617 + 32;
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
    int _707 = _617 + 24;
    uint _709 = uint(int(uint(_707) >> uint(2)));
    uint _711 = uint(int(uint(int(_709)) >> uint(2)));
    int _713 = int(_709) & 3;
    float _715 = (*spvDescriptorSet0.fp_c3)._m0[int(_711)][_713];
    int _717 = int(_709) + 1;
    uint _719 = uint(int(uint(_717) >> uint(2)));
    int _721 = _717 & 3;
    float _723 = (*spvDescriptorSet0.fp_c3)._m0[int(_719)][_721];
    int _725 = _617 + 40;
    uint _727 = uint(int(uint(_725) >> uint(2)));
    uint _729 = uint(int(uint(int(_727)) >> uint(2)));
    int _731 = int(_727) & 3;
    float _733 = (*spvDescriptorSet0.fp_c3)._m0[int(_729)][_731];
    int _735 = int(_727) + 1;
    uint _737 = uint(int(uint(_735) >> uint(2)));
    int _739 = _735 & 3;
    float _741 = (*spvDescriptorSet0.fp_c3)._m0[int(_737)][_739];
    float _743 = _584 * _635;
    float _745 = fma(_586, _627, _743);
    int _747 = _617 + 8;
    uint _749 = uint(int(uint(_747) >> uint(2)));
    uint _751 = uint(int(uint(int(_749)) >> uint(2)));
    int _753 = int(_749) & 3;
    float _755 = (*spvDescriptorSet0.fp_c3)._m0[int(_751)][_753];
    int _757 = int(_749) + 1;
    uint _759 = uint(int(uint(_757) >> uint(2)));
    int _761 = _757 & 3;
    float _763 = (*spvDescriptorSet0.fp_c3)._m0[int(_759)][_761];
    float _765 = fma(_582, _645, _745);
    float _767 = _765 + _653;
    float _769 = _584 * _671;
    float _771 = 1.0 / _767;
    float _773 = fma(_586, _663, _769);
    float _775 = _584 * _689;
    float _777 = fma(_586, _681, _775);
    float _779 = _584 * _705;
    float _781 = fma(_538, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _783 = fma(_586, _697, _779);
    float _785 = fma(_582, _715, _773);
    float _787 = _785 + _723;
    float _789 = fma(_582, _733, _777);
    float _791 = _789 + _741;
    float _793 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].y, _95);
    float _795 = fma(_582, _755, _783);
    float _797 = _787 * _771;
    float _799 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].x, _93);
    float _801 = _795 + _763;
    float2 _2494 = float2(_799, _793);
    float4 _804 = spvDescriptorSet0.fp_t_tcb_14.gather(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2494, float2(0.0), isnan(_2494)), int2(0), component::x).xyzw;
    float _806 = _804.x;
    float _808 = _804.y;
    float _810 = _804.z;
    float _812 = _804.w;
    float _814 = _801 * _771;
    float _816 = _791 * _771;
    float _818 = precise::clamp(_816, 0.0, 1.0);
    float _820 = fma(_540, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float _822 = fma(_548, 2.0, -1.0);
    float _824 = fma(_550, 2.0, -1.0);
    float _826 = _822 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _828 = _824 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _830 = fma(_826, 2.0, _93);
    float _832 = fma(_828, 2.0, _95);
    float2 _2544 = float2(_799, _793);
    float4 _834 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2544, float2(0.0), isnan(_2544)), int2(0), component::w).xyzw;
    float _836 = _834.x;
    float _838 = _834.y;
    float _840 = _834.z;
    float _842 = _834.w;
    float2 _2560 = float2(_781, _820);
    float _844 = dm_bs(spvDescriptorSet0.fp_t_tcb_1C.sample(spvDescriptorSet0.fp_t_tcb_1CSmplr, select(_2560, float2(0.0), isnan(_2560))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1C, spvDescriptorSet0.fp_t_tcb_1CSmplr_w, select(_2560, float2(0.0), isnan(_2560))).x;
    float3 _2572 = float3(_814, _797, float(int(_615)));
    float3 _2576 = select(_2572, float3(0.0), isnan(_2572));
    float _846 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2576.xy, uint(rint(_2576.z)), _818);
    float2 _2582 = float2(_830, _832);
    float _848 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2582, float2(0.0), isnan(_2582))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2582, float2(0.0), isnan(_2582))).x;
    float2 _2590 = float2(_830, _832);
    float2 _850 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2590, float2(0.0), isnan(_2590))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2590, float2(0.0), isnan(_2590))).yz;
    float _852 = _850.x;
    float _854 = _850.y;
    float2 _2602 = float2(_552, _554);
    float _856 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2602, float2(0.0), isnan(_2602)), level(_556)), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2602, float2(0.0), isnan(_2602)), level(_556)).x;
    float _858 = precise::min(_155, -1.0000000116860974230803549289703e-07);
    float _860 = _93 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _862 = abs(_155);
    float _864 = log2(_862);
    float _866 = _95 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _868 = 1.0 / _858;
    float _870 = floor(_860);
    float _872 = floor(_866);
    float _874 = _868 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _876 = -_870;
    float _878 = _860 + _876;
    float _880 = -_872;
    float _882 = _866 + _880;
    float _884 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _886 = _882 + _884;
    float _888 = -_806;
    float _890 = fma(_888, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _892 = -_808;
    float _894 = fma(_892, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _896 = -_810;
    float _898 = fma(_896, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _900 = -_812;
    float _902 = fma(_900, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _904 = 1.0 / _894;
    float _906 = 1.0 / _890;
    float _908 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _910 = _878 + _908;
    float _912 = _864 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _914 = 1.0 / _898;
    float _916 = 1.0 / _902;
    float _918 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _920 = -_155;
    float _922 = fma(_906, _918, _920);
    float _924 = abs(_922);
    float _926 = _924 * _874;
    float _928 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _930 = -_155;
    float _932 = fma(_904, _928, _930);
    float _934 = _542 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _936 = exp2(_912);
    float _938 = abs(_932);
    float _940 = _938 * _874;
    float _942 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _944 = -_155;
    float _946 = fma(_914, _942, _944);
    float _948 = -_910;
    float _950 = _948 + 1.0;
    float _952 = fma(_538, (*spvDescriptorSet0.fp_c5)._m0[102].x, _934);
    float _954 = abs(_946);
    float _956 = _954 * _874;
    float _958 = exp2(_926);
    float _960 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _962 = -_155;
    float _964 = fma(_916, _960, _962);
    float _966 = _886 * _950;
    float _968 = fma(_540, (*spvDescriptorSet0.fp_c5)._m0[102].z, _952);
    float _970 = abs(_964);
    float _972 = _970 * _874;
    float _974 = exp2(_940);
    float _976 = _542 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _978 = fma(_538, (*spvDescriptorSet0.fp_c5)._m0[101].x, _976);
    float _980 = exp2(_956);
    float _982 = fma(_540, (*spvDescriptorSet0.fp_c5)._m0[101].z, _978);
    float _984 = abs(_966);
    float _986 = _984 * _958;
    float _988 = -_886;
    float _990 = _988 + 1.0;
    float _992 = _910 * _886;
    float _994 = exp2(_972);
    float _996 = abs(_992);
    float _998 = _996 * _974;
    float _1000 = _950 * _990;
    float _1002 = _982 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _1004 = _910 * _990;
    float _1006 = _986 + _998;
    float _1008 = trunc(_1002);
    int _1010 = int(_1008);
    float _1012 = abs(_1004);
    float _1014 = _1012 * _980;
    float _1016 = _968 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1018 = abs(_1000);
    float _1020 = _1018 * _994;
    float _1022 = fma(_936, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _1024 = precise::clamp(_1022, 0.0, 1.0);
    float _1026 = _1014 + _1006;
    float _1028 = trunc(_1016);
    int _1030 = int(_1028);
    float _1032 = _1020 + _1026;
    float _1034 = fma(_1024, -2.0, 3.0);
    float _1036 = _1024 * _1024;
    float _1038 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _1040 = -_1020;
    bool _1042 = _1026 != _1040;
    bool _1044 = isnan(_1026);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan(_1040);
    bool _1050 = _1046 || _1048;
    float _1052 = _1036 * _1034;
    float _1054 = 1.0 / _1032;
    int _1056 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1058 = _1010 + _1056;
    int _1060 = _1058 + 1;
    float _1062 = -_1052;
    float _1064 = _1062 + 1.0;
    float _1066 = precise::max(0.0, _1038);
    bool _1068 = _1060 >= 0;
    float _1070 = fma(_1064, (*spvDescriptorSet0.fp_c3)._m0[44].w, _1052);
    int _1072 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1074 = _1030 + _1072;
    int _1076 = _1074 + 1;
    bool _1078 = _1060 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1080 = !_1068;
    bool _1082 = _1078 || _1080;
    float _1084 = _1070 * _1066;
    bool _1086 = _1076 < 0;
    bool _1088 = _1086 || _1082;
    float _1090 = _998 * _1054;
    float _1092 = _986 * _1054;
    bool _1094 = _1076 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1096 = _1094 || _1088;
    float _1098 = _1020 * _1054;
    float _1100 = _1014 * _1054;
    float _1102 = _1050 ? _1090 : 0.25;
    bool _1104 = _155 >= (-8000.0);
    bool _1106 = isnan(_155);
    bool _1108 = _1104 || _1106;
    bool _1110 = isnan(-8000.0);
    bool _1112 = _1108 || _1110;
    float _1114 = float(_1112);
    float _1116 = _1050 ? _1092 : 0.25;
    float _1118 = _1114 * _1084;
    float _1120 = _1102 * _838;
    float _1122 = -_844;
    float _1124 = _1122 + 1.0;
    float _1126 = _1092;
    if (_1096)
    {
        _1126 = 1.0;
    }
    float _1128 = _1126;
    float _1130 = _1118 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _1132 = fma(_1116, _836, _1120);
    float _1134 = _1050 ? _1100 : 0.25;
    float _1136 = _1128;
    if (!_1096)
    {
        int _1138 = _1076 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1140 = _1138 + _1060;
        float _1142 = floor(_1016);
        int _1144 = _1140 << 2;
        int _1146 = _1140 >> 2;
        int _1148 = 12 & _1144;
        int _1150 = _1146 << 4;
        int _1152 = _1150 + _1148;
        float _1154 = floor(_1002);
        uint _1156 = uint(int(uint(_1152) >> uint(2)));
        uint _1158 = uint(int(uint(int(_1156)) >> uint(2)));
        int _1160 = int(_1156) & 3;
        float _1162 = (*spvDescriptorSet0.fp_c5)._m0[int(_1158)][_1160];
        float _1164 = -_1142;
        float _1166 = _1016 + _1164;
        float _1168 = -_1154;
        float _1170 = _1002 + _1168;
        float _1172 = rint(_1162);
        float _1174 = precise::max(_1172, 0.0);
        uint _1176 = uint(_1174);
        uint _1178 = clamp(_1176, 0u, 65535u);
        float3 _3078 = float3(_1170, _1166, float(int(_1178)));
        float3 _3080 = select(_3078, float3(0.0), isnan(_3078));
        float _1180 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, _3080.xy, uint(rint(_3080.z)), level(0.0)), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, _3080.xy, uint(rint(_3080.z)), level(0.0)).x;
        int _1182 = _1140 << 4;
        int _1184 = _1182 + 1648;
        int _1186 = _1152 + 8048;
        uint _1188 = uint(int(uint(_1186) >> uint(2)));
        uint _1190 = uint(int(uint(int(_1188)) >> uint(2)));
        int _1192 = int(_1188) & 3;
        float _1194 = (*spvDescriptorSet0.fp_c5)._m0[int(_1190)][_1192];
        uint _1196 = uint(int(uint(_1184) >> uint(2)));
        uint _1198 = uint(int(uint(int(_1196)) >> uint(2)));
        int _1200 = int(_1196) & 3;
        float _1202 = (*spvDescriptorSet0.fp_c5)._m0[int(_1198)][_1200];
        int _1204 = int(_1196) + 1;
        uint _1206 = uint(int(uint(_1204) >> uint(2)));
        int _1208 = _1204 & 3;
        float _1210 = (*spvDescriptorSet0.fp_c5)._m0[int(_1206)][_1208];
        int _1212 = _1184 + 8;
        uint _1214 = uint(int(uint(_1212) >> uint(2)));
        uint _1216 = uint(int(uint(int(_1214)) >> uint(2)));
        int _1218 = int(_1214) & 3;
        float _1220 = (*spvDescriptorSet0.fp_c5)._m0[int(_1216)][_1218];
        int _1222 = int(_1214) + 1;
        uint _1224 = uint(int(uint(_1222) >> uint(2)));
        int _1226 = _1222 & 3;
        float _1228 = (*spvDescriptorSet0.fp_c5)._m0[int(_1224)][_1226];
        float _1230 = 1.0 / _1194;
        float _1232 = _542 * _1210;
        float _1234 = fma(_538, _1202, _1232);
        float _1236 = _1194 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1238 = fma(_540, _1220, _1234);
        float _1240 = _1238 + _1228;
        float _1242 = precise::clamp(_1240, 0.0, 1.0);
        float _1244 = -_1242;
        float _1246 = _1244 + _1180;
        float _1248 = fma(_1230, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1246);
        float _1250 = _1236 * _1248;
        float _1252 = exp2(_1250);
        float _1254 = 0.0 + _1252;
        float _1256 = precise::clamp(_1254, 0.0, 1.0);
        _1136 = _1256;
    }
    float _1258 = _1136;
    float _1260 = precise::min(_1258, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1262 = -_155;
    float _1264 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1266 = _1262 + _1264;
    float _1268 = abs(_856);
    float _1270 = _1268 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _1272 = fma(_1134, _840, _1132);
    float _1274 = _1050 ? _1098 : 0.25;
    float _1276 = _1266 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1278 = precise::clamp(_1276, 0.0, 1.0);
    float _1280 = -_1260;
    float _1282 = _1280 + 1.0;
    float _1284 = _1124 * _1130;
    float _1286 = precise::clamp(_1284, 0.0, 1.0);
    float _1288 = -_1270;
    float _1290 = fma(_1114, _1288, 1.0);
    float _1292 = -_155;
    float _1294 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1296 = _1292 + _1294;
    float _1298 = fma(_1278, _1282, _1260);
    float _1300 = -_1286;
    float _1302 = fma(_1300, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _1304 = fma(_1274, _842, _1272);
    float _1306 = precise::min(_1290, 1.0);
    float _1308 = _1296 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1310 = precise::clamp(_1308, 0.0, 1.0);
    float _1312 = -_846;
    float _1314 = _1312 + 1.0;
    float _1316 = precise::min(_1306, _1302);
    float _1318 = fma(_1310, _1314, _846);
    float _1320 = precise::min(_1304, 1.0);
    out.m_68.x = _1318;
    out.m_68.y = _1298;
    out.m_68.z = _1320;
    out.m_68.w = _1316;
    out.m_70.x = _848;
    out.m_70.y = _852;
    out.m_70.z = _854;
    out.m_70.w = 1.0;
    return out;
}

