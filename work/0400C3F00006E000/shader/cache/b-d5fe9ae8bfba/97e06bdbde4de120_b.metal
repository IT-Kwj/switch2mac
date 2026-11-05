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
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texturecube<float> fp_t_tcb_1E [[id(8)]];
    sampler fp_t_tcb_1ESmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_1ESmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
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
    float4 m_59 [[user(locn8)]];
    float4 m_57 [[user(locn9)]];
    float4 m_67 [[user(locn10)]];
    float4 m_53 [[user(locn11)]];
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
    float2 _771 = float2(_94, _96);
    float4 _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_771, float2(0.0), isnan(_771))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_771, float2(0.0), isnan(_771))).xyzw;
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
    float _139 = _92 * _131;
    float _141 = in.m_40.w;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = _92 * _145;
    float _149 = -_133;
    float _151 = fma(_107, _135, _149);
    float _153 = _137 * _151;
    float _155 = 0.0 + _153;
    float _157 = precise::clamp(_155, 0.0, 1.0);
    float _159 = _157 * _139;
    bool _162 = _159 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _164 = isnan(_159);
    bool _166 = _162 || _164;
    bool _168 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _170 = _166 || _168;
    float _172 = in.m_40.z;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    if (!_170)
    {
        discard_fragment();
    }
    float _178 = _92 * _176;
    float2 _889 = float2(_178, _147);
    float2 _182 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_889, float2(0.0), isnan(_889))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_889, float2(0.0), isnan(_889))).xy;
    float _184 = _182.x;
    float _186 = _182.y;
    float _188 = in.m_42.x;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = in.m_42.y;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = in.m_46.x;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = in.m_42.z;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = in.m_46.y;
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
    float _254 = -_246;
    float _256 = _242 + _254;
    float _258 = -_250;
    float _260 = _244 + _258;
    float _262 = -_252;
    float _264 = _248 + _262;
    float _266 = fma(_101, _256, _246);
    float _268 = fma(_103, _260, _250);
    float _270 = fma(_105, _264, _252);
    float _272 = _92 * _228;
    float _274 = _92 * _234;
    float _276 = _92 * _240;
    float _278 = _266 * _272;
    float _280 = _268 * _274;
    float _282 = _270 * _276;
    if (!_170)
    {
        out.m_51.x = _278;
        out.m_51.y = _280;
        out.m_51.z = _282;
        out.m_51.w = _153;
        return out;
    }
    float _284 = in.m_53.w;
    float _286 = gl_FragCoord.w;
    float _288 = _284 * _286;
    float _290 = _92 * _288;
    bool _292 = _290 != 1.0;
    bool _294 = isnan(_290);
    bool _296 = _292 || _294;
    bool _298 = isnan(1.0);
    bool _300 = _296 || _298;
    bool _302 = !_300;
    if (!_302)
    {
        float _304 = gl_FragCoord.x;
        float _306 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _308 = _304 / _306;
        float _310 = gl_FragCoord.y;
        float _312 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _314 = _310 / _312;
        float _316 = _290 * 256.0;
        float _318 = trunc(_316);
        int _321 = int(_318);
        uint _324 = uint(int(uint(_321) >> uint(7)));
        int _326 = int(_324) + _321;
        float _328 = trunc(_308);
        int _330 = int(_328);
        float _332 = trunc(_314);
        int _334 = int(_332);
        int _336 = _330 + 2;
        int _338 = _336 >> 1;
        uint _340 = uint(int(uint(_334) >> uint(1)));
        int _342 = _338 ^ int(_340);
        int _344 = _342 << 16;
        int _346 = _344 ^ _338;
        int _348 = 983055 & _346;
        int _350 = _348 << 6;
        int _352 = _350 + _348;
        int _354 = _352 & 13369548;
        uint _356 = uint(int(uint(_354) >> uint(3)));
        int _358 = _354 | int(_356);
        int _360 = _358 & 5570560;
        int _362 = _358 & 85;
        uint _364 = uint(int(uint(_360) >> uint(15)));
        int _366 = int(_364) + _362;
        bool _368 = uint(_326) > uint(_366);
        if (!_368)
        {
            discard_fragment();
        }
        if (!_368)
        {
            out.m_51.x = _278;
            out.m_51.y = _280;
            out.m_51.z = _282;
            out.m_51.w = _159;
            return out;
        }
    }
    float _370 = in.m_55.y;
    float _372 = gl_FragCoord.w;
    float _374 = _370 * _372;
    float _376 = in.m_57.z;
    float _378 = gl_FragCoord.w;
    float _380 = _376 * _378;
    float _382 = in.m_55.x;
    float _384 = gl_FragCoord.w;
    float _386 = _382 * _384;
    float _388 = in.m_57.y;
    float _390 = gl_FragCoord.w;
    float _392 = _388 * _390;
    float _394 = in.m_55.z;
    float _396 = gl_FragCoord.w;
    float _398 = _394 * _396;
    float _400 = in.m_57.x;
    float _402 = gl_FragCoord.w;
    float _404 = _400 * _402;
    float _406 = in.m_59.y;
    float _408 = gl_FragCoord.w;
    float _410 = _406 * _408;
    float _412 = in.m_59.x;
    float _414 = gl_FragCoord.w;
    float _416 = _412 * _414;
    float _418 = in.m_59.z;
    float _420 = gl_FragCoord.w;
    float _422 = _418 * _420;
    float _424 = _186 * _186;
    float _426 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _428 = fma(_184, _184, _424);
    float _430 = precise::clamp(_428, 0.0, 1.0);
    float _432 = -_430;
    float _434 = _432 + 1.0;
    float _436 = sqrt(_434);
    float _438 = _92 * _374;
    float _440 = _92 * _380;
    float _442 = _92 * _386;
    float _444 = _92 * _392;
    float _446 = _438 * _438;
    float _448 = _92 * _398;
    float _450 = _92 * _404;
    float _452 = _444 * _444;
    float _454 = fma(_442, _442, _446);
    float _456 = _92 * _410;
    float _458 = _92 * _416;
    float _460 = fma(_450, _450, _452);
    float _462 = fma(_448, _448, _454);
    float _464 = _456 * _456;
    float _466 = _92 * _422;
    float _468 = fma(_440, _440, _460);
    bool _470 = as_type<int>(_426) != 0;
    float _472 = fma(_458, _458, _464);
    float _474 = rsqrt(_462);
    float _476 = fma(_466, _466, _472);
    float _478 = rsqrt(_468);
    float _480 = rsqrt(_476);
    float _482 = _474 * _186;
    float _484 = _438 * _482;
    float _486 = _478 * _184;
    float _488 = _442 * _482;
    float _490 = fma(_444, _486, _484);
    float _492 = fma(_450, _486, _488);
    float _494 = _480 * _436;
    float _496 = _448 * _482;
    float _498 = fma(_456, _494, _490);
    float _500 = fma(_440, _486, _496);
    float _502 = fma(_458, _494, _492);
    float _504 = in.m_53.x;
    float _506 = gl_FragCoord.w;
    float _508 = _504 * _506;
    bool _510 = !_470;
    float _512 = -_498;
    float _514 = _510 ? _512 : _498;
    float _516 = fma(_466, _494, _500);
    bool _518 = !_470;
    float _520 = -_502;
    float _522 = _518 ? _520 : _502;
    float _524 = _514 * _514;
    bool _526 = !_470;
    float _528 = -_516;
    float _530 = _526 ? _528 : _516;
    float _532 = fma(_522, _522, _524);
    float _534 = fma(_530, _530, _532);
    float _536 = rsqrt(_534);
    float _538 = _522 * _536;
    float _540 = _514 * _536;
    float _542 = _530 * _536;
    float _544 = abs(_538);
    float _546 = abs(_540);
    float _548 = precise::max(_544, _546);
    float _550 = abs(_542);
    float _552 = precise::max(_550, _548);
    float _554 = _92 * _508;
    float _556 = 1.0 / _552;
    float _558 = precise::min(_554, 1.0);
    float _560 = _538 * _556;
    float _562 = _540 * _556;
    float _564 = -_556;
    float _566 = _542 * _564;
    float3 _1453 = float3(_560, _562, _566);
    float3 _570 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1453, float3(0.0), isnan(_1453)), level(_558)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1453, float3(0.0), isnan(_1453)), level(_558)).xyz;
    float _572 = _570.x;
    float _574 = _570.y;
    float _576 = _570.z;
    float _578 = in.m_65.y;
    float _580 = gl_FragCoord.w;
    float _582 = _578 * _580;
    float _584 = in.m_67.y;
    float _586 = gl_FragCoord.w;
    float _588 = _584 * _586;
    float _590 = in.m_65.z;
    float _592 = gl_FragCoord.w;
    float _594 = _590 * _592;
    float _596 = in.m_65.x;
    float _598 = gl_FragCoord.w;
    float _600 = _596 * _598;
    float _602 = in.m_67.z;
    float _604 = gl_FragCoord.w;
    float _606 = _602 * _604;
    float _608 = in.m_67.x;
    float _610 = gl_FragCoord.w;
    float _612 = _608 * _610;
    float _614 = in.m_69.x;
    float _616 = gl_FragCoord.w;
    float _618 = _614 * _616;
    float _620 = in.m_69.w;
    float _622 = gl_FragCoord.w;
    float _624 = _620 * _622;
    float _626 = in.m_69.y;
    float _628 = gl_FragCoord.w;
    float _630 = _626 * _628;
    float _632 = in.m_69.z;
    float _634 = gl_FragCoord.w;
    float _636 = _632 * _634;
    float _638 = _92 * _582;
    float _640 = _92 * _594;
    float _642 = _92 * _600;
    float _644 = fma(_574, 0.20999999344348907470703125, _638);
    float _646 = _92 * _588;
    float _648 = fma(_576, 0.20999999344348907470703125, _640);
    float _650 = fma(_572, 0.20999999344348907470703125, _642);
    float _652 = _92 * _606;
    bool _654 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _656 = _92 * _612;
    float _658 = _644 + _646;
    float _660 = _648 + _652;
    float _662 = 0.0 + _159;
    float _664 = precise::clamp(_662, 0.0, 1.0);
    float _666 = _650 + _656;
    float _668 = _92 * _624;
    float _670 = _282 * _660;
    float _672 = _92 * _618;
    float _674 = _278 * _666;
    float _676 = _280 * _658;
    float _678 = _92 * _630;
    float _680 = _92 * _636;
    float _682 = fma(_674, _668, _672);
    float _684 = _672;
    if (!_654)
    {
        _684 = _664;
    }
    float _686 = _684;
    float _688 = fma(_676, _668, _678);
    float _690 = fma(_670, _668, _680);
    bool _692 = !_654;
    float _694 = _686;
    if (!_692)
    {
        float _696 = in.m_71.w;
        float _698 = gl_FragCoord.w;
        float _700 = _696 * _698;
        float _702 = in.m_71.z;
        float _704 = gl_FragCoord.w;
        float _706 = _702 * _704;
        float _708 = _92 * _700;
        float _710 = _92 * _706;
        float _712 = 1.0 / _708;
        float _714 = _710 * _712;
        float _716 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _718 = fma(_714, (*spvDescriptorSet0.fp_c8)._m0[30].w, _716);
        float _720 = 1.0 / _718;
        float _722 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _724 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _726 = fma(_720, _722, _724);
        float _728 = _726 * 8.0;
        float _730 = precise::clamp(_728, 0.0, 1.0);
        float _732 = _664 * _730;
        _694 = _732;
    }
    float _734 = _694;
    float _736 = 0.0 + _734;
    float _738 = precise::clamp(_736, 0.0, 1.0);
    out.m_51.x = _682;
    out.m_51.y = _688;
    out.m_51.z = _690;
    out.m_51.w = _738;
    return out;
}

