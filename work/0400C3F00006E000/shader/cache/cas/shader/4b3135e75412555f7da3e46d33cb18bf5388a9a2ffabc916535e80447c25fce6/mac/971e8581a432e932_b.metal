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
    texture2d_array<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_57 [[color(0)]];
};

struct main0_in
{
    float4 m_52 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_42 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
    float4 m_44 [[user(locn5), flat]];
    float4 m_61 [[user(locn6)]];
    float4 m_54 [[user(locn7)]];
    float4 m_38 [[user(locn8), flat]];
    float4 m_59 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _68 = in.m_38.x;
    float _70 = gl_FragCoord.w;
    float _72 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].x;
    float _74 = in.m_42.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_42.y;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_42.z;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_42.w;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = _68 + 1.0;
    float _100 = 1.0 / _70;
    float _102 = _98 * _72;
    float _104 = rint(_68);
    float _106 = precise::max(_104, 0.0);
    uint _109 = uint(_106);
    uint _111 = clamp(_109, 0u, 65535u);
    float _113 = floor(_102);
    float _115 = _100 * _78;
    float _117 = _100 * _90;
    float _119 = -_113;
    float _121 = fma(_119, (*spvDescriptorSet0.fp_c9)._m0[22].x, _98);
    float _123 = _100 * _84;
    float _125 = _100 * _96;
    float _127 = rint(_121);
    float _129 = precise::max(_127, 0.0);
    uint _131 = uint(_129);
    uint _133 = clamp(_131, 0u, 65535u);
    float3 _630 = float3(_115, _123, float(int(_111)));
    float3 _634 = select(_630, float3(0.0), isnan(_630));
    float4 _136 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _634.xy, uint(rint(_634.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _634.xy, uint(rint(_634.z))).xyzw;
    float _138 = _136.x;
    float _140 = _136.y;
    float _142 = _136.z;
    float _144 = _136.w;
    float3 _651 = float3(_115, _123, float(int(_133)));
    float3 _653 = select(_651, float3(0.0), isnan(_651));
    float4 _146 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _653.xy, uint(rint(_653.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _653.xy, uint(rint(_653.z))).xyzw;
    float _148 = _146.x;
    float _150 = _146.y;
    float _152 = _146.z;
    float _154 = _146.w;
    float2 _668 = float2(_117, _125);
    float4 _156 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_668, float2(0.0), isnan(_668))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_668, float2(0.0), isnan(_668))).xyzw;
    float _158 = _156.x;
    float _160 = _156.y;
    float _162 = _156.z;
    float _164 = _156.w;
    float _166 = in.m_44.y;
    float _168 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].y;
    float _170 = in.m_46.w;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = in.m_48.x;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = _166 * _168;
    float _184 = _182 * _168;
    float _186 = in.m_50.w;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = floor(_184);
    float _194 = -_192;
    float _196 = fma(_194, (*spvDescriptorSet0.fp_c9)._m0[22].y, _182);
    float _198 = in.m_52.w;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = _196 + 9.9999997473787516355514526367188e-05;
    float _206 = floor(_204);
    float _208 = -_206;
    float _210 = _204 + _208;
    float _212 = _100 * _180;
    float _214 = _100 * _202;
    float _216 = _100 * _190;
    float _218 = in.m_54.y;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = -_144;
    float _226 = _224 + _154;
    float _228 = fma(_210, _226, _144);
    float _230 = _228 * _164;
    float _232 = _100 * _174;
    float _234 = -_214;
    float _236 = fma(_230, _232, _234);
    float _238 = _216 * _236;
    float _240 = 0.0 + _238;
    float _242 = precise::clamp(_240, 0.0, 1.0);
    float _244 = _242 * _212;
    bool _248 = _244 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _250 = isnan(_244);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _256 = _252 || _254;
    float _258 = in.m_54.x;
    float _260 = gl_FragCoord.w;
    float _262 = _258 * _260;
    if (!_256)
    {
        discard_fragment();
    }
    float _264 = _100 * _262;
    float _266 = _100 * _222;
    float2 _824 = float2(_264, _266);
    float3 _270 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_824, float2(0.0), isnan(_824))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_824, float2(0.0), isnan(_824))).xyz;
    float _272 = _270.x;
    float _274 = _270.y;
    float _276 = _270.z;
    float _278 = in.m_52.z;
    float _280 = gl_FragCoord.w;
    float _282 = _278 * _280;
    float _284 = in.m_50.z;
    float _286 = gl_FragCoord.w;
    float _288 = _284 * _286;
    float _290 = in.m_52.x;
    float _292 = gl_FragCoord.w;
    float _294 = _290 * _292;
    float _296 = in.m_50.x;
    float _298 = gl_FragCoord.w;
    float _300 = _296 * _298;
    float _302 = in.m_52.y;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = in.m_50.y;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = -_138;
    float _316 = _314 + _148;
    float _318 = -_140;
    float _320 = _318 + _150;
    float _322 = -_142;
    float _324 = _322 + _152;
    float _326 = _160 * _160;
    float _328 = fma(_210, _316, _138);
    float _330 = fma(_210, _320, _140);
    float _332 = fma(_210, _324, _142);
    float _334 = in.m_46.y;
    float _336 = gl_FragCoord.w;
    float _338 = _334 * _336;
    float _340 = in.m_46.x;
    float _342 = gl_FragCoord.w;
    float _344 = _340 * _342;
    float _346 = in.m_46.z;
    float _348 = gl_FragCoord.w;
    float _350 = _346 * _348;
    float _352 = _330 * _330;
    float _354 = _158 * _158;
    float _356 = _328 * _328;
    float _358 = _162 * _162;
    float _360 = _352 * _326;
    float _362 = _332 * _332;
    float _364 = _356 * _354;
    float _366 = _362 * _358;
    float _368 = _100 * _282;
    float _370 = _100 * _294;
    float _372 = _100 * _300;
    float _374 = _100 * _306;
    float _376 = _100 * _312;
    float _378 = -_372;
    float _380 = _370 + _378;
    float _382 = -_376;
    float _384 = _374 + _382;
    float _386 = _100 * _344;
    float _388 = _100 * _350;
    float _390 = _274 * _274;
    float _392 = _272 * _272;
    float _394 = _100 * _288;
    float _396 = _360 * _390;
    float _398 = _276 * _276;
    float _400 = -_394;
    float _402 = _368 + _400;
    float _404 = _364 * _392;
    float _406 = fma(_396, _384, _376);
    float _408 = _366 * _398;
    float _410 = fma(_404, _380, _372);
    float _412 = fma(_408, _402, _394);
    float _414 = _100 * _338;
    float _416 = _410 * _386;
    float _418 = _412 * _388;
    float _420 = _406 * _414;
    if (!_256)
    {
        out.m_57.x = _416;
        out.m_57.y = _420;
        out.m_57.z = _418;
        out.m_57.w = _238;
        return out;
    }
    float _422 = _420 * 0.715200006961822509765625;
    float _424 = in.m_59.w;
    float _426 = gl_FragCoord.w;
    float _428 = _424 * _426;
    float _430 = in.m_59.z;
    float _432 = gl_FragCoord.w;
    float _434 = _430 * _432;
    float _436 = in.m_59.x;
    float _438 = gl_FragCoord.w;
    float _440 = _436 * _438;
    float _442 = fma(_416, 0.2125999927520751953125, _422);
    float _444 = in.m_59.y;
    float _446 = gl_FragCoord.w;
    float _448 = _444 * _446;
    float _450 = 0.0 + _244;
    float _452 = precise::clamp(_450, 0.0, 1.0);
    float _454 = fma(_418, 0.072200000286102294921875, _442);
    bool _456 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _458 = 1.0 / _454;
    float _460 = _458 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _462 = precise::clamp(_460, 0.0, 1.0);
    float _464 = _100 * _428;
    float _466 = fma(_462, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _468 = _100 * _434;
    float _470 = _466 * _464;
    float _472 = _100 * _440;
    float _474 = _100 * _448;
    float _476 = fma(_418, _470, _468);
    float _478 = fma(_416, _470, _472);
    float _480 = fma(_420, _470, _474);
    float _482 = _468;
    if (!_456)
    {
        _482 = _452;
    }
    float _484 = _482;
    bool _486 = !_456;
    float _488 = _484;
    if (!_486)
    {
        float _490 = in.m_61.w;
        float _492 = gl_FragCoord.w;
        float _494 = _490 * _492;
        float _496 = in.m_61.z;
        float _498 = gl_FragCoord.w;
        float _500 = _496 * _498;
        float _502 = _100 * _494;
        float _504 = _100 * _500;
        float _506 = 1.0 / _502;
        float _508 = _504 * _506;
        float _510 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _512 = fma(_508, (*spvDescriptorSet0.fp_c8)._m0[30].w, _510);
        float _514 = 1.0 / _512;
        float _516 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _518 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _520 = fma(_514, _516, _518);
        float _522 = _520 * 8.0;
        float _524 = precise::clamp(_522, 0.0, 1.0);
        float _526 = _452 * _524;
        _488 = _526;
    }
    float _528 = _488;
    float _530 = 0.0 + _528;
    float _532 = precise::clamp(_530, 0.0, 1.0);
    out.m_57.x = _478;
    out.m_57.y = _480;
    out.m_57.z = _476;
    out.m_57.w = _532;
    return out;
}

