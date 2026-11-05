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
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_53 [[color(0)]];
};

struct main0_in
{
    float4 m_50 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_40 [[user(locn3)]];
    float4 m_44 [[user(locn4)]];
    float4 m_42 [[user(locn5), flat]];
    float4 m_57 [[user(locn6)]];
    float4 m_36 [[user(locn7), flat]];
    float4 m_55 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _64 = in.m_36.x;
    float _66 = gl_FragCoord.w;
    float _68 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].x;
    float _70 = in.m_40.x;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_40.y;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_40.z;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_40.w;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = _64 + 1.0;
    float _96 = 1.0 / _66;
    float _98 = _94 * _68;
    float _100 = rint(_64);
    float _102 = precise::max(_100, 0.0);
    uint _105 = uint(_102);
    uint _107 = clamp(_105, 0u, 65535u);
    float _109 = floor(_98);
    float _111 = _96 * _74;
    float _113 = _96 * _86;
    float _115 = _96 * _92;
    float _117 = -_109;
    float _119 = fma(_117, (*spvDescriptorSet0.fp_c9)._m0[22].x, _94);
    float _121 = _96 * _80;
    float _123 = rint(_119);
    float _125 = precise::max(_123, 0.0);
    uint _127 = uint(_125);
    uint _129 = clamp(_127, 0u, 65535u);
    float3 _589 = float3(_111, _121, float(int(_107)));
    float3 _593 = select(_589, float3(0.0), isnan(_589));
    float4 _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _593.xy, uint(rint(_593.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _593.xy, uint(rint(_593.z))).xyzw;
    float _134 = _132.x;
    float _136 = _132.y;
    float _138 = _132.z;
    float _140 = _132.w;
    float3 _610 = float3(_111, _121, float(int(_129)));
    float3 _612 = select(_610, float3(0.0), isnan(_610));
    float4 _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _612.xy, uint(rint(_612.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _612.xy, uint(rint(_612.z))).xyzw;
    float _144 = _142.x;
    float _146 = _142.y;
    float _148 = _142.z;
    float _150 = _142.w;
    float2 _627 = float2(_113, _115);
    float4 _152 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_627, float2(0.0), isnan(_627))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_627, float2(0.0), isnan(_627))).xyzw;
    float _154 = _152.x;
    float _156 = _152.y;
    float _158 = _152.z;
    float _160 = _152.w;
    float _162 = in.m_42.y;
    float _164 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].y;
    float _166 = in.m_44.w;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = in.m_46.x;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = _162 * _164;
    float _180 = _178 * _164;
    float _182 = in.m_48.w;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = floor(_180);
    float _190 = -_188;
    float _192 = fma(_190, (*spvDescriptorSet0.fp_c9)._m0[22].y, _178);
    float _194 = in.m_50.w;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = _192 + 9.9999997473787516355514526367188e-05;
    float _202 = floor(_200);
    float _204 = -_202;
    float _206 = _200 + _204;
    float _208 = _96 * _176;
    float _210 = _96 * _198;
    float _212 = _96 * _186;
    float _214 = in.m_50.x;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = in.m_48.x;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    float _226 = in.m_50.y;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = in.m_48.y;
    float _234 = gl_FragCoord.w;
    float _236 = _232 * _234;
    float _238 = in.m_44.x;
    float _240 = gl_FragCoord.w;
    float _242 = _238 * _240;
    float _244 = _96 * _236;
    float _246 = _96 * _242;
    float _248 = -_140;
    float _250 = _248 + _150;
    float _252 = fma(_206, _250, _140);
    float _254 = _96 * _170;
    float _256 = _252 * _160;
    float _258 = -_210;
    float _260 = fma(_256, _254, _258);
    float _262 = _212 * _260;
    float _264 = 0.0 + _262;
    float _266 = precise::clamp(_264, 0.0, 1.0);
    float _268 = _266 * _208;
    bool _272 = _268 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _274 = isnan(_268);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _280 = _276 || _278;
    float _282 = in.m_50.z;
    float _284 = gl_FragCoord.w;
    float _286 = _282 * _284;
    float _288 = in.m_48.z;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = in.m_44.y;
    float _296 = gl_FragCoord.w;
    float _298 = _294 * _296;
    float _300 = in.m_44.z;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    if (!_280)
    {
        discard_fragment();
    }
    float _306 = -_134;
    float _308 = _306 + _144;
    float _310 = -_136;
    float _312 = _310 + _146;
    float _314 = -_138;
    float _316 = _314 + _148;
    float _318 = _154 * _154;
    float _320 = fma(_206, _308, _134);
    float _322 = fma(_206, _312, _136);
    float _324 = fma(_206, _316, _138);
    float _326 = _96 * _218;
    float _328 = _320 * _320;
    float _330 = _96 * _224;
    float _332 = _156 * _156;
    float _334 = _322 * _322;
    float _336 = _328 * _318;
    float _338 = _96 * _230;
    float _340 = _158 * _158;
    float _342 = _324 * _324;
    float _344 = _96 * _286;
    float _346 = _96 * _292;
    float _348 = -_330;
    float _350 = _326 + _348;
    float _352 = _334 * _332;
    float _354 = _342 * _340;
    float _356 = -_244;
    float _358 = _338 + _356;
    float _360 = -_346;
    float _362 = _344 + _360;
    float _364 = fma(_336, _350, _330);
    float _366 = _96 * _298;
    float _368 = fma(_352, _358, _244);
    float _370 = fma(_354, _362, _346);
    float _372 = _96 * _304;
    float _374 = _364 * _246;
    float _376 = _368 * _366;
    float _378 = _370 * _372;
    if (!_280)
    {
        out.m_53.x = _374;
        out.m_53.y = _376;
        out.m_53.z = _378;
        out.m_53.w = _262;
        return out;
    }
    float _380 = _376 * 0.715200006961822509765625;
    float _382 = in.m_55.w;
    float _384 = gl_FragCoord.w;
    float _386 = _382 * _384;
    float _388 = in.m_55.z;
    float _390 = gl_FragCoord.w;
    float _392 = _388 * _390;
    float _394 = in.m_55.x;
    float _396 = gl_FragCoord.w;
    float _398 = _394 * _396;
    float _400 = fma(_374, 0.2125999927520751953125, _380);
    float _402 = in.m_55.y;
    float _404 = gl_FragCoord.w;
    float _406 = _402 * _404;
    float _408 = 0.0 + _268;
    float _410 = precise::clamp(_408, 0.0, 1.0);
    float _412 = fma(_378, 0.072200000286102294921875, _400);
    bool _414 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _416 = 1.0 / _412;
    float _418 = _416 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _420 = precise::clamp(_418, 0.0, 1.0);
    float _422 = _96 * _386;
    float _424 = fma(_420, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _426 = _96 * _392;
    float _428 = _424 * _422;
    float _430 = _96 * _398;
    float _432 = _96 * _406;
    float _434 = fma(_378, _428, _426);
    float _436 = fma(_374, _428, _430);
    float _438 = fma(_376, _428, _432);
    float _440 = _426;
    if (!_414)
    {
        _440 = _410;
    }
    float _442 = _440;
    bool _444 = !_414;
    float _446 = _442;
    if (!_444)
    {
        float _448 = in.m_57.w;
        float _450 = gl_FragCoord.w;
        float _452 = _448 * _450;
        float _454 = in.m_57.z;
        float _456 = gl_FragCoord.w;
        float _458 = _454 * _456;
        float _460 = _96 * _452;
        float _462 = _96 * _458;
        float _464 = 1.0 / _460;
        float _466 = _462 * _464;
        float _468 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _470 = fma(_466, (*spvDescriptorSet0.fp_c8)._m0[30].w, _468);
        float _472 = 1.0 / _470;
        float _474 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _476 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _478 = fma(_472, _474, _476);
        float _480 = _478 * 8.0;
        float _482 = precise::clamp(_480, 0.0, 1.0);
        float _484 = _410 * _482;
        _446 = _484;
    }
    float _486 = _446;
    float _488 = 0.0 + _486;
    float _490 = precise::clamp(_488, 0.0, 1.0);
    out.m_53.x = _436;
    out.m_53.y = _438;
    out.m_53.z = _434;
    out.m_53.w = _490;
    return out;
}

