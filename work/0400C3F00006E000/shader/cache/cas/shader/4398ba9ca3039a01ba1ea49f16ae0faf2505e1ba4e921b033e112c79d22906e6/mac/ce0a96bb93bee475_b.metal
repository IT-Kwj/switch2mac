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
    float4 m_39 [[user(locn4), flat]];
    float4 m_35 [[user(locn5)]];
    float4 m_41 [[user(locn6), flat]];
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
    float2 _923 = float2(_77, _79);
    float2 _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_923, float2(0.0), isnan(_923))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_923, float2(0.0), isnan(_923))).xy;
    float _85 = _83.x;
    float _87 = _83.y;
    float _89 = in.m_37.z;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_39.x;
    float _97 = in.m_41.x;
    float _99 = in.m_37.w;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_41.y;
    float _107 = in.m_43.x;
    float _109 = in.m_37.x;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_37.y;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = -(*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _123 = _121 + (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _125 = _75 * _93;
    float _127 = fma(_95, _123, (*spvDescriptorSet0.fp_c9)._m0[191].x);
    float _129 = _125 + _97;
    float _131 = _75 * _103;
    float _133 = _131 + _105;
    float _135 = _75 * _119;
    float _137 = _85 * _127;
    float _139 = fma(_87, _127, _133);
    float _141 = _75 * _113;
    float _143 = fma(_87, _127, _135);
    float _145 = fma(_129, _107, _137);
    float _147 = _141 + _137;
    float2 _1026 = float2(_145, _139);
    float _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1026, float2(0.0), isnan(_1026))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1026, float2(0.0), isnan(_1026))).w;
    float2 _1034 = float2(_147, _143);
    float _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1034, float2(0.0), isnan(_1034))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1034, float2(0.0), isnan(_1034))).w;
    float _153 = in.m_45.w;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = in.m_47.x;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = _75 * _157;
    float _167 = -_165;
    float _169 = _167 + 1.0;
    float _171 = in.m_49.x;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = in.m_49.z;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    float _183 = sqrt(_149);
    float _185 = fma(_169, _151, _149);
    float _187 = _185 * _183;
    float _189 = precise::clamp(_187, 0.0, 1.0);
    float _191 = _75 * _163;
    bool _195 = _189 >= _165;
    bool _197 = isnan(_189);
    bool _199 = _195 || _197;
    bool _201 = isnan(_165);
    bool _203 = _199 || _201;
    float _205 = float(_203);
    float _207 = 0.0 + _205;
    float _209 = precise::clamp(_207, 0.0, 1.0);
    float _211 = _209 * _191;
    bool _213 = _211 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _215 = isnan(_211);
    bool _217 = _213 || _215;
    bool _219 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _221 = _217 || _219;
    float _223 = in.m_49.y;
    float _225 = gl_FragCoord.w;
    float _227 = _223 * _225;
    if (!_221)
    {
        discard_fragment();
    }
    float _229 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _231 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _233 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _235 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _229);
    float _237 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _231);
    float _239 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _233);
    float _241 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _239);
    float _243 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _235);
    float _245 = _75 * _227;
    float _247 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _237);
    float _249 = _241 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _251 = _75 * _175;
    float _253 = _245 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _255 = _245 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _257 = _245 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _259 = _75 * _181;
    float _261 = 1.0 / _249;
    float _263 = fma(_251, (*spvDescriptorSet0.fp_c8)._m0[0].x, _253);
    float _265 = fma(_251, (*spvDescriptorSet0.fp_c8)._m0[1].x, _255);
    float _267 = fma(_251, (*spvDescriptorSet0.fp_c8)._m0[2].x, _257);
    float _269 = _243 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _271 = fma(_259, (*spvDescriptorSet0.fp_c8)._m0[0].z, _263);
    float _273 = fma(_259, (*spvDescriptorSet0.fp_c8)._m0[1].z, _265);
    float _275 = fma(_259, (*spvDescriptorSet0.fp_c8)._m0[2].z, _267);
    float _277 = _247 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _279 = _271 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _281 = _275 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _283 = _281 * _261;
    float _285 = -_279;
    float _287 = fma(_269, _283, _285);
    float _289 = _273 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _291 = -_289;
    float _293 = fma(_277, _283, _291);
    float _295 = abs(_287);
    float _297 = abs(_293);
    float _299 = precise::max(_295, _297);
    bool _301 = _299 >= 16.0;
    float _303 = _287;
    float _305 = _293;
    int _308 = as_type<int>(_255);
    if (_301)
    {
        float _310 = _287 * 0.0625;
        _303 = _310;
    }
    float _312 = _303;
    if (_301)
    {
        float _314 = _293 * 0.0625;
        _305 = _314;
    }
    float _316 = _305;
    float _318 = abs(_312);
    bool _320 = _318 != 0.0;
    bool _322 = isnan(_318);
    bool _324 = _320 || _322;
    bool _326 = isnan(0.0);
    bool _328 = _324 || _326;
    float _330 = abs(_316);
    bool _332 = _330 == 0.0;
    float _334 = abs(_316);
    bool _336 = _334 == 0.0;
    bool _338 = !_328;
    bool _340 = _336 && _338;
    bool _342 = false;
    if (_340)
    {
        bool _344 = as_type<int>(_316) >= 0;
        _342 = _344;
    }
    bool _346 = _342;
    int _348 = _346 ? (-1) : 0;
    if (_340)
    {
        int _350 = _346 ? 0 : 1078530011;
        _308 = _350;
    }
    int _352 = _308;
    int _354 = _352;
    if (_340)
    {
        int _356 = int(0x80000000) & as_type<int>(_312);
        int _358 = _352 | _356;
        _354 = _358;
    }
    int _360 = _354;
    bool _362 = !_328;
    bool _364 = _362 && _332;
    int _366 = _360;
    float _368 = as_type<float>(_360);
    if (!_364)
    {
        float _370 = abs(_312);
        bool _372 = _370 != as_type<float>(0x7f800000u /* inf */);
        bool _374 = isnan(_370);
        bool _376 = _372 || _374;
        bool _378 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _380 = _376 || _378;
        float _382 = abs(_316);
        bool _384 = _382 == as_type<float>(0x7f800000u /* inf */);
        float _386 = abs(_316);
        bool _388 = _386 == as_type<float>(0x7f800000u /* inf */);
        bool _390 = !_380;
        bool _392 = _388 && _390;
        if (_392)
        {
            bool _394 = as_type<int>(_316) >= 0;
            _348 = _394 ? (-1) : 0;
        }
        int _396 = _348;
        if (_392)
        {
            _366 = 1075235812;
        }
        int _398 = _366;
        int _400 = _398;
        if (_392)
        {
            int _402 = ~_396;
            int _404 = (_402 != 0) ? _398 : 1061752795;
            _400 = _404;
        }
        int _406 = _400;
        float _408 = as_type<float>(_406);
        if (_392)
        {
            int _410 = int(0x80000000) & as_type<int>(_312);
            int _412 = _406 | _410;
            _408 = as_type<float>(_412);
        }
        float _414 = _408;
        bool _416 = !_380;
        bool _418 = _416 && _384;
        _368 = _414;
        if (!_418)
        {
            float _420 = abs(_312);
            float _422 = abs(_316);
            float _424 = precise::max(_420, _422);
            float _426 = abs(_312);
            float _428 = abs(_316);
            float _430 = precise::min(_426, _428);
            float _432 = 1.0 / _424;
            float _434 = abs(_312);
            float _436 = abs(_316);
            bool _438 = _434 > _436;
            bool _440 = as_type<int>(_316) >= 0;
            float _442 = _430 * _432;
            float _444 = _442 * _442;
            float _446 = _444 + 11.33538818359375;
            float _448 = fma(_444, _446, 28.84246826171875);
            float _450 = fma(_444, _448, 19.6966705322265625);
            float _452 = fma(_444, -0.82336294651031494140625, -5.674867153167724609375);
            float _454 = abs(_312);
            float _456 = abs(_316);
            float _458 = _454 + _456;
            int _460 = as_type<int>(_312) & int(0x80000000);
            float _462 = fma(_444, _452, -6.565555095672607421875);
            float _464 = 1.0 / _450;
            bool _466 = _458 > as_type<float>(0x7f800000u /* inf */);
            bool _468 = isnan(_458);
            bool _470 = _466 || _468;
            bool _472 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _474 = _470 || _472;
            float _476 = _444 * _462;
            float _478 = _442 * _476;
            float _480 = fma(_478, _464, _442);
            float _482 = _480;
            _368 = _458;
            if (_438)
            {
                float _484 = -_480;
                float _486 = _484 + 1.57079637050628662109375;
                _482 = _486;
            }
            float _488 = _482;
            int _490 = as_type<int>(_488);
            if (!_440)
            {
                float _492 = -_488;
                float _494 = _492 + 3.1415927410125732421875;
                _490 = as_type<int>(_494);
            }
            int _496 = _490;
            if (!_474)
            {
                int _498 = _460 | _496;
                _368 = as_type<float>(_498);
            }
        }
    }
    float _500 = _368;
    float _502 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _504 = (*spvDescriptorSet0.fp_c9)._m0[110].w + _502;
    float _506 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _508 = _506 + (*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _510 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _512 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _510;
    float _514 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _516 = _514 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _518 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _520 = (*spvDescriptorSet0.fp_c9)._m0[112].w + _518;
    float _522 = 1.0 / _508;
    float _524 = -(*spvDescriptorSet0.fp_c9)._m0[112].w;
    float _526 = _524 + (*spvDescriptorSet0.fp_c9)._m0[113].w;
    float _528 = fma(_500, 0.15915493667125701904296875, 0.5);
    float _530 = precise::clamp(_528, 0.0, 1.0);
    float _532 = 1.0 / _512;
    float _534 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _536 = _530 + _534;
    float _538 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _540 = _530 + _538;
    float _542 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _544 = _530 + _542;
    bool _546 = _530 >= (*spvDescriptorSet0.fp_c9)._m0[110].w;
    bool _548 = isnan(_530);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.fp_c9)._m0[110].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = -(*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _560 = (*spvDescriptorSet0.fp_c9)._m0[110].y + _558;
    bool _562 = _530 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _564 = isnan(_530);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = 1.0 / _516;
    float _576 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _578 = _530 + _576;
    float _580 = _536 * _522;
    float _582 = 1.0 / _520;
    float _584 = _578 * _532;
    float _586 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _588 = _530 + _586;
    float _590 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _592 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _590;
    float _594 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _596 = _594 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _598 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _600 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _598;
    float _602 = 1.0 / _526;
    float _604 = _588 * _574;
    float _606 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _608 = _606 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _610 = fma(_592, _584, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _612 = fma(_600, _584, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _614 = fma(_596, _604, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _616 = fma(_608, _604, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _618 = 1.0 / _504;
    float _620 = -(*spvDescriptorSet0.fp_c9)._m0[112].w;
    float _622 = _530 + _620;
    float _624 = _540 * _582;
    bool _626 = _530 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _628 = isnan(_530);
    bool _630 = _626 || _628;
    bool _632 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _634 = _630 || _632;
    float _636 = float(_634);
    float _638 = _622 * _602;
    float _640 = -_636;
    float _642 = _640 + 1.0;
    bool _644 = _530 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _646 = isnan(_530);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _658 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _656;
    float _660 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _662 = _660 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _664 = _544 * _618;
    float _666 = -_654;
    float _668 = _666 + 1.0;
    float _670 = fma(_658, _584, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _672 = fma(_662, _604, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    float _674 = -(*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _676 = (*spvDescriptorSet0.fp_c9)._m0[110].x + _674;
    float _678 = -_556;
    float _680 = _678 + 1.0;
    float _682 = -(*spvDescriptorSet0.fp_c9)._m0[110].x;
    float _684 = _682 + (*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _686 = -(*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _688 = (*spvDescriptorSet0.fp_c9)._m0[110].z + _686;
    float _690 = fma(_676, _664, (*spvDescriptorSet0.fp_c9)._m0[109].x);
    float _692 = _654 * _642;
    float _694 = -(*spvDescriptorSet0.fp_c9)._m0[110].y;
    float _696 = _694 + (*spvDescriptorSet0.fp_c9)._m0[111].y;
    bool _698 = _530 >= (*spvDescriptorSet0.fp_c9)._m0[111].w;
    bool _700 = isnan(_530);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.fp_c9)._m0[111].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = _572 * _668;
    float _712 = _636 * _680;
    float _714 = fma(_560, _664, (*spvDescriptorSet0.fp_c9)._m0[109].y);
    float _716 = fma(_684, _580, (*spvDescriptorSet0.fp_c9)._m0[110].x);
    float _718 = _610 * _710;
    float _720 = _670 * _710;
    float _722 = -_572;
    float _724 = _722 + 1.0;
    float _726 = -_708;
    float _728 = _726 + 1.0;
    float _730 = _612 * _710;
    float _732 = -(*spvDescriptorSet0.fp_c9)._m0[110].z;
    float _734 = _732 + (*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _736 = fma(_724, (*spvDescriptorSet0.fp_c9)._m0[107].x, _718);
    float _738 = _556 * _728;
    float _740 = fma(_724, (*spvDescriptorSet0.fp_c9)._m0[107].z, _720);
    float _742 = fma(_724, (*spvDescriptorSet0.fp_c9)._m0[107].y, _730);
    float _744 = in.m_51.x;
    float _746 = gl_FragCoord.w;
    float _748 = _744 * _746;
    float _750 = in.m_51.y;
    float _752 = gl_FragCoord.w;
    float _754 = _750 * _752;
    float _756 = in.m_51.z;
    float _758 = gl_FragCoord.w;
    float _760 = _756 * _758;
    bool _762 = _530 >= (*spvDescriptorSet0.fp_c9)._m0[112].w;
    bool _764 = isnan(_530);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.fp_c9)._m0[112].w);
    bool _770 = _766 || _768;
    float _772 = float(_770);
    float _774 = fma(_688, _664, (*spvDescriptorSet0.fp_c9)._m0[109].z);
    float _776 = fma(_614, _692, _736);
    float _778 = fma(_616, _692, _742);
    float _780 = fma(_672, _692, _740);
    float _782 = fma(_696, _580, (*spvDescriptorSet0.fp_c9)._m0[110].y);
    float _784 = fma(_734, _580, (*spvDescriptorSet0.fp_c9)._m0[110].z);
    bool _786 = _530 >= (*spvDescriptorSet0.fp_c9)._m0[113].w;
    bool _788 = isnan(_530);
    bool _790 = _786 || _788;
    bool _792 = isnan((*spvDescriptorSet0.fp_c9)._m0[113].w);
    bool _794 = _790 || _792;
    float _796 = float(_794);
    float _798 = -_772;
    float _800 = _798 + 1.0;
    float _802 = -(*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _804 = (*spvDescriptorSet0.fp_c9)._m0[112].x + _802;
    float _806 = -(*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _808 = (*spvDescriptorSet0.fp_c9)._m0[112].y + _806;
    float _810 = -(*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _812 = (*spvDescriptorSet0.fp_c9)._m0[112].z + _810;
    float _814 = fma(_690, _712, _776);
    float _816 = fma(_714, _712, _778);
    float _818 = fma(_774, _712, _780);
    float _820 = -(*spvDescriptorSet0.fp_c9)._m0[112].x;
    float _822 = _820 + (*spvDescriptorSet0.fp_c9)._m0[113].x;
    float _824 = -(*spvDescriptorSet0.fp_c9)._m0[112].y;
    float _826 = _824 + (*spvDescriptorSet0.fp_c9)._m0[113].y;
    float _828 = _708 * _800;
    float _830 = fma(_804, _624, (*spvDescriptorSet0.fp_c9)._m0[111].x);
    float _832 = fma(_808, _624, (*spvDescriptorSet0.fp_c9)._m0[111].y);
    float _834 = fma(_812, _624, (*spvDescriptorSet0.fp_c9)._m0[111].z);
    float _836 = -(*spvDescriptorSet0.fp_c9)._m0[112].z;
    float _838 = _836 + (*spvDescriptorSet0.fp_c9)._m0[113].z;
    float _840 = -_796;
    float _842 = _840 + 1.0;
    float _844 = fma(_716, _738, _814);
    float _846 = fma(_782, _738, _816);
    float _848 = fma(_784, _738, _818);
    float _850 = fma(_822, _638, (*spvDescriptorSet0.fp_c9)._m0[112].x);
    float _852 = fma(_826, _638, (*spvDescriptorSet0.fp_c9)._m0[112].y);
    float _854 = fma(_838, _638, (*spvDescriptorSet0.fp_c9)._m0[112].z);
    float _856 = _772 * _842;
    float _858 = fma(_830, _828, _844);
    float _860 = fma(_832, _828, _846);
    float _862 = fma(_834, _828, _848);
    float _864 = _75 * _748;
    float _866 = fma(_850, _856, _858);
    float _868 = fma(_852, _856, _860);
    float _870 = fma(_854, _856, _862);
    float _872 = _75 * _754;
    float _874 = _75 * _760;
    float _876 = fma(_796, (*spvDescriptorSet0.fp_c9)._m0[113].x, _866);
    float _878 = fma(_796, (*spvDescriptorSet0.fp_c9)._m0[113].y, _868);
    float _880 = fma(_796, (*spvDescriptorSet0.fp_c9)._m0[113].z, _870);
    float _882 = _876 + _864;
    float _884 = _878 + _872;
    float _886 = _880 + _874;
    if (!_221)
    {
        out.m_54.x = _882;
        out.m_54.y = _884;
        out.m_54.z = _886;
        out.m_54.w = _205;
        return out;
    }
    float _888 = 0.0 + _211;
    float _890 = precise::clamp(_888, 0.0, 1.0);
    out.m_54.x = _882;
    out.m_54.y = _884;
    out.m_54.z = _886;
    out.m_54.w = _890;
    return out;
}

