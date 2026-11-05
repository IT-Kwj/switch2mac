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
    float4 m_41 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_50 [[user(locn5)]];
    float4 m_56 [[user(locn6)]];
    float4 m_54 [[user(locn7), flat]];
    float4 m_37 [[user(locn8)]];
    float4 m_58 [[user(locn9)]];
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
    float2 _484 = float2(_81, _83);
    float4 _86 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_484, float2(0.0), isnan(_484))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_484, float2(0.0), isnan(_484))).xyzw;
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
    float _118 = _79 * _112;
    float _120 = in.m_45.w;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = in.m_45.y;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = _79 * _130;
    float _134 = -_114;
    float _136 = _94 + _134;
    float _138 = _116 * _136;
    float _140 = 0.0 + _138;
    float _142 = precise::clamp(_140, 0.0, 1.0);
    float _144 = _142 * _118;
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
    float _164 = _79 * _124;
    float _166 = 1.0 / _164;
    float _168 = _132 * _166;
    float _170 = _79 * _162;
    float _172 = _170 * _166;
    float2 _609 = float2(_172, _168);
    float _174 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_609, float2(0.0), isnan(_609))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_609, float2(0.0), isnan(_609))).x;
    float _176 = in.m_39.x;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = in.m_39.y;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = in.m_41.x;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = in.m_41.y;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = in.m_39.z;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = in.m_41.z;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = _90 * _90;
    float _214 = _88 * _88;
    float _216 = _92 * _92;
    float _218 = _79 * _180;
    float _220 = _79 * _186;
    float _222 = _79 * _192;
    float _224 = _79 * _198;
    float _226 = _79 * _204;
    float _228 = _79 * _210;
    float _230 = -_222;
    float _232 = _218 + _230;
    float _234 = -_224;
    float _236 = _220 + _234;
    float _238 = -_228;
    float _240 = _226 + _238;
    float _242 = fma(_214, _232, _222);
    float _244 = fma(_212, _236, _224);
    float _246 = fma(_216, _240, _228);
    if (!_156)
    {
        out.m_48.x = _242;
        out.m_48.y = _244;
        out.m_48.z = _246;
        out.m_48.w = _138;
        return out;
    }
    float _248 = in.m_50.y;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = in.m_50.x;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = in.m_52.y;
    float _262 = in.m_52.x;
    float _264 = in.m_50.z;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = in.m_45.z;
    float _272 = gl_FragCoord.w;
    float _274 = _270 * _272;
    float _276 = in.m_52.z;
    float _278 = in.m_54.x;
    float _280 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _282 = fma(_174, (*spvDescriptorSet0.fp_c8)._m0[30].w, _280);
    float _284 = 1.0 / _282;
    float _286 = _79 * _252;
    float _288 = _79 * _258;
    float _290 = in.m_56.y;
    float _292 = gl_FragCoord.w;
    float _294 = _290 * _292;
    float _296 = -_260;
    float _298 = _286 + _296;
    float _300 = -_262;
    float _302 = _288 + _300;
    float _304 = _79 * _268;
    float _306 = _278 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _308 = _298 * _298;
    float _310 = _79 * _274;
    float _312 = -_276;
    float _314 = _304 + _312;
    float _316 = in.m_56.w;
    float _318 = gl_FragCoord.w;
    float _320 = _316 * _318;
    float _322 = fma(_302, _302, _308);
    float _324 = _310 * _166;
    float _326 = in.m_58.w;
    float _328 = gl_FragCoord.w;
    float _330 = _326 * _328;
    float _332 = in.m_56.z;
    float _334 = gl_FragCoord.w;
    float _336 = _332 * _334;
    float _338 = fma(_314, _314, _322);
    float _340 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _342 = fma(_324, (*spvDescriptorSet0.fp_c8)._m0[30].w, _340);
    float _344 = -_338;
    float _346 = fma(_306, _306, _344);
    float _348 = 1.0 / _342;
    float _350 = _244 * 0.715200006961822509765625;
    float _352 = precise::max(0.0, _346);
    float _354 = fma(_242, 0.2125999927520751953125, _350);
    float _356 = fma(_246, 0.072200000286102294921875, _354);
    float _358 = sqrt(_352);
    float _360 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _362 = _348 * _360;
    float _364 = 1.0 / _356;
    float _366 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _368 = -_362;
    float _370 = fma(_284, _366, _368);
    float _372 = _79 * _330;
    float _374 = _358 + _370;
    float _376 = in.m_56.x;
    float _378 = gl_FragCoord.w;
    float _380 = _376 * _378;
    float _382 = -_372;
    float _384 = _374 + _382;
    float _386 = _384 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    float _388 = _386 * (-1.44269502162933349609375);
    bool _390 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _392 = exp2(_388);
    float _394 = _364 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _396 = precise::clamp(_394, 0.0, 1.0);
    float _398 = fma(_396, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _400 = _79 * _320;
    float _402 = _398 * _400;
    float _404 = _362;
    float _406 = _342;
    if (_390)
    {
        float _408 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _410 = _362 + _408;
        _404 = _410;
    }
    float _412 = _404;
    float _414 = _79 * _380;
    float _416 = -_392;
    float _418 = _416 + 1.0;
    float _420 = precise::clamp(_418, 0.0, 1.0);
    if (_390)
    {
        float _422 = _412 * 8.0;
        float _424 = precise::clamp(_422, 0.0, 1.0);
        _406 = _424;
    }
    float _426 = _406;
    float _428 = fma(_242, _402, _414);
    float _430 = _144 * _420;
    float _432 = precise::clamp(_430, 0.0, 1.0);
    float _434 = _79 * _294;
    float _436 = _79 * _336;
    float _438 = _432;
    if (_390)
    {
        float _440 = _432 * _426;
        _438 = _440;
    }
    float _442 = _438;
    float _444 = fma(_244, _402, _434);
    float _446 = fma(_246, _402, _436);
    float _448 = 0.0 + _442;
    float _450 = precise::clamp(_448, 0.0, 1.0);
    out.m_48.x = _428;
    out.m_48.y = _444;
    out.m_48.z = _446;
    out.m_48.w = _450;
    return out;
}

