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
    sampler fp_t_tcb_10Smplr_w [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    sampler fp_t_tcb_CSmplr_w [[id(16)]];
    sampler fp_t_tcb_34Smplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_58 [[color(0)]];
};

struct main0_in
{
    float4 m_51 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_43 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_45 [[user(locn6)]];
    float4 m_47 [[user(locn7)]];
    float4 m_60 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _67 = gl_FragCoord.w;
    float _69 = in.m_41.w;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_43.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_41.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_41.y;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_43.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_43.z;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_43.w;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_45.x;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_45.y;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_47.x;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_47.y;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = 1.0 / _67;
    float _137 = _135 * _73;
    float _139 = _135 * _79;
    float _141 = _135 * _85;
    float _143 = _135 * _91;
    float _145 = _135 * _97;
    float _147 = _135 * _103;
    float _149 = 1.0 / _137;
    float _151 = _135 * _109;
    float _153 = _135 * _115;
    float _155 = _135 * _121;
    float _157 = _135 * _127;
    float _159 = _135 * _133;
    float _161 = _141 * _149;
    float _163 = _143 * _149;
    float2 _655 = float2(_161, _163);
    float _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_655, float2(0.0), isnan(_655))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_655, float2(0.0), isnan(_655))).x;
    float2 _666 = float2(_139, _145);
    float4 _168 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_666, float2(0.0), isnan(_666))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_666, float2(0.0), isnan(_666))).xyzw;
    float _170 = _168.x;
    float _172 = _168.y;
    float _174 = _168.z;
    float _176 = _168.w;
    float2 _682 = float2(_147, _151);
    float4 _178 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_682, float2(0.0), isnan(_682))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_682, float2(0.0), isnan(_682))).xyzw;
    float _180 = _178.x;
    float _182 = _178.y;
    float _184 = _178.z;
    float _186 = _178.w;
    float2 _698 = float2(_153, _155);
    float4 _188 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_698, float2(0.0), isnan(_698))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_698, float2(0.0), isnan(_698))).xyzw;
    float _190 = _188.x;
    float _192 = _188.y;
    float _194 = _188.z;
    float _196 = _188.w;
    float2 _714 = float2(_157, _159);
    float4 _198 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_714, float2(0.0), isnan(_714))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_714, float2(0.0), isnan(_714))).xyzw;
    float _200 = _198.x;
    float _202 = _198.y;
    float _204 = _198.z;
    float _206 = _198.w;
    float _208 = in.m_41.z;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    float _214 = in.m_49.w;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = in.m_51.w;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    float _226 = in.m_53.x;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _234 = _135 * _212;
    float _236 = _234 * _149;
    float _238 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _240 = fma(_236, (*spvDescriptorSet0.fp_c8)._m0[30].w, _238);
    float _242 = 1.0 / _240;
    float _244 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _246 = fma(_165, (*spvDescriptorSet0.fp_c8)._m0[30].w, _244);
    float _248 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _250 = _242 * _248;
    float _252 = _176 + _186;
    float _254 = _135 * _218;
    float _256 = 1.0 / _246;
    float _258 = _135 * _230;
    float _260 = _252 + _196;
    float _262 = _260 + _206;
    float _264 = _262 * _254;
    float _266 = _135 * _224;
    float _268 = _266 * _264;
    float _270 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _272 = -_250;
    float _274 = fma(_256, _270, _272);
    float _276 = 0.0 + _268;
    float _278 = precise::clamp(_276, 0.0, 1.0);
    float _280 = _274 * _232;
    float _282 = precise::clamp(_280, 0.0, 1.0);
    float _284 = _278 * _282;
    float _286 = _284 * _258;
    bool _290 = _286 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _292 = isnan(_286);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _298 = _294 || _296;
    float _300 = in.m_51.x;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = in.m_55.x;
    float _308 = gl_FragCoord.w;
    float _310 = _306 * _308;
    float _312 = in.m_51.y;
    float _314 = gl_FragCoord.w;
    float _316 = _312 * _314;
    float _318 = in.m_55.y;
    float _320 = gl_FragCoord.w;
    float _322 = _318 * _320;
    float _324 = in.m_51.z;
    float _326 = gl_FragCoord.w;
    float _328 = _324 * _326;
    float _330 = in.m_55.z;
    float _332 = gl_FragCoord.w;
    float _334 = _330 * _332;
    float _336 = _172 * _172;
    float _338 = _180 * _180;
    float _340 = _170 * _170;
    float _342 = _182 * _182;
    float _344 = _250;
    float _346 = _200;
    if (!_298)
    {
        discard_fragment();
    }
    float _348 = _340 * _338;
    float _350 = _336 * _342;
    float _352 = in.m_49.x;
    float _354 = gl_FragCoord.w;
    float _356 = _352 * _354;
    float _358 = in.m_49.y;
    float _360 = gl_FragCoord.w;
    float _362 = _358 * _360;
    float _364 = in.m_49.z;
    float _366 = gl_FragCoord.w;
    float _368 = _364 * _366;
    float _370 = _192 * _192;
    float _372 = _174 * _174;
    float _374 = _184 * _184;
    float _376 = _202 * _202;
    float _378 = _350 * _370;
    float _380 = _190 * _190;
    float _382 = _372 * _374;
    float _384 = _194 * _194;
    float _386 = _378 * _376;
    float _388 = _348 * _380;
    float _390 = _200 * _200;
    float _392 = _382 * _384;
    float _394 = _135 * _304;
    float _396 = _135 * _310;
    float _398 = _135 * _316;
    float _400 = _204 * _204;
    float _402 = _135 * _322;
    float _404 = _135 * _328;
    float _406 = _135 * _334;
    float _408 = _388 * _390;
    float _410 = _392 * _400;
    float _412 = -_396;
    float _414 = _394 + _412;
    float _416 = -_402;
    float _418 = _398 + _416;
    float _420 = -_406;
    float _422 = _404 + _420;
    float _424 = fma(_408, _414, _396);
    float _426 = fma(_386, _418, _402);
    float _428 = fma(_410, _422, _406);
    float _430 = _135 * _356;
    float _432 = _135 * _362;
    float _434 = _135 * _368;
    float _436 = _424 * _430;
    float _438 = _426 * _432;
    float _440 = _428 * _434;
    if (!_298)
    {
        out.m_58.x = _436;
        out.m_58.y = _438;
        out.m_58.z = _440;
        out.m_58.w = _268;
        return out;
    }
    float _442 = _438 * 0.715200006961822509765625;
    float _444 = in.m_60.w;
    float _446 = gl_FragCoord.w;
    float _448 = _444 * _446;
    float _450 = in.m_60.y;
    float _452 = gl_FragCoord.w;
    float _454 = _450 * _452;
    float _456 = in.m_60.x;
    float _458 = gl_FragCoord.w;
    float _460 = _456 * _458;
    float _462 = fma(_436, 0.2125999927520751953125, _442);
    float _464 = in.m_60.z;
    float _466 = gl_FragCoord.w;
    float _468 = _464 * _466;
    float _470 = fma(_440, 0.072200000286102294921875, _462);
    bool _472 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _474 = 1.0 / _470;
    if (_472)
    {
        float _476 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _478 = _250 + _476;
        _344 = _478;
    }
    float _480 = _344;
    if (_472)
    {
        float _482 = _480 * 8.0;
        float _484 = precise::clamp(_482, 0.0, 1.0);
        _346 = _484;
    }
    float _486 = _346;
    float _488 = _474 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _490 = precise::clamp(_488, 0.0, 1.0);
    float _492 = fma(_490, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _494 = _135 * _448;
    float _496 = _135 * _454;
    float _498 = _135 * _460;
    float _500 = _492 * _494;
    float _502 = 0.0 + _286;
    float _504 = precise::clamp(_502, 0.0, 1.0);
    float _506 = _135 * _468;
    float _508 = fma(_436, _500, _498);
    float _510 = _504;
    if (_472)
    {
        float _512 = _504 * _486;
        _510 = _512;
    }
    float _514 = _510;
    float _516 = fma(_438, _500, _496);
    float _518 = fma(_440, _500, _506);
    float _520 = 0.0 + _514;
    float _522 = precise::clamp(_520, 0.0, 1.0);
    out.m_58.x = _508;
    out.m_58.y = _516;
    out.m_58.z = _518;
    out.m_58.w = _522;
    return out;
}

