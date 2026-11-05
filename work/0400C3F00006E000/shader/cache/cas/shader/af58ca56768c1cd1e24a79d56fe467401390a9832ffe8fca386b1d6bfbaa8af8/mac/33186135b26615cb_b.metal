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
    float4 m_75 [[user(locn1)]];
    float4 m_71 [[user(locn2)]];
    float4 m_77 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_73 [[user(locn5)]];
    float4 m_67 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
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
    float4 m_63 [[attribute(8)]];
    float4 m_57 [[attribute(9)]];
    float4 m_55 [[attribute(10)]];
    float4 m_65 [[attribute(12)]];
    float4 m_69 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _987 = false;
    bool _782 = false;
    bool _610 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_42.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_45.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2659 = as_type<float>(_114);
        out.gl_Position.z = _2659;
    }
    if (!_102)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _118 = in.m_47.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _134 = 0.0;
    float _136 = 0.0;
    float _138 = _132;
    if (_128)
    {
        float _140 = float(_98);
        _134 = _140;
    }
    float _142 = _134;
    bool _144 = _132 >= _142;
    bool _146 = !_128;
    bool _148 = _144 || _146;
    if (_148)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _108;
    if (_148)
    {
        out.m_45.x = 0.0;
    }
    if (_148)
    {
        float _152 = _150 * 5.0;
        _116 = as_type<int>(_152);
    }
    int _154 = _116;
    float _156 = as_type<float>(_154);
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2730 = as_type<float>(_154);
        out.gl_Position.z = _2730;
    }
    if (_148)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _158 = in.m_49.y;
    float _160 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _162 = in.m_51.y;
    bool _164 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _166 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _168 = _164 || _166;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    float _174 = in.m_53.y;
    float _176 = in.m_49.z;
    float _178 = in.m_51.z;
    float _180 = _160;
    if (!_172)
    {
        float _182 = _160 * _160;
        float _184 = _182 * 0.5;
        _156 = _184;
    }
    float _186 = _156;
    float _188 = 0.0;
    float _190 = _186;
    if (!_172)
    {
        float _192 = _132 * _132;
        float _194 = _192 * 0.5;
        _188 = _194;
    }
    float _196 = _188;
    float _198 = in.m_53.z;
    if (!_172)
    {
        float _200 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _200;
    }
    float _202 = _190;
    float _204 = _158 * _158;
    float _206 = fma(_162, _162, _204);
    float _208 = fma(_174, _174, _206);
    float _210 = in.m_47.x;
    float _212 = in.m_47.y;
    float _214 = in.m_47.z;
    float _216 = sqrt(_208);
    bool _218 = _216 > 0.0;
    float _220 = _176 * _176;
    float _222 = fma(_178, _178, _220);
    bool _224 = !_172;
    float _226 = _202;
    float _228 = 0.0;
    float _230 = _222;
    if (!_224)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = _160 * _234;
        float _244 = 1.0 / _238;
        float _246 = _240 * 0.693147182464599609375;
        float _248 = exp2(_242);
        float _250 = 1.0 / _246;
        float _252 = _248 + (-1.0);
        float _254 = -_252;
        float _256 = fma(_254, _250, _160);
        float _258 = _256 * _244;
        float _260 = _258 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _136 = _250;
        _226 = _260;
        _228 = _244;
    }
    float _262 = _136;
    float _264 = _226;
    float _266 = _228;
    bool _268 = !_172;
    float _270 = _262;
    float _272 = _266;
    if (!_268)
    {
        float _274 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _276 = log2(_274);
        float _278 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _280 = _278 + 1.0;
        float _282 = 1.0 / _280;
        float _284 = _160 * _276;
        float _286 = exp2(_284);
        float _288 = -_286;
        float _290 = _288 + 1.0;
        float _292 = _290 * _282;
        _270 = _280;
        _180 = _292;
    }
    float _294 = _270;
    float _296 = _180;
    float _298 = fma(_198, _198, _222);
    float _300 = _294;
    if (!_172)
    {
        _300 = _132;
    }
    float _302 = _300;
    float _304 = _302;
    if (!_172)
    {
        float _306 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _230 = _306;
    }
    float _308 = _230;
    bool _310 = !_172;
    float _312 = _308;
    if (!_310)
    {
        float _314 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _316 = log2(_314);
        float _318 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _320 = _318 + 1.0;
        float _322 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _324 = _132 * _316;
        float _326 = 1.0 / _320;
        float _328 = _322 * 0.693147182464599609375;
        float _330 = exp2(_324);
        float _332 = 1.0 / _328;
        float _334 = _330 + (-1.0);
        float _336 = -_334;
        float _338 = fma(_336, _332, _132);
        float _340 = _338 * _326;
        float _342 = _340 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _312 = _342;
        _272 = _332;
    }
    float _344 = _312;
    float _346 = _272;
    bool _348 = !_172;
    if (!_348)
    {
        float _350 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _352 = log2(_350);
        float _354 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _356 = _354 + 1.0;
        float _358 = 1.0 / _356;
        float _360 = _132 * _352;
        float _362 = exp2(_360);
        float _364 = -_362;
        float _366 = _364 + 1.0;
        float _368 = _366 * _358;
        _304 = _368;
    }
    float _370 = _304;
    float _372 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _374 = _344 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _376 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _378 = _344 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _380 = fma(_296, _212, _372);
    float _382 = fma(_370, _212, _374);
    float _384 = fma(_296, _210, _376);
    float _386 = sqrt(_298);
    float _388 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _390 = _344 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _392 = fma(_370, _210, _378);
    float _394 = -_382;
    float _396 = _380 + _394;
    float _398 = fma(_296, _214, _388);
    float _400 = fma(_370, _214, _390);
    float _402 = -_392;
    float _404 = _384 + _402;
    float _406 = _396 * _396;
    float _408 = in.m_49.x;
    float _410 = -_400;
    float _412 = _398 + _410;
    float _414 = _346;
    float _416 = _382;
    float _418 = _390;
    float _420 = _378;
    if (_218)
    {
        float _422 = rsqrt(_208);
        _414 = _422;
    }
    float _424 = _414;
    float _426 = fma(_404, _404, _406);
    float _428 = in.m_53.x;
    if (!_218)
    {
        _416 = 0.0;
        _418 = 0.0;
    }
    float _430 = _416;
    float _432 = _418;
    float _434 = _430;
    float _436 = _432;
    if (!_218)
    {
        _420 = 0.0;
    }
    float _438 = _420;
    float _440 = fma(_412, _412, _426);
    bool _442 = _386 > 0.0;
    float _444 = in.m_55.w;
    float _446 = _396 * _158;
    float _448 = _396 * _174;
    float _450 = in.m_51.x;
    float _452 = sqrt(_440);
    float _454 = in.m_42.x;
    float _456 = in.m_42.y;
    float _458 = in.m_42.z;
    float _460 = _438;
    float _462 = _424;
    if (_218)
    {
        float _464 = _424 * _162;
        _460 = _464;
    }
    float _466 = _460;
    float _468 = _466;
    if (_218)
    {
        float _470 = _424 * _158;
        _434 = _470;
    }
    float _472 = _434;
    float _474 = _472;
    if (_218)
    {
        float _476 = _424 * _174;
        _436 = _476;
    }
    float _478 = _436;
    float _480 = 0.0;
    float _482 = _478;
    if (!_442)
    {
        _480 = 0.0;
    }
    float _484 = _480;
    float _486 = 0.0;
    float _488 = _484;
    if (_442)
    {
        float _490 = rsqrt(_298);
        _486 = _490;
    }
    float _492 = _486;
    if (!_442)
    {
        _462 = 0.0;
    }
    float _494 = _462;
    float _496 = fma(_404, _408, _446);
    float _498 = 0.0;
    float _500 = _494;
    float _502 = _496;
    if (!_442)
    {
        _498 = 0.0;
    }
    float _504 = _498;
    float _506 = fma(_404, _428, _448);
    bool _508 = _452 >= 9.9999999747524270787835121154785e-07;
    bool _510 = isnan(_452);
    bool _512 = _508 || _510;
    bool _514 = isnan(9.9999999747524270787835121154785e-07);
    bool _516 = _512 || _514;
    float _518 = _396 * _162;
    float _520 = fma(_412, _176, _496);
    float _522 = fma(_404, _450, _518);
    float _524 = 0.0;
    float _526 = _504;
    float _528 = _506;
    if (_442)
    {
        float _530 = _492 * 0.001000000047497451305389404296875;
        _524 = _530;
    }
    float _532 = _524;
    float _534 = fma(_412, _198, _506);
    float _536 = fma(_412, _178, _522);
    float _538 = _534;
    float _540 = _534;
    if (_442)
    {
        float _542 = _178 * _532;
        _488 = _542;
    }
    float _544 = _488;
    if (_442)
    {
        float _546 = _176 * _532;
        _500 = _546;
    }
    float _548 = _500;
    if (_442)
    {
        float _550 = _198 * _532;
        _526 = _550;
    }
    float _552 = _526;
    float _554 = fma(_384, _444, _454);
    float _556 = fma(_380, _444, _456);
    float _558 = fma(_398, _444, _458);
    if (_516)
    {
        _502 = _536;
    }
    float _560 = _502;
    float _562 = _560;
    float _564 = _560;
    if (_516)
    {
        _528 = _520;
    }
    float _566 = _528;
    float _568 = _566;
    float _570 = _566;
    if (!_516)
    {
        bool _572 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _574 = !_572;
        if (!_574)
        {
            float _576 = _158 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _578 = _162 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _580 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _582 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[16].x, _576);
            float _584 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[16].x, _578);
            float _586 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[16].x, _580);
            float _588 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[16].z, _582);
            float _590 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[16].z, _584);
            float _592 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[16].z, _586);
            float _594 = _588 * _588;
            float _596 = fma(_590, _590, _594);
            float _598 = fma(_592, _592, _596);
            float _600 = rsqrt(_598);
            float _602 = _600 * 9.9999999747524270787835121154785e-07;
            float _604 = _590 * _602;
            float _606 = _588 * _602;
            float _608 = _592 * _602;
            _570 = _606;
            _564 = _604;
            _540 = _608;
            _610 = true;
        }
        else
        {
            float _612 = _212 * _212;
            float _614 = fma(_210, _210, _612);
            float _616 = fma(_214, _214, _614);
            float _618 = sqrt(_616);
            bool _620 = _618 >= 9.9999999747524270787835121154785e-07;
            bool _622 = isnan(_618);
            bool _624 = _620 || _622;
            bool _626 = isnan(9.9999999747524270787835121154785e-07);
            bool _628 = _624 || _626;
            if (!_628)
            {
                float _630 = _456 * _456;
                float _632 = fma(_454, _454, _630);
                float _634 = fma(_458, _458, _632);
                float _636 = sqrt(_634);
                bool _638 = _636 >= 9.9999999747524270787835121154785e-07;
                bool _640 = isnan(_636);
                bool _642 = _638 || _640;
                bool _644 = isnan(9.9999999747524270787835121154785e-07);
                bool _646 = _642 || _644;
                float _648 = _208;
                if (!_646)
                {
                    float _650 = rsqrt(_208);
                    _648 = _650;
                }
                float _652 = _648;
                if (!_646)
                {
                    float _654 = _652 * 9.9999999747524270787835121154785e-07;
                    _538 = _654;
                }
                float _656 = _538;
                float _658 = _656;
                if (!_646)
                {
                    float _660 = _162 * _656;
                    _562 = _660;
                }
                float _662 = _562;
                _564 = _662;
                if (!_646)
                {
                    float _664 = _158 * _656;
                    _568 = _664;
                }
                float _666 = _568;
                _570 = _666;
                if (!_646)
                {
                    float _668 = _174 * _656;
                    _658 = _668;
                }
                float _670 = _658;
                bool _672 = !_646;
                _540 = _670;
                _610 = _672;
                if (!_610)
                {
                    float _674 = _158 * _456;
                    float _676 = _162 * _456;
                    float _678 = _174 * _456;
                    float _680 = fma(_454, _408, _674);
                    float _682 = fma(_454, _450, _676);
                    float _684 = fma(_454, _428, _678);
                    float _686 = fma(_176, _458, _680);
                    float _688 = fma(_178, _458, _682);
                    float _690 = fma(_198, _458, _684);
                    float _692 = _686 * _686;
                    float _694 = fma(_688, _688, _692);
                    float _696 = fma(_690, _690, _694);
                    float _698 = rsqrt(_696);
                    float _700 = _698 * 9.9999999747524270787835121154785e-07;
                    float _702 = _688 * _700;
                    float _704 = _686 * _700;
                    float _706 = _690 * _700;
                    _570 = _704;
                    _564 = _702;
                    _540 = _706;
                    _610 = true;
                }
            }
            else
            {
                float _708 = _158 * _212;
                float _710 = _162 * _212;
                float _712 = _174 * _212;
                float _714 = fma(_210, _408, _708);
                float _716 = fma(_210, _450, _710);
                float _718 = fma(_210, _428, _712);
                float _720 = fma(_176, _214, _714);
                float _722 = fma(_178, _214, _716);
                float _724 = fma(_198, _214, _718);
                float _726 = _720 * _720;
                float _728 = fma(_722, _722, _726);
                float _730 = fma(_724, _724, _728);
                float _732 = rsqrt(_730);
                float _734 = _732 * 9.9999999747524270787835121154785e-07;
                float _736 = _722 * _734;
                float _738 = _720 * _734;
                float _740 = _724 * _734;
                _570 = _738;
                _564 = _736;
                _540 = _740;
            }
        }
    }
    _610 = false;
    float _742 = _570;
    float _744 = _564;
    float _746 = _540;
    float _748 = in.m_57.x;
    float _750 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _752 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _754 = _750 * _748;
    float _756 = trunc(_754);
    int _758 = int(_756);
    int _760 = _758 << 4;
    int _762 = _760 + 1712;
    bool _764 = !_752;
    float _780;
    if (!_764)
    {
        float _766 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _768 = _748 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _770 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _772 = _770 * _766;
        float _774 = floor(_772);
        float _776 = -_774;
        float _778 = _772 + _776;
        _780 = _778;
        _782 = true;
    }
    else
    {
        float _784 = float(_98);
        float _786 = 1.0 / _784;
        float _788 = _132 * _786;
        _780 = _788;
    }
    _782 = false;
    float _790 = _780;
    int _792 = _762 + 8;
    uint _795 = uint(int(uint(_792) >> uint(2)));
    uint _797 = uint(int(uint(int(_795)) >> uint(2)));
    int _799 = int(_795) & 3;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[int(_797)][_799];
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _805 = _790 + _803;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _809 = _807 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _813 = _811 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _815 = _790 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _817 = isnan(_790);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    uint _827 = uint(int(uint(_762) >> uint(2)));
    uint _829 = uint(int(uint(int(_827)) >> uint(2)));
    int _831 = int(_827) & 3;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[int(_829)][_831];
    int _835 = int(_827) + 1;
    uint _837 = uint(int(uint(_835) >> uint(2)));
    int _839 = _835 & 3;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[int(_837)][_839];
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _847 = 1.0 / _809;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _849;
    bool _853 = _790 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _855 = isnan(_790);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = -_825;
    float _867 = _865 + 1.0;
    bool _869 = _790 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _871 = isnan(_790);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = 1.0 / _813;
    bool _883 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _885;
    float _889 = 1.0 / _845;
    float _891 = _851 * _847;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _897 = _863 * _867;
    float _899 = -_863;
    float _901 = _899 + 1.0;
    float _903 = fma(_891, _805, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _905 = _790 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _907 = isnan(_790);
    bool _909 = _905 || _907;
    bool _911 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _913 = _909 || _911;
    float _915 = float(_913);
    float _917 = _879 * _901;
    float _919 = _895 * _881;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _923 = _790 + _921;
    float _925 = -_879;
    float _927 = _925 + 1.0;
    float _929 = _903 * _917;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _933 = _790 + _931;
    float _935 = fma(_919, _923, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _937 = -_915;
    float _939 = _937 + 1.0;
    float _941 = _887 * _889;
    float _943 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[115].x, _929);
    float _945 = _825 * _939;
    float _947 = fma(_941, _933, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _949 = fma(_935, _897, _943);
    float _951 = _801 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _953 = fma(_947, _945, _949);
    float _955 = _951 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _957 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[118].x, _953);
    float _959 = _833 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _961 = _841 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _963 = _957 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _965 = _959 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _967 = _961 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _965;
    out.m_59.y = _967;
    out.m_59.z = _955;
    out.m_59.w = _963;
    bool _969 = !_883;
    float _985;
    if (!_969)
    {
        float _971 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _973 = _748 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _975 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[11].w, _132);
        float _977 = _975 * _971;
        float _979 = floor(_977);
        float _981 = -_979;
        float _983 = _977 + _981;
        _985 = _983;
        _987 = true;
    }
    else
    {
        float _989 = float(_98);
        float _991 = 1.0 / _989;
        float _993 = _132 * _991;
        _985 = _993;
    }
    _987 = false;
    float _995 = _985;
    float _997 = in.m_57.z;
    float _999 = _556 * _158;
    float _1001 = _556 * _162;
    float _1003 = _556 * _174;
    float _1005 = in.m_57.y;
    float _1007 = fma(_554, _408, _999);
    float _1009 = fma(_554, _450, _1001);
    float _1011 = fma(_554, _428, _1003);
    int _1013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1015 = _1013 != 0;
    int _1017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1019 = _1017 != 0;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1023 = _1021 != 0;
    float _1025 = fma(_558, _176, _1007);
    float _1027 = fma(_558, _178, _1009);
    float _1029 = _748 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1033 = in.m_51.w;
    float _1035 = _748 * 2.0;
    float _1037 = _742 * _742;
    float _1039 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1041 = log2(_1039);
    float _1043 = -_1031;
    float _1045 = fma(_1029, 2.0, _1043);
    float _1047 = fma(_744, _744, _1037);
    float _1049 = in.m_49.w;
    float _1051 = fma(_558, _198, _1011);
    float _1053 = _997 * 2.0;
    float _1055 = fma(_746, _746, _1047);
    float _1057 = floor(_1035);
    float _1059 = in.m_53.w;
    float _1061 = _1005 * 2.0;
    float _1063 = _748 + _1005;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1067 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1069 = _1063 + (-1.0);
    float _1071 = floor(_1053);
    float _1073 = fma(_1067, -2.0, _1065);
    float _1075 = _1005 + _997;
    float _1077 = _1075 + (-1.0);
    float _1079 = floor(_1061);
    bool _1081 = _1057 > 0.0;
    bool _1083 = _1057 >= 0.0;
    bool _1085 = isnan(_1057);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan(0.0);
    bool _1091 = _1087 || _1089;
    float _1093 = fma(_1077, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1095 = _1025 + _1049;
    int _1097 = _1091 ? 0 : 1;
    float _1099 = rsqrt(_1055);
    bool _1101 = _1071 >= 0.0;
    bool _1103 = isnan(_1071);
    bool _1105 = _1101 || _1103;
    bool _1107 = isnan(0.0);
    bool _1109 = _1105 || _1107;
    float _1111 = _1051 + _1059;
    bool _1113 = _1071 > 0.0;
    float _1115 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1117 = _1041 * _132;
    float _1119 = _1027 + _1033;
    float _1121 = exp2(_1117);
    int _1123 = _1109 ? 0 : 1;
    bool _1125 = _1079 > 0.0;
    bool _1127 = _1079 >= 0.0;
    bool _1129 = isnan(_1079);
    bool _1131 = _1127 || _1129;
    bool _1133 = isnan(0.0);
    bool _1135 = _1131 || _1133;
    float _1137 = _1099 * _742;
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1141 = 1.0 + _1139;
    bool _1143 = !_1019;
    int _1145 = _1143 ? 0 : 1;
    float _1147 = _1099 * _744;
    int _1149 = ~_1097;
    int _1151 = _1149 + 1;
    int _1153 = _1151 + 1;
    float _1155 = 1.0 / _1141;
    float _1157 = _1099 * _746;
    float _1159 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1161 = abs(_1145);
    int _1163 = _1153;
    if (!_1081)
    {
        int _1165 = ~_1097;
        int _1167 = _1165 + 1;
        _1163 = _1167;
    }
    int _1169 = _1163;
    float _1171 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1159);
    float _1173 = -_1121;
    float _1175 = _1173 + 1.0;
    bool _1177 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1179 = isnan(1.0);
    bool _1181 = _1177 || _1179;
    bool _1183 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1185 = _1181 || _1183;
    float _1187 = in.m_61.x;
    float _1189 = in.m_61.y;
    float _1191 = in.m_61.z;
    float _1193 = float(_1161);
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1197 = float(_1169);
    float _1199 = -_132;
    float _1201 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1045);
    bool _1203 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1205 = isnan(0.0);
    bool _1207 = _1203 || _1205;
    bool _1209 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1211 = _1207 || _1209;
    float _1213 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1195);
    float _1215 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1171);
    float _1217 = _1193 * _1197;
    float _1219 = _1211 ? _1175 : 0.0;
    float _1221 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1213);
    float _1223 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1073);
    float _1225 = _1217 * (-2.0);
    int _1227 = _1135 ? 0 : 1;
    if (_1185)
    {
        float _1229 = _1219 * _1155;
        _138 = _1229;
    }
    float _1231 = _138;
    bool _1233 = !_1015;
    int _1235 = _1233 ? 0 : 1;
    float _1237 = fma(_1093, _1225, _1093);
    int _1239 = ~_1123;
    int _1241 = _1239 + 1;
    int _1243 = _1241 + 1;
    float _1245 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1247 = _1095 + _1245;
    int _1249 = _1243;
    if (!_1113)
    {
        int _1251 = ~_1123;
        int _1253 = _1251 + 1;
        _1249 = _1253;
    }
    int _1255 = _1249;
    float _1257 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1259 = _1111 + _1257;
    int _1261 = abs(_1235);
    float _1263 = _1247 * _1247;
    int _1265 = ~_1227;
    int _1267 = _1265 + 1;
    int _1269 = _1267 + 1;
    float _1271 = fma(_1225, _1189, _1189);
    int _1273 = _1269;
    if (!_1125)
    {
        int _1275 = ~_1227;
        int _1277 = _1275 + 1;
        _1273 = _1277;
    }
    int _1279 = _1273;
    float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1283 = _1119 + _1281;
    bool _1285 = !_1023;
    int _1287 = _1285 ? 0 : 1;
    float _1289 = _1005 + (-0.5);
    float _1291 = float(_1261);
    float _1293 = fma(_1283, _1283, _1263);
    float _1295 = float(_1255);
    float _1297 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1271);
    int _1299 = abs(_1287);
    float _1301 = _748 + (-0.5);
    float _1303 = _1291 * _1295;
    float _1305 = fma(_1259, _1259, _1293);
    float _1307 = _1137 * _472;
    float _1309 = _1303 * (-2.0);
    float _1311 = fma(_1237, _1231, _1297);
    float _1313 = float(_1299);
    float _1315 = fma(_1147, _466, _1307);
    float _1317 = fma(_1309, _1187, _1187);
    float _1319 = float(_1279);
    float _1321 = rsqrt(_1305);
    float _1323 = fma(_1157, _478, _1315);
    float _1325 = _1311 * 0.15915493667125701904296875;
    float _1327 = fma(_1301, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1317);
    float _1329 = _748 + _997;
    float _1331 = fma(_1115, _1309, _1115);
    float _1333 = abs(_1323);
    bool _1335 = _1333 > 0.99989998340606689453125;
    float _1337 = _1313 * _1319;
    float _1339 = _1329 + (-1.0);
    float _1341 = fma(_1331, _1231, _1327);
    float _1343 = _1337 * (-2.0);
    float _1345 = _997 + (-0.5);
    float _1347 = fma(_1339, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1349 = _1341 * 0.15915493667125701904296875;
    float _1351 = fma(_1343, _1191, _1191);
    float _1353 = _1325 * 6.283185482025146484375;
    float _1355 = sin(_1353);
    float _1357 = fma(_1347, _1343, _1347);
    if (_1335)
    {
        float _1359 = _466 + _544;
        _468 = _1359;
    }
    float _1361 = _468;
    float _1363 = fma(_1345, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1351);
    float _1365 = _1247 * _1321;
    if (_1335)
    {
        float _1367 = _478 + _552;
        _482 = _1367;
    }
    float _1369 = _482;
    float _1371 = -_1361;
    float _1373 = _1157 * _1371;
    float _1375 = fma(_1357, _1231, _1363);
    float _1377 = -_1365;
    float _1379 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1247);
    float _1381 = _1283 * _1321;
    float _1383 = _1325 * 6.283185482025146484375;
    float _1385 = cos(_1383);
    if (_1335)
    {
        float _1387 = _472 + _548;
        _474 = _1387;
    }
    float _1389 = _474;
    float _1391 = -_1369;
    float _1393 = -_1373;
    float _1395 = fma(_1147, _1391, _1393);
    float _1397 = -_1381;
    float _1399 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1283);
    float _1401 = -_1369;
    float _1403 = _1137 * _1401;
    float _1405 = in.m_55.x;
    float _1407 = in.m_55.y;
    float _1409 = in.m_55.z;
    float _1411 = -_1389;
    float _1413 = _1147 * _1411;
    float _1415 = _1375 * 0.15915493667125701904296875;
    float _1417 = -_1389;
    float _1419 = -_1403;
    float _1421 = fma(_1157, _1417, _1419);
    float _1423 = _1379 * _1379;
    float _1425 = _1259 * _1321;
    float _1427 = in.m_63.x;
    float _1429 = in.m_63.y;
    float _1431 = in.m_63.z;
    float _1433 = -_1361;
    float _1435 = -_1413;
    float _1437 = fma(_1137, _1433, _1435);
    float _1439 = fma(_1399, _1399, _1423);
    float _1441 = -_1425;
    float _1443 = fma(_1441, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1259);
    float _1445 = _1395 * _1395;
    float _1447 = _1415 * 6.283185482025146484375;
    float _1449 = sin(_1447);
    float _1451 = fma(_1443, _1443, _1439);
    float _1453 = fma(_1421, _1421, _1445);
    bool _1455 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1457 = isnan(0.5);
    bool _1459 = _1455 || _1457;
    bool _1461 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1463 = _1459 || _1461;
    float _1465 = _1415 * 6.283185482025146484375;
    float _1467 = cos(_1465);
    float _1469 = _1409 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1471 = _1407 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1473 = _1349 * 6.283185482025146484375;
    float _1475 = sin(_1473);
    float _1477 = fma(_1437, _1437, _1453);
    float _1479 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1427);
    float _1481 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1429);
    float _1483 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1431);
    float _1485 = _1349 * 6.283185482025146484375;
    float _1487 = cos(_1485);
    float _1489 = sqrt(_1451);
    float _1491 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1493 = _1475 * _1355;
    float _1495 = _1475 * _1385;
    float _1497 = _1475 * _1467;
    float _1499 = _1491 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1501 = rsqrt(_1477);
    float _1503 = _1487 * _1385;
    float _1505 = _1487 * _1355;
    float _1507 = _1385 * _1467;
    float _1509 = _1487 * _1467;
    float _1511 = _1355 * _1467;
    float _1513 = fma(_1449, _1503, _1493);
    float _1515 = _1471 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1517 = _1321 * _1489;
    float _1519 = _1469 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1521 = fma(_1449, _1493, _1503);
    float _1523 = -_1505;
    float _1525 = fma(_1449, _1495, _1523);
    float _1527 = -_1495;
    float _1529 = fma(_1449, _1505, _1527);
    float _1531 = _1519 * _1517;
    float _1533 = _1499 * _1517;
    float _1535 = _1515 * _1517;
    float _1537 = _1395 * _1501;
    float _1539 = _1421 * _1501;
    float _1541 = _1509 * _1147;
    float _1543 = _1437 * _1501;
    float _1545 = _1509 * _1157;
    float _1547 = _1531 * _1483;
    float _1549 = _1147 * _1537;
    float _1551 = -_1449;
    float _1553 = fma(_1551, _1539, _1541);
    float _1555 = _1533 * _1479;
    float _1557 = _1535 * _1481;
    float _1559 = _1513 * _1157;
    float _1561 = -_1449;
    float _1563 = fma(_1561, _1543, _1545);
    float _1565 = _1529 * _1157;
    float _1567 = _1137 * _1543;
    float _1569 = -_1549;
    float _1571 = fma(_1137, _1539, _1569);
    float _1573 = fma(_1507, _1543, _1559);
    float _1575 = fma(_1511, _1543, _1565);
    float _1577 = -_1567;
    float _1579 = fma(_1157, _1537, _1577);
    float _1581 = _1513 * _1147;
    float _1583 = fma(_1497, _1571, _1563);
    float _1585 = fma(_1521, _1571, _1575);
    float _1587 = fma(_1525, _1571, _1573);
    float _1589 = _1529 * _1147;
    float _1591 = fma(_1507, _1539, _1581);
    float _1593 = fma(_1497, _1579, _1553);
    float _1595 = _1557 * _1583;
    float _1597 = fma(_1511, _1539, _1589);
    float _1599 = fma(_1525, _1579, _1591);
    float _1601 = _1557 * _1593;
    float _1603 = fma(_1555, _1587, _1595);
    float _1605 = fma(_1521, _1579, _1597);
    float _1607 = _1509 * _1137;
    float _1609 = fma(_1555, _1599, _1601);
    float _1611 = fma(_1547, _1585, _1603);
    float _1613 = _1157 * _1539;
    float _1615 = -_1449;
    float _1617 = fma(_1615, _1537, _1607);
    float _1619 = fma(_1547, _1605, _1609);
    float _1621 = _1111 + _1611;
    float _1623 = _1513 * _1137;
    float _1625 = -_1613;
    float _1627 = fma(_1147, _1543, _1625);
    float _1629 = _1119 + _1619;
    float _1631 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1633 = _1621 + _1631;
    float _1635 = _1529 * _1137;
    float _1637 = fma(_1507, _1537, _1623);
    float _1639 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1641 = _1629 + _1639;
    float _1643 = _1633 * _1633;
    float _1645 = fma(_1497, _1627, _1617);
    float _1647 = fma(_1511, _1537, _1635);
    float _1649 = fma(_1525, _1627, _1637);
    float _1651 = fma(_1641, _1641, _1643);
    float _1653 = _1557 * _1645;
    float _1655 = fma(_1521, _1627, _1647);
    float _1657 = -_1381;
    float _1659 = fma(_1657, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1119);
    float _1661 = sqrt(_1651);
    float _1663 = fma(_1555, _1649, _1653);
    float _1665 = fma(_1547, _1655, _1663);
    float _1667 = _1095 + _1665;
    bool _1669 = _1661 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1671 = _1627;
    float _1673 = _1555;
    float _1675 = _1663;
    float _1677 = _1543;
    float _1679 = _1641;
    float _1681 = _1667;
    float _1683 = _1511;
    float _1685 = _1621;
    if (!_1669)
    {
        _1671 = _1629;
    }
    float _1687 = _1671;
    float _1689 = _1687;
    if (!_1669)
    {
        _1673 = _1621;
    }
    float _1691 = _1673;
    float _1693 = _1691;
    if (!_1669)
    {
        _1675 = _1667;
    }
    float _1695 = _1675;
    bool _1697 = !_1669;
    float _1699 = _1695;
    if (!_1697)
    {
        float _1701 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1705 = _1661 + _1703;
        float _1707 = rsqrt(_1651);
        float _1709 = _1705 * _1701;
        float _1711 = _1667 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1713 = _1709 * 0.15915493667125701904296875;
        float _1715 = _1713 * 6.283185482025146484375;
        float _1717 = cos(_1715);
        float _1719 = _1713 * 6.283185482025146484375;
        float _1721 = sin(_1719);
        float _1723 = _1717 + (-1.0);
        float _1725 = fma(_1721, _1711, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1727 = _1723 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1729 = _1707 * _1725;
        float _1731 = fma(_1667, _1717, _1727);
        float _1733 = fma(_1641, _1729, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1735 = fma(_1633, _1729, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1699 = _1731;
        _1689 = _1733;
        _1693 = _1735;
    }
    float _1737 = _1699;
    float _1739 = _1689;
    float _1741 = _1693;
    float _1743 = -_1365;
    float _1745 = fma(_1743, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1737);
    float _1747 = -_1381;
    float _1749 = fma(_1747, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1739);
    float _1751 = -_1425;
    float _1753 = fma(_1751, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1741);
    float _1755 = -_1365;
    float _1757 = fma(_1755, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1095);
    float _1759 = -_1425;
    float _1761 = fma(_1759, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1111);
    float _1763 = _1745;
    float _1765 = _1749;
    float _1767 = _1753;
    if (!_1463)
    {
        float _1769 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1771 = _1757 + _1769;
        float _1773 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1775 = _1659 + _1773;
        float _1777 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1779 = -_1119;
        float _1781 = _1779 + _1739;
        float _1783 = _1771 * _1771;
        float _1785 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1787 = _1761 + _1785;
        float _1789 = -_1095;
        float _1791 = _1789 + _1737;
        float _1793 = -_1111;
        float _1795 = _1793 + _1741;
        float _1797 = fma(_1775, _1775, _1783);
        float _1799 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1801 = fma(_1787, _1787, _1797);
        float _1803 = sqrt(_1801);
        float _1805 = 1.0 / _1517;
        bool _1807 = _1803 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1809 = isnan(_1803);
        bool _1811 = _1807 || _1809;
        bool _1813 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1815 = _1811 || _1813;
        float _1817 = precise::min(_1803, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1819 = _1817 * _1777;
        float _1821 = _1799 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1823 = _1781 * _1805;
        float _1825 = _1791 * _1805;
        float _1827 = _1795 * _1805;
        float _1829 = _1821 * _1819;
        float _1831 = _1783;
        float _1833 = _1803;
        float _1835 = _1821;
        _1681 = _1823;
        if (_1815)
        {
            float _1837 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1831 = _1837;
        }
        float _1839 = _1831;
        if (_1815)
        {
            float _1841 = precise::max(_1803, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1833 = _1841;
        }
        float _1843 = _1833;
        float _1845 = fma(_1823, _1829, _1659);
        float _1847 = fma(_1825, _1829, _1757);
        float _1849 = fma(_1827, _1829, _1761);
        float _1851 = _1843;
        float _1853 = _1847;
        _1679 = _1839;
        if (_1815)
        {
            float _1855 = _1843 * _1839;
            _1851 = _1855;
        }
        float _1857 = _1851;
        float _1859 = _1857;
        if (_1815)
        {
            float _1861 = _1821 * _1857;
            _1677 = _1861;
        }
        float _1863 = _1677;
        if (!_1815)
        {
            _1835 = _1845;
        }
        float _1865 = _1835;
        float _1867 = _1865;
        if (!_1815)
        {
            _1859 = _1849;
        }
        float _1869 = _1859;
        _1767 = _1869;
        if (_1815)
        {
            float _1871 = fma(_1823, _1863, _1659);
            _1867 = _1871;
        }
        float _1873 = _1867;
        _1765 = _1873;
        if (_1815)
        {
            float _1875 = fma(_1825, _1863, _1757);
            _1853 = _1875;
        }
        float _1877 = _1853;
        _1763 = _1877;
        if (_1815)
        {
            float _1879 = fma(_1827, _1863, _1761);
            _1767 = _1879;
        }
    }
    float _1881 = _1763;
    float _1883 = _1765;
    float _1885 = _1767;
    float _1887 = _1679;
    float _1889 = _1681;
    float _1891 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1893 = _1881 + _1891;
    float _1895 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1897 = _1883 + _1895;
    float _1899 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1901 = _1885 + _1899;
    float _1903 = _1893 * _1893;
    float _1905 = fma(_1897, _1897, _1903);
    float _1907 = fma(_1901, _1901, _1905);
    float _1909 = rsqrt(_1907);
    float _1911 = sqrt(_1907);
    float _1913 = _1909 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1915 = _1897 * _1913;
    float _1917 = _1901 * _1913;
    float _1919 = _1915 * _1915;
    float _1921 = _1917 * _1917;
    float _1923 = _1919 + _1921;
    float _1925 = sqrt(_1923);
    bool _1927 = _1925 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1929 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1931 = _1925 + _1929;
    float _1933 = _1909;
    float _1935 = _1931;
    float _1937 = _1887;
    float _1939 = _1893;
    float _1941 = _1913;
    if (_1927)
    {
        float _1943 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1933 = _1943;
    }
    float _1945 = _1933;
    float _1947 = _1945;
    if (_1927)
    {
        float _1949 = _1931 * _1945;
        _1935 = _1949;
    }
    float _1951 = _1935;
    if (_1927)
    {
        float _1953 = rsqrt(_1923);
        _1947 = _1953;
    }
    float _1955 = _1947;
    float _1957 = _1955;
    if (_1927)
    {
        float _1959 = _1951 * 0.15915493667125701904296875;
        _1937 = _1959;
    }
    float _1961 = _1937;
    float _1963 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1965 = _1901;
    float _1967 = _1961;
    if (_1927)
    {
        float _1969 = _1961 * 6.283185482025146484375;
        float _1971 = sin(_1969);
        _1965 = _1971;
    }
    float _1973 = _1965;
    float _1975 = precise::max(0.0, _1963);
    float _1977 = _1889;
    float _1979 = _1975;
    if (_1927)
    {
        float _1981 = _1961 * 6.283185482025146484375;
        float _1983 = cos(_1981);
        _1977 = _1983;
    }
    float _1985 = _1977;
    float _1987 = -_1913;
    float _1989 = -_1975;
    float _1991 = fma(_1893, _1987, _1989);
    if (_1927)
    {
        float _1993 = _1991 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1939 = _1993;
    }
    float _1995 = _1939;
    float _1997 = _1973;
    float _1999 = _1995;
    if (_1927)
    {
        float _2001 = fma(_1973, _1995, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1997 = _2001;
    }
    float _2003 = _1997;
    float _2005 = _2003;
    if (!_1927)
    {
        _1999 = _1917;
    }
    float _2007 = _1999;
    float _2009 = _2007;
    if (!_1927)
    {
        _1967 = _1919;
    }
    float _2011 = _1967;
    float _2013 = _2011;
    if (_1927)
    {
        float _2015 = _1955 * _2003;
        _1683 = _2015;
    }
    float _2017 = _1683;
    if (!_1927)
    {
        _1957 = _1915;
    }
    float _2019 = _1957;
    float _2021 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2023 = _2019;
    if (_1927)
    {
        float _2025 = _1985 + (-1.0);
        _1979 = _2025;
    }
    float _2027 = _1979;
    float _2029 = _2027;
    if (_1927)
    {
        float _2031 = _1915 * _2017;
        _2023 = _2031;
    }
    float _2033 = _2023;
    if (!_1927)
    {
        _2005 = _1991;
    }
    float _2035 = _2005;
    float _2037 = _2035;
    if (_1927)
    {
        float _2039 = _1917 * _2017;
        _2009 = _2039;
    }
    float _2041 = _2009;
    if (_1927)
    {
        float _2043 = _2027 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1941 = _2043;
    }
    float _2045 = _1941;
    if (_1927)
    {
        float _2047 = _2033 * _2033;
        _2013 = _2047;
    }
    float _2049 = _2013;
    if (!_1927)
    {
        _2029 = _1921;
    }
    float _2051 = _2029;
    float _2053 = _2051;
    if (_1927)
    {
        float _2055 = _2041 * _2041;
        _2053 = _2055;
    }
    float _2057 = _2053;
    if (_1927)
    {
        float _2059 = fma(_1991, _1985, _2045);
        _2037 = _2059;
    }
    float _2061 = _2037;
    float _2063 = _1881 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2065 = fma(_2061, _2061, _2049);
    float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2069 = fma(_1911, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2067);
    float _2071 = precise::clamp(_2069, 0.0, 1.0);
    float _2073 = _2065 + _2057;
    float _2075 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2063);
    float _2077 = _1881 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2079 = -_2071;
    float _2081 = _2079 + 1.0;
    float _2083 = _1881 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2085 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2075);
    float _2087 = rsqrt(_2073);
    float _2089 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2077);
    float _2091 = _1881 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2093 = _2085 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2095 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2083);
    float _2097 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2089);
    float _2099 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2091);
    float _2101 = _2093 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2103 = abs(_2081);
    float _2105 = log2(_2103);
    float _2107 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2095);
    float _2109 = _2097 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2111 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2099);
    float _2113 = -_2101;
    float _2115 = fma(_2113, _2021, 1.0);
    float _2117 = _2107 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2119 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2121 = _2111 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2123 = _2087 * _2033;
    float _2125 = _2087 * _2061;
    float _2127 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2119);
    float _2129 = _2087 * _2041;
    float _2131 = _2123 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2133 = log2(_2115);
    float _2135 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2127);
    float _2137 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2139 = -_2131;
    float _2141 = fma(_2125, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2139);
    float _2143 = _2105 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2145 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2135);
    float _2147 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2137);
    float _2149 = -_2129;
    float _2151 = fma(_2149, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2141);
    float _2153 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2155 = 1.0 / _2145;
    float _2157 = _2125 + 1.0;
    float _2159 = fma(_2151, -0.5, 0.5);
    float _2161 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2153);
    float _2163 = fma(_2151, 0.5, 0.5);
    float _2165 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2147);
    float _2167 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2161);
    float _2169 = exp2(_2143);
    float _2171 = fma(_2163, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2173 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2165);
    float _2175 = sqrt(_2159);
    float _2177 = -_2125;
    float _2179 = fma(_2169, _2157, _2177);
    float _2181 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2167);
    float _2183 = fma(_2163, _2171, -0.212114393711090087890625);
    float _2185 = _2133 * 0.693147182464599609375;
    float _2187 = _2173 * _2155;
    float _2189 = _2181 * _2155;
    float _2191 = fma(_2163, _2183, 1.570728778839111328125);
    float _2193 = _2185 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2195 = _2175 * 0.636619746685028076171875;
    float _2197 = fma(_2187, 0.5, 0.5);
    float _2199 = fma(_2189, -0.5, 0.5);
    float _2201 = fma(_2179, 0.5, 0.5);
    float _2203 = -_2191;
    float _2205 = fma(_2195, _2203, 1.0);
    float3 _5898 = float3(_2197, _2199, _2193);
    float _2207 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5898, float3(0.0), isnan(_5898)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5898, float3(0.0), isnan(_5898)), level(0.0)).x;
    float3 _5909 = float3(_2197, _2199, _2193);
    float4 _2210 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5909, float3(0.0), isnan(_5909)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5909, float3(0.0), isnan(_5909)), level(0.0)).xyzw;
    float _2212 = _2210.x;
    float _2214 = _2210.y;
    float _2216 = _2210.z;
    float _2218 = _2210.w;
    float2 _5926 = float2(_2205, _2201);
    float3 _2222 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5926, float2(0.0), isnan(_5926)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5926, float2(0.0), isnan(_5926)), level(0.0)).xyz;
    float _2224 = _2222.x;
    float _2226 = _2222.y;
    float _2228 = _2222.z;
    float _2230 = in.m_65.y;
    float _2232 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    out.m_67.y = _1881;
    float _2234 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2236 = _2234 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _2238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2240 = _2238 != 0;
    float _2242 = _1757 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2244 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2246 = _2244 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2248 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2250 = _2248 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2252 = _1005 > 0.5;
    float _2254 = _1757 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _2256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2258 = _2256 != 0;
    float _2260 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2242);
    float _2262 = 1.0 / _2246;
    bool _2264 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2266 = isnan(0.5);
    bool _2268 = _2264 || _2266;
    bool _2270 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2272 = _2268 || _2270;
    float _2274 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2254);
    float _2276 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2260);
    bool _2278 = _748 > 0.5;
    bool _2280 = _2278 && _2258;
    float _2282 = -_2230;
    float _2284 = _2282 + 1.0;
    float _2286 = 1.0 / _2250;
    float _2288 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2290 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2288;
    float _2292 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2274);
    float _2294 = _2230;
    if (_2240)
    {
        float _2296 = _2252 ? _2284 : _2230;
        _2294 = _2296;
    }
    float _2298 = _2294;
    float _2300 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2302 = _2300 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2304 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2306 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2304;
    float _2308 = in.m_65.x;
    float _2310 = 1.0 / _2236;
    float _2312 = _2276 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2314 = _2290 * _2262;
    float _2316 = _2292 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2318 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2320 = _2262;
    if (!_2272)
    {
        _2320 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2322 = _2320;
    float _2324 = 1.0 / _2312;
    float _2326 = _2302 * _2286;
    float _2328 = fma(_2318, _2298, -0.5);
    bool _2330 = _995 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2332 = isnan(_995);
    bool _2334 = _2330 || _2332;
    bool _2336 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2338 = _2334 || _2336;
    float _2340 = float(_2338);
    bool _2342 = _995 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2344 = isnan(_995);
    bool _2346 = _2342 || _2344;
    bool _2348 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2350 = _2346 || _2348;
    float _2352 = float(_2350);
    float _2354 = -_1223;
    float _2356 = fma(_1221, _2328, _2354);
    float _2358 = _2105 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2360 = _2306 * _2310;
    float _2362 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2364 = _995 + _2362;
    float _2366 = _2316 + _2312;
    bool _2368 = _995 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2370 = isnan(_995);
    bool _2372 = _2368 || _2370;
    bool _2374 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2376 = _2372 || _2374;
    float _2378 = float(_2376);
    float _2380 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2382 = fma(_2314, _2364, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2384 = _995 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2386 = isnan(_995);
    bool _2388 = _2384 || _2386;
    bool _2390 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2392 = _2388 || _2390;
    float _2394 = float(_2392);
    float _2396 = _2366 * _2324;
    float _2398 = _2396 * 0.5;
    float _2400 = -_2378;
    float _2402 = _2400 + 1.0;
    float _2404 = _2322;
    float _2406 = _2398;
    float _2408 = _2308;
    float _2410 = _2326;
    if (_2258)
    {
        _1685 = _2308;
    }
    float _2412 = _1685;
    float _2414 = -_2394;
    float _2416 = _2414 + 1.0;
    float _2418 = _2412;
    if (!_2272)
    {
        float _2420 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2422 = fma(_2398, _2322, _2420);
        _2404 = _2422;
    }
    float _2424 = _2404;
    float _2426 = _2394 * _2402;
    float _2428 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2430 = _995 + _2428;
    float _2432 = _2340 * _2416;
    float _2434 = -_2340;
    float _2436 = _2434 + 1.0;
    if (_2280)
    {
        float _2438 = -_2412;
        float _2440 = _2438 + 1.0;
        _2418 = _2440;
    }
    float _2442 = _2418;
    if (!_2272)
    {
        _2406 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2444 = _2406;
    float _2446 = fma(_2326, _2430, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2448 = _2352 * _2436;
    float _2450 = _2424;
    if (!_2272)
    {
        float _2452 = 1.0 / _2424;
        _2450 = _2452;
    }
    float _2454 = _2450;
    if (_2258)
    {
        _2408 = _2442;
    }
    float _2456 = _2408;
    if (!_2272)
    {
        float _2458 = -_2444;
        float _2460 = _2458 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2410 = _2460;
    }
    float _2462 = _2410;
    float _2464 = _2382 * _2448;
    float _2466 = -_2352;
    float _2468 = _2466 + 1.0;
    float _2470 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2472 = _995 + _2470;
    float _2474 = _2380 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2476 = _2286;
    if (!_2272)
    {
        float _2478 = 1.0 / _2462;
        _2476 = _2478;
    }
    float _2480 = _2476;
    float _2482 = fma(_2468, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2464);
    float _2484 = fma(_2474, _2456, -0.5);
    float _2486 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2488 = fma(_2360, _2472, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2490 = fma(_2446, _2432, _2482);
    float _2492 = in.m_69.w;
    float _2494 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2486);
    float _2496 = exp2(_2358);
    float _2498 = fma(_2488, _2426, _2490);
    float _2500 = _2488;
    if (!_2272)
    {
        float _2502 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2504 = -_2444;
        float _2506 = fma(_2454, _2502, _2504);
        _2500 = _2506;
    }
    float _2508 = _2500;
    float _2510 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2494);
    float _2512 = fma(_1215, _2484, _1201);
    float _2514 = fma(_2378, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2498);
    float _2516 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2510);
    float _2518 = _2508;
    float _2520 = (*spvDescriptorSet0.vp_c9)._m0[123].x;
    if (!_2272)
    {
        float _2522 = _2508 * _2480;
        float _2524 = precise::clamp(_2522, 0.0, 1.0);
        _2518 = _2524;
    }
    float _2526 = _2518;
    float _2528 = _2356 + 0.5;
    float _2530 = _2512 + 0.5;
    float _2532 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2534 = _2516 + _2532;
    float _2536 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    if (_2272)
    {
        _2520 = 1.0;
    }
    float _2538 = _2520;
    float _2540 = _2538;
    if (!_2272)
    {
        float _2542 = -_2526;
        float _2544 = _2542 + 1.0;
        _2540 = _2544;
    }
    float _2546 = _2540;
    float _2548 = _2145 + _2534;
    float _2550 = -_2496;
    float _2552 = _2550 + 1.0;
    out.m_71.x = _2530;
    out.m_71.y = _2528;
    float _2554 = _2548 * 0.5;
    float _2556 = _2552 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2558 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2560 = _2546 > 0.0;
    bool _2562 = isnan(_2546);
    bool _2564 = _2560 || _2562;
    bool _2566 = isnan(0.0);
    bool _2568 = _2564 || _2566;
    float _2570 = _2546 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _2173;
    out.gl_Position.y = _2181;
    out.gl_Position.z = _2534;
    out.gl_Position.w = _2145;
    float _2572 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2574 = _2536 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2576 = -_2556;
    float _2578 = _2576 + 1.0;
    float _2580 = _2558 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2582 = _2572 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2584 = _2514 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2586 = _2570 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.w = _2492;
    out.m_75.x = _2574;
    out.m_75.y = _2580;
    out.m_75.z = _2582;
    out.m_75.w = _2584;
    out.m_77.z = _2554;
    out.m_77.w = _2145;
    out.m_45.x = _2586;
    float _2588 = _2556 * _2207;
    float _2590 = _2218 * _2578;
    float _2592 = _2218 * _2588;
    float _2594 = _2228 * _2588;
    float _2596 = fma(_2224, _2592, _2212);
    float _2598 = fma(_2226, _2592, _2214);
    float _2600 = fma(_2218, _2594, _2216);
    out.m_79.x = _2596;
    out.m_79.y = _2598;
    out.m_79.z = _2600;
    out.m_79.w = _2590;
    if (_2568)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2602 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2602;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _987 = false;
    bool _782 = false;
    bool _610 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_42.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_45.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2659 = as_type<float>(_114);
        out.gl_Position.z = _2659;
    }
    if (!_102)
    {
        return out;
    }
    float _118 = in.m_47.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _134 = 0.0;
    float _136 = 0.0;
    float _138 = _132;
    if (_128)
    {
        float _140 = float(_98);
        _134 = _140;
    }
    float _142 = _134;
    bool _144 = _132 >= _142;
    bool _146 = !_128;
    bool _148 = _144 || _146;
    if (_148)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _108;
    if (_148)
    {
        out.m_45.x = 0.0;
    }
    if (_148)
    {
        float _152 = _150 * 5.0;
        _116 = as_type<int>(_152);
    }
    int _154 = _116;
    float _156 = as_type<float>(_154);
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2730 = as_type<float>(_154);
        out.gl_Position.z = _2730;
    }
    if (_148)
    {
        return out;
    }
    float _158 = in.m_49.y;
    float _160 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _162 = in.m_51.y;
    bool _164 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _166 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _168 = _164 || _166;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    float _174 = in.m_53.y;
    float _176 = in.m_49.z;
    float _178 = in.m_51.z;
    float _180 = _160;
    if (!_172)
    {
        float _182 = _160 * _160;
        float _184 = _182 * 0.5;
        _156 = _184;
    }
    float _186 = _156;
    float _188 = 0.0;
    float _190 = _186;
    if (!_172)
    {
        float _192 = _132 * _132;
        float _194 = _192 * 0.5;
        _188 = _194;
    }
    float _196 = _188;
    float _198 = in.m_53.z;
    if (!_172)
    {
        float _200 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _200;
    }
    float _202 = _190;
    float _204 = _158 * _158;
    float _206 = fma(_162, _162, _204);
    float _208 = fma(_174, _174, _206);
    float _210 = in.m_47.x;
    float _212 = in.m_47.y;
    float _214 = in.m_47.z;
    float _216 = sqrt(_208);
    bool _218 = _216 > 0.0;
    float _220 = _176 * _176;
    float _222 = fma(_178, _178, _220);
    bool _224 = !_172;
    float _226 = _202;
    float _228 = 0.0;
    float _230 = _222;
    if (!_224)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = _160 * _234;
        float _244 = 1.0 / _238;
        float _246 = _240 * 0.693147182464599609375;
        float _248 = exp2(_242);
        float _250 = 1.0 / _246;
        float _252 = _248 + (-1.0);
        float _254 = -_252;
        float _256 = fma(_254, _250, _160);
        float _258 = _256 * _244;
        float _260 = _258 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _136 = _250;
        _226 = _260;
        _228 = _244;
    }
    float _262 = _136;
    float _264 = _226;
    float _266 = _228;
    bool _268 = !_172;
    float _270 = _262;
    float _272 = _266;
    if (!_268)
    {
        float _274 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _276 = log2(_274);
        float _278 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _280 = _278 + 1.0;
        float _282 = 1.0 / _280;
        float _284 = _160 * _276;
        float _286 = exp2(_284);
        float _288 = -_286;
        float _290 = _288 + 1.0;
        float _292 = _290 * _282;
        _270 = _280;
        _180 = _292;
    }
    float _294 = _270;
    float _296 = _180;
    float _298 = fma(_198, _198, _222);
    float _300 = _294;
    if (!_172)
    {
        _300 = _132;
    }
    float _302 = _300;
    float _304 = _302;
    if (!_172)
    {
        float _306 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _230 = _306;
    }
    float _308 = _230;
    bool _310 = !_172;
    float _312 = _308;
    if (!_310)
    {
        float _314 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _316 = log2(_314);
        float _318 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _320 = _318 + 1.0;
        float _322 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _324 = _132 * _316;
        float _326 = 1.0 / _320;
        float _328 = _322 * 0.693147182464599609375;
        float _330 = exp2(_324);
        float _332 = 1.0 / _328;
        float _334 = _330 + (-1.0);
        float _336 = -_334;
        float _338 = fma(_336, _332, _132);
        float _340 = _338 * _326;
        float _342 = _340 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _312 = _342;
        _272 = _332;
    }
    float _344 = _312;
    float _346 = _272;
    bool _348 = !_172;
    if (!_348)
    {
        float _350 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _352 = log2(_350);
        float _354 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _356 = _354 + 1.0;
        float _358 = 1.0 / _356;
        float _360 = _132 * _352;
        float _362 = exp2(_360);
        float _364 = -_362;
        float _366 = _364 + 1.0;
        float _368 = _366 * _358;
        _304 = _368;
    }
    float _370 = _304;
    float _372 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _374 = _344 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _376 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _378 = _344 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _380 = fma(_296, _212, _372);
    float _382 = fma(_370, _212, _374);
    float _384 = fma(_296, _210, _376);
    float _386 = sqrt(_298);
    float _388 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _390 = _344 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _392 = fma(_370, _210, _378);
    float _394 = -_382;
    float _396 = _380 + _394;
    float _398 = fma(_296, _214, _388);
    float _400 = fma(_370, _214, _390);
    float _402 = -_392;
    float _404 = _384 + _402;
    float _406 = _396 * _396;
    float _408 = in.m_49.x;
    float _410 = -_400;
    float _412 = _398 + _410;
    float _414 = _346;
    float _416 = _382;
    float _418 = _390;
    float _420 = _378;
    if (_218)
    {
        float _422 = rsqrt(_208);
        _414 = _422;
    }
    float _424 = _414;
    float _426 = fma(_404, _404, _406);
    float _428 = in.m_53.x;
    if (!_218)
    {
        _416 = 0.0;
        _418 = 0.0;
    }
    float _430 = _416;
    float _432 = _418;
    float _434 = _430;
    float _436 = _432;
    if (!_218)
    {
        _420 = 0.0;
    }
    float _438 = _420;
    float _440 = fma(_412, _412, _426);
    bool _442 = _386 > 0.0;
    float _444 = in.m_55.w;
    float _446 = _396 * _158;
    float _448 = _396 * _174;
    float _450 = in.m_51.x;
    float _452 = sqrt(_440);
    float _454 = in.m_42.x;
    float _456 = in.m_42.y;
    float _458 = in.m_42.z;
    float _460 = _438;
    float _462 = _424;
    if (_218)
    {
        float _464 = _424 * _162;
        _460 = _464;
    }
    float _466 = _460;
    float _468 = _466;
    if (_218)
    {
        float _470 = _424 * _158;
        _434 = _470;
    }
    float _472 = _434;
    float _474 = _472;
    if (_218)
    {
        float _476 = _424 * _174;
        _436 = _476;
    }
    float _478 = _436;
    float _480 = 0.0;
    float _482 = _478;
    if (!_442)
    {
        _480 = 0.0;
    }
    float _484 = _480;
    float _486 = 0.0;
    float _488 = _484;
    if (_442)
    {
        float _490 = rsqrt(_298);
        _486 = _490;
    }
    float _492 = _486;
    if (!_442)
    {
        _462 = 0.0;
    }
    float _494 = _462;
    float _496 = fma(_404, _408, _446);
    float _498 = 0.0;
    float _500 = _494;
    float _502 = _496;
    if (!_442)
    {
        _498 = 0.0;
    }
    float _504 = _498;
    float _506 = fma(_404, _428, _448);
    bool _508 = _452 >= 9.9999999747524270787835121154785e-07;
    bool _510 = isnan(_452);
    bool _512 = _508 || _510;
    bool _514 = isnan(9.9999999747524270787835121154785e-07);
    bool _516 = _512 || _514;
    float _518 = _396 * _162;
    float _520 = fma(_412, _176, _496);
    float _522 = fma(_404, _450, _518);
    float _524 = 0.0;
    float _526 = _504;
    float _528 = _506;
    if (_442)
    {
        float _530 = _492 * 0.001000000047497451305389404296875;
        _524 = _530;
    }
    float _532 = _524;
    float _534 = fma(_412, _198, _506);
    float _536 = fma(_412, _178, _522);
    float _538 = _534;
    float _540 = _534;
    if (_442)
    {
        float _542 = _178 * _532;
        _488 = _542;
    }
    float _544 = _488;
    if (_442)
    {
        float _546 = _176 * _532;
        _500 = _546;
    }
    float _548 = _500;
    if (_442)
    {
        float _550 = _198 * _532;
        _526 = _550;
    }
    float _552 = _526;
    float _554 = fma(_384, _444, _454);
    float _556 = fma(_380, _444, _456);
    float _558 = fma(_398, _444, _458);
    if (_516)
    {
        _502 = _536;
    }
    float _560 = _502;
    float _562 = _560;
    float _564 = _560;
    if (_516)
    {
        _528 = _520;
    }
    float _566 = _528;
    float _568 = _566;
    float _570 = _566;
    if (!_516)
    {
        bool _572 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _574 = !_572;
        if (!_574)
        {
            float _576 = _158 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _578 = _162 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _580 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _582 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[16].x, _576);
            float _584 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[16].x, _578);
            float _586 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[16].x, _580);
            float _588 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[16].z, _582);
            float _590 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[16].z, _584);
            float _592 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[16].z, _586);
            float _594 = _588 * _588;
            float _596 = fma(_590, _590, _594);
            float _598 = fma(_592, _592, _596);
            float _600 = rsqrt(_598);
            float _602 = _600 * 9.9999999747524270787835121154785e-07;
            float _604 = _590 * _602;
            float _606 = _588 * _602;
            float _608 = _592 * _602;
            _570 = _606;
            _564 = _604;
            _540 = _608;
            _610 = true;
        }
        else
        {
            float _612 = _212 * _212;
            float _614 = fma(_210, _210, _612);
            float _616 = fma(_214, _214, _614);
            float _618 = sqrt(_616);
            bool _620 = _618 >= 9.9999999747524270787835121154785e-07;
            bool _622 = isnan(_618);
            bool _624 = _620 || _622;
            bool _626 = isnan(9.9999999747524270787835121154785e-07);
            bool _628 = _624 || _626;
            if (!_628)
            {
                float _630 = _456 * _456;
                float _632 = fma(_454, _454, _630);
                float _634 = fma(_458, _458, _632);
                float _636 = sqrt(_634);
                bool _638 = _636 >= 9.9999999747524270787835121154785e-07;
                bool _640 = isnan(_636);
                bool _642 = _638 || _640;
                bool _644 = isnan(9.9999999747524270787835121154785e-07);
                bool _646 = _642 || _644;
                float _648 = _208;
                if (!_646)
                {
                    float _650 = rsqrt(_208);
                    _648 = _650;
                }
                float _652 = _648;
                if (!_646)
                {
                    float _654 = _652 * 9.9999999747524270787835121154785e-07;
                    _538 = _654;
                }
                float _656 = _538;
                float _658 = _656;
                if (!_646)
                {
                    float _660 = _162 * _656;
                    _562 = _660;
                }
                float _662 = _562;
                _564 = _662;
                if (!_646)
                {
                    float _664 = _158 * _656;
                    _568 = _664;
                }
                float _666 = _568;
                _570 = _666;
                if (!_646)
                {
                    float _668 = _174 * _656;
                    _658 = _668;
                }
                float _670 = _658;
                bool _672 = !_646;
                _540 = _670;
                _610 = _672;
                if (!_610)
                {
                    float _674 = _158 * _456;
                    float _676 = _162 * _456;
                    float _678 = _174 * _456;
                    float _680 = fma(_454, _408, _674);
                    float _682 = fma(_454, _450, _676);
                    float _684 = fma(_454, _428, _678);
                    float _686 = fma(_176, _458, _680);
                    float _688 = fma(_178, _458, _682);
                    float _690 = fma(_198, _458, _684);
                    float _692 = _686 * _686;
                    float _694 = fma(_688, _688, _692);
                    float _696 = fma(_690, _690, _694);
                    float _698 = rsqrt(_696);
                    float _700 = _698 * 9.9999999747524270787835121154785e-07;
                    float _702 = _688 * _700;
                    float _704 = _686 * _700;
                    float _706 = _690 * _700;
                    _570 = _704;
                    _564 = _702;
                    _540 = _706;
                    _610 = true;
                }
            }
            else
            {
                float _708 = _158 * _212;
                float _710 = _162 * _212;
                float _712 = _174 * _212;
                float _714 = fma(_210, _408, _708);
                float _716 = fma(_210, _450, _710);
                float _718 = fma(_210, _428, _712);
                float _720 = fma(_176, _214, _714);
                float _722 = fma(_178, _214, _716);
                float _724 = fma(_198, _214, _718);
                float _726 = _720 * _720;
                float _728 = fma(_722, _722, _726);
                float _730 = fma(_724, _724, _728);
                float _732 = rsqrt(_730);
                float _734 = _732 * 9.9999999747524270787835121154785e-07;
                float _736 = _722 * _734;
                float _738 = _720 * _734;
                float _740 = _724 * _734;
                _570 = _738;
                _564 = _736;
                _540 = _740;
            }
        }
    }
    _610 = false;
    float _742 = _570;
    float _744 = _564;
    float _746 = _540;
    float _748 = in.m_57.x;
    float _750 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _752 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _754 = _750 * _748;
    float _756 = trunc(_754);
    int _758 = int(_756);
    int _760 = _758 << 4;
    int _762 = _760 + 1712;
    bool _764 = !_752;
    float _780;
    if (!_764)
    {
        float _766 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _768 = _748 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _770 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _772 = _770 * _766;
        float _774 = floor(_772);
        float _776 = -_774;
        float _778 = _772 + _776;
        _780 = _778;
        _782 = true;
    }
    else
    {
        float _784 = float(_98);
        float _786 = 1.0 / _784;
        float _788 = _132 * _786;
        _780 = _788;
    }
    _782 = false;
    float _790 = _780;
    int _792 = _762 + 8;
    uint _795 = uint(int(uint(_792) >> uint(2)));
    uint _797 = uint(int(uint(int(_795)) >> uint(2)));
    int _799 = int(_795) & 3;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[int(_797)][_799];
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _805 = _790 + _803;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _809 = _807 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _813 = _811 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _815 = _790 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _817 = isnan(_790);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    uint _827 = uint(int(uint(_762) >> uint(2)));
    uint _829 = uint(int(uint(int(_827)) >> uint(2)));
    int _831 = int(_827) & 3;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[int(_829)][_831];
    int _835 = int(_827) + 1;
    uint _837 = uint(int(uint(_835) >> uint(2)));
    int _839 = _835 & 3;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[int(_837)][_839];
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _847 = 1.0 / _809;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _849;
    bool _853 = _790 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _855 = isnan(_790);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = -_825;
    float _867 = _865 + 1.0;
    bool _869 = _790 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _871 = isnan(_790);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = 1.0 / _813;
    bool _883 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _885;
    float _889 = 1.0 / _845;
    float _891 = _851 * _847;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _897 = _863 * _867;
    float _899 = -_863;
    float _901 = _899 + 1.0;
    float _903 = fma(_891, _805, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _905 = _790 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _907 = isnan(_790);
    bool _909 = _905 || _907;
    bool _911 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _913 = _909 || _911;
    float _915 = float(_913);
    float _917 = _879 * _901;
    float _919 = _895 * _881;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _923 = _790 + _921;
    float _925 = -_879;
    float _927 = _925 + 1.0;
    float _929 = _903 * _917;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _933 = _790 + _931;
    float _935 = fma(_919, _923, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _937 = -_915;
    float _939 = _937 + 1.0;
    float _941 = _887 * _889;
    float _943 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[115].x, _929);
    float _945 = _825 * _939;
    float _947 = fma(_941, _933, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _949 = fma(_935, _897, _943);
    float _951 = _801 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _953 = fma(_947, _945, _949);
    float _955 = _951 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _957 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[118].x, _953);
    float _959 = _833 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _961 = _841 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _963 = _957 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _965 = _959 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _967 = _961 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _965;
    out.m_59.y = _967;
    out.m_59.z = _955;
    out.m_59.w = _963;
    bool _969 = !_883;
    float _985;
    if (!_969)
    {
        float _971 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _973 = _748 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _975 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[11].w, _132);
        float _977 = _975 * _971;
        float _979 = floor(_977);
        float _981 = -_979;
        float _983 = _977 + _981;
        _985 = _983;
        _987 = true;
    }
    else
    {
        float _989 = float(_98);
        float _991 = 1.0 / _989;
        float _993 = _132 * _991;
        _985 = _993;
    }
    _987 = false;
    float _995 = _985;
    float _997 = in.m_57.z;
    float _999 = _556 * _158;
    float _1001 = _556 * _162;
    float _1003 = _556 * _174;
    float _1005 = in.m_57.y;
    float _1007 = fma(_554, _408, _999);
    float _1009 = fma(_554, _450, _1001);
    float _1011 = fma(_554, _428, _1003);
    int _1013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1015 = _1013 != 0;
    int _1017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1019 = _1017 != 0;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1023 = _1021 != 0;
    float _1025 = fma(_558, _176, _1007);
    float _1027 = fma(_558, _178, _1009);
    float _1029 = _748 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1033 = in.m_51.w;
    float _1035 = _748 * 2.0;
    float _1037 = _742 * _742;
    float _1039 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1041 = log2(_1039);
    float _1043 = -_1031;
    float _1045 = fma(_1029, 2.0, _1043);
    float _1047 = fma(_744, _744, _1037);
    float _1049 = in.m_49.w;
    float _1051 = fma(_558, _198, _1011);
    float _1053 = _997 * 2.0;
    float _1055 = fma(_746, _746, _1047);
    float _1057 = floor(_1035);
    float _1059 = in.m_53.w;
    float _1061 = _1005 * 2.0;
    float _1063 = _748 + _1005;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1067 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1069 = _1063 + (-1.0);
    float _1071 = floor(_1053);
    float _1073 = fma(_1067, -2.0, _1065);
    float _1075 = _1005 + _997;
    float _1077 = _1075 + (-1.0);
    float _1079 = floor(_1061);
    bool _1081 = _1057 > 0.0;
    bool _1083 = _1057 >= 0.0;
    bool _1085 = isnan(_1057);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan(0.0);
    bool _1091 = _1087 || _1089;
    float _1093 = fma(_1077, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1095 = _1025 + _1049;
    int _1097 = _1091 ? 0 : 1;
    float _1099 = rsqrt(_1055);
    bool _1101 = _1071 >= 0.0;
    bool _1103 = isnan(_1071);
    bool _1105 = _1101 || _1103;
    bool _1107 = isnan(0.0);
    bool _1109 = _1105 || _1107;
    float _1111 = _1051 + _1059;
    bool _1113 = _1071 > 0.0;
    float _1115 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1117 = _1041 * _132;
    float _1119 = _1027 + _1033;
    float _1121 = exp2(_1117);
    int _1123 = _1109 ? 0 : 1;
    bool _1125 = _1079 > 0.0;
    bool _1127 = _1079 >= 0.0;
    bool _1129 = isnan(_1079);
    bool _1131 = _1127 || _1129;
    bool _1133 = isnan(0.0);
    bool _1135 = _1131 || _1133;
    float _1137 = _1099 * _742;
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1141 = 1.0 + _1139;
    bool _1143 = !_1019;
    int _1145 = _1143 ? 0 : 1;
    float _1147 = _1099 * _744;
    int _1149 = ~_1097;
    int _1151 = _1149 + 1;
    int _1153 = _1151 + 1;
    float _1155 = 1.0 / _1141;
    float _1157 = _1099 * _746;
    float _1159 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1161 = abs(_1145);
    int _1163 = _1153;
    if (!_1081)
    {
        int _1165 = ~_1097;
        int _1167 = _1165 + 1;
        _1163 = _1167;
    }
    int _1169 = _1163;
    float _1171 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1159);
    float _1173 = -_1121;
    float _1175 = _1173 + 1.0;
    bool _1177 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1179 = isnan(1.0);
    bool _1181 = _1177 || _1179;
    bool _1183 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1185 = _1181 || _1183;
    float _1187 = in.m_61.x;
    float _1189 = in.m_61.y;
    float _1191 = in.m_61.z;
    float _1193 = float(_1161);
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1197 = float(_1169);
    float _1199 = -_132;
    float _1201 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1045);
    bool _1203 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1205 = isnan(0.0);
    bool _1207 = _1203 || _1205;
    bool _1209 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1211 = _1207 || _1209;
    float _1213 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1195);
    float _1215 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1171);
    float _1217 = _1193 * _1197;
    float _1219 = _1211 ? _1175 : 0.0;
    float _1221 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1213);
    float _1223 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1073);
    float _1225 = _1217 * (-2.0);
    int _1227 = _1135 ? 0 : 1;
    if (_1185)
    {
        float _1229 = _1219 * _1155;
        _138 = _1229;
    }
    float _1231 = _138;
    bool _1233 = !_1015;
    int _1235 = _1233 ? 0 : 1;
    float _1237 = fma(_1093, _1225, _1093);
    int _1239 = ~_1123;
    int _1241 = _1239 + 1;
    int _1243 = _1241 + 1;
    float _1245 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1247 = _1095 + _1245;
    int _1249 = _1243;
    if (!_1113)
    {
        int _1251 = ~_1123;
        int _1253 = _1251 + 1;
        _1249 = _1253;
    }
    int _1255 = _1249;
    float _1257 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1259 = _1111 + _1257;
    int _1261 = abs(_1235);
    float _1263 = _1247 * _1247;
    int _1265 = ~_1227;
    int _1267 = _1265 + 1;
    int _1269 = _1267 + 1;
    float _1271 = fma(_1225, _1189, _1189);
    int _1273 = _1269;
    if (!_1125)
    {
        int _1275 = ~_1227;
        int _1277 = _1275 + 1;
        _1273 = _1277;
    }
    int _1279 = _1273;
    float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1283 = _1119 + _1281;
    bool _1285 = !_1023;
    int _1287 = _1285 ? 0 : 1;
    float _1289 = _1005 + (-0.5);
    float _1291 = float(_1261);
    float _1293 = fma(_1283, _1283, _1263);
    float _1295 = float(_1255);
    float _1297 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1271);
    int _1299 = abs(_1287);
    float _1301 = _748 + (-0.5);
    float _1303 = _1291 * _1295;
    float _1305 = fma(_1259, _1259, _1293);
    float _1307 = _1137 * _472;
    float _1309 = _1303 * (-2.0);
    float _1311 = fma(_1237, _1231, _1297);
    float _1313 = float(_1299);
    float _1315 = fma(_1147, _466, _1307);
    float _1317 = fma(_1309, _1187, _1187);
    float _1319 = float(_1279);
    float _1321 = rsqrt(_1305);
    float _1323 = fma(_1157, _478, _1315);
    float _1325 = _1311 * 0.15915493667125701904296875;
    float _1327 = fma(_1301, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1317);
    float _1329 = _748 + _997;
    float _1331 = fma(_1115, _1309, _1115);
    float _1333 = abs(_1323);
    bool _1335 = _1333 > 0.99989998340606689453125;
    float _1337 = _1313 * _1319;
    float _1339 = _1329 + (-1.0);
    float _1341 = fma(_1331, _1231, _1327);
    float _1343 = _1337 * (-2.0);
    float _1345 = _997 + (-0.5);
    float _1347 = fma(_1339, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1349 = _1341 * 0.15915493667125701904296875;
    float _1351 = fma(_1343, _1191, _1191);
    float _1353 = _1325 * 6.283185482025146484375;
    float _1355 = sin(_1353);
    float _1357 = fma(_1347, _1343, _1347);
    if (_1335)
    {
        float _1359 = _466 + _544;
        _468 = _1359;
    }
    float _1361 = _468;
    float _1363 = fma(_1345, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1351);
    float _1365 = _1247 * _1321;
    if (_1335)
    {
        float _1367 = _478 + _552;
        _482 = _1367;
    }
    float _1369 = _482;
    float _1371 = -_1361;
    float _1373 = _1157 * _1371;
    float _1375 = fma(_1357, _1231, _1363);
    float _1377 = -_1365;
    float _1379 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1247);
    float _1381 = _1283 * _1321;
    float _1383 = _1325 * 6.283185482025146484375;
    float _1385 = cos(_1383);
    if (_1335)
    {
        float _1387 = _472 + _548;
        _474 = _1387;
    }
    float _1389 = _474;
    float _1391 = -_1369;
    float _1393 = -_1373;
    float _1395 = fma(_1147, _1391, _1393);
    float _1397 = -_1381;
    float _1399 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1283);
    float _1401 = -_1369;
    float _1403 = _1137 * _1401;
    float _1405 = in.m_55.x;
    float _1407 = in.m_55.y;
    float _1409 = in.m_55.z;
    float _1411 = -_1389;
    float _1413 = _1147 * _1411;
    float _1415 = _1375 * 0.15915493667125701904296875;
    float _1417 = -_1389;
    float _1419 = -_1403;
    float _1421 = fma(_1157, _1417, _1419);
    float _1423 = _1379 * _1379;
    float _1425 = _1259 * _1321;
    float _1427 = in.m_63.x;
    float _1429 = in.m_63.y;
    float _1431 = in.m_63.z;
    float _1433 = -_1361;
    float _1435 = -_1413;
    float _1437 = fma(_1137, _1433, _1435);
    float _1439 = fma(_1399, _1399, _1423);
    float _1441 = -_1425;
    float _1443 = fma(_1441, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1259);
    float _1445 = _1395 * _1395;
    float _1447 = _1415 * 6.283185482025146484375;
    float _1449 = sin(_1447);
    float _1451 = fma(_1443, _1443, _1439);
    float _1453 = fma(_1421, _1421, _1445);
    bool _1455 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1457 = isnan(0.5);
    bool _1459 = _1455 || _1457;
    bool _1461 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1463 = _1459 || _1461;
    float _1465 = _1415 * 6.283185482025146484375;
    float _1467 = cos(_1465);
    float _1469 = _1409 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1471 = _1407 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1473 = _1349 * 6.283185482025146484375;
    float _1475 = sin(_1473);
    float _1477 = fma(_1437, _1437, _1453);
    float _1479 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1427);
    float _1481 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1429);
    float _1483 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1431);
    float _1485 = _1349 * 6.283185482025146484375;
    float _1487 = cos(_1485);
    float _1489 = sqrt(_1451);
    float _1491 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1493 = _1475 * _1355;
    float _1495 = _1475 * _1385;
    float _1497 = _1475 * _1467;
    float _1499 = _1491 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1501 = rsqrt(_1477);
    float _1503 = _1487 * _1385;
    float _1505 = _1487 * _1355;
    float _1507 = _1385 * _1467;
    float _1509 = _1487 * _1467;
    float _1511 = _1355 * _1467;
    float _1513 = fma(_1449, _1503, _1493);
    float _1515 = _1471 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1517 = _1321 * _1489;
    float _1519 = _1469 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1521 = fma(_1449, _1493, _1503);
    float _1523 = -_1505;
    float _1525 = fma(_1449, _1495, _1523);
    float _1527 = -_1495;
    float _1529 = fma(_1449, _1505, _1527);
    float _1531 = _1519 * _1517;
    float _1533 = _1499 * _1517;
    float _1535 = _1515 * _1517;
    float _1537 = _1395 * _1501;
    float _1539 = _1421 * _1501;
    float _1541 = _1509 * _1147;
    float _1543 = _1437 * _1501;
    float _1545 = _1509 * _1157;
    float _1547 = _1531 * _1483;
    float _1549 = _1147 * _1537;
    float _1551 = -_1449;
    float _1553 = fma(_1551, _1539, _1541);
    float _1555 = _1533 * _1479;
    float _1557 = _1535 * _1481;
    float _1559 = _1513 * _1157;
    float _1561 = -_1449;
    float _1563 = fma(_1561, _1543, _1545);
    float _1565 = _1529 * _1157;
    float _1567 = _1137 * _1543;
    float _1569 = -_1549;
    float _1571 = fma(_1137, _1539, _1569);
    float _1573 = fma(_1507, _1543, _1559);
    float _1575 = fma(_1511, _1543, _1565);
    float _1577 = -_1567;
    float _1579 = fma(_1157, _1537, _1577);
    float _1581 = _1513 * _1147;
    float _1583 = fma(_1497, _1571, _1563);
    float _1585 = fma(_1521, _1571, _1575);
    float _1587 = fma(_1525, _1571, _1573);
    float _1589 = _1529 * _1147;
    float _1591 = fma(_1507, _1539, _1581);
    float _1593 = fma(_1497, _1579, _1553);
    float _1595 = _1557 * _1583;
    float _1597 = fma(_1511, _1539, _1589);
    float _1599 = fma(_1525, _1579, _1591);
    float _1601 = _1557 * _1593;
    float _1603 = fma(_1555, _1587, _1595);
    float _1605 = fma(_1521, _1579, _1597);
    float _1607 = _1509 * _1137;
    float _1609 = fma(_1555, _1599, _1601);
    float _1611 = fma(_1547, _1585, _1603);
    float _1613 = _1157 * _1539;
    float _1615 = -_1449;
    float _1617 = fma(_1615, _1537, _1607);
    float _1619 = fma(_1547, _1605, _1609);
    float _1621 = _1111 + _1611;
    float _1623 = _1513 * _1137;
    float _1625 = -_1613;
    float _1627 = fma(_1147, _1543, _1625);
    float _1629 = _1119 + _1619;
    float _1631 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1633 = _1621 + _1631;
    float _1635 = _1529 * _1137;
    float _1637 = fma(_1507, _1537, _1623);
    float _1639 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1641 = _1629 + _1639;
    float _1643 = _1633 * _1633;
    float _1645 = fma(_1497, _1627, _1617);
    float _1647 = fma(_1511, _1537, _1635);
    float _1649 = fma(_1525, _1627, _1637);
    float _1651 = fma(_1641, _1641, _1643);
    float _1653 = _1557 * _1645;
    float _1655 = fma(_1521, _1627, _1647);
    float _1657 = -_1381;
    float _1659 = fma(_1657, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1119);
    float _1661 = sqrt(_1651);
    float _1663 = fma(_1555, _1649, _1653);
    float _1665 = fma(_1547, _1655, _1663);
    float _1667 = _1095 + _1665;
    bool _1669 = _1661 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1671 = _1627;
    float _1673 = _1555;
    float _1675 = _1663;
    float _1677 = _1543;
    float _1679 = _1641;
    float _1681 = _1667;
    float _1683 = _1511;
    float _1685 = _1621;
    if (!_1669)
    {
        _1671 = _1629;
    }
    float _1687 = _1671;
    float _1689 = _1687;
    if (!_1669)
    {
        _1673 = _1621;
    }
    float _1691 = _1673;
    float _1693 = _1691;
    if (!_1669)
    {
        _1675 = _1667;
    }
    float _1695 = _1675;
    bool _1697 = !_1669;
    float _1699 = _1695;
    if (!_1697)
    {
        float _1701 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1705 = _1661 + _1703;
        float _1707 = rsqrt(_1651);
        float _1709 = _1705 * _1701;
        float _1711 = _1667 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1713 = _1709 * 0.15915493667125701904296875;
        float _1715 = _1713 * 6.283185482025146484375;
        float _1717 = cos(_1715);
        float _1719 = _1713 * 6.283185482025146484375;
        float _1721 = sin(_1719);
        float _1723 = _1717 + (-1.0);
        float _1725 = fma(_1721, _1711, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1727 = _1723 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1729 = _1707 * _1725;
        float _1731 = fma(_1667, _1717, _1727);
        float _1733 = fma(_1641, _1729, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1735 = fma(_1633, _1729, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1699 = _1731;
        _1689 = _1733;
        _1693 = _1735;
    }
    float _1737 = _1699;
    float _1739 = _1689;
    float _1741 = _1693;
    float _1743 = -_1365;
    float _1745 = fma(_1743, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1737);
    float _1747 = -_1381;
    float _1749 = fma(_1747, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1739);
    float _1751 = -_1425;
    float _1753 = fma(_1751, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1741);
    float _1755 = -_1365;
    float _1757 = fma(_1755, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1095);
    float _1759 = -_1425;
    float _1761 = fma(_1759, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1111);
    float _1763 = _1745;
    float _1765 = _1749;
    float _1767 = _1753;
    if (!_1463)
    {
        float _1769 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1771 = _1757 + _1769;
        float _1773 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1775 = _1659 + _1773;
        float _1777 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1779 = -_1119;
        float _1781 = _1779 + _1739;
        float _1783 = _1771 * _1771;
        float _1785 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1787 = _1761 + _1785;
        float _1789 = -_1095;
        float _1791 = _1789 + _1737;
        float _1793 = -_1111;
        float _1795 = _1793 + _1741;
        float _1797 = fma(_1775, _1775, _1783);
        float _1799 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1801 = fma(_1787, _1787, _1797);
        float _1803 = sqrt(_1801);
        float _1805 = 1.0 / _1517;
        bool _1807 = _1803 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1809 = isnan(_1803);
        bool _1811 = _1807 || _1809;
        bool _1813 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1815 = _1811 || _1813;
        float _1817 = precise::min(_1803, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1819 = _1817 * _1777;
        float _1821 = _1799 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1823 = _1781 * _1805;
        float _1825 = _1791 * _1805;
        float _1827 = _1795 * _1805;
        float _1829 = _1821 * _1819;
        float _1831 = _1783;
        float _1833 = _1803;
        float _1835 = _1821;
        _1681 = _1823;
        if (_1815)
        {
            float _1837 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1831 = _1837;
        }
        float _1839 = _1831;
        if (_1815)
        {
            float _1841 = precise::max(_1803, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1833 = _1841;
        }
        float _1843 = _1833;
        float _1845 = fma(_1823, _1829, _1659);
        float _1847 = fma(_1825, _1829, _1757);
        float _1849 = fma(_1827, _1829, _1761);
        float _1851 = _1843;
        float _1853 = _1847;
        _1679 = _1839;
        if (_1815)
        {
            float _1855 = _1843 * _1839;
            _1851 = _1855;
        }
        float _1857 = _1851;
        float _1859 = _1857;
        if (_1815)
        {
            float _1861 = _1821 * _1857;
            _1677 = _1861;
        }
        float _1863 = _1677;
        if (!_1815)
        {
            _1835 = _1845;
        }
        float _1865 = _1835;
        float _1867 = _1865;
        if (!_1815)
        {
            _1859 = _1849;
        }
        float _1869 = _1859;
        _1767 = _1869;
        if (_1815)
        {
            float _1871 = fma(_1823, _1863, _1659);
            _1867 = _1871;
        }
        float _1873 = _1867;
        _1765 = _1873;
        if (_1815)
        {
            float _1875 = fma(_1825, _1863, _1757);
            _1853 = _1875;
        }
        float _1877 = _1853;
        _1763 = _1877;
        if (_1815)
        {
            float _1879 = fma(_1827, _1863, _1761);
            _1767 = _1879;
        }
    }
    float _1881 = _1763;
    float _1883 = _1765;
    float _1885 = _1767;
    float _1887 = _1679;
    float _1889 = _1681;
    float _1891 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1893 = _1881 + _1891;
    float _1895 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1897 = _1883 + _1895;
    float _1899 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1901 = _1885 + _1899;
    float _1903 = _1893 * _1893;
    float _1905 = fma(_1897, _1897, _1903);
    float _1907 = fma(_1901, _1901, _1905);
    float _1909 = rsqrt(_1907);
    float _1911 = sqrt(_1907);
    float _1913 = _1909 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1915 = _1897 * _1913;
    float _1917 = _1901 * _1913;
    float _1919 = _1915 * _1915;
    float _1921 = _1917 * _1917;
    float _1923 = _1919 + _1921;
    float _1925 = sqrt(_1923);
    bool _1927 = _1925 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1929 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1931 = _1925 + _1929;
    float _1933 = _1909;
    float _1935 = _1931;
    float _1937 = _1887;
    float _1939 = _1893;
    float _1941 = _1913;
    if (_1927)
    {
        float _1943 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1933 = _1943;
    }
    float _1945 = _1933;
    float _1947 = _1945;
    if (_1927)
    {
        float _1949 = _1931 * _1945;
        _1935 = _1949;
    }
    float _1951 = _1935;
    if (_1927)
    {
        float _1953 = rsqrt(_1923);
        _1947 = _1953;
    }
    float _1955 = _1947;
    float _1957 = _1955;
    if (_1927)
    {
        float _1959 = _1951 * 0.15915493667125701904296875;
        _1937 = _1959;
    }
    float _1961 = _1937;
    float _1963 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1965 = _1901;
    float _1967 = _1961;
    if (_1927)
    {
        float _1969 = _1961 * 6.283185482025146484375;
        float _1971 = sin(_1969);
        _1965 = _1971;
    }
    float _1973 = _1965;
    float _1975 = precise::max(0.0, _1963);
    float _1977 = _1889;
    float _1979 = _1975;
    if (_1927)
    {
        float _1981 = _1961 * 6.283185482025146484375;
        float _1983 = cos(_1981);
        _1977 = _1983;
    }
    float _1985 = _1977;
    float _1987 = -_1913;
    float _1989 = -_1975;
    float _1991 = fma(_1893, _1987, _1989);
    if (_1927)
    {
        float _1993 = _1991 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1939 = _1993;
    }
    float _1995 = _1939;
    float _1997 = _1973;
    float _1999 = _1995;
    if (_1927)
    {
        float _2001 = fma(_1973, _1995, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1997 = _2001;
    }
    float _2003 = _1997;
    float _2005 = _2003;
    if (!_1927)
    {
        _1999 = _1917;
    }
    float _2007 = _1999;
    float _2009 = _2007;
    if (!_1927)
    {
        _1967 = _1919;
    }
    float _2011 = _1967;
    float _2013 = _2011;
    if (_1927)
    {
        float _2015 = _1955 * _2003;
        _1683 = _2015;
    }
    float _2017 = _1683;
    if (!_1927)
    {
        _1957 = _1915;
    }
    float _2019 = _1957;
    float _2021 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2023 = _2019;
    if (_1927)
    {
        float _2025 = _1985 + (-1.0);
        _1979 = _2025;
    }
    float _2027 = _1979;
    float _2029 = _2027;
    if (_1927)
    {
        float _2031 = _1915 * _2017;
        _2023 = _2031;
    }
    float _2033 = _2023;
    if (!_1927)
    {
        _2005 = _1991;
    }
    float _2035 = _2005;
    float _2037 = _2035;
    if (_1927)
    {
        float _2039 = _1917 * _2017;
        _2009 = _2039;
    }
    float _2041 = _2009;
    if (_1927)
    {
        float _2043 = _2027 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1941 = _2043;
    }
    float _2045 = _1941;
    if (_1927)
    {
        float _2047 = _2033 * _2033;
        _2013 = _2047;
    }
    float _2049 = _2013;
    if (!_1927)
    {
        _2029 = _1921;
    }
    float _2051 = _2029;
    float _2053 = _2051;
    if (_1927)
    {
        float _2055 = _2041 * _2041;
        _2053 = _2055;
    }
    float _2057 = _2053;
    if (_1927)
    {
        float _2059 = fma(_1991, _1985, _2045);
        _2037 = _2059;
    }
    float _2061 = _2037;
    float _2063 = _1881 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2065 = fma(_2061, _2061, _2049);
    float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2069 = fma(_1911, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2067);
    float _2071 = precise::clamp(_2069, 0.0, 1.0);
    float _2073 = _2065 + _2057;
    float _2075 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2063);
    float _2077 = _1881 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2079 = -_2071;
    float _2081 = _2079 + 1.0;
    float _2083 = _1881 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2085 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2075);
    float _2087 = rsqrt(_2073);
    float _2089 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2077);
    float _2091 = _1881 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2093 = _2085 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2095 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2083);
    float _2097 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2089);
    float _2099 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2091);
    float _2101 = _2093 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2103 = abs(_2081);
    float _2105 = log2(_2103);
    float _2107 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2095);
    float _2109 = _2097 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2111 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2099);
    float _2113 = -_2101;
    float _2115 = fma(_2113, _2021, 1.0);
    float _2117 = _2107 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2119 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2121 = _2111 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2123 = _2087 * _2033;
    float _2125 = _2087 * _2061;
    float _2127 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2119);
    float _2129 = _2087 * _2041;
    float _2131 = _2123 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2133 = log2(_2115);
    float _2135 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2127);
    float _2137 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2139 = -_2131;
    float _2141 = fma(_2125, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2139);
    float _2143 = _2105 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2145 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2135);
    float _2147 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2137);
    float _2149 = -_2129;
    float _2151 = fma(_2149, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2141);
    float _2153 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2155 = 1.0 / _2145;
    float _2157 = _2125 + 1.0;
    float _2159 = fma(_2151, -0.5, 0.5);
    float _2161 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2153);
    float _2163 = fma(_2151, 0.5, 0.5);
    float _2165 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2147);
    float _2167 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2161);
    float _2169 = exp2(_2143);
    float _2171 = fma(_2163, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2173 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2165);
    float _2175 = sqrt(_2159);
    float _2177 = -_2125;
    float _2179 = fma(_2169, _2157, _2177);
    float _2181 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2167);
    float _2183 = fma(_2163, _2171, -0.212114393711090087890625);
    float _2185 = _2133 * 0.693147182464599609375;
    float _2187 = _2173 * _2155;
    float _2189 = _2181 * _2155;
    float _2191 = fma(_2163, _2183, 1.570728778839111328125);
    float _2193 = _2185 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2195 = _2175 * 0.636619746685028076171875;
    float _2197 = fma(_2187, 0.5, 0.5);
    float _2199 = fma(_2189, -0.5, 0.5);
    float _2201 = fma(_2179, 0.5, 0.5);
    float _2203 = -_2191;
    float _2205 = fma(_2195, _2203, 1.0);
    float3 _5898 = float3(_2197, _2199, _2193);
    float _2207 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5898, float3(0.0), isnan(_5898)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5898, float3(0.0), isnan(_5898)), level(0.0)).x;
    float3 _5909 = float3(_2197, _2199, _2193);
    float4 _2210 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5909, float3(0.0), isnan(_5909)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5909, float3(0.0), isnan(_5909)), level(0.0)).xyzw;
    float _2212 = _2210.x;
    float _2214 = _2210.y;
    float _2216 = _2210.z;
    float _2218 = _2210.w;
    float2 _5926 = float2(_2205, _2201);
    float3 _2222 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5926, float2(0.0), isnan(_5926)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5926, float2(0.0), isnan(_5926)), level(0.0)).xyz;
    float _2224 = _2222.x;
    float _2226 = _2222.y;
    float _2228 = _2222.z;
    float _2230 = in.m_65.y;
    float _2232 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    out.m_67.y = _1881;
    float _2234 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2236 = _2234 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _2238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2240 = _2238 != 0;
    float _2242 = _1757 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2244 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2246 = _2244 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2248 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2250 = _2248 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2252 = _1005 > 0.5;
    float _2254 = _1757 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _2256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2258 = _2256 != 0;
    float _2260 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2242);
    float _2262 = 1.0 / _2246;
    bool _2264 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2266 = isnan(0.5);
    bool _2268 = _2264 || _2266;
    bool _2270 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2272 = _2268 || _2270;
    float _2274 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2254);
    float _2276 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2260);
    bool _2278 = _748 > 0.5;
    bool _2280 = _2278 && _2258;
    float _2282 = -_2230;
    float _2284 = _2282 + 1.0;
    float _2286 = 1.0 / _2250;
    float _2288 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2290 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2288;
    float _2292 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2274);
    float _2294 = _2230;
    if (_2240)
    {
        float _2296 = _2252 ? _2284 : _2230;
        _2294 = _2296;
    }
    float _2298 = _2294;
    float _2300 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2302 = _2300 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2304 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2306 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2304;
    float _2308 = in.m_65.x;
    float _2310 = 1.0 / _2236;
    float _2312 = _2276 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2314 = _2290 * _2262;
    float _2316 = _2292 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2318 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2320 = _2262;
    if (!_2272)
    {
        _2320 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2322 = _2320;
    float _2324 = 1.0 / _2312;
    float _2326 = _2302 * _2286;
    float _2328 = fma(_2318, _2298, -0.5);
    bool _2330 = _995 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2332 = isnan(_995);
    bool _2334 = _2330 || _2332;
    bool _2336 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2338 = _2334 || _2336;
    float _2340 = float(_2338);
    bool _2342 = _995 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2344 = isnan(_995);
    bool _2346 = _2342 || _2344;
    bool _2348 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2350 = _2346 || _2348;
    float _2352 = float(_2350);
    float _2354 = -_1223;
    float _2356 = fma(_1221, _2328, _2354);
    float _2358 = _2105 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2360 = _2306 * _2310;
    float _2362 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2364 = _995 + _2362;
    float _2366 = _2316 + _2312;
    bool _2368 = _995 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2370 = isnan(_995);
    bool _2372 = _2368 || _2370;
    bool _2374 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2376 = _2372 || _2374;
    float _2378 = float(_2376);
    float _2380 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2382 = fma(_2314, _2364, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2384 = _995 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2386 = isnan(_995);
    bool _2388 = _2384 || _2386;
    bool _2390 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2392 = _2388 || _2390;
    float _2394 = float(_2392);
    float _2396 = _2366 * _2324;
    float _2398 = _2396 * 0.5;
    float _2400 = -_2378;
    float _2402 = _2400 + 1.0;
    float _2404 = _2322;
    float _2406 = _2398;
    float _2408 = _2308;
    float _2410 = _2326;
    if (_2258)
    {
        _1685 = _2308;
    }
    float _2412 = _1685;
    float _2414 = -_2394;
    float _2416 = _2414 + 1.0;
    float _2418 = _2412;
    if (!_2272)
    {
        float _2420 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2422 = fma(_2398, _2322, _2420);
        _2404 = _2422;
    }
    float _2424 = _2404;
    float _2426 = _2394 * _2402;
    float _2428 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2430 = _995 + _2428;
    float _2432 = _2340 * _2416;
    float _2434 = -_2340;
    float _2436 = _2434 + 1.0;
    if (_2280)
    {
        float _2438 = -_2412;
        float _2440 = _2438 + 1.0;
        _2418 = _2440;
    }
    float _2442 = _2418;
    if (!_2272)
    {
        _2406 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2444 = _2406;
    float _2446 = fma(_2326, _2430, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2448 = _2352 * _2436;
    float _2450 = _2424;
    if (!_2272)
    {
        float _2452 = 1.0 / _2424;
        _2450 = _2452;
    }
    float _2454 = _2450;
    if (_2258)
    {
        _2408 = _2442;
    }
    float _2456 = _2408;
    if (!_2272)
    {
        float _2458 = -_2444;
        float _2460 = _2458 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2410 = _2460;
    }
    float _2462 = _2410;
    float _2464 = _2382 * _2448;
    float _2466 = -_2352;
    float _2468 = _2466 + 1.0;
    float _2470 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2472 = _995 + _2470;
    float _2474 = _2380 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2476 = _2286;
    if (!_2272)
    {
        float _2478 = 1.0 / _2462;
        _2476 = _2478;
    }
    float _2480 = _2476;
    float _2482 = fma(_2468, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2464);
    float _2484 = fma(_2474, _2456, -0.5);
    float _2486 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2488 = fma(_2360, _2472, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2490 = fma(_2446, _2432, _2482);
    float _2492 = in.m_69.w;
    float _2494 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2486);
    float _2496 = exp2(_2358);
    float _2498 = fma(_2488, _2426, _2490);
    float _2500 = _2488;
    if (!_2272)
    {
        float _2502 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2504 = -_2444;
        float _2506 = fma(_2454, _2502, _2504);
        _2500 = _2506;
    }
    float _2508 = _2500;
    float _2510 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2494);
    float _2512 = fma(_1215, _2484, _1201);
    float _2514 = fma(_2378, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2498);
    float _2516 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2510);
    float _2518 = _2508;
    float _2520 = (*spvDescriptorSet0.vp_c9)._m0[123].x;
    if (!_2272)
    {
        float _2522 = _2508 * _2480;
        float _2524 = precise::clamp(_2522, 0.0, 1.0);
        _2518 = _2524;
    }
    float _2526 = _2518;
    float _2528 = _2356 + 0.5;
    float _2530 = _2512 + 0.5;
    float _2532 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2534 = _2516 + _2532;
    float _2536 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    if (_2272)
    {
        _2520 = 1.0;
    }
    float _2538 = _2520;
    float _2540 = _2538;
    if (!_2272)
    {
        float _2542 = -_2526;
        float _2544 = _2542 + 1.0;
        _2540 = _2544;
    }
    float _2546 = _2540;
    float _2548 = _2145 + _2534;
    float _2550 = -_2496;
    float _2552 = _2550 + 1.0;
    out.m_71.x = _2530;
    out.m_71.y = _2528;
    float _2554 = _2548 * 0.5;
    float _2556 = _2552 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2558 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2560 = _2546 > 0.0;
    bool _2562 = isnan(_2546);
    bool _2564 = _2560 || _2562;
    bool _2566 = isnan(0.0);
    bool _2568 = _2564 || _2566;
    float _2570 = _2546 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _2173;
    out.gl_Position.y = _2181;
    out.gl_Position.z = _2534;
    out.gl_Position.w = _2145;
    float _2572 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2574 = _2536 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2576 = -_2556;
    float _2578 = _2576 + 1.0;
    float _2580 = _2558 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2582 = _2572 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2584 = _2514 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2586 = _2570 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.w = _2492;
    out.m_75.x = _2574;
    out.m_75.y = _2580;
    out.m_75.z = _2582;
    out.m_75.w = _2584;
    out.m_77.z = _2554;
    out.m_77.w = _2145;
    out.m_45.x = _2586;
    float _2588 = _2556 * _2207;
    float _2590 = _2218 * _2578;
    float _2592 = _2218 * _2588;
    float _2594 = _2228 * _2588;
    float _2596 = fma(_2224, _2592, _2212);
    float _2598 = fma(_2226, _2592, _2214);
    float _2600 = fma(_2218, _2594, _2216);
    out.m_79.x = _2596;
    out.m_79.y = _2598;
    out.m_79.z = _2600;
    out.m_79.w = _2590;
    if (_2568)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2602 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2602;
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _987 = false;
    bool _782 = false;
    bool _610 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_42.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_45.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2659 = as_type<float>(_114);
        out.gl_Position.z = _2659;
    }
    if (!_102)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _118 = in.m_47.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _134 = 0.0;
    float _136 = 0.0;
    float _138 = _132;
    if (_128)
    {
        float _140 = float(_98);
        _134 = _140;
    }
    float _142 = _134;
    bool _144 = _132 >= _142;
    bool _146 = !_128;
    bool _148 = _144 || _146;
    if (_148)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _108;
    if (_148)
    {
        out.m_45.x = 0.0;
    }
    if (_148)
    {
        float _152 = _150 * 5.0;
        _116 = as_type<int>(_152);
    }
    int _154 = _116;
    float _156 = as_type<float>(_154);
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2730 = as_type<float>(_154);
        out.gl_Position.z = _2730;
    }
    if (_148)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _158 = in.m_49.y;
    float _160 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _162 = in.m_51.y;
    bool _164 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _166 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _168 = _164 || _166;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    float _174 = in.m_53.y;
    float _176 = in.m_49.z;
    float _178 = in.m_51.z;
    float _180 = _160;
    if (!_172)
    {
        float _182 = _160 * _160;
        float _184 = _182 * 0.5;
        _156 = _184;
    }
    float _186 = _156;
    float _188 = 0.0;
    float _190 = _186;
    if (!_172)
    {
        float _192 = _132 * _132;
        float _194 = _192 * 0.5;
        _188 = _194;
    }
    float _196 = _188;
    float _198 = in.m_53.z;
    if (!_172)
    {
        float _200 = _186 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _200;
    }
    float _202 = _190;
    float _204 = _158 * _158;
    float _206 = fma(_162, _162, _204);
    float _208 = fma(_174, _174, _206);
    float _210 = in.m_47.x;
    float _212 = in.m_47.y;
    float _214 = in.m_47.z;
    float _216 = sqrt(_208);
    bool _218 = _216 > 0.0;
    float _220 = _176 * _176;
    float _222 = fma(_178, _178, _220);
    bool _224 = !_172;
    float _226 = _202;
    float _228 = 0.0;
    float _230 = _222;
    if (!_224)
    {
        float _232 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _234 = log2(_232);
        float _236 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _238 = _236 + 1.0;
        float _240 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = _160 * _234;
        float _244 = 1.0 / _238;
        float _246 = _240 * 0.693147182464599609375;
        float _248 = exp2(_242);
        float _250 = 1.0 / _246;
        float _252 = _248 + (-1.0);
        float _254 = -_252;
        float _256 = fma(_254, _250, _160);
        float _258 = _256 * _244;
        float _260 = _258 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _136 = _250;
        _226 = _260;
        _228 = _244;
    }
    float _262 = _136;
    float _264 = _226;
    float _266 = _228;
    bool _268 = !_172;
    float _270 = _262;
    float _272 = _266;
    if (!_268)
    {
        float _274 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _276 = log2(_274);
        float _278 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _280 = _278 + 1.0;
        float _282 = 1.0 / _280;
        float _284 = _160 * _276;
        float _286 = exp2(_284);
        float _288 = -_286;
        float _290 = _288 + 1.0;
        float _292 = _290 * _282;
        _270 = _280;
        _180 = _292;
    }
    float _294 = _270;
    float _296 = _180;
    float _298 = fma(_198, _198, _222);
    float _300 = _294;
    if (!_172)
    {
        _300 = _132;
    }
    float _302 = _300;
    float _304 = _302;
    if (!_172)
    {
        float _306 = _196 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _230 = _306;
    }
    float _308 = _230;
    bool _310 = !_172;
    float _312 = _308;
    if (!_310)
    {
        float _314 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _316 = log2(_314);
        float _318 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _320 = _318 + 1.0;
        float _322 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _324 = _132 * _316;
        float _326 = 1.0 / _320;
        float _328 = _322 * 0.693147182464599609375;
        float _330 = exp2(_324);
        float _332 = 1.0 / _328;
        float _334 = _330 + (-1.0);
        float _336 = -_334;
        float _338 = fma(_336, _332, _132);
        float _340 = _338 * _326;
        float _342 = _340 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _312 = _342;
        _272 = _332;
    }
    float _344 = _312;
    float _346 = _272;
    bool _348 = !_172;
    if (!_348)
    {
        float _350 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _352 = log2(_350);
        float _354 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _356 = _354 + 1.0;
        float _358 = 1.0 / _356;
        float _360 = _132 * _352;
        float _362 = exp2(_360);
        float _364 = -_362;
        float _366 = _364 + 1.0;
        float _368 = _366 * _358;
        _304 = _368;
    }
    float _370 = _304;
    float _372 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _374 = _344 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _376 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _378 = _344 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _380 = fma(_296, _212, _372);
    float _382 = fma(_370, _212, _374);
    float _384 = fma(_296, _210, _376);
    float _386 = sqrt(_298);
    float _388 = _264 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _390 = _344 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _392 = fma(_370, _210, _378);
    float _394 = -_382;
    float _396 = _380 + _394;
    float _398 = fma(_296, _214, _388);
    float _400 = fma(_370, _214, _390);
    float _402 = -_392;
    float _404 = _384 + _402;
    float _406 = _396 * _396;
    float _408 = in.m_49.x;
    float _410 = -_400;
    float _412 = _398 + _410;
    float _414 = _346;
    float _416 = _382;
    float _418 = _390;
    float _420 = _378;
    if (_218)
    {
        float _422 = rsqrt(_208);
        _414 = _422;
    }
    float _424 = _414;
    float _426 = fma(_404, _404, _406);
    float _428 = in.m_53.x;
    if (!_218)
    {
        _416 = 0.0;
        _418 = 0.0;
    }
    float _430 = _416;
    float _432 = _418;
    float _434 = _430;
    float _436 = _432;
    if (!_218)
    {
        _420 = 0.0;
    }
    float _438 = _420;
    float _440 = fma(_412, _412, _426);
    bool _442 = _386 > 0.0;
    float _444 = in.m_55.w;
    float _446 = _396 * _158;
    float _448 = _396 * _174;
    float _450 = in.m_51.x;
    float _452 = sqrt(_440);
    float _454 = in.m_42.x;
    float _456 = in.m_42.y;
    float _458 = in.m_42.z;
    float _460 = _438;
    float _462 = _424;
    if (_218)
    {
        float _464 = _424 * _162;
        _460 = _464;
    }
    float _466 = _460;
    float _468 = _466;
    if (_218)
    {
        float _470 = _424 * _158;
        _434 = _470;
    }
    float _472 = _434;
    float _474 = _472;
    if (_218)
    {
        float _476 = _424 * _174;
        _436 = _476;
    }
    float _478 = _436;
    float _480 = 0.0;
    float _482 = _478;
    if (!_442)
    {
        _480 = 0.0;
    }
    float _484 = _480;
    float _486 = 0.0;
    float _488 = _484;
    if (_442)
    {
        float _490 = rsqrt(_298);
        _486 = _490;
    }
    float _492 = _486;
    if (!_442)
    {
        _462 = 0.0;
    }
    float _494 = _462;
    float _496 = fma(_404, _408, _446);
    float _498 = 0.0;
    float _500 = _494;
    float _502 = _496;
    if (!_442)
    {
        _498 = 0.0;
    }
    float _504 = _498;
    float _506 = fma(_404, _428, _448);
    bool _508 = _452 >= 9.9999999747524270787835121154785e-07;
    bool _510 = isnan(_452);
    bool _512 = _508 || _510;
    bool _514 = isnan(9.9999999747524270787835121154785e-07);
    bool _516 = _512 || _514;
    float _518 = _396 * _162;
    float _520 = fma(_412, _176, _496);
    float _522 = fma(_404, _450, _518);
    float _524 = 0.0;
    float _526 = _504;
    float _528 = _506;
    if (_442)
    {
        float _530 = _492 * 0.001000000047497451305389404296875;
        _524 = _530;
    }
    float _532 = _524;
    float _534 = fma(_412, _198, _506);
    float _536 = fma(_412, _178, _522);
    float _538 = _534;
    float _540 = _534;
    if (_442)
    {
        float _542 = _178 * _532;
        _488 = _542;
    }
    float _544 = _488;
    if (_442)
    {
        float _546 = _176 * _532;
        _500 = _546;
    }
    float _548 = _500;
    if (_442)
    {
        float _550 = _198 * _532;
        _526 = _550;
    }
    float _552 = _526;
    float _554 = fma(_384, _444, _454);
    float _556 = fma(_380, _444, _456);
    float _558 = fma(_398, _444, _458);
    if (_516)
    {
        _502 = _536;
    }
    float _560 = _502;
    float _562 = _560;
    float _564 = _560;
    if (_516)
    {
        _528 = _520;
    }
    float _566 = _528;
    float _568 = _566;
    float _570 = _566;
    if (!_516)
    {
        bool _572 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _574 = !_572;
        if (!_574)
        {
            float _576 = _158 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _578 = _162 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _580 = _174 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _582 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[16].x, _576);
            float _584 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[16].x, _578);
            float _586 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[16].x, _580);
            float _588 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[16].z, _582);
            float _590 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[16].z, _584);
            float _592 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[16].z, _586);
            float _594 = _588 * _588;
            float _596 = fma(_590, _590, _594);
            float _598 = fma(_592, _592, _596);
            float _600 = rsqrt(_598);
            float _602 = _600 * 9.9999999747524270787835121154785e-07;
            float _604 = _590 * _602;
            float _606 = _588 * _602;
            float _608 = _592 * _602;
            _570 = _606;
            _564 = _604;
            _540 = _608;
            _610 = true;
        }
        else
        {
            float _612 = _212 * _212;
            float _614 = fma(_210, _210, _612);
            float _616 = fma(_214, _214, _614);
            float _618 = sqrt(_616);
            bool _620 = _618 >= 9.9999999747524270787835121154785e-07;
            bool _622 = isnan(_618);
            bool _624 = _620 || _622;
            bool _626 = isnan(9.9999999747524270787835121154785e-07);
            bool _628 = _624 || _626;
            if (!_628)
            {
                float _630 = _456 * _456;
                float _632 = fma(_454, _454, _630);
                float _634 = fma(_458, _458, _632);
                float _636 = sqrt(_634);
                bool _638 = _636 >= 9.9999999747524270787835121154785e-07;
                bool _640 = isnan(_636);
                bool _642 = _638 || _640;
                bool _644 = isnan(9.9999999747524270787835121154785e-07);
                bool _646 = _642 || _644;
                float _648 = _208;
                if (!_646)
                {
                    float _650 = rsqrt(_208);
                    _648 = _650;
                }
                float _652 = _648;
                if (!_646)
                {
                    float _654 = _652 * 9.9999999747524270787835121154785e-07;
                    _538 = _654;
                }
                float _656 = _538;
                float _658 = _656;
                if (!_646)
                {
                    float _660 = _162 * _656;
                    _562 = _660;
                }
                float _662 = _562;
                _564 = _662;
                if (!_646)
                {
                    float _664 = _158 * _656;
                    _568 = _664;
                }
                float _666 = _568;
                _570 = _666;
                if (!_646)
                {
                    float _668 = _174 * _656;
                    _658 = _668;
                }
                float _670 = _658;
                bool _672 = !_646;
                _540 = _670;
                _610 = _672;
                if (!_610)
                {
                    float _674 = _158 * _456;
                    float _676 = _162 * _456;
                    float _678 = _174 * _456;
                    float _680 = fma(_454, _408, _674);
                    float _682 = fma(_454, _450, _676);
                    float _684 = fma(_454, _428, _678);
                    float _686 = fma(_176, _458, _680);
                    float _688 = fma(_178, _458, _682);
                    float _690 = fma(_198, _458, _684);
                    float _692 = _686 * _686;
                    float _694 = fma(_688, _688, _692);
                    float _696 = fma(_690, _690, _694);
                    float _698 = rsqrt(_696);
                    float _700 = _698 * 9.9999999747524270787835121154785e-07;
                    float _702 = _688 * _700;
                    float _704 = _686 * _700;
                    float _706 = _690 * _700;
                    _570 = _704;
                    _564 = _702;
                    _540 = _706;
                    _610 = true;
                }
            }
            else
            {
                float _708 = _158 * _212;
                float _710 = _162 * _212;
                float _712 = _174 * _212;
                float _714 = fma(_210, _408, _708);
                float _716 = fma(_210, _450, _710);
                float _718 = fma(_210, _428, _712);
                float _720 = fma(_176, _214, _714);
                float _722 = fma(_178, _214, _716);
                float _724 = fma(_198, _214, _718);
                float _726 = _720 * _720;
                float _728 = fma(_722, _722, _726);
                float _730 = fma(_724, _724, _728);
                float _732 = rsqrt(_730);
                float _734 = _732 * 9.9999999747524270787835121154785e-07;
                float _736 = _722 * _734;
                float _738 = _720 * _734;
                float _740 = _724 * _734;
                _570 = _738;
                _564 = _736;
                _540 = _740;
            }
        }
    }
    _610 = false;
    float _742 = _570;
    float _744 = _564;
    float _746 = _540;
    float _748 = in.m_57.x;
    float _750 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _752 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _754 = _750 * _748;
    float _756 = trunc(_754);
    int _758 = int(_756);
    int _760 = _758 << 4;
    int _762 = _760 + 1712;
    bool _764 = !_752;
    float _780;
    if (!_764)
    {
        float _766 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _768 = _748 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _770 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _772 = _770 * _766;
        float _774 = floor(_772);
        float _776 = -_774;
        float _778 = _772 + _776;
        _780 = _778;
        _782 = true;
    }
    else
    {
        float _784 = float(_98);
        float _786 = 1.0 / _784;
        float _788 = _132 * _786;
        _780 = _788;
    }
    _782 = false;
    float _790 = _780;
    int _792 = _762 + 8;
    uint _795 = uint(int(uint(_792) >> uint(2)));
    uint _797 = uint(int(uint(int(_795)) >> uint(2)));
    int _799 = int(_795) & 3;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[int(_797)][_799];
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _805 = _790 + _803;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _809 = _807 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _813 = _811 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _815 = _790 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _817 = isnan(_790);
    bool _819 = _815 || _817;
    bool _821 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _823 = _819 || _821;
    float _825 = float(_823);
    uint _827 = uint(int(uint(_762) >> uint(2)));
    uint _829 = uint(int(uint(int(_827)) >> uint(2)));
    int _831 = int(_827) & 3;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[int(_829)][_831];
    int _835 = int(_827) + 1;
    uint _837 = uint(int(uint(_835) >> uint(2)));
    int _839 = _835 & 3;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[int(_837)][_839];
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _847 = 1.0 / _809;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _851 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _849;
    bool _853 = _790 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _855 = isnan(_790);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = -_825;
    float _867 = _865 + 1.0;
    bool _869 = _790 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _871 = isnan(_790);
    bool _873 = _869 || _871;
    bool _875 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _877 = _873 || _875;
    float _879 = float(_877);
    float _881 = 1.0 / _813;
    bool _883 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _885;
    float _889 = 1.0 / _845;
    float _891 = _851 * _847;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _897 = _863 * _867;
    float _899 = -_863;
    float _901 = _899 + 1.0;
    float _903 = fma(_891, _805, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _905 = _790 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _907 = isnan(_790);
    bool _909 = _905 || _907;
    bool _911 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _913 = _909 || _911;
    float _915 = float(_913);
    float _917 = _879 * _901;
    float _919 = _895 * _881;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _923 = _790 + _921;
    float _925 = -_879;
    float _927 = _925 + 1.0;
    float _929 = _903 * _917;
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _933 = _790 + _931;
    float _935 = fma(_919, _923, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _937 = -_915;
    float _939 = _937 + 1.0;
    float _941 = _887 * _889;
    float _943 = fma(_927, (*spvDescriptorSet0.vp_c9)._m0[115].x, _929);
    float _945 = _825 * _939;
    float _947 = fma(_941, _933, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _949 = fma(_935, _897, _943);
    float _951 = _801 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _953 = fma(_947, _945, _949);
    float _955 = _951 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _957 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[118].x, _953);
    float _959 = _833 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _961 = _841 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _963 = _957 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _965 = _959 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _967 = _961 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _965;
    out.m_59.y = _967;
    out.m_59.z = _955;
    out.m_59.w = _963;
    bool _969 = !_883;
    float _985;
    if (!_969)
    {
        float _971 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _973 = _748 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _975 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[11].w, _132);
        float _977 = _975 * _971;
        float _979 = floor(_977);
        float _981 = -_979;
        float _983 = _977 + _981;
        _985 = _983;
        _987 = true;
    }
    else
    {
        float _989 = float(_98);
        float _991 = 1.0 / _989;
        float _993 = _132 * _991;
        _985 = _993;
    }
    _987 = false;
    float _995 = _985;
    float _997 = in.m_57.z;
    float _999 = _556 * _158;
    float _1001 = _556 * _162;
    float _1003 = _556 * _174;
    float _1005 = in.m_57.y;
    float _1007 = fma(_554, _408, _999);
    float _1009 = fma(_554, _450, _1001);
    float _1011 = fma(_554, _428, _1003);
    int _1013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1015 = _1013 != 0;
    int _1017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1019 = _1017 != 0;
    int _1021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1023 = _1021 != 0;
    float _1025 = fma(_558, _176, _1007);
    float _1027 = fma(_558, _178, _1009);
    float _1029 = _748 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1033 = in.m_51.w;
    float _1035 = _748 * 2.0;
    float _1037 = _742 * _742;
    float _1039 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1041 = log2(_1039);
    float _1043 = -_1031;
    float _1045 = fma(_1029, 2.0, _1043);
    float _1047 = fma(_744, _744, _1037);
    float _1049 = in.m_49.w;
    float _1051 = fma(_558, _198, _1011);
    float _1053 = _997 * 2.0;
    float _1055 = fma(_746, _746, _1047);
    float _1057 = floor(_1035);
    float _1059 = in.m_53.w;
    float _1061 = _1005 * 2.0;
    float _1063 = _748 + _1005;
    float _1065 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1067 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1069 = _1063 + (-1.0);
    float _1071 = floor(_1053);
    float _1073 = fma(_1067, -2.0, _1065);
    float _1075 = _1005 + _997;
    float _1077 = _1075 + (-1.0);
    float _1079 = floor(_1061);
    bool _1081 = _1057 > 0.0;
    bool _1083 = _1057 >= 0.0;
    bool _1085 = isnan(_1057);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan(0.0);
    bool _1091 = _1087 || _1089;
    float _1093 = fma(_1077, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1095 = _1025 + _1049;
    int _1097 = _1091 ? 0 : 1;
    float _1099 = rsqrt(_1055);
    bool _1101 = _1071 >= 0.0;
    bool _1103 = isnan(_1071);
    bool _1105 = _1101 || _1103;
    bool _1107 = isnan(0.0);
    bool _1109 = _1105 || _1107;
    float _1111 = _1051 + _1059;
    bool _1113 = _1071 > 0.0;
    float _1115 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1117 = _1041 * _132;
    float _1119 = _1027 + _1033;
    float _1121 = exp2(_1117);
    int _1123 = _1109 ? 0 : 1;
    bool _1125 = _1079 > 0.0;
    bool _1127 = _1079 >= 0.0;
    bool _1129 = isnan(_1079);
    bool _1131 = _1127 || _1129;
    bool _1133 = isnan(0.0);
    bool _1135 = _1131 || _1133;
    float _1137 = _1099 * _742;
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1141 = 1.0 + _1139;
    bool _1143 = !_1019;
    int _1145 = _1143 ? 0 : 1;
    float _1147 = _1099 * _744;
    int _1149 = ~_1097;
    int _1151 = _1149 + 1;
    int _1153 = _1151 + 1;
    float _1155 = 1.0 / _1141;
    float _1157 = _1099 * _746;
    float _1159 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1161 = abs(_1145);
    int _1163 = _1153;
    if (!_1081)
    {
        int _1165 = ~_1097;
        int _1167 = _1165 + 1;
        _1163 = _1167;
    }
    int _1169 = _1163;
    float _1171 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1159);
    float _1173 = -_1121;
    float _1175 = _1173 + 1.0;
    bool _1177 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1179 = isnan(1.0);
    bool _1181 = _1177 || _1179;
    bool _1183 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1185 = _1181 || _1183;
    float _1187 = in.m_61.x;
    float _1189 = in.m_61.y;
    float _1191 = in.m_61.z;
    float _1193 = float(_1161);
    float _1195 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1197 = float(_1169);
    float _1199 = -_132;
    float _1201 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1045);
    bool _1203 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1205 = isnan(0.0);
    bool _1207 = _1203 || _1205;
    bool _1209 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1211 = _1207 || _1209;
    float _1213 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1195);
    float _1215 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1171);
    float _1217 = _1193 * _1197;
    float _1219 = _1211 ? _1175 : 0.0;
    float _1221 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1213);
    float _1223 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1073);
    float _1225 = _1217 * (-2.0);
    int _1227 = _1135 ? 0 : 1;
    if (_1185)
    {
        float _1229 = _1219 * _1155;
        _138 = _1229;
    }
    float _1231 = _138;
    bool _1233 = !_1015;
    int _1235 = _1233 ? 0 : 1;
    float _1237 = fma(_1093, _1225, _1093);
    int _1239 = ~_1123;
    int _1241 = _1239 + 1;
    int _1243 = _1241 + 1;
    float _1245 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1247 = _1095 + _1245;
    int _1249 = _1243;
    if (!_1113)
    {
        int _1251 = ~_1123;
        int _1253 = _1251 + 1;
        _1249 = _1253;
    }
    int _1255 = _1249;
    float _1257 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1259 = _1111 + _1257;
    int _1261 = abs(_1235);
    float _1263 = _1247 * _1247;
    int _1265 = ~_1227;
    int _1267 = _1265 + 1;
    int _1269 = _1267 + 1;
    float _1271 = fma(_1225, _1189, _1189);
    int _1273 = _1269;
    if (!_1125)
    {
        int _1275 = ~_1227;
        int _1277 = _1275 + 1;
        _1273 = _1277;
    }
    int _1279 = _1273;
    float _1281 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1283 = _1119 + _1281;
    bool _1285 = !_1023;
    int _1287 = _1285 ? 0 : 1;
    float _1289 = _1005 + (-0.5);
    float _1291 = float(_1261);
    float _1293 = fma(_1283, _1283, _1263);
    float _1295 = float(_1255);
    float _1297 = fma(_1289, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1271);
    int _1299 = abs(_1287);
    float _1301 = _748 + (-0.5);
    float _1303 = _1291 * _1295;
    float _1305 = fma(_1259, _1259, _1293);
    float _1307 = _1137 * _472;
    float _1309 = _1303 * (-2.0);
    float _1311 = fma(_1237, _1231, _1297);
    float _1313 = float(_1299);
    float _1315 = fma(_1147, _466, _1307);
    float _1317 = fma(_1309, _1187, _1187);
    float _1319 = float(_1279);
    float _1321 = rsqrt(_1305);
    float _1323 = fma(_1157, _478, _1315);
    float _1325 = _1311 * 0.15915493667125701904296875;
    float _1327 = fma(_1301, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1317);
    float _1329 = _748 + _997;
    float _1331 = fma(_1115, _1309, _1115);
    float _1333 = abs(_1323);
    bool _1335 = _1333 > 0.99989998340606689453125;
    float _1337 = _1313 * _1319;
    float _1339 = _1329 + (-1.0);
    float _1341 = fma(_1331, _1231, _1327);
    float _1343 = _1337 * (-2.0);
    float _1345 = _997 + (-0.5);
    float _1347 = fma(_1339, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1349 = _1341 * 0.15915493667125701904296875;
    float _1351 = fma(_1343, _1191, _1191);
    float _1353 = _1325 * 6.283185482025146484375;
    float _1355 = sin(_1353);
    float _1357 = fma(_1347, _1343, _1347);
    if (_1335)
    {
        float _1359 = _466 + _544;
        _468 = _1359;
    }
    float _1361 = _468;
    float _1363 = fma(_1345, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1351);
    float _1365 = _1247 * _1321;
    if (_1335)
    {
        float _1367 = _478 + _552;
        _482 = _1367;
    }
    float _1369 = _482;
    float _1371 = -_1361;
    float _1373 = _1157 * _1371;
    float _1375 = fma(_1357, _1231, _1363);
    float _1377 = -_1365;
    float _1379 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1247);
    float _1381 = _1283 * _1321;
    float _1383 = _1325 * 6.283185482025146484375;
    float _1385 = cos(_1383);
    if (_1335)
    {
        float _1387 = _472 + _548;
        _474 = _1387;
    }
    float _1389 = _474;
    float _1391 = -_1369;
    float _1393 = -_1373;
    float _1395 = fma(_1147, _1391, _1393);
    float _1397 = -_1381;
    float _1399 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1283);
    float _1401 = -_1369;
    float _1403 = _1137 * _1401;
    float _1405 = in.m_55.x;
    float _1407 = in.m_55.y;
    float _1409 = in.m_55.z;
    float _1411 = -_1389;
    float _1413 = _1147 * _1411;
    float _1415 = _1375 * 0.15915493667125701904296875;
    float _1417 = -_1389;
    float _1419 = -_1403;
    float _1421 = fma(_1157, _1417, _1419);
    float _1423 = _1379 * _1379;
    float _1425 = _1259 * _1321;
    float _1427 = in.m_63.x;
    float _1429 = in.m_63.y;
    float _1431 = in.m_63.z;
    float _1433 = -_1361;
    float _1435 = -_1413;
    float _1437 = fma(_1137, _1433, _1435);
    float _1439 = fma(_1399, _1399, _1423);
    float _1441 = -_1425;
    float _1443 = fma(_1441, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1259);
    float _1445 = _1395 * _1395;
    float _1447 = _1415 * 6.283185482025146484375;
    float _1449 = sin(_1447);
    float _1451 = fma(_1443, _1443, _1439);
    float _1453 = fma(_1421, _1421, _1445);
    bool _1455 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1457 = isnan(0.5);
    bool _1459 = _1455 || _1457;
    bool _1461 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1463 = _1459 || _1461;
    float _1465 = _1415 * 6.283185482025146484375;
    float _1467 = cos(_1465);
    float _1469 = _1409 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1471 = _1407 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1473 = _1349 * 6.283185482025146484375;
    float _1475 = sin(_1473);
    float _1477 = fma(_1437, _1437, _1453);
    float _1479 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1427);
    float _1481 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1429);
    float _1483 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1431);
    float _1485 = _1349 * 6.283185482025146484375;
    float _1487 = cos(_1485);
    float _1489 = sqrt(_1451);
    float _1491 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1493 = _1475 * _1355;
    float _1495 = _1475 * _1385;
    float _1497 = _1475 * _1467;
    float _1499 = _1491 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1501 = rsqrt(_1477);
    float _1503 = _1487 * _1385;
    float _1505 = _1487 * _1355;
    float _1507 = _1385 * _1467;
    float _1509 = _1487 * _1467;
    float _1511 = _1355 * _1467;
    float _1513 = fma(_1449, _1503, _1493);
    float _1515 = _1471 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1517 = _1321 * _1489;
    float _1519 = _1469 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1521 = fma(_1449, _1493, _1503);
    float _1523 = -_1505;
    float _1525 = fma(_1449, _1495, _1523);
    float _1527 = -_1495;
    float _1529 = fma(_1449, _1505, _1527);
    float _1531 = _1519 * _1517;
    float _1533 = _1499 * _1517;
    float _1535 = _1515 * _1517;
    float _1537 = _1395 * _1501;
    float _1539 = _1421 * _1501;
    float _1541 = _1509 * _1147;
    float _1543 = _1437 * _1501;
    float _1545 = _1509 * _1157;
    float _1547 = _1531 * _1483;
    float _1549 = _1147 * _1537;
    float _1551 = -_1449;
    float _1553 = fma(_1551, _1539, _1541);
    float _1555 = _1533 * _1479;
    float _1557 = _1535 * _1481;
    float _1559 = _1513 * _1157;
    float _1561 = -_1449;
    float _1563 = fma(_1561, _1543, _1545);
    float _1565 = _1529 * _1157;
    float _1567 = _1137 * _1543;
    float _1569 = -_1549;
    float _1571 = fma(_1137, _1539, _1569);
    float _1573 = fma(_1507, _1543, _1559);
    float _1575 = fma(_1511, _1543, _1565);
    float _1577 = -_1567;
    float _1579 = fma(_1157, _1537, _1577);
    float _1581 = _1513 * _1147;
    float _1583 = fma(_1497, _1571, _1563);
    float _1585 = fma(_1521, _1571, _1575);
    float _1587 = fma(_1525, _1571, _1573);
    float _1589 = _1529 * _1147;
    float _1591 = fma(_1507, _1539, _1581);
    float _1593 = fma(_1497, _1579, _1553);
    float _1595 = _1557 * _1583;
    float _1597 = fma(_1511, _1539, _1589);
    float _1599 = fma(_1525, _1579, _1591);
    float _1601 = _1557 * _1593;
    float _1603 = fma(_1555, _1587, _1595);
    float _1605 = fma(_1521, _1579, _1597);
    float _1607 = _1509 * _1137;
    float _1609 = fma(_1555, _1599, _1601);
    float _1611 = fma(_1547, _1585, _1603);
    float _1613 = _1157 * _1539;
    float _1615 = -_1449;
    float _1617 = fma(_1615, _1537, _1607);
    float _1619 = fma(_1547, _1605, _1609);
    float _1621 = _1111 + _1611;
    float _1623 = _1513 * _1137;
    float _1625 = -_1613;
    float _1627 = fma(_1147, _1543, _1625);
    float _1629 = _1119 + _1619;
    float _1631 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1633 = _1621 + _1631;
    float _1635 = _1529 * _1137;
    float _1637 = fma(_1507, _1537, _1623);
    float _1639 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1641 = _1629 + _1639;
    float _1643 = _1633 * _1633;
    float _1645 = fma(_1497, _1627, _1617);
    float _1647 = fma(_1511, _1537, _1635);
    float _1649 = fma(_1525, _1627, _1637);
    float _1651 = fma(_1641, _1641, _1643);
    float _1653 = _1557 * _1645;
    float _1655 = fma(_1521, _1627, _1647);
    float _1657 = -_1381;
    float _1659 = fma(_1657, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1119);
    float _1661 = sqrt(_1651);
    float _1663 = fma(_1555, _1649, _1653);
    float _1665 = fma(_1547, _1655, _1663);
    float _1667 = _1095 + _1665;
    bool _1669 = _1661 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1671 = _1627;
    float _1673 = _1555;
    float _1675 = _1663;
    float _1677 = _1543;
    float _1679 = _1641;
    float _1681 = _1667;
    float _1683 = _1511;
    float _1685 = _1621;
    if (!_1669)
    {
        _1671 = _1629;
    }
    float _1687 = _1671;
    float _1689 = _1687;
    if (!_1669)
    {
        _1673 = _1621;
    }
    float _1691 = _1673;
    float _1693 = _1691;
    if (!_1669)
    {
        _1675 = _1667;
    }
    float _1695 = _1675;
    bool _1697 = !_1669;
    float _1699 = _1695;
    if (!_1697)
    {
        float _1701 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1705 = _1661 + _1703;
        float _1707 = rsqrt(_1651);
        float _1709 = _1705 * _1701;
        float _1711 = _1667 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1713 = _1709 * 0.15915493667125701904296875;
        float _1715 = _1713 * 6.283185482025146484375;
        float _1717 = cos(_1715);
        float _1719 = _1713 * 6.283185482025146484375;
        float _1721 = sin(_1719);
        float _1723 = _1717 + (-1.0);
        float _1725 = fma(_1721, _1711, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1727 = _1723 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1729 = _1707 * _1725;
        float _1731 = fma(_1667, _1717, _1727);
        float _1733 = fma(_1641, _1729, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1735 = fma(_1633, _1729, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1699 = _1731;
        _1689 = _1733;
        _1693 = _1735;
    }
    float _1737 = _1699;
    float _1739 = _1689;
    float _1741 = _1693;
    float _1743 = -_1365;
    float _1745 = fma(_1743, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1737);
    float _1747 = -_1381;
    float _1749 = fma(_1747, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1739);
    float _1751 = -_1425;
    float _1753 = fma(_1751, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1741);
    float _1755 = -_1365;
    float _1757 = fma(_1755, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1095);
    float _1759 = -_1425;
    float _1761 = fma(_1759, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1111);
    float _1763 = _1745;
    float _1765 = _1749;
    float _1767 = _1753;
    if (!_1463)
    {
        float _1769 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1771 = _1757 + _1769;
        float _1773 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1775 = _1659 + _1773;
        float _1777 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1779 = -_1119;
        float _1781 = _1779 + _1739;
        float _1783 = _1771 * _1771;
        float _1785 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1787 = _1761 + _1785;
        float _1789 = -_1095;
        float _1791 = _1789 + _1737;
        float _1793 = -_1111;
        float _1795 = _1793 + _1741;
        float _1797 = fma(_1775, _1775, _1783);
        float _1799 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1801 = fma(_1787, _1787, _1797);
        float _1803 = sqrt(_1801);
        float _1805 = 1.0 / _1517;
        bool _1807 = _1803 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1809 = isnan(_1803);
        bool _1811 = _1807 || _1809;
        bool _1813 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1815 = _1811 || _1813;
        float _1817 = precise::min(_1803, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1819 = _1817 * _1777;
        float _1821 = _1799 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1823 = _1781 * _1805;
        float _1825 = _1791 * _1805;
        float _1827 = _1795 * _1805;
        float _1829 = _1821 * _1819;
        float _1831 = _1783;
        float _1833 = _1803;
        float _1835 = _1821;
        _1681 = _1823;
        if (_1815)
        {
            float _1837 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1831 = _1837;
        }
        float _1839 = _1831;
        if (_1815)
        {
            float _1841 = precise::max(_1803, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1833 = _1841;
        }
        float _1843 = _1833;
        float _1845 = fma(_1823, _1829, _1659);
        float _1847 = fma(_1825, _1829, _1757);
        float _1849 = fma(_1827, _1829, _1761);
        float _1851 = _1843;
        float _1853 = _1847;
        _1679 = _1839;
        if (_1815)
        {
            float _1855 = _1843 * _1839;
            _1851 = _1855;
        }
        float _1857 = _1851;
        float _1859 = _1857;
        if (_1815)
        {
            float _1861 = _1821 * _1857;
            _1677 = _1861;
        }
        float _1863 = _1677;
        if (!_1815)
        {
            _1835 = _1845;
        }
        float _1865 = _1835;
        float _1867 = _1865;
        if (!_1815)
        {
            _1859 = _1849;
        }
        float _1869 = _1859;
        _1767 = _1869;
        if (_1815)
        {
            float _1871 = fma(_1823, _1863, _1659);
            _1867 = _1871;
        }
        float _1873 = _1867;
        _1765 = _1873;
        if (_1815)
        {
            float _1875 = fma(_1825, _1863, _1757);
            _1853 = _1875;
        }
        float _1877 = _1853;
        _1763 = _1877;
        if (_1815)
        {
            float _1879 = fma(_1827, _1863, _1761);
            _1767 = _1879;
        }
    }
    float _1881 = _1763;
    float _1883 = _1765;
    float _1885 = _1767;
    float _1887 = _1679;
    float _1889 = _1681;
    float _1891 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1893 = _1881 + _1891;
    float _1895 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1897 = _1883 + _1895;
    float _1899 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1901 = _1885 + _1899;
    float _1903 = _1893 * _1893;
    float _1905 = fma(_1897, _1897, _1903);
    float _1907 = fma(_1901, _1901, _1905);
    float _1909 = rsqrt(_1907);
    float _1911 = sqrt(_1907);
    float _1913 = _1909 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1915 = _1897 * _1913;
    float _1917 = _1901 * _1913;
    float _1919 = _1915 * _1915;
    float _1921 = _1917 * _1917;
    float _1923 = _1919 + _1921;
    float _1925 = sqrt(_1923);
    bool _1927 = _1925 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1929 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1931 = _1925 + _1929;
    float _1933 = _1909;
    float _1935 = _1931;
    float _1937 = _1887;
    float _1939 = _1893;
    float _1941 = _1913;
    if (_1927)
    {
        float _1943 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1933 = _1943;
    }
    float _1945 = _1933;
    float _1947 = _1945;
    if (_1927)
    {
        float _1949 = _1931 * _1945;
        _1935 = _1949;
    }
    float _1951 = _1935;
    if (_1927)
    {
        float _1953 = rsqrt(_1923);
        _1947 = _1953;
    }
    float _1955 = _1947;
    float _1957 = _1955;
    if (_1927)
    {
        float _1959 = _1951 * 0.15915493667125701904296875;
        _1937 = _1959;
    }
    float _1961 = _1937;
    float _1963 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1965 = _1901;
    float _1967 = _1961;
    if (_1927)
    {
        float _1969 = _1961 * 6.283185482025146484375;
        float _1971 = sin(_1969);
        _1965 = _1971;
    }
    float _1973 = _1965;
    float _1975 = precise::max(0.0, _1963);
    float _1977 = _1889;
    float _1979 = _1975;
    if (_1927)
    {
        float _1981 = _1961 * 6.283185482025146484375;
        float _1983 = cos(_1981);
        _1977 = _1983;
    }
    float _1985 = _1977;
    float _1987 = -_1913;
    float _1989 = -_1975;
    float _1991 = fma(_1893, _1987, _1989);
    if (_1927)
    {
        float _1993 = _1991 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1939 = _1993;
    }
    float _1995 = _1939;
    float _1997 = _1973;
    float _1999 = _1995;
    if (_1927)
    {
        float _2001 = fma(_1973, _1995, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1997 = _2001;
    }
    float _2003 = _1997;
    float _2005 = _2003;
    if (!_1927)
    {
        _1999 = _1917;
    }
    float _2007 = _1999;
    float _2009 = _2007;
    if (!_1927)
    {
        _1967 = _1919;
    }
    float _2011 = _1967;
    float _2013 = _2011;
    if (_1927)
    {
        float _2015 = _1955 * _2003;
        _1683 = _2015;
    }
    float _2017 = _1683;
    if (!_1927)
    {
        _1957 = _1915;
    }
    float _2019 = _1957;
    float _2021 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2023 = _2019;
    if (_1927)
    {
        float _2025 = _1985 + (-1.0);
        _1979 = _2025;
    }
    float _2027 = _1979;
    float _2029 = _2027;
    if (_1927)
    {
        float _2031 = _1915 * _2017;
        _2023 = _2031;
    }
    float _2033 = _2023;
    if (!_1927)
    {
        _2005 = _1991;
    }
    float _2035 = _2005;
    float _2037 = _2035;
    if (_1927)
    {
        float _2039 = _1917 * _2017;
        _2009 = _2039;
    }
    float _2041 = _2009;
    if (_1927)
    {
        float _2043 = _2027 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1941 = _2043;
    }
    float _2045 = _1941;
    if (_1927)
    {
        float _2047 = _2033 * _2033;
        _2013 = _2047;
    }
    float _2049 = _2013;
    if (!_1927)
    {
        _2029 = _1921;
    }
    float _2051 = _2029;
    float _2053 = _2051;
    if (_1927)
    {
        float _2055 = _2041 * _2041;
        _2053 = _2055;
    }
    float _2057 = _2053;
    if (_1927)
    {
        float _2059 = fma(_1991, _1985, _2045);
        _2037 = _2059;
    }
    float _2061 = _2037;
    float _2063 = _1881 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2065 = fma(_2061, _2061, _2049);
    float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2069 = fma(_1911, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2067);
    float _2071 = precise::clamp(_2069, 0.0, 1.0);
    float _2073 = _2065 + _2057;
    float _2075 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2063);
    float _2077 = _1881 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2079 = -_2071;
    float _2081 = _2079 + 1.0;
    float _2083 = _1881 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2085 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2075);
    float _2087 = rsqrt(_2073);
    float _2089 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2077);
    float _2091 = _1881 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2093 = _2085 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2095 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2083);
    float _2097 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2089);
    float _2099 = fma(_1883, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2091);
    float _2101 = _2093 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2103 = abs(_2081);
    float _2105 = log2(_2103);
    float _2107 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2095);
    float _2109 = _2097 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2111 = fma(_1885, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2099);
    float _2113 = -_2101;
    float _2115 = fma(_2113, _2021, 1.0);
    float _2117 = _2107 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2119 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2121 = _2111 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2123 = _2087 * _2033;
    float _2125 = _2087 * _2061;
    float _2127 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2119);
    float _2129 = _2087 * _2041;
    float _2131 = _2123 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2133 = log2(_2115);
    float _2135 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2127);
    float _2137 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2139 = -_2131;
    float _2141 = fma(_2125, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2139);
    float _2143 = _2105 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2145 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2135);
    float _2147 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2137);
    float _2149 = -_2129;
    float _2151 = fma(_2149, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2141);
    float _2153 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2155 = 1.0 / _2145;
    float _2157 = _2125 + 1.0;
    float _2159 = fma(_2151, -0.5, 0.5);
    float _2161 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2153);
    float _2163 = fma(_2151, 0.5, 0.5);
    float _2165 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2147);
    float _2167 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2161);
    float _2169 = exp2(_2143);
    float _2171 = fma(_2163, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2173 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2165);
    float _2175 = sqrt(_2159);
    float _2177 = -_2125;
    float _2179 = fma(_2169, _2157, _2177);
    float _2181 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2167);
    float _2183 = fma(_2163, _2171, -0.212114393711090087890625);
    float _2185 = _2133 * 0.693147182464599609375;
    float _2187 = _2173 * _2155;
    float _2189 = _2181 * _2155;
    float _2191 = fma(_2163, _2183, 1.570728778839111328125);
    float _2193 = _2185 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2195 = _2175 * 0.636619746685028076171875;
    float _2197 = fma(_2187, 0.5, 0.5);
    float _2199 = fma(_2189, -0.5, 0.5);
    float _2201 = fma(_2179, 0.5, 0.5);
    float _2203 = -_2191;
    float _2205 = fma(_2195, _2203, 1.0);
    float3 _5898 = float3(_2197, _2199, _2193);
    float _2207 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5898, float3(0.0), isnan(_5898)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5898, float3(0.0), isnan(_5898)), level(0.0)).x;
    float3 _5909 = float3(_2197, _2199, _2193);
    float4 _2210 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5909, float3(0.0), isnan(_5909)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5909, float3(0.0), isnan(_5909)), level(0.0)).xyzw;
    float _2212 = _2210.x;
    float _2214 = _2210.y;
    float _2216 = _2210.z;
    float _2218 = _2210.w;
    float2 _5926 = float2(_2205, _2201);
    float3 _2222 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5926, float2(0.0), isnan(_5926)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5926, float2(0.0), isnan(_5926)), level(0.0)).xyz;
    float _2224 = _2222.x;
    float _2226 = _2222.y;
    float _2228 = _2222.z;
    float _2230 = in.m_65.y;
    float _2232 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    out.m_67.y = _1881;
    float _2234 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2236 = _2234 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _2238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2240 = _2238 != 0;
    float _2242 = _1757 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2244 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2246 = _2244 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2248 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2250 = _2248 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2252 = _1005 > 0.5;
    float _2254 = _1757 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _2256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2258 = _2256 != 0;
    float _2260 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2242);
    float _2262 = 1.0 / _2246;
    bool _2264 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2266 = isnan(0.5);
    bool _2268 = _2264 || _2266;
    bool _2270 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2272 = _2268 || _2270;
    float _2274 = fma(_1659, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2254);
    float _2276 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2260);
    bool _2278 = _748 > 0.5;
    bool _2280 = _2278 && _2258;
    float _2282 = -_2230;
    float _2284 = _2282 + 1.0;
    float _2286 = 1.0 / _2250;
    float _2288 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2290 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2288;
    float _2292 = fma(_1761, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2274);
    float _2294 = _2230;
    if (_2240)
    {
        float _2296 = _2252 ? _2284 : _2230;
        _2294 = _2296;
    }
    float _2298 = _2294;
    float _2300 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2302 = _2300 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2304 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2306 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2304;
    float _2308 = in.m_65.x;
    float _2310 = 1.0 / _2236;
    float _2312 = _2276 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2314 = _2290 * _2262;
    float _2316 = _2292 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2318 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2320 = _2262;
    if (!_2272)
    {
        _2320 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2322 = _2320;
    float _2324 = 1.0 / _2312;
    float _2326 = _2302 * _2286;
    float _2328 = fma(_2318, _2298, -0.5);
    bool _2330 = _995 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2332 = isnan(_995);
    bool _2334 = _2330 || _2332;
    bool _2336 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2338 = _2334 || _2336;
    float _2340 = float(_2338);
    bool _2342 = _995 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2344 = isnan(_995);
    bool _2346 = _2342 || _2344;
    bool _2348 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2350 = _2346 || _2348;
    float _2352 = float(_2350);
    float _2354 = -_1223;
    float _2356 = fma(_1221, _2328, _2354);
    float _2358 = _2105 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2360 = _2306 * _2310;
    float _2362 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2364 = _995 + _2362;
    float _2366 = _2316 + _2312;
    bool _2368 = _995 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2370 = isnan(_995);
    bool _2372 = _2368 || _2370;
    bool _2374 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2376 = _2372 || _2374;
    float _2378 = float(_2376);
    float _2380 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2382 = fma(_2314, _2364, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2384 = _995 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2386 = isnan(_995);
    bool _2388 = _2384 || _2386;
    bool _2390 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2392 = _2388 || _2390;
    float _2394 = float(_2392);
    float _2396 = _2366 * _2324;
    float _2398 = _2396 * 0.5;
    float _2400 = -_2378;
    float _2402 = _2400 + 1.0;
    float _2404 = _2322;
    float _2406 = _2398;
    float _2408 = _2308;
    float _2410 = _2326;
    if (_2258)
    {
        _1685 = _2308;
    }
    float _2412 = _1685;
    float _2414 = -_2394;
    float _2416 = _2414 + 1.0;
    float _2418 = _2412;
    if (!_2272)
    {
        float _2420 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2422 = fma(_2398, _2322, _2420);
        _2404 = _2422;
    }
    float _2424 = _2404;
    float _2426 = _2394 * _2402;
    float _2428 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2430 = _995 + _2428;
    float _2432 = _2340 * _2416;
    float _2434 = -_2340;
    float _2436 = _2434 + 1.0;
    if (_2280)
    {
        float _2438 = -_2412;
        float _2440 = _2438 + 1.0;
        _2418 = _2440;
    }
    float _2442 = _2418;
    if (!_2272)
    {
        _2406 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2444 = _2406;
    float _2446 = fma(_2326, _2430, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2448 = _2352 * _2436;
    float _2450 = _2424;
    if (!_2272)
    {
        float _2452 = 1.0 / _2424;
        _2450 = _2452;
    }
    float _2454 = _2450;
    if (_2258)
    {
        _2408 = _2442;
    }
    float _2456 = _2408;
    if (!_2272)
    {
        float _2458 = -_2444;
        float _2460 = _2458 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2410 = _2460;
    }
    float _2462 = _2410;
    float _2464 = _2382 * _2448;
    float _2466 = -_2352;
    float _2468 = _2466 + 1.0;
    float _2470 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2472 = _995 + _2470;
    float _2474 = _2380 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2476 = _2286;
    if (!_2272)
    {
        float _2478 = 1.0 / _2462;
        _2476 = _2478;
    }
    float _2480 = _2476;
    float _2482 = fma(_2468, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2464);
    float _2484 = fma(_2474, _2456, -0.5);
    float _2486 = _2109 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2488 = fma(_2360, _2472, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2490 = fma(_2446, _2432, _2482);
    float _2492 = in.m_69.w;
    float _2494 = fma(_2117, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2486);
    float _2496 = exp2(_2358);
    float _2498 = fma(_2488, _2426, _2490);
    float _2500 = _2488;
    if (!_2272)
    {
        float _2502 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2504 = -_2444;
        float _2506 = fma(_2454, _2502, _2504);
        _2500 = _2506;
    }
    float _2508 = _2500;
    float _2510 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2494);
    float _2512 = fma(_1215, _2484, _1201);
    float _2514 = fma(_2378, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2498);
    float _2516 = fma(_2121, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2510);
    float _2518 = _2508;
    float _2520 = (*spvDescriptorSet0.vp_c9)._m0[123].x;
    if (!_2272)
    {
        float _2522 = _2508 * _2480;
        float _2524 = precise::clamp(_2522, 0.0, 1.0);
        _2518 = _2524;
    }
    float _2526 = _2518;
    float _2528 = _2356 + 0.5;
    float _2530 = _2512 + 0.5;
    float _2532 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2534 = _2516 + _2532;
    float _2536 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    if (_2272)
    {
        _2520 = 1.0;
    }
    float _2538 = _2520;
    float _2540 = _2538;
    if (!_2272)
    {
        float _2542 = -_2526;
        float _2544 = _2542 + 1.0;
        _2540 = _2544;
    }
    float _2546 = _2540;
    float _2548 = _2145 + _2534;
    float _2550 = -_2496;
    float _2552 = _2550 + 1.0;
    out.m_71.x = _2530;
    out.m_71.y = _2528;
    float _2554 = _2548 * 0.5;
    float _2556 = _2552 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2558 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2560 = _2546 > 0.0;
    bool _2562 = isnan(_2546);
    bool _2564 = _2560 || _2562;
    bool _2566 = isnan(0.0);
    bool _2568 = _2564 || _2566;
    float _2570 = _2546 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _2173;
    out.gl_Position.y = _2181;
    out.gl_Position.z = _2534;
    out.gl_Position.w = _2145;
    float _2572 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2574 = _2536 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2576 = -_2556;
    float _2578 = _2576 + 1.0;
    float _2580 = _2558 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2582 = _2572 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2584 = _2514 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2586 = _2570 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.w = _2492;
    out.m_75.x = _2574;
    out.m_75.y = _2580;
    out.m_75.z = _2582;
    out.m_75.w = _2584;
    out.m_77.z = _2554;
    out.m_77.w = _2145;
    out.m_45.x = _2586;
    float _2588 = _2556 * _2207;
    float _2590 = _2218 * _2578;
    float _2592 = _2218 * _2588;
    float _2594 = _2228 * _2588;
    float _2596 = fma(_2224, _2592, _2212);
    float _2598 = fma(_2226, _2592, _2214);
    float _2600 = fma(_2218, _2594, _2216);
    out.m_79.x = _2596;
    out.m_79.y = _2598;
    out.m_79.z = _2600;
    out.m_79.w = _2590;
    if (_2568)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2602 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2602;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

