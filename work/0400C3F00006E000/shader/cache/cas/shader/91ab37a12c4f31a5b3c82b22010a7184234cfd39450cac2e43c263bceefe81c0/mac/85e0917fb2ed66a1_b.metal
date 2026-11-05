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
    constant _16* fp_c13 [[id(2)]];
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
    float4 m_43 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
    float4 m_50 [[user(locn5)]];
    float4 m_58 [[user(locn6)]];
    float4 m_54 [[user(locn7), flat]];
    float4 m_37 [[user(locn8)]];
    float4 m_56 [[user(locn9)]];
    float4 m_52 [[user(locn10), flat]];
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
    float2 _466 = float2(_81, _83);
    float4 _86 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_466, float2(0.0), isnan(_466))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_466, float2(0.0), isnan(_466))).xyzw;
    float _88 = _86.x;
    float _90 = _86.y;
    float _92 = _86.z;
    float _94 = _86.w;
    float _96 = in.m_39.w;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_41.x;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_43.w;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = _79 * _100;
    float _116 = in.m_43.y;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = _79 * _112;
    float _124 = 1.0 / _122;
    float _126 = _79 * _120;
    float _128 = _126 * _124;
    float _130 = _94 * _114;
    float _132 = _79 * _106;
    float _134 = 0.0 + _130;
    float _136 = precise::clamp(_134, 0.0, 1.0);
    float _138 = _136 * _132;
    bool _142 = _138 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _144 = isnan(_138);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _150 = _146 || _148;
    if (!_150)
    {
        discard_fragment();
    }
    float _152 = in.m_43.x;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = _79 * _156;
    float _160 = _158 * _124;
    float2 _576 = float2(_160, _128);
    float _162 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_576, float2(0.0), isnan(_576))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_576, float2(0.0), isnan(_576))).x;
    float _164 = in.m_39.x;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = in.m_45.x;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = in.m_39.y;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = in.m_45.y;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = in.m_39.z;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = in.m_45.z;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = _79 * _168;
    float _202 = _79 * _174;
    float _204 = _79 * _180;
    float _206 = _79 * _186;
    float _208 = _79 * _192;
    float _210 = _79 * _198;
    float _212 = -_202;
    float _214 = _200 + _212;
    float _216 = -_206;
    float _218 = _204 + _216;
    float _220 = -_210;
    float _222 = _208 + _220;
    float _224 = fma(_88, _214, _202);
    float _226 = fma(_90, _218, _206);
    float _228 = fma(_92, _222, _210);
    if (!_150)
    {
        out.m_48.x = _224;
        out.m_48.y = _226;
        out.m_48.z = _228;
        out.m_48.w = _130;
        return out;
    }
    float _230 = in.m_50.y;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = in.m_50.x;
    float _238 = gl_FragCoord.w;
    float _240 = _236 * _238;
    float _242 = in.m_52.y;
    float _244 = in.m_52.x;
    float _246 = in.m_50.z;
    float _248 = gl_FragCoord.w;
    float _250 = _246 * _248;
    float _252 = in.m_43.z;
    float _254 = gl_FragCoord.w;
    float _256 = _252 * _254;
    float _258 = in.m_52.z;
    float _260 = in.m_54.x;
    float _262 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _264 = fma(_162, (*spvDescriptorSet0.fp_c8)._m0[30].w, _262);
    float _266 = _79 * _234;
    float _268 = _79 * _240;
    float _270 = -_242;
    float _272 = _266 + _270;
    float _274 = -_244;
    float _276 = _268 + _274;
    float _278 = _79 * _250;
    float _280 = _79 * _256;
    float _282 = _272 * _272;
    float _284 = in.m_56.w;
    float _286 = gl_FragCoord.w;
    float _288 = _284 * _286;
    float _290 = -_258;
    float _292 = _278 + _290;
    float _294 = _280 * _124;
    float _296 = fma(_276, _276, _282);
    float _298 = _260 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _300 = 1.0 / _264;
    float _302 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _304 = fma(_294, (*spvDescriptorSet0.fp_c8)._m0[30].w, _302);
    float _306 = fma(_292, _292, _296);
    float _308 = -_306;
    float _310 = fma(_298, _298, _308);
    float _312 = _226 * 0.715200006961822509765625;
    float _314 = 1.0 / _304;
    float _316 = in.m_58.w;
    float _318 = gl_FragCoord.w;
    float _320 = _316 * _318;
    float _322 = precise::max(0.0, _310);
    float _324 = fma(_224, 0.2125999927520751953125, _312);
    float _326 = fma(_228, 0.072200000286102294921875, _324);
    float _328 = sqrt(_322);
    float _330 = in.m_58.y;
    float _332 = gl_FragCoord.w;
    float _334 = _330 * _332;
    float _336 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _338 = _314 * _336;
    float _340 = 1.0 / _326;
    float _342 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _344 = -_338;
    float _346 = fma(_300, _342, _344);
    float _348 = _79 * _288;
    float _350 = in.m_58.z;
    float _352 = gl_FragCoord.w;
    float _354 = _350 * _352;
    float _356 = _328 + _346;
    float _358 = -_348;
    float _360 = _356 + _358;
    float _362 = in.m_58.x;
    float _364 = gl_FragCoord.w;
    float _366 = _362 * _364;
    float _368 = _360 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    float _370 = _79 * _320;
    float _372 = _368 * (-1.44269502162933349609375);
    bool _374 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _376 = exp2(_372);
    float _378 = _340 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _380 = precise::clamp(_378, 0.0, 1.0);
    float _382 = fma(_380, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _384 = _382 * _370;
    float _386 = _79 * _334;
    float _388 = _338;
    if (_374)
    {
        float _390 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _392 = _338 + _390;
        _388 = _392;
    }
    float _394 = _388;
    float _396 = _79 * _354;
    float _398 = fma(_226, _384, _386);
    float _400 = -_376;
    float _402 = _400 + 1.0;
    float _404 = precise::clamp(_402, 0.0, 1.0);
    float _406 = fma(_228, _384, _396);
    float _408 = _138 * _404;
    float _410 = precise::clamp(_408, 0.0, 1.0);
    float _412 = _404;
    float _414 = _410;
    if (_374)
    {
        float _416 = _394 * 8.0;
        float _418 = precise::clamp(_416, 0.0, 1.0);
        _412 = _418;
    }
    float _420 = _412;
    float _422 = _79 * _366;
    if (_374)
    {
        float _424 = _410 * _420;
        _414 = _424;
    }
    float _426 = _414;
    float _428 = fma(_224, _384, _422);
    float _430 = 0.0 + _426;
    float _432 = precise::clamp(_430, 0.0, 1.0);
    out.m_48.x = _428;
    out.m_48.y = _398;
    out.m_48.z = _406;
    out.m_48.w = _432;
    return out;
}

