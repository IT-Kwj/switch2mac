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
    texture2d_array<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_10Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_59 [[color(0)]];
};

struct main0_in
{
    float4 m_50 [[user(locn0)]];
    float4 m_52 [[user(locn1)]];
    float4 m_42 [[user(locn2)]];
    float4 m_44 [[user(locn3)]];
    float4 m_54 [[user(locn4)]];
    float4 m_46 [[user(locn5), flat]];
    float4 m_56 [[user(locn6)]];
    float4 m_48 [[user(locn7), flat]];
    float4 m_61 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _68 = gl_FragCoord.w;
    float _70 = in.m_42.x;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_42.y;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = 1.0 / _68;
    float _84 = _82 * _74;
    float _86 = _82 * _80;
    float2 _491 = float2(_84, _86);
    float2 _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_491, float2(0.0), isnan(_491))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_491, float2(0.0), isnan(_491))).xy;
    float _92 = _90.x;
    float _94 = _90.y;
    float _96 = in.m_44.w;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_44.x;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_44.y;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = in.m_46.x;
    float _116 = in.m_42.w;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_48.y;
    float _124 = in.m_42.z;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = _82 * _100;
    float _132 = _82 * _106;
    float _134 = _82 * _112;
    float _136 = _114 * (*spvDescriptorSet0.fp_c9)._m0[21].x;
    float _138 = 1.0 / _130;
    float _140 = _114 * (*spvDescriptorSet0.fp_c9)._m0[21].y;
    float _142 = _82 * _120;
    float _144 = _82 * _128;
    float _146 = _132 * _138;
    float _148 = _134 * _138;
    float _150 = rint(_122);
    float _152 = precise::max(_150, 0.0);
    uint _155 = uint(_152);
    uint _157 = clamp(_155, 0u, 65535u);
    float _159 = fma(_140, _94, _142);
    float _161 = fma(_136, _92, _144);
    float2 _598 = float2(_146, _148);
    float _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_598, float2(0.0), isnan(_598))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_598, float2(0.0), isnan(_598))).x;
    float3 _609 = float3(_161, _159, float(int(_157)));
    float3 _613 = select(_609, float3(0.0), isnan(_609));
    float4 _166 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _613.xy, uint(rint(_613.z))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _613.xy, uint(rint(_613.z))).xyzw;
    float _168 = _166.x;
    float _170 = _166.y;
    float _172 = _166.z;
    float _174 = _166.w;
    float _176 = in.m_44.z;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = in.m_50.w;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = in.m_52.w;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = in.m_54.x;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _202 = _82 * _180;
    float _204 = _202 * _138;
    float _206 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _208 = fma(_204, (*spvDescriptorSet0.fp_c8)._m0[30].w, _206);
    float _210 = _82 * _186;
    float _212 = 1.0 / _208;
    float _214 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _216 = _212 * _214;
    float _218 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _220 = fma(_163, (*spvDescriptorSet0.fp_c8)._m0[30].w, _218);
    float _222 = _82 * _192;
    float _224 = 1.0 / _220;
    float _226 = -_210;
    float _228 = _174 + _226;
    float _230 = _222 * _228;
    float _232 = 0.0 + _230;
    float _234 = precise::clamp(_232, 0.0, 1.0);
    float _236 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _238 = -_216;
    float _240 = fma(_224, _236, _238);
    float _242 = _240 * _200;
    float _244 = precise::clamp(_242, 0.0, 1.0);
    float _246 = _82 * _198;
    float _248 = _234 * _244;
    float _250 = _248 * _246;
    bool _254 = _250 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _256 = isnan(_250);
    bool _258 = _254 || _256;
    bool _260 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _262 = _258 || _260;
    float _264 = in.m_56.x;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = in.m_56.y;
    float _272 = gl_FragCoord.w;
    float _274 = _270 * _272;
    float _276 = _216;
    if (!_262)
    {
        discard_fragment();
    }
    float _278 = _82 * _268;
    float _280 = _82 * _274;
    float2 _774 = float2(_278, _280);
    float3 _284 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_774, float2(0.0), isnan(_774))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_774, float2(0.0), isnan(_774))).xyz;
    float _286 = _284.x;
    float _288 = _284.y;
    float _290 = _284.z;
    float _292 = in.m_50.x;
    float _294 = gl_FragCoord.w;
    float _296 = _292 * _294;
    float _298 = in.m_50.y;
    float _300 = gl_FragCoord.w;
    float _302 = _298 * _300;
    float _304 = in.m_52.x;
    float _306 = gl_FragCoord.w;
    float _308 = _304 * _306;
    float _310 = in.m_52.y;
    float _312 = gl_FragCoord.w;
    float _314 = _310 * _312;
    float _316 = in.m_50.z;
    float _318 = gl_FragCoord.w;
    float _320 = _316 * _318;
    float _322 = in.m_52.z;
    float _324 = gl_FragCoord.w;
    float _326 = _322 * _324;
    float _328 = _170 * _170;
    float _330 = _168 * _168;
    float _332 = _172 * _172;
    float _334 = _82 * _308;
    float _336 = _82 * _326;
    float _338 = _286 * _286;
    float _340 = _288 * _288;
    float _342 = _290 * _290;
    float _344 = _330 * _338;
    float _346 = _328 * _340;
    float _348 = _82 * _296;
    float _350 = _82 * _302;
    float _352 = _82 * _314;
    float _354 = _82 * _320;
    float _356 = _332 * _342;
    float _358 = -_334;
    float _360 = _348 + _358;
    float _362 = -_352;
    float _364 = _350 + _362;
    float _366 = -_336;
    float _368 = _354 + _366;
    float _370 = fma(_344, _360, _334);
    float _372 = fma(_346, _364, _352);
    float _374 = fma(_356, _368, _336);
    if (!_262)
    {
        out.m_59.x = _370;
        out.m_59.y = _372;
        out.m_59.z = _374;
        out.m_59.w = _230;
        return out;
    }
    float _376 = _372 * 0.715200006961822509765625;
    float _378 = in.m_61.w;
    float _380 = gl_FragCoord.w;
    float _382 = _378 * _380;
    float _384 = in.m_61.x;
    float _386 = gl_FragCoord.w;
    float _388 = _384 * _386;
    float _390 = in.m_61.y;
    float _392 = gl_FragCoord.w;
    float _394 = _390 * _392;
    float _396 = fma(_370, 0.2125999927520751953125, _376);
    float _398 = in.m_61.z;
    float _400 = gl_FragCoord.w;
    float _402 = _398 * _400;
    float _404 = fma(_374, 0.072200000286102294921875, _396);
    bool _406 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _408 = 1.0 / _404;
    float _410 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_406)
    {
        float _412 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _414 = _216 + _412;
        _276 = _414;
    }
    float _416 = _276;
    float _418 = _408 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _420 = precise::clamp(_418, 0.0, 1.0);
    float _422 = fma(_420, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _424 = _82 * _382;
    if (_406)
    {
        float _426 = _416 * 8.0;
        float _428 = precise::clamp(_426, 0.0, 1.0);
        _410 = _428;
    }
    float _430 = _410;
    float _432 = _82 * _394;
    float _434 = _422 * _424;
    float _436 = 0.0 + _250;
    float _438 = precise::clamp(_436, 0.0, 1.0);
    float _440 = _82 * _388;
    float _442 = _82 * _402;
    float _444 = fma(_372, _434, _432);
    float _446 = _438;
    if (_406)
    {
        float _448 = _438 * _430;
        _446 = _448;
    }
    float _450 = _446;
    float _452 = fma(_370, _434, _440);
    float _454 = fma(_374, _434, _442);
    float _456 = 0.0 + _450;
    float _458 = precise::clamp(_456, 0.0, 1.0);
    out.m_59.x = _452;
    out.m_59.y = _444;
    out.m_59.z = _454;
    out.m_59.w = _458;
    return out;
}

