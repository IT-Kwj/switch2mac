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
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_10Smplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
    float4 m_52 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_37.w;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_37.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_37.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_39.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_39.y;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = 1.0 / _59;
    float _93 = _91 * _65;
    float _95 = _91 * _71;
    float _97 = _91 * _77;
    float _99 = _91 * _83;
    float _101 = 1.0 / _93;
    float _103 = _91 * _89;
    float _105 = _95 * _101;
    float _107 = _97 * _101;
    float2 _504 = float2(_105, _107);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_504, float2(0.0), isnan(_504))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_504, float2(0.0), isnan(_504))).x;
    float2 _515 = float2(_99, _103);
    float4 _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_515, float2(0.0), isnan(_515))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_515, float2(0.0), isnan(_515))).xyzw;
    float _114 = _112.x;
    float _116 = _112.y;
    float _118 = _112.z;
    float _120 = _112.w;
    float _122 = in.m_37.z;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_41.w;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_43.w;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_45.x;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _148 = _91 * _126;
    float _150 = _148 * _101;
    float _152 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _154 = fma(_150, (*spvDescriptorSet0.fp_c8)._m0[30].w, _152);
    float _156 = _91 * _132;
    float _158 = 1.0 / _154;
    float _160 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _162 = _158 * _160;
    float _164 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _166 = fma(_109, (*spvDescriptorSet0.fp_c8)._m0[30].w, _164);
    float _168 = _120 * _156;
    float _170 = _91 * _138;
    float _172 = 1.0 / _166;
    float _174 = _170 * _168;
    float _176 = 0.0 + _174;
    float _178 = precise::clamp(_176, 0.0, 1.0);
    float _180 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _182 = -_162;
    float _184 = fma(_172, _180, _182);
    float _186 = _184 * _146;
    float _188 = precise::clamp(_186, 0.0, 1.0);
    float _190 = _91 * _144;
    float _192 = _178 * _188;
    float _194 = _192 * _190;
    bool _198 = _194 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _200 = isnan(_194);
    bool _202 = _198 || _200;
    bool _204 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _206 = _202 || _204;
    float _208 = in.m_39.z;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    float _214 = in.m_39.w;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = _162;
    if (!_206)
    {
        discard_fragment();
    }
    float _222 = _91 * _212;
    float _224 = _91 * _218;
    float2 _679 = float2(_222, _224);
    float3 _228 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_679, float2(0.0), isnan(_679))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_679, float2(0.0), isnan(_679))).xyz;
    float _230 = _228.x;
    float _232 = _228.y;
    float _234 = _228.z;
    float _236 = in.m_43.y;
    float _238 = gl_FragCoord.w;
    float _240 = _236 * _238;
    float _242 = in.m_43.z;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    float _248 = in.m_47.z;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = in.m_43.x;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = in.m_47.x;
    float _262 = gl_FragCoord.w;
    float _264 = _260 * _262;
    float _266 = in.m_47.y;
    float _268 = gl_FragCoord.w;
    float _270 = _266 * _268;
    float _272 = in.m_41.x;
    float _274 = gl_FragCoord.w;
    float _276 = _272 * _274;
    float _278 = in.m_41.y;
    float _280 = gl_FragCoord.w;
    float _282 = _278 * _280;
    float _284 = in.m_41.z;
    float _286 = gl_FragCoord.w;
    float _288 = _284 * _286;
    float _290 = _116 * _116;
    float _292 = _114 * _114;
    float _294 = _118 * _118;
    float _296 = _91 * _264;
    float _298 = _91 * _282;
    float _300 = _230 * _230;
    float _302 = _232 * _232;
    float _304 = _234 * _234;
    float _306 = _91 * _246;
    float _308 = _292 * _300;
    float _310 = _290 * _302;
    float _312 = _91 * _240;
    float _314 = _91 * _252;
    float _316 = _91 * _258;
    float _318 = _91 * _270;
    float _320 = _294 * _304;
    float _322 = -_314;
    float _324 = _306 + _322;
    float _326 = -_296;
    float _328 = _316 + _326;
    float _330 = -_318;
    float _332 = _312 + _330;
    float _334 = fma(_320, _324, _314);
    float _336 = fma(_308, _328, _296);
    float _338 = _91 * _276;
    float _340 = fma(_310, _332, _318);
    float _342 = _91 * _288;
    float _344 = _336 * _338;
    float _346 = _340 * _298;
    float _348 = _334 * _342;
    if (!_206)
    {
        out.m_50.x = _344;
        out.m_50.y = _346;
        out.m_50.z = _348;
        out.m_50.w = _174;
        return out;
    }
    float _350 = _346 * 0.715200006961822509765625;
    float _352 = in.m_52.w;
    float _354 = gl_FragCoord.w;
    float _356 = _352 * _354;
    float _358 = in.m_52.x;
    float _360 = gl_FragCoord.w;
    float _362 = _358 * _360;
    float _364 = in.m_52.y;
    float _366 = gl_FragCoord.w;
    float _368 = _364 * _366;
    float _370 = fma(_344, 0.2125999927520751953125, _350);
    float _372 = in.m_52.z;
    float _374 = gl_FragCoord.w;
    float _376 = _372 * _374;
    float _378 = fma(_348, 0.072200000286102294921875, _370);
    bool _380 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _382 = 1.0 / _378;
    float _384 = (*spvDescriptorSet0.fp_c15)._m0[661].y;
    if (_380)
    {
        float _386 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _388 = _162 + _386;
        _220 = _388;
    }
    float _390 = _220;
    float _392 = _382 * (*spvDescriptorSet0.fp_c15)._m0[661].z;
    float _394 = precise::clamp(_392, 0.0, 1.0);
    float _396 = fma(_394, (*spvDescriptorSet0.fp_c15)._m0[661].y, (*spvDescriptorSet0.fp_c15)._m0[661].x);
    float _398 = _91 * _356;
    if (_380)
    {
        float _400 = _390 * 8.0;
        float _402 = precise::clamp(_400, 0.0, 1.0);
        _384 = _402;
    }
    float _404 = _384;
    float _406 = _91 * _368;
    float _408 = _396 * _398;
    float _410 = 0.0 + _194;
    float _412 = precise::clamp(_410, 0.0, 1.0);
    float _414 = _91 * _362;
    float _416 = _91 * _376;
    float _418 = fma(_346, _408, _406);
    float _420 = _412;
    if (_380)
    {
        float _422 = _412 * _404;
        _420 = _422;
    }
    float _424 = _420;
    float _426 = fma(_344, _408, _414);
    float _428 = fma(_348, _408, _416);
    float _430 = 0.0 + _424;
    float _432 = precise::clamp(_430, 0.0, 1.0);
    out.m_50.x = _426;
    out.m_50.y = _418;
    out.m_50.z = _428;
    out.m_50.w = _432;
    return out;
}

