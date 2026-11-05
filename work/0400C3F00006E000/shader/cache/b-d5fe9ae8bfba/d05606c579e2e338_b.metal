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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_62 [[color(0)]];
};

struct main0_in
{
    float4 m_59 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
    float4 m_55 [[user(locn6)]];
    float4 m_47 [[user(locn7)]];
    float4 m_45 [[user(locn8)]];
    float4 m_53 [[user(locn9)]];
    float4 m_64 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _71 = gl_FragCoord.w;
    float _73 = in.m_37.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_37.y;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = 1.0 / _71;
    float _87 = _85 * _77;
    float _89 = _85 * _83;
    float2 _751 = float2(_87, _89);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_751, float2(0.0), isnan(_751))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_751, float2(0.0), isnan(_751))).w;
    float _93 = in.m_39.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_39.x;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = _85 * _97;
    float _107 = _85 * _103;
    float _109 = fma(_91, 0.2599999904632568359375, -0.12999999523162841796875);
    float _111 = _105 + _109;
    float2 _790 = float2(_107, _111);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_790, float2(0.0), isnan(_790))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_790, float2(0.0), isnan(_790))).w;
    float _115 = in.m_41.w;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_43.x;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = _85 * _119;
    float _129 = fma((*spvDescriptorSet0.fp_c10)._m0[3].x, -0.230000019073486328125, 1.2000000476837158203125);
    float _131 = _85 * _125;
    float _133 = in.m_37.z;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = _85 * _137;
    float _141 = fma(_127, 0.89999997615814208984375, _113);
    bool _144 = _141 >= _129;
    bool _146 = isnan(_141);
    bool _148 = _144 || _146;
    bool _150 = isnan(_129);
    bool _152 = _148 || _150;
    float _154 = float(_152);
    float _156 = 0.0 + _154;
    float _158 = precise::clamp(_156, 0.0, 1.0);
    float _160 = _158 * _131;
    bool _162 = _160 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _164 = isnan(_160);
    bool _166 = _162 || _164;
    bool _168 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _170 = _166 || _168;
    float _172 = in.m_37.w;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    if (!_170)
    {
        discard_fragment();
    }
    float _178 = _85 * _176;
    float2 _891 = float2(_139, _178);
    float2 _182 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_891, float2(0.0), isnan(_891))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_891, float2(0.0), isnan(_891))).xy;
    float _184 = _182.x;
    float _186 = _182.y;
    float _188 = in.m_45.y;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = in.m_45.x;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = in.m_45.z;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = in.m_47.y;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _214 = in.m_47.x;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = in.m_47.z;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    float _226 = in.m_53.z;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = in.m_53.y;
    float _234 = gl_FragCoord.w;
    float _236 = _232 * _234;
    float _238 = in.m_53.x;
    float _240 = gl_FragCoord.w;
    float _242 = _238 * _240;
    float _244 = (*spvDescriptorSet0.fp_c8)._m0[28].y * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _246 = fma((*spvDescriptorSet0.fp_c8)._m0[28].x, (*spvDescriptorSet0.fp_c8)._m0[28].x, _244);
    float _248 = in.m_55.y;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = _85 * _192;
    float _256 = _85 * _198;
    float _258 = _85 * _204;
    float _260 = _85 * _210;
    float _262 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _264 = _254 + _262;
    float _266 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _268 = _256 + _266;
    float _270 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _272 = _258 + _270;
    bool _274 = as_type<int>(_212) != 0;
    float _276 = _264 * _264;
    float _278 = _85 * _218;
    bool _280 = !_274;
    float _282 = -_260;
    float _284 = _280 ? _282 : _260;
    float _286 = fma(_268, _268, _276);
    float _288 = _85 * _224;
    float _290 = in.m_55.x;
    float _292 = gl_FragCoord.w;
    float _294 = _290 * _292;
    float _296 = fma((*spvDescriptorSet0.fp_c8)._m0[28].z, (*spvDescriptorSet0.fp_c8)._m0[28].z, _246);
    float _298 = fma(_272, _272, _286);
    bool _300 = !_274;
    float _302 = -_278;
    float _304 = _300 ? _302 : _278;
    float _306 = _284 * _284;
    float _308 = in.m_55.z;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = _85 * _230;
    bool _316 = !_274;
    float _318 = -_288;
    float _320 = _316 ? _318 : _288;
    float _322 = rsqrt(_298);
    float _324 = fma(_304, _304, _306);
    float _326 = _85 * _236;
    float _328 = _85 * _242;
    float _330 = fma(_320, _320, _324);
    float _332 = _326 * _326;
    float _334 = rsqrt(_296);
    float _336 = fma(_328, _328, _332);
    float _338 = fma(_314, _314, _336);
    float _340 = _264 * _322;
    float _342 = _268 * _322;
    float _344 = rsqrt(_330);
    float _346 = _272 * _322;
    float _348 = _340 * _340;
    float _350 = _85 * _252;
    float _352 = fma(_342, _342, _348);
    float _354 = _334 * (*spvDescriptorSet0.fp_c8)._m0[28].z;
    float _356 = rsqrt(_338);
    float _358 = _334 * (*spvDescriptorSet0.fp_c8)._m0[28].x;
    float _360 = fma(_346, _346, _352);
    float _362 = _85 * _294;
    float _364 = _350 * _350;
    float _366 = _85 * _312;
    float _368 = rsqrt(_360);
    float _370 = _354 * _354;
    float _372 = _284 * _344;
    float _374 = _304 * _344;
    float _376 = fma(_362, _362, _364);
    float _378 = fma(_358, _358, _370);
    float _380 = _372 * _372;
    float _382 = _320 * _344;
    float _384 = fma(_366, _366, _376);
    float _386 = fma(_374, _374, _380);
    float _388 = rsqrt(_378);
    float _390 = _342 * _368;
    float _392 = fma(_382, _382, _386);
    float _394 = _340 * _368;
    float _396 = in.m_41.z;
    float _398 = gl_FragCoord.w;
    float _400 = _396 * _398;
    float _402 = rsqrt(_384);
    float _404 = _346 * _368;
    float _406 = _354 * _388;
    float _408 = rsqrt(_392);
    float _410 = _358 * _388;
    float _412 = _406 * _406;
    float _414 = fma(_410, _410, _412);
    float _416 = _366 * _402;
    float _418 = rsqrt(_414);
    float _420 = _410 * _418;
    float _422 = _406 * _418;
    float _424 = in.m_41.x;
    float _426 = gl_FragCoord.w;
    float _428 = _424 * _426;
    float _430 = _85 * _428;
    float _432 = -_430;
    float _434 = _432 + 1.0;
    float _436 = _186 * _186;
    float _438 = _402 * _186;
    float _440 = _186 * _416;
    float _442 = fma(_184, _184, _436);
    float _444 = precise::clamp(_442, 0.0, 1.0);
    float _446 = _356 * _184;
    float _448 = _350 * _438;
    float _450 = _362 * _438;
    float _452 = -_444;
    float _454 = _452 + 1.0;
    float _456 = fma(_314, _446, _440);
    float _458 = fma(_326, _446, _448);
    float _460 = fma(_328, _446, _450);
    float _462 = _85 * _400;
    float _464 = sqrt(_454);
    float _466 = in.m_57.x;
    float _468 = gl_FragCoord.w;
    float _470 = _466 * _468;
    float _472 = precise::max(_462, 0.800000011920928955078125);
    float _474 = _113 + _462;
    float _476 = precise::min(_472, 1.0);
    float _478 = precise::max(_474, 0.800000011920928955078125);
    float _480 = fma(_476, 5.000000476837158203125, -4.000000476837158203125);
    float _482 = precise::min(_478, 1.2000000476837158203125);
    float _484 = in.m_57.z;
    float _486 = gl_FragCoord.w;
    float _488 = _484 * _486;
    float _490 = _464 * _408;
    float _492 = fma(_91, 2.0, _480);
    float _494 = fma(_382, _490, _456);
    float _496 = fma(_372, _490, _458);
    float _498 = fma(_374, _490, _460);
    float _500 = precise::max(_492, 1.2000000476837158203125);
    float _502 = _494 * _494;
    float _504 = _496 * _394;
    float _506 = in.m_57.y;
    float _508 = gl_FragCoord.w;
    float _510 = _506 * _508;
    float _512 = in.m_59.y;
    float _514 = gl_FragCoord.w;
    float _516 = _512 * _514;
    float _518 = fma(_498, _498, _502);
    float _520 = fma(_498, _390, _504);
    float _522 = rsqrt(_518);
    float _524 = fma(_494, _404, _520);
    float _526 = in.m_59.x;
    float _528 = gl_FragCoord.w;
    float _530 = _526 * _528;
    float _532 = precise::min(_500, 1.39999997615814208984375);
    float _534 = abs(_524);
    float _536 = 0.0 + _534;
    float _538 = precise::clamp(_536, 0.0, 1.0);
    float _540 = _85 * _470;
    float _542 = fma(_482, 2.4999997615814208984375, -1.99999988079071044921875);
    float _544 = in.m_59.z;
    float _546 = gl_FragCoord.w;
    float _548 = _544 * _546;
    float _550 = fma(_538, -2.0, 3.0);
    float _552 = _538 * _538;
    float _554 = _85 * _488;
    float _556 = -_552;
    float _558 = fma(_550, _556, 1.0);
    float _560 = _494 * _522;
    float _562 = _498 * _522;
    float _564 = _113 + _558;
    float _566 = _560 * _422;
    float _568 = fma(_562, _420, _566);
    float _570 = fma(_532, 5.0000019073486328125, -6.000002384185791015625);
    float _572 = _564 * _434;
    float _574 = abs(_568);
    float _576 = fma(_574, -2.0, 1.39999997615814208984375);
    float _578 = precise::clamp(_576, 0.0, 1.0);
    float _580 = _85 * _510;
    float _582 = _85 * _516;
    float _584 = fma(_578, -2.0, 3.0);
    float _586 = _578 * _578;
    float _588 = -_580;
    float _590 = _588 + _582;
    float _592 = _85 * _530;
    float _594 = fma(_584, _586, _542);
    float _596 = precise::clamp(_594, 0.0, 1.0);
    float _598 = _570 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _600 = -_540;
    float _602 = _600 + _592;
    float _604 = _85 * _548;
    float _606 = fma(_572, _590, _580);
    float _608 = fma(_572, _602, _540);
    float _610 = fma(_596, 0.1500000059604644775390625, _598);
    float _612 = -_554;
    float _614 = _612 + _604;
    float _616 = _608 + _610;
    float _618 = precise::clamp(_616, 0.0, 1.0);
    float _620 = fma(_572, _614, _554);
    float _622 = _606 + _610;
    float _624 = precise::clamp(_622, 0.0, 1.0);
    float _626 = _620 + _610;
    float _628 = precise::clamp(_626, 0.0, 1.0);
    if (!_170)
    {
        out.m_62.x = _618;
        out.m_62.y = _624;
        out.m_62.z = _628;
        out.m_62.w = _154;
        return out;
    }
    float _630 = in.m_64.w;
    float _632 = gl_FragCoord.w;
    float _634 = _630 * _632;
    float _636 = _85 * _634;
    bool _638 = _636 != 1.0;
    bool _640 = isnan(_636);
    bool _642 = _638 || _640;
    bool _644 = isnan(1.0);
    bool _646 = _642 || _644;
    bool _648 = !_646;
    if (!_648)
    {
        float _650 = gl_FragCoord.x;
        float _652 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _654 = _650 / _652;
        float _656 = gl_FragCoord.y;
        float _658 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _660 = _656 / _658;
        float _662 = _636 * 256.0;
        float _664 = trunc(_662);
        int _667 = int(_664);
        float _669 = trunc(_654);
        int _671 = int(_669);
        float _673 = trunc(_660);
        int _675 = int(_673);
        int _677 = _671 + 2;
        int _679 = _677 >> 1;
        uint _682 = uint(int(uint(_675) >> uint(1)));
        int _684 = _679 ^ int(_682);
        int _686 = _684 << 16;
        int _688 = _686 ^ _679;
        int _690 = 983055 & _688;
        int _692 = _690 << 6;
        int _694 = _692 + _690;
        int _696 = _694 & 13369548;
        uint _698 = uint(int(uint(_696) >> uint(3)));
        int _700 = _696 | int(_698);
        uint _702 = uint(int(uint(_667) >> uint(7)));
        int _704 = int(_702) + _667;
        int _706 = _700 & 5570560;
        int _708 = _700 & 85;
        uint _710 = uint(int(uint(_706) >> uint(15)));
        int _712 = int(_710) + _708;
        bool _714 = uint(_704) > uint(_712);
        if (!_714)
        {
            discard_fragment();
        }
        if (!_714)
        {
            out.m_62.x = _618;
            out.m_62.y = _624;
            out.m_62.z = _628;
            out.m_62.w = _160;
            return out;
        }
    }
    float _716 = 0.0 + _160;
    float _718 = precise::clamp(_716, 0.0, 1.0);
    out.m_62.x = 1.0;
    out.m_62.y = 1.0;
    out.m_62.z = 1.0;
    out.m_62.w = _718;
    return out;
}

