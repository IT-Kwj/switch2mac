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
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texture2d_array<float> fp_t_tcb_E [[id(9)]];
    sampler fp_t_tcb_ESmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    sampler fp_t_tcb_ESmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_54 [[color(0)]];
    float4 m_56 [[color(1)]];
};

struct main0_in
{
    float4 m_47 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_45.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_45.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = 1.0 / _63;
    float _79 = _77 * _69;
    float _81 = _77 * _75;
    float _83 = _79 + (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float2 _1086 = float2(_79, _81);
    float _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1086, float2(0.0), isnan(_1086))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1086, float2(0.0), isnan(_1086))).x;
    float _87 = _81 + (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float2 _1101 = float2(_83, _81);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1101, float2(0.0), isnan(_1101))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1101, float2(0.0), isnan(_1101))).x;
    float2 _1109 = float2(_79, _87);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1109, float2(0.0), isnan(_1109))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1109, float2(0.0), isnan(_1109))).x;
    float2 _1117 = float2(_79, _81);
    float _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1117, float2(0.0), isnan(_1117))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1117, float2(0.0), isnan(_1117))).x;
    float _95 = in.m_47.y;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_47.x;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_49.x;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_49.y;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_51.x;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_51.y;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = _77 * _99;
    float _133 = _77 * _105;
    float _135 = _77 * _111;
    float _137 = _77 * _117;
    float _139 = -_85;
    float _141 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _143 = -_89;
    float _145 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _147 = 1.0 / _141;
    float _149 = -_91;
    float _151 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[41].y, 1.0);
    float _153 = 1.0 / _145;
    float _155 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _157 = _147 * _155;
    float _159 = 1.0 / _151;
    float _161 = _77 * _123;
    float _163 = _77 * _129;
    float _165 = _157 * _131;
    float _167 = _157 * _133;
    float _169 = _165 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _171 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _173 = _153 * _171;
    float _175 = _165 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _177 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[32].x, _169);
    float _179 = -_167;
    float _181 = fma(_173, _135, _179);
    float _183 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[30].x, _175);
    float _185 = -_165;
    float _187 = fma(_173, _137, _185);
    float _189 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[32].z, _177);
    float _191 = -(*spvDescriptorSet0.fp_c3)._m0[39].z;
    float _193 = _159 * _191;
    float _195 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[30].z, _183);
    float _197 = -_157;
    float _199 = _197 + _173;
    float _201 = _189 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
    float _203 = -_167;
    float _205 = fma(_193, _161, _203);
    float _207 = _195 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _209 = -_165;
    float _211 = fma(_193, _163, _209);
    float _213 = -(*spvDescriptorSet0.fp_c3)._m0[33].z;
    float _215 = _201 + _213;
    float _217 = -_157;
    float _219 = _217 + _193;
    float _221 = -(*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _223 = _207 + _221;
    float _225 = _199 * _205;
    float _227 = _215 * _215;
    float _229 = _187 * _219;
    float _231 = -_225;
    float _233 = fma(_181, _219, _231);
    float _235 = fma(_223, _223, _227);
    float _237 = _181 * _211;
    float _239 = -_229;
    float _241 = fma(_199, _211, _239);
    float _243 = _233 * _233;
    float _245 = sqrt(_235);
    float _247 = -_237;
    float _249 = fma(_187, _205, _247);
    float _251 = _165 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _253 = fma(_241, _241, _243);
    float _255 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[31].x, _251);
    float _257 = fma(_249, _249, _253);
    float _259 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[31].z, _255);
    float _261 = rsqrt(_257);
    float _263 = _259 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
    bool _267 = _245 > (*spvDescriptorSet0.fp_c3)._m0[41].z;
    float _269 = _241 * _261;
    float _271 = _233 * _261;
    float _273 = _249 * _261;
    bool _275 = !_267;
    float _277 = _263;
    float _279 = _207;
    float _281 = _201;
    float _283 = _167;
    if (!_275)
    {
        float _285 = -(*spvDescriptorSet0.fp_c3)._m0[41].z;
        float _287 = _245 + _285;
        float _289 = _263 + (*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _291 = rsqrt(_235);
        float _293 = -_263;
        float _295 = -(*spvDescriptorSet0.fp_c3)._m0[41].w;
        float _297 = _293 + _295;
        float _299 = abs(_289);
        float _301 = abs(_287);
        float _303 = precise::max(_299, _301);
        float _305 = _297 * _297;
        bool _307 = _303 >= 16.0;
        float _309 = _223 * _291;
        float _311 = _215 * _291;
        float _313 = -_223;
        float _315 = fma(_309, (*spvDescriptorSet0.fp_c3)._m0[41].z, _313);
        float _317 = -_215;
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
        _277 = _530;
        _279 = _532;
        _281 = _534;
    }
    float _536 = _277;
    float _538 = _279;
    float _540 = _281;
    float _542 = _271 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _544 = fma(_269, (*spvDescriptorSet0.fp_c3)._m0[35].x, _542);
    float _546 = _536 * (*spvDescriptorSet0.fp_c5)._m0[101].y;
    float _548 = fma(_273, (*spvDescriptorSet0.fp_c3)._m0[35].z, _544);
    float _550 = fma(_538, (*spvDescriptorSet0.fp_c5)._m0[101].x, _546);
    float _552 = -_548;
    float _554 = fma(_552, _548, 1.0);
    float _556 = -_548;
    float _558 = fma(_556, (*spvDescriptorSet0.fp_c3)._m0[35].z, _273);
    float _560 = fma(_540, (*spvDescriptorSet0.fp_c5)._m0[101].z, _550);
    float _562 = -_548;
    float _564 = fma(_562, (*spvDescriptorSet0.fp_c3)._m0[35].x, _269);
    float _566 = _554 * (*spvDescriptorSet0.fp_c3)._m0[35].w;
    float _568 = _560 + (*spvDescriptorSet0.fp_c5)._m0[101].w;
    float _570 = fma(_558, _566, _157);
    float _572 = _536 * (*spvDescriptorSet0.fp_c5)._m0[102].y;
    float _574 = -_570;
    bool _576 = _574 > (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _578 = float(_576);
    float _580 = fma(_538, (*spvDescriptorSet0.fp_c5)._m0[102].x, _572);
    float _582 = -_570;
    bool _584 = _582 > (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _586 = float(_584);
    float _588 = fma(_540, (*spvDescriptorSet0.fp_c5)._m0[102].z, _580);
    float _590 = _578 + _586;
    float _592 = trunc(_568);
    int _594 = int(_592);
    float _596 = _588 + (*spvDescriptorSet0.fp_c5)._m0[102].w;
    float _598 = precise::min(_590, (*spvDescriptorSet0.fp_c3)._m0[33].w);
    float _600 = trunc(_596);
    int _602 = int(_600);
    float _604 = trunc(_598);
    int _606 = int(_604);
    int _608 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].y);
    int _610 = _594 + _608;
    int _612 = _610 + 1;
    bool _614 = _612 >= 0;
    int _616 = ~as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].z);
    int _618 = _602 + _616;
    int _620 = _618 + 1;
    bool _622 = _612 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _624 = !_614;
    bool _626 = _622 || _624;
    bool _628 = _620 < 0;
    bool _630 = _628 || _626;
    int _632 = _606 << 6;
    bool _634 = _620 >= as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
    bool _636 = _634 || _630;
    int _638 = _632 + 48;
    uint _641 = uint(int(uint(_638) >> uint(2)));
    uint _643 = uint(int(uint(int(_641)) >> uint(2)));
    int _645 = int(_641) & 3;
    float _647 = (*spvDescriptorSet0.fp_c3)._m0[int(_643)][_645];
    int _649 = int(_641) + 1;
    uint _651 = uint(int(uint(_649) >> uint(2)));
    int _653 = _649 & 3;
    float _655 = (*spvDescriptorSet0.fp_c3)._m0[int(_651)][_653];
    int _657 = _632 + 56;
    uint _659 = uint(int(uint(_657) >> uint(2)));
    uint _661 = uint(int(uint(int(_659)) >> uint(2)));
    int _663 = int(_659) & 3;
    float _665 = (*spvDescriptorSet0.fp_c3)._m0[int(_661)][_663];
    int _667 = int(_659) + 1;
    uint _669 = uint(int(uint(_667) >> uint(2)));
    int _671 = _667 & 3;
    float _673 = (*spvDescriptorSet0.fp_c3)._m0[int(_669)][_671];
    int _675 = _612;
    if (!_636)
    {
        int _677 = _620 * as_type<int>((*spvDescriptorSet0.fp_c5)._m0[100].x);
        int _679 = _677 + _612;
        _675 = _679;
    }
    int _681 = _675;
    uint _683 = uint(int(uint(_632) >> uint(2)));
    uint _685 = uint(int(uint(int(_683)) >> uint(2)));
    int _687 = int(_683) & 3;
    float _689 = (*spvDescriptorSet0.fp_c3)._m0[int(_685)][_687];
    int _691 = int(_683) + 1;
    uint _693 = uint(int(uint(_691) >> uint(2)));
    int _695 = _691 & 3;
    float _697 = (*spvDescriptorSet0.fp_c3)._m0[int(_693)][_695];
    int _699 = 0;
    if (!_636)
    {
        int _701 = _681 << 2;
        _699 = _701;
    }
    int _703 = _699;
    int _705 = 0;
    int _707 = _703;
    if (!_636)
    {
        int _709 = _681 >> 2;
        _705 = _709;
    }
    int _711 = _705;
    int _713 = _711;
    if (!_636)
    {
        int _715 = 12 & _703;
        _707 = _715;
    }
    int _717 = _707;
    int _719 = _632 + 8;
    uint _721 = uint(int(uint(_719) >> uint(2)));
    uint _723 = uint(int(uint(int(_721)) >> uint(2)));
    int _725 = int(_721) & 3;
    float _727 = (*spvDescriptorSet0.fp_c3)._m0[int(_723)][_725];
    int _729 = int(_721) + 1;
    uint _731 = uint(int(uint(_729) >> uint(2)));
    int _733 = _729 & 3;
    float _735 = (*spvDescriptorSet0.fp_c3)._m0[int(_731)][_733];
    if (!_636)
    {
        int _737 = _711 << 4;
        int _739 = _737 + _717;
        _713 = _739;
    }
    int _741 = _713;
    float _743 = -_548;
    float _745 = fma(_743, (*spvDescriptorSet0.fp_c3)._m0[35].y, _271);
    float _747 = fma(_745, _566, _165);
    float _749 = fma(_564, _566, _167);
    int _751 = _632 + 16;
    uint _753 = uint(int(uint(_751) >> uint(2)));
    uint _755 = uint(int(uint(int(_753)) >> uint(2)));
    int _757 = int(_753) & 3;
    float _759 = (*spvDescriptorSet0.fp_c3)._m0[int(_755)][_757];
    int _761 = int(_753) + 1;
    uint _763 = uint(int(uint(_761) >> uint(2)));
    int _765 = _761 & 3;
    float _767 = (*spvDescriptorSet0.fp_c3)._m0[int(_763)][_765];
    if (!_636)
    {
        float _769 = floor(_568);
        _283 = _769;
    }
    float _771 = _283;
    int _773 = _632 + 32;
    uint _775 = uint(int(uint(_773) >> uint(2)));
    uint _777 = uint(int(uint(int(_775)) >> uint(2)));
    int _779 = int(_775) & 3;
    float _781 = (*spvDescriptorSet0.fp_c3)._m0[int(_777)][_779];
    int _783 = int(_775) + 1;
    uint _785 = uint(int(uint(_783) >> uint(2)));
    int _787 = _783 & 3;
    float _789 = (*spvDescriptorSet0.fp_c3)._m0[int(_785)][_787];
    float _791 = _564;
    if (!_636)
    {
        float _793 = floor(_596);
        _791 = _793;
    }
    float _795 = _791;
    float _797 = _271;
    if (!_636)
    {
        uint _799 = uint(int(uint(_741) >> uint(2)));
        uint _801 = uint(int(uint(int(_799)) >> uint(2)));
        int _803 = int(_799) & 3;
        float _805 = (*spvDescriptorSet0.fp_c5)._m0[int(_801)][_803];
        _797 = _805;
    }
    float _807 = _797;
    float _809 = _747 * _655;
    float _811 = fma(_749, _647, _809);
    int _813 = _632 + 24;
    uint _815 = uint(int(uint(_813) >> uint(2)));
    uint _817 = uint(int(uint(int(_815)) >> uint(2)));
    int _819 = int(_815) & 3;
    float _821 = (*spvDescriptorSet0.fp_c3)._m0[int(_817)][_819];
    int _823 = int(_815) + 1;
    uint _825 = uint(int(uint(_823) >> uint(2)));
    int _827 = _823 & 3;
    float _829 = (*spvDescriptorSet0.fp_c3)._m0[int(_825)][_827];
    float _831 = fma(_570, _665, _811);
    float _833 = _795;
    if (!_636)
    {
        float _835 = -_795;
        float _837 = _596 + _835;
        _833 = _837;
    }
    float _839 = _833;
    float _841 = _831 + _673;
    int _843 = _632 + 40;
    uint _845 = uint(int(uint(_843) >> uint(2)));
    uint _847 = uint(int(uint(int(_845)) >> uint(2)));
    int _849 = int(_845) & 3;
    float _851 = (*spvDescriptorSet0.fp_c3)._m0[int(_847)][_849];
    int _853 = int(_845) + 1;
    uint _855 = uint(int(uint(_853) >> uint(2)));
    int _857 = _853 & 3;
    float _859 = (*spvDescriptorSet0.fp_c3)._m0[int(_855)][_857];
    float _861 = _747 * _697;
    float _863 = _697;
    if (!_636)
    {
        float _865 = -_771;
        float _867 = _568 + _865;
        _863 = _867;
    }
    float _869 = _863;
    float _871 = 1.0 / _841;
    float _873 = fma(_749, _689, _861);
    float _875 = fma(_570, _727, _873);
    float _877 = rint(_598);
    float _879 = precise::max(_877, 0.0);
    uint _881 = uint(_879);
    uint _883 = clamp(_881, 0u, 65535u);
    float _885 = _875 + _735;
    float _887 = _747 * _767;
    float _889 = _885 * _871;
    float _891 = fma(_749, _759, _887);
    float _893 = _747 * _789;
    float _895 = fma(_749, _781, _893);
    float _897 = _875;
    float _899 = _871;
    if (!_636)
    {
        float _901 = rint(_807);
        float _903 = precise::max(_901, 0.0);
        uint _905 = uint(_903);
        uint _907 = clamp(_905, 0u, 65535u);
        _897 = as_type<float>(_907);
    }
    float _909 = _897;
    float _911 = fma(_570, _821, _891);
    float _913 = _911 + _829;
    float _915 = fma(_570, _851, _895);
    float _917 = _915 + _859;
    float _919 = _913 * _871;
    float _921 = _917 * _871;
    float _923 = precise::clamp(_921, 0.0, 1.0);
    float3 _2431 = float3(_889, _919, float(int(_883)));
    float3 _2435 = select(_2431, float3(0.0), isnan(_2431));
    float _925 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _2435.xy, uint(rint(_2435.z)), _923);
    float _927 = _869;
    if (!_636)
    {
        float3 _2448 = float3(_869, _839, float(as_type<int>(_909)));
        float3 _2450 = select(_2448, float3(0.0), isnan(_2448));
        float _929 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, _2450.xy, uint(rint(_2450.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, _2450.xy, uint(rint(_2450.z)), level(0.0)).x;
        _927 = _929;
    }
    float _931 = _927;
    float _933 = -_157;
    float _935 = -(*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _937 = _933 + _935;
    if (_636)
    {
        _899 = 1.0;
    }
    float _939 = _899;
    float _941 = _939;
    if (!_636)
    {
        int _943 = _681 << 4;
        int _945 = _943 + 1648;
        int _947 = _741 + 8048;
        uint _949 = uint(int(uint(_947) >> uint(2)));
        uint _951 = uint(int(uint(int(_949)) >> uint(2)));
        int _953 = int(_949) & 3;
        float _955 = (*spvDescriptorSet0.fp_c5)._m0[int(_951)][_953];
        uint _957 = uint(int(uint(_945) >> uint(2)));
        uint _959 = uint(int(uint(int(_957)) >> uint(2)));
        int _961 = int(_957) & 3;
        float _963 = (*spvDescriptorSet0.fp_c5)._m0[int(_959)][_961];
        int _965 = int(_957) + 1;
        uint _967 = uint(int(uint(_965) >> uint(2)));
        int _969 = _965 & 3;
        float _971 = (*spvDescriptorSet0.fp_c5)._m0[int(_967)][_969];
        int _973 = _945 + 8;
        uint _975 = uint(int(uint(_973) >> uint(2)));
        uint _977 = uint(int(uint(int(_975)) >> uint(2)));
        int _979 = int(_975) & 3;
        float _981 = (*spvDescriptorSet0.fp_c5)._m0[int(_977)][_979];
        int _983 = int(_975) + 1;
        uint _985 = uint(int(uint(_983) >> uint(2)));
        int _987 = _983 & 3;
        float _989 = (*spvDescriptorSet0.fp_c5)._m0[int(_985)][_987];
        float _991 = 1.0 / _955;
        float _993 = _955 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
        float _995 = _536 * _971;
        float _997 = fma(_538, _963, _995);
        float _999 = fma(_540, _981, _997);
        float _1001 = _999 + _989;
        float _1003 = precise::clamp(_1001, 0.0, 1.0);
        float _1005 = -_1003;
        float _1007 = _1005 + _931;
        float _1009 = fma(_991, (*spvDescriptorSet0.fp_c3)._m0[39].y, _1007);
        float _1011 = _993 * _1009;
        float _1013 = exp2(_1011);
        float _1015 = 0.0 + _1013;
        float _1017 = precise::clamp(_1015, 0.0, 1.0);
        _941 = _1017;
    }
    float _1019 = _941;
    float _1021 = -_157;
    float _1023 = -(*spvDescriptorSet0.fp_c3)._m0[38].z;
    float _1025 = _1021 + _1023;
    float _1027 = precise::min(_1019, (*spvDescriptorSet0.fp_c3)._m0[34].w);
    float _1029 = _937 * (*spvDescriptorSet0.fp_c3)._m0[38].y;
    float _1031 = precise::clamp(_1029, 0.0, 1.0);
    float _1033 = -_925;
    float _1035 = _1033 + 1.0;
    float _1037 = _1025 * (*spvDescriptorSet0.fp_c3)._m0[38].w;
    float _1039 = precise::clamp(_1037, 0.0, 1.0);
    float _1041 = -_1027;
    float _1043 = _1041 + 1.0;
    float _1045 = fma(_1031, _1035, _925);
    float _1047 = fma(_1039, _1043, _1027);
    out.m_54.x = _1045;
    out.m_54.y = _1047;
    out.m_54.z = 1.0;
    out.m_54.w = 1.0;
    out.m_56.x = _93;
    out.m_56.y = 0.5;
    out.m_56.z = 0.5;
    out.m_56.w = 1.0;
    return out;
}

