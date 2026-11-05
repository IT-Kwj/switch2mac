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
    constant _16* fp_c13 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texturecube<float> fp_t_tcb_1E [[id(8)]];
    sampler fp_t_tcb_1ESmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    sampler fp_t_tcb_1ESmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_55 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_63 [[user(locn3), flat]];
    float4 m_71 [[user(locn4)]];
    float4 m_57 [[user(locn5)]];
    float4 m_46 [[user(locn6)]];
    float4 m_61 [[user(locn7)]];
    float4 m_42 [[user(locn8)]];
    float4 m_67 [[user(locn9)]];
    float4 m_59 [[user(locn10)]];
    float4 m_52 [[user(locn11)]];
    float4 m_50 [[user(locn12)]];
    float4 m_65 [[user(locn13), flat]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _78 = gl_FragCoord.w;
    float _80 = in.m_42.x;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_42.y;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = 1.0 / _78;
    float _94 = _92 * _84;
    float _96 = _92 * _90;
    float2 _677;
    _677.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_94, _96));
    _677.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_94, _96));
    float _98 = _677.x;
    float _100 = _98 * 256.0;
    int _103 = int(_100);
    float _105 = float(uint(_103));
    float _107 = _105 * 0.00390625;
    float _109 = precise::min(_107, 2.0);
    float2 _697 = float2(_94, _96);
    float4 _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_697, float2(0.0), isnan(_697)), level(_109)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_697, float2(0.0), isnan(_697)), level(_109)).xyzw;
    float _114 = _112.x;
    float _116 = _112.y;
    float _118 = _112.z;
    float _120 = _112.w;
    float _122 = in.m_44.w;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_46.w;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_48.w;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_50.x;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = _92 * _126;
    float _148 = _92 * _132;
    float _150 = _92 * _138;
    float _152 = in.m_52.x;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = in.m_52.y;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = _92 * _156;
    float _166 = -_146;
    float _168 = fma(_120, _148, _166);
    float _170 = _92 * _144;
    float _172 = _150 * _168;
    float _174 = 0.0 + _172;
    float _176 = precise::clamp(_174, 0.0, 1.0);
    float _178 = _176 * _170;
    bool _182 = _178 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _184 = isnan(_178);
    bool _186 = _182 || _184;
    bool _188 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _190 = _186 || _188;
    float _192 = in.m_52.w;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    if (!_190)
    {
        discard_fragment();
    }
    float _198 = _92 * _162;
    float _200 = _92 * _196;
    float _202 = 1.0 / _200;
    float _204 = _164 * _202;
    float _206 = _198 * _202;
    float2 _833 = float2(_204, _206);
    float _208 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_833, float2(0.0), isnan(_833))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_833, float2(0.0), isnan(_833))).x;
    float _210 = in.m_44.x;
    float _212 = gl_FragCoord.w;
    float _214 = _210 * _212;
    float _216 = in.m_44.y;
    float _218 = gl_FragCoord.w;
    float _220 = _216 * _218;
    float _222 = in.m_48.x;
    float _224 = gl_FragCoord.w;
    float _226 = _222 * _224;
    float _228 = in.m_48.y;
    float _230 = gl_FragCoord.w;
    float _232 = _228 * _230;
    float _234 = in.m_44.z;
    float _236 = gl_FragCoord.w;
    float _238 = _234 * _236;
    float _240 = in.m_48.z;
    float _242 = gl_FragCoord.w;
    float _244 = _240 * _242;
    float _246 = in.m_46.x;
    float _248 = gl_FragCoord.w;
    float _250 = _246 * _248;
    float _252 = in.m_46.y;
    float _254 = gl_FragCoord.w;
    float _256 = _252 * _254;
    float _258 = in.m_46.z;
    float _260 = gl_FragCoord.w;
    float _262 = _258 * _260;
    float _264 = _114 * _114;
    float _266 = _116 * _116;
    float _268 = _118 * _118;
    float _270 = _92 * _214;
    float _272 = _92 * _220;
    float _274 = _92 * _226;
    float _276 = _92 * _232;
    float _278 = _92 * _238;
    float _280 = _92 * _244;
    float _282 = -_274;
    float _284 = _270 + _282;
    float _286 = -_276;
    float _288 = _272 + _286;
    float _290 = -_280;
    float _292 = _278 + _290;
    float _294 = fma(_264, _284, _274);
    float _296 = fma(_266, _288, _276);
    float _298 = _92 * _250;
    float _300 = fma(_268, _292, _280);
    float _302 = _92 * _256;
    float _304 = _92 * _262;
    float _306 = _294 * _298;
    float _308 = _296 * _302;
    float _310 = _300 * _304;
    if (!_190)
    {
        out.m_55.x = _306;
        out.m_55.y = _308;
        out.m_55.z = _310;
        out.m_55.w = _172;
        return out;
    }
    float _312 = in.m_57.y;
    float _314 = gl_FragCoord.w;
    float _316 = _312 * _314;
    float _318 = in.m_57.x;
    float _320 = gl_FragCoord.w;
    float _322 = _318 * _320;
    float _324 = in.m_57.z;
    float _326 = gl_FragCoord.w;
    float _328 = _324 * _326;
    float _330 = in.m_59.x;
    float _332 = gl_FragCoord.w;
    float _334 = _330 * _332;
    float _336 = _92 * _316;
    float _338 = _92 * _322;
    float _340 = _92 * _328;
    float _342 = _92 * _334;
    float _344 = _336 * _336;
    float _346 = fma(_338, _338, _344);
    float _348 = precise::min(_342, 1.0);
    float _350 = fma(_340, _340, _346);
    float _352 = rsqrt(_350);
    float _354 = _338 * _352;
    float _356 = _336 * _352;
    float _358 = _340 * _352;
    float _360 = abs(_354);
    float _362 = abs(_356);
    float _364 = precise::max(_360, _362);
    float _366 = abs(_358);
    float _368 = precise::max(_366, _364);
    float _370 = 1.0 / _368;
    float _372 = -_370;
    float _374 = _358 * _372;
    float _376 = _354 * _370;
    float _378 = _356 * _370;
    float3 _1079 = float3(_376, _378, _374);
    float3 _382 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1079, float3(0.0), isnan(_1079)), level(_348)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1079, float3(0.0), isnan(_1079)), level(_348)).xyz;
    float _384 = _382.x;
    float _386 = _382.y;
    float _388 = _382.z;
    float _390 = in.m_61.y;
    float _392 = gl_FragCoord.w;
    float _394 = _390 * _392;
    float _396 = in.m_61.x;
    float _398 = gl_FragCoord.w;
    float _400 = _396 * _398;
    float _402 = in.m_63.y;
    float _404 = in.m_61.z;
    float _406 = gl_FragCoord.w;
    float _408 = _404 * _406;
    float _410 = in.m_63.x;
    float _412 = in.m_52.z;
    float _414 = gl_FragCoord.w;
    float _416 = _412 * _414;
    float _418 = in.m_63.z;
    float _420 = in.m_65.x;
    float _422 = in.m_67.y;
    float _424 = gl_FragCoord.w;
    float _426 = _422 * _424;
    float _428 = in.m_67.z;
    float _430 = gl_FragCoord.w;
    float _432 = _428 * _430;
    float _434 = in.m_69.x;
    float _436 = gl_FragCoord.w;
    float _438 = _434 * _436;
    float _440 = in.m_69.w;
    float _442 = gl_FragCoord.w;
    float _444 = _440 * _442;
    float _446 = in.m_69.y;
    float _448 = gl_FragCoord.w;
    float _450 = _446 * _448;
    float _452 = in.m_69.z;
    float _454 = gl_FragCoord.w;
    float _456 = _452 * _454;
    float _458 = in.m_71.w;
    float _460 = gl_FragCoord.w;
    float _462 = _458 * _460;
    float _464 = _92 * _394;
    float _466 = _92 * _400;
    float _468 = -_402;
    float _470 = _464 + _468;
    float _472 = _92 * _408;
    float _474 = -_410;
    float _476 = _466 + _474;
    float _478 = _92 * _416;
    float _480 = _470 * _470;
    float _482 = -_418;
    float _484 = _472 + _482;
    float _486 = _420 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _488 = _478 * _202;
    float _490 = fma(_476, _476, _480);
    float _492 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _494 = fma(_208, (*spvDescriptorSet0.fp_c8)._m0[30].w, _492);
    float _496 = in.m_71.x;
    float _498 = gl_FragCoord.w;
    float _500 = _496 * _498;
    float _502 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _504 = fma(_488, (*spvDescriptorSet0.fp_c8)._m0[30].w, _502);
    float _506 = fma(_484, _484, _490);
    float _508 = in.m_71.y;
    float _510 = gl_FragCoord.w;
    float _512 = _508 * _510;
    float _514 = in.m_71.z;
    float _516 = gl_FragCoord.w;
    float _518 = _514 * _516;
    float _520 = 1.0 / _494;
    float _522 = -_506;
    float _524 = fma(_486, _486, _522);
    float _526 = in.m_67.x;
    float _528 = gl_FragCoord.w;
    float _530 = _526 * _528;
    float _532 = precise::max(0.0, _524);
    float _534 = 1.0 / _504;
    float _536 = sqrt(_532);
    float _538 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _540 = _534 * _538;
    float _542 = _92 * _500;
    float _544 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _546 = -_540;
    float _548 = fma(_520, _544, _546);
    float _550 = _92 * _438;
    float _552 = _92 * _512;
    float _554 = _92 * _518;
    float _556 = _536 + _548;
    float _558 = _92 * _462;
    float _560 = _92 * _530;
    float _562 = _92 * _426;
    float _564 = _92 * _432;
    float _566 = -_558;
    float _568 = _566 + _556;
    float _570 = _92 * _444;
    float _572 = _568 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    bool _574 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _576 = _92 * _450;
    float _578 = _92 * _456;
    float _580 = _572 * (-1.44269502162933349609375);
    float _582 = exp2(_580);
    float _584 = _540;
    if (_574)
    {
        float _586 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _588 = _540 + _586;
        _584 = _588;
    }
    float _590 = _584;
    float _592 = _590;
    if (_574)
    {
        float _594 = _590 * 8.0;
        float _596 = precise::clamp(_594, 0.0, 1.0);
        _592 = _596;
    }
    float _598 = _592;
    float _600 = -_582;
    float _602 = _600 + 1.0;
    float _604 = precise::clamp(_602, 0.0, 1.0);
    float _606 = _178 * _604;
    float _608 = precise::clamp(_606, 0.0, 1.0);
    float _610 = _608;
    if (_574)
    {
        float _612 = _608 * _598;
        _610 = _612;
    }
    float _614 = _610;
    float _616 = 0.0 + _614;
    float _618 = precise::clamp(_616, 0.0, 1.0);
    float _620 = fma(_384, 0.20999999344348907470703125, _542);
    float _622 = fma(_386, 0.20999999344348907470703125, _552);
    float _624 = fma(_388, 0.20999999344348907470703125, _554);
    float _626 = _620 + _560;
    float _628 = _622 + _562;
    float _630 = _624 + _564;
    float _632 = _306 * _626;
    float _634 = _308 * _628;
    float _636 = _310 * _630;
    float _638 = fma(_632, _570, _550);
    float _640 = fma(_634, _570, _576);
    float _642 = fma(_636, _570, _578);
    out.m_55.x = _638;
    out.m_55.y = _640;
    out.m_55.z = _642;
    out.m_55.w = _618;
    return out;
}

