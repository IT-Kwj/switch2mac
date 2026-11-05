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
    constant _16* fp_c7 [[id(2)]];
    constant _16* fp_c9 [[id(3)]];
    constant _16* fp_c15 [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    texturecube<float> fp_t_tcb_1E [[id(9)]];
    sampler fp_t_tcb_1ESmplr [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_1ESmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_63 [[color(0)]];
};

struct main0_in
{
    float4 m_52 [[user(locn0)]];
    float4 m_56 [[user(locn1)]];
    float4 m_58 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_54 [[user(locn4)]];
    float4 m_42 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 m_50 [[user(locn7)]];
    float4 m_44 [[user(locn8)]];
    float4 m_67 [[user(locn9)]];
    float4 m_60 [[user(locn10)]];
    float4 m_69 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _78 = gl_FragCoord.w;
    float _80 = in.m_42.z;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_42.w;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_42.x;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_42.y;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = 1.0 / _78;
    float _106 = _104 * _84;
    float _108 = _104 * _90;
    float _110 = _104 * _96;
    float _112 = _104 * _102;
    float2 _783 = float2(_106, _108);
    float _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_783, float2(0.0), isnan(_783))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_783, float2(0.0), isnan(_783))).w;
    float2 _794 = float2(_110, _112);
    float4 _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_794, float2(0.0), isnan(_794))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_794, float2(0.0), isnan(_794))).xyzw;
    float _119 = _117.x;
    float _121 = _117.y;
    float _123 = _117.z;
    float _125 = _117.w;
    float _127 = in.m_44.y;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _135 = in.m_44.x;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = in.m_50.y;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = in.m_50.x;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = in.m_44.z;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = in.m_50.z;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = _104 * _131;
    bool _168 = as_type<int>(_133) != 0;
    float _170 = _104 * _139;
    float _172 = _104 * _145;
    float _174 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _176 = _165 + _174;
    float _178 = _104 * _151;
    float _180 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _182 = _170 + _180;
    float _184 = _104 * _157;
    float _186 = _176 * _176;
    bool _188 = !_168;
    float _190 = -_172;
    float _192 = _188 ? _190 : _172;
    bool _194 = !_168;
    float _196 = -_178;
    float _198 = _194 ? _196 : _178;
    float _200 = fma(_182, _182, _186);
    float _202 = _104 * _163;
    float _204 = _192 * _192;
    float _206 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _208 = _184 + _206;
    bool _210 = !_168;
    float _212 = -_202;
    float _214 = _210 ? _212 : _202;
    float _216 = fma(_198, _198, _204);
    float _218 = fma(_208, _208, _200);
    float _220 = fma(_214, _214, _216);
    float _222 = rsqrt(_218);
    float _224 = rsqrt(_220);
    float _226 = _176 * _222;
    float _228 = _182 * _222;
    float _230 = _208 * _222;
    float _232 = _226 * _226;
    float _234 = _192 * _224;
    float _236 = fma(_228, _228, _232);
    float _238 = _198 * _224;
    float _240 = _234 * _234;
    float _242 = fma(_230, _230, _236);
    float _244 = _214 * _224;
    float _246 = fma(_238, _238, _240);
    float _248 = in.m_52.w;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = in.m_54.x;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = rsqrt(_242);
    float _262 = fma(_244, _244, _246);
    float _264 = rsqrt(_262);
    float _266 = _226 * _260;
    float _268 = _234 * _264;
    float _270 = _268 * _266;
    float _272 = _228 * _260;
    float _274 = _238 * _264;
    float _276 = _230 * _260;
    float _278 = _104 * _258;
    float _280 = _244 * _264;
    float _282 = fma(_274, _272, _270);
    float _284 = in.m_56.w;
    float _286 = gl_FragCoord.w;
    float _288 = _284 * _286;
    float _290 = fma(_278, 0.01745329238474369049072265625, 3.4906585216522216796875);
    float _292 = fma(_280, _276, _282);
    float _294 = _290 * 0.15915493667125701904296875;
    float _296 = abs(_292);
    float _298 = _296 * 2.0;
    float _300 = precise::clamp(_298, 0.0, 1.0);
    float _302 = _294 * 6.283185482025146484375;
    float _304 = sin(_302);
    float _306 = fma(_300, -2.0, 3.0);
    float _308 = _300 * _300;
    float _310 = _306 * _308;
    float _312 = in.m_58.x;
    float _314 = gl_FragCoord.w;
    float _316 = _312 * _314;
    float _318 = fma(_304, 0.3499999940395355224609375, 0.64999997615814208984375);
    float _320 = precise::max(_318, 0.300000011920928955078125);
    float _322 = precise::min(_320, 1.0);
    float _324 = _104 * _316;
    float _326 = fma(_114, 0.800000011920928955078125, 0.20000000298023223876953125);
    float _328 = precise::max(_326, 0.20000000298023223876953125);
    float _330 = precise::min(_328, 1.0);
    float _332 = _125 * _330;
    float _334 = _104 * _252;
    float _336 = -_334;
    float _338 = fma(_332, _310, _336);
    float _340 = _104 * _288;
    float _342 = _322 * (*spvDescriptorSet0.fp_c7)._m0[0].y;
    float _344 = _340 * _338;
    float _346 = _344 * _342;
    float _348 = 0.0 + _346;
    float _350 = precise::clamp(_348, 0.0, 1.0);
    float _352 = _350 * _324;
    bool _354 = _352 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _356 = isnan(_352);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _362 = _358 || _360;
    float _364 = abs(_238);
    float _366 = abs(_234);
    float _368 = precise::max(_364, _366);
    float _370 = abs(_244);
    float _372 = precise::max(_370, _368);
    if (!_362)
    {
        discard_fragment();
    }
    float _374 = 1.0 / _372;
    float _376 = _234 * _374;
    float _378 = _238 * _374;
    float _380 = in.m_60.x;
    float _382 = gl_FragCoord.w;
    float _384 = _380 * _382;
    float _386 = -_374;
    float _388 = _244 * _386;
    float _390 = _104 * _384;
    float _392 = precise::min(_390, 1.0);
    float3 _1191 = float3(_378, _376, _388);
    float3 _396 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1191, float3(0.0), isnan(_1191)), level(_392)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1191, float3(0.0), isnan(_1191)), level(_392)).xyz;
    float _398 = _396.x;
    float _400 = _396.y;
    float _402 = _396.z;
    float _404 = in.m_56.x;
    float _406 = gl_FragCoord.w;
    float _408 = _404 * _406;
    float _410 = in.m_56.y;
    float _412 = gl_FragCoord.w;
    float _414 = _410 * _412;
    float _416 = in.m_56.z;
    float _418 = gl_FragCoord.w;
    float _420 = _416 * _418;
    float _422 = in.m_52.x;
    float _424 = gl_FragCoord.w;
    float _426 = _422 * _424;
    float _428 = in.m_52.y;
    float _430 = gl_FragCoord.w;
    float _432 = _428 * _430;
    float _434 = in.m_52.z;
    float _436 = gl_FragCoord.w;
    float _438 = _434 * _436;
    float _440 = _119 * _119;
    float _442 = _121 * _121;
    float _444 = _123 * _123;
    float _446 = -_440;
    float _448 = _446 + 1.0;
    float _450 = -_444;
    float _452 = _450 + 1.0;
    float _454 = _104 * _408;
    float _456 = _104 * _414;
    float _458 = -_442;
    float _460 = _458 + 1.0;
    float _462 = _104 * _420;
    float _464 = _454 * _448;
    float _466 = _104 * _426;
    float _468 = _456 * _460;
    float _470 = _462 * _452;
    float _472 = _104 * _432;
    float _474 = _104 * _438;
    float _476 = fma(_440, _466, _464);
    float _478 = fma(_442, _472, _468);
    float _480 = fma(_444, _474, _470);
    if (!_362)
    {
        out.m_63.x = _476;
        out.m_63.y = _478;
        out.m_63.z = _480;
        out.m_63.w = _346;
        return out;
    }
    float _482 = in.m_60.w;
    float _484 = gl_FragCoord.w;
    float _486 = _482 * _484;
    float _488 = _104 * _486;
    bool _490 = _488 != 1.0;
    bool _492 = isnan(_488);
    bool _494 = _490 || _492;
    bool _496 = isnan(1.0);
    bool _498 = _494 || _496;
    bool _500 = !_498;
    if (!_500)
    {
        float _502 = gl_FragCoord.x;
        float _504 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _506 = _502 / _504;
        float _508 = gl_FragCoord.y;
        float _510 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _512 = _508 / _510;
        float _514 = _488 * 256.0;
        float _516 = trunc(_514);
        int _519 = int(_516);
        float _521 = trunc(_506);
        int _523 = int(_521);
        float _525 = trunc(_512);
        int _527 = int(_525);
        int _529 = _523 + 2;
        int _531 = _529 >> 1;
        uint _534 = uint(int(uint(_527) >> uint(1)));
        int _536 = _531 ^ int(_534);
        int _538 = _536 << 16;
        int _540 = _538 ^ _531;
        int _542 = 983055 & _540;
        int _544 = _542 << 6;
        int _546 = _544 + _542;
        int _548 = _546 & 13369548;
        uint _550 = uint(int(uint(_548) >> uint(3)));
        int _552 = _548 | int(_550);
        uint _554 = uint(int(uint(_519) >> uint(7)));
        int _556 = int(_554) + _519;
        int _558 = _552 & 5570560;
        int _560 = _552 & 85;
        uint _562 = uint(int(uint(_558) >> uint(15)));
        int _564 = int(_562) + _560;
        bool _566 = uint(_556) > uint(_564);
        if (!_566)
        {
            discard_fragment();
        }
        if (!_566)
        {
            out.m_63.x = _476;
            out.m_63.y = _478;
            out.m_63.z = _480;
            out.m_63.w = _352;
            return out;
        }
    }
    float _568 = in.m_65.y;
    float _570 = gl_FragCoord.w;
    float _572 = _568 * _570;
    float _574 = in.m_65.x;
    float _576 = gl_FragCoord.w;
    float _578 = _574 * _576;
    float _580 = in.m_65.z;
    float _582 = gl_FragCoord.w;
    float _584 = _580 * _582;
    float _586 = in.m_67.x;
    float _588 = gl_FragCoord.w;
    float _590 = _586 * _588;
    float _592 = in.m_67.y;
    float _594 = gl_FragCoord.w;
    float _596 = _592 * _594;
    float _598 = in.m_67.z;
    float _600 = gl_FragCoord.w;
    float _602 = _598 * _600;
    float _604 = in.m_69.x;
    float _606 = gl_FragCoord.w;
    float _608 = _604 * _606;
    float _610 = in.m_69.w;
    float _612 = gl_FragCoord.w;
    float _614 = _610 * _612;
    float _616 = in.m_69.y;
    float _618 = gl_FragCoord.w;
    float _620 = _616 * _618;
    float _622 = in.m_69.z;
    float _624 = gl_FragCoord.w;
    float _626 = _622 * _624;
    float _628 = _104 * _572;
    float _630 = _104 * _578;
    float _632 = _104 * _584;
    float _634 = fma(_400, 0.20999999344348907470703125, _628);
    float _636 = fma(_398, 0.20999999344348907470703125, _630);
    bool _638 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _640 = _104 * _590;
    float _642 = fma(_402, 0.20999999344348907470703125, _632);
    float _644 = _104 * _596;
    float _646 = _104 * _602;
    float _648 = _636 + _640;
    float _650 = _104 * _614;
    float _652 = _634 + _644;
    float _654 = _642 + _646;
    float _656 = _476 * _648;
    float _658 = 0.0 + _352;
    float _660 = precise::clamp(_658, 0.0, 1.0);
    float _662 = _104 * _608;
    float _664 = _478 * _652;
    float _666 = _480 * _654;
    float _668 = _104 * _620;
    float _670 = _104 * _626;
    float _672 = fma(_656, _650, _662);
    float _674 = _662;
    if (!_638)
    {
        _674 = _660;
    }
    float _676 = _674;
    float _678 = fma(_664, _650, _668);
    float _680 = fma(_666, _650, _670);
    bool _682 = !_638;
    float _684 = _676;
    if (!_682)
    {
        float _686 = in.m_71.w;
        float _688 = gl_FragCoord.w;
        float _690 = _686 * _688;
        float _692 = in.m_71.z;
        float _694 = gl_FragCoord.w;
        float _696 = _692 * _694;
        float _698 = _104 * _690;
        float _700 = _104 * _696;
        float _702 = 1.0 / _698;
        float _704 = _700 * _702;
        float _706 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _708 = fma(_704, (*spvDescriptorSet0.fp_c8)._m0[30].w, _706);
        float _710 = 1.0 / _708;
        float _712 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _714 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _716 = fma(_710, _712, _714);
        float _718 = _716 * 8.0;
        float _720 = precise::clamp(_718, 0.0, 1.0);
        float _722 = _660 * _720;
        _684 = _722;
    }
    float _724 = _684;
    float _726 = 0.0 + _724;
    float _728 = precise::clamp(_726, 0.0, 1.0);
    out.m_63.x = _672;
    out.m_63.y = _678;
    out.m_63.z = _680;
    out.m_63.w = _728;
    return out;
}

