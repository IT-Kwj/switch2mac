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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texturecube<float> fp_t_tcb_1E [[id(7)]];
    sampler fp_t_tcb_1ESmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_1ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_55 [[color(0)]];
};

struct main0_in
{
    float4 m_52 [[user(locn0)]];
    float4 m_42 [[user(locn1)]];
    float4 m_40 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_44 [[user(locn5)]];
    float4 m_50 [[user(locn7)]];
    float4 m_46 [[user(locn8)]];
    float4 m_48 [[user(locn9)]];
    float4 m_61 [[user(locn10)]];
    float4 m_57 [[user(locn11)]];
    float4 m_63 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _72 = gl_FragCoord.w;
    float _74 = in.m_40.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_40.y;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = 1.0 / _72;
    float _88 = _86 * _78;
    float _90 = _86 * _84;
    float2 _687 = float2(_88, _90);
    float2 _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_687, float2(0.0), isnan(_687))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_687, float2(0.0), isnan(_687))).xw;
    float _96 = _94.x;
    float _98 = _94.y;
    float _100 = in.m_42.w;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_44.x;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = _86 * _104;
    float _114 = in.m_40.w;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = _86 * _118;
    bool _124 = _98 >= _112;
    bool _126 = isnan(_98);
    bool _128 = _124 || _126;
    bool _130 = isnan(_112);
    bool _132 = _128 || _130;
    float _134 = float(_132);
    float _136 = _86 * _110;
    float _138 = 0.0 + _134;
    float _140 = precise::clamp(_138, 0.0, 1.0);
    float _142 = _140 * _136;
    bool _144 = _142 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _146 = isnan(_142);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _152 = _148 || _150;
    float _154 = in.m_40.z;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    if (!_152)
    {
        discard_fragment();
    }
    float _160 = _86 * _158;
    float2 _787 = float2(_160, _120);
    float2 _162 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_787, float2(0.0), isnan(_787))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_787, float2(0.0), isnan(_787))).xy;
    float _164 = _162.x;
    float _166 = _162.y;
    float _168 = in.m_46.y;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = in.m_46.x;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = in.m_46.z;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    float _186 = in.m_48.y;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = in.m_48.x;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    float _198 = in.m_50.y;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = in.m_48.z;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = in.m_50.x;
    float _212 = gl_FragCoord.w;
    float _214 = _210 * _212;
    float _216 = in.m_50.z;
    float _218 = gl_FragCoord.w;
    float _220 = _216 * _218;
    float _222 = in.m_52.y;
    float _224 = gl_FragCoord.w;
    float _226 = _222 * _224;
    float _228 = in.m_52.z;
    float _230 = gl_FragCoord.w;
    float _232 = _228 * _230;
    float _234 = _86 * _172;
    float _236 = _86 * _178;
    float _238 = _86 * _184;
    float _240 = _86 * _190;
    float _242 = _234 * _234;
    float _244 = _240 * _240;
    float _246 = fma(_236, _236, _242);
    float _248 = _86 * _208;
    float _250 = _86 * _214;
    float _252 = fma(_238, _238, _246);
    float _254 = _86 * _196;
    float _256 = _86 * _202;
    float _258 = rsqrt(_252);
    float _260 = fma(_254, _254, _244);
    float _262 = _256 * _256;
    float _264 = _86 * _220;
    float _266 = in.m_42.z;
    float _268 = gl_FragCoord.w;
    float _270 = _266 * _268;
    float _272 = fma(_248, _248, _260);
    float _274 = fma(_250, _250, _262);
    float _276 = in.m_52.x;
    float _278 = gl_FragCoord.w;
    float _280 = _276 * _278;
    float _282 = fma(_264, _264, _274);
    float _284 = rsqrt(_272);
    float _286 = _234 * _258;
    float _288 = _236 * _258;
    float _290 = _238 * _258;
    float _292 = rsqrt(_282);
    float _294 = _286 * _286;
    float _296 = fma(_288, _288, _294);
    float _298 = fma(_290, _290, _296);
    float _300 = rsqrt(_298);
    float _302 = _264 * _292;
    float _304 = _166 * _166;
    float _306 = _292 * _166;
    float _308 = _164 * _284;
    float _310 = _166 * _302;
    float _312 = fma(_164, _164, _304);
    float _314 = precise::clamp(_312, 0.0, 1.0);
    float _316 = _256 * _306;
    float _318 = _250 * _306;
    float _320 = fma(_248, _308, _310);
    float _322 = -_314;
    float _324 = _322 + 1.0;
    float _326 = fma(_240, _308, _316);
    float _328 = fma(_254, _308, _318);
    float _330 = in.m_42.x;
    float _332 = gl_FragCoord.w;
    float _334 = _330 * _332;
    float _336 = sqrt(_324);
    float _338 = in.m_42.y;
    float _340 = gl_FragCoord.w;
    float _342 = _338 * _340;
    float _344 = _86 * _232;
    float _346 = _300 * _336;
    float _348 = fma(_286, _346, _326);
    float _350 = fma(_288, _346, _328);
    float _352 = fma(_290, _346, _320);
    float _354 = _348 * _348;
    float _356 = fma(_350, _350, _354);
    float _358 = fma(_352, _352, _356);
    float _360 = rsqrt(_358);
    float _362 = (*spvDescriptorSet0.fp_c8)._m0[28].y * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _364 = fma((*spvDescriptorSet0.fp_c8)._m0[28].x, (*spvDescriptorSet0.fp_c8)._m0[28].x, _362);
    float _366 = _86 * _334;
    float _368 = _86 * _270;
    float _370 = fma((*spvDescriptorSet0.fp_c8)._m0[28].z, (*spvDescriptorSet0.fp_c8)._m0[28].z, _364);
    float _372 = -_368;
    float _374 = _372 + _344;
    float _376 = rsqrt(_370);
    float _378 = _348 * _360;
    float _380 = _352 * _360;
    float _382 = _86 * _280;
    float _384 = _86 * _226;
    float _386 = _378 * (-0.816474258899688720703125);
    float _388 = -_366;
    float _390 = _388 + _382;
    float _392 = -_386;
    float _394 = fma(_380, 0.577381789684295654296875, _392);
    float _396 = _86 * _342;
    float _398 = fma(_394, 0.5, 0.5);
    float _400 = -_396;
    float _402 = _400 + _384;
    float _404 = _398 * _398;
    float _406 = fma(_404, _390, _366);
    float _408 = fma(_404, _402, _396);
    float _410 = fma(_404, _374, _368);
    if (!_152)
    {
        out.m_55.x = _406;
        out.m_55.y = _408;
        out.m_55.z = _410;
        out.m_55.w = _134;
        return out;
    }
    float _412 = in.m_57.x;
    float _414 = gl_FragCoord.w;
    float _416 = _412 * _414;
    float _418 = _376 * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _420 = _350 * _360;
    float _422 = -_404;
    float _424 = _422 + 1.0;
    float _426 = _378 * _418;
    float _428 = _376 * (*spvDescriptorSet0.fp_c8)._m0[28].x;
    float _430 = _376 * (*spvDescriptorSet0.fp_c8)._m0[28].z;
    float _432 = abs(_288);
    float _434 = abs(_286);
    float _436 = precise::max(_432, _434);
    float _438 = fma(_420, _428, _426);
    float _440 = abs(_290);
    float _442 = precise::max(_440, _436);
    float _444 = fma(_380, _430, _438);
    float _446 = -_96;
    float _448 = _446 + 1.0;
    float _450 = -_424;
    float _452 = fma(_450, (*spvDescriptorSet0.fp_c9)._m0[191].y, 1.0);
    float _454 = fma(_444, -0.5, 0.5);
    float _456 = 1.0 / _442;
    float _458 = fma(_454, (*spvDescriptorSet0.fp_c9)._m0[191].z, _452);
    float _460 = precise::clamp(_458, 0.0, 1.0);
    float _462 = -_460;
    float _464 = _462 + 1.0;
    float _466 = fma(_448, (*spvDescriptorSet0.fp_c9)._m0[191].x, _464);
    float _468 = precise::clamp(_466, 0.0, 1.0);
    float _470 = _86 * _416;
    float _472 = _288 * _456;
    float _474 = _468 + _470;
    float _476 = _286 * _456;
    float _478 = -_456;
    float _480 = _290 * _478;
    float _482 = precise::min(_474, 1.0);
    float3 _1267 = float3(_472, _476, _480);
    float3 _486 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1267, float3(0.0), isnan(_1267)), level(_482)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1267, float3(0.0), isnan(_1267)), level(_482)).xyz;
    float _488 = _486.x;
    float _490 = _486.y;
    float _492 = _486.z;
    float _494 = in.m_59.x;
    float _496 = gl_FragCoord.w;
    float _498 = _494 * _496;
    float _500 = in.m_59.y;
    float _502 = gl_FragCoord.w;
    float _504 = _500 * _502;
    float _506 = in.m_59.z;
    float _508 = gl_FragCoord.w;
    float _510 = _506 * _508;
    float _512 = in.m_61.z;
    float _514 = gl_FragCoord.w;
    float _516 = _512 * _514;
    float _518 = in.m_61.x;
    float _520 = gl_FragCoord.w;
    float _522 = _518 * _520;
    float _524 = in.m_61.y;
    float _526 = gl_FragCoord.w;
    float _528 = _524 * _526;
    float _530 = in.m_63.x;
    float _532 = gl_FragCoord.w;
    float _534 = _530 * _532;
    float _536 = in.m_63.w;
    float _538 = gl_FragCoord.w;
    float _540 = _536 * _538;
    float _542 = in.m_63.y;
    float _544 = gl_FragCoord.w;
    float _546 = _542 * _544;
    float _548 = in.m_63.z;
    float _550 = gl_FragCoord.w;
    float _552 = _548 * _550;
    bool _554 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _556 = _86 * _498;
    float _558 = _86 * _504;
    float _560 = _86 * _510;
    float _562 = fma(_492, 0.20999999344348907470703125, _560);
    float _564 = fma(_488, 0.20999999344348907470703125, _556);
    float _566 = fma(_490, 0.20999999344348907470703125, _558);
    float _568 = _86 * _516;
    float _570 = _86 * _522;
    float _572 = _86 * _528;
    float _574 = _562 + _568;
    float _576 = _564 + _570;
    float _578 = _566 + _572;
    float _580 = 0.0 + _142;
    float _582 = precise::clamp(_580, 0.0, 1.0);
    float _584 = _410 * _574;
    float _586 = _406 * _576;
    float _588 = _408 * _578;
    float _590 = _86 * _534;
    float _592 = _86 * _540;
    float _594 = _86 * _546;
    float _596 = _86 * _552;
    float _598 = fma(_586, _592, _590);
    float _600 = fma(_588, _592, _594);
    float _602 = fma(_584, _592, _596);
    float _604 = _590;
    if (!_554)
    {
        _604 = _582;
    }
    float _606 = _604;
    bool _608 = !_554;
    float _610 = _606;
    if (!_608)
    {
        float _612 = in.m_65.w;
        float _614 = gl_FragCoord.w;
        float _616 = _612 * _614;
        float _618 = in.m_65.z;
        float _620 = gl_FragCoord.w;
        float _622 = _618 * _620;
        float _624 = _86 * _616;
        float _626 = _86 * _622;
        float _628 = 1.0 / _624;
        float _630 = _626 * _628;
        float _632 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _634 = fma(_630, (*spvDescriptorSet0.fp_c8)._m0[30].w, _632);
        float _636 = 1.0 / _634;
        float _638 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _640 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _642 = fma(_636, _638, _640);
        float _644 = _642 * 8.0;
        float _646 = precise::clamp(_644, 0.0, 1.0);
        float _648 = _582 * _646;
        _610 = _648;
    }
    float _650 = _610;
    float _652 = 0.0 + _650;
    float _654 = precise::clamp(_652, 0.0, 1.0);
    out.m_55.x = _598;
    out.m_55.y = _600;
    out.m_55.z = _602;
    out.m_55.w = _654;
    return out;
}

