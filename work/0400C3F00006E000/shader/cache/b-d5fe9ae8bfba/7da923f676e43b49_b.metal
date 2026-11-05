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
    bool _1711 = false;
    bool _974 = false;
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
        float _2559 = as_type<float>(_110);
        out.gl_Position.z = _2559;
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
        float _2629 = as_type<float>(_148);
        out.gl_Position.z = _2629;
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
    bool _858 = _852 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _860 = isnan(_852);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _866 = _862 || _864;
    float _868 = float(_866);
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _870;
    float _874 = 1.0 / _872;
    bool _876 = _852 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _878 = isnan(_852);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _884 = _880 || _882;
    float _886 = float(_884);
    float _888 = -_868;
    float _890 = _888 + 1.0;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _892;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _896;
    bool _900 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _902;
    float _906 = _886 * _890;
    float _908 = -_886;
    float _910 = _908 + 1.0;
    float _912 = _856 * _874;
    float _914 = in.m_57.x;
    float _916 = in.m_57.y;
    float _918 = in.m_57.z;
    float _920 = fma(_894, _912, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _922 = fma(_904, _912, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _924 = fma(_898, _912, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _926 = _920 * _906;
    float _928 = _922 * _906;
    float _930 = _924 * _906;
    float _932 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[143].x, _926);
    float _934 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[143].y, _928);
    float _936 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[143].z, _930);
    float _938 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[144].x, _932);
    float _940 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[144].y, _934);
    float _942 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[144].z, _936);
    float _944 = _938 * _914;
    float _946 = _940 * _916;
    float _948 = _942 * _918;
    bool _950 = !_900;
    float _952 = _868;
    float _954 = _944;
    float _972;
    if (!_950)
    {
        float _956 = in.m_59.x;
        float _958 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _960 = _956 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _962 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _964 = _962 * _958;
        float _966 = floor(_964);
        float _968 = -_966;
        float _970 = _964 + _968;
        _972 = _970;
        _974 = true;
    }
    else
    {
        float _976 = float(_94);
        float _978 = 1.0 / _976;
        float _980 = _128 * _978;
        _972 = _980;
    }
    _974 = false;
    float _982 = _972;
    float _984 = _810 * _810;
    float _986 = _602 * _152;
    float _988 = _602 * _176;
    float _990 = in.m_59.w;
    float _992 = fma(_812, _812, _984);
    float _994 = fma(_600, _150, _986);
    float _996 = fma(_600, _174, _988);
    float _998 = fma(_814, _814, _992);
    float _1000 = _602 * _160;
    float _1002 = fma(_604, _154, _994);
    float _1004 = fma(_604, _178, _996);
    float _1006 = rsqrt(_998);
    float _1008 = fma(_600, _158, _1000);
    float _1010 = _1002 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1012 = _1004 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1014 = fma(_604, _162, _1008);
    float _1016 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1018 = _1010 + _1016;
    float _1020 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1022 = _1012 + _1020;
    float _1024 = _944 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1026 = _1014 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1028 = _1018 * _1018;
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1030;
    int _1034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1036 = _1034 != 0;
    float _1038 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1040 = _1026 + _1038;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1044 = _982 + _1042;
    float _1046 = _1006 * _810;
    float _1048 = fma(_1040, _1040, _1028);
    float _1050 = _1006 * _812;
    float _1052 = _1006 * _814;
    float _1054 = _1046 * _328;
    float _1056 = fma(_1022, _1022, _1048);
    float _1058 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1060 = _990 > 0.5;
    float _1062 = fma(_1050, _324, _1054);
    float _1064 = in.m_61.x;
    float _1066 = in.m_61.y;
    float _1068 = in.m_61.z;
    float _1070 = 1.0 / _1032;
    int _1072 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1074 = _1072 != 0;
    float _1076 = fma(_1052, _332, _1062);
    int _1078 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1080 = _1078 != 0;
    float _1082 = _948 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1086 = _1084 != 0;
    float _1088 = in.m_63.x;
    float _1090 = abs(_1076);
    bool _1092 = _1090 > 0.99989998340606689453125;
    float _1094 = rsqrt(_1056);
    float _1096 = in.m_63.y;
    float _1098 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    bool _1100 = _982 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1102 = isnan(_982);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1108 = _1104 || _1106;
    float _1110 = float(_1108);
    float _1112 = _1044 * _1070;
    float _1114 = 0.0;
    bool _1116 = _1060;
    bool _1118 = _1086;
    float _1120 = _1088;
    float _1122 = _998;
    if (_1080)
    {
        float _1124 = in.m_59.z;
        _1114 = _1124;
    }
    float _1126 = _1114;
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1128;
    bool _1132 = _982 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1134 = isnan(_982);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1140 = _1136 || _1138;
    float _1142 = float(_1140);
    float _1144 = -_1110;
    float _1146 = _1144 + 1.0;
    if (!_1092)
    {
        _952 = _324;
    }
    float _1148 = _952;
    float _1150 = _1148;
    if (_1092)
    {
        float _1152 = fma(_336, 0.001000000047497451305389404296875, _324);
        _1150 = _1152;
    }
    float _1154 = _1150;
    float _1156 = 0.0;
    if (!_1092)
    {
        _1156 = _328;
    }
    float _1158 = _1156;
    float _1160 = _1058 * _1094;
    float _1162 = _1158;
    if (!_1092)
    {
        _954 = _332;
    }
    float _1164 = _954;
    float _1166 = _1164;
    if (_1092)
    {
        float _1168 = fma(_340, 0.001000000047497451305389404296875, _328);
        _1162 = _1168;
    }
    float _1170 = _1162;
    if (_1092)
    {
        float _1172 = fma(_344, 0.001000000047497451305389404296875, _332);
        _1166 = _1172;
    }
    float _1174 = _1166;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1178 = _1176 != 0;
    float _1180 = _1018 * _1160;
    float _1182 = _1040 * _1160;
    float _1184 = _1022 * _1160;
    float _1186 = -_1174;
    float _1188 = _1046 * _1186;
    float _1190 = -_1180;
    float _1192 = _1018 + _1190;
    float _1194 = -_1182;
    float _1196 = _1040 + _1194;
    float _1198 = -_1184;
    float _1200 = _1022 + _1198;
    float _1202 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1068);
    float _1204 = _1192 * _1192;
    float _1206 = -_1170;
    float _1208 = _1050 * _1206;
    float _1210 = -_1170;
    float _1212 = -_1188;
    float _1214 = fma(_1052, _1210, _1212);
    float _1216 = in.m_59.y;
    float _1218 = fma(_1196, _1196, _1204);
    float _1220 = -_1154;
    float _1222 = _1052 * _1220;
    float _1224 = -_1154;
    float _1226 = -_1208;
    float _1228 = fma(_1046, _1224, _1226);
    float _1230 = in.m_59.x;
    float _1232 = fma(_1200, _1200, _1218);
    float _1234 = -_1174;
    float _1236 = -_1222;
    float _1238 = fma(_1050, _1234, _1236);
    float _1240 = -_1096;
    float _1242 = _1240 + 1.0;
    float _1244 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1066);
    float _1246 = sqrt(_1232);
    float _1248 = _1238 * _1238;
    float _1250 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1064);
    int _1252 = _1060 ? as_type<int>(_1242) : as_type<int>(_1096);
    float _1254 = fma(_1214, _1214, _1248);
    float _1256 = _1232;
    float _1258 = _1126;
    float _1260 = _1096;
    if (_1080)
    {
        bool _1262 = _1126 > 0.5;
        _1116 = _1262;
    }
    bool _1264 = _1116;
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1266;
    float _1270 = _1086 ? as_type<float>(_1252) : _1096;
    float _1272 = fma(_1228, _1228, _1254);
    float _1274 = fma(_1268, _1112, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    if (!_1074)
    {
        _1256 = _1088;
    }
    float _1276 = _1256;
    int _1278 = 0;
    float _1280 = _1276;
    if (_1080)
    {
        float _1282 = -_1088;
        float _1284 = _1282 + 1.0;
        _1278 = as_type<int>(_1284);
    }
    int _1286 = _1278;
    float _1288 = rsqrt(_1272);
    if (!_1036)
    {
        _1258 = _1216;
    }
    float _1290 = _1258;
    float _1292 = _1094 * _1246;
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1294;
    float _1298 = _1098 * _1230;
    float _1300 = _1290;
    if (_1074)
    {
        bool _1302 = _1230 > 0.5;
        _1118 = _1302;
    }
    bool _1304 = _1118;
    float _1306 = _1082 * _1292;
    if (_1036)
    {
        _1300 = _1230;
    }
    float _1308 = _1300;
    float _1310 = fma(_1296, _1112, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1312 = _1024 * _1292;
    float _1314 = trunc(_1298);
    int _1316 = int(_1314);
    float _1318 = fma(_1130, _1112, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1320 = _1306 * _1202;
    float _1322 = _1312 * _1250;
    float _1324 = _1228 * _1288;
    float _1326 = _946 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1328 = _1214 * _1288;
    float _1330 = _1238 * _1288;
    float _1332 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1334 = _1326 * _1292;
    float _1336 = _1050 * _1330;
    float _1338 = _1326;
    if (!_1036)
    {
        float _1340 = in.m_59.z;
        _1338 = _1340;
    }
    float _1342 = _1338;
    float _1344 = _1334 * _1244;
    float _1346 = _1046 * _1324;
    float _1348 = -_1336;
    float _1350 = fma(_1046, _1328, _1348);
    float _1352 = -_1142;
    float _1354 = _1352 + 1.0;
    float _1356 = _1344 * _1050;
    float _1358 = _1344 * _1052;
    float _1360 = -_1346;
    float _1362 = fma(_1052, _1330, _1360);
    int _1364 = _1316 << 4;
    int _1366 = _1364 + 1968;
    float _1368 = fma(_1322, _1328, _1356);
    float _1370 = fma(_1322, _1324, _1358);
    float _1372 = _1110 * _1354;
    float _1374 = _1332 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1376 = fma(_1320, _1362, _1368);
    float _1378 = fma(_1320, _1350, _1370);
    int _1380 = _1366 + 8;
    uint _1383 = uint(int(uint(_1380) >> uint(2)));
    uint _1385 = uint(int(uint(int(_1383)) >> uint(2)));
    int _1387 = int(_1383) & 3;
    float _1389 = (*spvDescriptorSet0.vp_c9)._m0[int(_1385)][_1387];
    float _1391 = fma(_1374, _1270, -0.5);
    float _1393 = _1026 + _1376;
    float _1395 = _1012 + _1378;
    float _1397 = _1310 * _1372;
    float _1399 = _1274 * _1372;
    float _1401 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1403 = _1393 + _1401;
    float _1405 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1407 = _1395 + _1405;
    uint _1409 = uint(int(uint(_1366) >> uint(2)));
    uint _1411 = uint(int(uint(int(_1409)) >> uint(2)));
    int _1413 = int(_1409) & 3;
    float _1415 = (*spvDescriptorSet0.vp_c9)._m0[int(_1411)][_1413];
    int _1417 = int(_1409) + 1;
    uint _1419 = uint(int(uint(_1417) >> uint(2)));
    int _1421 = _1417 & 3;
    float _1423 = (*spvDescriptorSet0.vp_c9)._m0[int(_1419)][_1421];
    float _1425 = _1378;
    float _1427 = _1342;
    int _1429 = as_type<int>(_1372);
    float _1431 = _1393;
    float _1433 = _1395;
    if (!_1036)
    {
        _1425 = _1342;
    }
    float _1435 = _1425;
    float _1437 = _1403 * _1403;
    float _1439 = _1407 * _1407;
    float _1441 = _1435;
    float _1443 = _1437;
    float _1445 = _1439;
    if (_1036)
    {
        _1441 = _1216;
    }
    float _1447 = _1441;
    float _1449 = _1318 * _1372;
    if (_1036)
    {
        _1427 = _1216;
    }
    float _1451 = _1427;
    float _1453 = _1437 + _1439;
    bool _1455 = _1216 > 0.5;
    float _1457 = _1052 * _1328;
    float _1459 = sqrt(_1453);
    if (_1074)
    {
        float _1461 = -_1088;
        float _1463 = _1461 + 1.0;
        _1429 = as_type<int>(_1463);
    }
    int _1465 = _1429;
    float _1467 = -_1457;
    float _1469 = fma(_1050, _1324, _1467);
    float _1471 = _1344 * _1046;
    float _1473 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1475 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1397);
    if (_1074)
    {
        float _1477 = _1304 ? as_type<float>(_1465) : _1088;
        _1280 = _1477;
    }
    float _1479 = _1280;
    float _1481 = fma(_1322, _1330, _1471);
    float _1483 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1473);
    float _1485 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1487 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1491 = fma(_1320, _1469, _1481);
    float _1493 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1495 = _1459 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1497 = -_1489;
    float _1499 = fma(_1487, 2.0, _1497);
    if (_1080)
    {
        float _1501 = _1264 ? as_type<float>(_1286) : _1088;
        _1120 = _1501;
    }
    float _1503 = _1120;
    float _1505 = fma(_1451, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1493);
    float _1507 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1399);
    float _1509 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1449);
    float _1511 = _1010 + _1491;
    bool _1513 = !_1495;
    float _1515 = _1511;
    if (!_1513)
    {
        float _1517 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1519 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1521 = _1459 + _1519;
        float _1523 = rsqrt(_1453);
        float _1525 = _1521 * _1517;
        float _1527 = _1511 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1529 = _1525 * 0.15915493667125701904296875;
        float _1531 = _1529 * 6.283185482025146484375;
        float _1533 = sin(_1531);
        float _1535 = _1529 * 6.283185482025146484375;
        float _1537 = cos(_1535);
        float _1539 = fma(_1533, _1527, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1541 = _1523 * _1539;
        float _1543 = fma(_1403, _1541, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1545 = _1537 + (-1.0);
        float _1547 = fma(_1407, _1541, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1551 = _1543 + _1549;
        float _1553 = _1545 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1555 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1557 = _1547 + _1555;
        float _1559 = _1551 * _1551;
        float _1561 = fma(_1511, _1537, _1553);
        float _1563 = _1557 * _1557;
        _1515 = _1561;
        _1443 = _1559;
        _1445 = _1563;
        _1431 = _1543;
        _1433 = _1547;
    }
    float _1565 = _1515;
    float _1567 = _1443;
    float _1569 = _1445;
    float _1571 = _1431;
    float _1573 = _1433;
    if (_1178)
    {
        float _1575 = _1455 ? _1242 : _1096;
        _1260 = _1575;
    }
    float _1577 = _1260;
    float _1579 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1581 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1583 = _1565 + _1581;
    float _1585 = _1485 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1589 = _1447 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1591 = fma(_1583, _1583, _1567);
    float _1593 = fma(_1585, _1503, -0.5);
    float _1595 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1483);
    float _1597 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1599 = fma(_1589, -2.0, _1587);
    float _1601 = -_128;
    float _1603 = fma(_1601, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1499);
    float _1605 = _1591 + _1569;
    float _1607 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1507);
    float _1609 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1505);
    float _1611 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1599);
    float _1613 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1475);
    float _1615 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1509);
    float _1617 = fma(_1595, _1593, _1603);
    float _1619 = _1479 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1621 = _1577 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1623 = -_1611;
    float _1625 = fma(_1609, _1391, _1623);
    float _1627 = _1415 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1629 = _1389 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1631 = sqrt(_1605);
    float _1633 = _1619 * _1579;
    float _1635 = _1621 * _1597;
    float _1637 = _1423 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1639 = _1607 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1641 = _1613 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1643 = _1615 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1645 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1647 = _1629 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1649 = _1617 + 0.5;
    float _1651 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1653 = _1637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1655 = _1639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1657 = _1641 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1659 = _1643 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1661 = _1625 + 0.5;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    bool _1663 = _1631 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1665 = isnan(_1631);
    bool _1667 = _1663 || _1665;
    bool _1669 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1671 = _1667 || _1669;
    out.m_67.x = _1645;
    out.m_67.y = _1653;
    out.m_67.z = _1647;
    out.m_69.x = _1655;
    out.m_69.y = _1657;
    out.m_69.z = _1659;
    out.m_69.w = _1651;
    out.m_71.x = _1633;
    out.m_71.y = _1635;
    out.m_71.z = _1649;
    out.m_71.w = _1661;
    float _1673 = _1625;
    float _1675 = _1659;
    if (!_1671)
    {
        _1673 = 1.0;
    }
    float _1677 = _1673;
    bool _1679 = !_1671;
    float _1681 = _1677;
    if (!_1679)
    {
        bool _1683 = _1631 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1685 = isnan(_1631);
        bool _1687 = _1683 || _1685;
        bool _1689 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1691 = _1687 || _1689;
        if (!_1691)
        {
            float _1693 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1695 = _1631 + _1693;
            float _1697 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1699 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1697;
            float _1701 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1703 = _1701 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1705 = 1.0 / _1699;
            float _1707 = _1695 * _1705;
            float _1709 = fma(_1707, _1703, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1681 = _1709;
            _1711 = true;
        }
        else
        {
            bool _1713 = _1631 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1715 = isnan(_1631);
            bool _1717 = _1713 || _1715;
            bool _1719 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1721 = _1717 || _1719;
            if (!_1721)
            {
                float _1723 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1725 = _1631 + _1723;
                float _1727 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1729 = _1727 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1731 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1733 = _1731 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1735 = 1.0 / _1729;
                float _1737 = _1725 * _1735;
                float _1739 = fma(_1737, _1733, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1681 = _1739;
                _1711 = true;
            }
            else
            {
                _1681 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1711 = false;
    float _1741 = _1681;
    float _1743 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1745 = _1565 + _1743;
    float _1747 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1749 = _1571 + _1747;
    float _1751 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1753 = _1573 + _1751;
    float _1755 = fma(_1745, _1741, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1757 = fma(_1749, _1741, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1759 = fma(_1753, _1741, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1761 = -_1010;
    float _1763 = _1761 + _1755;
    float _1765 = -_1026;
    float _1767 = _1765 + _1757;
    float _1769 = -_1012;
    float _1771 = _1769 + _1759;
    float _1773 = _1763 * _1763;
    float _1775 = fma(_1767, _1767, _1773);
    float _1777 = fma(_1771, _1771, _1775);
    float _1779 = sqrt(_1777);
    bool _1781 = _1779 > 0.0;
    bool _1783 = !_1781;
    float _1785 = _1775;
    float _1787 = _1779;
    float _1789 = _1757;
    float _1791 = _1755;
    float _1793 = _1759;
    if (!_1783)
    {
        bool _1795 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1797 = _1635;
        if (_1795)
        {
            float _1799 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1797 = _1799;
        }
        float _1801 = _1797;
        if (_1795)
        {
            float _1803 = _1801 * _812;
            _1675 = _1803;
        }
        float _1805 = _1675;
        float _1807 = _1805;
        if (_1795)
        {
            float _1809 = _1801 * _810;
            _1785 = _1809;
        }
        float _1811 = _1785;
        float _1813 = _1811;
        if (_1795)
        {
            float _1815 = _1801 * _814;
            _1787 = _1815;
        }
        float _1817 = _1787;
        float _1819 = _1817;
        if (!_1795)
        {
            float _1821 = _128 + 1.0;
            if (!_172)
            {
                float _1823 = _1821 * _1821;
                float _1825 = _1823 * 0.5;
                _130 = _1825;
            }
            float _1827 = _130;
            float _1829 = _1827;
            if (!_172)
            {
                float _1831 = _1827 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1829 = _1831;
            }
            float _1833 = _1829;
            bool _1835 = !_172;
            float _1837 = _1833;
            if (!_1835)
            {
                float _1839 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1841 = log2(_1839);
                float _1843 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1845 = _1843 + 1.0;
                float _1847 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1849 = _1841 * _1821;
                float _1851 = 1.0 / _1845;
                float _1853 = _1847 * 0.693147182464599609375;
                float _1855 = exp2(_1849);
                float _1857 = 1.0 / _1853;
                float _1859 = _1855 + (-1.0);
                float _1861 = -_1859;
                float _1863 = fma(_1861, _1857, _1821);
                float _1865 = _1863 * _1851;
                float _1867 = _1865 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1837 = _1867;
            }
            float _1869 = _1837;
            float _1871 = _1869 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _1873 = _1869 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1875 = _1869 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1877 = _1869;
            if (!_172)
            {
                _1877 = _1821;
            }
            float _1879 = _1877;
            float _1881 = _1871 * _328;
            float _1883 = _1871 * _294;
            float _1885 = _1871 * _340;
            float _1887 = fma(_1873, _324, _1881);
            float _1889 = fma(_1873, _290, _1883);
            float _1891 = fma(_1875, _332, _1887);
            bool _1893 = !_172;
            float _1895 = _1879;
            if (!_1893)
            {
                float _1897 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1899 = log2(_1897);
                float _1901 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1903 = _1901 + 1.0;
                float _1905 = 1.0 / _1903;
                float _1907 = _1899 * _1821;
                float _1909 = exp2(_1907);
                float _1911 = -_1909;
                float _1913 = _1911 + 1.0;
                float _1915 = _1913 * _1905;
                _1895 = _1915;
            }
            float _1917 = _1895;
            float _1919 = fma(_1873, _336, _1885);
            float _1921 = fma(_1875, _298, _1889);
            float _1923 = fma(_1917, _230, _1891);
            float _1925 = fma(_1875, _344, _1919);
            float _1927 = fma(_1917, _228, _1921);
            float _1929 = -_532;
            float _1931 = _1929 + _1923;
            float _1933 = fma(_1917, _232, _1925);
            float _1935 = -_538;
            float _1937 = _1935 + _1927;
            float _1939 = _1931 * _152;
            float _1941 = _1931 * _160;
            float _1943 = -_546;
            float _1945 = _1943 + _1933;
            float _1947 = _1931 * _176;
            float _1949 = fma(_1937, _150, _1939);
            float _1951 = fma(_1937, _158, _1941);
            float _1953 = fma(_1937, _174, _1947);
            float _1955 = fma(_1945, _154, _1949);
            float _1957 = fma(_1945, _162, _1951);
            float _1959 = fma(_1945, _178, _1953);
            float _1961 = _1955 * _1955;
            float _1963 = fma(_1957, _1957, _1961);
            float _1965 = fma(_1959, _1959, _1963);
            _1122 = _1965;
            _820 = _1955;
            _822 = _1957;
            _824 = _1959;
            _1807 = _1957;
            _1813 = _1955;
            _1819 = _1959;
        }
        float _1967 = _1122;
        float _1969 = _820;
        float _1971 = _822;
        float _1973 = _824;
        float _1975 = _1807;
        float _1977 = _1813;
        float _1979 = _1819;
        float _1981 = sqrt(_1967);
        float _1983 = rsqrt(_1777);
        bool _1985 = _1981 > 0.0;
        float _1987 = _1767 * _1983;
        float _1989 = _1763 * _1983;
        float _1991 = _1771 * _1983;
        bool _1993 = !_1985;
        if (!_1993)
        {
            float _1995 = rsqrt(_1967);
            float _1997 = _1995 * _1969;
            float _1999 = _1995 * _1971;
            float _2001 = _1989 * _1997;
            float _2003 = _1995 * _1973;
            float _2005 = fma(_1987, _1999, _2001);
            float _2007 = fma(_1991, _2003, _2005);
            float _2009 = _2007 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2011 = fma(_1975, _2009, _1757);
            float _2013 = fma(_1977, _2009, _1755);
            float _2015 = fma(_1979, _2009, _1759);
            _1789 = _2011;
            _1791 = _2013;
            _1793 = _2015;
        }
    }
    float _2017 = _1789;
    float _2019 = _1791;
    float _2021 = _1793;
    float _2023 = -_1182;
    float _2025 = _2023 + _2017;
    float _2027 = -_1180;
    float _2029 = _2027 + _2019;
    float _2031 = -_1184;
    float _2033 = _2031 + _2021;
    bool _2035 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2037 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2039 = _2035 || _2037;
    bool _2041 = isnan(0.5);
    bool _2043 = _2039 || _2041;
    float _2045 = _2029;
    float _2047 = _2025;
    float _2049 = _2033;
    if (!_2043)
    {
        float _2051 = -_1180;
        float _2053 = _1010 + _2051;
        float _2055 = -_1182;
        float _2057 = _1026 + _2055;
        float _2059 = -_1184;
        float _2061 = _1012 + _2059;
        float _2063 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2065 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2067 = _2053 + _2065;
        float _2069 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2071 = _2057 + _2069;
        float _2073 = -_1012;
        float _2075 = _2073 + _2021;
        float _2077 = -_1026;
        float _2079 = _2077 + _2017;
        float _2081 = _2067 * _2067;
        float _2083 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2085 = _2061 + _2083;
        float _2087 = -_1010;
        float _2089 = _2087 + _2019;
        float _2091 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2093 = fma(_2071, _2071, _2081);
        float _2095 = fma(_2085, _2085, _2093);
        float _2097 = 1.0 / _1292;
        float _2099 = sqrt(_2095);
        float _2101 = _2091 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2103 = precise::min(_2099, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2105 = _2103 * _2063;
        float _2107 = _2105 * _2097;
        float _2109 = _2101 * _2107;
        float _2111 = _2075 * _2107;
        float _2113 = fma(_2079, _2109, _2057);
        float _2115 = fma(_2089, _2109, _2053);
        float _2117 = fma(_2101, _2111, _2061);
        _2045 = _2115;
        _2047 = _2113;
        _2049 = _2117;
    }
    float _2119 = _2045;
    float _2121 = _2047;
    float _2123 = _2049;
    float _2125 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2127 = _2119 + _2125;
    float _2129 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2131 = _2121 + _2129;
    float _2133 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2135 = _2123 + _2133;
    float _2137 = _2127 * _2127;
    float _2139 = fma(_2131, _2131, _2137);
    float _2141 = fma(_2135, _2135, _2139);
    float _2143 = rsqrt(_2141);
    float _2145 = sqrt(_2141);
    float _2147 = _2143 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2149 = _2131 * _2147;
    float _2151 = _2135 * _2147;
    float _2153 = _2149 * _2149;
    float _2155 = _2151 * _2151;
    float _2157 = _2153 + _2155;
    float _2159 = sqrt(_2157);
    bool _2161 = _2159 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2163 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2165 = _2159 + _2163;
    float _2167 = _2143;
    float _2169 = _2157;
    float _2171 = _2165;
    float _2173 = _2127;
    if (_2161)
    {
        float _2175 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2167 = _2175;
    }
    float _2177 = _2167;
    if (_2161)
    {
        float _2179 = rsqrt(_2157);
        _2169 = _2179;
    }
    float _2181 = _2169;
    float _2183 = _2181;
    if (_2161)
    {
        float _2185 = _2165 * _2177;
        _2171 = _2185;
    }
    float _2187 = _2171;
    if (_2161)
    {
        float _2189 = _2187 * 0.15915493667125701904296875;
        _214 = _2189;
    }
    float _2191 = _214;
    float _2193 = _2135;
    float _2195 = _2191;
    if (_2161)
    {
        float _2197 = _2191 * 6.283185482025146484375;
        float _2199 = sin(_2197);
        _2193 = _2199;
    }
    float _2201 = _2193;
    float _2203 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2205 = precise::max(0.0, _2203);
    float _2207 = _2177;
    float _2209 = _2205;
    if (_2161)
    {
        float _2211 = _2191 * 6.283185482025146484375;
        float _2213 = cos(_2211);
        _2207 = _2213;
    }
    float _2215 = _2207;
    float _2217 = -_2147;
    float _2219 = -_2205;
    float _2221 = fma(_2127, _2217, _2219);
    if (_2161)
    {
        float _2223 = _2221 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2173 = _2223;
    }
    float _2225 = _2173;
    float _2227 = _2225;
    float _2229 = _2201;
    if (_2161)
    {
        float _2231 = fma(_2201, _2225, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2227 = _2231;
    }
    float _2233 = _2227;
    float _2235 = _2233;
    if (!_2161)
    {
        _2229 = _2149;
    }
    float _2237 = _2229;
    float _2239 = _2237;
    float _2241 = _2215;
    if (_2161)
    {
        float _2243 = _2215 + (-1.0);
        _2209 = _2243;
    }
    float _2245 = _2209;
    float _2247 = _2245;
    if (_2161)
    {
        float _2249 = _2181 * _2233;
        _216 = _2249;
    }
    float _2251 = _216;
    if (!_2161)
    {
        _2235 = _2221;
    }
    float _2253 = _2235;
    float _2255 = _2253;
    if (_2161)
    {
        float _2257 = _2245 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2195 = _2257;
    }
    float _2259 = _2195;
    if (_2161)
    {
        float _2261 = _2149 * _2251;
        _2239 = _2261;
    }
    float _2263 = _2239;
    if (!_2161)
    {
        _2247 = _2151;
    }
    float _2265 = _2247;
    float _2267 = _2265;
    if (_2161)
    {
        float _2269 = _2151 * _2251;
        _2267 = _2269;
    }
    float _2271 = _2267;
    if (!_2161)
    {
        _2183 = _2153;
    }
    float _2273 = _2183;
    float _2275 = _2273;
    if (_2161)
    {
        float _2277 = fma(_2221, _2215, _2259);
        _2255 = _2277;
    }
    float _2279 = _2255;
    if (_2161)
    {
        float _2281 = _2263 * _2263;
        _2275 = _2281;
    }
    float _2283 = _2275;
    if (!_2161)
    {
        _2241 = _2155;
    }
    float _2285 = _2241;
    float _2287 = _2285;
    if (_2161)
    {
        float _2289 = _2271 * _2271;
        _2287 = _2289;
    }
    float _2291 = _2287;
    float _2293 = fma(_2279, _2279, _2283);
    float _2295 = _2293 + _2291;
    float _2297 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2299 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2301 = fma(_2145, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2299);
    float _2303 = precise::clamp(_2301, 0.0, 1.0);
    float _2305 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2307 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2309 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2297);
    float _2311 = rsqrt(_2295);
    float _2313 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2305);
    float _2315 = -_2303;
    float _2317 = _2315 + 1.0;
    float _2319 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2309);
    float _2321 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2323 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2325 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2313);
    float _2327 = _2319 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2329 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2321);
    float _2331 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2323);
    float _2333 = _2325 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2335 = _2327 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2337 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2329);
    float _2339 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2331);
    float _2341 = abs(_2317);
    float _2343 = log2(_2341);
    float _2345 = -_2335;
    float _2347 = fma(_2345, _2307, 1.0);
    float _2349 = _2311 * _2263;
    float _2351 = _2337 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2353 = _2333 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2355 = _2311 * _2279;
    float _2357 = _2311 * _2271;
    float _2359 = _2339 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2361 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2353);
    float _2363 = _2349 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2365 = log2(_2347);
    float _2367 = _2333 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2369 = fma(_2327, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2361);
    float _2371 = -_2363;
    float _2373 = fma(_2355, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2371);
    float _2375 = _2355 + 1.0;
    float _2377 = fma(_2359, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2369);
    float _2379 = -_2357;
    float _2381 = fma(_2379, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2373);
    float _2383 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2385 = _2333 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2387 = 1.0 / _2377;
    float _2389 = fma(_2381, -0.5, 0.5);
    float _2391 = fma(_2381, 0.5, 0.5);
    float _2393 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2385);
    float _2395 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2367);
    float _2397 = fma(_2391, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2399 = fma(_2327, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2393);
    float _2401 = exp2(_2383);
    float _2403 = fma(_2327, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2395);
    float _2405 = fma(_2391, _2397, -0.212114393711090087890625);
    float _2407 = fma(_2359, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2399);
    float _2409 = fma(_2359, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2403);
    float _2411 = _2365 * 0.693147182464599609375;
    float _2413 = fma(_2391, _2405, 1.570728778839111328125);
    float _2415 = sqrt(_2389);
    float _2417 = _2407 * _2387;
    float _2419 = _2409 * _2387;
    float _2421 = _2411 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2423 = fma(_2417, 0.5, 0.5);
    float _2425 = fma(_2419, -0.5, 0.5);
    float _2427 = -_2355;
    float _2429 = fma(_2401, _2375, _2427);
    float3 _6247 = float3(_2423, _2425, _2421);
    float _2431 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6247, float3(0.0), isnan(_6247)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6247, float3(0.0), isnan(_6247)), level(0.0)).x;
    float3 _6258 = float3(_2423, _2425, _2421);
    float4 _2434 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6258, float3(0.0), isnan(_6258)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6258, float3(0.0), isnan(_6258)), level(0.0)).xyzw;
    float _2436 = _2434.x;
    float _2438 = _2434.y;
    float _2440 = _2434.z;
    float _2442 = _2434.w;
    float _2444 = fma(_2429, 0.5, 0.5);
    float _2446 = _2415 * 0.636619746685028076171875;
    float _2448 = -_2413;
    float _2450 = fma(_2446, _2448, 1.0);
    float2 _6285 = float2(_2450, _2444);
    float3 _2454 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6285, float2(0.0), isnan(_6285)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6285, float2(0.0), isnan(_6285)), level(0.0)).xyz;
    float _2456 = _2454.x;
    float _2458 = _2454.y;
    float _2460 = _2454.z;
    float _2462 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2464 = _2333 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2466 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2464);
    float _2468 = exp2(_2462);
    float _2470 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2472 = fma(_2327, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2466);
    float _2474 = fma(_2359, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2472);
    out.m_47.x = _2470;
    float _2476 = _2474 + _2377;
    out.gl_Position.x = _2407;
    out.gl_Position.y = _2409;
    out.gl_Position.z = _2474;
    out.gl_Position.w = _2377;
    float _2478 = _2476 * 0.5;
    float _2480 = -_2468;
    float _2482 = _2480 + 1.0;
    float _2484 = _2482 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.z = _2478;
    out.m_73.w = _2377;
    float _2486 = _2484 * _2431;
    float _2488 = -_2484;
    float _2490 = _2488 + 1.0;
    float _2492 = _2442 * _2486;
    float _2494 = _2442 * _2490;
    float _2496 = _2460 * _2486;
    float _2498 = fma(_2456, _2492, _2436);
    float _2500 = fma(_2458, _2492, _2438);
    float _2502 = fma(_2442, _2496, _2440);
    out.m_75.x = _2498;
    out.m_75.y = _2500;
    out.m_75.z = _2502;
    out.m_75.w = _2494;
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
    bool _1711 = false;
    bool _974 = false;
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
        float _2559 = as_type<float>(_110);
        out.gl_Position.z = _2559;
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
        float _2629 = as_type<float>(_148);
        out.gl_Position.z = _2629;
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
    bool _858 = _852 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _860 = isnan(_852);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _866 = _862 || _864;
    float _868 = float(_866);
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _870;
    float _874 = 1.0 / _872;
    bool _876 = _852 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _878 = isnan(_852);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _884 = _880 || _882;
    float _886 = float(_884);
    float _888 = -_868;
    float _890 = _888 + 1.0;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _892;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _896;
    bool _900 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _902;
    float _906 = _886 * _890;
    float _908 = -_886;
    float _910 = _908 + 1.0;
    float _912 = _856 * _874;
    float _914 = in.m_57.x;
    float _916 = in.m_57.y;
    float _918 = in.m_57.z;
    float _920 = fma(_894, _912, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _922 = fma(_904, _912, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _924 = fma(_898, _912, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _926 = _920 * _906;
    float _928 = _922 * _906;
    float _930 = _924 * _906;
    float _932 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[143].x, _926);
    float _934 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[143].y, _928);
    float _936 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[143].z, _930);
    float _938 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[144].x, _932);
    float _940 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[144].y, _934);
    float _942 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[144].z, _936);
    float _944 = _938 * _914;
    float _946 = _940 * _916;
    float _948 = _942 * _918;
    bool _950 = !_900;
    float _952 = _868;
    float _954 = _944;
    float _972;
    if (!_950)
    {
        float _956 = in.m_59.x;
        float _958 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _960 = _956 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _962 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _964 = _962 * _958;
        float _966 = floor(_964);
        float _968 = -_966;
        float _970 = _964 + _968;
        _972 = _970;
        _974 = true;
    }
    else
    {
        float _976 = float(_94);
        float _978 = 1.0 / _976;
        float _980 = _128 * _978;
        _972 = _980;
    }
    _974 = false;
    float _982 = _972;
    float _984 = _810 * _810;
    float _986 = _602 * _152;
    float _988 = _602 * _176;
    float _990 = in.m_59.w;
    float _992 = fma(_812, _812, _984);
    float _994 = fma(_600, _150, _986);
    float _996 = fma(_600, _174, _988);
    float _998 = fma(_814, _814, _992);
    float _1000 = _602 * _160;
    float _1002 = fma(_604, _154, _994);
    float _1004 = fma(_604, _178, _996);
    float _1006 = rsqrt(_998);
    float _1008 = fma(_600, _158, _1000);
    float _1010 = _1002 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1012 = _1004 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1014 = fma(_604, _162, _1008);
    float _1016 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1018 = _1010 + _1016;
    float _1020 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1022 = _1012 + _1020;
    float _1024 = _944 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1026 = _1014 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1028 = _1018 * _1018;
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1030;
    int _1034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1036 = _1034 != 0;
    float _1038 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1040 = _1026 + _1038;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1044 = _982 + _1042;
    float _1046 = _1006 * _810;
    float _1048 = fma(_1040, _1040, _1028);
    float _1050 = _1006 * _812;
    float _1052 = _1006 * _814;
    float _1054 = _1046 * _328;
    float _1056 = fma(_1022, _1022, _1048);
    float _1058 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1060 = _990 > 0.5;
    float _1062 = fma(_1050, _324, _1054);
    float _1064 = in.m_61.x;
    float _1066 = in.m_61.y;
    float _1068 = in.m_61.z;
    float _1070 = 1.0 / _1032;
    int _1072 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1074 = _1072 != 0;
    float _1076 = fma(_1052, _332, _1062);
    int _1078 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1080 = _1078 != 0;
    float _1082 = _948 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1086 = _1084 != 0;
    float _1088 = in.m_63.x;
    float _1090 = abs(_1076);
    bool _1092 = _1090 > 0.99989998340606689453125;
    float _1094 = rsqrt(_1056);
    float _1096 = in.m_63.y;
    float _1098 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    bool _1100 = _982 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1102 = isnan(_982);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1108 = _1104 || _1106;
    float _1110 = float(_1108);
    float _1112 = _1044 * _1070;
    float _1114 = 0.0;
    bool _1116 = _1060;
    bool _1118 = _1086;
    float _1120 = _1088;
    float _1122 = _998;
    if (_1080)
    {
        float _1124 = in.m_59.z;
        _1114 = _1124;
    }
    float _1126 = _1114;
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1128;
    bool _1132 = _982 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1134 = isnan(_982);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1140 = _1136 || _1138;
    float _1142 = float(_1140);
    float _1144 = -_1110;
    float _1146 = _1144 + 1.0;
    if (!_1092)
    {
        _952 = _324;
    }
    float _1148 = _952;
    float _1150 = _1148;
    if (_1092)
    {
        float _1152 = fma(_336, 0.001000000047497451305389404296875, _324);
        _1150 = _1152;
    }
    float _1154 = _1150;
    float _1156 = 0.0;
    if (!_1092)
    {
        _1156 = _328;
    }
    float _1158 = _1156;
    float _1160 = _1058 * _1094;
    float _1162 = _1158;
    if (!_1092)
    {
        _954 = _332;
    }
    float _1164 = _954;
    float _1166 = _1164;
    if (_1092)
    {
        float _1168 = fma(_340, 0.001000000047497451305389404296875, _328);
        _1162 = _1168;
    }
    float _1170 = _1162;
    if (_1092)
    {
        float _1172 = fma(_344, 0.001000000047497451305389404296875, _332);
        _1166 = _1172;
    }
    float _1174 = _1166;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1178 = _1176 != 0;
    float _1180 = _1018 * _1160;
    float _1182 = _1040 * _1160;
    float _1184 = _1022 * _1160;
    float _1186 = -_1174;
    float _1188 = _1046 * _1186;
    float _1190 = -_1180;
    float _1192 = _1018 + _1190;
    float _1194 = -_1182;
    float _1196 = _1040 + _1194;
    float _1198 = -_1184;
    float _1200 = _1022 + _1198;
    float _1202 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1068);
    float _1204 = _1192 * _1192;
    float _1206 = -_1170;
    float _1208 = _1050 * _1206;
    float _1210 = -_1170;
    float _1212 = -_1188;
    float _1214 = fma(_1052, _1210, _1212);
    float _1216 = in.m_59.y;
    float _1218 = fma(_1196, _1196, _1204);
    float _1220 = -_1154;
    float _1222 = _1052 * _1220;
    float _1224 = -_1154;
    float _1226 = -_1208;
    float _1228 = fma(_1046, _1224, _1226);
    float _1230 = in.m_59.x;
    float _1232 = fma(_1200, _1200, _1218);
    float _1234 = -_1174;
    float _1236 = -_1222;
    float _1238 = fma(_1050, _1234, _1236);
    float _1240 = -_1096;
    float _1242 = _1240 + 1.0;
    float _1244 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1066);
    float _1246 = sqrt(_1232);
    float _1248 = _1238 * _1238;
    float _1250 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1064);
    int _1252 = _1060 ? as_type<int>(_1242) : as_type<int>(_1096);
    float _1254 = fma(_1214, _1214, _1248);
    float _1256 = _1232;
    float _1258 = _1126;
    float _1260 = _1096;
    if (_1080)
    {
        bool _1262 = _1126 > 0.5;
        _1116 = _1262;
    }
    bool _1264 = _1116;
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1266;
    float _1270 = _1086 ? as_type<float>(_1252) : _1096;
    float _1272 = fma(_1228, _1228, _1254);
    float _1274 = fma(_1268, _1112, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    if (!_1074)
    {
        _1256 = _1088;
    }
    float _1276 = _1256;
    int _1278 = 0;
    float _1280 = _1276;
    if (_1080)
    {
        float _1282 = -_1088;
        float _1284 = _1282 + 1.0;
        _1278 = as_type<int>(_1284);
    }
    int _1286 = _1278;
    float _1288 = rsqrt(_1272);
    if (!_1036)
    {
        _1258 = _1216;
    }
    float _1290 = _1258;
    float _1292 = _1094 * _1246;
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1294;
    float _1298 = _1098 * _1230;
    float _1300 = _1290;
    if (_1074)
    {
        bool _1302 = _1230 > 0.5;
        _1118 = _1302;
    }
    bool _1304 = _1118;
    float _1306 = _1082 * _1292;
    if (_1036)
    {
        _1300 = _1230;
    }
    float _1308 = _1300;
    float _1310 = fma(_1296, _1112, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1312 = _1024 * _1292;
    float _1314 = trunc(_1298);
    int _1316 = int(_1314);
    float _1318 = fma(_1130, _1112, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1320 = _1306 * _1202;
    float _1322 = _1312 * _1250;
    float _1324 = _1228 * _1288;
    float _1326 = _946 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1328 = _1214 * _1288;
    float _1330 = _1238 * _1288;
    float _1332 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1334 = _1326 * _1292;
    float _1336 = _1050 * _1330;
    float _1338 = _1326;
    if (!_1036)
    {
        float _1340 = in.m_59.z;
        _1338 = _1340;
    }
    float _1342 = _1338;
    float _1344 = _1334 * _1244;
    float _1346 = _1046 * _1324;
    float _1348 = -_1336;
    float _1350 = fma(_1046, _1328, _1348);
    float _1352 = -_1142;
    float _1354 = _1352 + 1.0;
    float _1356 = _1344 * _1050;
    float _1358 = _1344 * _1052;
    float _1360 = -_1346;
    float _1362 = fma(_1052, _1330, _1360);
    int _1364 = _1316 << 4;
    int _1366 = _1364 + 1968;
    float _1368 = fma(_1322, _1328, _1356);
    float _1370 = fma(_1322, _1324, _1358);
    float _1372 = _1110 * _1354;
    float _1374 = _1332 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1376 = fma(_1320, _1362, _1368);
    float _1378 = fma(_1320, _1350, _1370);
    int _1380 = _1366 + 8;
    uint _1383 = uint(int(uint(_1380) >> uint(2)));
    uint _1385 = uint(int(uint(int(_1383)) >> uint(2)));
    int _1387 = int(_1383) & 3;
    float _1389 = (*spvDescriptorSet0.vp_c9)._m0[int(_1385)][_1387];
    float _1391 = fma(_1374, _1270, -0.5);
    float _1393 = _1026 + _1376;
    float _1395 = _1012 + _1378;
    float _1397 = _1310 * _1372;
    float _1399 = _1274 * _1372;
    float _1401 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1403 = _1393 + _1401;
    float _1405 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1407 = _1395 + _1405;
    uint _1409 = uint(int(uint(_1366) >> uint(2)));
    uint _1411 = uint(int(uint(int(_1409)) >> uint(2)));
    int _1413 = int(_1409) & 3;
    float _1415 = (*spvDescriptorSet0.vp_c9)._m0[int(_1411)][_1413];
    int _1417 = int(_1409) + 1;
    uint _1419 = uint(int(uint(_1417) >> uint(2)));
    int _1421 = _1417 & 3;
    float _1423 = (*spvDescriptorSet0.vp_c9)._m0[int(_1419)][_1421];
    float _1425 = _1378;
    float _1427 = _1342;
    int _1429 = as_type<int>(_1372);
    float _1431 = _1393;
    float _1433 = _1395;
    if (!_1036)
    {
        _1425 = _1342;
    }
    float _1435 = _1425;
    float _1437 = _1403 * _1403;
    float _1439 = _1407 * _1407;
    float _1441 = _1435;
    float _1443 = _1437;
    float _1445 = _1439;
    if (_1036)
    {
        _1441 = _1216;
    }
    float _1447 = _1441;
    float _1449 = _1318 * _1372;
    if (_1036)
    {
        _1427 = _1216;
    }
    float _1451 = _1427;
    float _1453 = _1437 + _1439;
    bool _1455 = _1216 > 0.5;
    float _1457 = _1052 * _1328;
    float _1459 = sqrt(_1453);
    if (_1074)
    {
        float _1461 = -_1088;
        float _1463 = _1461 + 1.0;
        _1429 = as_type<int>(_1463);
    }
    int _1465 = _1429;
    float _1467 = -_1457;
    float _1469 = fma(_1050, _1324, _1467);
    float _1471 = _1344 * _1046;
    float _1473 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1475 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1397);
    if (_1074)
    {
        float _1477 = _1304 ? as_type<float>(_1465) : _1088;
        _1280 = _1477;
    }
    float _1479 = _1280;
    float _1481 = fma(_1322, _1330, _1471);
    float _1483 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1473);
    float _1485 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1487 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1491 = fma(_1320, _1469, _1481);
    float _1493 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1495 = _1459 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1497 = -_1489;
    float _1499 = fma(_1487, 2.0, _1497);
    if (_1080)
    {
        float _1501 = _1264 ? as_type<float>(_1286) : _1088;
        _1120 = _1501;
    }
    float _1503 = _1120;
    float _1505 = fma(_1451, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1493);
    float _1507 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1399);
    float _1509 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1449);
    float _1511 = _1010 + _1491;
    bool _1513 = !_1495;
    float _1515 = _1511;
    if (!_1513)
    {
        float _1517 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1519 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1521 = _1459 + _1519;
        float _1523 = rsqrt(_1453);
        float _1525 = _1521 * _1517;
        float _1527 = _1511 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1529 = _1525 * 0.15915493667125701904296875;
        float _1531 = _1529 * 6.283185482025146484375;
        float _1533 = sin(_1531);
        float _1535 = _1529 * 6.283185482025146484375;
        float _1537 = cos(_1535);
        float _1539 = fma(_1533, _1527, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1541 = _1523 * _1539;
        float _1543 = fma(_1403, _1541, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1545 = _1537 + (-1.0);
        float _1547 = fma(_1407, _1541, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1551 = _1543 + _1549;
        float _1553 = _1545 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1555 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1557 = _1547 + _1555;
        float _1559 = _1551 * _1551;
        float _1561 = fma(_1511, _1537, _1553);
        float _1563 = _1557 * _1557;
        _1515 = _1561;
        _1443 = _1559;
        _1445 = _1563;
        _1431 = _1543;
        _1433 = _1547;
    }
    float _1565 = _1515;
    float _1567 = _1443;
    float _1569 = _1445;
    float _1571 = _1431;
    float _1573 = _1433;
    if (_1178)
    {
        float _1575 = _1455 ? _1242 : _1096;
        _1260 = _1575;
    }
    float _1577 = _1260;
    float _1579 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1581 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1583 = _1565 + _1581;
    float _1585 = _1485 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1589 = _1447 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1591 = fma(_1583, _1583, _1567);
    float _1593 = fma(_1585, _1503, -0.5);
    float _1595 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1483);
    float _1597 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1599 = fma(_1589, -2.0, _1587);
    float _1601 = -_128;
    float _1603 = fma(_1601, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1499);
    float _1605 = _1591 + _1569;
    float _1607 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1507);
    float _1609 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1505);
    float _1611 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1599);
    float _1613 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1475);
    float _1615 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1509);
    float _1617 = fma(_1595, _1593, _1603);
    float _1619 = _1479 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1621 = _1577 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1623 = -_1611;
    float _1625 = fma(_1609, _1391, _1623);
    float _1627 = _1415 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1629 = _1389 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1631 = sqrt(_1605);
    float _1633 = _1619 * _1579;
    float _1635 = _1621 * _1597;
    float _1637 = _1423 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1639 = _1607 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1641 = _1613 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1643 = _1615 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1645 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1647 = _1629 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1649 = _1617 + 0.5;
    float _1651 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1653 = _1637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1655 = _1639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1657 = _1641 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1659 = _1643 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1661 = _1625 + 0.5;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    bool _1663 = _1631 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1665 = isnan(_1631);
    bool _1667 = _1663 || _1665;
    bool _1669 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1671 = _1667 || _1669;
    out.m_67.x = _1645;
    out.m_67.y = _1653;
    out.m_67.z = _1647;
    out.m_69.x = _1655;
    out.m_69.y = _1657;
    out.m_69.z = _1659;
    out.m_69.w = _1651;
    out.m_71.x = _1633;
    out.m_71.y = _1635;
    out.m_71.z = _1649;
    out.m_71.w = _1661;
    float _1673 = _1625;
    float _1675 = _1659;
    if (!_1671)
    {
        _1673 = 1.0;
    }
    float _1677 = _1673;
    bool _1679 = !_1671;
    float _1681 = _1677;
    if (!_1679)
    {
        bool _1683 = _1631 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1685 = isnan(_1631);
        bool _1687 = _1683 || _1685;
        bool _1689 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1691 = _1687 || _1689;
        if (!_1691)
        {
            float _1693 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1695 = _1631 + _1693;
            float _1697 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1699 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1697;
            float _1701 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1703 = _1701 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1705 = 1.0 / _1699;
            float _1707 = _1695 * _1705;
            float _1709 = fma(_1707, _1703, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1681 = _1709;
            _1711 = true;
        }
        else
        {
            bool _1713 = _1631 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1715 = isnan(_1631);
            bool _1717 = _1713 || _1715;
            bool _1719 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1721 = _1717 || _1719;
            if (!_1721)
            {
                float _1723 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1725 = _1631 + _1723;
                float _1727 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1729 = _1727 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1731 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1733 = _1731 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1735 = 1.0 / _1729;
                float _1737 = _1725 * _1735;
                float _1739 = fma(_1737, _1733, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1681 = _1739;
                _1711 = true;
            }
            else
            {
                _1681 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1711 = false;
    float _1741 = _1681;
    float _1743 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1745 = _1565 + _1743;
    float _1747 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1749 = _1571 + _1747;
    float _1751 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1753 = _1573 + _1751;
    float _1755 = fma(_1745, _1741, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1757 = fma(_1749, _1741, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1759 = fma(_1753, _1741, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1761 = -_1010;
    float _1763 = _1761 + _1755;
    float _1765 = -_1026;
    float _1767 = _1765 + _1757;
    float _1769 = -_1012;
    float _1771 = _1769 + _1759;
    float _1773 = _1763 * _1763;
    float _1775 = fma(_1767, _1767, _1773);
    float _1777 = fma(_1771, _1771, _1775);
    float _1779 = sqrt(_1777);
    bool _1781 = _1779 > 0.0;
    bool _1783 = !_1781;
    float _1785 = _1775;
    float _1787 = _1779;
    float _1789 = _1757;
    float _1791 = _1755;
    float _1793 = _1759;
    if (!_1783)
    {
        bool _1795 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1797 = _1635;
        if (_1795)
        {
            float _1799 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1797 = _1799;
        }
        float _1801 = _1797;
        if (_1795)
        {
            float _1803 = _1801 * _812;
            _1675 = _1803;
        }
        float _1805 = _1675;
        float _1807 = _1805;
        if (_1795)
        {
            float _1809 = _1801 * _810;
            _1785 = _1809;
        }
        float _1811 = _1785;
        float _1813 = _1811;
        if (_1795)
        {
            float _1815 = _1801 * _814;
            _1787 = _1815;
        }
        float _1817 = _1787;
        float _1819 = _1817;
        if (!_1795)
        {
            float _1821 = _128 + 1.0;
            if (!_172)
            {
                float _1823 = _1821 * _1821;
                float _1825 = _1823 * 0.5;
                _130 = _1825;
            }
            float _1827 = _130;
            float _1829 = _1827;
            if (!_172)
            {
                float _1831 = _1827 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1829 = _1831;
            }
            float _1833 = _1829;
            bool _1835 = !_172;
            float _1837 = _1833;
            if (!_1835)
            {
                float _1839 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1841 = log2(_1839);
                float _1843 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1845 = _1843 + 1.0;
                float _1847 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1849 = _1841 * _1821;
                float _1851 = 1.0 / _1845;
                float _1853 = _1847 * 0.693147182464599609375;
                float _1855 = exp2(_1849);
                float _1857 = 1.0 / _1853;
                float _1859 = _1855 + (-1.0);
                float _1861 = -_1859;
                float _1863 = fma(_1861, _1857, _1821);
                float _1865 = _1863 * _1851;
                float _1867 = _1865 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1837 = _1867;
            }
            float _1869 = _1837;
            float _1871 = _1869 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _1873 = _1869 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1875 = _1869 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1877 = _1869;
            if (!_172)
            {
                _1877 = _1821;
            }
            float _1879 = _1877;
            float _1881 = _1871 * _328;
            float _1883 = _1871 * _294;
            float _1885 = _1871 * _340;
            float _1887 = fma(_1873, _324, _1881);
            float _1889 = fma(_1873, _290, _1883);
            float _1891 = fma(_1875, _332, _1887);
            bool _1893 = !_172;
            float _1895 = _1879;
            if (!_1893)
            {
                float _1897 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1899 = log2(_1897);
                float _1901 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1903 = _1901 + 1.0;
                float _1905 = 1.0 / _1903;
                float _1907 = _1899 * _1821;
                float _1909 = exp2(_1907);
                float _1911 = -_1909;
                float _1913 = _1911 + 1.0;
                float _1915 = _1913 * _1905;
                _1895 = _1915;
            }
            float _1917 = _1895;
            float _1919 = fma(_1873, _336, _1885);
            float _1921 = fma(_1875, _298, _1889);
            float _1923 = fma(_1917, _230, _1891);
            float _1925 = fma(_1875, _344, _1919);
            float _1927 = fma(_1917, _228, _1921);
            float _1929 = -_532;
            float _1931 = _1929 + _1923;
            float _1933 = fma(_1917, _232, _1925);
            float _1935 = -_538;
            float _1937 = _1935 + _1927;
            float _1939 = _1931 * _152;
            float _1941 = _1931 * _160;
            float _1943 = -_546;
            float _1945 = _1943 + _1933;
            float _1947 = _1931 * _176;
            float _1949 = fma(_1937, _150, _1939);
            float _1951 = fma(_1937, _158, _1941);
            float _1953 = fma(_1937, _174, _1947);
            float _1955 = fma(_1945, _154, _1949);
            float _1957 = fma(_1945, _162, _1951);
            float _1959 = fma(_1945, _178, _1953);
            float _1961 = _1955 * _1955;
            float _1963 = fma(_1957, _1957, _1961);
            float _1965 = fma(_1959, _1959, _1963);
            _1122 = _1965;
            _820 = _1955;
            _822 = _1957;
            _824 = _1959;
            _1807 = _1957;
            _1813 = _1955;
            _1819 = _1959;
        }
        float _1967 = _1122;
        float _1969 = _820;
        float _1971 = _822;
        float _1973 = _824;
        float _1975 = _1807;
        float _1977 = _1813;
        float _1979 = _1819;
        float _1981 = sqrt(_1967);
        float _1983 = rsqrt(_1777);
        bool _1985 = _1981 > 0.0;
        float _1987 = _1767 * _1983;
        float _1989 = _1763 * _1983;
        float _1991 = _1771 * _1983;
        bool _1993 = !_1985;
        if (!_1993)
        {
            float _1995 = rsqrt(_1967);
            float _1997 = _1995 * _1969;
            float _1999 = _1995 * _1971;
            float _2001 = _1989 * _1997;
            float _2003 = _1995 * _1973;
            float _2005 = fma(_1987, _1999, _2001);
            float _2007 = fma(_1991, _2003, _2005);
            float _2009 = _2007 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2011 = fma(_1975, _2009, _1757);
            float _2013 = fma(_1977, _2009, _1755);
            float _2015 = fma(_1979, _2009, _1759);
            _1789 = _2011;
            _1791 = _2013;
            _1793 = _2015;
        }
    }
    float _2017 = _1789;
    float _2019 = _1791;
    float _2021 = _1793;
    float _2023 = -_1182;
    float _2025 = _2023 + _2017;
    float _2027 = -_1180;
    float _2029 = _2027 + _2019;
    float _2031 = -_1184;
    float _2033 = _2031 + _2021;
    bool _2035 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2037 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2039 = _2035 || _2037;
    bool _2041 = isnan(0.5);
    bool _2043 = _2039 || _2041;
    float _2045 = _2029;
    float _2047 = _2025;
    float _2049 = _2033;
    if (!_2043)
    {
        float _2051 = -_1180;
        float _2053 = _1010 + _2051;
        float _2055 = -_1182;
        float _2057 = _1026 + _2055;
        float _2059 = -_1184;
        float _2061 = _1012 + _2059;
        float _2063 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2065 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2067 = _2053 + _2065;
        float _2069 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2071 = _2057 + _2069;
        float _2073 = -_1012;
        float _2075 = _2073 + _2021;
        float _2077 = -_1026;
        float _2079 = _2077 + _2017;
        float _2081 = _2067 * _2067;
        float _2083 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2085 = _2061 + _2083;
        float _2087 = -_1010;
        float _2089 = _2087 + _2019;
        float _2091 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2093 = fma(_2071, _2071, _2081);
        float _2095 = fma(_2085, _2085, _2093);
        float _2097 = 1.0 / _1292;
        float _2099 = sqrt(_2095);
        float _2101 = _2091 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2103 = precise::min(_2099, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2105 = _2103 * _2063;
        float _2107 = _2105 * _2097;
        float _2109 = _2101 * _2107;
        float _2111 = _2075 * _2107;
        float _2113 = fma(_2079, _2109, _2057);
        float _2115 = fma(_2089, _2109, _2053);
        float _2117 = fma(_2101, _2111, _2061);
        _2045 = _2115;
        _2047 = _2113;
        _2049 = _2117;
    }
    float _2119 = _2045;
    float _2121 = _2047;
    float _2123 = _2049;
    float _2125 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2127 = _2119 + _2125;
    float _2129 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2131 = _2121 + _2129;
    float _2133 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2135 = _2123 + _2133;
    float _2137 = _2127 * _2127;
    float _2139 = fma(_2131, _2131, _2137);
    float _2141 = fma(_2135, _2135, _2139);
    float _2143 = rsqrt(_2141);
    float _2145 = sqrt(_2141);
    float _2147 = _2143 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2149 = _2131 * _2147;
    float _2151 = _2135 * _2147;
    float _2153 = _2149 * _2149;
    float _2155 = _2151 * _2151;
    float _2157 = _2153 + _2155;
    float _2159 = sqrt(_2157);
    bool _2161 = _2159 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2163 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2165 = _2159 + _2163;
    float _2167 = _2143;
    float _2169 = _2157;
    float _2171 = _2165;
    float _2173 = _2127;
    if (_2161)
    {
        float _2175 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2167 = _2175;
    }
    float _2177 = _2167;
    if (_2161)
    {
        float _2179 = rsqrt(_2157);
        _2169 = _2179;
    }
    float _2181 = _2169;
    float _2183 = _2181;
    if (_2161)
    {
        float _2185 = _2165 * _2177;
        _2171 = _2185;
    }
    float _2187 = _2171;
    if (_2161)
    {
        float _2189 = _2187 * 0.15915493667125701904296875;
        _214 = _2189;
    }
    float _2191 = _214;
    float _2193 = _2135;
    float _2195 = _2191;
    if (_2161)
    {
        float _2197 = _2191 * 6.283185482025146484375;
        float _2199 = sin(_2197);
        _2193 = _2199;
    }
    float _2201 = _2193;
    float _2203 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2205 = precise::max(0.0, _2203);
    float _2207 = _2177;
    float _2209 = _2205;
    if (_2161)
    {
        float _2211 = _2191 * 6.283185482025146484375;
        float _2213 = cos(_2211);
        _2207 = _2213;
    }
    float _2215 = _2207;
    float _2217 = -_2147;
    float _2219 = -_2205;
    float _2221 = fma(_2127, _2217, _2219);
    if (_2161)
    {
        float _2223 = _2221 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2173 = _2223;
    }
    float _2225 = _2173;
    float _2227 = _2225;
    float _2229 = _2201;
    if (_2161)
    {
        float _2231 = fma(_2201, _2225, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2227 = _2231;
    }
    float _2233 = _2227;
    float _2235 = _2233;
    if (!_2161)
    {
        _2229 = _2149;
    }
    float _2237 = _2229;
    float _2239 = _2237;
    float _2241 = _2215;
    if (_2161)
    {
        float _2243 = _2215 + (-1.0);
        _2209 = _2243;
    }
    float _2245 = _2209;
    float _2247 = _2245;
    if (_2161)
    {
        float _2249 = _2181 * _2233;
        _216 = _2249;
    }
    float _2251 = _216;
    if (!_2161)
    {
        _2235 = _2221;
    }
    float _2253 = _2235;
    float _2255 = _2253;
    if (_2161)
    {
        float _2257 = _2245 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2195 = _2257;
    }
    float _2259 = _2195;
    if (_2161)
    {
        float _2261 = _2149 * _2251;
        _2239 = _2261;
    }
    float _2263 = _2239;
    if (!_2161)
    {
        _2247 = _2151;
    }
    float _2265 = _2247;
    float _2267 = _2265;
    if (_2161)
    {
        float _2269 = _2151 * _2251;
        _2267 = _2269;
    }
    float _2271 = _2267;
    if (!_2161)
    {
        _2183 = _2153;
    }
    float _2273 = _2183;
    float _2275 = _2273;
    if (_2161)
    {
        float _2277 = fma(_2221, _2215, _2259);
        _2255 = _2277;
    }
    float _2279 = _2255;
    if (_2161)
    {
        float _2281 = _2263 * _2263;
        _2275 = _2281;
    }
    float _2283 = _2275;
    if (!_2161)
    {
        _2241 = _2155;
    }
    float _2285 = _2241;
    float _2287 = _2285;
    if (_2161)
    {
        float _2289 = _2271 * _2271;
        _2287 = _2289;
    }
    float _2291 = _2287;
    float _2293 = fma(_2279, _2279, _2283);
    float _2295 = _2293 + _2291;
    float _2297 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2299 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2301 = fma(_2145, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2299);
    float _2303 = precise::clamp(_2301, 0.0, 1.0);
    float _2305 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2307 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2309 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2297);
    float _2311 = rsqrt(_2295);
    float _2313 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2305);
    float _2315 = -_2303;
    float _2317 = _2315 + 1.0;
    float _2319 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2309);
    float _2321 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2323 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2325 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2313);
    float _2327 = _2319 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2329 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2321);
    float _2331 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2323);
    float _2333 = _2325 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2335 = _2327 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2337 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2329);
    float _2339 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2331);
    float _2341 = abs(_2317);
    float _2343 = log2(_2341);
    float _2345 = -_2335;
    float _2347 = fma(_2345, _2307, 1.0);
    float _2349 = _2311 * _2263;
    float _2351 = _2337 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2353 = _2333 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2355 = _2311 * _2279;
    float _2357 = _2311 * _2271;
    float _2359 = _2339 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2361 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2353);
    float _2363 = _2349 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2365 = log2(_2347);
    float _2367 = _2333 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2369 = fma(_2327, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2361);
    float _2371 = -_2363;
    float _2373 = fma(_2355, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2371);
    float _2375 = _2355 + 1.0;
    float _2377 = fma(_2359, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2369);
    float _2379 = -_2357;
    float _2381 = fma(_2379, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2373);
    float _2383 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2385 = _2333 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2387 = 1.0 / _2377;
    float _2389 = fma(_2381, -0.5, 0.5);
    float _2391 = fma(_2381, 0.5, 0.5);
    float _2393 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2385);
    float _2395 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2367);
    float _2397 = fma(_2391, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2399 = fma(_2327, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2393);
    float _2401 = exp2(_2383);
    float _2403 = fma(_2327, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2395);
    float _2405 = fma(_2391, _2397, -0.212114393711090087890625);
    float _2407 = fma(_2359, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2399);
    float _2409 = fma(_2359, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2403);
    float _2411 = _2365 * 0.693147182464599609375;
    float _2413 = fma(_2391, _2405, 1.570728778839111328125);
    float _2415 = sqrt(_2389);
    float _2417 = _2407 * _2387;
    float _2419 = _2409 * _2387;
    float _2421 = _2411 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2423 = fma(_2417, 0.5, 0.5);
    float _2425 = fma(_2419, -0.5, 0.5);
    float _2427 = -_2355;
    float _2429 = fma(_2401, _2375, _2427);
    float3 _6247 = float3(_2423, _2425, _2421);
    float _2431 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6247, float3(0.0), isnan(_6247)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6247, float3(0.0), isnan(_6247)), level(0.0)).x;
    float3 _6258 = float3(_2423, _2425, _2421);
    float4 _2434 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6258, float3(0.0), isnan(_6258)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6258, float3(0.0), isnan(_6258)), level(0.0)).xyzw;
    float _2436 = _2434.x;
    float _2438 = _2434.y;
    float _2440 = _2434.z;
    float _2442 = _2434.w;
    float _2444 = fma(_2429, 0.5, 0.5);
    float _2446 = _2415 * 0.636619746685028076171875;
    float _2448 = -_2413;
    float _2450 = fma(_2446, _2448, 1.0);
    float2 _6285 = float2(_2450, _2444);
    float3 _2454 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6285, float2(0.0), isnan(_6285)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6285, float2(0.0), isnan(_6285)), level(0.0)).xyz;
    float _2456 = _2454.x;
    float _2458 = _2454.y;
    float _2460 = _2454.z;
    float _2462 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2464 = _2333 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2466 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2464);
    float _2468 = exp2(_2462);
    float _2470 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2472 = fma(_2327, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2466);
    float _2474 = fma(_2359, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2472);
    out.m_47.x = _2470;
    float _2476 = _2474 + _2377;
    out.gl_Position.x = _2407;
    out.gl_Position.y = _2409;
    out.gl_Position.z = _2474;
    out.gl_Position.w = _2377;
    float _2478 = _2476 * 0.5;
    float _2480 = -_2468;
    float _2482 = _2480 + 1.0;
    float _2484 = _2482 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.z = _2478;
    out.m_73.w = _2377;
    float _2486 = _2484 * _2431;
    float _2488 = -_2484;
    float _2490 = _2488 + 1.0;
    float _2492 = _2442 * _2486;
    float _2494 = _2442 * _2490;
    float _2496 = _2460 * _2486;
    float _2498 = fma(_2456, _2492, _2436);
    float _2500 = fma(_2458, _2492, _2438);
    float _2502 = fma(_2442, _2496, _2440);
    out.m_75.x = _2498;
    out.m_75.y = _2500;
    out.m_75.z = _2502;
    out.m_75.w = _2494;
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
    bool _1711 = false;
    bool _974 = false;
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
        float _2559 = as_type<float>(_110);
        out.gl_Position.z = _2559;
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
        float _2629 = as_type<float>(_148);
        out.gl_Position.z = _2629;
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
    bool _858 = _852 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _860 = isnan(_852);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _866 = _862 || _864;
    float _868 = float(_866);
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _870;
    float _874 = 1.0 / _872;
    bool _876 = _852 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _878 = isnan(_852);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _884 = _880 || _882;
    float _886 = float(_884);
    float _888 = -_868;
    float _890 = _888 + 1.0;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _892;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _896;
    bool _900 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _902;
    float _906 = _886 * _890;
    float _908 = -_886;
    float _910 = _908 + 1.0;
    float _912 = _856 * _874;
    float _914 = in.m_57.x;
    float _916 = in.m_57.y;
    float _918 = in.m_57.z;
    float _920 = fma(_894, _912, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _922 = fma(_904, _912, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _924 = fma(_898, _912, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _926 = _920 * _906;
    float _928 = _922 * _906;
    float _930 = _924 * _906;
    float _932 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[143].x, _926);
    float _934 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[143].y, _928);
    float _936 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[143].z, _930);
    float _938 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[144].x, _932);
    float _940 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[144].y, _934);
    float _942 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[144].z, _936);
    float _944 = _938 * _914;
    float _946 = _940 * _916;
    float _948 = _942 * _918;
    bool _950 = !_900;
    float _952 = _868;
    float _954 = _944;
    float _972;
    if (!_950)
    {
        float _956 = in.m_59.x;
        float _958 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _960 = _956 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _962 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _964 = _962 * _958;
        float _966 = floor(_964);
        float _968 = -_966;
        float _970 = _964 + _968;
        _972 = _970;
        _974 = true;
    }
    else
    {
        float _976 = float(_94);
        float _978 = 1.0 / _976;
        float _980 = _128 * _978;
        _972 = _980;
    }
    _974 = false;
    float _982 = _972;
    float _984 = _810 * _810;
    float _986 = _602 * _152;
    float _988 = _602 * _176;
    float _990 = in.m_59.w;
    float _992 = fma(_812, _812, _984);
    float _994 = fma(_600, _150, _986);
    float _996 = fma(_600, _174, _988);
    float _998 = fma(_814, _814, _992);
    float _1000 = _602 * _160;
    float _1002 = fma(_604, _154, _994);
    float _1004 = fma(_604, _178, _996);
    float _1006 = rsqrt(_998);
    float _1008 = fma(_600, _158, _1000);
    float _1010 = _1002 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1012 = _1004 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1014 = fma(_604, _162, _1008);
    float _1016 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1018 = _1010 + _1016;
    float _1020 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1022 = _1012 + _1020;
    float _1024 = _944 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1026 = _1014 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1028 = _1018 * _1018;
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1030;
    int _1034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1036 = _1034 != 0;
    float _1038 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1040 = _1026 + _1038;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1044 = _982 + _1042;
    float _1046 = _1006 * _810;
    float _1048 = fma(_1040, _1040, _1028);
    float _1050 = _1006 * _812;
    float _1052 = _1006 * _814;
    float _1054 = _1046 * _328;
    float _1056 = fma(_1022, _1022, _1048);
    float _1058 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1060 = _990 > 0.5;
    float _1062 = fma(_1050, _324, _1054);
    float _1064 = in.m_61.x;
    float _1066 = in.m_61.y;
    float _1068 = in.m_61.z;
    float _1070 = 1.0 / _1032;
    int _1072 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1074 = _1072 != 0;
    float _1076 = fma(_1052, _332, _1062);
    int _1078 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1080 = _1078 != 0;
    float _1082 = _948 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1086 = _1084 != 0;
    float _1088 = in.m_63.x;
    float _1090 = abs(_1076);
    bool _1092 = _1090 > 0.99989998340606689453125;
    float _1094 = rsqrt(_1056);
    float _1096 = in.m_63.y;
    float _1098 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    bool _1100 = _982 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1102 = isnan(_982);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1108 = _1104 || _1106;
    float _1110 = float(_1108);
    float _1112 = _1044 * _1070;
    float _1114 = 0.0;
    bool _1116 = _1060;
    bool _1118 = _1086;
    float _1120 = _1088;
    float _1122 = _998;
    if (_1080)
    {
        float _1124 = in.m_59.z;
        _1114 = _1124;
    }
    float _1126 = _1114;
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1128;
    bool _1132 = _982 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1134 = isnan(_982);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1140 = _1136 || _1138;
    float _1142 = float(_1140);
    float _1144 = -_1110;
    float _1146 = _1144 + 1.0;
    if (!_1092)
    {
        _952 = _324;
    }
    float _1148 = _952;
    float _1150 = _1148;
    if (_1092)
    {
        float _1152 = fma(_336, 0.001000000047497451305389404296875, _324);
        _1150 = _1152;
    }
    float _1154 = _1150;
    float _1156 = 0.0;
    if (!_1092)
    {
        _1156 = _328;
    }
    float _1158 = _1156;
    float _1160 = _1058 * _1094;
    float _1162 = _1158;
    if (!_1092)
    {
        _954 = _332;
    }
    float _1164 = _954;
    float _1166 = _1164;
    if (_1092)
    {
        float _1168 = fma(_340, 0.001000000047497451305389404296875, _328);
        _1162 = _1168;
    }
    float _1170 = _1162;
    if (_1092)
    {
        float _1172 = fma(_344, 0.001000000047497451305389404296875, _332);
        _1166 = _1172;
    }
    float _1174 = _1166;
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1178 = _1176 != 0;
    float _1180 = _1018 * _1160;
    float _1182 = _1040 * _1160;
    float _1184 = _1022 * _1160;
    float _1186 = -_1174;
    float _1188 = _1046 * _1186;
    float _1190 = -_1180;
    float _1192 = _1018 + _1190;
    float _1194 = -_1182;
    float _1196 = _1040 + _1194;
    float _1198 = -_1184;
    float _1200 = _1022 + _1198;
    float _1202 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1068);
    float _1204 = _1192 * _1192;
    float _1206 = -_1170;
    float _1208 = _1050 * _1206;
    float _1210 = -_1170;
    float _1212 = -_1188;
    float _1214 = fma(_1052, _1210, _1212);
    float _1216 = in.m_59.y;
    float _1218 = fma(_1196, _1196, _1204);
    float _1220 = -_1154;
    float _1222 = _1052 * _1220;
    float _1224 = -_1154;
    float _1226 = -_1208;
    float _1228 = fma(_1046, _1224, _1226);
    float _1230 = in.m_59.x;
    float _1232 = fma(_1200, _1200, _1218);
    float _1234 = -_1174;
    float _1236 = -_1222;
    float _1238 = fma(_1050, _1234, _1236);
    float _1240 = -_1096;
    float _1242 = _1240 + 1.0;
    float _1244 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1066);
    float _1246 = sqrt(_1232);
    float _1248 = _1238 * _1238;
    float _1250 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1064);
    int _1252 = _1060 ? as_type<int>(_1242) : as_type<int>(_1096);
    float _1254 = fma(_1214, _1214, _1248);
    float _1256 = _1232;
    float _1258 = _1126;
    float _1260 = _1096;
    if (_1080)
    {
        bool _1262 = _1126 > 0.5;
        _1116 = _1262;
    }
    bool _1264 = _1116;
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1266;
    float _1270 = _1086 ? as_type<float>(_1252) : _1096;
    float _1272 = fma(_1228, _1228, _1254);
    float _1274 = fma(_1268, _1112, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    if (!_1074)
    {
        _1256 = _1088;
    }
    float _1276 = _1256;
    int _1278 = 0;
    float _1280 = _1276;
    if (_1080)
    {
        float _1282 = -_1088;
        float _1284 = _1282 + 1.0;
        _1278 = as_type<int>(_1284);
    }
    int _1286 = _1278;
    float _1288 = rsqrt(_1272);
    if (!_1036)
    {
        _1258 = _1216;
    }
    float _1290 = _1258;
    float _1292 = _1094 * _1246;
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1294;
    float _1298 = _1098 * _1230;
    float _1300 = _1290;
    if (_1074)
    {
        bool _1302 = _1230 > 0.5;
        _1118 = _1302;
    }
    bool _1304 = _1118;
    float _1306 = _1082 * _1292;
    if (_1036)
    {
        _1300 = _1230;
    }
    float _1308 = _1300;
    float _1310 = fma(_1296, _1112, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1312 = _1024 * _1292;
    float _1314 = trunc(_1298);
    int _1316 = int(_1314);
    float _1318 = fma(_1130, _1112, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1320 = _1306 * _1202;
    float _1322 = _1312 * _1250;
    float _1324 = _1228 * _1288;
    float _1326 = _946 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1328 = _1214 * _1288;
    float _1330 = _1238 * _1288;
    float _1332 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1334 = _1326 * _1292;
    float _1336 = _1050 * _1330;
    float _1338 = _1326;
    if (!_1036)
    {
        float _1340 = in.m_59.z;
        _1338 = _1340;
    }
    float _1342 = _1338;
    float _1344 = _1334 * _1244;
    float _1346 = _1046 * _1324;
    float _1348 = -_1336;
    float _1350 = fma(_1046, _1328, _1348);
    float _1352 = -_1142;
    float _1354 = _1352 + 1.0;
    float _1356 = _1344 * _1050;
    float _1358 = _1344 * _1052;
    float _1360 = -_1346;
    float _1362 = fma(_1052, _1330, _1360);
    int _1364 = _1316 << 4;
    int _1366 = _1364 + 1968;
    float _1368 = fma(_1322, _1328, _1356);
    float _1370 = fma(_1322, _1324, _1358);
    float _1372 = _1110 * _1354;
    float _1374 = _1332 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1376 = fma(_1320, _1362, _1368);
    float _1378 = fma(_1320, _1350, _1370);
    int _1380 = _1366 + 8;
    uint _1383 = uint(int(uint(_1380) >> uint(2)));
    uint _1385 = uint(int(uint(int(_1383)) >> uint(2)));
    int _1387 = int(_1383) & 3;
    float _1389 = (*spvDescriptorSet0.vp_c9)._m0[int(_1385)][_1387];
    float _1391 = fma(_1374, _1270, -0.5);
    float _1393 = _1026 + _1376;
    float _1395 = _1012 + _1378;
    float _1397 = _1310 * _1372;
    float _1399 = _1274 * _1372;
    float _1401 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1403 = _1393 + _1401;
    float _1405 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1407 = _1395 + _1405;
    uint _1409 = uint(int(uint(_1366) >> uint(2)));
    uint _1411 = uint(int(uint(int(_1409)) >> uint(2)));
    int _1413 = int(_1409) & 3;
    float _1415 = (*spvDescriptorSet0.vp_c9)._m0[int(_1411)][_1413];
    int _1417 = int(_1409) + 1;
    uint _1419 = uint(int(uint(_1417) >> uint(2)));
    int _1421 = _1417 & 3;
    float _1423 = (*spvDescriptorSet0.vp_c9)._m0[int(_1419)][_1421];
    float _1425 = _1378;
    float _1427 = _1342;
    int _1429 = as_type<int>(_1372);
    float _1431 = _1393;
    float _1433 = _1395;
    if (!_1036)
    {
        _1425 = _1342;
    }
    float _1435 = _1425;
    float _1437 = _1403 * _1403;
    float _1439 = _1407 * _1407;
    float _1441 = _1435;
    float _1443 = _1437;
    float _1445 = _1439;
    if (_1036)
    {
        _1441 = _1216;
    }
    float _1447 = _1441;
    float _1449 = _1318 * _1372;
    if (_1036)
    {
        _1427 = _1216;
    }
    float _1451 = _1427;
    float _1453 = _1437 + _1439;
    bool _1455 = _1216 > 0.5;
    float _1457 = _1052 * _1328;
    float _1459 = sqrt(_1453);
    if (_1074)
    {
        float _1461 = -_1088;
        float _1463 = _1461 + 1.0;
        _1429 = as_type<int>(_1463);
    }
    int _1465 = _1429;
    float _1467 = -_1457;
    float _1469 = fma(_1050, _1324, _1467);
    float _1471 = _1344 * _1046;
    float _1473 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1475 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1397);
    if (_1074)
    {
        float _1477 = _1304 ? as_type<float>(_1465) : _1088;
        _1280 = _1477;
    }
    float _1479 = _1280;
    float _1481 = fma(_1322, _1330, _1471);
    float _1483 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1473);
    float _1485 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1487 = _1308 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1489 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1491 = fma(_1320, _1469, _1481);
    float _1493 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1495 = _1459 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1497 = -_1489;
    float _1499 = fma(_1487, 2.0, _1497);
    if (_1080)
    {
        float _1501 = _1264 ? as_type<float>(_1286) : _1088;
        _1120 = _1501;
    }
    float _1503 = _1120;
    float _1505 = fma(_1451, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1493);
    float _1507 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1399);
    float _1509 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1449);
    float _1511 = _1010 + _1491;
    bool _1513 = !_1495;
    float _1515 = _1511;
    if (!_1513)
    {
        float _1517 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1519 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1521 = _1459 + _1519;
        float _1523 = rsqrt(_1453);
        float _1525 = _1521 * _1517;
        float _1527 = _1511 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1529 = _1525 * 0.15915493667125701904296875;
        float _1531 = _1529 * 6.283185482025146484375;
        float _1533 = sin(_1531);
        float _1535 = _1529 * 6.283185482025146484375;
        float _1537 = cos(_1535);
        float _1539 = fma(_1533, _1527, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1541 = _1523 * _1539;
        float _1543 = fma(_1403, _1541, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1545 = _1537 + (-1.0);
        float _1547 = fma(_1407, _1541, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1551 = _1543 + _1549;
        float _1553 = _1545 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1555 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1557 = _1547 + _1555;
        float _1559 = _1551 * _1551;
        float _1561 = fma(_1511, _1537, _1553);
        float _1563 = _1557 * _1557;
        _1515 = _1561;
        _1443 = _1559;
        _1445 = _1563;
        _1431 = _1543;
        _1433 = _1547;
    }
    float _1565 = _1515;
    float _1567 = _1443;
    float _1569 = _1445;
    float _1571 = _1431;
    float _1573 = _1433;
    if (_1178)
    {
        float _1575 = _1455 ? _1242 : _1096;
        _1260 = _1575;
    }
    float _1577 = _1260;
    float _1579 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1581 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1583 = _1565 + _1581;
    float _1585 = _1485 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1587 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1589 = _1447 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1591 = fma(_1583, _1583, _1567);
    float _1593 = fma(_1585, _1503, -0.5);
    float _1595 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1483);
    float _1597 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1599 = fma(_1589, -2.0, _1587);
    float _1601 = -_128;
    float _1603 = fma(_1601, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1499);
    float _1605 = _1591 + _1569;
    float _1607 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1507);
    float _1609 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1505);
    float _1611 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1599);
    float _1613 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1475);
    float _1615 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1509);
    float _1617 = fma(_1595, _1593, _1603);
    float _1619 = _1479 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1621 = _1577 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1623 = -_1611;
    float _1625 = fma(_1609, _1391, _1623);
    float _1627 = _1415 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1629 = _1389 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1631 = sqrt(_1605);
    float _1633 = _1619 * _1579;
    float _1635 = _1621 * _1597;
    float _1637 = _1423 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1639 = _1607 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1641 = _1613 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1643 = _1615 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1645 = _1627 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1647 = _1629 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1649 = _1617 + 0.5;
    float _1651 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1653 = _1637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1655 = _1639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1657 = _1641 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1659 = _1643 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1661 = _1625 + 0.5;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    bool _1663 = _1631 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1665 = isnan(_1631);
    bool _1667 = _1663 || _1665;
    bool _1669 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1671 = _1667 || _1669;
    out.m_67.x = _1645;
    out.m_67.y = _1653;
    out.m_67.z = _1647;
    out.m_69.x = _1655;
    out.m_69.y = _1657;
    out.m_69.z = _1659;
    out.m_69.w = _1651;
    out.m_71.x = _1633;
    out.m_71.y = _1635;
    out.m_71.z = _1649;
    out.m_71.w = _1661;
    float _1673 = _1625;
    float _1675 = _1659;
    if (!_1671)
    {
        _1673 = 1.0;
    }
    float _1677 = _1673;
    bool _1679 = !_1671;
    float _1681 = _1677;
    if (!_1679)
    {
        bool _1683 = _1631 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1685 = isnan(_1631);
        bool _1687 = _1683 || _1685;
        bool _1689 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1691 = _1687 || _1689;
        if (!_1691)
        {
            float _1693 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1695 = _1631 + _1693;
            float _1697 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1699 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1697;
            float _1701 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1703 = _1701 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1705 = 1.0 / _1699;
            float _1707 = _1695 * _1705;
            float _1709 = fma(_1707, _1703, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1681 = _1709;
            _1711 = true;
        }
        else
        {
            bool _1713 = _1631 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1715 = isnan(_1631);
            bool _1717 = _1713 || _1715;
            bool _1719 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1721 = _1717 || _1719;
            if (!_1721)
            {
                float _1723 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1725 = _1631 + _1723;
                float _1727 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1729 = _1727 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1731 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1733 = _1731 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1735 = 1.0 / _1729;
                float _1737 = _1725 * _1735;
                float _1739 = fma(_1737, _1733, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1681 = _1739;
                _1711 = true;
            }
            else
            {
                _1681 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1711 = false;
    float _1741 = _1681;
    float _1743 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1745 = _1565 + _1743;
    float _1747 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1749 = _1571 + _1747;
    float _1751 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1753 = _1573 + _1751;
    float _1755 = fma(_1745, _1741, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1757 = fma(_1749, _1741, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1759 = fma(_1753, _1741, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1761 = -_1010;
    float _1763 = _1761 + _1755;
    float _1765 = -_1026;
    float _1767 = _1765 + _1757;
    float _1769 = -_1012;
    float _1771 = _1769 + _1759;
    float _1773 = _1763 * _1763;
    float _1775 = fma(_1767, _1767, _1773);
    float _1777 = fma(_1771, _1771, _1775);
    float _1779 = sqrt(_1777);
    bool _1781 = _1779 > 0.0;
    bool _1783 = !_1781;
    float _1785 = _1775;
    float _1787 = _1779;
    float _1789 = _1757;
    float _1791 = _1755;
    float _1793 = _1759;
    if (!_1783)
    {
        bool _1795 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1797 = _1635;
        if (_1795)
        {
            float _1799 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1797 = _1799;
        }
        float _1801 = _1797;
        if (_1795)
        {
            float _1803 = _1801 * _812;
            _1675 = _1803;
        }
        float _1805 = _1675;
        float _1807 = _1805;
        if (_1795)
        {
            float _1809 = _1801 * _810;
            _1785 = _1809;
        }
        float _1811 = _1785;
        float _1813 = _1811;
        if (_1795)
        {
            float _1815 = _1801 * _814;
            _1787 = _1815;
        }
        float _1817 = _1787;
        float _1819 = _1817;
        if (!_1795)
        {
            float _1821 = _128 + 1.0;
            if (!_172)
            {
                float _1823 = _1821 * _1821;
                float _1825 = _1823 * 0.5;
                _130 = _1825;
            }
            float _1827 = _130;
            float _1829 = _1827;
            if (!_172)
            {
                float _1831 = _1827 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1829 = _1831;
            }
            float _1833 = _1829;
            bool _1835 = !_172;
            float _1837 = _1833;
            if (!_1835)
            {
                float _1839 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1841 = log2(_1839);
                float _1843 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1845 = _1843 + 1.0;
                float _1847 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1849 = _1841 * _1821;
                float _1851 = 1.0 / _1845;
                float _1853 = _1847 * 0.693147182464599609375;
                float _1855 = exp2(_1849);
                float _1857 = 1.0 / _1853;
                float _1859 = _1855 + (-1.0);
                float _1861 = -_1859;
                float _1863 = fma(_1861, _1857, _1821);
                float _1865 = _1863 * _1851;
                float _1867 = _1865 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1837 = _1867;
            }
            float _1869 = _1837;
            float _1871 = _1869 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _1873 = _1869 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1875 = _1869 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1877 = _1869;
            if (!_172)
            {
                _1877 = _1821;
            }
            float _1879 = _1877;
            float _1881 = _1871 * _328;
            float _1883 = _1871 * _294;
            float _1885 = _1871 * _340;
            float _1887 = fma(_1873, _324, _1881);
            float _1889 = fma(_1873, _290, _1883);
            float _1891 = fma(_1875, _332, _1887);
            bool _1893 = !_172;
            float _1895 = _1879;
            if (!_1893)
            {
                float _1897 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1899 = log2(_1897);
                float _1901 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1903 = _1901 + 1.0;
                float _1905 = 1.0 / _1903;
                float _1907 = _1899 * _1821;
                float _1909 = exp2(_1907);
                float _1911 = -_1909;
                float _1913 = _1911 + 1.0;
                float _1915 = _1913 * _1905;
                _1895 = _1915;
            }
            float _1917 = _1895;
            float _1919 = fma(_1873, _336, _1885);
            float _1921 = fma(_1875, _298, _1889);
            float _1923 = fma(_1917, _230, _1891);
            float _1925 = fma(_1875, _344, _1919);
            float _1927 = fma(_1917, _228, _1921);
            float _1929 = -_532;
            float _1931 = _1929 + _1923;
            float _1933 = fma(_1917, _232, _1925);
            float _1935 = -_538;
            float _1937 = _1935 + _1927;
            float _1939 = _1931 * _152;
            float _1941 = _1931 * _160;
            float _1943 = -_546;
            float _1945 = _1943 + _1933;
            float _1947 = _1931 * _176;
            float _1949 = fma(_1937, _150, _1939);
            float _1951 = fma(_1937, _158, _1941);
            float _1953 = fma(_1937, _174, _1947);
            float _1955 = fma(_1945, _154, _1949);
            float _1957 = fma(_1945, _162, _1951);
            float _1959 = fma(_1945, _178, _1953);
            float _1961 = _1955 * _1955;
            float _1963 = fma(_1957, _1957, _1961);
            float _1965 = fma(_1959, _1959, _1963);
            _1122 = _1965;
            _820 = _1955;
            _822 = _1957;
            _824 = _1959;
            _1807 = _1957;
            _1813 = _1955;
            _1819 = _1959;
        }
        float _1967 = _1122;
        float _1969 = _820;
        float _1971 = _822;
        float _1973 = _824;
        float _1975 = _1807;
        float _1977 = _1813;
        float _1979 = _1819;
        float _1981 = sqrt(_1967);
        float _1983 = rsqrt(_1777);
        bool _1985 = _1981 > 0.0;
        float _1987 = _1767 * _1983;
        float _1989 = _1763 * _1983;
        float _1991 = _1771 * _1983;
        bool _1993 = !_1985;
        if (!_1993)
        {
            float _1995 = rsqrt(_1967);
            float _1997 = _1995 * _1969;
            float _1999 = _1995 * _1971;
            float _2001 = _1989 * _1997;
            float _2003 = _1995 * _1973;
            float _2005 = fma(_1987, _1999, _2001);
            float _2007 = fma(_1991, _2003, _2005);
            float _2009 = _2007 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2011 = fma(_1975, _2009, _1757);
            float _2013 = fma(_1977, _2009, _1755);
            float _2015 = fma(_1979, _2009, _1759);
            _1789 = _2011;
            _1791 = _2013;
            _1793 = _2015;
        }
    }
    float _2017 = _1789;
    float _2019 = _1791;
    float _2021 = _1793;
    float _2023 = -_1182;
    float _2025 = _2023 + _2017;
    float _2027 = -_1180;
    float _2029 = _2027 + _2019;
    float _2031 = -_1184;
    float _2033 = _2031 + _2021;
    bool _2035 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2037 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2039 = _2035 || _2037;
    bool _2041 = isnan(0.5);
    bool _2043 = _2039 || _2041;
    float _2045 = _2029;
    float _2047 = _2025;
    float _2049 = _2033;
    if (!_2043)
    {
        float _2051 = -_1180;
        float _2053 = _1010 + _2051;
        float _2055 = -_1182;
        float _2057 = _1026 + _2055;
        float _2059 = -_1184;
        float _2061 = _1012 + _2059;
        float _2063 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2065 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2067 = _2053 + _2065;
        float _2069 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2071 = _2057 + _2069;
        float _2073 = -_1012;
        float _2075 = _2073 + _2021;
        float _2077 = -_1026;
        float _2079 = _2077 + _2017;
        float _2081 = _2067 * _2067;
        float _2083 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2085 = _2061 + _2083;
        float _2087 = -_1010;
        float _2089 = _2087 + _2019;
        float _2091 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2093 = fma(_2071, _2071, _2081);
        float _2095 = fma(_2085, _2085, _2093);
        float _2097 = 1.0 / _1292;
        float _2099 = sqrt(_2095);
        float _2101 = _2091 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2103 = precise::min(_2099, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2105 = _2103 * _2063;
        float _2107 = _2105 * _2097;
        float _2109 = _2101 * _2107;
        float _2111 = _2075 * _2107;
        float _2113 = fma(_2079, _2109, _2057);
        float _2115 = fma(_2089, _2109, _2053);
        float _2117 = fma(_2101, _2111, _2061);
        _2045 = _2115;
        _2047 = _2113;
        _2049 = _2117;
    }
    float _2119 = _2045;
    float _2121 = _2047;
    float _2123 = _2049;
    float _2125 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2127 = _2119 + _2125;
    float _2129 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2131 = _2121 + _2129;
    float _2133 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2135 = _2123 + _2133;
    float _2137 = _2127 * _2127;
    float _2139 = fma(_2131, _2131, _2137);
    float _2141 = fma(_2135, _2135, _2139);
    float _2143 = rsqrt(_2141);
    float _2145 = sqrt(_2141);
    float _2147 = _2143 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2149 = _2131 * _2147;
    float _2151 = _2135 * _2147;
    float _2153 = _2149 * _2149;
    float _2155 = _2151 * _2151;
    float _2157 = _2153 + _2155;
    float _2159 = sqrt(_2157);
    bool _2161 = _2159 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2163 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2165 = _2159 + _2163;
    float _2167 = _2143;
    float _2169 = _2157;
    float _2171 = _2165;
    float _2173 = _2127;
    if (_2161)
    {
        float _2175 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2167 = _2175;
    }
    float _2177 = _2167;
    if (_2161)
    {
        float _2179 = rsqrt(_2157);
        _2169 = _2179;
    }
    float _2181 = _2169;
    float _2183 = _2181;
    if (_2161)
    {
        float _2185 = _2165 * _2177;
        _2171 = _2185;
    }
    float _2187 = _2171;
    if (_2161)
    {
        float _2189 = _2187 * 0.15915493667125701904296875;
        _214 = _2189;
    }
    float _2191 = _214;
    float _2193 = _2135;
    float _2195 = _2191;
    if (_2161)
    {
        float _2197 = _2191 * 6.283185482025146484375;
        float _2199 = sin(_2197);
        _2193 = _2199;
    }
    float _2201 = _2193;
    float _2203 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2205 = precise::max(0.0, _2203);
    float _2207 = _2177;
    float _2209 = _2205;
    if (_2161)
    {
        float _2211 = _2191 * 6.283185482025146484375;
        float _2213 = cos(_2211);
        _2207 = _2213;
    }
    float _2215 = _2207;
    float _2217 = -_2147;
    float _2219 = -_2205;
    float _2221 = fma(_2127, _2217, _2219);
    if (_2161)
    {
        float _2223 = _2221 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2173 = _2223;
    }
    float _2225 = _2173;
    float _2227 = _2225;
    float _2229 = _2201;
    if (_2161)
    {
        float _2231 = fma(_2201, _2225, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2227 = _2231;
    }
    float _2233 = _2227;
    float _2235 = _2233;
    if (!_2161)
    {
        _2229 = _2149;
    }
    float _2237 = _2229;
    float _2239 = _2237;
    float _2241 = _2215;
    if (_2161)
    {
        float _2243 = _2215 + (-1.0);
        _2209 = _2243;
    }
    float _2245 = _2209;
    float _2247 = _2245;
    if (_2161)
    {
        float _2249 = _2181 * _2233;
        _216 = _2249;
    }
    float _2251 = _216;
    if (!_2161)
    {
        _2235 = _2221;
    }
    float _2253 = _2235;
    float _2255 = _2253;
    if (_2161)
    {
        float _2257 = _2245 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2195 = _2257;
    }
    float _2259 = _2195;
    if (_2161)
    {
        float _2261 = _2149 * _2251;
        _2239 = _2261;
    }
    float _2263 = _2239;
    if (!_2161)
    {
        _2247 = _2151;
    }
    float _2265 = _2247;
    float _2267 = _2265;
    if (_2161)
    {
        float _2269 = _2151 * _2251;
        _2267 = _2269;
    }
    float _2271 = _2267;
    if (!_2161)
    {
        _2183 = _2153;
    }
    float _2273 = _2183;
    float _2275 = _2273;
    if (_2161)
    {
        float _2277 = fma(_2221, _2215, _2259);
        _2255 = _2277;
    }
    float _2279 = _2255;
    if (_2161)
    {
        float _2281 = _2263 * _2263;
        _2275 = _2281;
    }
    float _2283 = _2275;
    if (!_2161)
    {
        _2241 = _2155;
    }
    float _2285 = _2241;
    float _2287 = _2285;
    if (_2161)
    {
        float _2289 = _2271 * _2271;
        _2287 = _2289;
    }
    float _2291 = _2287;
    float _2293 = fma(_2279, _2279, _2283);
    float _2295 = _2293 + _2291;
    float _2297 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2299 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2301 = fma(_2145, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2299);
    float _2303 = precise::clamp(_2301, 0.0, 1.0);
    float _2305 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2307 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2309 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2297);
    float _2311 = rsqrt(_2295);
    float _2313 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2305);
    float _2315 = -_2303;
    float _2317 = _2315 + 1.0;
    float _2319 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2309);
    float _2321 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2323 = _2119 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2325 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2313);
    float _2327 = _2319 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2329 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2321);
    float _2331 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2323);
    float _2333 = _2325 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2335 = _2327 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2337 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2329);
    float _2339 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2331);
    float _2341 = abs(_2317);
    float _2343 = log2(_2341);
    float _2345 = -_2335;
    float _2347 = fma(_2345, _2307, 1.0);
    float _2349 = _2311 * _2263;
    float _2351 = _2337 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2353 = _2333 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2355 = _2311 * _2279;
    float _2357 = _2311 * _2271;
    float _2359 = _2339 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2361 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2353);
    float _2363 = _2349 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2365 = log2(_2347);
    float _2367 = _2333 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2369 = fma(_2327, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2361);
    float _2371 = -_2363;
    float _2373 = fma(_2355, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2371);
    float _2375 = _2355 + 1.0;
    float _2377 = fma(_2359, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2369);
    float _2379 = -_2357;
    float _2381 = fma(_2379, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2373);
    float _2383 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2385 = _2333 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2387 = 1.0 / _2377;
    float _2389 = fma(_2381, -0.5, 0.5);
    float _2391 = fma(_2381, 0.5, 0.5);
    float _2393 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2385);
    float _2395 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2367);
    float _2397 = fma(_2391, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2399 = fma(_2327, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2393);
    float _2401 = exp2(_2383);
    float _2403 = fma(_2327, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2395);
    float _2405 = fma(_2391, _2397, -0.212114393711090087890625);
    float _2407 = fma(_2359, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2399);
    float _2409 = fma(_2359, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2403);
    float _2411 = _2365 * 0.693147182464599609375;
    float _2413 = fma(_2391, _2405, 1.570728778839111328125);
    float _2415 = sqrt(_2389);
    float _2417 = _2407 * _2387;
    float _2419 = _2409 * _2387;
    float _2421 = _2411 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2423 = fma(_2417, 0.5, 0.5);
    float _2425 = fma(_2419, -0.5, 0.5);
    float _2427 = -_2355;
    float _2429 = fma(_2401, _2375, _2427);
    float3 _6247 = float3(_2423, _2425, _2421);
    float _2431 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6247, float3(0.0), isnan(_6247)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6247, float3(0.0), isnan(_6247)), level(0.0)).x;
    float3 _6258 = float3(_2423, _2425, _2421);
    float4 _2434 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6258, float3(0.0), isnan(_6258)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6258, float3(0.0), isnan(_6258)), level(0.0)).xyzw;
    float _2436 = _2434.x;
    float _2438 = _2434.y;
    float _2440 = _2434.z;
    float _2442 = _2434.w;
    float _2444 = fma(_2429, 0.5, 0.5);
    float _2446 = _2415 * 0.636619746685028076171875;
    float _2448 = -_2413;
    float _2450 = fma(_2446, _2448, 1.0);
    float2 _6285 = float2(_2450, _2444);
    float3 _2454 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6285, float2(0.0), isnan(_6285)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6285, float2(0.0), isnan(_6285)), level(0.0)).xyz;
    float _2456 = _2454.x;
    float _2458 = _2454.y;
    float _2460 = _2454.z;
    float _2462 = _2343 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2464 = _2333 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2466 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2464);
    float _2468 = exp2(_2462);
    float _2470 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2472 = fma(_2327, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2466);
    float _2474 = fma(_2359, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2472);
    out.m_47.x = _2470;
    float _2476 = _2474 + _2377;
    out.gl_Position.x = _2407;
    out.gl_Position.y = _2409;
    out.gl_Position.z = _2474;
    out.gl_Position.w = _2377;
    float _2478 = _2476 * 0.5;
    float _2480 = -_2468;
    float _2482 = _2480 + 1.0;
    float _2484 = _2482 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.z = _2478;
    out.m_73.w = _2377;
    float _2486 = _2484 * _2431;
    float _2488 = -_2484;
    float _2490 = _2488 + 1.0;
    float _2492 = _2442 * _2486;
    float _2494 = _2442 * _2490;
    float _2496 = _2460 * _2486;
    float _2498 = fma(_2456, _2492, _2436);
    float _2500 = fma(_2458, _2492, _2438);
    float _2502 = fma(_2442, _2496, _2440);
    out.m_75.x = _2498;
    out.m_75.y = _2500;
    out.m_75.z = _2502;
    out.m_75.w = _2494;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

