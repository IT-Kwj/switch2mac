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
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    texture2d<float> fp_t_tcb_34 [[id(11)]];
    sampler fp_t_tcb_34Smplr [[id(12)]];
    texture2d<float> fp_t_tcb_36 [[id(13)]];
    sampler fp_t_tcb_36Smplr [[id(14)]];
    sampler fp_t_tcb_10Smplr_w [[id(15)]];
    sampler fp_t_tcb_8Smplr_w [[id(16)]];
    sampler fp_t_tcb_ASmplr_w [[id(17)]];
    sampler fp_t_tcb_CSmplr_w [[id(18)]];
    sampler fp_t_tcb_34Smplr_w [[id(19)]];
    sampler fp_t_tcb_36Smplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_62 [[color(0)]];
};

struct main0_in
{
    float4 m_51 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_57 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_47 [[user(locn6)]];
    float4 m_49 [[user(locn7)]];
    float4 m_59 [[user(locn8)]];
    float4 m_64 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _71 = gl_FragCoord.w;
    float _73 = in.m_43.w;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_43.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_43.y;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_45.x;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_45.y;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_45.z;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_45.w;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_47.x;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_47.y;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_49.x;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = in.m_49.y;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = 1.0 / _71;
    float _141 = _139 * _77;
    float _143 = _139 * _83;
    float _145 = _139 * _89;
    float _147 = _139 * _95;
    float _149 = _139 * _101;
    float _151 = _139 * _107;
    float _153 = 1.0 / _141;
    float _155 = _139 * _113;
    float _157 = _139 * _119;
    float _159 = _139 * _125;
    float _161 = _139 * _131;
    float _163 = _143 * _153;
    float _165 = _145 * _153;
    float _167 = _139 * _137;
    float2 _667 = float2(_163, _165);
    float _169 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_667, float2(0.0), isnan(_667))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_667, float2(0.0), isnan(_667))).x;
    float2 _678 = float2(_147, _149);
    float4 _172 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_678, float2(0.0), isnan(_678))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_678, float2(0.0), isnan(_678))).xyzw;
    float _174 = _172.x;
    float _176 = _172.y;
    float _178 = _172.z;
    float _180 = _172.w;
    float2 _694 = float2(_151, _155);
    float4 _182 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_694, float2(0.0), isnan(_694))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_694, float2(0.0), isnan(_694))).xyzw;
    float _184 = _182.x;
    float _186 = _182.y;
    float _188 = _182.z;
    float _190 = _182.w;
    float2 _710 = float2(_157, _159);
    float _192 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_710, float2(0.0), isnan(_710))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_710, float2(0.0), isnan(_710))).w;
    float2 _718 = float2(_161, _167);
    float4 _194 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_718, float2(0.0), isnan(_718))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_718, float2(0.0), isnan(_718))).xyzw;
    float _196 = _194.x;
    float _198 = _194.y;
    float _200 = _194.z;
    float _202 = _194.w;
    float _204 = in.m_43.z;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = in.m_51.w;
    float _212 = gl_FragCoord.w;
    float _214 = _210 * _212;
    float _216 = in.m_53.w;
    float _218 = gl_FragCoord.w;
    float _220 = _216 * _218;
    float _222 = in.m_55.w;
    float _224 = gl_FragCoord.w;
    float _226 = _222 * _224;
    float _228 = in.m_57.x;
    float _230 = gl_FragCoord.w;
    float _232 = _228 * _230;
    float _234 = _139 * _208;
    float _236 = _234 * _153;
    float _238 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _240 = fma(_236, (*spvDescriptorSet0.fp_c8)._m0[30].w, _238);
    float _242 = 1.0 / _240;
    float _244 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _246 = _242 * _244;
    float _248 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _250 = fma(_169, (*spvDescriptorSet0.fp_c8)._m0[30].w, _248);
    float _252 = _180 * _190;
    float _254 = -_192;
    float _256 = _254 + 1.0;
    float _258 = 1.0 / _250;
    float _260 = _139 * _214;
    float _262 = _252 * _256;
    float _264 = _139 * _220;
    float _266 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _268 = _262 * _202;
    float _270 = _139 * _232;
    float _272 = -_260;
    float _274 = fma(_268, _264, _272);
    float _276 = _139 * _226;
    float _278 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _280 = -_246;
    float _282 = fma(_258, _278, _280);
    float _284 = _276 * _274;
    float _286 = 0.0 + _284;
    float _288 = precise::clamp(_286, 0.0, 1.0);
    float _290 = _282 * _266;
    float _292 = precise::clamp(_290, 0.0, 1.0);
    float _294 = _288 * _292;
    float _296 = _294 * _270;
    bool _300 = _296 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _302 = isnan(_296);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _308 = _304 || _306;
    float _310 = in.m_59.x;
    float _312 = gl_FragCoord.w;
    float _314 = _310 * _312;
    float _316 = in.m_59.y;
    float _318 = gl_FragCoord.w;
    float _320 = _316 * _318;
    if (!_308)
    {
        discard_fragment();
    }
    float _322 = _139 * _314;
    float _324 = _139 * _320;
    float2 _906 = float2(_322, _324);
    float3 _328 = dm_bs(spvDescriptorSet0.fp_t_tcb_36.sample(spvDescriptorSet0.fp_t_tcb_36Smplr, select(_906, float2(0.0), isnan(_906))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_36, spvDescriptorSet0.fp_t_tcb_36Smplr_w, select(_906, float2(0.0), isnan(_906))).xyz;
    float _330 = _328.x;
    float _332 = _328.y;
    float _334 = _328.z;
    float _336 = in.m_51.x;
    float _338 = gl_FragCoord.w;
    float _340 = _336 * _338;
    float _342 = in.m_55.x;
    float _344 = gl_FragCoord.w;
    float _346 = _342 * _344;
    float _348 = in.m_51.z;
    float _350 = gl_FragCoord.w;
    float _352 = _348 * _350;
    float _354 = in.m_55.z;
    float _356 = gl_FragCoord.w;
    float _358 = _354 * _356;
    float _360 = in.m_51.y;
    float _362 = gl_FragCoord.w;
    float _364 = _360 * _362;
    float _366 = in.m_55.y;
    float _368 = gl_FragCoord.w;
    float _370 = _366 * _368;
    float _372 = in.m_53.x;
    float _374 = gl_FragCoord.w;
    float _376 = _372 * _374;
    float _378 = in.m_53.y;
    float _380 = gl_FragCoord.w;
    float _382 = _378 * _380;
    float _384 = in.m_53.z;
    float _386 = gl_FragCoord.w;
    float _388 = _384 * _386;
    float _390 = _174 * _184;
    float _392 = _176 * _186;
    float _394 = _178 * _188;
    float _396 = _390 * _196;
    float _398 = _392 * _198;
    float _400 = _394 * _200;
    float _402 = _139 * _340;
    float _404 = _139 * _346;
    float _406 = _139 * _352;
    float _408 = _139 * _358;
    float _410 = _139 * _370;
    float _412 = -_404;
    float _414 = _402 + _412;
    float _416 = -_408;
    float _418 = _406 + _416;
    float _420 = _139 * _382;
    float _422 = _398 * _332;
    float _424 = _139 * _364;
    float _426 = _396 * _330;
    float _428 = _400 * _334;
    float _430 = -_410;
    float _432 = _424 + _430;
    float _434 = fma(_426, _414, _404);
    float _436 = fma(_428, _418, _408);
    float _438 = _139 * _376;
    float _440 = fma(_422, _432, _410);
    float _442 = _139 * _388;
    float _444 = _434 * _438;
    float _446 = _440 * _420;
    float _448 = _436 * _442;
    if (!_308)
    {
        out.m_62.x = _444;
        out.m_62.y = _446;
        out.m_62.z = _448;
        out.m_62.w = _284;
        return out;
    }
    float _450 = _446 * 0.715200006961822509765625;
    float _452 = in.m_64.w;
    float _454 = gl_FragCoord.w;
    float _456 = _452 * _454;
    float _458 = in.m_64.x;
    float _460 = gl_FragCoord.w;
    float _462 = _458 * _460;
    float _464 = in.m_64.y;
    float _466 = gl_FragCoord.w;
    float _468 = _464 * _466;
    float _470 = fma(_444, 0.2125999927520751953125, _450);
    float _472 = in.m_64.z;
    float _474 = gl_FragCoord.w;
    float _476 = _472 * _474;
    float _478 = fma(_448, 0.072200000286102294921875, _470);
    bool _480 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _482 = 1.0 / _478;
    float _484 = (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_480)
    {
        float _486 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _488 = _246 + _486;
        _484 = _488;
    }
    float _490 = _484;
    float _492 = _482 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _494 = precise::clamp(_492, 0.0, 1.0);
    float _496 = fma(_494, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _498 = _139 * _456;
    float _500 = _139 * _468;
    float _502 = _496 * _498;
    float _504 = 0.0 + _296;
    float _506 = precise::clamp(_504, 0.0, 1.0);
    float _508 = _498;
    float _510 = _506;
    if (_480)
    {
        float _512 = _490 * 8.0;
        float _514 = precise::clamp(_512, 0.0, 1.0);
        _508 = _514;
    }
    float _516 = _508;
    float _518 = _139 * _462;
    float _520 = _139 * _476;
    float _522 = fma(_446, _502, _500);
    if (_480)
    {
        float _524 = _506 * _516;
        _510 = _524;
    }
    float _526 = _510;
    float _528 = fma(_444, _502, _518);
    float _530 = fma(_448, _502, _520);
    float _532 = 0.0 + _526;
    float _534 = precise::clamp(_532, 0.0, 1.0);
    out.m_62.x = _528;
    out.m_62.y = _522;
    out.m_62.z = _530;
    out.m_62.w = _534;
    return out;
}

