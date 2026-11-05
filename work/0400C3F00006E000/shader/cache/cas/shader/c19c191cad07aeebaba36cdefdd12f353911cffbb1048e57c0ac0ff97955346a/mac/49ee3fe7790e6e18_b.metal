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
    texturecube<float> fp_t_tcb_1E [[id(5)]];
    sampler fp_t_tcb_1ESmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_1ESmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_51 [[color(0)]];
};

struct main0_in
{
    float4 m_48 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_42 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_38 [[user(locn5)]];
    float4 m_40 [[user(locn6)]];
    float4 m_44 [[user(locn7)]];
    float4 m_55 [[user(locn8)]];
    float4 m_57 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _66 = gl_FragCoord.w;
    float _68 = in.m_38.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = 1.0 / _66;
    float _76 = _74 * _72;
    bool _80 = _76 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _82 = isnan(_76);
    bool _84 = _80 || _82;
    bool _86 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _88 = _84 || _86;
    float _90 = in.m_40.y;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_40.x;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_40.z;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    if (!_88)
    {
        discard_fragment();
    }
    float _108 = in.m_42.y;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = _74 * _94;
    float _116 = _74 * _100;
    float _118 = _74 * _106;
    float _120 = in.m_42.x;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = _114 * _114;
    float _128 = fma(_116, _116, _126);
    float _130 = fma(_118, _118, _128);
    float _132 = rsqrt(_130);
    float _134 = _116 * _132;
    float _136 = _114 * _132;
    float _138 = _118 * _132;
    float _140 = abs(_134);
    float _142 = abs(_136);
    float _144 = precise::max(_140, _142);
    float _146 = abs(_138);
    float _148 = precise::max(_146, _144);
    float _150 = _74 * _124;
    float _152 = _74 * _112;
    float _154 = 1.0 / _148;
    float2 _663 = float2(_150, _152);
    float3 _158 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_663, float2(0.0), isnan(_663))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_663, float2(0.0), isnan(_663))).xyz;
    float _160 = _158.x;
    float _162 = _158.y;
    float _164 = _158.z;
    float _166 = -_154;
    float _168 = _138 * _166;
    float _170 = _134 * _154;
    float _172 = _136 * _154;
    float3 _692 = float3(_170, _172, _168);
    float3 _174 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_692, float3(0.0), isnan(_692)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_692, float3(0.0), isnan(_692)), level(0.0)).xyz;
    float _176 = _174.x;
    float _178 = _174.y;
    float _180 = _174.z;
    float _182 = in.m_44.y;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = in.m_44.x;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = in.m_44.z;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = _136 * _136;
    float _202 = in.m_46.x;
    float _204 = gl_FragCoord.w;
    float _206 = _202 * _204;
    float _208 = in.m_48.x;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    float _214 = fma(_134, _134, _200);
    float _216 = fma(_138, _138, _214);
    float _218 = rsqrt(_216);
    float _220 = _74 * _186;
    float _222 = _74 * _192;
    float _224 = in.m_46.y;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = _136 * _218;
    float _232 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _234 = _220 + _232;
    float _236 = _74 * _198;
    float _238 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _240 = _222 + _238;
    float _242 = _134 * _218;
    float _244 = _234 * _234;
    float _246 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _248 = _236 + _246;
    float _250 = _138 * _218;
    float _252 = fma(_240, _240, _244);
    float _254 = fma(_248, _248, _252);
    float _256 = rsqrt(_254);
    float _258 = in.m_48.z;
    float _260 = gl_FragCoord.w;
    float _262 = _258 * _260;
    float _264 = _74 * _228;
    float _266 = _234 * _256;
    float _268 = _240 * _256;
    float _270 = _248 * _256;
    float _272 = in.m_48.y;
    float _274 = gl_FragCoord.w;
    float _276 = _272 * _274;
    float _278 = _266 * _266;
    float _280 = fma(_268, _268, _278);
    float _282 = fma(_270, _270, _280);
    float _284 = in.m_46.z;
    float _286 = gl_FragCoord.w;
    float _288 = _284 * _286;
    float _290 = rsqrt(_282);
    float _292 = _266 * _290;
    float _294 = _268 * _290;
    float _296 = _270 * _290;
    float _298 = _230 * _292;
    float _300 = fma(_242, _294, _298);
    float _302 = fma(_250, _296, _300);
    float _304 = _74 * _288;
    float _306 = _74 * _276;
    float _308 = abs(_302);
    float _310 = fma(_308, -1.25000011920928955078125, 1.12500011920928955078125);
    float _312 = precise::clamp(_310, 0.0, 1.0);
    float _314 = _74 * _262;
    float _316 = -_264;
    float _318 = _316 + _306;
    float _320 = fma(_312, -2.0, 3.0);
    float _322 = _312 * _312;
    float _324 = -_304;
    float _326 = _324 + _314;
    float _328 = _320 * _322;
    float _330 = _74 * _206;
    float _332 = _74 * _212;
    float _334 = -_330;
    float _336 = _334 + _332;
    float _338 = fma(_160, 0.5, _328);
    float _340 = fma(_164, 0.5, _328);
    float _342 = fma(_162, 0.5, _328);
    float _344 = fma(_338, _336, _330);
    float _346 = fma(_340, _326, _304);
    float _348 = fma(_342, _318, _264);
    if (!_88)
    {
        out.m_51.x = 0.006000000052154064178466796875;
        out.m_51.y = 0.00200000009499490261077880859375;
        out.m_51.z = 0.001000000047497451305389404296875;
        out.m_51.w = 1.0;
        return out;
    }
    float _350 = _348 * 0.715200006961822509765625;
    float _352 = in.m_53.y;
    float _354 = gl_FragCoord.w;
    float _356 = _352 * _354;
    float _358 = in.m_53.z;
    float _360 = gl_FragCoord.w;
    float _362 = _358 * _360;
    float _364 = in.m_53.x;
    float _366 = gl_FragCoord.w;
    float _368 = _364 * _366;
    float _370 = fma(_344, 0.2125999927520751953125, _350);
    float _372 = in.m_55.z;
    float _374 = gl_FragCoord.w;
    float _376 = _372 * _374;
    float _378 = in.m_55.x;
    float _380 = gl_FragCoord.w;
    float _382 = _378 * _380;
    float _384 = in.m_55.y;
    float _386 = gl_FragCoord.w;
    float _388 = _384 * _386;
    float _390 = fma(_346, 0.072200000286102294921875, _370);
    float _392 = in.m_57.y;
    float _394 = gl_FragCoord.w;
    float _396 = _392 * _394;
    float _398 = in.m_57.w;
    float _400 = gl_FragCoord.w;
    float _402 = _398 * _400;
    float _404 = in.m_57.z;
    float _406 = gl_FragCoord.w;
    float _408 = _404 * _406;
    float _410 = 1.0 / _390;
    float _412 = in.m_57.x;
    float _414 = gl_FragCoord.w;
    float _416 = _412 * _414;
    float _418 = 0.0 + _76;
    float _420 = precise::clamp(_418, 0.0, 1.0);
    bool _422 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _424 = _410 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _426 = precise::clamp(_424, 0.0, 1.0);
    float _428 = fma(_426, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _430 = _74 * _356;
    float _432 = _74 * _362;
    float _434 = _74 * _368;
    float _436 = _344 * _428;
    float _438 = fma(_178, 0.20999999344348907470703125, _430);
    float _440 = fma(_180, 0.20999999344348907470703125, _432);
    float _442 = _74 * _376;
    float _444 = fma(_176, 0.20999999344348907470703125, _434);
    float _446 = _348 * _428;
    float _448 = _74 * _382;
    float _450 = _74 * _388;
    float _452 = _346 * _428;
    float _454 = _440 + _442;
    float _456 = _444 + _448;
    float _458 = _438 + _450;
    float _460 = _74 * _402;
    float _462 = fma(_454, 0.001000000047497451305389404296875, _452);
    float _464 = _74 * _396;
    float _466 = _74 * _408;
    float _468 = fma(_456, 0.006000000052154064178466796875, _436);
    float _470 = fma(_458, 0.00200000009499490261077880859375, _446);
    float _472 = _74 * _416;
    float _474 = fma(_462, _460, _466);
    float _476 = _466;
    if (!_422)
    {
        _476 = _420;
    }
    float _478 = _476;
    float _480 = fma(_470, _460, _464);
    float _482 = fma(_468, _460, _472);
    bool _484 = !_422;
    float _486 = _478;
    if (!_484)
    {
        float _488 = in.m_59.w;
        float _490 = gl_FragCoord.w;
        float _492 = _488 * _490;
        float _494 = in.m_59.z;
        float _496 = gl_FragCoord.w;
        float _498 = _494 * _496;
        float _500 = _74 * _492;
        float _502 = _74 * _498;
        float _504 = 1.0 / _500;
        float _506 = _502 * _504;
        float _508 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _510 = fma(_506, (*spvDescriptorSet0.fp_c8)._m0[30].w, _508);
        float _512 = 1.0 / _510;
        float _514 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _516 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _518 = fma(_512, _514, _516);
        float _520 = _518 * 8.0;
        float _522 = precise::clamp(_520, 0.0, 1.0);
        float _524 = _420 * _522;
        _486 = _524;
    }
    float _526 = _486;
    float _528 = 0.0 + _526;
    float _530 = precise::clamp(_528, 0.0, 1.0);
    out.m_51.x = _482;
    out.m_51.y = _480;
    out.m_51.z = _474;
    out.m_51.w = _530;
    return out;
}

