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
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_10Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_1ESmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_57 [[color(0)]];
};

struct main0_in
{
    float4 m_50 [[user(locn0)]];
    float4 m_52 [[user(locn1)]];
    float4 m_42 [[user(locn2)]];
    float4 m_44 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_54 [[user(locn5)]];
    float4 m_46 [[user(locn6), flat]];
    float4 m_48 [[user(locn7), flat]];
    float4 m_59 [[user(locn8)]];
    float4 m_65 [[user(locn9)]];
    float4 m_61 [[user(locn10)]];
    float4 m_67 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _74 = gl_FragCoord.w;
    float _76 = in.m_42.x;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_42.y;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = 1.0 / _74;
    float _90 = _88 * _80;
    float _92 = _88 * _86;
    float2 _523 = float2(_90, _92);
    float2 _96 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_523, float2(0.0), isnan(_523))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_523, float2(0.0), isnan(_523))).xy;
    float _98 = _96.x;
    float _100 = _96.y;
    float _102 = in.m_44.w;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_44.x;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = in.m_44.y;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = in.m_46.x;
    float _122 = in.m_42.z;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_42.w;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = _88 * _106;
    float _136 = _88 * _112;
    float _138 = _88 * _118;
    float _140 = _120 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _142 = 1.0 / _134;
    float _144 = _88 * _126;
    float _146 = _120 * (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _148 = _88 * _132;
    float _150 = _136 * _142;
    float _152 = _138 * _142;
    float _154 = fma(_98, _140, _144);
    float _156 = fma(_100, _146, _148);
    float2 _618 = float2(_150, _152);
    float _158 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_618, float2(0.0), isnan(_618))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_618, float2(0.0), isnan(_618))).x;
    float2 _626 = float2(_154, _156);
    float _160 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_626, float2(0.0), isnan(_626))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_626, float2(0.0), isnan(_626))).w;
    float _162 = in.m_44.z;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_48.x;
    float _170 = in.m_50.w;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = in.m_52.w;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = in.m_54.x;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = _88 * _166;
    float _190 = _188 * _142;
    float _192 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _194 = fma(_190, (*spvDescriptorSet0.fp_c8)._m0[30].w, _192);
    float _196 = 1.0 / _194;
    float _198 = 1.0 / _168;
    float _200 = _88 * _174;
    float _202 = -_200;
    float _204 = _202 + 1.0;
    float _206 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _208 = _196 * _206;
    float _210 = _88 * _180;
    float _212 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _214 = fma(_158, (*spvDescriptorSet0.fp_c8)._m0[30].w, _212);
    float _216 = 1.0 / _214;
    float _218 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _220 = -_208;
    float _222 = fma(_216, _218, _220);
    float _224 = _222 * _198;
    float _226 = precise::clamp(_224, 0.0, 1.0);
    float _228 = fma(_204, _226, -1.0);
    float _230 = _160 + _228;
    float _232 = _210 * _230;
    float _234 = _88 * _186;
    float _236 = 0.0 + _232;
    float _238 = precise::clamp(_236, 0.0, 1.0);
    float _240 = _238 * _234;
    bool _244 = _240 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _246 = isnan(_240);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _252 = _248 || _250;
    float _254 = in.m_50.x;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = in.m_50.y;
    float _262 = gl_FragCoord.w;
    float _264 = _260 * _262;
    float _266 = in.m_50.z;
    float _268 = gl_FragCoord.w;
    float _270 = _266 * _268;
    float _272 = _208;
    if (!_252)
    {
        discard_fragment();
    }
    float _274 = _88 * _258;
    float _276 = _88 * _264;
    float _278 = _88 * _270;
    if (!_252)
    {
        out.m_57.x = _274;
        out.m_57.y = _276;
        out.m_57.z = _278;
        out.m_57.w = _232;
        return out;
    }
    float _280 = in.m_59.y;
    float _282 = gl_FragCoord.w;
    float _284 = _280 * _282;
    float _286 = in.m_59.x;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    float _292 = in.m_59.z;
    float _294 = gl_FragCoord.w;
    float _296 = _292 * _294;
    float _298 = _88 * _284;
    float _300 = _88 * _290;
    float _302 = _88 * _296;
    float _304 = _298 * _298;
    float _306 = in.m_61.x;
    float _308 = gl_FragCoord.w;
    float _310 = _306 * _308;
    float _312 = fma(_300, _300, _304);
    float _314 = fma(_302, _302, _312);
    float _316 = rsqrt(_314);
    float _318 = _300 * _316;
    float _320 = _298 * _316;
    float _322 = _302 * _316;
    float _324 = _88 * _310;
    float _326 = abs(_318);
    float _328 = abs(_320);
    float _330 = precise::max(_326, _328);
    float _332 = precise::min(_324, 1.0);
    float _334 = abs(_322);
    float _336 = precise::max(_334, _330);
    float _338 = 1.0 / _336;
    float _340 = -_338;
    float _342 = _322 * _340;
    float _344 = _318 * _338;
    float _346 = _320 * _338;
    float3 _897 = float3(_344, _346, _342);
    float3 _350 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_897, float3(0.0), isnan(_897)), level(_332)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_897, float3(0.0), isnan(_897)), level(_332)).xyz;
    float _352 = _350.x;
    float _354 = _350.y;
    float _356 = _350.z;
    float _358 = in.m_63.x;
    float _360 = gl_FragCoord.w;
    float _362 = _358 * _360;
    float _364 = in.m_63.z;
    float _366 = gl_FragCoord.w;
    float _368 = _364 * _366;
    float _370 = in.m_63.y;
    float _372 = gl_FragCoord.w;
    float _374 = _370 * _372;
    float _376 = in.m_65.z;
    float _378 = gl_FragCoord.w;
    float _380 = _376 * _378;
    float _382 = in.m_65.x;
    float _384 = gl_FragCoord.w;
    float _386 = _382 * _384;
    float _388 = in.m_65.y;
    float _390 = gl_FragCoord.w;
    float _392 = _388 * _390;
    float _394 = in.m_67.x;
    float _396 = gl_FragCoord.w;
    float _398 = _394 * _396;
    float _400 = in.m_67.y;
    float _402 = gl_FragCoord.w;
    float _404 = _400 * _402;
    float _406 = in.m_67.z;
    float _408 = gl_FragCoord.w;
    float _410 = _406 * _408;
    float _412 = in.m_67.w;
    float _414 = gl_FragCoord.w;
    float _416 = _412 * _414;
    bool _418 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    if (_418)
    {
        float _420 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _422 = _208 + _420;
        _272 = _422;
    }
    float _424 = _272;
    float _426 = _424;
    if (_418)
    {
        float _428 = _424 * 8.0;
        float _430 = precise::clamp(_428, 0.0, 1.0);
        _426 = _430;
    }
    float _432 = _426;
    float _434 = _88 * _362;
    float _436 = _88 * _368;
    float _438 = _88 * _380;
    float _440 = _88 * _386;
    float _442 = _88 * _392;
    float _444 = _88 * _404;
    float _446 = fma(_352, 0.20999999344348907470703125, _434);
    float _448 = _88 * _374;
    float _450 = fma(_356, 0.20999999344348907470703125, _436);
    float _452 = _88 * _398;
    float _454 = _446 + _440;
    float _456 = fma(_354, 0.20999999344348907470703125, _448);
    float _458 = _450 + _438;
    float _460 = 0.0 + _240;
    float _462 = precise::clamp(_460, 0.0, 1.0);
    float _464 = _88 * _410;
    float _466 = _456 + _442;
    float _468 = _88 * _416;
    float _470 = _274 * _454;
    float _472 = _278 * _458;
    float _474 = _276 * _466;
    float _476 = _462;
    if (_418)
    {
        float _478 = _462 * _432;
        _476 = _478;
    }
    float _480 = _476;
    float _482 = fma(_470, _468, _452);
    float _484 = fma(_472, _468, _464);
    float _486 = fma(_474, _468, _444);
    float _488 = 0.0 + _480;
    float _490 = precise::clamp(_488, 0.0, 1.0);
    out.m_57.x = _482;
    out.m_57.y = _486;
    out.m_57.z = _484;
    out.m_57.w = _490;
    return out;
}

