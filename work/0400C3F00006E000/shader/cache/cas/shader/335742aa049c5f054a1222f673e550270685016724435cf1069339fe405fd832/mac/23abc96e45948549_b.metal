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
    texture2d<float> fp_t_tcb_36 [[id(3)]];
    sampler fp_t_tcb_36Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    texture2d<float> fp_t_tcb_34 [[id(11)]];
    sampler fp_t_tcb_34Smplr [[id(12)]];
    sampler fp_t_tcb_36Smplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    sampler fp_t_tcb_8Smplr_w [[id(15)]];
    sampler fp_t_tcb_ASmplr_w [[id(16)]];
    sampler fp_t_tcb_34Smplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_56 [[color(0)]];
};

struct main0_in
{
    float4 m_49 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_43 [[user(locn2)]];
    float4 m_51 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_41 [[user(locn6)]];
    float4 m_58 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _65 = gl_FragCoord.w;
    float _67 = in.m_41.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_41.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = 1.0 / _65;
    float _81 = _79 * _71;
    float _83 = _79 * _77;
    float2 _503 = float2(_81, _83);
    float2 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_36.sample(spvDescriptorSet0.fp_t_tcb_36Smplr, select(_503, float2(0.0), isnan(_503))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_36, spvDescriptorSet0.fp_t_tcb_36Smplr_w, select(_503, float2(0.0), isnan(_503))).xy;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = in.m_43.w;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_45.z;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_43.x;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_43.y;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_45.x;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_45.w;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_45.y;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_47.y;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = in.m_47.x;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = _79 * _97;
    float _149 = _79 * _103;
    float _151 = 1.0 / _147;
    float _153 = _79 * _121;
    float _155 = _79 * _139;
    float _157 = _79 * _127;
    float _159 = fma(_89, 0.0500000007450580596923828125, -0.02500000037252902984619140625);
    float _161 = fma(_91, 0.0500000007450580596923828125, -0.02500000037252902984619140625);
    float _163 = _79 * _115;
    float _165 = _159 + _149;
    float _167 = _79 * _109;
    float _169 = _163 * _151;
    float _171 = _159 + _153;
    float _173 = _79 * _133;
    float _175 = _167 * _151;
    float _177 = _161 + _157;
    float _179 = _161 + _173;
    float _181 = _79 * _145;
    float2 _636 = float2(_175, _169);
    float _183 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_636, float2(0.0), isnan(_636))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_636, float2(0.0), isnan(_636))).x;
    float2 _644 = float2(_171, _179);
    float4 _186 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_644, float2(0.0), isnan(_644))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_644, float2(0.0), isnan(_644))).xyzw;
    float _188 = _186.x;
    float _190 = _186.y;
    float _192 = _186.z;
    float _194 = _186.w;
    float2 _660 = float2(_165, _177);
    float4 _196 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_660, float2(0.0), isnan(_660))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_660, float2(0.0), isnan(_660))).xyzw;
    float _198 = _196.x;
    float _200 = _196.y;
    float _202 = _196.z;
    float _204 = _196.w;
    float2 _676 = float2(_181, _155);
    float _206 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_676, float2(0.0), isnan(_676))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_676, float2(0.0), isnan(_676))).w;
    float _208 = in.m_43.z;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    float _214 = in.m_49.w;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = in.m_51.x;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    float _226 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _228 = _79 * _212;
    float _230 = in.m_53.w;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = _228 * _151;
    float _238 = _79 * _218;
    float _240 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _242 = fma(_236, (*spvDescriptorSet0.fp_c8)._m0[30].w, _240);
    float _244 = 1.0 / _242;
    float _246 = _79 * _234;
    float _248 = in.m_53.z;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = in.m_49.y;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = in.m_49.z;
    float _262 = gl_FragCoord.w;
    float _264 = _260 * _262;
    float _266 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _268 = fma(_183, (*spvDescriptorSet0.fp_c8)._m0[30].w, _266);
    float _270 = fma(_204, 0.25, _194);
    float _272 = 1.0 / _268;
    float _274 = _270 * _206;
    float _276 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _278 = _244 * _276;
    float _280 = _238 * _274;
    float _282 = _79 * _224;
    float _284 = _246 * _280;
    float _286 = precise::clamp(_284, 0.0, 1.0);
    float _288 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _290 = -_278;
    float _292 = fma(_272, _288, _290);
    float _294 = _292 * _226;
    float _296 = precise::clamp(_294, 0.0, 1.0);
    float _298 = _286 * _296;
    float _300 = _298 * _282;
    bool _304 = _300 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _306 = isnan(_300);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _312 = _308 || _310;
    float _314 = in.m_53.x;
    float _316 = gl_FragCoord.w;
    float _318 = _314 * _316;
    float _320 = in.m_53.y;
    float _322 = gl_FragCoord.w;
    float _324 = _320 * _322;
    float _326 = in.m_49.x;
    float _328 = gl_FragCoord.w;
    float _330 = _326 * _328;
    if (!_312)
    {
        discard_fragment();
    }
    float _332 = _198 * _198;
    float _334 = _332 * 0.25;
    float _336 = _200 * _200;
    float _338 = _336 * 0.25;
    float _340 = _202 * _202;
    float _342 = _340 * 0.25;
    float _344 = fma(_188, _188, _334);
    float _346 = fma(_190, _190, _338);
    float _348 = fma(_192, _192, _342);
    float _350 = _79 * _252;
    float _352 = -_344;
    float _354 = _352 + 1.0;
    float _356 = -_346;
    float _358 = _356 + 1.0;
    float _360 = -_348;
    float _362 = _360 + 1.0;
    float _364 = _350 * _362;
    float _366 = _79 * _318;
    float _368 = _79 * _324;
    float _370 = _79 * _264;
    float _372 = _366 * _354;
    float _374 = _368 * _358;
    float _376 = _79 * _330;
    float _378 = _79 * _258;
    float _380 = fma(_344, _376, _372);
    float _382 = fma(_346, _378, _374);
    float _384 = fma(_348, _370, _364);
    if (!_312)
    {
        out.m_56.x = _380;
        out.m_56.y = _382;
        out.m_56.z = _384;
        out.m_56.w = _286;
        return out;
    }
    float _386 = _382 * 0.715200006961822509765625;
    float _388 = in.m_58.w;
    float _390 = gl_FragCoord.w;
    float _392 = _388 * _390;
    float _394 = in.m_58.x;
    float _396 = gl_FragCoord.w;
    float _398 = _394 * _396;
    float _400 = in.m_58.y;
    float _402 = gl_FragCoord.w;
    float _404 = _400 * _402;
    float _406 = fma(_380, 0.2125999927520751953125, _386);
    float _408 = in.m_58.z;
    float _410 = gl_FragCoord.w;
    float _412 = _408 * _410;
    float _414 = fma(_384, 0.072200000286102294921875, _406);
    bool _416 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _418 = 1.0 / _414;
    float _420 = (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_416)
    {
        float _422 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _424 = _278 + _422;
        _420 = _424;
    }
    float _426 = _420;
    float _428 = _418 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _430 = precise::clamp(_428, 0.0, 1.0);
    float _432 = fma(_430, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _434 = _79 * _392;
    float _436 = _79 * _404;
    float _438 = _432 * _434;
    float _440 = 0.0 + _300;
    float _442 = precise::clamp(_440, 0.0, 1.0);
    float _444 = _434;
    float _446 = _442;
    if (_416)
    {
        float _448 = _426 * 8.0;
        float _450 = precise::clamp(_448, 0.0, 1.0);
        _444 = _450;
    }
    float _452 = _444;
    float _454 = _79 * _398;
    float _456 = _79 * _412;
    float _458 = fma(_382, _438, _436);
    if (_416)
    {
        float _460 = _442 * _452;
        _446 = _460;
    }
    float _462 = _446;
    float _464 = fma(_380, _438, _454);
    float _466 = fma(_384, _438, _456);
    float _468 = 0.0 + _462;
    float _470 = precise::clamp(_468, 0.0, 1.0);
    out.m_56.x = _464;
    out.m_56.y = _458;
    out.m_56.z = _466;
    out.m_56.w = _470;
    return out;
}

