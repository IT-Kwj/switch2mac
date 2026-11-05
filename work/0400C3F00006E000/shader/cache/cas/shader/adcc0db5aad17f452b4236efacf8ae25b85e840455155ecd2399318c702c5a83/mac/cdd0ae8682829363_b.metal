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
    texture2d_array<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texturecube<float> fp_t_tcb_1E [[id(7)]];
    sampler fp_t_tcb_1ESmplr [[id(8)]];
    sampler fp_t_tcb_10Smplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_1ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_56 [[color(0)]];
};

struct main0_in
{
    float4 m_51 [[user(locn0)]];
    float4 m_53 [[user(locn2)]];
    float4 m_62 [[user(locn3)]];
    float4 m_49 [[user(locn4), flat]];
    float4 m_47 [[user(locn5)]];
    float4 m_45 [[user(locn6)]];
    float4 m_43 [[user(locn7), flat]];
    float4 m_58 [[user(locn8)]];
    float4 m_64 [[user(locn9)]];
    float4 m_60 [[user(locn10)]];
    float4 m_66 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _73 = gl_FragCoord.w;
    float _75 = in.m_43.x;
    float _77 = in.m_45.w;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].x;
    float _85 = in.m_45.x;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_45.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_47.x;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_47.y;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = 1.0 / _73;
    float _111 = _75 + 1.0;
    float _113 = _111 * _83;
    float _115 = rint(_75);
    float _117 = precise::max(_115, 0.0);
    uint _120 = uint(_117);
    uint _122 = clamp(_120, 0u, 65535u);
    float _124 = _109 * _81;
    float _126 = floor(_113);
    float _128 = _109 * _89;
    float _130 = _109 * _101;
    float _132 = 1.0 / _124;
    float _134 = -_126;
    float _136 = fma(_134, (*spvDescriptorSet0.fp_c9)._m0[22].x, _111);
    float _138 = _109 * _95;
    float _140 = rint(_136);
    float _142 = precise::max(_140, 0.0);
    uint _144 = uint(_142);
    uint _146 = clamp(_144, 0u, 65535u);
    float _148 = _128 * _132;
    float _150 = _138 * _132;
    float _152 = _109 * _107;
    float2 _613 = float2(_148, _150);
    float _154 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_613, float2(0.0), isnan(_613))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_613, float2(0.0), isnan(_613))).x;
    float3 _626 = float3(_130, _152, float(int(_122)));
    float3 _630 = select(_626, float3(0.0), isnan(_626));
    float _156 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _630.xy, uint(rint(_630.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _630.xy, uint(rint(_630.z))).w;
    float3 _639 = float3(_130, _152, float(int(_146)));
    float3 _641 = select(_639, float3(0.0), isnan(_639));
    float _158 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _641.xy, uint(rint(_641.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _641.xy, uint(rint(_641.z))).w;
    float _160 = in.m_49.y;
    float _162 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].y;
    float _164 = in.m_45.z;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = in.m_51.w;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = _160 * _162;
    float _178 = _109 * _168;
    float _180 = _176 * _162;
    float _182 = in.m_53.x;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = floor(_180);
    float _190 = -_188;
    float _192 = fma(_190, (*spvDescriptorSet0.fp_c9)._m0[22].y, _176);
    float _194 = _192 + 9.9999997473787516355514526367188e-05;
    float _196 = _178 * _132;
    float _198 = floor(_194);
    float _200 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _202 = fma(_196, (*spvDescriptorSet0.fp_c8)._m0[30].w, _200);
    float _204 = 1.0 / _202;
    float _206 = -_198;
    float _208 = _194 + _206;
    float _210 = _109 * _174;
    float _212 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _214 = _204 * _212;
    float _216 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _218 = fma(_154, (*spvDescriptorSet0.fp_c8)._m0[30].w, _216);
    float _220 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _222 = -_156;
    float _224 = _222 + _158;
    float _226 = 1.0 / _218;
    float _228 = fma(_208, _224, _156);
    float _230 = _109 * _186;
    float _232 = _228 * _210;
    float _234 = 0.0 + _232;
    float _236 = precise::clamp(_234, 0.0, 1.0);
    float _238 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _240 = -_214;
    float _242 = fma(_226, _238, _240);
    float _244 = _242 * _220;
    float _246 = precise::clamp(_244, 0.0, 1.0);
    float _248 = _236 * _246;
    float _250 = _248 * _230;
    bool _254 = _250 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _256 = isnan(_250);
    bool _258 = _254 || _256;
    bool _260 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _262 = _258 || _260;
    float _264 = in.m_51.x;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = in.m_51.y;
    float _272 = gl_FragCoord.w;
    float _274 = _270 * _272;
    float _276 = in.m_51.z;
    float _278 = gl_FragCoord.w;
    float _280 = _276 * _278;
    float _282 = _214;
    if (!_262)
    {
        discard_fragment();
    }
    float _284 = _109 * _268;
    float _286 = _109 * _274;
    float _288 = _109 * _280;
    if (!_262)
    {
        out.m_56.x = _284;
        out.m_56.y = _286;
        out.m_56.z = _288;
        out.m_56.w = _232;
        return out;
    }
    float _290 = in.m_58.y;
    float _292 = gl_FragCoord.w;
    float _294 = _290 * _292;
    float _296 = in.m_58.x;
    float _298 = gl_FragCoord.w;
    float _300 = _296 * _298;
    float _302 = in.m_58.z;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = _109 * _294;
    float _310 = _109 * _300;
    float _312 = _109 * _306;
    float _314 = _308 * _308;
    float _316 = in.m_60.x;
    float _318 = gl_FragCoord.w;
    float _320 = _316 * _318;
    float _322 = fma(_310, _310, _314);
    float _324 = fma(_312, _312, _322);
    float _326 = rsqrt(_324);
    float _328 = _310 * _326;
    float _330 = _308 * _326;
    float _332 = _312 * _326;
    float _334 = _109 * _320;
    float _336 = abs(_328);
    float _338 = abs(_330);
    float _340 = precise::max(_336, _338);
    float _342 = precise::min(_334, 1.0);
    float _344 = abs(_332);
    float _346 = precise::max(_344, _340);
    float _348 = 1.0 / _346;
    float _350 = -_348;
    float _352 = _332 * _350;
    float _354 = _328 * _348;
    float _356 = _330 * _348;
    float3 _932 = float3(_354, _356, _352);
    float3 _360 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_932, float3(0.0), isnan(_932)), level(_342)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_932, float3(0.0), isnan(_932)), level(_342)).xyz;
    float _362 = _360.x;
    float _364 = _360.y;
    float _366 = _360.z;
    float _368 = in.m_62.x;
    float _370 = gl_FragCoord.w;
    float _372 = _368 * _370;
    float _374 = in.m_62.z;
    float _376 = gl_FragCoord.w;
    float _378 = _374 * _376;
    float _380 = in.m_62.y;
    float _382 = gl_FragCoord.w;
    float _384 = _380 * _382;
    float _386 = in.m_64.z;
    float _388 = gl_FragCoord.w;
    float _390 = _386 * _388;
    float _392 = in.m_64.x;
    float _394 = gl_FragCoord.w;
    float _396 = _392 * _394;
    float _398 = in.m_64.y;
    float _400 = gl_FragCoord.w;
    float _402 = _398 * _400;
    float _404 = in.m_66.x;
    float _406 = gl_FragCoord.w;
    float _408 = _404 * _406;
    float _410 = in.m_66.y;
    float _412 = gl_FragCoord.w;
    float _414 = _410 * _412;
    float _416 = in.m_66.z;
    float _418 = gl_FragCoord.w;
    float _420 = _416 * _418;
    float _422 = in.m_66.w;
    float _424 = gl_FragCoord.w;
    float _426 = _422 * _424;
    bool _428 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    if (_428)
    {
        float _430 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _432 = _214 + _430;
        _282 = _432;
    }
    float _434 = _282;
    float _436 = _434;
    if (_428)
    {
        float _438 = _434 * 8.0;
        float _440 = precise::clamp(_438, 0.0, 1.0);
        _436 = _440;
    }
    float _442 = _436;
    float _444 = _109 * _372;
    float _446 = _109 * _378;
    float _448 = _109 * _390;
    float _450 = _109 * _396;
    float _452 = _109 * _402;
    float _454 = _109 * _414;
    float _456 = fma(_362, 0.20999999344348907470703125, _444);
    float _458 = _109 * _384;
    float _460 = fma(_366, 0.20999999344348907470703125, _446);
    float _462 = _109 * _408;
    float _464 = _456 + _450;
    float _466 = fma(_364, 0.20999999344348907470703125, _458);
    float _468 = _460 + _448;
    float _470 = 0.0 + _250;
    float _472 = precise::clamp(_470, 0.0, 1.0);
    float _474 = _109 * _420;
    float _476 = _466 + _452;
    float _478 = _109 * _426;
    float _480 = _284 * _464;
    float _482 = _288 * _468;
    float _484 = _286 * _476;
    float _486 = _472;
    if (_428)
    {
        float _488 = _472 * _442;
        _486 = _488;
    }
    float _490 = _486;
    float _492 = fma(_480, _478, _462);
    float _494 = fma(_482, _478, _474);
    float _496 = fma(_484, _478, _454);
    float _498 = 0.0 + _490;
    float _500 = precise::clamp(_498, 0.0, 1.0);
    out.m_56.x = _492;
    out.m_56.y = _496;
    out.m_56.z = _494;
    out.m_56.w = _500;
    return out;
}

