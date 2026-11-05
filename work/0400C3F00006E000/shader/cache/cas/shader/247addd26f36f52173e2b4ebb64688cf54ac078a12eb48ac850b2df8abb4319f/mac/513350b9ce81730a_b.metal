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
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0), flat]];
    float4 m_43 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_35.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_35.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 / _53;
    float _69 = _67 * _59;
    float _71 = _67 * _65;
    float2 _859 = float2(_71, _69);
    float2 _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_859, float2(0.0), isnan(_859))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_859, float2(0.0), isnan(_859))).xy;
    float _77 = _75.x;
    float _79 = _75.y;
    float _81 = in.m_35.z;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_35.w;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = _67 * _85;
    float _95 = _67 * _91;
    float _97 = fma(_77, (*spvDescriptorSet0.fp_c9)._m0[191].x, _93);
    float _99 = fma(_79, (*spvDescriptorSet0.fp_c9)._m0[191].x, _95);
    float2 _908 = float2(_97, _99);
    float2 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_908, float2(0.0), isnan(_908))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_908, float2(0.0), isnan(_908))).xw;
    float _103 = _101.x;
    float _105 = _101.y;
    float _107 = in.m_37.x;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_39.y;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = _67 * _111;
    float _121 = in.m_39.z;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = _105 * _105;
    float _129 = 0.0 + _127;
    float _131 = precise::clamp(_129, 0.0, 1.0);
    float _133 = _131 * _119;
    bool _137 = _133 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _139 = isnan(_133);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _145 = _141 || _143;
    float _147 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _149 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    if (!_145)
    {
        discard_fragment();
    }
    float _151 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _153 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _147);
    float _155 = in.m_39.x;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _149);
    float _163 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _151);
    float _165 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _163);
    float _167 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _153);
    float _169 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _161);
    float _171 = _67 * _117;
    float _173 = _165 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _175 = _167 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _177 = _169 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _179 = _171 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _181 = _171 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _183 = _171 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _185 = 1.0 / _173;
    float _187 = _67 * _125;
    float _189 = _67 * _159;
    float _191 = fma(_189, (*spvDescriptorSet0.fp_c8)._m0[0].x, _179);
    float _193 = fma(_189, (*spvDescriptorSet0.fp_c8)._m0[1].x, _181);
    float _195 = fma(_189, (*spvDescriptorSet0.fp_c8)._m0[2].x, _183);
    float _197 = fma(_187, (*spvDescriptorSet0.fp_c8)._m0[0].z, _191);
    float _199 = fma(_187, (*spvDescriptorSet0.fp_c8)._m0[1].z, _193);
    float _201 = fma(_187, (*spvDescriptorSet0.fp_c8)._m0[2].z, _195);
    float _203 = _201 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _205 = _203 * _185;
    float _207 = _197 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _209 = -_207;
    float _211 = fma(_175, _205, _209);
    float _213 = _199 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _215 = -_213;
    float _217 = fma(_177, _205, _215);
    float _219 = abs(_211);
    float _221 = abs(_217);
    float _223 = precise::max(_219, _221);
    bool _225 = _223 >= 16.0;
    float _227 = _211;
    float _229 = _217;
    int _232 = as_type<int>(_205);
    float _234 = _223;
    if (_225)
    {
        float _236 = _211 * 0.0625;
        _227 = _236;
    }
    float _238 = _227;
    if (_225)
    {
        float _240 = _217 * 0.0625;
        _229 = _240;
    }
    float _242 = _229;
    float _244 = abs(_238);
    bool _246 = _244 != 0.0;
    bool _248 = isnan(_244);
    bool _250 = _246 || _248;
    bool _252 = isnan(0.0);
    bool _254 = _250 || _252;
    float _256 = abs(_242);
    bool _258 = _256 == 0.0;
    float _260 = abs(_242);
    bool _262 = _260 == 0.0;
    bool _264 = !_254;
    bool _266 = _262 && _264;
    bool _268 = false;
    if (_266)
    {
        bool _270 = as_type<int>(_242) >= 0;
        _268 = _270;
    }
    bool _272 = _268;
    int _274 = _272 ? (-1) : 0;
    if (_266)
    {
        int _276 = _272 ? 0 : 1078530011;
        _232 = _276;
    }
    int _278 = _232;
    int _280 = _278;
    if (_266)
    {
        int _282 = int(0x80000000) & as_type<int>(_238);
        int _284 = _278 | _282;
        _234 = as_type<float>(_284);
    }
    float _286 = _234;
    bool _288 = !_254;
    bool _290 = _288 && _258;
    float _292 = _286;
    float _294 = _286;
    if (!_290)
    {
        float _296 = abs(_238);
        bool _298 = _296 != as_type<float>(0x7f800000u /* inf */);
        bool _300 = isnan(_296);
        bool _302 = _298 || _300;
        bool _304 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _306 = _302 || _304;
        float _308 = abs(_242);
        bool _310 = _308 == as_type<float>(0x7f800000u /* inf */);
        float _312 = abs(_242);
        bool _314 = _312 == as_type<float>(0x7f800000u /* inf */);
        bool _316 = !_306;
        bool _318 = _314 && _316;
        if (_318)
        {
            bool _320 = as_type<int>(_242) >= 0;
            _274 = _320 ? (-1) : 0;
        }
        int _322 = _274;
        if (_318)
        {
            _280 = 1075235812;
        }
        int _324 = _280;
        int _326 = _324;
        if (_318)
        {
            int _328 = ~_322;
            int _330 = (_328 != 0) ? _324 : 1061752795;
            _326 = _330;
        }
        int _332 = _326;
        if (_318)
        {
            int _334 = int(0x80000000) & as_type<int>(_238);
            int _336 = _332 | _334;
            _292 = as_type<float>(_336);
        }
        float _338 = _292;
        bool _340 = !_306;
        bool _342 = _340 && _310;
        _294 = _338;
        if (!_342)
        {
            float _344 = abs(_238);
            float _346 = abs(_242);
            float _348 = precise::max(_344, _346);
            float _350 = abs(_238);
            float _352 = abs(_242);
            float _354 = precise::min(_350, _352);
            float _356 = 1.0 / _348;
            float _358 = abs(_238);
            float _360 = abs(_242);
            bool _362 = _358 > _360;
            bool _364 = as_type<int>(_242) >= 0;
            float _366 = abs(_238);
            float _368 = abs(_242);
            float _370 = _366 + _368;
            int _372 = as_type<int>(_238) & int(0x80000000);
            bool _374 = _370 > as_type<float>(0x7f800000u /* inf */);
            bool _376 = isnan(_370);
            bool _378 = _374 || _376;
            bool _380 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _382 = _378 || _380;
            float _384 = _354 * _356;
            float _386 = _384 * _384;
            float _388 = _386 + 11.33538818359375;
            float _390 = fma(_386, _388, 28.84246826171875);
            float _392 = fma(_386, _390, 19.6966705322265625);
            float _394 = fma(_386, -0.82336294651031494140625, -5.674867153167724609375);
            float _396 = fma(_386, _394, -6.565555095672607421875);
            float _398 = 1.0 / _392;
            float _400 = _386 * _396;
            float _402 = _384 * _400;
            float _404 = fma(_402, _398, _384);
            float _406 = _404;
            _294 = _370;
            if (_362)
            {
                float _408 = -_404;
                float _410 = _408 + 1.57079637050628662109375;
                _406 = _410;
            }
            float _412 = _406;
            int _414 = as_type<int>(_412);
            if (!_364)
            {
                float _416 = -_412;
                float _418 = _416 + 3.1415927410125732421875;
                _414 = as_type<int>(_418);
            }
            int _420 = _414;
            if (!_382)
            {
                int _422 = _372 | _420;
                _294 = as_type<float>(_422);
            }
        }
    }
    float _424 = _294;
    float _426 = in.m_41.x;
    float _428 = _424 + 0.5;
    float _430 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _432 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _430;
    float _434 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _436 = _434 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _438 = 1.0 / _432;
    float _440 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _442 = (*spvDescriptorSet0.fp_c9)._m0[112].w + _440;
    float _444 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _446 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _444;
    float _448 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _450 = _448 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _452 = 1.0 / _436;
    float _454 = -(*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _456 = (*spvDescriptorSet0.fp_c9)._m0[112].x + _454;
    float _458 = -(*spvDescriptorSet0.fp_c9)._m0[112].x;
    float _460 = _458 + (*spvDescriptorSet0.fp_c9)._m0[113].x;
    float _462 = 1.0 / _442;
    float _464 = -(*spvDescriptorSet0.fp_c9)._m0[112].w;
    float _466 = _464 + (*spvDescriptorSet0.fp_c9)._m0[113].w;
    float _468 = fma(_426, 0.4000000059604644775390625, _428);
    float _470 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _472 = (*spvDescriptorSet0.fp_c9)._m0[110].w + _470;
    float _474 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _476 = _474 + (*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _478 = _468 * 0.15915493667125701904296875;
    float _480 = 1.0 / _472;
    float _482 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _484 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _482;
    float _486 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _488 = _486 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _490 = _478 * 6.283185482025146484375;
    float _492 = sin(_490);
    float _494 = 1.0 / _476;
    float _496 = fma(_492, 0.5, 0.5);
    float _498 = precise::clamp(_496, 0.0, 1.0);
    float _500 = 1.0 / _466;
    float _502 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _504 = _498 + _502;
    float _506 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _508 = _498 + _506;
    float _510 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _512 = _498 + _510;
    float _514 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _516 = _498 + _514;
    float _518 = _504 * _480;
    float _520 = _508 * _438;
    float _522 = _512 * _452;
    float _524 = -(*spvDescriptorSet0.fp_c9)._m0[112].w;
    float _526 = _498 + _524;
    float _528 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _530 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _528;
    float _532 = fma(_446, _520, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _534 = fma(_484, _520, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _536 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _538 = _536 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _540 = fma(_530, _520, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _542 = -(*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _544 = (*spvDescriptorSet0.fp_c9)._m0[110].x + _542;
    float _546 = fma(_450, _522, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _548 = fma(_488, _522, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _550 = fma(_538, _522, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    float _552 = fma(_544, _518, (*spvDescriptorSet0.fp_c9)._m0[109].x);
    float _554 = -(*spvDescriptorSet0.fp_c9)._m0[110].x;
    float _556 = _554 + (*spvDescriptorSet0.fp_c9)._m0[111].x;
    bool _558 = _498 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _560 = isnan(_498);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _572 = _498 + _570;
    float _574 = _516 * _494;
    float _576 = _526 * _500;
    float _578 = -(*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _580 = (*spvDescriptorSet0.fp_c9)._m0[110].y + _578;
    float _582 = -(*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _584 = (*spvDescriptorSet0.fp_c9)._m0[110].z + _582;
    bool _586 = _498 >= (*spvDescriptorSet0.fp_c9)._m0[110].w;
    bool _588 = isnan(_498);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.fp_c9)._m0[110].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = -_568;
    float _600 = _598 + 1.0;
    bool _602 = _498 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _604 = isnan(_498);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = _572 * _462;
    float _616 = fma(_580, _518, (*spvDescriptorSet0.fp_c9)._m0[109].y);
    float _618 = fma(_584, _518, (*spvDescriptorSet0.fp_c9)._m0[109].z);
    float _620 = -(*spvDescriptorSet0.fp_c9)._m0[110].y;
    float _622 = _620 + (*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _624 = -_596;
    float _626 = _624 + 1.0;
    bool _628 = _498 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _630 = isnan(_498);
    bool _632 = _628 || _630;
    bool _634 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _636 = _632 || _634;
    float _638 = float(_636);
    float _640 = _612 * _600;
    float _642 = -_612;
    float _644 = _642 + 1.0;
    float _646 = -(*spvDescriptorSet0.fp_c9)._m0[110].z;
    float _648 = _646 + (*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _650 = _568 * _626;
    bool _652 = _498 >= (*spvDescriptorSet0.fp_c9)._m0[112].w;
    bool _654 = isnan(_498);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.fp_c9)._m0[112].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = _638 * _644;
    float _666 = fma(_556, _574, (*spvDescriptorSet0.fp_c9)._m0[110].x);
    float _668 = fma(_622, _574, (*spvDescriptorSet0.fp_c9)._m0[110].y);
    float _670 = fma(_648, _574, (*spvDescriptorSet0.fp_c9)._m0[110].z);
    float _672 = -_638;
    float _674 = _672 + 1.0;
    bool _676 = _498 >= (*spvDescriptorSet0.fp_c9)._m0[111].w;
    bool _678 = isnan(_498);
    bool _680 = _676 || _678;
    bool _682 = isnan((*spvDescriptorSet0.fp_c9)._m0[111].w);
    bool _684 = _680 || _682;
    float _686 = float(_684);
    float _688 = _532 * _664;
    float _690 = _534 * _664;
    float _692 = _540 * _664;
    float _694 = -_662;
    float _696 = _694 + 1.0;
    float _698 = fma(_674, (*spvDescriptorSet0.fp_c9)._m0[107].x, _688);
    float _700 = fma(_674, (*spvDescriptorSet0.fp_c9)._m0[107].y, _690);
    float _702 = fma(_674, (*spvDescriptorSet0.fp_c9)._m0[107].z, _692);
    float _704 = in.m_43.x;
    float _706 = gl_FragCoord.w;
    float _708 = _704 * _706;
    float _710 = -_686;
    float _712 = _710 + 1.0;
    float _714 = _686 * _696;
    float _716 = in.m_43.y;
    float _718 = gl_FragCoord.w;
    float _720 = _716 * _718;
    float _722 = in.m_43.z;
    float _724 = gl_FragCoord.w;
    float _726 = _722 * _724;
    float _728 = fma(_546, _640, _698);
    float _730 = fma(_548, _640, _700);
    float _732 = fma(_550, _640, _702);
    bool _734 = _498 >= (*spvDescriptorSet0.fp_c9)._m0[113].w;
    bool _736 = isnan(_498);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.fp_c9)._m0[113].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = _596 * _712;
    float _748 = fma(_552, _650, _728);
    float _750 = -(*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _752 = (*spvDescriptorSet0.fp_c9)._m0[112].y + _750;
    float _754 = fma(_616, _650, _730);
    float _756 = -(*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _758 = (*spvDescriptorSet0.fp_c9)._m0[112].z + _756;
    float _760 = fma(_618, _650, _732);
    float _762 = fma(_456, _614, (*spvDescriptorSet0.fp_c9)._m0[111].x);
    float _764 = -_744;
    float _766 = _764 + 1.0;
    float _768 = fma(_666, _746, _748);
    float _770 = fma(_752, _614, (*spvDescriptorSet0.fp_c9)._m0[111].y);
    float _772 = -(*spvDescriptorSet0.fp_c9)._m0[112].y;
    float _774 = _772 + (*spvDescriptorSet0.fp_c9)._m0[113].y;
    float _776 = fma(_668, _746, _754);
    float _778 = fma(_758, _614, (*spvDescriptorSet0.fp_c9)._m0[111].z);
    float _780 = -(*spvDescriptorSet0.fp_c9)._m0[112].z;
    float _782 = _780 + (*spvDescriptorSet0.fp_c9)._m0[113].z;
    float _784 = fma(_670, _746, _760);
    float _786 = fma(_460, _576, (*spvDescriptorSet0.fp_c9)._m0[112].x);
    float _788 = _662 * _766;
    float _790 = fma(_762, _714, _768);
    float _792 = fma(_774, _576, (*spvDescriptorSet0.fp_c9)._m0[112].y);
    float _794 = fma(_770, _714, _776);
    float _796 = fma(_782, _576, (*spvDescriptorSet0.fp_c9)._m0[112].z);
    float _798 = fma(_778, _714, _784);
    float _800 = fma(_786, _788, _790);
    float _802 = fma(_792, _788, _794);
    float _804 = _67 * _708;
    float _806 = fma(_796, _788, _798);
    float _808 = fma(_744, (*spvDescriptorSet0.fp_c9)._m0[113].x, _800);
    float _810 = _67 * _720;
    float _812 = fma(_744, (*spvDescriptorSet0.fp_c9)._m0[113].y, _802);
    float _814 = _67 * _726;
    float _816 = fma(_744, (*spvDescriptorSet0.fp_c9)._m0[113].z, _806);
    float _818 = fma(_804, _103, _808);
    float _820 = fma(_810, _103, _812);
    float _822 = fma(_814, _103, _816);
    if (!_145)
    {
        out.m_46.x = _818;
        out.m_46.y = _820;
        out.m_46.z = _822;
        out.m_46.w = _127;
        return out;
    }
    float _824 = 0.0 + _133;
    float _826 = precise::clamp(_824, 0.0, 1.0);
    out.m_46.x = _818;
    out.m_46.y = _820;
    out.m_46.z = _822;
    out.m_46.w = _826;
    return out;
}

