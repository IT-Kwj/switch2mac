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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c10 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_58 [[color(0)]];
};

struct main0_in
{
    float4 m_55 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_49 [[user(locn6)]];
    float4 m_37 [[user(locn7)]];
    float4 m_43 [[user(locn8)]];
    float4 m_51 [[user(locn9)]];
    float4 m_60 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _67 = gl_FragCoord.w;
    float _69 = in.m_35.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_35.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = 1.0 / _67;
    float _83 = _81 * _73;
    float _85 = _81 * _79;
    float2 _687 = float2(_83, _85);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_687, float2(0.0), isnan(_687))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_687, float2(0.0), isnan(_687))).w;
    float _89 = in.m_37.y;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _97 = in.m_37.x;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_43.y;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_37.z;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_43.x;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_43.z;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_45.z;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = _81 * _93;
    bool _136 = as_type<int>(_95) != 0;
    float _138 = _81 * _101;
    bool _140 = !_136;
    float _142 = -_133;
    float _144 = _140 ? _142 : _133;
    float _146 = _81 * _107;
    float _148 = _81 * _113;
    bool _150 = !_136;
    float _152 = -_138;
    float _154 = _150 ? _152 : _138;
    float _156 = _81 * _119;
    float _158 = _144 * _144;
    float _160 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _162 = _146 + _160;
    bool _164 = !_136;
    float _166 = -_148;
    float _168 = _164 ? _166 : _148;
    float _170 = _81 * _125;
    float _172 = fma(_154, _154, _158);
    float _174 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _176 = _156 + _174;
    float _178 = _162 * _162;
    float _180 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _182 = _170 + _180;
    float _184 = fma(_168, _168, _172);
    float _186 = _81 * _131;
    float _188 = fma(_176, _176, _178);
    float _190 = fma(_182, _182, _188);
    float _192 = rsqrt(_184);
    float _194 = precise::max(_186, 0.64999997615814208984375);
    float _196 = precise::min(_194, 1.0);
    float _198 = rsqrt(_190);
    float _200 = _144 * _192;
    float _202 = _154 * _192;
    float _204 = _168 * _192;
    float _206 = _200 * _200;
    float _208 = _162 * _198;
    float _210 = fma(_202, _202, _206);
    float _212 = _176 * _198;
    float _214 = _182 * _198;
    float _216 = _208 * 0.100000001490116119384765625;
    float _218 = fma(_204, _204, _210);
    float _220 = _146 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _222 = _216 * _216;
    float _224 = fma(_156, (*spvDescriptorSet0.fp_c8)._m0[2].x, _220);
    float _226 = rsqrt(_218);
    float _228 = fma(_212, _212, _222);
    float _230 = fma(_170, (*spvDescriptorSet0.fp_c8)._m0[2].z, _224);
    float _232 = fma(_214, _214, _228);
    float _234 = _230 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _236 = rsqrt(_232);
    float _238 = -_234;
    float _240 = precise::max(_238, 8.0);
    float _242 = _202 * _226;
    float _244 = _200 * _226;
    float _246 = _204 * _226;
    float _248 = in.m_47.x;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = precise::min(_240, 20.0);
    float _256 = _216 * _236;
    float _258 = _212 * _236;
    float _260 = _214 * _236;
    float _262 = _256 * _244;
    float _264 = fma(_254, -0.07083334028720855712890625, 1.56666672229766845703125);
    float _266 = fma(_254, -0.07083334028720855712890625, 1.57666671276092529296875);
    float _268 = fma(_196, 2.8571426868438720703125, -1.8571426868438720703125);
    float _270 = fma(_258, _242, _262);
    float _272 = fma(_260, _246, _270);
    float _274 = -_87;
    float _276 = _274 + 1.0;
    float _278 = -_87;
    float _280 = fma(_278, _268, 1.0);
    float _282 = _87 + _272;
    float _284 = precise::max(0.0, _276);
    float _286 = precise::max(_264, _282);
    float _288 = precise::min(_284, 0.070000000298023223876953125);
    float _290 = _288 * 14.28571414947509765625;
    float _292 = precise::min(_266, _286);
    float _294 = _280 * _290;
    float _296 = -_264;
    float _298 = _296 + _292;
    float _300 = _81 * _252;
    float _302 = precise::max(_294, 0.75);
    float _304 = fma(_298, -100.00009918212890625, 1.0);
    float _306 = precise::min(_302, 0.7599999904632568359375);
    float _308 = fma(_306, 100.00009918212890625, -75.0000762939453125);
    float _310 = _308 * _304;
    float _312 = 0.0 + _310;
    float _314 = precise::clamp(_312, 0.0, 1.0);
    float _316 = _314 * _300;
    bool _318 = _316 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _320 = isnan(_316);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _326 = _322 || _324;
    float _328 = in.m_35.z;
    float _330 = gl_FragCoord.w;
    float _332 = _328 * _330;
    float _334 = in.m_35.w;
    float _336 = gl_FragCoord.w;
    float _338 = _334 * _336;
    if (!_326)
    {
        discard_fragment();
    }
    float _340 = _81 * _332;
    float _342 = _81 * _338;
    float2 _1072 = float2(_340, _342);
    float2 _346 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1072, float2(0.0), isnan(_1072))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1072, float2(0.0), isnan(_1072))).xy;
    float _348 = _346.x;
    float _350 = _346.y;
    float _352 = in.m_49.y;
    float _354 = gl_FragCoord.w;
    float _356 = _352 * _354;
    float _358 = in.m_49.x;
    float _360 = gl_FragCoord.w;
    float _362 = _358 * _360;
    float _364 = in.m_51.y;
    float _366 = gl_FragCoord.w;
    float _368 = _364 * _366;
    float _370 = in.m_49.z;
    float _372 = gl_FragCoord.w;
    float _374 = _370 * _372;
    float _376 = in.m_51.x;
    float _378 = gl_FragCoord.w;
    float _380 = _376 * _378;
    float _382 = in.m_51.z;
    float _384 = gl_FragCoord.w;
    float _386 = _382 * _384;
    float _388 = in.m_53.x;
    float _390 = gl_FragCoord.w;
    float _392 = _388 * _390;
    float _394 = in.m_55.y;
    float _396 = gl_FragCoord.w;
    float _398 = _394 * _396;
    float _400 = -_146;
    float _402 = _400 + (*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _404 = -_156;
    float _406 = _404 + (*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _408 = _81 * _356;
    float _410 = _81 * _362;
    float _412 = _81 * _368;
    float _414 = _81 * _374;
    float _416 = _408 * _408;
    float _418 = _81 * _380;
    float _420 = _412 * _412;
    float _422 = in.m_55.z;
    float _424 = gl_FragCoord.w;
    float _426 = _422 * _424;
    float _428 = fma(_410, _410, _416);
    float _430 = _81 * _386;
    float _432 = fma(_414, _414, _428);
    float _434 = fma(_418, _418, _420);
    float _436 = fma(_430, _430, _434);
    float _438 = rsqrt(_432);
    float _440 = rsqrt(_436);
    float _442 = in.m_53.z;
    float _444 = gl_FragCoord.w;
    float _446 = _442 * _444;
    float _448 = _350 * _350;
    float _450 = _438 * _350;
    float _452 = _440 * _348;
    float _454 = in.m_53.y;
    float _456 = gl_FragCoord.w;
    float _458 = _454 * _456;
    float _460 = fma(_348, _348, _448);
    float _462 = precise::clamp(_460, 0.0, 1.0);
    float _464 = _408 * _450;
    float _466 = in.m_55.x;
    float _468 = gl_FragCoord.w;
    float _470 = _466 * _468;
    float _472 = _410 * _450;
    float _474 = -_462;
    float _476 = _474 + 1.0;
    float _478 = fma(_412, _452, _464);
    float _480 = _414 * _450;
    float _482 = fma(_418, _452, _472);
    float _484 = _402 * _402;
    float _486 = _81 * _426;
    float _488 = sqrt(_476);
    float _490 = fma(_430, _452, _480);
    float _492 = fma(_244, _488, _478);
    float _494 = fma(_242, _488, _482);
    float _496 = fma(_246, _488, _490);
    float _498 = _256 * _492;
    float _500 = _81 * _458;
    float _502 = fma(_258, _494, _498);
    float _504 = _81 * _470;
    float _506 = _81 * _446;
    float _508 = fma(_260, _496, _502);
    float _510 = fma(_406, _406, _484);
    float _512 = _81 * _398;
    float _514 = -_170;
    float _516 = _514 + (*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _518 = fma(_508, 0.5, 0.5);
    float _520 = _81 * _392;
    float _522 = -_512;
    float _524 = _522 + _500;
    float _526 = fma(_516, _516, _510);
    float _528 = precise::max(0.0, _518);
    float _530 = -_504;
    float _532 = _530 + _520;
    float _534 = -_486;
    float _536 = _534 + _506;
    float _538 = precise::min(_528, 0.1500000059604644775390625);
    float _540 = _538 * 6.666666507720947265625;
    float _542 = fma(_540, _532, _504);
    float _544 = fma(_540, _524, _512);
    float _546 = fma(_540, _536, _486);
    if (!_326)
    {
        out.m_58.x = _542;
        out.m_58.y = _544;
        out.m_58.z = _546;
        out.m_58.w = _310;
        return out;
    }
    float _548 = 1.0 / (*spvDescriptorSet0.fp_c8)._m0[31].x;
    float _550 = in.m_60.w;
    float _552 = gl_FragCoord.w;
    float _554 = _550 * _552;
    float _556 = sqrt(_526);
    float _558 = _548 * (*spvDescriptorSet0.fp_c8)._m0[31].y;
    float _560 = _558 * _556;
    float _562 = precise::max(_560, 1.0);
    float _564 = precise::min(_562, 2.0);
    float _566 = _81 * _554;
    float _568 = _564 + (-1.0);
    float _570 = _568 * (*spvDescriptorSet0.fp_c10)._m0[3].x;
    float _572 = _566 * _570;
    bool _574 = _572 != 1.0;
    bool _576 = isnan(_572);
    bool _578 = _574 || _576;
    bool _580 = isnan(1.0);
    bool _582 = _578 || _580;
    bool _584 = !_582;
    if (!_584)
    {
        float _586 = gl_FragCoord.x;
        float _588 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _590 = _586 / _588;
        float _592 = gl_FragCoord.y;
        float _594 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _596 = _592 / _594;
        float _598 = trunc(_590);
        int _601 = int(_598);
        float _603 = trunc(_596);
        int _605 = int(_603);
        int _607 = _601 + 2;
        int _609 = _607 >> 1;
        uint _612 = uint(int(uint(_605) >> uint(1)));
        int _614 = _609 ^ int(_612);
        int _616 = _614 << 16;
        int _618 = _616 ^ _609;
        int _620 = 983055 & _618;
        float _622 = _572 * 256.0;
        int _624 = _620 << 6;
        int _626 = _624 + _620;
        float _628 = trunc(_622);
        int _630 = int(_628);
        int _632 = _626 & 13369548;
        uint _634 = uint(int(uint(_632) >> uint(3)));
        int _636 = _632 | int(_634);
        int _638 = _636 & 5570560;
        int _640 = _636 & 85;
        uint _642 = uint(int(uint(_630) >> uint(7)));
        int _644 = int(_642) + _630;
        uint _646 = uint(int(uint(_638) >> uint(15)));
        int _648 = int(_646) + _640;
        bool _650 = uint(_644) > uint(_648);
        if (!_650)
        {
            discard_fragment();
        }
        if (!_650)
        {
            out.m_58.x = _542;
            out.m_58.y = _544;
            out.m_58.z = _546;
            out.m_58.w = _316;
            return out;
        }
    }
    float _652 = 0.0 + _316;
    float _654 = precise::clamp(_652, 0.0, 1.0);
    out.m_58.x = 1.0;
    out.m_58.y = 1.0;
    out.m_58.z = 1.0;
    out.m_58.w = _654;
    return out;
}

