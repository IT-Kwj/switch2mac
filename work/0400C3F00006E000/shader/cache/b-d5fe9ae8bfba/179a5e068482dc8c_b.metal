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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texture2d<float> fp_t_tcb_34 [[id(9)]];
    sampler fp_t_tcb_34Smplr [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_34Smplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_60 [[color(0)]];
};

struct main0_in
{
    float4 m_55 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_64 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
    float4 m_57 [[user(locn5), flat]];
    float4 m_39 [[user(locn6)]];
    float4 m_45 [[user(locn7)]];
    float4 m_51 [[user(locn8)]];
    float4 m_47 [[user(locn9)]];
    float4 m_49 [[user(locn10)]];
    float4 m_62 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _71 = gl_FragCoord.w;
    float _73 = in.m_39.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_39.y;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = 1.0 / _71;
    float _87 = _85 * _77;
    float _89 = _85 * _83;
    float2 _615 = float2(_87, _89);
    float2 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_615, float2(0.0), isnan(_615))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_615, float2(0.0), isnan(_615))).xy;
    float _95 = _93.x;
    float _97 = _93.y;
    float _99 = in.m_41.x;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_41.y;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = _85 * _103;
    float _113 = _85 * _109;
    float _115 = fma(_95, 0.300000011920928955078125, _111);
    float _117 = fma(_97, 0.300000011920928955078125, _113);
    float2 _658 = float2(_115, _117);
    float4 _120 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_658, float2(0.0), isnan(_658))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_658, float2(0.0), isnan(_658))).xyzw;
    float _122 = _120.x;
    float _124 = _120.y;
    float _126 = _120.z;
    float _128 = _120.w;
    float _130 = in.m_43.x;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = in.m_45.x;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = in.m_41.z;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_41.w;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = _85 * _134;
    float _156 = in.m_45.y;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = _85 * _140;
    float _164 = _85 * _146;
    float _166 = fma(_95, 0.300000011920928955078125, _162);
    float _168 = fma(_95, 0.300000011920928955078125, _164);
    float _170 = _85 * _152;
    float _172 = fma(_97, 0.300000011920928955078125, _170);
    bool _176 = _128 >= 0.949999988079071044921875;
    bool _178 = isnan(_128);
    bool _180 = _176 || _178;
    bool _182 = isnan(0.949999988079071044921875);
    bool _184 = _180 || _182;
    float _186 = float(_184);
    float _188 = 0.0 + _186;
    float _190 = precise::clamp(_188, 0.0, 1.0);
    float _192 = _190 * _154;
    bool _194 = _192 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _196 = isnan(_192);
    bool _198 = _194 || _196;
    bool _200 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _202 = _198 || _200;
    if (!_202)
    {
        discard_fragment();
    }
    float _204 = _85 * _160;
    float _206 = fma(_97, 0.300000011920928955078125, _204);
    float2 _779 = float2(_168, _172);
    float2 _208 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_779, float2(0.0), isnan(_779))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_779, float2(0.0), isnan(_779))).xy;
    float _210 = _208.x;
    float _212 = _208.y;
    float2 _791 = float2(_166, _206);
    float _214 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_791, float2(0.0), isnan(_791))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_791, float2(0.0), isnan(_791))).w;
    float _216 = in.m_47.y;
    float _218 = gl_FragCoord.w;
    float _220 = _216 * _218;
    float _222 = in.m_47.x;
    float _224 = gl_FragCoord.w;
    float _226 = _222 * _224;
    float _228 = in.m_47.z;
    float _230 = gl_FragCoord.w;
    float _232 = _228 * _230;
    float _234 = in.m_49.y;
    float _236 = gl_FragCoord.w;
    float _238 = _234 * _236;
    float _240 = in.m_49.x;
    float _242 = gl_FragCoord.w;
    float _244 = _240 * _242;
    float _246 = in.m_49.z;
    float _248 = gl_FragCoord.w;
    float _250 = _246 * _248;
    float _252 = in.m_51.y;
    float _254 = gl_FragCoord.w;
    float _256 = _252 * _254;
    float _258 = in.m_51.x;
    float _260 = gl_FragCoord.w;
    float _262 = _258 * _260;
    float _264 = in.m_51.z;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = _85 * _220;
    float _272 = _85 * _226;
    float _274 = _85 * _232;
    float _276 = _270 * _270;
    float _278 = _85 * _244;
    float _280 = fma(_272, _272, _276);
    float _282 = _85 * _250;
    float _284 = _85 * _256;
    float _286 = _85 * _268;
    float _288 = fma(_274, _274, _280);
    float _290 = _85 * _238;
    float _292 = _284 * _284;
    float _294 = _290 * _290;
    float _296 = rsqrt(_288);
    float _298 = fma(_278, _278, _294);
    float _300 = _85 * _262;
    float _302 = fma(_282, _282, _298);
    float _304 = fma(_300, _300, _292);
    float _306 = fma(_286, _286, _304);
    float _308 = rsqrt(_302);
    float _310 = _270 * _296;
    float _312 = _272 * _296;
    float _314 = _274 * _296;
    float _316 = _310 * _310;
    float _318 = rsqrt(_306);
    float _320 = fma(_312, _312, _316);
    float _322 = fma(_314, _314, _320);
    float _324 = rsqrt(_322);
    float _326 = _286 * _318;
    float _328 = _212 * _212;
    float _330 = _318 * _212;
    float _332 = _212 * _326;
    float _334 = in.m_53.y;
    float _336 = gl_FragCoord.w;
    float _338 = _334 * _336;
    float _340 = fma(_210, _210, _328);
    float _342 = precise::clamp(_340, 0.0, 1.0);
    float _344 = _210 * _308;
    float _346 = _284 * _330;
    float _348 = _300 * _330;
    float _350 = -_342;
    float _352 = _350 + 1.0;
    float _354 = in.m_55.x;
    float _356 = gl_FragCoord.w;
    float _358 = _354 * _356;
    float _360 = fma(_290, _344, _346);
    float _362 = in.m_53.x;
    float _364 = gl_FragCoord.w;
    float _366 = _362 * _364;
    float _368 = sqrt(_352);
    float _370 = fma(_278, _344, _348);
    float _372 = fma(_282, _344, _332);
    float _374 = in.m_55.y;
    float _376 = gl_FragCoord.w;
    float _378 = _374 * _376;
    float _380 = in.m_57.x;
    float _382 = _324 * _368;
    float _384 = in.m_53.z;
    float _386 = gl_FragCoord.w;
    float _388 = _384 * _386;
    float _390 = fma(_310, _382, _360);
    float _392 = fma(_312, _382, _370);
    float _394 = fma(_314, _382, _372);
    float _396 = in.m_55.z;
    float _398 = gl_FragCoord.w;
    float _400 = _396 * _398;
    float _402 = _390 * _390;
    float _404 = fma(_392, _392, _402);
    float _406 = _85 * _358;
    float _408 = _85 * _366;
    float _410 = fma(_394, _394, _404);
    float _412 = -_406;
    float _414 = _412 + _408;
    float _416 = _85 * _378;
    float _418 = -_380;
    float _420 = _418 + 1.0;
    float _422 = rsqrt(_410);
    float _424 = fma(_214, _414, _406);
    float _426 = _85 * _338;
    float _428 = -_416;
    float _430 = _428 + _426;
    float _432 = fma(_214, _430, _416);
    float _434 = _390 * _422;
    float _436 = _394 * _422;
    float _438 = _85 * _388;
    float _440 = _434 * (-0.816474258899688720703125);
    float _442 = _85 * _400;
    float _444 = -_440;
    float _446 = fma(_436, 0.577381789684295654296875, _444);
    float _448 = precise::clamp(_446, 0.0, 1.0);
    float _450 = -_442;
    float _452 = _450 + _438;
    float _454 = fma(_448, 0.60000002384185791015625, 0.4000000059604644775390625);
    float _456 = fma(_214, _452, _442);
    float _458 = _420 * 0.25;
    float _460 = _424 * _454;
    float _462 = _432 * _454;
    float _464 = _456 * _454;
    float _466 = fma(_122, _458, _460);
    float _468 = fma(_124, _458, _462);
    float _470 = fma(_126, _458, _464);
    if (!_202)
    {
        out.m_60.x = _466;
        out.m_60.y = _468;
        out.m_60.z = _470;
        out.m_60.w = _186;
        return out;
    }
    float _472 = _468 * 0.715200006961822509765625;
    float _474 = in.m_62.w;
    float _476 = gl_FragCoord.w;
    float _478 = _474 * _476;
    float _480 = in.m_62.z;
    float _482 = gl_FragCoord.w;
    float _484 = _480 * _482;
    float _486 = in.m_62.x;
    float _488 = gl_FragCoord.w;
    float _490 = _486 * _488;
    float _492 = fma(_466, 0.2125999927520751953125, _472);
    float _494 = in.m_62.y;
    float _496 = gl_FragCoord.w;
    float _498 = _494 * _496;
    float _500 = 0.0 + _192;
    float _502 = precise::clamp(_500, 0.0, 1.0);
    float _504 = fma(_470, 0.072200000286102294921875, _492);
    bool _506 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _508 = 1.0 / _504;
    float _510 = _508 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _512 = precise::clamp(_510, 0.0, 1.0);
    float _514 = _85 * _478;
    float _516 = fma(_512, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _518 = _85 * _484;
    float _520 = _516 * _514;
    float _522 = _85 * _490;
    float _524 = _85 * _498;
    float _526 = fma(_470, _520, _518);
    float _528 = fma(_466, _520, _522);
    float _530 = fma(_468, _520, _524);
    float _532 = _518;
    if (!_506)
    {
        _532 = _502;
    }
    float _534 = _532;
    bool _536 = !_506;
    float _538 = _534;
    if (!_536)
    {
        float _540 = in.m_64.w;
        float _542 = gl_FragCoord.w;
        float _544 = _540 * _542;
        float _546 = in.m_64.z;
        float _548 = gl_FragCoord.w;
        float _550 = _546 * _548;
        float _552 = _85 * _544;
        float _554 = _85 * _550;
        float _556 = 1.0 / _552;
        float _558 = _554 * _556;
        float _560 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _562 = fma(_558, (*spvDescriptorSet0.fp_c8)._m0[30].w, _560);
        float _564 = 1.0 / _562;
        float _566 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _568 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _570 = fma(_564, _566, _568);
        float _572 = _570 * 8.0;
        float _574 = precise::clamp(_572, 0.0, 1.0);
        float _576 = _502 * _574;
        _538 = _576;
    }
    float _578 = _538;
    float _580 = 0.0 + _578;
    float _582 = precise::clamp(_580, 0.0, 1.0);
    out.m_60.x = _528;
    out.m_60.y = _530;
    out.m_60.z = _526;
    out.m_60.w = _582;
    return out;
}

