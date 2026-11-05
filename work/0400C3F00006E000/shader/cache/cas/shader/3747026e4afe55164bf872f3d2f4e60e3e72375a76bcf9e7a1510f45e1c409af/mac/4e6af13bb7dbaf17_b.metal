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
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_52 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
    float4 m_33 [[user(locn6)]];
    float4 m_37 [[user(locn7)]];
    float4 m_50 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_33.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_33.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = 1.0 / _59;
    float _75 = _73 * _65;
    float _77 = _73 * _71;
    float2 _452 = float2(_75, _77);
    float4 _80 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_452, float2(0.0), isnan(_452))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_452, float2(0.0), isnan(_452))).xyzw;
    float _82 = _80.x;
    float _84 = _80.y;
    float _86 = _80.z;
    float _88 = _80.w;
    float _90 = in.m_35.y;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_35.x;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_35.z;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_37.y;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = in.m_37.x;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = in.m_37.z;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = in.m_39.w;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_41.w;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = _73 * _94;
    float _140 = _73 * _100;
    float _142 = _73 * _106;
    float _144 = _138 * _138;
    float _146 = fma(_140, _140, _144);
    float _148 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _150 = _148 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _152 = fma(_142, _142, _146);
    float _154 = _73 * _112;
    float _156 = in.m_43.w;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = rsqrt(_152);
    float _164 = 1.0 / _150;
    float _166 = in.m_45.x;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = _138 * _162;
    float _174 = _140 * _162;
    float _176 = _142 * _162;
    float _178 = _154 * _172;
    float _180 = _73 * _118;
    float _182 = fma(_180, _174, _178);
    float _184 = _73 * _124;
    float _186 = fma(_184, _176, _182);
    float _188 = abs(_186);
    float _190 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _192 = _188 + _190;
    float _194 = _192 * _164;
    float _196 = precise::clamp(_194, 0.0, 1.0);
    float _198 = _73 * _130;
    float _200 = fma(_196, -2.0, 3.0);
    float _202 = _196 * _196;
    float _204 = _73 * _136;
    float _206 = _200 * _202;
    float _208 = _73 * _170;
    float _210 = in.m_39.y;
    float _212 = gl_FragCoord.w;
    float _214 = _210 * _212;
    float _216 = in.m_43.x;
    float _218 = gl_FragCoord.w;
    float _220 = _216 * _218;
    float _222 = in.m_39.z;
    float _224 = gl_FragCoord.w;
    float _226 = _222 * _224;
    float _228 = in.m_43.z;
    float _230 = gl_FragCoord.w;
    float _232 = _228 * _230;
    float _234 = _73 * _220;
    float _236 = -_198;
    float _238 = fma(_88, _204, _236);
    float _240 = _73 * _160;
    float _242 = _238 * 4.0;
    float _244 = precise::clamp(_242, 0.0, 1.0);
    float _246 = _240 * _244;
    float _248 = 0.0 + _246;
    float _250 = precise::clamp(_248, 0.0, 1.0);
    float _252 = _250 * _206;
    float _254 = _252 * _208;
    bool _258 = _254 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _260 = isnan(_254);
    bool _262 = _258 || _260;
    bool _264 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _266 = _262 || _264;
    float _268 = in.m_39.x;
    float _270 = gl_FragCoord.w;
    float _272 = _268 * _270;
    float _274 = in.m_43.y;
    float _276 = gl_FragCoord.w;
    float _278 = _274 * _276;
    if (!_266)
    {
        discard_fragment();
    }
    float _280 = _73 * _226;
    float _282 = _73 * _272;
    float _284 = _73 * _214;
    float _286 = _73 * _278;
    float _288 = _73 * _232;
    float _290 = -_234;
    float _292 = _282 + _290;
    float _294 = -_286;
    float _296 = _284 + _294;
    float _298 = -_288;
    float _300 = _280 + _298;
    float _302 = fma(_82, _292, _234);
    float _304 = fma(_84, _296, _286);
    float _306 = fma(_86, _300, _288);
    if (!_266)
    {
        out.m_48.x = _302;
        out.m_48.y = _304;
        out.m_48.z = _306;
        out.m_48.w = _246;
        return out;
    }
    float _308 = _304 * 0.715200006961822509765625;
    float _310 = in.m_50.w;
    float _312 = gl_FragCoord.w;
    float _314 = _310 * _312;
    float _316 = in.m_50.z;
    float _318 = gl_FragCoord.w;
    float _320 = _316 * _318;
    float _322 = in.m_50.x;
    float _324 = gl_FragCoord.w;
    float _326 = _322 * _324;
    float _328 = fma(_302, 0.2125999927520751953125, _308);
    float _330 = in.m_50.y;
    float _332 = gl_FragCoord.w;
    float _334 = _330 * _332;
    float _336 = 0.0 + _254;
    float _338 = precise::clamp(_336, 0.0, 1.0);
    float _340 = fma(_306, 0.072200000286102294921875, _328);
    bool _342 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _344 = 1.0 / _340;
    float _346 = _344 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _348 = precise::clamp(_346, 0.0, 1.0);
    float _350 = _73 * _314;
    float _352 = fma(_348, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _354 = _73 * _320;
    float _356 = _352 * _350;
    float _358 = _73 * _326;
    float _360 = _73 * _334;
    float _362 = fma(_306, _356, _354);
    float _364 = fma(_302, _356, _358);
    float _366 = fma(_304, _356, _360);
    float _368 = _354;
    if (!_342)
    {
        _368 = _338;
    }
    float _370 = _368;
    bool _372 = !_342;
    float _374 = _370;
    if (!_372)
    {
        float _376 = in.m_52.w;
        float _378 = gl_FragCoord.w;
        float _380 = _376 * _378;
        float _382 = in.m_52.z;
        float _384 = gl_FragCoord.w;
        float _386 = _382 * _384;
        float _388 = _73 * _380;
        float _390 = _73 * _386;
        float _392 = 1.0 / _388;
        float _394 = _390 * _392;
        float _396 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _398 = fma(_394, (*spvDescriptorSet0.fp_c8)._m0[30].w, _396);
        float _400 = 1.0 / _398;
        float _402 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _404 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _406 = fma(_400, _402, _404);
        float _408 = _406 * 8.0;
        float _410 = precise::clamp(_408, 0.0, 1.0);
        float _412 = _338 * _410;
        _374 = _412;
    }
    float _414 = _374;
    float _416 = 0.0 + _414;
    float _418 = precise::clamp(_416, 0.0, 1.0);
    out.m_48.x = _364;
    out.m_48.y = _366;
    out.m_48.z = _362;
    out.m_48.w = _418;
    return out;
}

