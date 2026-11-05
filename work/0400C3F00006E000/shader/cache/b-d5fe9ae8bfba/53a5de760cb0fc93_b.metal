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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.z;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.w;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_29.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_29.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = 1.0 / _39;
    float _67 = _65 * _45;
    float _69 = _65 * _51;
    float _71 = _65 * _57;
    float _73 = _65 * _63;
    float2 _447 = float2(_67, _69);
    float3 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_447, float2(0.0), isnan(_447))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_447, float2(0.0), isnan(_447))).xyz;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    float2 _464 = float2(_67, _69);
    float3 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_464, float2(0.0), isnan(_464)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_464, float2(0.0), isnan(_464)), int2(0, 1)).xyz;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = _85.z;
    float2 _480 = float2(_67, _69);
    float3 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_480, float2(0.0), isnan(_480)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_480, float2(0.0), isnan(_480)), int2(1, 0)).xyz;
    float _95 = _93.x;
    float _97 = _93.y;
    float _99 = _93.z;
    float2 _495 = float2(_67, _69);
    float3 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_495, float2(0.0), isnan(_495)), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_495, float2(0.0), isnan(_495)), int2(1)).xyz;
    float _103 = _101.x;
    float _105 = _101.y;
    float _107 = _101.z;
    float2 _510 = float2(_71, _73);
    float4 _110 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_510, float2(0.0), isnan(_510))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_510, float2(0.0), isnan(_510))).xyzw;
    float _112 = _110.x;
    float _114 = _110.y;
    float _116 = _110.z;
    float _118 = _110.w;
    float _120 = _81 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _122 = _89 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _124 = _97 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _126 = _105 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _128 = fma(_79, (*spvDescriptorSet0.fp_c3)._m0[2].x, _120);
    float _130 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[2].x, _122);
    float _132 = fma(_95, (*spvDescriptorSet0.fp_c3)._m0[2].x, _124);
    float _134 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[2].x, _126);
    float _136 = fma(_83, (*spvDescriptorSet0.fp_c3)._m0[2].z, _128);
    float _138 = fma(_91, (*spvDescriptorSet0.fp_c3)._m0[2].z, _130);
    float _140 = _114 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _142 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[2].z, _132);
    float _144 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[2].z, _134);
    float _146 = fma(_112, (*spvDescriptorSet0.fp_c3)._m0[2].x, _140);
    float _148 = precise::min(_136, _138);
    float _150 = precise::max(_136, _138);
    float _152 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[2].z, _146);
    float _154 = precise::min(_142, _144);
    float _156 = precise::max(_142, _144);
    float _158 = precise::min(_148, _154);
    float _160 = precise::max(_150, _156);
    float _162 = precise::min(_152, _158);
    float _164 = precise::max(_152, _160);
    float _166 = _160 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _168 = -_162;
    float _170 = _168 + _164;
    float _172 = precise::max(_166, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _176 = _170 > _172;
    if (!_176)
    {
        out.m_32.x = _112;
        out.m_32.y = _114;
        out.m_32.z = _116;
        out.m_32.w = _118;
        return out;
    }
    float _178 = _136 + _142;
    float _180 = -_142;
    float _182 = _180 + _138;
    float _184 = -_136;
    float _186 = _184 + _144;
    float _188 = _138 + _178;
    float _190 = _182 + _186;
    float _192 = -_186;
    float _194 = _182 + _192;
    float _196 = _144 + _188;
    float _198 = (*spvDescriptorSet0.fp_c3)._m0[4].z * 0.25;
    float _200 = abs(_190);
    float _202 = abs(_194);
    float _204 = precise::min(_200, _202);
    float _206 = fma(_196, _198, (*spvDescriptorSet0.fp_c3)._m0[4].w);
    float _208 = precise::max(_206, _204);
    float _210 = 1.0 / _208;
    float _212 = _190 * _210;
    float _214 = _194 * _210;
    float _216 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _218 = precise::max(_212, _216);
    float _220 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _222 = precise::max(_214, _220);
    float _224 = precise::min(_218, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _226 = precise::min(_222, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _228 = -_224;
    float _230 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[1].z, _71);
    float _232 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[1].z, _71);
    float _234 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[1].w, _73);
    float _236 = -_224;
    float _238 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[1].x, _71);
    float _240 = -_226;
    float _242 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[1].w, _73);
    float _244 = -_226;
    float _246 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[1].y, _73);
    float _248 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[1].x, _71);
    float _250 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[1].y, _73);
    float2 _774 = float2(_230, _242);
    float4 _252 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_774, float2(0.0), isnan(_774))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_774, float2(0.0), isnan(_774))).xyzw;
    float _254 = _252.x;
    float _256 = _252.y;
    float _258 = _252.z;
    float _260 = _252.w;
    float2 _790 = float2(_232, _234);
    float4 _262 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_790, float2(0.0), isnan(_790))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_790, float2(0.0), isnan(_790))).xyzw;
    float _264 = _262.x;
    float _266 = _262.y;
    float _268 = _262.z;
    float _270 = _262.w;
    float2 _806 = float2(_238, _246);
    float4 _272 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_806, float2(0.0), isnan(_806))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_806, float2(0.0), isnan(_806))).xyzw;
    float _274 = _272.x;
    float _276 = _272.y;
    float _278 = _272.z;
    float _280 = _272.w;
    float2 _822 = float2(_248, _250);
    float4 _282 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_822, float2(0.0), isnan(_822))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_822, float2(0.0), isnan(_822))).xyzw;
    float _284 = _282.x;
    float _286 = _282.y;
    float _288 = _282.z;
    float _290 = _282.w;
    float _292 = _256 + _266;
    float _294 = _254 + _264;
    float _296 = _258 + _268;
    float _298 = _276 + _286;
    float _300 = _274 + _284;
    float _302 = _278 + _288;
    float _304 = _260 + _270;
    float _306 = _292 + _298;
    float _308 = _294 + _300;
    float _310 = _296 + _302;
    float _312 = _306 * 0.25;
    float _314 = _308 * 0.25;
    float _316 = _310 * 0.25;
    float _318 = _312 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _320 = fma(_314, (*spvDescriptorSet0.fp_c3)._m0[2].x, _318);
    float _322 = fma(_316, (*spvDescriptorSet0.fp_c3)._m0[2].z, _320);
    bool _324 = _322 > _160;
    bool _326 = isnan(_322);
    bool _328 = _324 || _326;
    bool _330 = isnan(_160);
    bool _332 = _328 || _330;
    float _334 = _304 * 0.5;
    bool _336 = _158 <= _322;
    bool _338 = !_332;
    bool _340 = _336 && _338;
    float _342 = _280 + _290;
    float _344 = _304 + _342;
    float _346 = _314;
    float _348 = _312;
    float _350 = _316;
    float _352 = _334;
    if (!_340)
    {
        float _354 = _294 * 0.5;
        _346 = _354;
    }
    float _356 = _346;
    if (!_340)
    {
        float _358 = _292 * 0.5;
        _348 = _358;
    }
    float _360 = _348;
    if (!_340)
    {
        float _362 = _296 * 0.5;
        _350 = _362;
    }
    float _364 = _350;
    if (_340)
    {
        float _366 = _344 * 0.25;
        _352 = _366;
    }
    float _368 = _352;
    float _370 = -_356;
    float _372 = _112 + _370;
    float _374 = -_360;
    float _376 = _114 + _374;
    float _378 = -_364;
    float _380 = _116 + _378;
    float _382 = -_368;
    float _384 = _118 + _382;
    float _386 = fma(_372, (*spvDescriptorSet0.fp_c3)._m0[5].x, _356);
    float _388 = fma(_376, (*spvDescriptorSet0.fp_c3)._m0[5].x, _360);
    float _390 = fma(_380, (*spvDescriptorSet0.fp_c3)._m0[5].x, _364);
    float _392 = fma(_384, (*spvDescriptorSet0.fp_c3)._m0[5].x, _368);
    out.m_32.x = _386;
    out.m_32.y = _388;
    out.m_32.z = _390;
    out.m_32.w = _392;
    return out;
}

