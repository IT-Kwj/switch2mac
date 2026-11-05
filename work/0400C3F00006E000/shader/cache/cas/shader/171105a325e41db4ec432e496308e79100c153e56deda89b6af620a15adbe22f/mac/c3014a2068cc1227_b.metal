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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_10Smplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_58 [[color(0)]];
};

struct main0_in
{
    float4 m_49 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_45 [[user(locn3), flat]];
    float4 m_39 [[user(locn4), flat]];
    float4 m_51 [[user(locn5)]];
    float4 m_43 [[user(locn6)]];
    float4 m_47 [[user(locn7)]];
    float4 m_41 [[user(locn8)]];
    float4 m_60 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _67 = gl_FragCoord.w;
    float _69 = in.m_39.y;
    float _71 = in.m_39.x;
    float _73 = in.m_39.z;
    float _75 = in.m_41.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_41.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_41.z;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = (*spvDescriptorSet0.fp_c8)._m0[1].y * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _95 = fma((*spvDescriptorSet0.fp_c8)._m0[1].x, (*spvDescriptorSet0.fp_c8)._m0[1].x, _93);
    float _97 = fma((*spvDescriptorSet0.fp_c8)._m0[1].z, (*spvDescriptorSet0.fp_c8)._m0[1].z, _95);
    float _99 = rsqrt(_97);
    float _101 = -_69;
    float _103 = _101 + (*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _105 = 1.0 / _67;
    float _107 = -_71;
    float _109 = _107 + (*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _111 = -_73;
    float _113 = _111 + (*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _115 = _103 * _103;
    float _117 = fma(_109, _109, _115);
    float _119 = fma(_113, _113, _117);
    float _121 = rsqrt(_119);
    float _123 = _105 * _79;
    float _125 = _105 * _85;
    float _127 = _105 * _91;
    float _129 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _131 = _123 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _133 = -_73;
    float _135 = _127 + _133;
    float _137 = fma(_125, (*spvDescriptorSet0.fp_c8)._m0[2].x, _131);
    float _139 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _141 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _143 = fma(_127, (*spvDescriptorSet0.fp_c8)._m0[2].z, _137);
    float _145 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _139);
    float _147 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _141);
    float _149 = _103 * _121;
    float _151 = _143 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _153 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _129);
    float _155 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _145);
    float _157 = in.m_43.w;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = 1.0 / _151;
    float _165 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _153);
    float _167 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _147);
    float _169 = _109 * _121;
    float _171 = _113 * _121;
    float _173 = _99 * (*spvDescriptorSet0.fp_c8)._m0[1].z;
    float _175 = _99 * (*spvDescriptorSet0.fp_c8)._m0[1].x;
    float _177 = _99 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _179 = _167 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _181 = _173 * _149;
    float _183 = _175 * _171;
    float _185 = _177 * _169;
    float _187 = -_183;
    float _189 = fma(_173, _169, _187);
    float _191 = _179 * _163;
    float _193 = -_181;
    float _195 = fma(_177, _171, _193);
    float _197 = in.m_43.y;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = in.m_43.x;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = -_185;
    float _211 = fma(_175, _149, _209);
    float _213 = -_69;
    float _215 = _123 + _213;
    float _217 = _149 * _195;
    float _219 = -_71;
    float _221 = _125 + _219;
    float _223 = _169 * _211;
    float _225 = _189 * _215;
    float _227 = -_217;
    float _229 = fma(_169, _189, _227);
    float _231 = _171 * _189;
    float _233 = -_223;
    float _235 = fma(_171, _195, _233);
    float _237 = fma(_195, _221, _225);
    float _239 = _123 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _241 = _123 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _243 = _105 * _161;
    float _245 = -_231;
    float _247 = fma(_149, _211, _245);
    float _249 = fma(_125, (*spvDescriptorSet0.fp_c8)._m0[0].x, _239);
    float _251 = fma(_125, (*spvDescriptorSet0.fp_c8)._m0[1].x, _241);
    float _253 = _215 * _235;
    float _255 = _165 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _257 = 1.0 / _243;
    float _259 = fma(_127, (*spvDescriptorSet0.fp_c8)._m0[0].z, _249);
    float _261 = fma(_127, (*spvDescriptorSet0.fp_c8)._m0[1].z, _251);
    float _263 = _155 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _265 = fma(_221, _247, _253);
    float _267 = _259 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _269 = _261 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _271 = fma(_211, _135, _237);
    float _273 = fma(_135, _229, _265);
    float _275 = -_255;
    float _277 = fma(_267, _191, _275);
    float _279 = -_263;
    float _281 = fma(_269, _191, _279);
    float _283 = _105 * _201;
    float _285 = _105 * _207;
    float _287 = in.m_45.z;
    float _289 = in.m_45.w;
    float _291 = fma(_271, 0.300000011920928955078125, 0.1500000059604644775390625);
    float _293 = fma(_273, -0.300000011920928955078125, 0.1500000059604644775390625);
    float _295 = _285 * _257;
    float _297 = _283 * _257;
    float _299 = _281 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _301 = _277 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float2 _1139 = float2(_295, _297);
    float _303 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1139, float2(0.0), isnan(_1139))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1139, float2(0.0), isnan(_1139))).x;
    float _305 = _299 * 0.707106769084930419921875;
    float _307 = -_305;
    float _309 = fma(_301, 0.707106769084930419921875, _307);
    float _311 = fma(_301, 0.707106769084930419921875, _305);
    float _313 = _291 + _287;
    float _315 = _293 + _289;
    float2 _1167 = float2(_309, _311);
    float4 _318 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1167, float2(0.0), isnan(_1167))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1167, float2(0.0), isnan(_1167))).xyzw;
    float _320 = _318.x;
    float _322 = _318.y;
    float _324 = _318.z;
    float _326 = _318.w;
    float2 _1183 = float2(_313, _315);
    float _328 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1183, float2(0.0), isnan(_1183))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1183, float2(0.0), isnan(_1183))).w;
    float _330 = in.m_47.y;
    float _332 = gl_FragCoord.w;
    float _334 = _330 * _332;
    float _336 = in.m_47.x;
    float _338 = gl_FragCoord.w;
    float _340 = _336 * _338;
    float _342 = in.m_47.z;
    float _344 = gl_FragCoord.w;
    float _346 = _342 * _344;
    float _348 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _350 = _123 + _348;
    float _352 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _354 = _125 + _352;
    float _356 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _358 = _127 + _356;
    float _360 = _105 * _334;
    float _362 = _105 * _340;
    float _364 = _105 * _346;
    float _366 = _360 * _360;
    float _368 = fma(_362, _362, _366);
    float _370 = _350 * _350;
    float _372 = fma(_364, _364, _368);
    float _374 = fma(_354, _354, _370);
    float _376 = fma(_358, _358, _374);
    float _378 = rsqrt(_372);
    float _380 = rsqrt(_376);
    float _382 = _360 * _378;
    float _384 = _362 * _378;
    float _386 = _364 * _378;
    float _388 = _382 * _382;
    float _390 = _350 * _380;
    float _392 = _354 * _380;
    float _394 = fma(_384, _384, _388);
    float _396 = _358 * _380;
    float _398 = _390 * _390;
    float _400 = in.m_43.z;
    float _402 = gl_FragCoord.w;
    float _404 = _400 * _402;
    float _406 = fma(_386, _386, _394);
    float _408 = fma(_392, _392, _398);
    float _410 = fma(_396, _396, _408);
    float _412 = rsqrt(_406);
    float _414 = rsqrt(_410);
    float _416 = _382 * _412;
    float _418 = _384 * _412;
    float _420 = _386 * _412;
    float _422 = _390 * _414;
    float _424 = _392 * _414;
    float _426 = _396 * _414;
    float _428 = _416 * _422;
    float _430 = fma(_418, _424, _428);
    float _432 = _105 * _404;
    float _434 = in.m_49.w;
    float _436 = gl_FragCoord.w;
    float _438 = _434 * _436;
    float _440 = fma(_420, _426, _430);
    float _442 = _432 * _257;
    float _444 = in.m_51.w;
    float _446 = gl_FragCoord.w;
    float _448 = _444 * _446;
    float _450 = abs(_440);
    float _452 = fma(_450, 1.33333337306976318359375, -0.3333333432674407958984375);
    float _454 = precise::clamp(_452, 0.0, 1.0);
    float _456 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _458 = fma(_442, (*spvDescriptorSet0.fp_c8)._m0[30].w, _456);
    float _460 = fma(_454, -2.0, 3.0);
    float _462 = _454 * _454;
    float _464 = 1.0 / _458;
    float _466 = _460 * _462;
    float _468 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _470 = _464 * _468;
    float _472 = _105 * _438;
    float _474 = in.m_53.x;
    float _476 = gl_FragCoord.w;
    float _478 = _474 * _476;
    float _480 = in.m_49.y;
    float _482 = gl_FragCoord.w;
    float _484 = _480 * _482;
    float _486 = in.m_49.z;
    float _488 = gl_FragCoord.w;
    float _490 = _486 * _488;
    float _492 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _494 = fma(_303, (*spvDescriptorSet0.fp_c8)._m0[30].w, _492);
    float _496 = 1.0 / _494;
    float _498 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _500 = -_470;
    float _502 = fma(_496, _498, _500);
    float _504 = precise::max(_502, 0.100000001490116119384765625);
    float _506 = _472 * _326;
    float _508 = precise::min(_504, 1.0);
    float _510 = _506 * _466;
    float _512 = fma(_508, 1.111111164093017578125, -0.11111111938953399658203125);
    float _514 = _510 * _512;
    float _516 = _105 * _478;
    float _518 = fma(_328, -0.699999988079071044921875, 1.0);
    float _520 = _105 * _448;
    float _522 = _514 * _518;
    float _524 = _522 * _520;
    float _526 = precise::max(_524, 0.1500000059604644775390625);
    float _528 = precise::min(_526, 0.17000000178813934326171875);
    float _530 = fma(_528, 50.000011444091796875, -7.5000019073486328125);
    float _532 = 0.0 + _530;
    float _534 = precise::clamp(_532, 0.0, 1.0);
    float _536 = _534 * _516;
    bool _540 = _536 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _542 = isnan(_536);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _548 = _544 || _546;
    float _550 = in.m_55.y;
    float _552 = gl_FragCoord.w;
    float _554 = _550 * _552;
    float _556 = in.m_55.x;
    float _558 = gl_FragCoord.w;
    float _560 = _556 * _558;
    float _562 = in.m_49.x;
    float _564 = gl_FragCoord.w;
    float _566 = _562 * _564;
    float _568 = in.m_55.z;
    float _570 = gl_FragCoord.w;
    float _572 = _568 * _570;
    float _574 = _536;
    if (!_548)
    {
        discard_fragment();
    }
    float _576 = precise::max(_522, 0.1500000059604644775390625);
    float _578 = _320 * _320;
    float _580 = _322 * _322;
    float _582 = precise::min(_576, 0.20000000298023223876953125);
    float _584 = _324 * _324;
    float _586 = fma(_582, 20.0000019073486328125, -3.000000476837158203125);
    float _588 = _105 * _554;
    float _590 = _105 * _560;
    float _592 = _105 * _566;
    float _594 = _105 * _484;
    float _596 = _105 * _572;
    float _598 = _105 * _490;
    float _600 = -_590;
    float _602 = _600 + _592;
    float _604 = -_588;
    float _606 = _604 + _594;
    float _608 = -_596;
    float _610 = _608 + _598;
    float _612 = fma(_586, _602, _590);
    float _614 = fma(_586, _606, _588);
    float _616 = _578 * (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _618 = fma(_586, _610, _596);
    float _620 = _580 * (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _622 = _612 + _614;
    float _624 = _584 * (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _626 = _618 + _622;
    float _628 = -_612;
    float _630 = fma(_626, 0.3300000131130218505859375, _628);
    float _632 = -_614;
    float _634 = fma(_626, 0.3300000131130218505859375, _632);
    float _636 = -_618;
    float _638 = fma(_626, 0.3300000131130218505859375, _636);
    float _640 = fma(_616, _630, _612);
    float _642 = fma(_620, _634, _614);
    float _644 = fma(_624, _638, _618);
    if (!_548)
    {
        out.m_58.x = _640;
        out.m_58.y = _642;
        out.m_58.z = _644;
        out.m_58.w = _530;
        return out;
    }
    float _646 = _642 * 0.715200006961822509765625;
    float _648 = in.m_60.w;
    float _650 = gl_FragCoord.w;
    float _652 = _648 * _650;
    float _654 = in.m_60.x;
    float _656 = gl_FragCoord.w;
    float _658 = _654 * _656;
    float _660 = in.m_60.y;
    float _662 = gl_FragCoord.w;
    float _664 = _660 * _662;
    float _666 = fma(_640, 0.2125999927520751953125, _646);
    float _668 = in.m_60.z;
    float _670 = gl_FragCoord.w;
    float _672 = _668 * _670;
    float _674 = fma(_644, 0.072200000286102294921875, _666);
    bool _676 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _678 = 1.0 / _674;
    float _680 = (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_676)
    {
        float _682 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _684 = _470 + _682;
        _680 = _684;
    }
    float _686 = _680;
    float _688 = _678 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _690 = precise::clamp(_688, 0.0, 1.0);
    float _692 = fma(_690, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _694 = _105 * _652;
    float _696 = _105 * _664;
    float _698 = _692 * _694;
    float _700 = 0.0 + _536;
    float _702 = precise::clamp(_700, 0.0, 1.0);
    float _704 = _702;
    if (_676)
    {
        float _706 = _686 * 8.0;
        float _708 = precise::clamp(_706, 0.0, 1.0);
        _574 = _708;
    }
    float _710 = _574;
    float _712 = _105 * _658;
    float _714 = _105 * _672;
    float _716 = fma(_642, _698, _696);
    if (_676)
    {
        float _718 = _702 * _710;
        _704 = _718;
    }
    float _720 = _704;
    float _722 = fma(_640, _698, _712);
    float _724 = fma(_644, _698, _714);
    float _726 = 0.0 + _720;
    float _728 = precise::clamp(_726, 0.0, 1.0);
    out.m_58.x = _722;
    out.m_58.y = _716;
    out.m_58.z = _724;
    out.m_58.w = _728;
    return out;
}

