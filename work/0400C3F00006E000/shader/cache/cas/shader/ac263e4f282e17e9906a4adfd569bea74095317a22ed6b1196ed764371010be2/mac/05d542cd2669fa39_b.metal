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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
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
    float4 m_51 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_48 [[user(locn2)]];
    float4 m_57 [[user(locn3)]];
    float4 m_44 [[user(locn4)]];
    float4 m_42 [[user(locn5)]];
    float4 m_40 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_59 [[user(locn8)]];
    float4 m_55 [[user(locn9)]];
    float4 m_61 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _68 = gl_FragCoord.w;
    float _70 = in.m_40.w;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_40.x;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_40.y;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_42.x;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_42.y;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = 1.0 / _68;
    float _102 = _100 * _74;
    float _104 = _100 * _80;
    float _106 = _100 * _86;
    float _108 = 1.0 / _102;
    float _110 = _104 * _108;
    float _112 = _106 * _108;
    float _114 = _100 * _92;
    float _116 = _100 * _98;
    float2 _546 = float2(_110, _112);
    float _118 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_546, float2(0.0), isnan(_546))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_546, float2(0.0), isnan(_546))).x;
    float2 _557 = float2(_114, _116);
    float _120 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_557, float2(0.0), isnan(_557))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_557, float2(0.0), isnan(_557))).w;
    float _122 = in.m_40.z;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_44.w;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_46.w;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_48.x;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = _100 * _126;
    float _148 = _146 * _108;
    float _150 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _152 = fma(_148, (*spvDescriptorSet0.fp_c8)._m0[30].w, _150);
    float _154 = 1.0 / _152;
    float _156 = _100 * _132;
    float _158 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _160 = _154 * _158;
    float _162 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _164 = fma(_118, (*spvDescriptorSet0.fp_c8)._m0[30].w, _162);
    float _166 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _168 = _120 * _156;
    float _170 = _100 * _138;
    float _172 = _100 * _144;
    float _174 = _170 * _168;
    float _176 = 1.0 / _164;
    float _178 = 0.0 + _174;
    float _180 = precise::clamp(_178, 0.0, 1.0);
    float _182 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _184 = -_160;
    float _186 = fma(_176, _182, _184);
    float _188 = _186 * _166;
    float _190 = precise::clamp(_188, 0.0, 1.0);
    float _192 = _180 * _190;
    float _194 = _192 * _172;
    bool _198 = _194 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _200 = isnan(_194);
    bool _202 = _198 || _200;
    bool _204 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _206 = _202 || _204;
    float _208 = in.m_46.x;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    float _214 = in.m_44.x;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = _160;
    if (!_206)
    {
        discard_fragment();
    }
    float _222 = in.m_44.z;
    float _224 = gl_FragCoord.w;
    float _226 = _222 * _224;
    float _228 = _100 * _212;
    float _230 = _100 * _218;
    float _232 = in.m_44.y;
    float _234 = gl_FragCoord.w;
    float _236 = _232 * _234;
    float _238 = _228 * _230;
    float _240 = in.m_46.y;
    float _242 = gl_FragCoord.w;
    float _244 = _240 * _242;
    float _246 = _100 * _236;
    float _248 = in.m_46.z;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = _100 * _244;
    float _256 = _254 * _246;
    float _258 = _100 * _252;
    float _260 = _100 * _226;
    float _262 = _258 * _260;
    if (!_206)
    {
        out.m_51.x = _238;
        out.m_51.y = _256;
        out.m_51.z = _262;
        out.m_51.w = _174;
        return out;
    }
    float _264 = in.m_53.y;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = in.m_53.x;
    float _272 = gl_FragCoord.w;
    float _274 = _270 * _272;
    float _276 = in.m_53.z;
    float _278 = gl_FragCoord.w;
    float _280 = _276 * _278;
    float _282 = _100 * _268;
    float _284 = _100 * _274;
    float _286 = _100 * _280;
    float _288 = _282 * _282;
    float _290 = in.m_55.x;
    float _292 = gl_FragCoord.w;
    float _294 = _290 * _292;
    float _296 = fma(_284, _284, _288);
    float _298 = fma(_286, _286, _296);
    float _300 = rsqrt(_298);
    float _302 = _284 * _300;
    float _304 = _282 * _300;
    float _306 = _286 * _300;
    float _308 = _100 * _294;
    float _310 = abs(_302);
    float _312 = abs(_304);
    float _314 = precise::max(_310, _312);
    float _316 = precise::min(_308, 1.0);
    float _318 = abs(_306);
    float _320 = precise::max(_318, _314);
    float _322 = 1.0 / _320;
    float _324 = -_322;
    float _326 = _306 * _324;
    float _328 = _302 * _322;
    float _330 = _304 * _322;
    float3 _865 = float3(_328, _330, _326);
    float3 _334 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_865, float3(0.0), isnan(_865)), level(_316)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_865, float3(0.0), isnan(_865)), level(_316)).xyz;
    float _336 = _334.x;
    float _338 = _334.y;
    float _340 = _334.z;
    float _342 = in.m_57.x;
    float _344 = gl_FragCoord.w;
    float _346 = _342 * _344;
    float _348 = in.m_57.z;
    float _350 = gl_FragCoord.w;
    float _352 = _348 * _350;
    float _354 = in.m_57.y;
    float _356 = gl_FragCoord.w;
    float _358 = _354 * _356;
    float _360 = in.m_59.z;
    float _362 = gl_FragCoord.w;
    float _364 = _360 * _362;
    float _366 = in.m_59.x;
    float _368 = gl_FragCoord.w;
    float _370 = _366 * _368;
    float _372 = in.m_59.y;
    float _374 = gl_FragCoord.w;
    float _376 = _372 * _374;
    float _378 = in.m_61.x;
    float _380 = gl_FragCoord.w;
    float _382 = _378 * _380;
    float _384 = in.m_61.y;
    float _386 = gl_FragCoord.w;
    float _388 = _384 * _386;
    float _390 = in.m_61.z;
    float _392 = gl_FragCoord.w;
    float _394 = _390 * _392;
    float _396 = in.m_61.w;
    float _398 = gl_FragCoord.w;
    float _400 = _396 * _398;
    bool _402 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    if (_402)
    {
        float _404 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _406 = _160 + _404;
        _220 = _406;
    }
    float _408 = _220;
    float _410 = _408;
    if (_402)
    {
        float _412 = _408 * 8.0;
        float _414 = precise::clamp(_412, 0.0, 1.0);
        _410 = _414;
    }
    float _416 = _410;
    float _418 = _100 * _346;
    float _420 = _100 * _352;
    float _422 = _100 * _364;
    float _424 = _100 * _370;
    float _426 = _100 * _376;
    float _428 = _100 * _388;
    float _430 = fma(_336, 0.20999999344348907470703125, _418);
    float _432 = _100 * _358;
    float _434 = fma(_340, 0.20999999344348907470703125, _420);
    float _436 = _100 * _382;
    float _438 = _430 + _424;
    float _440 = fma(_338, 0.20999999344348907470703125, _432);
    float _442 = _434 + _422;
    float _444 = 0.0 + _194;
    float _446 = precise::clamp(_444, 0.0, 1.0);
    float _448 = _100 * _394;
    float _450 = _440 + _426;
    float _452 = _100 * _400;
    float _454 = _238 * _438;
    float _456 = _262 * _442;
    float _458 = _256 * _450;
    float _460 = _446;
    if (_402)
    {
        float _462 = _446 * _416;
        _460 = _462;
    }
    float _464 = _460;
    float _466 = fma(_454, _452, _436);
    float _468 = fma(_456, _452, _448);
    float _470 = fma(_458, _452, _428);
    float _472 = 0.0 + _464;
    float _474 = precise::clamp(_472, 0.0, 1.0);
    out.m_51.x = _466;
    out.m_51.y = _470;
    out.m_51.z = _468;
    out.m_51.w = _474;
    return out;
}

