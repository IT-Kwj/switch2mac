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
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_33.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _51;
    float _61 = _59 * _57;
    bool _65 = _61 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _67 = isnan(_61);
    bool _69 = _65 || _67;
    bool _71 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _73 = _69 || _71;
    float _75 = in.m_35.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_35.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_35.z;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    if (!_73)
    {
        discard_fragment();
    }
    float _93 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _95 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _93);
    float _97 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _95);
    float _99 = _59 * _79;
    float _101 = _59 * _85;
    float _103 = _97 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _105 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _107 = _99 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _109 = _59 * _91;
    float _111 = 1.0 / _103;
    float _113 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _115 = fma(_101, (*spvDescriptorSet0.fp_c8)._m0[2].x, _107);
    float _117 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _105);
    float _119 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _113);
    float _121 = fma(_109, (*spvDescriptorSet0.fp_c8)._m0[2].z, _115);
    float _123 = _99 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _125 = _99 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _127 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _117);
    float _129 = _121 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _131 = fma(_101, (*spvDescriptorSet0.fp_c8)._m0[0].x, _123);
    float _133 = fma(_101, (*spvDescriptorSet0.fp_c8)._m0[1].x, _125);
    float _135 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _119);
    float _137 = _127 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _139 = fma(_109, (*spvDescriptorSet0.fp_c8)._m0[0].z, _131);
    float _141 = fma(_109, (*spvDescriptorSet0.fp_c8)._m0[1].z, _133);
    float _143 = _129 * _111;
    float _145 = _135 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _147 = _139 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _149 = _141 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _151 = -_147;
    float _153 = fma(_137, _143, _151);
    float _155 = -_149;
    float _157 = fma(_145, _143, _155);
    float _159 = abs(_153);
    float _161 = abs(_157);
    float _163 = precise::max(_159, _161);
    bool _165 = _163 >= 16.0;
    float _167 = _153;
    float _169 = _157;
    int _172 = as_type<int>(_163);
    if (_165)
    {
        float _174 = _153 * 0.0625;
        _167 = _174;
    }
    float _176 = _167;
    if (_165)
    {
        float _178 = _157 * 0.0625;
        _169 = _178;
    }
    float _180 = _169;
    float _182 = abs(_176);
    bool _184 = _182 != 0.0;
    bool _186 = isnan(_182);
    bool _188 = _184 || _186;
    bool _190 = isnan(0.0);
    bool _192 = _188 || _190;
    float _194 = abs(_180);
    bool _196 = _194 == 0.0;
    float _198 = abs(_180);
    bool _200 = _198 == 0.0;
    bool _202 = !_192;
    bool _204 = _200 && _202;
    bool _206 = false;
    if (_204)
    {
        bool _208 = as_type<int>(_180) >= 0;
        _206 = _208;
    }
    bool _210 = _206;
    int _212 = _210 ? (-1) : 0;
    if (_204)
    {
        int _214 = _210 ? 0 : 1078530011;
        _172 = _214;
    }
    int _216 = _172;
    int _218 = _216;
    if (_204)
    {
        int _220 = int(0x80000000) & as_type<int>(_176);
        int _222 = _216 | _220;
        _218 = _222;
    }
    int _224 = _218;
    bool _226 = !_192;
    bool _228 = _226 && _196;
    int _230 = _224;
    float _232 = as_type<float>(_224);
    if (!_228)
    {
        float _234 = abs(_176);
        bool _236 = _234 != as_type<float>(0x7f800000u /* inf */);
        bool _238 = isnan(_234);
        bool _240 = _236 || _238;
        bool _242 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _244 = _240 || _242;
        float _246 = abs(_180);
        bool _248 = _246 == as_type<float>(0x7f800000u /* inf */);
        float _250 = abs(_180);
        bool _252 = _250 == as_type<float>(0x7f800000u /* inf */);
        bool _254 = !_244;
        bool _256 = _252 && _254;
        if (_256)
        {
            bool _258 = as_type<int>(_180) >= 0;
            _212 = _258 ? (-1) : 0;
        }
        int _260 = _212;
        if (_256)
        {
            _230 = 1075235812;
        }
        int _262 = _230;
        int _264 = _262;
        if (_256)
        {
            int _266 = ~_260;
            int _268 = (_266 != 0) ? _262 : 1061752795;
            _264 = _268;
        }
        int _270 = _264;
        float _272 = as_type<float>(_270);
        if (_256)
        {
            int _274 = int(0x80000000) & as_type<int>(_176);
            int _276 = _270 | _274;
            _272 = as_type<float>(_276);
        }
        float _278 = _272;
        bool _280 = !_244;
        bool _282 = _280 && _248;
        _232 = _278;
        if (!_282)
        {
            float _284 = abs(_176);
            float _286 = abs(_180);
            float _288 = precise::max(_284, _286);
            float _290 = abs(_176);
            float _292 = abs(_180);
            float _294 = precise::min(_290, _292);
            float _296 = 1.0 / _288;
            float _298 = abs(_176);
            float _300 = abs(_180);
            bool _302 = _298 > _300;
            bool _304 = as_type<int>(_180) >= 0;
            float _306 = _294 * _296;
            float _308 = abs(_176);
            float _310 = abs(_180);
            float _312 = _308 + _310;
            int _314 = as_type<int>(_176) & int(0x80000000);
            float _316 = _306 * _306;
            bool _318 = _312 > as_type<float>(0x7f800000u /* inf */);
            bool _320 = isnan(_312);
            bool _322 = _318 || _320;
            bool _324 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _326 = _322 || _324;
            float _328 = _316 + 11.33538818359375;
            float _330 = fma(_316, _328, 28.84246826171875);
            float _332 = fma(_316, _330, 19.6966705322265625);
            float _334 = fma(_316, -0.82336294651031494140625, -5.674867153167724609375);
            float _336 = fma(_316, _334, -6.565555095672607421875);
            float _338 = 1.0 / _332;
            float _340 = _316 * _336;
            float _342 = _306 * _340;
            float _344 = fma(_342, _338, _306);
            float _346 = _344;
            _232 = _312;
            if (_302)
            {
                float _348 = -_344;
                float _350 = _348 + 1.57079637050628662109375;
                _346 = _350;
            }
            float _352 = _346;
            int _354 = as_type<int>(_352);
            if (!_304)
            {
                float _356 = -_352;
                float _358 = _356 + 3.1415927410125732421875;
                _354 = as_type<int>(_358);
            }
            int _360 = _354;
            if (!_326)
            {
                int _362 = _314 | _360;
                _232 = as_type<float>(_362);
            }
        }
    }
    float _364 = _232;
    float _366 = in.m_37.x;
    float _368 = gl_FragCoord.w;
    float _370 = _366 * _368;
    float _372 = in.m_37.y;
    float _374 = gl_FragCoord.w;
    float _376 = _372 * _374;
    float _378 = _59 * _370;
    float _380 = _59 * _376;
    float2 _1365 = float2(_378, _380);
    float _382 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1365, float2(0.0), isnan(_1365))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1365, float2(0.0), isnan(_1365))).w;
    float _384 = in.m_39.y;
    float _386 = gl_FragCoord.w;
    float _388 = _384 * _386;
    float _390 = in.m_39.x;
    float _392 = gl_FragCoord.w;
    float _394 = _390 * _392;
    float _396 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _398 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _396;
    float _400 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _402 = _400 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _404 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _406 = (*spvDescriptorSet0.fp_c9)._m0[110].w + _404;
    float _408 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _410 = _408 + (*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _412 = 1.0 / _398;
    float _414 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _416 = (*spvDescriptorSet0.fp_c9)._m0[112].w + _414;
    float _418 = in.m_39.z;
    float _420 = gl_FragCoord.w;
    float _422 = _418 * _420;
    float _424 = -_99;
    float _426 = _424 + (*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _428 = -_101;
    float _430 = _428 + (*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _432 = -_109;
    float _434 = _432 + (*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _436 = 1.0 / _402;
    float _438 = fma(_364, 0.15915493667125701904296875, 0.5);
    float _440 = precise::clamp(_438, 0.0, 1.0);
    float _442 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _444 = _440 + _442;
    float _446 = 1.0 / _410;
    float _448 = 1.0 / _416;
    float _450 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _452 = _440 + _450;
    float _454 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _456 = _440 + _454;
    float _458 = _444 * _412;
    float _460 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _462 = _440 + _460;
    float _464 = _452 * _436;
    float _466 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _468 = _440 + _466;
    float _470 = 1.0 / _406;
    float _472 = _456 * _446;
    float _474 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _476 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _474;
    float _478 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _480 = _478 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _482 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _484 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _482;
    float _486 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _488 = _486 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _490 = _462 * _448;
    float _492 = _59 * _388;
    float _494 = -(*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _496 = (*spvDescriptorSet0.fp_c9)._m0[110].x + _494;
    float _498 = fma(_480, _464, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _500 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _502 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _500;
    float _504 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _506 = _504 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _508 = _468 * _470;
    float _510 = -(*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _512 = (*spvDescriptorSet0.fp_c9)._m0[110].y + _510;
    float _514 = -(*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _516 = (*spvDescriptorSet0.fp_c9)._m0[110].z + _514;
    float _518 = fma(_488, _464, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _520 = _59 * _394;
    float _522 = fma(_506, _464, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    float _524 = _492 * _492;
    float _526 = fma(_496, _508, (*spvDescriptorSet0.fp_c9)._m0[109].x);
    float _528 = fma(_512, _508, (*spvDescriptorSet0.fp_c9)._m0[109].y);
    float _530 = fma(_516, _508, (*spvDescriptorSet0.fp_c9)._m0[109].z);
    float _532 = _59 * _422;
    float _534 = fma(_520, _520, _524);
    float _536 = -(*spvDescriptorSet0.fp_c9)._m0[110].x;
    float _538 = _536 + (*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _540 = -(*spvDescriptorSet0.fp_c9)._m0[110].y;
    float _542 = _540 + (*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _544 = -(*spvDescriptorSet0.fp_c9)._m0[110].z;
    float _546 = _544 + (*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _548 = fma(_532, _532, _534);
    float _550 = _426 * _426;
    bool _552 = _440 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _554 = isnan(_440);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = fma(_538, _472, (*spvDescriptorSet0.fp_c9)._m0[110].x);
    float _566 = fma(_542, _472, (*spvDescriptorSet0.fp_c9)._m0[110].y);
    bool _568 = _440 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _570 = isnan(_440);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = rsqrt(_548);
    float _582 = fma(_476, _458, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _584 = fma(_484, _458, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _586 = fma(_502, _458, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _588 = fma(_546, _472, (*spvDescriptorSet0.fp_c9)._m0[110].z);
    float _590 = fma(_430, _430, _550);
    float _592 = -_562;
    float _594 = _592 + 1.0;
    float _596 = fma(_434, _434, _590);
    bool _598 = _440 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _600 = isnan(_440);
    bool _602 = _598 || _600;
    bool _604 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _606 = _602 || _604;
    float _608 = float(_606);
    float _610 = -_578;
    float _612 = _610 + 1.0;
    float _614 = -(*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _616 = (*spvDescriptorSet0.fp_c9)._m0[112].x + _614;
    float _618 = _578 * _594;
    float _620 = -(*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _622 = (*spvDescriptorSet0.fp_c9)._m0[112].y + _620;
    float _624 = -(*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _626 = (*spvDescriptorSet0.fp_c9)._m0[112].z + _624;
    float _628 = _608 * _612;
    float _630 = _492 * _580;
    float _632 = fma(_616, _490, (*spvDescriptorSet0.fp_c9)._m0[111].x);
    float _634 = fma(_622, _490, (*spvDescriptorSet0.fp_c9)._m0[111].y);
    float _636 = fma(_626, _490, (*spvDescriptorSet0.fp_c9)._m0[111].z);
    float _638 = _582 * _628;
    float _640 = _584 * _628;
    float _642 = _520 * _580;
    float _644 = _630 * _630;
    float _646 = _586 * _628;
    float _648 = rsqrt(_596);
    float _650 = _532 * _580;
    float _652 = -_608;
    float _654 = _652 + 1.0;
    float _656 = fma(_642, _642, _644);
    bool _658 = _440 >= (*spvDescriptorSet0.fp_c9)._m0[110].w;
    bool _660 = isnan(_440);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.fp_c9)._m0[110].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = fma(_654, (*spvDescriptorSet0.fp_c9)._m0[107].x, _638);
    float _672 = fma(_650, _650, _656);
    float _674 = fma(_654, (*spvDescriptorSet0.fp_c9)._m0[107].y, _640);
    float _676 = fma(_654, (*spvDescriptorSet0.fp_c9)._m0[107].z, _646);
    float _678 = fma(_498, _618, _670);
    float _680 = in.m_41.x;
    float _682 = gl_FragCoord.w;
    float _684 = _680 * _682;
    float _686 = in.m_41.z;
    float _688 = gl_FragCoord.w;
    float _690 = _686 * _688;
    float _692 = rsqrt(_672);
    float _694 = -_668;
    float _696 = _694 + 1.0;
    bool _698 = _440 >= (*spvDescriptorSet0.fp_c9)._m0[111].w;
    bool _700 = isnan(_440);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.fp_c9)._m0[111].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = _430 * _648;
    float _712 = _426 * _648;
    float _714 = _434 * _648;
    float _716 = _562 * _696;
    float _718 = in.m_41.y;
    float _720 = gl_FragCoord.w;
    float _722 = _718 * _720;
    float _724 = fma(_522, _618, _676);
    bool _726 = _440 >= (*spvDescriptorSet0.fp_c9)._m0[112].w;
    bool _728 = isnan(_440);
    bool _730 = _726 || _728;
    bool _732 = isnan((*spvDescriptorSet0.fp_c9)._m0[112].w);
    bool _734 = _730 || _732;
    float _736 = float(_734);
    float _738 = -_708;
    float _740 = _738 + 1.0;
    float _742 = fma(_518, _618, _674);
    float _744 = fma(_530, _716, _724);
    float _746 = _668 * _740;
    float _748 = -_736;
    float _750 = _748 + 1.0;
    float _752 = _630 * _692;
    float _754 = _642 * _692;
    float _756 = _650 * _692;
    float _758 = fma(_526, _716, _678);
    float _760 = _712 * _752;
    float _762 = fma(_528, _716, _742);
    float _764 = _708 * _750;
    float _766 = fma(_564, _746, _758);
    float _768 = fma(_710, _754, _760);
    float _770 = fma(_566, _746, _762);
    float _772 = fma(_588, _746, _744);
    float _774 = fma(_632, _764, _766);
    float _776 = fma(_714, _756, _768);
    float _778 = fma(_634, _764, _770);
    float _780 = fma(_636, _764, _772);
    float _782 = _59 * _684;
    float _784 = fma(_776, 0.5, 0.5);
    float _786 = _59 * _690;
    float _788 = fma(_736, (*spvDescriptorSet0.fp_c9)._m0[112].x, _774);
    float _790 = fma(_736, (*spvDescriptorSet0.fp_c9)._m0[112].y, _778);
    float _792 = fma(_736, (*spvDescriptorSet0.fp_c9)._m0[112].z, _780);
    bool _794 = _784 >= 0.5;
    bool _796 = isnan(_784);
    bool _798 = _794 || _796;
    bool _800 = isnan(0.5);
    bool _802 = _798 || _800;
    float _804 = float(_802);
    float _806 = _59 * _722;
    float _808 = _782 * _804;
    float _810 = _806 * _804;
    float _812 = _786 * _804;
    float _814 = fma(_788, (*spvDescriptorSet0.fp_c9)._m0[106].x, _808);
    float _816 = 0.0 + _382;
    float _818 = precise::clamp(_816, 0.0, 1.0);
    float _820 = fma(_790, (*spvDescriptorSet0.fp_c9)._m0[106].x, _810);
    float _822 = fma(_792, (*spvDescriptorSet0.fp_c9)._m0[106].x, _812);
    float _824 = _814 * _818;
    float _826 = _820 * _818;
    float _828 = _822 * _818;
    if (!_73)
    {
        out.m_44.x = _824;
        out.m_44.y = _826;
        out.m_44.z = _828;
        out.m_44.w = 1.0;
        return out;
    }
    float _830 = 0.0 + _61;
    float _832 = precise::clamp(_830, 0.0, 1.0);
    out.m_44.x = _824;
    out.m_44.y = _826;
    out.m_44.z = _828;
    out.m_44.w = _832;
    return out;
}

