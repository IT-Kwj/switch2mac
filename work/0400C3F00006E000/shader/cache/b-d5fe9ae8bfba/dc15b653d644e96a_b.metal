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
    float4 m_45 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
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
    float2 _482 = float2(_81, _83);
    float4 _86 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_482, float2(0.0), isnan(_482))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_482, float2(0.0), isnan(_482))).xyzw;
    float _88 = _86.x;
    float _90 = _86.y;
    float _92 = _86.z;
    float _94 = _86.w;
    float _96 = in.m_39.w;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_41.w;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_43.x;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = _79 * _100;
    float _116 = _79 * _106;
    float _118 = in.m_45.w;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = _79 * _122;
    float _126 = 1.0 / _124;
    float _128 = -_114;
    float _130 = _94 + _128;
    float _132 = _130 * 4.0;
    float _134 = precise::clamp(_132, 0.0, 1.0);
    float _136 = _116 * _134;
    float _138 = _79 * _112;
    float _140 = 0.0 + _136;
    float _142 = precise::clamp(_140, 0.0, 1.0);
    float _144 = _142 * _138;
    bool _148 = _144 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _150 = isnan(_144);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _156 = _152 || _154;
    if (!_156)
    {
        discard_fragment();
    }
    float _158 = in.m_45.x;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = in.m_45.y;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = _79 * _162;
    float _172 = _79 * _168;
    float _174 = _170 * _126;
    float _176 = _172 * _126;
    float2 _612 = float2(_174, _176);
    float _178 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_612, float2(0.0), isnan(_612))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_612, float2(0.0), isnan(_612))).x;
    float _180 = in.m_39.x;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    float _186 = in.m_41.x;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = in.m_39.y;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    float _198 = in.m_41.y;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = in.m_39.z;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = in.m_41.z;
    float _212 = gl_FragCoord.w;
    float _214 = _210 * _212;
    float _216 = _79 * _184;
    float _218 = _79 * _190;
    float _220 = _79 * _196;
    float _222 = _79 * _202;
    float _224 = _79 * _208;
    float _226 = _79 * _214;
    float _228 = -_218;
    float _230 = _216 + _228;
    float _232 = -_222;
    float _234 = _220 + _232;
    float _236 = -_226;
    float _238 = _224 + _236;
    float _240 = fma(_88, _230, _218);
    float _242 = fma(_90, _234, _222);
    float _244 = fma(_92, _238, _226);
    if (!_156)
    {
        out.m_48.x = _240;
        out.m_48.y = _242;
        out.m_48.z = _244;
        out.m_48.w = _136;
        return out;
    }
    float _246 = in.m_50.y;
    float _248 = gl_FragCoord.w;
    float _250 = _246 * _248;
    float _252 = in.m_50.x;
    float _254 = gl_FragCoord.w;
    float _256 = _252 * _254;
    float _258 = in.m_52.y;
    float _260 = in.m_52.x;
    float _262 = in.m_50.z;
    float _264 = gl_FragCoord.w;
    float _266 = _262 * _264;
    float _268 = in.m_45.z;
    float _270 = gl_FragCoord.w;
    float _272 = _268 * _270;
    float _274 = in.m_52.z;
    float _276 = in.m_54.x;
    float _278 = _79 * _250;
    float _280 = _79 * _256;
    float _282 = -_258;
    float _284 = _278 + _282;
    float _286 = -_260;
    float _288 = _280 + _286;
    float _290 = _79 * _266;
    float _292 = _79 * _272;
    float _294 = _284 * _284;
    float _296 = _276 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _298 = -_274;
    float _300 = _290 + _298;
    float _302 = _292 * _126;
    float _304 = fma(_288, _288, _294);
    float _306 = in.m_56.w;
    float _308 = gl_FragCoord.w;
    float _310 = _306 * _308;
    float _312 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _314 = fma(_178, (*spvDescriptorSet0.fp_c8)._m0[30].w, _312);
    float _316 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _318 = fma(_302, (*spvDescriptorSet0.fp_c8)._m0[30].w, _316);
    float _320 = fma(_300, _300, _304);
    float _322 = in.m_58.w;
    float _324 = gl_FragCoord.w;
    float _326 = _322 * _324;
    float _328 = 1.0 / _314;
    float _330 = in.m_58.y;
    float _332 = gl_FragCoord.w;
    float _334 = _330 * _332;
    float _336 = -_320;
    float _338 = fma(_296, _296, _336);
    float _340 = _242 * 0.715200006961822509765625;
    float _342 = in.m_58.z;
    float _344 = gl_FragCoord.w;
    float _346 = _342 * _344;
    float _348 = precise::max(0.0, _338);
    float _350 = 1.0 / _318;
    float _352 = fma(_240, 0.2125999927520751953125, _340);
    float _354 = fma(_244, 0.072200000286102294921875, _352);
    float _356 = sqrt(_348);
    float _358 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _360 = _350 * _358;
    float _362 = 1.0 / _354;
    float _364 = _79 * _310;
    float _366 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _368 = -_360;
    float _370 = fma(_328, _366, _368);
    float _372 = in.m_58.x;
    float _374 = gl_FragCoord.w;
    float _376 = _372 * _374;
    float _378 = _356 + _370;
    float _380 = -_364;
    float _382 = _378 + _380;
    bool _384 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _386 = _382 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    float _388 = _362 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _390 = precise::clamp(_388, 0.0, 1.0);
    float _392 = _386 * (-1.44269502162933349609375);
    float _394 = fma(_390, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _396 = _79 * _326;
    float _398 = exp2(_392);
    float _400 = _328;
    if (_384)
    {
        float _402 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _404 = _360 + _402;
        _400 = _404;
    }
    float _406 = _400;
    float _408 = _394 * _396;
    float _410 = _79 * _334;
    float _412 = fma(_242, _408, _410);
    float _414 = -_398;
    float _416 = _414 + 1.0;
    float _418 = precise::clamp(_416, 0.0, 1.0);
    float _420 = _144 * _418;
    float _422 = precise::clamp(_420, 0.0, 1.0);
    float _424 = _418;
    float _426 = _422;
    if (_384)
    {
        float _428 = _406 * 8.0;
        float _430 = precise::clamp(_428, 0.0, 1.0);
        _424 = _430;
    }
    float _432 = _424;
    float _434 = _79 * _376;
    float _436 = _79 * _346;
    if (_384)
    {
        float _438 = _422 * _432;
        _426 = _438;
    }
    float _440 = _426;
    float _442 = fma(_240, _408, _434);
    float _444 = fma(_244, _408, _436);
    float _446 = 0.0 + _440;
    float _448 = precise::clamp(_446, 0.0, 1.0);
    out.m_48.x = _442;
    out.m_48.y = _412;
    out.m_48.z = _444;
    out.m_48.w = _448;
    return out;
}

