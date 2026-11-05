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
    float _101 = _97 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _103 = _59 * _85;
    float _105 = _99 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _107 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _109 = _59 * _91;
    float _111 = 1.0 / _101;
    float _113 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _115 = fma(_103, (*spvDescriptorSet0.fp_c8)._m0[2].x, _105);
    float _117 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _107);
    float _119 = _99 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _121 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _113);
    float _123 = fma(_109, (*spvDescriptorSet0.fp_c8)._m0[2].z, _115);
    float _125 = _99 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _127 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _117);
    float _129 = fma(_103, (*spvDescriptorSet0.fp_c8)._m0[0].x, _119);
    float _131 = _123 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _133 = fma(_103, (*spvDescriptorSet0.fp_c8)._m0[1].x, _125);
    float _135 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _121);
    float _137 = fma(_109, (*spvDescriptorSet0.fp_c8)._m0[0].z, _129);
    float _139 = _127 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _141 = fma(_109, (*spvDescriptorSet0.fp_c8)._m0[1].z, _133);
    float _143 = _131 * _111;
    float _145 = _137 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _147 = _135 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _149 = _141 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _151 = -_145;
    float _153 = fma(_139, _143, _151);
    float _155 = -_149;
    float _157 = fma(_147, _143, _155);
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
    float2 _1421 = float2(_378, _380);
    float _382 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1421, float2(0.0), isnan(_1421))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1421, float2(0.0), isnan(_1421))).w;
    float _384 = _364 + 0.5;
    float _386 = -_103;
    float _388 = _386 + (*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _390 = _384 * 0.15915493667125701904296875;
    float _392 = -_109;
    float _394 = _392 + (*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _396 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _398 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _396;
    float _400 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _402 = _400 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _404 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _406 = (*spvDescriptorSet0.fp_c9)._m0[110].w + _404;
    float _408 = in.m_39.y;
    float _410 = gl_FragCoord.w;
    float _412 = _408 * _410;
    float _414 = 1.0 / _398;
    float _416 = in.m_39.x;
    float _418 = gl_FragCoord.w;
    float _420 = _416 * _418;
    float _422 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _424 = _422 + (*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _426 = 1.0 / _402;
    float _428 = -_99;
    float _430 = _428 + (*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _432 = _390 * 6.283185482025146484375;
    float _434 = sin(_432);
    float _436 = _430 * _430;
    float _438 = 1.0 / _406;
    float _440 = fma(_388, _388, _436);
    float _442 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _444 = (*spvDescriptorSet0.fp_c9)._m0[112].w + _442;
    float _446 = -(*spvDescriptorSet0.fp_c9)._m0[112].w;
    float _448 = _446 + (*spvDescriptorSet0.fp_c9)._m0[113].w;
    float _450 = 1.0 / _424;
    float _452 = fma(_394, _394, _440);
    float _454 = fma(_434, 0.5, 0.5);
    float _456 = precise::clamp(_454, 0.0, 1.0);
    float _458 = in.m_39.z;
    float _460 = gl_FragCoord.w;
    float _462 = _458 * _460;
    float _464 = _59 * _420;
    float _466 = -(*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _468 = (*spvDescriptorSet0.fp_c9)._m0[110].x + _466;
    float _470 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _472 = _456 + _470;
    float _474 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _476 = _456 + _474;
    float _478 = rsqrt(_452);
    float _480 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _482 = _456 + _480;
    float _484 = _472 * _426;
    float _486 = -(*spvDescriptorSet0.fp_c9)._m0[112].w;
    float _488 = _456 + _486;
    float _490 = _476 * _414;
    bool _492 = _456 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _494 = isnan(_456);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    float _504 = -(*spvDescriptorSet0.fp_c9)._m0[110].x;
    float _506 = _504 + (*spvDescriptorSet0.fp_c9)._m0[111].x;
    bool _508 = _456 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _510 = isnan(_456);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = 1.0 / _444;
    float _522 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _524 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _522;
    float _526 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _528 = _526 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _530 = 1.0 / _448;
    float _532 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _534 = _456 + _532;
    float _536 = _388 * _478;
    float _538 = _430 * _478;
    float _540 = _394 * _478;
    float _542 = _534 * _438;
    float _544 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _546 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _544;
    float _548 = _482 * _520;
    float _550 = _59 * _412;
    float _552 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _554 = _456 + _552;
    float _556 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _558 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _556;
    float _560 = fma(_546, _490, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _562 = _59 * _462;
    float _564 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _566 = _564 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _568 = _550 * _550;
    float _570 = _488 * _530;
    float _572 = fma(_558, _490, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _574 = fma(_524, _490, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _576 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _578 = _576 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _580 = _554 * _450;
    bool _582 = _456 >= (*spvDescriptorSet0.fp_c9)._m0[110].w;
    bool _584 = isnan(_456);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.fp_c9)._m0[110].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = fma(_566, _484, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _596 = fma(_464, _464, _568);
    float _598 = fma(_578, _484, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _600 = -(*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _602 = (*spvDescriptorSet0.fp_c9)._m0[110].y + _600;
    bool _604 = _456 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _606 = isnan(_456);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = -_592;
    float _618 = _616 + 1.0;
    float _620 = fma(_562, _562, _596);
    float _622 = fma(_528, _484, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    float _624 = -(*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _626 = (*spvDescriptorSet0.fp_c9)._m0[110].z + _624;
    float _628 = _614 * _618;
    float _630 = -_614;
    float _632 = _630 + 1.0;
    float _634 = fma(_602, _542, (*spvDescriptorSet0.fp_c9)._m0[109].y);
    float _636 = fma(_468, _542, (*spvDescriptorSet0.fp_c9)._m0[109].x);
    float _638 = rsqrt(_620);
    float _640 = fma(_626, _542, (*spvDescriptorSet0.fp_c9)._m0[109].z);
    float _642 = -_502;
    float _644 = _642 + 1.0;
    float _646 = _502 * _632;
    float _648 = -(*spvDescriptorSet0.fp_c9)._m0[110].y;
    float _650 = _648 + (*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _652 = -(*spvDescriptorSet0.fp_c9)._m0[110].z;
    float _654 = _652 + (*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _656 = _518 * _644;
    float _658 = fma(_506, _580, (*spvDescriptorSet0.fp_c9)._m0[110].x);
    float _660 = fma(_650, _580, (*spvDescriptorSet0.fp_c9)._m0[110].y);
    float _662 = fma(_654, _580, (*spvDescriptorSet0.fp_c9)._m0[110].z);
    float _664 = _572 * _656;
    float _666 = _560 * _656;
    float _668 = _574 * _656;
    float _670 = -_518;
    float _672 = _670 + 1.0;
    float _674 = _550 * _638;
    float _676 = _464 * _638;
    float _678 = fma(_672, (*spvDescriptorSet0.fp_c9)._m0[107].x, _664);
    float _680 = -(*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _682 = (*spvDescriptorSet0.fp_c9)._m0[112].x + _680;
    float _684 = fma(_672, (*spvDescriptorSet0.fp_c9)._m0[107].y, _666);
    float _686 = _562 * _638;
    float _688 = _674 * _674;
    float _690 = fma(_672, (*spvDescriptorSet0.fp_c9)._m0[107].z, _668);
    float _692 = fma(_594, _646, _678);
    float _694 = fma(_682, _548, (*spvDescriptorSet0.fp_c9)._m0[111].x);
    float _696 = -(*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _698 = (*spvDescriptorSet0.fp_c9)._m0[112].y + _696;
    float _700 = -(*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _702 = (*spvDescriptorSet0.fp_c9)._m0[112].z + _700;
    float _704 = fma(_676, _676, _688);
    float _706 = -(*spvDescriptorSet0.fp_c9)._m0[112].x;
    float _708 = _706 + (*spvDescriptorSet0.fp_c9)._m0[113].x;
    float _710 = fma(_698, _548, (*spvDescriptorSet0.fp_c9)._m0[111].y);
    float _712 = fma(_702, _548, (*spvDescriptorSet0.fp_c9)._m0[111].z);
    float _714 = fma(_686, _686, _704);
    float _716 = -(*spvDescriptorSet0.fp_c9)._m0[112].y;
    float _718 = _716 + (*spvDescriptorSet0.fp_c9)._m0[113].y;
    float _720 = -(*spvDescriptorSet0.fp_c9)._m0[112].z;
    float _722 = _720 + (*spvDescriptorSet0.fp_c9)._m0[113].z;
    float _724 = fma(_708, _570, (*spvDescriptorSet0.fp_c9)._m0[112].x);
    float _726 = fma(_636, _628, _692);
    float _728 = rsqrt(_714);
    float _730 = fma(_718, _570, (*spvDescriptorSet0.fp_c9)._m0[112].y);
    float _732 = fma(_722, _570, (*spvDescriptorSet0.fp_c9)._m0[112].z);
    float _734 = fma(_598, _646, _684);
    float _736 = fma(_622, _646, _690);
    bool _738 = _456 >= (*spvDescriptorSet0.fp_c9)._m0[111].w;
    bool _740 = isnan(_456);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.fp_c9)._m0[111].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = in.m_41.x;
    float _752 = gl_FragCoord.w;
    float _754 = _750 * _752;
    float _756 = in.m_41.y;
    float _758 = gl_FragCoord.w;
    float _760 = _756 * _758;
    float _762 = in.m_41.z;
    float _764 = gl_FragCoord.w;
    float _766 = _762 * _764;
    float _768 = fma(_634, _628, _734);
    float _770 = -_748;
    float _772 = _770 + 1.0;
    bool _774 = _456 >= (*spvDescriptorSet0.fp_c9)._m0[112].w;
    bool _776 = isnan(_456);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.fp_c9)._m0[112].w);
    bool _782 = _778 || _780;
    float _784 = float(_782);
    float _786 = fma(_640, _628, _736);
    bool _788 = _456 >= (*spvDescriptorSet0.fp_c9)._m0[113].w;
    bool _790 = isnan(_456);
    bool _792 = _788 || _790;
    bool _794 = isnan((*spvDescriptorSet0.fp_c9)._m0[113].w);
    bool _796 = _792 || _794;
    float _798 = float(_796);
    float _800 = _592 * _772;
    float _802 = -_784;
    float _804 = _802 + 1.0;
    float _806 = _674 * _728;
    float _808 = _686 * _728;
    float _810 = -_798;
    float _812 = _810 + 1.0;
    float _814 = _748 * _804;
    float _816 = _538 * _806;
    float _818 = _676 * _728;
    float _820 = fma(_658, _800, _726);
    float _822 = fma(_660, _800, _768);
    float _824 = fma(_662, _800, _786);
    float _826 = fma(_536, _818, _816);
    float _828 = _784 * _812;
    float _830 = fma(_694, _814, _820);
    float _832 = fma(_710, _814, _822);
    float _834 = fma(_540, _808, _826);
    float _836 = fma(_712, _814, _824);
    float _838 = fma(_724, _828, _830);
    float _840 = fma(_730, _828, _832);
    float _842 = fma(_834, 0.5, 0.5);
    float _844 = fma(_732, _828, _836);
    float _846 = fma(_798, (*spvDescriptorSet0.fp_c9)._m0[113].x, _838);
    float _848 = fma(_798, (*spvDescriptorSet0.fp_c9)._m0[113].y, _840);
    float _850 = _59 * _754;
    bool _852 = _842 >= 0.5;
    bool _854 = isnan(_842);
    bool _856 = _852 || _854;
    bool _858 = isnan(0.5);
    bool _860 = _856 || _858;
    float _862 = float(_860);
    float _864 = _59 * _760;
    float _866 = _59 * _766;
    float _868 = fma(_798, (*spvDescriptorSet0.fp_c9)._m0[113].z, _844);
    float _870 = fma(_850, _862, _846);
    float _872 = fma(_864, _862, _848);
    float _874 = 0.0 + _382;
    float _876 = precise::clamp(_874, 0.0, 1.0);
    float _878 = fma(_866, _862, _868);
    float _880 = _870 * _876;
    float _882 = _872 * _876;
    float _884 = _878 * _876;
    if (!_73)
    {
        out.m_44.x = _880;
        out.m_44.y = _882;
        out.m_44.z = _884;
        out.m_44.w = 1.0;
        return out;
    }
    float _886 = 0.0 + _61;
    float _888 = precise::clamp(_886, 0.0, 1.0);
    out.m_44.x = _880;
    out.m_44.y = _882;
    out.m_44.z = _884;
    out.m_44.w = _888;
    return out;
}

