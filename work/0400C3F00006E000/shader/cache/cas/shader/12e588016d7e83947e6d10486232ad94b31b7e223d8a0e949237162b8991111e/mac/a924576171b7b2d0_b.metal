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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_54 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_39 [[user(locn6)]];
    float4 m_43 [[user(locn7)]];
    float4 m_56 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_37.w;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_39.z;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_39.w;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_37.x;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_37.y;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_39.x;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_39.y;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = 1.0 / _63;
    float _109 = _107 * _69;
    float _111 = _107 * _75;
    float _113 = _107 * _81;
    float _115 = _107 * _87;
    float _117 = _107 * _93;
    float _119 = _107 * _99;
    float _121 = 1.0 / _109;
    float _123 = _107 * _105;
    float2 _581 = float2(_111, _113);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_581, float2(0.0), isnan(_581))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_581, float2(0.0), isnan(_581))).w;
    float _127 = _115 * _121;
    float _129 = _117 * _121;
    float2 _598 = float2(_119, _123);
    float4 _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_598, float2(0.0), isnan(_598))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_598, float2(0.0), isnan(_598))).xyzw;
    float _134 = _132.x;
    float _136 = _132.y;
    float _138 = _132.z;
    float _140 = _132.w;
    float2 _614 = float2(_127, _129);
    float _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_614, float2(0.0), isnan(_614))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_614, float2(0.0), isnan(_614))).x;
    float _144 = in.m_41.y;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = in.m_41.x;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = in.m_41.z;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = in.m_43.y;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_43.x;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = in.m_37.z;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = in.m_43.z;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    float _186 = in.m_45.w;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = _107 * _148;
    float _194 = _107 * _154;
    float _196 = _192 * _192;
    float _198 = _107 * _160;
    float _200 = fma(_194, _194, _196);
    float _202 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _204 = _202 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _206 = fma(_198, _198, _200);
    float _208 = _107 * _166;
    float _210 = 1.0 / _204;
    float _212 = rsqrt(_206);
    float _214 = in.m_47.x;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = in.m_49.w;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    float _226 = _192 * _212;
    float _228 = _208 * _226;
    float _230 = _107 * _172;
    float _232 = _194 * _212;
    float _234 = _198 * _212;
    float _236 = _107 * _178;
    float _238 = _107 * _184;
    float _240 = fma(_230, _232, _228);
    float _242 = in.m_51.w;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    float _248 = _236 * _121;
    float _250 = _107 * _190;
    float _252 = fma(_238, _234, _240);
    float _254 = abs(_252);
    float _256 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _258 = _254 + _256;
    float _260 = fma(_250, 2.0, -1.0);
    float _262 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _264 = fma(_248, (*spvDescriptorSet0.fp_c8)._m0[30].w, _262);
    float _266 = _258 * _210;
    float _268 = precise::clamp(_266, 0.0, 1.0);
    float _270 = _268 * _268;
    float _272 = 1.0 / _264;
    float _274 = in.m_45.y;
    float _276 = gl_FragCoord.w;
    float _278 = _274 * _276;
    float _280 = _125 + _260;
    float _282 = precise::clamp(_280, 0.0, 1.0);
    float _284 = fma(_268, -2.0, 3.0);
    float _286 = _284 * _270;
    float _288 = _107 * _246;
    float _290 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _292 = _140 * _282;
    float _294 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _296 = _272 * _294;
    float _298 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _300 = fma(_142, (*spvDescriptorSet0.fp_c8)._m0[30].w, _298);
    float _302 = precise::max(_292, 0.300000011920928955078125);
    float _304 = 1.0 / _300;
    float _306 = precise::min(_302, 0.4000000059604644775390625);
    float _308 = fma(_306, 10.00000095367431640625, -3.000000476837158203125);
    float _310 = _107 * _224;
    float _312 = _308 * _288;
    float _314 = _310 * _312;
    float _316 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _318 = -_296;
    float _320 = fma(_304, _316, _318);
    float _322 = 0.0 + _314;
    float _324 = precise::clamp(_322, 0.0, 1.0);
    float _326 = _320 * _290;
    float _328 = precise::clamp(_326, 0.0, 1.0);
    float _330 = _324 * _328;
    float _332 = _107 * _218;
    float _334 = _330 * _286;
    float _336 = _334 * _332;
    bool _340 = _336 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _342 = isnan(_336);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _348 = _344 || _346;
    float _350 = in.m_49.x;
    float _352 = gl_FragCoord.w;
    float _354 = _350 * _352;
    float _356 = in.m_45.x;
    float _358 = gl_FragCoord.w;
    float _360 = _356 * _358;
    float _362 = in.m_49.z;
    float _364 = gl_FragCoord.w;
    float _366 = _362 * _364;
    float _368 = in.m_49.y;
    float _370 = gl_FragCoord.w;
    float _372 = _368 * _370;
    float _374 = in.m_45.z;
    float _376 = gl_FragCoord.w;
    float _378 = _374 * _376;
    float _380 = _336;
    if (!_348)
    {
        discard_fragment();
    }
    float _382 = _107 * _278;
    float _384 = _107 * _354;
    float _386 = _107 * _360;
    float _388 = _107 * _366;
    float _390 = _107 * _372;
    float _392 = _107 * _378;
    float _394 = -_384;
    float _396 = _394 + _386;
    float _398 = -_390;
    float _400 = _398 + _382;
    float _402 = -_388;
    float _404 = _402 + _392;
    float _406 = fma(_134, _396, _384);
    float _408 = fma(_136, _400, _390);
    float _410 = fma(_138, _404, _388);
    if (!_348)
    {
        out.m_54.x = _406;
        out.m_54.y = _408;
        out.m_54.z = _410;
        out.m_54.w = _314;
        return out;
    }
    float _412 = _408 * 0.715200006961822509765625;
    float _414 = in.m_56.w;
    float _416 = gl_FragCoord.w;
    float _418 = _414 * _416;
    float _420 = in.m_56.x;
    float _422 = gl_FragCoord.w;
    float _424 = _420 * _422;
    float _426 = in.m_56.y;
    float _428 = gl_FragCoord.w;
    float _430 = _426 * _428;
    float _432 = fma(_406, 0.2125999927520751953125, _412);
    float _434 = in.m_56.z;
    float _436 = gl_FragCoord.w;
    float _438 = _434 * _436;
    float _440 = fma(_410, 0.072200000286102294921875, _432);
    bool _442 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _444 = 1.0 / _440;
    float _446 = (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_442)
    {
        float _448 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _450 = _296 + _448;
        _446 = _450;
    }
    float _452 = _446;
    float _454 = _444 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _456 = precise::clamp(_454, 0.0, 1.0);
    float _458 = fma(_456, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _460 = _107 * _418;
    float _462 = _107 * _430;
    float _464 = _458 * _460;
    float _466 = 0.0 + _336;
    float _468 = precise::clamp(_466, 0.0, 1.0);
    float _470 = _468;
    if (_442)
    {
        float _472 = _452 * 8.0;
        float _474 = precise::clamp(_472, 0.0, 1.0);
        _380 = _474;
    }
    float _476 = _380;
    float _478 = _107 * _424;
    float _480 = _107 * _438;
    float _482 = fma(_408, _464, _462);
    if (_442)
    {
        float _484 = _468 * _476;
        _470 = _484;
    }
    float _486 = _470;
    float _488 = fma(_406, _464, _478);
    float _490 = fma(_410, _464, _480);
    float _492 = 0.0 + _486;
    float _494 = precise::clamp(_492, 0.0, 1.0);
    out.m_54.x = _488;
    out.m_54.y = _482;
    out.m_54.z = _490;
    out.m_54.w = _494;
    return out;
}

