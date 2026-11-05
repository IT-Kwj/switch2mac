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
    texture2d<float> fp_t_tcb_14 [[id(11)]];
    sampler fp_t_tcb_14Smplr [[id(12)]];
    texture2d_array<float> fp_t_tcb_C [[id(13)]];
    sampler fp_t_tcb_CSmplr [[id(14)]];
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
    bool _1090 = false;
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
    float2 _1359 = float2(_85, _87);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1359, float2(0.0), isnan(_1359))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1359, float2(0.0), isnan(_1359))).x;
    float _93 = _87 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1374 = float2(_89, _87);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1374, float2(0.0), isnan(_1374))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1374, float2(0.0), isnan(_1374))).x;
    float2 _1382 = float2(_85, _93);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1382, float2(0.0), isnan(_1382))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1382, float2(0.0), isnan(_1382))).x;
    float _99 = in.m_53.y;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_53.x;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_55.x;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_55.y;
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
    float _151 = 1.0 / _149;
    float _153 = -_95;
    float _155 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _157 = -_97;
    float _159 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _161 = 1.0 / _155;
    float _163 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _165 = _151 * _163;
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
    float _187 = fma(_179, _139, _185);
    float _189 = -_169;
    float _191 = fma(_179, _141, _189);
    float _193 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[32].z, _181);
    float _195 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _197 = _167 * _195;
    float _199 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[30].z, _183);
    float _201 = -_165;
    float _203 = _201 + _179;
    float _205 = _193 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _207 = -_171;
    float _209 = fma(_197, _143, _207);
    float _211 = _199 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _213 = -_169;
    float _215 = fma(_197, _145, _213);
    float _217 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _219 = _205 + _217;
    float _221 = -_165;
    float _223 = _221 + _197;
    float _225 = _203 * _209;
    float _227 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _229 = _211 + _227;
    float _231 = _219 * _219;
    float _233 = _191 * _223;
    float _235 = -_225;
    float _237 = fma(_187, _223, _235);
    float _239 = _187 * _215;
    float _241 = fma(_229, _229, _231);
    float _243 = -_233;
    float _245 = fma(_203, _215, _243);
    float _247 = _237 * _237;
    float _249 = -_239;
    float _251 = fma(_191, _209, _249);
    float _253 = sqrt(_241);
    float _255 = fma(_245, _245, _247);
    float _257 = _169 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _259 = fma(_251, _251, _255);
    float _261 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[31].x, _257);
    float _263 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[31].z, _261);
    float _265 = rsqrt(_259);
    float _267 = _263 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _271 = _253 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _273 = _245 * _265;
    float _275 = _237 * _265;
    float _277 = _251 * _265;
    float _279 = _245;
    float _281 = _267;
    float _283 = _205;
    if (!_271)
    {
        _279 = _211;
    }
    float _285 = _279;
    bool _287 = !_271;
    float _289 = _285;
    if (!_287)
    {
        float _291 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _293 = _253 + _291;
        float _295 = _267 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _297 = rsqrt(_241);
        float _299 = -_267;
        float _301 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _303 = _299 + _301;
        float _305 = abs(_295);
        float _307 = abs(_293);
        float _309 = precise::max(_305, _307);
        float _311 = _303 * _303;
        bool _313 = _309 >= 16.0;
        float _315 = _229 * _297;
        float _317 = _219 * _297;
        float _319 = -_229;
        float _321 = fma(_315, (*spvDescriptorSet0.fp_c3)._m0[41].z, _319);
        float _323 = -_219;
        float _325 = fma(_317, (*spvDescriptorSet0.fp_c3)._m0[41].z, _323);
        float _327 = _293;
        float _329 = _295;
        int _332 = as_type<int>(_325);
        if (_313)
        {
            float _334 = _293 * 0.0625;
            _327 = _334;
        }
        float _336 = _327;
        if (_313)
        {
            float _338 = _295 * 0.0625;
            _329 = _338;
        }
        float _340 = _329;
        float _342 = fma(_321, _321, _311);
        float _344 = abs(_336);
        bool _346 = _344 != 0.0;
        bool _348 = isnan(_344);
        bool _350 = _346 || _348;
        bool _352 = isnan(0.0);
        bool _354 = _350 || _352;
        float _356 = fma(_325, _325, _342);
        float _358 = abs(_340);
        bool _360 = _358 == 0.0;
        float _362 = abs(_340);
        bool _364 = _362 == 0.0;
        bool _366 = !_354;
        bool _368 = _364 && _366;
        float _370 = sqrt(_356);
        bool _372 = false;
        if (_368)
        {
            bool _374 = as_type<int>(_340) >= 0;
            _372 = _374;
        }
        bool _376 = _372;
        int _378 = _376 ? (-1) : 0;
        if (_368)
        {
            int _380 = _376 ? 0 : 1078530011;
            _332 = _380;
        }
        int _382 = _332;
        int _384 = _382;
        if (_368)
        {
            int _386 = int(0x80000000) & as_type<int>(_336);
            int _388 = _382 | _386;
            _384 = _388;
        }
        int _390 = _384;
        bool _392 = !_354;
        bool _394 = _392 && _360;
        int _396 = _390;
        float _398 = as_type<float>(_390);
        if (!_394)
        {
            float _400 = abs(_336);
            bool _402 = _400 != as_type<float>(0x7f800000u /* inf */);
            bool _404 = isnan(_400);
            bool _406 = _402 || _404;
            bool _408 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _410 = _406 || _408;
            float _412 = abs(_340);
            bool _414 = _412 == as_type<float>(0x7f800000u /* inf */);
            float _416 = abs(_340);
            bool _418 = _416 == as_type<float>(0x7f800000u /* inf */);
            bool _420 = !_410;
            bool _422 = _418 && _420;
            if (_422)
            {
                bool _424 = as_type<int>(_340) >= 0;
                _378 = _424 ? (-1) : 0;
            }
            int _426 = _378;
            if (_422)
            {
                _396 = 1075235812;
            }
            int _428 = _396;
            int _430 = _428;
            if (_422)
            {
                int _432 = ~_426;
                int _434 = (_432 != 0) ? _428 : 1061752795;
                _430 = _434;
            }
            int _436 = _430;
            float _438 = as_type<float>(_436);
            if (_422)
            {
                int _440 = int(0x80000000) & as_type<int>(_336);
                int _442 = _436 | _440;
                _438 = as_type<float>(_442);
            }
            float _444 = _438;
            bool _446 = !_410;
            bool _448 = _446 && _414;
            _398 = _444;
            if (!_448)
            {
                float _450 = abs(_336);
                float _452 = abs(_340);
                float _454 = precise::max(_450, _452);
                float _456 = abs(_336);
                float _458 = abs(_340);
                float _460 = precise::min(_456, _458);
                float _462 = 1.0 / _454;
                float _464 = abs(_336);
                float _466 = abs(_340);
                bool _468 = _464 > _466;
                bool _470 = as_type<int>(_340) >= 0;
                float _472 = _460 * _462;
                float _474 = abs(_336);
                float _476 = abs(_340);
                float _478 = _474 + _476;
                int _480 = as_type<int>(_336) & int(0x80000000);
                float _482 = _472 * _472;
                bool _484 = _478 > as_type<float>(0x7f800000u /* inf */);
                bool _486 = isnan(_478);
                bool _488 = _484 || _486;
                bool _490 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _492 = _488 || _490;
                float _494 = _482 + 11.33538818359375;
                float _496 = fma(_482, _494, 28.84246826171875);
                float _498 = fma(_482, _496, 19.6966705322265625);
                float _500 = fma(_482, -0.82336294651031494140625, -5.674867153167724609375);
                float _502 = fma(_482, _500, -6.565555095672607421875);
                float _504 = 1.0 / _498;
                float _506 = _482 * _502;
                float _508 = _472 * _506;
                float _510 = fma(_508, _504, _472);
                float _512 = _510;
                _398 = _478;
                if (_468)
                {
                    float _514 = -_510;
                    float _516 = _514 + 1.57079637050628662109375;
                    _512 = _516;
                }
                float _518 = _512;
                int _520 = as_type<int>(_518);
                if (!_470)
                {
                    float _522 = -_518;
                    float _524 = _522 + 3.1415927410125732421875;
                    _520 = as_type<int>(_524);
                }
                int _526 = _520;
                if (!_492)
                {
                    int _528 = _480 | _526;
                    _398 = as_type<float>(_528);
                }
            }
        }
        float _530 = _398;
        float _532 = fma(_530, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _534 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _536 = _370 + _534;
        float _538 = fma(_315, _532, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _540 = fma(_317, _532, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _281 = _536;
        _289 = _538;
        _283 = _540;
    }
    float _542 = _281;
    float _544 = _289;
    float _546 = _283;
    float2 _2062 = float2(_85, _87);
    float2 _550 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2062, float2(0.0), isnan(_2062))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2062, float2(0.0), isnan(_2062))).xy;
    float _552 = _550.x;
    float _554 = _550.y;
    float _556 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].x, _85);
    float _558 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].y, _87);
    float2 _2083 = float2(_556, _558);
    float4 _561 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2083, float2(0.0), isnan(_2083)), int2(0), component::x).xyzw;
    float _563 = _561.x;
    float _565 = _561.y;
    float _567 = _561.z;
    float _569 = _561.w;
    float2 _2099 = float2(_556, _558);
    float4 _571 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2099, float2(0.0), isnan(_2099)), int2(0), component::x).xyzw;
    float _573 = _571.x;
    float _575 = _571.y;
    float _577 = _571.z;
    float _579 = _571.w;
    float2 _2115 = float2(_556, _558);
    float4 _581 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2115, float2(0.0), isnan(_2115)), int2(0), component::w).xyzw;
    float _583 = _581.x;
    float _585 = _581.y;
    float _587 = _581.z;
    float _589 = _581.w;
    float _591 = _275 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _593 = fma(_273, (*spvDescriptorSet0.fp_c3)._m0[35].x, _591);
    float _595 = fma(_277, (*spvDescriptorSet0.fp_c3)._m0[35].z, _593);
    float _597 = -_595;
    float _599 = fma(_597, _595, 1.0);
    float _601 = _599 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _603 = fma(_552, 2.0, -1.0);
    float _605 = fma(_554, 2.0, -1.0);
    float _607 = -_595;
    float _609 = fma(_607, (*spvDescriptorSet0.fp_c3)._m0[35].z, _277);
    float _611 = _603 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _613 = _605 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _615 = fma(_611, 2.0, _85);
    float _617 = fma(_613, 2.0, _87);
    float2 _2182 = float2(_615, _617);
    float2 _619 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2182, float2(0.0), isnan(_2182))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2182, float2(0.0), isnan(_2182))).yz;
    float _621 = _619.x;
    float _623 = _619.y;
    float _625 = fma(_609, _601, _165);
    float _627 = -_595;
    float _629 = fma(_627, (*spvDescriptorSet0.fp_c3)._m0[35].x, _273);
    float _631 = -_595;
    float _633 = fma(_631, (*spvDescriptorSet0.fp_c3)._m0[35].y, _275);
    float _635 = _85 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _637 = -_563;
    float _639 = fma(_637, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _641 = -_625;
    bool _643 = _641 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _645 = float(_643);
    float _647 = fma(_629, _601, _171);
    float _649 = -_625;
    bool _651 = _649 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _653 = float(_651);
    float _655 = fma(_633, _601, _169);
    float _657 = -_565;
    float _659 = fma(_657, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _661 = -_567;
    float _663 = fma(_661, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _665 = 1.0 / _639;
    float _667 = _645 + _653;
    float _669 = -_569;
    float _671 = fma(_669, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _673 = precise::min(_667, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _675 = 1.0 / _663;
    float _677 = trunc(_673);
    int _679 = int(_677);
    float _681 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _683 = -_165;
    float _685 = fma(_665, _681, _683);
    float _687 = 1.0 / _671;
    int _689 = _679 << 6;
    bool _691 = _679 != 0;
    uint _694 = uint(int(uint(_689) >> uint(2)));
    uint _696 = uint(int(uint(int(_694)) >> uint(2)));
    int _698 = int(_694) & 3;
    float _700 = (*spvDescriptorSet0.fp_c3)._m0[int(_696)][_698];
    int _702 = int(_694) + 1;
    uint _704 = uint(int(uint(_702) >> uint(2)));
    int _706 = _702 & 3;
    float _708 = (*spvDescriptorSet0.fp_c3)._m0[int(_704)][_706];
    float _710 = 1.0 / _659;
    int _712 = _689 + 16;
    uint _714 = uint(int(uint(_712) >> uint(2)));
    uint _716 = uint(int(uint(int(_714)) >> uint(2)));
    int _718 = int(_714) & 3;
    float _720 = (*spvDescriptorSet0.fp_c3)._m0[int(_716)][_718];
    int _722 = int(_714) + 1;
    uint _724 = uint(int(uint(_722) >> uint(2)));
    int _726 = _722 & 3;
    float _728 = (*spvDescriptorSet0.fp_c3)._m0[int(_724)][_726];
    int _730 = _689 + 32;
    uint _732 = uint(int(uint(_730) >> uint(2)));
    uint _734 = uint(int(uint(int(_732)) >> uint(2)));
    int _736 = int(_732) & 3;
    float _738 = (*spvDescriptorSet0.fp_c3)._m0[int(_734)][_736];
    int _740 = int(_732) + 1;
    uint _742 = uint(int(uint(_740) >> uint(2)));
    int _744 = _740 & 3;
    float _746 = (*spvDescriptorSet0.fp_c3)._m0[int(_742)][_744];
    int _748 = _689 + 48;
    uint _750 = uint(int(uint(_748) >> uint(2)));
    uint _752 = uint(int(uint(int(_750)) >> uint(2)));
    int _754 = int(_750) & 3;
    float _756 = (*spvDescriptorSet0.fp_c3)._m0[int(_752)][_754];
    int _758 = int(_750) + 1;
    uint _760 = uint(int(uint(_758) >> uint(2)));
    int _762 = _758 & 3;
    float _764 = (*spvDescriptorSet0.fp_c3)._m0[int(_760)][_762];
    int _766 = _689 + 56;
    uint _768 = uint(int(uint(_766) >> uint(2)));
    uint _770 = uint(int(uint(int(_768)) >> uint(2)));
    int _772 = int(_768) & 3;
    float _774 = (*spvDescriptorSet0.fp_c3)._m0[int(_770)][_772];
    int _776 = int(_768) + 1;
    uint _778 = uint(int(uint(_776) >> uint(2)));
    int _780 = _776 & 3;
    float _782 = (*spvDescriptorSet0.fp_c3)._m0[int(_778)][_780];
    float _784 = _655 * _708;
    float _786 = fma(_647, _700, _784);
    float _788 = floor(_635);
    float _790 = _655 * _728;
    float _792 = _87 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _794 = fma(_647, _720, _790);
    float _796 = floor(_792);
    float _798 = -_788;
    float _800 = _635 + _798;
    float _802 = _655 * _746;
    float _804 = _655 * _764;
    float _806 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _808 = _800 + _806;
    float _810 = fma(_647, _738, _802);
    float _812 = fma(_647, _756, _804);
    int _814 = _689 + 8;
    uint _816 = uint(int(uint(_814) >> uint(2)));
    uint _818 = uint(int(uint(int(_816)) >> uint(2)));
    int _820 = int(_816) & 3;
    float _822 = (*spvDescriptorSet0.fp_c3)._m0[int(_818)][_820];
    int _824 = int(_816) + 1;
    uint _826 = uint(int(uint(_824) >> uint(2)));
    int _828 = _824 & 3;
    float _830 = (*spvDescriptorSet0.fp_c3)._m0[int(_826)][_828];
    float _832 = -_796;
    float _834 = _792 + _832;
    float _836 = -_808;
    float _838 = _836 + 1.0;
    float _840 = fma(_625, _774, _812);
    float _842 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _844 = _834 + _842;
    float _846 = -_844;
    float _848 = _846 + 1.0;
    float _850 = _808 * _844;
    float _852 = _844 * _838;
    float _854 = _808 * _848;
    float _856 = _838 * _848;
    int _858 = _689 + 40;
    uint _860 = uint(int(uint(_858) >> uint(2)));
    uint _862 = uint(int(uint(int(_860)) >> uint(2)));
    int _864 = int(_860) & 3;
    float _866 = (*spvDescriptorSet0.fp_c3)._m0[int(_862)][_864];
    int _868 = int(_860) + 1;
    uint _870 = uint(int(uint(_868) >> uint(2)));
    int _872 = _868 & 3;
    float _874 = (*spvDescriptorSet0.fp_c3)._m0[int(_870)][_872];
    int _876 = _689 + 24;
    uint _878 = uint(int(uint(_876) >> uint(2)));
    uint _880 = uint(int(uint(int(_878)) >> uint(2)));
    int _882 = int(_878) & 3;
    float _884 = (*spvDescriptorSet0.fp_c3)._m0[int(_880)][_882];
    int _886 = int(_878) + 1;
    uint _888 = uint(int(uint(_886) >> uint(2)));
    int _890 = _886 & 3;
    float _892 = (*spvDescriptorSet0.fp_c3)._m0[int(_888)][_890];
    float _894 = fma(_625, _822, _786);
    float _896 = precise::min(_165, -1.0000000116860974230803549289703e-07);
    float _898 = _894 + _830;
    float _900 = 1.0 / _896;
    float _902 = fma(_625, _866, _810);
    float _904 = _902 + _874;
    float _906 = _900 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _908 = fma(_625, _884, _794);
    float _910 = abs(_685);
    float _912 = _910 * _906;
    float _914 = _908 + _892;
    float _916 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _918 = -_165;
    float _920 = fma(_710, _916, _918);
    float _922 = abs(_920);
    float _924 = _922 * _906;
    float _926 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _928 = -_165;
    float _930 = fma(_675, _926, _928);
    float _932 = exp2(_912);
    float _934 = abs(_930);
    float _936 = _934 * _906;
    float _938 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _940 = -_165;
    float _942 = fma(_687, _938, _940);
    float _944 = exp2(_924);
    float _946 = abs(_942);
    float _948 = _946 * _906;
    float _950 = exp2(_936);
    float _952 = abs(_852);
    float _954 = _952 * _932;
    float _956 = exp2(_948);
    float _958 = abs(_850);
    float _960 = _958 * _944;
    float _962 = _954 + _960;
    float _964 = abs(_854);
    float _966 = _964 * _950;
    float _968 = _966 + _962;
    float _970 = abs(_856);
    float _972 = _970 * _956;
    float _974 = _840 + _782;
    float _976 = _972 + _968;
    float _978 = -_972;
    bool _980 = _968 != _978;
    bool _982 = isnan(_968);
    bool _984 = _980 || _982;
    bool _986 = isnan(_978);
    bool _988 = _984 || _986;
    float _990 = 1.0 / _974;
    float _992 = 1.0 / _976;
    float _994 = _898 * _990;
    float _996 = _960 * _992;
    float _998 = _954 * _992;
    float _1000 = _966 * _992;
    float _1002 = _972 * _992;
    float _1004 = _988 ? _996 : 0.25;
    float _1006 = _988 ? _998 : 0.25;
    float _1008 = _988 ? _1000 : 0.25;
    float _1010 = _1004 * _575;
    float _1012 = _1004 * _585;
    float _1014 = _904 * _990;
    float _1016 = precise::clamp(_1014, 0.0, 1.0);
    float _1018 = fma(_1006, _573, _1010);
    float _1020 = fma(_1006, _583, _1012);
    float _1022 = fma(_1008, _577, _1018);
    float _1024 = _988 ? _1002 : 0.25;
    float _1026 = fma(_1008, _587, _1020);
    float _1028 = _914 * _990;
    float _1030 = fma(_1024, _579, _1022);
    float _1032 = fma(_1024, _589, _1026);
    float _1088;
    if (!_691)
    {
        float _1034 = rint(_673);
        float _1036 = precise::max(_1034, 0.0);
        uint _1038 = uint(_1036);
        uint _1040 = clamp(_1038, 0u, 65535u);
        float _1042 = _1016 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _1044 = fma(_1042, 0.5, _1028);
        float _1046 = fma(_1042, 0.5, _994);
        float _1048 = fma(_1042, -0.5, _994);
        float _1050 = fma(_1042, -0.5, _1028);
        float3 _2861 = float3(_994, _1044, float(int(_1040)));
        float3 _2865 = select(_2861, float3(0.0), isnan(_2861));
        float _1052 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2865.xy, uint(rint(_2865.z)), _1016);
        float3 _2874 = float3(_1046, _1044, float(int(_1040)));
        float3 _2876 = select(_2874, float3(0.0), isnan(_2874));
        float _1054 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2876.xy, uint(rint(_2876.z)), _1016);
        float3 _2885 = float3(_1048, _1044, float(int(_1040)));
        float3 _2887 = select(_2885, float3(0.0), isnan(_2885));
        float _1056 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2887.xy, uint(rint(_2887.z)), _1016);
        float3 _2896 = float3(_1046, _1028, float(int(_1040)));
        float3 _2898 = select(_2896, float3(0.0), isnan(_2896));
        float _1058 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2898.xy, uint(rint(_2898.z)), _1016);
        float3 _2907 = float3(_994, _1028, float(int(_1040)));
        float3 _2909 = select(_2907, float3(0.0), isnan(_2907));
        float _1060 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2909.xy, uint(rint(_2909.z)), _1016);
        float3 _2918 = float3(_1048, _1028, float(int(_1040)));
        float3 _2920 = select(_2918, float3(0.0), isnan(_2918));
        float _1062 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2920.xy, uint(rint(_2920.z)), _1016);
        float3 _2929 = float3(_1046, _1050, float(int(_1040)));
        float3 _2931 = select(_2929, float3(0.0), isnan(_2929));
        float _1064 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2931.xy, uint(rint(_2931.z)), _1016);
        float3 _2940 = float3(_994, _1050, float(int(_1040)));
        float3 _2942 = select(_2940, float3(0.0), isnan(_2940));
        float _1066 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2942.xy, uint(rint(_2942.z)), _1016);
        float3 _2951 = float3(_1048, _1050, float(int(_1040)));
        float3 _2953 = select(_2951, float3(0.0), isnan(_2951));
        float _1068 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2953.xy, uint(rint(_2953.z)), _1016);
        float _1070 = _1054 + _1052;
        float _1072 = _1070 + _1056;
        float _1074 = _1072 + _1058;
        float _1076 = _1074 + _1060;
        float _1078 = _1076 + _1062;
        float _1080 = _1078 + _1064;
        float _1082 = _1080 + _1066;
        float _1084 = _1082 + _1068;
        float _1086 = _1084 * 0.111111111938953399658203125;
        _1088 = _1086;
        _1090 = true;
    }
    else
    {
        float _1092 = rint(_673);
        float _1094 = precise::max(_1092, 0.0);
        uint _1096 = uint(_1094);
        uint _1098 = clamp(_1096, 0u, 65535u);
        float3 _3000 = float3(_994, _1028, float(int(_1098)));
        float3 _3002 = select(_3000, float3(0.0), isnan(_3000));
        float _1100 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _3002.xy, uint(rint(_3002.z)), _1016);
        _1088 = _1100;
    }
    _1090 = false;
    float _1102 = _1088;
    float _1104 = _542 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _1106 = _542 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _1108 = -_165;
    float _1110 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1112 = _1108 + _1110;
    float _1114 = fma(_544, (*spvDescriptorSet0.fp_c5)._m0[101].x, _1104);
    float _1116 = fma(_544, (*spvDescriptorSet0.fp_c5)._m0[102].x, _1106);
    float _1118 = fma(_546, (*spvDescriptorSet0.fp_c5)._m0[101].z, _1114);
    float _1120 = fma(_546, (*spvDescriptorSet0.fp_c5)._m0[102].z, _1116);
    float _1122 = _1118 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _1124 = _1120 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1126 = trunc(_1122);
    int _1128 = int(_1126);
    float _1130 = trunc(_1124);
    int _1132 = int(_1130);
    int _1134 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1136 = _1128 + _1134;
    int _1138 = _1136 + 1;
    bool _1140 = _1138 >= 0;
    int _1142 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1144 = _1132 + _1142;
    int _1146 = _1144 + 1;
    float _1148 = -_165;
    float _1150 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1152 = _1148 + _1150;
    bool _1154 = _1138 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1156 = !_1140;
    bool _1158 = _1154 || _1156;
    bool _1160 = _1146 < 0;
    bool _1162 = _1160 || _1158;
    bool _1164 = _1146 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1166 = _1164 || _1162;
    float _1168 = as_type<float>(_1128);
    if (_1166)
    {
        _1168 = 1.0;
    }
    float _1170 = _1168;
    float _1172 = _1170;
    if (!_1166)
    {
        int _1174 = _1146 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1176 = _1174 + _1138;
        float _1178 = floor(_1124);
        int _1180 = _1176 << 2;
        int _1182 = _1176 >> 2;
        int _1184 = 12 & _1180;
        int _1186 = _1182 << 4;
        int _1188 = _1186 + _1184;
        float _1190 = floor(_1122);
        uint _1192 = uint(int(uint(_1188) >> uint(2)));
        uint _1194 = uint(int(uint(int(_1192)) >> uint(2)));
        int _1196 = int(_1192) & 3;
        float _1198 = (*spvDescriptorSet0.fp_c5)._m0[int(_1194)][_1196];
        float _1200 = -_1178;
        float _1202 = _1124 + _1200;
        float _1204 = -_1190;
        float _1206 = _1122 + _1204;
        float _1208 = rint(_1198);
        float _1210 = precise::max(_1208, 0.0);
        uint _1212 = uint(_1210);
        uint _1214 = clamp(_1212, 0u, 65535u);
        float3 _3189 = float3(_1206, _1202, float(int(_1214)));
        float3 _3191 = select(_3189, float3(0.0), isnan(_3189));
        float _1216 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _3191.xy, uint(rint(_3191.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _3191.xy, uint(rint(_3191.z)), level(0.0)).x;
        int _1218 = _1176 << 4;
        int _1220 = _1218 + 1648;
        int _1222 = _1188 + 8048;
        uint _1224 = uint(int(uint(_1222) >> uint(2)));
        uint _1226 = uint(int(uint(int(_1224)) >> uint(2)));
        int _1228 = int(_1224) & 3;
        float _1230 = (*spvDescriptorSet0.fp_c5)._m0[int(_1226)][_1228];
        uint _1232 = uint(int(uint(_1220) >> uint(2)));
        uint _1234 = uint(int(uint(int(_1232)) >> uint(2)));
        int _1236 = int(_1232) & 3;
        float _1238 = (*spvDescriptorSet0.fp_c5)._m0[int(_1234)][_1236];
        int _1240 = int(_1232) + 1;
        uint _1242 = uint(int(uint(_1240) >> uint(2)));
        int _1244 = _1240 & 3;
        float _1246 = (*spvDescriptorSet0.fp_c5)._m0[int(_1242)][_1244];
        int _1248 = _1220 + 8;
        uint _1250 = uint(int(uint(_1248) >> uint(2)));
        uint _1252 = uint(int(uint(int(_1250)) >> uint(2)));
        int _1254 = int(_1250) & 3;
        float _1256 = (*spvDescriptorSet0.fp_c5)._m0[int(_1252)][_1254];
        int _1258 = int(_1250) + 1;
        uint _1260 = uint(int(uint(_1258) >> uint(2)));
        int _1262 = _1258 & 3;
        float _1264 = (*spvDescriptorSet0.fp_c5)._m0[int(_1260)][_1262];
        float _1266 = _1230 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1268 = _542 * _1246;
        float _1270 = fma(_544, _1238, _1268);
        float _1272 = 1.0 / _1230;
        float _1274 = fma(_546, _1256, _1270);
        float _1276 = _1274 + _1264;
        float _1278 = precise::clamp(_1276, 0.0, 1.0);
        float _1280 = -_1278;
        float _1282 = _1280 + _1216;
        float _1284 = fma(_1272, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1282);
        float _1286 = _1266 * _1284;
        float _1288 = exp2(_1286);
        float _1290 = 0.0 + _1288;
        float _1292 = precise::clamp(_1290, 0.0, 1.0);
        _1172 = _1292;
    }
    float _1294 = _1172;
    float _1296 = precise::min(_1294, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1298 = -_1102;
    float _1300 = _1298 + 1.0;
    float _1302 = _1152 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1304 = precise::clamp(_1302, 0.0, 1.0);
    float _1306 = _1112 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1308 = precise::clamp(_1306, 0.0, 1.0);
    float _1310 = precise::min(_1032, 1.0);
    float _1312 = -_1296;
    float _1314 = _1312 + 1.0;
    float _1316 = fma(_1304, _1300, _1102);
    float _1318 = fma(_1308, _1314, _1296);
    float _1320 = precise::min(_1030, 1.0);
    out.m_60.x = _1316;
    out.m_60.y = _1318;
    out.m_60.z = _1310;
    out.m_60.w = 1.0;
    out.m_62.x = _1320;
    out.m_62.y = _621;
    out.m_62.z = _623;
    out.m_62.w = 1.0;
    return out;
}

