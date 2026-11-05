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
    float2 _931 = float2(_77, _79);
    float2 _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_931, float2(0.0), isnan(_931))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_931, float2(0.0), isnan(_931))).xy;
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
    float2 _1034 = float2(_145, _139);
    float _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1034, float2(0.0), isnan(_1034))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1034, float2(0.0), isnan(_1034))).w;
    float2 _1042 = float2(_147, _143);
    float _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1042, float2(0.0), isnan(_1042))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1042, float2(0.0), isnan(_1042))).w;
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
    int _308 = as_type<int>(_299);
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
            float _444 = abs(_312);
            float _446 = abs(_316);
            float _448 = _444 + _446;
            int _450 = as_type<int>(_312) & int(0x80000000);
            float _452 = _442 * _442;
            bool _454 = _448 > as_type<float>(0x7f800000u /* inf */);
            bool _456 = isnan(_448);
            bool _458 = _454 || _456;
            bool _460 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _462 = _458 || _460;
            float _464 = _452 + 11.33538818359375;
            float _466 = fma(_452, _464, 28.84246826171875);
            float _468 = fma(_452, _466, 19.6966705322265625);
            float _470 = fma(_452, -0.82336294651031494140625, -5.674867153167724609375);
            float _472 = fma(_452, _470, -6.565555095672607421875);
            float _474 = 1.0 / _468;
            float _476 = _452 * _472;
            float _478 = _442 * _476;
            float _480 = fma(_478, _474, _442);
            float _482 = _480;
            _368 = _448;
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
            if (!_462)
            {
                int _498 = _450 | _496;
                _368 = as_type<float>(_498);
            }
        }
    }
    float _500 = _368;
    float _502 = _500 + 0.5;
    float _504 = _502 * 0.15915493667125701904296875;
    float _506 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _508 = (*spvDescriptorSet0.fp_c9)._m0[110].w + _506;
    float _510 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _512 = _510 + (*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _514 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _516 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _514;
    float _518 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _520 = _518 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _522 = _504 * 6.283185482025146484375;
    float _524 = sin(_522);
    float _526 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _528 = (*spvDescriptorSet0.fp_c9)._m0[112].w + _526;
    float _530 = -(*spvDescriptorSet0.fp_c9)._m0[112].w;
    float _532 = _530 + (*spvDescriptorSet0.fp_c9)._m0[113].w;
    float _534 = 1.0 / _516;
    float _536 = 1.0 / _512;
    float _538 = fma(_524, 0.5, 0.5);
    float _540 = precise::clamp(_538, 0.0, 1.0);
    float _542 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _544 = _540 + _542;
    float _546 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _548 = _540 + _546;
    float _550 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _552 = _540 + _550;
    float _554 = 1.0 / _520;
    float _556 = _544 * _534;
    float _558 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _560 = _540 + _558;
    bool _562 = _540 >= (*spvDescriptorSet0.fp_c9)._m0[110].w;
    bool _564 = isnan(_540);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.fp_c9)._m0[110].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    float _574 = -(*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _576 = (*spvDescriptorSet0.fp_c9)._m0[110].y + _574;
    bool _578 = _540 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _580 = isnan(_540);
    bool _582 = _578 || _580;
    bool _584 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _586 = _582 || _584;
    float _588 = float(_586);
    float _590 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _592 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _590;
    float _594 = 1.0 / _528;
    float _596 = _548 * _536;
    float _598 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _600 = _540 + _598;
    float _602 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _604 = _602 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _606 = fma(_592, _556, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _608 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _610 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _608;
    float _612 = 1.0 / _532;
    float _614 = _600 * _554;
    float _616 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _618 = _616 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _620 = fma(_610, _556, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _622 = fma(_604, _614, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _624 = fma(_618, _614, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _626 = 1.0 / _508;
    float _628 = -(*spvDescriptorSet0.fp_c9)._m0[112].w;
    float _630 = _540 + _628;
    float _632 = _552 * _594;
    bool _634 = _540 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _636 = isnan(_540);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _642 = _638 || _640;
    float _644 = float(_642);
    float _646 = _630 * _612;
    float _648 = -_644;
    float _650 = _648 + 1.0;
    bool _652 = _540 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _654 = isnan(_540);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _666 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _664;
    float _668 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _670 = _668 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _672 = _560 * _626;
    float _674 = -_662;
    float _676 = _674 + 1.0;
    float _678 = fma(_666, _556, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _680 = fma(_670, _614, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    float _682 = -(*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _684 = (*spvDescriptorSet0.fp_c9)._m0[110].x + _682;
    float _686 = -_572;
    float _688 = _686 + 1.0;
    float _690 = -(*spvDescriptorSet0.fp_c9)._m0[110].x;
    float _692 = _690 + (*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _694 = -(*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _696 = (*spvDescriptorSet0.fp_c9)._m0[110].z + _694;
    float _698 = fma(_684, _672, (*spvDescriptorSet0.fp_c9)._m0[109].x);
    float _700 = _662 * _650;
    float _702 = -(*spvDescriptorSet0.fp_c9)._m0[110].y;
    float _704 = _702 + (*spvDescriptorSet0.fp_c9)._m0[111].y;
    bool _706 = _540 >= (*spvDescriptorSet0.fp_c9)._m0[111].w;
    bool _708 = isnan(_540);
    bool _710 = _706 || _708;
    bool _712 = isnan((*spvDescriptorSet0.fp_c9)._m0[111].w);
    bool _714 = _710 || _712;
    float _716 = float(_714);
    float _718 = _588 * _676;
    float _720 = _644 * _688;
    float _722 = fma(_576, _672, (*spvDescriptorSet0.fp_c9)._m0[109].y);
    float _724 = fma(_692, _596, (*spvDescriptorSet0.fp_c9)._m0[110].x);
    float _726 = _620 * _718;
    float _728 = _678 * _718;
    float _730 = -_588;
    float _732 = _730 + 1.0;
    float _734 = -_716;
    float _736 = _734 + 1.0;
    float _738 = _606 * _718;
    float _740 = -(*spvDescriptorSet0.fp_c9)._m0[110].z;
    float _742 = _740 + (*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _744 = fma(_732, (*spvDescriptorSet0.fp_c9)._m0[107].x, _726);
    float _746 = _572 * _736;
    float _748 = fma(_732, (*spvDescriptorSet0.fp_c9)._m0[107].z, _728);
    float _750 = fma(_732, (*spvDescriptorSet0.fp_c9)._m0[107].y, _738);
    float _752 = in.m_51.x;
    float _754 = gl_FragCoord.w;
    float _756 = _752 * _754;
    float _758 = in.m_51.y;
    float _760 = gl_FragCoord.w;
    float _762 = _758 * _760;
    float _764 = in.m_51.z;
    float _766 = gl_FragCoord.w;
    float _768 = _764 * _766;
    bool _770 = _540 >= (*spvDescriptorSet0.fp_c9)._m0[112].w;
    bool _772 = isnan(_540);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.fp_c9)._m0[112].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    float _782 = fma(_696, _672, (*spvDescriptorSet0.fp_c9)._m0[109].z);
    float _784 = fma(_624, _700, _744);
    float _786 = fma(_622, _700, _750);
    float _788 = fma(_680, _700, _748);
    float _790 = fma(_704, _596, (*spvDescriptorSet0.fp_c9)._m0[110].y);
    float _792 = fma(_742, _596, (*spvDescriptorSet0.fp_c9)._m0[110].z);
    bool _794 = _540 >= (*spvDescriptorSet0.fp_c9)._m0[113].w;
    bool _796 = isnan(_540);
    bool _798 = _794 || _796;
    bool _800 = isnan((*spvDescriptorSet0.fp_c9)._m0[113].w);
    bool _802 = _798 || _800;
    float _804 = float(_802);
    float _806 = -_780;
    float _808 = _806 + 1.0;
    float _810 = -(*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _812 = (*spvDescriptorSet0.fp_c9)._m0[112].x + _810;
    float _814 = -(*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _816 = (*spvDescriptorSet0.fp_c9)._m0[112].y + _814;
    float _818 = -(*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _820 = (*spvDescriptorSet0.fp_c9)._m0[112].z + _818;
    float _822 = fma(_698, _720, _784);
    float _824 = fma(_722, _720, _786);
    float _826 = fma(_782, _720, _788);
    float _828 = -(*spvDescriptorSet0.fp_c9)._m0[112].x;
    float _830 = _828 + (*spvDescriptorSet0.fp_c9)._m0[113].x;
    float _832 = -(*spvDescriptorSet0.fp_c9)._m0[112].y;
    float _834 = _832 + (*spvDescriptorSet0.fp_c9)._m0[113].y;
    float _836 = _716 * _808;
    float _838 = fma(_812, _632, (*spvDescriptorSet0.fp_c9)._m0[111].x);
    float _840 = fma(_816, _632, (*spvDescriptorSet0.fp_c9)._m0[111].y);
    float _842 = fma(_820, _632, (*spvDescriptorSet0.fp_c9)._m0[111].z);
    float _844 = -(*spvDescriptorSet0.fp_c9)._m0[112].z;
    float _846 = _844 + (*spvDescriptorSet0.fp_c9)._m0[113].z;
    float _848 = -_804;
    float _850 = _848 + 1.0;
    float _852 = fma(_724, _746, _822);
    float _854 = fma(_790, _746, _824);
    float _856 = fma(_792, _746, _826);
    float _858 = fma(_830, _646, (*spvDescriptorSet0.fp_c9)._m0[112].x);
    float _860 = fma(_834, _646, (*spvDescriptorSet0.fp_c9)._m0[112].y);
    float _862 = fma(_846, _646, (*spvDescriptorSet0.fp_c9)._m0[112].z);
    float _864 = _780 * _850;
    float _866 = fma(_838, _836, _852);
    float _868 = fma(_840, _836, _854);
    float _870 = fma(_842, _836, _856);
    float _872 = _75 * _756;
    float _874 = fma(_858, _864, _866);
    float _876 = fma(_860, _864, _868);
    float _878 = fma(_862, _864, _870);
    float _880 = _75 * _762;
    float _882 = _75 * _768;
    float _884 = fma(_804, (*spvDescriptorSet0.fp_c9)._m0[113].x, _874);
    float _886 = fma(_804, (*spvDescriptorSet0.fp_c9)._m0[113].y, _876);
    float _888 = fma(_804, (*spvDescriptorSet0.fp_c9)._m0[113].z, _878);
    float _890 = _884 + _872;
    float _892 = _886 + _880;
    float _894 = _888 + _882;
    if (!_221)
    {
        out.m_54.x = _890;
        out.m_54.y = _892;
        out.m_54.z = _894;
        out.m_54.w = _205;
        return out;
    }
    float _896 = 0.0 + _211;
    float _898 = precise::clamp(_896, 0.0, 1.0);
    out.m_54.x = _890;
    out.m_54.y = _892;
    out.m_54.z = _894;
    out.m_54.w = _898;
    return out;
}

