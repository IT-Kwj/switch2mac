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
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_10Smplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
    float4 m_50 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_35.w;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_35.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_35.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_37.x;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_37.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = 1.0 / _57;
    float _91 = _89 * _63;
    float _93 = _89 * _69;
    float _95 = _89 * _75;
    float _97 = _89 * _81;
    float _99 = 1.0 / _91;
    float _101 = _89 * _87;
    float _103 = _93 * _99;
    float _105 = _95 * _99;
    float2 _474 = float2(_103, _105);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_474, float2(0.0), isnan(_474))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_474, float2(0.0), isnan(_474))).x;
    float2 _485 = float2(_97, _101);
    float4 _110 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_485, float2(0.0), isnan(_485))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_485, float2(0.0), isnan(_485))).xyzw;
    float _112 = _110.x;
    float _114 = _110.y;
    float _116 = _110.z;
    float _118 = _110.w;
    float _120 = in.m_35.z;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = in.m_39.w;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_41.w;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = in.m_43.w;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = in.m_45.x;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _152 = _89 * _124;
    float _154 = _152 * _99;
    float _156 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _158 = fma(_154, (*spvDescriptorSet0.fp_c8)._m0[30].w, _156);
    float _160 = _89 * _130;
    float _162 = 1.0 / _158;
    float _164 = in.m_43.x;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = in.m_43.z;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = in.m_41.x;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = in.m_41.y;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = in.m_41.z;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = _89 * _168;
    float _196 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _198 = fma(_107, (*spvDescriptorSet0.fp_c8)._m0[30].w, _196);
    float _200 = _89 * _136;
    float _202 = 1.0 / _198;
    float _204 = -_160;
    float _206 = fma(_118, _200, _204);
    float _208 = _89 * _142;
    float _210 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _212 = _162 * _210;
    float _214 = _208 * _206;
    float _216 = 0.0 + _214;
    float _218 = precise::clamp(_216, 0.0, 1.0);
    float _220 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _222 = -_212;
    float _224 = fma(_202, _220, _222);
    float _226 = _89 * _148;
    float _228 = _224 * _150;
    float _230 = precise::clamp(_228, 0.0, 1.0);
    float _232 = _218 * _230;
    float _234 = _232 * _226;
    bool _238 = _234 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _240 = isnan(_234);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _246 = _242 || _244;
    float _248 = in.m_39.x;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = in.m_39.y;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = in.m_43.y;
    float _262 = gl_FragCoord.w;
    float _264 = _260 * _262;
    float _266 = in.m_39.z;
    float _268 = gl_FragCoord.w;
    float _270 = _266 * _268;
    float _272 = _212;
    if (!_246)
    {
        discard_fragment();
    }
    float _274 = _112 * _112;
    float _276 = _114 * _114;
    float _278 = _116 * _116;
    float _280 = _89 * _252;
    float _282 = _89 * _258;
    float _284 = _89 * _264;
    float _286 = _89 * _270;
    float _288 = _89 * _174;
    float _290 = -_194;
    float _292 = _280 + _290;
    float _294 = -_284;
    float _296 = _282 + _294;
    float _298 = -_288;
    float _300 = _286 + _298;
    float _302 = fma(_274, _292, _194);
    float _304 = fma(_276, _296, _284);
    float _306 = _89 * _180;
    float _308 = fma(_278, _300, _288);
    float _310 = _89 * _186;
    float _312 = _89 * _192;
    float _314 = _302 * _306;
    float _316 = _304 * _310;
    float _318 = _308 * _312;
    float _320 = _284;
    if (!_246)
    {
        out.m_48.x = _314;
        out.m_48.y = _316;
        out.m_48.z = _318;
        out.m_48.w = _214;
        return out;
    }
    float _322 = _316 * 0.715200006961822509765625;
    float _324 = in.m_50.w;
    float _326 = gl_FragCoord.w;
    float _328 = _324 * _326;
    float _330 = in.m_50.x;
    float _332 = gl_FragCoord.w;
    float _334 = _330 * _332;
    float _336 = in.m_50.y;
    float _338 = gl_FragCoord.w;
    float _340 = _336 * _338;
    float _342 = fma(_314, 0.2125999927520751953125, _322);
    float _344 = in.m_50.z;
    float _346 = gl_FragCoord.w;
    float _348 = _344 * _346;
    float _350 = fma(_318, 0.072200000286102294921875, _342);
    bool _352 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _354 = 1.0 / _350;
    if (_352)
    {
        float _356 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _358 = _212 + _356;
        _272 = _358;
    }
    float _360 = _272;
    if (_352)
    {
        float _362 = _360 * 8.0;
        float _364 = precise::clamp(_362, 0.0, 1.0);
        _320 = _364;
    }
    float _366 = _320;
    float _368 = _354 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _370 = precise::clamp(_368, 0.0, 1.0);
    float _372 = fma(_370, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _374 = _89 * _328;
    float _376 = _89 * _334;
    float _378 = _89 * _340;
    float _380 = _372 * _374;
    float _382 = 0.0 + _234;
    float _384 = precise::clamp(_382, 0.0, 1.0);
    float _386 = _89 * _348;
    float _388 = fma(_314, _380, _376);
    float _390 = _384;
    if (_352)
    {
        float _392 = _384 * _366;
        _390 = _392;
    }
    float _394 = _390;
    float _396 = fma(_316, _380, _378);
    float _398 = fma(_318, _380, _386);
    float _400 = 0.0 + _394;
    float _402 = precise::clamp(_400, 0.0, 1.0);
    out.m_48.x = _388;
    out.m_48.y = _396;
    out.m_48.z = _398;
    out.m_48.w = _402;
    return out;
}

