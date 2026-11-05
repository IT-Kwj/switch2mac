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
    float4 m_51 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_44 [[user(locn4)]];
    float4 m_40 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 m_55 [[user(locn7)]];
    float4 m_57 [[user(locn8)]];
    float4 m_53 [[user(locn9)]];
    float4 m_67 [[user(locn10)]];
    float4 m_63 [[user(locn11)]];
    float4 m_69 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _78 = gl_FragCoord.w;
    float _80 = in.m_40.x;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_40.y;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = 1.0 / _78;
    float _94 = _92 * _84;
    float _96 = _92 * _90;
    float2 _685 = float2(_94, _96);
    float4 _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_685, float2(0.0), isnan(_685))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_685, float2(0.0), isnan(_685))).xyzw;
    float _101 = _99.x;
    float _103 = _99.y;
    float _105 = _99.z;
    float _107 = _99.w;
    float _109 = in.m_42.w;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_44.w;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_46.w;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_48.x;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = _92 * _113;
    float _135 = _92 * _119;
    float _137 = _92 * _125;
    float _139 = in.m_40.z;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = -_133;
    float _147 = fma(_107, _135, _145);
    float _149 = _137 * _147;
    float _151 = _92 * _131;
    float _153 = 0.0 + _149;
    float _155 = precise::clamp(_153, 0.0, 1.0);
    float _157 = _155 * _151;
    bool _160 = _157 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _162 = isnan(_157);
    bool _164 = _160 || _162;
    bool _166 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _168 = _164 || _166;
    float _170 = in.m_40.w;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    if (!_168)
    {
        discard_fragment();
    }
    float _176 = _92 * _143;
    float _178 = _92 * _174;
    float2 _803 = float2(_176, _178);
    float2 _182 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_803, float2(0.0), isnan(_803))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_803, float2(0.0), isnan(_803))).xy;
    float _184 = _182.x;
    float _186 = _182.y;
    float _188 = in.m_42.x;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = in.m_46.x;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = in.m_42.y;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = in.m_46.y;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = in.m_42.z;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = in.m_46.z;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = in.m_44.x;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = in.m_44.y;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = in.m_44.z;
    float _238 = gl_FragCoord.w;
    float _240 = _236 * _238;
    float _242 = _92 * _192;
    float _244 = _92 * _198;
    float _246 = _92 * _204;
    float _248 = _92 * _210;
    float _250 = _92 * _216;
    float _252 = _92 * _222;
    float _254 = -_244;
    float _256 = _242 + _254;
    float _258 = -_248;
    float _260 = _246 + _258;
    float _262 = -_252;
    float _264 = _250 + _262;
    float _266 = fma(_101, _256, _244);
    float _268 = fma(_103, _260, _248);
    float _270 = _92 * _228;
    float _272 = fma(_105, _264, _252);
    float _274 = _92 * _234;
    float _276 = _92 * _240;
    float _278 = _266 * _270;
    float _280 = _268 * _274;
    float _282 = _272 * _276;
    if (!_168)
    {
        out.m_51.x = _278;
        out.m_51.y = _280;
        out.m_51.z = _282;
        out.m_51.w = _149;
        return out;
    }
    float _284 = in.m_53.y;
    float _286 = gl_FragCoord.w;
    float _288 = _284 * _286;
    float _290 = in.m_53.x;
    float _292 = gl_FragCoord.w;
    float _294 = _290 * _292;
    float _296 = in.m_53.z;
    float _298 = gl_FragCoord.w;
    float _300 = _296 * _298;
    float _302 = in.m_55.y;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = in.m_55.x;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = in.m_55.z;
    float _316 = gl_FragCoord.w;
    float _318 = _314 * _316;
    float _320 = in.m_57.y;
    float _322 = gl_FragCoord.w;
    float _324 = _320 * _322;
    float _326 = in.m_57.x;
    float _328 = gl_FragCoord.w;
    float _330 = _326 * _328;
    float _332 = in.m_57.z;
    float _334 = gl_FragCoord.w;
    float _336 = _332 * _334;
    float _338 = _186 * _186;
    float _340 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _342 = fma(_184, _184, _338);
    float _344 = precise::clamp(_342, 0.0, 1.0);
    float _346 = -_344;
    float _348 = _346 + 1.0;
    float _350 = sqrt(_348);
    float _352 = _92 * _288;
    float _354 = _92 * _294;
    float _356 = _92 * _300;
    float _358 = _92 * _306;
    float _360 = _352 * _352;
    float _362 = _92 * _318;
    float _364 = _92 * _324;
    float _366 = _92 * _330;
    float _368 = fma(_354, _354, _360);
    float _370 = _92 * _312;
    float _372 = _358 * _358;
    float _374 = _364 * _364;
    float _376 = fma(_356, _356, _368);
    float _378 = _92 * _336;
    float _380 = fma(_370, _370, _372);
    float _382 = fma(_366, _366, _374);
    bool _384 = as_type<int>(_340) != 0;
    float _386 = fma(_362, _362, _380);
    float _388 = fma(_378, _378, _382);
    float _390 = rsqrt(_376);
    float _392 = rsqrt(_386);
    float _394 = rsqrt(_388);
    float _396 = _390 * _184;
    float _398 = _392 * _186;
    float _400 = _358 * _398;
    float _402 = _370 * _398;
    float _404 = _362 * _398;
    float _406 = _394 * _350;
    float _408 = fma(_352, _396, _400);
    float _410 = fma(_354, _396, _402);
    float _412 = fma(_356, _396, _404);
    float _414 = fma(_364, _406, _408);
    float _416 = fma(_366, _406, _410);
    float _418 = fma(_378, _406, _412);
    float _420 = in.m_63.x;
    float _422 = gl_FragCoord.w;
    float _424 = _420 * _422;
    bool _426 = !_384;
    float _428 = -_414;
    float _430 = _426 ? _428 : _414;
    bool _432 = !_384;
    float _434 = -_416;
    float _436 = _432 ? _434 : _416;
    bool _438 = !_384;
    float _440 = -_418;
    float _442 = _438 ? _440 : _418;
    float _444 = _430 * _430;
    float _446 = fma(_436, _436, _444);
    float _448 = fma(_442, _442, _446);
    float _450 = rsqrt(_448);
    float _452 = _436 * _450;
    float _454 = _430 * _450;
    float _456 = _442 * _450;
    float _458 = abs(_452);
    float _460 = abs(_454);
    float _462 = precise::max(_458, _460);
    float _464 = abs(_456);
    float _466 = precise::max(_464, _462);
    float _468 = _92 * _424;
    float _470 = 1.0 / _466;
    float _472 = _454 * _470;
    float _474 = _452 * _470;
    float _476 = -_470;
    float _478 = _456 * _476;
    float _480 = precise::min(_468, 1.0);
    float3 _1231 = float3(_474, _472, _478);
    float3 _484 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1231, float3(0.0), isnan(_1231)), level(_480)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1231, float3(0.0), isnan(_1231)), level(_480)).xyz;
    float _486 = _484.x;
    float _488 = _484.y;
    float _490 = _484.z;
    float _492 = in.m_65.x;
    float _494 = gl_FragCoord.w;
    float _496 = _492 * _494;
    float _498 = in.m_65.y;
    float _500 = gl_FragCoord.w;
    float _502 = _498 * _500;
    float _504 = in.m_65.z;
    float _506 = gl_FragCoord.w;
    float _508 = _504 * _506;
    float _510 = in.m_67.y;
    float _512 = gl_FragCoord.w;
    float _514 = _510 * _512;
    float _516 = in.m_67.z;
    float _518 = gl_FragCoord.w;
    float _520 = _516 * _518;
    float _522 = in.m_67.x;
    float _524 = gl_FragCoord.w;
    float _526 = _522 * _524;
    float _528 = in.m_69.x;
    float _530 = gl_FragCoord.w;
    float _532 = _528 * _530;
    float _534 = in.m_69.w;
    float _536 = gl_FragCoord.w;
    float _538 = _534 * _536;
    float _540 = in.m_69.y;
    float _542 = gl_FragCoord.w;
    float _544 = _540 * _542;
    float _546 = in.m_69.z;
    float _548 = gl_FragCoord.w;
    float _550 = _546 * _548;
    float _552 = _92 * _496;
    float _554 = _92 * _502;
    float _556 = _92 * _508;
    bool _558 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _560 = fma(_488, 0.20999999344348907470703125, _554);
    float _562 = fma(_490, 0.20999999344348907470703125, _556);
    float _564 = _92 * _514;
    float _566 = fma(_486, 0.20999999344348907470703125, _552);
    float _568 = _92 * _520;
    float _570 = _92 * _526;
    float _572 = _560 + _564;
    float _574 = _92 * _550;
    float _576 = _562 + _568;
    float _578 = _566 + _570;
    float _580 = _280 * _572;
    float _582 = 0.0 + _157;
    float _584 = precise::clamp(_582, 0.0, 1.0);
    float _586 = _282 * _576;
    float _588 = _278 * _578;
    float _590 = _92 * _532;
    float _592 = _92 * _538;
    float _594 = _92 * _544;
    float _596 = fma(_588, _592, _590);
    float _598 = fma(_580, _592, _594);
    float _600 = fma(_586, _592, _574);
    float _602 = _590;
    if (!_558)
    {
        _602 = _584;
    }
    float _604 = _602;
    bool _606 = !_558;
    float _608 = _604;
    if (!_606)
    {
        float _610 = in.m_71.w;
        float _612 = gl_FragCoord.w;
        float _614 = _610 * _612;
        float _616 = in.m_71.z;
        float _618 = gl_FragCoord.w;
        float _620 = _616 * _618;
        float _622 = _92 * _614;
        float _624 = _92 * _620;
        float _626 = 1.0 / _622;
        float _628 = _624 * _626;
        float _630 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _632 = fma(_628, (*spvDescriptorSet0.fp_c8)._m0[30].w, _630);
        float _634 = 1.0 / _632;
        float _636 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _638 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _640 = fma(_634, _636, _638);
        float _642 = _640 * 8.0;
        float _644 = precise::clamp(_642, 0.0, 1.0);
        float _646 = _584 * _644;
        _608 = _646;
    }
    float _648 = _608;
    float _650 = 0.0 + _648;
    float _652 = precise::clamp(_650, 0.0, 1.0);
    out.m_51.x = _596;
    out.m_51.y = _598;
    out.m_51.z = _600;
    out.m_51.w = _652;
    return out;
}

