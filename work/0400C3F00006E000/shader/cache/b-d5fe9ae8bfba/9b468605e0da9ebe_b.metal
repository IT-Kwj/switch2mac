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
    constant _16* fp_c13 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> fp_t_tcb_34 [[id(8)]];
    sampler fp_t_tcb_34Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_C [[id(10)]];
    sampler fp_t_tcb_CSmplr [[id(11)]];
    texture2d<float> fp_t_tcb_10 [[id(12)]];
    sampler fp_t_tcb_10Smplr [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    sampler fp_t_tcb_34Smplr_w [[id(16)]];
    sampler fp_t_tcb_CSmplr_w [[id(17)]];
    sampler fp_t_tcb_10Smplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_58 [[color(0)]];
};

struct main0_in
{
    float4 m_51 [[user(locn0)]];
    float4 m_53 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_64 [[user(locn3), flat]];
    float4 m_66 [[user(locn4)]];
    float4 m_70 [[user(locn5)]];
    float4 m_43 [[user(locn6)]];
    float4 m_49 [[user(locn7)]];
    float4 m_47 [[user(locn8)]];
    float4 m_45 [[user(locn10), flat]];
    float4 m_60 [[user(locn11)]];
    float4 m_55 [[user(locn12)]];
    float4 m_68 [[user(locn13), flat]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _77 = gl_FragCoord.w;
    float _79 = in.m_43.z;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_43.w;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_45.y;
    float _93 = 1.0 / _77;
    float _95 = _93 * _83;
    float _97 = _93 * _89;
    float _99 = _95 + (-0.5);
    float _101 = _97 + (-0.5);
    float _103 = abs(_99);
    float _105 = abs(_101);
    float _107 = precise::max(_103, _105);
    bool _111 = _107 >= 16.0;
    float _113 = _99;
    float _115 = _101;
    if (_111)
    {
        float _117 = fma(_95, 0.0625, -0.03125);
        _113 = _117;
    }
    float _119 = _113;
    if (_111)
    {
        float _121 = fma(_97, 0.0625, -0.03125);
        _115 = _121;
    }
    float _123 = _115;
    float _125 = -_97;
    float _127 = _125 + 0.5;
    float _129 = -_95;
    float _131 = _129 + 0.5;
    float _133 = abs(_119);
    bool _135 = _133 != 0.0;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan(0.0);
    bool _143 = _139 || _141;
    float _145 = _127 * _127;
    float _147 = abs(_123);
    bool _149 = _147 == 0.0;
    float _151 = abs(_123);
    bool _153 = _151 == 0.0;
    bool _155 = !_143;
    bool _157 = _153 && _155;
    float _159 = fma(_131, _131, _145);
    float _161 = sqrt(_159);
    bool _163 = false;
    int _166 = as_type<int>(_145);
    if (_157)
    {
        bool _168 = as_type<int>(_123) >= 0;
        _163 = _168;
    }
    bool _170 = _163;
    int _172 = _170 ? (-1) : 0;
    if (_157)
    {
        int _174 = _170 ? 0 : 1078530011;
        _166 = _174;
    }
    int _176 = _166;
    int _178 = _176;
    if (_157)
    {
        int _180 = int(0x80000000) & as_type<int>(_119);
        int _182 = _176 | _180;
        _178 = _182;
    }
    int _184 = _178;
    bool _186 = !_143;
    bool _188 = _186 && _149;
    int _190 = _184;
    float _192 = as_type<float>(_184);
    if (!_188)
    {
        float _194 = abs(_119);
        bool _196 = _194 != as_type<float>(0x7f800000u /* inf */);
        bool _198 = isnan(_194);
        bool _200 = _196 || _198;
        bool _202 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _204 = _200 || _202;
        float _206 = abs(_123);
        bool _208 = _206 == as_type<float>(0x7f800000u /* inf */);
        float _210 = abs(_123);
        bool _212 = _210 == as_type<float>(0x7f800000u /* inf */);
        bool _214 = !_204;
        bool _216 = _212 && _214;
        if (_216)
        {
            bool _218 = as_type<int>(_123) >= 0;
            _172 = _218 ? (-1) : 0;
        }
        int _220 = _172;
        if (_216)
        {
            _190 = 1075235812;
        }
        int _222 = _190;
        int _224 = _222;
        if (_216)
        {
            int _226 = ~_220;
            int _228 = (_226 != 0) ? _222 : 1061752795;
            _224 = _228;
        }
        int _230 = _224;
        float _232 = as_type<float>(_230);
        if (_216)
        {
            int _234 = int(0x80000000) & as_type<int>(_119);
            int _236 = _230 | _234;
            _232 = as_type<float>(_236);
        }
        float _238 = _232;
        bool _240 = !_204;
        bool _242 = _240 && _208;
        _192 = _238;
        if (!_242)
        {
            float _244 = abs(_119);
            float _246 = abs(_123);
            float _248 = precise::max(_244, _246);
            float _250 = abs(_119);
            float _252 = abs(_123);
            float _254 = precise::min(_250, _252);
            float _256 = 1.0 / _248;
            float _258 = abs(_119);
            float _260 = abs(_123);
            bool _262 = _258 > _260;
            bool _264 = as_type<int>(_123) >= 0;
            float _266 = _254 * _256;
            float _268 = _266 * _266;
            float _270 = _268 + 11.33538818359375;
            float _272 = fma(_268, _270, 28.84246826171875);
            float _274 = fma(_268, _272, 19.6966705322265625);
            float _276 = fma(_268, -0.82336294651031494140625, -5.674867153167724609375);
            float _278 = fma(_268, _276, -6.565555095672607421875);
            float _280 = 1.0 / _274;
            float _282 = _268 * _278;
            float _284 = abs(_119);
            float _286 = abs(_123);
            float _288 = _284 + _286;
            int _290 = as_type<int>(_119) & int(0x80000000);
            float _292 = _266 * _282;
            bool _294 = _288 > as_type<float>(0x7f800000u /* inf */);
            bool _296 = isnan(_288);
            bool _298 = _294 || _296;
            bool _300 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _302 = _298 || _300;
            float _304 = fma(_292, _280, _266);
            float _306 = _304;
            _192 = _288;
            if (_262)
            {
                float _308 = -_304;
                float _310 = _308 + 1.57079637050628662109375;
                _306 = _310;
            }
            float _312 = _306;
            int _314 = as_type<int>(_312);
            if (!_264)
            {
                float _316 = -_312;
                float _318 = _316 + 3.1415927410125732421875;
                _314 = as_type<int>(_318);
            }
            int _320 = _314;
            if (!_302)
            {
                int _322 = _290 | _320;
                _192 = as_type<float>(_322);
            }
        }
    }
    float _324 = _192;
    float _326 = _91 * (*spvDescriptorSet0.fp_c9)._m0[191].w;
    float _328 = fma(_324, 0.15915493667125701904296875, 0.5);
    float _330 = fma(_161, (*spvDescriptorSet0.fp_c9)._m0[191].x, _326);
    float _332 = _328 * (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _334 = _332 + _330;
    float2 _1146 = float2(_332, _334);
    float _336 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1146, float2(0.0), isnan(_1146))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1146, float2(0.0), isnan(_1146))).w;
    float _338 = in.m_47.w;
    float _340 = gl_FragCoord.w;
    float _342 = _338 * _340;
    float _344 = in.m_47.z;
    float _346 = gl_FragCoord.w;
    float _348 = _344 * _346;
    float _350 = in.m_49.x;
    float _352 = gl_FragCoord.w;
    float _354 = _350 * _352;
    float _356 = in.m_49.y;
    float _358 = gl_FragCoord.w;
    float _360 = _356 * _358;
    float _362 = _93 * _342;
    float _364 = _93 * _348;
    float _366 = _93 * _354;
    float _368 = _93 * _360;
    float _370 = fma(_336, 0.0199999995529651641845703125, _362);
    float2 _1201;
    _1201.x = spvDescriptorSet0.fp_t_tcb_A.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_364, _370));
    _1201.y = spvDescriptorSet0.fp_t_tcb_A.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_364, _370));
    float _372 = _1201.x;
    float _374 = _372 * 256.0;
    int _376 = int(_374);
    float2 _1211 = float2(_366, _368);
    float _378 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_1211, float2(0.0), isnan(_1211))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_1211, float2(0.0), isnan(_1211))).w;
    float _380 = float(uint(_376));
    float _382 = _380 * 0.00390625;
    float _384 = precise::min(_382, 2.0);
    float2 _1228 = float2(_364, _370);
    float _386 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1228, float2(0.0), isnan(_1228)), level(_384)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1228, float2(0.0), isnan(_1228)), level(_384)).w;
    float2 _1236 = float2(_378, 0.0);
    float3 _390 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1236, float2(0.0), isnan(_1236))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1236, float2(0.0), isnan(_1236))).xyz;
    float _392 = _390.x;
    float _394 = _390.y;
    float _396 = _390.z;
    float _398 = in.m_51.w;
    float _400 = gl_FragCoord.w;
    float _402 = _398 * _400;
    float _404 = in.m_53.w;
    float _406 = gl_FragCoord.w;
    float _408 = _404 * _406;
    float _410 = in.m_55.x;
    float _412 = gl_FragCoord.w;
    float _414 = _410 * _412;
    float _416 = precise::max(0.0, _161);
    float _418 = precise::min(_416, 0.5);
    float _420 = fma(_418, -2.0, 1.0);
    float _422 = _420 * _420;
    float _424 = _93 * _402;
    float _426 = in.m_53.y;
    float _428 = gl_FragCoord.w;
    float _430 = _426 * _428;
    float _432 = in.m_51.y;
    float _434 = gl_FragCoord.w;
    float _436 = _432 * _434;
    float _438 = _336 + _386;
    float _440 = precise::clamp(_438, 0.0, 1.0);
    float _442 = -_424;
    float _444 = fma(_440, _422, _442);
    float _446 = _93 * _408;
    float _448 = _93 * _414;
    float _450 = _446 * _444;
    float _452 = 0.0 + _450;
    float _454 = precise::clamp(_452, 0.0, 1.0);
    float _456 = _454 * _448;
    bool _458 = _456 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _460 = isnan(_456);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _466 = _462 || _464;
    float _468 = in.m_53.x;
    float _470 = gl_FragCoord.w;
    float _472 = _468 * _470;
    float _474 = in.m_53.z;
    float _476 = gl_FragCoord.w;
    float _478 = _474 * _476;
    float _480 = in.m_51.x;
    float _482 = gl_FragCoord.w;
    float _484 = _480 * _482;
    float _486 = in.m_51.z;
    float _488 = gl_FragCoord.w;
    float _490 = _486 * _488;
    if (!_466)
    {
        discard_fragment();
    }
    float _492 = _93 * _472;
    float _494 = _93 * _430;
    float _496 = _93 * _478;
    float _498 = _93 * _436;
    float _500 = _392 + _492;
    float _502 = _394 + _494;
    float _504 = _93 * _484;
    float _506 = _396 + _496;
    float _508 = _93 * _490;
    float _510 = _386 * _386;
    float _512 = -_502;
    float _514 = _498 + _512;
    float _516 = -_500;
    float _518 = _504 + _516;
    float _520 = -_506;
    float _522 = _508 + _520;
    float _524 = fma(_510, _514, _502);
    float _526 = fma(_510, _518, _500);
    float _528 = fma(_510, _522, _506);
    if (!_466)
    {
        out.m_58.x = _526;
        out.m_58.y = _524;
        out.m_58.z = _528;
        out.m_58.w = _450;
        return out;
    }
    float _530 = in.m_60.w;
    float _532 = gl_FragCoord.w;
    float _534 = _530 * _532;
    float _536 = in.m_60.y;
    float _538 = gl_FragCoord.w;
    float _540 = _536 * _538;
    float _542 = in.m_60.x;
    float _544 = gl_FragCoord.w;
    float _546 = _542 * _544;
    float _548 = _93 * _534;
    float _550 = _93 * _540;
    float _552 = _93 * _546;
    float _554 = 1.0 / _548;
    float _556 = _550 * _554;
    float _558 = _552 * _554;
    float2 _1481 = float2(_558, _556);
    float _560 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1481, float2(0.0), isnan(_1481))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1481, float2(0.0), isnan(_1481))).x;
    float _562 = in.m_62.y;
    float _564 = gl_FragCoord.w;
    float _566 = _562 * _564;
    float _568 = in.m_62.x;
    float _570 = gl_FragCoord.w;
    float _572 = _568 * _570;
    float _574 = in.m_64.y;
    float _576 = in.m_62.z;
    float _578 = gl_FragCoord.w;
    float _580 = _576 * _578;
    float _582 = in.m_64.x;
    float _584 = in.m_64.z;
    float _586 = in.m_60.z;
    float _588 = gl_FragCoord.w;
    float _590 = _586 * _588;
    float _592 = _524 * 0.715200006961822509765625;
    float _594 = in.m_66.w;
    float _596 = gl_FragCoord.w;
    float _598 = _594 * _596;
    float _600 = in.m_68.x;
    float _602 = in.m_66.x;
    float _604 = gl_FragCoord.w;
    float _606 = _602 * _604;
    float _608 = fma(_526, 0.2125999927520751953125, _592);
    float _610 = in.m_66.y;
    float _612 = gl_FragCoord.w;
    float _614 = _610 * _612;
    float _616 = in.m_66.z;
    float _618 = gl_FragCoord.w;
    float _620 = _616 * _618;
    float _622 = fma(_528, 0.072200000286102294921875, _608);
    bool _624 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _626 = 1.0 / _622;
    float _628 = _93 * _566;
    float _630 = _93 * _572;
    float _632 = -_574;
    float _634 = _628 + _632;
    float _636 = _93 * _580;
    float _638 = -_582;
    float _640 = _630 + _638;
    float _642 = _626 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _644 = precise::clamp(_642, 0.0, 1.0);
    float _646 = _634 * _634;
    float _648 = -_584;
    float _650 = _636 + _648;
    float _652 = _93 * _590;
    float _654 = fma(_644, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _656 = fma(_640, _640, _646);
    float _658 = _652 * _554;
    float _660 = _600 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _662 = fma(_650, _650, _656);
    float _664 = _93 * _598;
    float _666 = _93 * _614;
    float _668 = in.m_70.w;
    float _670 = gl_FragCoord.w;
    float _672 = _668 * _670;
    float _674 = -_662;
    float _676 = fma(_660, _660, _674);
    float _678 = _654 * _664;
    float _680 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _682 = fma(_658, (*spvDescriptorSet0.fp_c8)._m0[30].w, _680);
    float _684 = _93 * _606;
    float _686 = _93 * _620;
    float _688 = precise::max(0.0, _676);
    float _690 = fma(_524, _678, _666);
    float _692 = fma(_526, _678, _684);
    float _694 = 1.0 / _682;
    float _696 = fma(_528, _678, _686);
    float _698 = sqrt(_688);
    float _700 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _702 = _694 * _700;
    float _704 = _694;
    if (_624)
    {
        float _706 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _708 = _702 + _706;
        _704 = _708;
    }
    float _710 = _704;
    float _712 = _710;
    if (_624)
    {
        float _714 = _710 * 8.0;
        float _716 = precise::clamp(_714, 0.0, 1.0);
        _712 = _716;
    }
    float _718 = _712;
    float _720 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _722 = fma(_560, (*spvDescriptorSet0.fp_c8)._m0[30].w, _720);
    float _724 = 1.0 / _722;
    float _726 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _728 = -_702;
    float _730 = fma(_724, _726, _728);
    float _732 = _93 * _672;
    float _734 = _698 + _730;
    float _736 = -_732;
    float _738 = _734 + _736;
    float _740 = _738 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    float _742 = _740 * (-1.44269502162933349609375);
    float _744 = exp2(_742);
    float _746 = -_744;
    float _748 = _746 + 1.0;
    float _750 = precise::clamp(_748, 0.0, 1.0);
    float _752 = _456 * _750;
    float _754 = precise::clamp(_752, 0.0, 1.0);
    float _756 = _754;
    if (_624)
    {
        float _758 = _754 * _718;
        _756 = _758;
    }
    float _760 = _756;
    float _762 = 0.0 + _760;
    float _764 = precise::clamp(_762, 0.0, 1.0);
    out.m_58.x = _692;
    out.m_58.y = _690;
    out.m_58.z = _696;
    out.m_58.w = _764;
    return out;
}

