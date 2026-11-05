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
    float4 m_41 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
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
    float2 _464 = float2(_103, _105);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_464, float2(0.0), isnan(_464))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_464, float2(0.0), isnan(_464))).x;
    float2 _475 = float2(_97, _101);
    float4 _110 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_475, float2(0.0), isnan(_475))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_475, float2(0.0), isnan(_475))).xyzw;
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
    float _138 = in.m_43.x;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _146 = _89 * _124;
    float _148 = _146 * _99;
    float _150 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _152 = fma(_148, (*spvDescriptorSet0.fp_c8)._m0[30].w, _150);
    float _154 = _89 * _130;
    float _156 = 1.0 / _152;
    float _158 = in.m_41.y;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = in.m_45.y;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = in.m_45.z;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = in.m_39.x;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = in.m_39.y;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = in.m_39.z;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _196 = fma(_107, (*spvDescriptorSet0.fp_c8)._m0[30].w, _194);
    float _198 = _118 * _154;
    float _200 = _89 * _136;
    float _202 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _204 = _156 * _202;
    float _206 = 1.0 / _196;
    float _208 = _200 * _198;
    float _210 = 0.0 + _208;
    float _212 = precise::clamp(_210, 0.0, 1.0);
    float _214 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _216 = -_204;
    float _218 = fma(_206, _214, _216);
    float _220 = _218 * _144;
    float _222 = precise::clamp(_220, 0.0, 1.0);
    float _224 = _89 * _142;
    float _226 = _212 * _222;
    float _228 = _226 * _224;
    bool _232 = _228 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _234 = isnan(_228);
    bool _236 = _232 || _234;
    bool _238 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _240 = _236 || _238;
    float _242 = in.m_41.x;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    float _248 = in.m_45.x;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = in.m_41.z;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = _204;
    if (!_240)
    {
        discard_fragment();
    }
    float _262 = _89 * _168;
    float _264 = _112 * _112;
    float _266 = _114 * _114;
    float _268 = _116 * _116;
    float _270 = _89 * _246;
    float _272 = _89 * _252;
    float _274 = _89 * _162;
    float _276 = _89 * _258;
    float _278 = _89 * _174;
    float _280 = -_272;
    float _282 = _270 + _280;
    float _284 = -_262;
    float _286 = _274 + _284;
    float _288 = -_278;
    float _290 = _276 + _288;
    float _292 = fma(_264, _282, _272);
    float _294 = fma(_266, _286, _262);
    float _296 = _89 * _180;
    float _298 = fma(_268, _290, _278);
    float _300 = _89 * _186;
    float _302 = _89 * _192;
    float _304 = _292 * _296;
    float _306 = _294 * _300;
    float _308 = _298 * _302;
    float _310 = _262;
    if (!_240)
    {
        out.m_48.x = _304;
        out.m_48.y = _306;
        out.m_48.z = _308;
        out.m_48.w = _208;
        return out;
    }
    float _312 = _306 * 0.715200006961822509765625;
    float _314 = in.m_50.w;
    float _316 = gl_FragCoord.w;
    float _318 = _314 * _316;
    float _320 = in.m_50.x;
    float _322 = gl_FragCoord.w;
    float _324 = _320 * _322;
    float _326 = in.m_50.y;
    float _328 = gl_FragCoord.w;
    float _330 = _326 * _328;
    float _332 = fma(_304, 0.2125999927520751953125, _312);
    float _334 = in.m_50.z;
    float _336 = gl_FragCoord.w;
    float _338 = _334 * _336;
    float _340 = fma(_308, 0.072200000286102294921875, _332);
    bool _342 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _344 = 1.0 / _340;
    if (_342)
    {
        float _346 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _348 = _204 + _346;
        _260 = _348;
    }
    float _350 = _260;
    if (_342)
    {
        float _352 = _350 * 8.0;
        float _354 = precise::clamp(_352, 0.0, 1.0);
        _310 = _354;
    }
    float _356 = _310;
    float _358 = _344 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _360 = precise::clamp(_358, 0.0, 1.0);
    float _362 = fma(_360, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _364 = _89 * _318;
    float _366 = _89 * _324;
    float _368 = _89 * _330;
    float _370 = _362 * _364;
    float _372 = 0.0 + _228;
    float _374 = precise::clamp(_372, 0.0, 1.0);
    float _376 = _89 * _338;
    float _378 = fma(_304, _370, _366);
    float _380 = _374;
    if (_342)
    {
        float _382 = _374 * _356;
        _380 = _382;
    }
    float _384 = _380;
    float _386 = fma(_306, _370, _368);
    float _388 = fma(_308, _370, _376);
    float _390 = 0.0 + _384;
    float _392 = precise::clamp(_390, 0.0, 1.0);
    out.m_48.x = _378;
    out.m_48.y = _386;
    out.m_48.z = _388;
    out.m_48.w = _392;
    return out;
}

