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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c10 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_36 [[id(4)]];
    sampler fp_t_tcb_36Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_8 [[id(8)]];
    sampler fp_t_tcb_8Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    texture2d<float> fp_t_tcb_C [[id(12)]];
    sampler fp_t_tcb_CSmplr [[id(13)]];
    texturecube<float> fp_t_tcb_1E [[id(14)]];
    sampler fp_t_tcb_1ESmplr [[id(15)]];
    sampler fp_t_tcb_36Smplr_w [[id(16)]];
    sampler fp_t_tcb_10Smplr_w [[id(17)]];
    sampler fp_t_tcb_8Smplr_w [[id(18)]];
    sampler fp_t_tcb_ASmplr_w [[id(19)]];
    sampler fp_t_tcb_CSmplr_w [[id(20)]];
    sampler fp_t_tcb_1ESmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_65 [[color(0)]];
};

struct main0_in
{
    float4 m_54 [[user(locn0)]];
    float4 m_56 [[user(locn1)]];
    float4 m_73 [[user(locn2)]];
    float4 m_71 [[user(locn3), flat]];
    float4 m_60 [[user(locn4)]];
    float4 m_48 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_62 [[user(locn7)]];
    float4 m_52 [[user(locn8)]];
    float4 m_67 [[user(locn9)]];
    float4 m_77 [[user(locn10)]];
    float4 m_50 [[user(locn11)]];
    float4 m_58 [[user(locn12)]];
    float4 m_75 [[user(locn13)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _84 = gl_FragCoord.w;
    float _86 = in.m_48.x;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_48.y;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_50.w;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_50.x;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_52.x;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_50.y;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_52.y;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = 1.0 / _84;
    float _130 = _128 * _90;
    float _132 = _128 * _96;
    float _134 = _128 * _102;
    float _136 = _128 * _108;
    float _138 = _128 * _114;
    float _140 = _128 * _120;
    float _142 = 1.0 / _134;
    float2 _712 = float2(_130, _132);
    float2 _146 = dm_bs(spvDescriptorSet0.fp_t_tcb_36.sample(spvDescriptorSet0.fp_t_tcb_36Smplr, select(_712, float2(0.0), isnan(_712))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_36, spvDescriptorSet0.fp_t_tcb_36Smplr_w, select(_712, float2(0.0), isnan(_712))).xy;
    float _148 = _146.x;
    float _150 = _146.y;
    float _152 = _128 * _126;
    float _154 = _136 * _142;
    float _156 = _140 * _142;
    float2 _736 = float2(_154, _156);
    float _158 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_736, float2(0.0), isnan(_736))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_736, float2(0.0), isnan(_736))).x;
    float2 _744 = float2(_138, _152);
    float _160 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_744, float2(0.0), isnan(_744))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_744, float2(0.0), isnan(_744))).w;
    float _162 = in.m_52.z;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_52.w;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = _128 * _166;
    float _176 = _128 * _172;
    float _178 = fma(_148, 0.100000001490116119384765625, _174);
    float _180 = fma(_150, 0.100000001490116119384765625, _176);
    float2 _781 = float2(_178, _180);
    float _182 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_781, float2(0.0), isnan(_781))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_781, float2(0.0), isnan(_781))).w;
    float _184 = in.m_50.z;
    float _186 = gl_FragCoord.w;
    float _188 = _184 * _186;
    float _190 = in.m_54.w;
    float _192 = gl_FragCoord.w;
    float _194 = _190 * _192;
    float _196 = in.m_56.w;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    float _202 = _128 * _188;
    float _204 = _128 * _194;
    float _206 = in.m_58.x;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = _202 * _142;
    float _214 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _216 = fma(_212, (*spvDescriptorSet0.fp_c8)._m0[30].w, _214);
    float _218 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _220 = fma(_158, (*spvDescriptorSet0.fp_c8)._m0[30].w, _218);
    float _222 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _224 = 1.0 / _216;
    float _226 = 1.0 / _220;
    float _228 = -_204;
    float _230 = fma(_160, _182, _228);
    float _232 = _128 * _200;
    float _234 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _236 = _224 * _234;
    float _238 = _128 * _210;
    float _240 = _230 * _232;
    float _242 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _244 = -_236;
    float _246 = fma(_226, _242, _244);
    float _248 = 0.0 + _240;
    float _250 = precise::clamp(_248, 0.0, 1.0);
    float _252 = _246 * _222;
    float _254 = precise::clamp(_252, 0.0, 1.0);
    float _256 = _250 * _254;
    float _258 = _256 * _238;
    bool _262 = _258 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _264 = isnan(_258);
    bool _266 = _262 || _264;
    bool _268 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _270 = _266 || _268;
    float _272 = in.m_60.x;
    float _274 = gl_FragCoord.w;
    float _276 = _272 * _274;
    float _278 = in.m_60.y;
    float _280 = gl_FragCoord.w;
    float _282 = _278 * _280;
    float _284 = _236;
    if (!_270)
    {
        discard_fragment();
    }
    float _286 = _128 * _276;
    float _288 = _128 * _282;
    float2 _938 = float2(_286, _288);
    float2 _290 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_938, float2(0.0), isnan(_938))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_938, float2(0.0), isnan(_938))).xy;
    float _292 = _290.x;
    float _294 = _290.y;
    float _296 = in.m_62.y;
    float _298 = gl_FragCoord.w;
    float _300 = _296 * _298;
    float _302 = in.m_62.x;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = in.m_62.z;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = _128 * _300;
    float _316 = _128 * _306;
    float _318 = _128 * _312;
    float _320 = _314 * _314;
    float _322 = fma(_316, _316, _320);
    float _324 = fma(_318, _318, _322);
    float _326 = rsqrt(_324);
    float _328 = _316 * _326;
    float _330 = _314 * _326;
    float _332 = _318 * _326;
    if (!_270)
    {
        out.m_65.x = 0.0500000007450580596923828125;
        out.m_65.y = 0.0;
        out.m_65.z = 0.0;
        out.m_65.w = _240;
        return out;
    }
    float _334 = abs(_328);
    float _336 = abs(_330);
    float _338 = precise::max(_334, _336);
    float _340 = abs(_332);
    float _342 = precise::max(_340, _338);
    float _344 = 1.0 / _342;
    float _346 = -_344;
    float _348 = _332 * _346;
    float _350 = _328 * _344;
    float _352 = _330 * _344;
    float3 _1040 = float3(_350, _352, _348);
    float _354 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1040, float3(0.0), isnan(_1040)), level(0.0)), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1040, float3(0.0), isnan(_1040)), level(0.0)).x;
    float _356 = in.m_67.y;
    float _358 = gl_FragCoord.w;
    float _360 = _356 * _358;
    float _362 = in.m_67.x;
    float _364 = gl_FragCoord.w;
    float _366 = _362 * _364;
    float _368 = in.m_67.z;
    float _370 = gl_FragCoord.w;
    float _372 = _368 * _370;
    float _374 = in.m_69.y;
    float _376 = gl_FragCoord.w;
    float _378 = _374 * _376;
    float _380 = in.m_69.x;
    float _382 = gl_FragCoord.w;
    float _384 = _380 * _382;
    float _386 = in.m_69.z;
    float _388 = gl_FragCoord.w;
    float _390 = _386 * _388;
    float _392 = in.m_71.y;
    float _394 = in.m_71.x;
    float _396 = in.m_71.z;
    float _398 = _330 * _330;
    float _400 = fma(_328, _328, _398);
    float _402 = fma(_332, _332, _400);
    float _404 = rsqrt(_402);
    float _406 = _128 * _360;
    float _408 = _128 * _366;
    float _410 = _128 * _372;
    float _412 = _128 * _378;
    float _414 = _406 * _406;
    float _416 = _294 * _294;
    float _418 = _128 * _384;
    float _420 = fma(_408, _408, _414);
    float _422 = _412 * _412;
    float _424 = fma(_292, _292, _416);
    float _426 = precise::clamp(_424, 0.0, 1.0);
    float _428 = -_396;
    float _430 = _428 + (*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _432 = fma(_410, _410, _420);
    float _434 = _128 * _390;
    float _436 = fma(_418, _418, _422);
    float _438 = -_426;
    float _440 = _438 + 1.0;
    float _442 = -_392;
    float _444 = _442 + (*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _446 = rsqrt(_432);
    float _448 = fma(_434, _434, _436);
    float _450 = -_394;
    float _452 = _450 + (*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _454 = rsqrt(_448);
    float _456 = _444 * _444;
    float _458 = fma(_452, _452, _456);
    float _460 = sqrt(_440);
    float _462 = fma(_430, _430, _458);
    float _464 = _292 * _446;
    float _466 = rsqrt(_462);
    float _468 = _294 * _454;
    float _470 = _434 * _454;
    float _472 = in.m_73.x;
    float _474 = gl_FragCoord.w;
    float _476 = _472 * _474;
    float _478 = _412 * _468;
    float _480 = _418 * _468;
    float _482 = _404 * _460;
    float _484 = fma(_406, _464, _478);
    float _486 = _294 * _470;
    float _488 = fma(_408, _464, _480);
    float _490 = fma(_330, _482, _484);
    float _492 = fma(_410, _464, _486);
    float _494 = fma(_328, _482, _488);
    float _496 = _444 * _466;
    float _498 = _452 * _466;
    float _500 = _498 * 0.5;
    float _502 = _430 * _466;
    float _504 = _502 * 0.5;
    float _506 = fma(_332, _482, _492);
    float _508 = fma(_496, 0.5, -0.5);
    float _510 = in.m_75.w;
    float _512 = gl_FragCoord.w;
    float _514 = _510 * _512;
    float _516 = in.m_75.y;
    float _518 = gl_FragCoord.w;
    float _520 = _516 * _518;
    float _522 = in.m_77.x;
    float _524 = gl_FragCoord.w;
    float _526 = _522 * _524;
    float _528 = _490 * _508;
    float _530 = fma(_494, _500, _528);
    float _532 = in.m_75.z;
    float _534 = gl_FragCoord.w;
    float _536 = _532 * _534;
    float _538 = fma(_506, _504, _530);
    float _540 = in.m_75.x;
    float _542 = gl_FragCoord.w;
    float _544 = _540 * _542;
    float _546 = fma(_538, 0.5, 0.5);
    float _548 = _128 * _476;
    float _550 = _546 * _546;
    float _552 = _550 * (*spvDescriptorSet0.fp_c9)._m0[106].x;
    float _554 = (*spvDescriptorSet0.fp_c9)._m0[106].x + (-0.0500000007450580596923828125);
    float _556 = _552 * 0.0500000007450580596923828125;
    float _558 = fma(_550, _554, 0.0500000007450580596923828125);
    float _560 = _552 * 0.014999999664723873138427734375;
    float _562 = _556 * 0.715200006961822509765625;
    float _564 = _128 * _514;
    float _566 = fma(_558, 0.2125999927520751953125, _562);
    float _568 = fma(_560, 0.072200000286102294921875, _566);
    float _570 = 1.0 / _568;
    bool _572 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _574 = _128 * _536;
    float _576 = _558;
    if (_572)
    {
        float _578 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _580 = _236 + _578;
        _284 = _580;
    }
    float _582 = _284;
    float _584 = _570 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _586 = precise::clamp(_584, 0.0, 1.0);
    float _588 = fma(_586, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _590 = _128 * _520;
    float _592 = _588 * _564;
    float _594 = _558 * _588;
    if (_572)
    {
        float _596 = _582 * 8.0;
        float _598 = precise::clamp(_596, 0.0, 1.0);
        _576 = _598;
    }
    float _600 = _576;
    float _602 = fma(_556, _592, _590);
    float _604 = _128 * _526;
    float _606 = fma(_560, _592, _574);
    float _608 = 0.0 + _258;
    float _610 = precise::clamp(_608, 0.0, 1.0);
    float _612 = _128 * _544;
    float _614 = _610;
    if (_572)
    {
        float _616 = _610 * _600;
        _614 = _616;
    }
    float _618 = _614;
    float _620 = 0.0 + _618;
    float _622 = precise::clamp(_620, 0.0, 1.0);
    float _624 = fma(_354, 0.20999999344348907470703125, _548);
    float _626 = _624 + _604;
    float _628 = fma(_626, 0.0500000007450580596923828125, _594);
    float _630 = fma(_628, _564, _612);
    out.m_65.x = _630;
    out.m_65.y = _602;
    out.m_65.z = _606;
    out.m_65.w = _622;
    return out;
}

