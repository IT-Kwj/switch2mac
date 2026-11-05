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
    float2 _689 = float2(_88, _90);
    float2 _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_689, float2(0.0), isnan(_689))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_689, float2(0.0), isnan(_689))).xw;
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
    float2 _789 = float2(_160, _120);
    float2 _162 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_789, float2(0.0), isnan(_789))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_789, float2(0.0), isnan(_789))).xy;
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
    float _222 = in.m_52.x;
    float _224 = gl_FragCoord.w;
    float _226 = _222 * _224;
    float _228 = in.m_52.y;
    float _230 = gl_FragCoord.w;
    float _232 = _228 * _230;
    float _234 = in.m_52.z;
    float _236 = gl_FragCoord.w;
    float _238 = _234 * _236;
    float _240 = _86 * _172;
    float _242 = _86 * _178;
    float _244 = _86 * _184;
    float _246 = _240 * _240;
    float _248 = _86 * _196;
    float _250 = _86 * _202;
    float _252 = _86 * _208;
    float _254 = fma(_242, _242, _246);
    float _256 = _86 * _214;
    float _258 = _250 * _250;
    float _260 = fma(_244, _244, _254);
    float _262 = _86 * _190;
    float _264 = _86 * _220;
    float _266 = _262 * _262;
    float _268 = rsqrt(_260);
    float _270 = fma(_248, _248, _266);
    float _272 = fma(_252, _252, _270);
    float _274 = fma(_256, _256, _258);
    float _276 = rsqrt(_272);
    float _278 = fma(_264, _264, _274);
    float _280 = _240 * _268;
    float _282 = _242 * _268;
    float _284 = _244 * _268;
    float _286 = rsqrt(_278);
    float _288 = _280 * _280;
    float _290 = fma(_282, _282, _288);
    float _292 = fma(_284, _284, _290);
    float _294 = rsqrt(_292);
    float _296 = _166 * _166;
    float _298 = _166 * _286;
    float _300 = _276 * _164;
    float _302 = in.m_42.y;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = fma(_164, _164, _296);
    float _310 = precise::clamp(_308, 0.0, 1.0);
    float _312 = _250 * _298;
    float _314 = _256 * _298;
    float _316 = _280 * _294;
    float _318 = -_310;
    float _320 = _318 + 1.0;
    float _322 = fma(_262, _300, _312);
    float _324 = _284 * _294;
    float _326 = _264 * _298;
    float _328 = sqrt(_320);
    float _330 = _282 * _294;
    float _332 = fma(_248, _300, _314);
    float _334 = fma(_252, _300, _326);
    float _336 = in.m_42.z;
    float _338 = gl_FragCoord.w;
    float _340 = _336 * _338;
    float _342 = (*spvDescriptorSet0.fp_c8)._m0[28].y * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _344 = fma(_316, _328, _322);
    float _346 = fma(_330, _328, _332);
    float _348 = fma(_324, _328, _334);
    float _350 = _344 * _344;
    float _352 = in.m_42.x;
    float _354 = gl_FragCoord.w;
    float _356 = _352 * _354;
    float _358 = _86 * _306;
    float _360 = fma(_346, _346, _350);
    float _362 = _86 * _238;
    float _364 = fma(_348, _348, _360);
    float _366 = rsqrt(_364);
    float _368 = fma((*spvDescriptorSet0.fp_c8)._m0[28].x, (*spvDescriptorSet0.fp_c8)._m0[28].x, _342);
    float _370 = fma((*spvDescriptorSet0.fp_c8)._m0[28].z, (*spvDescriptorSet0.fp_c8)._m0[28].z, _368);
    float _372 = rsqrt(_370);
    float _374 = _344 * _366;
    float _376 = _348 * _366;
    float _378 = _86 * _232;
    float _380 = _86 * _356;
    float _382 = _374 * (-0.816474258899688720703125);
    float _384 = -_358;
    float _386 = _384 + _378;
    float _388 = -_382;
    float _390 = fma(_376, 0.577381789684295654296875, _388);
    float _392 = _86 * _226;
    float _394 = fma(_390, 0.5, 0.5);
    float _396 = _86 * _340;
    float _398 = -_380;
    float _400 = _398 + _392;
    float _402 = _394 * _394;
    float _404 = -_396;
    float _406 = _404 + _362;
    float _408 = fma(_402, _400, _380);
    float _410 = fma(_402, _386, _358);
    float _412 = fma(_402, _406, _396);
    if (!_152)
    {
        out.m_55.x = _408;
        out.m_55.y = _410;
        out.m_55.z = _412;
        out.m_55.w = _134;
        return out;
    }
    float _414 = in.m_57.x;
    float _416 = gl_FragCoord.w;
    float _418 = _414 * _416;
    float _420 = _372 * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _422 = _346 * _366;
    float _424 = -_402;
    float _426 = _424 + 1.0;
    float _428 = -_96;
    float _430 = _428 + 1.0;
    float _432 = _374 * _420;
    float _434 = _372 * (*spvDescriptorSet0.fp_c8)._m0[28].x;
    float _436 = _372 * (*spvDescriptorSet0.fp_c8)._m0[28].z;
    float _438 = abs(_330);
    float _440 = abs(_316);
    float _442 = precise::max(_438, _440);
    float _444 = fma(_422, _434, _432);
    float _446 = abs(_324);
    float _448 = precise::max(_446, _442);
    float _450 = fma(_376, _436, _444);
    float _452 = -_426;
    float _454 = fma(_452, (*spvDescriptorSet0.fp_c9)._m0[191].y, 1.0);
    float _456 = fma(_450, -0.5, 0.5);
    float _458 = 1.0 / _448;
    float _460 = fma(_456, (*spvDescriptorSet0.fp_c9)._m0[191].z, _454);
    float _462 = precise::clamp(_460, 0.0, 1.0);
    float _464 = -_462;
    float _466 = _464 + 1.0;
    float _468 = fma(_430, (*spvDescriptorSet0.fp_c9)._m0[191].x, _466);
    float _470 = precise::clamp(_468, 0.0, 1.0);
    float _472 = _86 * _418;
    float _474 = _330 * _458;
    float _476 = _470 + _472;
    float _478 = _316 * _458;
    float _480 = -_458;
    float _482 = _324 * _480;
    float _484 = precise::min(_476, 1.0);
    float3 _1272 = float3(_474, _478, _482);
    float3 _488 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1272, float3(0.0), isnan(_1272)), level(_484)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1272, float3(0.0), isnan(_1272)), level(_484)).xyz;
    float _490 = _488.x;
    float _492 = _488.y;
    float _494 = _488.z;
    float _496 = in.m_59.x;
    float _498 = gl_FragCoord.w;
    float _500 = _496 * _498;
    float _502 = in.m_59.y;
    float _504 = gl_FragCoord.w;
    float _506 = _502 * _504;
    float _508 = in.m_59.z;
    float _510 = gl_FragCoord.w;
    float _512 = _508 * _510;
    float _514 = in.m_61.z;
    float _516 = gl_FragCoord.w;
    float _518 = _514 * _516;
    float _520 = in.m_61.x;
    float _522 = gl_FragCoord.w;
    float _524 = _520 * _522;
    float _526 = in.m_61.y;
    float _528 = gl_FragCoord.w;
    float _530 = _526 * _528;
    float _532 = in.m_63.x;
    float _534 = gl_FragCoord.w;
    float _536 = _532 * _534;
    float _538 = in.m_63.w;
    float _540 = gl_FragCoord.w;
    float _542 = _538 * _540;
    float _544 = in.m_63.y;
    float _546 = gl_FragCoord.w;
    float _548 = _544 * _546;
    float _550 = in.m_63.z;
    float _552 = gl_FragCoord.w;
    float _554 = _550 * _552;
    bool _556 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _558 = _86 * _500;
    float _560 = _86 * _506;
    float _562 = _86 * _512;
    float _564 = fma(_494, 0.20999999344348907470703125, _562);
    float _566 = fma(_490, 0.20999999344348907470703125, _558);
    float _568 = fma(_492, 0.20999999344348907470703125, _560);
    float _570 = _86 * _518;
    float _572 = _86 * _524;
    float _574 = _86 * _530;
    float _576 = _564 + _570;
    float _578 = _566 + _572;
    float _580 = _568 + _574;
    float _582 = 0.0 + _142;
    float _584 = precise::clamp(_582, 0.0, 1.0);
    float _586 = _412 * _576;
    float _588 = _408 * _578;
    float _590 = _410 * _580;
    float _592 = _86 * _536;
    float _594 = _86 * _542;
    float _596 = _86 * _548;
    float _598 = _86 * _554;
    float _600 = fma(_588, _594, _592);
    float _602 = fma(_590, _594, _596);
    float _604 = fma(_586, _594, _598);
    float _606 = _592;
    if (!_556)
    {
        _606 = _584;
    }
    float _608 = _606;
    bool _610 = !_556;
    float _612 = _608;
    if (!_610)
    {
        float _614 = in.m_65.w;
        float _616 = gl_FragCoord.w;
        float _618 = _614 * _616;
        float _620 = in.m_65.z;
        float _622 = gl_FragCoord.w;
        float _624 = _620 * _622;
        float _626 = _86 * _618;
        float _628 = _86 * _624;
        float _630 = 1.0 / _626;
        float _632 = _628 * _630;
        float _634 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _636 = fma(_632, (*spvDescriptorSet0.fp_c8)._m0[30].w, _634);
        float _638 = 1.0 / _636;
        float _640 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _642 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _644 = fma(_638, _640, _642);
        float _646 = _644 * 8.0;
        float _648 = precise::clamp(_646, 0.0, 1.0);
        float _650 = _584 * _648;
        _612 = _650;
    }
    float _652 = _612;
    float _654 = 0.0 + _652;
    float _656 = precise::clamp(_654, 0.0, 1.0);
    out.m_55.x = _600;
    out.m_55.y = _602;
    out.m_55.z = _604;
    out.m_55.w = _656;
    return out;
}

