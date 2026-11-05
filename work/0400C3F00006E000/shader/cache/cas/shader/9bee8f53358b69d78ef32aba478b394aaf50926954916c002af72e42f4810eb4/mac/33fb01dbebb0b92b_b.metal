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
    constant _16* fp_c13 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_10Smplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_58 [[user(locn4)]];
    float4 m_39 [[user(locn6)]];
    float4 m_56 [[user(locn7), flat]];
    float4 m_37 [[user(locn8)]];
    float4 m_52 [[user(locn9)]];
    float4 m_54 [[user(locn10), flat]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _65 = gl_FragCoord.w;
    float _67 = in.m_37.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_37.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = 1.0 / _65;
    float _81 = _79 * _71;
    float _83 = _79 * _77;
    float2 _478 = float2(_81, _83);
    float4 _86 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_478, float2(0.0), isnan(_478))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_478, float2(0.0), isnan(_478))).xyzw;
    float _88 = _86.x;
    float _90 = _86.y;
    float _92 = _86.z;
    float _94 = _86.w;
    float _96 = in.m_39.w;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_41.w;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_43.x;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = _79 * _100;
    float _116 = _79 * _106;
    float _118 = in.m_45.y;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = _79 * _122;
    float _126 = _94 * _114;
    float _128 = _116 * _126;
    float _130 = _79 * _112;
    float _132 = 0.0 + _128;
    float _134 = precise::clamp(_132, 0.0, 1.0);
    float _136 = _134 * _130;
    bool _140 = _136 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _142 = isnan(_136);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _148 = _144 || _146;
    float _150 = in.m_45.w;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    if (!_148)
    {
        discard_fragment();
    }
    float _156 = in.m_45.x;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = _79 * _154;
    float _164 = 1.0 / _162;
    float _166 = _79 * _160;
    float _168 = _166 * _164;
    float _170 = _124 * _164;
    float2 _601 = float2(_168, _170);
    float _172 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_601, float2(0.0), isnan(_601))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_601, float2(0.0), isnan(_601))).x;
    float _174 = in.m_41.y;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = in.m_41.x;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    float _186 = in.m_41.z;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = in.m_47.z;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    float _198 = in.m_47.x;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = in.m_47.y;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = in.m_39.x;
    float _212 = gl_FragCoord.w;
    float _214 = _210 * _212;
    float _216 = in.m_39.y;
    float _218 = gl_FragCoord.w;
    float _220 = _216 * _218;
    float _222 = in.m_39.z;
    float _224 = gl_FragCoord.w;
    float _226 = _222 * _224;
    float _228 = _92 * _92;
    float _230 = _88 * _88;
    float _232 = _90 * _90;
    float _234 = _79 * _178;
    float _236 = _79 * _184;
    float _238 = _79 * _190;
    float _240 = _79 * _196;
    float _242 = _79 * _202;
    float _244 = _79 * _208;
    float _246 = -_240;
    float _248 = _238 + _246;
    float _250 = -_242;
    float _252 = _236 + _250;
    float _254 = -_244;
    float _256 = _234 + _254;
    float _258 = fma(_228, _248, _240);
    float _260 = fma(_230, _252, _242);
    float _262 = fma(_232, _256, _244);
    float _264 = _79 * _214;
    float _266 = _79 * _220;
    float _268 = _79 * _226;
    float _270 = _260 * _264;
    float _272 = _262 * _266;
    float _274 = _258 * _268;
    if (!_148)
    {
        out.m_50.x = _270;
        out.m_50.y = _272;
        out.m_50.z = _274;
        out.m_50.w = _128;
        return out;
    }
    float _276 = in.m_52.y;
    float _278 = gl_FragCoord.w;
    float _280 = _276 * _278;
    float _282 = in.m_52.x;
    float _284 = gl_FragCoord.w;
    float _286 = _282 * _284;
    float _288 = in.m_54.y;
    float _290 = in.m_54.x;
    float _292 = in.m_52.z;
    float _294 = gl_FragCoord.w;
    float _296 = _292 * _294;
    float _298 = in.m_45.z;
    float _300 = gl_FragCoord.w;
    float _302 = _298 * _300;
    float _304 = in.m_54.z;
    float _306 = in.m_56.x;
    float _308 = _79 * _280;
    float _310 = _79 * _286;
    float _312 = -_288;
    float _314 = _308 + _312;
    float _316 = -_290;
    float _318 = _310 + _316;
    float _320 = _79 * _296;
    float _322 = _306 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _324 = _314 * _314;
    float _326 = _79 * _302;
    float _328 = -_304;
    float _330 = _320 + _328;
    float _332 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _334 = fma(_172, (*spvDescriptorSet0.fp_c8)._m0[30].w, _332);
    float _336 = fma(_318, _318, _324);
    float _338 = _326 * _164;
    float _340 = in.m_58.w;
    float _342 = gl_FragCoord.w;
    float _344 = _340 * _342;
    float _346 = fma(_330, _330, _336);
    float _348 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _350 = fma(_338, (*spvDescriptorSet0.fp_c8)._m0[30].w, _348);
    float _352 = 1.0 / _334;
    float _354 = -_346;
    float _356 = fma(_322, _322, _354);
    float _358 = precise::max(0.0, _356);
    float _360 = 1.0 / _350;
    float _362 = sqrt(_358);
    float _364 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _366 = _360 * _364;
    float _368 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _370 = -_366;
    float _372 = fma(_352, _368, _370);
    float _374 = _79 * _344;
    float _376 = _362 + _372;
    float _378 = -_374;
    float _380 = _376 + _378;
    float _382 = _380 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    float _384 = _272 * 0.715200006961822509765625;
    float _386 = _382 * (-1.44269502162933349609375);
    float _388 = fma(_270, 0.2125999927520751953125, _384);
    float _390 = fma(_274, 0.072200000286102294921875, _388);
    float _392 = exp2(_386);
    bool _394 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _396 = 1.0 / _390;
    float _398 = -_392;
    float _400 = _398 + 1.0;
    float _402 = precise::clamp(_400, 0.0, 1.0);
    float _404 = _366;
    float _406 = _402;
    if (_394)
    {
        float _408 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _410 = _366 + _408;
        _404 = _410;
    }
    float _412 = _404;
    float _414 = _136 * _402;
    float _416 = precise::clamp(_414, 0.0, 1.0);
    float _418 = _416;
    if (_394)
    {
        float _420 = _412 * 8.0;
        float _422 = precise::clamp(_420, 0.0, 1.0);
        _406 = _422;
    }
    float _424 = _406;
    float _426 = _396 * (*spvDescriptorSet0.fp_c15)._m0[661].z;
    float _428 = precise::clamp(_426, 0.0, 1.0);
    if (_394)
    {
        float _430 = _416 * _424;
        _418 = _430;
    }
    float _432 = _418;
    float _434 = fma(_428, (*spvDescriptorSet0.fp_c15)._m0[661].y, (*spvDescriptorSet0.fp_c15)._m0[661].x);
    float _436 = 0.0 + _432;
    float _438 = precise::clamp(_436, 0.0, 1.0);
    float _440 = _270 * _434;
    float _442 = _272 * _434;
    float _444 = _274 * _434;
    out.m_50.x = _440;
    out.m_50.y = _442;
    out.m_50.z = _444;
    out.m_50.w = _438;
    return out;
}

