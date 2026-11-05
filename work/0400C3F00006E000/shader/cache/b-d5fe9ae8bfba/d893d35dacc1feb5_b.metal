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
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_1ESmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_55 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_50 [[user(locn2)]];
    float4 m_61 [[user(locn3)]];
    float4 m_52 [[user(locn4)]];
    float4 m_44 [[user(locn5)]];
    float4 m_42 [[user(locn6)]];
    float4 m_57 [[user(locn7)]];
    float4 m_63 [[user(locn8)]];
    float4 m_59 [[user(locn9)]];
    float4 m_65 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _72 = gl_FragCoord.w;
    float _74 = in.m_42.w;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_42.y;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_42.x;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_44.x;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_44.y;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_44.w;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_44.z;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = 1.0 / _72;
    float _118 = _116 * _78;
    float _120 = _116 * _84;
    float _122 = _116 * _90;
    float _124 = _116 * _96;
    float _126 = 1.0 / _118;
    float _128 = _116 * _102;
    float _130 = _116 * _108;
    float _132 = _116 * _114;
    float _134 = _120 * _126;
    float _136 = _122 * _126;
    float2 _591 = float2(_136, _134);
    float _138 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_591, float2(0.0), isnan(_591))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_591, float2(0.0), isnan(_591))).x;
    float2 _602 = float2(_124, _128);
    float _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_602, float2(0.0), isnan(_602))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_602, float2(0.0), isnan(_602))).w;
    float2 _610 = float2(_132, _130);
    float _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_610, float2(0.0), isnan(_610))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_610, float2(0.0), isnan(_610))).w;
    float _144 = in.m_42.z;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = in.m_46.w;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = in.m_48.w;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = in.m_50.x;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _170 = _116 * _148;
    float _172 = _170 * _126;
    float _174 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _176 = fma(_172, (*spvDescriptorSet0.fp_c8)._m0[30].w, _174);
    float _178 = 1.0 / _176;
    float _180 = _116 * _154;
    float _182 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _184 = _178 * _182;
    float _186 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _188 = fma(_138, (*spvDescriptorSet0.fp_c8)._m0[30].w, _186);
    float _190 = 1.0 / _188;
    float _192 = -_180;
    float _194 = fma(_140, _142, _192);
    float _196 = _116 * _160;
    float _198 = _196 * _194;
    float _200 = 0.0 + _198;
    float _202 = precise::clamp(_200, 0.0, 1.0);
    float _204 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _206 = -_184;
    float _208 = fma(_190, _204, _206);
    float _210 = _208 * _168;
    float _212 = precise::clamp(_210, 0.0, 1.0);
    float _214 = _116 * _166;
    float _216 = _202 * _212;
    float _218 = _216 * _214;
    bool _222 = _218 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _224 = isnan(_218);
    bool _226 = _222 || _224;
    bool _228 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _230 = _226 || _228;
    float _232 = in.m_46.x;
    float _234 = gl_FragCoord.w;
    float _236 = _232 * _234;
    float _238 = in.m_52.x;
    float _240 = gl_FragCoord.w;
    float _242 = _238 * _240;
    float _244 = _184;
    if (!_230)
    {
        discard_fragment();
    }
    float _246 = in.m_52.z;
    float _248 = gl_FragCoord.w;
    float _250 = _246 * _248;
    float _252 = _116 * _236;
    float _254 = _116 * _242;
    float _256 = in.m_52.y;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    float _262 = _252 * _254;
    float _264 = in.m_46.y;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = _116 * _260;
    float _272 = in.m_46.z;
    float _274 = gl_FragCoord.w;
    float _276 = _272 * _274;
    float _278 = _116 * _268;
    float _280 = _278 * _270;
    float _282 = _116 * _276;
    float _284 = _116 * _250;
    float _286 = _282 * _284;
    if (!_230)
    {
        out.m_55.x = _262;
        out.m_55.y = _280;
        out.m_55.z = _286;
        out.m_55.w = _198;
        return out;
    }
    float _288 = in.m_57.y;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = in.m_57.x;
    float _296 = gl_FragCoord.w;
    float _298 = _294 * _296;
    float _300 = in.m_57.z;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = _116 * _292;
    float _308 = _116 * _298;
    float _310 = _116 * _304;
    float _312 = _306 * _306;
    float _314 = in.m_59.x;
    float _316 = gl_FragCoord.w;
    float _318 = _314 * _316;
    float _320 = fma(_308, _308, _312);
    float _322 = fma(_310, _310, _320);
    float _324 = rsqrt(_322);
    float _326 = _308 * _324;
    float _328 = _306 * _324;
    float _330 = _310 * _324;
    float _332 = _116 * _318;
    float _334 = abs(_326);
    float _336 = abs(_328);
    float _338 = precise::max(_334, _336);
    float _340 = precise::min(_332, 1.0);
    float _342 = abs(_330);
    float _344 = precise::max(_342, _338);
    float _346 = 1.0 / _344;
    float _348 = -_346;
    float _350 = _330 * _348;
    float _352 = _326 * _346;
    float _354 = _328 * _346;
    float3 _920 = float3(_352, _354, _350);
    float3 _358 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_920, float3(0.0), isnan(_920)), level(_340)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_920, float3(0.0), isnan(_920)), level(_340)).xyz;
    float _360 = _358.x;
    float _362 = _358.y;
    float _364 = _358.z;
    float _366 = in.m_61.x;
    float _368 = gl_FragCoord.w;
    float _370 = _366 * _368;
    float _372 = in.m_61.z;
    float _374 = gl_FragCoord.w;
    float _376 = _372 * _374;
    float _378 = in.m_61.y;
    float _380 = gl_FragCoord.w;
    float _382 = _378 * _380;
    float _384 = in.m_63.z;
    float _386 = gl_FragCoord.w;
    float _388 = _384 * _386;
    float _390 = in.m_63.x;
    float _392 = gl_FragCoord.w;
    float _394 = _390 * _392;
    float _396 = in.m_63.y;
    float _398 = gl_FragCoord.w;
    float _400 = _396 * _398;
    float _402 = in.m_65.x;
    float _404 = gl_FragCoord.w;
    float _406 = _402 * _404;
    float _408 = in.m_65.y;
    float _410 = gl_FragCoord.w;
    float _412 = _408 * _410;
    float _414 = in.m_65.z;
    float _416 = gl_FragCoord.w;
    float _418 = _414 * _416;
    float _420 = in.m_65.w;
    float _422 = gl_FragCoord.w;
    float _424 = _420 * _422;
    bool _426 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    if (_426)
    {
        float _428 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _430 = _184 + _428;
        _244 = _430;
    }
    float _432 = _244;
    float _434 = _432;
    if (_426)
    {
        float _436 = _432 * 8.0;
        float _438 = precise::clamp(_436, 0.0, 1.0);
        _434 = _438;
    }
    float _440 = _434;
    float _442 = _116 * _370;
    float _444 = _116 * _376;
    float _446 = _116 * _388;
    float _448 = _116 * _394;
    float _450 = _116 * _400;
    float _452 = _116 * _412;
    float _454 = fma(_360, 0.20999999344348907470703125, _442);
    float _456 = _116 * _382;
    float _458 = fma(_364, 0.20999999344348907470703125, _444);
    float _460 = _116 * _406;
    float _462 = _454 + _448;
    float _464 = fma(_362, 0.20999999344348907470703125, _456);
    float _466 = _458 + _446;
    float _468 = 0.0 + _218;
    float _470 = precise::clamp(_468, 0.0, 1.0);
    float _472 = _116 * _418;
    float _474 = _464 + _450;
    float _476 = _116 * _424;
    float _478 = _262 * _462;
    float _480 = _286 * _466;
    float _482 = _280 * _474;
    float _484 = _470;
    if (_426)
    {
        float _486 = _470 * _440;
        _484 = _486;
    }
    float _488 = _484;
    float _490 = fma(_478, _476, _460);
    float _492 = fma(_480, _476, _472);
    float _494 = fma(_482, _476, _452);
    float _496 = 0.0 + _488;
    float _498 = precise::clamp(_496, 0.0, 1.0);
    out.m_55.x = _490;
    out.m_55.y = _494;
    out.m_55.z = _492;
    out.m_55.w = _498;
    return out;
}

