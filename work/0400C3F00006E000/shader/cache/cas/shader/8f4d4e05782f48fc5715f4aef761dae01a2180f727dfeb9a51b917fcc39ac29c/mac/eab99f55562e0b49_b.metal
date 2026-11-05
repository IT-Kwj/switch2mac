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
    float4 m_63 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
    float4 m_61 [[attribute(12)]];
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
    bool _1771 = false;
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
        float _2619 = as_type<float>(_110);
        out.gl_Position.z = _2619;
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
        float _2689 = as_type<float>(_148);
        out.gl_Position.z = _2689;
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
    float _1038 = in.m_51.w;
    float _1040 = _810 * _810;
    float _1042 = _602 * _152;
    float _1044 = _602 * _176;
    float _1046 = in.m_53.w;
    float _1048 = fma(_812, _812, _1040);
    float _1050 = fma(_600, _150, _1042);
    float _1052 = fma(_600, _174, _1044);
    float _1054 = in.m_55.w;
    float _1056 = fma(_814, _814, _1048);
    float _1058 = _602 * _160;
    float _1060 = fma(_604, _154, _1050);
    float _1062 = fma(_604, _178, _1052);
    float _1064 = rsqrt(_1056);
    float _1066 = fma(_600, _158, _1058);
    float _1068 = in.m_59.w;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1072 = _1036 + _1070;
    float _1074 = fma(_604, _162, _1066);
    float _1076 = _998 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1078;
    float _1082 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1084 = _1060 + _1038;
    float _1086 = in.m_61.x;
    float _1088 = 1.0 / _1080;
    float _1090 = _1074 + _1046;
    float _1092 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1094 = _1084 + _1092;
    float _1096 = _1064 * _810;
    float _1098 = _1064 * _812;
    float _1100 = _1062 + _1054;
    float _1102 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1104 = _1090 + _1102;
    float _1106 = _1094 * _1094;
    float _1108 = _1096 * _328;
    float _1110 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1112 = _1100 + _1110;
    float _1114 = _1064 * _814;
    float _1116 = fma(_1104, _1104, _1106);
    float _1118 = fma(_1098, _324, _1108);
    float _1120 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1124 = _1122 != 0;
    float _1126 = fma(_1112, _1112, _1116);
    float _1128 = fma(_1114, _332, _1118);
    bool _1130 = _1068 > 0.5;
    float _1132 = _1072 * _1088;
    float _1134 = in.m_63.x;
    float _1136 = in.m_63.y;
    float _1138 = in.m_63.z;
    int _1140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1142 = _1140 != 0;
    float _1144 = rsqrt(_1126);
    float _1146 = abs(_1128);
    bool _1148 = _1146 > 0.99989998340606689453125;
    int _1150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1152 = _1150 != 0;
    float _1154 = in.m_61.y;
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1158 = _1156 != 0;
    float _1160 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    bool _1162 = _1036 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1164 = isnan(_1036);
    bool _1166 = _1162 || _1164;
    bool _1168 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1170 = _1166 || _1168;
    float _1172 = float(_1170);
    bool _1174 = _1036 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1176 = isnan(_1036);
    bool _1178 = _1174 || _1176;
    bool _1180 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1182 = _1178 || _1180;
    float _1184 = float(_1182);
    float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1186;
    bool _1190 = _1130;
    bool _1192 = _1158;
    float _1194 = _1086;
    float _1196 = _1056;
    if (!_1148)
    {
        _1006 = _324;
    }
    float _1198 = _1006;
    float _1200 = _1120 * _1144;
    float _1202 = 0.0;
    float _1204 = _1198;
    if (!_1148)
    {
        _1202 = _328;
    }
    float _1206 = _1202;
    float _1208 = _1206;
    if (_1148)
    {
        float _1210 = fma(_336, 0.001000000047497451305389404296875, _324);
        _1204 = _1210;
    }
    float _1212 = _1204;
    if (!_1148)
    {
        _1008 = _332;
    }
    float _1214 = _1008;
    float _1216 = _1214;
    if (_1148)
    {
        float _1218 = fma(_340, 0.001000000047497451305389404296875, _328);
        _1208 = _1218;
    }
    float _1220 = _1208;
    if (_1148)
    {
        float _1222 = fma(_344, 0.001000000047497451305389404296875, _332);
        _1216 = _1222;
    }
    float _1224 = _1216;
    int _1226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1228 = _1226 != 0;
    float _1230 = _1094 * _1200;
    float _1232 = _1104 * _1200;
    float _1234 = _1112 * _1200;
    float _1236 = -_1224;
    float _1238 = _1096 * _1236;
    float _1240 = -_1230;
    float _1242 = _1094 + _1240;
    float _1244 = -_1232;
    float _1246 = _1104 + _1244;
    float _1248 = -_1234;
    float _1250 = _1112 + _1248;
    float _1252 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1138);
    float _1254 = _1242 * _1242;
    float _1256 = -_1220;
    float _1258 = _1098 * _1256;
    float _1260 = -_1220;
    float _1262 = -_1238;
    float _1264 = fma(_1114, _1260, _1262);
    float _1266 = 0.0;
    if (_1152)
    {
        float _1268 = in.m_59.z;
        _1266 = _1268;
    }
    float _1270 = _1266;
    float _1272 = fma(_1246, _1246, _1254);
    float _1274 = -_1212;
    float _1276 = _1114 * _1274;
    float _1278 = -_1212;
    float _1280 = -_1258;
    float _1282 = fma(_1096, _1278, _1280);
    float _1284 = in.m_59.y;
    float _1286 = fma(_1250, _1250, _1272);
    float _1288 = -_1224;
    float _1290 = -_1276;
    float _1292 = fma(_1098, _1288, _1290);
    float _1294 = -_1154;
    float _1296 = _1294 + 1.0;
    float _1298 = in.m_59.x;
    float _1300 = sqrt(_1286);
    float _1302 = _1292 * _1292;
    float _1304 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1136);
    int _1306 = _1130 ? as_type<int>(_1296) : as_type<int>(_1154);
    float _1308 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1134);
    float _1310 = fma(_1264, _1264, _1302);
    float _1312 = -_1172;
    float _1314 = _1312 + 1.0;
    float _1316 = _1158 ? as_type<float>(_1306) : _1154;
    float _1318 = fma(_1282, _1282, _1310);
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1320;
    float _1324 = _1286;
    float _1326 = _1154;
    if (!_1142)
    {
        _1324 = _1086;
    }
    float _1328 = _1324;
    int _1330 = 0;
    float _1332 = _1328;
    if (_1152)
    {
        float _1334 = -_1086;
        float _1336 = _1334 + 1.0;
        _1330 = as_type<int>(_1336);
    }
    int _1338 = _1330;
    float _1340 = rsqrt(_1318);
    float _1342 = _1270;
    if (_1152)
    {
        bool _1344 = _1270 > 0.5;
        _1190 = _1344;
    }
    bool _1346 = _1190;
    float _1348 = _1144 * _1300;
    float _1350 = fma(_1322, _1132, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    if (!_1124)
    {
        _1342 = _1284;
    }
    float _1352 = _1342;
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1354;
    float _1358 = _1076 * _1348;
    float _1360 = _1082 * _1348;
    float _1362 = _1160 * _1298;
    float _1364 = _1352;
    if (_1142)
    {
        bool _1366 = _1298 > 0.5;
        _1192 = _1366;
    }
    bool _1368 = _1192;
    float _1370 = _1358 * _1308;
    if (_1124)
    {
        _1364 = _1298;
    }
    float _1372 = _1364;
    float _1374 = fma(_1356, _1132, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1376 = fma(_1188, _1132, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1378 = trunc(_1362);
    int _1380 = int(_1378);
    float _1382 = _1360 * _1252;
    float _1384 = _1282 * _1340;
    float _1386 = _1000 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1388 = _1264 * _1340;
    float _1390 = _1292 * _1340;
    float _1392 = _1386 * _1348;
    float _1394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1396 = _1098 * _1390;
    float _1398 = _1386;
    if (!_1124)
    {
        float _1400 = in.m_59.z;
        _1398 = _1400;
    }
    float _1402 = _1398;
    float _1404 = _1392 * _1304;
    float _1406 = _1096 * _1384;
    float _1408 = -_1396;
    float _1410 = fma(_1096, _1388, _1408);
    float _1412 = -_1184;
    float _1414 = _1412 + 1.0;
    float _1416 = _1404 * _1098;
    float _1418 = _1404 * _1114;
    float _1420 = -_1406;
    float _1422 = fma(_1114, _1390, _1420);
    int _1424 = _1380 << 4;
    int _1426 = _1424 + 1968;
    float _1428 = fma(_1370, _1388, _1416);
    float _1430 = fma(_1370, _1384, _1418);
    float _1432 = _1172 * _1414;
    float _1434 = fma(_1382, _1422, _1428);
    float _1436 = fma(_1382, _1410, _1430);
    float _1438 = _1394 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1440 = _1350 * _1432;
    float _1442 = _1090 + _1434;
    float _1444 = _1100 + _1436;
    float _1446 = fma(_1438, _1316, -0.5);
    int _1448 = _1426 + 8;
    uint _1451 = uint(int(uint(_1448) >> uint(2)));
    uint _1453 = uint(int(uint(int(_1451)) >> uint(2)));
    int _1455 = int(_1451) & 3;
    float _1457 = (*spvDescriptorSet0.vp_c9)._m0[int(_1453)][_1455];
    float _1459 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1461 = _1442 + _1459;
    float _1463 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1465 = _1444 + _1463;
    float _1467 = _1374 * _1432;
    float _1469 = _1436;
    float _1471 = _1402;
    int _1473 = as_type<int>(_1432);
    float _1475 = _1442;
    float _1477 = _1444;
    if (!_1124)
    {
        _1469 = _1402;
    }
    float _1479 = _1469;
    float _1481 = _1461 * _1461;
    float _1483 = _1465 * _1465;
    float _1485 = _1479;
    float _1487 = _1481;
    float _1489 = _1483;
    if (_1124)
    {
        _1485 = _1284;
    }
    float _1491 = _1485;
    uint _1493 = uint(int(uint(_1426) >> uint(2)));
    uint _1495 = uint(int(uint(int(_1493)) >> uint(2)));
    int _1497 = int(_1493) & 3;
    float _1499 = (*spvDescriptorSet0.vp_c9)._m0[int(_1495)][_1497];
    int _1501 = int(_1493) + 1;
    uint _1503 = uint(int(uint(_1501) >> uint(2)));
    int _1505 = _1501 & 3;
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[int(_1503)][_1505];
    if (_1124)
    {
        _1471 = _1284;
    }
    float _1509 = _1471;
    float _1511 = _1481 + _1483;
    bool _1513 = _1284 > 0.5;
    float _1515 = _1114 * _1388;
    float _1517 = _1376 * _1432;
    float _1519 = sqrt(_1511);
    if (_1142)
    {
        float _1521 = -_1086;
        float _1523 = _1521 + 1.0;
        _1473 = as_type<int>(_1523);
    }
    int _1525 = _1473;
    float _1527 = -_1515;
    float _1529 = fma(_1098, _1384, _1527);
    float _1531 = _1404 * _1096;
    float _1533 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1535 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1440);
    if (_1142)
    {
        float _1537 = _1368 ? as_type<float>(_1525) : _1086;
        _1332 = _1537;
    }
    float _1539 = _1332;
    float _1541 = fma(_1370, _1390, _1531);
    float _1543 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1533);
    float _1545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1547 = _1372 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1549 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1551 = fma(_1382, _1529, _1541);
    float _1553 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1555 = _1519 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1557 = -_1549;
    float _1559 = fma(_1547, 2.0, _1557);
    if (_1152)
    {
        float _1561 = _1346 ? as_type<float>(_1338) : _1086;
        _1194 = _1561;
    }
    float _1563 = _1194;
    float _1565 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1553);
    float _1567 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1467);
    float _1569 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1517);
    float _1571 = _1084 + _1551;
    bool _1573 = !_1555;
    float _1575 = _1571;
    if (!_1573)
    {
        float _1577 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1579 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1581 = _1519 + _1579;
        float _1583 = rsqrt(_1511);
        float _1585 = _1581 * _1577;
        float _1587 = _1571 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1589 = _1585 * 0.15915493667125701904296875;
        float _1591 = _1589 * 6.283185482025146484375;
        float _1593 = sin(_1591);
        float _1595 = _1589 * 6.283185482025146484375;
        float _1597 = cos(_1595);
        float _1599 = fma(_1593, _1587, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1601 = _1583 * _1599;
        float _1603 = fma(_1461, _1601, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1605 = _1597 + (-1.0);
        float _1607 = fma(_1465, _1601, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1609 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1611 = _1603 + _1609;
        float _1613 = _1605 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1615 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1617 = _1607 + _1615;
        float _1619 = _1611 * _1611;
        float _1621 = fma(_1571, _1597, _1613);
        float _1623 = _1617 * _1617;
        _1575 = _1621;
        _1487 = _1619;
        _1489 = _1623;
        _1475 = _1603;
        _1477 = _1607;
    }
    float _1625 = _1575;
    float _1627 = _1487;
    float _1629 = _1489;
    float _1631 = _1475;
    float _1633 = _1477;
    if (_1228)
    {
        float _1635 = _1513 ? _1296 : _1154;
        _1326 = _1635;
    }
    float _1637 = _1326;
    float _1639 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1641 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1643 = _1625 + _1641;
    float _1645 = _1545 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1647 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1649 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1651 = fma(_1643, _1643, _1627);
    float _1653 = fma(_1645, _1563, -0.5);
    float _1655 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1543);
    float _1657 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1659 = fma(_1649, -2.0, _1647);
    float _1661 = -_128;
    float _1663 = fma(_1661, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1559);
    float _1665 = _1651 + _1629;
    float _1667 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1567);
    float _1669 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1565);
    float _1671 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1659);
    float _1673 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1535);
    float _1675 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1569);
    float _1677 = fma(_1655, _1653, _1663);
    float _1679 = _1539 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1681 = _1637 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1683 = -_1671;
    float _1685 = fma(_1669, _1446, _1683);
    float _1687 = _1499 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1689 = _1457 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1691 = sqrt(_1665);
    float _1693 = _1679 * _1639;
    float _1695 = _1681 * _1657;
    float _1697 = _1507 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1699 = _1667 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1701 = _1673 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1703 = _1675 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1705 = _1687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1707 = _1689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1709 = _1677 + 0.5;
    float _1711 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1713 = _1697 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1715 = _1699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1717 = _1701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1719 = _1703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1721 = _1685 + 0.5;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    bool _1723 = _1691 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1725 = isnan(_1691);
    bool _1727 = _1723 || _1725;
    bool _1729 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1731 = _1727 || _1729;
    out.m_67.x = _1705;
    out.m_67.y = _1713;
    out.m_67.z = _1707;
    out.m_69.x = _1715;
    out.m_69.y = _1717;
    out.m_69.z = _1719;
    out.m_69.w = _1711;
    out.m_71.x = _1693;
    out.m_71.y = _1695;
    out.m_71.z = _1709;
    out.m_71.w = _1721;
    float _1733 = _1685;
    float _1735 = _1719;
    if (!_1731)
    {
        _1733 = 1.0;
    }
    float _1737 = _1733;
    bool _1739 = !_1731;
    float _1741 = _1737;
    if (!_1739)
    {
        bool _1743 = _1691 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1745 = isnan(_1691);
        bool _1747 = _1743 || _1745;
        bool _1749 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1751 = _1747 || _1749;
        if (!_1751)
        {
            float _1753 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1755 = _1691 + _1753;
            float _1757 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1759 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1757;
            float _1761 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1763 = _1761 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1765 = 1.0 / _1759;
            float _1767 = _1755 * _1765;
            float _1769 = fma(_1767, _1763, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1741 = _1769;
            _1771 = true;
        }
        else
        {
            bool _1773 = _1691 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1775 = isnan(_1691);
            bool _1777 = _1773 || _1775;
            bool _1779 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1781 = _1777 || _1779;
            if (!_1781)
            {
                float _1783 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1785 = _1691 + _1783;
                float _1787 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1789 = _1787 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1791 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1793 = _1791 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1795 = 1.0 / _1789;
                float _1797 = _1785 * _1795;
                float _1799 = fma(_1797, _1793, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1741 = _1799;
                _1771 = true;
            }
            else
            {
                _1741 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1771 = false;
    float _1801 = _1741;
    float _1803 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1805 = _1625 + _1803;
    float _1807 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1809 = _1631 + _1807;
    float _1811 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1813 = _1633 + _1811;
    float _1815 = fma(_1805, _1801, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1817 = fma(_1809, _1801, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1819 = fma(_1813, _1801, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1821 = -_1084;
    float _1823 = _1821 + _1815;
    float _1825 = -_1090;
    float _1827 = _1825 + _1817;
    float _1829 = -_1100;
    float _1831 = _1829 + _1819;
    float _1833 = _1823 * _1823;
    float _1835 = fma(_1827, _1827, _1833);
    float _1837 = fma(_1831, _1831, _1835);
    float _1839 = sqrt(_1837);
    bool _1841 = _1839 > 0.0;
    bool _1843 = !_1841;
    float _1845 = _1835;
    float _1847 = _1839;
    float _1849 = _1817;
    float _1851 = _1815;
    float _1853 = _1819;
    if (!_1843)
    {
        bool _1855 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1857 = _1695;
        if (_1855)
        {
            float _1859 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1857 = _1859;
        }
        float _1861 = _1857;
        if (_1855)
        {
            float _1863 = _1861 * _812;
            _1735 = _1863;
        }
        float _1865 = _1735;
        float _1867 = _1865;
        if (_1855)
        {
            float _1869 = _1861 * _810;
            _1845 = _1869;
        }
        float _1871 = _1845;
        float _1873 = _1871;
        if (_1855)
        {
            float _1875 = _1861 * _814;
            _1847 = _1875;
        }
        float _1877 = _1847;
        float _1879 = _1877;
        if (!_1855)
        {
            float _1881 = _128 + 1.0;
            if (!_172)
            {
                float _1883 = _1881 * _1881;
                float _1885 = _1883 * 0.5;
                _130 = _1885;
            }
            float _1887 = _130;
            float _1889 = _1887;
            if (!_172)
            {
                float _1891 = _1887 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1889 = _1891;
            }
            float _1893 = _1889;
            bool _1895 = !_172;
            float _1897 = _1893;
            if (!_1895)
            {
                float _1899 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1901 = log2(_1899);
                float _1903 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1905 = _1903 + 1.0;
                float _1907 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1909 = _1901 * _1881;
                float _1911 = 1.0 / _1905;
                float _1913 = _1907 * 0.693147182464599609375;
                float _1915 = exp2(_1909);
                float _1917 = 1.0 / _1913;
                float _1919 = _1915 + (-1.0);
                float _1921 = -_1919;
                float _1923 = fma(_1921, _1917, _1881);
                float _1925 = _1923 * _1911;
                float _1927 = _1925 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1897 = _1927;
            }
            float _1929 = _1897;
            float _1931 = _1929 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _1933 = _1929 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1935 = _1929 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1937 = _1929;
            if (!_172)
            {
                _1937 = _1881;
            }
            float _1939 = _1937;
            float _1941 = _1931 * _328;
            float _1943 = _1931 * _294;
            float _1945 = _1931 * _340;
            float _1947 = fma(_1933, _324, _1941);
            float _1949 = fma(_1933, _290, _1943);
            float _1951 = fma(_1935, _332, _1947);
            bool _1953 = !_172;
            float _1955 = _1939;
            if (!_1953)
            {
                float _1957 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1959 = log2(_1957);
                float _1961 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1963 = _1961 + 1.0;
                float _1965 = 1.0 / _1963;
                float _1967 = _1959 * _1881;
                float _1969 = exp2(_1967);
                float _1971 = -_1969;
                float _1973 = _1971 + 1.0;
                float _1975 = _1973 * _1965;
                _1955 = _1975;
            }
            float _1977 = _1955;
            float _1979 = fma(_1933, _336, _1945);
            float _1981 = fma(_1935, _298, _1949);
            float _1983 = fma(_1977, _230, _1951);
            float _1985 = fma(_1935, _344, _1979);
            float _1987 = fma(_1977, _228, _1981);
            float _1989 = -_532;
            float _1991 = _1989 + _1983;
            float _1993 = fma(_1977, _232, _1985);
            float _1995 = -_538;
            float _1997 = _1995 + _1987;
            float _1999 = _1991 * _152;
            float _2001 = _1991 * _160;
            float _2003 = -_546;
            float _2005 = _2003 + _1993;
            float _2007 = _1991 * _176;
            float _2009 = fma(_1997, _150, _1999);
            float _2011 = fma(_1997, _158, _2001);
            float _2013 = fma(_1997, _174, _2007);
            float _2015 = fma(_2005, _154, _2009);
            float _2017 = fma(_2005, _162, _2011);
            float _2019 = fma(_2005, _178, _2013);
            float _2021 = _2015 * _2015;
            float _2023 = fma(_2017, _2017, _2021);
            float _2025 = fma(_2019, _2019, _2023);
            _1196 = _2025;
            _820 = _2015;
            _822 = _2017;
            _824 = _2019;
            _1867 = _2017;
            _1873 = _2015;
            _1879 = _2019;
        }
        float _2027 = _1196;
        float _2029 = _820;
        float _2031 = _822;
        float _2033 = _824;
        float _2035 = _1867;
        float _2037 = _1873;
        float _2039 = _1879;
        float _2041 = sqrt(_2027);
        float _2043 = rsqrt(_1837);
        bool _2045 = _2041 > 0.0;
        float _2047 = _1827 * _2043;
        float _2049 = _1823 * _2043;
        float _2051 = _1831 * _2043;
        bool _2053 = !_2045;
        if (!_2053)
        {
            float _2055 = rsqrt(_2027);
            float _2057 = _2055 * _2029;
            float _2059 = _2055 * _2031;
            float _2061 = _2049 * _2057;
            float _2063 = _2055 * _2033;
            float _2065 = fma(_2047, _2059, _2061);
            float _2067 = fma(_2051, _2063, _2065);
            float _2069 = _2067 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2071 = fma(_2035, _2069, _1817);
            float _2073 = fma(_2037, _2069, _1815);
            float _2075 = fma(_2039, _2069, _1819);
            _1849 = _2071;
            _1851 = _2073;
            _1853 = _2075;
        }
    }
    float _2077 = _1849;
    float _2079 = _1851;
    float _2081 = _1853;
    float _2083 = -_1232;
    float _2085 = _2083 + _2077;
    float _2087 = -_1230;
    float _2089 = _2087 + _2079;
    float _2091 = -_1234;
    float _2093 = _2091 + _2081;
    bool _2095 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2097 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2099 = _2095 || _2097;
    bool _2101 = isnan(0.5);
    bool _2103 = _2099 || _2101;
    float _2105 = _2089;
    float _2107 = _2085;
    float _2109 = _2093;
    if (!_2103)
    {
        float _2111 = -_1230;
        float _2113 = _1084 + _2111;
        float _2115 = -_1232;
        float _2117 = _1090 + _2115;
        float _2119 = -_1234;
        float _2121 = _1100 + _2119;
        float _2123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2125 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2127 = _2113 + _2125;
        float _2129 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2131 = _2117 + _2129;
        float _2133 = -_1100;
        float _2135 = _2133 + _2081;
        float _2137 = -_1090;
        float _2139 = _2137 + _2077;
        float _2141 = _2127 * _2127;
        float _2143 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2145 = _2121 + _2143;
        float _2147 = -_1084;
        float _2149 = _2147 + _2079;
        float _2151 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2153 = fma(_2131, _2131, _2141);
        float _2155 = fma(_2145, _2145, _2153);
        float _2157 = 1.0 / _1348;
        float _2159 = sqrt(_2155);
        float _2161 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2163 = precise::min(_2159, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2165 = _2163 * _2123;
        float _2167 = _2165 * _2157;
        float _2169 = _2161 * _2167;
        float _2171 = _2135 * _2167;
        float _2173 = fma(_2139, _2169, _2117);
        float _2175 = fma(_2149, _2169, _2113);
        float _2177 = fma(_2161, _2171, _2121);
        _2105 = _2175;
        _2107 = _2173;
        _2109 = _2177;
    }
    float _2179 = _2105;
    float _2181 = _2107;
    float _2183 = _2109;
    float _2185 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2187 = _2179 + _2185;
    float _2189 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2191 = _2181 + _2189;
    float _2193 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2195 = _2183 + _2193;
    float _2197 = _2187 * _2187;
    float _2199 = fma(_2191, _2191, _2197);
    float _2201 = fma(_2195, _2195, _2199);
    float _2203 = rsqrt(_2201);
    float _2205 = sqrt(_2201);
    float _2207 = _2203 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2209 = _2191 * _2207;
    float _2211 = _2195 * _2207;
    float _2213 = _2209 * _2209;
    float _2215 = _2211 * _2211;
    float _2217 = _2213 + _2215;
    float _2219 = sqrt(_2217);
    bool _2221 = _2219 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2223 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2225 = _2219 + _2223;
    float _2227 = _2203;
    float _2229 = _2217;
    float _2231 = _2225;
    float _2233 = _2187;
    if (_2221)
    {
        float _2235 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2227 = _2235;
    }
    float _2237 = _2227;
    if (_2221)
    {
        float _2239 = rsqrt(_2217);
        _2229 = _2239;
    }
    float _2241 = _2229;
    float _2243 = _2241;
    if (_2221)
    {
        float _2245 = _2225 * _2237;
        _2231 = _2245;
    }
    float _2247 = _2231;
    if (_2221)
    {
        float _2249 = _2247 * 0.15915493667125701904296875;
        _214 = _2249;
    }
    float _2251 = _214;
    float _2253 = _2195;
    float _2255 = _2251;
    if (_2221)
    {
        float _2257 = _2251 * 6.283185482025146484375;
        float _2259 = sin(_2257);
        _2253 = _2259;
    }
    float _2261 = _2253;
    float _2263 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2265 = precise::max(0.0, _2263);
    float _2267 = _2237;
    float _2269 = _2265;
    if (_2221)
    {
        float _2271 = _2251 * 6.283185482025146484375;
        float _2273 = cos(_2271);
        _2267 = _2273;
    }
    float _2275 = _2267;
    float _2277 = -_2207;
    float _2279 = -_2265;
    float _2281 = fma(_2187, _2277, _2279);
    if (_2221)
    {
        float _2283 = _2281 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2233 = _2283;
    }
    float _2285 = _2233;
    float _2287 = _2285;
    float _2289 = _2261;
    if (_2221)
    {
        float _2291 = fma(_2261, _2285, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2287 = _2291;
    }
    float _2293 = _2287;
    float _2295 = _2293;
    if (!_2221)
    {
        _2289 = _2209;
    }
    float _2297 = _2289;
    float _2299 = _2297;
    float _2301 = _2275;
    if (_2221)
    {
        float _2303 = _2275 + (-1.0);
        _2269 = _2303;
    }
    float _2305 = _2269;
    float _2307 = _2305;
    if (_2221)
    {
        float _2309 = _2241 * _2293;
        _216 = _2309;
    }
    float _2311 = _216;
    if (!_2221)
    {
        _2295 = _2281;
    }
    float _2313 = _2295;
    float _2315 = _2313;
    if (_2221)
    {
        float _2317 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2255 = _2317;
    }
    float _2319 = _2255;
    if (_2221)
    {
        float _2321 = _2209 * _2311;
        _2299 = _2321;
    }
    float _2323 = _2299;
    if (!_2221)
    {
        _2307 = _2211;
    }
    float _2325 = _2307;
    float _2327 = _2325;
    if (_2221)
    {
        float _2329 = _2211 * _2311;
        _2327 = _2329;
    }
    float _2331 = _2327;
    if (!_2221)
    {
        _2243 = _2213;
    }
    float _2333 = _2243;
    float _2335 = _2333;
    if (_2221)
    {
        float _2337 = fma(_2281, _2275, _2319);
        _2315 = _2337;
    }
    float _2339 = _2315;
    if (_2221)
    {
        float _2341 = _2323 * _2323;
        _2335 = _2341;
    }
    float _2343 = _2335;
    if (!_2221)
    {
        _2301 = _2215;
    }
    float _2345 = _2301;
    float _2347 = _2345;
    if (_2221)
    {
        float _2349 = _2331 * _2331;
        _2347 = _2349;
    }
    float _2351 = _2347;
    float _2353 = fma(_2339, _2339, _2343);
    float _2355 = _2353 + _2351;
    float _2357 = _2179 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2359 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2361 = fma(_2205, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2359);
    float _2363 = precise::clamp(_2361, 0.0, 1.0);
    float _2365 = _2179 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2367 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2369 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2357);
    float _2371 = rsqrt(_2355);
    float _2373 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2365);
    float _2375 = -_2363;
    float _2377 = _2375 + 1.0;
    float _2379 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2369);
    float _2381 = _2179 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2383 = _2179 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2385 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2373);
    float _2387 = _2379 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2389 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2381);
    float _2391 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2383);
    float _2393 = _2385 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2395 = _2387 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2397 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2389);
    float _2399 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2391);
    float _2401 = abs(_2377);
    float _2403 = log2(_2401);
    float _2405 = -_2395;
    float _2407 = fma(_2405, _2367, 1.0);
    float _2409 = _2371 * _2323;
    float _2411 = _2397 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2413 = _2393 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2415 = _2371 * _2339;
    float _2417 = _2371 * _2331;
    float _2419 = _2399 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2421 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2413);
    float _2423 = _2409 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2425 = log2(_2407);
    float _2427 = _2393 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2429 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2421);
    float _2431 = -_2423;
    float _2433 = fma(_2415, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2431);
    float _2435 = _2415 + 1.0;
    float _2437 = fma(_2419, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2429);
    float _2439 = -_2417;
    float _2441 = fma(_2439, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2433);
    float _2443 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2445 = _2393 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2447 = 1.0 / _2437;
    float _2449 = fma(_2441, -0.5, 0.5);
    float _2451 = fma(_2441, 0.5, 0.5);
    float _2453 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2445);
    float _2455 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2427);
    float _2457 = fma(_2451, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2459 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2453);
    float _2461 = exp2(_2443);
    float _2463 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2455);
    float _2465 = fma(_2451, _2457, -0.212114393711090087890625);
    float _2467 = fma(_2419, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2459);
    float _2469 = fma(_2419, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2463);
    float _2471 = _2425 * 0.693147182464599609375;
    float _2473 = fma(_2451, _2465, 1.570728778839111328125);
    float _2475 = sqrt(_2449);
    float _2477 = _2467 * _2447;
    float _2479 = _2469 * _2447;
    float _2481 = _2471 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2483 = fma(_2477, 0.5, 0.5);
    float _2485 = fma(_2479, -0.5, 0.5);
    float _2487 = -_2415;
    float _2489 = fma(_2461, _2435, _2487);
    float3 _6400 = float3(_2483, _2485, _2481);
    float _2491 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6400, float3(0.0), isnan(_6400)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6400, float3(0.0), isnan(_6400)), level(0.0)).x;
    float3 _6411 = float3(_2483, _2485, _2481);
    float4 _2494 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6411, float3(0.0), isnan(_6411)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6411, float3(0.0), isnan(_6411)), level(0.0)).xyzw;
    float _2496 = _2494.x;
    float _2498 = _2494.y;
    float _2500 = _2494.z;
    float _2502 = _2494.w;
    float _2504 = fma(_2489, 0.5, 0.5);
    float _2506 = _2475 * 0.636619746685028076171875;
    float _2508 = -_2473;
    float _2510 = fma(_2506, _2508, 1.0);
    float2 _6438 = float2(_2510, _2504);
    float3 _2514 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6438, float2(0.0), isnan(_6438)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6438, float2(0.0), isnan(_6438)), level(0.0)).xyz;
    float _2516 = _2514.x;
    float _2518 = _2514.y;
    float _2520 = _2514.z;
    float _2522 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2524 = _2393 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2526 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2524);
    float _2528 = exp2(_2522);
    float _2530 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2532 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2526);
    float _2534 = fma(_2419, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2532);
    out.m_47.x = _2530;
    float _2536 = _2534 + _2437;
    out.gl_Position.x = _2467;
    out.gl_Position.y = _2469;
    out.gl_Position.z = _2534;
    out.gl_Position.w = _2437;
    float _2538 = _2536 * 0.5;
    float _2540 = -_2528;
    float _2542 = _2540 + 1.0;
    float _2544 = _2542 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.z = _2538;
    out.m_73.w = _2437;
    float _2546 = _2544 * _2491;
    float _2548 = -_2544;
    float _2550 = _2548 + 1.0;
    float _2552 = _2502 * _2546;
    float _2554 = _2502 * _2550;
    float _2556 = _2520 * _2546;
    float _2558 = fma(_2516, _2552, _2496);
    float _2560 = fma(_2518, _2552, _2498);
    float _2562 = fma(_2502, _2556, _2500);
    out.m_75.x = _2558;
    out.m_75.y = _2560;
    out.m_75.z = _2562;
    out.m_75.w = _2554;
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
    bool _1771 = false;
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
        float _2619 = as_type<float>(_110);
        out.gl_Position.z = _2619;
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
        float _2689 = as_type<float>(_148);
        out.gl_Position.z = _2689;
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
    float _1038 = in.m_51.w;
    float _1040 = _810 * _810;
    float _1042 = _602 * _152;
    float _1044 = _602 * _176;
    float _1046 = in.m_53.w;
    float _1048 = fma(_812, _812, _1040);
    float _1050 = fma(_600, _150, _1042);
    float _1052 = fma(_600, _174, _1044);
    float _1054 = in.m_55.w;
    float _1056 = fma(_814, _814, _1048);
    float _1058 = _602 * _160;
    float _1060 = fma(_604, _154, _1050);
    float _1062 = fma(_604, _178, _1052);
    float _1064 = rsqrt(_1056);
    float _1066 = fma(_600, _158, _1058);
    float _1068 = in.m_59.w;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1072 = _1036 + _1070;
    float _1074 = fma(_604, _162, _1066);
    float _1076 = _998 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1078;
    float _1082 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1084 = _1060 + _1038;
    float _1086 = in.m_61.x;
    float _1088 = 1.0 / _1080;
    float _1090 = _1074 + _1046;
    float _1092 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1094 = _1084 + _1092;
    float _1096 = _1064 * _810;
    float _1098 = _1064 * _812;
    float _1100 = _1062 + _1054;
    float _1102 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1104 = _1090 + _1102;
    float _1106 = _1094 * _1094;
    float _1108 = _1096 * _328;
    float _1110 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1112 = _1100 + _1110;
    float _1114 = _1064 * _814;
    float _1116 = fma(_1104, _1104, _1106);
    float _1118 = fma(_1098, _324, _1108);
    float _1120 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1124 = _1122 != 0;
    float _1126 = fma(_1112, _1112, _1116);
    float _1128 = fma(_1114, _332, _1118);
    bool _1130 = _1068 > 0.5;
    float _1132 = _1072 * _1088;
    float _1134 = in.m_63.x;
    float _1136 = in.m_63.y;
    float _1138 = in.m_63.z;
    int _1140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1142 = _1140 != 0;
    float _1144 = rsqrt(_1126);
    float _1146 = abs(_1128);
    bool _1148 = _1146 > 0.99989998340606689453125;
    int _1150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1152 = _1150 != 0;
    float _1154 = in.m_61.y;
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1158 = _1156 != 0;
    float _1160 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    bool _1162 = _1036 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1164 = isnan(_1036);
    bool _1166 = _1162 || _1164;
    bool _1168 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1170 = _1166 || _1168;
    float _1172 = float(_1170);
    bool _1174 = _1036 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1176 = isnan(_1036);
    bool _1178 = _1174 || _1176;
    bool _1180 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1182 = _1178 || _1180;
    float _1184 = float(_1182);
    float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1186;
    bool _1190 = _1130;
    bool _1192 = _1158;
    float _1194 = _1086;
    float _1196 = _1056;
    if (!_1148)
    {
        _1006 = _324;
    }
    float _1198 = _1006;
    float _1200 = _1120 * _1144;
    float _1202 = 0.0;
    float _1204 = _1198;
    if (!_1148)
    {
        _1202 = _328;
    }
    float _1206 = _1202;
    float _1208 = _1206;
    if (_1148)
    {
        float _1210 = fma(_336, 0.001000000047497451305389404296875, _324);
        _1204 = _1210;
    }
    float _1212 = _1204;
    if (!_1148)
    {
        _1008 = _332;
    }
    float _1214 = _1008;
    float _1216 = _1214;
    if (_1148)
    {
        float _1218 = fma(_340, 0.001000000047497451305389404296875, _328);
        _1208 = _1218;
    }
    float _1220 = _1208;
    if (_1148)
    {
        float _1222 = fma(_344, 0.001000000047497451305389404296875, _332);
        _1216 = _1222;
    }
    float _1224 = _1216;
    int _1226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1228 = _1226 != 0;
    float _1230 = _1094 * _1200;
    float _1232 = _1104 * _1200;
    float _1234 = _1112 * _1200;
    float _1236 = -_1224;
    float _1238 = _1096 * _1236;
    float _1240 = -_1230;
    float _1242 = _1094 + _1240;
    float _1244 = -_1232;
    float _1246 = _1104 + _1244;
    float _1248 = -_1234;
    float _1250 = _1112 + _1248;
    float _1252 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1138);
    float _1254 = _1242 * _1242;
    float _1256 = -_1220;
    float _1258 = _1098 * _1256;
    float _1260 = -_1220;
    float _1262 = -_1238;
    float _1264 = fma(_1114, _1260, _1262);
    float _1266 = 0.0;
    if (_1152)
    {
        float _1268 = in.m_59.z;
        _1266 = _1268;
    }
    float _1270 = _1266;
    float _1272 = fma(_1246, _1246, _1254);
    float _1274 = -_1212;
    float _1276 = _1114 * _1274;
    float _1278 = -_1212;
    float _1280 = -_1258;
    float _1282 = fma(_1096, _1278, _1280);
    float _1284 = in.m_59.y;
    float _1286 = fma(_1250, _1250, _1272);
    float _1288 = -_1224;
    float _1290 = -_1276;
    float _1292 = fma(_1098, _1288, _1290);
    float _1294 = -_1154;
    float _1296 = _1294 + 1.0;
    float _1298 = in.m_59.x;
    float _1300 = sqrt(_1286);
    float _1302 = _1292 * _1292;
    float _1304 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1136);
    int _1306 = _1130 ? as_type<int>(_1296) : as_type<int>(_1154);
    float _1308 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1134);
    float _1310 = fma(_1264, _1264, _1302);
    float _1312 = -_1172;
    float _1314 = _1312 + 1.0;
    float _1316 = _1158 ? as_type<float>(_1306) : _1154;
    float _1318 = fma(_1282, _1282, _1310);
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1320;
    float _1324 = _1286;
    float _1326 = _1154;
    if (!_1142)
    {
        _1324 = _1086;
    }
    float _1328 = _1324;
    int _1330 = 0;
    float _1332 = _1328;
    if (_1152)
    {
        float _1334 = -_1086;
        float _1336 = _1334 + 1.0;
        _1330 = as_type<int>(_1336);
    }
    int _1338 = _1330;
    float _1340 = rsqrt(_1318);
    float _1342 = _1270;
    if (_1152)
    {
        bool _1344 = _1270 > 0.5;
        _1190 = _1344;
    }
    bool _1346 = _1190;
    float _1348 = _1144 * _1300;
    float _1350 = fma(_1322, _1132, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    if (!_1124)
    {
        _1342 = _1284;
    }
    float _1352 = _1342;
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1354;
    float _1358 = _1076 * _1348;
    float _1360 = _1082 * _1348;
    float _1362 = _1160 * _1298;
    float _1364 = _1352;
    if (_1142)
    {
        bool _1366 = _1298 > 0.5;
        _1192 = _1366;
    }
    bool _1368 = _1192;
    float _1370 = _1358 * _1308;
    if (_1124)
    {
        _1364 = _1298;
    }
    float _1372 = _1364;
    float _1374 = fma(_1356, _1132, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1376 = fma(_1188, _1132, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1378 = trunc(_1362);
    int _1380 = int(_1378);
    float _1382 = _1360 * _1252;
    float _1384 = _1282 * _1340;
    float _1386 = _1000 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1388 = _1264 * _1340;
    float _1390 = _1292 * _1340;
    float _1392 = _1386 * _1348;
    float _1394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1396 = _1098 * _1390;
    float _1398 = _1386;
    if (!_1124)
    {
        float _1400 = in.m_59.z;
        _1398 = _1400;
    }
    float _1402 = _1398;
    float _1404 = _1392 * _1304;
    float _1406 = _1096 * _1384;
    float _1408 = -_1396;
    float _1410 = fma(_1096, _1388, _1408);
    float _1412 = -_1184;
    float _1414 = _1412 + 1.0;
    float _1416 = _1404 * _1098;
    float _1418 = _1404 * _1114;
    float _1420 = -_1406;
    float _1422 = fma(_1114, _1390, _1420);
    int _1424 = _1380 << 4;
    int _1426 = _1424 + 1968;
    float _1428 = fma(_1370, _1388, _1416);
    float _1430 = fma(_1370, _1384, _1418);
    float _1432 = _1172 * _1414;
    float _1434 = fma(_1382, _1422, _1428);
    float _1436 = fma(_1382, _1410, _1430);
    float _1438 = _1394 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1440 = _1350 * _1432;
    float _1442 = _1090 + _1434;
    float _1444 = _1100 + _1436;
    float _1446 = fma(_1438, _1316, -0.5);
    int _1448 = _1426 + 8;
    uint _1451 = uint(int(uint(_1448) >> uint(2)));
    uint _1453 = uint(int(uint(int(_1451)) >> uint(2)));
    int _1455 = int(_1451) & 3;
    float _1457 = (*spvDescriptorSet0.vp_c9)._m0[int(_1453)][_1455];
    float _1459 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1461 = _1442 + _1459;
    float _1463 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1465 = _1444 + _1463;
    float _1467 = _1374 * _1432;
    float _1469 = _1436;
    float _1471 = _1402;
    int _1473 = as_type<int>(_1432);
    float _1475 = _1442;
    float _1477 = _1444;
    if (!_1124)
    {
        _1469 = _1402;
    }
    float _1479 = _1469;
    float _1481 = _1461 * _1461;
    float _1483 = _1465 * _1465;
    float _1485 = _1479;
    float _1487 = _1481;
    float _1489 = _1483;
    if (_1124)
    {
        _1485 = _1284;
    }
    float _1491 = _1485;
    uint _1493 = uint(int(uint(_1426) >> uint(2)));
    uint _1495 = uint(int(uint(int(_1493)) >> uint(2)));
    int _1497 = int(_1493) & 3;
    float _1499 = (*spvDescriptorSet0.vp_c9)._m0[int(_1495)][_1497];
    int _1501 = int(_1493) + 1;
    uint _1503 = uint(int(uint(_1501) >> uint(2)));
    int _1505 = _1501 & 3;
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[int(_1503)][_1505];
    if (_1124)
    {
        _1471 = _1284;
    }
    float _1509 = _1471;
    float _1511 = _1481 + _1483;
    bool _1513 = _1284 > 0.5;
    float _1515 = _1114 * _1388;
    float _1517 = _1376 * _1432;
    float _1519 = sqrt(_1511);
    if (_1142)
    {
        float _1521 = -_1086;
        float _1523 = _1521 + 1.0;
        _1473 = as_type<int>(_1523);
    }
    int _1525 = _1473;
    float _1527 = -_1515;
    float _1529 = fma(_1098, _1384, _1527);
    float _1531 = _1404 * _1096;
    float _1533 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1535 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1440);
    if (_1142)
    {
        float _1537 = _1368 ? as_type<float>(_1525) : _1086;
        _1332 = _1537;
    }
    float _1539 = _1332;
    float _1541 = fma(_1370, _1390, _1531);
    float _1543 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1533);
    float _1545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1547 = _1372 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1549 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1551 = fma(_1382, _1529, _1541);
    float _1553 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1555 = _1519 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1557 = -_1549;
    float _1559 = fma(_1547, 2.0, _1557);
    if (_1152)
    {
        float _1561 = _1346 ? as_type<float>(_1338) : _1086;
        _1194 = _1561;
    }
    float _1563 = _1194;
    float _1565 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1553);
    float _1567 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1467);
    float _1569 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1517);
    float _1571 = _1084 + _1551;
    bool _1573 = !_1555;
    float _1575 = _1571;
    if (!_1573)
    {
        float _1577 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1579 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1581 = _1519 + _1579;
        float _1583 = rsqrt(_1511);
        float _1585 = _1581 * _1577;
        float _1587 = _1571 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1589 = _1585 * 0.15915493667125701904296875;
        float _1591 = _1589 * 6.283185482025146484375;
        float _1593 = sin(_1591);
        float _1595 = _1589 * 6.283185482025146484375;
        float _1597 = cos(_1595);
        float _1599 = fma(_1593, _1587, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1601 = _1583 * _1599;
        float _1603 = fma(_1461, _1601, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1605 = _1597 + (-1.0);
        float _1607 = fma(_1465, _1601, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1609 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1611 = _1603 + _1609;
        float _1613 = _1605 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1615 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1617 = _1607 + _1615;
        float _1619 = _1611 * _1611;
        float _1621 = fma(_1571, _1597, _1613);
        float _1623 = _1617 * _1617;
        _1575 = _1621;
        _1487 = _1619;
        _1489 = _1623;
        _1475 = _1603;
        _1477 = _1607;
    }
    float _1625 = _1575;
    float _1627 = _1487;
    float _1629 = _1489;
    float _1631 = _1475;
    float _1633 = _1477;
    if (_1228)
    {
        float _1635 = _1513 ? _1296 : _1154;
        _1326 = _1635;
    }
    float _1637 = _1326;
    float _1639 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1641 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1643 = _1625 + _1641;
    float _1645 = _1545 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1647 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1649 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1651 = fma(_1643, _1643, _1627);
    float _1653 = fma(_1645, _1563, -0.5);
    float _1655 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1543);
    float _1657 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1659 = fma(_1649, -2.0, _1647);
    float _1661 = -_128;
    float _1663 = fma(_1661, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1559);
    float _1665 = _1651 + _1629;
    float _1667 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1567);
    float _1669 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1565);
    float _1671 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1659);
    float _1673 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1535);
    float _1675 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1569);
    float _1677 = fma(_1655, _1653, _1663);
    float _1679 = _1539 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1681 = _1637 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1683 = -_1671;
    float _1685 = fma(_1669, _1446, _1683);
    float _1687 = _1499 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1689 = _1457 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1691 = sqrt(_1665);
    float _1693 = _1679 * _1639;
    float _1695 = _1681 * _1657;
    float _1697 = _1507 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1699 = _1667 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1701 = _1673 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1703 = _1675 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1705 = _1687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1707 = _1689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1709 = _1677 + 0.5;
    float _1711 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1713 = _1697 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1715 = _1699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1717 = _1701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1719 = _1703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1721 = _1685 + 0.5;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    bool _1723 = _1691 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1725 = isnan(_1691);
    bool _1727 = _1723 || _1725;
    bool _1729 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1731 = _1727 || _1729;
    out.m_67.x = _1705;
    out.m_67.y = _1713;
    out.m_67.z = _1707;
    out.m_69.x = _1715;
    out.m_69.y = _1717;
    out.m_69.z = _1719;
    out.m_69.w = _1711;
    out.m_71.x = _1693;
    out.m_71.y = _1695;
    out.m_71.z = _1709;
    out.m_71.w = _1721;
    float _1733 = _1685;
    float _1735 = _1719;
    if (!_1731)
    {
        _1733 = 1.0;
    }
    float _1737 = _1733;
    bool _1739 = !_1731;
    float _1741 = _1737;
    if (!_1739)
    {
        bool _1743 = _1691 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1745 = isnan(_1691);
        bool _1747 = _1743 || _1745;
        bool _1749 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1751 = _1747 || _1749;
        if (!_1751)
        {
            float _1753 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1755 = _1691 + _1753;
            float _1757 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1759 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1757;
            float _1761 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1763 = _1761 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1765 = 1.0 / _1759;
            float _1767 = _1755 * _1765;
            float _1769 = fma(_1767, _1763, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1741 = _1769;
            _1771 = true;
        }
        else
        {
            bool _1773 = _1691 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1775 = isnan(_1691);
            bool _1777 = _1773 || _1775;
            bool _1779 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1781 = _1777 || _1779;
            if (!_1781)
            {
                float _1783 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1785 = _1691 + _1783;
                float _1787 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1789 = _1787 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1791 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1793 = _1791 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1795 = 1.0 / _1789;
                float _1797 = _1785 * _1795;
                float _1799 = fma(_1797, _1793, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1741 = _1799;
                _1771 = true;
            }
            else
            {
                _1741 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1771 = false;
    float _1801 = _1741;
    float _1803 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1805 = _1625 + _1803;
    float _1807 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1809 = _1631 + _1807;
    float _1811 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1813 = _1633 + _1811;
    float _1815 = fma(_1805, _1801, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1817 = fma(_1809, _1801, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1819 = fma(_1813, _1801, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1821 = -_1084;
    float _1823 = _1821 + _1815;
    float _1825 = -_1090;
    float _1827 = _1825 + _1817;
    float _1829 = -_1100;
    float _1831 = _1829 + _1819;
    float _1833 = _1823 * _1823;
    float _1835 = fma(_1827, _1827, _1833);
    float _1837 = fma(_1831, _1831, _1835);
    float _1839 = sqrt(_1837);
    bool _1841 = _1839 > 0.0;
    bool _1843 = !_1841;
    float _1845 = _1835;
    float _1847 = _1839;
    float _1849 = _1817;
    float _1851 = _1815;
    float _1853 = _1819;
    if (!_1843)
    {
        bool _1855 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1857 = _1695;
        if (_1855)
        {
            float _1859 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1857 = _1859;
        }
        float _1861 = _1857;
        if (_1855)
        {
            float _1863 = _1861 * _812;
            _1735 = _1863;
        }
        float _1865 = _1735;
        float _1867 = _1865;
        if (_1855)
        {
            float _1869 = _1861 * _810;
            _1845 = _1869;
        }
        float _1871 = _1845;
        float _1873 = _1871;
        if (_1855)
        {
            float _1875 = _1861 * _814;
            _1847 = _1875;
        }
        float _1877 = _1847;
        float _1879 = _1877;
        if (!_1855)
        {
            float _1881 = _128 + 1.0;
            if (!_172)
            {
                float _1883 = _1881 * _1881;
                float _1885 = _1883 * 0.5;
                _130 = _1885;
            }
            float _1887 = _130;
            float _1889 = _1887;
            if (!_172)
            {
                float _1891 = _1887 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1889 = _1891;
            }
            float _1893 = _1889;
            bool _1895 = !_172;
            float _1897 = _1893;
            if (!_1895)
            {
                float _1899 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1901 = log2(_1899);
                float _1903 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1905 = _1903 + 1.0;
                float _1907 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1909 = _1901 * _1881;
                float _1911 = 1.0 / _1905;
                float _1913 = _1907 * 0.693147182464599609375;
                float _1915 = exp2(_1909);
                float _1917 = 1.0 / _1913;
                float _1919 = _1915 + (-1.0);
                float _1921 = -_1919;
                float _1923 = fma(_1921, _1917, _1881);
                float _1925 = _1923 * _1911;
                float _1927 = _1925 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1897 = _1927;
            }
            float _1929 = _1897;
            float _1931 = _1929 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _1933 = _1929 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1935 = _1929 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1937 = _1929;
            if (!_172)
            {
                _1937 = _1881;
            }
            float _1939 = _1937;
            float _1941 = _1931 * _328;
            float _1943 = _1931 * _294;
            float _1945 = _1931 * _340;
            float _1947 = fma(_1933, _324, _1941);
            float _1949 = fma(_1933, _290, _1943);
            float _1951 = fma(_1935, _332, _1947);
            bool _1953 = !_172;
            float _1955 = _1939;
            if (!_1953)
            {
                float _1957 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1959 = log2(_1957);
                float _1961 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1963 = _1961 + 1.0;
                float _1965 = 1.0 / _1963;
                float _1967 = _1959 * _1881;
                float _1969 = exp2(_1967);
                float _1971 = -_1969;
                float _1973 = _1971 + 1.0;
                float _1975 = _1973 * _1965;
                _1955 = _1975;
            }
            float _1977 = _1955;
            float _1979 = fma(_1933, _336, _1945);
            float _1981 = fma(_1935, _298, _1949);
            float _1983 = fma(_1977, _230, _1951);
            float _1985 = fma(_1935, _344, _1979);
            float _1987 = fma(_1977, _228, _1981);
            float _1989 = -_532;
            float _1991 = _1989 + _1983;
            float _1993 = fma(_1977, _232, _1985);
            float _1995 = -_538;
            float _1997 = _1995 + _1987;
            float _1999 = _1991 * _152;
            float _2001 = _1991 * _160;
            float _2003 = -_546;
            float _2005 = _2003 + _1993;
            float _2007 = _1991 * _176;
            float _2009 = fma(_1997, _150, _1999);
            float _2011 = fma(_1997, _158, _2001);
            float _2013 = fma(_1997, _174, _2007);
            float _2015 = fma(_2005, _154, _2009);
            float _2017 = fma(_2005, _162, _2011);
            float _2019 = fma(_2005, _178, _2013);
            float _2021 = _2015 * _2015;
            float _2023 = fma(_2017, _2017, _2021);
            float _2025 = fma(_2019, _2019, _2023);
            _1196 = _2025;
            _820 = _2015;
            _822 = _2017;
            _824 = _2019;
            _1867 = _2017;
            _1873 = _2015;
            _1879 = _2019;
        }
        float _2027 = _1196;
        float _2029 = _820;
        float _2031 = _822;
        float _2033 = _824;
        float _2035 = _1867;
        float _2037 = _1873;
        float _2039 = _1879;
        float _2041 = sqrt(_2027);
        float _2043 = rsqrt(_1837);
        bool _2045 = _2041 > 0.0;
        float _2047 = _1827 * _2043;
        float _2049 = _1823 * _2043;
        float _2051 = _1831 * _2043;
        bool _2053 = !_2045;
        if (!_2053)
        {
            float _2055 = rsqrt(_2027);
            float _2057 = _2055 * _2029;
            float _2059 = _2055 * _2031;
            float _2061 = _2049 * _2057;
            float _2063 = _2055 * _2033;
            float _2065 = fma(_2047, _2059, _2061);
            float _2067 = fma(_2051, _2063, _2065);
            float _2069 = _2067 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2071 = fma(_2035, _2069, _1817);
            float _2073 = fma(_2037, _2069, _1815);
            float _2075 = fma(_2039, _2069, _1819);
            _1849 = _2071;
            _1851 = _2073;
            _1853 = _2075;
        }
    }
    float _2077 = _1849;
    float _2079 = _1851;
    float _2081 = _1853;
    float _2083 = -_1232;
    float _2085 = _2083 + _2077;
    float _2087 = -_1230;
    float _2089 = _2087 + _2079;
    float _2091 = -_1234;
    float _2093 = _2091 + _2081;
    bool _2095 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2097 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2099 = _2095 || _2097;
    bool _2101 = isnan(0.5);
    bool _2103 = _2099 || _2101;
    float _2105 = _2089;
    float _2107 = _2085;
    float _2109 = _2093;
    if (!_2103)
    {
        float _2111 = -_1230;
        float _2113 = _1084 + _2111;
        float _2115 = -_1232;
        float _2117 = _1090 + _2115;
        float _2119 = -_1234;
        float _2121 = _1100 + _2119;
        float _2123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2125 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2127 = _2113 + _2125;
        float _2129 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2131 = _2117 + _2129;
        float _2133 = -_1100;
        float _2135 = _2133 + _2081;
        float _2137 = -_1090;
        float _2139 = _2137 + _2077;
        float _2141 = _2127 * _2127;
        float _2143 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2145 = _2121 + _2143;
        float _2147 = -_1084;
        float _2149 = _2147 + _2079;
        float _2151 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2153 = fma(_2131, _2131, _2141);
        float _2155 = fma(_2145, _2145, _2153);
        float _2157 = 1.0 / _1348;
        float _2159 = sqrt(_2155);
        float _2161 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2163 = precise::min(_2159, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2165 = _2163 * _2123;
        float _2167 = _2165 * _2157;
        float _2169 = _2161 * _2167;
        float _2171 = _2135 * _2167;
        float _2173 = fma(_2139, _2169, _2117);
        float _2175 = fma(_2149, _2169, _2113);
        float _2177 = fma(_2161, _2171, _2121);
        _2105 = _2175;
        _2107 = _2173;
        _2109 = _2177;
    }
    float _2179 = _2105;
    float _2181 = _2107;
    float _2183 = _2109;
    float _2185 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2187 = _2179 + _2185;
    float _2189 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2191 = _2181 + _2189;
    float _2193 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2195 = _2183 + _2193;
    float _2197 = _2187 * _2187;
    float _2199 = fma(_2191, _2191, _2197);
    float _2201 = fma(_2195, _2195, _2199);
    float _2203 = rsqrt(_2201);
    float _2205 = sqrt(_2201);
    float _2207 = _2203 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2209 = _2191 * _2207;
    float _2211 = _2195 * _2207;
    float _2213 = _2209 * _2209;
    float _2215 = _2211 * _2211;
    float _2217 = _2213 + _2215;
    float _2219 = sqrt(_2217);
    bool _2221 = _2219 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2223 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2225 = _2219 + _2223;
    float _2227 = _2203;
    float _2229 = _2217;
    float _2231 = _2225;
    float _2233 = _2187;
    if (_2221)
    {
        float _2235 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2227 = _2235;
    }
    float _2237 = _2227;
    if (_2221)
    {
        float _2239 = rsqrt(_2217);
        _2229 = _2239;
    }
    float _2241 = _2229;
    float _2243 = _2241;
    if (_2221)
    {
        float _2245 = _2225 * _2237;
        _2231 = _2245;
    }
    float _2247 = _2231;
    if (_2221)
    {
        float _2249 = _2247 * 0.15915493667125701904296875;
        _214 = _2249;
    }
    float _2251 = _214;
    float _2253 = _2195;
    float _2255 = _2251;
    if (_2221)
    {
        float _2257 = _2251 * 6.283185482025146484375;
        float _2259 = sin(_2257);
        _2253 = _2259;
    }
    float _2261 = _2253;
    float _2263 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2265 = precise::max(0.0, _2263);
    float _2267 = _2237;
    float _2269 = _2265;
    if (_2221)
    {
        float _2271 = _2251 * 6.283185482025146484375;
        float _2273 = cos(_2271);
        _2267 = _2273;
    }
    float _2275 = _2267;
    float _2277 = -_2207;
    float _2279 = -_2265;
    float _2281 = fma(_2187, _2277, _2279);
    if (_2221)
    {
        float _2283 = _2281 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2233 = _2283;
    }
    float _2285 = _2233;
    float _2287 = _2285;
    float _2289 = _2261;
    if (_2221)
    {
        float _2291 = fma(_2261, _2285, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2287 = _2291;
    }
    float _2293 = _2287;
    float _2295 = _2293;
    if (!_2221)
    {
        _2289 = _2209;
    }
    float _2297 = _2289;
    float _2299 = _2297;
    float _2301 = _2275;
    if (_2221)
    {
        float _2303 = _2275 + (-1.0);
        _2269 = _2303;
    }
    float _2305 = _2269;
    float _2307 = _2305;
    if (_2221)
    {
        float _2309 = _2241 * _2293;
        _216 = _2309;
    }
    float _2311 = _216;
    if (!_2221)
    {
        _2295 = _2281;
    }
    float _2313 = _2295;
    float _2315 = _2313;
    if (_2221)
    {
        float _2317 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2255 = _2317;
    }
    float _2319 = _2255;
    if (_2221)
    {
        float _2321 = _2209 * _2311;
        _2299 = _2321;
    }
    float _2323 = _2299;
    if (!_2221)
    {
        _2307 = _2211;
    }
    float _2325 = _2307;
    float _2327 = _2325;
    if (_2221)
    {
        float _2329 = _2211 * _2311;
        _2327 = _2329;
    }
    float _2331 = _2327;
    if (!_2221)
    {
        _2243 = _2213;
    }
    float _2333 = _2243;
    float _2335 = _2333;
    if (_2221)
    {
        float _2337 = fma(_2281, _2275, _2319);
        _2315 = _2337;
    }
    float _2339 = _2315;
    if (_2221)
    {
        float _2341 = _2323 * _2323;
        _2335 = _2341;
    }
    float _2343 = _2335;
    if (!_2221)
    {
        _2301 = _2215;
    }
    float _2345 = _2301;
    float _2347 = _2345;
    if (_2221)
    {
        float _2349 = _2331 * _2331;
        _2347 = _2349;
    }
    float _2351 = _2347;
    float _2353 = fma(_2339, _2339, _2343);
    float _2355 = _2353 + _2351;
    float _2357 = _2179 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2359 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2361 = fma(_2205, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2359);
    float _2363 = precise::clamp(_2361, 0.0, 1.0);
    float _2365 = _2179 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2367 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2369 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2357);
    float _2371 = rsqrt(_2355);
    float _2373 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2365);
    float _2375 = -_2363;
    float _2377 = _2375 + 1.0;
    float _2379 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2369);
    float _2381 = _2179 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2383 = _2179 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2385 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2373);
    float _2387 = _2379 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2389 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2381);
    float _2391 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2383);
    float _2393 = _2385 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2395 = _2387 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2397 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2389);
    float _2399 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2391);
    float _2401 = abs(_2377);
    float _2403 = log2(_2401);
    float _2405 = -_2395;
    float _2407 = fma(_2405, _2367, 1.0);
    float _2409 = _2371 * _2323;
    float _2411 = _2397 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2413 = _2393 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2415 = _2371 * _2339;
    float _2417 = _2371 * _2331;
    float _2419 = _2399 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2421 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2413);
    float _2423 = _2409 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2425 = log2(_2407);
    float _2427 = _2393 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2429 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2421);
    float _2431 = -_2423;
    float _2433 = fma(_2415, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2431);
    float _2435 = _2415 + 1.0;
    float _2437 = fma(_2419, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2429);
    float _2439 = -_2417;
    float _2441 = fma(_2439, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2433);
    float _2443 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2445 = _2393 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2447 = 1.0 / _2437;
    float _2449 = fma(_2441, -0.5, 0.5);
    float _2451 = fma(_2441, 0.5, 0.5);
    float _2453 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2445);
    float _2455 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2427);
    float _2457 = fma(_2451, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2459 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2453);
    float _2461 = exp2(_2443);
    float _2463 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2455);
    float _2465 = fma(_2451, _2457, -0.212114393711090087890625);
    float _2467 = fma(_2419, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2459);
    float _2469 = fma(_2419, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2463);
    float _2471 = _2425 * 0.693147182464599609375;
    float _2473 = fma(_2451, _2465, 1.570728778839111328125);
    float _2475 = sqrt(_2449);
    float _2477 = _2467 * _2447;
    float _2479 = _2469 * _2447;
    float _2481 = _2471 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2483 = fma(_2477, 0.5, 0.5);
    float _2485 = fma(_2479, -0.5, 0.5);
    float _2487 = -_2415;
    float _2489 = fma(_2461, _2435, _2487);
    float3 _6400 = float3(_2483, _2485, _2481);
    float _2491 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6400, float3(0.0), isnan(_6400)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6400, float3(0.0), isnan(_6400)), level(0.0)).x;
    float3 _6411 = float3(_2483, _2485, _2481);
    float4 _2494 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6411, float3(0.0), isnan(_6411)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6411, float3(0.0), isnan(_6411)), level(0.0)).xyzw;
    float _2496 = _2494.x;
    float _2498 = _2494.y;
    float _2500 = _2494.z;
    float _2502 = _2494.w;
    float _2504 = fma(_2489, 0.5, 0.5);
    float _2506 = _2475 * 0.636619746685028076171875;
    float _2508 = -_2473;
    float _2510 = fma(_2506, _2508, 1.0);
    float2 _6438 = float2(_2510, _2504);
    float3 _2514 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6438, float2(0.0), isnan(_6438)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6438, float2(0.0), isnan(_6438)), level(0.0)).xyz;
    float _2516 = _2514.x;
    float _2518 = _2514.y;
    float _2520 = _2514.z;
    float _2522 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2524 = _2393 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2526 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2524);
    float _2528 = exp2(_2522);
    float _2530 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2532 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2526);
    float _2534 = fma(_2419, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2532);
    out.m_47.x = _2530;
    float _2536 = _2534 + _2437;
    out.gl_Position.x = _2467;
    out.gl_Position.y = _2469;
    out.gl_Position.z = _2534;
    out.gl_Position.w = _2437;
    float _2538 = _2536 * 0.5;
    float _2540 = -_2528;
    float _2542 = _2540 + 1.0;
    float _2544 = _2542 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.z = _2538;
    out.m_73.w = _2437;
    float _2546 = _2544 * _2491;
    float _2548 = -_2544;
    float _2550 = _2548 + 1.0;
    float _2552 = _2502 * _2546;
    float _2554 = _2502 * _2550;
    float _2556 = _2520 * _2546;
    float _2558 = fma(_2516, _2552, _2496);
    float _2560 = fma(_2518, _2552, _2498);
    float _2562 = fma(_2502, _2556, _2500);
    out.m_75.x = _2558;
    out.m_75.y = _2560;
    out.m_75.z = _2562;
    out.m_75.w = _2554;
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
    bool _1771 = false;
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
        float _2619 = as_type<float>(_110);
        out.gl_Position.z = _2619;
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
        float _2689 = as_type<float>(_148);
        out.gl_Position.z = _2689;
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
    float _1038 = in.m_51.w;
    float _1040 = _810 * _810;
    float _1042 = _602 * _152;
    float _1044 = _602 * _176;
    float _1046 = in.m_53.w;
    float _1048 = fma(_812, _812, _1040);
    float _1050 = fma(_600, _150, _1042);
    float _1052 = fma(_600, _174, _1044);
    float _1054 = in.m_55.w;
    float _1056 = fma(_814, _814, _1048);
    float _1058 = _602 * _160;
    float _1060 = fma(_604, _154, _1050);
    float _1062 = fma(_604, _178, _1052);
    float _1064 = rsqrt(_1056);
    float _1066 = fma(_600, _158, _1058);
    float _1068 = in.m_59.w;
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1072 = _1036 + _1070;
    float _1074 = fma(_604, _162, _1066);
    float _1076 = _998 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1078;
    float _1082 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1084 = _1060 + _1038;
    float _1086 = in.m_61.x;
    float _1088 = 1.0 / _1080;
    float _1090 = _1074 + _1046;
    float _1092 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1094 = _1084 + _1092;
    float _1096 = _1064 * _810;
    float _1098 = _1064 * _812;
    float _1100 = _1062 + _1054;
    float _1102 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1104 = _1090 + _1102;
    float _1106 = _1094 * _1094;
    float _1108 = _1096 * _328;
    float _1110 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1112 = _1100 + _1110;
    float _1114 = _1064 * _814;
    float _1116 = fma(_1104, _1104, _1106);
    float _1118 = fma(_1098, _324, _1108);
    float _1120 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1124 = _1122 != 0;
    float _1126 = fma(_1112, _1112, _1116);
    float _1128 = fma(_1114, _332, _1118);
    bool _1130 = _1068 > 0.5;
    float _1132 = _1072 * _1088;
    float _1134 = in.m_63.x;
    float _1136 = in.m_63.y;
    float _1138 = in.m_63.z;
    int _1140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1142 = _1140 != 0;
    float _1144 = rsqrt(_1126);
    float _1146 = abs(_1128);
    bool _1148 = _1146 > 0.99989998340606689453125;
    int _1150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1152 = _1150 != 0;
    float _1154 = in.m_61.y;
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1158 = _1156 != 0;
    float _1160 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    bool _1162 = _1036 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1164 = isnan(_1036);
    bool _1166 = _1162 || _1164;
    bool _1168 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1170 = _1166 || _1168;
    float _1172 = float(_1170);
    bool _1174 = _1036 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1176 = isnan(_1036);
    bool _1178 = _1174 || _1176;
    bool _1180 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1182 = _1178 || _1180;
    float _1184 = float(_1182);
    float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1186;
    bool _1190 = _1130;
    bool _1192 = _1158;
    float _1194 = _1086;
    float _1196 = _1056;
    if (!_1148)
    {
        _1006 = _324;
    }
    float _1198 = _1006;
    float _1200 = _1120 * _1144;
    float _1202 = 0.0;
    float _1204 = _1198;
    if (!_1148)
    {
        _1202 = _328;
    }
    float _1206 = _1202;
    float _1208 = _1206;
    if (_1148)
    {
        float _1210 = fma(_336, 0.001000000047497451305389404296875, _324);
        _1204 = _1210;
    }
    float _1212 = _1204;
    if (!_1148)
    {
        _1008 = _332;
    }
    float _1214 = _1008;
    float _1216 = _1214;
    if (_1148)
    {
        float _1218 = fma(_340, 0.001000000047497451305389404296875, _328);
        _1208 = _1218;
    }
    float _1220 = _1208;
    if (_1148)
    {
        float _1222 = fma(_344, 0.001000000047497451305389404296875, _332);
        _1216 = _1222;
    }
    float _1224 = _1216;
    int _1226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1228 = _1226 != 0;
    float _1230 = _1094 * _1200;
    float _1232 = _1104 * _1200;
    float _1234 = _1112 * _1200;
    float _1236 = -_1224;
    float _1238 = _1096 * _1236;
    float _1240 = -_1230;
    float _1242 = _1094 + _1240;
    float _1244 = -_1232;
    float _1246 = _1104 + _1244;
    float _1248 = -_1234;
    float _1250 = _1112 + _1248;
    float _1252 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1138);
    float _1254 = _1242 * _1242;
    float _1256 = -_1220;
    float _1258 = _1098 * _1256;
    float _1260 = -_1220;
    float _1262 = -_1238;
    float _1264 = fma(_1114, _1260, _1262);
    float _1266 = 0.0;
    if (_1152)
    {
        float _1268 = in.m_59.z;
        _1266 = _1268;
    }
    float _1270 = _1266;
    float _1272 = fma(_1246, _1246, _1254);
    float _1274 = -_1212;
    float _1276 = _1114 * _1274;
    float _1278 = -_1212;
    float _1280 = -_1258;
    float _1282 = fma(_1096, _1278, _1280);
    float _1284 = in.m_59.y;
    float _1286 = fma(_1250, _1250, _1272);
    float _1288 = -_1224;
    float _1290 = -_1276;
    float _1292 = fma(_1098, _1288, _1290);
    float _1294 = -_1154;
    float _1296 = _1294 + 1.0;
    float _1298 = in.m_59.x;
    float _1300 = sqrt(_1286);
    float _1302 = _1292 * _1292;
    float _1304 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1136);
    int _1306 = _1130 ? as_type<int>(_1296) : as_type<int>(_1154);
    float _1308 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1134);
    float _1310 = fma(_1264, _1264, _1302);
    float _1312 = -_1172;
    float _1314 = _1312 + 1.0;
    float _1316 = _1158 ? as_type<float>(_1306) : _1154;
    float _1318 = fma(_1282, _1282, _1310);
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1320;
    float _1324 = _1286;
    float _1326 = _1154;
    if (!_1142)
    {
        _1324 = _1086;
    }
    float _1328 = _1324;
    int _1330 = 0;
    float _1332 = _1328;
    if (_1152)
    {
        float _1334 = -_1086;
        float _1336 = _1334 + 1.0;
        _1330 = as_type<int>(_1336);
    }
    int _1338 = _1330;
    float _1340 = rsqrt(_1318);
    float _1342 = _1270;
    if (_1152)
    {
        bool _1344 = _1270 > 0.5;
        _1190 = _1344;
    }
    bool _1346 = _1190;
    float _1348 = _1144 * _1300;
    float _1350 = fma(_1322, _1132, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    if (!_1124)
    {
        _1342 = _1284;
    }
    float _1352 = _1342;
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1354;
    float _1358 = _1076 * _1348;
    float _1360 = _1082 * _1348;
    float _1362 = _1160 * _1298;
    float _1364 = _1352;
    if (_1142)
    {
        bool _1366 = _1298 > 0.5;
        _1192 = _1366;
    }
    bool _1368 = _1192;
    float _1370 = _1358 * _1308;
    if (_1124)
    {
        _1364 = _1298;
    }
    float _1372 = _1364;
    float _1374 = fma(_1356, _1132, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1376 = fma(_1188, _1132, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1378 = trunc(_1362);
    int _1380 = int(_1378);
    float _1382 = _1360 * _1252;
    float _1384 = _1282 * _1340;
    float _1386 = _1000 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1388 = _1264 * _1340;
    float _1390 = _1292 * _1340;
    float _1392 = _1386 * _1348;
    float _1394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1396 = _1098 * _1390;
    float _1398 = _1386;
    if (!_1124)
    {
        float _1400 = in.m_59.z;
        _1398 = _1400;
    }
    float _1402 = _1398;
    float _1404 = _1392 * _1304;
    float _1406 = _1096 * _1384;
    float _1408 = -_1396;
    float _1410 = fma(_1096, _1388, _1408);
    float _1412 = -_1184;
    float _1414 = _1412 + 1.0;
    float _1416 = _1404 * _1098;
    float _1418 = _1404 * _1114;
    float _1420 = -_1406;
    float _1422 = fma(_1114, _1390, _1420);
    int _1424 = _1380 << 4;
    int _1426 = _1424 + 1968;
    float _1428 = fma(_1370, _1388, _1416);
    float _1430 = fma(_1370, _1384, _1418);
    float _1432 = _1172 * _1414;
    float _1434 = fma(_1382, _1422, _1428);
    float _1436 = fma(_1382, _1410, _1430);
    float _1438 = _1394 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1440 = _1350 * _1432;
    float _1442 = _1090 + _1434;
    float _1444 = _1100 + _1436;
    float _1446 = fma(_1438, _1316, -0.5);
    int _1448 = _1426 + 8;
    uint _1451 = uint(int(uint(_1448) >> uint(2)));
    uint _1453 = uint(int(uint(int(_1451)) >> uint(2)));
    int _1455 = int(_1451) & 3;
    float _1457 = (*spvDescriptorSet0.vp_c9)._m0[int(_1453)][_1455];
    float _1459 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1461 = _1442 + _1459;
    float _1463 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1465 = _1444 + _1463;
    float _1467 = _1374 * _1432;
    float _1469 = _1436;
    float _1471 = _1402;
    int _1473 = as_type<int>(_1432);
    float _1475 = _1442;
    float _1477 = _1444;
    if (!_1124)
    {
        _1469 = _1402;
    }
    float _1479 = _1469;
    float _1481 = _1461 * _1461;
    float _1483 = _1465 * _1465;
    float _1485 = _1479;
    float _1487 = _1481;
    float _1489 = _1483;
    if (_1124)
    {
        _1485 = _1284;
    }
    float _1491 = _1485;
    uint _1493 = uint(int(uint(_1426) >> uint(2)));
    uint _1495 = uint(int(uint(int(_1493)) >> uint(2)));
    int _1497 = int(_1493) & 3;
    float _1499 = (*spvDescriptorSet0.vp_c9)._m0[int(_1495)][_1497];
    int _1501 = int(_1493) + 1;
    uint _1503 = uint(int(uint(_1501) >> uint(2)));
    int _1505 = _1501 & 3;
    float _1507 = (*spvDescriptorSet0.vp_c9)._m0[int(_1503)][_1505];
    if (_1124)
    {
        _1471 = _1284;
    }
    float _1509 = _1471;
    float _1511 = _1481 + _1483;
    bool _1513 = _1284 > 0.5;
    float _1515 = _1114 * _1388;
    float _1517 = _1376 * _1432;
    float _1519 = sqrt(_1511);
    if (_1142)
    {
        float _1521 = -_1086;
        float _1523 = _1521 + 1.0;
        _1473 = as_type<int>(_1523);
    }
    int _1525 = _1473;
    float _1527 = -_1515;
    float _1529 = fma(_1098, _1384, _1527);
    float _1531 = _1404 * _1096;
    float _1533 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1535 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1440);
    if (_1142)
    {
        float _1537 = _1368 ? as_type<float>(_1525) : _1086;
        _1332 = _1537;
    }
    float _1539 = _1332;
    float _1541 = fma(_1370, _1390, _1531);
    float _1543 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1533);
    float _1545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1547 = _1372 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1549 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1551 = fma(_1382, _1529, _1541);
    float _1553 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1555 = _1519 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1557 = -_1549;
    float _1559 = fma(_1547, 2.0, _1557);
    if (_1152)
    {
        float _1561 = _1346 ? as_type<float>(_1338) : _1086;
        _1194 = _1561;
    }
    float _1563 = _1194;
    float _1565 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1553);
    float _1567 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1467);
    float _1569 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1517);
    float _1571 = _1084 + _1551;
    bool _1573 = !_1555;
    float _1575 = _1571;
    if (!_1573)
    {
        float _1577 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1579 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1581 = _1519 + _1579;
        float _1583 = rsqrt(_1511);
        float _1585 = _1581 * _1577;
        float _1587 = _1571 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1589 = _1585 * 0.15915493667125701904296875;
        float _1591 = _1589 * 6.283185482025146484375;
        float _1593 = sin(_1591);
        float _1595 = _1589 * 6.283185482025146484375;
        float _1597 = cos(_1595);
        float _1599 = fma(_1593, _1587, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1601 = _1583 * _1599;
        float _1603 = fma(_1461, _1601, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1605 = _1597 + (-1.0);
        float _1607 = fma(_1465, _1601, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1609 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1611 = _1603 + _1609;
        float _1613 = _1605 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1615 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1617 = _1607 + _1615;
        float _1619 = _1611 * _1611;
        float _1621 = fma(_1571, _1597, _1613);
        float _1623 = _1617 * _1617;
        _1575 = _1621;
        _1487 = _1619;
        _1489 = _1623;
        _1475 = _1603;
        _1477 = _1607;
    }
    float _1625 = _1575;
    float _1627 = _1487;
    float _1629 = _1489;
    float _1631 = _1475;
    float _1633 = _1477;
    if (_1228)
    {
        float _1635 = _1513 ? _1296 : _1154;
        _1326 = _1635;
    }
    float _1637 = _1326;
    float _1639 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1641 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1643 = _1625 + _1641;
    float _1645 = _1545 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1647 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1649 = _1491 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1651 = fma(_1643, _1643, _1627);
    float _1653 = fma(_1645, _1563, -0.5);
    float _1655 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1543);
    float _1657 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1659 = fma(_1649, -2.0, _1647);
    float _1661 = -_128;
    float _1663 = fma(_1661, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1559);
    float _1665 = _1651 + _1629;
    float _1667 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1567);
    float _1669 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1565);
    float _1671 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1659);
    float _1673 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1535);
    float _1675 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1569);
    float _1677 = fma(_1655, _1653, _1663);
    float _1679 = _1539 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1681 = _1637 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1683 = -_1671;
    float _1685 = fma(_1669, _1446, _1683);
    float _1687 = _1499 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1689 = _1457 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1691 = sqrt(_1665);
    float _1693 = _1679 * _1639;
    float _1695 = _1681 * _1657;
    float _1697 = _1507 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1699 = _1667 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1701 = _1673 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1703 = _1675 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1705 = _1687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1707 = _1689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1709 = _1677 + 0.5;
    float _1711 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1713 = _1697 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1715 = _1699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1717 = _1701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1719 = _1703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1721 = _1685 + 0.5;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    bool _1723 = _1691 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1725 = isnan(_1691);
    bool _1727 = _1723 || _1725;
    bool _1729 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1731 = _1727 || _1729;
    out.m_67.x = _1705;
    out.m_67.y = _1713;
    out.m_67.z = _1707;
    out.m_69.x = _1715;
    out.m_69.y = _1717;
    out.m_69.z = _1719;
    out.m_69.w = _1711;
    out.m_71.x = _1693;
    out.m_71.y = _1695;
    out.m_71.z = _1709;
    out.m_71.w = _1721;
    float _1733 = _1685;
    float _1735 = _1719;
    if (!_1731)
    {
        _1733 = 1.0;
    }
    float _1737 = _1733;
    bool _1739 = !_1731;
    float _1741 = _1737;
    if (!_1739)
    {
        bool _1743 = _1691 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1745 = isnan(_1691);
        bool _1747 = _1743 || _1745;
        bool _1749 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1751 = _1747 || _1749;
        if (!_1751)
        {
            float _1753 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1755 = _1691 + _1753;
            float _1757 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1759 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1757;
            float _1761 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1763 = _1761 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1765 = 1.0 / _1759;
            float _1767 = _1755 * _1765;
            float _1769 = fma(_1767, _1763, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1741 = _1769;
            _1771 = true;
        }
        else
        {
            bool _1773 = _1691 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1775 = isnan(_1691);
            bool _1777 = _1773 || _1775;
            bool _1779 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1781 = _1777 || _1779;
            if (!_1781)
            {
                float _1783 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1785 = _1691 + _1783;
                float _1787 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1789 = _1787 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1791 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1793 = _1791 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1795 = 1.0 / _1789;
                float _1797 = _1785 * _1795;
                float _1799 = fma(_1797, _1793, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1741 = _1799;
                _1771 = true;
            }
            else
            {
                _1741 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1771 = false;
    float _1801 = _1741;
    float _1803 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1805 = _1625 + _1803;
    float _1807 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1809 = _1631 + _1807;
    float _1811 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1813 = _1633 + _1811;
    float _1815 = fma(_1805, _1801, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1817 = fma(_1809, _1801, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1819 = fma(_1813, _1801, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1821 = -_1084;
    float _1823 = _1821 + _1815;
    float _1825 = -_1090;
    float _1827 = _1825 + _1817;
    float _1829 = -_1100;
    float _1831 = _1829 + _1819;
    float _1833 = _1823 * _1823;
    float _1835 = fma(_1827, _1827, _1833);
    float _1837 = fma(_1831, _1831, _1835);
    float _1839 = sqrt(_1837);
    bool _1841 = _1839 > 0.0;
    bool _1843 = !_1841;
    float _1845 = _1835;
    float _1847 = _1839;
    float _1849 = _1817;
    float _1851 = _1815;
    float _1853 = _1819;
    if (!_1843)
    {
        bool _1855 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1857 = _1695;
        if (_1855)
        {
            float _1859 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1857 = _1859;
        }
        float _1861 = _1857;
        if (_1855)
        {
            float _1863 = _1861 * _812;
            _1735 = _1863;
        }
        float _1865 = _1735;
        float _1867 = _1865;
        if (_1855)
        {
            float _1869 = _1861 * _810;
            _1845 = _1869;
        }
        float _1871 = _1845;
        float _1873 = _1871;
        if (_1855)
        {
            float _1875 = _1861 * _814;
            _1847 = _1875;
        }
        float _1877 = _1847;
        float _1879 = _1877;
        if (!_1855)
        {
            float _1881 = _128 + 1.0;
            if (!_172)
            {
                float _1883 = _1881 * _1881;
                float _1885 = _1883 * 0.5;
                _130 = _1885;
            }
            float _1887 = _130;
            float _1889 = _1887;
            if (!_172)
            {
                float _1891 = _1887 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1889 = _1891;
            }
            float _1893 = _1889;
            bool _1895 = !_172;
            float _1897 = _1893;
            if (!_1895)
            {
                float _1899 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1901 = log2(_1899);
                float _1903 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1905 = _1903 + 1.0;
                float _1907 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1909 = _1901 * _1881;
                float _1911 = 1.0 / _1905;
                float _1913 = _1907 * 0.693147182464599609375;
                float _1915 = exp2(_1909);
                float _1917 = 1.0 / _1913;
                float _1919 = _1915 + (-1.0);
                float _1921 = -_1919;
                float _1923 = fma(_1921, _1917, _1881);
                float _1925 = _1923 * _1911;
                float _1927 = _1925 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1897 = _1927;
            }
            float _1929 = _1897;
            float _1931 = _1929 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _1933 = _1929 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1935 = _1929 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1937 = _1929;
            if (!_172)
            {
                _1937 = _1881;
            }
            float _1939 = _1937;
            float _1941 = _1931 * _328;
            float _1943 = _1931 * _294;
            float _1945 = _1931 * _340;
            float _1947 = fma(_1933, _324, _1941);
            float _1949 = fma(_1933, _290, _1943);
            float _1951 = fma(_1935, _332, _1947);
            bool _1953 = !_172;
            float _1955 = _1939;
            if (!_1953)
            {
                float _1957 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1959 = log2(_1957);
                float _1961 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1963 = _1961 + 1.0;
                float _1965 = 1.0 / _1963;
                float _1967 = _1959 * _1881;
                float _1969 = exp2(_1967);
                float _1971 = -_1969;
                float _1973 = _1971 + 1.0;
                float _1975 = _1973 * _1965;
                _1955 = _1975;
            }
            float _1977 = _1955;
            float _1979 = fma(_1933, _336, _1945);
            float _1981 = fma(_1935, _298, _1949);
            float _1983 = fma(_1977, _230, _1951);
            float _1985 = fma(_1935, _344, _1979);
            float _1987 = fma(_1977, _228, _1981);
            float _1989 = -_532;
            float _1991 = _1989 + _1983;
            float _1993 = fma(_1977, _232, _1985);
            float _1995 = -_538;
            float _1997 = _1995 + _1987;
            float _1999 = _1991 * _152;
            float _2001 = _1991 * _160;
            float _2003 = -_546;
            float _2005 = _2003 + _1993;
            float _2007 = _1991 * _176;
            float _2009 = fma(_1997, _150, _1999);
            float _2011 = fma(_1997, _158, _2001);
            float _2013 = fma(_1997, _174, _2007);
            float _2015 = fma(_2005, _154, _2009);
            float _2017 = fma(_2005, _162, _2011);
            float _2019 = fma(_2005, _178, _2013);
            float _2021 = _2015 * _2015;
            float _2023 = fma(_2017, _2017, _2021);
            float _2025 = fma(_2019, _2019, _2023);
            _1196 = _2025;
            _820 = _2015;
            _822 = _2017;
            _824 = _2019;
            _1867 = _2017;
            _1873 = _2015;
            _1879 = _2019;
        }
        float _2027 = _1196;
        float _2029 = _820;
        float _2031 = _822;
        float _2033 = _824;
        float _2035 = _1867;
        float _2037 = _1873;
        float _2039 = _1879;
        float _2041 = sqrt(_2027);
        float _2043 = rsqrt(_1837);
        bool _2045 = _2041 > 0.0;
        float _2047 = _1827 * _2043;
        float _2049 = _1823 * _2043;
        float _2051 = _1831 * _2043;
        bool _2053 = !_2045;
        if (!_2053)
        {
            float _2055 = rsqrt(_2027);
            float _2057 = _2055 * _2029;
            float _2059 = _2055 * _2031;
            float _2061 = _2049 * _2057;
            float _2063 = _2055 * _2033;
            float _2065 = fma(_2047, _2059, _2061);
            float _2067 = fma(_2051, _2063, _2065);
            float _2069 = _2067 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2071 = fma(_2035, _2069, _1817);
            float _2073 = fma(_2037, _2069, _1815);
            float _2075 = fma(_2039, _2069, _1819);
            _1849 = _2071;
            _1851 = _2073;
            _1853 = _2075;
        }
    }
    float _2077 = _1849;
    float _2079 = _1851;
    float _2081 = _1853;
    float _2083 = -_1232;
    float _2085 = _2083 + _2077;
    float _2087 = -_1230;
    float _2089 = _2087 + _2079;
    float _2091 = -_1234;
    float _2093 = _2091 + _2081;
    bool _2095 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2097 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2099 = _2095 || _2097;
    bool _2101 = isnan(0.5);
    bool _2103 = _2099 || _2101;
    float _2105 = _2089;
    float _2107 = _2085;
    float _2109 = _2093;
    if (!_2103)
    {
        float _2111 = -_1230;
        float _2113 = _1084 + _2111;
        float _2115 = -_1232;
        float _2117 = _1090 + _2115;
        float _2119 = -_1234;
        float _2121 = _1100 + _2119;
        float _2123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2125 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2127 = _2113 + _2125;
        float _2129 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2131 = _2117 + _2129;
        float _2133 = -_1100;
        float _2135 = _2133 + _2081;
        float _2137 = -_1090;
        float _2139 = _2137 + _2077;
        float _2141 = _2127 * _2127;
        float _2143 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2145 = _2121 + _2143;
        float _2147 = -_1084;
        float _2149 = _2147 + _2079;
        float _2151 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2153 = fma(_2131, _2131, _2141);
        float _2155 = fma(_2145, _2145, _2153);
        float _2157 = 1.0 / _1348;
        float _2159 = sqrt(_2155);
        float _2161 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2163 = precise::min(_2159, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2165 = _2163 * _2123;
        float _2167 = _2165 * _2157;
        float _2169 = _2161 * _2167;
        float _2171 = _2135 * _2167;
        float _2173 = fma(_2139, _2169, _2117);
        float _2175 = fma(_2149, _2169, _2113);
        float _2177 = fma(_2161, _2171, _2121);
        _2105 = _2175;
        _2107 = _2173;
        _2109 = _2177;
    }
    float _2179 = _2105;
    float _2181 = _2107;
    float _2183 = _2109;
    float _2185 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2187 = _2179 + _2185;
    float _2189 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2191 = _2181 + _2189;
    float _2193 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2195 = _2183 + _2193;
    float _2197 = _2187 * _2187;
    float _2199 = fma(_2191, _2191, _2197);
    float _2201 = fma(_2195, _2195, _2199);
    float _2203 = rsqrt(_2201);
    float _2205 = sqrt(_2201);
    float _2207 = _2203 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2209 = _2191 * _2207;
    float _2211 = _2195 * _2207;
    float _2213 = _2209 * _2209;
    float _2215 = _2211 * _2211;
    float _2217 = _2213 + _2215;
    float _2219 = sqrt(_2217);
    bool _2221 = _2219 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2223 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2225 = _2219 + _2223;
    float _2227 = _2203;
    float _2229 = _2217;
    float _2231 = _2225;
    float _2233 = _2187;
    if (_2221)
    {
        float _2235 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2227 = _2235;
    }
    float _2237 = _2227;
    if (_2221)
    {
        float _2239 = rsqrt(_2217);
        _2229 = _2239;
    }
    float _2241 = _2229;
    float _2243 = _2241;
    if (_2221)
    {
        float _2245 = _2225 * _2237;
        _2231 = _2245;
    }
    float _2247 = _2231;
    if (_2221)
    {
        float _2249 = _2247 * 0.15915493667125701904296875;
        _214 = _2249;
    }
    float _2251 = _214;
    float _2253 = _2195;
    float _2255 = _2251;
    if (_2221)
    {
        float _2257 = _2251 * 6.283185482025146484375;
        float _2259 = sin(_2257);
        _2253 = _2259;
    }
    float _2261 = _2253;
    float _2263 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2265 = precise::max(0.0, _2263);
    float _2267 = _2237;
    float _2269 = _2265;
    if (_2221)
    {
        float _2271 = _2251 * 6.283185482025146484375;
        float _2273 = cos(_2271);
        _2267 = _2273;
    }
    float _2275 = _2267;
    float _2277 = -_2207;
    float _2279 = -_2265;
    float _2281 = fma(_2187, _2277, _2279);
    if (_2221)
    {
        float _2283 = _2281 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2233 = _2283;
    }
    float _2285 = _2233;
    float _2287 = _2285;
    float _2289 = _2261;
    if (_2221)
    {
        float _2291 = fma(_2261, _2285, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2287 = _2291;
    }
    float _2293 = _2287;
    float _2295 = _2293;
    if (!_2221)
    {
        _2289 = _2209;
    }
    float _2297 = _2289;
    float _2299 = _2297;
    float _2301 = _2275;
    if (_2221)
    {
        float _2303 = _2275 + (-1.0);
        _2269 = _2303;
    }
    float _2305 = _2269;
    float _2307 = _2305;
    if (_2221)
    {
        float _2309 = _2241 * _2293;
        _216 = _2309;
    }
    float _2311 = _216;
    if (!_2221)
    {
        _2295 = _2281;
    }
    float _2313 = _2295;
    float _2315 = _2313;
    if (_2221)
    {
        float _2317 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2255 = _2317;
    }
    float _2319 = _2255;
    if (_2221)
    {
        float _2321 = _2209 * _2311;
        _2299 = _2321;
    }
    float _2323 = _2299;
    if (!_2221)
    {
        _2307 = _2211;
    }
    float _2325 = _2307;
    float _2327 = _2325;
    if (_2221)
    {
        float _2329 = _2211 * _2311;
        _2327 = _2329;
    }
    float _2331 = _2327;
    if (!_2221)
    {
        _2243 = _2213;
    }
    float _2333 = _2243;
    float _2335 = _2333;
    if (_2221)
    {
        float _2337 = fma(_2281, _2275, _2319);
        _2315 = _2337;
    }
    float _2339 = _2315;
    if (_2221)
    {
        float _2341 = _2323 * _2323;
        _2335 = _2341;
    }
    float _2343 = _2335;
    if (!_2221)
    {
        _2301 = _2215;
    }
    float _2345 = _2301;
    float _2347 = _2345;
    if (_2221)
    {
        float _2349 = _2331 * _2331;
        _2347 = _2349;
    }
    float _2351 = _2347;
    float _2353 = fma(_2339, _2339, _2343);
    float _2355 = _2353 + _2351;
    float _2357 = _2179 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2359 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2361 = fma(_2205, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2359);
    float _2363 = precise::clamp(_2361, 0.0, 1.0);
    float _2365 = _2179 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2367 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2369 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2357);
    float _2371 = rsqrt(_2355);
    float _2373 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2365);
    float _2375 = -_2363;
    float _2377 = _2375 + 1.0;
    float _2379 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2369);
    float _2381 = _2179 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2383 = _2179 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2385 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2373);
    float _2387 = _2379 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2389 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2381);
    float _2391 = fma(_2181, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2383);
    float _2393 = _2385 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2395 = _2387 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2397 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2389);
    float _2399 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2391);
    float _2401 = abs(_2377);
    float _2403 = log2(_2401);
    float _2405 = -_2395;
    float _2407 = fma(_2405, _2367, 1.0);
    float _2409 = _2371 * _2323;
    float _2411 = _2397 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2413 = _2393 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2415 = _2371 * _2339;
    float _2417 = _2371 * _2331;
    float _2419 = _2399 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2421 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2413);
    float _2423 = _2409 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2425 = log2(_2407);
    float _2427 = _2393 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2429 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2421);
    float _2431 = -_2423;
    float _2433 = fma(_2415, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2431);
    float _2435 = _2415 + 1.0;
    float _2437 = fma(_2419, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2429);
    float _2439 = -_2417;
    float _2441 = fma(_2439, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2433);
    float _2443 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2445 = _2393 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2447 = 1.0 / _2437;
    float _2449 = fma(_2441, -0.5, 0.5);
    float _2451 = fma(_2441, 0.5, 0.5);
    float _2453 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2445);
    float _2455 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2427);
    float _2457 = fma(_2451, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2459 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2453);
    float _2461 = exp2(_2443);
    float _2463 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2455);
    float _2465 = fma(_2451, _2457, -0.212114393711090087890625);
    float _2467 = fma(_2419, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2459);
    float _2469 = fma(_2419, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2463);
    float _2471 = _2425 * 0.693147182464599609375;
    float _2473 = fma(_2451, _2465, 1.570728778839111328125);
    float _2475 = sqrt(_2449);
    float _2477 = _2467 * _2447;
    float _2479 = _2469 * _2447;
    float _2481 = _2471 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2483 = fma(_2477, 0.5, 0.5);
    float _2485 = fma(_2479, -0.5, 0.5);
    float _2487 = -_2415;
    float _2489 = fma(_2461, _2435, _2487);
    float3 _6400 = float3(_2483, _2485, _2481);
    float _2491 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6400, float3(0.0), isnan(_6400)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6400, float3(0.0), isnan(_6400)), level(0.0)).x;
    float3 _6411 = float3(_2483, _2485, _2481);
    float4 _2494 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6411, float3(0.0), isnan(_6411)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6411, float3(0.0), isnan(_6411)), level(0.0)).xyzw;
    float _2496 = _2494.x;
    float _2498 = _2494.y;
    float _2500 = _2494.z;
    float _2502 = _2494.w;
    float _2504 = fma(_2489, 0.5, 0.5);
    float _2506 = _2475 * 0.636619746685028076171875;
    float _2508 = -_2473;
    float _2510 = fma(_2506, _2508, 1.0);
    float2 _6438 = float2(_2510, _2504);
    float3 _2514 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6438, float2(0.0), isnan(_6438)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6438, float2(0.0), isnan(_6438)), level(0.0)).xyz;
    float _2516 = _2514.x;
    float _2518 = _2514.y;
    float _2520 = _2514.z;
    float _2522 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2524 = _2393 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2526 = fma(_2411, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2524);
    float _2528 = exp2(_2522);
    float _2530 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2532 = fma(_2387, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2526);
    float _2534 = fma(_2419, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2532);
    out.m_47.x = _2530;
    float _2536 = _2534 + _2437;
    out.gl_Position.x = _2467;
    out.gl_Position.y = _2469;
    out.gl_Position.z = _2534;
    out.gl_Position.w = _2437;
    float _2538 = _2536 * 0.5;
    float _2540 = -_2528;
    float _2542 = _2540 + 1.0;
    float _2544 = _2542 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.z = _2538;
    out.m_73.w = _2437;
    float _2546 = _2544 * _2491;
    float _2548 = -_2544;
    float _2550 = _2548 + 1.0;
    float _2552 = _2502 * _2546;
    float _2554 = _2502 * _2550;
    float _2556 = _2520 * _2546;
    float _2558 = fma(_2516, _2552, _2496);
    float _2560 = fma(_2518, _2552, _2498);
    float _2562 = fma(_2502, _2556, _2500);
    out.m_75.x = _2558;
    out.m_75.y = _2560;
    out.m_75.z = _2562;
    out.m_75.w = _2554;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

