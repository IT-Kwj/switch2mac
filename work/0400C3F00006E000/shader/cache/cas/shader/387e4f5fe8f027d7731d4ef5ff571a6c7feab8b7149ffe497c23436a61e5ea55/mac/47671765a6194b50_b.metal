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
    texture2d_array<float> fp_t_tcb_8 [[id(4)]];
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
    float4 m_60 [[color(0)]];
};

struct main0_in
{
    float4 m_51 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_66 [[user(locn3), flat]];
    float4 m_72 [[user(locn4)]];
    float4 m_74 [[user(locn5)]];
    float4 m_43 [[user(locn6), flat]];
    float4 m_62 [[user(locn7)]];
    float4 m_47 [[user(locn8)]];
    float4 m_64 [[user(locn9)]];
    float4 m_49 [[user(locn10), flat]];
    float4 m_57 [[user(locn11)]];
    float4 m_55 [[user(locn12)]];
    float4 m_68 [[user(locn13), flat]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _81 = in.m_43.x;
    float _83 = gl_FragCoord.w;
    float _85 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].x;
    float _87 = in.m_47.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_47.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = _81 + 1.0;
    float _101 = 1.0 / _83;
    float _103 = _99 * _85;
    float _105 = floor(_103);
    float _107 = rint(_81);
    float _109 = precise::max(_107, 0.0);
    uint _112 = uint(_109);
    uint _114 = clamp(_112, 0u, 65535u);
    float _116 = _101 * _91;
    float _118 = -_105;
    float _120 = fma(_118, (*spvDescriptorSet0.fp_c9)._m0[22].x, _99);
    float _122 = _101 * _97;
    float _124 = rint(_120);
    float _126 = precise::max(_124, 0.0);
    uint _128 = uint(_126);
    uint _130 = clamp(_128, 0u, 65535u);
    float3 _663 = float3(_116, _122, float(int(_114)));
    float3 _667 = select(_663, float3(0.0), isnan(_663));
    float _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _667.xy, uint(rint(_667.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _667.xy, uint(rint(_667.z))).w;
    float3 _676 = float3(_116, _122, float(int(_130)));
    float3 _678 = select(_676, float3(0.0), isnan(_676));
    float _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _678.xy, uint(rint(_678.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _678.xy, uint(rint(_678.z))).w;
    float _136 = in.m_49.y;
    float _138 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].y;
    float _140 = in.m_51.w;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_53.w;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = _136 * _138;
    float _154 = _152 * _138;
    float _156 = floor(_154);
    float _158 = in.m_55.x;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = _101 * _144;
    float _166 = -_156;
    float _168 = fma(_166, (*spvDescriptorSet0.fp_c9)._m0[22].y, _152);
    float _170 = _101 * _150;
    float _172 = _168 + 9.9999997473787516355514526367188e-05;
    float _174 = floor(_172);
    float _176 = -_174;
    float _178 = _172 + _176;
    float _180 = in.m_57.w;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    float _186 = in.m_57.x;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = _101 * _184;
    float _194 = 1.0 / _192;
    float _196 = -_132;
    float _198 = _196 + _134;
    float _200 = fma(_178, _198, _132);
    float _202 = _200 * _164;
    float _204 = _101 * _162;
    float _206 = _170 * _202;
    float _208 = 0.0 + _206;
    float _210 = precise::clamp(_208, 0.0, 1.0);
    float _212 = _210 * _204;
    bool _216 = _212 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _218 = isnan(_212);
    bool _220 = _216 || _218;
    bool _222 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _224 = _220 || _222;
    if (!_224)
    {
        discard_fragment();
    }
    float _226 = in.m_57.y;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = _101 * _190;
    float _234 = _232 * _194;
    float _236 = _101 * _230;
    float _238 = _236 * _194;
    float2 _826 = float2(_234, _238);
    float _240 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_826, float2(0.0), isnan(_826))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_826, float2(0.0), isnan(_826))).x;
    float _242 = in.m_51.y;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    float _248 = in.m_51.x;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = in.m_51.z;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = _101 * _246;
    float _262 = _101 * _252;
    float _264 = _101 * _258;
    if (!_224)
    {
        out.m_60.x = _262;
        out.m_60.y = _260;
        out.m_60.z = _264;
        out.m_60.w = _206;
        return out;
    }
    float _266 = in.m_62.y;
    float _268 = gl_FragCoord.w;
    float _270 = _266 * _268;
    float _272 = in.m_62.x;
    float _274 = gl_FragCoord.w;
    float _276 = _272 * _274;
    float _278 = in.m_62.z;
    float _280 = gl_FragCoord.w;
    float _282 = _278 * _280;
    float _284 = _101 * _270;
    float _286 = _101 * _276;
    float _288 = _101 * _282;
    float _290 = _284 * _284;
    float _292 = fma(_286, _286, _290);
    float _294 = fma(_288, _288, _292);
    float _296 = rsqrt(_294);
    float _298 = _286 * _296;
    float _300 = _284 * _296;
    float _302 = _288 * _296;
    float _304 = abs(_298);
    float _306 = abs(_300);
    float _308 = precise::max(_304, _306);
    float _310 = abs(_302);
    float _312 = precise::max(_310, _308);
    float _314 = 1.0 / _312;
    float _316 = -_314;
    float _318 = _302 * _316;
    float _320 = _298 * _314;
    float _322 = _300 * _314;
    float3 _957 = float3(_320, _322, _318);
    float3 _326 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_957, float3(0.0), isnan(_957)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_957, float3(0.0), isnan(_957)), level(0.0)).xyz;
    float _328 = _326.x;
    float _330 = _326.y;
    float _332 = _326.z;
    float _334 = in.m_64.y;
    float _336 = gl_FragCoord.w;
    float _338 = _334 * _336;
    float _340 = in.m_64.x;
    float _342 = gl_FragCoord.w;
    float _344 = _340 * _342;
    float _346 = in.m_66.y;
    float _348 = in.m_66.x;
    float _350 = in.m_64.z;
    float _352 = gl_FragCoord.w;
    float _354 = _350 * _352;
    float _356 = in.m_57.z;
    float _358 = gl_FragCoord.w;
    float _360 = _356 * _358;
    float _362 = in.m_66.z;
    float _364 = in.m_68.x;
    float _366 = in.m_70.y;
    float _368 = gl_FragCoord.w;
    float _370 = _366 * _368;
    float _372 = in.m_70.z;
    float _374 = gl_FragCoord.w;
    float _376 = _372 * _374;
    float _378 = in.m_72.x;
    float _380 = gl_FragCoord.w;
    float _382 = _378 * _380;
    float _384 = in.m_72.w;
    float _386 = gl_FragCoord.w;
    float _388 = _384 * _386;
    float _390 = in.m_72.y;
    float _392 = gl_FragCoord.w;
    float _394 = _390 * _392;
    float _396 = in.m_72.z;
    float _398 = gl_FragCoord.w;
    float _400 = _396 * _398;
    float _402 = _101 * _338;
    float _404 = _101 * _344;
    float _406 = -_346;
    float _408 = _402 + _406;
    float _410 = -_348;
    float _412 = _404 + _410;
    float _414 = _101 * _354;
    float _416 = _364 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _418 = _408 * _408;
    float _420 = _101 * _360;
    float _422 = -_362;
    float _424 = _414 + _422;
    float _426 = in.m_74.w;
    float _428 = gl_FragCoord.w;
    float _430 = _426 * _428;
    float _432 = fma(_412, _412, _418);
    float _434 = _420 * _194;
    float _436 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _438 = fma(_240, (*spvDescriptorSet0.fp_c8)._m0[30].w, _436);
    float _440 = in.m_74.y;
    float _442 = gl_FragCoord.w;
    float _444 = _440 * _442;
    float _446 = fma(_424, _424, _432);
    float _448 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _450 = fma(_434, (*spvDescriptorSet0.fp_c8)._m0[30].w, _448);
    float _452 = 1.0 / _438;
    float _454 = in.m_74.z;
    float _456 = gl_FragCoord.w;
    float _458 = _454 * _456;
    float _460 = -_446;
    float _462 = fma(_416, _416, _460);
    float _464 = in.m_70.x;
    float _466 = gl_FragCoord.w;
    float _468 = _464 * _466;
    float _470 = precise::max(0.0, _462);
    float _472 = 1.0 / _450;
    float _474 = in.m_74.x;
    float _476 = gl_FragCoord.w;
    float _478 = _474 * _476;
    bool _480 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _482 = _101 * _382;
    float _484 = sqrt(_470);
    float _486 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _488 = _472 * _486;
    float _490 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _492 = -_488;
    float _494 = fma(_452, _490, _492);
    float _496 = _101 * _444;
    float _498 = _488;
    if (_480)
    {
        float _500 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _502 = _488 + _500;
        _498 = _502;
    }
    float _504 = _498;
    float _506 = _484 + _494;
    float _508 = _101 * _430;
    float _510 = _101 * _458;
    float _512 = _101 * _468;
    float _514 = _101 * _370;
    float _516 = -_508;
    float _518 = _516 + _506;
    float _520 = _101 * _376;
    float _522 = _504;
    if (_480)
    {
        float _524 = _504 * 8.0;
        float _526 = precise::clamp(_524, 0.0, 1.0);
        _522 = _526;
    }
    float _528 = _522;
    float _530 = _101 * _388;
    float _532 = _518 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    float _534 = _101 * _478;
    float _536 = _101 * _394;
    float _538 = _101 * _400;
    float _540 = _532 * (-1.44269502162933349609375);
    float _542 = exp2(_540);
    float _544 = -_542;
    float _546 = _544 + 1.0;
    float _548 = precise::clamp(_546, 0.0, 1.0);
    float _550 = _212 * _548;
    float _552 = precise::clamp(_550, 0.0, 1.0);
    float _554 = _552;
    if (_480)
    {
        float _556 = _552 * _528;
        _554 = _556;
    }
    float _558 = _554;
    float _560 = 0.0 + _558;
    float _562 = precise::clamp(_560, 0.0, 1.0);
    float _564 = fma(_328, 0.20999999344348907470703125, _534);
    float _566 = fma(_330, 0.20999999344348907470703125, _496);
    float _568 = fma(_332, 0.20999999344348907470703125, _510);
    float _570 = _564 + _512;
    float _572 = _566 + _514;
    float _574 = _568 + _520;
    float _576 = _262 * _570;
    float _578 = _260 * _572;
    float _580 = _264 * _574;
    float _582 = fma(_576, _530, _482);
    float _584 = fma(_578, _530, _536);
    float _586 = fma(_580, _530, _538);
    out.m_60.x = _582;
    out.m_60.y = _584;
    out.m_60.z = _586;
    out.m_60.w = _562;
    return out;
}

