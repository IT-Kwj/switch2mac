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
    float2 _1341 = float2(_89, _91);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1341, float2(0.0), isnan(_1341))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1341, float2(0.0), isnan(_1341))).x;
    float _97 = _91 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1356 = float2(_93, _91);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1356, float2(0.0), isnan(_1356))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1356, float2(0.0), isnan(_1356))).x;
    float2 _1364 = float2(_89, _97);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1364, float2(0.0), isnan(_1364))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1364, float2(0.0), isnan(_1364))).x;
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
    float _153 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _155 = -_99;
    float _157 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _159 = 1.0 / _153;
    float _161 = -_101;
    float _163 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _165 = 1.0 / _157;
    float _167 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _169 = _159 * _167;
    float _171 = 1.0 / _163;
    float _173 = _169 * _139;
    float _175 = _169 * _141;
    float _177 = _173 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _179 = _173 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _181 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _183 = _165 * _181;
    float _185 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[32].x, _177);
    float _187 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[30].x, _179);
    float _189 = -_175;
    float _191 = fma(_183, _145, _189);
    float _193 = -_173;
    float _195 = fma(_183, _143, _193);
    float _197 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[32].z, _185);
    float _199 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[30].z, _187);
    float _201 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _203 = _171 * _201;
    float _205 = -_169;
    float _207 = _205 + _183;
    float _209 = _197 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _211 = _199 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _213 = -_175;
    float _215 = fma(_203, _147, _213);
    float _217 = -_173;
    float _219 = fma(_203, _149, _217);
    float _221 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _223 = _209 + _221;
    float _225 = -_169;
    float _227 = _225 + _203;
    float _229 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _231 = _211 + _229;
    float _233 = _207 * _215;
    float _235 = _223 * _223;
    float _237 = _195 * _227;
    float _239 = -_233;
    float _241 = fma(_191, _227, _239);
    float _243 = fma(_231, _231, _235);
    float _245 = _191 * _219;
    float _247 = -_237;
    float _249 = fma(_207, _219, _247);
    float _251 = _241 * _241;
    float _253 = sqrt(_243);
    float _255 = -_245;
    float _257 = fma(_195, _215, _255);
    float _259 = fma(_249, _249, _251);
    float _261 = _173 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _263 = fma(_257, _257, _259);
    float _265 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[31].x, _261);
    float _267 = rsqrt(_263);
    float _269 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[31].z, _265);
    bool _273 = _253 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _275 = _269 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    float _277 = _249 * _267;
    float _279 = _241 * _267;
    float _281 = _257 * _267;
    float _283 = _215;
    float _285 = _267;
    float _287 = _209;
    if (!_273)
    {
        _283 = _211;
    }
    float _289 = _283;
    float _291 = _289;
    if (!_273)
    {
        _285 = _275;
    }
    float _293 = _285;
    bool _295 = !_273;
    float _297 = _293;
    if (!_295)
    {
        float _299 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _301 = _253 + _299;
        float _303 = _275 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _305 = rsqrt(_243);
        float _307 = -_275;
        float _309 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _311 = _307 + _309;
        float _313 = abs(_303);
        float _315 = abs(_301);
        float _317 = precise::max(_313, _315);
        float _319 = _311 * _311;
        bool _321 = _317 >= 16.0;
        float _323 = _231 * _305;
        float _325 = _223 * _305;
        float _327 = -_231;
        float _329 = fma(_323, (*spvDescriptorSet0.fp_c3)._m0[41].z, _327);
        float _331 = -_223;
        float _333 = fma(_325, (*spvDescriptorSet0.fp_c3)._m0[41].z, _331);
        float _335 = _301;
        float _337 = _303;
        int _340 = as_type<int>(_333);
        if (_321)
        {
            float _342 = _301 * 0.0625;
            _335 = _342;
        }
        float _344 = _335;
        if (_321)
        {
            float _346 = _303 * 0.0625;
            _337 = _346;
        }
        float _348 = _337;
        float _350 = fma(_329, _329, _319);
        float _352 = abs(_344);
        bool _354 = _352 != 0.0;
        bool _356 = isnan(_352);
        bool _358 = _354 || _356;
        bool _360 = isnan(0.0);
        bool _362 = _358 || _360;
        float _364 = fma(_333, _333, _350);
        float _366 = abs(_348);
        bool _368 = _366 == 0.0;
        float _370 = abs(_348);
        bool _372 = _370 == 0.0;
        bool _374 = !_362;
        bool _376 = _372 && _374;
        float _378 = sqrt(_364);
        bool _380 = false;
        if (_376)
        {
            bool _382 = as_type<int>(_348) >= 0;
            _380 = _382;
        }
        bool _384 = _380;
        int _386 = _384 ? (-1) : 0;
        if (_376)
        {
            int _388 = _384 ? 0 : 1078530011;
            _340 = _388;
        }
        int _390 = _340;
        int _392 = _390;
        if (_376)
        {
            int _394 = int(0x80000000) & as_type<int>(_344);
            int _396 = _390 | _394;
            _392 = _396;
        }
        int _398 = _392;
        bool _400 = !_362;
        bool _402 = _400 && _368;
        int _404 = _398;
        float _406 = as_type<float>(_398);
        if (!_402)
        {
            float _408 = abs(_344);
            bool _410 = _408 != as_type<float>(0x7f800000u /* inf */);
            bool _412 = isnan(_408);
            bool _414 = _410 || _412;
            bool _416 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _418 = _414 || _416;
            float _420 = abs(_348);
            bool _422 = _420 == as_type<float>(0x7f800000u /* inf */);
            float _424 = abs(_348);
            bool _426 = _424 == as_type<float>(0x7f800000u /* inf */);
            bool _428 = !_418;
            bool _430 = _426 && _428;
            if (_430)
            {
                bool _432 = as_type<int>(_348) >= 0;
                _386 = _432 ? (-1) : 0;
            }
            int _434 = _386;
            if (_430)
            {
                _404 = 1075235812;
            }
            int _436 = _404;
            int _438 = _436;
            if (_430)
            {
                int _440 = ~_434;
                int _442 = (_440 != 0) ? _436 : 1061752795;
                _438 = _442;
            }
            int _444 = _438;
            float _446 = as_type<float>(_444);
            if (_430)
            {
                int _448 = int(0x80000000) & as_type<int>(_344);
                int _450 = _444 | _448;
                _446 = as_type<float>(_450);
            }
            float _452 = _446;
            bool _454 = !_418;
            bool _456 = _454 && _422;
            _406 = _452;
            if (!_456)
            {
                float _458 = abs(_344);
                float _460 = abs(_348);
                float _462 = precise::max(_458, _460);
                float _464 = abs(_344);
                float _466 = abs(_348);
                float _468 = precise::min(_464, _466);
                float _470 = 1.0 / _462;
                float _472 = abs(_344);
                float _474 = abs(_348);
                bool _476 = _472 > _474;
                bool _478 = as_type<int>(_348) >= 0;
                float _480 = _468 * _470;
                float _482 = abs(_344);
                float _484 = abs(_348);
                float _486 = _482 + _484;
                int _488 = as_type<int>(_344) & int(0x80000000);
                float _490 = _480 * _480;
                bool _492 = _486 > as_type<float>(0x7f800000u /* inf */);
                bool _494 = isnan(_486);
                bool _496 = _492 || _494;
                bool _498 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _500 = _496 || _498;
                float _502 = _490 + 11.33538818359375;
                float _504 = fma(_490, _502, 28.84246826171875);
                float _506 = fma(_490, _504, 19.6966705322265625);
                float _508 = fma(_490, -0.82336294651031494140625, -5.674867153167724609375);
                float _510 = fma(_490, _508, -6.565555095672607421875);
                float _512 = 1.0 / _506;
                float _514 = _490 * _510;
                float _516 = _480 * _514;
                float _518 = fma(_516, _512, _480);
                float _520 = _518;
                _406 = _486;
                if (_476)
                {
                    float _522 = -_518;
                    float _524 = _522 + 1.57079637050628662109375;
                    _520 = _524;
                }
                float _526 = _520;
                int _528 = as_type<int>(_526);
                if (!_478)
                {
                    float _530 = -_526;
                    float _532 = _530 + 3.1415927410125732421875;
                    _528 = as_type<int>(_532);
                }
                int _534 = _528;
                if (!_500)
                {
                    int _536 = _488 | _534;
                    _406 = as_type<float>(_536);
                }
            }
        }
        float _538 = _406;
        float _540 = fma(_538, (*spvDescriptorSet0.fp_c3)._m0[41].w, (*spvDescriptorSet0.fp_c3)._m0[41].z);
        float _542 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _544 = _378 + _542;
        float _546 = fma(_323, _540, (*spvDescriptorSet0.fp_c3)._m0[33].x);
        float _548 = fma(_325, _540, (*spvDescriptorSet0.fp_c3)._m0[33].z);
        _291 = _546;
        _287 = _548;
        _297 = _544;
    }
    float _550 = _291;
    float _552 = _287;
    float _554 = _297;
    float _556 = fma(_550, 6.2500002968590706586837768554688e-05, 0.5);
    float _558 = fma(_552, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _2058 = float2(_556, _558);
    float _560 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_2058, float2(0.0), isnan(_2058))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_2058, float2(0.0), isnan(_2058))).x;
    float _562 = _279 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _564 = fma(_277, (*spvDescriptorSet0.fp_c3)._m0[35].x, _562);
    float _566 = fma(_281, (*spvDescriptorSet0.fp_c3)._m0[35].z, _564);
    float _568 = -_566;
    float _570 = fma(_568, _566, 1.0);
    float _572 = -_566;
    float _574 = fma(_572, (*spvDescriptorSet0.fp_c3)._m0[35].z, _281);
    float _576 = -_566;
    float _578 = fma(_576, (*spvDescriptorSet0.fp_c3)._m0[35].y, _279);
    float _580 = -_566;
    float _582 = fma(_580, (*spvDescriptorSet0.fp_c3)._m0[35].x, _277);
    float _584 = _570 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _586 = fma(_574, _584, _169);
    float _588 = fma(_578, _584, _173);
    float _590 = fma(_582, _584, _175);
    float _592 = -_586;
    bool _594 = _592 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _596 = float(_594);
    float _598 = -_586;
    bool _600 = _598 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _602 = float(_600);
    float _604 = _596 + _602;
    float _606 = precise::min(_604, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _608 = trunc(_606);
    int _610 = int(_608);
    float _612 = rint(_606);
    float _614 = precise::max(_612, 0.0);
    uint _617 = uint(_614);
    uint _619 = clamp(_617, 0u, 65535u);
    int _621 = _610 << 6;
    int _623 = _621 + 48;
    uint _625 = uint(int(uint(_623) >> uint(2)));
    uint _627 = uint(int(uint(int(_625)) >> uint(2)));
    int _629 = int(_625) & 3;
    float _631 = (*spvDescriptorSet0.fp_c3)._m0[int(_627)][_629];
    int _633 = int(_625) + 1;
    uint _635 = uint(int(uint(_633) >> uint(2)));
    int _637 = _633 & 3;
    float _639 = (*spvDescriptorSet0.fp_c3)._m0[int(_635)][_637];
    int _641 = _621 + 16;
    uint _643 = uint(int(uint(_641) >> uint(2)));
    uint _645 = uint(int(uint(int(_643)) >> uint(2)));
    int _647 = int(_643) & 3;
    float _649 = (*spvDescriptorSet0.fp_c3)._m0[int(_645)][_647];
    int _651 = int(_643) + 1;
    uint _653 = uint(int(uint(_651) >> uint(2)));
    int _655 = _651 & 3;
    float _657 = (*spvDescriptorSet0.fp_c3)._m0[int(_653)][_655];
    uint _659 = uint(int(uint(_621) >> uint(2)));
    uint _661 = uint(int(uint(int(_659)) >> uint(2)));
    int _663 = int(_659) & 3;
    float _665 = (*spvDescriptorSet0.fp_c3)._m0[int(_661)][_663];
    int _667 = int(_659) + 1;
    uint _669 = uint(int(uint(_667) >> uint(2)));
    int _671 = _667 & 3;
    float _673 = (*spvDescriptorSet0.fp_c3)._m0[int(_669)][_671];
    int _675 = _621 + 24;
    uint _677 = uint(int(uint(_675) >> uint(2)));
    uint _679 = uint(int(uint(int(_677)) >> uint(2)));
    int _681 = int(_677) & 3;
    float _683 = (*spvDescriptorSet0.fp_c3)._m0[int(_679)][_681];
    int _685 = int(_677) + 1;
    uint _687 = uint(int(uint(_685) >> uint(2)));
    int _689 = _685 & 3;
    float _691 = (*spvDescriptorSet0.fp_c3)._m0[int(_687)][_689];
    int _693 = _621 + 32;
    uint _695 = uint(int(uint(_693) >> uint(2)));
    uint _697 = uint(int(uint(int(_695)) >> uint(2)));
    int _699 = int(_695) & 3;
    float _701 = (*spvDescriptorSet0.fp_c3)._m0[int(_697)][_699];
    int _703 = int(_695) + 1;
    uint _705 = uint(int(uint(_703) >> uint(2)));
    int _707 = _703 & 3;
    float _709 = (*spvDescriptorSet0.fp_c3)._m0[int(_705)][_707];
    int _711 = _621 + 8;
    uint _713 = uint(int(uint(_711) >> uint(2)));
    uint _715 = uint(int(uint(int(_713)) >> uint(2)));
    int _717 = int(_713) & 3;
    float _719 = (*spvDescriptorSet0.fp_c3)._m0[int(_715)][_717];
    int _721 = int(_713) + 1;
    uint _723 = uint(int(uint(_721) >> uint(2)));
    int _725 = _721 & 3;
    float _727 = (*spvDescriptorSet0.fp_c3)._m0[int(_723)][_725];
    float _729 = _588 * _639;
    int _731 = _621 + 56;
    uint _733 = uint(int(uint(_731) >> uint(2)));
    uint _735 = uint(int(uint(int(_733)) >> uint(2)));
    int _737 = int(_733) & 3;
    float _739 = (*spvDescriptorSet0.fp_c3)._m0[int(_735)][_737];
    int _741 = int(_733) + 1;
    uint _743 = uint(int(uint(_741) >> uint(2)));
    int _745 = _741 & 3;
    float _747 = (*spvDescriptorSet0.fp_c3)._m0[int(_743)][_745];
    float _749 = fma(_590, _631, _729);
    float _751 = _588 * _657;
    int _753 = _621 + 40;
    uint _755 = uint(int(uint(_753) >> uint(2)));
    uint _757 = uint(int(uint(int(_755)) >> uint(2)));
    int _759 = int(_755) & 3;
    float _761 = (*spvDescriptorSet0.fp_c3)._m0[int(_757)][_759];
    int _763 = int(_755) + 1;
    uint _765 = uint(int(uint(_763) >> uint(2)));
    int _767 = _763 & 3;
    float _769 = (*spvDescriptorSet0.fp_c3)._m0[int(_765)][_767];
    float _771 = fma(_590, _649, _751);
    float _773 = _588 * _673;
    float _775 = fma(_590, _665, _773);
    float _777 = fma(_586, _683, _771);
    float2 _2433 = float2(_89, _91);
    float4 _780 = spvDescriptorSet0.fp_t_tcb_14.gather(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2433, float2(0.0), isnan(_2433)), int2(0), component::x).xyzw;
    float _782 = _780.x;
    float _784 = _780.y;
    float _786 = _780.z;
    float _788 = _780.w;
    float _790 = _777 + _691;
    float _792 = _588 * _709;
    float _794 = fma(_590, _701, _792);
    float _796 = fma(_552, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float _798 = fma(_586, _719, _775);
    float _800 = fma(_550, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _802 = _798 + _727;
    float _804 = fma(_586, _739, _749);
    float _806 = _804 + _747;
    float2 _2486 = float2(_89, _91);
    float4 _808 = spvDescriptorSet0.fp_t_tcb_12.gather(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2486, float2(0.0), isnan(_2486)), int2(0), component::w).xyzw;
    float _810 = _808.x;
    float _812 = _808.y;
    float _814 = _808.z;
    float _816 = _808.w;
    float2 _2502 = float2(_800, _796);
    float _818 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2502, float2(0.0), isnan(_2502))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2502, float2(0.0), isnan(_2502))).x;
    float _820 = fma(_586, _761, _794);
    float _822 = 1.0 / _806;
    float _824 = _820 + _769;
    float _826 = _802 * _822;
    float _828 = _790 * _822;
    float _830 = _824 * _822;
    float _832 = precise::clamp(_830, 0.0, 1.0);
    float3 _2534 = float3(_826, _828, float(int(_619)));
    float3 _2538 = select(_2534, float3(0.0), isnan(_2534));
    float _834 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2538.xy, uint(rint(_2538.z)), _832);
    float2 _2544 = float2(_89, _91);
    float _836 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2544, float2(0.0), isnan(_2544))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2544, float2(0.0), isnan(_2544))).x;
    float2 _2552 = float2(_556, _558);
    float _838 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2552, float2(0.0), isnan(_2552)), level(_560)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2552, float2(0.0), isnan(_2552)), level(_560)).x;
    float _840 = _91 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _842 = _89 * (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _844 = abs(_169);
    float _846 = log2(_844);
    float _848 = precise::min(_169, -1.0000000116860974230803549289703e-07);
    float _850 = floor(_840);
    float _852 = floor(_842);
    float _854 = _846 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _856 = -_850;
    float _858 = _840 + _856;
    float _860 = exp2(_854);
    float _862 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _864 = _858 + _862;
    float _866 = -_852;
    float _868 = _842 + _866;
    float _870 = -_864;
    float _872 = _870 + 1.0;
    float _874 = 1.0 / _848;
    float _876 = _554 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _878 = -(*spvDescriptorSet0.fp_c4)._m0[1].z;
    float _880 = _868 + _878;
    float _882 = fma(_550, (*spvDescriptorSet0.fp_c5)._m0[102].x, _876);
    float _884 = -_880;
    float _886 = _884 + 1.0;
    float _888 = _880 * _872;
    float _890 = _880 * _864;
    float _892 = _864 * _886;
    float _894 = _886 * _872;
    float _896 = fma(_860, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _898 = precise::clamp(_896, 0.0, 1.0);
    float _900 = -_782;
    float _902 = fma(_900, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _904 = -_784;
    float _906 = fma(_904, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _908 = -_786;
    float _910 = fma(_908, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _912 = -_788;
    float _914 = fma(_912, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _916 = fma(_898, -2.0, 3.0);
    float _918 = 1.0 / _906;
    float _920 = _898 * _898;
    float _922 = _874 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float _924 = _920 * _916;
    float _926 = 1.0 / _902;
    float _928 = -_924;
    float _930 = _928 + 1.0;
    float _932 = fma(_930, (*spvDescriptorSet0.fp_c3)._m0[44].w, _924);
    float _934 = 1.0 / _910;
    float _936 = 1.0 / _914;
    float _938 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _940 = -_169;
    float _942 = fma(_926, _938, _940);
    float _944 = abs(_942);
    float _946 = _944 * _922;
    float _948 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _950 = -_169;
    float _952 = fma(_918, _948, _950);
    float _954 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _956 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _958 = -_169;
    float _960 = fma(_934, _956, _958);
    float _962 = abs(_952);
    float _964 = _962 * _922;
    float _966 = exp2(_946);
    float _968 = abs(_960);
    float _970 = _968 * _922;
    float _972 = precise::max(0.0, _954);
    float _974 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _976 = -_169;
    float _978 = fma(_936, _974, _976);
    float _980 = _554 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _982 = _932 * _972;
    float _984 = exp2(_964);
    float _986 = abs(_978);
    float _988 = _986 * _922;
    float _990 = fma(_550, (*spvDescriptorSet0.fp_c5)._m0[101].x, _980);
    float _992 = fma(_552, (*spvDescriptorSet0.fp_c5)._m0[102].z, _882);
    float _994 = fma(_552, (*spvDescriptorSet0.fp_c5)._m0[101].z, _990);
    float _996 = _992 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _998 = exp2(_970);
    float _1000 = abs(_892);
    float _1002 = _1000 * _966;
    float _1004 = _994 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _1006 = exp2(_988);
    float _1008 = abs(_890);
    float _1010 = _1008 * _984;
    float _1012 = _1002 + _1010;
    float _1014 = trunc(_1004);
    int _1016 = int(_1014);
    float _1018 = abs(_888);
    float _1020 = _1018 * _998;
    float _1022 = _1020 + _1012;
    float _1024 = abs(_894);
    float _1026 = _1024 * _1006;
    float _1028 = trunc(_996);
    int _1030 = int(_1028);
    float _1032 = _1026 + _1022;
    float _1034 = -_1026;
    bool _1036 = _1022 != _1034;
    bool _1038 = isnan(_1022);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan(_1034);
    bool _1044 = _1040 || _1042;
    int _1046 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _1048 = _1016 + _1046;
    int _1050 = _1048 + 1;
    float _1052 = 1.0 / _1032;
    bool _1054 = _169 >= (-8000.0);
    bool _1056 = isnan(_169);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan(-8000.0);
    bool _1062 = _1058 || _1060;
    float _1064 = float(_1062);
    bool _1066 = _1050 >= 0;
    float _1068 = _1064 * _982;
    bool _1070 = _1050 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1072 = !_1066;
    bool _1074 = _1070 || _1072;
    int _1076 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _1078 = _1030 + _1076;
    int _1080 = _1078 + 1;
    bool _1082 = _1080 < 0;
    bool _1084 = _1082 || _1074;
    float _1086 = _1010 * _1052;
    bool _1088 = _1080 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _1090 = _1088 || _1084;
    float _1092 = _1002 * _1052;
    float _1094 = _1020 * _1052;
    float _1096 = _1044 ? _1086 : 0.25;
    float _1098 = _1044 ? _1092 : 0.25;
    float _1100 = _1096 * _812;
    float _1102 = _1096;
    if (_1090)
    {
        _1102 = 1.0;
    }
    float _1104 = _1102;
    float _1106 = _1104;
    if (!_1090)
    {
        int _1108 = _1080 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _1110 = _1108 + _1050;
        float _1112 = floor(_1004);
        int _1114 = _1110 << 2;
        int _1116 = _1110 >> 2;
        int _1118 = 12 & _1114;
        float _1120 = floor(_996);
        int _1122 = _1116 << 4;
        int _1124 = _1122 + _1118;
        uint _1126 = uint(int(uint(_1124) >> uint(2)));
        uint _1128 = uint(int(uint(int(_1126)) >> uint(2)));
        int _1130 = int(_1126) & 3;
        float _1132 = (*spvDescriptorSet0.fp_c5)._m0[int(_1128)][_1130];
        float _1134 = -_1112;
        float _1136 = _1004 + _1134;
        float _1138 = -_1120;
        float _1140 = _996 + _1138;
        float _1142 = rint(_1132);
        float _1144 = precise::max(_1142, 0.0);
        uint _1146 = uint(_1144);
        uint _1148 = clamp(_1146, 0u, 65535u);
        float3 _3010 = float3(_1136, _1140, float(int(_1148)));
        float3 _3012 = select(_3010, float3(0.0), isnan(_3010));
        float _1150 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, _3012.xy, uint(rint(_3012.z)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, _3012.xy, uint(rint(_3012.z)), level(0.0)).x;
        int _1152 = _1110 << 4;
        int _1154 = _1152 + 1648;
        int _1156 = _1124 + 8048;
        uint _1158 = uint(int(uint(_1156) >> uint(2)));
        uint _1160 = uint(int(uint(int(_1158)) >> uint(2)));
        int _1162 = int(_1158) & 3;
        float _1164 = (*spvDescriptorSet0.fp_c5)._m0[int(_1160)][_1162];
        uint _1166 = uint(int(uint(_1154) >> uint(2)));
        uint _1168 = uint(int(uint(int(_1166)) >> uint(2)));
        int _1170 = int(_1166) & 3;
        float _1172 = (*spvDescriptorSet0.fp_c5)._m0[int(_1168)][_1170];
        int _1174 = int(_1166) + 1;
        uint _1176 = uint(int(uint(_1174) >> uint(2)));
        int _1178 = _1174 & 3;
        float _1180 = (*spvDescriptorSet0.fp_c5)._m0[int(_1176)][_1178];
        int _1182 = _1154 + 8;
        uint _1184 = uint(int(uint(_1182) >> uint(2)));
        uint _1186 = uint(int(uint(int(_1184)) >> uint(2)));
        int _1188 = int(_1184) & 3;
        float _1190 = (*spvDescriptorSet0.fp_c5)._m0[int(_1186)][_1188];
        int _1192 = int(_1184) + 1;
        uint _1194 = uint(int(uint(_1192) >> uint(2)));
        int _1196 = _1192 & 3;
        float _1198 = (*spvDescriptorSet0.fp_c5)._m0[int(_1194)][_1196];
        float _1200 = _1164 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1202 = _554 * _1180;
        float _1204 = 1.0 / _1164;
        float _1206 = fma(_550, _1172, _1202);
        float _1208 = fma(_552, _1190, _1206);
        float _1210 = _1208 + _1198;
        float _1212 = precise::clamp(_1210, 0.0, 1.0);
        float _1214 = -_1212;
        float _1216 = _1214 + _1150;
        float _1218 = fma(_1204, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1216);
        float _1220 = _1200 * _1218;
        float _1222 = exp2(_1220);
        float _1224 = 0.0 + _1222;
        float _1226 = precise::clamp(_1224, 0.0, 1.0);
        _1106 = _1226;
    }
    float _1228 = _1106;
    float _1230 = _1044 ? _1094 : 0.25;
    float _1232 = _1068 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _1234 = -_818;
    float _1236 = _1234 + 1.0;
    float _1238 = fma(_1098, _810, _1100);
    float _1240 = _1026 * _1052;
    float _1242 = abs(_838);
    float _1244 = _1242 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _1246 = _1236 * _1232;
    float _1248 = precise::clamp(_1246, 0.0, 1.0);
    float _1250 = fma(_1230, _814, _1238);
    float _1252 = precise::min(_1228, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1254 = -_169;
    float _1256 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1258 = _1254 + _1256;
    float _1260 = -_1248;
    float _1262 = fma(_1260, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _1264 = _1044 ? _1240 : 0.25;
    float _1266 = -_1244;
    float _1268 = fma(_1064, _1266, 1.0);
    float _1270 = _1258 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1272 = precise::clamp(_1270, 0.0, 1.0);
    float _1274 = -_1252;
    float _1276 = _1274 + 1.0;
    float _1278 = -_169;
    float _1280 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _1282 = _1278 + _1280;
    float _1284 = -_834;
    float _1286 = _1284 + 1.0;
    float _1288 = precise::min(_1268, 1.0);
    float _1290 = fma(_1272, _1276, _1252);
    float _1292 = _1282 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1294 = precise::clamp(_1292, 0.0, 1.0);
    float _1296 = fma(_1264, _816, _1250);
    float _1298 = precise::min(_1288, _1262);
    float _1300 = fma(_1294, _1286, _834);
    float _1302 = precise::min(_1296, 1.0);
    out.m_64.x = _1300;
    out.m_64.y = _1290;
    out.m_64.z = _1302;
    out.m_64.w = _1298;
    out.m_66.x = _836;
    out.m_66.y = 0.5;
    out.m_66.z = 0.5;
    out.m_66.w = 1.0;
    return out;
}

