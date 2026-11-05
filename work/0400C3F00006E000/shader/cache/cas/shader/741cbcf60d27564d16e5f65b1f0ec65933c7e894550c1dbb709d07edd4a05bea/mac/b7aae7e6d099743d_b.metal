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
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_59 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_75 [[user(locn2)]];
    float4 m_83 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_71 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_81 [[user(locn7)]];
    float4 m_69 [[user(locn8)]];
    float4 m_85 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_51 [[attribute(1)]];
    float4 m_49 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_73 [[attribute(7)]];
    float4 m_63 [[attribute(8)]];
    float4 m_57 [[attribute(9)]];
    float4 m_55 [[attribute(10)]];
    float4 m_65 [[attribute(12)]];
    float4 m_67 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _989 = false;
    bool _784 = false;
    bool _612 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_42.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_45.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2755 = as_type<float>(_120);
        out.gl_Position.z = _2755;
    }
    if (!_108)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _124 = in.m_47.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = 0.0;
    float _142 = _138;
    if (_134)
    {
        float _144 = float(_104);
        _114 = _144;
    }
    float _146 = _114;
    bool _148 = _138 >= _146;
    bool _150 = !_134;
    bool _152 = _148 || _150;
    float _154 = _146;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_45.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _122 = as_type<int>(_158);
    }
    int _160 = _122;
    float _162 = as_type<float>(_160);
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2827 = as_type<float>(_160);
        out.gl_Position.z = _2827;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _164 = in.m_49.y;
    float _166 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _168 = in.m_51.y;
    bool _170 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _172 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _174 = _170 || _172;
    bool _176 = isnan(1.0);
    bool _178 = _174 || _176;
    float _180 = in.m_53.y;
    float _182 = in.m_49.z;
    float _184 = in.m_51.z;
    float _186 = _166;
    if (!_178)
    {
        float _188 = _166 * _166;
        float _190 = _188 * 0.5;
        _162 = _190;
    }
    float _192 = _162;
    float _194 = 0.0;
    float _196 = _192;
    if (!_178)
    {
        float _198 = _138 * _138;
        float _200 = _198 * 0.5;
        _194 = _200;
    }
    float _202 = _194;
    float _204 = in.m_53.z;
    if (!_178)
    {
        float _206 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _206;
    }
    float _208 = _196;
    float _210 = _164 * _164;
    float _212 = fma(_168, _168, _210);
    float _214 = fma(_180, _180, _212);
    float _216 = in.m_47.x;
    float _218 = in.m_47.y;
    float _220 = in.m_47.z;
    float _222 = sqrt(_214);
    bool _224 = _222 > 0.0;
    float _226 = _182 * _182;
    float _228 = fma(_184, _184, _226);
    bool _230 = !_178;
    float _232 = _208;
    float _234 = _228;
    if (!_230)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _246 = _166 * _238;
        float _248 = 1.0 / _242;
        float _250 = _244 * 0.693147182464599609375;
        float _252 = exp2(_246);
        float _254 = 1.0 / _250;
        float _256 = _252 + (-1.0);
        float _258 = -_256;
        float _260 = fma(_258, _254, _166);
        float _262 = _260 * _248;
        float _264 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _140 = _254;
        _232 = _264;
    }
    float _266 = _140;
    float _268 = _232;
    bool _270 = !_178;
    float _272 = _266;
    if (!_270)
    {
        float _274 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _276 = log2(_274);
        float _278 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _280 = _278 + 1.0;
        float _282 = 1.0 / _280;
        float _284 = _166 * _276;
        float _286 = exp2(_284);
        float _288 = -_286;
        float _290 = _288 + 1.0;
        float _292 = _290 * _282;
        _272 = _280;
        _186 = _292;
    }
    float _294 = _272;
    float _296 = _186;
    float _298 = fma(_204, _204, _228);
    float _300 = _294;
    if (!_178)
    {
        _300 = _138;
    }
    float _302 = _300;
    float _304 = _302;
    if (!_178)
    {
        float _306 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _234 = _306;
    }
    float _308 = _234;
    bool _310 = !_178;
    float _312 = _308;
    if (!_310)
    {
        float _314 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _316 = log2(_314);
        float _318 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _320 = _318 + 1.0;
        float _322 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _324 = _138 * _316;
        float _326 = 1.0 / _320;
        float _328 = _322 * 0.693147182464599609375;
        float _330 = exp2(_324);
        float _332 = 1.0 / _328;
        float _334 = _330 + (-1.0);
        float _336 = -_334;
        float _338 = fma(_336, _332, _138);
        float _340 = _338 * _326;
        float _342 = _340 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _312 = _342;
    }
    float _344 = _312;
    bool _346 = !_178;
    if (!_346)
    {
        float _348 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _350 = log2(_348);
        float _352 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _354 = _352 + 1.0;
        float _356 = 1.0 / _354;
        float _358 = _138 * _350;
        float _360 = exp2(_358);
        float _362 = -_360;
        float _364 = _362 + 1.0;
        float _366 = _364 * _356;
        _304 = _366;
    }
    float _368 = _304;
    float _370 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _372 = _344 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _374 = sqrt(_298);
    float _376 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _378 = fma(_296, _218, _370);
    float _380 = _344 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _382 = fma(_368, _218, _372);
    float _384 = fma(_296, _216, _376);
    float _386 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _388 = _344 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _390 = fma(_368, _216, _380);
    float _392 = -_382;
    float _394 = _378 + _392;
    float _396 = fma(_296, _220, _386);
    float _398 = fma(_368, _220, _388);
    float _400 = -_390;
    float _402 = _384 + _400;
    float _404 = _394 * _394;
    float _406 = in.m_49.x;
    float _408 = -_398;
    float _410 = _396 + _408;
    bool _412 = _374 > 0.0;
    float _414 = fma(_402, _402, _404);
    float _416 = in.m_51.x;
    float _418 = 0.0;
    float _420 = _382;
    float _422 = _414;
    float _424 = _388;
    float _426 = _372;
    if (_224)
    {
        float _428 = rsqrt(_214);
        _418 = _428;
    }
    float _430 = _418;
    if (!_224)
    {
        _420 = 0.0;
    }
    float _432 = _420;
    float _434 = fma(_410, _410, _414);
    float _436 = in.m_53.x;
    float _438 = _432;
    if (!_224)
    {
        _422 = 0.0;
    }
    float _440 = _422;
    float _442 = _394 * _164;
    float _444 = _440;
    if (!_224)
    {
        _424 = 0.0;
    }
    float _446 = _424;
    float _448 = in.m_55.w;
    float _450 = sqrt(_434);
    float _452 = _394 * _180;
    float _454 = _446;
    if (!_412)
    {
        _426 = 0.0;
    }
    float _456 = _426;
    float _458 = in.m_42.x;
    float _460 = in.m_42.y;
    float _462 = in.m_42.z;
    float _464 = 0.0;
    float _466 = _456;
    if (_412)
    {
        float _468 = rsqrt(_298);
        _464 = _468;
    }
    float _470 = _464;
    float _472 = _430;
    if (_224)
    {
        float _474 = _430 * _168;
        _438 = _474;
    }
    float _476 = _438;
    float _478 = _476;
    if (_224)
    {
        float _480 = _430 * _164;
        _444 = _480;
    }
    float _482 = _444;
    float _484 = _482;
    if (_224)
    {
        float _486 = _430 * _180;
        _454 = _486;
    }
    float _488 = _454;
    float _490 = fma(_402, _406, _442);
    float _492 = _490;
    float _494 = _488;
    if (!_412)
    {
        _472 = 0.0;
    }
    float _496 = _472;
    bool _498 = _450 >= 9.9999999747524270787835121154785e-07;
    bool _500 = isnan(_450);
    bool _502 = _498 || _500;
    bool _504 = isnan(9.9999999747524270787835121154785e-07);
    bool _506 = _502 || _504;
    float _508 = _394 * _168;
    float _510 = _450;
    float _512 = _496;
    if (!_412)
    {
        _510 = 0.0;
    }
    float _514 = _510;
    float _516 = fma(_402, _436, _452);
    float _518 = fma(_402, _416, _508);
    float _520 = fma(_410, _204, _516);
    float _522 = _470;
    float _524 = _514;
    float _526 = _516;
    if (_412)
    {
        float _528 = _470 * 0.001000000047497451305389404296875;
        _522 = _528;
    }
    float _530 = _522;
    float _532 = fma(_410, _184, _518);
    float _534 = fma(_384, _448, _458);
    if (_412)
    {
        float _536 = _184 * _530;
        _512 = _536;
    }
    float _538 = _512;
    if (_412)
    {
        float _540 = _182 * _530;
        _524 = _540;
    }
    float _542 = _524;
    if (_412)
    {
        float _544 = _204 * _530;
        _466 = _544;
    }
    float _546 = _466;
    float _548 = fma(_410, _182, _490);
    float _550 = fma(_378, _448, _460);
    float _552 = fma(_396, _448, _462);
    float _554 = _548;
    if (_506)
    {
        _492 = _532;
    }
    float _556 = _492;
    float _558 = _556;
    float _560 = _556;
    if (_506)
    {
        _526 = _548;
    }
    float _562 = _526;
    float _564 = _562;
    float _566 = _562;
    if (_506)
    {
        _554 = _520;
    }
    float _568 = _554;
    float _570 = _568;
    float _572 = _568;
    if (!_506)
    {
        bool _574 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _576 = !_574;
        if (!_576)
        {
            float _578 = _164 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _580 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _582 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _584 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[16].x, _578);
            float _586 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[16].x, _580);
            float _588 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[16].x, _582);
            float _590 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[16].z, _584);
            float _592 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[16].z, _586);
            float _594 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[16].z, _588);
            float _596 = _590 * _590;
            float _598 = fma(_592, _592, _596);
            float _600 = fma(_594, _594, _598);
            float _602 = rsqrt(_600);
            float _604 = _602 * 9.9999999747524270787835121154785e-07;
            float _606 = _592 * _604;
            float _608 = _590 * _604;
            float _610 = _594 * _604;
            _566 = _608;
            _560 = _606;
            _572 = _610;
            _612 = true;
        }
        else
        {
            float _614 = _218 * _218;
            float _616 = fma(_216, _216, _614);
            float _618 = fma(_220, _220, _616);
            float _620 = sqrt(_618);
            bool _622 = _620 >= 9.9999999747524270787835121154785e-07;
            bool _624 = isnan(_620);
            bool _626 = _622 || _624;
            bool _628 = isnan(9.9999999747524270787835121154785e-07);
            bool _630 = _626 || _628;
            float _632 = _620;
            if (!_630)
            {
                float _634 = _460 * _460;
                float _636 = fma(_458, _458, _634);
                float _638 = fma(_462, _462, _636);
                float _640 = sqrt(_638);
                bool _642 = _640 >= 9.9999999747524270787835121154785e-07;
                bool _644 = isnan(_640);
                bool _646 = _642 || _644;
                bool _648 = isnan(9.9999999747524270787835121154785e-07);
                bool _650 = _646 || _648;
                float _652 = _214;
                if (!_650)
                {
                    float _654 = rsqrt(_214);
                    _652 = _654;
                }
                float _656 = _652;
                if (!_650)
                {
                    float _658 = _656 * 9.9999999747524270787835121154785e-07;
                    _632 = _658;
                }
                float _660 = _632;
                if (!_650)
                {
                    float _662 = _168 * _660;
                    _558 = _662;
                }
                float _664 = _558;
                _560 = _664;
                if (!_650)
                {
                    float _666 = _164 * _660;
                    _564 = _666;
                }
                float _668 = _564;
                _566 = _668;
                if (!_650)
                {
                    float _670 = _180 * _660;
                    _570 = _670;
                }
                float _672 = _570;
                bool _674 = !_650;
                _572 = _672;
                _612 = _674;
                if (!_612)
                {
                    float _676 = _164 * _460;
                    float _678 = _168 * _460;
                    float _680 = _180 * _460;
                    float _682 = fma(_458, _406, _676);
                    float _684 = fma(_458, _416, _678);
                    float _686 = fma(_458, _436, _680);
                    float _688 = fma(_182, _462, _682);
                    float _690 = fma(_184, _462, _684);
                    float _692 = fma(_204, _462, _686);
                    float _694 = _688 * _688;
                    float _696 = fma(_690, _690, _694);
                    float _698 = fma(_692, _692, _696);
                    float _700 = rsqrt(_698);
                    float _702 = _700 * 9.9999999747524270787835121154785e-07;
                    float _704 = _690 * _702;
                    float _706 = _688 * _702;
                    float _708 = _692 * _702;
                    _566 = _706;
                    _560 = _704;
                    _572 = _708;
                    _612 = true;
                }
            }
            else
            {
                float _710 = _164 * _218;
                float _712 = _168 * _218;
                float _714 = _180 * _218;
                float _716 = fma(_216, _406, _710);
                float _718 = fma(_216, _416, _712);
                float _720 = fma(_216, _436, _714);
                float _722 = fma(_182, _220, _716);
                float _724 = fma(_184, _220, _718);
                float _726 = fma(_204, _220, _720);
                float _728 = _722 * _722;
                float _730 = fma(_724, _724, _728);
                float _732 = fma(_726, _726, _730);
                float _734 = rsqrt(_732);
                float _736 = _734 * 9.9999999747524270787835121154785e-07;
                float _738 = _724 * _736;
                float _740 = _722 * _736;
                float _742 = _726 * _736;
                _566 = _740;
                _560 = _738;
                _572 = _742;
            }
        }
    }
    _612 = false;
    float _744 = _566;
    float _746 = _560;
    float _748 = _572;
    float _750 = in.m_57.x;
    float _752 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _754 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _756 = _752 * _750;
    float _758 = trunc(_756);
    int _760 = int(_758);
    int _762 = _760 << 4;
    int _764 = _762 + 1712;
    bool _766 = !_754;
    float _782;
    if (!_766)
    {
        float _768 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _770 = _750 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _772 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _774 = _772 * _768;
        float _776 = floor(_774);
        float _778 = -_776;
        float _780 = _774 + _778;
        _782 = _780;
        _784 = true;
    }
    else
    {
        float _786 = float(_104);
        float _788 = 1.0 / _786;
        float _790 = _138 * _788;
        _782 = _790;
    }
    _784 = false;
    float _792 = _782;
    int _794 = _764 + 8;
    uint _797 = uint(int(uint(_794) >> uint(2)));
    uint _799 = uint(int(uint(int(_797)) >> uint(2)));
    int _801 = int(_797) & 3;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[int(_799)][_801];
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _807 = _792 + _805;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _811 = _809 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _813 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _815 = isnan(_792);
    bool _817 = _813 || _815;
    bool _819 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _821 = _817 || _819;
    float _823 = float(_821);
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _827 = _825 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    uint _829 = uint(int(uint(_764) >> uint(2)));
    uint _831 = uint(int(uint(int(_829)) >> uint(2)));
    int _833 = int(_829) & 3;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[int(_831)][_833];
    int _837 = int(_829) + 1;
    uint _839 = uint(int(uint(_837) >> uint(2)));
    int _841 = _837 & 3;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[int(_839)][_841];
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _847 = _845 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _849 = 1.0 / _811;
    bool _851 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _853 = isnan(_792);
    bool _855 = _851 || _853;
    bool _857 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _859 = _855 || _857;
    float _861 = float(_859);
    float _863 = -_823;
    float _865 = _863 + 1.0;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _867;
    bool _871 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _873 = isnan(_792);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _879 = _875 || _877;
    float _881 = float(_879);
    float _883 = _861 * _865;
    float _885 = -_861;
    float _887 = _885 + 1.0;
    float _889 = 1.0 / _827;
    bool _891 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _893 = _881 * _887;
    float _895 = -_881;
    float _897 = _895 + 1.0;
    float _899 = 1.0 / _847;
    float _901 = _869 * _849;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _905 = _903 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _907 = fma(_901, _807, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _909 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _911 = isnan(_792);
    bool _913 = _909 || _911;
    bool _915 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _917 = _913 || _915;
    float _919 = float(_917);
    float _921 = _905 * _889;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _923;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _929 = _792 + _927;
    float _931 = _907 * _893;
    float _933 = -_919;
    float _935 = _933 + 1.0;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _939 = _792 + _937;
    float _941 = fma(_921, _929, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _943 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[115].x, _931);
    float _945 = _925 * _899;
    float _947 = _823 * _935;
    float _949 = fma(_941, _883, _943);
    float _951 = fma(_945, _939, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _953 = _803 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _955 = fma(_951, _947, _949);
    float _957 = _953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _959 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[118].x, _955);
    float _961 = _835 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _963 = _843 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _965 = _959 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _967 = _961 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _969 = _963 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _967;
    out.m_59.y = _969;
    out.m_59.z = _957;
    out.m_59.w = _965;
    bool _971 = !_891;
    float _987;
    if (!_971)
    {
        float _973 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _975 = _750 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _977 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[11].w, _138);
        float _979 = _977 * _973;
        float _981 = floor(_979);
        float _983 = -_981;
        float _985 = _979 + _983;
        _987 = _985;
        _989 = true;
    }
    else
    {
        float _991 = float(_104);
        float _993 = 1.0 / _991;
        float _995 = _138 * _993;
        _987 = _995;
    }
    _989 = false;
    float _997 = _987;
    float _999 = in.m_57.z;
    float _1001 = _550 * _164;
    float _1003 = _550 * _168;
    float _1005 = _550 * _180;
    float _1007 = in.m_57.y;
    float _1009 = fma(_534, _406, _1001);
    float _1011 = fma(_534, _416, _1003);
    float _1013 = fma(_534, _436, _1005);
    float _1015 = _750 * 2.0;
    float _1017 = fma(_552, _184, _1011);
    float _1019 = _750 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1021 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1023 = fma(_552, _182, _1009);
    float _1025 = -_1021;
    float _1027 = fma(_1019, 2.0, _1025);
    float _1029 = _744 * _744;
    float _1031 = fma(_552, _204, _1013);
    int _1033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1035 = _1033 != 0;
    int _1037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1039 = _1037 != 0;
    int _1041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1043 = _1041 != 0;
    float _1045 = in.m_51.w;
    float _1047 = floor(_1015);
    float _1049 = fma(_746, _746, _1029);
    float _1051 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1053 = _999 * 2.0;
    float _1055 = in.m_49.w;
    float _1057 = fma(_748, _748, _1049);
    float _1059 = _1007 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1061 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1063 = log2(_1061);
    float _1065 = in.m_53.w;
    float _1067 = _1007 + _999;
    float _1069 = fma(_1059, -2.0, _1051);
    float _1071 = _1007 * 2.0;
    float _1073 = -_138;
    float _1075 = fma(_1073, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1027);
    float _1077 = _1067 + (-1.0);
    float _1079 = floor(_1053);
    bool _1081 = _1047 > 0.0;
    bool _1083 = _1047 >= 0.0;
    bool _1085 = isnan(_1047);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan(0.0);
    bool _1091 = _1087 || _1089;
    float _1093 = rsqrt(_1057);
    float _1095 = _750 + _1007;
    float _1097 = _1063 * _138;
    float _1099 = fma(_1077, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1101 = _1023 + _1055;
    float _1103 = _1095 + (-1.0);
    float _1105 = floor(_1071);
    bool _1107 = _1079 >= 0.0;
    bool _1109 = isnan(_1079);
    bool _1111 = _1107 || _1109;
    bool _1113 = isnan(0.0);
    bool _1115 = _1111 || _1113;
    float _1117 = _1017 + _1045;
    float _1119 = _1031 + _1065;
    bool _1121 = _1079 > 0.0;
    float _1123 = exp2(_1097);
    float _1125 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1127 = _1091 ? 0 : 1;
    float _1129 = _1093 * _746;
    float _1131 = _1093 * _744;
    float _1133 = _1093 * _748;
    int _1135 = _1115 ? 0 : 1;
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1139 = _1105 > 0.0;
    float _1141 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1137);
    bool _1143 = _1105 >= 0.0;
    bool _1145 = isnan(_1105);
    bool _1147 = _1143 || _1145;
    bool _1149 = isnan(0.0);
    bool _1151 = _1147 || _1149;
    float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1155 = 1.0 + _1153;
    int _1157 = ~_1127;
    int _1159 = _1157 + 1;
    int _1161 = _1159 + 1;
    float _1163 = 1.0 / _1155;
    int _1165 = _1161;
    float _1167 = _1119;
    float _1169 = _997;
    if (!_1081)
    {
        int _1171 = ~_1127;
        int _1173 = _1171 + 1;
        _1165 = _1173;
    }
    int _1175 = _1165;
    float _1177 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1179 = !_1039;
    int _1181 = _1179 ? 0 : 1;
    float _1183 = in.m_61.x;
    float _1185 = in.m_61.y;
    float _1187 = in.m_61.z;
    bool _1189 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1191 = isnan(1.0);
    bool _1193 = _1189 || _1191;
    bool _1195 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1197 = _1193 || _1195;
    float _1199 = -_1123;
    float _1201 = _1199 + 1.0;
    int _1203 = abs(_1181);
    float _1205 = fma(_1007, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1177);
    bool _1207 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1209 = isnan(0.0);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1215 = _1211 || _1213;
    float _1217 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1141);
    float _1219 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1205);
    float _1221 = float(_1175);
    float _1223 = float(_1203);
    float _1225 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1069);
    float _1227 = _1215 ? _1201 : 0.0;
    bool _1229 = !_1035;
    int _1231 = _1229 ? 0 : 1;
    float _1233 = _1223 * _1221;
    int _1235 = _1151 ? 0 : 1;
    if (_1197)
    {
        float _1237 = _1227 * _1163;
        _142 = _1237;
    }
    float _1239 = _142;
    int _1241 = ~_1135;
    int _1243 = _1241 + 1;
    int _1245 = _1243 + 1;
    float _1247 = _1233 * (-2.0);
    int _1249 = _1245;
    if (!_1121)
    {
        int _1251 = ~_1135;
        int _1253 = _1251 + 1;
        _1249 = _1253;
    }
    int _1255 = _1249;
    int _1257 = abs(_1231);
    float _1259 = fma(_1247, _1185, _1185);
    int _1261 = ~_1235;
    int _1263 = _1261 + 1;
    int _1265 = _1263 + 1;
    float _1267 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1269 = _1101 + _1267;
    int _1271 = _1265;
    if (!_1139)
    {
        int _1273 = ~_1235;
        int _1275 = _1273 + 1;
        _1271 = _1275;
    }
    int _1277 = _1271;
    float _1279 = fma(_1099, _1247, _1099);
    float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1283 = _1117 + _1281;
    float _1285 = _1269 * _1269;
    float _1287 = _1007 + (-0.5);
    bool _1289 = !_1043;
    int _1291 = _1289 ? 0 : 1;
    float _1293 = float(_1257);
    float _1295 = fma(_1283, _1283, _1285);
    float _1297 = float(_1255);
    float _1299 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1301 = _1119 + _1299;
    float _1303 = fma(_1287, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1259);
    int _1305 = abs(_1291);
    float _1307 = _1293 * _1297;
    float _1309 = fma(_1301, _1301, _1295);
    float _1311 = _1131 * _482;
    float _1313 = fma(_1279, _1239, _1303);
    float _1315 = _1307 * (-2.0);
    float _1317 = fma(_1129, _476, _1311);
    float _1319 = _1313 * 0.15915493667125701904296875;
    float _1321 = _750 + (-0.5);
    float _1323 = float(_1305);
    float _1325 = fma(_1315, _1183, _1183);
    float _1327 = float(_1277);
    float _1329 = fma(_1133, _488, _1317);
    float _1331 = rsqrt(_1309);
    float _1333 = _750 + _999;
    float _1335 = fma(_1125, _1315, _1125);
    float _1337 = fma(_1321, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1325);
    float _1339 = _1323 * _1327;
    float _1341 = abs(_1329);
    bool _1343 = _1341 > 0.99989998340606689453125;
    float _1345 = _1333 + (-1.0);
    float _1347 = fma(_1335, _1239, _1337);
    float _1349 = _1339 * (-2.0);
    float _1351 = _999 + (-0.5);
    float _1353 = _1319 * 6.283185482025146484375;
    float _1355 = sin(_1353);
    float _1357 = fma(_1345, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1359 = _1347 * 0.15915493667125701904296875;
    float _1361 = fma(_1349, _1187, _1187);
    bool _1363 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1365 = isnan(0.5);
    bool _1367 = _1363 || _1365;
    bool _1369 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1371 = _1367 || _1369;
    float _1373 = fma(_1357, _1349, _1357);
    float _1375 = _1269 * _1331;
    float _1377 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1361);
    if (_1343)
    {
        float _1379 = _476 + _538;
        _478 = _1379;
    }
    float _1381 = _478;
    if (_1343)
    {
        float _1383 = _488 + _546;
        _494 = _1383;
    }
    float _1385 = _494;
    float _1387 = -_1375;
    float _1389 = fma(_1387, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1269);
    float _1391 = fma(_1373, _1239, _1377);
    if (_1343)
    {
        float _1393 = _482 + _542;
        _484 = _1393;
    }
    float _1395 = _484;
    float _1397 = _1319 * 6.283185482025146484375;
    float _1399 = cos(_1397);
    float _1401 = -_1385;
    float _1403 = _1131 * _1401;
    float _1405 = _1391 * 0.15915493667125701904296875;
    float _1407 = _1389 * _1389;
    float _1409 = -_1381;
    float _1411 = _1133 * _1409;
    float _1413 = -_1395;
    float _1415 = -_1403;
    float _1417 = fma(_1133, _1413, _1415);
    float _1419 = in.m_55.x;
    float _1421 = in.m_55.y;
    float _1423 = in.m_55.z;
    float _1425 = _1301 * _1331;
    float _1427 = -_1385;
    float _1429 = -_1411;
    float _1431 = fma(_1129, _1427, _1429);
    float _1433 = _1283 * _1331;
    float _1435 = -_1395;
    float _1437 = _1129 * _1435;
    float _1439 = -_1425;
    float _1441 = fma(_1439, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1301);
    float _1443 = _1431 * _1431;
    float _1445 = -_1433;
    float _1447 = fma(_1445, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1283);
    float _1449 = -_1381;
    float _1451 = -_1437;
    float _1453 = fma(_1131, _1449, _1451);
    float _1455 = _1359 * 6.283185482025146484375;
    float _1457 = sin(_1455);
    float _1459 = fma(_1417, _1417, _1443);
    float _1461 = fma(_1447, _1447, _1407);
    float _1463 = in.m_63.x;
    float _1465 = in.m_63.y;
    float _1467 = in.m_63.z;
    float _1469 = fma(_1453, _1453, _1459);
    float _1471 = fma(_1441, _1441, _1461);
    float _1473 = _1359 * 6.283185482025146484375;
    float _1475 = cos(_1473);
    float _1477 = _1419 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1479 = _1405 * 6.283185482025146484375;
    float _1481 = cos(_1479);
    float _1483 = _1421 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1485 = _1423 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1487 = _1457 * _1399;
    float _1489 = _1485 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1491 = rsqrt(_1469);
    float _1493 = _1475 * _1355;
    float _1495 = _1475 * _1399;
    float _1497 = sqrt(_1471);
    float _1499 = _1355 * _1481;
    float _1501 = _1399 * _1481;
    float _1503 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1463);
    float _1505 = _1405 * 6.283185482025146484375;
    float _1507 = sin(_1505);
    float _1509 = _1417 * _1491;
    float _1511 = _1483 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1513 = _1475 * _1481;
    float _1515 = _1431 * _1491;
    float _1517 = _1453 * _1491;
    float _1519 = _1513 * _1133;
    float _1521 = _1331 * _1497;
    float _1523 = _1457 * _1355;
    float _1525 = _1477 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1527 = _1457 * _1481;
    float _1529 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1465);
    float _1531 = _1511 * _1521;
    float _1533 = _1525 * _1521;
    float _1535 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1467);
    float _1537 = fma(_1507, _1495, _1523);
    float _1539 = _1489 * _1521;
    float _1541 = -_1493;
    float _1543 = fma(_1507, _1487, _1541);
    float _1545 = _1531 * _1529;
    float _1547 = -_1487;
    float _1549 = fma(_1507, _1493, _1547);
    float _1551 = _1539 * _1535;
    float _1553 = _1537 * _1133;
    float _1555 = _1129 * _1515;
    float _1557 = _1533 * _1503;
    float _1559 = -_1507;
    float _1561 = fma(_1559, _1517, _1519);
    float _1563 = _1549 * _1133;
    float _1565 = fma(_1501, _1517, _1553);
    float _1567 = _1513 * _1129;
    float _1569 = _1131 * _1517;
    float _1571 = -_1555;
    float _1573 = fma(_1131, _1509, _1571);
    float _1575 = fma(_1507, _1523, _1495);
    float _1577 = fma(_1499, _1517, _1563);
    float _1579 = -_1507;
    float _1581 = fma(_1579, _1509, _1567);
    float _1583 = _1537 * _1129;
    float _1585 = -_1569;
    float _1587 = fma(_1133, _1515, _1585);
    float _1589 = fma(_1543, _1573, _1565);
    float _1591 = fma(_1527, _1573, _1561);
    float _1593 = fma(_1575, _1573, _1577);
    float _1595 = _1549 * _1129;
    float _1597 = fma(_1501, _1509, _1583);
    float _1599 = fma(_1527, _1587, _1581);
    float _1601 = _1545 * _1591;
    float _1603 = fma(_1499, _1509, _1595);
    float _1605 = fma(_1543, _1587, _1597);
    float _1607 = _1545 * _1599;
    float _1609 = fma(_1557, _1589, _1601);
    float _1611 = fma(_1575, _1587, _1603);
    float _1613 = _1133 * _1509;
    float _1615 = fma(_1557, _1605, _1607);
    float _1617 = fma(_1551, _1593, _1609);
    float _1619 = _1549 * _1131;
    float _1621 = -_1613;
    float _1623 = fma(_1129, _1517, _1621);
    float _1625 = fma(_1551, _1611, _1615);
    float _1627 = _1119 + _1617;
    float _1629 = fma(_1499, _1515, _1619);
    float _1631 = _1117 + _1625;
    float _1633 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1635 = _1627 + _1633;
    float _1637 = fma(_1575, _1623, _1629);
    float _1639 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1641 = _1631 + _1639;
    float _1643 = _1635 * _1635;
    float _1645 = fma(_1641, _1641, _1643);
    float _1647 = _1513 * _1131;
    float _1649 = sqrt(_1645);
    float _1651 = -_1507;
    float _1653 = fma(_1651, _1515, _1647);
    float _1655 = _1537 * _1131;
    float _1657 = fma(_1527, _1623, _1653);
    float _1659 = fma(_1501, _1515, _1655);
    float _1661 = _1545 * _1657;
    float _1663 = fma(_1543, _1623, _1659);
    float _1665 = fma(_1557, _1663, _1661);
    float _1667 = -_1433;
    float _1669 = fma(_1667, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1117);
    bool _1671 = _1649 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1673 = fma(_1551, _1637, _1665);
    float _1675 = _1101 + _1673;
    float _1677 = _1629;
    float _1679 = _1501;
    float _1681 = _1631;
    float _1683 = _1521;
    float _1685 = _1659;
    float _1687 = _1623;
    float _1689 = _1517;
    if (!_1671)
    {
        _1677 = _1627;
    }
    float _1691 = _1677;
    float _1693 = _1691;
    if (!_1671)
    {
        _1679 = _1675;
    }
    float _1695 = _1679;
    bool _1697 = !_1671;
    float _1699 = _1695;
    if (!_1697)
    {
        float _1701 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1705 = _1649 + _1703;
        float _1707 = _1675 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1709 = rsqrt(_1645);
        float _1711 = _1705 * _1701;
        float _1713 = _1711 * 0.15915493667125701904296875;
        float _1715 = _1713 * 6.283185482025146484375;
        float _1717 = cos(_1715);
        float _1719 = _1713 * 6.283185482025146484375;
        float _1721 = sin(_1719);
        float _1723 = _1717 + (-1.0);
        float _1725 = fma(_1721, _1707, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1727 = _1723 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1729 = _1709 * _1725;
        float _1731 = fma(_1675, _1717, _1727);
        float _1733 = fma(_1641, _1729, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1735 = fma(_1635, _1729, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1681 = _1733;
        _1699 = _1731;
        _1693 = _1735;
    }
    float _1737 = _1681;
    float _1739 = _1699;
    float _1741 = _1693;
    float _1743 = -_1433;
    float _1745 = fma(_1743, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1737);
    float _1747 = -_1375;
    float _1749 = fma(_1747, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1739);
    float _1751 = -_1425;
    float _1753 = fma(_1751, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1741);
    float _1755 = -_1375;
    float _1757 = fma(_1755, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1101);
    float _1759 = -_1425;
    float _1761 = fma(_1759, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1119);
    float _1763 = _1749;
    float _1765 = _1745;
    float _1767 = _1753;
    if (!_1371)
    {
        float _1769 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1771 = _1757 + _1769;
        float _1773 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1775 = _1669 + _1773;
        float _1777 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1779 = -_1119;
        float _1781 = _1779 + _1741;
        float _1783 = _1771 * _1771;
        float _1785 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1787 = _1761 + _1785;
        float _1789 = -_1117;
        float _1791 = _1789 + _1737;
        float _1793 = -_1101;
        float _1795 = _1793 + _1739;
        float _1797 = fma(_1775, _1775, _1783);
        float _1799 = 1.0 / _1521;
        float _1801 = fma(_1787, _1787, _1797);
        float _1803 = sqrt(_1801);
        float _1805 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1807 = _1781 * _1799;
        float _1809 = _1791 * _1799;
        float _1811 = _1795 * _1799;
        bool _1813 = _1803 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1815 = isnan(_1803);
        bool _1817 = _1813 || _1815;
        bool _1819 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1821 = _1817 || _1819;
        float _1823 = precise::min(_1803, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1825 = _1823 * _1777;
        float _1827 = _1805 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1829 = _1827 * _1825;
        float _1831 = _1425;
        float _1833 = _1827;
        _1685 = _1829;
        _1687 = _1799;
        if (_1821)
        {
            float _1835 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1831 = _1835;
        }
        float _1837 = _1831;
        if (_1821)
        {
            float _1839 = precise::max(_1803, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1683 = _1839;
        }
        float _1841 = _1683;
        float _1843 = fma(_1807, _1829, _1761);
        float _1845 = fma(_1809, _1829, _1669);
        float _1847 = fma(_1811, _1829, _1757);
        float _1849 = _1841;
        float _1851 = _1845;
        float _1853 = _1847;
        if (_1821)
        {
            float _1855 = _1841 * _1837;
            _1849 = _1855;
        }
        float _1857 = _1849;
        float _1859 = _1857;
        if (_1821)
        {
            float _1861 = _1827 * _1857;
            _1859 = _1861;
        }
        float _1863 = _1859;
        if (!_1821)
        {
            _1833 = _1843;
        }
        float _1865 = _1833;
        _1767 = _1865;
        if (_1821)
        {
            float _1867 = fma(_1809, _1863, _1669);
            _1851 = _1867;
        }
        float _1869 = _1851;
        _1765 = _1869;
        if (_1821)
        {
            float _1871 = fma(_1811, _1863, _1757);
            _1853 = _1871;
        }
        float _1873 = _1853;
        _1763 = _1873;
        if (_1821)
        {
            float _1875 = fma(_1807, _1863, _1761);
            _1767 = _1875;
        }
    }
    float _1877 = _1763;
    float _1879 = _1765;
    float _1881 = _1767;
    float _1883 = _1685;
    float _1885 = _1687;
    float _1887 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1889 = _1877 + _1887;
    float _1891 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1893 = _1879 + _1891;
    float _1895 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1897 = _1881 + _1895;
    float _1899 = _1889 * _1889;
    float _1901 = fma(_1893, _1893, _1899);
    float _1903 = fma(_1897, _1897, _1901);
    float _1905 = rsqrt(_1903);
    float _1907 = sqrt(_1903);
    float _1909 = _1905 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1911 = _1893 * _1909;
    float _1913 = _1897 * _1909;
    float _1915 = _1911 * _1911;
    float _1917 = _1913 * _1913;
    float _1919 = _1915 + _1917;
    float _1921 = sqrt(_1919);
    bool _1923 = _1921 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1925 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1927 = _1921 + _1925;
    float _1929 = _1901;
    float _1931 = _1883;
    float _1933 = _1927;
    float _1935 = _1885;
    if (_1923)
    {
        float _1937 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1929 = _1937;
    }
    float _1939 = _1929;
    if (_1923)
    {
        float _1941 = rsqrt(_1919);
        _1931 = _1941;
    }
    float _1943 = _1931;
    float _1945 = _1943;
    if (_1923)
    {
        float _1947 = _1927 * _1939;
        _1933 = _1947;
    }
    float _1949 = _1933;
    if (_1923)
    {
        float _1951 = _1949 * 0.15915493667125701904296875;
        _1167 = _1951;
    }
    float _1953 = _1167;
    float _1955 = _1939;
    float _1957 = _1953;
    if (_1923)
    {
        float _1959 = _1953 * 6.283185482025146484375;
        float _1961 = sin(_1959);
        _1955 = _1961;
    }
    float _1963 = _1955;
    float _1965 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1967 = precise::max(0.0, _1965);
    float _1969 = _1101;
    float _1971 = _1967;
    if (_1923)
    {
        float _1973 = _1953 * 6.283185482025146484375;
        float _1975 = cos(_1973);
        _1969 = _1975;
    }
    float _1977 = _1969;
    float _1979 = -_1909;
    float _1981 = -_1967;
    float _1983 = fma(_1889, _1979, _1981);
    if (_1923)
    {
        float _1985 = _1983 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1971 = _1985;
    }
    float _1987 = _1971;
    float _1989 = _1987;
    if (!_1923)
    {
        _1957 = _1915;
    }
    float _1991 = _1957;
    float _1993 = _1963;
    float _1995 = _1991;
    if (_1923)
    {
        float _1997 = fma(_1963, _1987, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1993 = _1997;
    }
    float _1999 = _1993;
    float _2001 = _1999;
    float _2003 = _1977;
    if (_1923)
    {
        float _2005 = _1977 + (-1.0);
        _1989 = _2005;
    }
    float _2007 = _1989;
    float _2009 = _2007;
    if (_1923)
    {
        float _2011 = _1943 * _1999;
        _1689 = _2011;
    }
    float _2013 = _1689;
    if (!_1923)
    {
        _1945 = _1911;
    }
    float _2015 = _1945;
    float _2017 = _2015;
    if (_1923)
    {
        float _2019 = _2007 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1935 = _2019;
    }
    float _2021 = _1935;
    if (_1923)
    {
        float _2023 = _1911 * _2013;
        _2017 = _2023;
    }
    float _2025 = _2017;
    if (!_1923)
    {
        _2001 = _1983;
    }
    float _2027 = _2001;
    float _2029 = _2027;
    if (!_1923)
    {
        _2009 = _1913;
    }
    float _2031 = _2009;
    float _2033 = _2031;
    if (_1923)
    {
        float _2035 = fma(_1983, _1977, _2021);
        _2029 = _2035;
    }
    float _2037 = _2029;
    if (_1923)
    {
        float _2039 = _1913 * _2013;
        _2033 = _2039;
    }
    float _2041 = _2033;
    if (_1923)
    {
        float _2043 = _2025 * _2025;
        _1995 = _2043;
    }
    float _2045 = _1995;
    if (!_1923)
    {
        _2003 = _1917;
    }
    float _2047 = _2003;
    float _2049 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2051 = _2047;
    if (_1923)
    {
        float _2053 = _2041 * _2041;
        _2051 = _2053;
    }
    float _2055 = _2051;
    float _2057 = fma(_2037, _2037, _2045);
    float _2059 = _1877 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2061 = _2057 + _2055;
    float _2063 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2059);
    float _2065 = _1877 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2069 = fma(_1907, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2067);
    float _2071 = precise::clamp(_2069, 0.0, 1.0);
    float _2073 = _1877 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2075 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2063);
    float _2077 = rsqrt(_2061);
    float _2079 = _1877 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2081 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2065);
    float _2083 = -_2071;
    float _2085 = _2083 + 1.0;
    float _2087 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2073);
    float _2089 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2079);
    float _2091 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2081);
    float _2093 = _2075 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2095 = abs(_2085);
    float _2097 = log2(_2095);
    float _2099 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2089);
    float _2101 = _2091 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2103 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2087);
    float _2105 = _2093 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2107 = _2099 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2109 = _2101 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2111 = _2103 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2113 = _2077 * _2025;
    float _2115 = _2077 * _2041;
    float _2117 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2109);
    float _2119 = _2077 * _2037;
    float _2121 = _2113 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2123 = -_2105;
    float _2125 = fma(_2123, _2049, 1.0);
    float _2127 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2117);
    float _2129 = -_2121;
    float _2131 = fma(_2119, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2129);
    float _2133 = _2097 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2135 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2127);
    float _2137 = log2(_2125);
    float _2139 = -_2115;
    float _2141 = fma(_2139, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2131);
    float _2143 = _2101 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2145 = _2101 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2147 = fma(_2141, -0.5, 0.5);
    float _2149 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2143);
    float _2151 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2145);
    float _2153 = exp2(_2133);
    float _2155 = fma(_2141, 0.5, 0.5);
    float _2157 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2149);
    float _2159 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2151);
    float _2161 = _2119 + 1.0;
    float _2163 = fma(_2155, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2165 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2157);
    float _2167 = 1.0 / _2135;
    float _2169 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2159);
    float _2171 = fma(_2155, _2163, -0.212114393711090087890625);
    float _2173 = _2137 * 0.693147182464599609375;
    float _2175 = fma(_2155, _2171, 1.570728778839111328125);
    float _2177 = _2173 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2179 = sqrt(_2147);
    float _2181 = -_2119;
    float _2183 = fma(_2153, _2161, _2181);
    float _2185 = fma(_2183, 0.5, 0.5);
    float _2187 = _2165 * _2167;
    float _2189 = _2169 * _2167;
    float _2191 = fma(_2187, 0.5, 0.5);
    float _2193 = fma(_2189, -0.5, 0.5);
    float _2195 = _2179 * 0.636619746685028076171875;
    float _2197 = -_2175;
    float _2199 = fma(_2195, _2197, 1.0);
    float3 _5988 = float3(_2191, _2193, _2177);
    float _2201 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5988, float3(0.0), isnan(_5988)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5988, float3(0.0), isnan(_5988)), level(0.0)).x;
    float3 _5999 = float3(_2191, _2193, _2177);
    float4 _2204 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5999, float3(0.0), isnan(_5999)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5999, float3(0.0), isnan(_5999)), level(0.0)).xyzw;
    float _2206 = _2204.x;
    float _2208 = _2204.y;
    float _2210 = _2204.z;
    float _2212 = _2204.w;
    float2 _6016 = float2(_2199, _2185);
    float3 _2216 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6016, float2(0.0), isnan(_6016)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6016, float2(0.0), isnan(_6016)), level(0.0)).xyz;
    float _2218 = _2216.x;
    float _2220 = _2216.y;
    float _2222 = _2216.z;
    float _2224 = in.m_65.y;
    float _2226 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2228 = in.m_67.w;
    float _2230 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2232 = _2230 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2236 = _2234 != 0;
    float _2238 = _2097 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2240 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2242 = _2240 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2244 = _1007 > 0.5;
    float _2246 = 1.0 / _2232;
    float _2248 = _1757 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2250 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2252 = _2250 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2254 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2256 = isnan(0.5);
    bool _2258 = _2254 || _2256;
    bool _2260 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2262 = _2258 || _2260;
    float _2264 = _2101 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2268 = _2266 != 0;
    float _2270 = _2226 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2272 = 1.0 / _2252;
    bool _2274 = _750 > 0.5;
    bool _2276 = _2274 && _2268;
    float _2278 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2264);
    float _2280 = -_2224;
    float _2282 = _2280 + 1.0;
    float _2284 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2286 = _2284 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2288 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2278);
    out.m_69.y = _1877;
    float _2290 = 1.0 / _2242;
    float _2292 = _2224;
    if (_2236)
    {
        float _2294 = _2244 ? _2282 : _2224;
        _2292 = _2294;
    }
    float _2296 = _2292;
    float _2298 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2300 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2298;
    out.m_71.w = _2228;
    bool _2302 = _1465 != 0.0;
    bool _2304 = isnan(_1465);
    bool _2306 = _2302 || _2304;
    bool _2308 = isnan(0.0);
    bool _2310 = _2306 || _2308;
    float _2312 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2288);
    float _2314 = _2300 * _2246;
    float _2316 = fma(_2270, _2296, -0.5);
    bool _2318 = _1463 == 0.0;
    bool _2320 = !_2310;
    bool _2322 = _2318 && _2320;
    float _2324 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2248);
    float _2326 = _1757 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2328 = -_1225;
    float _2330 = fma(_1219, _2316, _2328);
    float _2332 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2324);
    float _2334 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2326);
    float _2336 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2338 = _997 + _2336;
    float _2340 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2342 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2340;
    float _2344 = _2332 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2346 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2334);
    float _2348 = _2286 * _2290;
    float _2350 = _2342 * _2272;
    float _2352 = 1.0 / _2344;
    float _2354 = in.m_65.x;
    float _2356 = _2346 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2358 = _997 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2360 = isnan(_997);
    bool _2362 = _2358 || _2360;
    bool _2364 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2366 = _2362 || _2364;
    float _2368 = float(_2366);
    bool _2370 = _997 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2372 = isnan(_997);
    bool _2374 = _2370 || _2372;
    bool _2376 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2378 = _2374 || _2376;
    float _2380 = float(_2378);
    float _2382 = _2356 + _2344;
    bool _2384 = _997 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2386 = isnan(_997);
    bool _2388 = _2384 || _2386;
    bool _2390 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2392 = _2388 || _2390;
    float _2394 = float(_2392);
    float _2396 = -_2368;
    float _2398 = _2396 + 1.0;
    bool _2400 = _997 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2402 = isnan(_997);
    bool _2404 = _2400 || _2402;
    bool _2406 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2408 = _2404 || _2406;
    float _2410 = float(_2408);
    float _2412 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2414 = _997 + _2412;
    bool _2416 = _1467 == 0.0;
    bool _2418 = _2416 && _2322;
    float _2420 = _2380 * _2398;
    float _2422 = -_2380;
    float _2424 = _2422 + 1.0;
    float _2426 = fma(_2314, _2338, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2428 = fma(_2348, _2414, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2430 = _2382 * _2352;
    float _2432 = _2430 * 0.5;
    float _2434 = -_2394;
    float _2436 = _2434 + 1.0;
    float _2438 = _2394 * _2424;
    float _2440 = _2414;
    float _2442 = _2432;
    float _2444 = _2426;
    if (!_2262)
    {
        _2440 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2446 = _2440;
    float _2448 = in.m_73.x;
    float _2450 = in.m_73.y;
    float _2452 = in.m_73.z;
    float _2454 = _2410 * _2436;
    float _2456 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2458 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2456);
    float _2460 = -_2410;
    float _2462 = _2460 + 1.0;
    float _2464 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2466 = _2426 * _2454;
    float _2468 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2470 = _997 + _2468;
    float _2472 = _2354;
    float _2474 = _2470;
    float _2476 = _2446;
    if (_2268)
    {
        _2442 = _2354;
    }
    float _2478 = _2442;
    float _2480 = _2478;
    if (!_2262)
    {
        float _2482 = -_2446;
        float _2484 = _2482 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2444 = _2484;
    }
    float _2486 = _2444;
    if (!_2268)
    {
        _1169 = _2354;
    }
    float _2488 = _1169;
    float _2490 = fma(_2462, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2466);
    float _2492 = _2488;
    if (!_2262)
    {
        _2472 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2494 = _2472;
    float _2496 = fma(_2350, _2470, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2498 = 1.0 / _2458;
    float _2500 = fma(_2428, _2438, _2490);
    float _2502 = _2494;
    if (_2276)
    {
        float _2504 = -_2478;
        float _2506 = _2504 + 1.0;
        _2480 = _2506;
    }
    float _2508 = _2480;
    if (!_2262)
    {
        float _2510 = -_2494;
        float _2512 = _2510 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2474 = _2512;
    }
    float _2514 = _2474;
    out.m_75.x = _1893;
    out.m_75.y = _1889;
    out.m_75.z = _1897;
    float _2516 = fma(_2496, _2420, _2500);
    float _2518 = _2516;
    if (_2268)
    {
        _2492 = _2508;
    }
    float _2520 = _2492;
    float _2522 = _2428;
    float _2524 = _2520;
    if (!_2262)
    {
        float _2526 = 1.0 / _2514;
        _2522 = _2526;
    }
    float _2528 = _2522;
    float _2530 = fma(_2368, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2516);
    if (_2262)
    {
        _2518 = 1.0;
    }
    float _2532 = _2518;
    float _2534 = _2448;
    float _2536 = _2450;
    float _2538 = _2452;
    float _2540 = _2532;
    if (!_2418)
    {
        float _2542 = fma(_1463, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2448);
        _2534 = _2542;
    }
    float _2544 = _2534;
    float _2546 = _2464 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_2418)
    {
        float _2548 = fma(_1465, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2450);
        _2536 = _2548;
    }
    float _2550 = _2536;
    if (!_2418)
    {
        float _2552 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2452);
        _2538 = _2552;
    }
    float _2554 = _2538;
    float _2556 = _2486;
    if (!_2262)
    {
        float _2558 = 1.0 / _2486;
        _2556 = _2558;
    }
    float _2560 = _2556;
    if (!_2262)
    {
        float _2562 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2564 = -_2494;
        float _2566 = fma(_2498, _2562, _2564);
        _2502 = _2566;
    }
    float _2568 = _2502;
    float _2570 = _2568;
    if (!_2262)
    {
        float _2572 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2574 = -_2446;
        float _2576 = fma(_2498, _2572, _2574);
        _2476 = _2576;
    }
    float _2578 = _2476;
    float _2580 = fma(_2546, _2520, -0.5);
    if (_2262)
    {
        _2524 = 1.0;
    }
    float _2582 = _2524;
    float _2584 = _1599 * _2550;
    float _2586 = _1657 * _2550;
    float _2588 = fma(_1217, _2580, _1075);
    float _2590 = _2582;
    if (!_2262)
    {
        float _2592 = _2568 * _2528;
        float _2594 = precise::clamp(_2592, 0.0, 1.0);
        _2570 = _2594;
    }
    float _2596 = _2570;
    float _2598 = exp2(_2238);
    float _2600 = fma(_1605, _2544, _2584);
    float _2602 = _1591 * _2550;
    if (!_2262)
    {
        float _2604 = -_2596;
        float _2606 = _2604 + 1.0;
        _2540 = _2606;
    }
    float _2608 = _2540;
    float _2610 = _2330 + 0.5;
    float _2612 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2614 = _2312 + _2612;
    float _2616 = fma(_1663, _2544, _2586);
    if (!_2262)
    {
        float _2618 = _2578 * _2560;
        float _2620 = precise::clamp(_2618, 0.0, 1.0);
        _2590 = _2620;
    }
    float _2622 = _2590;
    float _2624 = fma(_1589, _2544, _2602);
    float _2626 = _2622 * _2608;
    float _2628 = fma(_1611, _2554, _2600);
    float _2630 = fma(_1637, _2554, _2616);
    float _2632 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2634 = _2626 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2636 = -_2598;
    float _2638 = _2636 + 1.0;
    float _2640 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2642 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2644 = _2634 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2646 = _2135 + _2614;
    float _2648 = fma(_1593, _2554, _2624);
    float _2650 = _2632 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2652 = _2640 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2654 = _2646 * 0.5;
    float _2656 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2658 = _2642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2660 = _2530 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2662 = _2622 > 0.0;
    bool _2664 = isnan(_2622);
    bool _2666 = _2662 || _2664;
    bool _2668 = isnan(0.0);
    bool _2670 = _2666 || _2668;
    float _2672 = _2588 + 0.5;
    out.m_45.x = _2644;
    bool _2674 = _2608 <= 0.0;
    bool _2676 = !_2670;
    bool _2678 = _2674 || _2676;
    out.m_77.x = _2650;
    out.m_77.y = _2652;
    out.m_77.z = _2658;
    out.m_77.w = _2660;
    out.m_79.x = _2672;
    out.m_79.y = _2610;
    out.m_81.x = _2628;
    out.m_81.y = _2630;
    out.m_81.z = _2648;
    out.gl_Position.x = _2165;
    out.gl_Position.y = _2169;
    out.gl_Position.z = _2614;
    out.gl_Position.w = _2135;
    float _2680 = -_2656;
    float _2682 = _2680 + 1.0;
    out.m_83.z = _2654;
    out.m_83.w = _2135;
    float _2684 = _2656 * _2201;
    float _2686 = _2212 * _2682;
    float _2688 = _2212 * _2684;
    float _2690 = _2222 * _2684;
    float _2692 = fma(_2218, _2688, _2206);
    float _2694 = fma(_2220, _2688, _2208);
    float _2696 = fma(_2212, _2690, _2210);
    out.m_85.x = _2692;
    out.m_85.y = _2694;
    out.m_85.z = _2696;
    out.m_85.w = _2686;
    if (!_2678)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2698 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2698;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _989 = false;
    bool _784 = false;
    bool _612 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_42.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_45.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2755 = as_type<float>(_120);
        out.gl_Position.z = _2755;
    }
    if (!_108)
    {
        return out;
    }
    float _124 = in.m_47.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = 0.0;
    float _142 = _138;
    if (_134)
    {
        float _144 = float(_104);
        _114 = _144;
    }
    float _146 = _114;
    bool _148 = _138 >= _146;
    bool _150 = !_134;
    bool _152 = _148 || _150;
    float _154 = _146;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_45.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _122 = as_type<int>(_158);
    }
    int _160 = _122;
    float _162 = as_type<float>(_160);
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2827 = as_type<float>(_160);
        out.gl_Position.z = _2827;
    }
    if (_152)
    {
        return out;
    }
    float _164 = in.m_49.y;
    float _166 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _168 = in.m_51.y;
    bool _170 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _172 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _174 = _170 || _172;
    bool _176 = isnan(1.0);
    bool _178 = _174 || _176;
    float _180 = in.m_53.y;
    float _182 = in.m_49.z;
    float _184 = in.m_51.z;
    float _186 = _166;
    if (!_178)
    {
        float _188 = _166 * _166;
        float _190 = _188 * 0.5;
        _162 = _190;
    }
    float _192 = _162;
    float _194 = 0.0;
    float _196 = _192;
    if (!_178)
    {
        float _198 = _138 * _138;
        float _200 = _198 * 0.5;
        _194 = _200;
    }
    float _202 = _194;
    float _204 = in.m_53.z;
    if (!_178)
    {
        float _206 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _206;
    }
    float _208 = _196;
    float _210 = _164 * _164;
    float _212 = fma(_168, _168, _210);
    float _214 = fma(_180, _180, _212);
    float _216 = in.m_47.x;
    float _218 = in.m_47.y;
    float _220 = in.m_47.z;
    float _222 = sqrt(_214);
    bool _224 = _222 > 0.0;
    float _226 = _182 * _182;
    float _228 = fma(_184, _184, _226);
    bool _230 = !_178;
    float _232 = _208;
    float _234 = _228;
    if (!_230)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _246 = _166 * _238;
        float _248 = 1.0 / _242;
        float _250 = _244 * 0.693147182464599609375;
        float _252 = exp2(_246);
        float _254 = 1.0 / _250;
        float _256 = _252 + (-1.0);
        float _258 = -_256;
        float _260 = fma(_258, _254, _166);
        float _262 = _260 * _248;
        float _264 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _140 = _254;
        _232 = _264;
    }
    float _266 = _140;
    float _268 = _232;
    bool _270 = !_178;
    float _272 = _266;
    if (!_270)
    {
        float _274 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _276 = log2(_274);
        float _278 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _280 = _278 + 1.0;
        float _282 = 1.0 / _280;
        float _284 = _166 * _276;
        float _286 = exp2(_284);
        float _288 = -_286;
        float _290 = _288 + 1.0;
        float _292 = _290 * _282;
        _272 = _280;
        _186 = _292;
    }
    float _294 = _272;
    float _296 = _186;
    float _298 = fma(_204, _204, _228);
    float _300 = _294;
    if (!_178)
    {
        _300 = _138;
    }
    float _302 = _300;
    float _304 = _302;
    if (!_178)
    {
        float _306 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _234 = _306;
    }
    float _308 = _234;
    bool _310 = !_178;
    float _312 = _308;
    if (!_310)
    {
        float _314 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _316 = log2(_314);
        float _318 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _320 = _318 + 1.0;
        float _322 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _324 = _138 * _316;
        float _326 = 1.0 / _320;
        float _328 = _322 * 0.693147182464599609375;
        float _330 = exp2(_324);
        float _332 = 1.0 / _328;
        float _334 = _330 + (-1.0);
        float _336 = -_334;
        float _338 = fma(_336, _332, _138);
        float _340 = _338 * _326;
        float _342 = _340 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _312 = _342;
    }
    float _344 = _312;
    bool _346 = !_178;
    if (!_346)
    {
        float _348 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _350 = log2(_348);
        float _352 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _354 = _352 + 1.0;
        float _356 = 1.0 / _354;
        float _358 = _138 * _350;
        float _360 = exp2(_358);
        float _362 = -_360;
        float _364 = _362 + 1.0;
        float _366 = _364 * _356;
        _304 = _366;
    }
    float _368 = _304;
    float _370 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _372 = _344 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _374 = sqrt(_298);
    float _376 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _378 = fma(_296, _218, _370);
    float _380 = _344 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _382 = fma(_368, _218, _372);
    float _384 = fma(_296, _216, _376);
    float _386 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _388 = _344 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _390 = fma(_368, _216, _380);
    float _392 = -_382;
    float _394 = _378 + _392;
    float _396 = fma(_296, _220, _386);
    float _398 = fma(_368, _220, _388);
    float _400 = -_390;
    float _402 = _384 + _400;
    float _404 = _394 * _394;
    float _406 = in.m_49.x;
    float _408 = -_398;
    float _410 = _396 + _408;
    bool _412 = _374 > 0.0;
    float _414 = fma(_402, _402, _404);
    float _416 = in.m_51.x;
    float _418 = 0.0;
    float _420 = _382;
    float _422 = _414;
    float _424 = _388;
    float _426 = _372;
    if (_224)
    {
        float _428 = rsqrt(_214);
        _418 = _428;
    }
    float _430 = _418;
    if (!_224)
    {
        _420 = 0.0;
    }
    float _432 = _420;
    float _434 = fma(_410, _410, _414);
    float _436 = in.m_53.x;
    float _438 = _432;
    if (!_224)
    {
        _422 = 0.0;
    }
    float _440 = _422;
    float _442 = _394 * _164;
    float _444 = _440;
    if (!_224)
    {
        _424 = 0.0;
    }
    float _446 = _424;
    float _448 = in.m_55.w;
    float _450 = sqrt(_434);
    float _452 = _394 * _180;
    float _454 = _446;
    if (!_412)
    {
        _426 = 0.0;
    }
    float _456 = _426;
    float _458 = in.m_42.x;
    float _460 = in.m_42.y;
    float _462 = in.m_42.z;
    float _464 = 0.0;
    float _466 = _456;
    if (_412)
    {
        float _468 = rsqrt(_298);
        _464 = _468;
    }
    float _470 = _464;
    float _472 = _430;
    if (_224)
    {
        float _474 = _430 * _168;
        _438 = _474;
    }
    float _476 = _438;
    float _478 = _476;
    if (_224)
    {
        float _480 = _430 * _164;
        _444 = _480;
    }
    float _482 = _444;
    float _484 = _482;
    if (_224)
    {
        float _486 = _430 * _180;
        _454 = _486;
    }
    float _488 = _454;
    float _490 = fma(_402, _406, _442);
    float _492 = _490;
    float _494 = _488;
    if (!_412)
    {
        _472 = 0.0;
    }
    float _496 = _472;
    bool _498 = _450 >= 9.9999999747524270787835121154785e-07;
    bool _500 = isnan(_450);
    bool _502 = _498 || _500;
    bool _504 = isnan(9.9999999747524270787835121154785e-07);
    bool _506 = _502 || _504;
    float _508 = _394 * _168;
    float _510 = _450;
    float _512 = _496;
    if (!_412)
    {
        _510 = 0.0;
    }
    float _514 = _510;
    float _516 = fma(_402, _436, _452);
    float _518 = fma(_402, _416, _508);
    float _520 = fma(_410, _204, _516);
    float _522 = _470;
    float _524 = _514;
    float _526 = _516;
    if (_412)
    {
        float _528 = _470 * 0.001000000047497451305389404296875;
        _522 = _528;
    }
    float _530 = _522;
    float _532 = fma(_410, _184, _518);
    float _534 = fma(_384, _448, _458);
    if (_412)
    {
        float _536 = _184 * _530;
        _512 = _536;
    }
    float _538 = _512;
    if (_412)
    {
        float _540 = _182 * _530;
        _524 = _540;
    }
    float _542 = _524;
    if (_412)
    {
        float _544 = _204 * _530;
        _466 = _544;
    }
    float _546 = _466;
    float _548 = fma(_410, _182, _490);
    float _550 = fma(_378, _448, _460);
    float _552 = fma(_396, _448, _462);
    float _554 = _548;
    if (_506)
    {
        _492 = _532;
    }
    float _556 = _492;
    float _558 = _556;
    float _560 = _556;
    if (_506)
    {
        _526 = _548;
    }
    float _562 = _526;
    float _564 = _562;
    float _566 = _562;
    if (_506)
    {
        _554 = _520;
    }
    float _568 = _554;
    float _570 = _568;
    float _572 = _568;
    if (!_506)
    {
        bool _574 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _576 = !_574;
        if (!_576)
        {
            float _578 = _164 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _580 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _582 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _584 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[16].x, _578);
            float _586 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[16].x, _580);
            float _588 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[16].x, _582);
            float _590 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[16].z, _584);
            float _592 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[16].z, _586);
            float _594 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[16].z, _588);
            float _596 = _590 * _590;
            float _598 = fma(_592, _592, _596);
            float _600 = fma(_594, _594, _598);
            float _602 = rsqrt(_600);
            float _604 = _602 * 9.9999999747524270787835121154785e-07;
            float _606 = _592 * _604;
            float _608 = _590 * _604;
            float _610 = _594 * _604;
            _566 = _608;
            _560 = _606;
            _572 = _610;
            _612 = true;
        }
        else
        {
            float _614 = _218 * _218;
            float _616 = fma(_216, _216, _614);
            float _618 = fma(_220, _220, _616);
            float _620 = sqrt(_618);
            bool _622 = _620 >= 9.9999999747524270787835121154785e-07;
            bool _624 = isnan(_620);
            bool _626 = _622 || _624;
            bool _628 = isnan(9.9999999747524270787835121154785e-07);
            bool _630 = _626 || _628;
            float _632 = _620;
            if (!_630)
            {
                float _634 = _460 * _460;
                float _636 = fma(_458, _458, _634);
                float _638 = fma(_462, _462, _636);
                float _640 = sqrt(_638);
                bool _642 = _640 >= 9.9999999747524270787835121154785e-07;
                bool _644 = isnan(_640);
                bool _646 = _642 || _644;
                bool _648 = isnan(9.9999999747524270787835121154785e-07);
                bool _650 = _646 || _648;
                float _652 = _214;
                if (!_650)
                {
                    float _654 = rsqrt(_214);
                    _652 = _654;
                }
                float _656 = _652;
                if (!_650)
                {
                    float _658 = _656 * 9.9999999747524270787835121154785e-07;
                    _632 = _658;
                }
                float _660 = _632;
                if (!_650)
                {
                    float _662 = _168 * _660;
                    _558 = _662;
                }
                float _664 = _558;
                _560 = _664;
                if (!_650)
                {
                    float _666 = _164 * _660;
                    _564 = _666;
                }
                float _668 = _564;
                _566 = _668;
                if (!_650)
                {
                    float _670 = _180 * _660;
                    _570 = _670;
                }
                float _672 = _570;
                bool _674 = !_650;
                _572 = _672;
                _612 = _674;
                if (!_612)
                {
                    float _676 = _164 * _460;
                    float _678 = _168 * _460;
                    float _680 = _180 * _460;
                    float _682 = fma(_458, _406, _676);
                    float _684 = fma(_458, _416, _678);
                    float _686 = fma(_458, _436, _680);
                    float _688 = fma(_182, _462, _682);
                    float _690 = fma(_184, _462, _684);
                    float _692 = fma(_204, _462, _686);
                    float _694 = _688 * _688;
                    float _696 = fma(_690, _690, _694);
                    float _698 = fma(_692, _692, _696);
                    float _700 = rsqrt(_698);
                    float _702 = _700 * 9.9999999747524270787835121154785e-07;
                    float _704 = _690 * _702;
                    float _706 = _688 * _702;
                    float _708 = _692 * _702;
                    _566 = _706;
                    _560 = _704;
                    _572 = _708;
                    _612 = true;
                }
            }
            else
            {
                float _710 = _164 * _218;
                float _712 = _168 * _218;
                float _714 = _180 * _218;
                float _716 = fma(_216, _406, _710);
                float _718 = fma(_216, _416, _712);
                float _720 = fma(_216, _436, _714);
                float _722 = fma(_182, _220, _716);
                float _724 = fma(_184, _220, _718);
                float _726 = fma(_204, _220, _720);
                float _728 = _722 * _722;
                float _730 = fma(_724, _724, _728);
                float _732 = fma(_726, _726, _730);
                float _734 = rsqrt(_732);
                float _736 = _734 * 9.9999999747524270787835121154785e-07;
                float _738 = _724 * _736;
                float _740 = _722 * _736;
                float _742 = _726 * _736;
                _566 = _740;
                _560 = _738;
                _572 = _742;
            }
        }
    }
    _612 = false;
    float _744 = _566;
    float _746 = _560;
    float _748 = _572;
    float _750 = in.m_57.x;
    float _752 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _754 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _756 = _752 * _750;
    float _758 = trunc(_756);
    int _760 = int(_758);
    int _762 = _760 << 4;
    int _764 = _762 + 1712;
    bool _766 = !_754;
    float _782;
    if (!_766)
    {
        float _768 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _770 = _750 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _772 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _774 = _772 * _768;
        float _776 = floor(_774);
        float _778 = -_776;
        float _780 = _774 + _778;
        _782 = _780;
        _784 = true;
    }
    else
    {
        float _786 = float(_104);
        float _788 = 1.0 / _786;
        float _790 = _138 * _788;
        _782 = _790;
    }
    _784 = false;
    float _792 = _782;
    int _794 = _764 + 8;
    uint _797 = uint(int(uint(_794) >> uint(2)));
    uint _799 = uint(int(uint(int(_797)) >> uint(2)));
    int _801 = int(_797) & 3;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[int(_799)][_801];
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _807 = _792 + _805;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _811 = _809 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _813 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _815 = isnan(_792);
    bool _817 = _813 || _815;
    bool _819 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _821 = _817 || _819;
    float _823 = float(_821);
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _827 = _825 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    uint _829 = uint(int(uint(_764) >> uint(2)));
    uint _831 = uint(int(uint(int(_829)) >> uint(2)));
    int _833 = int(_829) & 3;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[int(_831)][_833];
    int _837 = int(_829) + 1;
    uint _839 = uint(int(uint(_837) >> uint(2)));
    int _841 = _837 & 3;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[int(_839)][_841];
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _847 = _845 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _849 = 1.0 / _811;
    bool _851 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _853 = isnan(_792);
    bool _855 = _851 || _853;
    bool _857 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _859 = _855 || _857;
    float _861 = float(_859);
    float _863 = -_823;
    float _865 = _863 + 1.0;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _867;
    bool _871 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _873 = isnan(_792);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _879 = _875 || _877;
    float _881 = float(_879);
    float _883 = _861 * _865;
    float _885 = -_861;
    float _887 = _885 + 1.0;
    float _889 = 1.0 / _827;
    bool _891 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _893 = _881 * _887;
    float _895 = -_881;
    float _897 = _895 + 1.0;
    float _899 = 1.0 / _847;
    float _901 = _869 * _849;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _905 = _903 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _907 = fma(_901, _807, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _909 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _911 = isnan(_792);
    bool _913 = _909 || _911;
    bool _915 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _917 = _913 || _915;
    float _919 = float(_917);
    float _921 = _905 * _889;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _923;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _929 = _792 + _927;
    float _931 = _907 * _893;
    float _933 = -_919;
    float _935 = _933 + 1.0;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _939 = _792 + _937;
    float _941 = fma(_921, _929, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _943 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[115].x, _931);
    float _945 = _925 * _899;
    float _947 = _823 * _935;
    float _949 = fma(_941, _883, _943);
    float _951 = fma(_945, _939, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _953 = _803 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _955 = fma(_951, _947, _949);
    float _957 = _953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _959 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[118].x, _955);
    float _961 = _835 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _963 = _843 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _965 = _959 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _967 = _961 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _969 = _963 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _967;
    out.m_59.y = _969;
    out.m_59.z = _957;
    out.m_59.w = _965;
    bool _971 = !_891;
    float _987;
    if (!_971)
    {
        float _973 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _975 = _750 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _977 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[11].w, _138);
        float _979 = _977 * _973;
        float _981 = floor(_979);
        float _983 = -_981;
        float _985 = _979 + _983;
        _987 = _985;
        _989 = true;
    }
    else
    {
        float _991 = float(_104);
        float _993 = 1.0 / _991;
        float _995 = _138 * _993;
        _987 = _995;
    }
    _989 = false;
    float _997 = _987;
    float _999 = in.m_57.z;
    float _1001 = _550 * _164;
    float _1003 = _550 * _168;
    float _1005 = _550 * _180;
    float _1007 = in.m_57.y;
    float _1009 = fma(_534, _406, _1001);
    float _1011 = fma(_534, _416, _1003);
    float _1013 = fma(_534, _436, _1005);
    float _1015 = _750 * 2.0;
    float _1017 = fma(_552, _184, _1011);
    float _1019 = _750 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1021 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1023 = fma(_552, _182, _1009);
    float _1025 = -_1021;
    float _1027 = fma(_1019, 2.0, _1025);
    float _1029 = _744 * _744;
    float _1031 = fma(_552, _204, _1013);
    int _1033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1035 = _1033 != 0;
    int _1037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1039 = _1037 != 0;
    int _1041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1043 = _1041 != 0;
    float _1045 = in.m_51.w;
    float _1047 = floor(_1015);
    float _1049 = fma(_746, _746, _1029);
    float _1051 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1053 = _999 * 2.0;
    float _1055 = in.m_49.w;
    float _1057 = fma(_748, _748, _1049);
    float _1059 = _1007 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1061 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1063 = log2(_1061);
    float _1065 = in.m_53.w;
    float _1067 = _1007 + _999;
    float _1069 = fma(_1059, -2.0, _1051);
    float _1071 = _1007 * 2.0;
    float _1073 = -_138;
    float _1075 = fma(_1073, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1027);
    float _1077 = _1067 + (-1.0);
    float _1079 = floor(_1053);
    bool _1081 = _1047 > 0.0;
    bool _1083 = _1047 >= 0.0;
    bool _1085 = isnan(_1047);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan(0.0);
    bool _1091 = _1087 || _1089;
    float _1093 = rsqrt(_1057);
    float _1095 = _750 + _1007;
    float _1097 = _1063 * _138;
    float _1099 = fma(_1077, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1101 = _1023 + _1055;
    float _1103 = _1095 + (-1.0);
    float _1105 = floor(_1071);
    bool _1107 = _1079 >= 0.0;
    bool _1109 = isnan(_1079);
    bool _1111 = _1107 || _1109;
    bool _1113 = isnan(0.0);
    bool _1115 = _1111 || _1113;
    float _1117 = _1017 + _1045;
    float _1119 = _1031 + _1065;
    bool _1121 = _1079 > 0.0;
    float _1123 = exp2(_1097);
    float _1125 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1127 = _1091 ? 0 : 1;
    float _1129 = _1093 * _746;
    float _1131 = _1093 * _744;
    float _1133 = _1093 * _748;
    int _1135 = _1115 ? 0 : 1;
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1139 = _1105 > 0.0;
    float _1141 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1137);
    bool _1143 = _1105 >= 0.0;
    bool _1145 = isnan(_1105);
    bool _1147 = _1143 || _1145;
    bool _1149 = isnan(0.0);
    bool _1151 = _1147 || _1149;
    float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1155 = 1.0 + _1153;
    int _1157 = ~_1127;
    int _1159 = _1157 + 1;
    int _1161 = _1159 + 1;
    float _1163 = 1.0 / _1155;
    int _1165 = _1161;
    float _1167 = _1119;
    float _1169 = _997;
    if (!_1081)
    {
        int _1171 = ~_1127;
        int _1173 = _1171 + 1;
        _1165 = _1173;
    }
    int _1175 = _1165;
    float _1177 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1179 = !_1039;
    int _1181 = _1179 ? 0 : 1;
    float _1183 = in.m_61.x;
    float _1185 = in.m_61.y;
    float _1187 = in.m_61.z;
    bool _1189 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1191 = isnan(1.0);
    bool _1193 = _1189 || _1191;
    bool _1195 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1197 = _1193 || _1195;
    float _1199 = -_1123;
    float _1201 = _1199 + 1.0;
    int _1203 = abs(_1181);
    float _1205 = fma(_1007, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1177);
    bool _1207 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1209 = isnan(0.0);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1215 = _1211 || _1213;
    float _1217 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1141);
    float _1219 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1205);
    float _1221 = float(_1175);
    float _1223 = float(_1203);
    float _1225 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1069);
    float _1227 = _1215 ? _1201 : 0.0;
    bool _1229 = !_1035;
    int _1231 = _1229 ? 0 : 1;
    float _1233 = _1223 * _1221;
    int _1235 = _1151 ? 0 : 1;
    if (_1197)
    {
        float _1237 = _1227 * _1163;
        _142 = _1237;
    }
    float _1239 = _142;
    int _1241 = ~_1135;
    int _1243 = _1241 + 1;
    int _1245 = _1243 + 1;
    float _1247 = _1233 * (-2.0);
    int _1249 = _1245;
    if (!_1121)
    {
        int _1251 = ~_1135;
        int _1253 = _1251 + 1;
        _1249 = _1253;
    }
    int _1255 = _1249;
    int _1257 = abs(_1231);
    float _1259 = fma(_1247, _1185, _1185);
    int _1261 = ~_1235;
    int _1263 = _1261 + 1;
    int _1265 = _1263 + 1;
    float _1267 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1269 = _1101 + _1267;
    int _1271 = _1265;
    if (!_1139)
    {
        int _1273 = ~_1235;
        int _1275 = _1273 + 1;
        _1271 = _1275;
    }
    int _1277 = _1271;
    float _1279 = fma(_1099, _1247, _1099);
    float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1283 = _1117 + _1281;
    float _1285 = _1269 * _1269;
    float _1287 = _1007 + (-0.5);
    bool _1289 = !_1043;
    int _1291 = _1289 ? 0 : 1;
    float _1293 = float(_1257);
    float _1295 = fma(_1283, _1283, _1285);
    float _1297 = float(_1255);
    float _1299 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1301 = _1119 + _1299;
    float _1303 = fma(_1287, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1259);
    int _1305 = abs(_1291);
    float _1307 = _1293 * _1297;
    float _1309 = fma(_1301, _1301, _1295);
    float _1311 = _1131 * _482;
    float _1313 = fma(_1279, _1239, _1303);
    float _1315 = _1307 * (-2.0);
    float _1317 = fma(_1129, _476, _1311);
    float _1319 = _1313 * 0.15915493667125701904296875;
    float _1321 = _750 + (-0.5);
    float _1323 = float(_1305);
    float _1325 = fma(_1315, _1183, _1183);
    float _1327 = float(_1277);
    float _1329 = fma(_1133, _488, _1317);
    float _1331 = rsqrt(_1309);
    float _1333 = _750 + _999;
    float _1335 = fma(_1125, _1315, _1125);
    float _1337 = fma(_1321, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1325);
    float _1339 = _1323 * _1327;
    float _1341 = abs(_1329);
    bool _1343 = _1341 > 0.99989998340606689453125;
    float _1345 = _1333 + (-1.0);
    float _1347 = fma(_1335, _1239, _1337);
    float _1349 = _1339 * (-2.0);
    float _1351 = _999 + (-0.5);
    float _1353 = _1319 * 6.283185482025146484375;
    float _1355 = sin(_1353);
    float _1357 = fma(_1345, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1359 = _1347 * 0.15915493667125701904296875;
    float _1361 = fma(_1349, _1187, _1187);
    bool _1363 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1365 = isnan(0.5);
    bool _1367 = _1363 || _1365;
    bool _1369 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1371 = _1367 || _1369;
    float _1373 = fma(_1357, _1349, _1357);
    float _1375 = _1269 * _1331;
    float _1377 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1361);
    if (_1343)
    {
        float _1379 = _476 + _538;
        _478 = _1379;
    }
    float _1381 = _478;
    if (_1343)
    {
        float _1383 = _488 + _546;
        _494 = _1383;
    }
    float _1385 = _494;
    float _1387 = -_1375;
    float _1389 = fma(_1387, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1269);
    float _1391 = fma(_1373, _1239, _1377);
    if (_1343)
    {
        float _1393 = _482 + _542;
        _484 = _1393;
    }
    float _1395 = _484;
    float _1397 = _1319 * 6.283185482025146484375;
    float _1399 = cos(_1397);
    float _1401 = -_1385;
    float _1403 = _1131 * _1401;
    float _1405 = _1391 * 0.15915493667125701904296875;
    float _1407 = _1389 * _1389;
    float _1409 = -_1381;
    float _1411 = _1133 * _1409;
    float _1413 = -_1395;
    float _1415 = -_1403;
    float _1417 = fma(_1133, _1413, _1415);
    float _1419 = in.m_55.x;
    float _1421 = in.m_55.y;
    float _1423 = in.m_55.z;
    float _1425 = _1301 * _1331;
    float _1427 = -_1385;
    float _1429 = -_1411;
    float _1431 = fma(_1129, _1427, _1429);
    float _1433 = _1283 * _1331;
    float _1435 = -_1395;
    float _1437 = _1129 * _1435;
    float _1439 = -_1425;
    float _1441 = fma(_1439, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1301);
    float _1443 = _1431 * _1431;
    float _1445 = -_1433;
    float _1447 = fma(_1445, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1283);
    float _1449 = -_1381;
    float _1451 = -_1437;
    float _1453 = fma(_1131, _1449, _1451);
    float _1455 = _1359 * 6.283185482025146484375;
    float _1457 = sin(_1455);
    float _1459 = fma(_1417, _1417, _1443);
    float _1461 = fma(_1447, _1447, _1407);
    float _1463 = in.m_63.x;
    float _1465 = in.m_63.y;
    float _1467 = in.m_63.z;
    float _1469 = fma(_1453, _1453, _1459);
    float _1471 = fma(_1441, _1441, _1461);
    float _1473 = _1359 * 6.283185482025146484375;
    float _1475 = cos(_1473);
    float _1477 = _1419 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1479 = _1405 * 6.283185482025146484375;
    float _1481 = cos(_1479);
    float _1483 = _1421 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1485 = _1423 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1487 = _1457 * _1399;
    float _1489 = _1485 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1491 = rsqrt(_1469);
    float _1493 = _1475 * _1355;
    float _1495 = _1475 * _1399;
    float _1497 = sqrt(_1471);
    float _1499 = _1355 * _1481;
    float _1501 = _1399 * _1481;
    float _1503 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1463);
    float _1505 = _1405 * 6.283185482025146484375;
    float _1507 = sin(_1505);
    float _1509 = _1417 * _1491;
    float _1511 = _1483 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1513 = _1475 * _1481;
    float _1515 = _1431 * _1491;
    float _1517 = _1453 * _1491;
    float _1519 = _1513 * _1133;
    float _1521 = _1331 * _1497;
    float _1523 = _1457 * _1355;
    float _1525 = _1477 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1527 = _1457 * _1481;
    float _1529 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1465);
    float _1531 = _1511 * _1521;
    float _1533 = _1525 * _1521;
    float _1535 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1467);
    float _1537 = fma(_1507, _1495, _1523);
    float _1539 = _1489 * _1521;
    float _1541 = -_1493;
    float _1543 = fma(_1507, _1487, _1541);
    float _1545 = _1531 * _1529;
    float _1547 = -_1487;
    float _1549 = fma(_1507, _1493, _1547);
    float _1551 = _1539 * _1535;
    float _1553 = _1537 * _1133;
    float _1555 = _1129 * _1515;
    float _1557 = _1533 * _1503;
    float _1559 = -_1507;
    float _1561 = fma(_1559, _1517, _1519);
    float _1563 = _1549 * _1133;
    float _1565 = fma(_1501, _1517, _1553);
    float _1567 = _1513 * _1129;
    float _1569 = _1131 * _1517;
    float _1571 = -_1555;
    float _1573 = fma(_1131, _1509, _1571);
    float _1575 = fma(_1507, _1523, _1495);
    float _1577 = fma(_1499, _1517, _1563);
    float _1579 = -_1507;
    float _1581 = fma(_1579, _1509, _1567);
    float _1583 = _1537 * _1129;
    float _1585 = -_1569;
    float _1587 = fma(_1133, _1515, _1585);
    float _1589 = fma(_1543, _1573, _1565);
    float _1591 = fma(_1527, _1573, _1561);
    float _1593 = fma(_1575, _1573, _1577);
    float _1595 = _1549 * _1129;
    float _1597 = fma(_1501, _1509, _1583);
    float _1599 = fma(_1527, _1587, _1581);
    float _1601 = _1545 * _1591;
    float _1603 = fma(_1499, _1509, _1595);
    float _1605 = fma(_1543, _1587, _1597);
    float _1607 = _1545 * _1599;
    float _1609 = fma(_1557, _1589, _1601);
    float _1611 = fma(_1575, _1587, _1603);
    float _1613 = _1133 * _1509;
    float _1615 = fma(_1557, _1605, _1607);
    float _1617 = fma(_1551, _1593, _1609);
    float _1619 = _1549 * _1131;
    float _1621 = -_1613;
    float _1623 = fma(_1129, _1517, _1621);
    float _1625 = fma(_1551, _1611, _1615);
    float _1627 = _1119 + _1617;
    float _1629 = fma(_1499, _1515, _1619);
    float _1631 = _1117 + _1625;
    float _1633 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1635 = _1627 + _1633;
    float _1637 = fma(_1575, _1623, _1629);
    float _1639 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1641 = _1631 + _1639;
    float _1643 = _1635 * _1635;
    float _1645 = fma(_1641, _1641, _1643);
    float _1647 = _1513 * _1131;
    float _1649 = sqrt(_1645);
    float _1651 = -_1507;
    float _1653 = fma(_1651, _1515, _1647);
    float _1655 = _1537 * _1131;
    float _1657 = fma(_1527, _1623, _1653);
    float _1659 = fma(_1501, _1515, _1655);
    float _1661 = _1545 * _1657;
    float _1663 = fma(_1543, _1623, _1659);
    float _1665 = fma(_1557, _1663, _1661);
    float _1667 = -_1433;
    float _1669 = fma(_1667, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1117);
    bool _1671 = _1649 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1673 = fma(_1551, _1637, _1665);
    float _1675 = _1101 + _1673;
    float _1677 = _1629;
    float _1679 = _1501;
    float _1681 = _1631;
    float _1683 = _1521;
    float _1685 = _1659;
    float _1687 = _1623;
    float _1689 = _1517;
    if (!_1671)
    {
        _1677 = _1627;
    }
    float _1691 = _1677;
    float _1693 = _1691;
    if (!_1671)
    {
        _1679 = _1675;
    }
    float _1695 = _1679;
    bool _1697 = !_1671;
    float _1699 = _1695;
    if (!_1697)
    {
        float _1701 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1705 = _1649 + _1703;
        float _1707 = _1675 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1709 = rsqrt(_1645);
        float _1711 = _1705 * _1701;
        float _1713 = _1711 * 0.15915493667125701904296875;
        float _1715 = _1713 * 6.283185482025146484375;
        float _1717 = cos(_1715);
        float _1719 = _1713 * 6.283185482025146484375;
        float _1721 = sin(_1719);
        float _1723 = _1717 + (-1.0);
        float _1725 = fma(_1721, _1707, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1727 = _1723 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1729 = _1709 * _1725;
        float _1731 = fma(_1675, _1717, _1727);
        float _1733 = fma(_1641, _1729, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1735 = fma(_1635, _1729, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1681 = _1733;
        _1699 = _1731;
        _1693 = _1735;
    }
    float _1737 = _1681;
    float _1739 = _1699;
    float _1741 = _1693;
    float _1743 = -_1433;
    float _1745 = fma(_1743, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1737);
    float _1747 = -_1375;
    float _1749 = fma(_1747, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1739);
    float _1751 = -_1425;
    float _1753 = fma(_1751, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1741);
    float _1755 = -_1375;
    float _1757 = fma(_1755, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1101);
    float _1759 = -_1425;
    float _1761 = fma(_1759, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1119);
    float _1763 = _1749;
    float _1765 = _1745;
    float _1767 = _1753;
    if (!_1371)
    {
        float _1769 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1771 = _1757 + _1769;
        float _1773 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1775 = _1669 + _1773;
        float _1777 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1779 = -_1119;
        float _1781 = _1779 + _1741;
        float _1783 = _1771 * _1771;
        float _1785 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1787 = _1761 + _1785;
        float _1789 = -_1117;
        float _1791 = _1789 + _1737;
        float _1793 = -_1101;
        float _1795 = _1793 + _1739;
        float _1797 = fma(_1775, _1775, _1783);
        float _1799 = 1.0 / _1521;
        float _1801 = fma(_1787, _1787, _1797);
        float _1803 = sqrt(_1801);
        float _1805 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1807 = _1781 * _1799;
        float _1809 = _1791 * _1799;
        float _1811 = _1795 * _1799;
        bool _1813 = _1803 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1815 = isnan(_1803);
        bool _1817 = _1813 || _1815;
        bool _1819 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1821 = _1817 || _1819;
        float _1823 = precise::min(_1803, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1825 = _1823 * _1777;
        float _1827 = _1805 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1829 = _1827 * _1825;
        float _1831 = _1425;
        float _1833 = _1827;
        _1685 = _1829;
        _1687 = _1799;
        if (_1821)
        {
            float _1835 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1831 = _1835;
        }
        float _1837 = _1831;
        if (_1821)
        {
            float _1839 = precise::max(_1803, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1683 = _1839;
        }
        float _1841 = _1683;
        float _1843 = fma(_1807, _1829, _1761);
        float _1845 = fma(_1809, _1829, _1669);
        float _1847 = fma(_1811, _1829, _1757);
        float _1849 = _1841;
        float _1851 = _1845;
        float _1853 = _1847;
        if (_1821)
        {
            float _1855 = _1841 * _1837;
            _1849 = _1855;
        }
        float _1857 = _1849;
        float _1859 = _1857;
        if (_1821)
        {
            float _1861 = _1827 * _1857;
            _1859 = _1861;
        }
        float _1863 = _1859;
        if (!_1821)
        {
            _1833 = _1843;
        }
        float _1865 = _1833;
        _1767 = _1865;
        if (_1821)
        {
            float _1867 = fma(_1809, _1863, _1669);
            _1851 = _1867;
        }
        float _1869 = _1851;
        _1765 = _1869;
        if (_1821)
        {
            float _1871 = fma(_1811, _1863, _1757);
            _1853 = _1871;
        }
        float _1873 = _1853;
        _1763 = _1873;
        if (_1821)
        {
            float _1875 = fma(_1807, _1863, _1761);
            _1767 = _1875;
        }
    }
    float _1877 = _1763;
    float _1879 = _1765;
    float _1881 = _1767;
    float _1883 = _1685;
    float _1885 = _1687;
    float _1887 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1889 = _1877 + _1887;
    float _1891 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1893 = _1879 + _1891;
    float _1895 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1897 = _1881 + _1895;
    float _1899 = _1889 * _1889;
    float _1901 = fma(_1893, _1893, _1899);
    float _1903 = fma(_1897, _1897, _1901);
    float _1905 = rsqrt(_1903);
    float _1907 = sqrt(_1903);
    float _1909 = _1905 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1911 = _1893 * _1909;
    float _1913 = _1897 * _1909;
    float _1915 = _1911 * _1911;
    float _1917 = _1913 * _1913;
    float _1919 = _1915 + _1917;
    float _1921 = sqrt(_1919);
    bool _1923 = _1921 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1925 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1927 = _1921 + _1925;
    float _1929 = _1901;
    float _1931 = _1883;
    float _1933 = _1927;
    float _1935 = _1885;
    if (_1923)
    {
        float _1937 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1929 = _1937;
    }
    float _1939 = _1929;
    if (_1923)
    {
        float _1941 = rsqrt(_1919);
        _1931 = _1941;
    }
    float _1943 = _1931;
    float _1945 = _1943;
    if (_1923)
    {
        float _1947 = _1927 * _1939;
        _1933 = _1947;
    }
    float _1949 = _1933;
    if (_1923)
    {
        float _1951 = _1949 * 0.15915493667125701904296875;
        _1167 = _1951;
    }
    float _1953 = _1167;
    float _1955 = _1939;
    float _1957 = _1953;
    if (_1923)
    {
        float _1959 = _1953 * 6.283185482025146484375;
        float _1961 = sin(_1959);
        _1955 = _1961;
    }
    float _1963 = _1955;
    float _1965 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1967 = precise::max(0.0, _1965);
    float _1969 = _1101;
    float _1971 = _1967;
    if (_1923)
    {
        float _1973 = _1953 * 6.283185482025146484375;
        float _1975 = cos(_1973);
        _1969 = _1975;
    }
    float _1977 = _1969;
    float _1979 = -_1909;
    float _1981 = -_1967;
    float _1983 = fma(_1889, _1979, _1981);
    if (_1923)
    {
        float _1985 = _1983 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1971 = _1985;
    }
    float _1987 = _1971;
    float _1989 = _1987;
    if (!_1923)
    {
        _1957 = _1915;
    }
    float _1991 = _1957;
    float _1993 = _1963;
    float _1995 = _1991;
    if (_1923)
    {
        float _1997 = fma(_1963, _1987, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1993 = _1997;
    }
    float _1999 = _1993;
    float _2001 = _1999;
    float _2003 = _1977;
    if (_1923)
    {
        float _2005 = _1977 + (-1.0);
        _1989 = _2005;
    }
    float _2007 = _1989;
    float _2009 = _2007;
    if (_1923)
    {
        float _2011 = _1943 * _1999;
        _1689 = _2011;
    }
    float _2013 = _1689;
    if (!_1923)
    {
        _1945 = _1911;
    }
    float _2015 = _1945;
    float _2017 = _2015;
    if (_1923)
    {
        float _2019 = _2007 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1935 = _2019;
    }
    float _2021 = _1935;
    if (_1923)
    {
        float _2023 = _1911 * _2013;
        _2017 = _2023;
    }
    float _2025 = _2017;
    if (!_1923)
    {
        _2001 = _1983;
    }
    float _2027 = _2001;
    float _2029 = _2027;
    if (!_1923)
    {
        _2009 = _1913;
    }
    float _2031 = _2009;
    float _2033 = _2031;
    if (_1923)
    {
        float _2035 = fma(_1983, _1977, _2021);
        _2029 = _2035;
    }
    float _2037 = _2029;
    if (_1923)
    {
        float _2039 = _1913 * _2013;
        _2033 = _2039;
    }
    float _2041 = _2033;
    if (_1923)
    {
        float _2043 = _2025 * _2025;
        _1995 = _2043;
    }
    float _2045 = _1995;
    if (!_1923)
    {
        _2003 = _1917;
    }
    float _2047 = _2003;
    float _2049 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2051 = _2047;
    if (_1923)
    {
        float _2053 = _2041 * _2041;
        _2051 = _2053;
    }
    float _2055 = _2051;
    float _2057 = fma(_2037, _2037, _2045);
    float _2059 = _1877 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2061 = _2057 + _2055;
    float _2063 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2059);
    float _2065 = _1877 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2069 = fma(_1907, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2067);
    float _2071 = precise::clamp(_2069, 0.0, 1.0);
    float _2073 = _1877 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2075 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2063);
    float _2077 = rsqrt(_2061);
    float _2079 = _1877 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2081 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2065);
    float _2083 = -_2071;
    float _2085 = _2083 + 1.0;
    float _2087 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2073);
    float _2089 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2079);
    float _2091 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2081);
    float _2093 = _2075 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2095 = abs(_2085);
    float _2097 = log2(_2095);
    float _2099 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2089);
    float _2101 = _2091 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2103 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2087);
    float _2105 = _2093 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2107 = _2099 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2109 = _2101 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2111 = _2103 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2113 = _2077 * _2025;
    float _2115 = _2077 * _2041;
    float _2117 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2109);
    float _2119 = _2077 * _2037;
    float _2121 = _2113 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2123 = -_2105;
    float _2125 = fma(_2123, _2049, 1.0);
    float _2127 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2117);
    float _2129 = -_2121;
    float _2131 = fma(_2119, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2129);
    float _2133 = _2097 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2135 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2127);
    float _2137 = log2(_2125);
    float _2139 = -_2115;
    float _2141 = fma(_2139, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2131);
    float _2143 = _2101 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2145 = _2101 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2147 = fma(_2141, -0.5, 0.5);
    float _2149 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2143);
    float _2151 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2145);
    float _2153 = exp2(_2133);
    float _2155 = fma(_2141, 0.5, 0.5);
    float _2157 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2149);
    float _2159 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2151);
    float _2161 = _2119 + 1.0;
    float _2163 = fma(_2155, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2165 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2157);
    float _2167 = 1.0 / _2135;
    float _2169 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2159);
    float _2171 = fma(_2155, _2163, -0.212114393711090087890625);
    float _2173 = _2137 * 0.693147182464599609375;
    float _2175 = fma(_2155, _2171, 1.570728778839111328125);
    float _2177 = _2173 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2179 = sqrt(_2147);
    float _2181 = -_2119;
    float _2183 = fma(_2153, _2161, _2181);
    float _2185 = fma(_2183, 0.5, 0.5);
    float _2187 = _2165 * _2167;
    float _2189 = _2169 * _2167;
    float _2191 = fma(_2187, 0.5, 0.5);
    float _2193 = fma(_2189, -0.5, 0.5);
    float _2195 = _2179 * 0.636619746685028076171875;
    float _2197 = -_2175;
    float _2199 = fma(_2195, _2197, 1.0);
    float3 _5988 = float3(_2191, _2193, _2177);
    float _2201 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5988, float3(0.0), isnan(_5988)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5988, float3(0.0), isnan(_5988)), level(0.0)).x;
    float3 _5999 = float3(_2191, _2193, _2177);
    float4 _2204 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5999, float3(0.0), isnan(_5999)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5999, float3(0.0), isnan(_5999)), level(0.0)).xyzw;
    float _2206 = _2204.x;
    float _2208 = _2204.y;
    float _2210 = _2204.z;
    float _2212 = _2204.w;
    float2 _6016 = float2(_2199, _2185);
    float3 _2216 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6016, float2(0.0), isnan(_6016)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6016, float2(0.0), isnan(_6016)), level(0.0)).xyz;
    float _2218 = _2216.x;
    float _2220 = _2216.y;
    float _2222 = _2216.z;
    float _2224 = in.m_65.y;
    float _2226 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2228 = in.m_67.w;
    float _2230 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2232 = _2230 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2236 = _2234 != 0;
    float _2238 = _2097 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2240 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2242 = _2240 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2244 = _1007 > 0.5;
    float _2246 = 1.0 / _2232;
    float _2248 = _1757 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2250 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2252 = _2250 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2254 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2256 = isnan(0.5);
    bool _2258 = _2254 || _2256;
    bool _2260 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2262 = _2258 || _2260;
    float _2264 = _2101 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2268 = _2266 != 0;
    float _2270 = _2226 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2272 = 1.0 / _2252;
    bool _2274 = _750 > 0.5;
    bool _2276 = _2274 && _2268;
    float _2278 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2264);
    float _2280 = -_2224;
    float _2282 = _2280 + 1.0;
    float _2284 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2286 = _2284 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2288 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2278);
    out.m_69.y = _1877;
    float _2290 = 1.0 / _2242;
    float _2292 = _2224;
    if (_2236)
    {
        float _2294 = _2244 ? _2282 : _2224;
        _2292 = _2294;
    }
    float _2296 = _2292;
    float _2298 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2300 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2298;
    out.m_71.w = _2228;
    bool _2302 = _1465 != 0.0;
    bool _2304 = isnan(_1465);
    bool _2306 = _2302 || _2304;
    bool _2308 = isnan(0.0);
    bool _2310 = _2306 || _2308;
    float _2312 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2288);
    float _2314 = _2300 * _2246;
    float _2316 = fma(_2270, _2296, -0.5);
    bool _2318 = _1463 == 0.0;
    bool _2320 = !_2310;
    bool _2322 = _2318 && _2320;
    float _2324 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2248);
    float _2326 = _1757 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2328 = -_1225;
    float _2330 = fma(_1219, _2316, _2328);
    float _2332 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2324);
    float _2334 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2326);
    float _2336 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2338 = _997 + _2336;
    float _2340 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2342 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2340;
    float _2344 = _2332 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2346 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2334);
    float _2348 = _2286 * _2290;
    float _2350 = _2342 * _2272;
    float _2352 = 1.0 / _2344;
    float _2354 = in.m_65.x;
    float _2356 = _2346 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2358 = _997 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2360 = isnan(_997);
    bool _2362 = _2358 || _2360;
    bool _2364 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2366 = _2362 || _2364;
    float _2368 = float(_2366);
    bool _2370 = _997 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2372 = isnan(_997);
    bool _2374 = _2370 || _2372;
    bool _2376 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2378 = _2374 || _2376;
    float _2380 = float(_2378);
    float _2382 = _2356 + _2344;
    bool _2384 = _997 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2386 = isnan(_997);
    bool _2388 = _2384 || _2386;
    bool _2390 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2392 = _2388 || _2390;
    float _2394 = float(_2392);
    float _2396 = -_2368;
    float _2398 = _2396 + 1.0;
    bool _2400 = _997 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2402 = isnan(_997);
    bool _2404 = _2400 || _2402;
    bool _2406 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2408 = _2404 || _2406;
    float _2410 = float(_2408);
    float _2412 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2414 = _997 + _2412;
    bool _2416 = _1467 == 0.0;
    bool _2418 = _2416 && _2322;
    float _2420 = _2380 * _2398;
    float _2422 = -_2380;
    float _2424 = _2422 + 1.0;
    float _2426 = fma(_2314, _2338, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2428 = fma(_2348, _2414, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2430 = _2382 * _2352;
    float _2432 = _2430 * 0.5;
    float _2434 = -_2394;
    float _2436 = _2434 + 1.0;
    float _2438 = _2394 * _2424;
    float _2440 = _2414;
    float _2442 = _2432;
    float _2444 = _2426;
    if (!_2262)
    {
        _2440 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2446 = _2440;
    float _2448 = in.m_73.x;
    float _2450 = in.m_73.y;
    float _2452 = in.m_73.z;
    float _2454 = _2410 * _2436;
    float _2456 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2458 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2456);
    float _2460 = -_2410;
    float _2462 = _2460 + 1.0;
    float _2464 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2466 = _2426 * _2454;
    float _2468 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2470 = _997 + _2468;
    float _2472 = _2354;
    float _2474 = _2470;
    float _2476 = _2446;
    if (_2268)
    {
        _2442 = _2354;
    }
    float _2478 = _2442;
    float _2480 = _2478;
    if (!_2262)
    {
        float _2482 = -_2446;
        float _2484 = _2482 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2444 = _2484;
    }
    float _2486 = _2444;
    if (!_2268)
    {
        _1169 = _2354;
    }
    float _2488 = _1169;
    float _2490 = fma(_2462, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2466);
    float _2492 = _2488;
    if (!_2262)
    {
        _2472 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2494 = _2472;
    float _2496 = fma(_2350, _2470, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2498 = 1.0 / _2458;
    float _2500 = fma(_2428, _2438, _2490);
    float _2502 = _2494;
    if (_2276)
    {
        float _2504 = -_2478;
        float _2506 = _2504 + 1.0;
        _2480 = _2506;
    }
    float _2508 = _2480;
    if (!_2262)
    {
        float _2510 = -_2494;
        float _2512 = _2510 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2474 = _2512;
    }
    float _2514 = _2474;
    out.m_75.x = _1893;
    out.m_75.y = _1889;
    out.m_75.z = _1897;
    float _2516 = fma(_2496, _2420, _2500);
    float _2518 = _2516;
    if (_2268)
    {
        _2492 = _2508;
    }
    float _2520 = _2492;
    float _2522 = _2428;
    float _2524 = _2520;
    if (!_2262)
    {
        float _2526 = 1.0 / _2514;
        _2522 = _2526;
    }
    float _2528 = _2522;
    float _2530 = fma(_2368, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2516);
    if (_2262)
    {
        _2518 = 1.0;
    }
    float _2532 = _2518;
    float _2534 = _2448;
    float _2536 = _2450;
    float _2538 = _2452;
    float _2540 = _2532;
    if (!_2418)
    {
        float _2542 = fma(_1463, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2448);
        _2534 = _2542;
    }
    float _2544 = _2534;
    float _2546 = _2464 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_2418)
    {
        float _2548 = fma(_1465, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2450);
        _2536 = _2548;
    }
    float _2550 = _2536;
    if (!_2418)
    {
        float _2552 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2452);
        _2538 = _2552;
    }
    float _2554 = _2538;
    float _2556 = _2486;
    if (!_2262)
    {
        float _2558 = 1.0 / _2486;
        _2556 = _2558;
    }
    float _2560 = _2556;
    if (!_2262)
    {
        float _2562 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2564 = -_2494;
        float _2566 = fma(_2498, _2562, _2564);
        _2502 = _2566;
    }
    float _2568 = _2502;
    float _2570 = _2568;
    if (!_2262)
    {
        float _2572 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2574 = -_2446;
        float _2576 = fma(_2498, _2572, _2574);
        _2476 = _2576;
    }
    float _2578 = _2476;
    float _2580 = fma(_2546, _2520, -0.5);
    if (_2262)
    {
        _2524 = 1.0;
    }
    float _2582 = _2524;
    float _2584 = _1599 * _2550;
    float _2586 = _1657 * _2550;
    float _2588 = fma(_1217, _2580, _1075);
    float _2590 = _2582;
    if (!_2262)
    {
        float _2592 = _2568 * _2528;
        float _2594 = precise::clamp(_2592, 0.0, 1.0);
        _2570 = _2594;
    }
    float _2596 = _2570;
    float _2598 = exp2(_2238);
    float _2600 = fma(_1605, _2544, _2584);
    float _2602 = _1591 * _2550;
    if (!_2262)
    {
        float _2604 = -_2596;
        float _2606 = _2604 + 1.0;
        _2540 = _2606;
    }
    float _2608 = _2540;
    float _2610 = _2330 + 0.5;
    float _2612 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2614 = _2312 + _2612;
    float _2616 = fma(_1663, _2544, _2586);
    if (!_2262)
    {
        float _2618 = _2578 * _2560;
        float _2620 = precise::clamp(_2618, 0.0, 1.0);
        _2590 = _2620;
    }
    float _2622 = _2590;
    float _2624 = fma(_1589, _2544, _2602);
    float _2626 = _2622 * _2608;
    float _2628 = fma(_1611, _2554, _2600);
    float _2630 = fma(_1637, _2554, _2616);
    float _2632 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2634 = _2626 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2636 = -_2598;
    float _2638 = _2636 + 1.0;
    float _2640 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2642 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2644 = _2634 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2646 = _2135 + _2614;
    float _2648 = fma(_1593, _2554, _2624);
    float _2650 = _2632 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2652 = _2640 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2654 = _2646 * 0.5;
    float _2656 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2658 = _2642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2660 = _2530 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2662 = _2622 > 0.0;
    bool _2664 = isnan(_2622);
    bool _2666 = _2662 || _2664;
    bool _2668 = isnan(0.0);
    bool _2670 = _2666 || _2668;
    float _2672 = _2588 + 0.5;
    out.m_45.x = _2644;
    bool _2674 = _2608 <= 0.0;
    bool _2676 = !_2670;
    bool _2678 = _2674 || _2676;
    out.m_77.x = _2650;
    out.m_77.y = _2652;
    out.m_77.z = _2658;
    out.m_77.w = _2660;
    out.m_79.x = _2672;
    out.m_79.y = _2610;
    out.m_81.x = _2628;
    out.m_81.y = _2630;
    out.m_81.z = _2648;
    out.gl_Position.x = _2165;
    out.gl_Position.y = _2169;
    out.gl_Position.z = _2614;
    out.gl_Position.w = _2135;
    float _2680 = -_2656;
    float _2682 = _2680 + 1.0;
    out.m_83.z = _2654;
    out.m_83.w = _2135;
    float _2684 = _2656 * _2201;
    float _2686 = _2212 * _2682;
    float _2688 = _2212 * _2684;
    float _2690 = _2222 * _2684;
    float _2692 = fma(_2218, _2688, _2206);
    float _2694 = fma(_2220, _2688, _2208);
    float _2696 = fma(_2212, _2690, _2210);
    out.m_85.x = _2692;
    out.m_85.y = _2694;
    out.m_85.z = _2696;
    out.m_85.w = _2686;
    if (!_2678)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2698 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2698;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _989 = false;
    bool _784 = false;
    bool _612 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_42.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_45.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2755 = as_type<float>(_120);
        out.gl_Position.z = _2755;
    }
    if (!_108)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _124 = in.m_47.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = 0.0;
    float _142 = _138;
    if (_134)
    {
        float _144 = float(_104);
        _114 = _144;
    }
    float _146 = _114;
    bool _148 = _138 >= _146;
    bool _150 = !_134;
    bool _152 = _148 || _150;
    float _154 = _146;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_45.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _122 = as_type<int>(_158);
    }
    int _160 = _122;
    float _162 = as_type<float>(_160);
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2827 = as_type<float>(_160);
        out.gl_Position.z = _2827;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _164 = in.m_49.y;
    float _166 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _168 = in.m_51.y;
    bool _170 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _172 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _174 = _170 || _172;
    bool _176 = isnan(1.0);
    bool _178 = _174 || _176;
    float _180 = in.m_53.y;
    float _182 = in.m_49.z;
    float _184 = in.m_51.z;
    float _186 = _166;
    if (!_178)
    {
        float _188 = _166 * _166;
        float _190 = _188 * 0.5;
        _162 = _190;
    }
    float _192 = _162;
    float _194 = 0.0;
    float _196 = _192;
    if (!_178)
    {
        float _198 = _138 * _138;
        float _200 = _198 * 0.5;
        _194 = _200;
    }
    float _202 = _194;
    float _204 = in.m_53.z;
    if (!_178)
    {
        float _206 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _206;
    }
    float _208 = _196;
    float _210 = _164 * _164;
    float _212 = fma(_168, _168, _210);
    float _214 = fma(_180, _180, _212);
    float _216 = in.m_47.x;
    float _218 = in.m_47.y;
    float _220 = in.m_47.z;
    float _222 = sqrt(_214);
    bool _224 = _222 > 0.0;
    float _226 = _182 * _182;
    float _228 = fma(_184, _184, _226);
    bool _230 = !_178;
    float _232 = _208;
    float _234 = _228;
    if (!_230)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _246 = _166 * _238;
        float _248 = 1.0 / _242;
        float _250 = _244 * 0.693147182464599609375;
        float _252 = exp2(_246);
        float _254 = 1.0 / _250;
        float _256 = _252 + (-1.0);
        float _258 = -_256;
        float _260 = fma(_258, _254, _166);
        float _262 = _260 * _248;
        float _264 = _262 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _140 = _254;
        _232 = _264;
    }
    float _266 = _140;
    float _268 = _232;
    bool _270 = !_178;
    float _272 = _266;
    if (!_270)
    {
        float _274 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _276 = log2(_274);
        float _278 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _280 = _278 + 1.0;
        float _282 = 1.0 / _280;
        float _284 = _166 * _276;
        float _286 = exp2(_284);
        float _288 = -_286;
        float _290 = _288 + 1.0;
        float _292 = _290 * _282;
        _272 = _280;
        _186 = _292;
    }
    float _294 = _272;
    float _296 = _186;
    float _298 = fma(_204, _204, _228);
    float _300 = _294;
    if (!_178)
    {
        _300 = _138;
    }
    float _302 = _300;
    float _304 = _302;
    if (!_178)
    {
        float _306 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _234 = _306;
    }
    float _308 = _234;
    bool _310 = !_178;
    float _312 = _308;
    if (!_310)
    {
        float _314 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _316 = log2(_314);
        float _318 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _320 = _318 + 1.0;
        float _322 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _324 = _138 * _316;
        float _326 = 1.0 / _320;
        float _328 = _322 * 0.693147182464599609375;
        float _330 = exp2(_324);
        float _332 = 1.0 / _328;
        float _334 = _330 + (-1.0);
        float _336 = -_334;
        float _338 = fma(_336, _332, _138);
        float _340 = _338 * _326;
        float _342 = _340 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _312 = _342;
    }
    float _344 = _312;
    bool _346 = !_178;
    if (!_346)
    {
        float _348 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _350 = log2(_348);
        float _352 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _354 = _352 + 1.0;
        float _356 = 1.0 / _354;
        float _358 = _138 * _350;
        float _360 = exp2(_358);
        float _362 = -_360;
        float _364 = _362 + 1.0;
        float _366 = _364 * _356;
        _304 = _366;
    }
    float _368 = _304;
    float _370 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _372 = _344 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _374 = sqrt(_298);
    float _376 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _378 = fma(_296, _218, _370);
    float _380 = _344 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _382 = fma(_368, _218, _372);
    float _384 = fma(_296, _216, _376);
    float _386 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _388 = _344 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _390 = fma(_368, _216, _380);
    float _392 = -_382;
    float _394 = _378 + _392;
    float _396 = fma(_296, _220, _386);
    float _398 = fma(_368, _220, _388);
    float _400 = -_390;
    float _402 = _384 + _400;
    float _404 = _394 * _394;
    float _406 = in.m_49.x;
    float _408 = -_398;
    float _410 = _396 + _408;
    bool _412 = _374 > 0.0;
    float _414 = fma(_402, _402, _404);
    float _416 = in.m_51.x;
    float _418 = 0.0;
    float _420 = _382;
    float _422 = _414;
    float _424 = _388;
    float _426 = _372;
    if (_224)
    {
        float _428 = rsqrt(_214);
        _418 = _428;
    }
    float _430 = _418;
    if (!_224)
    {
        _420 = 0.0;
    }
    float _432 = _420;
    float _434 = fma(_410, _410, _414);
    float _436 = in.m_53.x;
    float _438 = _432;
    if (!_224)
    {
        _422 = 0.0;
    }
    float _440 = _422;
    float _442 = _394 * _164;
    float _444 = _440;
    if (!_224)
    {
        _424 = 0.0;
    }
    float _446 = _424;
    float _448 = in.m_55.w;
    float _450 = sqrt(_434);
    float _452 = _394 * _180;
    float _454 = _446;
    if (!_412)
    {
        _426 = 0.0;
    }
    float _456 = _426;
    float _458 = in.m_42.x;
    float _460 = in.m_42.y;
    float _462 = in.m_42.z;
    float _464 = 0.0;
    float _466 = _456;
    if (_412)
    {
        float _468 = rsqrt(_298);
        _464 = _468;
    }
    float _470 = _464;
    float _472 = _430;
    if (_224)
    {
        float _474 = _430 * _168;
        _438 = _474;
    }
    float _476 = _438;
    float _478 = _476;
    if (_224)
    {
        float _480 = _430 * _164;
        _444 = _480;
    }
    float _482 = _444;
    float _484 = _482;
    if (_224)
    {
        float _486 = _430 * _180;
        _454 = _486;
    }
    float _488 = _454;
    float _490 = fma(_402, _406, _442);
    float _492 = _490;
    float _494 = _488;
    if (!_412)
    {
        _472 = 0.0;
    }
    float _496 = _472;
    bool _498 = _450 >= 9.9999999747524270787835121154785e-07;
    bool _500 = isnan(_450);
    bool _502 = _498 || _500;
    bool _504 = isnan(9.9999999747524270787835121154785e-07);
    bool _506 = _502 || _504;
    float _508 = _394 * _168;
    float _510 = _450;
    float _512 = _496;
    if (!_412)
    {
        _510 = 0.0;
    }
    float _514 = _510;
    float _516 = fma(_402, _436, _452);
    float _518 = fma(_402, _416, _508);
    float _520 = fma(_410, _204, _516);
    float _522 = _470;
    float _524 = _514;
    float _526 = _516;
    if (_412)
    {
        float _528 = _470 * 0.001000000047497451305389404296875;
        _522 = _528;
    }
    float _530 = _522;
    float _532 = fma(_410, _184, _518);
    float _534 = fma(_384, _448, _458);
    if (_412)
    {
        float _536 = _184 * _530;
        _512 = _536;
    }
    float _538 = _512;
    if (_412)
    {
        float _540 = _182 * _530;
        _524 = _540;
    }
    float _542 = _524;
    if (_412)
    {
        float _544 = _204 * _530;
        _466 = _544;
    }
    float _546 = _466;
    float _548 = fma(_410, _182, _490);
    float _550 = fma(_378, _448, _460);
    float _552 = fma(_396, _448, _462);
    float _554 = _548;
    if (_506)
    {
        _492 = _532;
    }
    float _556 = _492;
    float _558 = _556;
    float _560 = _556;
    if (_506)
    {
        _526 = _548;
    }
    float _562 = _526;
    float _564 = _562;
    float _566 = _562;
    if (_506)
    {
        _554 = _520;
    }
    float _568 = _554;
    float _570 = _568;
    float _572 = _568;
    if (!_506)
    {
        bool _574 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _576 = !_574;
        if (!_576)
        {
            float _578 = _164 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _580 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _582 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _584 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[16].x, _578);
            float _586 = fma(_416, (*spvDescriptorSet0.vp_c9)._m0[16].x, _580);
            float _588 = fma(_436, (*spvDescriptorSet0.vp_c9)._m0[16].x, _582);
            float _590 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[16].z, _584);
            float _592 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[16].z, _586);
            float _594 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[16].z, _588);
            float _596 = _590 * _590;
            float _598 = fma(_592, _592, _596);
            float _600 = fma(_594, _594, _598);
            float _602 = rsqrt(_600);
            float _604 = _602 * 9.9999999747524270787835121154785e-07;
            float _606 = _592 * _604;
            float _608 = _590 * _604;
            float _610 = _594 * _604;
            _566 = _608;
            _560 = _606;
            _572 = _610;
            _612 = true;
        }
        else
        {
            float _614 = _218 * _218;
            float _616 = fma(_216, _216, _614);
            float _618 = fma(_220, _220, _616);
            float _620 = sqrt(_618);
            bool _622 = _620 >= 9.9999999747524270787835121154785e-07;
            bool _624 = isnan(_620);
            bool _626 = _622 || _624;
            bool _628 = isnan(9.9999999747524270787835121154785e-07);
            bool _630 = _626 || _628;
            float _632 = _620;
            if (!_630)
            {
                float _634 = _460 * _460;
                float _636 = fma(_458, _458, _634);
                float _638 = fma(_462, _462, _636);
                float _640 = sqrt(_638);
                bool _642 = _640 >= 9.9999999747524270787835121154785e-07;
                bool _644 = isnan(_640);
                bool _646 = _642 || _644;
                bool _648 = isnan(9.9999999747524270787835121154785e-07);
                bool _650 = _646 || _648;
                float _652 = _214;
                if (!_650)
                {
                    float _654 = rsqrt(_214);
                    _652 = _654;
                }
                float _656 = _652;
                if (!_650)
                {
                    float _658 = _656 * 9.9999999747524270787835121154785e-07;
                    _632 = _658;
                }
                float _660 = _632;
                if (!_650)
                {
                    float _662 = _168 * _660;
                    _558 = _662;
                }
                float _664 = _558;
                _560 = _664;
                if (!_650)
                {
                    float _666 = _164 * _660;
                    _564 = _666;
                }
                float _668 = _564;
                _566 = _668;
                if (!_650)
                {
                    float _670 = _180 * _660;
                    _570 = _670;
                }
                float _672 = _570;
                bool _674 = !_650;
                _572 = _672;
                _612 = _674;
                if (!_612)
                {
                    float _676 = _164 * _460;
                    float _678 = _168 * _460;
                    float _680 = _180 * _460;
                    float _682 = fma(_458, _406, _676);
                    float _684 = fma(_458, _416, _678);
                    float _686 = fma(_458, _436, _680);
                    float _688 = fma(_182, _462, _682);
                    float _690 = fma(_184, _462, _684);
                    float _692 = fma(_204, _462, _686);
                    float _694 = _688 * _688;
                    float _696 = fma(_690, _690, _694);
                    float _698 = fma(_692, _692, _696);
                    float _700 = rsqrt(_698);
                    float _702 = _700 * 9.9999999747524270787835121154785e-07;
                    float _704 = _690 * _702;
                    float _706 = _688 * _702;
                    float _708 = _692 * _702;
                    _566 = _706;
                    _560 = _704;
                    _572 = _708;
                    _612 = true;
                }
            }
            else
            {
                float _710 = _164 * _218;
                float _712 = _168 * _218;
                float _714 = _180 * _218;
                float _716 = fma(_216, _406, _710);
                float _718 = fma(_216, _416, _712);
                float _720 = fma(_216, _436, _714);
                float _722 = fma(_182, _220, _716);
                float _724 = fma(_184, _220, _718);
                float _726 = fma(_204, _220, _720);
                float _728 = _722 * _722;
                float _730 = fma(_724, _724, _728);
                float _732 = fma(_726, _726, _730);
                float _734 = rsqrt(_732);
                float _736 = _734 * 9.9999999747524270787835121154785e-07;
                float _738 = _724 * _736;
                float _740 = _722 * _736;
                float _742 = _726 * _736;
                _566 = _740;
                _560 = _738;
                _572 = _742;
            }
        }
    }
    _612 = false;
    float _744 = _566;
    float _746 = _560;
    float _748 = _572;
    float _750 = in.m_57.x;
    float _752 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _754 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _756 = _752 * _750;
    float _758 = trunc(_756);
    int _760 = int(_758);
    int _762 = _760 << 4;
    int _764 = _762 + 1712;
    bool _766 = !_754;
    float _782;
    if (!_766)
    {
        float _768 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _770 = _750 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _772 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _774 = _772 * _768;
        float _776 = floor(_774);
        float _778 = -_776;
        float _780 = _774 + _778;
        _782 = _780;
        _784 = true;
    }
    else
    {
        float _786 = float(_104);
        float _788 = 1.0 / _786;
        float _790 = _138 * _788;
        _782 = _790;
    }
    _784 = false;
    float _792 = _782;
    int _794 = _764 + 8;
    uint _797 = uint(int(uint(_794) >> uint(2)));
    uint _799 = uint(int(uint(int(_797)) >> uint(2)));
    int _801 = int(_797) & 3;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[int(_799)][_801];
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _807 = _792 + _805;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _811 = _809 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _813 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _815 = isnan(_792);
    bool _817 = _813 || _815;
    bool _819 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _821 = _817 || _819;
    float _823 = float(_821);
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _827 = _825 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    uint _829 = uint(int(uint(_764) >> uint(2)));
    uint _831 = uint(int(uint(int(_829)) >> uint(2)));
    int _833 = int(_829) & 3;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[int(_831)][_833];
    int _837 = int(_829) + 1;
    uint _839 = uint(int(uint(_837) >> uint(2)));
    int _841 = _837 & 3;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[int(_839)][_841];
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _847 = _845 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _849 = 1.0 / _811;
    bool _851 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _853 = isnan(_792);
    bool _855 = _851 || _853;
    bool _857 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _859 = _855 || _857;
    float _861 = float(_859);
    float _863 = -_823;
    float _865 = _863 + 1.0;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _867;
    bool _871 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _873 = isnan(_792);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _879 = _875 || _877;
    float _881 = float(_879);
    float _883 = _861 * _865;
    float _885 = -_861;
    float _887 = _885 + 1.0;
    float _889 = 1.0 / _827;
    bool _891 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _893 = _881 * _887;
    float _895 = -_881;
    float _897 = _895 + 1.0;
    float _899 = 1.0 / _847;
    float _901 = _869 * _849;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _905 = _903 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _907 = fma(_901, _807, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _909 = _792 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _911 = isnan(_792);
    bool _913 = _909 || _911;
    bool _915 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _917 = _913 || _915;
    float _919 = float(_917);
    float _921 = _905 * _889;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _923;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _929 = _792 + _927;
    float _931 = _907 * _893;
    float _933 = -_919;
    float _935 = _933 + 1.0;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _939 = _792 + _937;
    float _941 = fma(_921, _929, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _943 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[115].x, _931);
    float _945 = _925 * _899;
    float _947 = _823 * _935;
    float _949 = fma(_941, _883, _943);
    float _951 = fma(_945, _939, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _953 = _803 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _955 = fma(_951, _947, _949);
    float _957 = _953 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _959 = fma(_919, (*spvDescriptorSet0.vp_c9)._m0[118].x, _955);
    float _961 = _835 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _963 = _843 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _965 = _959 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _967 = _961 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _969 = _963 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _967;
    out.m_59.y = _969;
    out.m_59.z = _957;
    out.m_59.w = _965;
    bool _971 = !_891;
    float _987;
    if (!_971)
    {
        float _973 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _975 = _750 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _977 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[11].w, _138);
        float _979 = _977 * _973;
        float _981 = floor(_979);
        float _983 = -_981;
        float _985 = _979 + _983;
        _987 = _985;
        _989 = true;
    }
    else
    {
        float _991 = float(_104);
        float _993 = 1.0 / _991;
        float _995 = _138 * _993;
        _987 = _995;
    }
    _989 = false;
    float _997 = _987;
    float _999 = in.m_57.z;
    float _1001 = _550 * _164;
    float _1003 = _550 * _168;
    float _1005 = _550 * _180;
    float _1007 = in.m_57.y;
    float _1009 = fma(_534, _406, _1001);
    float _1011 = fma(_534, _416, _1003);
    float _1013 = fma(_534, _436, _1005);
    float _1015 = _750 * 2.0;
    float _1017 = fma(_552, _184, _1011);
    float _1019 = _750 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1021 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1023 = fma(_552, _182, _1009);
    float _1025 = -_1021;
    float _1027 = fma(_1019, 2.0, _1025);
    float _1029 = _744 * _744;
    float _1031 = fma(_552, _204, _1013);
    int _1033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1035 = _1033 != 0;
    int _1037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1039 = _1037 != 0;
    int _1041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1043 = _1041 != 0;
    float _1045 = in.m_51.w;
    float _1047 = floor(_1015);
    float _1049 = fma(_746, _746, _1029);
    float _1051 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1053 = _999 * 2.0;
    float _1055 = in.m_49.w;
    float _1057 = fma(_748, _748, _1049);
    float _1059 = _1007 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1061 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1063 = log2(_1061);
    float _1065 = in.m_53.w;
    float _1067 = _1007 + _999;
    float _1069 = fma(_1059, -2.0, _1051);
    float _1071 = _1007 * 2.0;
    float _1073 = -_138;
    float _1075 = fma(_1073, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1027);
    float _1077 = _1067 + (-1.0);
    float _1079 = floor(_1053);
    bool _1081 = _1047 > 0.0;
    bool _1083 = _1047 >= 0.0;
    bool _1085 = isnan(_1047);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan(0.0);
    bool _1091 = _1087 || _1089;
    float _1093 = rsqrt(_1057);
    float _1095 = _750 + _1007;
    float _1097 = _1063 * _138;
    float _1099 = fma(_1077, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1101 = _1023 + _1055;
    float _1103 = _1095 + (-1.0);
    float _1105 = floor(_1071);
    bool _1107 = _1079 >= 0.0;
    bool _1109 = isnan(_1079);
    bool _1111 = _1107 || _1109;
    bool _1113 = isnan(0.0);
    bool _1115 = _1111 || _1113;
    float _1117 = _1017 + _1045;
    float _1119 = _1031 + _1065;
    bool _1121 = _1079 > 0.0;
    float _1123 = exp2(_1097);
    float _1125 = fma(_1103, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1127 = _1091 ? 0 : 1;
    float _1129 = _1093 * _746;
    float _1131 = _1093 * _744;
    float _1133 = _1093 * _748;
    int _1135 = _1115 ? 0 : 1;
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1139 = _1105 > 0.0;
    float _1141 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1137);
    bool _1143 = _1105 >= 0.0;
    bool _1145 = isnan(_1105);
    bool _1147 = _1143 || _1145;
    bool _1149 = isnan(0.0);
    bool _1151 = _1147 || _1149;
    float _1153 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1155 = 1.0 + _1153;
    int _1157 = ~_1127;
    int _1159 = _1157 + 1;
    int _1161 = _1159 + 1;
    float _1163 = 1.0 / _1155;
    int _1165 = _1161;
    float _1167 = _1119;
    float _1169 = _997;
    if (!_1081)
    {
        int _1171 = ~_1127;
        int _1173 = _1171 + 1;
        _1165 = _1173;
    }
    int _1175 = _1165;
    float _1177 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1179 = !_1039;
    int _1181 = _1179 ? 0 : 1;
    float _1183 = in.m_61.x;
    float _1185 = in.m_61.y;
    float _1187 = in.m_61.z;
    bool _1189 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1191 = isnan(1.0);
    bool _1193 = _1189 || _1191;
    bool _1195 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1197 = _1193 || _1195;
    float _1199 = -_1123;
    float _1201 = _1199 + 1.0;
    int _1203 = abs(_1181);
    float _1205 = fma(_1007, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1177);
    bool _1207 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1209 = isnan(0.0);
    bool _1211 = _1207 || _1209;
    bool _1213 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1215 = _1211 || _1213;
    float _1217 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1141);
    float _1219 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1205);
    float _1221 = float(_1175);
    float _1223 = float(_1203);
    float _1225 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1069);
    float _1227 = _1215 ? _1201 : 0.0;
    bool _1229 = !_1035;
    int _1231 = _1229 ? 0 : 1;
    float _1233 = _1223 * _1221;
    int _1235 = _1151 ? 0 : 1;
    if (_1197)
    {
        float _1237 = _1227 * _1163;
        _142 = _1237;
    }
    float _1239 = _142;
    int _1241 = ~_1135;
    int _1243 = _1241 + 1;
    int _1245 = _1243 + 1;
    float _1247 = _1233 * (-2.0);
    int _1249 = _1245;
    if (!_1121)
    {
        int _1251 = ~_1135;
        int _1253 = _1251 + 1;
        _1249 = _1253;
    }
    int _1255 = _1249;
    int _1257 = abs(_1231);
    float _1259 = fma(_1247, _1185, _1185);
    int _1261 = ~_1235;
    int _1263 = _1261 + 1;
    int _1265 = _1263 + 1;
    float _1267 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1269 = _1101 + _1267;
    int _1271 = _1265;
    if (!_1139)
    {
        int _1273 = ~_1235;
        int _1275 = _1273 + 1;
        _1271 = _1275;
    }
    int _1277 = _1271;
    float _1279 = fma(_1099, _1247, _1099);
    float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1283 = _1117 + _1281;
    float _1285 = _1269 * _1269;
    float _1287 = _1007 + (-0.5);
    bool _1289 = !_1043;
    int _1291 = _1289 ? 0 : 1;
    float _1293 = float(_1257);
    float _1295 = fma(_1283, _1283, _1285);
    float _1297 = float(_1255);
    float _1299 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1301 = _1119 + _1299;
    float _1303 = fma(_1287, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1259);
    int _1305 = abs(_1291);
    float _1307 = _1293 * _1297;
    float _1309 = fma(_1301, _1301, _1295);
    float _1311 = _1131 * _482;
    float _1313 = fma(_1279, _1239, _1303);
    float _1315 = _1307 * (-2.0);
    float _1317 = fma(_1129, _476, _1311);
    float _1319 = _1313 * 0.15915493667125701904296875;
    float _1321 = _750 + (-0.5);
    float _1323 = float(_1305);
    float _1325 = fma(_1315, _1183, _1183);
    float _1327 = float(_1277);
    float _1329 = fma(_1133, _488, _1317);
    float _1331 = rsqrt(_1309);
    float _1333 = _750 + _999;
    float _1335 = fma(_1125, _1315, _1125);
    float _1337 = fma(_1321, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1325);
    float _1339 = _1323 * _1327;
    float _1341 = abs(_1329);
    bool _1343 = _1341 > 0.99989998340606689453125;
    float _1345 = _1333 + (-1.0);
    float _1347 = fma(_1335, _1239, _1337);
    float _1349 = _1339 * (-2.0);
    float _1351 = _999 + (-0.5);
    float _1353 = _1319 * 6.283185482025146484375;
    float _1355 = sin(_1353);
    float _1357 = fma(_1345, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1359 = _1347 * 0.15915493667125701904296875;
    float _1361 = fma(_1349, _1187, _1187);
    bool _1363 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1365 = isnan(0.5);
    bool _1367 = _1363 || _1365;
    bool _1369 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1371 = _1367 || _1369;
    float _1373 = fma(_1357, _1349, _1357);
    float _1375 = _1269 * _1331;
    float _1377 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1361);
    if (_1343)
    {
        float _1379 = _476 + _538;
        _478 = _1379;
    }
    float _1381 = _478;
    if (_1343)
    {
        float _1383 = _488 + _546;
        _494 = _1383;
    }
    float _1385 = _494;
    float _1387 = -_1375;
    float _1389 = fma(_1387, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1269);
    float _1391 = fma(_1373, _1239, _1377);
    if (_1343)
    {
        float _1393 = _482 + _542;
        _484 = _1393;
    }
    float _1395 = _484;
    float _1397 = _1319 * 6.283185482025146484375;
    float _1399 = cos(_1397);
    float _1401 = -_1385;
    float _1403 = _1131 * _1401;
    float _1405 = _1391 * 0.15915493667125701904296875;
    float _1407 = _1389 * _1389;
    float _1409 = -_1381;
    float _1411 = _1133 * _1409;
    float _1413 = -_1395;
    float _1415 = -_1403;
    float _1417 = fma(_1133, _1413, _1415);
    float _1419 = in.m_55.x;
    float _1421 = in.m_55.y;
    float _1423 = in.m_55.z;
    float _1425 = _1301 * _1331;
    float _1427 = -_1385;
    float _1429 = -_1411;
    float _1431 = fma(_1129, _1427, _1429);
    float _1433 = _1283 * _1331;
    float _1435 = -_1395;
    float _1437 = _1129 * _1435;
    float _1439 = -_1425;
    float _1441 = fma(_1439, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1301);
    float _1443 = _1431 * _1431;
    float _1445 = -_1433;
    float _1447 = fma(_1445, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1283);
    float _1449 = -_1381;
    float _1451 = -_1437;
    float _1453 = fma(_1131, _1449, _1451);
    float _1455 = _1359 * 6.283185482025146484375;
    float _1457 = sin(_1455);
    float _1459 = fma(_1417, _1417, _1443);
    float _1461 = fma(_1447, _1447, _1407);
    float _1463 = in.m_63.x;
    float _1465 = in.m_63.y;
    float _1467 = in.m_63.z;
    float _1469 = fma(_1453, _1453, _1459);
    float _1471 = fma(_1441, _1441, _1461);
    float _1473 = _1359 * 6.283185482025146484375;
    float _1475 = cos(_1473);
    float _1477 = _1419 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1479 = _1405 * 6.283185482025146484375;
    float _1481 = cos(_1479);
    float _1483 = _1421 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1485 = _1423 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1487 = _1457 * _1399;
    float _1489 = _1485 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1491 = rsqrt(_1469);
    float _1493 = _1475 * _1355;
    float _1495 = _1475 * _1399;
    float _1497 = sqrt(_1471);
    float _1499 = _1355 * _1481;
    float _1501 = _1399 * _1481;
    float _1503 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1463);
    float _1505 = _1405 * 6.283185482025146484375;
    float _1507 = sin(_1505);
    float _1509 = _1417 * _1491;
    float _1511 = _1483 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1513 = _1475 * _1481;
    float _1515 = _1431 * _1491;
    float _1517 = _1453 * _1491;
    float _1519 = _1513 * _1133;
    float _1521 = _1331 * _1497;
    float _1523 = _1457 * _1355;
    float _1525 = _1477 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1527 = _1457 * _1481;
    float _1529 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1465);
    float _1531 = _1511 * _1521;
    float _1533 = _1525 * _1521;
    float _1535 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1467);
    float _1537 = fma(_1507, _1495, _1523);
    float _1539 = _1489 * _1521;
    float _1541 = -_1493;
    float _1543 = fma(_1507, _1487, _1541);
    float _1545 = _1531 * _1529;
    float _1547 = -_1487;
    float _1549 = fma(_1507, _1493, _1547);
    float _1551 = _1539 * _1535;
    float _1553 = _1537 * _1133;
    float _1555 = _1129 * _1515;
    float _1557 = _1533 * _1503;
    float _1559 = -_1507;
    float _1561 = fma(_1559, _1517, _1519);
    float _1563 = _1549 * _1133;
    float _1565 = fma(_1501, _1517, _1553);
    float _1567 = _1513 * _1129;
    float _1569 = _1131 * _1517;
    float _1571 = -_1555;
    float _1573 = fma(_1131, _1509, _1571);
    float _1575 = fma(_1507, _1523, _1495);
    float _1577 = fma(_1499, _1517, _1563);
    float _1579 = -_1507;
    float _1581 = fma(_1579, _1509, _1567);
    float _1583 = _1537 * _1129;
    float _1585 = -_1569;
    float _1587 = fma(_1133, _1515, _1585);
    float _1589 = fma(_1543, _1573, _1565);
    float _1591 = fma(_1527, _1573, _1561);
    float _1593 = fma(_1575, _1573, _1577);
    float _1595 = _1549 * _1129;
    float _1597 = fma(_1501, _1509, _1583);
    float _1599 = fma(_1527, _1587, _1581);
    float _1601 = _1545 * _1591;
    float _1603 = fma(_1499, _1509, _1595);
    float _1605 = fma(_1543, _1587, _1597);
    float _1607 = _1545 * _1599;
    float _1609 = fma(_1557, _1589, _1601);
    float _1611 = fma(_1575, _1587, _1603);
    float _1613 = _1133 * _1509;
    float _1615 = fma(_1557, _1605, _1607);
    float _1617 = fma(_1551, _1593, _1609);
    float _1619 = _1549 * _1131;
    float _1621 = -_1613;
    float _1623 = fma(_1129, _1517, _1621);
    float _1625 = fma(_1551, _1611, _1615);
    float _1627 = _1119 + _1617;
    float _1629 = fma(_1499, _1515, _1619);
    float _1631 = _1117 + _1625;
    float _1633 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1635 = _1627 + _1633;
    float _1637 = fma(_1575, _1623, _1629);
    float _1639 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1641 = _1631 + _1639;
    float _1643 = _1635 * _1635;
    float _1645 = fma(_1641, _1641, _1643);
    float _1647 = _1513 * _1131;
    float _1649 = sqrt(_1645);
    float _1651 = -_1507;
    float _1653 = fma(_1651, _1515, _1647);
    float _1655 = _1537 * _1131;
    float _1657 = fma(_1527, _1623, _1653);
    float _1659 = fma(_1501, _1515, _1655);
    float _1661 = _1545 * _1657;
    float _1663 = fma(_1543, _1623, _1659);
    float _1665 = fma(_1557, _1663, _1661);
    float _1667 = -_1433;
    float _1669 = fma(_1667, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1117);
    bool _1671 = _1649 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1673 = fma(_1551, _1637, _1665);
    float _1675 = _1101 + _1673;
    float _1677 = _1629;
    float _1679 = _1501;
    float _1681 = _1631;
    float _1683 = _1521;
    float _1685 = _1659;
    float _1687 = _1623;
    float _1689 = _1517;
    if (!_1671)
    {
        _1677 = _1627;
    }
    float _1691 = _1677;
    float _1693 = _1691;
    if (!_1671)
    {
        _1679 = _1675;
    }
    float _1695 = _1679;
    bool _1697 = !_1671;
    float _1699 = _1695;
    if (!_1697)
    {
        float _1701 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1705 = _1649 + _1703;
        float _1707 = _1675 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1709 = rsqrt(_1645);
        float _1711 = _1705 * _1701;
        float _1713 = _1711 * 0.15915493667125701904296875;
        float _1715 = _1713 * 6.283185482025146484375;
        float _1717 = cos(_1715);
        float _1719 = _1713 * 6.283185482025146484375;
        float _1721 = sin(_1719);
        float _1723 = _1717 + (-1.0);
        float _1725 = fma(_1721, _1707, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1727 = _1723 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1729 = _1709 * _1725;
        float _1731 = fma(_1675, _1717, _1727);
        float _1733 = fma(_1641, _1729, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1735 = fma(_1635, _1729, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1681 = _1733;
        _1699 = _1731;
        _1693 = _1735;
    }
    float _1737 = _1681;
    float _1739 = _1699;
    float _1741 = _1693;
    float _1743 = -_1433;
    float _1745 = fma(_1743, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1737);
    float _1747 = -_1375;
    float _1749 = fma(_1747, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1739);
    float _1751 = -_1425;
    float _1753 = fma(_1751, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1741);
    float _1755 = -_1375;
    float _1757 = fma(_1755, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1101);
    float _1759 = -_1425;
    float _1761 = fma(_1759, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1119);
    float _1763 = _1749;
    float _1765 = _1745;
    float _1767 = _1753;
    if (!_1371)
    {
        float _1769 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1771 = _1757 + _1769;
        float _1773 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1775 = _1669 + _1773;
        float _1777 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1779 = -_1119;
        float _1781 = _1779 + _1741;
        float _1783 = _1771 * _1771;
        float _1785 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1787 = _1761 + _1785;
        float _1789 = -_1117;
        float _1791 = _1789 + _1737;
        float _1793 = -_1101;
        float _1795 = _1793 + _1739;
        float _1797 = fma(_1775, _1775, _1783);
        float _1799 = 1.0 / _1521;
        float _1801 = fma(_1787, _1787, _1797);
        float _1803 = sqrt(_1801);
        float _1805 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1807 = _1781 * _1799;
        float _1809 = _1791 * _1799;
        float _1811 = _1795 * _1799;
        bool _1813 = _1803 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1815 = isnan(_1803);
        bool _1817 = _1813 || _1815;
        bool _1819 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1821 = _1817 || _1819;
        float _1823 = precise::min(_1803, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1825 = _1823 * _1777;
        float _1827 = _1805 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1829 = _1827 * _1825;
        float _1831 = _1425;
        float _1833 = _1827;
        _1685 = _1829;
        _1687 = _1799;
        if (_1821)
        {
            float _1835 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1831 = _1835;
        }
        float _1837 = _1831;
        if (_1821)
        {
            float _1839 = precise::max(_1803, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1683 = _1839;
        }
        float _1841 = _1683;
        float _1843 = fma(_1807, _1829, _1761);
        float _1845 = fma(_1809, _1829, _1669);
        float _1847 = fma(_1811, _1829, _1757);
        float _1849 = _1841;
        float _1851 = _1845;
        float _1853 = _1847;
        if (_1821)
        {
            float _1855 = _1841 * _1837;
            _1849 = _1855;
        }
        float _1857 = _1849;
        float _1859 = _1857;
        if (_1821)
        {
            float _1861 = _1827 * _1857;
            _1859 = _1861;
        }
        float _1863 = _1859;
        if (!_1821)
        {
            _1833 = _1843;
        }
        float _1865 = _1833;
        _1767 = _1865;
        if (_1821)
        {
            float _1867 = fma(_1809, _1863, _1669);
            _1851 = _1867;
        }
        float _1869 = _1851;
        _1765 = _1869;
        if (_1821)
        {
            float _1871 = fma(_1811, _1863, _1757);
            _1853 = _1871;
        }
        float _1873 = _1853;
        _1763 = _1873;
        if (_1821)
        {
            float _1875 = fma(_1807, _1863, _1761);
            _1767 = _1875;
        }
    }
    float _1877 = _1763;
    float _1879 = _1765;
    float _1881 = _1767;
    float _1883 = _1685;
    float _1885 = _1687;
    float _1887 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1889 = _1877 + _1887;
    float _1891 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1893 = _1879 + _1891;
    float _1895 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1897 = _1881 + _1895;
    float _1899 = _1889 * _1889;
    float _1901 = fma(_1893, _1893, _1899);
    float _1903 = fma(_1897, _1897, _1901);
    float _1905 = rsqrt(_1903);
    float _1907 = sqrt(_1903);
    float _1909 = _1905 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1911 = _1893 * _1909;
    float _1913 = _1897 * _1909;
    float _1915 = _1911 * _1911;
    float _1917 = _1913 * _1913;
    float _1919 = _1915 + _1917;
    float _1921 = sqrt(_1919);
    bool _1923 = _1921 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1925 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1927 = _1921 + _1925;
    float _1929 = _1901;
    float _1931 = _1883;
    float _1933 = _1927;
    float _1935 = _1885;
    if (_1923)
    {
        float _1937 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1929 = _1937;
    }
    float _1939 = _1929;
    if (_1923)
    {
        float _1941 = rsqrt(_1919);
        _1931 = _1941;
    }
    float _1943 = _1931;
    float _1945 = _1943;
    if (_1923)
    {
        float _1947 = _1927 * _1939;
        _1933 = _1947;
    }
    float _1949 = _1933;
    if (_1923)
    {
        float _1951 = _1949 * 0.15915493667125701904296875;
        _1167 = _1951;
    }
    float _1953 = _1167;
    float _1955 = _1939;
    float _1957 = _1953;
    if (_1923)
    {
        float _1959 = _1953 * 6.283185482025146484375;
        float _1961 = sin(_1959);
        _1955 = _1961;
    }
    float _1963 = _1955;
    float _1965 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1967 = precise::max(0.0, _1965);
    float _1969 = _1101;
    float _1971 = _1967;
    if (_1923)
    {
        float _1973 = _1953 * 6.283185482025146484375;
        float _1975 = cos(_1973);
        _1969 = _1975;
    }
    float _1977 = _1969;
    float _1979 = -_1909;
    float _1981 = -_1967;
    float _1983 = fma(_1889, _1979, _1981);
    if (_1923)
    {
        float _1985 = _1983 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1971 = _1985;
    }
    float _1987 = _1971;
    float _1989 = _1987;
    if (!_1923)
    {
        _1957 = _1915;
    }
    float _1991 = _1957;
    float _1993 = _1963;
    float _1995 = _1991;
    if (_1923)
    {
        float _1997 = fma(_1963, _1987, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1993 = _1997;
    }
    float _1999 = _1993;
    float _2001 = _1999;
    float _2003 = _1977;
    if (_1923)
    {
        float _2005 = _1977 + (-1.0);
        _1989 = _2005;
    }
    float _2007 = _1989;
    float _2009 = _2007;
    if (_1923)
    {
        float _2011 = _1943 * _1999;
        _1689 = _2011;
    }
    float _2013 = _1689;
    if (!_1923)
    {
        _1945 = _1911;
    }
    float _2015 = _1945;
    float _2017 = _2015;
    if (_1923)
    {
        float _2019 = _2007 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1935 = _2019;
    }
    float _2021 = _1935;
    if (_1923)
    {
        float _2023 = _1911 * _2013;
        _2017 = _2023;
    }
    float _2025 = _2017;
    if (!_1923)
    {
        _2001 = _1983;
    }
    float _2027 = _2001;
    float _2029 = _2027;
    if (!_1923)
    {
        _2009 = _1913;
    }
    float _2031 = _2009;
    float _2033 = _2031;
    if (_1923)
    {
        float _2035 = fma(_1983, _1977, _2021);
        _2029 = _2035;
    }
    float _2037 = _2029;
    if (_1923)
    {
        float _2039 = _1913 * _2013;
        _2033 = _2039;
    }
    float _2041 = _2033;
    if (_1923)
    {
        float _2043 = _2025 * _2025;
        _1995 = _2043;
    }
    float _2045 = _1995;
    if (!_1923)
    {
        _2003 = _1917;
    }
    float _2047 = _2003;
    float _2049 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2051 = _2047;
    if (_1923)
    {
        float _2053 = _2041 * _2041;
        _2051 = _2053;
    }
    float _2055 = _2051;
    float _2057 = fma(_2037, _2037, _2045);
    float _2059 = _1877 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2061 = _2057 + _2055;
    float _2063 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2059);
    float _2065 = _1877 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2069 = fma(_1907, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2067);
    float _2071 = precise::clamp(_2069, 0.0, 1.0);
    float _2073 = _1877 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2075 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2063);
    float _2077 = rsqrt(_2061);
    float _2079 = _1877 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2081 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2065);
    float _2083 = -_2071;
    float _2085 = _2083 + 1.0;
    float _2087 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2073);
    float _2089 = fma(_1879, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2079);
    float _2091 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2081);
    float _2093 = _2075 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2095 = abs(_2085);
    float _2097 = log2(_2095);
    float _2099 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2089);
    float _2101 = _2091 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2103 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2087);
    float _2105 = _2093 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2107 = _2099 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2109 = _2101 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2111 = _2103 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2113 = _2077 * _2025;
    float _2115 = _2077 * _2041;
    float _2117 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2109);
    float _2119 = _2077 * _2037;
    float _2121 = _2113 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2123 = -_2105;
    float _2125 = fma(_2123, _2049, 1.0);
    float _2127 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2117);
    float _2129 = -_2121;
    float _2131 = fma(_2119, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2129);
    float _2133 = _2097 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2135 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2127);
    float _2137 = log2(_2125);
    float _2139 = -_2115;
    float _2141 = fma(_2139, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2131);
    float _2143 = _2101 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2145 = _2101 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2147 = fma(_2141, -0.5, 0.5);
    float _2149 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2143);
    float _2151 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2145);
    float _2153 = exp2(_2133);
    float _2155 = fma(_2141, 0.5, 0.5);
    float _2157 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2149);
    float _2159 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2151);
    float _2161 = _2119 + 1.0;
    float _2163 = fma(_2155, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2165 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2157);
    float _2167 = 1.0 / _2135;
    float _2169 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2159);
    float _2171 = fma(_2155, _2163, -0.212114393711090087890625);
    float _2173 = _2137 * 0.693147182464599609375;
    float _2175 = fma(_2155, _2171, 1.570728778839111328125);
    float _2177 = _2173 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2179 = sqrt(_2147);
    float _2181 = -_2119;
    float _2183 = fma(_2153, _2161, _2181);
    float _2185 = fma(_2183, 0.5, 0.5);
    float _2187 = _2165 * _2167;
    float _2189 = _2169 * _2167;
    float _2191 = fma(_2187, 0.5, 0.5);
    float _2193 = fma(_2189, -0.5, 0.5);
    float _2195 = _2179 * 0.636619746685028076171875;
    float _2197 = -_2175;
    float _2199 = fma(_2195, _2197, 1.0);
    float3 _5988 = float3(_2191, _2193, _2177);
    float _2201 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5988, float3(0.0), isnan(_5988)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5988, float3(0.0), isnan(_5988)), level(0.0)).x;
    float3 _5999 = float3(_2191, _2193, _2177);
    float4 _2204 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5999, float3(0.0), isnan(_5999)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5999, float3(0.0), isnan(_5999)), level(0.0)).xyzw;
    float _2206 = _2204.x;
    float _2208 = _2204.y;
    float _2210 = _2204.z;
    float _2212 = _2204.w;
    float2 _6016 = float2(_2199, _2185);
    float3 _2216 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6016, float2(0.0), isnan(_6016)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6016, float2(0.0), isnan(_6016)), level(0.0)).xyz;
    float _2218 = _2216.x;
    float _2220 = _2216.y;
    float _2222 = _2216.z;
    float _2224 = in.m_65.y;
    float _2226 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2228 = in.m_67.w;
    float _2230 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2232 = _2230 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2236 = _2234 != 0;
    float _2238 = _2097 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2240 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2242 = _2240 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2244 = _1007 > 0.5;
    float _2246 = 1.0 / _2232;
    float _2248 = _1757 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2250 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2252 = _2250 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2254 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2256 = isnan(0.5);
    bool _2258 = _2254 || _2256;
    bool _2260 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2262 = _2258 || _2260;
    float _2264 = _2101 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2268 = _2266 != 0;
    float _2270 = _2226 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2272 = 1.0 / _2252;
    bool _2274 = _750 > 0.5;
    bool _2276 = _2274 && _2268;
    float _2278 = fma(_2107, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2264);
    float _2280 = -_2224;
    float _2282 = _2280 + 1.0;
    float _2284 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2286 = _2284 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2288 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2278);
    out.m_69.y = _1877;
    float _2290 = 1.0 / _2242;
    float _2292 = _2224;
    if (_2236)
    {
        float _2294 = _2244 ? _2282 : _2224;
        _2292 = _2294;
    }
    float _2296 = _2292;
    float _2298 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2300 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2298;
    out.m_71.w = _2228;
    bool _2302 = _1465 != 0.0;
    bool _2304 = isnan(_1465);
    bool _2306 = _2302 || _2304;
    bool _2308 = isnan(0.0);
    bool _2310 = _2306 || _2308;
    float _2312 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2288);
    float _2314 = _2300 * _2246;
    float _2316 = fma(_2270, _2296, -0.5);
    bool _2318 = _1463 == 0.0;
    bool _2320 = !_2310;
    bool _2322 = _2318 && _2320;
    float _2324 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2248);
    float _2326 = _1757 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2328 = -_1225;
    float _2330 = fma(_1219, _2316, _2328);
    float _2332 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2324);
    float _2334 = fma(_1669, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2326);
    float _2336 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2338 = _997 + _2336;
    float _2340 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2342 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2340;
    float _2344 = _2332 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2346 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2334);
    float _2348 = _2286 * _2290;
    float _2350 = _2342 * _2272;
    float _2352 = 1.0 / _2344;
    float _2354 = in.m_65.x;
    float _2356 = _2346 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2358 = _997 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2360 = isnan(_997);
    bool _2362 = _2358 || _2360;
    bool _2364 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2366 = _2362 || _2364;
    float _2368 = float(_2366);
    bool _2370 = _997 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2372 = isnan(_997);
    bool _2374 = _2370 || _2372;
    bool _2376 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2378 = _2374 || _2376;
    float _2380 = float(_2378);
    float _2382 = _2356 + _2344;
    bool _2384 = _997 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2386 = isnan(_997);
    bool _2388 = _2384 || _2386;
    bool _2390 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2392 = _2388 || _2390;
    float _2394 = float(_2392);
    float _2396 = -_2368;
    float _2398 = _2396 + 1.0;
    bool _2400 = _997 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2402 = isnan(_997);
    bool _2404 = _2400 || _2402;
    bool _2406 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2408 = _2404 || _2406;
    float _2410 = float(_2408);
    float _2412 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2414 = _997 + _2412;
    bool _2416 = _1467 == 0.0;
    bool _2418 = _2416 && _2322;
    float _2420 = _2380 * _2398;
    float _2422 = -_2380;
    float _2424 = _2422 + 1.0;
    float _2426 = fma(_2314, _2338, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2428 = fma(_2348, _2414, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2430 = _2382 * _2352;
    float _2432 = _2430 * 0.5;
    float _2434 = -_2394;
    float _2436 = _2434 + 1.0;
    float _2438 = _2394 * _2424;
    float _2440 = _2414;
    float _2442 = _2432;
    float _2444 = _2426;
    if (!_2262)
    {
        _2440 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2446 = _2440;
    float _2448 = in.m_73.x;
    float _2450 = in.m_73.y;
    float _2452 = in.m_73.z;
    float _2454 = _2410 * _2436;
    float _2456 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2458 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2456);
    float _2460 = -_2410;
    float _2462 = _2460 + 1.0;
    float _2464 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2466 = _2426 * _2454;
    float _2468 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2470 = _997 + _2468;
    float _2472 = _2354;
    float _2474 = _2470;
    float _2476 = _2446;
    if (_2268)
    {
        _2442 = _2354;
    }
    float _2478 = _2442;
    float _2480 = _2478;
    if (!_2262)
    {
        float _2482 = -_2446;
        float _2484 = _2482 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2444 = _2484;
    }
    float _2486 = _2444;
    if (!_2268)
    {
        _1169 = _2354;
    }
    float _2488 = _1169;
    float _2490 = fma(_2462, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2466);
    float _2492 = _2488;
    if (!_2262)
    {
        _2472 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2494 = _2472;
    float _2496 = fma(_2350, _2470, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2498 = 1.0 / _2458;
    float _2500 = fma(_2428, _2438, _2490);
    float _2502 = _2494;
    if (_2276)
    {
        float _2504 = -_2478;
        float _2506 = _2504 + 1.0;
        _2480 = _2506;
    }
    float _2508 = _2480;
    if (!_2262)
    {
        float _2510 = -_2494;
        float _2512 = _2510 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2474 = _2512;
    }
    float _2514 = _2474;
    out.m_75.x = _1893;
    out.m_75.y = _1889;
    out.m_75.z = _1897;
    float _2516 = fma(_2496, _2420, _2500);
    float _2518 = _2516;
    if (_2268)
    {
        _2492 = _2508;
    }
    float _2520 = _2492;
    float _2522 = _2428;
    float _2524 = _2520;
    if (!_2262)
    {
        float _2526 = 1.0 / _2514;
        _2522 = _2526;
    }
    float _2528 = _2522;
    float _2530 = fma(_2368, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2516);
    if (_2262)
    {
        _2518 = 1.0;
    }
    float _2532 = _2518;
    float _2534 = _2448;
    float _2536 = _2450;
    float _2538 = _2452;
    float _2540 = _2532;
    if (!_2418)
    {
        float _2542 = fma(_1463, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2448);
        _2534 = _2542;
    }
    float _2544 = _2534;
    float _2546 = _2464 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_2418)
    {
        float _2548 = fma(_1465, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2450);
        _2536 = _2548;
    }
    float _2550 = _2536;
    if (!_2418)
    {
        float _2552 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2452);
        _2538 = _2552;
    }
    float _2554 = _2538;
    float _2556 = _2486;
    if (!_2262)
    {
        float _2558 = 1.0 / _2486;
        _2556 = _2558;
    }
    float _2560 = _2556;
    if (!_2262)
    {
        float _2562 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2564 = -_2494;
        float _2566 = fma(_2498, _2562, _2564);
        _2502 = _2566;
    }
    float _2568 = _2502;
    float _2570 = _2568;
    if (!_2262)
    {
        float _2572 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2574 = -_2446;
        float _2576 = fma(_2498, _2572, _2574);
        _2476 = _2576;
    }
    float _2578 = _2476;
    float _2580 = fma(_2546, _2520, -0.5);
    if (_2262)
    {
        _2524 = 1.0;
    }
    float _2582 = _2524;
    float _2584 = _1599 * _2550;
    float _2586 = _1657 * _2550;
    float _2588 = fma(_1217, _2580, _1075);
    float _2590 = _2582;
    if (!_2262)
    {
        float _2592 = _2568 * _2528;
        float _2594 = precise::clamp(_2592, 0.0, 1.0);
        _2570 = _2594;
    }
    float _2596 = _2570;
    float _2598 = exp2(_2238);
    float _2600 = fma(_1605, _2544, _2584);
    float _2602 = _1591 * _2550;
    if (!_2262)
    {
        float _2604 = -_2596;
        float _2606 = _2604 + 1.0;
        _2540 = _2606;
    }
    float _2608 = _2540;
    float _2610 = _2330 + 0.5;
    float _2612 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2614 = _2312 + _2612;
    float _2616 = fma(_1663, _2544, _2586);
    if (!_2262)
    {
        float _2618 = _2578 * _2560;
        float _2620 = precise::clamp(_2618, 0.0, 1.0);
        _2590 = _2620;
    }
    float _2622 = _2590;
    float _2624 = fma(_1589, _2544, _2602);
    float _2626 = _2622 * _2608;
    float _2628 = fma(_1611, _2554, _2600);
    float _2630 = fma(_1637, _2554, _2616);
    float _2632 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2634 = _2626 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2636 = -_2598;
    float _2638 = _2636 + 1.0;
    float _2640 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2642 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2644 = _2634 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2646 = _2135 + _2614;
    float _2648 = fma(_1593, _2554, _2624);
    float _2650 = _2632 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2652 = _2640 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2654 = _2646 * 0.5;
    float _2656 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2658 = _2642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2660 = _2530 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2662 = _2622 > 0.0;
    bool _2664 = isnan(_2622);
    bool _2666 = _2662 || _2664;
    bool _2668 = isnan(0.0);
    bool _2670 = _2666 || _2668;
    float _2672 = _2588 + 0.5;
    out.m_45.x = _2644;
    bool _2674 = _2608 <= 0.0;
    bool _2676 = !_2670;
    bool _2678 = _2674 || _2676;
    out.m_77.x = _2650;
    out.m_77.y = _2652;
    out.m_77.z = _2658;
    out.m_77.w = _2660;
    out.m_79.x = _2672;
    out.m_79.y = _2610;
    out.m_81.x = _2628;
    out.m_81.y = _2630;
    out.m_81.z = _2648;
    out.gl_Position.x = _2165;
    out.gl_Position.y = _2169;
    out.gl_Position.z = _2614;
    out.gl_Position.w = _2135;
    float _2680 = -_2656;
    float _2682 = _2680 + 1.0;
    out.m_83.z = _2654;
    out.m_83.w = _2135;
    float _2684 = _2656 * _2201;
    float _2686 = _2212 * _2682;
    float _2688 = _2212 * _2684;
    float _2690 = _2222 * _2684;
    float _2692 = fma(_2218, _2688, _2206);
    float _2694 = fma(_2220, _2688, _2208);
    float _2696 = fma(_2212, _2690, _2210);
    out.m_85.x = _2692;
    out.m_85.y = _2694;
    out.m_85.z = _2696;
    out.m_85.w = _2686;
    if (!_2678)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2698 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2698;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

