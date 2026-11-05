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
    float4 m_41 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_52 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
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
    float2 _474 = float2(_75, _77);
    float4 _80 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_474, float2(0.0), isnan(_474))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_474, float2(0.0), isnan(_474))).xyzw;
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
    float _132 = _73 * _94;
    float _134 = _73 * _100;
    float _136 = _73 * _106;
    float _138 = _132 * _132;
    float _140 = fma(_134, _134, _138);
    float _142 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _144 = _142 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _146 = fma(_136, _136, _140);
    float _148 = _73 * _112;
    float _150 = in.m_41.w;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = rsqrt(_146);
    float _158 = 1.0 / _144;
    float _160 = in.m_43.x;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = _132 * _156;
    float _168 = _134 * _156;
    float _170 = _136 * _156;
    float _172 = _148 * _166;
    float _174 = _73 * _118;
    float _176 = fma(_174, _168, _172);
    float _178 = _73 * _124;
    float _180 = fma(_178, _170, _176);
    float _182 = abs(_180);
    float _184 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _186 = _182 + _184;
    float _188 = _186 * _158;
    float _190 = precise::clamp(_188, 0.0, 1.0);
    float _192 = _73 * _164;
    float _194 = fma(_190, -2.0, 3.0);
    float _196 = _190 * _190;
    float _198 = _73 * _130;
    float _200 = _194 * _196;
    float _202 = in.m_45.x;
    float _204 = gl_FragCoord.w;
    float _206 = _202 * _204;
    float _208 = in.m_41.y;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    float _214 = in.m_45.y;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = in.m_45.z;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    float _226 = in.m_39.x;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = in.m_39.y;
    float _234 = gl_FragCoord.w;
    float _236 = _232 * _234;
    float _238 = in.m_39.z;
    float _240 = gl_FragCoord.w;
    float _242 = _238 * _240;
    float _244 = _73 * _206;
    float _246 = _73 * _218;
    float _248 = _88 * _198;
    float _250 = _73 * _154;
    float _252 = _250 * _248;
    float _254 = 0.0 + _252;
    float _256 = precise::clamp(_254, 0.0, 1.0);
    float _258 = _256 * _200;
    float _260 = _258 * _192;
    bool _264 = _260 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _266 = isnan(_260);
    bool _268 = _264 || _266;
    bool _270 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _272 = _268 || _270;
    float _274 = in.m_41.x;
    float _276 = gl_FragCoord.w;
    float _278 = _274 * _276;
    float _280 = in.m_41.z;
    float _282 = gl_FragCoord.w;
    float _284 = _280 * _282;
    if (!_272)
    {
        discard_fragment();
    }
    float _286 = _82 * _82;
    float _288 = _84 * _84;
    float _290 = _86 * _86;
    float _292 = _73 * _278;
    float _294 = _73 * _212;
    float _296 = _73 * _284;
    float _298 = _73 * _224;
    float _300 = -_244;
    float _302 = _292 + _300;
    float _304 = -_246;
    float _306 = _294 + _304;
    float _308 = -_298;
    float _310 = _296 + _308;
    float _312 = fma(_286, _302, _244);
    float _314 = fma(_288, _306, _246);
    float _316 = _73 * _230;
    float _318 = fma(_290, _310, _298);
    float _320 = _73 * _236;
    float _322 = _73 * _242;
    float _324 = _312 * _316;
    float _326 = _314 * _320;
    float _328 = _318 * _322;
    if (!_272)
    {
        out.m_48.x = _324;
        out.m_48.y = _326;
        out.m_48.z = _328;
        out.m_48.w = _252;
        return out;
    }
    float _330 = _326 * 0.715200006961822509765625;
    float _332 = in.m_50.w;
    float _334 = gl_FragCoord.w;
    float _336 = _332 * _334;
    float _338 = in.m_50.z;
    float _340 = gl_FragCoord.w;
    float _342 = _338 * _340;
    float _344 = in.m_50.x;
    float _346 = gl_FragCoord.w;
    float _348 = _344 * _346;
    float _350 = fma(_324, 0.2125999927520751953125, _330);
    float _352 = in.m_50.y;
    float _354 = gl_FragCoord.w;
    float _356 = _352 * _354;
    float _358 = fma(_328, 0.072200000286102294921875, _350);
    bool _360 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _362 = 1.0 / _358;
    float _364 = _362 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _366 = precise::clamp(_364, 0.0, 1.0);
    float _368 = _73 * _336;
    float _370 = fma(_366, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _372 = _73 * _342;
    float _374 = _370 * _368;
    float _376 = 0.0 + _260;
    float _378 = precise::clamp(_376, 0.0, 1.0);
    float _380 = _73 * _348;
    float _382 = _73 * _356;
    float _384 = fma(_328, _374, _372);
    float _386 = fma(_324, _374, _380);
    float _388 = fma(_326, _374, _382);
    float _390 = _372;
    if (!_360)
    {
        _390 = _378;
    }
    float _392 = _390;
    bool _394 = !_360;
    float _396 = _392;
    if (!_394)
    {
        float _398 = in.m_52.w;
        float _400 = gl_FragCoord.w;
        float _402 = _398 * _400;
        float _404 = in.m_52.z;
        float _406 = gl_FragCoord.w;
        float _408 = _404 * _406;
        float _410 = _73 * _402;
        float _412 = _73 * _408;
        float _414 = 1.0 / _410;
        float _416 = _412 * _414;
        float _418 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _420 = fma(_416, (*spvDescriptorSet0.fp_c8)._m0[30].w, _418);
        float _422 = 1.0 / _420;
        float _424 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _426 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _428 = fma(_422, _424, _426);
        float _430 = _428 * 8.0;
        float _432 = precise::clamp(_430, 0.0, 1.0);
        float _434 = _378 * _432;
        _396 = _434;
    }
    float _436 = _396;
    float _438 = 0.0 + _436;
    float _440 = precise::clamp(_438, 0.0, 1.0);
    out.m_48.x = _386;
    out.m_48.y = _388;
    out.m_48.z = _384;
    out.m_48.w = _440;
    return out;
}

