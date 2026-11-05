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
    bool _1076 = false;
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
    float2 _1345 = float2(_85, _87);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1345, float2(0.0), isnan(_1345))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1345, float2(0.0), isnan(_1345))).x;
    float _93 = _87 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1360 = float2(_89, _87);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1360, float2(0.0), isnan(_1360))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1360, float2(0.0), isnan(_1360))).x;
    float2 _1368 = float2(_85, _93);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1368, float2(0.0), isnan(_1368))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1368, float2(0.0), isnan(_1368))).x;
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
    float _279 = _209;
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
    float2 _2048 = float2(_85, _87);
    float2 _550 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2048, float2(0.0), isnan(_2048))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2048, float2(0.0), isnan(_2048))).xy;
    float _552 = _550.x;
    float _554 = _550.y;
    float _556 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].x, _85);
    float _558 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].y, _87);
    float2 _2069 = float2(_556, _558);
    float4 _561 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2069, float2(0.0), isnan(_2069)), int2(0), component::x).xyzw;
    float _563 = _561.x;
    float _565 = _561.y;
    float _567 = _561.z;
    float _569 = _561.w;
    float2 _2085 = float2(_556, _558);
    float4 _571 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2085, float2(0.0), isnan(_2085)), int2(0), component::w).xyzw;
    float _573 = _571.x;
    float _575 = _571.y;
    float _577 = _571.z;
    float _579 = _571.w;
    float _581 = fma(_552, 2.0, -1.0);
    float _583 = fma(_554, 2.0, -1.0);
    float _585 = _581 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _587 = _583 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _589 = fma(_585, 2.0, _85);
    float _591 = fma(_587, 2.0, _87);
    float2 _2121 = float2(_589, _591);
    float3 _595 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2121, float2(0.0), isnan(_2121))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2121, float2(0.0), isnan(_2121))).xyz;
    float _597 = _595.x;
    float _599 = _595.y;
    float _601 = _595.z;
    float _603 = _275 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _605 = fma(_273, (*spvDescriptorSet0.fp_c3)._m0[35].x, _603);
    float _607 = fma(_277, (*spvDescriptorSet0.fp_c3)._m0[35].z, _605);
    float _609 = -_607;
    float _611 = fma(_609, _607, 1.0);
    float _613 = -_607;
    float _615 = fma(_613, (*spvDescriptorSet0.fp_c3)._m0[35].z, _277);
    float _617 = -_607;
    float _619 = fma(_617, (*spvDescriptorSet0.fp_c3)._m0[35].x, _273);
    float _621 = -_607;
    float _623 = fma(_621, (*spvDescriptorSet0.fp_c3)._m0[35].y, _275);
    float _625 = _611 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _627 = fma(_615, _625, _165);
    float _629 = fma(_623, _625, _169);
    float _631 = fma(_619, _625, _171);
    float _633 = -_627;
    bool _635 = _633 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _637 = float(_635);
    float _639 = -_627;
    bool _641 = _639 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _643 = float(_641);
    float _645 = -_565;
    float _647 = fma(_645, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _649 = _637 + _643;
    float _651 = precise::min(_649, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _653 = trunc(_651);
    int _655 = int(_653);
    int _657 = _655 << 6;
    bool _659 = _655 != 0;
    uint _662 = uint(int(uint(_657) >> uint(2)));
    uint _664 = uint(int(uint(int(_662)) >> uint(2)));
    int _666 = int(_662) & 3;
    float _668 = (*spvDescriptorSet0.fp_c3)._m0[int(_664)][_666];
    int _670 = int(_662) + 1;
    uint _672 = uint(int(uint(_670) >> uint(2)));
    int _674 = _670 & 3;
    float _676 = (*spvDescriptorSet0.fp_c3)._m0[int(_672)][_674];
    int _678 = _657 + 16;
    uint _680 = uint(int(uint(_678) >> uint(2)));
    uint _682 = uint(int(uint(int(_680)) >> uint(2)));
    int _684 = int(_680) & 3;
    float _686 = (*spvDescriptorSet0.fp_c3)._m0[int(_682)][_684];
    int _688 = int(_680) + 1;
    uint _690 = uint(int(uint(_688) >> uint(2)));
    int _692 = _688 & 3;
    float _694 = (*spvDescriptorSet0.fp_c3)._m0[int(_690)][_692];
    int _696 = _657 + 48;
    uint _698 = uint(int(uint(_696) >> uint(2)));
    uint _700 = uint(int(uint(int(_698)) >> uint(2)));
    int _702 = int(_698) & 3;
    float _704 = (*spvDescriptorSet0.fp_c3)._m0[int(_700)][_702];
    int _706 = int(_698) + 1;
    uint _708 = uint(int(uint(_706) >> uint(2)));
    int _710 = _706 & 3;
    float _712 = (*spvDescriptorSet0.fp_c3)._m0[int(_708)][_710];
    int _714 = _657 + 24;
    uint _716 = uint(int(uint(_714) >> uint(2)));
    uint _718 = uint(int(uint(int(_716)) >> uint(2)));
    int _720 = int(_716) & 3;
    float _722 = (*spvDescriptorSet0.fp_c3)._m0[int(_718)][_720];
    int _724 = int(_716) + 1;
    uint _726 = uint(int(uint(_724) >> uint(2)));
    int _728 = _724 & 3;
    float _730 = (*spvDescriptorSet0.fp_c3)._m0[int(_726)][_728];
    int _732 = _657 + 32;
    uint _734 = uint(int(uint(_732) >> uint(2)));
    uint _736 = uint(int(uint(int(_734)) >> uint(2)));
    int _738 = int(_734) & 3;
    float _740 = (*spvDescriptorSet0.fp_c3)._m0[int(_736)][_738];
    int _742 = int(_734) + 1;
    uint _744 = uint(int(uint(_742) >> uint(2)));
    int _746 = _742 & 3;
    float _748 = (*spvDescriptorSet0.fp_c3)._m0[int(_744)][_746];
    float _750 = _629 * _676;
    float _752 = fma(_631, _668, _750);
    int _754 = _657 + 8;
    uint _756 = uint(int(uint(_754) >> uint(2)));
    uint _758 = uint(int(uint(int(_756)) >> uint(2)));
    int _760 = int(_756) & 3;
    float _762 = (*spvDescriptorSet0.fp_c3)._m0[int(_758)][_760];
    int _764 = int(_756) + 1;
    uint _766 = uint(int(uint(_764) >> uint(2)));
    int _768 = _764 & 3;
    float _770 = (*spvDescriptorSet0.fp_c3)._m0[int(_766)][_768];
    float _772 = _629 * _694;
    float _774 = _85 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _776 = fma(_631, _686, _772);
    float _778 = _87 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _780 = floor(_774);
    float _782 = _629 * _712;
    float _784 = fma(_631, _704, _782);
    float _786 = fma(_627, _722, _776);
    float _788 = _786 + _730;
    float _790 = -_563;
    float _792 = fma(_790, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _794 = -_780;
    float _796 = _774 + _794;
    float _798 = -_567;
    float _800 = fma(_798, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _802 = -_569;
    float _804 = fma(_802, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _806 = _629 * _748;
    float _808 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _810 = _796 + _808;
    float _812 = 1.0 / _792;
    int _814 = _657 + 40;
    uint _816 = uint(int(uint(_814) >> uint(2)));
    uint _818 = uint(int(uint(int(_816)) >> uint(2)));
    int _820 = int(_816) & 3;
    float _822 = (*spvDescriptorSet0.fp_c3)._m0[int(_818)][_820];
    int _824 = int(_816) + 1;
    uint _826 = uint(int(uint(_824) >> uint(2)));
    int _828 = _824 & 3;
    float _830 = (*spvDescriptorSet0.fp_c3)._m0[int(_826)][_828];
    float _832 = fma(_631, _740, _806);
    float _834 = 1.0 / _800;
    float _836 = floor(_778);
    float _838 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _840 = -_165;
    float _842 = fma(_812, _838, _840);
    float _844 = fma(_627, _762, _752);
    float _846 = precise::min(_165, -1.0000000116860974230803549289703e-07);
    float _848 = _844 + _770;
    float _850 = 1.0 / _647;
    float _852 = -_836;
    float _854 = _778 + _852;
    float _856 = 1.0 / _846;
    float _858 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _860 = _854 + _858;
    float _862 = -_810;
    float _864 = _862 + 1.0;
    float _866 = -_860;
    float _868 = _866 + 1.0;
    float _870 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _872 = -_165;
    float _874 = fma(_850, _870, _872);
    float _876 = _810 * _860;
    float _878 = _860 * _864;
    float _880 = _810 * _868;
    float _882 = _864 * _868;
    float _884 = _856 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _886 = fma(_627, _822, _832);
    float _888 = 1.0 / _804;
    float _890 = abs(_842);
    float _892 = _890 * _884;
    float _894 = abs(_874);
    float _896 = _894 * _884;
    float _898 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _900 = -_165;
    float _902 = fma(_834, _898, _900);
    float _904 = _886 + _830;
    int _906 = _657 + 56;
    uint _908 = uint(int(uint(_906) >> uint(2)));
    uint _910 = uint(int(uint(int(_908)) >> uint(2)));
    int _912 = int(_908) & 3;
    float _914 = (*spvDescriptorSet0.fp_c3)._m0[int(_910)][_912];
    int _916 = int(_908) + 1;
    uint _918 = uint(int(uint(_916) >> uint(2)));
    int _920 = _916 & 3;
    float _922 = (*spvDescriptorSet0.fp_c3)._m0[int(_918)][_920];
    float _924 = abs(_902);
    float _926 = _924 * _884;
    float _928 = exp2(_892);
    float _930 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _932 = -_165;
    float _934 = fma(_888, _930, _932);
    float _936 = exp2(_896);
    float _938 = abs(_934);
    float _940 = _938 * _884;
    float _942 = exp2(_926);
    float _944 = abs(_878);
    float _946 = _944 * _928;
    float _948 = exp2(_940);
    float _950 = abs(_876);
    float _952 = _950 * _936;
    float _954 = abs(_880);
    float _956 = _954 * _942;
    float _958 = _946 + _952;
    float _960 = _956 + _958;
    float _962 = abs(_882);
    float _964 = _962 * _948;
    float _966 = _964 + _960;
    float _968 = fma(_627, _914, _784);
    float _970 = -_964;
    bool _972 = _960 != _970;
    bool _974 = isnan(_960);
    bool _976 = _972 || _974;
    bool _978 = isnan(_970);
    bool _980 = _976 || _978;
    float _982 = 1.0 / _966;
    float _984 = _968 + _922;
    float _986 = 1.0 / _984;
    float _988 = _952 * _982;
    float _990 = _946 * _982;
    float _992 = _956 * _982;
    float _994 = _964 * _982;
    float _996 = _980 ? _988 : 0.25;
    float _998 = _980 ? _990 : 0.25;
    float _1000 = _848 * _986;
    float _1002 = _980 ? _994 : 0.25;
    float _1004 = _996 * _575;
    float _1006 = _980 ? _992 : 0.25;
    float _1008 = fma(_998, _573, _1004);
    float _1010 = _904 * _986;
    float _1012 = precise::clamp(_1010, 0.0, 1.0);
    float _1014 = fma(_1006, _577, _1008);
    float _1016 = _788 * _986;
    float _1018 = fma(_1002, _579, _1014);
    float _1074;
    if (!_659)
    {
        float _1020 = rint(_651);
        float _1022 = precise::max(_1020, 0.0);
        uint _1024 = uint(_1022);
        uint _1026 = clamp(_1024, 0u, 65535u);
        float _1028 = _1012 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _1030 = fma(_1028, 0.5, _1016);
        float _1032 = fma(_1028, 0.5, _1000);
        float _1034 = fma(_1028, -0.5, _1000);
        float _1036 = fma(_1028, -0.5, _1016);
        float3 _2817 = float3(_1000, _1030, float(int(_1026)));
        float3 _2821 = select(_2817, float3(0.0), isnan(_2817));
        float _1038 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2821.xy, uint(rint(_2821.z)), _1012);
        float3 _2830 = float3(_1032, _1030, float(int(_1026)));
        float3 _2832 = select(_2830, float3(0.0), isnan(_2830));
        float _1040 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2832.xy, uint(rint(_2832.z)), _1012);
        float3 _2841 = float3(_1034, _1030, float(int(_1026)));
        float3 _2843 = select(_2841, float3(0.0), isnan(_2841));
        float _1042 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2843.xy, uint(rint(_2843.z)), _1012);
        float3 _2852 = float3(_1032, _1016, float(int(_1026)));
        float3 _2854 = select(_2852, float3(0.0), isnan(_2852));
        float _1044 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2854.xy, uint(rint(_2854.z)), _1012);
        float3 _2863 = float3(_1000, _1016, float(int(_1026)));
        float3 _2865 = select(_2863, float3(0.0), isnan(_2863));
        float _1046 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2865.xy, uint(rint(_2865.z)), _1012);
        float3 _2874 = float3(_1034, _1016, float(int(_1026)));
        float3 _2876 = select(_2874, float3(0.0), isnan(_2874));
        float _1048 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2876.xy, uint(rint(_2876.z)), _1012);
        float3 _2885 = float3(_1032, _1036, float(int(_1026)));
        float3 _2887 = select(_2885, float3(0.0), isnan(_2885));
        float _1050 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2887.xy, uint(rint(_2887.z)), _1012);
        float3 _2896 = float3(_1000, _1036, float(int(_1026)));
        float3 _2898 = select(_2896, float3(0.0), isnan(_2896));
        float _1052 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2898.xy, uint(rint(_2898.z)), _1012);
        float3 _2907 = float3(_1034, _1036, float(int(_1026)));
        float3 _2909 = select(_2907, float3(0.0), isnan(_2907));
        float _1054 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2909.xy, uint(rint(_2909.z)), _1012);
        float _1056 = _1040 + _1038;
        float _1058 = _1056 + _1042;
        float _1060 = _1058 + _1044;
        float _1062 = _1060 + _1046;
        float _1064 = _1062 + _1048;
        float _1066 = _1064 + _1050;
        float _1068 = _1066 + _1052;
        float _1070 = _1068 + _1054;
        float _1072 = _1070 * 0.111111111938953399658203125;
        _1074 = _1072;
        _1076 = true;
    }
    else
    {
        float _1078 = rint(_651);
        float _1080 = precise::max(_1078, 0.0);
        uint _1082 = uint(_1080);
        uint _1084 = clamp(_1082, 0u, 65535u);
        float3 _2956 = float3(_1000, _1016, float(int(_1084)));
        float3 _2958 = select(_2956, float3(0.0), isnan(_2956));
        float _1086 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2958.xy, uint(rint(_2958.z)), _1012);
        _1074 = _1086;
    }
    _1076 = false;
    float _1088 = _1074;
    float _1090 = _542 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _1092 = _542 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _1094 = -_165;
    float _1096 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1098 = _1094 + _1096;
    float _1100 = fma(_544, (*spvDescriptorSet0.fp_c5)._m0[101].x, _1090);
    float _1102 = fma(_544, (*spvDescriptorSet0.fp_c5)._m0[102].x, _1092);
    float _1104 = fma(_546, (*spvDescriptorSet0.fp_c5)._m0[101].z, _1100);
    float _1106 = fma(_546, (*spvDescriptorSet0.fp_c5)._m0[102].z, _1102);
    float _1108 = _1104 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _1110 = _1106 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1112 = trunc(_1108);
    int _1114 = int(_1112);
    float _1116 = trunc(_1110);
    int _1118 = int(_1116);
    int _1120 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1122 = _1114 + _1120;
    int _1124 = _1122 + 1;
    bool _1126 = _1124 >= 0;
    int _1128 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1130 = _1118 + _1128;
    int _1132 = _1130 + 1;
    float _1134 = -_165;
    float _1136 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1138 = _1134 + _1136;
    bool _1140 = _1124 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1142 = !_1126;
    bool _1144 = _1140 || _1142;
    bool _1146 = _1132 < 0;
    bool _1148 = _1146 || _1144;
    bool _1150 = _1132 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1152 = _1150 || _1148;
    float _1154 = as_type<float>(_1114);
    if (_1152)
    {
        _1154 = 1.0;
    }
    float _1156 = _1154;
    float _1158 = _1156;
    if (!_1152)
    {
        int _1160 = _1132 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1162 = _1160 + _1124;
        float _1164 = floor(_1110);
        int _1166 = _1162 << 2;
        int _1168 = _1162 >> 2;
        int _1170 = 12 & _1166;
        int _1172 = _1168 << 4;
        int _1174 = _1172 + _1170;
        float _1176 = floor(_1108);
        uint _1178 = uint(int(uint(_1174) >> uint(2)));
        uint _1180 = uint(int(uint(int(_1178)) >> uint(2)));
        int _1182 = int(_1178) & 3;
        float _1184 = (*spvDescriptorSet0.fp_c5)._m0[int(_1180)][_1182];
        float _1186 = -_1164;
        float _1188 = _1110 + _1186;
        float _1190 = -_1176;
        float _1192 = _1108 + _1190;
        float _1194 = rint(_1184);
        float _1196 = precise::max(_1194, 0.0);
        uint _1198 = uint(_1196);
        uint _1200 = clamp(_1198, 0u, 65535u);
        float3 _3145 = float3(_1192, _1188, float(int(_1200)));
        float3 _3147 = select(_3145, float3(0.0), isnan(_3145));
        float _1202 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _3147.xy, uint(rint(_3147.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _3147.xy, uint(rint(_3147.z)), level(0.0)).x;
        int _1204 = _1162 << 4;
        int _1206 = _1204 + 1648;
        int _1208 = _1174 + 8048;
        uint _1210 = uint(int(uint(_1208) >> uint(2)));
        uint _1212 = uint(int(uint(int(_1210)) >> uint(2)));
        int _1214 = int(_1210) & 3;
        float _1216 = (*spvDescriptorSet0.fp_c5)._m0[int(_1212)][_1214];
        uint _1218 = uint(int(uint(_1206) >> uint(2)));
        uint _1220 = uint(int(uint(int(_1218)) >> uint(2)));
        int _1222 = int(_1218) & 3;
        float _1224 = (*spvDescriptorSet0.fp_c5)._m0[int(_1220)][_1222];
        int _1226 = int(_1218) + 1;
        uint _1228 = uint(int(uint(_1226) >> uint(2)));
        int _1230 = _1226 & 3;
        float _1232 = (*spvDescriptorSet0.fp_c5)._m0[int(_1228)][_1230];
        int _1234 = _1206 + 8;
        uint _1236 = uint(int(uint(_1234) >> uint(2)));
        uint _1238 = uint(int(uint(int(_1236)) >> uint(2)));
        int _1240 = int(_1236) & 3;
        float _1242 = (*spvDescriptorSet0.fp_c5)._m0[int(_1238)][_1240];
        int _1244 = int(_1236) + 1;
        uint _1246 = uint(int(uint(_1244) >> uint(2)));
        int _1248 = _1244 & 3;
        float _1250 = (*spvDescriptorSet0.fp_c5)._m0[int(_1246)][_1248];
        float _1252 = _1216 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1254 = _542 * _1232;
        float _1256 = fma(_544, _1224, _1254);
        float _1258 = 1.0 / _1216;
        float _1260 = fma(_546, _1242, _1256);
        float _1262 = _1260 + _1250;
        float _1264 = precise::clamp(_1262, 0.0, 1.0);
        float _1266 = -_1264;
        float _1268 = _1266 + _1202;
        float _1270 = fma(_1258, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1268);
        float _1272 = _1252 * _1270;
        float _1274 = exp2(_1272);
        float _1276 = 0.0 + _1274;
        float _1278 = precise::clamp(_1276, 0.0, 1.0);
        _1158 = _1278;
    }
    float _1280 = _1158;
    float _1282 = precise::min(_1280, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1284 = _1138 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1286 = precise::clamp(_1284, 0.0, 1.0);
    float _1288 = -_1088;
    float _1290 = _1288 + 1.0;
    float _1292 = _1098 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1294 = precise::clamp(_1292, 0.0, 1.0);
    float _1296 = precise::min(_1018, 1.0);
    float _1298 = -_1282;
    float _1300 = _1298 + 1.0;
    float _1302 = fma(_1286, _1290, _1088);
    float _1304 = precise::min(_597, 1.0);
    float _1306 = fma(_1294, _1300, _1282);
    out.m_60.x = _1302;
    out.m_60.y = _1306;
    out.m_60.z = _1296;
    out.m_60.w = 1.0;
    out.m_62.x = _1304;
    out.m_62.y = _599;
    out.m_62.z = _601;
    out.m_62.w = 1.0;
    return out;
}

