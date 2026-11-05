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
    bool _1761 = false;
    bool _1024 = false;
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
        float _2609 = as_type<float>(_110);
        out.gl_Position.z = _2609;
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
        float _2679 = as_type<float>(_148);
        out.gl_Position.z = _2679;
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
    float _560 = _542 * _152;
    float _562 = fma(_550, _550, _552);
    float _564 = _542 * _160;
    float _566 = _542 * _176;
    float _568 = fma(_550, _150, _560);
    float _570 = fma(_558, _558, _562);
    float _572 = fma(_550, _158, _564);
    float _574 = in.m_44.x;
    float _576 = in.m_44.y;
    float _578 = in.m_44.z;
    float _580 = fma(_550, _174, _566);
    float _582 = fma(_558, _154, _568);
    float _584 = sqrt(_570);
    float _586 = fma(_558, _162, _572);
    float _588 = fma(_558, _178, _580);
    bool _590 = _584 >= 9.9999999747524270787835121154785e-07;
    bool _592 = isnan(_584);
    bool _594 = _590 || _592;
    bool _596 = isnan(9.9999999747524270787835121154785e-07);
    bool _598 = _594 || _596;
    float _600 = fma(_536, _554, _574);
    float _602 = fma(_496, _554, _576);
    float _604 = fma(_544, _554, _578);
    float _606 = _554;
    float _608 = _588;
    float _610 = _586;
    float _612 = _586;
    float _614 = _588;
    if (_598)
    {
        _606 = _582;
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
    float _976 = fma(_964, _932, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _978 = fma(_968, _932, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _980 = fma(_972, _932, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _982 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[143].y, _958);
    float _984 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[143].z, _960);
    float _986 = fma(_976, _912, _974);
    float _988 = fma(_978, _912, _982);
    float _990 = fma(_980, _912, _984);
    float _992 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[145].x, _986);
    float _994 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[145].y, _988);
    float _996 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[145].z, _990);
    float _998 = _992 * _950;
    float _1000 = _994 * _952;
    float _1002 = _996 * _954;
    bool _1004 = !_922;
    float _1022;
    if (!_1004)
    {
        float _1006 = in.m_59.x;
        float _1008 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _1010 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _1012 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _1014 = _1012 * _1008;
        float _1016 = floor(_1014);
        float _1018 = -_1016;
        float _1020 = _1014 + _1018;
        _1022 = _1020;
        _1024 = true;
    }
    else
    {
        float _1026 = float(_94);
        float _1028 = 1.0 / _1026;
        float _1030 = _128 * _1028;
        _1022 = _1030;
    }
    _1024 = false;
    float _1032 = _1022;
    float _1034 = _810 * _810;
    float _1036 = _602 * _152;
    float _1038 = _602 * _176;
    float _1040 = fma(_812, _812, _1034);
    float _1042 = _602 * _160;
    float _1044 = fma(_600, _150, _1036);
    float _1046 = fma(_600, _174, _1038);
    float _1048 = fma(_814, _814, _1040);
    float _1050 = fma(_600, _158, _1042);
    float _1052 = fma(_604, _154, _1044);
    float _1054 = fma(_604, _178, _1046);
    float _1056 = rsqrt(_1048);
    float _1058 = fma(_604, _162, _1050);
    float _1060 = _1052 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1062 = _1054 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1064 = in.m_61.y;
    float _1066 = _1058 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1070 = _1060 + _1068;
    float _1072 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1074 = _1062 + _1072;
    float _1076 = in.m_59.w;
    float _1078 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1080 = _1066 + _1078;
    float _1082 = _1070 * _1070;
    float _1084 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1086 = _1032 + _1084;
    float _1088 = fma(_1080, _1080, _1082);
    int _1090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1092 = _1090 != 0;
    float _1094 = _1056 * _810;
    float _1096 = _1056 * _812;
    float _1098 = fma(_1074, _1074, _1088);
    float _1100 = in.m_63.x;
    float _1102 = in.m_63.y;
    float _1104 = in.m_63.z;
    float _1106 = _1094 * _328;
    float _1108 = _1056 * _814;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1110;
    float _1114 = rsqrt(_1098);
    float _1116 = fma(_1096, _324, _1106);
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1120 = _1118 != 0;
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1122;
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1128 = _1126 != 0;
    float _1130 = fma(_1108, _332, _1116);
    float _1132 = 0.0;
    float _1134 = _1064;
    float _1136 = _1048;
    if (_1092)
    {
        float _1138 = in.m_59.z;
        _1132 = _1138;
    }
    float _1140 = _1132;
    float _1142 = 1.0 / _1112;
    bool _1144 = _1076 > 0.5;
    float _1146 = _1000 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1148 = abs(_1130);
    bool _1150 = _1148 > 0.99989998340606689453125;
    float _1152 = -_1064;
    float _1154 = _1152 + 1.0;
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1158 = _1156 != 0;
    float _1160 = _1070 * _1114;
    int _1162 = _1144 ? as_type<int>(_1154) : as_type<int>(_1064);
    int _1164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1166 = _1164 != 0;
    float _1168 = _1080 * _1114;
    float _1170 = -_1160;
    float _1172 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1070);
    float _1174 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1104);
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1176;
    float _1180 = _1086 * _1142;
    float _1182 = _1104;
    bool _1184 = _1150;
    bool _1186 = _1158;
    if (!_1150)
    {
        _1182 = _324;
    }
    float _1188 = _1182;
    float _1190 = -_1168;
    float _1192 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1080);
    float _1194 = _1172 * _1172;
    float _1196 = _1188;
    if (_1150)
    {
        float _1198 = fma(_336, 0.001000000047497451305389404296875, _324);
        _1196 = _1198;
    }
    float _1200 = _1196;
    float _1202 = _1074 * _1114;
    float _1204 = 0.0;
    float _1206 = _1200;
    if (!_1150)
    {
        _1204 = _332;
    }
    float _1208 = _1204;
    float _1210 = fma(_1192, _1192, _1194);
    float _1212 = _1208;
    if (_1150)
    {
        float _1214 = fma(_344, 0.001000000047497451305389404296875, _332);
        _1212 = _1214;
    }
    float _1216 = _1212;
    float _1218 = -_1200;
    float _1220 = _1108 * _1218;
    float _1222 = -_1202;
    float _1224 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1074);
    float _1226 = 0.0;
    if (!_1150)
    {
        _1226 = _328;
    }
    float _1228 = _1226;
    float _1230 = _1228;
    if (_1150)
    {
        float _1232 = fma(_340, 0.001000000047497451305389404296875, _328);
        _1230 = _1232;
    }
    float _1234 = _1230;
    float _1236 = -_1216;
    float _1238 = -_1220;
    float _1240 = fma(_1096, _1236, _1238);
    float _1242 = -_1216;
    float _1244 = _1094 * _1242;
    float _1246 = fma(_1224, _1224, _1210);
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1248;
    float _1252 = in.m_59.y;
    float _1254 = fma(_1124, _1180, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1256 = -_1234;
    float _1258 = -_1244;
    float _1260 = fma(_1108, _1256, _1258);
    float _1262 = -_1234;
    float _1264 = _1096 * _1262;
    float _1266 = in.m_59.x;
    float _1268 = _1240 * _1240;
    float _1270 = sqrt(_1246);
    float _1272 = -_1200;
    float _1274 = -_1264;
    float _1276 = fma(_1094, _1272, _1274);
    float _1278 = _1246;
    if (_1092)
    {
        bool _1280 = _1140 > 0.5;
        _1184 = _1280;
    }
    bool _1282 = _1184;
    float _1284 = fma(_1260, _1260, _1268);
    float _1286 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1288 = fma(_1178, _1180, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1290 = fma(_1250, _1180, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1292 = fma(_1276, _1276, _1284);
    float _1294 = _998 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1296 = _1158 ? as_type<float>(_1162) : _1064;
    float _1298 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1102);
    float _1300 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1100);
    bool _1302 = _1032 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1304 = isnan(_1032);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1310 = _1306 || _1308;
    float _1312 = float(_1310);
    float _1314 = rsqrt(_1292);
    bool _1316 = _1032 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1318 = isnan(_1032);
    bool _1320 = _1316 || _1318;
    bool _1322 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1324 = _1320 || _1322;
    float _1326 = float(_1324);
    float _1328 = in.m_61.x;
    float _1330 = _1114 * _1270;
    float _1332 = -_1312;
    float _1334 = _1332 + 1.0;
    float _1336 = _1296;
    if (!_1128)
    {
        _1278 = _1252;
    }
    float _1338 = _1278;
    float _1340 = _1294 * _1330;
    float _1342 = _1286 * _1266;
    float _1344 = _1338;
    if (_1120)
    {
        bool _1346 = _1266 > 0.5;
        _1186 = _1346;
    }
    bool _1348 = _1186;
    float _1350 = _1340 * _1300;
    if (_1128)
    {
        _1344 = _1266;
    }
    float _1352 = _1344;
    float _1354 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1356 = _1146 * _1330;
    float _1358 = trunc(_1342);
    int _1360 = int(_1358);
    float _1362 = _1240 * _1314;
    float _1364 = _1276 * _1314;
    float _1366 = _1356 * _1298;
    float _1368 = _1354 * _1330;
    float _1370 = _1260 * _1314;
    float _1372 = _1094 * _1364;
    float _1374 = _1096 * _1362;
    float _1376 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1378 = _1366 * _1096;
    float _1380 = _1366 * _1108;
    float _1382 = _1368 * _1174;
    float _1384 = -_1372;
    float _1386 = fma(_1108, _1362, _1384);
    float _1388 = -_1374;
    float _1390 = fma(_1094, _1370, _1388);
    float _1392 = fma(_1350, _1370, _1378);
    float _1394 = fma(_1350, _1364, _1380);
    float _1396 = -_1326;
    float _1398 = _1396 + 1.0;
    int _1400 = _1360 << 4;
    int _1402 = _1400 + 1968;
    float _1404 = fma(_1382, _1386, _1392);
    float _1406 = fma(_1382, _1390, _1394);
    float _1408 = _1312 * _1398;
    float _1410 = _1368;
    int _1412 = as_type<int>(_1408);
    if (!_1128)
    {
        float _1414 = in.m_59.z;
        _1410 = _1414;
    }
    float _1416 = _1410;
    float _1418 = _1066 + _1404;
    float _1420 = _1062 + _1406;
    float _1422 = _1376 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    uint _1425 = uint(int(uint(_1402) >> uint(2)));
    uint _1427 = uint(int(uint(int(_1425)) >> uint(2)));
    int _1429 = int(_1425) & 3;
    float _1431 = (*spvDescriptorSet0.vp_c9)._m0[int(_1427)][_1429];
    int _1433 = int(_1425) + 1;
    uint _1435 = uint(int(uint(_1433) >> uint(2)));
    int _1437 = _1433 & 3;
    float _1439 = (*spvDescriptorSet0.vp_c9)._m0[int(_1435)][_1437];
    float _1441 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1443 = _1418 + _1441;
    float _1445 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1447 = _1420 + _1445;
    float _1449 = fma(_1422, _1296, -0.5);
    float _1451 = _1288 * _1408;
    float _1453 = _1443 * _1443;
    float _1455 = _1447 * _1447;
    float _1457 = _1254 * _1408;
    int _1459 = _1402 + 8;
    uint _1461 = uint(int(uint(_1459) >> uint(2)));
    uint _1463 = uint(int(uint(int(_1461)) >> uint(2)));
    int _1465 = int(_1461) & 3;
    float _1467 = (*spvDescriptorSet0.vp_c9)._m0[int(_1463)][_1465];
    float _1469 = _1290 * _1408;
    float _1471 = _1453 + _1455;
    float _1473 = _1328;
    float _1475 = _1453;
    float _1477 = _1455;
    float _1479 = _1418;
    float _1481 = _1420;
    if (_1120)
    {
        float _1483 = -_1328;
        float _1485 = _1483 + 1.0;
        _1412 = as_type<int>(_1485);
    }
    int _1487 = _1412;
    if (!_1120)
    {
        _1206 = _1328;
    }
    float _1489 = _1206;
    float _1491 = _1366 * _1094;
    float _1493 = sqrt(_1471);
    float _1495 = _1108 * _1370;
    float _1497 = _1489;
    if (_1120)
    {
        float _1499 = _1348 ? as_type<float>(_1487) : _1328;
        _1497 = _1499;
    }
    float _1501 = _1497;
    float _1503 = fma(_1350, _1362, _1491);
    float _1505 = -_1495;
    float _1507 = fma(_1096, _1364, _1505);
    float _1509 = _1416;
    if (!_1128)
    {
        _1336 = _1416;
    }
    float _1511 = _1336;
    int _1513 = 0;
    float _1515 = _1511;
    if (_1092)
    {
        float _1517 = -_1328;
        float _1519 = _1517 + 1.0;
        _1513 = as_type<int>(_1519);
    }
    int _1521 = _1513;
    if (_1128)
    {
        _1515 = _1252;
    }
    float _1523 = _1515;
    float _1525 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_1128)
    {
        _1509 = _1252;
    }
    float _1527 = _1509;
    float _1529 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1457);
    bool _1531 = _1252 > 0.5;
    float _1533 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1525);
    float _1535 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1469);
    float _1537 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1539 = _1493 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1541 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1543 = fma(_1382, _1507, _1503);
    float _1545 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1451);
    if (_1092)
    {
        float _1547 = _1282 ? as_type<float>(_1521) : _1328;
        _1473 = _1547;
    }
    float _1549 = _1473;
    float _1551 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1553 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1555 = _1060 + _1543;
    float _1557 = -_1551;
    float _1559 = fma(_1541, 2.0, _1557);
    float _1561 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1553);
    bool _1563 = !_1539;
    float _1565 = _1555;
    if (!_1563)
    {
        float _1567 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1569 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1571 = _1493 + _1569;
        float _1573 = rsqrt(_1471);
        float _1575 = _1571 * _1567;
        float _1577 = _1555 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1579 = _1575 * 0.15915493667125701904296875;
        float _1581 = _1579 * 6.283185482025146484375;
        float _1583 = sin(_1581);
        float _1585 = _1579 * 6.283185482025146484375;
        float _1587 = cos(_1585);
        float _1589 = fma(_1583, _1577, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1591 = _1573 * _1589;
        float _1593 = _1587 + (-1.0);
        float _1595 = fma(_1443, _1591, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1597 = fma(_1447, _1591, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1599 = _1593 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1601 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1603 = _1595 + _1601;
        float _1605 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1607 = _1597 + _1605;
        float _1609 = fma(_1555, _1587, _1599);
        float _1611 = _1603 * _1603;
        float _1613 = _1607 * _1607;
        _1565 = _1609;
        _1475 = _1611;
        _1477 = _1613;
        _1479 = _1595;
        _1481 = _1597;
    }
    float _1615 = _1565;
    float _1617 = _1475;
    float _1619 = _1477;
    float _1621 = _1479;
    float _1623 = _1481;
    float _1625 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1627 = _1523 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1629 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1631 = _1615 + _1629;
    float _1633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1635 = _1537 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1637 = fma(_1627, -2.0, _1625);
    float _1639 = fma(_1631, _1631, _1617);
    float _1641 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1561);
    float _1643 = fma(_1635, _1549, -0.5);
    float _1645 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1637);
    if (_1166)
    {
        float _1647 = _1531 ? _1154 : _1064;
        _1134 = _1647;
    }
    float _1649 = _1134;
    float _1651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1653 = _1639 + _1619;
    float _1655 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1533);
    float _1657 = -_128;
    float _1659 = fma(_1657, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1559);
    float _1661 = -_1645;
    float _1663 = fma(_1641, _1449, _1661);
    float _1665 = _1501 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1667 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1529);
    float _1669 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1545);
    float _1671 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1535);
    float _1673 = fma(_1655, _1643, _1659);
    float _1675 = _1431 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1677 = _1649 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1679 = sqrt(_1653);
    float _1681 = _1439 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1683 = _1665 * _1633;
    float _1685 = _1467 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1687 = _1667 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1689 = _1669 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1691 = _1671 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1693 = _1675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1695 = _1681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1697 = _1677 * _1651;
    float _1699 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1701 = _1685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1703 = _1687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1705 = _1689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1707 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1709 = _1673 + 0.5;
    float _1711 = _1663 + 0.5;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    bool _1713 = _1679 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1715 = isnan(_1679);
    bool _1717 = _1713 || _1715;
    bool _1719 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1721 = _1717 || _1719;
    out.m_67.x = _1693;
    out.m_67.y = _1695;
    out.m_67.z = _1701;
    out.m_69.x = _1703;
    out.m_69.y = _1705;
    out.m_69.z = _1707;
    out.m_69.w = _1699;
    out.m_71.x = _1683;
    out.m_71.y = _1697;
    out.m_71.z = _1709;
    out.m_71.w = _1711;
    float _1723 = _1671;
    float _1725 = _1707;
    if (!_1721)
    {
        _1723 = 1.0;
    }
    float _1727 = _1723;
    bool _1729 = !_1721;
    float _1731 = _1727;
    if (!_1729)
    {
        bool _1733 = _1679 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1735 = isnan(_1679);
        bool _1737 = _1733 || _1735;
        bool _1739 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1741 = _1737 || _1739;
        if (!_1741)
        {
            float _1743 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1745 = _1679 + _1743;
            float _1747 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1749 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1747;
            float _1751 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1753 = _1751 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1755 = 1.0 / _1749;
            float _1757 = _1745 * _1755;
            float _1759 = fma(_1757, _1753, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1731 = _1759;
            _1761 = true;
        }
        else
        {
            bool _1763 = _1679 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1765 = isnan(_1679);
            bool _1767 = _1763 || _1765;
            bool _1769 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1771 = _1767 || _1769;
            if (!_1771)
            {
                float _1773 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1775 = _1679 + _1773;
                float _1777 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1779 = _1777 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1781 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1783 = _1781 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1785 = 1.0 / _1779;
                float _1787 = _1775 * _1785;
                float _1789 = fma(_1787, _1783, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1731 = _1789;
                _1761 = true;
            }
            else
            {
                _1731 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1761 = false;
    float _1791 = _1731;
    float _1793 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1795 = _1615 + _1793;
    float _1797 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1799 = _1621 + _1797;
    float _1801 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1803 = _1623 + _1801;
    float _1805 = fma(_1795, _1791, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1807 = fma(_1799, _1791, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1809 = fma(_1803, _1791, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1811 = -_1060;
    float _1813 = _1811 + _1805;
    float _1815 = -_1066;
    float _1817 = _1815 + _1807;
    float _1819 = -_1062;
    float _1821 = _1819 + _1809;
    float _1823 = _1813 * _1813;
    float _1825 = fma(_1817, _1817, _1823);
    float _1827 = fma(_1821, _1821, _1825);
    float _1829 = sqrt(_1827);
    bool _1831 = _1829 > 0.0;
    bool _1833 = !_1831;
    float _1835 = _1823;
    float _1837 = _1829;
    float _1839 = _1807;
    float _1841 = _1805;
    float _1843 = _1809;
    if (!_1833)
    {
        bool _1845 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1847 = _1697;
        if (_1845)
        {
            float _1849 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1847 = _1849;
        }
        float _1851 = _1847;
        if (_1845)
        {
            float _1853 = _1851 * _812;
            _1835 = _1853;
        }
        float _1855 = _1835;
        float _1857 = _1855;
        if (_1845)
        {
            float _1859 = _1851 * _810;
            _1725 = _1859;
        }
        float _1861 = _1725;
        float _1863 = _1861;
        if (_1845)
        {
            float _1865 = _1851 * _814;
            _1837 = _1865;
        }
        float _1867 = _1837;
        float _1869 = _1867;
        if (!_1845)
        {
            float _1871 = _128 + 1.0;
            if (!_172)
            {
                float _1873 = _1871 * _1871;
                float _1875 = _1873 * 0.5;
                _130 = _1875;
            }
            float _1877 = _130;
            float _1879 = _1877;
            if (!_172)
            {
                float _1881 = _1877 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1879 = _1881;
            }
            float _1883 = _1879;
            bool _1885 = !_172;
            float _1887 = _1883;
            if (!_1885)
            {
                float _1889 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1891 = log2(_1889);
                float _1893 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1895 = _1893 + 1.0;
                float _1897 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1899 = _1891 * _1871;
                float _1901 = 1.0 / _1895;
                float _1903 = _1897 * 0.693147182464599609375;
                float _1905 = exp2(_1899);
                float _1907 = 1.0 / _1903;
                float _1909 = _1905 + (-1.0);
                float _1911 = -_1909;
                float _1913 = fma(_1911, _1907, _1871);
                float _1915 = _1913 * _1901;
                float _1917 = _1915 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1887 = _1917;
            }
            float _1919 = _1887;
            float _1921 = _1919 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _1923 = _1919 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1925 = _1919 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1927 = _1919;
            if (!_172)
            {
                _1927 = _1871;
            }
            float _1929 = _1927;
            float _1931 = _1921 * _328;
            float _1933 = _1921 * _294;
            float _1935 = _1921 * _340;
            float _1937 = fma(_1923, _324, _1931);
            float _1939 = fma(_1923, _290, _1933);
            float _1941 = fma(_1925, _332, _1937);
            bool _1943 = !_172;
            float _1945 = _1929;
            if (!_1943)
            {
                float _1947 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1949 = log2(_1947);
                float _1951 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1953 = _1951 + 1.0;
                float _1955 = 1.0 / _1953;
                float _1957 = _1949 * _1871;
                float _1959 = exp2(_1957);
                float _1961 = -_1959;
                float _1963 = _1961 + 1.0;
                float _1965 = _1963 * _1955;
                _1945 = _1965;
            }
            float _1967 = _1945;
            float _1969 = fma(_1923, _336, _1935);
            float _1971 = fma(_1925, _298, _1939);
            float _1973 = fma(_1967, _230, _1941);
            float _1975 = fma(_1925, _344, _1969);
            float _1977 = fma(_1967, _228, _1971);
            float _1979 = -_532;
            float _1981 = _1979 + _1973;
            float _1983 = fma(_1967, _232, _1975);
            float _1985 = -_538;
            float _1987 = _1985 + _1977;
            float _1989 = _1981 * _152;
            float _1991 = _1981 * _160;
            float _1993 = -_546;
            float _1995 = _1993 + _1983;
            float _1997 = _1981 * _176;
            float _1999 = fma(_1987, _150, _1989);
            float _2001 = fma(_1987, _158, _1991);
            float _2003 = fma(_1987, _174, _1997);
            float _2005 = fma(_1995, _154, _1999);
            float _2007 = fma(_1995, _162, _2001);
            float _2009 = fma(_1995, _178, _2003);
            float _2011 = _2005 * _2005;
            float _2013 = fma(_2007, _2007, _2011);
            float _2015 = fma(_2009, _2009, _2013);
            _1136 = _2015;
            _820 = _2005;
            _822 = _2007;
            _824 = _2009;
            _1857 = _2007;
            _1863 = _2005;
            _1869 = _2009;
        }
        float _2017 = _1136;
        float _2019 = _820;
        float _2021 = _822;
        float _2023 = _824;
        float _2025 = _1857;
        float _2027 = _1863;
        float _2029 = _1869;
        float _2031 = sqrt(_2017);
        float _2033 = rsqrt(_1827);
        bool _2035 = _2031 > 0.0;
        float _2037 = _1817 * _2033;
        float _2039 = _1813 * _2033;
        float _2041 = _1821 * _2033;
        bool _2043 = !_2035;
        if (!_2043)
        {
            float _2045 = rsqrt(_2017);
            float _2047 = _2045 * _2019;
            float _2049 = _2045 * _2021;
            float _2051 = _2039 * _2047;
            float _2053 = _2045 * _2023;
            float _2055 = fma(_2037, _2049, _2051);
            float _2057 = fma(_2041, _2053, _2055);
            float _2059 = _2057 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2061 = fma(_2025, _2059, _1807);
            float _2063 = fma(_2027, _2059, _1805);
            float _2065 = fma(_2029, _2059, _1809);
            _1839 = _2061;
            _1841 = _2063;
            _1843 = _2065;
        }
    }
    float _2067 = _1839;
    float _2069 = _1841;
    float _2071 = _1843;
    float _2073 = -_1168;
    float _2075 = fma(_2073, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2067);
    float _2077 = -_1160;
    float _2079 = fma(_2077, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2069);
    float _2081 = -_1202;
    float _2083 = fma(_2081, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2071);
    bool _2085 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2087 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2089 = _2085 || _2087;
    bool _2091 = isnan(0.5);
    bool _2093 = _2089 || _2091;
    float _2095 = _2079;
    float _2097 = _2075;
    float _2099 = _2083;
    if (!_2093)
    {
        float _2101 = -_1160;
        float _2103 = fma(_2101, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1060);
        float _2105 = -_1168;
        float _2107 = fma(_2105, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1066);
        float _2109 = -_1202;
        float _2111 = fma(_2109, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1062);
        float _2113 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2115 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2117 = _2103 + _2115;
        float _2119 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2121 = _2107 + _2119;
        float _2123 = -_1062;
        float _2125 = _2123 + _2071;
        float _2127 = -_1066;
        float _2129 = _2127 + _2067;
        float _2131 = _2117 * _2117;
        float _2133 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2135 = _2111 + _2133;
        float _2137 = -_1060;
        float _2139 = _2137 + _2069;
        float _2141 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2143 = fma(_2121, _2121, _2131);
        float _2145 = fma(_2135, _2135, _2143);
        float _2147 = 1.0 / _1330;
        float _2149 = sqrt(_2145);
        float _2151 = _2141 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2153 = precise::min(_2149, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2155 = _2153 * _2113;
        float _2157 = _2155 * _2147;
        float _2159 = _2151 * _2157;
        float _2161 = _2125 * _2157;
        float _2163 = fma(_2129, _2159, _2107);
        float _2165 = fma(_2139, _2159, _2103);
        float _2167 = fma(_2151, _2161, _2111);
        _2095 = _2165;
        _2097 = _2163;
        _2099 = _2167;
    }
    float _2169 = _2095;
    float _2171 = _2097;
    float _2173 = _2099;
    float _2175 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2177 = _2169 + _2175;
    float _2179 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2181 = _2171 + _2179;
    float _2183 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2185 = _2173 + _2183;
    float _2187 = _2177 * _2177;
    float _2189 = fma(_2181, _2181, _2187);
    float _2191 = fma(_2185, _2185, _2189);
    float _2193 = rsqrt(_2191);
    float _2195 = sqrt(_2191);
    float _2197 = _2193 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2199 = _2181 * _2197;
    float _2201 = _2185 * _2197;
    float _2203 = _2199 * _2199;
    float _2205 = _2201 * _2201;
    float _2207 = _2203 + _2205;
    float _2209 = sqrt(_2207);
    bool _2211 = _2209 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2215 = _2209 + _2213;
    float _2217 = _2193;
    float _2219 = _2207;
    float _2221 = _2215;
    float _2223 = _2177;
    if (_2211)
    {
        float _2225 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2217 = _2225;
    }
    float _2227 = _2217;
    if (_2211)
    {
        float _2229 = rsqrt(_2207);
        _2219 = _2229;
    }
    float _2231 = _2219;
    float _2233 = _2231;
    if (_2211)
    {
        float _2235 = _2215 * _2227;
        _2221 = _2235;
    }
    float _2237 = _2221;
    if (_2211)
    {
        float _2239 = _2237 * 0.15915493667125701904296875;
        _214 = _2239;
    }
    float _2241 = _214;
    float _2243 = _2185;
    float _2245 = _2241;
    if (_2211)
    {
        float _2247 = _2241 * 6.283185482025146484375;
        float _2249 = sin(_2247);
        _2243 = _2249;
    }
    float _2251 = _2243;
    float _2253 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2255 = precise::max(0.0, _2253);
    float _2257 = _2227;
    float _2259 = _2255;
    if (_2211)
    {
        float _2261 = _2241 * 6.283185482025146484375;
        float _2263 = cos(_2261);
        _2257 = _2263;
    }
    float _2265 = _2257;
    float _2267 = -_2197;
    float _2269 = -_2255;
    float _2271 = fma(_2177, _2267, _2269);
    if (_2211)
    {
        float _2273 = _2271 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2223 = _2273;
    }
    float _2275 = _2223;
    float _2277 = _2275;
    float _2279 = _2251;
    if (_2211)
    {
        float _2281 = fma(_2251, _2275, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2277 = _2281;
    }
    float _2283 = _2277;
    float _2285 = _2283;
    if (!_2211)
    {
        _2279 = _2199;
    }
    float _2287 = _2279;
    float _2289 = _2287;
    float _2291 = _2265;
    if (_2211)
    {
        float _2293 = _2265 + (-1.0);
        _2259 = _2293;
    }
    float _2295 = _2259;
    float _2297 = _2295;
    if (_2211)
    {
        float _2299 = _2231 * _2283;
        _216 = _2299;
    }
    float _2301 = _216;
    if (!_2211)
    {
        _2285 = _2271;
    }
    float _2303 = _2285;
    float _2305 = _2303;
    if (_2211)
    {
        float _2307 = _2295 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2245 = _2307;
    }
    float _2309 = _2245;
    if (_2211)
    {
        float _2311 = _2199 * _2301;
        _2289 = _2311;
    }
    float _2313 = _2289;
    if (!_2211)
    {
        _2297 = _2201;
    }
    float _2315 = _2297;
    float _2317 = _2315;
    if (_2211)
    {
        float _2319 = _2201 * _2301;
        _2317 = _2319;
    }
    float _2321 = _2317;
    if (!_2211)
    {
        _2233 = _2203;
    }
    float _2323 = _2233;
    float _2325 = _2323;
    if (_2211)
    {
        float _2327 = fma(_2271, _2265, _2309);
        _2305 = _2327;
    }
    float _2329 = _2305;
    if (_2211)
    {
        float _2331 = _2313 * _2313;
        _2325 = _2331;
    }
    float _2333 = _2325;
    if (!_2211)
    {
        _2291 = _2205;
    }
    float _2335 = _2291;
    float _2337 = _2335;
    if (_2211)
    {
        float _2339 = _2321 * _2321;
        _2337 = _2339;
    }
    float _2341 = _2337;
    float _2343 = fma(_2329, _2329, _2333);
    float _2345 = _2343 + _2341;
    float _2347 = _2169 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2349 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2351 = fma(_2195, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2349);
    float _2353 = precise::clamp(_2351, 0.0, 1.0);
    float _2355 = _2169 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2357 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2359 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2347);
    float _2361 = rsqrt(_2345);
    float _2363 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2355);
    float _2365 = -_2353;
    float _2367 = _2365 + 1.0;
    float _2369 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2359);
    float _2371 = _2169 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2373 = _2169 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2375 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2363);
    float _2377 = _2369 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2379 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2371);
    float _2381 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2373);
    float _2383 = _2375 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2385 = _2377 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2387 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2379);
    float _2389 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2381);
    float _2391 = abs(_2367);
    float _2393 = log2(_2391);
    float _2395 = -_2385;
    float _2397 = fma(_2395, _2357, 1.0);
    float _2399 = _2361 * _2313;
    float _2401 = _2387 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2403 = _2383 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2405 = _2361 * _2329;
    float _2407 = _2361 * _2321;
    float _2409 = _2389 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2411 = fma(_2401, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2403);
    float _2413 = _2399 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2415 = log2(_2397);
    float _2417 = _2383 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2419 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2411);
    float _2421 = -_2413;
    float _2423 = fma(_2405, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2421);
    float _2425 = _2405 + 1.0;
    float _2427 = fma(_2409, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2419);
    float _2429 = -_2407;
    float _2431 = fma(_2429, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2423);
    float _2433 = _2393 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2435 = _2383 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2437 = 1.0 / _2427;
    float _2439 = fma(_2431, -0.5, 0.5);
    float _2441 = fma(_2431, 0.5, 0.5);
    float _2443 = fma(_2401, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2435);
    float _2445 = fma(_2401, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2417);
    float _2447 = fma(_2441, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2449 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2443);
    float _2451 = exp2(_2433);
    float _2453 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2445);
    float _2455 = fma(_2441, _2447, -0.212114393711090087890625);
    float _2457 = fma(_2409, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2449);
    float _2459 = fma(_2409, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2453);
    float _2461 = _2415 * 0.693147182464599609375;
    float _2463 = fma(_2441, _2455, 1.570728778839111328125);
    float _2465 = sqrt(_2439);
    float _2467 = _2457 * _2437;
    float _2469 = _2459 * _2437;
    float _2471 = _2461 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2473 = fma(_2467, 0.5, 0.5);
    float _2475 = fma(_2469, -0.5, 0.5);
    float _2477 = -_2405;
    float _2479 = fma(_2451, _2425, _2477);
    float3 _6398 = float3(_2473, _2475, _2471);
    float _2481 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6398, float3(0.0), isnan(_6398)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6398, float3(0.0), isnan(_6398)), level(0.0)).x;
    float3 _6409 = float3(_2473, _2475, _2471);
    float4 _2484 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6409, float3(0.0), isnan(_6409)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6409, float3(0.0), isnan(_6409)), level(0.0)).xyzw;
    float _2486 = _2484.x;
    float _2488 = _2484.y;
    float _2490 = _2484.z;
    float _2492 = _2484.w;
    float _2494 = fma(_2479, 0.5, 0.5);
    float _2496 = _2465 * 0.636619746685028076171875;
    float _2498 = -_2463;
    float _2500 = fma(_2496, _2498, 1.0);
    float2 _6436 = float2(_2500, _2494);
    float3 _2504 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6436, float2(0.0), isnan(_6436)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6436, float2(0.0), isnan(_6436)), level(0.0)).xyz;
    float _2506 = _2504.x;
    float _2508 = _2504.y;
    float _2510 = _2504.z;
    float _2512 = _2393 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2514 = _2383 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2516 = fma(_2401, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2514);
    float _2518 = exp2(_2512);
    float _2520 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2522 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2516);
    float _2524 = fma(_2409, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2522);
    out.m_47.x = _2520;
    float _2526 = _2524 + _2427;
    out.gl_Position.x = _2457;
    out.gl_Position.y = _2459;
    out.gl_Position.z = _2524;
    out.gl_Position.w = _2427;
    float _2528 = _2526 * 0.5;
    float _2530 = -_2518;
    float _2532 = _2530 + 1.0;
    float _2534 = _2532 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.z = _2528;
    out.m_73.w = _2427;
    float _2536 = _2534 * _2481;
    float _2538 = -_2534;
    float _2540 = _2538 + 1.0;
    float _2542 = _2492 * _2536;
    float _2544 = _2492 * _2540;
    float _2546 = _2510 * _2536;
    float _2548 = fma(_2506, _2542, _2486);
    float _2550 = fma(_2508, _2542, _2488);
    float _2552 = fma(_2492, _2546, _2490);
    out.m_75.x = _2548;
    out.m_75.y = _2550;
    out.m_75.z = _2552;
    out.m_75.w = _2544;
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
    bool _1761 = false;
    bool _1024 = false;
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
        float _2609 = as_type<float>(_110);
        out.gl_Position.z = _2609;
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
        float _2679 = as_type<float>(_148);
        out.gl_Position.z = _2679;
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
    float _560 = _542 * _152;
    float _562 = fma(_550, _550, _552);
    float _564 = _542 * _160;
    float _566 = _542 * _176;
    float _568 = fma(_550, _150, _560);
    float _570 = fma(_558, _558, _562);
    float _572 = fma(_550, _158, _564);
    float _574 = in.m_44.x;
    float _576 = in.m_44.y;
    float _578 = in.m_44.z;
    float _580 = fma(_550, _174, _566);
    float _582 = fma(_558, _154, _568);
    float _584 = sqrt(_570);
    float _586 = fma(_558, _162, _572);
    float _588 = fma(_558, _178, _580);
    bool _590 = _584 >= 9.9999999747524270787835121154785e-07;
    bool _592 = isnan(_584);
    bool _594 = _590 || _592;
    bool _596 = isnan(9.9999999747524270787835121154785e-07);
    bool _598 = _594 || _596;
    float _600 = fma(_536, _554, _574);
    float _602 = fma(_496, _554, _576);
    float _604 = fma(_544, _554, _578);
    float _606 = _554;
    float _608 = _588;
    float _610 = _586;
    float _612 = _586;
    float _614 = _588;
    if (_598)
    {
        _606 = _582;
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
    float _976 = fma(_964, _932, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _978 = fma(_968, _932, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _980 = fma(_972, _932, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _982 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[143].y, _958);
    float _984 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[143].z, _960);
    float _986 = fma(_976, _912, _974);
    float _988 = fma(_978, _912, _982);
    float _990 = fma(_980, _912, _984);
    float _992 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[145].x, _986);
    float _994 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[145].y, _988);
    float _996 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[145].z, _990);
    float _998 = _992 * _950;
    float _1000 = _994 * _952;
    float _1002 = _996 * _954;
    bool _1004 = !_922;
    float _1022;
    if (!_1004)
    {
        float _1006 = in.m_59.x;
        float _1008 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _1010 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _1012 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _1014 = _1012 * _1008;
        float _1016 = floor(_1014);
        float _1018 = -_1016;
        float _1020 = _1014 + _1018;
        _1022 = _1020;
        _1024 = true;
    }
    else
    {
        float _1026 = float(_94);
        float _1028 = 1.0 / _1026;
        float _1030 = _128 * _1028;
        _1022 = _1030;
    }
    _1024 = false;
    float _1032 = _1022;
    float _1034 = _810 * _810;
    float _1036 = _602 * _152;
    float _1038 = _602 * _176;
    float _1040 = fma(_812, _812, _1034);
    float _1042 = _602 * _160;
    float _1044 = fma(_600, _150, _1036);
    float _1046 = fma(_600, _174, _1038);
    float _1048 = fma(_814, _814, _1040);
    float _1050 = fma(_600, _158, _1042);
    float _1052 = fma(_604, _154, _1044);
    float _1054 = fma(_604, _178, _1046);
    float _1056 = rsqrt(_1048);
    float _1058 = fma(_604, _162, _1050);
    float _1060 = _1052 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1062 = _1054 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1064 = in.m_61.y;
    float _1066 = _1058 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1070 = _1060 + _1068;
    float _1072 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1074 = _1062 + _1072;
    float _1076 = in.m_59.w;
    float _1078 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1080 = _1066 + _1078;
    float _1082 = _1070 * _1070;
    float _1084 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1086 = _1032 + _1084;
    float _1088 = fma(_1080, _1080, _1082);
    int _1090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1092 = _1090 != 0;
    float _1094 = _1056 * _810;
    float _1096 = _1056 * _812;
    float _1098 = fma(_1074, _1074, _1088);
    float _1100 = in.m_63.x;
    float _1102 = in.m_63.y;
    float _1104 = in.m_63.z;
    float _1106 = _1094 * _328;
    float _1108 = _1056 * _814;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1110;
    float _1114 = rsqrt(_1098);
    float _1116 = fma(_1096, _324, _1106);
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1120 = _1118 != 0;
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1122;
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1128 = _1126 != 0;
    float _1130 = fma(_1108, _332, _1116);
    float _1132 = 0.0;
    float _1134 = _1064;
    float _1136 = _1048;
    if (_1092)
    {
        float _1138 = in.m_59.z;
        _1132 = _1138;
    }
    float _1140 = _1132;
    float _1142 = 1.0 / _1112;
    bool _1144 = _1076 > 0.5;
    float _1146 = _1000 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1148 = abs(_1130);
    bool _1150 = _1148 > 0.99989998340606689453125;
    float _1152 = -_1064;
    float _1154 = _1152 + 1.0;
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1158 = _1156 != 0;
    float _1160 = _1070 * _1114;
    int _1162 = _1144 ? as_type<int>(_1154) : as_type<int>(_1064);
    int _1164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1166 = _1164 != 0;
    float _1168 = _1080 * _1114;
    float _1170 = -_1160;
    float _1172 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1070);
    float _1174 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1104);
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1176;
    float _1180 = _1086 * _1142;
    float _1182 = _1104;
    bool _1184 = _1150;
    bool _1186 = _1158;
    if (!_1150)
    {
        _1182 = _324;
    }
    float _1188 = _1182;
    float _1190 = -_1168;
    float _1192 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1080);
    float _1194 = _1172 * _1172;
    float _1196 = _1188;
    if (_1150)
    {
        float _1198 = fma(_336, 0.001000000047497451305389404296875, _324);
        _1196 = _1198;
    }
    float _1200 = _1196;
    float _1202 = _1074 * _1114;
    float _1204 = 0.0;
    float _1206 = _1200;
    if (!_1150)
    {
        _1204 = _332;
    }
    float _1208 = _1204;
    float _1210 = fma(_1192, _1192, _1194);
    float _1212 = _1208;
    if (_1150)
    {
        float _1214 = fma(_344, 0.001000000047497451305389404296875, _332);
        _1212 = _1214;
    }
    float _1216 = _1212;
    float _1218 = -_1200;
    float _1220 = _1108 * _1218;
    float _1222 = -_1202;
    float _1224 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1074);
    float _1226 = 0.0;
    if (!_1150)
    {
        _1226 = _328;
    }
    float _1228 = _1226;
    float _1230 = _1228;
    if (_1150)
    {
        float _1232 = fma(_340, 0.001000000047497451305389404296875, _328);
        _1230 = _1232;
    }
    float _1234 = _1230;
    float _1236 = -_1216;
    float _1238 = -_1220;
    float _1240 = fma(_1096, _1236, _1238);
    float _1242 = -_1216;
    float _1244 = _1094 * _1242;
    float _1246 = fma(_1224, _1224, _1210);
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1248;
    float _1252 = in.m_59.y;
    float _1254 = fma(_1124, _1180, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1256 = -_1234;
    float _1258 = -_1244;
    float _1260 = fma(_1108, _1256, _1258);
    float _1262 = -_1234;
    float _1264 = _1096 * _1262;
    float _1266 = in.m_59.x;
    float _1268 = _1240 * _1240;
    float _1270 = sqrt(_1246);
    float _1272 = -_1200;
    float _1274 = -_1264;
    float _1276 = fma(_1094, _1272, _1274);
    float _1278 = _1246;
    if (_1092)
    {
        bool _1280 = _1140 > 0.5;
        _1184 = _1280;
    }
    bool _1282 = _1184;
    float _1284 = fma(_1260, _1260, _1268);
    float _1286 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1288 = fma(_1178, _1180, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1290 = fma(_1250, _1180, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1292 = fma(_1276, _1276, _1284);
    float _1294 = _998 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1296 = _1158 ? as_type<float>(_1162) : _1064;
    float _1298 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1102);
    float _1300 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1100);
    bool _1302 = _1032 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1304 = isnan(_1032);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1310 = _1306 || _1308;
    float _1312 = float(_1310);
    float _1314 = rsqrt(_1292);
    bool _1316 = _1032 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1318 = isnan(_1032);
    bool _1320 = _1316 || _1318;
    bool _1322 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1324 = _1320 || _1322;
    float _1326 = float(_1324);
    float _1328 = in.m_61.x;
    float _1330 = _1114 * _1270;
    float _1332 = -_1312;
    float _1334 = _1332 + 1.0;
    float _1336 = _1296;
    if (!_1128)
    {
        _1278 = _1252;
    }
    float _1338 = _1278;
    float _1340 = _1294 * _1330;
    float _1342 = _1286 * _1266;
    float _1344 = _1338;
    if (_1120)
    {
        bool _1346 = _1266 > 0.5;
        _1186 = _1346;
    }
    bool _1348 = _1186;
    float _1350 = _1340 * _1300;
    if (_1128)
    {
        _1344 = _1266;
    }
    float _1352 = _1344;
    float _1354 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1356 = _1146 * _1330;
    float _1358 = trunc(_1342);
    int _1360 = int(_1358);
    float _1362 = _1240 * _1314;
    float _1364 = _1276 * _1314;
    float _1366 = _1356 * _1298;
    float _1368 = _1354 * _1330;
    float _1370 = _1260 * _1314;
    float _1372 = _1094 * _1364;
    float _1374 = _1096 * _1362;
    float _1376 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1378 = _1366 * _1096;
    float _1380 = _1366 * _1108;
    float _1382 = _1368 * _1174;
    float _1384 = -_1372;
    float _1386 = fma(_1108, _1362, _1384);
    float _1388 = -_1374;
    float _1390 = fma(_1094, _1370, _1388);
    float _1392 = fma(_1350, _1370, _1378);
    float _1394 = fma(_1350, _1364, _1380);
    float _1396 = -_1326;
    float _1398 = _1396 + 1.0;
    int _1400 = _1360 << 4;
    int _1402 = _1400 + 1968;
    float _1404 = fma(_1382, _1386, _1392);
    float _1406 = fma(_1382, _1390, _1394);
    float _1408 = _1312 * _1398;
    float _1410 = _1368;
    int _1412 = as_type<int>(_1408);
    if (!_1128)
    {
        float _1414 = in.m_59.z;
        _1410 = _1414;
    }
    float _1416 = _1410;
    float _1418 = _1066 + _1404;
    float _1420 = _1062 + _1406;
    float _1422 = _1376 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    uint _1425 = uint(int(uint(_1402) >> uint(2)));
    uint _1427 = uint(int(uint(int(_1425)) >> uint(2)));
    int _1429 = int(_1425) & 3;
    float _1431 = (*spvDescriptorSet0.vp_c9)._m0[int(_1427)][_1429];
    int _1433 = int(_1425) + 1;
    uint _1435 = uint(int(uint(_1433) >> uint(2)));
    int _1437 = _1433 & 3;
    float _1439 = (*spvDescriptorSet0.vp_c9)._m0[int(_1435)][_1437];
    float _1441 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1443 = _1418 + _1441;
    float _1445 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1447 = _1420 + _1445;
    float _1449 = fma(_1422, _1296, -0.5);
    float _1451 = _1288 * _1408;
    float _1453 = _1443 * _1443;
    float _1455 = _1447 * _1447;
    float _1457 = _1254 * _1408;
    int _1459 = _1402 + 8;
    uint _1461 = uint(int(uint(_1459) >> uint(2)));
    uint _1463 = uint(int(uint(int(_1461)) >> uint(2)));
    int _1465 = int(_1461) & 3;
    float _1467 = (*spvDescriptorSet0.vp_c9)._m0[int(_1463)][_1465];
    float _1469 = _1290 * _1408;
    float _1471 = _1453 + _1455;
    float _1473 = _1328;
    float _1475 = _1453;
    float _1477 = _1455;
    float _1479 = _1418;
    float _1481 = _1420;
    if (_1120)
    {
        float _1483 = -_1328;
        float _1485 = _1483 + 1.0;
        _1412 = as_type<int>(_1485);
    }
    int _1487 = _1412;
    if (!_1120)
    {
        _1206 = _1328;
    }
    float _1489 = _1206;
    float _1491 = _1366 * _1094;
    float _1493 = sqrt(_1471);
    float _1495 = _1108 * _1370;
    float _1497 = _1489;
    if (_1120)
    {
        float _1499 = _1348 ? as_type<float>(_1487) : _1328;
        _1497 = _1499;
    }
    float _1501 = _1497;
    float _1503 = fma(_1350, _1362, _1491);
    float _1505 = -_1495;
    float _1507 = fma(_1096, _1364, _1505);
    float _1509 = _1416;
    if (!_1128)
    {
        _1336 = _1416;
    }
    float _1511 = _1336;
    int _1513 = 0;
    float _1515 = _1511;
    if (_1092)
    {
        float _1517 = -_1328;
        float _1519 = _1517 + 1.0;
        _1513 = as_type<int>(_1519);
    }
    int _1521 = _1513;
    if (_1128)
    {
        _1515 = _1252;
    }
    float _1523 = _1515;
    float _1525 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_1128)
    {
        _1509 = _1252;
    }
    float _1527 = _1509;
    float _1529 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1457);
    bool _1531 = _1252 > 0.5;
    float _1533 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1525);
    float _1535 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1469);
    float _1537 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1539 = _1493 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1541 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1543 = fma(_1382, _1507, _1503);
    float _1545 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1451);
    if (_1092)
    {
        float _1547 = _1282 ? as_type<float>(_1521) : _1328;
        _1473 = _1547;
    }
    float _1549 = _1473;
    float _1551 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1553 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1555 = _1060 + _1543;
    float _1557 = -_1551;
    float _1559 = fma(_1541, 2.0, _1557);
    float _1561 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1553);
    bool _1563 = !_1539;
    float _1565 = _1555;
    if (!_1563)
    {
        float _1567 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1569 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1571 = _1493 + _1569;
        float _1573 = rsqrt(_1471);
        float _1575 = _1571 * _1567;
        float _1577 = _1555 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1579 = _1575 * 0.15915493667125701904296875;
        float _1581 = _1579 * 6.283185482025146484375;
        float _1583 = sin(_1581);
        float _1585 = _1579 * 6.283185482025146484375;
        float _1587 = cos(_1585);
        float _1589 = fma(_1583, _1577, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1591 = _1573 * _1589;
        float _1593 = _1587 + (-1.0);
        float _1595 = fma(_1443, _1591, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1597 = fma(_1447, _1591, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1599 = _1593 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1601 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1603 = _1595 + _1601;
        float _1605 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1607 = _1597 + _1605;
        float _1609 = fma(_1555, _1587, _1599);
        float _1611 = _1603 * _1603;
        float _1613 = _1607 * _1607;
        _1565 = _1609;
        _1475 = _1611;
        _1477 = _1613;
        _1479 = _1595;
        _1481 = _1597;
    }
    float _1615 = _1565;
    float _1617 = _1475;
    float _1619 = _1477;
    float _1621 = _1479;
    float _1623 = _1481;
    float _1625 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1627 = _1523 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1629 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1631 = _1615 + _1629;
    float _1633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1635 = _1537 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1637 = fma(_1627, -2.0, _1625);
    float _1639 = fma(_1631, _1631, _1617);
    float _1641 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1561);
    float _1643 = fma(_1635, _1549, -0.5);
    float _1645 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1637);
    if (_1166)
    {
        float _1647 = _1531 ? _1154 : _1064;
        _1134 = _1647;
    }
    float _1649 = _1134;
    float _1651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1653 = _1639 + _1619;
    float _1655 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1533);
    float _1657 = -_128;
    float _1659 = fma(_1657, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1559);
    float _1661 = -_1645;
    float _1663 = fma(_1641, _1449, _1661);
    float _1665 = _1501 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1667 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1529);
    float _1669 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1545);
    float _1671 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1535);
    float _1673 = fma(_1655, _1643, _1659);
    float _1675 = _1431 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1677 = _1649 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1679 = sqrt(_1653);
    float _1681 = _1439 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1683 = _1665 * _1633;
    float _1685 = _1467 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1687 = _1667 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1689 = _1669 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1691 = _1671 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1693 = _1675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1695 = _1681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1697 = _1677 * _1651;
    float _1699 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1701 = _1685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1703 = _1687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1705 = _1689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1707 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1709 = _1673 + 0.5;
    float _1711 = _1663 + 0.5;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    bool _1713 = _1679 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1715 = isnan(_1679);
    bool _1717 = _1713 || _1715;
    bool _1719 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1721 = _1717 || _1719;
    out.m_67.x = _1693;
    out.m_67.y = _1695;
    out.m_67.z = _1701;
    out.m_69.x = _1703;
    out.m_69.y = _1705;
    out.m_69.z = _1707;
    out.m_69.w = _1699;
    out.m_71.x = _1683;
    out.m_71.y = _1697;
    out.m_71.z = _1709;
    out.m_71.w = _1711;
    float _1723 = _1671;
    float _1725 = _1707;
    if (!_1721)
    {
        _1723 = 1.0;
    }
    float _1727 = _1723;
    bool _1729 = !_1721;
    float _1731 = _1727;
    if (!_1729)
    {
        bool _1733 = _1679 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1735 = isnan(_1679);
        bool _1737 = _1733 || _1735;
        bool _1739 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1741 = _1737 || _1739;
        if (!_1741)
        {
            float _1743 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1745 = _1679 + _1743;
            float _1747 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1749 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1747;
            float _1751 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1753 = _1751 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1755 = 1.0 / _1749;
            float _1757 = _1745 * _1755;
            float _1759 = fma(_1757, _1753, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1731 = _1759;
            _1761 = true;
        }
        else
        {
            bool _1763 = _1679 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1765 = isnan(_1679);
            bool _1767 = _1763 || _1765;
            bool _1769 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1771 = _1767 || _1769;
            if (!_1771)
            {
                float _1773 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1775 = _1679 + _1773;
                float _1777 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1779 = _1777 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1781 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1783 = _1781 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1785 = 1.0 / _1779;
                float _1787 = _1775 * _1785;
                float _1789 = fma(_1787, _1783, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1731 = _1789;
                _1761 = true;
            }
            else
            {
                _1731 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1761 = false;
    float _1791 = _1731;
    float _1793 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1795 = _1615 + _1793;
    float _1797 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1799 = _1621 + _1797;
    float _1801 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1803 = _1623 + _1801;
    float _1805 = fma(_1795, _1791, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1807 = fma(_1799, _1791, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1809 = fma(_1803, _1791, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1811 = -_1060;
    float _1813 = _1811 + _1805;
    float _1815 = -_1066;
    float _1817 = _1815 + _1807;
    float _1819 = -_1062;
    float _1821 = _1819 + _1809;
    float _1823 = _1813 * _1813;
    float _1825 = fma(_1817, _1817, _1823);
    float _1827 = fma(_1821, _1821, _1825);
    float _1829 = sqrt(_1827);
    bool _1831 = _1829 > 0.0;
    bool _1833 = !_1831;
    float _1835 = _1823;
    float _1837 = _1829;
    float _1839 = _1807;
    float _1841 = _1805;
    float _1843 = _1809;
    if (!_1833)
    {
        bool _1845 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1847 = _1697;
        if (_1845)
        {
            float _1849 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1847 = _1849;
        }
        float _1851 = _1847;
        if (_1845)
        {
            float _1853 = _1851 * _812;
            _1835 = _1853;
        }
        float _1855 = _1835;
        float _1857 = _1855;
        if (_1845)
        {
            float _1859 = _1851 * _810;
            _1725 = _1859;
        }
        float _1861 = _1725;
        float _1863 = _1861;
        if (_1845)
        {
            float _1865 = _1851 * _814;
            _1837 = _1865;
        }
        float _1867 = _1837;
        float _1869 = _1867;
        if (!_1845)
        {
            float _1871 = _128 + 1.0;
            if (!_172)
            {
                float _1873 = _1871 * _1871;
                float _1875 = _1873 * 0.5;
                _130 = _1875;
            }
            float _1877 = _130;
            float _1879 = _1877;
            if (!_172)
            {
                float _1881 = _1877 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1879 = _1881;
            }
            float _1883 = _1879;
            bool _1885 = !_172;
            float _1887 = _1883;
            if (!_1885)
            {
                float _1889 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1891 = log2(_1889);
                float _1893 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1895 = _1893 + 1.0;
                float _1897 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1899 = _1891 * _1871;
                float _1901 = 1.0 / _1895;
                float _1903 = _1897 * 0.693147182464599609375;
                float _1905 = exp2(_1899);
                float _1907 = 1.0 / _1903;
                float _1909 = _1905 + (-1.0);
                float _1911 = -_1909;
                float _1913 = fma(_1911, _1907, _1871);
                float _1915 = _1913 * _1901;
                float _1917 = _1915 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1887 = _1917;
            }
            float _1919 = _1887;
            float _1921 = _1919 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _1923 = _1919 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1925 = _1919 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1927 = _1919;
            if (!_172)
            {
                _1927 = _1871;
            }
            float _1929 = _1927;
            float _1931 = _1921 * _328;
            float _1933 = _1921 * _294;
            float _1935 = _1921 * _340;
            float _1937 = fma(_1923, _324, _1931);
            float _1939 = fma(_1923, _290, _1933);
            float _1941 = fma(_1925, _332, _1937);
            bool _1943 = !_172;
            float _1945 = _1929;
            if (!_1943)
            {
                float _1947 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1949 = log2(_1947);
                float _1951 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1953 = _1951 + 1.0;
                float _1955 = 1.0 / _1953;
                float _1957 = _1949 * _1871;
                float _1959 = exp2(_1957);
                float _1961 = -_1959;
                float _1963 = _1961 + 1.0;
                float _1965 = _1963 * _1955;
                _1945 = _1965;
            }
            float _1967 = _1945;
            float _1969 = fma(_1923, _336, _1935);
            float _1971 = fma(_1925, _298, _1939);
            float _1973 = fma(_1967, _230, _1941);
            float _1975 = fma(_1925, _344, _1969);
            float _1977 = fma(_1967, _228, _1971);
            float _1979 = -_532;
            float _1981 = _1979 + _1973;
            float _1983 = fma(_1967, _232, _1975);
            float _1985 = -_538;
            float _1987 = _1985 + _1977;
            float _1989 = _1981 * _152;
            float _1991 = _1981 * _160;
            float _1993 = -_546;
            float _1995 = _1993 + _1983;
            float _1997 = _1981 * _176;
            float _1999 = fma(_1987, _150, _1989);
            float _2001 = fma(_1987, _158, _1991);
            float _2003 = fma(_1987, _174, _1997);
            float _2005 = fma(_1995, _154, _1999);
            float _2007 = fma(_1995, _162, _2001);
            float _2009 = fma(_1995, _178, _2003);
            float _2011 = _2005 * _2005;
            float _2013 = fma(_2007, _2007, _2011);
            float _2015 = fma(_2009, _2009, _2013);
            _1136 = _2015;
            _820 = _2005;
            _822 = _2007;
            _824 = _2009;
            _1857 = _2007;
            _1863 = _2005;
            _1869 = _2009;
        }
        float _2017 = _1136;
        float _2019 = _820;
        float _2021 = _822;
        float _2023 = _824;
        float _2025 = _1857;
        float _2027 = _1863;
        float _2029 = _1869;
        float _2031 = sqrt(_2017);
        float _2033 = rsqrt(_1827);
        bool _2035 = _2031 > 0.0;
        float _2037 = _1817 * _2033;
        float _2039 = _1813 * _2033;
        float _2041 = _1821 * _2033;
        bool _2043 = !_2035;
        if (!_2043)
        {
            float _2045 = rsqrt(_2017);
            float _2047 = _2045 * _2019;
            float _2049 = _2045 * _2021;
            float _2051 = _2039 * _2047;
            float _2053 = _2045 * _2023;
            float _2055 = fma(_2037, _2049, _2051);
            float _2057 = fma(_2041, _2053, _2055);
            float _2059 = _2057 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2061 = fma(_2025, _2059, _1807);
            float _2063 = fma(_2027, _2059, _1805);
            float _2065 = fma(_2029, _2059, _1809);
            _1839 = _2061;
            _1841 = _2063;
            _1843 = _2065;
        }
    }
    float _2067 = _1839;
    float _2069 = _1841;
    float _2071 = _1843;
    float _2073 = -_1168;
    float _2075 = fma(_2073, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2067);
    float _2077 = -_1160;
    float _2079 = fma(_2077, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2069);
    float _2081 = -_1202;
    float _2083 = fma(_2081, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2071);
    bool _2085 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2087 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2089 = _2085 || _2087;
    bool _2091 = isnan(0.5);
    bool _2093 = _2089 || _2091;
    float _2095 = _2079;
    float _2097 = _2075;
    float _2099 = _2083;
    if (!_2093)
    {
        float _2101 = -_1160;
        float _2103 = fma(_2101, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1060);
        float _2105 = -_1168;
        float _2107 = fma(_2105, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1066);
        float _2109 = -_1202;
        float _2111 = fma(_2109, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1062);
        float _2113 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2115 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2117 = _2103 + _2115;
        float _2119 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2121 = _2107 + _2119;
        float _2123 = -_1062;
        float _2125 = _2123 + _2071;
        float _2127 = -_1066;
        float _2129 = _2127 + _2067;
        float _2131 = _2117 * _2117;
        float _2133 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2135 = _2111 + _2133;
        float _2137 = -_1060;
        float _2139 = _2137 + _2069;
        float _2141 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2143 = fma(_2121, _2121, _2131);
        float _2145 = fma(_2135, _2135, _2143);
        float _2147 = 1.0 / _1330;
        float _2149 = sqrt(_2145);
        float _2151 = _2141 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2153 = precise::min(_2149, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2155 = _2153 * _2113;
        float _2157 = _2155 * _2147;
        float _2159 = _2151 * _2157;
        float _2161 = _2125 * _2157;
        float _2163 = fma(_2129, _2159, _2107);
        float _2165 = fma(_2139, _2159, _2103);
        float _2167 = fma(_2151, _2161, _2111);
        _2095 = _2165;
        _2097 = _2163;
        _2099 = _2167;
    }
    float _2169 = _2095;
    float _2171 = _2097;
    float _2173 = _2099;
    float _2175 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2177 = _2169 + _2175;
    float _2179 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2181 = _2171 + _2179;
    float _2183 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2185 = _2173 + _2183;
    float _2187 = _2177 * _2177;
    float _2189 = fma(_2181, _2181, _2187);
    float _2191 = fma(_2185, _2185, _2189);
    float _2193 = rsqrt(_2191);
    float _2195 = sqrt(_2191);
    float _2197 = _2193 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2199 = _2181 * _2197;
    float _2201 = _2185 * _2197;
    float _2203 = _2199 * _2199;
    float _2205 = _2201 * _2201;
    float _2207 = _2203 + _2205;
    float _2209 = sqrt(_2207);
    bool _2211 = _2209 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2215 = _2209 + _2213;
    float _2217 = _2193;
    float _2219 = _2207;
    float _2221 = _2215;
    float _2223 = _2177;
    if (_2211)
    {
        float _2225 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2217 = _2225;
    }
    float _2227 = _2217;
    if (_2211)
    {
        float _2229 = rsqrt(_2207);
        _2219 = _2229;
    }
    float _2231 = _2219;
    float _2233 = _2231;
    if (_2211)
    {
        float _2235 = _2215 * _2227;
        _2221 = _2235;
    }
    float _2237 = _2221;
    if (_2211)
    {
        float _2239 = _2237 * 0.15915493667125701904296875;
        _214 = _2239;
    }
    float _2241 = _214;
    float _2243 = _2185;
    float _2245 = _2241;
    if (_2211)
    {
        float _2247 = _2241 * 6.283185482025146484375;
        float _2249 = sin(_2247);
        _2243 = _2249;
    }
    float _2251 = _2243;
    float _2253 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2255 = precise::max(0.0, _2253);
    float _2257 = _2227;
    float _2259 = _2255;
    if (_2211)
    {
        float _2261 = _2241 * 6.283185482025146484375;
        float _2263 = cos(_2261);
        _2257 = _2263;
    }
    float _2265 = _2257;
    float _2267 = -_2197;
    float _2269 = -_2255;
    float _2271 = fma(_2177, _2267, _2269);
    if (_2211)
    {
        float _2273 = _2271 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2223 = _2273;
    }
    float _2275 = _2223;
    float _2277 = _2275;
    float _2279 = _2251;
    if (_2211)
    {
        float _2281 = fma(_2251, _2275, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2277 = _2281;
    }
    float _2283 = _2277;
    float _2285 = _2283;
    if (!_2211)
    {
        _2279 = _2199;
    }
    float _2287 = _2279;
    float _2289 = _2287;
    float _2291 = _2265;
    if (_2211)
    {
        float _2293 = _2265 + (-1.0);
        _2259 = _2293;
    }
    float _2295 = _2259;
    float _2297 = _2295;
    if (_2211)
    {
        float _2299 = _2231 * _2283;
        _216 = _2299;
    }
    float _2301 = _216;
    if (!_2211)
    {
        _2285 = _2271;
    }
    float _2303 = _2285;
    float _2305 = _2303;
    if (_2211)
    {
        float _2307 = _2295 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2245 = _2307;
    }
    float _2309 = _2245;
    if (_2211)
    {
        float _2311 = _2199 * _2301;
        _2289 = _2311;
    }
    float _2313 = _2289;
    if (!_2211)
    {
        _2297 = _2201;
    }
    float _2315 = _2297;
    float _2317 = _2315;
    if (_2211)
    {
        float _2319 = _2201 * _2301;
        _2317 = _2319;
    }
    float _2321 = _2317;
    if (!_2211)
    {
        _2233 = _2203;
    }
    float _2323 = _2233;
    float _2325 = _2323;
    if (_2211)
    {
        float _2327 = fma(_2271, _2265, _2309);
        _2305 = _2327;
    }
    float _2329 = _2305;
    if (_2211)
    {
        float _2331 = _2313 * _2313;
        _2325 = _2331;
    }
    float _2333 = _2325;
    if (!_2211)
    {
        _2291 = _2205;
    }
    float _2335 = _2291;
    float _2337 = _2335;
    if (_2211)
    {
        float _2339 = _2321 * _2321;
        _2337 = _2339;
    }
    float _2341 = _2337;
    float _2343 = fma(_2329, _2329, _2333);
    float _2345 = _2343 + _2341;
    float _2347 = _2169 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2349 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2351 = fma(_2195, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2349);
    float _2353 = precise::clamp(_2351, 0.0, 1.0);
    float _2355 = _2169 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2357 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2359 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2347);
    float _2361 = rsqrt(_2345);
    float _2363 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2355);
    float _2365 = -_2353;
    float _2367 = _2365 + 1.0;
    float _2369 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2359);
    float _2371 = _2169 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2373 = _2169 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2375 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2363);
    float _2377 = _2369 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2379 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2371);
    float _2381 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2373);
    float _2383 = _2375 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2385 = _2377 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2387 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2379);
    float _2389 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2381);
    float _2391 = abs(_2367);
    float _2393 = log2(_2391);
    float _2395 = -_2385;
    float _2397 = fma(_2395, _2357, 1.0);
    float _2399 = _2361 * _2313;
    float _2401 = _2387 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2403 = _2383 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2405 = _2361 * _2329;
    float _2407 = _2361 * _2321;
    float _2409 = _2389 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2411 = fma(_2401, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2403);
    float _2413 = _2399 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2415 = log2(_2397);
    float _2417 = _2383 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2419 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2411);
    float _2421 = -_2413;
    float _2423 = fma(_2405, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2421);
    float _2425 = _2405 + 1.0;
    float _2427 = fma(_2409, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2419);
    float _2429 = -_2407;
    float _2431 = fma(_2429, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2423);
    float _2433 = _2393 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2435 = _2383 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2437 = 1.0 / _2427;
    float _2439 = fma(_2431, -0.5, 0.5);
    float _2441 = fma(_2431, 0.5, 0.5);
    float _2443 = fma(_2401, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2435);
    float _2445 = fma(_2401, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2417);
    float _2447 = fma(_2441, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2449 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2443);
    float _2451 = exp2(_2433);
    float _2453 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2445);
    float _2455 = fma(_2441, _2447, -0.212114393711090087890625);
    float _2457 = fma(_2409, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2449);
    float _2459 = fma(_2409, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2453);
    float _2461 = _2415 * 0.693147182464599609375;
    float _2463 = fma(_2441, _2455, 1.570728778839111328125);
    float _2465 = sqrt(_2439);
    float _2467 = _2457 * _2437;
    float _2469 = _2459 * _2437;
    float _2471 = _2461 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2473 = fma(_2467, 0.5, 0.5);
    float _2475 = fma(_2469, -0.5, 0.5);
    float _2477 = -_2405;
    float _2479 = fma(_2451, _2425, _2477);
    float3 _6398 = float3(_2473, _2475, _2471);
    float _2481 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6398, float3(0.0), isnan(_6398)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6398, float3(0.0), isnan(_6398)), level(0.0)).x;
    float3 _6409 = float3(_2473, _2475, _2471);
    float4 _2484 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6409, float3(0.0), isnan(_6409)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6409, float3(0.0), isnan(_6409)), level(0.0)).xyzw;
    float _2486 = _2484.x;
    float _2488 = _2484.y;
    float _2490 = _2484.z;
    float _2492 = _2484.w;
    float _2494 = fma(_2479, 0.5, 0.5);
    float _2496 = _2465 * 0.636619746685028076171875;
    float _2498 = -_2463;
    float _2500 = fma(_2496, _2498, 1.0);
    float2 _6436 = float2(_2500, _2494);
    float3 _2504 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6436, float2(0.0), isnan(_6436)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6436, float2(0.0), isnan(_6436)), level(0.0)).xyz;
    float _2506 = _2504.x;
    float _2508 = _2504.y;
    float _2510 = _2504.z;
    float _2512 = _2393 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2514 = _2383 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2516 = fma(_2401, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2514);
    float _2518 = exp2(_2512);
    float _2520 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2522 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2516);
    float _2524 = fma(_2409, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2522);
    out.m_47.x = _2520;
    float _2526 = _2524 + _2427;
    out.gl_Position.x = _2457;
    out.gl_Position.y = _2459;
    out.gl_Position.z = _2524;
    out.gl_Position.w = _2427;
    float _2528 = _2526 * 0.5;
    float _2530 = -_2518;
    float _2532 = _2530 + 1.0;
    float _2534 = _2532 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.z = _2528;
    out.m_73.w = _2427;
    float _2536 = _2534 * _2481;
    float _2538 = -_2534;
    float _2540 = _2538 + 1.0;
    float _2542 = _2492 * _2536;
    float _2544 = _2492 * _2540;
    float _2546 = _2510 * _2536;
    float _2548 = fma(_2506, _2542, _2486);
    float _2550 = fma(_2508, _2542, _2488);
    float _2552 = fma(_2492, _2546, _2490);
    out.m_75.x = _2548;
    out.m_75.y = _2550;
    out.m_75.z = _2552;
    out.m_75.w = _2544;
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
    bool _1761 = false;
    bool _1024 = false;
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
        float _2609 = as_type<float>(_110);
        out.gl_Position.z = _2609;
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
        float _2679 = as_type<float>(_148);
        out.gl_Position.z = _2679;
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
    float _560 = _542 * _152;
    float _562 = fma(_550, _550, _552);
    float _564 = _542 * _160;
    float _566 = _542 * _176;
    float _568 = fma(_550, _150, _560);
    float _570 = fma(_558, _558, _562);
    float _572 = fma(_550, _158, _564);
    float _574 = in.m_44.x;
    float _576 = in.m_44.y;
    float _578 = in.m_44.z;
    float _580 = fma(_550, _174, _566);
    float _582 = fma(_558, _154, _568);
    float _584 = sqrt(_570);
    float _586 = fma(_558, _162, _572);
    float _588 = fma(_558, _178, _580);
    bool _590 = _584 >= 9.9999999747524270787835121154785e-07;
    bool _592 = isnan(_584);
    bool _594 = _590 || _592;
    bool _596 = isnan(9.9999999747524270787835121154785e-07);
    bool _598 = _594 || _596;
    float _600 = fma(_536, _554, _574);
    float _602 = fma(_496, _554, _576);
    float _604 = fma(_544, _554, _578);
    float _606 = _554;
    float _608 = _588;
    float _610 = _586;
    float _612 = _586;
    float _614 = _588;
    if (_598)
    {
        _606 = _582;
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
    float _976 = fma(_964, _932, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _978 = fma(_968, _932, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _980 = fma(_972, _932, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _982 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[143].y, _958);
    float _984 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[143].z, _960);
    float _986 = fma(_976, _912, _974);
    float _988 = fma(_978, _912, _982);
    float _990 = fma(_980, _912, _984);
    float _992 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[145].x, _986);
    float _994 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[145].y, _988);
    float _996 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[145].z, _990);
    float _998 = _992 * _950;
    float _1000 = _994 * _952;
    float _1002 = _996 * _954;
    bool _1004 = !_922;
    float _1022;
    if (!_1004)
    {
        float _1006 = in.m_59.x;
        float _1008 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _1010 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _1012 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _1014 = _1012 * _1008;
        float _1016 = floor(_1014);
        float _1018 = -_1016;
        float _1020 = _1014 + _1018;
        _1022 = _1020;
        _1024 = true;
    }
    else
    {
        float _1026 = float(_94);
        float _1028 = 1.0 / _1026;
        float _1030 = _128 * _1028;
        _1022 = _1030;
    }
    _1024 = false;
    float _1032 = _1022;
    float _1034 = _810 * _810;
    float _1036 = _602 * _152;
    float _1038 = _602 * _176;
    float _1040 = fma(_812, _812, _1034);
    float _1042 = _602 * _160;
    float _1044 = fma(_600, _150, _1036);
    float _1046 = fma(_600, _174, _1038);
    float _1048 = fma(_814, _814, _1040);
    float _1050 = fma(_600, _158, _1042);
    float _1052 = fma(_604, _154, _1044);
    float _1054 = fma(_604, _178, _1046);
    float _1056 = rsqrt(_1048);
    float _1058 = fma(_604, _162, _1050);
    float _1060 = _1052 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1062 = _1054 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1064 = in.m_61.y;
    float _1066 = _1058 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1068 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1070 = _1060 + _1068;
    float _1072 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1074 = _1062 + _1072;
    float _1076 = in.m_59.w;
    float _1078 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1080 = _1066 + _1078;
    float _1082 = _1070 * _1070;
    float _1084 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1086 = _1032 + _1084;
    float _1088 = fma(_1080, _1080, _1082);
    int _1090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1092 = _1090 != 0;
    float _1094 = _1056 * _810;
    float _1096 = _1056 * _812;
    float _1098 = fma(_1074, _1074, _1088);
    float _1100 = in.m_63.x;
    float _1102 = in.m_63.y;
    float _1104 = in.m_63.z;
    float _1106 = _1094 * _328;
    float _1108 = _1056 * _814;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1110;
    float _1114 = rsqrt(_1098);
    float _1116 = fma(_1096, _324, _1106);
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1120 = _1118 != 0;
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1122;
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1128 = _1126 != 0;
    float _1130 = fma(_1108, _332, _1116);
    float _1132 = 0.0;
    float _1134 = _1064;
    float _1136 = _1048;
    if (_1092)
    {
        float _1138 = in.m_59.z;
        _1132 = _1138;
    }
    float _1140 = _1132;
    float _1142 = 1.0 / _1112;
    bool _1144 = _1076 > 0.5;
    float _1146 = _1000 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1148 = abs(_1130);
    bool _1150 = _1148 > 0.99989998340606689453125;
    float _1152 = -_1064;
    float _1154 = _1152 + 1.0;
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1158 = _1156 != 0;
    float _1160 = _1070 * _1114;
    int _1162 = _1144 ? as_type<int>(_1154) : as_type<int>(_1064);
    int _1164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1166 = _1164 != 0;
    float _1168 = _1080 * _1114;
    float _1170 = -_1160;
    float _1172 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1070);
    float _1174 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1104);
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1176;
    float _1180 = _1086 * _1142;
    float _1182 = _1104;
    bool _1184 = _1150;
    bool _1186 = _1158;
    if (!_1150)
    {
        _1182 = _324;
    }
    float _1188 = _1182;
    float _1190 = -_1168;
    float _1192 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1080);
    float _1194 = _1172 * _1172;
    float _1196 = _1188;
    if (_1150)
    {
        float _1198 = fma(_336, 0.001000000047497451305389404296875, _324);
        _1196 = _1198;
    }
    float _1200 = _1196;
    float _1202 = _1074 * _1114;
    float _1204 = 0.0;
    float _1206 = _1200;
    if (!_1150)
    {
        _1204 = _332;
    }
    float _1208 = _1204;
    float _1210 = fma(_1192, _1192, _1194);
    float _1212 = _1208;
    if (_1150)
    {
        float _1214 = fma(_344, 0.001000000047497451305389404296875, _332);
        _1212 = _1214;
    }
    float _1216 = _1212;
    float _1218 = -_1200;
    float _1220 = _1108 * _1218;
    float _1222 = -_1202;
    float _1224 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1074);
    float _1226 = 0.0;
    if (!_1150)
    {
        _1226 = _328;
    }
    float _1228 = _1226;
    float _1230 = _1228;
    if (_1150)
    {
        float _1232 = fma(_340, 0.001000000047497451305389404296875, _328);
        _1230 = _1232;
    }
    float _1234 = _1230;
    float _1236 = -_1216;
    float _1238 = -_1220;
    float _1240 = fma(_1096, _1236, _1238);
    float _1242 = -_1216;
    float _1244 = _1094 * _1242;
    float _1246 = fma(_1224, _1224, _1210);
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1248;
    float _1252 = in.m_59.y;
    float _1254 = fma(_1124, _1180, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1256 = -_1234;
    float _1258 = -_1244;
    float _1260 = fma(_1108, _1256, _1258);
    float _1262 = -_1234;
    float _1264 = _1096 * _1262;
    float _1266 = in.m_59.x;
    float _1268 = _1240 * _1240;
    float _1270 = sqrt(_1246);
    float _1272 = -_1200;
    float _1274 = -_1264;
    float _1276 = fma(_1094, _1272, _1274);
    float _1278 = _1246;
    if (_1092)
    {
        bool _1280 = _1140 > 0.5;
        _1184 = _1280;
    }
    bool _1282 = _1184;
    float _1284 = fma(_1260, _1260, _1268);
    float _1286 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1288 = fma(_1178, _1180, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1290 = fma(_1250, _1180, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1292 = fma(_1276, _1276, _1284);
    float _1294 = _998 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1296 = _1158 ? as_type<float>(_1162) : _1064;
    float _1298 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1102);
    float _1300 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1100);
    bool _1302 = _1032 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1304 = isnan(_1032);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1310 = _1306 || _1308;
    float _1312 = float(_1310);
    float _1314 = rsqrt(_1292);
    bool _1316 = _1032 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1318 = isnan(_1032);
    bool _1320 = _1316 || _1318;
    bool _1322 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1324 = _1320 || _1322;
    float _1326 = float(_1324);
    float _1328 = in.m_61.x;
    float _1330 = _1114 * _1270;
    float _1332 = -_1312;
    float _1334 = _1332 + 1.0;
    float _1336 = _1296;
    if (!_1128)
    {
        _1278 = _1252;
    }
    float _1338 = _1278;
    float _1340 = _1294 * _1330;
    float _1342 = _1286 * _1266;
    float _1344 = _1338;
    if (_1120)
    {
        bool _1346 = _1266 > 0.5;
        _1186 = _1346;
    }
    bool _1348 = _1186;
    float _1350 = _1340 * _1300;
    if (_1128)
    {
        _1344 = _1266;
    }
    float _1352 = _1344;
    float _1354 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1356 = _1146 * _1330;
    float _1358 = trunc(_1342);
    int _1360 = int(_1358);
    float _1362 = _1240 * _1314;
    float _1364 = _1276 * _1314;
    float _1366 = _1356 * _1298;
    float _1368 = _1354 * _1330;
    float _1370 = _1260 * _1314;
    float _1372 = _1094 * _1364;
    float _1374 = _1096 * _1362;
    float _1376 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1378 = _1366 * _1096;
    float _1380 = _1366 * _1108;
    float _1382 = _1368 * _1174;
    float _1384 = -_1372;
    float _1386 = fma(_1108, _1362, _1384);
    float _1388 = -_1374;
    float _1390 = fma(_1094, _1370, _1388);
    float _1392 = fma(_1350, _1370, _1378);
    float _1394 = fma(_1350, _1364, _1380);
    float _1396 = -_1326;
    float _1398 = _1396 + 1.0;
    int _1400 = _1360 << 4;
    int _1402 = _1400 + 1968;
    float _1404 = fma(_1382, _1386, _1392);
    float _1406 = fma(_1382, _1390, _1394);
    float _1408 = _1312 * _1398;
    float _1410 = _1368;
    int _1412 = as_type<int>(_1408);
    if (!_1128)
    {
        float _1414 = in.m_59.z;
        _1410 = _1414;
    }
    float _1416 = _1410;
    float _1418 = _1066 + _1404;
    float _1420 = _1062 + _1406;
    float _1422 = _1376 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    uint _1425 = uint(int(uint(_1402) >> uint(2)));
    uint _1427 = uint(int(uint(int(_1425)) >> uint(2)));
    int _1429 = int(_1425) & 3;
    float _1431 = (*spvDescriptorSet0.vp_c9)._m0[int(_1427)][_1429];
    int _1433 = int(_1425) + 1;
    uint _1435 = uint(int(uint(_1433) >> uint(2)));
    int _1437 = _1433 & 3;
    float _1439 = (*spvDescriptorSet0.vp_c9)._m0[int(_1435)][_1437];
    float _1441 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1443 = _1418 + _1441;
    float _1445 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1447 = _1420 + _1445;
    float _1449 = fma(_1422, _1296, -0.5);
    float _1451 = _1288 * _1408;
    float _1453 = _1443 * _1443;
    float _1455 = _1447 * _1447;
    float _1457 = _1254 * _1408;
    int _1459 = _1402 + 8;
    uint _1461 = uint(int(uint(_1459) >> uint(2)));
    uint _1463 = uint(int(uint(int(_1461)) >> uint(2)));
    int _1465 = int(_1461) & 3;
    float _1467 = (*spvDescriptorSet0.vp_c9)._m0[int(_1463)][_1465];
    float _1469 = _1290 * _1408;
    float _1471 = _1453 + _1455;
    float _1473 = _1328;
    float _1475 = _1453;
    float _1477 = _1455;
    float _1479 = _1418;
    float _1481 = _1420;
    if (_1120)
    {
        float _1483 = -_1328;
        float _1485 = _1483 + 1.0;
        _1412 = as_type<int>(_1485);
    }
    int _1487 = _1412;
    if (!_1120)
    {
        _1206 = _1328;
    }
    float _1489 = _1206;
    float _1491 = _1366 * _1094;
    float _1493 = sqrt(_1471);
    float _1495 = _1108 * _1370;
    float _1497 = _1489;
    if (_1120)
    {
        float _1499 = _1348 ? as_type<float>(_1487) : _1328;
        _1497 = _1499;
    }
    float _1501 = _1497;
    float _1503 = fma(_1350, _1362, _1491);
    float _1505 = -_1495;
    float _1507 = fma(_1096, _1364, _1505);
    float _1509 = _1416;
    if (!_1128)
    {
        _1336 = _1416;
    }
    float _1511 = _1336;
    int _1513 = 0;
    float _1515 = _1511;
    if (_1092)
    {
        float _1517 = -_1328;
        float _1519 = _1517 + 1.0;
        _1513 = as_type<int>(_1519);
    }
    int _1521 = _1513;
    if (_1128)
    {
        _1515 = _1252;
    }
    float _1523 = _1515;
    float _1525 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_1128)
    {
        _1509 = _1252;
    }
    float _1527 = _1509;
    float _1529 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1457);
    bool _1531 = _1252 > 0.5;
    float _1533 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1525);
    float _1535 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1469);
    float _1537 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1539 = _1493 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1541 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1543 = fma(_1382, _1507, _1503);
    float _1545 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1451);
    if (_1092)
    {
        float _1547 = _1282 ? as_type<float>(_1521) : _1328;
        _1473 = _1547;
    }
    float _1549 = _1473;
    float _1551 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1553 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1555 = _1060 + _1543;
    float _1557 = -_1551;
    float _1559 = fma(_1541, 2.0, _1557);
    float _1561 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1553);
    bool _1563 = !_1539;
    float _1565 = _1555;
    if (!_1563)
    {
        float _1567 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1569 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1571 = _1493 + _1569;
        float _1573 = rsqrt(_1471);
        float _1575 = _1571 * _1567;
        float _1577 = _1555 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1579 = _1575 * 0.15915493667125701904296875;
        float _1581 = _1579 * 6.283185482025146484375;
        float _1583 = sin(_1581);
        float _1585 = _1579 * 6.283185482025146484375;
        float _1587 = cos(_1585);
        float _1589 = fma(_1583, _1577, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1591 = _1573 * _1589;
        float _1593 = _1587 + (-1.0);
        float _1595 = fma(_1443, _1591, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1597 = fma(_1447, _1591, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1599 = _1593 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1601 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1603 = _1595 + _1601;
        float _1605 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1607 = _1597 + _1605;
        float _1609 = fma(_1555, _1587, _1599);
        float _1611 = _1603 * _1603;
        float _1613 = _1607 * _1607;
        _1565 = _1609;
        _1475 = _1611;
        _1477 = _1613;
        _1479 = _1595;
        _1481 = _1597;
    }
    float _1615 = _1565;
    float _1617 = _1475;
    float _1619 = _1477;
    float _1621 = _1479;
    float _1623 = _1481;
    float _1625 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1627 = _1523 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1629 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1631 = _1615 + _1629;
    float _1633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1635 = _1537 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1637 = fma(_1627, -2.0, _1625);
    float _1639 = fma(_1631, _1631, _1617);
    float _1641 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1561);
    float _1643 = fma(_1635, _1549, -0.5);
    float _1645 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1637);
    if (_1166)
    {
        float _1647 = _1531 ? _1154 : _1064;
        _1134 = _1647;
    }
    float _1649 = _1134;
    float _1651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1653 = _1639 + _1619;
    float _1655 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1533);
    float _1657 = -_128;
    float _1659 = fma(_1657, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1559);
    float _1661 = -_1645;
    float _1663 = fma(_1641, _1449, _1661);
    float _1665 = _1501 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1667 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1529);
    float _1669 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1545);
    float _1671 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1535);
    float _1673 = fma(_1655, _1643, _1659);
    float _1675 = _1431 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1677 = _1649 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1679 = sqrt(_1653);
    float _1681 = _1439 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1683 = _1665 * _1633;
    float _1685 = _1467 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1687 = _1667 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1689 = _1669 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1691 = _1671 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1693 = _1675 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1695 = _1681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1697 = _1677 * _1651;
    float _1699 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1701 = _1685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1703 = _1687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1705 = _1689 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1707 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1709 = _1673 + 0.5;
    float _1711 = _1663 + 0.5;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    bool _1713 = _1679 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1715 = isnan(_1679);
    bool _1717 = _1713 || _1715;
    bool _1719 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1721 = _1717 || _1719;
    out.m_67.x = _1693;
    out.m_67.y = _1695;
    out.m_67.z = _1701;
    out.m_69.x = _1703;
    out.m_69.y = _1705;
    out.m_69.z = _1707;
    out.m_69.w = _1699;
    out.m_71.x = _1683;
    out.m_71.y = _1697;
    out.m_71.z = _1709;
    out.m_71.w = _1711;
    float _1723 = _1671;
    float _1725 = _1707;
    if (!_1721)
    {
        _1723 = 1.0;
    }
    float _1727 = _1723;
    bool _1729 = !_1721;
    float _1731 = _1727;
    if (!_1729)
    {
        bool _1733 = _1679 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1735 = isnan(_1679);
        bool _1737 = _1733 || _1735;
        bool _1739 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1741 = _1737 || _1739;
        if (!_1741)
        {
            float _1743 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1745 = _1679 + _1743;
            float _1747 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1749 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1747;
            float _1751 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1753 = _1751 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1755 = 1.0 / _1749;
            float _1757 = _1745 * _1755;
            float _1759 = fma(_1757, _1753, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1731 = _1759;
            _1761 = true;
        }
        else
        {
            bool _1763 = _1679 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1765 = isnan(_1679);
            bool _1767 = _1763 || _1765;
            bool _1769 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1771 = _1767 || _1769;
            if (!_1771)
            {
                float _1773 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1775 = _1679 + _1773;
                float _1777 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1779 = _1777 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1781 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1783 = _1781 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1785 = 1.0 / _1779;
                float _1787 = _1775 * _1785;
                float _1789 = fma(_1787, _1783, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1731 = _1789;
                _1761 = true;
            }
            else
            {
                _1731 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1761 = false;
    float _1791 = _1731;
    float _1793 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1795 = _1615 + _1793;
    float _1797 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1799 = _1621 + _1797;
    float _1801 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1803 = _1623 + _1801;
    float _1805 = fma(_1795, _1791, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1807 = fma(_1799, _1791, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1809 = fma(_1803, _1791, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1811 = -_1060;
    float _1813 = _1811 + _1805;
    float _1815 = -_1066;
    float _1817 = _1815 + _1807;
    float _1819 = -_1062;
    float _1821 = _1819 + _1809;
    float _1823 = _1813 * _1813;
    float _1825 = fma(_1817, _1817, _1823);
    float _1827 = fma(_1821, _1821, _1825);
    float _1829 = sqrt(_1827);
    bool _1831 = _1829 > 0.0;
    bool _1833 = !_1831;
    float _1835 = _1823;
    float _1837 = _1829;
    float _1839 = _1807;
    float _1841 = _1805;
    float _1843 = _1809;
    if (!_1833)
    {
        bool _1845 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1847 = _1697;
        if (_1845)
        {
            float _1849 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1847 = _1849;
        }
        float _1851 = _1847;
        if (_1845)
        {
            float _1853 = _1851 * _812;
            _1835 = _1853;
        }
        float _1855 = _1835;
        float _1857 = _1855;
        if (_1845)
        {
            float _1859 = _1851 * _810;
            _1725 = _1859;
        }
        float _1861 = _1725;
        float _1863 = _1861;
        if (_1845)
        {
            float _1865 = _1851 * _814;
            _1837 = _1865;
        }
        float _1867 = _1837;
        float _1869 = _1867;
        if (!_1845)
        {
            float _1871 = _128 + 1.0;
            if (!_172)
            {
                float _1873 = _1871 * _1871;
                float _1875 = _1873 * 0.5;
                _130 = _1875;
            }
            float _1877 = _130;
            float _1879 = _1877;
            if (!_172)
            {
                float _1881 = _1877 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1879 = _1881;
            }
            float _1883 = _1879;
            bool _1885 = !_172;
            float _1887 = _1883;
            if (!_1885)
            {
                float _1889 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1891 = log2(_1889);
                float _1893 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1895 = _1893 + 1.0;
                float _1897 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1899 = _1891 * _1871;
                float _1901 = 1.0 / _1895;
                float _1903 = _1897 * 0.693147182464599609375;
                float _1905 = exp2(_1899);
                float _1907 = 1.0 / _1903;
                float _1909 = _1905 + (-1.0);
                float _1911 = -_1909;
                float _1913 = fma(_1911, _1907, _1871);
                float _1915 = _1913 * _1901;
                float _1917 = _1915 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1887 = _1917;
            }
            float _1919 = _1887;
            float _1921 = _1919 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _1923 = _1919 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1925 = _1919 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1927 = _1919;
            if (!_172)
            {
                _1927 = _1871;
            }
            float _1929 = _1927;
            float _1931 = _1921 * _328;
            float _1933 = _1921 * _294;
            float _1935 = _1921 * _340;
            float _1937 = fma(_1923, _324, _1931);
            float _1939 = fma(_1923, _290, _1933);
            float _1941 = fma(_1925, _332, _1937);
            bool _1943 = !_172;
            float _1945 = _1929;
            if (!_1943)
            {
                float _1947 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1949 = log2(_1947);
                float _1951 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1953 = _1951 + 1.0;
                float _1955 = 1.0 / _1953;
                float _1957 = _1949 * _1871;
                float _1959 = exp2(_1957);
                float _1961 = -_1959;
                float _1963 = _1961 + 1.0;
                float _1965 = _1963 * _1955;
                _1945 = _1965;
            }
            float _1967 = _1945;
            float _1969 = fma(_1923, _336, _1935);
            float _1971 = fma(_1925, _298, _1939);
            float _1973 = fma(_1967, _230, _1941);
            float _1975 = fma(_1925, _344, _1969);
            float _1977 = fma(_1967, _228, _1971);
            float _1979 = -_532;
            float _1981 = _1979 + _1973;
            float _1983 = fma(_1967, _232, _1975);
            float _1985 = -_538;
            float _1987 = _1985 + _1977;
            float _1989 = _1981 * _152;
            float _1991 = _1981 * _160;
            float _1993 = -_546;
            float _1995 = _1993 + _1983;
            float _1997 = _1981 * _176;
            float _1999 = fma(_1987, _150, _1989);
            float _2001 = fma(_1987, _158, _1991);
            float _2003 = fma(_1987, _174, _1997);
            float _2005 = fma(_1995, _154, _1999);
            float _2007 = fma(_1995, _162, _2001);
            float _2009 = fma(_1995, _178, _2003);
            float _2011 = _2005 * _2005;
            float _2013 = fma(_2007, _2007, _2011);
            float _2015 = fma(_2009, _2009, _2013);
            _1136 = _2015;
            _820 = _2005;
            _822 = _2007;
            _824 = _2009;
            _1857 = _2007;
            _1863 = _2005;
            _1869 = _2009;
        }
        float _2017 = _1136;
        float _2019 = _820;
        float _2021 = _822;
        float _2023 = _824;
        float _2025 = _1857;
        float _2027 = _1863;
        float _2029 = _1869;
        float _2031 = sqrt(_2017);
        float _2033 = rsqrt(_1827);
        bool _2035 = _2031 > 0.0;
        float _2037 = _1817 * _2033;
        float _2039 = _1813 * _2033;
        float _2041 = _1821 * _2033;
        bool _2043 = !_2035;
        if (!_2043)
        {
            float _2045 = rsqrt(_2017);
            float _2047 = _2045 * _2019;
            float _2049 = _2045 * _2021;
            float _2051 = _2039 * _2047;
            float _2053 = _2045 * _2023;
            float _2055 = fma(_2037, _2049, _2051);
            float _2057 = fma(_2041, _2053, _2055);
            float _2059 = _2057 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2061 = fma(_2025, _2059, _1807);
            float _2063 = fma(_2027, _2059, _1805);
            float _2065 = fma(_2029, _2059, _1809);
            _1839 = _2061;
            _1841 = _2063;
            _1843 = _2065;
        }
    }
    float _2067 = _1839;
    float _2069 = _1841;
    float _2071 = _1843;
    float _2073 = -_1168;
    float _2075 = fma(_2073, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2067);
    float _2077 = -_1160;
    float _2079 = fma(_2077, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2069);
    float _2081 = -_1202;
    float _2083 = fma(_2081, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2071);
    bool _2085 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2087 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2089 = _2085 || _2087;
    bool _2091 = isnan(0.5);
    bool _2093 = _2089 || _2091;
    float _2095 = _2079;
    float _2097 = _2075;
    float _2099 = _2083;
    if (!_2093)
    {
        float _2101 = -_1160;
        float _2103 = fma(_2101, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1060);
        float _2105 = -_1168;
        float _2107 = fma(_2105, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1066);
        float _2109 = -_1202;
        float _2111 = fma(_2109, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1062);
        float _2113 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2115 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2117 = _2103 + _2115;
        float _2119 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2121 = _2107 + _2119;
        float _2123 = -_1062;
        float _2125 = _2123 + _2071;
        float _2127 = -_1066;
        float _2129 = _2127 + _2067;
        float _2131 = _2117 * _2117;
        float _2133 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2135 = _2111 + _2133;
        float _2137 = -_1060;
        float _2139 = _2137 + _2069;
        float _2141 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2143 = fma(_2121, _2121, _2131);
        float _2145 = fma(_2135, _2135, _2143);
        float _2147 = 1.0 / _1330;
        float _2149 = sqrt(_2145);
        float _2151 = _2141 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2153 = precise::min(_2149, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2155 = _2153 * _2113;
        float _2157 = _2155 * _2147;
        float _2159 = _2151 * _2157;
        float _2161 = _2125 * _2157;
        float _2163 = fma(_2129, _2159, _2107);
        float _2165 = fma(_2139, _2159, _2103);
        float _2167 = fma(_2151, _2161, _2111);
        _2095 = _2165;
        _2097 = _2163;
        _2099 = _2167;
    }
    float _2169 = _2095;
    float _2171 = _2097;
    float _2173 = _2099;
    float _2175 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2177 = _2169 + _2175;
    float _2179 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2181 = _2171 + _2179;
    float _2183 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2185 = _2173 + _2183;
    float _2187 = _2177 * _2177;
    float _2189 = fma(_2181, _2181, _2187);
    float _2191 = fma(_2185, _2185, _2189);
    float _2193 = rsqrt(_2191);
    float _2195 = sqrt(_2191);
    float _2197 = _2193 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2199 = _2181 * _2197;
    float _2201 = _2185 * _2197;
    float _2203 = _2199 * _2199;
    float _2205 = _2201 * _2201;
    float _2207 = _2203 + _2205;
    float _2209 = sqrt(_2207);
    bool _2211 = _2209 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2215 = _2209 + _2213;
    float _2217 = _2193;
    float _2219 = _2207;
    float _2221 = _2215;
    float _2223 = _2177;
    if (_2211)
    {
        float _2225 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2217 = _2225;
    }
    float _2227 = _2217;
    if (_2211)
    {
        float _2229 = rsqrt(_2207);
        _2219 = _2229;
    }
    float _2231 = _2219;
    float _2233 = _2231;
    if (_2211)
    {
        float _2235 = _2215 * _2227;
        _2221 = _2235;
    }
    float _2237 = _2221;
    if (_2211)
    {
        float _2239 = _2237 * 0.15915493667125701904296875;
        _214 = _2239;
    }
    float _2241 = _214;
    float _2243 = _2185;
    float _2245 = _2241;
    if (_2211)
    {
        float _2247 = _2241 * 6.283185482025146484375;
        float _2249 = sin(_2247);
        _2243 = _2249;
    }
    float _2251 = _2243;
    float _2253 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2255 = precise::max(0.0, _2253);
    float _2257 = _2227;
    float _2259 = _2255;
    if (_2211)
    {
        float _2261 = _2241 * 6.283185482025146484375;
        float _2263 = cos(_2261);
        _2257 = _2263;
    }
    float _2265 = _2257;
    float _2267 = -_2197;
    float _2269 = -_2255;
    float _2271 = fma(_2177, _2267, _2269);
    if (_2211)
    {
        float _2273 = _2271 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2223 = _2273;
    }
    float _2275 = _2223;
    float _2277 = _2275;
    float _2279 = _2251;
    if (_2211)
    {
        float _2281 = fma(_2251, _2275, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2277 = _2281;
    }
    float _2283 = _2277;
    float _2285 = _2283;
    if (!_2211)
    {
        _2279 = _2199;
    }
    float _2287 = _2279;
    float _2289 = _2287;
    float _2291 = _2265;
    if (_2211)
    {
        float _2293 = _2265 + (-1.0);
        _2259 = _2293;
    }
    float _2295 = _2259;
    float _2297 = _2295;
    if (_2211)
    {
        float _2299 = _2231 * _2283;
        _216 = _2299;
    }
    float _2301 = _216;
    if (!_2211)
    {
        _2285 = _2271;
    }
    float _2303 = _2285;
    float _2305 = _2303;
    if (_2211)
    {
        float _2307 = _2295 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2245 = _2307;
    }
    float _2309 = _2245;
    if (_2211)
    {
        float _2311 = _2199 * _2301;
        _2289 = _2311;
    }
    float _2313 = _2289;
    if (!_2211)
    {
        _2297 = _2201;
    }
    float _2315 = _2297;
    float _2317 = _2315;
    if (_2211)
    {
        float _2319 = _2201 * _2301;
        _2317 = _2319;
    }
    float _2321 = _2317;
    if (!_2211)
    {
        _2233 = _2203;
    }
    float _2323 = _2233;
    float _2325 = _2323;
    if (_2211)
    {
        float _2327 = fma(_2271, _2265, _2309);
        _2305 = _2327;
    }
    float _2329 = _2305;
    if (_2211)
    {
        float _2331 = _2313 * _2313;
        _2325 = _2331;
    }
    float _2333 = _2325;
    if (!_2211)
    {
        _2291 = _2205;
    }
    float _2335 = _2291;
    float _2337 = _2335;
    if (_2211)
    {
        float _2339 = _2321 * _2321;
        _2337 = _2339;
    }
    float _2341 = _2337;
    float _2343 = fma(_2329, _2329, _2333);
    float _2345 = _2343 + _2341;
    float _2347 = _2169 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2349 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2351 = fma(_2195, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2349);
    float _2353 = precise::clamp(_2351, 0.0, 1.0);
    float _2355 = _2169 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2357 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2359 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2347);
    float _2361 = rsqrt(_2345);
    float _2363 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2355);
    float _2365 = -_2353;
    float _2367 = _2365 + 1.0;
    float _2369 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2359);
    float _2371 = _2169 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2373 = _2169 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2375 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2363);
    float _2377 = _2369 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2379 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2371);
    float _2381 = fma(_2171, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2373);
    float _2383 = _2375 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2385 = _2377 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2387 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2379);
    float _2389 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2381);
    float _2391 = abs(_2367);
    float _2393 = log2(_2391);
    float _2395 = -_2385;
    float _2397 = fma(_2395, _2357, 1.0);
    float _2399 = _2361 * _2313;
    float _2401 = _2387 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2403 = _2383 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2405 = _2361 * _2329;
    float _2407 = _2361 * _2321;
    float _2409 = _2389 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2411 = fma(_2401, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2403);
    float _2413 = _2399 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2415 = log2(_2397);
    float _2417 = _2383 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2419 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2411);
    float _2421 = -_2413;
    float _2423 = fma(_2405, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2421);
    float _2425 = _2405 + 1.0;
    float _2427 = fma(_2409, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2419);
    float _2429 = -_2407;
    float _2431 = fma(_2429, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2423);
    float _2433 = _2393 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2435 = _2383 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2437 = 1.0 / _2427;
    float _2439 = fma(_2431, -0.5, 0.5);
    float _2441 = fma(_2431, 0.5, 0.5);
    float _2443 = fma(_2401, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2435);
    float _2445 = fma(_2401, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2417);
    float _2447 = fma(_2441, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2449 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2443);
    float _2451 = exp2(_2433);
    float _2453 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2445);
    float _2455 = fma(_2441, _2447, -0.212114393711090087890625);
    float _2457 = fma(_2409, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2449);
    float _2459 = fma(_2409, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2453);
    float _2461 = _2415 * 0.693147182464599609375;
    float _2463 = fma(_2441, _2455, 1.570728778839111328125);
    float _2465 = sqrt(_2439);
    float _2467 = _2457 * _2437;
    float _2469 = _2459 * _2437;
    float _2471 = _2461 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2473 = fma(_2467, 0.5, 0.5);
    float _2475 = fma(_2469, -0.5, 0.5);
    float _2477 = -_2405;
    float _2479 = fma(_2451, _2425, _2477);
    float3 _6398 = float3(_2473, _2475, _2471);
    float _2481 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6398, float3(0.0), isnan(_6398)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6398, float3(0.0), isnan(_6398)), level(0.0)).x;
    float3 _6409 = float3(_2473, _2475, _2471);
    float4 _2484 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6409, float3(0.0), isnan(_6409)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6409, float3(0.0), isnan(_6409)), level(0.0)).xyzw;
    float _2486 = _2484.x;
    float _2488 = _2484.y;
    float _2490 = _2484.z;
    float _2492 = _2484.w;
    float _2494 = fma(_2479, 0.5, 0.5);
    float _2496 = _2465 * 0.636619746685028076171875;
    float _2498 = -_2463;
    float _2500 = fma(_2496, _2498, 1.0);
    float2 _6436 = float2(_2500, _2494);
    float3 _2504 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6436, float2(0.0), isnan(_6436)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6436, float2(0.0), isnan(_6436)), level(0.0)).xyz;
    float _2506 = _2504.x;
    float _2508 = _2504.y;
    float _2510 = _2504.z;
    float _2512 = _2393 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2514 = _2383 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2516 = fma(_2401, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2514);
    float _2518 = exp2(_2512);
    float _2520 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2522 = fma(_2377, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2516);
    float _2524 = fma(_2409, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2522);
    out.m_47.x = _2520;
    float _2526 = _2524 + _2427;
    out.gl_Position.x = _2457;
    out.gl_Position.y = _2459;
    out.gl_Position.z = _2524;
    out.gl_Position.w = _2427;
    float _2528 = _2526 * 0.5;
    float _2530 = -_2518;
    float _2532 = _2530 + 1.0;
    float _2534 = _2532 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.z = _2528;
    out.m_73.w = _2427;
    float _2536 = _2534 * _2481;
    float _2538 = -_2534;
    float _2540 = _2538 + 1.0;
    float _2542 = _2492 * _2536;
    float _2544 = _2492 * _2540;
    float _2546 = _2510 * _2536;
    float _2548 = fma(_2506, _2542, _2486);
    float _2550 = fma(_2508, _2542, _2488);
    float _2552 = fma(_2492, _2546, _2490);
    out.m_75.x = _2548;
    out.m_75.y = _2550;
    out.m_75.z = _2552;
    out.m_75.w = _2544;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

