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
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texturecube<float> fp_t_tcb_1E [[id(7)]];
    sampler fp_t_tcb_1ESmplr [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_1ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_57 [[color(0)]];
};

struct main0_in
{
    float4 m_50 [[user(locn0)]];
    float4 m_52 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_54 [[user(locn5)]];
    float4 m_40 [[user(locn6)]];
    float4 m_44 [[user(locn7)]];
    float4 m_42 [[user(locn8), flat]];
    float4 m_48 [[user(locn9)]];
    float4 m_63 [[user(locn10)]];
    float4 m_59 [[user(locn11)]];
    float4 m_65 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _74 = gl_FragCoord.w;
    float _76 = in.m_40.z;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_40.w;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = 1.0 / _74;
    float _90 = _88 * _80;
    float _92 = _88 * _86;
    float2 _643 = float2(_90, _92);
    float _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_643, float2(0.0), isnan(_643))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_643, float2(0.0), isnan(_643))).w;
    float _96 = in.m_42.x;
    float _98 = in.m_40.y;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_42.y;
    float _106 = in.m_44.y;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_40.x;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = _88 * _102;
    float _120 = -_96;
    float _122 = _120 + _104;
    float _124 = _88 * _110;
    float _126 = 0.0 + _118;
    float _128 = precise::clamp(_126, 0.0, 1.0);
    float _130 = 1.0 / _122;
    float _132 = precise::max(_96, _124);
    float _134 = precise::max(_96, _128);
    float _136 = precise::min(_104, _132);
    float _138 = precise::min(_104, _134);
    float _140 = -_96;
    float _142 = _140 + _136;
    float _144 = -_96;
    float _146 = _144 + _138;
    float _148 = _142 * _130;
    float _150 = _146 * _130;
    float _152 = _148 * _148;
    float _154 = sqrt(_150);
    float _156 = _152 * _152;
    float _158 = -_156;
    float _160 = fma(_158, _156, 1.0);
    float _162 = _88 * _116;
    float _164 = 0.0 + _162;
    float _166 = precise::clamp(_164, 0.0, 1.0);
    float _168 = _94 * 0.3499999940395355224609375;
    float _170 = _168 * _160;
    float _172 = fma(_170, _154, _150);
    float2 _757 = float2(_166, _172);
    float _174 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_757, float2(0.0), isnan(_757))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_757, float2(0.0), isnan(_757))).w;
    float _176 = in.m_46.y;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = in.m_46.x;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = in.m_46.z;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = in.m_48.y;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = in.m_48.x;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = in.m_48.z;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = in.m_50.w;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = in.m_52.w;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    bool _226 = _124 >= _96;
    bool _228 = isnan(_124);
    bool _230 = _226 || _228;
    bool _232 = isnan(_96);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    float _238 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _240 = _238 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _242 = _88 * _180;
    float _244 = _88 * _186;
    float _246 = _88 * _192;
    float _248 = _242 * _242;
    float _250 = _88 * _198;
    float _252 = _88 * _216;
    float _254 = fma(_244, _244, _248);
    float _256 = fma(_246, _246, _254);
    float _258 = rsqrt(_256);
    float _260 = _242 * _258;
    float _262 = _88 * _204;
    float _264 = _244 * _258;
    float _266 = 1.0 / _240;
    float _268 = _250 * _260;
    float _270 = _246 * _258;
    float _272 = fma(_262, _264, _268);
    float _274 = _88 * _210;
    float _276 = in.m_54.x;
    float _278 = gl_FragCoord.w;
    float _280 = _276 * _278;
    float _282 = fma(_274, _270, _272);
    float _284 = abs(_282);
    float _286 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _288 = _284 + _286;
    float _290 = _288 * _266;
    float _292 = precise::clamp(_290, 0.0, 1.0);
    float _294 = fma(_292, -2.0, 3.0);
    float _296 = _292 * _292;
    float _298 = _294 * _296;
    float _300 = _88 * _280;
    float _302 = in.m_52.y;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = in.m_50.y;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = in.m_50.z;
    float _316 = gl_FragCoord.w;
    float _318 = _314 * _316;
    float _320 = _88 * _312;
    float _322 = _174 * _236;
    float _324 = _252 * _322;
    float _326 = _88 * _222;
    float _328 = _326 * _324;
    float _330 = 0.0 + _328;
    float _332 = precise::clamp(_330, 0.0, 1.0);
    float _334 = _332 * _298;
    float _336 = _334 * _300;
    bool _338 = _336 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _340 = isnan(_336);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _346 = _342 || _344;
    float _348 = in.m_52.x;
    float _350 = gl_FragCoord.w;
    float _352 = _348 * _350;
    float _354 = in.m_50.x;
    float _356 = gl_FragCoord.w;
    float _358 = _354 * _356;
    float _360 = in.m_52.z;
    float _362 = gl_FragCoord.w;
    float _364 = _360 * _362;
    if (!_346)
    {
        discard_fragment();
    }
    float _366 = _88 * _352;
    float _368 = _88 * _306;
    float _370 = _88 * _358;
    float _372 = _88 * _364;
    float _374 = _88 * _318;
    float _376 = _94 * _174;
    float _378 = -_366;
    float _380 = _378 + _370;
    float _382 = -_368;
    float _384 = _382 + _320;
    float _386 = -_372;
    float _388 = _386 + _374;
    float _390 = fma(_376, _380, _366);
    float _392 = fma(_376, _384, _368);
    float _394 = fma(_376, _388, _372);
    if (!_346)
    {
        out.m_57.x = _390;
        out.m_57.y = _392;
        out.m_57.z = _394;
        out.m_57.w = _328;
        return out;
    }
    float _396 = _250 * _250;
    float _398 = fma(_262, _262, _396);
    float _400 = in.m_59.x;
    float _402 = gl_FragCoord.w;
    float _404 = _400 * _402;
    float _406 = fma(_274, _274, _398);
    float _408 = rsqrt(_406);
    float _410 = _262 * _408;
    float _412 = _250 * _408;
    float _414 = _274 * _408;
    float _416 = abs(_410);
    float _418 = abs(_412);
    float _420 = precise::max(_416, _418);
    float _422 = _88 * _404;
    float _424 = abs(_414);
    float _426 = precise::max(_424, _420);
    float _428 = 1.0 / _426;
    float _430 = _410 * _428;
    float _432 = -_428;
    float _434 = _414 * _432;
    float _436 = precise::min(_422, 1.0);
    float _438 = _412 * _428;
    float3 _1139 = float3(_430, _438, _434);
    float3 _442 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1139, float3(0.0), isnan(_1139)), level(_436)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1139, float3(0.0), isnan(_1139)), level(_436)).xyz;
    float _444 = _442.x;
    float _446 = _442.y;
    float _448 = _442.z;
    float _450 = in.m_61.y;
    float _452 = gl_FragCoord.w;
    float _454 = _450 * _452;
    float _456 = in.m_61.z;
    float _458 = gl_FragCoord.w;
    float _460 = _456 * _458;
    float _462 = in.m_61.x;
    float _464 = gl_FragCoord.w;
    float _466 = _462 * _464;
    float _468 = in.m_63.z;
    float _470 = gl_FragCoord.w;
    float _472 = _468 * _470;
    float _474 = in.m_63.x;
    float _476 = gl_FragCoord.w;
    float _478 = _474 * _476;
    float _480 = in.m_63.y;
    float _482 = gl_FragCoord.w;
    float _484 = _480 * _482;
    float _486 = in.m_65.x;
    float _488 = gl_FragCoord.w;
    float _490 = _486 * _488;
    float _492 = in.m_65.w;
    float _494 = gl_FragCoord.w;
    float _496 = _492 * _494;
    float _498 = in.m_65.y;
    float _500 = gl_FragCoord.w;
    float _502 = _498 * _500;
    float _504 = in.m_65.z;
    float _506 = gl_FragCoord.w;
    float _508 = _504 * _506;
    float _510 = 0.0 + _336;
    float _512 = precise::clamp(_510, 0.0, 1.0);
    float _514 = _88 * _454;
    float _516 = _88 * _460;
    float _518 = _88 * _466;
    bool _520 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _522 = fma(_448, 0.20999999344348907470703125, _516);
    float _524 = fma(_444, 0.20999999344348907470703125, _518);
    float _526 = _88 * _472;
    float _528 = fma(_446, 0.20999999344348907470703125, _514);
    float _530 = _88 * _478;
    float _532 = _88 * _484;
    float _534 = _522 + _526;
    float _536 = _524 + _530;
    float _538 = _528 + _532;
    float _540 = _394 * _534;
    float _542 = _88 * _490;
    float _544 = _390 * _536;
    float _546 = _88 * _496;
    float _548 = _392 * _538;
    float _550 = _88 * _502;
    float _552 = _88 * _508;
    float _554 = fma(_544, _546, _542);
    float _556 = _542;
    if (!_520)
    {
        _556 = _512;
    }
    float _558 = _556;
    float _560 = fma(_548, _546, _550);
    float _562 = fma(_540, _546, _552);
    bool _564 = !_520;
    float _566 = _558;
    if (!_564)
    {
        float _568 = in.m_67.w;
        float _570 = gl_FragCoord.w;
        float _572 = _568 * _570;
        float _574 = in.m_67.z;
        float _576 = gl_FragCoord.w;
        float _578 = _574 * _576;
        float _580 = _88 * _572;
        float _582 = _88 * _578;
        float _584 = 1.0 / _580;
        float _586 = _582 * _584;
        float _588 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _590 = fma(_586, (*spvDescriptorSet0.fp_c8)._m0[30].w, _588);
        float _592 = 1.0 / _590;
        float _594 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _596 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _598 = fma(_592, _594, _596);
        float _600 = _598 * 8.0;
        float _602 = precise::clamp(_600, 0.0, 1.0);
        float _604 = _512 * _602;
        _566 = _604;
    }
    float _606 = _566;
    float _608 = 0.0 + _606;
    float _610 = precise::clamp(_608, 0.0, 1.0);
    out.m_57.x = _554;
    out.m_57.y = _560;
    out.m_57.z = _562;
    out.m_57.w = _610;
    return out;
}

