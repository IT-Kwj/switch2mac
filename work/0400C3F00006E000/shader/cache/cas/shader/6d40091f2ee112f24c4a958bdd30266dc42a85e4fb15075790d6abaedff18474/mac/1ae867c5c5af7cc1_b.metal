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
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texturecube<float> fp_t_tcb_1E [[id(5)]];
    sampler fp_t_tcb_1ESmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_1ESmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_40 [[user(locn4)]];
    float4 m_38 [[user(locn5)]];
    float4 m_65 [[user(locn6)]];
    float4 m_51 [[user(locn7)]];
    float4 m_61 [[user(locn8)]];
    float4 m_57 [[user(locn9)]];
    float4 m_63 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _72 = gl_FragCoord.w;
    float _74 = in.m_38.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_38.y;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = 1.0 / _72;
    float _88 = _86 * _78;
    float _90 = _86 * _84;
    float2 _544 = float2(_88, _90);
    float4 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_544, float2(0.0), isnan(_544))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_544, float2(0.0), isnan(_544))).xyzw;
    float _95 = _93.x;
    float _97 = _93.y;
    float _99 = _93.z;
    float _101 = _93.w;
    float _103 = in.m_40.w;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_42.w;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_44.x;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = _86 * _107;
    float _123 = _86 * _113;
    float _125 = in.m_42.y;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_46.y;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_42.z;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_46.z;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_40.x;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_40.y;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = in.m_40.z;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = _86 * _135;
    float _169 = _86 * _141;
    float _171 = _101 * _121;
    float _173 = _123 * _171;
    float _175 = _86 * _119;
    float _177 = 0.0 + _173;
    float _179 = precise::clamp(_177, 0.0, 1.0);
    float _181 = _179 * _175;
    bool _184 = _181 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _186 = isnan(_181);
    bool _188 = _184 || _186;
    bool _190 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _192 = _188 || _190;
    float _194 = in.m_42.x;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = in.m_46.x;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    if (!_192)
    {
        discard_fragment();
    }
    float _206 = _95 * _95;
    float _208 = _97 * _97;
    float _210 = _99 * _99;
    float _212 = _86 * _198;
    float _214 = _86 * _204;
    float _216 = _86 * _129;
    float _218 = _86 * _147;
    float _220 = -_214;
    float _222 = _212 + _220;
    float _224 = -_167;
    float _226 = _216 + _224;
    float _228 = -_218;
    float _230 = _169 + _228;
    float _232 = fma(_206, _222, _214);
    float _234 = fma(_208, _226, _167);
    float _236 = fma(_210, _230, _218);
    float _238 = _86 * _153;
    float _240 = _86 * _159;
    float _242 = _86 * _165;
    float _244 = _232 * _238;
    float _246 = _234 * _240;
    float _248 = _236 * _242;
    if (!_192)
    {
        out.m_49.x = _244;
        out.m_49.y = _246;
        out.m_49.z = _248;
        out.m_49.w = _173;
        return out;
    }
    float _250 = in.m_51.y;
    float _252 = gl_FragCoord.w;
    float _254 = _250 * _252;
    float _256 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _258 = in.m_51.x;
    float _260 = gl_FragCoord.w;
    float _262 = _258 * _260;
    float _264 = in.m_51.z;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = in.m_57.x;
    float _272 = gl_FragCoord.w;
    float _274 = _270 * _272;
    float _276 = _86 * _254;
    bool _278 = as_type<int>(_256) != 0;
    float _280 = _86 * _262;
    bool _282 = !_278;
    float _284 = -_276;
    float _286 = _282 ? _284 : _276;
    float _288 = _86 * _268;
    bool _290 = !_278;
    float _292 = -_280;
    float _294 = _290 ? _292 : _280;
    float _296 = _286 * _286;
    bool _298 = !_278;
    float _300 = -_288;
    float _302 = _298 ? _300 : _288;
    float _304 = fma(_294, _294, _296);
    float _306 = fma(_302, _302, _304);
    float _308 = rsqrt(_306);
    float _310 = _294 * _308;
    float _312 = _286 * _308;
    float _314 = _302 * _308;
    float _316 = abs(_310);
    float _318 = abs(_312);
    float _320 = precise::max(_316, _318);
    float _322 = abs(_314);
    float _324 = precise::max(_322, _320);
    float _326 = _86 * _274;
    float _328 = 1.0 / _324;
    float _330 = precise::min(_326, 1.0);
    float _332 = -_328;
    float _334 = _314 * _332;
    float _336 = _310 * _328;
    float _338 = _312 * _328;
    float3 _898 = float3(_336, _338, _334);
    float3 _342 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_898, float3(0.0), isnan(_898)), level(_330)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_898, float3(0.0), isnan(_898)), level(_330)).xyz;
    float _344 = _342.x;
    float _346 = _342.y;
    float _348 = _342.z;
    float _350 = in.m_59.y;
    float _352 = gl_FragCoord.w;
    float _354 = _350 * _352;
    float _356 = in.m_59.z;
    float _358 = gl_FragCoord.w;
    float _360 = _356 * _358;
    float _362 = in.m_59.x;
    float _364 = gl_FragCoord.w;
    float _366 = _362 * _364;
    float _368 = in.m_61.y;
    float _370 = gl_FragCoord.w;
    float _372 = _368 * _370;
    float _374 = in.m_61.z;
    float _376 = gl_FragCoord.w;
    float _378 = _374 * _376;
    float _380 = in.m_61.x;
    float _382 = gl_FragCoord.w;
    float _384 = _380 * _382;
    float _386 = in.m_63.x;
    float _388 = gl_FragCoord.w;
    float _390 = _386 * _388;
    float _392 = in.m_63.w;
    float _394 = gl_FragCoord.w;
    float _396 = _392 * _394;
    float _398 = in.m_63.y;
    float _400 = gl_FragCoord.w;
    float _402 = _398 * _400;
    float _404 = in.m_63.z;
    float _406 = gl_FragCoord.w;
    float _408 = _404 * _406;
    float _410 = _86 * _354;
    float _412 = _86 * _360;
    float _414 = _86 * _366;
    bool _416 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _418 = fma(_346, 0.20999999344348907470703125, _410);
    float _420 = fma(_348, 0.20999999344348907470703125, _412);
    float _422 = fma(_344, 0.20999999344348907470703125, _414);
    float _424 = _86 * _372;
    float _426 = _86 * _378;
    float _428 = _86 * _384;
    float _430 = _418 + _424;
    float _432 = _420 + _426;
    float _434 = _422 + _428;
    float _436 = _86 * _396;
    float _438 = _246 * _430;
    float _440 = _248 * _432;
    float _442 = _244 * _434;
    float _444 = 0.0 + _181;
    float _446 = precise::clamp(_444, 0.0, 1.0);
    float _448 = _86 * _390;
    float _450 = _86 * _402;
    float _452 = _86 * _408;
    float _454 = fma(_442, _436, _448);
    float _456 = fma(_438, _436, _450);
    float _458 = fma(_440, _436, _452);
    float _460 = _448;
    if (!_416)
    {
        _460 = _446;
    }
    float _462 = _460;
    bool _464 = !_416;
    float _466 = _462;
    if (!_464)
    {
        float _468 = in.m_65.w;
        float _470 = gl_FragCoord.w;
        float _472 = _468 * _470;
        float _474 = in.m_65.z;
        float _476 = gl_FragCoord.w;
        float _478 = _474 * _476;
        float _480 = _86 * _472;
        float _482 = _86 * _478;
        float _484 = 1.0 / _480;
        float _486 = _482 * _484;
        float _488 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _490 = fma(_486, (*spvDescriptorSet0.fp_c8)._m0[30].w, _488);
        float _492 = 1.0 / _490;
        float _494 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _496 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _498 = fma(_492, _494, _496);
        float _500 = _498 * 8.0;
        float _502 = precise::clamp(_500, 0.0, 1.0);
        float _504 = _446 * _502;
        _466 = _504;
    }
    float _506 = _466;
    float _508 = 0.0 + _506;
    float _510 = precise::clamp(_508, 0.0, 1.0);
    out.m_49.x = _454;
    out.m_49.y = _456;
    out.m_49.z = _458;
    out.m_49.w = _510;
    return out;
}

