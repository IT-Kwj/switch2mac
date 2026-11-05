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
    float _93 = 1.0 / _67;
    float _95 = -_69;
    float _97 = _95 + (*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _99 = -_71;
    float _101 = _99 + (*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _103 = -_73;
    float _105 = _103 + (*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _107 = _97 * _97;
    float _109 = fma(_101, _101, _107);
    float _111 = fma(_105, _105, _109);
    float _113 = (*spvDescriptorSet0.fp_c8)._m0[1].y * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _115 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _117 = _93 * _79;
    float _119 = _93 * _85;
    float _121 = _93 * _91;
    float _123 = fma((*spvDescriptorSet0.fp_c8)._m0[1].x, (*spvDescriptorSet0.fp_c8)._m0[1].x, _113);
    float _125 = _117 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _127 = rsqrt(_111);
    float _129 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _115);
    float _131 = fma((*spvDescriptorSet0.fp_c8)._m0[1].z, (*spvDescriptorSet0.fp_c8)._m0[1].z, _123);
    float _133 = fma(_119, (*spvDescriptorSet0.fp_c8)._m0[2].x, _125);
    float _135 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _137 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _129);
    float _139 = -_73;
    float _141 = _121 + _139;
    float _143 = fma(_121, (*spvDescriptorSet0.fp_c8)._m0[2].z, _133);
    float _145 = rsqrt(_131);
    float _147 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _149 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _135);
    float _151 = _143 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _153 = in.m_43.w;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _149);
    float _161 = 1.0 / _151;
    float _163 = _101 * _127;
    float _165 = _97 * _127;
    float _167 = _105 * _127;
    float _169 = _117 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _171 = _159 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _173 = in.m_43.x;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = _145 * (*spvDescriptorSet0.fp_c8)._m0[1].x;
    float _181 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _147);
    float _183 = _137 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _185 = fma(_119, (*spvDescriptorSet0.fp_c8)._m0[0].x, _169);
    float _187 = _179 * _167;
    float _189 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _181);
    float _191 = -_71;
    float _193 = _119 + _191;
    float _195 = fma(_121, (*spvDescriptorSet0.fp_c8)._m0[0].z, _185);
    float _197 = _183 * _161;
    float _199 = _145 * (*spvDescriptorSet0.fp_c8)._m0[1].z;
    float _201 = _145 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _203 = _117 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _205 = _199 * _165;
    float _207 = -_187;
    float _209 = fma(_199, _163, _207);
    float _211 = _201 * _163;
    float _213 = in.m_43.y;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    float _219 = -_205;
    float _221 = fma(_201, _167, _219);
    float _223 = _195 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _225 = -_211;
    float _227 = fma(_179, _165, _225);
    float _229 = _167 * _209;
    float _231 = _165 * _221;
    float _233 = -_171;
    float _235 = fma(_223, _197, _233);
    float _237 = -_69;
    float _239 = _117 + _237;
    float _241 = _93 * _157;
    float _243 = -_231;
    float _245 = fma(_163, _209, _243);
    float _247 = _163 * _227;
    float _249 = _209 * _239;
    float _251 = -_229;
    float _253 = fma(_165, _227, _251);
    float _255 = in.m_45.w;
    float _257 = -_247;
    float _259 = fma(_167, _221, _257);
    float _261 = fma(_221, _193, _249);
    float _263 = 1.0 / _241;
    float _265 = _189 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _267 = _239 * _259;
    float _269 = fma(_119, (*spvDescriptorSet0.fp_c8)._m0[1].x, _203);
    float _271 = in.m_45.z;
    float _273 = fma(_227, _141, _261);
    float _275 = fma(_193, _253, _267);
    float _277 = fma(_121, (*spvDescriptorSet0.fp_c8)._m0[1].z, _269);
    float _279 = _235 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _281 = _273 + 0.5;
    float _283 = fma(_141, _245, _275);
    float _285 = _93 * _177;
    float _287 = _277 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _289 = _93 * _217;
    float _291 = _285 * _263;
    float _293 = -_265;
    float _295 = fma(_287, _197, _293);
    float _297 = (*spvDescriptorSet0.fp_c9)._m0[191].x * 0.100000001490116119384765625;
    float _299 = _289 * _263;
    float _301 = -_283;
    float _303 = _301 + 0.5;
    float _305 = _295 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float2 _1147 = float2(_291, _299);
    float _307 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1147, float2(0.0), isnan(_1147))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1147, float2(0.0), isnan(_1147))).x;
    float _309 = _305 * 0.707106769084930419921875;
    float _311 = fma(_303, _297, _255);
    float _313 = -_309;
    float _315 = fma(_279, 0.707106769084930419921875, _313);
    float _317 = fma(_279, 0.707106769084930419921875, _309);
    float _319 = fma(_281, _297, _271);
    float2 _1177 = float2(_315, _317);
    float4 _322 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1177, float2(0.0), isnan(_1177))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1177, float2(0.0), isnan(_1177))).xyzw;
    float _324 = _322.x;
    float _326 = _322.y;
    float _328 = _322.z;
    float _330 = _322.w;
    float2 _1193 = float2(_319, _311);
    float _332 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1193, float2(0.0), isnan(_1193))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1193, float2(0.0), isnan(_1193))).w;
    float _334 = in.m_47.y;
    float _336 = gl_FragCoord.w;
    float _338 = _334 * _336;
    float _340 = in.m_47.x;
    float _342 = gl_FragCoord.w;
    float _344 = _340 * _342;
    float _346 = in.m_47.z;
    float _348 = gl_FragCoord.w;
    float _350 = _346 * _348;
    float _352 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _354 = _117 + _352;
    float _356 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _358 = _119 + _356;
    float _360 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _362 = _121 + _360;
    float _364 = _354 * _354;
    float _366 = _93 * _338;
    float _368 = _93 * _344;
    float _370 = _93 * _350;
    float _372 = _366 * _366;
    float _374 = fma(_368, _368, _372);
    float _376 = fma(_370, _370, _374);
    float _378 = fma(_358, _358, _364);
    float _380 = fma(_362, _362, _378);
    float _382 = rsqrt(_376);
    float _384 = rsqrt(_380);
    float _386 = _366 * _382;
    float _388 = _368 * _382;
    float _390 = _370 * _382;
    float _392 = _386 * _386;
    float _394 = in.m_43.z;
    float _396 = gl_FragCoord.w;
    float _398 = _394 * _396;
    float _400 = _354 * _384;
    float _402 = _358 * _384;
    float _404 = fma(_388, _388, _392);
    float _406 = _362 * _384;
    float _408 = _400 * _400;
    float _410 = fma(_390, _390, _404);
    float _412 = fma(_402, _402, _408);
    float _414 = fma(_406, _406, _412);
    float _416 = rsqrt(_410);
    float _418 = rsqrt(_414);
    float _420 = _386 * _416;
    float _422 = _388 * _416;
    float _424 = in.m_49.w;
    float _426 = gl_FragCoord.w;
    float _428 = _424 * _426;
    float _430 = _390 * _416;
    float _432 = _400 * _418;
    float _434 = _402 * _418;
    float _436 = _406 * _418;
    float _438 = _93 * _398;
    float _440 = _420 * _432;
    float _442 = _438 * _263;
    float _444 = fma(_422, _434, _440);
    float _446 = in.m_51.w;
    float _448 = gl_FragCoord.w;
    float _450 = _446 * _448;
    float _452 = fma(_430, _436, _444);
    float _454 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _456 = fma(_442, (*spvDescriptorSet0.fp_c8)._m0[30].w, _454);
    float _458 = abs(_452);
    float _460 = fma(_458, 1.33333337306976318359375, -0.3333333432674407958984375);
    float _462 = precise::clamp(_460, 0.0, 1.0);
    float _464 = 1.0 / _456;
    float _466 = fma(_462, -2.0, 3.0);
    float _468 = _462 * _462;
    float _470 = _466 * _468;
    float _472 = _93 * _428;
    float _474 = in.m_53.x;
    float _476 = gl_FragCoord.w;
    float _478 = _474 * _476;
    float _480 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _482 = _464 * _480;
    float _484 = in.m_49.z;
    float _486 = gl_FragCoord.w;
    float _488 = _484 * _486;
    float _490 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _492 = fma(_307, (*spvDescriptorSet0.fp_c8)._m0[30].w, _490);
    float _494 = 1.0 / _492;
    float _496 = _472 * _330;
    float _498 = _496 * _470;
    float _500 = fma(_332, -0.699999988079071044921875, 1.0);
    float _502 = _93 * _450;
    float _504 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _506 = -_482;
    float _508 = fma(_494, _504, _506);
    float _510 = _93 * _478;
    float _512 = precise::max(_508, 0.100000001490116119384765625);
    float _514 = precise::min(_512, 1.0);
    float _516 = fma(_514, 1.111111164093017578125, -0.11111111938953399658203125);
    float _518 = _498 * _516;
    float _520 = _518 * _500;
    float _522 = _520 * _502;
    float _524 = precise::max(_522, 0.1500000059604644775390625);
    float _526 = precise::min(_524, 0.17000000178813934326171875);
    float _528 = fma(_526, 50.000011444091796875, -7.5000019073486328125);
    float _530 = 0.0 + _528;
    float _532 = precise::clamp(_530, 0.0, 1.0);
    float _534 = _532 * _510;
    bool _538 = _534 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _540 = isnan(_534);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _546 = _542 || _544;
    float _548 = in.m_55.y;
    float _550 = gl_FragCoord.w;
    float _552 = _548 * _550;
    float _554 = in.m_55.x;
    float _556 = gl_FragCoord.w;
    float _558 = _554 * _556;
    float _560 = in.m_49.x;
    float _562 = gl_FragCoord.w;
    float _564 = _560 * _562;
    float _566 = in.m_49.y;
    float _568 = gl_FragCoord.w;
    float _570 = _566 * _568;
    float _572 = in.m_55.z;
    float _574 = gl_FragCoord.w;
    float _576 = _572 * _574;
    float _578 = _534;
    if (!_546)
    {
        discard_fragment();
    }
    float _580 = precise::max(_520, 0.1500000059604644775390625);
    float _582 = _324 * _324;
    float _584 = _326 * _326;
    float _586 = _328 * _328;
    float _588 = precise::min(_580, 0.20000000298023223876953125);
    float _590 = fma(_588, 20.0000019073486328125, -3.000000476837158203125);
    float _592 = _93 * _552;
    float _594 = _93 * _558;
    float _596 = _93 * _564;
    float _598 = _93 * _570;
    float _600 = _93 * _576;
    float _602 = _93 * _488;
    float _604 = -_594;
    float _606 = _604 + _596;
    float _608 = -_592;
    float _610 = _608 + _598;
    float _612 = -_600;
    float _614 = _612 + _602;
    float _616 = fma(_590, _606, _594);
    float _618 = fma(_590, _610, _592);
    float _620 = _582 * (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _622 = fma(_590, _614, _600);
    float _624 = _584 * (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _626 = _616 + _618;
    float _628 = _586 * (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _630 = _622 + _626;
    float _632 = -_616;
    float _634 = fma(_630, 0.3300000131130218505859375, _632);
    float _636 = -_618;
    float _638 = fma(_630, 0.3300000131130218505859375, _636);
    float _640 = -_622;
    float _642 = fma(_630, 0.3300000131130218505859375, _640);
    float _644 = fma(_620, _634, _616);
    float _646 = fma(_624, _638, _618);
    float _648 = fma(_628, _642, _622);
    if (!_546)
    {
        out.m_58.x = _644;
        out.m_58.y = _646;
        out.m_58.z = _648;
        out.m_58.w = _528;
        return out;
    }
    float _650 = _646 * 0.715200006961822509765625;
    float _652 = in.m_60.w;
    float _654 = gl_FragCoord.w;
    float _656 = _652 * _654;
    float _658 = in.m_60.x;
    float _660 = gl_FragCoord.w;
    float _662 = _658 * _660;
    float _664 = in.m_60.y;
    float _666 = gl_FragCoord.w;
    float _668 = _664 * _666;
    float _670 = fma(_644, 0.2125999927520751953125, _650);
    float _672 = in.m_60.z;
    float _674 = gl_FragCoord.w;
    float _676 = _672 * _674;
    float _678 = fma(_648, 0.072200000286102294921875, _670);
    bool _680 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _682 = 1.0 / _678;
    float _684 = (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_680)
    {
        float _686 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _688 = _482 + _686;
        _684 = _688;
    }
    float _690 = _684;
    float _692 = _682 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _694 = precise::clamp(_692, 0.0, 1.0);
    float _696 = fma(_694, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _698 = _93 * _656;
    float _700 = _93 * _668;
    float _702 = _696 * _698;
    float _704 = 0.0 + _534;
    float _706 = precise::clamp(_704, 0.0, 1.0);
    float _708 = _706;
    if (_680)
    {
        float _710 = _690 * 8.0;
        float _712 = precise::clamp(_710, 0.0, 1.0);
        _578 = _712;
    }
    float _714 = _578;
    float _716 = _93 * _662;
    float _718 = _93 * _676;
    float _720 = fma(_646, _702, _700);
    if (_680)
    {
        float _722 = _706 * _714;
        _708 = _722;
    }
    float _724 = _708;
    float _726 = fma(_644, _702, _716);
    float _728 = fma(_648, _702, _718);
    float _730 = 0.0 + _724;
    float _732 = precise::clamp(_730, 0.0, 1.0);
    out.m_58.x = _726;
    out.m_58.y = _720;
    out.m_58.z = _728;
    out.m_58.w = _732;
    return out;
}

