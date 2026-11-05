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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_1ESmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_59 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_44 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_50 [[user(locn5)]];
    float4 m_42 [[user(locn6)]];
    float4 m_56 [[user(locn7)]];
    float4 m_52 [[user(locn8)]];
    float4 m_54 [[user(locn9)]];
    float4 m_65 [[user(locn10)]];
    float4 m_61 [[user(locn11)]];
    float4 m_67 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _76 = gl_FragCoord.w;
    float _78 = in.m_42.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_42.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_44.x;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_44.y;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = 1.0 / _76;
    float _104 = _102 * _82;
    float _106 = _102 * _88;
    float _108 = _102 * _94;
    float _110 = _102 * _100;
    float2 _745 = float2(_104, _106);
    float _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_745, float2(0.0), isnan(_745))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_745, float2(0.0), isnan(_745))).w;
    float2 _756 = float2(_108, _110);
    float2 _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_756, float2(0.0), isnan(_756))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_756, float2(0.0), isnan(_756))).xw;
    float _118 = _116.x;
    float _120 = _116.y;
    float _122 = in.m_46.w;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_48.w;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_50.x;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = _102 * _126;
    float _142 = _102 * _132;
    float _144 = in.m_44.z;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = _102 * _148;
    float _152 = _112 * _120;
    float _154 = _102 * _138;
    float _156 = -_152;
    float _158 = _120 + _156;
    float _160 = fma(_140, _158, _152);
    bool _164 = _160 >= _142;
    bool _166 = isnan(_160);
    bool _168 = _164 || _166;
    bool _170 = isnan(_142);
    bool _172 = _168 || _170;
    float _174 = float(_172);
    float _176 = 0.0 + _174;
    float _178 = precise::clamp(_176, 0.0, 1.0);
    float _180 = _178 * _154;
    bool _182 = _180 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _184 = isnan(_180);
    bool _186 = _182 || _184;
    bool _188 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _190 = _186 || _188;
    float _192 = in.m_44.w;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    if (!_190)
    {
        discard_fragment();
    }
    float _198 = _102 * _196;
    float2 _875 = float2(_150, _198);
    float2 _200 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_875, float2(0.0), isnan(_875))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_875, float2(0.0), isnan(_875))).xy;
    float _202 = _200.x;
    float _204 = _200.y;
    float _206 = in.m_52.y;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = in.m_52.x;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = in.m_52.z;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = in.m_54.y;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = in.m_54.x;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = in.m_56.y;
    float _238 = gl_FragCoord.w;
    float _240 = _236 * _238;
    float _242 = in.m_54.z;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    float _248 = in.m_56.x;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = in.m_56.z;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = _102 * _210;
    float _262 = _102 * _216;
    float _264 = _102 * _222;
    float _266 = _102 * _228;
    float _268 = _260 * _260;
    float _270 = _102 * _240;
    float _272 = _266 * _266;
    float _274 = fma(_262, _262, _268);
    float _276 = _102 * _234;
    float _278 = _102 * _252;
    float _280 = _270 * _270;
    float _282 = fma(_264, _264, _274);
    float _284 = _102 * _246;
    float _286 = fma(_276, _276, _272);
    float _288 = _102 * _258;
    float _290 = in.m_46.x;
    float _292 = gl_FragCoord.w;
    float _294 = _290 * _292;
    float _296 = in.m_46.y;
    float _298 = gl_FragCoord.w;
    float _300 = _296 * _298;
    float _302 = rsqrt(_282);
    float _304 = fma(_284, _284, _286);
    float _306 = fma(_278, _278, _280);
    float _308 = in.m_46.z;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = fma(_288, _288, _306);
    float _316 = rsqrt(_304);
    float _318 = _260 * _302;
    float _320 = _262 * _302;
    float _322 = _264 * _302;
    float _324 = rsqrt(_314);
    float _326 = _318 * _318;
    float _328 = fma(_320, _320, _326);
    float _330 = fma(_322, _322, _328);
    float _332 = rsqrt(_330);
    float _334 = _288 * _324;
    float _336 = _204 * _204;
    float _338 = _324 * _204;
    float _340 = _202 * _316;
    float _342 = in.m_48.z;
    float _344 = gl_FragCoord.w;
    float _346 = _342 * _344;
    float _348 = fma(_202, _202, _336);
    float _350 = precise::clamp(_348, 0.0, 1.0);
    float _352 = _270 * _338;
    float _354 = _278 * _338;
    float _356 = _204 * _334;
    float _358 = -_350;
    float _360 = _358 + 1.0;
    float _362 = fma(_266, _340, _352);
    float _364 = fma(_276, _340, _354);
    float _366 = fma(_284, _340, _356);
    float _368 = in.m_48.y;
    float _370 = gl_FragCoord.w;
    float _372 = _368 * _370;
    float _374 = sqrt(_360);
    float _376 = _332 * _374;
    float _378 = in.m_48.x;
    float _380 = gl_FragCoord.w;
    float _382 = _378 * _380;
    float _384 = fma(_318, _376, _362);
    float _386 = fma(_320, _376, _364);
    float _388 = fma(_322, _376, _366);
    float _390 = _384 * _384;
    float _392 = _102 * _346;
    float _394 = _102 * _312;
    float _396 = fma(_386, _386, _390);
    float _398 = -_392;
    float _400 = _398 + _394;
    float _402 = fma(_388, _388, _396);
    float _404 = rsqrt(_402);
    float _406 = (*spvDescriptorSet0.fp_c8)._m0[28].y * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _408 = fma((*spvDescriptorSet0.fp_c8)._m0[28].x, (*spvDescriptorSet0.fp_c8)._m0[28].x, _406);
    float _410 = fma((*spvDescriptorSet0.fp_c8)._m0[28].z, (*spvDescriptorSet0.fp_c8)._m0[28].z, _408);
    float _412 = _102 * _382;
    float _414 = _384 * _404;
    float _416 = _388 * _404;
    float _418 = rsqrt(_410);
    float _420 = _102 * _294;
    float _422 = _414 * (-0.816474258899688720703125);
    float _424 = -_412;
    float _426 = _424 + _420;
    float _428 = -_422;
    float _430 = fma(_416, 0.577381789684295654296875, _428);
    float _432 = _102 * _372;
    float _434 = _102 * _300;
    float _436 = fma(_430, 0.5, 0.5);
    float _438 = -_432;
    float _440 = _438 + _434;
    float _442 = _436 * _436;
    float _444 = fma(_442, _426, _412);
    float _446 = fma(_442, _440, _432);
    float _448 = fma(_442, _400, _392);
    if (!_190)
    {
        out.m_59.x = _444;
        out.m_59.y = _446;
        out.m_59.z = _448;
        out.m_59.w = _174;
        return out;
    }
    float _450 = in.m_61.x;
    float _452 = gl_FragCoord.w;
    float _454 = _450 * _452;
    float _456 = _418 * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _458 = _386 * _404;
    float _460 = -_442;
    float _462 = _460 + 1.0;
    float _464 = _414 * _456;
    float _466 = _418 * (*spvDescriptorSet0.fp_c8)._m0[28].x;
    float _468 = _418 * (*spvDescriptorSet0.fp_c8)._m0[28].z;
    float _470 = -_462;
    float _472 = fma(_470, (*spvDescriptorSet0.fp_c9)._m0[191].y, 1.0);
    float _474 = -_118;
    float _476 = _474 + 1.0;
    float _478 = fma(_458, _466, _464);
    float _480 = abs(_320);
    float _482 = abs(_318);
    float _484 = precise::max(_480, _482);
    float _486 = fma(_416, _468, _478);
    float _488 = abs(_322);
    float _490 = precise::max(_488, _484);
    float _492 = fma(_486, -0.5, 0.5);
    float _494 = 1.0 / _490;
    float _496 = fma(_492, (*spvDescriptorSet0.fp_c9)._m0[191].z, _472);
    float _498 = precise::clamp(_496, 0.0, 1.0);
    float _500 = -_498;
    float _502 = _500 + 1.0;
    float _504 = fma(_476, (*spvDescriptorSet0.fp_c9)._m0[191].x, _502);
    float _506 = precise::clamp(_504, 0.0, 1.0);
    float _508 = _102 * _454;
    float _510 = _506 + _508;
    float _512 = _320 * _494;
    float _514 = _318 * _494;
    float _516 = -_494;
    float _518 = _322 * _516;
    float _520 = precise::min(_510, 1.0);
    float3 _1355 = float3(_512, _514, _518);
    float3 _524 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1355, float3(0.0), isnan(_1355)), level(_520)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1355, float3(0.0), isnan(_1355)), level(_520)).xyz;
    float _526 = _524.x;
    float _528 = _524.y;
    float _530 = _524.z;
    float _532 = in.m_63.y;
    float _534 = gl_FragCoord.w;
    float _536 = _532 * _534;
    float _538 = in.m_63.z;
    float _540 = gl_FragCoord.w;
    float _542 = _538 * _540;
    float _544 = in.m_63.x;
    float _546 = gl_FragCoord.w;
    float _548 = _544 * _546;
    float _550 = in.m_65.x;
    float _552 = gl_FragCoord.w;
    float _554 = _550 * _552;
    float _556 = in.m_65.z;
    float _558 = gl_FragCoord.w;
    float _560 = _556 * _558;
    float _562 = in.m_65.y;
    float _564 = gl_FragCoord.w;
    float _566 = _562 * _564;
    float _568 = in.m_67.x;
    float _570 = gl_FragCoord.w;
    float _572 = _568 * _570;
    float _574 = in.m_67.w;
    float _576 = gl_FragCoord.w;
    float _578 = _574 * _576;
    float _580 = in.m_67.y;
    float _582 = gl_FragCoord.w;
    float _584 = _580 * _582;
    float _586 = in.m_67.z;
    float _588 = gl_FragCoord.w;
    float _590 = _586 * _588;
    bool _592 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _594 = _102 * _536;
    float _596 = _102 * _542;
    float _598 = _102 * _548;
    float _600 = fma(_528, 0.20999999344348907470703125, _594);
    float _602 = fma(_530, 0.20999999344348907470703125, _596);
    float _604 = fma(_526, 0.20999999344348907470703125, _598);
    float _606 = _102 * _554;
    float _608 = _102 * _560;
    float _610 = _102 * _566;
    float _612 = _604 + _606;
    float _614 = _602 + _608;
    float _616 = _600 + _610;
    float _618 = _102 * _578;
    float _620 = _444 * _612;
    float _622 = _448 * _614;
    float _624 = _446 * _616;
    float _626 = 0.0 + _180;
    float _628 = precise::clamp(_626, 0.0, 1.0);
    float _630 = _102 * _572;
    float _632 = _102 * _584;
    float _634 = _102 * _590;
    float _636 = fma(_620, _618, _630);
    float _638 = fma(_624, _618, _632);
    float _640 = fma(_622, _618, _634);
    float _642 = _630;
    if (!_592)
    {
        _642 = _628;
    }
    float _644 = _642;
    bool _646 = !_592;
    float _648 = _644;
    if (!_646)
    {
        float _650 = in.m_69.w;
        float _652 = gl_FragCoord.w;
        float _654 = _650 * _652;
        float _656 = in.m_69.z;
        float _658 = gl_FragCoord.w;
        float _660 = _656 * _658;
        float _662 = _102 * _654;
        float _664 = _102 * _660;
        float _666 = 1.0 / _662;
        float _668 = _664 * _666;
        float _670 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _672 = fma(_668, (*spvDescriptorSet0.fp_c8)._m0[30].w, _670);
        float _674 = 1.0 / _672;
        float _676 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _678 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _680 = fma(_674, _676, _678);
        float _682 = _680 * 8.0;
        float _684 = precise::clamp(_682, 0.0, 1.0);
        float _686 = _628 * _684;
        _648 = _686;
    }
    float _688 = _648;
    float _690 = 0.0 + _688;
    float _692 = precise::clamp(_690, 0.0, 1.0);
    out.m_59.x = _636;
    out.m_59.y = _638;
    out.m_59.z = _640;
    out.m_59.w = _692;
    return out;
}

