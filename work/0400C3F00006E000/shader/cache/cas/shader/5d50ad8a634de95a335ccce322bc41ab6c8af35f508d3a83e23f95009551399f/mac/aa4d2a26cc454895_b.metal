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
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texturecube<float> fp_t_tcb_1E [[id(7)]];
    sampler fp_t_tcb_1ESmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_10Smplr_w [[id(10)]];
    sampler fp_t_tcb_1ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_51 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_40 [[user(locn2)]];
    float4 m_42 [[user(locn3)]];
    float4 m_57 [[user(locn4)]];
    float4 m_46 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_59 [[user(locn7)]];
    float4 m_55 [[user(locn8)]];
    float4 m_61 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _68 = gl_FragCoord.w;
    float _70 = in.m_40.x;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_40.y;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = 1.0 / _68;
    float _84 = _82 * _74;
    float _86 = _82 * _80;
    float2 _533;
    _533.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_84, _86));
    _533.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_84, _86));
    float _88 = _533.x;
    float _90 = _88 * 256.0;
    int _93 = int(_90);
    float _95 = in.m_42.w;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_42.x;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_42.y;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = _82 * _99;
    float _115 = _82 * _105;
    float _117 = _82 * _111;
    float _119 = 1.0 / _113;
    float _121 = _115 * _119;
    float _123 = _117 * _119;
    float2 _581 = float2(_121, _123);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_581, float2(0.0), isnan(_581))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_581, float2(0.0), isnan(_581))).x;
    float _127 = float(uint(_93));
    float _129 = _127 * 0.00390625;
    float _131 = precise::min(_129, 2.0);
    float2 _602 = float2(_84, _86);
    float4 _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_602, float2(0.0), isnan(_602)), level(_131)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_602, float2(0.0), isnan(_602)), level(_131)).xyzw;
    float _136 = _134.x;
    float _138 = _134.y;
    float _140 = _134.z;
    float _142 = _134.w;
    float _144 = in.m_42.z;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = in.m_44.w;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = in.m_46.x;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = _82 * _148;
    float _164 = _162 * _119;
    float _166 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _168 = fma(_164, (*spvDescriptorSet0.fp_c8)._m0[30].w, _166);
    float _170 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _172 = fma(_125, (*spvDescriptorSet0.fp_c8)._m0[30].w, _170);
    float _174 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _176 = 1.0 / _168;
    float _178 = 1.0 / _172;
    float _180 = _82 * _154;
    float _182 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _184 = _176 * _182;
    float _186 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _188 = -_184;
    float _190 = fma(_178, _186, _188);
    float _192 = in.m_44.x;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    float _198 = in.m_48.y;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = in.m_48.z;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = _82 * _202;
    float _212 = _142 * _180;
    float _214 = _190 * _174;
    float _216 = precise::clamp(_214, 0.0, 1.0);
    float _218 = _82 * _160;
    float _220 = 0.0 + _212;
    float _222 = precise::clamp(_220, 0.0, 1.0);
    float _224 = _222 * _216;
    float _226 = _224 * _218;
    bool _230 = _226 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _232 = isnan(_226);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _238 = _234 || _236;
    float _240 = in.m_44.y;
    float _242 = gl_FragCoord.w;
    float _244 = _240 * _242;
    float _246 = in.m_48.x;
    float _248 = gl_FragCoord.w;
    float _250 = _246 * _248;
    float _252 = in.m_44.z;
    float _254 = gl_FragCoord.w;
    float _256 = _252 * _254;
    float _258 = _82;
    if (!_238)
    {
        discard_fragment();
    }
    float _260 = _82 * _196;
    float _262 = _82 * _244;
    float _264 = _82 * _250;
    float _266 = _82 * _256;
    float _268 = _82 * _208;
    float _270 = -_210;
    float _272 = _262 + _270;
    float _274 = -_264;
    float _276 = _260 + _274;
    float _278 = -_268;
    float _280 = _266 + _278;
    float _282 = fma(_138, _272, _210);
    float _284 = fma(_136, _276, _264);
    float _286 = fma(_140, _280, _268);
    if (!_238)
    {
        out.m_51.x = _284;
        out.m_51.y = _282;
        out.m_51.z = _286;
        out.m_51.w = _212;
        return out;
    }
    float _288 = in.m_53.y;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = in.m_53.x;
    float _296 = gl_FragCoord.w;
    float _298 = _294 * _296;
    float _300 = in.m_53.z;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = _82 * _292;
    float _308 = _82 * _298;
    float _310 = _82 * _304;
    float _312 = _306 * _306;
    float _314 = in.m_55.x;
    float _316 = gl_FragCoord.w;
    float _318 = _314 * _316;
    float _320 = fma(_308, _308, _312);
    float _322 = fma(_310, _310, _320);
    float _324 = rsqrt(_322);
    float _326 = _308 * _324;
    float _328 = _306 * _324;
    float _330 = _310 * _324;
    float _332 = _82 * _318;
    float _334 = abs(_326);
    float _336 = abs(_328);
    float _338 = precise::max(_334, _336);
    float _340 = precise::min(_332, 1.0);
    float _342 = abs(_330);
    float _344 = precise::max(_342, _338);
    float _346 = 1.0 / _344;
    float _348 = _326 * _346;
    float _350 = _328 * _346;
    float _352 = -_346;
    float _354 = _330 * _352;
    float3 _923 = float3(_348, _350, _354);
    float3 _358 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_923, float3(0.0), isnan(_923)), level(_340)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_923, float3(0.0), isnan(_923)), level(_340)).xyz;
    float _360 = _358.x;
    float _362 = _358.y;
    float _364 = _358.z;
    float _366 = in.m_57.x;
    float _368 = gl_FragCoord.w;
    float _370 = _366 * _368;
    float _372 = in.m_57.z;
    float _374 = gl_FragCoord.w;
    float _376 = _372 * _374;
    float _378 = in.m_57.y;
    float _380 = gl_FragCoord.w;
    float _382 = _378 * _380;
    float _384 = in.m_59.x;
    float _386 = gl_FragCoord.w;
    float _388 = _384 * _386;
    float _390 = in.m_59.y;
    float _392 = gl_FragCoord.w;
    float _394 = _390 * _392;
    float _396 = in.m_59.z;
    float _398 = gl_FragCoord.w;
    float _400 = _396 * _398;
    float _402 = in.m_61.x;
    float _404 = gl_FragCoord.w;
    float _406 = _402 * _404;
    float _408 = in.m_61.y;
    float _410 = gl_FragCoord.w;
    float _412 = _408 * _410;
    float _414 = in.m_61.z;
    float _416 = gl_FragCoord.w;
    float _418 = _414 * _416;
    float _420 = in.m_61.w;
    float _422 = gl_FragCoord.w;
    float _424 = _420 * _422;
    bool _426 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _428 = _82 * _370;
    float _430 = _82 * _376;
    float _432 = _82 * _388;
    float _434 = _82 * _394;
    float _436 = _82 * _400;
    float _438 = _82 * _412;
    float _440 = _82 * _424;
    float _442 = fma(_360, 0.20999999344348907470703125, _428);
    float _444 = _82 * _382;
    float _446 = _82 * _406;
    float _448 = _82 * _418;
    float _450 = fma(_364, 0.20999999344348907470703125, _430);
    float _452 = fma(_362, 0.20999999344348907470703125, _444);
    if (_426)
    {
        float _454 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _456 = _184 + _454;
        _258 = _456;
    }
    float _458 = _258;
    float _460 = _442 + _432;
    float _462 = _450 + _436;
    float _464 = _452 + _434;
    float _466 = 0.0 + _226;
    float _468 = precise::clamp(_466, 0.0, 1.0);
    float _470 = _458;
    float _472 = _468;
    if (_426)
    {
        float _474 = _458 * 8.0;
        float _476 = precise::clamp(_474, 0.0, 1.0);
        _470 = _476;
    }
    float _478 = _470;
    float _480 = _284 * _460;
    float _482 = _282 * _464;
    float _484 = _286 * _462;
    if (_426)
    {
        float _486 = _468 * _478;
        _472 = _486;
    }
    float _488 = _472;
    float _490 = fma(_480, _440, _446);
    float _492 = fma(_482, _440, _438);
    float _494 = fma(_484, _440, _448);
    float _496 = 0.0 + _488;
    float _498 = precise::clamp(_496, 0.0, 1.0);
    out.m_51.x = _490;
    out.m_51.y = _492;
    out.m_51.z = _494;
    out.m_51.w = _498;
    return out;
}

