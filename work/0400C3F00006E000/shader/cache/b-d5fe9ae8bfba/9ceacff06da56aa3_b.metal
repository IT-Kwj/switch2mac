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
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_12 [[id(7)]];
    sampler fp_t_tcb_12Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_E [[id(9)]];
    sampler fp_t_tcb_ESmplr [[id(10)]];
    texture2d_array<float> fp_t_tcb_A [[id(11)]];
    sampler fp_t_tcb_ASmplr [[id(12)]];
    texture2d_array<float> fp_t_tcb_C [[id(13)]];
    sampler fp_t_tcb_CSmplr [[id(14)]];
    sampler fp_t_tcb_8Smplr_w [[id(15)]];
    sampler fp_t_tcb_10Smplr_w [[id(16)]];
    sampler fp_t_tcb_12Smplr_w [[id(17)]];
    sampler fp_t_tcb_ESmplr_w [[id(18)]];
    sampler fp_t_tcb_CSmplr_w [[id(19)]];
    constant dm_border_t* dm_border [[id(20)]];
};

struct main0_out
{
    float4 m_58 [[color(0)]];
    float4 m_60 [[color(1)]];
};

struct main0_in
{
    float4 m_51 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_49 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _67 = gl_FragCoord.w;
    float _69 = in.m_49.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_49.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = 1.0 / _67;
    float _83 = _81 * _73;
    float _85 = _81 * _79;
    float _87 = _83 + (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float2 _1172 = float2(_83, _85);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1172, float2(0.0), isnan(_1172))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1172, float2(0.0), isnan(_1172))).x;
    float _91 = _85 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1187 = float2(_87, _85);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1187, float2(0.0), isnan(_1187))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1187, float2(0.0), isnan(_1187))).x;
    float2 _1195 = float2(_83, _91);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1195, float2(0.0), isnan(_1195))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1195, float2(0.0), isnan(_1195))).x;
    float _97 = in.m_51.y;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_51.x;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_53.x;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_55.x;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_55.y;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_53.y;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = _81 * _101;
    float _135 = _81 * _107;
    float _137 = -_89;
    float _139 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _141 = -_93;
    float _143 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _145 = 1.0 / _139;
    float _147 = -_95;
    float _149 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _151 = _81 * _119;
    float _153 = 1.0 / _149;
    float _155 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _157 = _145 * _155;
    float _159 = 1.0 / _143;
    float _161 = _81 * _113;
    float _163 = _157 * _133;
    float _165 = _157 * _135;
    float _167 = _81 * _125;
    float _169 = _81 * _131;
    float _171 = _163 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _173 = _163 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _175 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[32].x, _173);
    float _177 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _179 = _153 * _177;
    float _181 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[30].x, _171);
    float _183 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _185 = _159 * _183;
    float _187 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[32].z, _175);
    float _189 = -_165;
    float _191 = fma(_179, _161, _189);
    float _193 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[30].z, _181);
    float _195 = -_165;
    float _197 = fma(_185, _151, _195);
    float _199 = _187 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _201 = -_163;
    float _203 = fma(_185, _167, _201);
    float _205 = _193 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _207 = -_157;
    float _209 = _207 + _185;
    float _211 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _213 = _199 + _211;
    float _215 = -_163;
    float _217 = fma(_179, _169, _215);
    float _219 = -_157;
    float _221 = _219 + _179;
    float _223 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _225 = _205 + _223;
    float _227 = _213 * _213;
    float _229 = _209 * _191;
    float _231 = _203 * _221;
    float _233 = fma(_225, _225, _227);
    float _235 = -_229;
    float _237 = fma(_197, _221, _235);
    float _239 = _197 * _217;
    float _241 = -_231;
    float _243 = fma(_209, _217, _241);
    float _245 = sqrt(_233);
    float _247 = _237 * _237;
    float _249 = -_239;
    float _251 = fma(_203, _191, _249);
    float _253 = fma(_243, _243, _247);
    float _255 = _163 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _257 = fma(_251, _251, _253);
    float _259 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[31].x, _255);
    float _261 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[31].z, _259);
    float _263 = rsqrt(_257);
    bool _267 = _245 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _269 = _261 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    float _271 = _243 * _263;
    float _273 = _237 * _263;
    float _275 = _251 * _263;
    bool _277 = !_267;
    float _279 = _205;
    float _281 = _199;
    float _283 = _269;
    if (!_277)
    {
        float _285 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _287 = _245 + _285;
        float _289 = _269 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _291 = rsqrt(_233);
        float _293 = -_269;
        float _295 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _297 = _293 + _295;
        float _299 = abs(_289);
        float _301 = abs(_287);
        float _303 = precise::max(_299, _301);
        float _305 = _297 * _297;
        bool _307 = _303 >= 16.0;
        float _309 = _225 * _291;
        float _311 = _213 * _291;
        float _313 = -_225;
        float _315 = fma(_309, (*spvDescriptorSet0.fp_c3)._m0[41].z, _313);
        float _317 = -_213;
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
        _279 = _532;
        _281 = _534;
        _283 = _530;
    }
    float _536 = _279;
    float _538 = _281;
    float _540 = _283;
    float _542 = fma(_536, 6.2500002968590706586837768554688e-05, 0.5);
    float _544 = fma(_538, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _1875 = float2(_542, _544);
    float _546 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1875, float2(0.0), isnan(_1875))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1875, float2(0.0), isnan(_1875))).x;
    float _548 = _273 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _550 = _540 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _552 = fma(_271, (*spvDescriptorSet0.fp_c3)._m0[35].x, _548);
    float _554 = fma(_536, (*spvDescriptorSet0.fp_c5)._m0[101].x, _550);
    float _556 = fma(_275, (*spvDescriptorSet0.fp_c3)._m0[35].z, _552);
    float _558 = fma(_538, (*spvDescriptorSet0.fp_c5)._m0[101].z, _554);
    float _560 = -_556;
    float _562 = fma(_560, _556, 1.0);
    float _564 = -_556;
    float _566 = fma(_564, (*spvDescriptorSet0.fp_c3)._m0[35].z, _275);
    float _568 = _540 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _570 = _558 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _572 = _562 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _574 = -_556;
    float _576 = fma(_574, (*spvDescriptorSet0.fp_c3)._m0[35].x, _271);
    float _578 = fma(_536, (*spvDescriptorSet0.fp_c5)._m0[102].x, _568);
    float _580 = trunc(_570);
    int _582 = int(_580);
    float _584 = fma(_566, _572, _157);
    float _586 = -_556;
    float _588 = fma(_586, (*spvDescriptorSet0.fp_c3)._m0[35].y, _273);
    float _590 = fma(_538, (*spvDescriptorSet0.fp_c5)._m0[102].z, _578);
    float _592 = fma(_576, _572, _165);
    float _594 = -_584;
    bool _596 = _594 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _598 = float(_596);
    float _600 = _590 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _602 = -_584;
    bool _604 = _602 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _606 = float(_604);
    float _608 = fma(_588, _572, _163);
    float _610 = _598 + _606;
    float _612 = trunc(_600);
    int _614 = int(_612);
    int _616 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _618 = _582 + _616;
    int _620 = _618 + 1;
    float _622 = precise::min(_610, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    bool _624 = _620 >= 0;
    float _626 = trunc(_622);
    int _628 = int(_626);
    bool _630 = _620 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _632 = !_624;
    bool _634 = _630 || _632;
    int _636 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _638 = _614 + _636;
    int _640 = _638 + 1;
    bool _642 = _640 < 0;
    bool _644 = _642 || _634;
    int _646 = _628 << 6;
    bool _648 = _640 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _650 = _648 || _644;
    int _652 = _646 + 48;
    uint _655 = uint(int(uint(_652) >> uint(2)));
    uint _657 = uint(int(uint(int(_655)) >> uint(2)));
    int _659 = int(_655) & 3;
    float _661 = (*spvDescriptorSet0.fp_c3)._m0[int(_657)][_659];
    int _663 = int(_655) + 1;
    uint _665 = uint(int(uint(_663) >> uint(2)));
    int _667 = _663 & 3;
    float _669 = (*spvDescriptorSet0.fp_c3)._m0[int(_665)][_667];
    int _671 = _646 + 56;
    uint _673 = uint(int(uint(_671) >> uint(2)));
    uint _675 = uint(int(uint(int(_673)) >> uint(2)));
    int _677 = int(_673) & 3;
    float _679 = (*spvDescriptorSet0.fp_c3)._m0[int(_675)][_677];
    int _681 = int(_673) + 1;
    uint _683 = uint(int(uint(_681) >> uint(2)));
    int _685 = _681 & 3;
    float _687 = (*spvDescriptorSet0.fp_c3)._m0[int(_683)][_685];
    int _689 = _640;
    if (!_650)
    {
        int _691 = _640 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _693 = _691 + _620;
        _689 = _693;
    }
    int _695 = _689;
    uint _697 = uint(int(uint(_646) >> uint(2)));
    uint _699 = uint(int(uint(int(_697)) >> uint(2)));
    int _701 = int(_697) & 3;
    float _703 = (*spvDescriptorSet0.fp_c3)._m0[int(_699)][_701];
    int _705 = int(_697) + 1;
    uint _707 = uint(int(uint(_705) >> uint(2)));
    int _709 = _705 & 3;
    float _711 = (*spvDescriptorSet0.fp_c3)._m0[int(_707)][_709];
    int _713 = 0;
    if (!_650)
    {
        int _715 = _695 << 2;
        _713 = _715;
    }
    int _717 = _713;
    int _719 = 0;
    int _721 = _717;
    if (!_650)
    {
        int _723 = _695 >> 2;
        _719 = _723;
    }
    int _725 = _719;
    int _727 = _725;
    if (!_650)
    {
        int _729 = 12 & _717;
        _721 = _729;
    }
    int _731 = _721;
    int _733 = _646 + 16;
    uint _735 = uint(int(uint(_733) >> uint(2)));
    uint _737 = uint(int(uint(int(_735)) >> uint(2)));
    int _739 = int(_735) & 3;
    float _741 = (*spvDescriptorSet0.fp_c3)._m0[int(_737)][_739];
    int _743 = int(_735) + 1;
    uint _745 = uint(int(uint(_743) >> uint(2)));
    int _747 = _743 & 3;
    float _749 = (*spvDescriptorSet0.fp_c3)._m0[int(_745)][_747];
    if (!_650)
    {
        int _751 = _725 << 4;
        int _753 = _751 + _731;
        _727 = _753;
    }
    int _755 = _727;
    int _757 = _646 + 32;
    uint _759 = uint(int(uint(_757) >> uint(2)));
    uint _761 = uint(int(uint(int(_759)) >> uint(2)));
    int _763 = int(_759) & 3;
    float _765 = (*spvDescriptorSet0.fp_c3)._m0[int(_761)][_763];
    int _767 = int(_759) + 1;
    uint _769 = uint(int(uint(_767) >> uint(2)));
    int _771 = _767 & 3;
    float _773 = (*spvDescriptorSet0.fp_c3)._m0[int(_769)][_771];
    int _775 = _646 + 8;
    uint _777 = uint(int(uint(_775) >> uint(2)));
    uint _779 = uint(int(uint(int(_777)) >> uint(2)));
    int _781 = int(_777) & 3;
    float _783 = (*spvDescriptorSet0.fp_c3)._m0[int(_779)][_781];
    int _785 = int(_777) + 1;
    uint _787 = uint(int(uint(_785) >> uint(2)));
    int _789 = _785 & 3;
    float _791 = (*spvDescriptorSet0.fp_c3)._m0[int(_787)][_789];
    int _793 = _646 + 24;
    uint _795 = uint(int(uint(_793) >> uint(2)));
    uint _797 = uint(int(uint(int(_795)) >> uint(2)));
    int _799 = int(_795) & 3;
    float _801 = (*spvDescriptorSet0.fp_c3)._m0[int(_797)][_799];
    int _803 = int(_795) + 1;
    uint _805 = uint(int(uint(_803) >> uint(2)));
    int _807 = _803 & 3;
    float _809 = (*spvDescriptorSet0.fp_c3)._m0[int(_805)][_807];
    float _811 = _608 * _669;
    float _813 = _669;
    if (!_650)
    {
        float _815 = floor(_600);
        _813 = _815;
    }
    float _817 = _813;
    float _819 = fma(_592, _661, _811);
    int _821 = _646 + 40;
    uint _823 = uint(int(uint(_821) >> uint(2)));
    uint _825 = uint(int(uint(int(_823)) >> uint(2)));
    int _827 = int(_823) & 3;
    float _829 = (*spvDescriptorSet0.fp_c3)._m0[int(_825)][_827];
    int _831 = int(_823) + 1;
    uint _833 = uint(int(uint(_831) >> uint(2)));
    int _835 = _831 & 3;
    float _837 = (*spvDescriptorSet0.fp_c3)._m0[int(_833)][_835];
    float _839 = fma(_584, _679, _819);
    float _841 = _819;
    if (!_650)
    {
        float _843 = floor(_570);
        _841 = _843;
    }
    float _845 = _841;
    float _847 = _839 + _687;
    float _849 = _608 * _711;
    float _851 = 0.0;
    if (!_650)
    {
        uint _853 = uint(int(uint(_755) >> uint(2)));
        uint _855 = uint(int(uint(int(_853)) >> uint(2)));
        int _857 = int(_853) & 3;
        float _859 = (*spvDescriptorSet0.fp_c5)._m0[int(_855)][_857];
        _851 = _859;
    }
    float _861 = _851;
    float _863 = _817;
    if (!_650)
    {
        float _865 = -_817;
        float _867 = _600 + _865;
        _863 = _867;
    }
    float _869 = _863;
    float _871 = fma(_592, _703, _849);
    float _873 = _608 * _749;
    float _875 = fma(_592, _741, _873);
    float _877 = _608 * _773;
    float _879 = 1.0 / _847;
    float _881 = fma(_592, _765, _877);
    float _883 = fma(_584, _783, _871);
    float _885 = fma(_584, _801, _875);
    float _887 = _883 + _791;
    float _889 = fma(_538, (*spvDescriptorSet0.fp_c3)._m0[42].y, (*spvDescriptorSet0.fp_c3)._m0[42].w);
    float _891 = _885 + _809;
    float _893 = _809;
    if (!_650)
    {
        float _895 = -_845;
        float _897 = _570 + _895;
        _893 = _897;
    }
    float _899 = _893;
    float _901 = fma(_536, (*spvDescriptorSet0.fp_c3)._m0[42].x, (*spvDescriptorSet0.fp_c3)._m0[42].z);
    float _903 = fma(_584, _829, _881);
    float _905 = _891 * _879;
    float _907 = rint(_622);
    float _909 = precise::max(_907, 0.0);
    uint _911 = uint(_909);
    uint _913 = clamp(_911, 0u, 65535u);
    float _915 = _903 + _837;
    float2 _2506 = float2(_901, _889);
    float _917 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2506, float2(0.0), isnan(_2506))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2506, float2(0.0), isnan(_2506))).x;
    float _919 = _887 * _879;
    float _921 = _915 * _879;
    float _923 = precise::clamp(_921, 0.0, 1.0);
    float _925 = _887;
    if (!_650)
    {
        float _927 = rint(_861);
        float _929 = precise::max(_927, 0.0);
        uint _931 = uint(_929);
        uint _933 = clamp(_931, 0u, 65535u);
        _925 = as_type<float>(_933);
    }
    float _935 = _925;
    float2 _2538 = float2(_542, _544);
    float _937 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2538, float2(0.0), isnan(_2538)), level(_546)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2538, float2(0.0), isnan(_2538)), level(_546)).x;
    float3 _2551 = float3(_919, _905, float(int(_913)));
    float3 _2555 = select(_2551, float3(0.0), isnan(_2551));
    float _939 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2555.xy, uint(rint(_2555.z)), _923);
    float _941 = _935;
    if (!_650)
    {
        float3 _2568 = float3(_899, _869, float(as_type<int>(_935)));
        float3 _2570 = select(_2568, float3(0.0), isnan(_2568));
        float _943 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _2570.xy, uint(rint(_2570.z)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _2570.xy, uint(rint(_2570.z)), level(0.0)).x;
        _941 = _943;
    }
    float _945 = _941;
    float _947 = abs(_157);
    float _949 = log2(_947);
    float _951 = _949 * (*spvDescriptorSet0.fp_c3)._m0[44].z;
    float _953 = exp2(_951);
    float _955 = fma(_953, (*spvDescriptorSet0.fp_c3)._m0[44].x, (*spvDescriptorSet0.fp_c3)._m0[44].y);
    float _957 = precise::clamp(_955, 0.0, 1.0);
    float _959 = fma(_957, -2.0, 3.0);
    float _961 = _957 * _957;
    float _963 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[43].w, 1.0);
    float _965 = _961 * _959;
    float _967 = precise::max(0.0, _963);
    float _969 = -_965;
    float _971 = _969 + 1.0;
    float _973 = fma(_971, (*spvDescriptorSet0.fp_c3)._m0[44].w, _965);
    bool _975 = _157 >= (-8000.0);
    bool _977 = isnan(_157);
    bool _979 = _975 || _977;
    bool _981 = isnan(-8000.0);
    bool _983 = _979 || _981;
    float _985 = float(_983);
    float _987 = _973 * _967;
    float _989 = _985 * _987;
    float _991 = _989 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _993 = -_157;
    float _995 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _997 = _993 + _995;
    float _999 = -_917;
    float _1001 = _999 + 1.0;
    float _1003 = _1001 * _991;
    float _1005 = precise::clamp(_1003, 0.0, 1.0);
    float _1007 = -_1005;
    float _1009 = fma(_1007, (*spvDescriptorSet0.fp_c3)._m0[43].y, 1.0);
    float _1011 = abs(_937);
    float _1013 = _1011 * (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _1015 = -_1013;
    float _1017 = fma(_985, _1015, 1.0);
    float _1019 = -_157;
    float _1021 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1023 = _1019 + _1021;
    float _1025 = _985;
    if (_650)
    {
        _1025 = 1.0;
    }
    float _1027 = _1025;
    float _1029 = _1027;
    if (!_650)
    {
        int _1031 = _695 << 4;
        int _1033 = _1031 + 1648;
        int _1035 = _755 + 8048;
        uint _1037 = uint(int(uint(_1035) >> uint(2)));
        uint _1039 = uint(int(uint(int(_1037)) >> uint(2)));
        int _1041 = int(_1037) & 3;
        float _1043 = (*spvDescriptorSet0.fp_c5)._m0[int(_1039)][_1041];
        uint _1045 = uint(int(uint(_1033) >> uint(2)));
        uint _1047 = uint(int(uint(int(_1045)) >> uint(2)));
        int _1049 = int(_1045) & 3;
        float _1051 = (*spvDescriptorSet0.fp_c5)._m0[int(_1047)][_1049];
        int _1053 = int(_1045) + 1;
        uint _1055 = uint(int(uint(_1053) >> uint(2)));
        int _1057 = _1053 & 3;
        float _1059 = (*spvDescriptorSet0.fp_c5)._m0[int(_1055)][_1057];
        int _1061 = _1033 + 8;
        uint _1063 = uint(int(uint(_1061) >> uint(2)));
        uint _1065 = uint(int(uint(int(_1063)) >> uint(2)));
        int _1067 = int(_1063) & 3;
        float _1069 = (*spvDescriptorSet0.fp_c5)._m0[int(_1065)][_1067];
        int _1071 = int(_1063) + 1;
        uint _1073 = uint(int(uint(_1071) >> uint(2)));
        int _1075 = _1071 & 3;
        float _1077 = (*spvDescriptorSet0.fp_c5)._m0[int(_1073)][_1075];
        float _1079 = _540 * _1059;
        float _1081 = 1.0 / _1043;
        float _1083 = fma(_536, _1051, _1079);
        float _1085 = fma(_538, _1069, _1083);
        float _1087 = _1085 + _1077;
        float _1089 = precise::clamp(_1087, 0.0, 1.0);
        float _1091 = -_1089;
        float _1093 = _1091 + _945;
        float _1095 = _1043 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _1097 = fma(_1081, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1093);
        float _1099 = _1095 * _1097;
        float _1101 = exp2(_1099);
        float _1103 = 0.0 + _1101;
        float _1105 = precise::clamp(_1103, 0.0, 1.0);
        _1029 = _1105;
    }
    float _1107 = _1029;
    float _1109 = precise::min(_1107, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1111 = _997 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1113 = precise::clamp(_1111, 0.0, 1.0);
    float _1115 = _1023 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1117 = precise::clamp(_1115, 0.0, 1.0);
    float _1119 = -_939;
    float _1121 = _1119 + 1.0;
    float _1123 = precise::min(_1017, 1.0);
    float _1125 = -_1109;
    float _1127 = _1125 + 1.0;
    float _1129 = fma(_1113, _1121, _939);
    float _1131 = precise::min(_1123, _1009);
    float _1133 = fma(_1117, _1127, _1109);
    out.m_58.x = _1129;
    out.m_58.y = _1133;
    out.m_58.z = 1.0;
    out.m_58.w = _1131;
    out.m_60.x = 1.0;
    out.m_60.y = 0.5;
    out.m_60.z = 0.5;
    out.m_60.w = 1.0;
    return out;
}

