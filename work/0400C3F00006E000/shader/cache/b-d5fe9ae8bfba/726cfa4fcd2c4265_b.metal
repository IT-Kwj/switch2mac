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
    texturecube<float> fp_t_tcb_1E [[id(7)]];
    sampler fp_t_tcb_1ESmplr [[id(8)]];
    sampler fp_t_tcb_10Smplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_1ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_61 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_50 [[user(locn2)]];
    float4 m_63 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
    float4 m_42 [[user(locn5)]];
    float4 m_40 [[user(locn6)]];
    float4 m_52 [[user(locn7)]];
    float4 m_58 [[user(locn8)]];
    float4 m_65 [[user(locn9)]];
    float4 m_67 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _74 = gl_FragCoord.w;
    float _76 = in.m_40.w;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_40.x;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_40.y;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_42.x;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_42.y;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = 1.0 / _74;
    float _108 = _106 * _80;
    float _110 = _106 * _86;
    float _112 = _106 * _92;
    float _114 = _106 * _98;
    float _116 = 1.0 / _108;
    float _118 = _106 * _104;
    float _120 = _110 * _116;
    float _122 = _112 * _116;
    float2 _762 = float2(_120, _122);
    float _124 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_762, float2(0.0), isnan(_762))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_762, float2(0.0), isnan(_762))).x;
    float2 _773 = float2(_114, _118);
    float4 _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_773, float2(0.0), isnan(_773))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_773, float2(0.0), isnan(_773))).xyzw;
    float _129 = _127.x;
    float _131 = _127.y;
    float _133 = _127.z;
    float _135 = _127.w;
    float _137 = in.m_40.z;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_44.w;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_46.w;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_48.w;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _163 = _106 * _141;
    float _165 = in.m_50.x;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = _163 * _116;
    float _173 = _106 * _159;
    float _175 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _177 = fma(_171, (*spvDescriptorSet0.fp_c8)._m0[30].w, _175);
    float _179 = 1.0 / _177;
    float _181 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _183 = fma(_124, (*spvDescriptorSet0.fp_c8)._m0[30].w, _181);
    float _185 = _106 * _147;
    float _187 = _106 * _153;
    float _189 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _191 = _179 * _189;
    float _193 = 1.0 / _183;
    float _195 = -_185;
    float _197 = fma(_135, _187, _195);
    float _199 = _106 * _169;
    float _201 = _173 * _197;
    float _203 = precise::clamp(_201, 0.0, 1.0);
    float _205 = _203 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _207 = precise::clamp(_205, 0.0, 1.0);
    float _209 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _211 = -_191;
    float _213 = fma(_193, _209, _211);
    float _215 = _213 * _161;
    float _217 = precise::clamp(_215, 0.0, 1.0);
    float _219 = _207 * _217;
    float _221 = _219 * _199;
    bool _224 = _221 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _226 = isnan(_221);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _232 = _228 || _230;
    float _234 = in.m_52.y;
    float _236 = gl_FragCoord.w;
    float _238 = _234 * _236;
    float _240 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _242 = in.m_52.x;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    float _248 = in.m_52.z;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = _191;
    float _256 = _106;
    if (!_232)
    {
        discard_fragment();
    }
    float _258 = _106 * _238;
    bool _260 = as_type<int>(_240) != 0;
    float _262 = _106 * _246;
    bool _264 = !_260;
    float _266 = -_258;
    float _268 = _264 ? _266 : _258;
    float _270 = _106 * _252;
    bool _272 = !_260;
    float _274 = -_262;
    float _276 = _272 ? _274 : _262;
    float _278 = _268 * _268;
    bool _280 = !_260;
    float _282 = -_270;
    float _284 = _280 ? _282 : _270;
    float _286 = fma(_276, _276, _278);
    float _288 = fma(_284, _284, _286);
    float _290 = rsqrt(_288);
    float _292 = _276 * _290;
    float _294 = _268 * _290;
    float _296 = _284 * _290;
    float _298 = abs(_292);
    float _300 = abs(_294);
    float _302 = precise::max(_298, _300);
    float _304 = abs(_296);
    float _306 = precise::max(_304, _302);
    float _308 = 1.0 / _306;
    float _310 = -_308;
    float _312 = _296 * _310;
    float _314 = _292 * _308;
    float _316 = _294 * _308;
    float3 _1045 = float3(_314, _316, _312);
    float3 _320 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1045, float3(0.0), isnan(_1045)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1045, float3(0.0), isnan(_1045)), level(0.0)).xyz;
    float _322 = _320.x;
    float _324 = _320.y;
    float _326 = _320.z;
    float _328 = _294 * _294;
    float _330 = in.m_58.y;
    float _332 = gl_FragCoord.w;
    float _334 = _330 * _332;
    float _336 = in.m_58.x;
    float _338 = gl_FragCoord.w;
    float _340 = _336 * _338;
    float _342 = in.m_58.z;
    float _344 = gl_FragCoord.w;
    float _346 = _342 * _344;
    float _348 = fma(_292, _292, _328);
    float _350 = in.m_48.x;
    float _352 = gl_FragCoord.w;
    float _354 = _350 * _352;
    float _356 = fma(_296, _296, _348);
    float _358 = rsqrt(_356);
    float _360 = _294 * _358;
    float _362 = _292 * _358;
    float _364 = _296 * _358;
    float _366 = _106 * _334;
    float _368 = _360 * _360;
    float _370 = _106 * _340;
    float _372 = _106 * _346;
    float _374 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _376 = _366 + _374;
    float _378 = fma(_362, _362, _368);
    float _380 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _382 = _370 + _380;
    float _384 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _386 = _372 + _384;
    float _388 = in.m_48.z;
    float _390 = gl_FragCoord.w;
    float _392 = _388 * _390;
    float _394 = fma(_364, _364, _378);
    float _396 = _376 * _376;
    float _398 = in.m_44.x;
    float _400 = gl_FragCoord.w;
    float _402 = _398 * _400;
    float _404 = in.m_44.y;
    float _406 = gl_FragCoord.w;
    float _408 = _404 * _406;
    float _410 = _106 * _354;
    float _412 = fma(_382, _382, _396);
    float _414 = rsqrt(_394);
    float _416 = fma(_386, _386, _412);
    float _418 = in.m_48.y;
    float _420 = gl_FragCoord.w;
    float _422 = _418 * _420;
    float _424 = rsqrt(_416);
    float _426 = _360 * _414;
    float _428 = _362 * _414;
    float _430 = _364 * _414;
    float _432 = in.m_44.z;
    float _434 = gl_FragCoord.w;
    float _436 = _432 * _434;
    float _438 = _430 * 0.577381789684295654296875;
    float _440 = _376 * _424;
    float _442 = _382 * _424;
    float _444 = fma(_426, 0.816474258899688720703125, _438);
    float _446 = -(*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _448 = _446 + 1.0;
    float _450 = _426 * _440;
    float _452 = fma(_426, 0.5, 0.5);
    float _454 = 0.0 + _444;
    float _456 = precise::clamp(_454, 0.0, 1.0);
    float _458 = _386 * _424;
    float _460 = fma(_428, _442, _450);
    float _462 = fma(_452, 0.25, 0.5);
    float _464 = fma(_456, _448, (*spvDescriptorSet0.fp_c9)._m0[194].z);
    float _466 = fma(_452, -0.1500000059604644775390625, 0.5);
    float _468 = fma(_452, 0.1500000059604644775390625, 0.5);
    float _470 = fma(_452, -0.25, 0.5);
    float _472 = fma(_430, _458, _460);
    float _474 = fma(_444, 0.5, 0.5);
    float _476 = fma(_464, _468, _466);
    float _478 = precise::clamp(_476, 0.0, 1.0);
    float _480 = fma(_464, _470, _462);
    float _482 = precise::clamp(_480, 0.0, 1.0);
    float _484 = _106 * _422;
    float _486 = -_129;
    float _488 = _486 + 1.0;
    float _490 = -_131;
    float _492 = _490 + 1.0;
    float _494 = abs(_472);
    float _496 = -_494;
    float _498 = _496 + 1.0;
    float _500 = _106 * _392;
    float _502 = -_133;
    float _504 = _502 + 1.0;
    float _506 = _410 * _488;
    float _508 = _484 * _492;
    float _510 = _498 * _498;
    float _512 = _500 * _504;
    float _514 = _106 * _402;
    float _516 = _106 * _408;
    float _518 = _106 * _436;
    float _520 = fma(_452, 0.7000000476837158203125, 0.5);
    float _522 = fma(_452, -0.7000000476837158203125, 0.5);
    float _524 = _510 * _474;
    float _526 = fma(_129, _514, _506);
    float _528 = fma(_131, _516, _508);
    float _530 = fma(_133, _518, _512);
    float _532 = fma(_464, _522, _520);
    float _534 = precise::clamp(_532, 0.0, 1.0);
    float _536 = fma(_526, _524, _526);
    float _538 = precise::clamp(_536, 0.0, 1.0);
    float _540 = fma(_528, _524, _528);
    float _542 = precise::clamp(_540, 0.0, 1.0);
    float _544 = fma(_530, _524, _530);
    float _546 = precise::clamp(_544, 0.0, 1.0);
    float _548 = _478 * _538;
    float _550 = precise::clamp(_548, 0.0, 1.0);
    float _552 = _482 * _542;
    float _554 = precise::clamp(_552, 0.0, 1.0);
    float _556 = _534 * _546;
    float _558 = precise::clamp(_556, 0.0, 1.0);
    if (!_232)
    {
        out.m_61.x = _550;
        out.m_61.y = _554;
        out.m_61.z = _558;
        out.m_61.w = _207;
        return out;
    }
    float _560 = in.m_63.x;
    float _562 = gl_FragCoord.w;
    float _564 = _560 * _562;
    float _566 = in.m_63.y;
    float _568 = gl_FragCoord.w;
    float _570 = _566 * _568;
    float _572 = in.m_63.z;
    float _574 = gl_FragCoord.w;
    float _576 = _572 * _574;
    float _578 = in.m_65.x;
    float _580 = gl_FragCoord.w;
    float _582 = _578 * _580;
    float _584 = in.m_65.y;
    float _586 = gl_FragCoord.w;
    float _588 = _584 * _586;
    float _590 = in.m_65.z;
    float _592 = gl_FragCoord.w;
    float _594 = _590 * _592;
    float _596 = in.m_67.x;
    float _598 = gl_FragCoord.w;
    float _600 = _596 * _598;
    float _602 = in.m_67.y;
    float _604 = gl_FragCoord.w;
    float _606 = _602 * _604;
    float _608 = in.m_67.z;
    float _610 = gl_FragCoord.w;
    float _612 = _608 * _610;
    float _614 = in.m_67.w;
    float _616 = gl_FragCoord.w;
    float _618 = _614 * _616;
    bool _620 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_620)
    {
        float _622 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _624 = _191 + _622;
        _254 = _624;
    }
    float _626 = _254;
    float _628 = _106 * _564;
    float _630 = _106 * _576;
    float _632 = _106 * _582;
    float _634 = fma(_322, 0.20999999344348907470703125, _628);
    float _636 = _106 * _570;
    float _638 = _106 * _588;
    float _640 = _106 * _594;
    float _642 = fma(_326, 0.20999999344348907470703125, _630);
    float _644 = fma(_324, 0.20999999344348907470703125, _636);
    float _646 = _106 * _600;
    float _648 = _106 * _606;
    float _650 = _106 * _612;
    float _652 = _106 * _618;
    float _654 = _634 + _632;
    float _656 = _644 + _638;
    float _658 = _642 + _640;
    float _660 = 0.0 + _221;
    float _662 = precise::clamp(_660, 0.0, 1.0);
    float _664 = _662;
    if (_620)
    {
        float _666 = _626 * 8.0;
        float _668 = precise::clamp(_666, 0.0, 1.0);
        _256 = _668;
    }
    float _670 = _256;
    float _672 = _550 * _654;
    float _674 = _554 * _656;
    float _676 = _558 * _658;
    if (_620)
    {
        float _678 = _662 * _670;
        _664 = _678;
    }
    float _680 = _664;
    float _682 = fma(_672, _652, _646);
    float _684 = fma(_674, _652, _648);
    float _686 = fma(_676, _652, _650);
    float _688 = 0.0 + _680;
    float _690 = precise::clamp(_688, 0.0, 1.0);
    out.m_61.x = _682;
    out.m_61.y = _684;
    out.m_61.z = _686;
    out.m_61.w = _690;
    return out;
}

