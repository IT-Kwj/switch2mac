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
    texturecube<float> fp_t_tcb_1E [[id(5)]];
    sampler fp_t_tcb_1ESmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_1ESmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
    float4 m_38 [[user(locn2)]];
    float4 m_57 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_42 [[user(locn5)]];
    float4 m_47 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_49 [[user(locn8)]];
    float4 m_55 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _64 = gl_FragCoord.w;
    float _66 = in.m_38.x;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_38.y;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = 1.0 / _64;
    float _80 = _78 * _70;
    float _82 = _78 * _76;
    float2 _418 = float2(_80, _82);
    float _84 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_418, float2(0.0), isnan(_418))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_418, float2(0.0), isnan(_418))).w;
    float _86 = in.m_40.w;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_42.x;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_40.x;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = _78 * _90;
    float _106 = _78 * _96;
    float _108 = in.m_40.y;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = in.m_40.z;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = _78 * _112;
    float _122 = _78 * _118;
    float _124 = _84 * _104;
    float _126 = 0.0 + _124;
    float _128 = precise::clamp(_126, 0.0, 1.0);
    float _130 = _128 * _106;
    bool _134 = _130 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _136 = isnan(_130);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _142 = _138 || _140;
    if (!_142)
    {
        discard_fragment();
    }
    float _144 = _78 * _102;
    if (!_142)
    {
        out.m_45.x = _144;
        out.m_45.y = _120;
        out.m_45.z = _122;
        out.m_45.w = _124;
        return out;
    }
    float _146 = in.m_47.y;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_47.x;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = in.m_47.z;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = _78 * _150;
    float _166 = _78 * _156;
    float _168 = _78 * _162;
    float _170 = _164 * _164;
    float _172 = in.m_49.x;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = fma(_166, _166, _170);
    float _180 = fma(_168, _168, _178);
    float _182 = rsqrt(_180);
    float _184 = _166 * _182;
    float _186 = _164 * _182;
    float _188 = _168 * _182;
    float _190 = _78 * _176;
    float _192 = abs(_184);
    float _194 = abs(_186);
    float _196 = precise::max(_192, _194);
    float _198 = abs(_188);
    float _200 = precise::max(_198, _196);
    float _202 = 1.0 / _200;
    float _204 = _186 * _202;
    float _206 = -_202;
    float _208 = _188 * _206;
    float _210 = precise::min(_190, 1.0);
    float _212 = _184 * _202;
    float3 _615 = float3(_212, _204, _208);
    float3 _216 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_615, float3(0.0), isnan(_615)), level(_210)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_615, float3(0.0), isnan(_615)), level(_210)).xyz;
    float _218 = _216.x;
    float _220 = _216.y;
    float _222 = _216.z;
    float _224 = in.m_51.y;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = in.m_51.z;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = in.m_51.x;
    float _238 = gl_FragCoord.w;
    float _240 = _236 * _238;
    float _242 = in.m_53.y;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    float _248 = in.m_53.z;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = in.m_53.x;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = in.m_55.x;
    float _262 = gl_FragCoord.w;
    float _264 = _260 * _262;
    float _266 = in.m_55.w;
    float _268 = gl_FragCoord.w;
    float _270 = _266 * _268;
    float _272 = in.m_55.y;
    float _274 = gl_FragCoord.w;
    float _276 = _272 * _274;
    float _278 = in.m_55.z;
    float _280 = gl_FragCoord.w;
    float _282 = _278 * _280;
    float _284 = _78 * _228;
    float _286 = _78 * _234;
    float _288 = _78 * _240;
    bool _290 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _292 = fma(_220, 0.20999999344348907470703125, _284);
    float _294 = fma(_222, 0.20999999344348907470703125, _286);
    float _296 = fma(_218, 0.20999999344348907470703125, _288);
    float _298 = _78 * _246;
    float _300 = _78 * _252;
    float _302 = _78 * _258;
    float _304 = _292 + _298;
    float _306 = _294 + _300;
    float _308 = _296 + _302;
    float _310 = _78 * _270;
    float _312 = _120 * _304;
    float _314 = _122 * _306;
    float _316 = _144 * _308;
    float _318 = 0.0 + _130;
    float _320 = precise::clamp(_318, 0.0, 1.0);
    float _322 = _78 * _264;
    float _324 = _78 * _276;
    float _326 = _78 * _282;
    float _328 = fma(_316, _310, _322);
    float _330 = fma(_312, _310, _324);
    float _332 = fma(_314, _310, _326);
    float _334 = _322;
    if (!_290)
    {
        _334 = _320;
    }
    float _336 = _334;
    bool _338 = !_290;
    float _340 = _336;
    if (!_338)
    {
        float _342 = in.m_57.w;
        float _344 = gl_FragCoord.w;
        float _346 = _342 * _344;
        float _348 = in.m_57.z;
        float _350 = gl_FragCoord.w;
        float _352 = _348 * _350;
        float _354 = _78 * _346;
        float _356 = _78 * _352;
        float _358 = 1.0 / _354;
        float _360 = _356 * _358;
        float _362 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _364 = fma(_360, (*spvDescriptorSet0.fp_c8)._m0[30].w, _362);
        float _366 = 1.0 / _364;
        float _368 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _370 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _372 = fma(_366, _368, _370);
        float _374 = _372 * 8.0;
        float _376 = precise::clamp(_374, 0.0, 1.0);
        float _378 = _320 * _376;
        _340 = _378;
    }
    float _380 = _340;
    float _382 = 0.0 + _380;
    float _384 = precise::clamp(_382, 0.0, 1.0);
    out.m_45.x = _328;
    out.m_45.y = _330;
    out.m_45.z = _332;
    out.m_45.w = _384;
    return out;
}

