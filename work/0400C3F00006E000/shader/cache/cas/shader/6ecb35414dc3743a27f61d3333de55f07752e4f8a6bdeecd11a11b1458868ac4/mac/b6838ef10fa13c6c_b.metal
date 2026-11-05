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
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_54 [[user(locn2), flat]];
    float4 m_43 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_52 [[user(locn6), flat]];
    float4 m_50 [[user(locn7)]];
    float4 m_37 [[user(locn8)]];
    float4 m_56 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_37.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_37.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = 1.0 / _63;
    float _79 = _77 * _69;
    float _81 = _77 * _75;
    float2 _430 = float2(_79, _81);
    float4 _84 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_430, float2(0.0), isnan(_430))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_430, float2(0.0), isnan(_430))).xyzw;
    float _86 = _84.x;
    float _88 = _84.y;
    float _90 = _84.z;
    float _92 = _84.w;
    float _94 = in.m_39.w;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_41.x;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = _77 * _98;
    float _108 = in.m_43.x;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = in.m_43.y;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = _77 * _118;
    float _122 = _92 * _106;
    float _124 = _77 * _104;
    float _126 = 0.0 + _122;
    float _128 = precise::clamp(_126, 0.0, 1.0);
    float _130 = _128 * _124;
    bool _134 = _130 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _136 = isnan(_130);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _142 = _138 || _140;
    float _144 = in.m_43.w;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    if (!_142)
    {
        discard_fragment();
    }
    float _150 = _77 * _112;
    float _152 = _77 * _148;
    float _154 = 1.0 / _152;
    float _156 = _150 * _154;
    float _158 = _120 * _154;
    float2 _540 = float2(_156, _158);
    float _160 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_540, float2(0.0), isnan(_540))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_540, float2(0.0), isnan(_540))).x;
    float _162 = in.m_39.x;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_45.x;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = in.m_39.y;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = in.m_45.y;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    float _186 = in.m_39.z;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = in.m_45.z;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    float _198 = _77 * _166;
    float _200 = _77 * _172;
    float _202 = _77 * _178;
    float _204 = _77 * _184;
    float _206 = _77 * _190;
    float _208 = _77 * _196;
    float _210 = -_200;
    float _212 = _198 + _210;
    float _214 = -_204;
    float _216 = _202 + _214;
    float _218 = -_208;
    float _220 = _206 + _218;
    float _222 = fma(_86, _212, _200);
    float _224 = fma(_88, _216, _204);
    float _226 = fma(_90, _220, _208);
    if (!_142)
    {
        out.m_48.x = _222;
        out.m_48.y = _224;
        out.m_48.z = _226;
        out.m_48.w = _122;
        return out;
    }
    float _228 = in.m_50.y;
    float _230 = gl_FragCoord.w;
    float _232 = _228 * _230;
    float _234 = in.m_50.x;
    float _236 = gl_FragCoord.w;
    float _238 = _234 * _236;
    float _240 = in.m_52.y;
    float _242 = in.m_52.x;
    float _244 = in.m_50.z;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    float _250 = in.m_43.z;
    float _252 = gl_FragCoord.w;
    float _254 = _250 * _252;
    float _256 = in.m_52.z;
    float _258 = in.m_54.x;
    float _260 = _77 * _232;
    float _262 = _77 * _238;
    float _264 = -_240;
    float _266 = _260 + _264;
    float _268 = -_242;
    float _270 = _262 + _268;
    float _272 = _77 * _248;
    float _274 = _258 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _276 = _266 * _266;
    float _278 = _77 * _254;
    float _280 = -_256;
    float _282 = _272 + _280;
    float _284 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _286 = fma(_160, (*spvDescriptorSet0.fp_c8)._m0[30].w, _284);
    float _288 = fma(_270, _270, _276);
    float _290 = _278 * _154;
    float _292 = in.m_56.w;
    float _294 = gl_FragCoord.w;
    float _296 = _292 * _294;
    float _298 = fma(_282, _282, _288);
    float _300 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _302 = fma(_290, (*spvDescriptorSet0.fp_c8)._m0[30].w, _300);
    float _304 = 1.0 / _286;
    float _306 = -_298;
    float _308 = fma(_274, _274, _306);
    float _310 = precise::max(0.0, _308);
    float _312 = 1.0 / _302;
    float _314 = sqrt(_310);
    float _316 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _318 = _312 * _316;
    float _320 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _322 = -_318;
    float _324 = fma(_304, _320, _322);
    float _326 = _77 * _296;
    float _328 = _314 + _324;
    float _330 = -_326;
    float _332 = _328 + _330;
    float _334 = _332 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    float _336 = _224 * 0.715200006961822509765625;
    float _338 = _334 * (-1.44269502162933349609375);
    float _340 = fma(_222, 0.2125999927520751953125, _336);
    float _342 = fma(_226, 0.072200000286102294921875, _340);
    float _344 = exp2(_338);
    bool _346 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _348 = 1.0 / _342;
    float _350 = -_344;
    float _352 = _350 + 1.0;
    float _354 = precise::clamp(_352, 0.0, 1.0);
    float _356 = _318;
    float _358 = _354;
    if (_346)
    {
        float _360 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _362 = _318 + _360;
        _356 = _362;
    }
    float _364 = _356;
    float _366 = _130 * _354;
    float _368 = precise::clamp(_366, 0.0, 1.0);
    float _370 = _368;
    if (_346)
    {
        float _372 = _364 * 8.0;
        float _374 = precise::clamp(_372, 0.0, 1.0);
        _358 = _374;
    }
    float _376 = _358;
    float _378 = _348 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _380 = precise::clamp(_378, 0.0, 1.0);
    if (_346)
    {
        float _382 = _368 * _376;
        _370 = _382;
    }
    float _384 = _370;
    float _386 = fma(_380, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _388 = 0.0 + _384;
    float _390 = precise::clamp(_388, 0.0, 1.0);
    float _392 = _222 * _386;
    float _394 = _224 * _386;
    float _396 = _226 * _386;
    out.m_48.x = _392;
    out.m_48.y = _394;
    out.m_48.z = _396;
    out.m_48.w = _390;
    return out;
}

