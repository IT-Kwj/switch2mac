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
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texturecube<float> fp_t_tcb_1E [[id(7)]];
    sampler fp_t_tcb_1ESmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_1ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_40 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_46 [[user(locn5)]];
    float4 m_51 [[user(locn6)]];
    float4 m_55 [[user(locn7)]];
    float4 m_57 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _66 = gl_FragCoord.w;
    float _68 = in.m_40.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_40.z;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_40.w;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_40.y;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = 1.0 / _66;
    float _94 = _92 * _72;
    float _96 = _92 * _78;
    float _98 = _92 * _84;
    float _100 = _92 * _90;
    float2 _461 = float2(_94, _100);
    float _102 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_461, float2(0.0), isnan(_461))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_461, float2(0.0), isnan(_461))).w;
    float2 _472 = float2(_96, _98);
    float _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_472, float2(0.0), isnan(_472))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_472, float2(0.0), isnan(_472))).w;
    float _106 = in.m_42.w;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_44.w;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_46.x;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = _92 * _110;
    float _126 = _92 * _116;
    float _128 = in.m_42.x;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = -_124;
    float _136 = fma(_102, _104, _134);
    float _138 = _92 * _122;
    float _140 = _126 * _136;
    float _142 = 0.0 + _140;
    float _144 = precise::clamp(_142, 0.0, 1.0);
    float _146 = _144 * _138;
    bool _150 = _146 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _152 = isnan(_146);
    bool _154 = _150 || _152;
    bool _156 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _158 = _154 || _156;
    float _160 = in.m_42.y;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = in.m_42.z;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    if (!_158)
    {
        discard_fragment();
    }
    float _172 = _92 * _132;
    float _174 = _92 * _164;
    float _176 = _92 * _170;
    if (!_158)
    {
        out.m_49.x = _172;
        out.m_49.y = _174;
        out.m_49.z = _176;
        out.m_49.w = _140;
        return out;
    }
    float _178 = in.m_51.y;
    float _180 = gl_FragCoord.w;
    float _182 = _178 * _180;
    float _184 = in.m_51.x;
    float _186 = gl_FragCoord.w;
    float _188 = _184 * _186;
    float _190 = in.m_51.z;
    float _192 = gl_FragCoord.w;
    float _194 = _190 * _192;
    float _196 = _92 * _182;
    float _198 = _92 * _188;
    float _200 = _92 * _194;
    float _202 = _196 * _196;
    float _204 = fma(_198, _198, _202);
    float _206 = fma(_200, _200, _204);
    float _208 = rsqrt(_206);
    float _210 = _198 * _208;
    float _212 = _196 * _208;
    float _214 = _200 * _208;
    float _216 = abs(_210);
    float _218 = abs(_212);
    float _220 = precise::max(_216, _218);
    float _222 = abs(_214);
    float _224 = precise::max(_222, _220);
    float _226 = 1.0 / _224;
    float _228 = -_226;
    float _230 = _214 * _228;
    float _232 = _210 * _226;
    float _234 = _212 * _226;
    float3 _669 = float3(_232, _234, _230);
    float3 _238 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_669, float3(0.0), isnan(_669)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_669, float3(0.0), isnan(_669)), level(0.0)).xyz;
    float _240 = _238.x;
    float _242 = _238.y;
    float _244 = _238.z;
    float _246 = in.m_53.y;
    float _248 = gl_FragCoord.w;
    float _250 = _246 * _248;
    float _252 = in.m_53.z;
    float _254 = gl_FragCoord.w;
    float _256 = _252 * _254;
    float _258 = in.m_53.x;
    float _260 = gl_FragCoord.w;
    float _262 = _258 * _260;
    float _264 = in.m_55.z;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = in.m_55.x;
    float _272 = gl_FragCoord.w;
    float _274 = _270 * _272;
    float _276 = in.m_55.y;
    float _278 = gl_FragCoord.w;
    float _280 = _276 * _278;
    float _282 = in.m_57.x;
    float _284 = gl_FragCoord.w;
    float _286 = _282 * _284;
    float _288 = in.m_57.w;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = in.m_57.y;
    float _296 = gl_FragCoord.w;
    float _298 = _294 * _296;
    float _300 = in.m_57.z;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = _92 * _250;
    float _308 = _92 * _256;
    float _310 = _92 * _262;
    bool _312 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _314 = _92 * _292;
    float _316 = fma(_244, 0.20999999344348907470703125, _308);
    float _318 = fma(_240, 0.20999999344348907470703125, _310);
    float _320 = _92 * _268;
    float _322 = fma(_242, 0.20999999344348907470703125, _306);
    float _324 = _92 * _274;
    float _326 = _92 * _280;
    float _328 = _316 + _320;
    float _330 = _318 + _324;
    float _332 = _322 + _326;
    float _334 = _176 * _328;
    float _336 = 0.0 + _146;
    float _338 = precise::clamp(_336, 0.0, 1.0);
    float _340 = _172 * _330;
    float _342 = _92 * _286;
    float _344 = _174 * _332;
    float _346 = _92 * _298;
    float _348 = _92 * _304;
    float _350 = fma(_340, _314, _342);
    float _352 = _342;
    if (!_312)
    {
        _352 = _338;
    }
    float _354 = _352;
    float _356 = fma(_344, _314, _346);
    float _358 = fma(_334, _314, _348);
    bool _360 = !_312;
    float _362 = _354;
    if (!_360)
    {
        float _364 = in.m_59.w;
        float _366 = gl_FragCoord.w;
        float _368 = _364 * _366;
        float _370 = in.m_59.z;
        float _372 = gl_FragCoord.w;
        float _374 = _370 * _372;
        float _376 = _92 * _368;
        float _378 = _92 * _374;
        float _380 = 1.0 / _376;
        float _382 = _378 * _380;
        float _384 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _386 = fma(_382, (*spvDescriptorSet0.fp_c8)._m0[30].w, _384);
        float _388 = 1.0 / _386;
        float _390 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _392 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _394 = fma(_388, _390, _392);
        float _396 = _394 * 8.0;
        float _398 = precise::clamp(_396, 0.0, 1.0);
        float _400 = _338 * _398;
        _362 = _400;
    }
    float _402 = _362;
    float _404 = 0.0 + _402;
    float _406 = precise::clamp(_404, 0.0, 1.0);
    out.m_49.x = _350;
    out.m_49.y = _356;
    out.m_49.z = _358;
    out.m_49.w = _406;
    return out;
}

