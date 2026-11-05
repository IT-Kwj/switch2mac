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
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_49 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_37 [[user(locn5)]];
    float4 m_43 [[user(locn6)]];
    float4 m_54 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_37.w;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_37.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_37.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_39.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_39.y;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_39.z;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_39.w;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = 1.0 / _61;
    float _107 = _105 * _67;
    float _109 = _105 * _73;
    float _111 = _105 * _79;
    float _113 = _105 * _85;
    float _115 = _105 * _103;
    float _117 = 1.0 / _107;
    float _119 = _109 * _117;
    float _121 = _111 * _117;
    float _123 = _105 * _91;
    float _125 = _105 * _97;
    float2 _579 = float2(_119, _121);
    float _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_579, float2(0.0), isnan(_579))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_579, float2(0.0), isnan(_579))).x;
    float2 _590 = float2(_113, _123);
    float4 _130 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_590, float2(0.0), isnan(_590))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_590, float2(0.0), isnan(_590))).xyzw;
    float _132 = _130.x;
    float _134 = _130.y;
    float _136 = _130.z;
    float _138 = _130.w;
    float2 _606 = float2(_125, _115);
    float4 _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_606, float2(0.0), isnan(_606))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_606, float2(0.0), isnan(_606))).xyzw;
    float _142 = _140.x;
    float _144 = _140.y;
    float _146 = _140.z;
    float _148 = _140.w;
    float _150 = in.m_41.y;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = in.m_41.x;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = in.m_41.z;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_43.y;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = in.m_43.x;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = in.m_43.z;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    float _186 = in.m_37.z;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = _105 * _154;
    float _194 = _105 * _160;
    float _196 = _105 * _166;
    float _198 = _192 * _192;
    float _200 = fma(_194, _194, _198);
    float _202 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _204 = _202 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _206 = fma(_196, _196, _200);
    float _208 = _105 * _172;
    float _210 = 1.0 / _204;
    float _212 = rsqrt(_206);
    float _214 = in.m_45.x;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = _192 * _212;
    float _222 = _105 * _178;
    float _224 = _196 * _212;
    float _226 = _208 * _220;
    float _228 = _194 * _212;
    float _230 = _105 * _184;
    float _232 = in.m_47.w;
    float _234 = gl_FragCoord.w;
    float _236 = _232 * _234;
    float _238 = fma(_222, _228, _226);
    float _240 = in.m_49.w;
    float _242 = gl_FragCoord.w;
    float _244 = _240 * _242;
    float _246 = fma(_230, _224, _238);
    float _248 = _105 * _190;
    float _250 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _252 = abs(_246);
    float _254 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _256 = _252 + _254;
    float _258 = _248 * _117;
    float _260 = _256 * _210;
    float _262 = precise::clamp(_260, 0.0, 1.0);
    float _264 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _266 = fma(_258, (*spvDescriptorSet0.fp_c8)._m0[30].w, _264);
    float _268 = fma(_262, -2.0, 3.0);
    float _270 = _262 * _262;
    float _272 = 1.0 / _266;
    float _274 = _268 * _270;
    float _276 = _105 * _244;
    float _278 = in.m_47.y;
    float _280 = gl_FragCoord.w;
    float _282 = _278 * _280;
    float _284 = in.m_47.z;
    float _286 = gl_FragCoord.w;
    float _288 = _284 * _286;
    float _290 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _292 = fma(_127, (*spvDescriptorSet0.fp_c8)._m0[30].w, _290);
    float _294 = 1.0 / _292;
    float _296 = -_276;
    float _298 = fma(_138, _148, _296);
    float _300 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _302 = _272 * _300;
    float _304 = _105 * _236;
    float _306 = _304 * _298;
    float _308 = _105 * _218;
    float _310 = 0.0 + _306;
    float _312 = precise::clamp(_310, 0.0, 1.0);
    float _314 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _316 = -_302;
    float _318 = fma(_294, _314, _316);
    float _320 = _318 * _250;
    float _322 = precise::clamp(_320, 0.0, 1.0);
    float _324 = _312 * _322;
    float _326 = _324 * _274;
    float _328 = _326 * _308;
    bool _332 = _328 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _334 = isnan(_328);
    bool _336 = _332 || _334;
    bool _338 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _340 = _336 || _338;
    float _342 = in.m_49.x;
    float _344 = gl_FragCoord.w;
    float _346 = _342 * _344;
    float _348 = in.m_47.x;
    float _350 = gl_FragCoord.w;
    float _352 = _348 * _350;
    float _354 = in.m_49.y;
    float _356 = gl_FragCoord.w;
    float _358 = _354 * _356;
    float _360 = in.m_49.z;
    float _362 = gl_FragCoord.w;
    float _364 = _360 * _362;
    float _366 = _302;
    if (!_340)
    {
        discard_fragment();
    }
    float _368 = _132 * _142;
    float _370 = _134 * _144;
    float _372 = _105 * _282;
    float _374 = _105 * _288;
    float _376 = _136 * _146;
    float _378 = _105 * _346;
    float _380 = _105 * _352;
    float _382 = _105 * _358;
    float _384 = _105 * _364;
    float _386 = -_380;
    float _388 = _378 + _386;
    float _390 = -_372;
    float _392 = _382 + _390;
    float _394 = -_374;
    float _396 = _384 + _394;
    float _398 = fma(_368, _388, _380);
    float _400 = fma(_370, _392, _372);
    float _402 = fma(_376, _396, _374);
    if (!_340)
    {
        out.m_52.x = _398;
        out.m_52.y = _400;
        out.m_52.z = _402;
        out.m_52.w = _306;
        return out;
    }
    float _404 = _400 * 0.715200006961822509765625;
    float _406 = in.m_54.w;
    float _408 = gl_FragCoord.w;
    float _410 = _406 * _408;
    float _412 = in.m_54.x;
    float _414 = gl_FragCoord.w;
    float _416 = _412 * _414;
    float _418 = in.m_54.y;
    float _420 = gl_FragCoord.w;
    float _422 = _418 * _420;
    float _424 = fma(_398, 0.2125999927520751953125, _404);
    float _426 = in.m_54.z;
    float _428 = gl_FragCoord.w;
    float _430 = _426 * _428;
    float _432 = fma(_402, 0.072200000286102294921875, _424);
    bool _434 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _436 = 1.0 / _432;
    float _438 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_434)
    {
        float _440 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _442 = _302 + _440;
        _366 = _442;
    }
    float _444 = _366;
    float _446 = _436 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _448 = precise::clamp(_446, 0.0, 1.0);
    float _450 = fma(_448, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _452 = _105 * _410;
    if (_434)
    {
        float _454 = _444 * 8.0;
        float _456 = precise::clamp(_454, 0.0, 1.0);
        _438 = _456;
    }
    float _458 = _438;
    float _460 = _105 * _416;
    float _462 = _105 * _422;
    float _464 = _450 * _452;
    float _466 = 0.0 + _328;
    float _468 = precise::clamp(_466, 0.0, 1.0);
    float _470 = _105 * _430;
    float _472 = fma(_398, _464, _460);
    float _474 = _468;
    if (_434)
    {
        float _476 = _468 * _458;
        _474 = _476;
    }
    float _478 = _474;
    float _480 = fma(_400, _464, _462);
    float _482 = fma(_402, _464, _470);
    float _484 = 0.0 + _478;
    float _486 = precise::clamp(_484, 0.0, 1.0);
    out.m_52.x = _472;
    out.m_52.y = _480;
    out.m_52.z = _482;
    out.m_52.w = _486;
    return out;
}

