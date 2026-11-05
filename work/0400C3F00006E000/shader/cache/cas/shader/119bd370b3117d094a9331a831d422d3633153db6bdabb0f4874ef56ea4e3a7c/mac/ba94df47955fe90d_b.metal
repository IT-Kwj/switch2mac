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
    constant _16* fp_c10 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_36 [[id(4)]];
    sampler fp_t_tcb_36Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_8 [[id(8)]];
    sampler fp_t_tcb_8Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    texture2d<float> fp_t_tcb_34 [[id(12)]];
    sampler fp_t_tcb_34Smplr [[id(13)]];
    sampler fp_t_tcb_36Smplr_w [[id(14)]];
    sampler fp_t_tcb_10Smplr_w [[id(15)]];
    sampler fp_t_tcb_8Smplr_w [[id(16)]];
    sampler fp_t_tcb_ASmplr_w [[id(17)]];
    sampler fp_t_tcb_34Smplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_62 [[color(0)]];
};

struct main0_in
{
    float4 m_55 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_51 [[user(locn3), flat]];
    float4 m_43 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_59 [[user(locn6)]];
    float4 m_49 [[user(locn7), flat]];
    float4 m_53 [[user(locn8)]];
    float4 m_64 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _71 = gl_FragCoord.w;
    float _73 = in.m_43.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_45.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = 1.0 / _71;
    float _87 = _85 * _77;
    float _89 = _85 * _83;
    float _91 = _87 * 0.25;
    float _93 = _89 * 0.375;
    float2 _510 = float2(_91, _93);
    float2 _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_36.sample(spvDescriptorSet0.fp_t_tcb_36Smplr, select(_510, float2(0.0), isnan(_510))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_36, spvDescriptorSet0.fp_t_tcb_36Smplr_w, select(_510, float2(0.0), isnan(_510))).xy;
    float _99 = _97.x;
    float _101 = _97.y;
    float _103 = in.m_47.w;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_49.x;
    float _111 = in.m_47.x;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_47.y;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_51.x;
    float _125 = in.m_43.z;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_53.y;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_53.x;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = fma(_89, 2.25, 0.5);
    float _145 = _85 * _107;
    float _147 = fma((*spvDescriptorSet0.fp_c10)._m0[2].x, 0.0166666693985462188720703125, _109);
    float _149 = 1.0 / _145;
    float _151 = _147 * 0.25;
    float _153 = fma(_147, 0.75, _143);
    float _155 = _85 * _115;
    float _157 = _123 * 0.100000001490116119384765625;
    float _159 = fma(_89, 1.5, _151);
    float _161 = _155 * _149;
    float _163 = fma(_99, 2.0, -1.0);
    float _165 = fma(_101, 2.0, -1.0);
    float _167 = _85 * _121;
    float _169 = _85 * _129;
    float _171 = fma(_163, _157, _87);
    float _173 = fma(_165, _157, _159);
    float _175 = _167 * _149;
    float _177 = fma(_165, _157, _153);
    float _179 = fma(_163, _157, _169);
    float _181 = _85 * _135;
    float2 _642 = float2(_161, _175);
    float _183 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_642, float2(0.0), isnan(_642))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_642, float2(0.0), isnan(_642))).x;
    float2 _650 = float2(_171, _173);
    float4 _186 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_650, float2(0.0), isnan(_650))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_650, float2(0.0), isnan(_650))).xyzw;
    float _188 = _186.x;
    float _190 = _186.y;
    float _192 = _186.z;
    float _194 = _186.w;
    float _196 = _85 * _141;
    float2 _669 = float2(_179, _177);
    float4 _198 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_669, float2(0.0), isnan(_669))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_669, float2(0.0), isnan(_669))).xyzw;
    float _200 = _198.x;
    float _202 = _198.y;
    float _204 = _198.z;
    float _206 = _198.w;
    float2 _685 = float2(_196, _181);
    float _208 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_685, float2(0.0), isnan(_685))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_685, float2(0.0), isnan(_685))).w;
    float _210 = in.m_47.z;
    float _212 = gl_FragCoord.w;
    float _214 = _210 * _212;
    float _216 = in.m_55.w;
    float _218 = gl_FragCoord.w;
    float _220 = _216 * _218;
    float _222 = in.m_57.w;
    float _224 = gl_FragCoord.w;
    float _226 = _222 * _224;
    float _228 = in.m_59.x;
    float _230 = gl_FragCoord.w;
    float _232 = _228 * _230;
    float _234 = _85 * _214;
    float _236 = _234 * _149;
    float _238 = _85 * _220;
    float _240 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _242 = fma(_236, (*spvDescriptorSet0.fp_c8)._m0[30].w, _240);
    float _244 = 1.0 / _242;
    float _246 = _85 * _226;
    float _248 = in.m_57.y;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = in.m_55.z;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _262 = fma(_183, (*spvDescriptorSet0.fp_c8)._m0[30].w, _260);
    float _264 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _266 = fma(_206, 0.25, _194);
    float _268 = _266 * _208;
    float _270 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _272 = _244 * _270;
    float _274 = 1.0 / _262;
    float _276 = _238 * _268;
    float _278 = _85 * _232;
    float _280 = _246 * _276;
    float _282 = precise::clamp(_280, 0.0, 1.0);
    float _284 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _286 = -_272;
    float _288 = fma(_274, _284, _286);
    float _290 = _288 * _264;
    float _292 = precise::clamp(_290, 0.0, 1.0);
    float _294 = _282 * _292;
    float _296 = _294 * _278;
    bool _300 = _296 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _302 = isnan(_296);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _308 = _304 || _306;
    float _310 = in.m_57.x;
    float _312 = gl_FragCoord.w;
    float _314 = _310 * _312;
    float _316 = in.m_57.z;
    float _318 = gl_FragCoord.w;
    float _320 = _316 * _318;
    float _322 = in.m_55.x;
    float _324 = gl_FragCoord.w;
    float _326 = _322 * _324;
    float _328 = in.m_55.y;
    float _330 = gl_FragCoord.w;
    float _332 = _328 * _330;
    if (!_308)
    {
        discard_fragment();
    }
    float _334 = _200 * _200;
    float _336 = _334 * 0.25;
    float _338 = _202 * _202;
    float _340 = _338 * 0.25;
    float _342 = _204 * _204;
    float _344 = _342 * 0.25;
    float _346 = fma(_188, _188, _336);
    float _348 = fma(_190, _190, _340);
    float _350 = fma(_192, _192, _344);
    float _352 = -_346;
    float _354 = _352 + 1.0;
    float _356 = -_348;
    float _358 = _356 + 1.0;
    float _360 = -_350;
    float _362 = _360 + 1.0;
    float _364 = _85 * _314;
    float _366 = _85 * _252;
    float _368 = _85 * _320;
    float _370 = _364 * _354;
    float _372 = _366 * _358;
    float _374 = _85 * _326;
    float _376 = _368 * _362;
    float _378 = _85 * _332;
    float _380 = _85 * _258;
    float _382 = fma(_346, _374, _370);
    float _384 = fma(_348, _378, _372);
    float _386 = fma(_350, _380, _376);
    if (!_308)
    {
        out.m_62.x = _382;
        out.m_62.y = _384;
        out.m_62.z = _386;
        out.m_62.w = _282;
        return out;
    }
    float _388 = _384 * 0.715200006961822509765625;
    float _390 = in.m_64.w;
    float _392 = gl_FragCoord.w;
    float _394 = _390 * _392;
    float _396 = in.m_64.x;
    float _398 = gl_FragCoord.w;
    float _400 = _396 * _398;
    float _402 = in.m_64.y;
    float _404 = gl_FragCoord.w;
    float _406 = _402 * _404;
    float _408 = fma(_382, 0.2125999927520751953125, _388);
    float _410 = in.m_64.z;
    float _412 = gl_FragCoord.w;
    float _414 = _410 * _412;
    float _416 = fma(_386, 0.072200000286102294921875, _408);
    bool _418 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _420 = 1.0 / _416;
    float _422 = (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_418)
    {
        float _424 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _426 = _272 + _424;
        _422 = _426;
    }
    float _428 = _422;
    float _430 = _420 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _432 = precise::clamp(_430, 0.0, 1.0);
    float _434 = fma(_432, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _436 = _85 * _394;
    float _438 = _85 * _406;
    float _440 = _434 * _436;
    float _442 = 0.0 + _296;
    float _444 = precise::clamp(_442, 0.0, 1.0);
    float _446 = _436;
    float _448 = _444;
    if (_418)
    {
        float _450 = _428 * 8.0;
        float _452 = precise::clamp(_450, 0.0, 1.0);
        _446 = _452;
    }
    float _454 = _446;
    float _456 = _85 * _400;
    float _458 = _85 * _414;
    float _460 = fma(_384, _440, _438);
    if (_418)
    {
        float _462 = _444 * _454;
        _448 = _462;
    }
    float _464 = _448;
    float _466 = fma(_382, _440, _456);
    float _468 = fma(_386, _440, _458);
    float _470 = 0.0 + _464;
    float _472 = precise::clamp(_470, 0.0, 1.0);
    out.m_62.x = _466;
    out.m_62.y = _460;
    out.m_62.z = _468;
    out.m_62.w = _472;
    return out;
}

