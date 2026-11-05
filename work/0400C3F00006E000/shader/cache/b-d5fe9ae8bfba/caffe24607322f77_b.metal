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
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_CSmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_55 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_50 [[user(locn2)]];
    float4 m_40 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
    float4 m_42 [[user(locn5), flat]];
    float4 m_59 [[user(locn6)]];
    float4 m_52 [[user(locn7)]];
    float4 m_36 [[user(locn8), flat]];
    float4 m_57 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _66 = in.m_36.x;
    float _68 = gl_FragCoord.w;
    float _70 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].x;
    float _72 = in.m_40.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_40.y;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = _66 + 1.0;
    float _86 = 1.0 / _68;
    float _88 = _84 * _70;
    float _90 = floor(_88);
    float _92 = rint(_66);
    float _94 = precise::max(_92, 0.0);
    uint _97 = uint(_94);
    uint _99 = clamp(_97, 0u, 65535u);
    float _101 = _86 * _76;
    float _103 = -_90;
    float _105 = fma(_103, (*spvDescriptorSet0.fp_c9)._m0[22].x, _84);
    float _107 = _86 * _82;
    float _109 = rint(_105);
    float _111 = precise::max(_109, 0.0);
    uint _113 = uint(_111);
    uint _115 = clamp(_113, 0u, 65535u);
    float3 _567 = float3(_101, _107, float(int(_99)));
    float3 _571 = select(_567, float3(0.0), isnan(_567));
    float4 _118 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _571.xy, uint(rint(_571.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _571.xy, uint(rint(_571.z))).xyzw;
    float _120 = _118.x;
    float _122 = _118.y;
    float _124 = _118.z;
    float _126 = _118.w;
    float3 _588 = float3(_101, _107, float(int(_115)));
    float3 _590 = select(_588, float3(0.0), isnan(_588));
    float4 _128 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _590.xy, uint(rint(_590.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _590.xy, uint(rint(_590.z))).xyzw;
    float _130 = _128.x;
    float _132 = _128.y;
    float _134 = _128.z;
    float _136 = _128.w;
    float _138 = in.m_42.y;
    float _140 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].y;
    float _142 = in.m_44.w;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_46.w;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_48.w;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_50.x;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = _138 * _140;
    float _168 = _166 * _140;
    float _170 = floor(_168);
    float _172 = -_170;
    float _174 = fma(_172, (*spvDescriptorSet0.fp_c9)._m0[22].y, _166);
    float _176 = _86 * _158;
    float _178 = _174 + 9.9999997473787516355514526367188e-05;
    float _180 = floor(_178);
    float _182 = -_180;
    float _184 = _178 + _182;
    float _186 = _86 * _146;
    float _188 = -_126;
    float _190 = _188 + _136;
    float _192 = fma(_184, _190, _126);
    float _194 = _86 * _152;
    float _196 = -_186;
    float _198 = fma(_192, _194, _196);
    float _200 = _176 * _198;
    float _202 = _86 * _164;
    float _204 = 0.0 + _200;
    float _206 = precise::clamp(_204, 0.0, 1.0);
    float _208 = _206 * _202;
    bool _212 = _208 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _214 = isnan(_208);
    bool _216 = _212 || _214;
    bool _218 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _220 = _216 || _218;
    float _222 = in.m_52.x;
    float _224 = gl_FragCoord.w;
    float _226 = _222 * _224;
    float _228 = in.m_52.y;
    float _230 = gl_FragCoord.w;
    float _232 = _228 * _230;
    if (!_220)
    {
        discard_fragment();
    }
    float _234 = _86 * _226;
    float _236 = _86 * _232;
    float2 _741 = float2(_234, _236);
    float3 _240 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_741, float2(0.0), isnan(_741))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_741, float2(0.0), isnan(_741))).xyz;
    float _242 = _240.x;
    float _244 = _240.y;
    float _246 = _240.z;
    float _248 = in.m_44.x;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = in.m_48.x;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = in.m_44.y;
    float _262 = gl_FragCoord.w;
    float _264 = _260 * _262;
    float _266 = in.m_48.y;
    float _268 = gl_FragCoord.w;
    float _270 = _266 * _268;
    float _272 = in.m_44.z;
    float _274 = gl_FragCoord.w;
    float _276 = _272 * _274;
    float _278 = in.m_48.z;
    float _280 = gl_FragCoord.w;
    float _282 = _278 * _280;
    float _284 = -_122;
    float _286 = _284 + _132;
    float _288 = in.m_46.y;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = in.m_46.x;
    float _296 = gl_FragCoord.w;
    float _298 = _294 * _296;
    float _300 = in.m_46.z;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = fma(_184, _286, _122);
    float _308 = -_120;
    float _310 = _308 + _130;
    float _312 = -_124;
    float _314 = _312 + _134;
    float _316 = _306 * _306;
    float _318 = fma(_184, _310, _120);
    float _320 = fma(_184, _314, _124);
    float _322 = _318 * _318;
    float _324 = _320 * _320;
    float _326 = _86 * _258;
    float _328 = _86 * _264;
    float _330 = _86 * _270;
    float _332 = _86 * _276;
    float _334 = _86 * _282;
    float _336 = -_330;
    float _338 = _328 + _336;
    float _340 = _86 * _298;
    float _342 = -_334;
    float _344 = _332 + _342;
    float _346 = _86 * _304;
    float _348 = _244 * _244;
    float _350 = _242 * _242;
    float _352 = _246 * _246;
    float _354 = _316 * _348;
    float _356 = _86 * _252;
    float _358 = _322 * _350;
    float _360 = _324 * _352;
    float _362 = fma(_354, _338, _330);
    float _364 = -_326;
    float _366 = _356 + _364;
    float _368 = _86 * _292;
    float _370 = fma(_358, _366, _326);
    float _372 = fma(_360, _344, _334);
    float _374 = _362 * _368;
    float _376 = _370 * _340;
    float _378 = _372 * _346;
    if (!_220)
    {
        out.m_55.x = _376;
        out.m_55.y = _374;
        out.m_55.z = _378;
        out.m_55.w = _200;
        return out;
    }
    float _380 = _374 * 0.715200006961822509765625;
    float _382 = in.m_57.w;
    float _384 = gl_FragCoord.w;
    float _386 = _382 * _384;
    float _388 = in.m_57.z;
    float _390 = gl_FragCoord.w;
    float _392 = _388 * _390;
    float _394 = in.m_57.x;
    float _396 = gl_FragCoord.w;
    float _398 = _394 * _396;
    float _400 = fma(_376, 0.2125999927520751953125, _380);
    float _402 = in.m_57.y;
    float _404 = gl_FragCoord.w;
    float _406 = _402 * _404;
    float _408 = 0.0 + _208;
    float _410 = precise::clamp(_408, 0.0, 1.0);
    float _412 = fma(_378, 0.072200000286102294921875, _400);
    bool _414 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _416 = 1.0 / _412;
    float _418 = _416 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _420 = precise::clamp(_418, 0.0, 1.0);
    float _422 = _86 * _386;
    float _424 = fma(_420, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _426 = _86 * _392;
    float _428 = _424 * _422;
    float _430 = _86 * _398;
    float _432 = _86 * _406;
    float _434 = fma(_378, _428, _426);
    float _436 = fma(_376, _428, _430);
    float _438 = fma(_374, _428, _432);
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
        float _448 = in.m_59.w;
        float _450 = gl_FragCoord.w;
        float _452 = _448 * _450;
        float _454 = in.m_59.z;
        float _456 = gl_FragCoord.w;
        float _458 = _454 * _456;
        float _460 = _86 * _452;
        float _462 = _86 * _458;
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
    out.m_55.x = _436;
    out.m_55.y = _438;
    out.m_55.z = _434;
    out.m_55.w = _490;
    return out;
}

