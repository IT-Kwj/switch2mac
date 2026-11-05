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
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_43 [[user(locn3), flat]];
    float4 m_33 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_33.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_33.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 / _53;
    float _69 = _67 * _59;
    float _71 = _67 * _65;
    float2 _856 = float2(_69, _71);
    float _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_856, float2(0.0), isnan(_856))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_856, float2(0.0), isnan(_856))).w;
    float _75 = in.m_35.w;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_37.w;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_39.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = _67 * _79;
    float _95 = _67 * _85;
    float _97 = in.m_41.y;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_41.z;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = _73 * _93;
    float _111 = _67 * _91;
    float _113 = _95 * _109;
    float _115 = 0.0 + _113;
    float _117 = precise::clamp(_115, 0.0, 1.0);
    float _119 = _117 * _111;
    bool _123 = _119 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _125 = isnan(_119);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _131 = _127 || _129;
    float _133 = in.m_41.x;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    if (!_131)
    {
        discard_fragment();
    }
    float _139 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _141 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _143 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _145 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _139);
    float _147 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _141);
    float _149 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _143);
    float _151 = _67 * _137;
    float _153 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _149);
    float _155 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _145);
    float _157 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _147);
    float _159 = _67 * _101;
    float _161 = _153 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _163 = _155 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _165 = _157 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _167 = _159 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _169 = _159 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _171 = _159 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _173 = 1.0 / _161;
    float _175 = _67 * _107;
    float _177 = fma(_151, (*spvDescriptorSet0.fp_c8)._m0[0].x, _167);
    float _179 = fma(_151, (*spvDescriptorSet0.fp_c8)._m0[1].x, _169);
    float _181 = fma(_151, (*spvDescriptorSet0.fp_c8)._m0[2].x, _171);
    float _183 = fma(_175, (*spvDescriptorSet0.fp_c8)._m0[0].z, _177);
    float _185 = fma(_175, (*spvDescriptorSet0.fp_c8)._m0[1].z, _179);
    float _187 = fma(_175, (*spvDescriptorSet0.fp_c8)._m0[2].z, _181);
    float _189 = _183 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _191 = _185 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _193 = _187 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _195 = _193 * _173;
    float _197 = -_189;
    float _199 = fma(_163, _195, _197);
    float _201 = -_191;
    float _203 = fma(_165, _195, _201);
    float _205 = abs(_199);
    float _207 = abs(_203);
    float _209 = precise::max(_205, _207);
    bool _211 = _209 >= 16.0;
    float _213 = _199;
    float _215 = _203;
    int _218 = as_type<int>(_209);
    if (_211)
    {
        float _220 = _199 * 0.0625;
        _213 = _220;
    }
    float _222 = _213;
    if (_211)
    {
        float _224 = _203 * 0.0625;
        _215 = _224;
    }
    float _226 = _215;
    float _228 = abs(_222);
    bool _230 = _228 != 0.0;
    bool _232 = isnan(_228);
    bool _234 = _230 || _232;
    bool _236 = isnan(0.0);
    bool _238 = _234 || _236;
    float _240 = abs(_226);
    bool _242 = _240 == 0.0;
    float _244 = abs(_226);
    bool _246 = _244 == 0.0;
    bool _248 = !_238;
    bool _250 = _246 && _248;
    bool _252 = false;
    if (_250)
    {
        bool _254 = as_type<int>(_226) >= 0;
        _252 = _254;
    }
    bool _256 = _252;
    int _258 = _256 ? (-1) : 0;
    if (_250)
    {
        int _260 = _256 ? 0 : 1078530011;
        _218 = _260;
    }
    int _262 = _218;
    int _264 = _262;
    if (_250)
    {
        int _266 = int(0x80000000) & as_type<int>(_222);
        int _268 = _262 | _266;
        _264 = _268;
    }
    int _270 = _264;
    bool _272 = !_238;
    bool _274 = _272 && _242;
    int _276 = _270;
    float _278 = as_type<float>(_270);
    if (!_274)
    {
        float _280 = abs(_222);
        bool _282 = _280 != as_type<float>(0x7f800000u /* inf */);
        bool _284 = isnan(_280);
        bool _286 = _282 || _284;
        bool _288 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _290 = _286 || _288;
        float _292 = abs(_226);
        bool _294 = _292 == as_type<float>(0x7f800000u /* inf */);
        float _296 = abs(_226);
        bool _298 = _296 == as_type<float>(0x7f800000u /* inf */);
        bool _300 = !_290;
        bool _302 = _298 && _300;
        if (_302)
        {
            bool _304 = as_type<int>(_226) >= 0;
            _258 = _304 ? (-1) : 0;
        }
        int _306 = _258;
        if (_302)
        {
            _276 = 1075235812;
        }
        int _308 = _276;
        int _310 = _308;
        if (_302)
        {
            int _312 = ~_306;
            int _314 = (_312 != 0) ? _308 : 1061752795;
            _310 = _314;
        }
        int _316 = _310;
        float _318 = as_type<float>(_316);
        if (_302)
        {
            int _320 = int(0x80000000) & as_type<int>(_222);
            int _322 = _316 | _320;
            _318 = as_type<float>(_322);
        }
        float _324 = _318;
        bool _326 = !_290;
        bool _328 = _326 && _294;
        _278 = _324;
        if (!_328)
        {
            float _330 = abs(_222);
            float _332 = abs(_226);
            float _334 = precise::max(_330, _332);
            float _336 = abs(_222);
            float _338 = abs(_226);
            float _340 = precise::min(_336, _338);
            float _342 = 1.0 / _334;
            float _344 = abs(_222);
            float _346 = abs(_226);
            bool _348 = _344 > _346;
            bool _350 = as_type<int>(_226) >= 0;
            float _352 = _340 * _342;
            float _354 = abs(_222);
            float _356 = abs(_226);
            float _358 = _354 + _356;
            float _360 = _352 * _352;
            bool _362 = _358 > as_type<float>(0x7f800000u /* inf */);
            bool _364 = isnan(_358);
            bool _366 = _362 || _364;
            bool _368 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _370 = _366 || _368;
            float _372 = _360 + 11.33538818359375;
            float _374 = fma(_360, _372, 28.84246826171875);
            float _376 = fma(_360, _374, 19.6966705322265625);
            float _378 = fma(_360, -0.82336294651031494140625, -5.674867153167724609375);
            float _380 = fma(_360, _378, -6.565555095672607421875);
            float _382 = 1.0 / _376;
            float _384 = _360 * _380;
            float _386 = _352 * _384;
            float _388 = fma(_386, _382, _352);
            int _390 = as_type<int>(_222) & int(0x80000000);
            float _392 = _388;
            _278 = _358;
            if (_348)
            {
                float _394 = -_388;
                float _396 = _394 + 1.57079637050628662109375;
                _392 = _396;
            }
            float _398 = _392;
            int _400 = as_type<int>(_398);
            if (!_350)
            {
                float _402 = -_398;
                float _404 = _402 + 3.1415927410125732421875;
                _400 = as_type<int>(_404);
            }
            int _406 = _400;
            if (!_370)
            {
                int _408 = _390 | _406;
                _278 = as_type<float>(_408);
            }
        }
    }
    float _410 = _278;
    float _412 = _410 * 1.5;
    float _414 = _412 * 0.15915493667125701904296875;
    float _416 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _418 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _416;
    float _420 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _422 = _420 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _424 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _426 = (*spvDescriptorSet0.fp_c9)._m0[110].w + _424;
    float _428 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _430 = _428 + (*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _432 = _414 * 6.283185482025146484375;
    float _434 = sin(_432);
    float _436 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _438 = (*spvDescriptorSet0.fp_c9)._m0[112].w + _436;
    float _440 = -(*spvDescriptorSet0.fp_c9)._m0[112].w;
    float _442 = _440 + (*spvDescriptorSet0.fp_c9)._m0[113].w;
    float _444 = 1.0 / _418;
    float _446 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _448 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _446;
    float _450 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _452 = _450 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _454 = 1.0 / _422;
    float _456 = fma(_434, 0.5, 0.5);
    float _458 = precise::clamp(_456, 0.0, 1.0);
    float _460 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _462 = _458 + _460;
    float _464 = -(*spvDescriptorSet0.fp_c9)._m0[110].w;
    float _466 = _458 + _464;
    float _468 = -(*spvDescriptorSet0.fp_c9)._m0[111].w;
    float _470 = _458 + _468;
    float _472 = 1.0 / _426;
    float _474 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _476 = _458 + _474;
    float _478 = _462 * _444;
    float _480 = -(*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _482 = (*spvDescriptorSet0.fp_c9)._m0[110].z + _480;
    bool _484 = _458 >= (*spvDescriptorSet0.fp_c9)._m0[111].w;
    bool _486 = isnan(_458);
    bool _488 = _484 || _486;
    bool _490 = isnan((*spvDescriptorSet0.fp_c9)._m0[111].w);
    bool _492 = _488 || _490;
    float _494 = float(_492);
    float _496 = -(*spvDescriptorSet0.fp_c9)._m0[110].z;
    float _498 = _496 + (*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _500 = fma(_448, _478, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    bool _502 = _458 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _504 = isnan(_458);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = 1.0 / _430;
    float _516 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _518 = _458 + _516;
    float _520 = _476 * _454;
    float _522 = -_494;
    float _524 = _522 + 1.0;
    float _526 = fma(_452, _520, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    float _528 = 1.0 / _442;
    float _530 = _518 * _472;
    float _532 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _534 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _532;
    float _536 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _538 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _536;
    float _540 = 1.0 / _438;
    float _542 = _466 * _514;
    float _544 = -(*spvDescriptorSet0.fp_c9)._m0[112].w;
    float _546 = _458 + _544;
    float _548 = fma(_534, _478, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _550 = fma(_538, _478, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _552 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _554 = _552 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    bool _556 = _458 >= (*spvDescriptorSet0.fp_c9)._m0[110].w;
    bool _558 = isnan(_458);
    bool _560 = _556 || _558;
    bool _562 = isnan((*spvDescriptorSet0.fp_c9)._m0[110].w);
    bool _564 = _560 || _562;
    float _566 = float(_564);
    float _568 = _546 * _528;
    float _570 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _572 = _570 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _574 = -(*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _576 = (*spvDescriptorSet0.fp_c9)._m0[110].x + _574;
    float _578 = fma(_554, _520, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _580 = -(*spvDescriptorSet0.fp_c9)._m0[110].x;
    float _582 = _580 + (*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _584 = fma(_572, _520, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _586 = fma(_576, _530, (*spvDescriptorSet0.fp_c9)._m0[109].x);
    float _588 = -_566;
    float _590 = _588 + 1.0;
    float _592 = _470 * _540;
    float _594 = -(*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _596 = (*spvDescriptorSet0.fp_c9)._m0[110].y + _594;
    float _598 = -(*spvDescriptorSet0.fp_c9)._m0[110].y;
    float _600 = _598 + (*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _602 = _566 * _524;
    float _604 = fma(_596, _530, (*spvDescriptorSet0.fp_c9)._m0[109].y);
    float _606 = fma(_482, _530, (*spvDescriptorSet0.fp_c9)._m0[109].z);
    bool _608 = _458 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _610 = isnan(_458);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _616 = _612 || _614;
    float _618 = float(_616);
    bool _620 = _458 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _622 = isnan(_458);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = _618 * _590;
    float _634 = -_618;
    float _636 = _634 + 1.0;
    float _638 = -_630;
    float _640 = _638 + 1.0;
    bool _642 = _458 >= (*spvDescriptorSet0.fp_c9)._m0[112].w;
    bool _644 = isnan(_458);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.fp_c9)._m0[112].w);
    bool _650 = _646 || _648;
    float _652 = float(_650);
    float _654 = _630 * _636;
    float _656 = _512 * _640;
    float _658 = fma(_582, _542, (*spvDescriptorSet0.fp_c9)._m0[110].x);
    float _660 = fma(_600, _542, (*spvDescriptorSet0.fp_c9)._m0[110].y);
    float _662 = -_512;
    float _664 = _662 + 1.0;
    float _666 = _548 * _656;
    float _668 = _550 * _656;
    float _670 = -_652;
    float _672 = _670 + 1.0;
    float _674 = _500 * _656;
    float _676 = fma(_664, (*spvDescriptorSet0.fp_c9)._m0[107].x, _666);
    float _678 = fma(_664, (*spvDescriptorSet0.fp_c9)._m0[107].y, _668);
    float _680 = _494 * _672;
    float _682 = fma(_664, (*spvDescriptorSet0.fp_c9)._m0[107].z, _674);
    float _684 = in.m_37.x;
    float _686 = gl_FragCoord.w;
    float _688 = _684 * _686;
    float _690 = in.m_37.y;
    float _692 = gl_FragCoord.w;
    float _694 = _690 * _692;
    float _696 = in.m_37.z;
    float _698 = gl_FragCoord.w;
    float _700 = _696 * _698;
    float _702 = -(*spvDescriptorSet0.fp_c9)._m0[111].x;
    float _704 = (*spvDescriptorSet0.fp_c9)._m0[112].x + _702;
    float _706 = -(*spvDescriptorSet0.fp_c9)._m0[111].y;
    float _708 = (*spvDescriptorSet0.fp_c9)._m0[112].y + _706;
    float _710 = fma(_498, _542, (*spvDescriptorSet0.fp_c9)._m0[110].z);
    float _712 = -(*spvDescriptorSet0.fp_c9)._m0[111].z;
    float _714 = (*spvDescriptorSet0.fp_c9)._m0[112].z + _712;
    float _716 = fma(_704, _592, (*spvDescriptorSet0.fp_c9)._m0[111].x);
    float _718 = fma(_708, _592, (*spvDescriptorSet0.fp_c9)._m0[111].y);
    float _720 = fma(_584, _654, _676);
    float _722 = fma(_714, _592, (*spvDescriptorSet0.fp_c9)._m0[111].z);
    float _724 = fma(_578, _654, _678);
    float _726 = in.m_43.x;
    float _728 = fma(_526, _654, _682);
    bool _730 = _458 >= (*spvDescriptorSet0.fp_c9)._m0[113].w;
    bool _732 = isnan(_458);
    bool _734 = _730 || _732;
    bool _736 = isnan((*spvDescriptorSet0.fp_c9)._m0[113].w);
    bool _738 = _734 || _736;
    float _740 = float(_738);
    float _742 = fma(_586, _632, _720);
    float _744 = fma(_604, _632, _724);
    float _746 = fma(_606, _632, _728);
    float _748 = -(*spvDescriptorSet0.fp_c9)._m0[112].x;
    float _750 = _748 + (*spvDescriptorSet0.fp_c9)._m0[113].x;
    float _752 = -(*spvDescriptorSet0.fp_c9)._m0[112].y;
    float _754 = _752 + (*spvDescriptorSet0.fp_c9)._m0[113].y;
    float _756 = -_740;
    float _758 = _756 + 1.0;
    float _760 = fma(_658, _602, _742);
    float _762 = -(*spvDescriptorSet0.fp_c9)._m0[112].z;
    float _764 = _762 + (*spvDescriptorSet0.fp_c9)._m0[113].z;
    float _766 = fma(_660, _602, _744);
    float _768 = fma(_710, _602, _746);
    float _770 = fma(_750, _568, (*spvDescriptorSet0.fp_c9)._m0[112].x);
    float _772 = fma(_754, _568, (*spvDescriptorSet0.fp_c9)._m0[112].y);
    float _774 = _652 * _758;
    float _776 = fma(_716, _680, _760);
    float _778 = fma(_764, _568, (*spvDescriptorSet0.fp_c9)._m0[112].z);
    float _780 = fma(_718, _680, _766);
    float _782 = fma(_722, _680, _768);
    float _784 = fma(_770, _774, _776);
    float _786 = _67 * _688;
    float _788 = fma(_772, _774, _780);
    float _790 = fma(_778, _774, _782);
    float _792 = _67 * _694;
    float _794 = fma(_740, (*spvDescriptorSet0.fp_c9)._m0[113].x, _784);
    float _796 = _67 * _700;
    float _798 = fma(_740, (*spvDescriptorSet0.fp_c9)._m0[113].y, _788);
    float _800 = fma(_740, (*spvDescriptorSet0.fp_c9)._m0[113].z, _790);
    float _802 = -_786;
    float _804 = _802 + _794;
    float _806 = -_792;
    float _808 = _806 + _798;
    float _810 = -_796;
    float _812 = _810 + _800;
    float _814 = fma(_726, _804, _786);
    float _816 = fma(_726, _808, _792);
    float _818 = fma(_726, _812, _796);
    if (!_131)
    {
        out.m_46.x = _814;
        out.m_46.y = _816;
        out.m_46.z = _818;
        out.m_46.w = _113;
        return out;
    }
    float _820 = 0.0 + _119;
    float _822 = precise::clamp(_820, 0.0, 1.0);
    out.m_46.x = _814;
    out.m_46.y = _816;
    out.m_46.z = _818;
    out.m_46.w = _822;
    return out;
}

