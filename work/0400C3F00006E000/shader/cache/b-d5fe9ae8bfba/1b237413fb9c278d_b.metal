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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_69 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_71 [[user(locn2)]];
    float4 m_73 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_75 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_51 [[attribute(2)]];
    float4 m_55 [[attribute(3)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_61 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
    float4 m_63 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1765 = false;
    bool _1028 = false;
    bool _844 = false;
    bool _678 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_44.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_47.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2613 = as_type<float>(_110);
        out.gl_Position.z = _2613;
    }
    if (!_98)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _114 = in.m_49.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _130 = _128;
    if (_124)
    {
        float _132 = float(_94);
        _104 = _132;
    }
    float _134 = _104;
    bool _136 = _128 >= _134;
    bool _138 = !_124;
    bool _140 = _136 || _138;
    float _142 = _134;
    if (_140)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _142;
    if (_140)
    {
        out.m_47.x = 0.0;
    }
    if (_140)
    {
        float _146 = _144 * 5.0;
        _112 = as_type<int>(_146);
    }
    int _148 = _112;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2683 = as_type<float>(_148);
        out.gl_Position.z = _2683;
    }
    if (_140)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _150 = in.m_51.x;
    float _152 = in.m_51.y;
    float _154 = in.m_51.z;
    float _156 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _158 = in.m_53.x;
    float _160 = in.m_53.y;
    float _162 = in.m_53.z;
    bool _164 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _166 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _168 = _164 || _166;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    float _174 = in.m_55.x;
    float _176 = in.m_55.y;
    float _178 = in.m_55.z;
    float _180 = _150 * _150;
    float _182 = _152 * _152;
    float _184 = fma(_158, _158, _180);
    float _186 = fma(_160, _160, _182);
    float _188 = fma(_174, _174, _184);
    float _190 = _154 * _154;
    float _192 = fma(_176, _176, _186);
    float _194 = sqrt(_188);
    float _196 = fma(_162, _162, _190);
    float _198 = fma(_178, _178, _196);
    float _200 = sqrt(_192);
    float _202 = sqrt(_198);
    bool _204 = _194 > 0.0;
    bool _206 = _200 > 0.0;
    float _208 = 0.0;
    float _210 = _188;
    float _212 = _156;
    float _214 = _158;
    float _216 = _154;
    if (_204)
    {
        float _218 = rsqrt(_188);
        _208 = _218;
    }
    float _220 = _208;
    float _222 = 0.0;
    if (!_204)
    {
        _222 = 0.0;
    }
    float _224 = _222;
    bool _226 = _202 > 0.0;
    float _228 = in.m_49.x;
    float _230 = in.m_49.y;
    float _232 = in.m_49.z;
    float _234 = 0.0;
    float _236 = _224;
    if (!_204)
    {
        _234 = 0.0;
    }
    float _238 = _234;
    float _240 = 0.0;
    float _242 = 0.0;
    float _244 = _238;
    if (!_206)
    {
        _240 = 0.0;
        _242 = 0.0;
    }
    float _246 = _240;
    float _248 = _242;
    float _250 = 0.0;
    float _252 = _246;
    float _254 = _248;
    if (_206)
    {
        float _256 = rsqrt(_192);
        _250 = _256;
    }
    float _258 = _250;
    if (!_172)
    {
        float _260 = _156 * _156;
        float _262 = _260 * 0.5;
        _210 = _262;
    }
    float _264 = _210;
    float _266 = 0.0;
    float _268 = _264;
    if (!_204)
    {
        _266 = 0.0;
    }
    float _270 = _266;
    float _272 = _270;
    if (!_172)
    {
        float _274 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _268 = _274;
    }
    float _276 = _268;
    float _278 = _198;
    float _280 = _276;
    if (_226)
    {
        float _282 = rsqrt(_198);
        _278 = _282;
    }
    float _284 = _278;
    float _286 = _220;
    if (_204)
    {
        float _288 = _220 * _158;
        _236 = _288;
    }
    float _290 = _236;
    if (_204)
    {
        float _292 = _220 * _150;
        _244 = _292;
    }
    float _294 = _244;
    if (_204)
    {
        float _296 = _220 * _174;
        _272 = _296;
    }
    float _298 = _272;
    float _300 = 0.0;
    float _302 = 0.0;
    if (!_226)
    {
        _300 = 0.0;
        _302 = 0.0;
    }
    float _304 = _300;
    float _306 = _302;
    float _308 = _306;
    float _310 = _304;
    if (!_206)
    {
        _286 = 0.0;
    }
    float _312 = _286;
    float _314 = 0.0;
    float _316 = _312;
    if (!_226)
    {
        _314 = 0.0;
    }
    float _318 = _314;
    float _320 = _318;
    if (_206)
    {
        float _322 = _258 * _160;
        _316 = _322;
    }
    float _324 = _316;
    if (_206)
    {
        float _326 = _258 * _152;
        _252 = _326;
    }
    float _328 = _252;
    if (_206)
    {
        float _330 = _258 * _176;
        _254 = _330;
    }
    float _332 = _254;
    if (_226)
    {
        float _334 = _284 * _162;
        _308 = _334;
    }
    float _336 = _308;
    if (_226)
    {
        float _338 = _284 * _154;
        _310 = _338;
    }
    float _340 = _310;
    if (_226)
    {
        float _342 = _284 * _178;
        _320 = _342;
    }
    float _344 = _320;
    bool _346 = !_172;
    if (!_346)
    {
        float _348 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _350 = log2(_348);
        float _352 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _354 = _352 + 1.0;
        float _356 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _358 = _156 * _350;
        float _360 = 1.0 / _354;
        float _362 = _356 * 0.693147182464599609375;
        float _364 = exp2(_358);
        float _366 = 1.0 / _362;
        float _368 = _364 + (-1.0);
        float _370 = -_368;
        float _372 = fma(_370, _366, _156);
        float _374 = _372 * _360;
        float _376 = _374 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _280 = _376;
    }
    float _378 = _280;
    float _380 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _382 = !_172;
    float _384 = _380;
    float _386 = _378;
    if (!_382)
    {
        float _388 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _390 = log2(_388);
        float _392 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _394 = _392 + 1.0;
        float _396 = 1.0 / _394;
        float _398 = _156 * _390;
        float _400 = exp2(_398);
        float _402 = -_400;
        float _404 = _402 + 1.0;
        float _406 = _404 * _396;
        _212 = _406;
    }
    float _408 = _212;
    float _410 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _412 = _380 * _294;
    float _414 = _380 * _328;
    float _416 = _380 * _340;
    if (!_172)
    {
        float _418 = _128 * _128;
        float _420 = _418 * 0.5;
        _384 = _420;
    }
    float _422 = _384;
    float _424 = fma(_410, _290, _412);
    float _426 = fma(_410, _324, _414);
    float _428 = fma(_410, _336, _416);
    float _430 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_172)
    {
        float _432 = _422 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _386 = _432;
    }
    float _434 = _386;
    bool _436 = !_172;
    float _438 = _434;
    if (!_436)
    {
        float _440 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _442 = log2(_440);
        float _444 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _446 = _444 + 1.0;
        float _448 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _450 = _128 * _442;
        float _452 = 1.0 / _446;
        float _454 = _448 * 0.693147182464599609375;
        float _456 = exp2(_450);
        float _458 = 1.0 / _454;
        float _460 = _456 + (-1.0);
        float _462 = -_460;
        float _464 = fma(_462, _458, _128);
        float _466 = _464 * _452;
        float _468 = _466 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _438 = _468;
    }
    float _470 = _438;
    float _472 = _470 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _474 = fma(_430, _298, _424);
    float _476 = fma(_430, _332, _426);
    float _478 = fma(_430, _344, _428);
    float _480 = _470 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _482 = _472 * _328;
    float _484 = _472 * _294;
    float _486 = _472 * _340;
    float _488 = _470 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _490 = fma(_480, _324, _482);
    float _492 = fma(_480, _290, _484);
    float _494 = fma(_480, _336, _486);
    float _496 = fma(_408, _230, _476);
    float _498 = fma(_488, _332, _490);
    float _500 = _490;
    if (!_172)
    {
        _500 = _128;
    }
    float _502 = _500;
    bool _504 = !_172;
    float _506 = _502;
    if (!_504)
    {
        float _508 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _510 = log2(_508);
        float _512 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _514 = _512 + 1.0;
        float _516 = 1.0 / _514;
        float _518 = _128 * _510;
        float _520 = exp2(_518);
        float _522 = -_520;
        float _524 = _522 + 1.0;
        float _526 = _524 * _516;
        _506 = _526;
    }
    float _528 = _506;
    float _530 = fma(_488, _298, _492);
    float _532 = fma(_528, _230, _498);
    float _534 = fma(_488, _344, _494);
    float _536 = fma(_408, _228, _474);
    float _538 = fma(_528, _228, _530);
    float _540 = -_532;
    float _542 = _496 + _540;
    float _544 = fma(_408, _232, _478);
    float _546 = fma(_528, _232, _534);
    float _548 = -_538;
    float _550 = _536 + _548;
    float _552 = _542 * _542;
    float _554 = in.m_57.w;
    float _556 = -_546;
    float _558 = _544 + _556;
    float _560 = _542 * _160;
    float _562 = fma(_550, _550, _552);
    float _564 = _542 * _152;
    float _566 = _542 * _176;
    float _568 = fma(_550, _158, _560);
    float _570 = fma(_558, _558, _562);
    float _572 = fma(_550, _150, _564);
    float _574 = in.m_44.x;
    float _576 = in.m_44.y;
    float _578 = in.m_44.z;
    float _580 = fma(_558, _162, _568);
    float _582 = fma(_550, _174, _566);
    float _584 = fma(_558, _154, _572);
    float _586 = sqrt(_570);
    float _588 = fma(_558, _178, _582);
    bool _590 = _586 >= 9.9999999747524270787835121154785e-07;
    bool _592 = isnan(_586);
    bool _594 = _590 || _592;
    bool _596 = isnan(9.9999999747524270787835121154785e-07);
    bool _598 = _594 || _596;
    float _600 = fma(_536, _554, _574);
    float _602 = fma(_496, _554, _576);
    float _604 = fma(_544, _554, _578);
    float _606 = _554;
    float _608 = _588;
    float _610 = _580;
    float _612 = _580;
    float _614 = _588;
    if (_598)
    {
        _606 = _584;
    }
    float _616 = _606;
    float _618 = _616;
    float _620 = _616;
    if (!_598)
    {
        bool _622 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _624 = !_622;
        if (!_624)
        {
            float _626 = _328 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _628 = _294 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _630 = _340 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _632 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[16].x, _626);
            float _634 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[16].x, _628);
            float _636 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[16].x, _630);
            float _638 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[16].z, _632);
            float _640 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[16].z, _634);
            float _642 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[16].z, _636);
            float _644 = _638 * _152;
            float _646 = _638 * _160;
            float _648 = _638 * _176;
            float _650 = fma(_640, _150, _644);
            float _652 = fma(_640, _158, _646);
            float _654 = fma(_640, _174, _648);
            float _656 = fma(_642, _154, _650);
            float _658 = fma(_642, _162, _652);
            float _660 = fma(_642, _178, _654);
            float _662 = _656 * _656;
            float _664 = fma(_658, _658, _662);
            float _666 = fma(_660, _660, _664);
            float _668 = rsqrt(_666);
            float _670 = _668 * 9.9999999747524270787835121154785e-07;
            float _672 = _658 * _670;
            float _674 = _656 * _670;
            float _676 = _660 * _670;
            _620 = _674;
            _612 = _672;
            _614 = _676;
            _678 = true;
        }
        else
        {
            float _680 = _230 * _230;
            float _682 = fma(_228, _228, _680);
            float _684 = fma(_232, _232, _682);
            float _686 = sqrt(_684);
            bool _688 = _686 >= 9.9999999747524270787835121154785e-07;
            bool _690 = isnan(_686);
            bool _692 = _688 || _690;
            bool _694 = isnan(9.9999999747524270787835121154785e-07);
            bool _696 = _692 || _694;
            if (!_696)
            {
                float _698 = _576 * _576;
                float _700 = fma(_574, _574, _698);
                float _702 = fma(_578, _578, _700);
                float _704 = sqrt(_702);
                bool _706 = _704 >= 9.9999999747524270787835121154785e-07;
                bool _708 = isnan(_704);
                bool _710 = _706 || _708;
                bool _712 = isnan(9.9999999747524270787835121154785e-07);
                bool _714 = _710 || _712;
                float _716 = _192;
                if (!_714)
                {
                    float _718 = rsqrt(_192);
                    _716 = _718;
                }
                float _720 = _716;
                if (!_714)
                {
                    float _722 = _720 * 9.9999999747524270787835121154785e-07;
                    _608 = _722;
                }
                float _724 = _608;
                float _726 = _724;
                if (!_714)
                {
                    float _728 = _160 * _724;
                    _610 = _728;
                }
                float _730 = _610;
                _612 = _730;
                if (!_714)
                {
                    float _732 = _152 * _724;
                    _618 = _732;
                }
                float _734 = _618;
                _620 = _734;
                if (!_714)
                {
                    float _736 = _176 * _724;
                    _726 = _736;
                }
                float _738 = _726;
                bool _740 = !_714;
                _614 = _738;
                _678 = _740;
                if (!_678)
                {
                    float _742 = _152 * _576;
                    float _744 = _160 * _576;
                    float _746 = _176 * _576;
                    float _748 = fma(_150, _574, _742);
                    float _750 = fma(_158, _574, _744);
                    float _752 = fma(_174, _574, _746);
                    float _754 = fma(_154, _578, _748);
                    float _756 = fma(_162, _578, _750);
                    float _758 = fma(_178, _578, _752);
                    float _760 = _754 * _754;
                    float _762 = fma(_756, _756, _760);
                    float _764 = fma(_758, _758, _762);
                    float _766 = rsqrt(_764);
                    float _768 = _766 * 9.9999999747524270787835121154785e-07;
                    float _770 = _756 * _768;
                    float _772 = _754 * _768;
                    float _774 = _758 * _768;
                    _620 = _772;
                    _612 = _770;
                    _614 = _774;
                    _678 = true;
                }
            }
            else
            {
                float _776 = _152 * _230;
                float _778 = _160 * _230;
                float _780 = _176 * _230;
                float _782 = fma(_150, _228, _776);
                float _784 = fma(_158, _228, _778);
                float _786 = fma(_174, _228, _780);
                float _788 = fma(_154, _232, _782);
                float _790 = fma(_162, _232, _784);
                float _792 = fma(_178, _232, _786);
                float _794 = _788 * _788;
                float _796 = fma(_790, _790, _794);
                float _798 = fma(_792, _792, _796);
                float _800 = rsqrt(_798);
                float _802 = _800 * 9.9999999747524270787835121154785e-07;
                float _804 = _790 * _802;
                float _806 = _788 * _802;
                float _808 = _792 * _802;
                _620 = _806;
                _612 = _804;
                _614 = _808;
            }
        }
    }
    _678 = false;
    float _810 = _620;
    float _812 = _612;
    float _814 = _614;
    bool _816 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _818 = !_816;
    float _820 = _810;
    float _822 = _812;
    float _824 = _814;
    float _842;
    if (!_818)
    {
        float _826 = in.m_59.x;
        float _828 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _830 = _826 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _832 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _834 = _832 * _828;
        float _836 = floor(_834);
        float _838 = -_836;
        float _840 = _834 + _838;
        _842 = _840;
        _844 = true;
    }
    else
    {
        float _846 = float(_94);
        float _848 = 1.0 / _846;
        float _850 = _128 * _848;
        _842 = _850;
    }
    _844 = false;
    float _852 = _842;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _856 = _852 + _854;
    bool _858 = _852 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _860 = isnan(_852);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _866 = _862 || _864;
    float _868 = float(_866);
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _872 = _852 + _870;
    bool _874 = _852 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _876 = isnan(_852);
    bool _878 = _874 || _876;
    bool _880 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _882 = _878 || _880;
    float _884 = float(_882);
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _886;
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _892 = _890 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _894 = _852 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _896 = isnan(_852);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = -_868;
    float _908 = _906 + 1.0;
    float _910 = 1.0 / _892;
    float _912 = _904 * _908;
    float _914 = -_904;
    float _916 = _914 + 1.0;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _918;
    bool _922 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _924 = 1.0 / _888;
    float _926 = _884 * _916;
    float _928 = -_884;
    float _930 = _928 + 1.0;
    float _932 = _872 * _910;
    float _934 = _856 * _924;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _936;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _940;
    float _944 = fma(_920, _934, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _946 = fma(_938, _934, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _948 = fma(_942, _934, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _950 = in.m_57.x;
    float _952 = in.m_57.y;
    float _954 = in.m_57.z;
    float _956 = _944 * _926;
    float _958 = _946 * _926;
    float _960 = _948 * _926;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _964 = _962 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _972 = _970 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _974 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[143].x, _956);
    float _976 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[143].y, _958);
    float _978 = fma(_964, _932, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _980 = fma(_968, _932, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _982 = fma(_972, _932, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _984 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[143].z, _960);
    float _986 = fma(_978, _912, _974);
    float _988 = fma(_980, _912, _976);
    float _990 = fma(_982, _912, _984);
    float _992 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[145].x, _986);
    float _994 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[145].y, _988);
    float _996 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[145].z, _990);
    float _998 = _992 * _950;
    float _1000 = _994 * _952;
    float _1002 = _996 * _954;
    bool _1004 = !_922;
    float _1006 = _872;
    float _1008 = _998;
    float _1026;
    if (!_1004)
    {
        float _1010 = in.m_59.x;
        float _1012 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _1014 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _1016 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _1018 = _1016 * _1012;
        float _1020 = floor(_1018);
        float _1022 = -_1020;
        float _1024 = _1018 + _1022;
        _1026 = _1024;
        _1028 = true;
    }
    else
    {
        float _1030 = float(_94);
        float _1032 = 1.0 / _1030;
        float _1034 = _128 * _1032;
        _1026 = _1034;
    }
    _1028 = false;
    float _1036 = _1026;
    float _1038 = _810 * _810;
    float _1040 = _602 * _152;
    float _1042 = _602 * _176;
    float _1044 = in.m_59.w;
    float _1046 = fma(_812, _812, _1038);
    float _1048 = fma(_600, _150, _1040);
    float _1050 = fma(_600, _174, _1042);
    float _1052 = fma(_814, _814, _1046);
    float _1054 = _602 * _160;
    float _1056 = fma(_604, _154, _1048);
    float _1058 = fma(_604, _178, _1050);
    float _1060 = rsqrt(_1052);
    float _1062 = fma(_600, _158, _1054);
    float _1064 = _1056 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1066 = _1058 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1068 = fma(_604, _162, _1062);
    float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1072 = _1064 + _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1076 = _1066 + _1074;
    float _1078 = _998 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1080 = _1068 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1082 = _1072 * _1072;
    float _1084 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1084;
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1090 = _1088 != 0;
    float _1092 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1094 = _1080 + _1092;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1098 = _1036 + _1096;
    float _1100 = _1060 * _810;
    float _1102 = fma(_1094, _1094, _1082);
    float _1104 = _1060 * _812;
    float _1106 = _1060 * _814;
    float _1108 = _1100 * _328;
    float _1110 = fma(_1076, _1076, _1102);
    float _1112 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1114 = _1044 > 0.5;
    float _1116 = fma(_1104, _324, _1108);
    float _1118 = in.m_61.x;
    float _1120 = in.m_61.y;
    float _1122 = in.m_61.z;
    float _1124 = 1.0 / _1086;
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1128 = _1126 != 0;
    float _1130 = fma(_1106, _332, _1116);
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1134 = _1132 != 0;
    float _1136 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1140 = _1138 != 0;
    float _1142 = in.m_63.x;
    float _1144 = abs(_1130);
    bool _1146 = _1144 > 0.99989998340606689453125;
    float _1148 = rsqrt(_1110);
    float _1150 = in.m_63.y;
    float _1152 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    bool _1154 = _1036 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1156 = isnan(_1036);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1162 = _1158 || _1160;
    float _1164 = float(_1162);
    float _1166 = _1098 * _1124;
    float _1168 = 0.0;
    bool _1170 = _1114;
    bool _1172 = _1140;
    float _1174 = _1142;
    float _1176 = _1052;
    if (_1134)
    {
        float _1178 = in.m_59.z;
        _1168 = _1178;
    }
    float _1180 = _1168;
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1182;
    bool _1186 = _1036 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1188 = isnan(_1036);
    bool _1190 = _1186 || _1188;
    bool _1192 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1194 = _1190 || _1192;
    float _1196 = float(_1194);
    float _1198 = -_1164;
    float _1200 = _1198 + 1.0;
    if (!_1146)
    {
        _1006 = _324;
    }
    float _1202 = _1006;
    float _1204 = _1202;
    if (_1146)
    {
        float _1206 = fma(_336, 0.001000000047497451305389404296875, _324);
        _1204 = _1206;
    }
    float _1208 = _1204;
    float _1210 = 0.0;
    if (!_1146)
    {
        _1210 = _328;
    }
    float _1212 = _1210;
    float _1214 = _1112 * _1148;
    float _1216 = _1212;
    if (!_1146)
    {
        _1008 = _332;
    }
    float _1218 = _1008;
    float _1220 = _1218;
    if (_1146)
    {
        float _1222 = fma(_340, 0.001000000047497451305389404296875, _328);
        _1216 = _1222;
    }
    float _1224 = _1216;
    if (_1146)
    {
        float _1226 = fma(_344, 0.001000000047497451305389404296875, _332);
        _1220 = _1226;
    }
    float _1228 = _1220;
    int _1230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1232 = _1230 != 0;
    float _1234 = _1072 * _1214;
    float _1236 = _1094 * _1214;
    float _1238 = _1076 * _1214;
    float _1240 = -_1228;
    float _1242 = _1100 * _1240;
    float _1244 = -_1234;
    float _1246 = _1072 + _1244;
    float _1248 = -_1236;
    float _1250 = _1094 + _1248;
    float _1252 = -_1238;
    float _1254 = _1076 + _1252;
    float _1256 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1122);
    float _1258 = _1246 * _1246;
    float _1260 = -_1224;
    float _1262 = _1104 * _1260;
    float _1264 = -_1224;
    float _1266 = -_1242;
    float _1268 = fma(_1106, _1264, _1266);
    float _1270 = in.m_59.y;
    float _1272 = fma(_1250, _1250, _1258);
    float _1274 = -_1208;
    float _1276 = _1106 * _1274;
    float _1278 = -_1208;
    float _1280 = -_1262;
    float _1282 = fma(_1100, _1278, _1280);
    float _1284 = in.m_59.x;
    float _1286 = fma(_1254, _1254, _1272);
    float _1288 = -_1228;
    float _1290 = -_1276;
    float _1292 = fma(_1104, _1288, _1290);
    float _1294 = -_1150;
    float _1296 = _1294 + 1.0;
    float _1298 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1120);
    float _1300 = sqrt(_1286);
    float _1302 = _1292 * _1292;
    float _1304 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1118);
    int _1306 = _1114 ? as_type<int>(_1296) : as_type<int>(_1150);
    float _1308 = fma(_1268, _1268, _1302);
    float _1310 = _1286;
    float _1312 = _1180;
    float _1314 = _1150;
    if (_1134)
    {
        bool _1316 = _1180 > 0.5;
        _1170 = _1316;
    }
    bool _1318 = _1170;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1320;
    float _1324 = _1140 ? as_type<float>(_1306) : _1150;
    float _1326 = fma(_1282, _1282, _1308);
    float _1328 = fma(_1322, _1166, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    if (!_1128)
    {
        _1310 = _1142;
    }
    float _1330 = _1310;
    int _1332 = 0;
    float _1334 = _1330;
    if (_1134)
    {
        float _1336 = -_1142;
        float _1338 = _1336 + 1.0;
        _1332 = as_type<int>(_1338);
    }
    int _1340 = _1332;
    float _1342 = rsqrt(_1326);
    if (!_1090)
    {
        _1312 = _1270;
    }
    float _1344 = _1312;
    float _1346 = _1148 * _1300;
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1348;
    float _1352 = _1152 * _1284;
    float _1354 = _1344;
    if (_1128)
    {
        bool _1356 = _1284 > 0.5;
        _1172 = _1356;
    }
    bool _1358 = _1172;
    float _1360 = _1136 * _1346;
    if (_1090)
    {
        _1354 = _1284;
    }
    float _1362 = _1354;
    float _1364 = fma(_1350, _1166, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1366 = _1078 * _1346;
    float _1368 = trunc(_1352);
    int _1370 = int(_1368);
    float _1372 = fma(_1184, _1166, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1374 = _1360 * _1256;
    float _1376 = _1366 * _1304;
    float _1378 = _1282 * _1342;
    float _1380 = _1000 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1382 = _1268 * _1342;
    float _1384 = _1292 * _1342;
    float _1386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1388 = _1380 * _1346;
    float _1390 = _1104 * _1384;
    float _1392 = _1380;
    if (!_1090)
    {
        float _1394 = in.m_59.z;
        _1392 = _1394;
    }
    float _1396 = _1392;
    float _1398 = _1388 * _1298;
    float _1400 = _1100 * _1378;
    float _1402 = -_1390;
    float _1404 = fma(_1100, _1382, _1402);
    float _1406 = -_1196;
    float _1408 = _1406 + 1.0;
    float _1410 = _1398 * _1104;
    float _1412 = _1398 * _1106;
    float _1414 = -_1400;
    float _1416 = fma(_1106, _1384, _1414);
    int _1418 = _1370 << 4;
    int _1420 = _1418 + 1968;
    float _1422 = fma(_1376, _1382, _1410);
    float _1424 = fma(_1376, _1378, _1412);
    float _1426 = _1164 * _1408;
    float _1428 = _1386 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1430 = fma(_1374, _1416, _1422);
    float _1432 = fma(_1374, _1404, _1424);
    int _1434 = _1420 + 8;
    uint _1437 = uint(int(uint(_1434) >> uint(2)));
    uint _1439 = uint(int(uint(int(_1437)) >> uint(2)));
    int _1441 = int(_1437) & 3;
    float _1443 = (*spvDescriptorSet0.vp_c9)._m0[int(_1439)][_1441];
    float _1445 = fma(_1428, _1324, -0.5);
    float _1447 = _1080 + _1430;
    float _1449 = _1066 + _1432;
    float _1451 = _1364 * _1426;
    float _1453 = _1328 * _1426;
    float _1455 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1457 = _1447 + _1455;
    float _1459 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1461 = _1449 + _1459;
    uint _1463 = uint(int(uint(_1420) >> uint(2)));
    uint _1465 = uint(int(uint(int(_1463)) >> uint(2)));
    int _1467 = int(_1463) & 3;
    float _1469 = (*spvDescriptorSet0.vp_c9)._m0[int(_1465)][_1467];
    int _1471 = int(_1463) + 1;
    uint _1473 = uint(int(uint(_1471) >> uint(2)));
    int _1475 = _1471 & 3;
    float _1477 = (*spvDescriptorSet0.vp_c9)._m0[int(_1473)][_1475];
    float _1479 = _1432;
    float _1481 = _1396;
    int _1483 = as_type<int>(_1426);
    float _1485 = _1447;
    float _1487 = _1449;
    if (!_1090)
    {
        _1479 = _1396;
    }
    float _1489 = _1479;
    float _1491 = _1457 * _1457;
    float _1493 = _1461 * _1461;
    float _1495 = _1489;
    float _1497 = _1491;
    float _1499 = _1493;
    if (_1090)
    {
        _1495 = _1270;
    }
    float _1501 = _1495;
    float _1503 = _1372 * _1426;
    if (_1090)
    {
        _1481 = _1270;
    }
    float _1505 = _1481;
    float _1507 = _1491 + _1493;
    bool _1509 = _1270 > 0.5;
    float _1511 = _1106 * _1382;
    float _1513 = sqrt(_1507);
    if (_1128)
    {
        float _1515 = -_1142;
        float _1517 = _1515 + 1.0;
        _1483 = as_type<int>(_1517);
    }
    int _1519 = _1483;
    float _1521 = -_1511;
    float _1523 = fma(_1104, _1378, _1521);
    float _1525 = _1398 * _1100;
    float _1527 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1529 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1451);
    if (_1128)
    {
        float _1531 = _1358 ? as_type<float>(_1519) : _1142;
        _1334 = _1531;
    }
    float _1533 = _1334;
    float _1535 = fma(_1376, _1384, _1525);
    float _1537 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1527);
    float _1539 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1541 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1543 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1545 = fma(_1374, _1523, _1535);
    float _1547 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1549 = _1513 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1551 = -_1543;
    float _1553 = fma(_1541, 2.0, _1551);
    if (_1134)
    {
        float _1555 = _1318 ? as_type<float>(_1340) : _1142;
        _1174 = _1555;
    }
    float _1557 = _1174;
    float _1559 = fma(_1505, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1547);
    float _1561 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1453);
    float _1563 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1503);
    float _1565 = _1064 + _1545;
    bool _1567 = !_1549;
    float _1569 = _1565;
    if (!_1567)
    {
        float _1571 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1573 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1575 = _1513 + _1573;
        float _1577 = rsqrt(_1507);
        float _1579 = _1575 * _1571;
        float _1581 = _1565 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1583 = _1579 * 0.15915493667125701904296875;
        float _1585 = _1583 * 6.283185482025146484375;
        float _1587 = sin(_1585);
        float _1589 = _1583 * 6.283185482025146484375;
        float _1591 = cos(_1589);
        float _1593 = fma(_1587, _1581, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1595 = _1577 * _1593;
        float _1597 = fma(_1457, _1595, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1599 = _1591 + (-1.0);
        float _1601 = fma(_1461, _1595, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1603 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1605 = _1597 + _1603;
        float _1607 = _1599 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1609 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1611 = _1601 + _1609;
        float _1613 = _1605 * _1605;
        float _1615 = fma(_1565, _1591, _1607);
        float _1617 = _1611 * _1611;
        _1569 = _1615;
        _1497 = _1613;
        _1499 = _1617;
        _1485 = _1597;
        _1487 = _1601;
    }
    float _1619 = _1569;
    float _1621 = _1497;
    float _1623 = _1499;
    float _1625 = _1485;
    float _1627 = _1487;
    if (_1232)
    {
        float _1629 = _1509 ? _1296 : _1150;
        _1314 = _1629;
    }
    float _1631 = _1314;
    float _1633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1635 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1637 = _1619 + _1635;
    float _1639 = _1539 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1641 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1643 = _1501 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1645 = fma(_1637, _1637, _1621);
    float _1647 = fma(_1639, _1557, -0.5);
    float _1649 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1537);
    float _1651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1653 = fma(_1643, -2.0, _1641);
    float _1655 = -_128;
    float _1657 = fma(_1655, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1553);
    float _1659 = _1645 + _1623;
    float _1661 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1561);
    float _1663 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1559);
    float _1665 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1653);
    float _1667 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1529);
    float _1669 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1563);
    float _1671 = fma(_1649, _1647, _1657);
    float _1673 = _1533 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1675 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1677 = -_1665;
    float _1679 = fma(_1663, _1445, _1677);
    float _1681 = _1469 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1683 = _1443 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1685 = sqrt(_1659);
    float _1687 = _1673 * _1633;
    float _1689 = _1675 * _1651;
    float _1691 = _1477 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1693 = _1661 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1695 = _1667 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1697 = _1669 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1699 = _1681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1701 = _1683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1703 = _1671 + 0.5;
    float _1705 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1707 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1709 = _1693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1711 = _1695 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1713 = _1697 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1715 = _1679 + 0.5;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    bool _1717 = _1685 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1719 = isnan(_1685);
    bool _1721 = _1717 || _1719;
    bool _1723 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1725 = _1721 || _1723;
    out.m_67.x = _1699;
    out.m_67.y = _1707;
    out.m_67.z = _1701;
    out.m_69.x = _1709;
    out.m_69.y = _1711;
    out.m_69.z = _1713;
    out.m_69.w = _1705;
    out.m_71.x = _1687;
    out.m_71.y = _1689;
    out.m_71.z = _1703;
    out.m_71.w = _1715;
    float _1727 = _1679;
    float _1729 = _1713;
    if (!_1725)
    {
        _1727 = 1.0;
    }
    float _1731 = _1727;
    bool _1733 = !_1725;
    float _1735 = _1731;
    if (!_1733)
    {
        bool _1737 = _1685 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1739 = isnan(_1685);
        bool _1741 = _1737 || _1739;
        bool _1743 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1745 = _1741 || _1743;
        if (!_1745)
        {
            float _1747 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1749 = _1685 + _1747;
            float _1751 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1753 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1751;
            float _1755 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1757 = _1755 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1759 = 1.0 / _1753;
            float _1761 = _1749 * _1759;
            float _1763 = fma(_1761, _1757, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1735 = _1763;
            _1765 = true;
        }
        else
        {
            bool _1767 = _1685 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1769 = isnan(_1685);
            bool _1771 = _1767 || _1769;
            bool _1773 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1775 = _1771 || _1773;
            if (!_1775)
            {
                float _1777 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1779 = _1685 + _1777;
                float _1781 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1783 = _1781 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1785 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1787 = _1785 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1789 = 1.0 / _1783;
                float _1791 = _1779 * _1789;
                float _1793 = fma(_1791, _1787, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1735 = _1793;
                _1765 = true;
            }
            else
            {
                _1735 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1765 = false;
    float _1795 = _1735;
    float _1797 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1799 = _1619 + _1797;
    float _1801 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1803 = _1625 + _1801;
    float _1805 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1807 = _1627 + _1805;
    float _1809 = fma(_1799, _1795, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1811 = fma(_1803, _1795, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1813 = fma(_1807, _1795, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1815 = -_1064;
    float _1817 = _1815 + _1809;
    float _1819 = -_1080;
    float _1821 = _1819 + _1811;
    float _1823 = -_1066;
    float _1825 = _1823 + _1813;
    float _1827 = _1817 * _1817;
    float _1829 = fma(_1821, _1821, _1827);
    float _1831 = fma(_1825, _1825, _1829);
    float _1833 = sqrt(_1831);
    bool _1835 = _1833 > 0.0;
    bool _1837 = !_1835;
    float _1839 = _1829;
    float _1841 = _1833;
    float _1843 = _1811;
    float _1845 = _1809;
    float _1847 = _1813;
    if (!_1837)
    {
        bool _1849 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1851 = _1689;
        if (_1849)
        {
            float _1853 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1851 = _1853;
        }
        float _1855 = _1851;
        if (_1849)
        {
            float _1857 = _1855 * _812;
            _1729 = _1857;
        }
        float _1859 = _1729;
        float _1861 = _1859;
        if (_1849)
        {
            float _1863 = _1855 * _810;
            _1839 = _1863;
        }
        float _1865 = _1839;
        float _1867 = _1865;
        if (_1849)
        {
            float _1869 = _1855 * _814;
            _1841 = _1869;
        }
        float _1871 = _1841;
        float _1873 = _1871;
        if (!_1849)
        {
            float _1875 = _128 + 1.0;
            if (!_172)
            {
                float _1877 = _1875 * _1875;
                float _1879 = _1877 * 0.5;
                _130 = _1879;
            }
            float _1881 = _130;
            float _1883 = _1881;
            if (!_172)
            {
                float _1885 = _1881 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1883 = _1885;
            }
            float _1887 = _1883;
            bool _1889 = !_172;
            float _1891 = _1887;
            if (!_1889)
            {
                float _1893 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1895 = log2(_1893);
                float _1897 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1899 = _1897 + 1.0;
                float _1901 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1903 = _1895 * _1875;
                float _1905 = 1.0 / _1899;
                float _1907 = _1901 * 0.693147182464599609375;
                float _1909 = exp2(_1903);
                float _1911 = 1.0 / _1907;
                float _1913 = _1909 + (-1.0);
                float _1915 = -_1913;
                float _1917 = fma(_1915, _1911, _1875);
                float _1919 = _1917 * _1905;
                float _1921 = _1919 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1891 = _1921;
            }
            float _1923 = _1891;
            float _1925 = _1923 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _1927 = _1923 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1929 = _1923 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1931 = _1923;
            if (!_172)
            {
                _1931 = _1875;
            }
            float _1933 = _1931;
            float _1935 = _1925 * _328;
            float _1937 = _1925 * _294;
            float _1939 = _1925 * _340;
            float _1941 = fma(_1927, _324, _1935);
            float _1943 = fma(_1927, _290, _1937);
            float _1945 = fma(_1929, _332, _1941);
            bool _1947 = !_172;
            float _1949 = _1933;
            if (!_1947)
            {
                float _1951 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1953 = log2(_1951);
                float _1955 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1957 = _1955 + 1.0;
                float _1959 = 1.0 / _1957;
                float _1961 = _1953 * _1875;
                float _1963 = exp2(_1961);
                float _1965 = -_1963;
                float _1967 = _1965 + 1.0;
                float _1969 = _1967 * _1959;
                _1949 = _1969;
            }
            float _1971 = _1949;
            float _1973 = fma(_1927, _336, _1939);
            float _1975 = fma(_1929, _298, _1943);
            float _1977 = fma(_1971, _230, _1945);
            float _1979 = fma(_1929, _344, _1973);
            float _1981 = fma(_1971, _228, _1975);
            float _1983 = -_532;
            float _1985 = _1983 + _1977;
            float _1987 = fma(_1971, _232, _1979);
            float _1989 = -_538;
            float _1991 = _1989 + _1981;
            float _1993 = _1985 * _152;
            float _1995 = _1985 * _160;
            float _1997 = -_546;
            float _1999 = _1997 + _1987;
            float _2001 = _1985 * _176;
            float _2003 = fma(_1991, _150, _1993);
            float _2005 = fma(_1991, _158, _1995);
            float _2007 = fma(_1991, _174, _2001);
            float _2009 = fma(_1999, _154, _2003);
            float _2011 = fma(_1999, _162, _2005);
            float _2013 = fma(_1999, _178, _2007);
            float _2015 = _2009 * _2009;
            float _2017 = fma(_2011, _2011, _2015);
            float _2019 = fma(_2013, _2013, _2017);
            _1176 = _2019;
            _820 = _2009;
            _822 = _2011;
            _824 = _2013;
            _1861 = _2011;
            _1867 = _2009;
            _1873 = _2013;
        }
        float _2021 = _1176;
        float _2023 = _820;
        float _2025 = _822;
        float _2027 = _824;
        float _2029 = _1861;
        float _2031 = _1867;
        float _2033 = _1873;
        float _2035 = sqrt(_2021);
        float _2037 = rsqrt(_1831);
        bool _2039 = _2035 > 0.0;
        float _2041 = _1821 * _2037;
        float _2043 = _1817 * _2037;
        float _2045 = _1825 * _2037;
        bool _2047 = !_2039;
        if (!_2047)
        {
            float _2049 = rsqrt(_2021);
            float _2051 = _2049 * _2023;
            float _2053 = _2049 * _2025;
            float _2055 = _2043 * _2051;
            float _2057 = _2049 * _2027;
            float _2059 = fma(_2041, _2053, _2055);
            float _2061 = fma(_2045, _2057, _2059);
            float _2063 = _2061 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2065 = fma(_2029, _2063, _1811);
            float _2067 = fma(_2031, _2063, _1809);
            float _2069 = fma(_2033, _2063, _1813);
            _1843 = _2065;
            _1845 = _2067;
            _1847 = _2069;
        }
    }
    float _2071 = _1843;
    float _2073 = _1845;
    float _2075 = _1847;
    float _2077 = -_1236;
    float _2079 = _2077 + _2071;
    float _2081 = -_1234;
    float _2083 = _2081 + _2073;
    float _2085 = -_1238;
    float _2087 = _2085 + _2075;
    bool _2089 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2091 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2093 = _2089 || _2091;
    bool _2095 = isnan(0.5);
    bool _2097 = _2093 || _2095;
    float _2099 = _2083;
    float _2101 = _2079;
    float _2103 = _2087;
    if (!_2097)
    {
        float _2105 = -_1234;
        float _2107 = _1064 + _2105;
        float _2109 = -_1236;
        float _2111 = _1080 + _2109;
        float _2113 = -_1238;
        float _2115 = _1066 + _2113;
        float _2117 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2119 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2121 = _2107 + _2119;
        float _2123 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2125 = _2111 + _2123;
        float _2127 = -_1066;
        float _2129 = _2127 + _2075;
        float _2131 = -_1080;
        float _2133 = _2131 + _2071;
        float _2135 = _2121 * _2121;
        float _2137 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2139 = _2115 + _2137;
        float _2141 = -_1064;
        float _2143 = _2141 + _2073;
        float _2145 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2147 = fma(_2125, _2125, _2135);
        float _2149 = fma(_2139, _2139, _2147);
        float _2151 = 1.0 / _1346;
        float _2153 = sqrt(_2149);
        float _2155 = _2145 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2157 = precise::min(_2153, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2159 = _2157 * _2117;
        float _2161 = _2159 * _2151;
        float _2163 = _2155 * _2161;
        float _2165 = _2129 * _2161;
        float _2167 = fma(_2133, _2163, _2111);
        float _2169 = fma(_2143, _2163, _2107);
        float _2171 = fma(_2155, _2165, _2115);
        _2099 = _2169;
        _2101 = _2167;
        _2103 = _2171;
    }
    float _2173 = _2099;
    float _2175 = _2101;
    float _2177 = _2103;
    float _2179 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2181 = _2173 + _2179;
    float _2183 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2185 = _2175 + _2183;
    float _2187 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2189 = _2177 + _2187;
    float _2191 = _2181 * _2181;
    float _2193 = fma(_2185, _2185, _2191);
    float _2195 = fma(_2189, _2189, _2193);
    float _2197 = rsqrt(_2195);
    float _2199 = sqrt(_2195);
    float _2201 = _2197 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2203 = _2185 * _2201;
    float _2205 = _2189 * _2201;
    float _2207 = _2203 * _2203;
    float _2209 = _2205 * _2205;
    float _2211 = _2207 + _2209;
    float _2213 = sqrt(_2211);
    bool _2215 = _2213 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2217 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2219 = _2213 + _2217;
    float _2221 = _2197;
    float _2223 = _2211;
    float _2225 = _2219;
    float _2227 = _2181;
    if (_2215)
    {
        float _2229 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2221 = _2229;
    }
    float _2231 = _2221;
    if (_2215)
    {
        float _2233 = rsqrt(_2211);
        _2223 = _2233;
    }
    float _2235 = _2223;
    float _2237 = _2235;
    if (_2215)
    {
        float _2239 = _2219 * _2231;
        _2225 = _2239;
    }
    float _2241 = _2225;
    if (_2215)
    {
        float _2243 = _2241 * 0.15915493667125701904296875;
        _214 = _2243;
    }
    float _2245 = _214;
    float _2247 = _2189;
    float _2249 = _2245;
    if (_2215)
    {
        float _2251 = _2245 * 6.283185482025146484375;
        float _2253 = sin(_2251);
        _2247 = _2253;
    }
    float _2255 = _2247;
    float _2257 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2259 = precise::max(0.0, _2257);
    float _2261 = _2231;
    float _2263 = _2259;
    if (_2215)
    {
        float _2265 = _2245 * 6.283185482025146484375;
        float _2267 = cos(_2265);
        _2261 = _2267;
    }
    float _2269 = _2261;
    float _2271 = -_2201;
    float _2273 = -_2259;
    float _2275 = fma(_2181, _2271, _2273);
    if (_2215)
    {
        float _2277 = _2275 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2227 = _2277;
    }
    float _2279 = _2227;
    float _2281 = _2279;
    float _2283 = _2255;
    if (_2215)
    {
        float _2285 = fma(_2255, _2279, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2281 = _2285;
    }
    float _2287 = _2281;
    float _2289 = _2287;
    if (!_2215)
    {
        _2283 = _2203;
    }
    float _2291 = _2283;
    float _2293 = _2291;
    float _2295 = _2269;
    if (_2215)
    {
        float _2297 = _2269 + (-1.0);
        _2263 = _2297;
    }
    float _2299 = _2263;
    float _2301 = _2299;
    if (_2215)
    {
        float _2303 = _2235 * _2287;
        _216 = _2303;
    }
    float _2305 = _216;
    if (!_2215)
    {
        _2289 = _2275;
    }
    float _2307 = _2289;
    float _2309 = _2307;
    if (_2215)
    {
        float _2311 = _2299 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2249 = _2311;
    }
    float _2313 = _2249;
    if (_2215)
    {
        float _2315 = _2203 * _2305;
        _2293 = _2315;
    }
    float _2317 = _2293;
    if (!_2215)
    {
        _2301 = _2205;
    }
    float _2319 = _2301;
    float _2321 = _2319;
    if (_2215)
    {
        float _2323 = _2205 * _2305;
        _2321 = _2323;
    }
    float _2325 = _2321;
    if (!_2215)
    {
        _2237 = _2207;
    }
    float _2327 = _2237;
    float _2329 = _2327;
    if (_2215)
    {
        float _2331 = fma(_2275, _2269, _2313);
        _2309 = _2331;
    }
    float _2333 = _2309;
    if (_2215)
    {
        float _2335 = _2317 * _2317;
        _2329 = _2335;
    }
    float _2337 = _2329;
    if (!_2215)
    {
        _2295 = _2209;
    }
    float _2339 = _2295;
    float _2341 = _2339;
    if (_2215)
    {
        float _2343 = _2325 * _2325;
        _2341 = _2343;
    }
    float _2345 = _2341;
    float _2347 = fma(_2333, _2333, _2337);
    float _2349 = _2347 + _2345;
    float _2351 = _2173 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2353 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2355 = fma(_2199, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2353);
    float _2357 = precise::clamp(_2355, 0.0, 1.0);
    float _2359 = _2173 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2361 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2363 = fma(_2175, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2351);
    float _2365 = rsqrt(_2349);
    float _2367 = fma(_2175, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2359);
    float _2369 = -_2357;
    float _2371 = _2369 + 1.0;
    float _2373 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2363);
    float _2375 = _2173 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2377 = _2173 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2379 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2367);
    float _2381 = _2373 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2383 = fma(_2175, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2375);
    float _2385 = fma(_2175, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2377);
    float _2387 = _2379 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2389 = _2381 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2391 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2383);
    float _2393 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2385);
    float _2395 = abs(_2371);
    float _2397 = log2(_2395);
    float _2399 = -_2389;
    float _2401 = fma(_2399, _2361, 1.0);
    float _2403 = _2365 * _2317;
    float _2405 = _2391 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2407 = _2387 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2409 = _2365 * _2333;
    float _2411 = _2365 * _2325;
    float _2413 = _2393 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2415 = fma(_2405, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2407);
    float _2417 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2419 = log2(_2401);
    float _2421 = _2387 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2423 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2415);
    float _2425 = -_2417;
    float _2427 = fma(_2409, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2425);
    float _2429 = _2409 + 1.0;
    float _2431 = fma(_2413, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2423);
    float _2433 = -_2411;
    float _2435 = fma(_2433, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2427);
    float _2437 = _2397 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2439 = _2387 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2441 = 1.0 / _2431;
    float _2443 = fma(_2435, -0.5, 0.5);
    float _2445 = fma(_2435, 0.5, 0.5);
    float _2447 = fma(_2405, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2439);
    float _2449 = fma(_2405, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2421);
    float _2451 = fma(_2445, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2453 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2447);
    float _2455 = exp2(_2437);
    float _2457 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2449);
    float _2459 = fma(_2445, _2451, -0.212114393711090087890625);
    float _2461 = fma(_2413, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2453);
    float _2463 = fma(_2413, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2457);
    float _2465 = _2419 * 0.693147182464599609375;
    float _2467 = fma(_2445, _2459, 1.570728778839111328125);
    float _2469 = sqrt(_2443);
    float _2471 = _2461 * _2441;
    float _2473 = _2463 * _2441;
    float _2475 = _2465 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2477 = fma(_2471, 0.5, 0.5);
    float _2479 = fma(_2473, -0.5, 0.5);
    float _2481 = -_2409;
    float _2483 = fma(_2455, _2429, _2481);
    float3 _6392 = float3(_2477, _2479, _2475);
    float _2485 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6392, float3(0.0), isnan(_6392)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6392, float3(0.0), isnan(_6392)), level(0.0)).x;
    float3 _6403 = float3(_2477, _2479, _2475);
    float4 _2488 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6403, float3(0.0), isnan(_6403)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6403, float3(0.0), isnan(_6403)), level(0.0)).xyzw;
    float _2490 = _2488.x;
    float _2492 = _2488.y;
    float _2494 = _2488.z;
    float _2496 = _2488.w;
    float _2498 = fma(_2483, 0.5, 0.5);
    float _2500 = _2469 * 0.636619746685028076171875;
    float _2502 = -_2467;
    float _2504 = fma(_2500, _2502, 1.0);
    float2 _6430 = float2(_2504, _2498);
    float3 _2508 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6430, float2(0.0), isnan(_6430)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6430, float2(0.0), isnan(_6430)), level(0.0)).xyz;
    float _2510 = _2508.x;
    float _2512 = _2508.y;
    float _2514 = _2508.z;
    float _2516 = _2397 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2518 = _2387 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2520 = fma(_2405, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2518);
    float _2522 = exp2(_2516);
    float _2524 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2526 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2520);
    float _2528 = fma(_2413, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2526);
    out.m_47.x = _2524;
    float _2530 = _2528 + _2431;
    out.gl_Position.x = _2461;
    out.gl_Position.y = _2463;
    out.gl_Position.z = _2528;
    out.gl_Position.w = _2431;
    float _2532 = _2530 * 0.5;
    float _2534 = -_2522;
    float _2536 = _2534 + 1.0;
    float _2538 = _2536 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.z = _2532;
    out.m_73.w = _2431;
    float _2540 = _2538 * _2485;
    float _2542 = -_2538;
    float _2544 = _2542 + 1.0;
    float _2546 = _2496 * _2540;
    float _2548 = _2496 * _2544;
    float _2550 = _2514 * _2540;
    float _2552 = fma(_2510, _2546, _2490);
    float _2554 = fma(_2512, _2546, _2492);
    float _2556 = fma(_2496, _2550, _2494);
    out.m_75.x = _2552;
    out.m_75.y = _2554;
    out.m_75.z = _2556;
    out.m_75.w = _2548;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1765 = false;
    bool _1028 = false;
    bool _844 = false;
    bool _678 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_44.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_47.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2613 = as_type<float>(_110);
        out.gl_Position.z = _2613;
    }
    if (!_98)
    {
        return out;
    }
    float _114 = in.m_49.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _130 = _128;
    if (_124)
    {
        float _132 = float(_94);
        _104 = _132;
    }
    float _134 = _104;
    bool _136 = _128 >= _134;
    bool _138 = !_124;
    bool _140 = _136 || _138;
    float _142 = _134;
    if (_140)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _142;
    if (_140)
    {
        out.m_47.x = 0.0;
    }
    if (_140)
    {
        float _146 = _144 * 5.0;
        _112 = as_type<int>(_146);
    }
    int _148 = _112;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2683 = as_type<float>(_148);
        out.gl_Position.z = _2683;
    }
    if (_140)
    {
        return out;
    }
    float _150 = in.m_51.x;
    float _152 = in.m_51.y;
    float _154 = in.m_51.z;
    float _156 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _158 = in.m_53.x;
    float _160 = in.m_53.y;
    float _162 = in.m_53.z;
    bool _164 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _166 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _168 = _164 || _166;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    float _174 = in.m_55.x;
    float _176 = in.m_55.y;
    float _178 = in.m_55.z;
    float _180 = _150 * _150;
    float _182 = _152 * _152;
    float _184 = fma(_158, _158, _180);
    float _186 = fma(_160, _160, _182);
    float _188 = fma(_174, _174, _184);
    float _190 = _154 * _154;
    float _192 = fma(_176, _176, _186);
    float _194 = sqrt(_188);
    float _196 = fma(_162, _162, _190);
    float _198 = fma(_178, _178, _196);
    float _200 = sqrt(_192);
    float _202 = sqrt(_198);
    bool _204 = _194 > 0.0;
    bool _206 = _200 > 0.0;
    float _208 = 0.0;
    float _210 = _188;
    float _212 = _156;
    float _214 = _158;
    float _216 = _154;
    if (_204)
    {
        float _218 = rsqrt(_188);
        _208 = _218;
    }
    float _220 = _208;
    float _222 = 0.0;
    if (!_204)
    {
        _222 = 0.0;
    }
    float _224 = _222;
    bool _226 = _202 > 0.0;
    float _228 = in.m_49.x;
    float _230 = in.m_49.y;
    float _232 = in.m_49.z;
    float _234 = 0.0;
    float _236 = _224;
    if (!_204)
    {
        _234 = 0.0;
    }
    float _238 = _234;
    float _240 = 0.0;
    float _242 = 0.0;
    float _244 = _238;
    if (!_206)
    {
        _240 = 0.0;
        _242 = 0.0;
    }
    float _246 = _240;
    float _248 = _242;
    float _250 = 0.0;
    float _252 = _246;
    float _254 = _248;
    if (_206)
    {
        float _256 = rsqrt(_192);
        _250 = _256;
    }
    float _258 = _250;
    if (!_172)
    {
        float _260 = _156 * _156;
        float _262 = _260 * 0.5;
        _210 = _262;
    }
    float _264 = _210;
    float _266 = 0.0;
    float _268 = _264;
    if (!_204)
    {
        _266 = 0.0;
    }
    float _270 = _266;
    float _272 = _270;
    if (!_172)
    {
        float _274 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _268 = _274;
    }
    float _276 = _268;
    float _278 = _198;
    float _280 = _276;
    if (_226)
    {
        float _282 = rsqrt(_198);
        _278 = _282;
    }
    float _284 = _278;
    float _286 = _220;
    if (_204)
    {
        float _288 = _220 * _158;
        _236 = _288;
    }
    float _290 = _236;
    if (_204)
    {
        float _292 = _220 * _150;
        _244 = _292;
    }
    float _294 = _244;
    if (_204)
    {
        float _296 = _220 * _174;
        _272 = _296;
    }
    float _298 = _272;
    float _300 = 0.0;
    float _302 = 0.0;
    if (!_226)
    {
        _300 = 0.0;
        _302 = 0.0;
    }
    float _304 = _300;
    float _306 = _302;
    float _308 = _306;
    float _310 = _304;
    if (!_206)
    {
        _286 = 0.0;
    }
    float _312 = _286;
    float _314 = 0.0;
    float _316 = _312;
    if (!_226)
    {
        _314 = 0.0;
    }
    float _318 = _314;
    float _320 = _318;
    if (_206)
    {
        float _322 = _258 * _160;
        _316 = _322;
    }
    float _324 = _316;
    if (_206)
    {
        float _326 = _258 * _152;
        _252 = _326;
    }
    float _328 = _252;
    if (_206)
    {
        float _330 = _258 * _176;
        _254 = _330;
    }
    float _332 = _254;
    if (_226)
    {
        float _334 = _284 * _162;
        _308 = _334;
    }
    float _336 = _308;
    if (_226)
    {
        float _338 = _284 * _154;
        _310 = _338;
    }
    float _340 = _310;
    if (_226)
    {
        float _342 = _284 * _178;
        _320 = _342;
    }
    float _344 = _320;
    bool _346 = !_172;
    if (!_346)
    {
        float _348 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _350 = log2(_348);
        float _352 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _354 = _352 + 1.0;
        float _356 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _358 = _156 * _350;
        float _360 = 1.0 / _354;
        float _362 = _356 * 0.693147182464599609375;
        float _364 = exp2(_358);
        float _366 = 1.0 / _362;
        float _368 = _364 + (-1.0);
        float _370 = -_368;
        float _372 = fma(_370, _366, _156);
        float _374 = _372 * _360;
        float _376 = _374 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _280 = _376;
    }
    float _378 = _280;
    float _380 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _382 = !_172;
    float _384 = _380;
    float _386 = _378;
    if (!_382)
    {
        float _388 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _390 = log2(_388);
        float _392 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _394 = _392 + 1.0;
        float _396 = 1.0 / _394;
        float _398 = _156 * _390;
        float _400 = exp2(_398);
        float _402 = -_400;
        float _404 = _402 + 1.0;
        float _406 = _404 * _396;
        _212 = _406;
    }
    float _408 = _212;
    float _410 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _412 = _380 * _294;
    float _414 = _380 * _328;
    float _416 = _380 * _340;
    if (!_172)
    {
        float _418 = _128 * _128;
        float _420 = _418 * 0.5;
        _384 = _420;
    }
    float _422 = _384;
    float _424 = fma(_410, _290, _412);
    float _426 = fma(_410, _324, _414);
    float _428 = fma(_410, _336, _416);
    float _430 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_172)
    {
        float _432 = _422 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _386 = _432;
    }
    float _434 = _386;
    bool _436 = !_172;
    float _438 = _434;
    if (!_436)
    {
        float _440 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _442 = log2(_440);
        float _444 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _446 = _444 + 1.0;
        float _448 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _450 = _128 * _442;
        float _452 = 1.0 / _446;
        float _454 = _448 * 0.693147182464599609375;
        float _456 = exp2(_450);
        float _458 = 1.0 / _454;
        float _460 = _456 + (-1.0);
        float _462 = -_460;
        float _464 = fma(_462, _458, _128);
        float _466 = _464 * _452;
        float _468 = _466 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _438 = _468;
    }
    float _470 = _438;
    float _472 = _470 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _474 = fma(_430, _298, _424);
    float _476 = fma(_430, _332, _426);
    float _478 = fma(_430, _344, _428);
    float _480 = _470 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _482 = _472 * _328;
    float _484 = _472 * _294;
    float _486 = _472 * _340;
    float _488 = _470 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _490 = fma(_480, _324, _482);
    float _492 = fma(_480, _290, _484);
    float _494 = fma(_480, _336, _486);
    float _496 = fma(_408, _230, _476);
    float _498 = fma(_488, _332, _490);
    float _500 = _490;
    if (!_172)
    {
        _500 = _128;
    }
    float _502 = _500;
    bool _504 = !_172;
    float _506 = _502;
    if (!_504)
    {
        float _508 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _510 = log2(_508);
        float _512 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _514 = _512 + 1.0;
        float _516 = 1.0 / _514;
        float _518 = _128 * _510;
        float _520 = exp2(_518);
        float _522 = -_520;
        float _524 = _522 + 1.0;
        float _526 = _524 * _516;
        _506 = _526;
    }
    float _528 = _506;
    float _530 = fma(_488, _298, _492);
    float _532 = fma(_528, _230, _498);
    float _534 = fma(_488, _344, _494);
    float _536 = fma(_408, _228, _474);
    float _538 = fma(_528, _228, _530);
    float _540 = -_532;
    float _542 = _496 + _540;
    float _544 = fma(_408, _232, _478);
    float _546 = fma(_528, _232, _534);
    float _548 = -_538;
    float _550 = _536 + _548;
    float _552 = _542 * _542;
    float _554 = in.m_57.w;
    float _556 = -_546;
    float _558 = _544 + _556;
    float _560 = _542 * _160;
    float _562 = fma(_550, _550, _552);
    float _564 = _542 * _152;
    float _566 = _542 * _176;
    float _568 = fma(_550, _158, _560);
    float _570 = fma(_558, _558, _562);
    float _572 = fma(_550, _150, _564);
    float _574 = in.m_44.x;
    float _576 = in.m_44.y;
    float _578 = in.m_44.z;
    float _580 = fma(_558, _162, _568);
    float _582 = fma(_550, _174, _566);
    float _584 = fma(_558, _154, _572);
    float _586 = sqrt(_570);
    float _588 = fma(_558, _178, _582);
    bool _590 = _586 >= 9.9999999747524270787835121154785e-07;
    bool _592 = isnan(_586);
    bool _594 = _590 || _592;
    bool _596 = isnan(9.9999999747524270787835121154785e-07);
    bool _598 = _594 || _596;
    float _600 = fma(_536, _554, _574);
    float _602 = fma(_496, _554, _576);
    float _604 = fma(_544, _554, _578);
    float _606 = _554;
    float _608 = _588;
    float _610 = _580;
    float _612 = _580;
    float _614 = _588;
    if (_598)
    {
        _606 = _584;
    }
    float _616 = _606;
    float _618 = _616;
    float _620 = _616;
    if (!_598)
    {
        bool _622 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _624 = !_622;
        if (!_624)
        {
            float _626 = _328 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _628 = _294 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _630 = _340 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _632 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[16].x, _626);
            float _634 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[16].x, _628);
            float _636 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[16].x, _630);
            float _638 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[16].z, _632);
            float _640 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[16].z, _634);
            float _642 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[16].z, _636);
            float _644 = _638 * _152;
            float _646 = _638 * _160;
            float _648 = _638 * _176;
            float _650 = fma(_640, _150, _644);
            float _652 = fma(_640, _158, _646);
            float _654 = fma(_640, _174, _648);
            float _656 = fma(_642, _154, _650);
            float _658 = fma(_642, _162, _652);
            float _660 = fma(_642, _178, _654);
            float _662 = _656 * _656;
            float _664 = fma(_658, _658, _662);
            float _666 = fma(_660, _660, _664);
            float _668 = rsqrt(_666);
            float _670 = _668 * 9.9999999747524270787835121154785e-07;
            float _672 = _658 * _670;
            float _674 = _656 * _670;
            float _676 = _660 * _670;
            _620 = _674;
            _612 = _672;
            _614 = _676;
            _678 = true;
        }
        else
        {
            float _680 = _230 * _230;
            float _682 = fma(_228, _228, _680);
            float _684 = fma(_232, _232, _682);
            float _686 = sqrt(_684);
            bool _688 = _686 >= 9.9999999747524270787835121154785e-07;
            bool _690 = isnan(_686);
            bool _692 = _688 || _690;
            bool _694 = isnan(9.9999999747524270787835121154785e-07);
            bool _696 = _692 || _694;
            if (!_696)
            {
                float _698 = _576 * _576;
                float _700 = fma(_574, _574, _698);
                float _702 = fma(_578, _578, _700);
                float _704 = sqrt(_702);
                bool _706 = _704 >= 9.9999999747524270787835121154785e-07;
                bool _708 = isnan(_704);
                bool _710 = _706 || _708;
                bool _712 = isnan(9.9999999747524270787835121154785e-07);
                bool _714 = _710 || _712;
                float _716 = _192;
                if (!_714)
                {
                    float _718 = rsqrt(_192);
                    _716 = _718;
                }
                float _720 = _716;
                if (!_714)
                {
                    float _722 = _720 * 9.9999999747524270787835121154785e-07;
                    _608 = _722;
                }
                float _724 = _608;
                float _726 = _724;
                if (!_714)
                {
                    float _728 = _160 * _724;
                    _610 = _728;
                }
                float _730 = _610;
                _612 = _730;
                if (!_714)
                {
                    float _732 = _152 * _724;
                    _618 = _732;
                }
                float _734 = _618;
                _620 = _734;
                if (!_714)
                {
                    float _736 = _176 * _724;
                    _726 = _736;
                }
                float _738 = _726;
                bool _740 = !_714;
                _614 = _738;
                _678 = _740;
                if (!_678)
                {
                    float _742 = _152 * _576;
                    float _744 = _160 * _576;
                    float _746 = _176 * _576;
                    float _748 = fma(_150, _574, _742);
                    float _750 = fma(_158, _574, _744);
                    float _752 = fma(_174, _574, _746);
                    float _754 = fma(_154, _578, _748);
                    float _756 = fma(_162, _578, _750);
                    float _758 = fma(_178, _578, _752);
                    float _760 = _754 * _754;
                    float _762 = fma(_756, _756, _760);
                    float _764 = fma(_758, _758, _762);
                    float _766 = rsqrt(_764);
                    float _768 = _766 * 9.9999999747524270787835121154785e-07;
                    float _770 = _756 * _768;
                    float _772 = _754 * _768;
                    float _774 = _758 * _768;
                    _620 = _772;
                    _612 = _770;
                    _614 = _774;
                    _678 = true;
                }
            }
            else
            {
                float _776 = _152 * _230;
                float _778 = _160 * _230;
                float _780 = _176 * _230;
                float _782 = fma(_150, _228, _776);
                float _784 = fma(_158, _228, _778);
                float _786 = fma(_174, _228, _780);
                float _788 = fma(_154, _232, _782);
                float _790 = fma(_162, _232, _784);
                float _792 = fma(_178, _232, _786);
                float _794 = _788 * _788;
                float _796 = fma(_790, _790, _794);
                float _798 = fma(_792, _792, _796);
                float _800 = rsqrt(_798);
                float _802 = _800 * 9.9999999747524270787835121154785e-07;
                float _804 = _790 * _802;
                float _806 = _788 * _802;
                float _808 = _792 * _802;
                _620 = _806;
                _612 = _804;
                _614 = _808;
            }
        }
    }
    _678 = false;
    float _810 = _620;
    float _812 = _612;
    float _814 = _614;
    bool _816 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _818 = !_816;
    float _820 = _810;
    float _822 = _812;
    float _824 = _814;
    float _842;
    if (!_818)
    {
        float _826 = in.m_59.x;
        float _828 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _830 = _826 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _832 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _834 = _832 * _828;
        float _836 = floor(_834);
        float _838 = -_836;
        float _840 = _834 + _838;
        _842 = _840;
        _844 = true;
    }
    else
    {
        float _846 = float(_94);
        float _848 = 1.0 / _846;
        float _850 = _128 * _848;
        _842 = _850;
    }
    _844 = false;
    float _852 = _842;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _856 = _852 + _854;
    bool _858 = _852 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _860 = isnan(_852);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _866 = _862 || _864;
    float _868 = float(_866);
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _872 = _852 + _870;
    bool _874 = _852 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _876 = isnan(_852);
    bool _878 = _874 || _876;
    bool _880 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _882 = _878 || _880;
    float _884 = float(_882);
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _886;
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _892 = _890 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _894 = _852 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _896 = isnan(_852);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = -_868;
    float _908 = _906 + 1.0;
    float _910 = 1.0 / _892;
    float _912 = _904 * _908;
    float _914 = -_904;
    float _916 = _914 + 1.0;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _918;
    bool _922 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _924 = 1.0 / _888;
    float _926 = _884 * _916;
    float _928 = -_884;
    float _930 = _928 + 1.0;
    float _932 = _872 * _910;
    float _934 = _856 * _924;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _936;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _940;
    float _944 = fma(_920, _934, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _946 = fma(_938, _934, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _948 = fma(_942, _934, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _950 = in.m_57.x;
    float _952 = in.m_57.y;
    float _954 = in.m_57.z;
    float _956 = _944 * _926;
    float _958 = _946 * _926;
    float _960 = _948 * _926;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _964 = _962 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _972 = _970 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _974 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[143].x, _956);
    float _976 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[143].y, _958);
    float _978 = fma(_964, _932, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _980 = fma(_968, _932, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _982 = fma(_972, _932, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _984 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[143].z, _960);
    float _986 = fma(_978, _912, _974);
    float _988 = fma(_980, _912, _976);
    float _990 = fma(_982, _912, _984);
    float _992 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[145].x, _986);
    float _994 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[145].y, _988);
    float _996 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[145].z, _990);
    float _998 = _992 * _950;
    float _1000 = _994 * _952;
    float _1002 = _996 * _954;
    bool _1004 = !_922;
    float _1006 = _872;
    float _1008 = _998;
    float _1026;
    if (!_1004)
    {
        float _1010 = in.m_59.x;
        float _1012 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _1014 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _1016 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _1018 = _1016 * _1012;
        float _1020 = floor(_1018);
        float _1022 = -_1020;
        float _1024 = _1018 + _1022;
        _1026 = _1024;
        _1028 = true;
    }
    else
    {
        float _1030 = float(_94);
        float _1032 = 1.0 / _1030;
        float _1034 = _128 * _1032;
        _1026 = _1034;
    }
    _1028 = false;
    float _1036 = _1026;
    float _1038 = _810 * _810;
    float _1040 = _602 * _152;
    float _1042 = _602 * _176;
    float _1044 = in.m_59.w;
    float _1046 = fma(_812, _812, _1038);
    float _1048 = fma(_600, _150, _1040);
    float _1050 = fma(_600, _174, _1042);
    float _1052 = fma(_814, _814, _1046);
    float _1054 = _602 * _160;
    float _1056 = fma(_604, _154, _1048);
    float _1058 = fma(_604, _178, _1050);
    float _1060 = rsqrt(_1052);
    float _1062 = fma(_600, _158, _1054);
    float _1064 = _1056 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1066 = _1058 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1068 = fma(_604, _162, _1062);
    float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1072 = _1064 + _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1076 = _1066 + _1074;
    float _1078 = _998 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1080 = _1068 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1082 = _1072 * _1072;
    float _1084 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1084;
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1090 = _1088 != 0;
    float _1092 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1094 = _1080 + _1092;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1098 = _1036 + _1096;
    float _1100 = _1060 * _810;
    float _1102 = fma(_1094, _1094, _1082);
    float _1104 = _1060 * _812;
    float _1106 = _1060 * _814;
    float _1108 = _1100 * _328;
    float _1110 = fma(_1076, _1076, _1102);
    float _1112 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1114 = _1044 > 0.5;
    float _1116 = fma(_1104, _324, _1108);
    float _1118 = in.m_61.x;
    float _1120 = in.m_61.y;
    float _1122 = in.m_61.z;
    float _1124 = 1.0 / _1086;
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1128 = _1126 != 0;
    float _1130 = fma(_1106, _332, _1116);
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1134 = _1132 != 0;
    float _1136 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1140 = _1138 != 0;
    float _1142 = in.m_63.x;
    float _1144 = abs(_1130);
    bool _1146 = _1144 > 0.99989998340606689453125;
    float _1148 = rsqrt(_1110);
    float _1150 = in.m_63.y;
    float _1152 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    bool _1154 = _1036 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1156 = isnan(_1036);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1162 = _1158 || _1160;
    float _1164 = float(_1162);
    float _1166 = _1098 * _1124;
    float _1168 = 0.0;
    bool _1170 = _1114;
    bool _1172 = _1140;
    float _1174 = _1142;
    float _1176 = _1052;
    if (_1134)
    {
        float _1178 = in.m_59.z;
        _1168 = _1178;
    }
    float _1180 = _1168;
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1182;
    bool _1186 = _1036 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1188 = isnan(_1036);
    bool _1190 = _1186 || _1188;
    bool _1192 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1194 = _1190 || _1192;
    float _1196 = float(_1194);
    float _1198 = -_1164;
    float _1200 = _1198 + 1.0;
    if (!_1146)
    {
        _1006 = _324;
    }
    float _1202 = _1006;
    float _1204 = _1202;
    if (_1146)
    {
        float _1206 = fma(_336, 0.001000000047497451305389404296875, _324);
        _1204 = _1206;
    }
    float _1208 = _1204;
    float _1210 = 0.0;
    if (!_1146)
    {
        _1210 = _328;
    }
    float _1212 = _1210;
    float _1214 = _1112 * _1148;
    float _1216 = _1212;
    if (!_1146)
    {
        _1008 = _332;
    }
    float _1218 = _1008;
    float _1220 = _1218;
    if (_1146)
    {
        float _1222 = fma(_340, 0.001000000047497451305389404296875, _328);
        _1216 = _1222;
    }
    float _1224 = _1216;
    if (_1146)
    {
        float _1226 = fma(_344, 0.001000000047497451305389404296875, _332);
        _1220 = _1226;
    }
    float _1228 = _1220;
    int _1230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1232 = _1230 != 0;
    float _1234 = _1072 * _1214;
    float _1236 = _1094 * _1214;
    float _1238 = _1076 * _1214;
    float _1240 = -_1228;
    float _1242 = _1100 * _1240;
    float _1244 = -_1234;
    float _1246 = _1072 + _1244;
    float _1248 = -_1236;
    float _1250 = _1094 + _1248;
    float _1252 = -_1238;
    float _1254 = _1076 + _1252;
    float _1256 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1122);
    float _1258 = _1246 * _1246;
    float _1260 = -_1224;
    float _1262 = _1104 * _1260;
    float _1264 = -_1224;
    float _1266 = -_1242;
    float _1268 = fma(_1106, _1264, _1266);
    float _1270 = in.m_59.y;
    float _1272 = fma(_1250, _1250, _1258);
    float _1274 = -_1208;
    float _1276 = _1106 * _1274;
    float _1278 = -_1208;
    float _1280 = -_1262;
    float _1282 = fma(_1100, _1278, _1280);
    float _1284 = in.m_59.x;
    float _1286 = fma(_1254, _1254, _1272);
    float _1288 = -_1228;
    float _1290 = -_1276;
    float _1292 = fma(_1104, _1288, _1290);
    float _1294 = -_1150;
    float _1296 = _1294 + 1.0;
    float _1298 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1120);
    float _1300 = sqrt(_1286);
    float _1302 = _1292 * _1292;
    float _1304 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1118);
    int _1306 = _1114 ? as_type<int>(_1296) : as_type<int>(_1150);
    float _1308 = fma(_1268, _1268, _1302);
    float _1310 = _1286;
    float _1312 = _1180;
    float _1314 = _1150;
    if (_1134)
    {
        bool _1316 = _1180 > 0.5;
        _1170 = _1316;
    }
    bool _1318 = _1170;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1320;
    float _1324 = _1140 ? as_type<float>(_1306) : _1150;
    float _1326 = fma(_1282, _1282, _1308);
    float _1328 = fma(_1322, _1166, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    if (!_1128)
    {
        _1310 = _1142;
    }
    float _1330 = _1310;
    int _1332 = 0;
    float _1334 = _1330;
    if (_1134)
    {
        float _1336 = -_1142;
        float _1338 = _1336 + 1.0;
        _1332 = as_type<int>(_1338);
    }
    int _1340 = _1332;
    float _1342 = rsqrt(_1326);
    if (!_1090)
    {
        _1312 = _1270;
    }
    float _1344 = _1312;
    float _1346 = _1148 * _1300;
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1348;
    float _1352 = _1152 * _1284;
    float _1354 = _1344;
    if (_1128)
    {
        bool _1356 = _1284 > 0.5;
        _1172 = _1356;
    }
    bool _1358 = _1172;
    float _1360 = _1136 * _1346;
    if (_1090)
    {
        _1354 = _1284;
    }
    float _1362 = _1354;
    float _1364 = fma(_1350, _1166, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1366 = _1078 * _1346;
    float _1368 = trunc(_1352);
    int _1370 = int(_1368);
    float _1372 = fma(_1184, _1166, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1374 = _1360 * _1256;
    float _1376 = _1366 * _1304;
    float _1378 = _1282 * _1342;
    float _1380 = _1000 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1382 = _1268 * _1342;
    float _1384 = _1292 * _1342;
    float _1386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1388 = _1380 * _1346;
    float _1390 = _1104 * _1384;
    float _1392 = _1380;
    if (!_1090)
    {
        float _1394 = in.m_59.z;
        _1392 = _1394;
    }
    float _1396 = _1392;
    float _1398 = _1388 * _1298;
    float _1400 = _1100 * _1378;
    float _1402 = -_1390;
    float _1404 = fma(_1100, _1382, _1402);
    float _1406 = -_1196;
    float _1408 = _1406 + 1.0;
    float _1410 = _1398 * _1104;
    float _1412 = _1398 * _1106;
    float _1414 = -_1400;
    float _1416 = fma(_1106, _1384, _1414);
    int _1418 = _1370 << 4;
    int _1420 = _1418 + 1968;
    float _1422 = fma(_1376, _1382, _1410);
    float _1424 = fma(_1376, _1378, _1412);
    float _1426 = _1164 * _1408;
    float _1428 = _1386 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1430 = fma(_1374, _1416, _1422);
    float _1432 = fma(_1374, _1404, _1424);
    int _1434 = _1420 + 8;
    uint _1437 = uint(int(uint(_1434) >> uint(2)));
    uint _1439 = uint(int(uint(int(_1437)) >> uint(2)));
    int _1441 = int(_1437) & 3;
    float _1443 = (*spvDescriptorSet0.vp_c9)._m0[int(_1439)][_1441];
    float _1445 = fma(_1428, _1324, -0.5);
    float _1447 = _1080 + _1430;
    float _1449 = _1066 + _1432;
    float _1451 = _1364 * _1426;
    float _1453 = _1328 * _1426;
    float _1455 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1457 = _1447 + _1455;
    float _1459 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1461 = _1449 + _1459;
    uint _1463 = uint(int(uint(_1420) >> uint(2)));
    uint _1465 = uint(int(uint(int(_1463)) >> uint(2)));
    int _1467 = int(_1463) & 3;
    float _1469 = (*spvDescriptorSet0.vp_c9)._m0[int(_1465)][_1467];
    int _1471 = int(_1463) + 1;
    uint _1473 = uint(int(uint(_1471) >> uint(2)));
    int _1475 = _1471 & 3;
    float _1477 = (*spvDescriptorSet0.vp_c9)._m0[int(_1473)][_1475];
    float _1479 = _1432;
    float _1481 = _1396;
    int _1483 = as_type<int>(_1426);
    float _1485 = _1447;
    float _1487 = _1449;
    if (!_1090)
    {
        _1479 = _1396;
    }
    float _1489 = _1479;
    float _1491 = _1457 * _1457;
    float _1493 = _1461 * _1461;
    float _1495 = _1489;
    float _1497 = _1491;
    float _1499 = _1493;
    if (_1090)
    {
        _1495 = _1270;
    }
    float _1501 = _1495;
    float _1503 = _1372 * _1426;
    if (_1090)
    {
        _1481 = _1270;
    }
    float _1505 = _1481;
    float _1507 = _1491 + _1493;
    bool _1509 = _1270 > 0.5;
    float _1511 = _1106 * _1382;
    float _1513 = sqrt(_1507);
    if (_1128)
    {
        float _1515 = -_1142;
        float _1517 = _1515 + 1.0;
        _1483 = as_type<int>(_1517);
    }
    int _1519 = _1483;
    float _1521 = -_1511;
    float _1523 = fma(_1104, _1378, _1521);
    float _1525 = _1398 * _1100;
    float _1527 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1529 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1451);
    if (_1128)
    {
        float _1531 = _1358 ? as_type<float>(_1519) : _1142;
        _1334 = _1531;
    }
    float _1533 = _1334;
    float _1535 = fma(_1376, _1384, _1525);
    float _1537 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1527);
    float _1539 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1541 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1543 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1545 = fma(_1374, _1523, _1535);
    float _1547 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1549 = _1513 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1551 = -_1543;
    float _1553 = fma(_1541, 2.0, _1551);
    if (_1134)
    {
        float _1555 = _1318 ? as_type<float>(_1340) : _1142;
        _1174 = _1555;
    }
    float _1557 = _1174;
    float _1559 = fma(_1505, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1547);
    float _1561 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1453);
    float _1563 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1503);
    float _1565 = _1064 + _1545;
    bool _1567 = !_1549;
    float _1569 = _1565;
    if (!_1567)
    {
        float _1571 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1573 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1575 = _1513 + _1573;
        float _1577 = rsqrt(_1507);
        float _1579 = _1575 * _1571;
        float _1581 = _1565 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1583 = _1579 * 0.15915493667125701904296875;
        float _1585 = _1583 * 6.283185482025146484375;
        float _1587 = sin(_1585);
        float _1589 = _1583 * 6.283185482025146484375;
        float _1591 = cos(_1589);
        float _1593 = fma(_1587, _1581, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1595 = _1577 * _1593;
        float _1597 = fma(_1457, _1595, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1599 = _1591 + (-1.0);
        float _1601 = fma(_1461, _1595, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1603 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1605 = _1597 + _1603;
        float _1607 = _1599 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1609 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1611 = _1601 + _1609;
        float _1613 = _1605 * _1605;
        float _1615 = fma(_1565, _1591, _1607);
        float _1617 = _1611 * _1611;
        _1569 = _1615;
        _1497 = _1613;
        _1499 = _1617;
        _1485 = _1597;
        _1487 = _1601;
    }
    float _1619 = _1569;
    float _1621 = _1497;
    float _1623 = _1499;
    float _1625 = _1485;
    float _1627 = _1487;
    if (_1232)
    {
        float _1629 = _1509 ? _1296 : _1150;
        _1314 = _1629;
    }
    float _1631 = _1314;
    float _1633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1635 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1637 = _1619 + _1635;
    float _1639 = _1539 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1641 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1643 = _1501 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1645 = fma(_1637, _1637, _1621);
    float _1647 = fma(_1639, _1557, -0.5);
    float _1649 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1537);
    float _1651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1653 = fma(_1643, -2.0, _1641);
    float _1655 = -_128;
    float _1657 = fma(_1655, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1553);
    float _1659 = _1645 + _1623;
    float _1661 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1561);
    float _1663 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1559);
    float _1665 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1653);
    float _1667 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1529);
    float _1669 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1563);
    float _1671 = fma(_1649, _1647, _1657);
    float _1673 = _1533 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1675 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1677 = -_1665;
    float _1679 = fma(_1663, _1445, _1677);
    float _1681 = _1469 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1683 = _1443 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1685 = sqrt(_1659);
    float _1687 = _1673 * _1633;
    float _1689 = _1675 * _1651;
    float _1691 = _1477 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1693 = _1661 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1695 = _1667 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1697 = _1669 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1699 = _1681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1701 = _1683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1703 = _1671 + 0.5;
    float _1705 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1707 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1709 = _1693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1711 = _1695 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1713 = _1697 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1715 = _1679 + 0.5;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    bool _1717 = _1685 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1719 = isnan(_1685);
    bool _1721 = _1717 || _1719;
    bool _1723 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1725 = _1721 || _1723;
    out.m_67.x = _1699;
    out.m_67.y = _1707;
    out.m_67.z = _1701;
    out.m_69.x = _1709;
    out.m_69.y = _1711;
    out.m_69.z = _1713;
    out.m_69.w = _1705;
    out.m_71.x = _1687;
    out.m_71.y = _1689;
    out.m_71.z = _1703;
    out.m_71.w = _1715;
    float _1727 = _1679;
    float _1729 = _1713;
    if (!_1725)
    {
        _1727 = 1.0;
    }
    float _1731 = _1727;
    bool _1733 = !_1725;
    float _1735 = _1731;
    if (!_1733)
    {
        bool _1737 = _1685 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1739 = isnan(_1685);
        bool _1741 = _1737 || _1739;
        bool _1743 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1745 = _1741 || _1743;
        if (!_1745)
        {
            float _1747 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1749 = _1685 + _1747;
            float _1751 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1753 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1751;
            float _1755 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1757 = _1755 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1759 = 1.0 / _1753;
            float _1761 = _1749 * _1759;
            float _1763 = fma(_1761, _1757, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1735 = _1763;
            _1765 = true;
        }
        else
        {
            bool _1767 = _1685 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1769 = isnan(_1685);
            bool _1771 = _1767 || _1769;
            bool _1773 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1775 = _1771 || _1773;
            if (!_1775)
            {
                float _1777 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1779 = _1685 + _1777;
                float _1781 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1783 = _1781 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1785 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1787 = _1785 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1789 = 1.0 / _1783;
                float _1791 = _1779 * _1789;
                float _1793 = fma(_1791, _1787, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1735 = _1793;
                _1765 = true;
            }
            else
            {
                _1735 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1765 = false;
    float _1795 = _1735;
    float _1797 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1799 = _1619 + _1797;
    float _1801 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1803 = _1625 + _1801;
    float _1805 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1807 = _1627 + _1805;
    float _1809 = fma(_1799, _1795, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1811 = fma(_1803, _1795, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1813 = fma(_1807, _1795, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1815 = -_1064;
    float _1817 = _1815 + _1809;
    float _1819 = -_1080;
    float _1821 = _1819 + _1811;
    float _1823 = -_1066;
    float _1825 = _1823 + _1813;
    float _1827 = _1817 * _1817;
    float _1829 = fma(_1821, _1821, _1827);
    float _1831 = fma(_1825, _1825, _1829);
    float _1833 = sqrt(_1831);
    bool _1835 = _1833 > 0.0;
    bool _1837 = !_1835;
    float _1839 = _1829;
    float _1841 = _1833;
    float _1843 = _1811;
    float _1845 = _1809;
    float _1847 = _1813;
    if (!_1837)
    {
        bool _1849 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1851 = _1689;
        if (_1849)
        {
            float _1853 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1851 = _1853;
        }
        float _1855 = _1851;
        if (_1849)
        {
            float _1857 = _1855 * _812;
            _1729 = _1857;
        }
        float _1859 = _1729;
        float _1861 = _1859;
        if (_1849)
        {
            float _1863 = _1855 * _810;
            _1839 = _1863;
        }
        float _1865 = _1839;
        float _1867 = _1865;
        if (_1849)
        {
            float _1869 = _1855 * _814;
            _1841 = _1869;
        }
        float _1871 = _1841;
        float _1873 = _1871;
        if (!_1849)
        {
            float _1875 = _128 + 1.0;
            if (!_172)
            {
                float _1877 = _1875 * _1875;
                float _1879 = _1877 * 0.5;
                _130 = _1879;
            }
            float _1881 = _130;
            float _1883 = _1881;
            if (!_172)
            {
                float _1885 = _1881 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1883 = _1885;
            }
            float _1887 = _1883;
            bool _1889 = !_172;
            float _1891 = _1887;
            if (!_1889)
            {
                float _1893 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1895 = log2(_1893);
                float _1897 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1899 = _1897 + 1.0;
                float _1901 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1903 = _1895 * _1875;
                float _1905 = 1.0 / _1899;
                float _1907 = _1901 * 0.693147182464599609375;
                float _1909 = exp2(_1903);
                float _1911 = 1.0 / _1907;
                float _1913 = _1909 + (-1.0);
                float _1915 = -_1913;
                float _1917 = fma(_1915, _1911, _1875);
                float _1919 = _1917 * _1905;
                float _1921 = _1919 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1891 = _1921;
            }
            float _1923 = _1891;
            float _1925 = _1923 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _1927 = _1923 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1929 = _1923 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1931 = _1923;
            if (!_172)
            {
                _1931 = _1875;
            }
            float _1933 = _1931;
            float _1935 = _1925 * _328;
            float _1937 = _1925 * _294;
            float _1939 = _1925 * _340;
            float _1941 = fma(_1927, _324, _1935);
            float _1943 = fma(_1927, _290, _1937);
            float _1945 = fma(_1929, _332, _1941);
            bool _1947 = !_172;
            float _1949 = _1933;
            if (!_1947)
            {
                float _1951 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1953 = log2(_1951);
                float _1955 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1957 = _1955 + 1.0;
                float _1959 = 1.0 / _1957;
                float _1961 = _1953 * _1875;
                float _1963 = exp2(_1961);
                float _1965 = -_1963;
                float _1967 = _1965 + 1.0;
                float _1969 = _1967 * _1959;
                _1949 = _1969;
            }
            float _1971 = _1949;
            float _1973 = fma(_1927, _336, _1939);
            float _1975 = fma(_1929, _298, _1943);
            float _1977 = fma(_1971, _230, _1945);
            float _1979 = fma(_1929, _344, _1973);
            float _1981 = fma(_1971, _228, _1975);
            float _1983 = -_532;
            float _1985 = _1983 + _1977;
            float _1987 = fma(_1971, _232, _1979);
            float _1989 = -_538;
            float _1991 = _1989 + _1981;
            float _1993 = _1985 * _152;
            float _1995 = _1985 * _160;
            float _1997 = -_546;
            float _1999 = _1997 + _1987;
            float _2001 = _1985 * _176;
            float _2003 = fma(_1991, _150, _1993);
            float _2005 = fma(_1991, _158, _1995);
            float _2007 = fma(_1991, _174, _2001);
            float _2009 = fma(_1999, _154, _2003);
            float _2011 = fma(_1999, _162, _2005);
            float _2013 = fma(_1999, _178, _2007);
            float _2015 = _2009 * _2009;
            float _2017 = fma(_2011, _2011, _2015);
            float _2019 = fma(_2013, _2013, _2017);
            _1176 = _2019;
            _820 = _2009;
            _822 = _2011;
            _824 = _2013;
            _1861 = _2011;
            _1867 = _2009;
            _1873 = _2013;
        }
        float _2021 = _1176;
        float _2023 = _820;
        float _2025 = _822;
        float _2027 = _824;
        float _2029 = _1861;
        float _2031 = _1867;
        float _2033 = _1873;
        float _2035 = sqrt(_2021);
        float _2037 = rsqrt(_1831);
        bool _2039 = _2035 > 0.0;
        float _2041 = _1821 * _2037;
        float _2043 = _1817 * _2037;
        float _2045 = _1825 * _2037;
        bool _2047 = !_2039;
        if (!_2047)
        {
            float _2049 = rsqrt(_2021);
            float _2051 = _2049 * _2023;
            float _2053 = _2049 * _2025;
            float _2055 = _2043 * _2051;
            float _2057 = _2049 * _2027;
            float _2059 = fma(_2041, _2053, _2055);
            float _2061 = fma(_2045, _2057, _2059);
            float _2063 = _2061 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2065 = fma(_2029, _2063, _1811);
            float _2067 = fma(_2031, _2063, _1809);
            float _2069 = fma(_2033, _2063, _1813);
            _1843 = _2065;
            _1845 = _2067;
            _1847 = _2069;
        }
    }
    float _2071 = _1843;
    float _2073 = _1845;
    float _2075 = _1847;
    float _2077 = -_1236;
    float _2079 = _2077 + _2071;
    float _2081 = -_1234;
    float _2083 = _2081 + _2073;
    float _2085 = -_1238;
    float _2087 = _2085 + _2075;
    bool _2089 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2091 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2093 = _2089 || _2091;
    bool _2095 = isnan(0.5);
    bool _2097 = _2093 || _2095;
    float _2099 = _2083;
    float _2101 = _2079;
    float _2103 = _2087;
    if (!_2097)
    {
        float _2105 = -_1234;
        float _2107 = _1064 + _2105;
        float _2109 = -_1236;
        float _2111 = _1080 + _2109;
        float _2113 = -_1238;
        float _2115 = _1066 + _2113;
        float _2117 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2119 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2121 = _2107 + _2119;
        float _2123 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2125 = _2111 + _2123;
        float _2127 = -_1066;
        float _2129 = _2127 + _2075;
        float _2131 = -_1080;
        float _2133 = _2131 + _2071;
        float _2135 = _2121 * _2121;
        float _2137 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2139 = _2115 + _2137;
        float _2141 = -_1064;
        float _2143 = _2141 + _2073;
        float _2145 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2147 = fma(_2125, _2125, _2135);
        float _2149 = fma(_2139, _2139, _2147);
        float _2151 = 1.0 / _1346;
        float _2153 = sqrt(_2149);
        float _2155 = _2145 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2157 = precise::min(_2153, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2159 = _2157 * _2117;
        float _2161 = _2159 * _2151;
        float _2163 = _2155 * _2161;
        float _2165 = _2129 * _2161;
        float _2167 = fma(_2133, _2163, _2111);
        float _2169 = fma(_2143, _2163, _2107);
        float _2171 = fma(_2155, _2165, _2115);
        _2099 = _2169;
        _2101 = _2167;
        _2103 = _2171;
    }
    float _2173 = _2099;
    float _2175 = _2101;
    float _2177 = _2103;
    float _2179 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2181 = _2173 + _2179;
    float _2183 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2185 = _2175 + _2183;
    float _2187 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2189 = _2177 + _2187;
    float _2191 = _2181 * _2181;
    float _2193 = fma(_2185, _2185, _2191);
    float _2195 = fma(_2189, _2189, _2193);
    float _2197 = rsqrt(_2195);
    float _2199 = sqrt(_2195);
    float _2201 = _2197 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2203 = _2185 * _2201;
    float _2205 = _2189 * _2201;
    float _2207 = _2203 * _2203;
    float _2209 = _2205 * _2205;
    float _2211 = _2207 + _2209;
    float _2213 = sqrt(_2211);
    bool _2215 = _2213 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2217 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2219 = _2213 + _2217;
    float _2221 = _2197;
    float _2223 = _2211;
    float _2225 = _2219;
    float _2227 = _2181;
    if (_2215)
    {
        float _2229 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2221 = _2229;
    }
    float _2231 = _2221;
    if (_2215)
    {
        float _2233 = rsqrt(_2211);
        _2223 = _2233;
    }
    float _2235 = _2223;
    float _2237 = _2235;
    if (_2215)
    {
        float _2239 = _2219 * _2231;
        _2225 = _2239;
    }
    float _2241 = _2225;
    if (_2215)
    {
        float _2243 = _2241 * 0.15915493667125701904296875;
        _214 = _2243;
    }
    float _2245 = _214;
    float _2247 = _2189;
    float _2249 = _2245;
    if (_2215)
    {
        float _2251 = _2245 * 6.283185482025146484375;
        float _2253 = sin(_2251);
        _2247 = _2253;
    }
    float _2255 = _2247;
    float _2257 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2259 = precise::max(0.0, _2257);
    float _2261 = _2231;
    float _2263 = _2259;
    if (_2215)
    {
        float _2265 = _2245 * 6.283185482025146484375;
        float _2267 = cos(_2265);
        _2261 = _2267;
    }
    float _2269 = _2261;
    float _2271 = -_2201;
    float _2273 = -_2259;
    float _2275 = fma(_2181, _2271, _2273);
    if (_2215)
    {
        float _2277 = _2275 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2227 = _2277;
    }
    float _2279 = _2227;
    float _2281 = _2279;
    float _2283 = _2255;
    if (_2215)
    {
        float _2285 = fma(_2255, _2279, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2281 = _2285;
    }
    float _2287 = _2281;
    float _2289 = _2287;
    if (!_2215)
    {
        _2283 = _2203;
    }
    float _2291 = _2283;
    float _2293 = _2291;
    float _2295 = _2269;
    if (_2215)
    {
        float _2297 = _2269 + (-1.0);
        _2263 = _2297;
    }
    float _2299 = _2263;
    float _2301 = _2299;
    if (_2215)
    {
        float _2303 = _2235 * _2287;
        _216 = _2303;
    }
    float _2305 = _216;
    if (!_2215)
    {
        _2289 = _2275;
    }
    float _2307 = _2289;
    float _2309 = _2307;
    if (_2215)
    {
        float _2311 = _2299 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2249 = _2311;
    }
    float _2313 = _2249;
    if (_2215)
    {
        float _2315 = _2203 * _2305;
        _2293 = _2315;
    }
    float _2317 = _2293;
    if (!_2215)
    {
        _2301 = _2205;
    }
    float _2319 = _2301;
    float _2321 = _2319;
    if (_2215)
    {
        float _2323 = _2205 * _2305;
        _2321 = _2323;
    }
    float _2325 = _2321;
    if (!_2215)
    {
        _2237 = _2207;
    }
    float _2327 = _2237;
    float _2329 = _2327;
    if (_2215)
    {
        float _2331 = fma(_2275, _2269, _2313);
        _2309 = _2331;
    }
    float _2333 = _2309;
    if (_2215)
    {
        float _2335 = _2317 * _2317;
        _2329 = _2335;
    }
    float _2337 = _2329;
    if (!_2215)
    {
        _2295 = _2209;
    }
    float _2339 = _2295;
    float _2341 = _2339;
    if (_2215)
    {
        float _2343 = _2325 * _2325;
        _2341 = _2343;
    }
    float _2345 = _2341;
    float _2347 = fma(_2333, _2333, _2337);
    float _2349 = _2347 + _2345;
    float _2351 = _2173 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2353 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2355 = fma(_2199, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2353);
    float _2357 = precise::clamp(_2355, 0.0, 1.0);
    float _2359 = _2173 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2361 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2363 = fma(_2175, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2351);
    float _2365 = rsqrt(_2349);
    float _2367 = fma(_2175, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2359);
    float _2369 = -_2357;
    float _2371 = _2369 + 1.0;
    float _2373 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2363);
    float _2375 = _2173 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2377 = _2173 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2379 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2367);
    float _2381 = _2373 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2383 = fma(_2175, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2375);
    float _2385 = fma(_2175, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2377);
    float _2387 = _2379 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2389 = _2381 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2391 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2383);
    float _2393 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2385);
    float _2395 = abs(_2371);
    float _2397 = log2(_2395);
    float _2399 = -_2389;
    float _2401 = fma(_2399, _2361, 1.0);
    float _2403 = _2365 * _2317;
    float _2405 = _2391 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2407 = _2387 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2409 = _2365 * _2333;
    float _2411 = _2365 * _2325;
    float _2413 = _2393 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2415 = fma(_2405, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2407);
    float _2417 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2419 = log2(_2401);
    float _2421 = _2387 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2423 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2415);
    float _2425 = -_2417;
    float _2427 = fma(_2409, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2425);
    float _2429 = _2409 + 1.0;
    float _2431 = fma(_2413, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2423);
    float _2433 = -_2411;
    float _2435 = fma(_2433, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2427);
    float _2437 = _2397 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2439 = _2387 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2441 = 1.0 / _2431;
    float _2443 = fma(_2435, -0.5, 0.5);
    float _2445 = fma(_2435, 0.5, 0.5);
    float _2447 = fma(_2405, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2439);
    float _2449 = fma(_2405, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2421);
    float _2451 = fma(_2445, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2453 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2447);
    float _2455 = exp2(_2437);
    float _2457 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2449);
    float _2459 = fma(_2445, _2451, -0.212114393711090087890625);
    float _2461 = fma(_2413, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2453);
    float _2463 = fma(_2413, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2457);
    float _2465 = _2419 * 0.693147182464599609375;
    float _2467 = fma(_2445, _2459, 1.570728778839111328125);
    float _2469 = sqrt(_2443);
    float _2471 = _2461 * _2441;
    float _2473 = _2463 * _2441;
    float _2475 = _2465 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2477 = fma(_2471, 0.5, 0.5);
    float _2479 = fma(_2473, -0.5, 0.5);
    float _2481 = -_2409;
    float _2483 = fma(_2455, _2429, _2481);
    float3 _6392 = float3(_2477, _2479, _2475);
    float _2485 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6392, float3(0.0), isnan(_6392)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6392, float3(0.0), isnan(_6392)), level(0.0)).x;
    float3 _6403 = float3(_2477, _2479, _2475);
    float4 _2488 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6403, float3(0.0), isnan(_6403)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6403, float3(0.0), isnan(_6403)), level(0.0)).xyzw;
    float _2490 = _2488.x;
    float _2492 = _2488.y;
    float _2494 = _2488.z;
    float _2496 = _2488.w;
    float _2498 = fma(_2483, 0.5, 0.5);
    float _2500 = _2469 * 0.636619746685028076171875;
    float _2502 = -_2467;
    float _2504 = fma(_2500, _2502, 1.0);
    float2 _6430 = float2(_2504, _2498);
    float3 _2508 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6430, float2(0.0), isnan(_6430)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6430, float2(0.0), isnan(_6430)), level(0.0)).xyz;
    float _2510 = _2508.x;
    float _2512 = _2508.y;
    float _2514 = _2508.z;
    float _2516 = _2397 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2518 = _2387 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2520 = fma(_2405, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2518);
    float _2522 = exp2(_2516);
    float _2524 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2526 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2520);
    float _2528 = fma(_2413, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2526);
    out.m_47.x = _2524;
    float _2530 = _2528 + _2431;
    out.gl_Position.x = _2461;
    out.gl_Position.y = _2463;
    out.gl_Position.z = _2528;
    out.gl_Position.w = _2431;
    float _2532 = _2530 * 0.5;
    float _2534 = -_2522;
    float _2536 = _2534 + 1.0;
    float _2538 = _2536 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.z = _2532;
    out.m_73.w = _2431;
    float _2540 = _2538 * _2485;
    float _2542 = -_2538;
    float _2544 = _2542 + 1.0;
    float _2546 = _2496 * _2540;
    float _2548 = _2496 * _2544;
    float _2550 = _2514 * _2540;
    float _2552 = fma(_2510, _2546, _2490);
    float _2554 = fma(_2512, _2546, _2492);
    float _2556 = fma(_2496, _2550, _2494);
    out.m_75.x = _2552;
    out.m_75.y = _2554;
    out.m_75.z = _2556;
    out.m_75.w = _2548;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1765 = false;
    bool _1028 = false;
    bool _844 = false;
    bool _678 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_44.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_47.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2613 = as_type<float>(_110);
        out.gl_Position.z = _2613;
    }
    if (!_98)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _114 = in.m_49.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _130 = _128;
    if (_124)
    {
        float _132 = float(_94);
        _104 = _132;
    }
    float _134 = _104;
    bool _136 = _128 >= _134;
    bool _138 = !_124;
    bool _140 = _136 || _138;
    float _142 = _134;
    if (_140)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _142;
    if (_140)
    {
        out.m_47.x = 0.0;
    }
    if (_140)
    {
        float _146 = _144 * 5.0;
        _112 = as_type<int>(_146);
    }
    int _148 = _112;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2683 = as_type<float>(_148);
        out.gl_Position.z = _2683;
    }
    if (_140)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _150 = in.m_51.x;
    float _152 = in.m_51.y;
    float _154 = in.m_51.z;
    float _156 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _158 = in.m_53.x;
    float _160 = in.m_53.y;
    float _162 = in.m_53.z;
    bool _164 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _166 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _168 = _164 || _166;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    float _174 = in.m_55.x;
    float _176 = in.m_55.y;
    float _178 = in.m_55.z;
    float _180 = _150 * _150;
    float _182 = _152 * _152;
    float _184 = fma(_158, _158, _180);
    float _186 = fma(_160, _160, _182);
    float _188 = fma(_174, _174, _184);
    float _190 = _154 * _154;
    float _192 = fma(_176, _176, _186);
    float _194 = sqrt(_188);
    float _196 = fma(_162, _162, _190);
    float _198 = fma(_178, _178, _196);
    float _200 = sqrt(_192);
    float _202 = sqrt(_198);
    bool _204 = _194 > 0.0;
    bool _206 = _200 > 0.0;
    float _208 = 0.0;
    float _210 = _188;
    float _212 = _156;
    float _214 = _158;
    float _216 = _154;
    if (_204)
    {
        float _218 = rsqrt(_188);
        _208 = _218;
    }
    float _220 = _208;
    float _222 = 0.0;
    if (!_204)
    {
        _222 = 0.0;
    }
    float _224 = _222;
    bool _226 = _202 > 0.0;
    float _228 = in.m_49.x;
    float _230 = in.m_49.y;
    float _232 = in.m_49.z;
    float _234 = 0.0;
    float _236 = _224;
    if (!_204)
    {
        _234 = 0.0;
    }
    float _238 = _234;
    float _240 = 0.0;
    float _242 = 0.0;
    float _244 = _238;
    if (!_206)
    {
        _240 = 0.0;
        _242 = 0.0;
    }
    float _246 = _240;
    float _248 = _242;
    float _250 = 0.0;
    float _252 = _246;
    float _254 = _248;
    if (_206)
    {
        float _256 = rsqrt(_192);
        _250 = _256;
    }
    float _258 = _250;
    if (!_172)
    {
        float _260 = _156 * _156;
        float _262 = _260 * 0.5;
        _210 = _262;
    }
    float _264 = _210;
    float _266 = 0.0;
    float _268 = _264;
    if (!_204)
    {
        _266 = 0.0;
    }
    float _270 = _266;
    float _272 = _270;
    if (!_172)
    {
        float _274 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _268 = _274;
    }
    float _276 = _268;
    float _278 = _198;
    float _280 = _276;
    if (_226)
    {
        float _282 = rsqrt(_198);
        _278 = _282;
    }
    float _284 = _278;
    float _286 = _220;
    if (_204)
    {
        float _288 = _220 * _158;
        _236 = _288;
    }
    float _290 = _236;
    if (_204)
    {
        float _292 = _220 * _150;
        _244 = _292;
    }
    float _294 = _244;
    if (_204)
    {
        float _296 = _220 * _174;
        _272 = _296;
    }
    float _298 = _272;
    float _300 = 0.0;
    float _302 = 0.0;
    if (!_226)
    {
        _300 = 0.0;
        _302 = 0.0;
    }
    float _304 = _300;
    float _306 = _302;
    float _308 = _306;
    float _310 = _304;
    if (!_206)
    {
        _286 = 0.0;
    }
    float _312 = _286;
    float _314 = 0.0;
    float _316 = _312;
    if (!_226)
    {
        _314 = 0.0;
    }
    float _318 = _314;
    float _320 = _318;
    if (_206)
    {
        float _322 = _258 * _160;
        _316 = _322;
    }
    float _324 = _316;
    if (_206)
    {
        float _326 = _258 * _152;
        _252 = _326;
    }
    float _328 = _252;
    if (_206)
    {
        float _330 = _258 * _176;
        _254 = _330;
    }
    float _332 = _254;
    if (_226)
    {
        float _334 = _284 * _162;
        _308 = _334;
    }
    float _336 = _308;
    if (_226)
    {
        float _338 = _284 * _154;
        _310 = _338;
    }
    float _340 = _310;
    if (_226)
    {
        float _342 = _284 * _178;
        _320 = _342;
    }
    float _344 = _320;
    bool _346 = !_172;
    if (!_346)
    {
        float _348 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _350 = log2(_348);
        float _352 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _354 = _352 + 1.0;
        float _356 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _358 = _156 * _350;
        float _360 = 1.0 / _354;
        float _362 = _356 * 0.693147182464599609375;
        float _364 = exp2(_358);
        float _366 = 1.0 / _362;
        float _368 = _364 + (-1.0);
        float _370 = -_368;
        float _372 = fma(_370, _366, _156);
        float _374 = _372 * _360;
        float _376 = _374 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _280 = _376;
    }
    float _378 = _280;
    float _380 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _382 = !_172;
    float _384 = _380;
    float _386 = _378;
    if (!_382)
    {
        float _388 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _390 = log2(_388);
        float _392 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _394 = _392 + 1.0;
        float _396 = 1.0 / _394;
        float _398 = _156 * _390;
        float _400 = exp2(_398);
        float _402 = -_400;
        float _404 = _402 + 1.0;
        float _406 = _404 * _396;
        _212 = _406;
    }
    float _408 = _212;
    float _410 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _412 = _380 * _294;
    float _414 = _380 * _328;
    float _416 = _380 * _340;
    if (!_172)
    {
        float _418 = _128 * _128;
        float _420 = _418 * 0.5;
        _384 = _420;
    }
    float _422 = _384;
    float _424 = fma(_410, _290, _412);
    float _426 = fma(_410, _324, _414);
    float _428 = fma(_410, _336, _416);
    float _430 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_172)
    {
        float _432 = _422 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _386 = _432;
    }
    float _434 = _386;
    bool _436 = !_172;
    float _438 = _434;
    if (!_436)
    {
        float _440 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _442 = log2(_440);
        float _444 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _446 = _444 + 1.0;
        float _448 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _450 = _128 * _442;
        float _452 = 1.0 / _446;
        float _454 = _448 * 0.693147182464599609375;
        float _456 = exp2(_450);
        float _458 = 1.0 / _454;
        float _460 = _456 + (-1.0);
        float _462 = -_460;
        float _464 = fma(_462, _458, _128);
        float _466 = _464 * _452;
        float _468 = _466 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _438 = _468;
    }
    float _470 = _438;
    float _472 = _470 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _474 = fma(_430, _298, _424);
    float _476 = fma(_430, _332, _426);
    float _478 = fma(_430, _344, _428);
    float _480 = _470 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _482 = _472 * _328;
    float _484 = _472 * _294;
    float _486 = _472 * _340;
    float _488 = _470 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _490 = fma(_480, _324, _482);
    float _492 = fma(_480, _290, _484);
    float _494 = fma(_480, _336, _486);
    float _496 = fma(_408, _230, _476);
    float _498 = fma(_488, _332, _490);
    float _500 = _490;
    if (!_172)
    {
        _500 = _128;
    }
    float _502 = _500;
    bool _504 = !_172;
    float _506 = _502;
    if (!_504)
    {
        float _508 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _510 = log2(_508);
        float _512 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _514 = _512 + 1.0;
        float _516 = 1.0 / _514;
        float _518 = _128 * _510;
        float _520 = exp2(_518);
        float _522 = -_520;
        float _524 = _522 + 1.0;
        float _526 = _524 * _516;
        _506 = _526;
    }
    float _528 = _506;
    float _530 = fma(_488, _298, _492);
    float _532 = fma(_528, _230, _498);
    float _534 = fma(_488, _344, _494);
    float _536 = fma(_408, _228, _474);
    float _538 = fma(_528, _228, _530);
    float _540 = -_532;
    float _542 = _496 + _540;
    float _544 = fma(_408, _232, _478);
    float _546 = fma(_528, _232, _534);
    float _548 = -_538;
    float _550 = _536 + _548;
    float _552 = _542 * _542;
    float _554 = in.m_57.w;
    float _556 = -_546;
    float _558 = _544 + _556;
    float _560 = _542 * _160;
    float _562 = fma(_550, _550, _552);
    float _564 = _542 * _152;
    float _566 = _542 * _176;
    float _568 = fma(_550, _158, _560);
    float _570 = fma(_558, _558, _562);
    float _572 = fma(_550, _150, _564);
    float _574 = in.m_44.x;
    float _576 = in.m_44.y;
    float _578 = in.m_44.z;
    float _580 = fma(_558, _162, _568);
    float _582 = fma(_550, _174, _566);
    float _584 = fma(_558, _154, _572);
    float _586 = sqrt(_570);
    float _588 = fma(_558, _178, _582);
    bool _590 = _586 >= 9.9999999747524270787835121154785e-07;
    bool _592 = isnan(_586);
    bool _594 = _590 || _592;
    bool _596 = isnan(9.9999999747524270787835121154785e-07);
    bool _598 = _594 || _596;
    float _600 = fma(_536, _554, _574);
    float _602 = fma(_496, _554, _576);
    float _604 = fma(_544, _554, _578);
    float _606 = _554;
    float _608 = _588;
    float _610 = _580;
    float _612 = _580;
    float _614 = _588;
    if (_598)
    {
        _606 = _584;
    }
    float _616 = _606;
    float _618 = _616;
    float _620 = _616;
    if (!_598)
    {
        bool _622 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _624 = !_622;
        if (!_624)
        {
            float _626 = _328 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _628 = _294 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _630 = _340 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _632 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[16].x, _626);
            float _634 = fma(_290, (*spvDescriptorSet0.vp_c9)._m0[16].x, _628);
            float _636 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[16].x, _630);
            float _638 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[16].z, _632);
            float _640 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[16].z, _634);
            float _642 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[16].z, _636);
            float _644 = _638 * _152;
            float _646 = _638 * _160;
            float _648 = _638 * _176;
            float _650 = fma(_640, _150, _644);
            float _652 = fma(_640, _158, _646);
            float _654 = fma(_640, _174, _648);
            float _656 = fma(_642, _154, _650);
            float _658 = fma(_642, _162, _652);
            float _660 = fma(_642, _178, _654);
            float _662 = _656 * _656;
            float _664 = fma(_658, _658, _662);
            float _666 = fma(_660, _660, _664);
            float _668 = rsqrt(_666);
            float _670 = _668 * 9.9999999747524270787835121154785e-07;
            float _672 = _658 * _670;
            float _674 = _656 * _670;
            float _676 = _660 * _670;
            _620 = _674;
            _612 = _672;
            _614 = _676;
            _678 = true;
        }
        else
        {
            float _680 = _230 * _230;
            float _682 = fma(_228, _228, _680);
            float _684 = fma(_232, _232, _682);
            float _686 = sqrt(_684);
            bool _688 = _686 >= 9.9999999747524270787835121154785e-07;
            bool _690 = isnan(_686);
            bool _692 = _688 || _690;
            bool _694 = isnan(9.9999999747524270787835121154785e-07);
            bool _696 = _692 || _694;
            if (!_696)
            {
                float _698 = _576 * _576;
                float _700 = fma(_574, _574, _698);
                float _702 = fma(_578, _578, _700);
                float _704 = sqrt(_702);
                bool _706 = _704 >= 9.9999999747524270787835121154785e-07;
                bool _708 = isnan(_704);
                bool _710 = _706 || _708;
                bool _712 = isnan(9.9999999747524270787835121154785e-07);
                bool _714 = _710 || _712;
                float _716 = _192;
                if (!_714)
                {
                    float _718 = rsqrt(_192);
                    _716 = _718;
                }
                float _720 = _716;
                if (!_714)
                {
                    float _722 = _720 * 9.9999999747524270787835121154785e-07;
                    _608 = _722;
                }
                float _724 = _608;
                float _726 = _724;
                if (!_714)
                {
                    float _728 = _160 * _724;
                    _610 = _728;
                }
                float _730 = _610;
                _612 = _730;
                if (!_714)
                {
                    float _732 = _152 * _724;
                    _618 = _732;
                }
                float _734 = _618;
                _620 = _734;
                if (!_714)
                {
                    float _736 = _176 * _724;
                    _726 = _736;
                }
                float _738 = _726;
                bool _740 = !_714;
                _614 = _738;
                _678 = _740;
                if (!_678)
                {
                    float _742 = _152 * _576;
                    float _744 = _160 * _576;
                    float _746 = _176 * _576;
                    float _748 = fma(_150, _574, _742);
                    float _750 = fma(_158, _574, _744);
                    float _752 = fma(_174, _574, _746);
                    float _754 = fma(_154, _578, _748);
                    float _756 = fma(_162, _578, _750);
                    float _758 = fma(_178, _578, _752);
                    float _760 = _754 * _754;
                    float _762 = fma(_756, _756, _760);
                    float _764 = fma(_758, _758, _762);
                    float _766 = rsqrt(_764);
                    float _768 = _766 * 9.9999999747524270787835121154785e-07;
                    float _770 = _756 * _768;
                    float _772 = _754 * _768;
                    float _774 = _758 * _768;
                    _620 = _772;
                    _612 = _770;
                    _614 = _774;
                    _678 = true;
                }
            }
            else
            {
                float _776 = _152 * _230;
                float _778 = _160 * _230;
                float _780 = _176 * _230;
                float _782 = fma(_150, _228, _776);
                float _784 = fma(_158, _228, _778);
                float _786 = fma(_174, _228, _780);
                float _788 = fma(_154, _232, _782);
                float _790 = fma(_162, _232, _784);
                float _792 = fma(_178, _232, _786);
                float _794 = _788 * _788;
                float _796 = fma(_790, _790, _794);
                float _798 = fma(_792, _792, _796);
                float _800 = rsqrt(_798);
                float _802 = _800 * 9.9999999747524270787835121154785e-07;
                float _804 = _790 * _802;
                float _806 = _788 * _802;
                float _808 = _792 * _802;
                _620 = _806;
                _612 = _804;
                _614 = _808;
            }
        }
    }
    _678 = false;
    float _810 = _620;
    float _812 = _612;
    float _814 = _614;
    bool _816 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _818 = !_816;
    float _820 = _810;
    float _822 = _812;
    float _824 = _814;
    float _842;
    if (!_818)
    {
        float _826 = in.m_59.x;
        float _828 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _830 = _826 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _832 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _834 = _832 * _828;
        float _836 = floor(_834);
        float _838 = -_836;
        float _840 = _834 + _838;
        _842 = _840;
        _844 = true;
    }
    else
    {
        float _846 = float(_94);
        float _848 = 1.0 / _846;
        float _850 = _128 * _848;
        _842 = _850;
    }
    _844 = false;
    float _852 = _842;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _856 = _852 + _854;
    bool _858 = _852 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _860 = isnan(_852);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _866 = _862 || _864;
    float _868 = float(_866);
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _872 = _852 + _870;
    bool _874 = _852 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _876 = isnan(_852);
    bool _878 = _874 || _876;
    bool _880 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _882 = _878 || _880;
    float _884 = float(_882);
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _886;
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _892 = _890 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _894 = _852 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _896 = isnan(_852);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _902 = _898 || _900;
    float _904 = float(_902);
    float _906 = -_868;
    float _908 = _906 + 1.0;
    float _910 = 1.0 / _892;
    float _912 = _904 * _908;
    float _914 = -_904;
    float _916 = _914 + 1.0;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _918;
    bool _922 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _924 = 1.0 / _888;
    float _926 = _884 * _916;
    float _928 = -_884;
    float _930 = _928 + 1.0;
    float _932 = _872 * _910;
    float _934 = _856 * _924;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _936;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _940;
    float _944 = fma(_920, _934, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _946 = fma(_938, _934, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _948 = fma(_942, _934, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _950 = in.m_57.x;
    float _952 = in.m_57.y;
    float _954 = in.m_57.z;
    float _956 = _944 * _926;
    float _958 = _946 * _926;
    float _960 = _948 * _926;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _964 = _962 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _972 = _970 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _974 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[143].x, _956);
    float _976 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[143].y, _958);
    float _978 = fma(_964, _932, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _980 = fma(_968, _932, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _982 = fma(_972, _932, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _984 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[143].z, _960);
    float _986 = fma(_978, _912, _974);
    float _988 = fma(_980, _912, _976);
    float _990 = fma(_982, _912, _984);
    float _992 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[145].x, _986);
    float _994 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[145].y, _988);
    float _996 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[145].z, _990);
    float _998 = _992 * _950;
    float _1000 = _994 * _952;
    float _1002 = _996 * _954;
    bool _1004 = !_922;
    float _1006 = _872;
    float _1008 = _998;
    float _1026;
    if (!_1004)
    {
        float _1010 = in.m_59.x;
        float _1012 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _1014 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _1016 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _1018 = _1016 * _1012;
        float _1020 = floor(_1018);
        float _1022 = -_1020;
        float _1024 = _1018 + _1022;
        _1026 = _1024;
        _1028 = true;
    }
    else
    {
        float _1030 = float(_94);
        float _1032 = 1.0 / _1030;
        float _1034 = _128 * _1032;
        _1026 = _1034;
    }
    _1028 = false;
    float _1036 = _1026;
    float _1038 = _810 * _810;
    float _1040 = _602 * _152;
    float _1042 = _602 * _176;
    float _1044 = in.m_59.w;
    float _1046 = fma(_812, _812, _1038);
    float _1048 = fma(_600, _150, _1040);
    float _1050 = fma(_600, _174, _1042);
    float _1052 = fma(_814, _814, _1046);
    float _1054 = _602 * _160;
    float _1056 = fma(_604, _154, _1048);
    float _1058 = fma(_604, _178, _1050);
    float _1060 = rsqrt(_1052);
    float _1062 = fma(_600, _158, _1054);
    float _1064 = _1056 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1066 = _1058 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1068 = fma(_604, _162, _1062);
    float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1072 = _1064 + _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1076 = _1066 + _1074;
    float _1078 = _998 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1080 = _1068 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1082 = _1072 * _1072;
    float _1084 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1084;
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1090 = _1088 != 0;
    float _1092 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1094 = _1080 + _1092;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1098 = _1036 + _1096;
    float _1100 = _1060 * _810;
    float _1102 = fma(_1094, _1094, _1082);
    float _1104 = _1060 * _812;
    float _1106 = _1060 * _814;
    float _1108 = _1100 * _328;
    float _1110 = fma(_1076, _1076, _1102);
    float _1112 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1114 = _1044 > 0.5;
    float _1116 = fma(_1104, _324, _1108);
    float _1118 = in.m_61.x;
    float _1120 = in.m_61.y;
    float _1122 = in.m_61.z;
    float _1124 = 1.0 / _1086;
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1128 = _1126 != 0;
    float _1130 = fma(_1106, _332, _1116);
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1134 = _1132 != 0;
    float _1136 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1140 = _1138 != 0;
    float _1142 = in.m_63.x;
    float _1144 = abs(_1130);
    bool _1146 = _1144 > 0.99989998340606689453125;
    float _1148 = rsqrt(_1110);
    float _1150 = in.m_63.y;
    float _1152 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    bool _1154 = _1036 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1156 = isnan(_1036);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1162 = _1158 || _1160;
    float _1164 = float(_1162);
    float _1166 = _1098 * _1124;
    float _1168 = 0.0;
    bool _1170 = _1114;
    bool _1172 = _1140;
    float _1174 = _1142;
    float _1176 = _1052;
    if (_1134)
    {
        float _1178 = in.m_59.z;
        _1168 = _1178;
    }
    float _1180 = _1168;
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1182;
    bool _1186 = _1036 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1188 = isnan(_1036);
    bool _1190 = _1186 || _1188;
    bool _1192 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1194 = _1190 || _1192;
    float _1196 = float(_1194);
    float _1198 = -_1164;
    float _1200 = _1198 + 1.0;
    if (!_1146)
    {
        _1006 = _324;
    }
    float _1202 = _1006;
    float _1204 = _1202;
    if (_1146)
    {
        float _1206 = fma(_336, 0.001000000047497451305389404296875, _324);
        _1204 = _1206;
    }
    float _1208 = _1204;
    float _1210 = 0.0;
    if (!_1146)
    {
        _1210 = _328;
    }
    float _1212 = _1210;
    float _1214 = _1112 * _1148;
    float _1216 = _1212;
    if (!_1146)
    {
        _1008 = _332;
    }
    float _1218 = _1008;
    float _1220 = _1218;
    if (_1146)
    {
        float _1222 = fma(_340, 0.001000000047497451305389404296875, _328);
        _1216 = _1222;
    }
    float _1224 = _1216;
    if (_1146)
    {
        float _1226 = fma(_344, 0.001000000047497451305389404296875, _332);
        _1220 = _1226;
    }
    float _1228 = _1220;
    int _1230 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1232 = _1230 != 0;
    float _1234 = _1072 * _1214;
    float _1236 = _1094 * _1214;
    float _1238 = _1076 * _1214;
    float _1240 = -_1228;
    float _1242 = _1100 * _1240;
    float _1244 = -_1234;
    float _1246 = _1072 + _1244;
    float _1248 = -_1236;
    float _1250 = _1094 + _1248;
    float _1252 = -_1238;
    float _1254 = _1076 + _1252;
    float _1256 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1122);
    float _1258 = _1246 * _1246;
    float _1260 = -_1224;
    float _1262 = _1104 * _1260;
    float _1264 = -_1224;
    float _1266 = -_1242;
    float _1268 = fma(_1106, _1264, _1266);
    float _1270 = in.m_59.y;
    float _1272 = fma(_1250, _1250, _1258);
    float _1274 = -_1208;
    float _1276 = _1106 * _1274;
    float _1278 = -_1208;
    float _1280 = -_1262;
    float _1282 = fma(_1100, _1278, _1280);
    float _1284 = in.m_59.x;
    float _1286 = fma(_1254, _1254, _1272);
    float _1288 = -_1228;
    float _1290 = -_1276;
    float _1292 = fma(_1104, _1288, _1290);
    float _1294 = -_1150;
    float _1296 = _1294 + 1.0;
    float _1298 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1120);
    float _1300 = sqrt(_1286);
    float _1302 = _1292 * _1292;
    float _1304 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1118);
    int _1306 = _1114 ? as_type<int>(_1296) : as_type<int>(_1150);
    float _1308 = fma(_1268, _1268, _1302);
    float _1310 = _1286;
    float _1312 = _1180;
    float _1314 = _1150;
    if (_1134)
    {
        bool _1316 = _1180 > 0.5;
        _1170 = _1316;
    }
    bool _1318 = _1170;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1320;
    float _1324 = _1140 ? as_type<float>(_1306) : _1150;
    float _1326 = fma(_1282, _1282, _1308);
    float _1328 = fma(_1322, _1166, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    if (!_1128)
    {
        _1310 = _1142;
    }
    float _1330 = _1310;
    int _1332 = 0;
    float _1334 = _1330;
    if (_1134)
    {
        float _1336 = -_1142;
        float _1338 = _1336 + 1.0;
        _1332 = as_type<int>(_1338);
    }
    int _1340 = _1332;
    float _1342 = rsqrt(_1326);
    if (!_1090)
    {
        _1312 = _1270;
    }
    float _1344 = _1312;
    float _1346 = _1148 * _1300;
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1348;
    float _1352 = _1152 * _1284;
    float _1354 = _1344;
    if (_1128)
    {
        bool _1356 = _1284 > 0.5;
        _1172 = _1356;
    }
    bool _1358 = _1172;
    float _1360 = _1136 * _1346;
    if (_1090)
    {
        _1354 = _1284;
    }
    float _1362 = _1354;
    float _1364 = fma(_1350, _1166, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1366 = _1078 * _1346;
    float _1368 = trunc(_1352);
    int _1370 = int(_1368);
    float _1372 = fma(_1184, _1166, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1374 = _1360 * _1256;
    float _1376 = _1366 * _1304;
    float _1378 = _1282 * _1342;
    float _1380 = _1000 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1382 = _1268 * _1342;
    float _1384 = _1292 * _1342;
    float _1386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1388 = _1380 * _1346;
    float _1390 = _1104 * _1384;
    float _1392 = _1380;
    if (!_1090)
    {
        float _1394 = in.m_59.z;
        _1392 = _1394;
    }
    float _1396 = _1392;
    float _1398 = _1388 * _1298;
    float _1400 = _1100 * _1378;
    float _1402 = -_1390;
    float _1404 = fma(_1100, _1382, _1402);
    float _1406 = -_1196;
    float _1408 = _1406 + 1.0;
    float _1410 = _1398 * _1104;
    float _1412 = _1398 * _1106;
    float _1414 = -_1400;
    float _1416 = fma(_1106, _1384, _1414);
    int _1418 = _1370 << 4;
    int _1420 = _1418 + 1968;
    float _1422 = fma(_1376, _1382, _1410);
    float _1424 = fma(_1376, _1378, _1412);
    float _1426 = _1164 * _1408;
    float _1428 = _1386 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1430 = fma(_1374, _1416, _1422);
    float _1432 = fma(_1374, _1404, _1424);
    int _1434 = _1420 + 8;
    uint _1437 = uint(int(uint(_1434) >> uint(2)));
    uint _1439 = uint(int(uint(int(_1437)) >> uint(2)));
    int _1441 = int(_1437) & 3;
    float _1443 = (*spvDescriptorSet0.vp_c9)._m0[int(_1439)][_1441];
    float _1445 = fma(_1428, _1324, -0.5);
    float _1447 = _1080 + _1430;
    float _1449 = _1066 + _1432;
    float _1451 = _1364 * _1426;
    float _1453 = _1328 * _1426;
    float _1455 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1457 = _1447 + _1455;
    float _1459 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1461 = _1449 + _1459;
    uint _1463 = uint(int(uint(_1420) >> uint(2)));
    uint _1465 = uint(int(uint(int(_1463)) >> uint(2)));
    int _1467 = int(_1463) & 3;
    float _1469 = (*spvDescriptorSet0.vp_c9)._m0[int(_1465)][_1467];
    int _1471 = int(_1463) + 1;
    uint _1473 = uint(int(uint(_1471) >> uint(2)));
    int _1475 = _1471 & 3;
    float _1477 = (*spvDescriptorSet0.vp_c9)._m0[int(_1473)][_1475];
    float _1479 = _1432;
    float _1481 = _1396;
    int _1483 = as_type<int>(_1426);
    float _1485 = _1447;
    float _1487 = _1449;
    if (!_1090)
    {
        _1479 = _1396;
    }
    float _1489 = _1479;
    float _1491 = _1457 * _1457;
    float _1493 = _1461 * _1461;
    float _1495 = _1489;
    float _1497 = _1491;
    float _1499 = _1493;
    if (_1090)
    {
        _1495 = _1270;
    }
    float _1501 = _1495;
    float _1503 = _1372 * _1426;
    if (_1090)
    {
        _1481 = _1270;
    }
    float _1505 = _1481;
    float _1507 = _1491 + _1493;
    bool _1509 = _1270 > 0.5;
    float _1511 = _1106 * _1382;
    float _1513 = sqrt(_1507);
    if (_1128)
    {
        float _1515 = -_1142;
        float _1517 = _1515 + 1.0;
        _1483 = as_type<int>(_1517);
    }
    int _1519 = _1483;
    float _1521 = -_1511;
    float _1523 = fma(_1104, _1378, _1521);
    float _1525 = _1398 * _1100;
    float _1527 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1529 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1451);
    if (_1128)
    {
        float _1531 = _1358 ? as_type<float>(_1519) : _1142;
        _1334 = _1531;
    }
    float _1533 = _1334;
    float _1535 = fma(_1376, _1384, _1525);
    float _1537 = fma(_1362, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1527);
    float _1539 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1541 = _1362 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1543 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1545 = fma(_1374, _1523, _1535);
    float _1547 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1549 = _1513 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1551 = -_1543;
    float _1553 = fma(_1541, 2.0, _1551);
    if (_1134)
    {
        float _1555 = _1318 ? as_type<float>(_1340) : _1142;
        _1174 = _1555;
    }
    float _1557 = _1174;
    float _1559 = fma(_1505, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1547);
    float _1561 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1453);
    float _1563 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1503);
    float _1565 = _1064 + _1545;
    bool _1567 = !_1549;
    float _1569 = _1565;
    if (!_1567)
    {
        float _1571 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1573 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1575 = _1513 + _1573;
        float _1577 = rsqrt(_1507);
        float _1579 = _1575 * _1571;
        float _1581 = _1565 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1583 = _1579 * 0.15915493667125701904296875;
        float _1585 = _1583 * 6.283185482025146484375;
        float _1587 = sin(_1585);
        float _1589 = _1583 * 6.283185482025146484375;
        float _1591 = cos(_1589);
        float _1593 = fma(_1587, _1581, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1595 = _1577 * _1593;
        float _1597 = fma(_1457, _1595, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1599 = _1591 + (-1.0);
        float _1601 = fma(_1461, _1595, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1603 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1605 = _1597 + _1603;
        float _1607 = _1599 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1609 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1611 = _1601 + _1609;
        float _1613 = _1605 * _1605;
        float _1615 = fma(_1565, _1591, _1607);
        float _1617 = _1611 * _1611;
        _1569 = _1615;
        _1497 = _1613;
        _1499 = _1617;
        _1485 = _1597;
        _1487 = _1601;
    }
    float _1619 = _1569;
    float _1621 = _1497;
    float _1623 = _1499;
    float _1625 = _1485;
    float _1627 = _1487;
    if (_1232)
    {
        float _1629 = _1509 ? _1296 : _1150;
        _1314 = _1629;
    }
    float _1631 = _1314;
    float _1633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1635 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1637 = _1619 + _1635;
    float _1639 = _1539 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1641 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1643 = _1501 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1645 = fma(_1637, _1637, _1621);
    float _1647 = fma(_1639, _1557, -0.5);
    float _1649 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1537);
    float _1651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1653 = fma(_1643, -2.0, _1641);
    float _1655 = -_128;
    float _1657 = fma(_1655, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1553);
    float _1659 = _1645 + _1623;
    float _1661 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1561);
    float _1663 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1559);
    float _1665 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1653);
    float _1667 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1529);
    float _1669 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1563);
    float _1671 = fma(_1649, _1647, _1657);
    float _1673 = _1533 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1675 = _1631 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1677 = -_1665;
    float _1679 = fma(_1663, _1445, _1677);
    float _1681 = _1469 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1683 = _1443 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1685 = sqrt(_1659);
    float _1687 = _1673 * _1633;
    float _1689 = _1675 * _1651;
    float _1691 = _1477 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1693 = _1661 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1695 = _1667 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1697 = _1669 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1699 = _1681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1701 = _1683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1703 = _1671 + 0.5;
    float _1705 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1707 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1709 = _1693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1711 = _1695 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1713 = _1697 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1715 = _1679 + 0.5;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    bool _1717 = _1685 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1719 = isnan(_1685);
    bool _1721 = _1717 || _1719;
    bool _1723 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1725 = _1721 || _1723;
    out.m_67.x = _1699;
    out.m_67.y = _1707;
    out.m_67.z = _1701;
    out.m_69.x = _1709;
    out.m_69.y = _1711;
    out.m_69.z = _1713;
    out.m_69.w = _1705;
    out.m_71.x = _1687;
    out.m_71.y = _1689;
    out.m_71.z = _1703;
    out.m_71.w = _1715;
    float _1727 = _1679;
    float _1729 = _1713;
    if (!_1725)
    {
        _1727 = 1.0;
    }
    float _1731 = _1727;
    bool _1733 = !_1725;
    float _1735 = _1731;
    if (!_1733)
    {
        bool _1737 = _1685 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1739 = isnan(_1685);
        bool _1741 = _1737 || _1739;
        bool _1743 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1745 = _1741 || _1743;
        if (!_1745)
        {
            float _1747 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1749 = _1685 + _1747;
            float _1751 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1753 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1751;
            float _1755 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1757 = _1755 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1759 = 1.0 / _1753;
            float _1761 = _1749 * _1759;
            float _1763 = fma(_1761, _1757, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1735 = _1763;
            _1765 = true;
        }
        else
        {
            bool _1767 = _1685 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1769 = isnan(_1685);
            bool _1771 = _1767 || _1769;
            bool _1773 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1775 = _1771 || _1773;
            if (!_1775)
            {
                float _1777 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1779 = _1685 + _1777;
                float _1781 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1783 = _1781 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1785 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1787 = _1785 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1789 = 1.0 / _1783;
                float _1791 = _1779 * _1789;
                float _1793 = fma(_1791, _1787, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1735 = _1793;
                _1765 = true;
            }
            else
            {
                _1735 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1765 = false;
    float _1795 = _1735;
    float _1797 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1799 = _1619 + _1797;
    float _1801 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1803 = _1625 + _1801;
    float _1805 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1807 = _1627 + _1805;
    float _1809 = fma(_1799, _1795, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1811 = fma(_1803, _1795, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1813 = fma(_1807, _1795, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1815 = -_1064;
    float _1817 = _1815 + _1809;
    float _1819 = -_1080;
    float _1821 = _1819 + _1811;
    float _1823 = -_1066;
    float _1825 = _1823 + _1813;
    float _1827 = _1817 * _1817;
    float _1829 = fma(_1821, _1821, _1827);
    float _1831 = fma(_1825, _1825, _1829);
    float _1833 = sqrt(_1831);
    bool _1835 = _1833 > 0.0;
    bool _1837 = !_1835;
    float _1839 = _1829;
    float _1841 = _1833;
    float _1843 = _1811;
    float _1845 = _1809;
    float _1847 = _1813;
    if (!_1837)
    {
        bool _1849 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1851 = _1689;
        if (_1849)
        {
            float _1853 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1851 = _1853;
        }
        float _1855 = _1851;
        if (_1849)
        {
            float _1857 = _1855 * _812;
            _1729 = _1857;
        }
        float _1859 = _1729;
        float _1861 = _1859;
        if (_1849)
        {
            float _1863 = _1855 * _810;
            _1839 = _1863;
        }
        float _1865 = _1839;
        float _1867 = _1865;
        if (_1849)
        {
            float _1869 = _1855 * _814;
            _1841 = _1869;
        }
        float _1871 = _1841;
        float _1873 = _1871;
        if (!_1849)
        {
            float _1875 = _128 + 1.0;
            if (!_172)
            {
                float _1877 = _1875 * _1875;
                float _1879 = _1877 * 0.5;
                _130 = _1879;
            }
            float _1881 = _130;
            float _1883 = _1881;
            if (!_172)
            {
                float _1885 = _1881 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1883 = _1885;
            }
            float _1887 = _1883;
            bool _1889 = !_172;
            float _1891 = _1887;
            if (!_1889)
            {
                float _1893 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1895 = log2(_1893);
                float _1897 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1899 = _1897 + 1.0;
                float _1901 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1903 = _1895 * _1875;
                float _1905 = 1.0 / _1899;
                float _1907 = _1901 * 0.693147182464599609375;
                float _1909 = exp2(_1903);
                float _1911 = 1.0 / _1907;
                float _1913 = _1909 + (-1.0);
                float _1915 = -_1913;
                float _1917 = fma(_1915, _1911, _1875);
                float _1919 = _1917 * _1905;
                float _1921 = _1919 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1891 = _1921;
            }
            float _1923 = _1891;
            float _1925 = _1923 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _1927 = _1923 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1929 = _1923 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1931 = _1923;
            if (!_172)
            {
                _1931 = _1875;
            }
            float _1933 = _1931;
            float _1935 = _1925 * _328;
            float _1937 = _1925 * _294;
            float _1939 = _1925 * _340;
            float _1941 = fma(_1927, _324, _1935);
            float _1943 = fma(_1927, _290, _1937);
            float _1945 = fma(_1929, _332, _1941);
            bool _1947 = !_172;
            float _1949 = _1933;
            if (!_1947)
            {
                float _1951 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1953 = log2(_1951);
                float _1955 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1957 = _1955 + 1.0;
                float _1959 = 1.0 / _1957;
                float _1961 = _1953 * _1875;
                float _1963 = exp2(_1961);
                float _1965 = -_1963;
                float _1967 = _1965 + 1.0;
                float _1969 = _1967 * _1959;
                _1949 = _1969;
            }
            float _1971 = _1949;
            float _1973 = fma(_1927, _336, _1939);
            float _1975 = fma(_1929, _298, _1943);
            float _1977 = fma(_1971, _230, _1945);
            float _1979 = fma(_1929, _344, _1973);
            float _1981 = fma(_1971, _228, _1975);
            float _1983 = -_532;
            float _1985 = _1983 + _1977;
            float _1987 = fma(_1971, _232, _1979);
            float _1989 = -_538;
            float _1991 = _1989 + _1981;
            float _1993 = _1985 * _152;
            float _1995 = _1985 * _160;
            float _1997 = -_546;
            float _1999 = _1997 + _1987;
            float _2001 = _1985 * _176;
            float _2003 = fma(_1991, _150, _1993);
            float _2005 = fma(_1991, _158, _1995);
            float _2007 = fma(_1991, _174, _2001);
            float _2009 = fma(_1999, _154, _2003);
            float _2011 = fma(_1999, _162, _2005);
            float _2013 = fma(_1999, _178, _2007);
            float _2015 = _2009 * _2009;
            float _2017 = fma(_2011, _2011, _2015);
            float _2019 = fma(_2013, _2013, _2017);
            _1176 = _2019;
            _820 = _2009;
            _822 = _2011;
            _824 = _2013;
            _1861 = _2011;
            _1867 = _2009;
            _1873 = _2013;
        }
        float _2021 = _1176;
        float _2023 = _820;
        float _2025 = _822;
        float _2027 = _824;
        float _2029 = _1861;
        float _2031 = _1867;
        float _2033 = _1873;
        float _2035 = sqrt(_2021);
        float _2037 = rsqrt(_1831);
        bool _2039 = _2035 > 0.0;
        float _2041 = _1821 * _2037;
        float _2043 = _1817 * _2037;
        float _2045 = _1825 * _2037;
        bool _2047 = !_2039;
        if (!_2047)
        {
            float _2049 = rsqrt(_2021);
            float _2051 = _2049 * _2023;
            float _2053 = _2049 * _2025;
            float _2055 = _2043 * _2051;
            float _2057 = _2049 * _2027;
            float _2059 = fma(_2041, _2053, _2055);
            float _2061 = fma(_2045, _2057, _2059);
            float _2063 = _2061 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2065 = fma(_2029, _2063, _1811);
            float _2067 = fma(_2031, _2063, _1809);
            float _2069 = fma(_2033, _2063, _1813);
            _1843 = _2065;
            _1845 = _2067;
            _1847 = _2069;
        }
    }
    float _2071 = _1843;
    float _2073 = _1845;
    float _2075 = _1847;
    float _2077 = -_1236;
    float _2079 = _2077 + _2071;
    float _2081 = -_1234;
    float _2083 = _2081 + _2073;
    float _2085 = -_1238;
    float _2087 = _2085 + _2075;
    bool _2089 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2091 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2093 = _2089 || _2091;
    bool _2095 = isnan(0.5);
    bool _2097 = _2093 || _2095;
    float _2099 = _2083;
    float _2101 = _2079;
    float _2103 = _2087;
    if (!_2097)
    {
        float _2105 = -_1234;
        float _2107 = _1064 + _2105;
        float _2109 = -_1236;
        float _2111 = _1080 + _2109;
        float _2113 = -_1238;
        float _2115 = _1066 + _2113;
        float _2117 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2119 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2121 = _2107 + _2119;
        float _2123 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2125 = _2111 + _2123;
        float _2127 = -_1066;
        float _2129 = _2127 + _2075;
        float _2131 = -_1080;
        float _2133 = _2131 + _2071;
        float _2135 = _2121 * _2121;
        float _2137 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2139 = _2115 + _2137;
        float _2141 = -_1064;
        float _2143 = _2141 + _2073;
        float _2145 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2147 = fma(_2125, _2125, _2135);
        float _2149 = fma(_2139, _2139, _2147);
        float _2151 = 1.0 / _1346;
        float _2153 = sqrt(_2149);
        float _2155 = _2145 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2157 = precise::min(_2153, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2159 = _2157 * _2117;
        float _2161 = _2159 * _2151;
        float _2163 = _2155 * _2161;
        float _2165 = _2129 * _2161;
        float _2167 = fma(_2133, _2163, _2111);
        float _2169 = fma(_2143, _2163, _2107);
        float _2171 = fma(_2155, _2165, _2115);
        _2099 = _2169;
        _2101 = _2167;
        _2103 = _2171;
    }
    float _2173 = _2099;
    float _2175 = _2101;
    float _2177 = _2103;
    float _2179 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2181 = _2173 + _2179;
    float _2183 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2185 = _2175 + _2183;
    float _2187 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2189 = _2177 + _2187;
    float _2191 = _2181 * _2181;
    float _2193 = fma(_2185, _2185, _2191);
    float _2195 = fma(_2189, _2189, _2193);
    float _2197 = rsqrt(_2195);
    float _2199 = sqrt(_2195);
    float _2201 = _2197 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2203 = _2185 * _2201;
    float _2205 = _2189 * _2201;
    float _2207 = _2203 * _2203;
    float _2209 = _2205 * _2205;
    float _2211 = _2207 + _2209;
    float _2213 = sqrt(_2211);
    bool _2215 = _2213 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2217 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2219 = _2213 + _2217;
    float _2221 = _2197;
    float _2223 = _2211;
    float _2225 = _2219;
    float _2227 = _2181;
    if (_2215)
    {
        float _2229 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2221 = _2229;
    }
    float _2231 = _2221;
    if (_2215)
    {
        float _2233 = rsqrt(_2211);
        _2223 = _2233;
    }
    float _2235 = _2223;
    float _2237 = _2235;
    if (_2215)
    {
        float _2239 = _2219 * _2231;
        _2225 = _2239;
    }
    float _2241 = _2225;
    if (_2215)
    {
        float _2243 = _2241 * 0.15915493667125701904296875;
        _214 = _2243;
    }
    float _2245 = _214;
    float _2247 = _2189;
    float _2249 = _2245;
    if (_2215)
    {
        float _2251 = _2245 * 6.283185482025146484375;
        float _2253 = sin(_2251);
        _2247 = _2253;
    }
    float _2255 = _2247;
    float _2257 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2259 = precise::max(0.0, _2257);
    float _2261 = _2231;
    float _2263 = _2259;
    if (_2215)
    {
        float _2265 = _2245 * 6.283185482025146484375;
        float _2267 = cos(_2265);
        _2261 = _2267;
    }
    float _2269 = _2261;
    float _2271 = -_2201;
    float _2273 = -_2259;
    float _2275 = fma(_2181, _2271, _2273);
    if (_2215)
    {
        float _2277 = _2275 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2227 = _2277;
    }
    float _2279 = _2227;
    float _2281 = _2279;
    float _2283 = _2255;
    if (_2215)
    {
        float _2285 = fma(_2255, _2279, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2281 = _2285;
    }
    float _2287 = _2281;
    float _2289 = _2287;
    if (!_2215)
    {
        _2283 = _2203;
    }
    float _2291 = _2283;
    float _2293 = _2291;
    float _2295 = _2269;
    if (_2215)
    {
        float _2297 = _2269 + (-1.0);
        _2263 = _2297;
    }
    float _2299 = _2263;
    float _2301 = _2299;
    if (_2215)
    {
        float _2303 = _2235 * _2287;
        _216 = _2303;
    }
    float _2305 = _216;
    if (!_2215)
    {
        _2289 = _2275;
    }
    float _2307 = _2289;
    float _2309 = _2307;
    if (_2215)
    {
        float _2311 = _2299 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2249 = _2311;
    }
    float _2313 = _2249;
    if (_2215)
    {
        float _2315 = _2203 * _2305;
        _2293 = _2315;
    }
    float _2317 = _2293;
    if (!_2215)
    {
        _2301 = _2205;
    }
    float _2319 = _2301;
    float _2321 = _2319;
    if (_2215)
    {
        float _2323 = _2205 * _2305;
        _2321 = _2323;
    }
    float _2325 = _2321;
    if (!_2215)
    {
        _2237 = _2207;
    }
    float _2327 = _2237;
    float _2329 = _2327;
    if (_2215)
    {
        float _2331 = fma(_2275, _2269, _2313);
        _2309 = _2331;
    }
    float _2333 = _2309;
    if (_2215)
    {
        float _2335 = _2317 * _2317;
        _2329 = _2335;
    }
    float _2337 = _2329;
    if (!_2215)
    {
        _2295 = _2209;
    }
    float _2339 = _2295;
    float _2341 = _2339;
    if (_2215)
    {
        float _2343 = _2325 * _2325;
        _2341 = _2343;
    }
    float _2345 = _2341;
    float _2347 = fma(_2333, _2333, _2337);
    float _2349 = _2347 + _2345;
    float _2351 = _2173 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2353 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2355 = fma(_2199, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2353);
    float _2357 = precise::clamp(_2355, 0.0, 1.0);
    float _2359 = _2173 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2361 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2363 = fma(_2175, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2351);
    float _2365 = rsqrt(_2349);
    float _2367 = fma(_2175, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2359);
    float _2369 = -_2357;
    float _2371 = _2369 + 1.0;
    float _2373 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2363);
    float _2375 = _2173 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2377 = _2173 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2379 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2367);
    float _2381 = _2373 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2383 = fma(_2175, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2375);
    float _2385 = fma(_2175, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2377);
    float _2387 = _2379 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2389 = _2381 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2391 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2383);
    float _2393 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2385);
    float _2395 = abs(_2371);
    float _2397 = log2(_2395);
    float _2399 = -_2389;
    float _2401 = fma(_2399, _2361, 1.0);
    float _2403 = _2365 * _2317;
    float _2405 = _2391 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2407 = _2387 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2409 = _2365 * _2333;
    float _2411 = _2365 * _2325;
    float _2413 = _2393 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2415 = fma(_2405, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2407);
    float _2417 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2419 = log2(_2401);
    float _2421 = _2387 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2423 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2415);
    float _2425 = -_2417;
    float _2427 = fma(_2409, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2425);
    float _2429 = _2409 + 1.0;
    float _2431 = fma(_2413, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2423);
    float _2433 = -_2411;
    float _2435 = fma(_2433, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2427);
    float _2437 = _2397 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2439 = _2387 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2441 = 1.0 / _2431;
    float _2443 = fma(_2435, -0.5, 0.5);
    float _2445 = fma(_2435, 0.5, 0.5);
    float _2447 = fma(_2405, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2439);
    float _2449 = fma(_2405, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2421);
    float _2451 = fma(_2445, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2453 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2447);
    float _2455 = exp2(_2437);
    float _2457 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2449);
    float _2459 = fma(_2445, _2451, -0.212114393711090087890625);
    float _2461 = fma(_2413, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2453);
    float _2463 = fma(_2413, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2457);
    float _2465 = _2419 * 0.693147182464599609375;
    float _2467 = fma(_2445, _2459, 1.570728778839111328125);
    float _2469 = sqrt(_2443);
    float _2471 = _2461 * _2441;
    float _2473 = _2463 * _2441;
    float _2475 = _2465 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2477 = fma(_2471, 0.5, 0.5);
    float _2479 = fma(_2473, -0.5, 0.5);
    float _2481 = -_2409;
    float _2483 = fma(_2455, _2429, _2481);
    float3 _6392 = float3(_2477, _2479, _2475);
    float _2485 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6392, float3(0.0), isnan(_6392)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6392, float3(0.0), isnan(_6392)), level(0.0)).x;
    float3 _6403 = float3(_2477, _2479, _2475);
    float4 _2488 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6403, float3(0.0), isnan(_6403)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6403, float3(0.0), isnan(_6403)), level(0.0)).xyzw;
    float _2490 = _2488.x;
    float _2492 = _2488.y;
    float _2494 = _2488.z;
    float _2496 = _2488.w;
    float _2498 = fma(_2483, 0.5, 0.5);
    float _2500 = _2469 * 0.636619746685028076171875;
    float _2502 = -_2467;
    float _2504 = fma(_2500, _2502, 1.0);
    float2 _6430 = float2(_2504, _2498);
    float3 _2508 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6430, float2(0.0), isnan(_6430)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6430, float2(0.0), isnan(_6430)), level(0.0)).xyz;
    float _2510 = _2508.x;
    float _2512 = _2508.y;
    float _2514 = _2508.z;
    float _2516 = _2397 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2518 = _2387 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2520 = fma(_2405, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2518);
    float _2522 = exp2(_2516);
    float _2524 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2526 = fma(_2381, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2520);
    float _2528 = fma(_2413, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2526);
    out.m_47.x = _2524;
    float _2530 = _2528 + _2431;
    out.gl_Position.x = _2461;
    out.gl_Position.y = _2463;
    out.gl_Position.z = _2528;
    out.gl_Position.w = _2431;
    float _2532 = _2530 * 0.5;
    float _2534 = -_2522;
    float _2536 = _2534 + 1.0;
    float _2538 = _2536 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.z = _2532;
    out.m_73.w = _2431;
    float _2540 = _2538 * _2485;
    float _2542 = -_2538;
    float _2544 = _2542 + 1.0;
    float _2546 = _2496 * _2540;
    float _2548 = _2496 * _2544;
    float _2550 = _2514 * _2540;
    float _2552 = fma(_2510, _2546, _2490);
    float _2554 = fma(_2512, _2546, _2492);
    float _2556 = fma(_2496, _2550, _2494);
    out.m_75.x = _2552;
    out.m_75.y = _2554;
    out.m_75.z = _2556;
    out.m_75.w = _2548;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

