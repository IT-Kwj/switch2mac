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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_54 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_43 [[user(locn2), flat]];
    float4 m_47 [[user(locn3)]];
    float4 m_41 [[user(locn4), flat]];
    float4 m_35 [[user(locn5)]];
    float4 m_39 [[user(locn6), flat]];
    float4 m_37 [[user(locn7)]];
    float4 m_49 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_35.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _61;
    float _77 = _75 * _67;
    float _79 = _75 * _73;
    float2 _916 = float2(_77, _79);
    float _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_916, float2(0.0), isnan(_916))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_916, float2(0.0), isnan(_916))).y;
    float _83 = in.m_37.z;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_37.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_39.x;
    float _97 = in.m_41.x;
    float _99 = in.m_39.y;
    float _101 = in.m_43.x;
    float _103 = in.m_37.y;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_37.x;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _117 = _115 + (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _119 = _75 * _87;
    float _121 = _75 * _93;
    float _123 = fma(_97, _117, (*spvDescriptorSet0.fp_c9)._m0[191].x);
    float _125 = _119 + _95;
    float _127 = _121 + _99;
    float _129 = _75 * _107;
    float _131 = _75 * _113;
    float _133 = _125 * _101;
    float _135 = precise::clamp(_133, 0.0, 1.0);
    float _137 = fma(_81, _123, _127);
    float _139 = fma(_81, _123, _129);
    float2 _1010 = float2(_135, _137);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1010, float2(0.0), isnan(_1010))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1010, float2(0.0), isnan(_1010))).w;
    float2 _1018 = float2(_131, _139);
    float _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1018, float2(0.0), isnan(_1018))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1018, float2(0.0), isnan(_1018))).w;
    float _145 = in.m_45.w;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_47.x;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = _75 * _149;
    float _159 = -_157;
    float _161 = _159 + 1.0;
    float _163 = in.m_49.x;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_49.z;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = sqrt(_141);
    float _177 = fma(_161, _143, _141);
    float _179 = _177 * _175;
    float _181 = precise::clamp(_179, 0.0, 1.0);
    float _183 = _75 * _155;
    bool _187 = _181 >= _157;
    bool _189 = isnan(_181);
    bool _191 = _187 || _189;
    bool _193 = isnan(_157);
    bool _195 = _191 || _193;
    float _197 = float(_195);
    float _199 = 0.0 + _197;
    float _201 = precise::clamp(_199, 0.0, 1.0);
    float _203 = _201 * _183;
    bool _205 = _203 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _207 = isnan(_203);
    bool _209 = _205 || _207;
    bool _211 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _213 = _209 || _211;
    float _215 = in.m_49.y;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    if (!_213)
    {
        discard_fragment();
    }
    float _221 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _223 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _225 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _227 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _221);
    float _229 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _223);
    float _231 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _225);
    float _233 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _231);
    float _235 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _227);
    float _237 = _75 * _219;
    float _239 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _229);
    float _241 = _233 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _243 = _75 * _167;
    float _245 = _237 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _247 = _237 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _249 = _237 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _251 = _75 * _173;
    float _253 = 1.0 / _241;
    float _255 = fma(_243, (*spvDescriptorSet0.fp_c8)._m0[0].x, _245);
    float _257 = fma(_243, (*spvDescriptorSet0.fp_c8)._m0[1].x, _247);
    float _259 = fma(_243, (*spvDescriptorSet0.fp_c8)._m0[2].x, _249);
    float _261 = _235 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _263 = fma(_251, (*spvDescriptorSet0.fp_c8)._m0[0].z, _255);
    float _265 = fma(_251, (*spvDescriptorSet0.fp_c8)._m0[1].z, _257);
    float _267 = fma(_251, (*spvDescriptorSet0.fp_c8)._m0[2].z, _259);
    float _269 = _239 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _271 = _263 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _273 = _267 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _275 = _273 * _253;
    float _277 = -_271;
    float _279 = fma(_261, _275, _277);
    float _281 = _265 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _283 = -_281;
    float _285 = fma(_269, _275, _283);
    float _287 = abs(_279);
    float _289 = abs(_285);
    float _291 = precise::max(_287, _289);
    bool _293 = _291 >= 16.0;
    float _295 = _279;
    float _297 = _285;
    int _300 = as_type<int>(_247);
    if (_293)
    {
        float _302 = _279 * 0.0625;
        _295 = _302;
    }
    float _304 = _295;
    if (_293)
    {
        float _306 = _285 * 0.0625;
        _297 = _306;
    }
    float _308 = _297;
    float _310 = abs(_304);
    bool _312 = _310 != 0.0;
    bool _314 = isnan(_310);
    bool _316 = _312 || _314;
    bool _318 = isnan(0.0);
    bool _320 = _316 || _318;
    float _322 = abs(_308);
    bool _324 = _322 == 0.0;
    float _326 = abs(_308);
    bool _328 = _326 == 0.0;
    bool _330 = !_320;
    bool _332 = _328 && _330;
    bool _334 = false;
    if (_332)
    {
        bool _336 = as_type<int>(_308) >= 0;
        _334 = _336;
    }
    bool _338 = _334;
    int _340 = _338 ? (-1) : 0;
    if (_332)
    {
        int _342 = _338 ? 0 : 1078530011;
        _300 = _342;
    }
    int _344 = _300;
    int _346 = _344;
    if (_332)
    {
        int _348 = int(0x80000000) & as_type<int>(_304);
        int _350 = _344 | _348;
        _346 = _350;
    }
    int _352 = _346;
    bool _354 = !_320;
    bool _356 = _354 && _324;
    int _358 = _352;
    float _360 = as_type<float>(_352);
    if (!_356)
    {
        float _362 = abs(_304);
        bool _364 = _362 != as_type<float>(0x7f800000u /* inf */);
        bool _366 = isnan(_362);
        bool _368 = _364 || _366;
        bool _370 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _372 = _368 || _370;
        float _374 = abs(_308);
        bool _376 = _374 == as_type<float>(0x7f800000u /* inf */);
        float _378 = abs(_308);
        bool _380 = _378 == as_type<float>(0x7f800000u /* inf */);
        bool _382 = !_372;
        bool _384 = _380 && _382;
        if (_384)
        {
            bool _386 = as_type<int>(_308) >= 0;
            _340 = _386 ? (-1) : 0;
        }
        int _388 = _340;
        if (_384)
        {
            _358 = 1075235812;
        }
        int _390 = _358;
        int _392 = _390;
        if (_384)
        {
            int _394 = ~_388;
            int _396 = (_394 != 0) ? _390 : 1061752795;
            _392 = _396;
        }
        int _398 = _392;
        float _400 = as_type<float>(_398);
        if (_384)
        {
            int _402 = int(0x80000000) & as_type<int>(_304);
            int _404 = _398 | _402;
            _400 = as_type<float>(_404);
        }
        float _406 = _400;
        bool _408 = !_372;
        bool _410 = _408 && _376;
        _360 = _406;
        if (!_410)
        {
            float _412 = abs(_304);
            float _414 = abs(_308);
            float _416 = precise::max(_412, _414);
            float _418 = abs(_304);
            float _420 = abs(_308);
            float _422 = precise::min(_418, _420);
            float _424 = 1.0 / _416;
            float _426 = abs(_304);
            float _428 = abs(_308);
            bool _430 = _426 > _428;
            bool _432 = as_type<int>(_308) >= 0;
            float _434 = _422 * _424;
            float _436 = _434 * _434;
            float _438 = _436 + 11.33538818359375;
            float _440 = fma(_436, _438, 28.84246826171875);
            float _442 = fma(_436, _440, 19.6966705322265625);
            float _444 = fma(_436, -0.82336294651031494140625, -5.674867153167724609375);
            float _446 = abs(_304);
            float _448 = abs(_308);
            float _450 = _446 + _448;
            int _452 = as_type<int>(_304) & int(0x80000000);
            float _454 = fma(_436, _444, -6.565555095672607421875);
            float _456 = 1.0 / _442;
            bool _458 = _450 > as_type<float>(0x7f800000u /* inf */);
            bool _460 = isnan(_450);
            bool _462 = _458 || _460;
            bool _464 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _466 = _462 || _464;
            float _468 = _436 * _454;
            float _470 = _434 * _468;
            float _472 = fma(_470, _456, _434);
            float _474 = _472;
            _360 = _450;
            if (_430)
            {
                float _476 = -_472;
                float _478 = _476 + 1.57079637050628662109375;
                _474 = _478;
            }
            float _480 = _474;
            int _482 = as_type<int>(_480);
            if (!_432)
            {
                float _484 = -_480;
                float _486 = _484 + 3.1415927410125732421875;
                _482 = as_type<int>(_486);
            }
            int _488 = _482;
            if (!_466)
            {
                int _490 = _452 | _488;
                _360 = as_type<float>(_490);
            }
        }
    }
    float _492 = _360;
    float _494 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _496 = (*spvDescriptorSet0.fp_c9)._m0[110].w + _494;
    float _498 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _500 = _498 + (*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _502 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _504 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _502;
    float _506 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _508 = _506 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _510 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _512 = (*spvDescriptorSet0.fp_c9)._m0[112].w + _510;
    float _514 = 1.0 / _500;
    float _516 = -(*spvDescriptorSet0.fp_c9)._m0[112].w;
    float _518 = _516 + (*spvDescriptorSet0.fp_c9)._m0[113].w;
    float _520 = fma(_492, 0.15915493667125701904296875, 0.5);
    float _522 = precise::clamp(_520, 0.0, 1.0);
    float _524 = 1.0 / _504;
    float _526 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _528 = _522 + _526;
    float _530 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _532 = _522 + _530;
    float _534 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _536 = _522 + _534;
    bool _538 = _522 >= (*spvDescriptorSet0.fp_c9)._m0[110].w;
    bool _540 = isnan(_522);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.fp_c9)._m0[110].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = -(*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _552 = (*spvDescriptorSet0.fp_c9)._m0[110].y + _550;
    bool _554 = _522 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _556 = isnan(_522);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = 1.0 / _508;
    float _568 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _570 = _522 + _568;
    float _572 = _528 * _514;
    float _574 = 1.0 / _512;
    float _576 = _570 * _524;
    float _578 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _580 = _522 + _578;
    float _582 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _584 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _582;
    float _586 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _588 = _586 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _590 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _592 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _590;
    float _594 = 1.0 / _518;
    float _596 = _580 * _566;
    float _598 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _600 = _598 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _602 = fma(_584, _576, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _604 = fma(_592, _576, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _606 = fma(_588, _596, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _608 = fma(_600, _596, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _610 = 1.0 / _496;
    float _612 = -(*spvDescriptorSet0.fp_c9)._m0[112].w;
    float _614 = _522 + _612;
    float _616 = _532 * _574;
    bool _618 = _522 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _620 = isnan(_522);
    bool _622 = _618 || _620;
    bool _624 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _626 = _622 || _624;
    float _628 = float(_626);
    float _630 = _614 * _594;
    float _632 = -_628;
    float _634 = _632 + 1.0;
    bool _636 = _522 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _638 = isnan(_522);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _650 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _648;
    float _652 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _654 = _652 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _656 = _536 * _610;
    float _658 = -_646;
    float _660 = _658 + 1.0;
    float _662 = fma(_650, _576, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _664 = fma(_654, _596, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    float _666 = -(*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _668 = (*spvDescriptorSet0.fp_c9)._m0[110].x + _666;
    float _670 = -_548;
    float _672 = _670 + 1.0;
    float _674 = -(*spvDescriptorSet0.fp_c9)._m0[110].x;
    float _676 = _674 + (*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _678 = -(*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _680 = (*spvDescriptorSet0.fp_c9)._m0[110].z + _678;
    float _682 = fma(_668, _656, (*spvDescriptorSet0.fp_c9)._m0[109].x);
    float _684 = _646 * _634;
    float _686 = -(*spvDescriptorSet0.fp_c9)._m0[110].y;
    float _688 = _686 + (*spvDescriptorSet0.fp_c9)._m0[111].y;
    bool _690 = _522 >= (*spvDescriptorSet0.fp_c9)._m0[111].w;
    bool _692 = isnan(_522);
    bool _694 = _690 || _692;
    bool _696 = isnan((*spvDescriptorSet0.fp_c9)._m0[111].w);
    bool _698 = _694 || _696;
    float _700 = float(_698);
    float _702 = _564 * _660;
    float _704 = _628 * _672;
    float _706 = fma(_552, _656, (*spvDescriptorSet0.fp_c9)._m0[109].y);
    float _708 = fma(_676, _572, (*spvDescriptorSet0.fp_c9)._m0[110].x);
    float _710 = _602 * _702;
    float _712 = _662 * _702;
    float _714 = -_564;
    float _716 = _714 + 1.0;
    float _718 = -_700;
    float _720 = _718 + 1.0;
    float _722 = _604 * _702;
    float _724 = -(*spvDescriptorSet0.fp_c9)._m0[110].z;
    float _726 = _724 + (*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _728 = fma(_716, (*spvDescriptorSet0.fp_c9)._m0[107].x, _710);
    float _730 = _548 * _720;
    float _732 = fma(_716, (*spvDescriptorSet0.fp_c9)._m0[107].z, _712);
    float _734 = fma(_716, (*spvDescriptorSet0.fp_c9)._m0[107].y, _722);
    float _736 = in.m_51.x;
    float _738 = gl_FragCoord.w;
    float _740 = _736 * _738;
    float _742 = in.m_51.y;
    float _744 = gl_FragCoord.w;
    float _746 = _742 * _744;
    float _748 = in.m_51.z;
    float _750 = gl_FragCoord.w;
    float _752 = _748 * _750;
    bool _754 = _522 >= (*spvDescriptorSet0.fp_c9)._m0[112].w;
    bool _756 = isnan(_522);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.fp_c9)._m0[112].w);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    float _766 = fma(_680, _656, (*spvDescriptorSet0.fp_c9)._m0[109].z);
    float _768 = fma(_606, _684, _728);
    float _770 = fma(_608, _684, _734);
    float _772 = fma(_664, _684, _732);
    float _774 = fma(_688, _572, (*spvDescriptorSet0.fp_c9)._m0[110].y);
    float _776 = fma(_726, _572, (*spvDescriptorSet0.fp_c9)._m0[110].z);
    bool _778 = _522 >= (*spvDescriptorSet0.fp_c9)._m0[113].w;
    bool _780 = isnan(_522);
    bool _782 = _778 || _780;
    bool _784 = isnan((*spvDescriptorSet0.fp_c9)._m0[113].w);
    bool _786 = _782 || _784;
    float _788 = float(_786);
    float _790 = -_764;
    float _792 = _790 + 1.0;
    float _794 = -(*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _796 = (*spvDescriptorSet0.fp_c9)._m0[112].x + _794;
    float _798 = -(*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _800 = (*spvDescriptorSet0.fp_c9)._m0[112].y + _798;
    float _802 = -(*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _804 = (*spvDescriptorSet0.fp_c9)._m0[112].z + _802;
    float _806 = fma(_682, _704, _768);
    float _808 = fma(_706, _704, _770);
    float _810 = fma(_766, _704, _772);
    float _812 = -(*spvDescriptorSet0.fp_c9)._m0[112].x;
    float _814 = _812 + (*spvDescriptorSet0.fp_c9)._m0[113].x;
    float _816 = -(*spvDescriptorSet0.fp_c9)._m0[112].y;
    float _818 = _816 + (*spvDescriptorSet0.fp_c9)._m0[113].y;
    float _820 = _700 * _792;
    float _822 = fma(_796, _616, (*spvDescriptorSet0.fp_c9)._m0[111].x);
    float _824 = fma(_800, _616, (*spvDescriptorSet0.fp_c9)._m0[111].y);
    float _826 = fma(_804, _616, (*spvDescriptorSet0.fp_c9)._m0[111].z);
    float _828 = -(*spvDescriptorSet0.fp_c9)._m0[112].z;
    float _830 = _828 + (*spvDescriptorSet0.fp_c9)._m0[113].z;
    float _832 = -_788;
    float _834 = _832 + 1.0;
    float _836 = fma(_708, _730, _806);
    float _838 = fma(_774, _730, _808);
    float _840 = fma(_776, _730, _810);
    float _842 = fma(_814, _630, (*spvDescriptorSet0.fp_c9)._m0[112].x);
    float _844 = fma(_818, _630, (*spvDescriptorSet0.fp_c9)._m0[112].y);
    float _846 = fma(_830, _630, (*spvDescriptorSet0.fp_c9)._m0[112].z);
    float _848 = _764 * _834;
    float _850 = fma(_822, _820, _836);
    float _852 = fma(_824, _820, _838);
    float _854 = fma(_826, _820, _840);
    float _856 = _75 * _740;
    float _858 = fma(_842, _848, _850);
    float _860 = fma(_844, _848, _852);
    float _862 = fma(_846, _848, _854);
    float _864 = _75 * _746;
    float _866 = _75 * _752;
    float _868 = fma(_788, (*spvDescriptorSet0.fp_c9)._m0[113].x, _858);
    float _870 = fma(_788, (*spvDescriptorSet0.fp_c9)._m0[113].y, _860);
    float _872 = fma(_788, (*spvDescriptorSet0.fp_c9)._m0[113].z, _862);
    float _874 = _868 + _856;
    float _876 = _870 + _864;
    float _878 = _872 + _866;
    if (!_213)
    {
        out.m_54.x = _874;
        out.m_54.y = _876;
        out.m_54.z = _878;
        out.m_54.w = _197;
        return out;
    }
    float _880 = 0.0 + _203;
    float _882 = precise::clamp(_880, 0.0, 1.0);
    out.m_54.x = _874;
    out.m_54.y = _876;
    out.m_54.z = _878;
    out.m_54.w = _882;
    return out;
}

