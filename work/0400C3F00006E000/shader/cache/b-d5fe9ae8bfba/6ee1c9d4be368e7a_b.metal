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
    bool _1068 = false;
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
    float2 _1335 = float2(_85, _87);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1335, float2(0.0), isnan(_1335))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1335, float2(0.0), isnan(_1335))).x;
    float _93 = _87 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1350 = float2(_89, _87);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1350, float2(0.0), isnan(_1350))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1350, float2(0.0), isnan(_1350))).x;
    float2 _1358 = float2(_85, _93);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1358, float2(0.0), isnan(_1358))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1358, float2(0.0), isnan(_1358))).x;
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
    float _195 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[30].z, _183);
    float _197 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _199 = _167 * _197;
    float _201 = -_165;
    float _203 = _201 + _179;
    float _205 = _193 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _207 = _195 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _209 = -_171;
    float _211 = fma(_199, _143, _209);
    float _213 = -_169;
    float _215 = fma(_199, _145, _213);
    float _217 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _219 = _205 + _217;
    float _221 = -_165;
    float _223 = _221 + _199;
    float _225 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _227 = _207 + _225;
    float _229 = _203 * _211;
    float _231 = _219 * _219;
    float _233 = _191 * _223;
    float _235 = -_229;
    float _237 = fma(_187, _223, _235);
    float _239 = fma(_227, _227, _231);
    float _241 = _187 * _215;
    float _243 = -_233;
    float _245 = fma(_203, _215, _243);
    float _247 = _237 * _237;
    float _249 = sqrt(_239);
    float _251 = -_241;
    float _253 = fma(_191, _211, _251);
    float _255 = fma(_245, _245, _247);
    float _257 = _169 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _259 = fma(_253, _253, _255);
    float _261 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[31].x, _257);
    float _263 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[31].z, _261);
    float _265 = rsqrt(_259);
    bool _269 = _249 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _271 = _263 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    float _273 = _245 * _265;
    float _275 = _237 * _265;
    float _277 = _253 * _265;
    bool _279 = !_269;
    float _281 = _271;
    float _283 = _207;
    float _285 = _205;
    if (!_279)
    {
        float _287 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _289 = _249 + _287;
        float _291 = _271 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _293 = rsqrt(_239);
        float _295 = -_271;
        float _297 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _299 = _295 + _297;
        float _301 = abs(_291);
        float _303 = abs(_289);
        float _305 = precise::max(_301, _303);
        float _307 = _299 * _299;
        bool _309 = _305 >= 16.0;
        float _311 = _227 * _293;
        float _313 = _219 * _293;
        float _315 = -_227;
        float _317 = fma(_311, (*spvDescriptorSet0.fp_c3)._m0[41].z, _315);
        float _319 = -_219;
        float _321 = fma(_313, (*spvDescriptorSet0.fp_c3)._m0[41].z, _319);
        float _323 = _289;
        float _325 = _291;
        int _328 = as_type<int>(_321);
        if (_309)
        {
            float _330 = _289 * 0.0625;
            _323 = _330;
        }
        float _332 = _323;
        if (_309)
        {
            float _334 = _291 * 0.0625;
            _325 = _334;
        }
        float _336 = _325;
        float _338 = fma(_317, _317, _307);
        float _340 = abs(_332);
        bool _342 = _340 != 0.0;
        bool _344 = isnan(_340);
        bool _346 = _342 || _344;
        bool _348 = isnan(0.0);
        bool _350 = _346 || _348;
        float _352 = fma(_321, _321, _338);
        float _354 = abs(_336);
        bool _356 = _354 == 0.0;
        float _358 = abs(_336);
        bool _360 = _358 == 0.0;
        bool _362 = !_350;
        bool _364 = _360 && _362;
        float _366 = sqrt(_352);
        bool _368 = false;
        if (_364)
        {
            bool _370 = as_type<int>(_336) >= 0;
            _368 = _370;
        }
        bool _372 = _368;
        int _374 = _372 ? (-1) : 0;
        if (_364)
        {
            int _376 = _372 ? 0 : 1078530011;
            _328 = _376;
        }
        int _378 = _328;
        int _380 = _378;
        if (_364)
        {
            int _382 = int(0x80000000) & as_type<int>(_332);
            int _384 = _378 | _382;
            _380 = _384;
        }
        int _386 = _380;
        bool _388 = !_350;
        bool _390 = _388 && _356;
        int _392 = _386;
        float _394 = as_type<float>(_386);
        if (!_390)
        {
            float _396 = abs(_332);
            bool _398 = _396 != as_type<float>(0x7f800000u /* inf */);
            bool _400 = isnan(_396);
            bool _402 = _398 || _400;
            bool _404 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _406 = _402 || _404;
            float _408 = abs(_336);
            bool _410 = _408 == as_type<float>(0x7f800000u /* inf */);
            float _412 = abs(_336);
            bool _414 = _412 == as_type<float>(0x7f800000u /* inf */);
            bool _416 = !_406;
            bool _418 = _414 && _416;
            if (_418)
            {
                bool _420 = as_type<int>(_336) >= 0;
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
                int _436 = int(0x80000000) & as_type<int>(_332);
                int _438 = _432 | _436;
                _434 = as_type<float>(_438);
            }
            float _440 = _434;
            bool _442 = !_406;
            bool _444 = _442 && _410;
            _394 = _440;
            if (!_444)
            {
                float _446 = abs(_332);
                float _448 = abs(_336);
                float _450 = precise::max(_446, _448);
                float _452 = abs(_332);
                float _454 = abs(_336);
                float _456 = precise::min(_452, _454);
                float _458 = 1.0 / _450;
                float _460 = abs(_332);
                float _462 = abs(_336);
                bool _464 = _460 > _462;
                bool _466 = as_type<int>(_336) >= 0;
                float _468 = _456 * _458;
                float _470 = abs(_332);
                float _472 = abs(_336);
                float _474 = _470 + _472;
                int _476 = as_type<int>(_332) & int(0x80000000);
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
        float _532 = _366 + _530;
        float _534 = fma(_311, _528, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _536 = fma(_313, _528, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _281 = _532;
        _283 = _534;
        _285 = _536;
    }
    float _538 = _281;
    float _540 = _283;
    float _542 = _285;
    float2 _2031 = float2(_85, _87);
    float2 _546 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2031, float2(0.0), isnan(_2031))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2031, float2(0.0), isnan(_2031))).xy;
    float _548 = _546.x;
    float _550 = _546.y;
    float _552 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].x, _85);
    float _554 = fma(0.5, (*spvDescriptorSet0.fp_c4)._m0[1].y, _87);
    float2 _2052 = float2(_552, _554);
    float4 _557 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2052, float2(0.0), isnan(_2052)), int2(0), component::x).xyzw;
    float _559 = _557.x;
    float _561 = _557.y;
    float _563 = _557.z;
    float _565 = _557.w;
    float2 _2068 = float2(_552, _554);
    float4 _567 = spvDescriptorSet0.fp_t_tcb_10.gather(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2068, float2(0.0), isnan(_2068)), int2(0), component::w).xyzw;
    float _569 = _567.x;
    float _571 = _567.y;
    float _573 = _567.z;
    float _575 = _567.w;
    float _577 = fma(_548, 2.0, -1.0);
    float _579 = fma(_550, 2.0, -1.0);
    float _581 = _577 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _583 = _579 * (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _585 = fma(_581, 2.0, _85);
    float _587 = fma(_583, 2.0, _87);
    float2 _2104 = float2(_585, _587);
    float2 _589 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2104, float2(0.0), isnan(_2104))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2104, float2(0.0), isnan(_2104))).yz;
    float _591 = _589.x;
    float _593 = _589.y;
    float _595 = _275 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _597 = fma(_273, (*spvDescriptorSet0.fp_c3)._m0[35].x, _595);
    float _599 = fma(_277, (*spvDescriptorSet0.fp_c3)._m0[35].z, _597);
    float _601 = -_599;
    float _603 = fma(_601, _599, 1.0);
    float _605 = -_599;
    float _607 = fma(_605, (*spvDescriptorSet0.fp_c3)._m0[35].z, _277);
    float _609 = -_599;
    float _611 = fma(_609, (*spvDescriptorSet0.fp_c3)._m0[35].x, _273);
    float _613 = -_599;
    float _615 = fma(_613, (*spvDescriptorSet0.fp_c3)._m0[35].y, _275);
    float _617 = _603 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _619 = _85 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _621 = fma(_607, _617, _165);
    float _623 = fma(_611, _617, _171);
    float _625 = fma(_615, _617, _169);
    float _627 = -_621;
    bool _629 = _627 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _631 = float(_629);
    float _633 = -_621;
    bool _635 = _633 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _637 = float(_635);
    float _639 = -_561;
    float _641 = fma(_639, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _643 = _631 + _637;
    float _645 = precise::min(_643, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _647 = trunc(_645);
    int _649 = int(_647);
    int _651 = _649 << 6;
    bool _653 = _649 != 0;
    uint _656 = uint(int(uint(_651) >> uint(2)));
    uint _658 = uint(int(uint(int(_656)) >> uint(2)));
    int _660 = int(_656) & 3;
    float _662 = (*spvDescriptorSet0.fp_c3)._m0[int(_658)][_660];
    int _664 = int(_656) + 1;
    uint _666 = uint(int(uint(_664) >> uint(2)));
    int _668 = _664 & 3;
    float _670 = (*spvDescriptorSet0.fp_c3)._m0[int(_666)][_668];
    int _672 = _651 + 16;
    uint _674 = uint(int(uint(_672) >> uint(2)));
    uint _676 = uint(int(uint(int(_674)) >> uint(2)));
    int _678 = int(_674) & 3;
    float _680 = (*spvDescriptorSet0.fp_c3)._m0[int(_676)][_678];
    int _682 = int(_674) + 1;
    uint _684 = uint(int(uint(_682) >> uint(2)));
    int _686 = _682 & 3;
    float _688 = (*spvDescriptorSet0.fp_c3)._m0[int(_684)][_686];
    int _690 = _651 + 32;
    uint _692 = uint(int(uint(_690) >> uint(2)));
    uint _694 = uint(int(uint(int(_692)) >> uint(2)));
    int _696 = int(_692) & 3;
    float _698 = (*spvDescriptorSet0.fp_c3)._m0[int(_694)][_696];
    int _700 = int(_692) + 1;
    uint _702 = uint(int(uint(_700) >> uint(2)));
    int _704 = _700 & 3;
    float _706 = (*spvDescriptorSet0.fp_c3)._m0[int(_702)][_704];
    int _708 = _651 + 48;
    uint _710 = uint(int(uint(_708) >> uint(2)));
    uint _712 = uint(int(uint(int(_710)) >> uint(2)));
    int _714 = int(_710) & 3;
    float _716 = (*spvDescriptorSet0.fp_c3)._m0[int(_712)][_714];
    int _718 = int(_710) + 1;
    uint _720 = uint(int(uint(_718) >> uint(2)));
    int _722 = _718 & 3;
    float _724 = (*spvDescriptorSet0.fp_c3)._m0[int(_720)][_722];
    int _726 = _651 + 8;
    uint _728 = uint(int(uint(_726) >> uint(2)));
    uint _730 = uint(int(uint(int(_728)) >> uint(2)));
    int _732 = int(_728) & 3;
    float _734 = (*spvDescriptorSet0.fp_c3)._m0[int(_730)][_732];
    int _736 = int(_728) + 1;
    uint _738 = uint(int(uint(_736) >> uint(2)));
    int _740 = _736 & 3;
    float _742 = (*spvDescriptorSet0.fp_c3)._m0[int(_738)][_740];
    int _744 = _651 + 24;
    uint _746 = uint(int(uint(_744) >> uint(2)));
    uint _748 = uint(int(uint(int(_746)) >> uint(2)));
    int _750 = int(_746) & 3;
    float _752 = (*spvDescriptorSet0.fp_c3)._m0[int(_748)][_750];
    int _754 = int(_746) + 1;
    uint _756 = uint(int(uint(_754) >> uint(2)));
    int _758 = _754 & 3;
    float _760 = (*spvDescriptorSet0.fp_c3)._m0[int(_756)][_758];
    float _762 = _625 * _670;
    float _764 = _87 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _766 = fma(_623, _662, _762);
    float _768 = floor(_619);
    float _770 = _625 * _688;
    float _772 = fma(_623, _680, _770);
    float _774 = floor(_764);
    float _776 = _625 * _706;
    float _778 = fma(_623, _698, _776);
    float _780 = -_768;
    float _782 = _619 + _780;
    float _784 = _625 * _724;
    float _786 = fma(_623, _716, _784);
    float _788 = -_774;
    float _790 = _764 + _788;
    float _792 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _794 = _782 + _792;
    float _796 = fma(_621, _734, _766);
    float _798 = precise::min(_165, -1.0000000116860974230803549289703e-07);
    float _800 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _802 = _790 + _800;
    float _804 = -_794;
    float _806 = _804 + 1.0;
    int _808 = _651 + 40;
    uint _810 = uint(int(uint(_808) >> uint(2)));
    uint _812 = uint(int(uint(int(_810)) >> uint(2)));
    int _814 = int(_810) & 3;
    float _816 = (*spvDescriptorSet0.fp_c3)._m0[int(_812)][_814];
    int _818 = int(_810) + 1;
    uint _820 = uint(int(uint(_818) >> uint(2)));
    int _822 = _818 & 3;
    float _824 = (*spvDescriptorSet0.fp_c3)._m0[int(_820)][_822];
    float _826 = _796 + _742;
    float _828 = -_802;
    float _830 = _828 + 1.0;
    float _832 = _794 * _802;
    float _834 = _802 * _806;
    float _836 = 1.0 / _641;
    float _838 = _806 * _830;
    float _840 = fma(_621, _752, _772);
    float _842 = -_565;
    float _844 = fma(_842, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _846 = _794 * _830;
    float _848 = _840 + _760;
    float _850 = -_559;
    float _852 = fma(_850, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _854 = 1.0 / _798;
    float _856 = -_563;
    float _858 = fma(_856, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _860 = 1.0 / _852;
    float _862 = 1.0 / _858;
    float _864 = _854 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _866 = 1.0 / _844;
    float _868 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _870 = -_165;
    float _872 = fma(_860, _868, _870);
    float _874 = abs(_872);
    float _876 = _874 * _864;
    float _878 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _880 = -_165;
    float _882 = fma(_836, _878, _880);
    float _884 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _886 = -_165;
    float _888 = fma(_862, _884, _886);
    int _890 = _651 + 56;
    uint _892 = uint(int(uint(_890) >> uint(2)));
    uint _894 = uint(int(uint(int(_892)) >> uint(2)));
    int _896 = int(_892) & 3;
    float _898 = (*spvDescriptorSet0.fp_c3)._m0[int(_894)][_896];
    int _900 = int(_892) + 1;
    uint _902 = uint(int(uint(_900) >> uint(2)));
    int _904 = _900 & 3;
    float _906 = (*spvDescriptorSet0.fp_c3)._m0[int(_902)][_904];
    float _908 = fma(_621, _816, _778);
    float _910 = abs(_882);
    float _912 = _910 * _864;
    float _914 = exp2(_876);
    float _916 = _908 + _824;
    float _918 = abs(_888);
    float _920 = _918 * _864;
    float _922 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _924 = -_165;
    float _926 = fma(_866, _922, _924);
    float _928 = exp2(_912);
    float _930 = abs(_926);
    float _932 = _930 * _864;
    float _934 = exp2(_920);
    float _936 = abs(_834);
    float _938 = _936 * _914;
    float _940 = exp2(_932);
    float _942 = abs(_832);
    float _944 = _942 * _928;
    float _946 = _938 + _944;
    float _948 = abs(_846);
    float _950 = _948 * _934;
    float _952 = _950 + _946;
    float _954 = abs(_838);
    float _956 = _954 * _940;
    float _958 = _956 + _952;
    float _960 = fma(_621, _898, _786);
    float _962 = -_956;
    bool _964 = _952 != _962;
    bool _966 = isnan(_952);
    bool _968 = _964 || _966;
    bool _970 = isnan(_962);
    bool _972 = _968 || _970;
    float _974 = _960 + _906;
    float _976 = 1.0 / _958;
    float _978 = 1.0 / _974;
    float _980 = _944 * _976;
    float _982 = _938 * _976;
    float _984 = _950 * _976;
    float _986 = _956 * _976;
    float _988 = _972 ? _980 : 0.25;
    float _990 = _972 ? _982 : 0.25;
    float _992 = _826 * _978;
    float _994 = _972 ? _986 : 0.25;
    float _996 = _988 * _571;
    float _998 = _972 ? _984 : 0.25;
    float _1000 = _916 * _978;
    float _1002 = precise::clamp(_1000, 0.0, 1.0);
    float _1004 = fma(_990, _569, _996);
    float _1006 = fma(_998, _573, _1004);
    float _1008 = _848 * _978;
    float _1010 = fma(_994, _575, _1006);
    float _1066;
    if (!_653)
    {
        float _1012 = rint(_645);
        float _1014 = precise::max(_1012, 0.0);
        uint _1016 = uint(_1014);
        uint _1018 = clamp(_1016, 0u, 65535u);
        float _1020 = _1002 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
        float _1022 = fma(_1020, 0.5, _1008);
        float _1024 = fma(_1020, 0.5, _992);
        float _1026 = fma(_1020, -0.5, _992);
        float _1028 = fma(_1020, -0.5, _1008);
        float3 _2799 = float3(_992, _1022, float(int(_1018)));
        float3 _2803 = select(_2799, float3(0.0), isnan(_2799));
        float _1030 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2803.xy, uint(rint(_2803.z)), _1002);
        float3 _2812 = float3(_1024, _1022, float(int(_1018)));
        float3 _2814 = select(_2812, float3(0.0), isnan(_2812));
        float _1032 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2814.xy, uint(rint(_2814.z)), _1002);
        float3 _2823 = float3(_1026, _1022, float(int(_1018)));
        float3 _2825 = select(_2823, float3(0.0), isnan(_2823));
        float _1034 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2825.xy, uint(rint(_2825.z)), _1002);
        float3 _2834 = float3(_1024, _1008, float(int(_1018)));
        float3 _2836 = select(_2834, float3(0.0), isnan(_2834));
        float _1036 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2836.xy, uint(rint(_2836.z)), _1002);
        float3 _2845 = float3(_992, _1008, float(int(_1018)));
        float3 _2847 = select(_2845, float3(0.0), isnan(_2845));
        float _1038 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2847.xy, uint(rint(_2847.z)), _1002);
        float3 _2856 = float3(_1026, _1008, float(int(_1018)));
        float3 _2858 = select(_2856, float3(0.0), isnan(_2856));
        float _1040 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2858.xy, uint(rint(_2858.z)), _1002);
        float3 _2867 = float3(_1024, _1028, float(int(_1018)));
        float3 _2869 = select(_2867, float3(0.0), isnan(_2867));
        float _1042 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2869.xy, uint(rint(_2869.z)), _1002);
        float3 _2878 = float3(_992, _1028, float(int(_1018)));
        float3 _2880 = select(_2878, float3(0.0), isnan(_2878));
        float _1044 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2880.xy, uint(rint(_2880.z)), _1002);
        float3 _2889 = float3(_1026, _1028, float(int(_1018)));
        float3 _2891 = select(_2889, float3(0.0), isnan(_2889));
        float _1046 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2891.xy, uint(rint(_2891.z)), _1002);
        float _1048 = _1032 + _1030;
        float _1050 = _1048 + _1034;
        float _1052 = _1050 + _1036;
        float _1054 = _1052 + _1038;
        float _1056 = _1054 + _1040;
        float _1058 = _1056 + _1042;
        float _1060 = _1058 + _1044;
        float _1062 = _1060 + _1046;
        float _1064 = _1062 * 0.111111111938953399658203125;
        _1066 = _1064;
        _1068 = true;
    }
    else
    {
        float _1070 = rint(_645);
        float _1072 = precise::max(_1070, 0.0);
        uint _1074 = uint(_1072);
        uint _1076 = clamp(_1074, 0u, 65535u);
        float3 _2938 = float3(_992, _1008, float(int(_1076)));
        float3 _2940 = select(_2938, float3(0.0), isnan(_2938));
        float _1078 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2940.xy, uint(rint(_2940.z)), _1002);
        _1066 = _1078;
    }
    _1068 = false;
    float _1080 = _1066;
    float _1082 = _538 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _1084 = _538 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _1086 = fma(_540, (*spvDescriptorSet0.fp_c5)._m0[101].x, _1082);
    float _1088 = fma(_540, (*spvDescriptorSet0.fp_c5)._m0[102].x, _1084);
    float _1090 = fma(_542, (*spvDescriptorSet0.fp_c5)._m0[101].z, _1086);
    float _1092 = fma(_542, (*spvDescriptorSet0.fp_c5)._m0[102].z, _1088);
    float _1094 = _1090 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _1096 = _1092 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _1098 = -_165;
    float _1100 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1102 = _1098 + _1100;
    float _1104 = trunc(_1094);
    int _1106 = int(_1104);
    float _1108 = trunc(_1096);
    int _1110 = int(_1108);
    int _1112 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1114 = _1106 + _1112;
    int _1116 = _1114 + 1;
    bool _1118 = _1116 >= 0;
    int _1120 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1122 = _1110 + _1120;
    int _1124 = _1122 + 1;
    float _1126 = -_165;
    float _1128 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1130 = _1126 + _1128;
    bool _1132 = _1116 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1134 = !_1118;
    bool _1136 = _1132 || _1134;
    bool _1138 = _1124 < 0;
    bool _1140 = _1138 || _1136;
    bool _1142 = _1124 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1144 = _1142 || _1140;
    float _1146 = as_type<float>(_1106);
    if (_1144)
    {
        _1146 = 1.0;
    }
    float _1148 = _1146;
    float _1150 = _1148;
    if (!_1144)
    {
        int _1152 = _1124 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1154 = _1152 + _1116;
        float _1156 = floor(_1096);
        int _1158 = _1154 << 2;
        int _1160 = _1154 >> 2;
        int _1162 = 12 & _1158;
        float _1164 = floor(_1094);
        int _1166 = _1160 << 4;
        int _1168 = _1166 + _1162;
        uint _1170 = uint(int(uint(_1168) >> uint(2)));
        uint _1172 = uint(int(uint(int(_1170)) >> uint(2)));
        int _1174 = int(_1170) & 3;
        float _1176 = (*spvDescriptorSet0.fp_c5)._m0[int(_1172)][_1174];
        float _1178 = -_1156;
        float _1180 = _1096 + _1178;
        float _1182 = -_1164;
        float _1184 = _1094 + _1182;
        float _1186 = rint(_1176);
        float _1188 = precise::max(_1186, 0.0);
        uint _1190 = uint(_1188);
        uint _1192 = clamp(_1190, 0u, 65535u);
        float3 _3127 = float3(_1184, _1180, float(int(_1192)));
        float3 _3129 = select(_3127, float3(0.0), isnan(_3127));
        float _1194 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _3129.xy, uint(rint(_3129.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _3129.xy, uint(rint(_3129.z)), level(0.0)).x;
        int _1196 = _1154 << 4;
        int _1198 = _1196 + 1648;
        int _1200 = _1168 + 8048;
        uint _1202 = uint(int(uint(_1200) >> uint(2)));
        uint _1204 = uint(int(uint(int(_1202)) >> uint(2)));
        int _1206 = int(_1202) & 3;
        float _1208 = (*spvDescriptorSet0.fp_c5)._m0[int(_1204)][_1206];
        uint _1210 = uint(int(uint(_1198) >> uint(2)));
        uint _1212 = uint(int(uint(int(_1210)) >> uint(2)));
        int _1214 = int(_1210) & 3;
        float _1216 = (*spvDescriptorSet0.fp_c5)._m0[int(_1212)][_1214];
        int _1218 = int(_1210) + 1;
        uint _1220 = uint(int(uint(_1218) >> uint(2)));
        int _1222 = _1218 & 3;
        float _1224 = (*spvDescriptorSet0.fp_c5)._m0[int(_1220)][_1222];
        int _1226 = _1198 + 8;
        uint _1228 = uint(int(uint(_1226) >> uint(2)));
        uint _1230 = uint(int(uint(int(_1228)) >> uint(2)));
        int _1232 = int(_1228) & 3;
        float _1234 = (*spvDescriptorSet0.fp_c5)._m0[int(_1230)][_1232];
        int _1236 = int(_1228) + 1;
        uint _1238 = uint(int(uint(_1236) >> uint(2)));
        int _1240 = _1236 & 3;
        float _1242 = (*spvDescriptorSet0.fp_c5)._m0[int(_1238)][_1240];
        float _1244 = _1208 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1246 = _538 * _1224;
        float _1248 = 1.0 / _1208;
        float _1250 = fma(_540, _1216, _1246);
        float _1252 = fma(_542, _1234, _1250);
        float _1254 = _1252 + _1242;
        float _1256 = precise::clamp(_1254, 0.0, 1.0);
        float _1258 = -_1256;
        float _1260 = _1258 + _1194;
        float _1262 = fma(_1248, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1260);
        float _1264 = _1244 * _1262;
        float _1266 = exp2(_1264);
        float _1268 = 0.0 + _1266;
        float _1270 = precise::clamp(_1268, 0.0, 1.0);
        _1150 = _1270;
    }
    float _1272 = _1150;
    float _1274 = precise::min(_1272, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1276 = -_1080;
    float _1278 = _1276 + 1.0;
    float _1280 = _1130 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1282 = precise::clamp(_1280, 0.0, 1.0);
    float _1284 = _1102 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1286 = precise::clamp(_1284, 0.0, 1.0);
    float _1288 = precise::min(_1010, 1.0);
    float _1290 = -_1274;
    float _1292 = _1290 + 1.0;
    float _1294 = fma(_1282, _1278, _1080);
    float _1296 = fma(_1286, _1292, _1274);
    out.m_60.x = _1294;
    out.m_60.y = _1296;
    out.m_60.z = _1288;
    out.m_60.w = 1.0;
    out.m_62.x = 1.0;
    out.m_62.y = _591;
    out.m_62.z = _593;
    out.m_62.w = 1.0;
    return out;
}

