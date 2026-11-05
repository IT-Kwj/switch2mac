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
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
    float4 m_44 [[user(locn2)]];
    float4 m_53 [[user(locn3)]];
    float4 m_40 [[user(locn4)]];
    float4 m_38 [[user(locn5)]];
    float4 m_59 [[user(locn6)]];
    float4 m_49 [[user(locn8)]];
    float4 m_55 [[user(locn9)]];
    float4 m_51 [[user(locn10)]];
    float4 m_57 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _66 = gl_FragCoord.w;
    float _68 = in.m_38.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_38.y;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = 1.0 / _66;
    float _82 = _80 * _72;
    float _84 = _80 * _78;
    float2 _460 = float2(_82, _84);
    float _86 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_460, float2(0.0), isnan(_460))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_460, float2(0.0), isnan(_460))).w;
    float _88 = in.m_40.w;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_42.w;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_44.x;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = _80 * _92;
    float _108 = _80 * _98;
    float _110 = in.m_42.x;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_40.z;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = _86 * _106;
    float _124 = _108 * _122;
    float _126 = _80 * _104;
    float _128 = 0.0 + _124;
    float _130 = precise::clamp(_128, 0.0, 1.0);
    float _132 = _130 * _126;
    bool _136 = _132 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _138 = isnan(_132);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _144 = _140 || _142;
    float _146 = in.m_40.x;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    if (!_144)
    {
        discard_fragment();
    }
    float _152 = _80 * _114;
    float _154 = _80 * _150;
    float _156 = in.m_40.y;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = _152 * _154;
    float _164 = in.m_42.y;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = _80 * _160;
    float _172 = in.m_42.z;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = _80 * _168;
    float _180 = _178 * _170;
    float _182 = _80 * _176;
    float _184 = _80 * _120;
    float _186 = _182 * _184;
    if (!_144)
    {
        out.m_47.x = _162;
        out.m_47.y = _180;
        out.m_47.z = _186;
        out.m_47.w = _124;
        return out;
    }
    float _188 = in.m_49.y;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = in.m_49.x;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = in.m_49.z;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = _80 * _192;
    float _208 = _80 * _198;
    float _210 = _80 * _204;
    float _212 = _206 * _206;
    float _214 = in.m_51.x;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = fma(_208, _208, _212);
    float _222 = fma(_210, _210, _220);
    float _224 = rsqrt(_222);
    float _226 = _208 * _224;
    float _228 = _206 * _224;
    float _230 = _210 * _224;
    float _232 = _80 * _218;
    float _234 = abs(_226);
    float _236 = abs(_228);
    float _238 = precise::max(_234, _236);
    float _240 = abs(_230);
    float _242 = precise::max(_240, _238);
    float _244 = 1.0 / _242;
    float _246 = _228 * _244;
    float _248 = -_244;
    float _250 = _230 * _248;
    float _252 = precise::min(_232, 1.0);
    float _254 = _226 * _244;
    float3 _709 = float3(_254, _246, _250);
    float3 _258 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_709, float3(0.0), isnan(_709)), level(_252)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_709, float3(0.0), isnan(_709)), level(_252)).xyz;
    float _260 = _258.x;
    float _262 = _258.y;
    float _264 = _258.z;
    float _266 = in.m_53.y;
    float _268 = gl_FragCoord.w;
    float _270 = _266 * _268;
    float _272 = in.m_53.z;
    float _274 = gl_FragCoord.w;
    float _276 = _272 * _274;
    float _278 = in.m_53.x;
    float _280 = gl_FragCoord.w;
    float _282 = _278 * _280;
    float _284 = in.m_55.y;
    float _286 = gl_FragCoord.w;
    float _288 = _284 * _286;
    float _290 = in.m_55.z;
    float _292 = gl_FragCoord.w;
    float _294 = _290 * _292;
    float _296 = in.m_55.x;
    float _298 = gl_FragCoord.w;
    float _300 = _296 * _298;
    float _302 = in.m_57.x;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = in.m_57.w;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = in.m_57.y;
    float _316 = gl_FragCoord.w;
    float _318 = _314 * _316;
    float _320 = in.m_57.z;
    float _322 = gl_FragCoord.w;
    float _324 = _320 * _322;
    float _326 = _80 * _270;
    float _328 = _80 * _276;
    float _330 = _80 * _282;
    bool _332 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _334 = fma(_262, 0.20999999344348907470703125, _326);
    float _336 = fma(_264, 0.20999999344348907470703125, _328);
    float _338 = fma(_260, 0.20999999344348907470703125, _330);
    float _340 = _80 * _288;
    float _342 = _80 * _294;
    float _344 = _80 * _300;
    float _346 = _334 + _340;
    float _348 = _336 + _342;
    float _350 = _338 + _344;
    float _352 = _80 * _312;
    float _354 = _180 * _346;
    float _356 = _186 * _348;
    float _358 = _162 * _350;
    float _360 = 0.0 + _132;
    float _362 = precise::clamp(_360, 0.0, 1.0);
    float _364 = _80 * _306;
    float _366 = _80 * _318;
    float _368 = _80 * _324;
    float _370 = fma(_358, _352, _364);
    float _372 = fma(_354, _352, _366);
    float _374 = fma(_356, _352, _368);
    float _376 = _364;
    if (!_332)
    {
        _376 = _362;
    }
    float _378 = _376;
    bool _380 = !_332;
    float _382 = _378;
    if (!_380)
    {
        float _384 = in.m_59.w;
        float _386 = gl_FragCoord.w;
        float _388 = _384 * _386;
        float _390 = in.m_59.z;
        float _392 = gl_FragCoord.w;
        float _394 = _390 * _392;
        float _396 = _80 * _388;
        float _398 = _80 * _394;
        float _400 = 1.0 / _396;
        float _402 = _398 * _400;
        float _404 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _406 = fma(_402, (*spvDescriptorSet0.fp_c8)._m0[30].w, _404);
        float _408 = 1.0 / _406;
        float _410 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _412 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _414 = fma(_408, _410, _412);
        float _416 = _414 * 8.0;
        float _418 = precise::clamp(_416, 0.0, 1.0);
        float _420 = _362 * _418;
        _382 = _420;
    }
    float _422 = _382;
    float _424 = 0.0 + _422;
    float _426 = precise::clamp(_424, 0.0, 1.0);
    out.m_47.x = _370;
    out.m_47.y = _372;
    out.m_47.z = _374;
    out.m_47.w = _426;
    return out;
}

