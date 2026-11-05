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
    float4 m_41 [[user(locn1)]];
    float4 m_54 [[user(locn2), flat]];
    float4 m_45 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
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
    float2 _440 = float2(_79, _81);
    float4 _84 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_440, float2(0.0), isnan(_440))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_440, float2(0.0), isnan(_440))).xyzw;
    float _86 = _84.x;
    float _88 = _84.y;
    float _90 = _84.z;
    float _92 = _84.w;
    float _94 = in.m_39.w;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_41.w;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_43.x;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = _77 * _98;
    float _114 = _77 * _104;
    float _116 = in.m_45.y;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = _77 * _120;
    float _124 = _92 * _112;
    float _126 = _114 * _124;
    float _128 = _77 * _110;
    float _130 = 0.0 + _126;
    float _132 = precise::clamp(_130, 0.0, 1.0);
    float _134 = _132 * _128;
    bool _138 = _134 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _140 = isnan(_134);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _146 = _142 || _144;
    float _148 = in.m_45.w;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    if (!_146)
    {
        discard_fragment();
    }
    float _154 = in.m_45.x;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = _77 * _152;
    float _162 = 1.0 / _160;
    float _164 = _77 * _158;
    float _166 = _164 * _162;
    float _168 = _122 * _162;
    float2 _563 = float2(_166, _168);
    float _170 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_563, float2(0.0), isnan(_563))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_563, float2(0.0), isnan(_563))).x;
    float _172 = in.m_39.x;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = in.m_41.x;
    float _180 = gl_FragCoord.w;
    float _182 = _178 * _180;
    float _184 = in.m_39.y;
    float _186 = gl_FragCoord.w;
    float _188 = _184 * _186;
    float _190 = in.m_41.y;
    float _192 = gl_FragCoord.w;
    float _194 = _190 * _192;
    float _196 = in.m_39.z;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    float _202 = in.m_41.z;
    float _204 = gl_FragCoord.w;
    float _206 = _202 * _204;
    float _208 = _77 * _176;
    float _210 = _77 * _182;
    float _212 = _77 * _188;
    float _214 = _77 * _194;
    float _216 = _77 * _200;
    float _218 = _77 * _206;
    float _220 = -_210;
    float _222 = _208 + _220;
    float _224 = -_214;
    float _226 = _212 + _224;
    float _228 = -_218;
    float _230 = _216 + _228;
    float _232 = fma(_86, _222, _210);
    float _234 = fma(_88, _226, _214);
    float _236 = fma(_90, _230, _218);
    if (!_146)
    {
        out.m_48.x = _232;
        out.m_48.y = _234;
        out.m_48.z = _236;
        out.m_48.w = _126;
        return out;
    }
    float _238 = in.m_50.y;
    float _240 = gl_FragCoord.w;
    float _242 = _238 * _240;
    float _244 = in.m_50.x;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    float _250 = in.m_52.y;
    float _252 = in.m_52.x;
    float _254 = in.m_50.z;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = in.m_45.z;
    float _262 = gl_FragCoord.w;
    float _264 = _260 * _262;
    float _266 = in.m_52.z;
    float _268 = in.m_54.x;
    float _270 = _77 * _242;
    float _272 = _77 * _248;
    float _274 = -_250;
    float _276 = _270 + _274;
    float _278 = -_252;
    float _280 = _272 + _278;
    float _282 = _77 * _258;
    float _284 = _268 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _286 = _276 * _276;
    float _288 = _77 * _264;
    float _290 = -_266;
    float _292 = _282 + _290;
    float _294 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _296 = fma(_170, (*spvDescriptorSet0.fp_c8)._m0[30].w, _294);
    float _298 = fma(_280, _280, _286);
    float _300 = _288 * _162;
    float _302 = in.m_56.w;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = fma(_292, _292, _298);
    float _310 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _312 = fma(_300, (*spvDescriptorSet0.fp_c8)._m0[30].w, _310);
    float _314 = 1.0 / _296;
    float _316 = -_308;
    float _318 = fma(_284, _284, _316);
    float _320 = precise::max(0.0, _318);
    float _322 = 1.0 / _312;
    float _324 = sqrt(_320);
    float _326 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _328 = _322 * _326;
    float _330 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _332 = -_328;
    float _334 = fma(_314, _330, _332);
    float _336 = _77 * _306;
    float _338 = _324 + _334;
    float _340 = -_336;
    float _342 = _338 + _340;
    float _344 = _342 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    float _346 = _234 * 0.715200006961822509765625;
    float _348 = _344 * (-1.44269502162933349609375);
    float _350 = fma(_232, 0.2125999927520751953125, _346);
    float _352 = fma(_236, 0.072200000286102294921875, _350);
    float _354 = exp2(_348);
    bool _356 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _358 = 1.0 / _352;
    float _360 = -_354;
    float _362 = _360 + 1.0;
    float _364 = precise::clamp(_362, 0.0, 1.0);
    float _366 = _328;
    float _368 = _364;
    if (_356)
    {
        float _370 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _372 = _328 + _370;
        _366 = _372;
    }
    float _374 = _366;
    float _376 = _134 * _364;
    float _378 = precise::clamp(_376, 0.0, 1.0);
    float _380 = _378;
    if (_356)
    {
        float _382 = _374 * 8.0;
        float _384 = precise::clamp(_382, 0.0, 1.0);
        _368 = _384;
    }
    float _386 = _368;
    float _388 = _358 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _390 = precise::clamp(_388, 0.0, 1.0);
    if (_356)
    {
        float _392 = _378 * _386;
        _380 = _392;
    }
    float _394 = _380;
    float _396 = fma(_390, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _398 = 0.0 + _394;
    float _400 = precise::clamp(_398, 0.0, 1.0);
    float _402 = _232 * _396;
    float _404 = _234 * _396;
    float _406 = _236 * _396;
    out.m_48.x = _402;
    out.m_48.y = _404;
    out.m_48.z = _406;
    out.m_48.w = _400;
    return out;
}

