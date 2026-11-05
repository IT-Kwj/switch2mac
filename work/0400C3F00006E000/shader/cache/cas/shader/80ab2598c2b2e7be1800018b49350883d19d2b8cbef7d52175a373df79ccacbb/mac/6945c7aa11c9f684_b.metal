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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
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
    float4 m_67 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_79 [[user(locn3)]];
    float4 m_75 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_83 [[user(locn6)]];
    float4 m_63 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
    float4 m_85 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_57 [[attribute(3)]];
    float4 m_69 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_71 [[attribute(8)]];
    float4 m_65 [[attribute(9)]];
    float4 m_61 [[attribute(10)]];
    float4 m_59 [[attribute(11)]];
    float4 m_73 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2762 = false;
    bool _1610 = false;
    bool _1504 = false;
    bool _1294 = false;
    bool _1122 = false;
    bool _854 = false;
    bool _608 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    float _112 = as_type<float>(_104);
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _110;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3521 = as_type<float>(_120);
        out.gl_Position.z = _3521;
    }
    if (!_108)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _124 = in.m_49.w;
    float _126 = float(_104);
    float _128 = 1.0 / _126;
    float _130 = -_124;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_124);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = _132 * _128;
    bool _146 = _132 >= _126;
    bool _148 = !_142;
    bool _150 = _146 || _148;
    out.m_51.x = _144;
    float _152 = 0.0;
    float _154 = _132;
    if (_150)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _112;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _158 = _156 * 5.0;
        _122 = as_type<int>(_158);
    }
    int _160 = _122;
    float _162 = as_type<float>(_160);
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3594 = as_type<float>(_160);
        out.gl_Position.z = _3594;
    }
    if (_150)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _164 = in.m_53.y;
    float _166 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _168 = in.m_55.y;
    bool _170 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _172 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _174 = _170 || _172;
    bool _176 = isnan(1.0);
    bool _178 = _174 || _176;
    float _180 = in.m_57.y;
    float _182 = in.m_53.z;
    float _184 = in.m_55.z;
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
        float _198 = _132 * _132;
        float _200 = _198 * 0.5;
        _194 = _200;
    }
    float _202 = _194;
    float _204 = in.m_57.z;
    if (!_178)
    {
        float _206 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _206;
    }
    float _208 = _196;
    float _210 = _164 * _164;
    float _212 = fma(_168, _168, _210);
    float _214 = fma(_180, _180, _212);
    float _216 = in.m_49.x;
    float _218 = in.m_49.y;
    float _220 = in.m_49.z;
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
        _152 = _254;
        _232 = _264;
    }
    float _266 = _152;
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
    float _302 = _296;
    if (!_178)
    {
        _300 = _132;
    }
    float _304 = _300;
    float _306 = _304;
    if (!_178)
    {
        float _308 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _234 = _308;
    }
    float _310 = _234;
    bool _312 = !_178;
    float _314 = _310;
    if (!_312)
    {
        float _316 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _318 = log2(_316);
        float _320 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _322 = _320 + 1.0;
        float _324 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _326 = _132 * _318;
        float _328 = 1.0 / _322;
        float _330 = _324 * 0.693147182464599609375;
        float _332 = exp2(_326);
        float _334 = 1.0 / _330;
        float _336 = _332 + (-1.0);
        float _338 = -_336;
        float _340 = fma(_338, _334, _132);
        float _342 = _340 * _328;
        float _344 = _342 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _314 = _344;
    }
    float _346 = _314;
    bool _348 = !_178;
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
        _306 = _368;
    }
    float _370 = _306;
    float _372 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _374 = _346 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _376 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _378 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _380 = fma(_296, _218, _372);
    float _382 = _346 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _384 = fma(_370, _218, _374);
    float _386 = fma(_296, _216, _376);
    float _388 = _346 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _390 = fma(_370, _216, _382);
    float _392 = -_384;
    float _394 = _380 + _392;
    float _396 = sqrt(_298);
    float _398 = fma(_370, _220, _388);
    float _400 = fma(_296, _220, _378);
    float _402 = -_390;
    float _404 = _386 + _402;
    float _406 = _394 * _394;
    float _408 = in.m_59.y;
    float _410 = -_398;
    float _412 = _400 + _410;
    float _414 = 0.0;
    float _416 = _384;
    float _418 = _386;
    if (!_224)
    {
        _414 = 0.0;
    }
    float _420 = _414;
    float _422 = fma(_404, _404, _406);
    float _424 = in.m_55.x;
    float _426 = 0.0;
    float _428 = _420;
    if (_224)
    {
        float _430 = rsqrt(_214);
        _426 = _430;
    }
    float _432 = _426;
    if (!_224)
    {
        _302 = 0.0;
    }
    float _434 = _302;
    float _436 = fma(_412, _412, _422);
    float _438 = in.m_53.x;
    float _440 = _394 * _164;
    float _442 = _394 * _180;
    bool _444 = _396 > 0.0;
    float _446 = in.m_57.x;
    float _448 = sqrt(_436);
    float _450 = _396;
    float _452 = _434;
    if (!_224)
    {
        _450 = 0.0;
    }
    float _454 = _450;
    float _456 = in.m_61.w;
    float _458 = in.m_44.x;
    float _460 = in.m_44.y;
    float _462 = in.m_44.z;
    float _464 = _454;
    float _466 = _456;
    if (_224)
    {
        float _468 = _432 * _168;
        _464 = _468;
    }
    float _470 = _464;
    float _472 = _470;
    if (_224)
    {
        float _474 = _432 * _164;
        _428 = _474;
    }
    float _476 = _428;
    if (_224)
    {
        float _478 = _432 * _180;
        _452 = _478;
    }
    float _480 = _452;
    out.m_63.y = _408;
    float _482 = _298;
    float _484 = _408;
    float _486 = _480;
    if (_444)
    {
        float _488 = rsqrt(_298);
        _482 = _488;
    }
    float _490 = _482;
    float _492 = _394 * _168;
    float _494 = 0.0;
    if (!_444)
    {
        _494 = 0.0;
    }
    float _496 = _494;
    bool _498 = _448 >= 9.9999999747524270787835121154785e-07;
    bool _500 = isnan(_448);
    bool _502 = _498 || _500;
    bool _504 = isnan(9.9999999747524270787835121154785e-07);
    bool _506 = _502 || _504;
    float _508 = fma(_404, _424, _492);
    float _510 = _448;
    float _512 = _496;
    if (!_444)
    {
        _510 = 0.0;
    }
    float _514 = _510;
    float _516 = fma(_404, _438, _440);
    float _518 = _514;
    if (!_444)
    {
        _416 = 0.0;
    }
    float _520 = _416;
    float _522 = fma(_412, _184, _508);
    float _524 = fma(_404, _446, _442);
    float _526 = fma(_412, _182, _516);
    float _528 = fma(_412, _204, _524);
    float _530 = _520;
    float _532 = _522;
    if (_444)
    {
        float _534 = _490 * _184;
        _512 = _534;
    }
    float _536 = _512;
    if (_444)
    {
        float _538 = _490 * _182;
        _518 = _538;
    }
    float _540 = _518;
    if (_444)
    {
        float _542 = _490 * _204;
        _530 = _542;
    }
    float _544 = _530;
    float _546 = fma(_386, _456, _458);
    float _548 = fma(_380, _456, _460);
    float _550 = fma(_400, _456, _462);
    if (_506)
    {
        _418 = _522;
    }
    float _552 = _418;
    float _554 = _552;
    float _556 = _552;
    if (_506)
    {
        _466 = _526;
    }
    float _558 = _466;
    float _560 = _558;
    float _562 = _558;
    if (_506)
    {
        _532 = _528;
    }
    float _564 = _532;
    float _566 = _564;
    float _568 = _564;
    if (!_506)
    {
        bool _570 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _572 = !_570;
        if (!_572)
        {
            float _574 = _164 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _576 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _578 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _580 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[16].x, _574);
            float _582 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[16].x, _576);
            float _584 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[16].x, _578);
            float _586 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[16].z, _580);
            float _588 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[16].z, _582);
            float _590 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[16].z, _584);
            float _592 = _586 * _586;
            float _594 = fma(_588, _588, _592);
            float _596 = fma(_590, _590, _594);
            float _598 = rsqrt(_596);
            float _600 = _598 * 9.9999999747524270787835121154785e-07;
            float _602 = _588 * _600;
            float _604 = _586 * _600;
            float _606 = _590 * _600;
            _562 = _604;
            _556 = _602;
            _568 = _606;
            _608 = true;
        }
        else
        {
            float _610 = _218 * _218;
            float _612 = fma(_216, _216, _610);
            float _614 = fma(_220, _220, _612);
            float _616 = sqrt(_614);
            bool _618 = _616 >= 9.9999999747524270787835121154785e-07;
            bool _620 = isnan(_616);
            bool _622 = _618 || _620;
            bool _624 = isnan(9.9999999747524270787835121154785e-07);
            bool _626 = _622 || _624;
            if (!_626)
            {
                float _628 = _460 * _460;
                float _630 = fma(_458, _458, _628);
                float _632 = fma(_462, _462, _630);
                float _634 = sqrt(_632);
                bool _636 = _634 >= 9.9999999747524270787835121154785e-07;
                bool _638 = isnan(_634);
                bool _640 = _636 || _638;
                bool _642 = isnan(9.9999999747524270787835121154785e-07);
                bool _644 = _640 || _642;
                float _646 = _214;
                if (!_644)
                {
                    float _648 = rsqrt(_214);
                    _646 = _648;
                }
                float _650 = _646;
                if (!_644)
                {
                    float _652 = _650 * 9.9999999747524270787835121154785e-07;
                    _566 = _652;
                }
                float _654 = _566;
                float _656 = _654;
                if (!_644)
                {
                    float _658 = _168 * _654;
                    _554 = _658;
                }
                float _660 = _554;
                _556 = _660;
                if (!_644)
                {
                    float _662 = _164 * _654;
                    _560 = _662;
                }
                float _664 = _560;
                _562 = _664;
                if (!_644)
                {
                    float _666 = _180 * _654;
                    _656 = _666;
                }
                float _668 = _656;
                bool _670 = !_644;
                _568 = _668;
                _608 = _670;
                if (!_608)
                {
                    float _672 = _164 * _460;
                    float _674 = _168 * _460;
                    float _676 = _180 * _460;
                    float _678 = fma(_458, _438, _672);
                    float _680 = fma(_458, _424, _674);
                    float _682 = fma(_458, _446, _676);
                    float _684 = fma(_182, _462, _678);
                    float _686 = fma(_184, _462, _680);
                    float _688 = fma(_204, _462, _682);
                    float _690 = _684 * _684;
                    float _692 = fma(_686, _686, _690);
                    float _694 = fma(_688, _688, _692);
                    float _696 = rsqrt(_694);
                    float _698 = _696 * 9.9999999747524270787835121154785e-07;
                    float _700 = _686 * _698;
                    float _702 = _684 * _698;
                    float _704 = _688 * _698;
                    _562 = _702;
                    _556 = _700;
                    _568 = _704;
                    _608 = true;
                }
            }
            else
            {
                float _706 = _164 * _218;
                float _708 = _168 * _218;
                float _710 = _180 * _218;
                float _712 = fma(_216, _438, _706);
                float _714 = fma(_216, _424, _708);
                float _716 = fma(_216, _446, _710);
                float _718 = fma(_182, _220, _712);
                float _720 = fma(_184, _220, _714);
                float _722 = fma(_204, _220, _716);
                float _724 = _718 * _718;
                float _726 = fma(_720, _720, _724);
                float _728 = fma(_722, _722, _726);
                float _730 = rsqrt(_728);
                float _732 = _730 * 9.9999999747524270787835121154785e-07;
                float _734 = _720 * _732;
                float _736 = _718 * _732;
                float _738 = _722 * _732;
                _562 = _736;
                _556 = _734;
                _568 = _738;
            }
        }
    }
    _608 = false;
    float _740 = _562;
    float _742 = _556;
    float _744 = _568;
    float _746 = in.m_65.x;
    float _748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _750 = _132 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _754 = _752 != 0;
    int _756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _758 = _756 != 0;
    int _760 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _762 = _760 != 0;
    float _764 = _750 * _748;
    float _766 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[20].x, _764);
    float _768 = _766 * 6.283185482025146484375;
    float _770 = floor(_766);
    float _772 = _768 * 0.15915493667125701904296875;
    bool _774 = !_754;
    int _776 = _774 ? 0 : 1;
    int _778 = abs(_776);
    float _780 = _772 * 6.283185482025146484375;
    float _782 = cos(_780);
    bool _784 = !_762;
    int _786 = _784 ? 0 : 1;
    bool _788 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _790 = abs(_786);
    float _792 = -_770;
    float _794 = _766 + _792;
    bool _796 = !_758;
    int _798 = _796 ? 0 : 1;
    float _800 = float(_778);
    int _802 = abs(_798);
    float _804 = -_794;
    float _806 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _808 = fma(_782, 0.5, 0.5);
    float _810 = abs(_806);
    float _812 = _800 * _810;
    bool _814 = _794 < 0.5;
    float _816 = float(_814);
    float _818 = float(_790);
    float _820 = -_808;
    float _822 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _824 = float(_802);
    float _826 = -_816;
    float _828 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _830 = fma(_818, _822, _812);
    float _832 = abs(_828);
    float _834 = fma(_824, _832, _830);
    bool _836 = !_788;
    float _852;
    if (!_836)
    {
        float _838 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _840 = _746 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _842 = fma(_840, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _844 = _842 * _838;
        float _846 = floor(_844);
        float _848 = -_846;
        float _850 = _844 + _848;
        _852 = _850;
        _854 = true;
    }
    else
    {
        _852 = _144;
    }
    _854 = false;
    float _856 = _852;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _860 = _856 + _858;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _864 = _856 + _862;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _868 = _856 + _866;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _870;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _876 = _874 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _878;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _886 = 1.0 / _872;
    bool _888 = _856 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _890 = isnan(_856);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    float _900 = 1.0 / _876;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _904 = _856 + _902;
    bool _906 = _856 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _908 = isnan(_856);
    bool _910 = _906 || _908;
    bool _912 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _914 = _910 || _912;
    float _916 = float(_914);
    float _918 = 1.0 / _884;
    float _920 = _868 * _886;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _922;
    bool _926 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _928 = fma(_924, _920, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _930 = 1.0 / _880;
    float _932 = _860 * _900;
    float _934 = _904 * _918;
    bool _936 = _856 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _938 = isnan(_856);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _944 = _940 || _942;
    float _946 = float(_944);
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _950 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _948;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _952;
    float _956 = -_946;
    float _958 = _956 + 1.0;
    float _960 = fma(_954, _920, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _962 = _864 * _930;
    bool _964 = _856 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _966 = isnan(_856);
    bool _968 = _964 || _966;
    bool _970 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _972 = _968 || _970;
    float _974 = float(_972);
    float _976 = _974 * _958;
    float _978 = -_974;
    float _980 = _978 + 1.0;
    float _982 = fma(_950, _920, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _984 = _856 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _986 = isnan(_856);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _992 = _988 || _990;
    float _994 = float(_992);
    float _996 = -_898;
    float _998 = _996 + 1.0;
    float _1000 = _898 * _980;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1004 = _1002 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1008 = _1006 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1010 = -_994;
    float _1012 = _1010 + 1.0;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _1016 = _1014 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _1018 = _994 * _998;
    float _1020 = fma(_1008, _932, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1022 = _916 * _1012;
    float _1024 = fma(_1004, _932, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1026 = fma(_1016, _932, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _1028 = _928 * _1022;
    float _1030 = _982 * _1022;
    float _1032 = -_916;
    float _1034 = _1032 + 1.0;
    float _1036 = _960 * _1022;
    float _1038 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1038;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1042;
    float _1046 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1030);
    float _1048 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1036);
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _1050;
    float _1054 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[143].z, _1028);
    float _1056 = fma(_1040, _962, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1058 = fma(_1044, _962, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1060 = fma(_1020, _1018, _1046);
    float _1062 = fma(_1024, _1018, _1048);
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1066 = _1064 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1070 = _1068 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1072 = fma(_1052, _962, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _1074 = fma(_1026, _1018, _1054);
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _1078 = _1076 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _1080 = fma(_1056, _1000, _1060);
    float _1082 = fma(_1066, _934, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _1084 = fma(_1070, _934, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1086 = fma(_1058, _1000, _1062);
    float _1088 = fma(_1078, _934, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _1090 = fma(_1072, _1000, _1074);
    float _1092 = fma(_1082, _976, _1080);
    float _1094 = fma(_1084, _976, _1086);
    float _1096 = fma(_1088, _976, _1090);
    float _1098 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1092);
    float _1100 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1094);
    float _1102 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[147].z, _1096);
    bool _1104 = !_926;
    float _1120;
    if (!_1104)
    {
        float _1106 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _1108 = _746 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _1110 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[11].x, _132);
        float _1112 = _1110 * _1106;
        float _1114 = floor(_1112);
        float _1116 = -_1114;
        float _1118 = _1112 + _1116;
        _1120 = _1118;
        _1122 = true;
    }
    else
    {
        _1120 = _144;
    }
    _1122 = false;
    float _1124 = _1120;
    float _1126 = in.m_61.x;
    float _1128 = in.m_61.y;
    float _1130 = in.m_61.z;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1134 = _1124 + _1132;
    bool _1136 = _1124 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1138 = isnan(_1124);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1144 = _1140 || _1142;
    float _1146 = float(_1144);
    float _1148 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1150 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1148;
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1154 = _1152 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1156 = 1.0 / _1154;
    bool _1158 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _1160 = 1.0 / _1150;
    float _1162 = _1100 * _1128;
    bool _1164 = _1124 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1166 = isnan(_1124);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1172 = _1168 || _1170;
    float _1174 = float(_1172);
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1178 = _1124 + _1176;
    bool _1180 = _1124 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1182 = isnan(_1124);
    bool _1184 = _1180 || _1182;
    bool _1186 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1188 = _1184 || _1186;
    float _1190 = float(_1188);
    float _1192 = _1102 * _1130;
    float _1194 = _1178 * _1156;
    float _1196 = -_1146;
    float _1198 = _1196 + 1.0;
    float _1200 = -_1190;
    float _1202 = _1200 + 1.0;
    float _1204 = _1134 * _1160;
    float _1206 = -_1174;
    float _1208 = _1206 + 1.0;
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1210;
    float _1214 = _1146 * _1202;
    float _1216 = _1190 * _1208;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1218;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1222;
    float _1226 = fma(_1212, _1204, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1228 = fma(_1220, _1204, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1230 = fma(_1224, _1204, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1232 = _1226 * _1214;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1236 = _1234 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1238 = _1228 * _1214;
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1242 = _1240 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1244 = _1230 * _1214;
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1248 = _1246 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1250 = fma(_1236, _1194, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1252 = fma(_1242, _1194, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1254 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1238);
    float _1256 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1232);
    float _1258 = fma(_1248, _1194, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1260 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1244);
    float _1262 = fma(_1252, _1216, _1254);
    float _1264 = fma(_1250, _1216, _1256);
    float _1266 = _1098 * _1126;
    float _1268 = fma(_1258, _1216, _1260);
    float _1270 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1262);
    float _1272 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1264);
    float _1274 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1268);
    bool _1276 = !_1158;
    float _1292;
    if (!_1276)
    {
        float _1278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1280 = _746 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1282 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _1284 = _1282 * _1278;
        float _1286 = floor(_1284);
        float _1288 = -_1286;
        float _1290 = _1284 + _1288;
        _1292 = _1290;
        _1294 = true;
    }
    else
    {
        _1292 = _144;
    }
    _1294 = false;
    float _1296 = _1292;
    float _1298 = _1272 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1300 = _1270 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1304 = _1302 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1308 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1306;
    float _1310 = 1.0 / _1304;
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1314 = _1312 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1318 = _1316 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1320 = _1296 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1322 = isnan(_1296);
    bool _1324 = _1320 || _1322;
    bool _1326 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1328 = _1324 || _1326;
    float _1330 = float(_1328);
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1334 = _1332 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1336 = _1296 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1338 = isnan(_1296);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1344 = _1340 || _1342;
    float _1346 = float(_1344);
    float _1348 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1350 = 1.0 / _1314;
    float _1352 = -_1330;
    float _1354 = _1352 + 1.0;
    bool _1356 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1358 = _1308 * _1310;
    float _1360 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1362 = _1296 + _1360;
    float _1364 = 1.0 / _1318;
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1368 = _1366 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1370 = fma(_1358, _1362, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1372 = _1296 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1374 = isnan(_1296);
    bool _1376 = _1372 || _1374;
    bool _1378 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1380 = _1376 || _1378;
    float _1382 = float(_1380);
    bool _1384 = _1296 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1386 = isnan(_1296);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1392 = _1388 || _1390;
    float _1394 = float(_1392);
    float _1396 = _1368 * _1350;
    float _1398 = 1.0 / _1334;
    float _1400 = -_1382;
    float _1402 = _1400 + 1.0;
    float _1404 = _1382 * _1354;
    float _1406 = -_1394;
    float _1408 = _1406 + 1.0;
    float _1410 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1412 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1410;
    float _1414 = _1346 * _1402;
    float _1416 = _1330 * _1408;
    float _1418 = _1412 * _1364;
    float _1420 = _1370 * _1414;
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1424 = _1296 + _1422;
    float _1426 = -_1346;
    float _1428 = _1426 + 1.0;
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1432 = _1296 + _1430;
    bool _1434 = _1296 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1436 = isnan(_1296);
    bool _1438 = _1434 || _1436;
    bool _1440 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1442 = _1438 || _1440;
    float _1444 = float(_1442);
    float _1446 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1448 = _1446 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1450 = fma(_1396, _1424, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1452 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1420);
    float _1454 = fma(_1418, _1432, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1456 = _1448 * _1398;
    float _1458 = -_1444;
    float _1460 = _1458 + 1.0;
    float _1462 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1464 = _1296 + _1462;
    float _1466 = fma(_1450, _1404, _1452);
    float _1468 = _1394 * _1460;
    float _1470 = fma(_1456, _1464, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1472 = fma(_1454, _1416, _1466);
    float _1474 = _1274 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1476 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1478 = fma(_1470, _1468, _1472);
    float _1480 = _1474 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1482 = fma(_1444, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1478);
    float _1484 = _1482 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_67.x = _1348;
    out.m_67.y = _1476;
    out.m_67.z = _1480;
    out.m_67.w = _1484;
    bool _1486 = !_1356;
    float _1502;
    if (!_1486)
    {
        float _1488 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1490 = _746 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1492 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[11].z, _132);
        float _1494 = _1492 * _1488;
        float _1496 = floor(_1494);
        float _1498 = -_1496;
        float _1500 = _1494 + _1498;
        _1502 = _1500;
        _1504 = true;
    }
    else
    {
        _1502 = _144;
    }
    _1504 = false;
    float _1506 = _1502;
    float _1508 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1510 = _1506 + _1508;
    bool _1512 = _1506 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1514 = isnan(_1506);
    bool _1516 = _1512 || _1514;
    bool _1518 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1520 = _1516 || _1518;
    float _1522 = float(_1520);
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1524;
    bool _1528 = _1506 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1530 = isnan(_1506);
    bool _1532 = _1528 || _1530;
    bool _1534 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1536 = _1532 || _1534;
    float _1538 = float(_1536);
    float _1540 = -_1522;
    float _1542 = _1540 + 1.0;
    float _1544 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1546 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1544;
    float _1548 = 1.0 / _1526;
    bool _1550 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1552 = _1510 * _1548;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1554;
    float _1558 = _1538 * _1542;
    float _1560 = fma(_1546, _1552, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1562 = -_1538;
    float _1564 = _1562 + 1.0;
    float _1566 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1568 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1566;
    float _1570 = fma(_1556, _1552, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1572 = _1560 * _1558;
    float _1574 = fma(_1568, _1552, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1576 = _1570 * _1558;
    float _1578 = _1574 * _1558;
    float _1580 = fma(_1564, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1572);
    float _1582 = fma(_1564, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1576);
    float _1584 = fma(_1564, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1578);
    float _1586 = fma(_1522, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1580);
    float _1588 = fma(_1522, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1584);
    float _1590 = fma(_1522, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1582);
    bool _1592 = !_1550;
    float _1608;
    if (!_1592)
    {
        float _1594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1596 = _746 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1598 = fma(_1596, (*spvDescriptorSet0.vp_c9)._m0[11].w, _132);
        float _1600 = _1598 * _1594;
        float _1602 = floor(_1600);
        float _1604 = -_1602;
        float _1606 = _1600 + _1604;
        _1608 = _1606;
        _1610 = true;
    }
    else
    {
        _1608 = _144;
    }
    _1610 = false;
    float _1612 = _1608;
    float _1614 = in.m_65.y;
    float _1616 = _834 * _1266;
    float _1618 = _834 * _1162;
    float _1620 = _834 * _1192;
    float _1622 = in.m_65.z;
    float _1624 = in.m_65.w;
    float _1626 = -_408;
    float _1628 = _1626 + 1.0;
    float _1630 = _548 * _180;
    float _1632 = _548 * _168;
    float _1634 = _746 * 2.0;
    int _1636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1638 = _1636 != 0;
    float _1640 = _548 * _164;
    int _1642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1644 = _1642 != 0;
    float _1646 = floor(_1634);
    int _1648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1650 = _1648 != 0;
    float _1652 = fma(_546, _446, _1630);
    float _1654 = fma(_546, _438, _1640);
    float _1656 = fma(_550, _204, _1652);
    float _1658 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1660 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1662 = _1614 > 0.5;
    float _1664 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1666 = _1614 * 2.0;
    bool _1668 = _1622 > 0.5;
    float _1670 = _1622 * 2.0;
    int _1672 = _1662 ? as_type<int>(_1628) : as_type<int>(_408);
    float _1674 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1676 = _1668 ? as_type<int>(_1628) : as_type<int>(_408);
    float _1678 = fma(_550, _182, _1654);
    int _1680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1682 = _1680 != 0;
    float _1684 = _746 + _1622;
    float _1686 = _1638 ? as_type<float>(_1672) : _408;
    float _1688 = _1620 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1692 = _1690 != 0;
    int _1694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1696 = _1694 != 0;
    int _1698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1700 = _1698 != 0;
    float _1702 = _1684 + (-1.0);
    float _1704 = _1650 ? as_type<float>(_1676) : _408;
    float _1706 = fma(_546, _424, _1632);
    bool _1708 = _1624 > 0.5;
    float _1710 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1712 = log2(_1710);
    float _1714 = _746 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1716 = fma(_550, _184, _1706);
    float _1718 = _1634;
    bool _1720 = _1692;
    if (_1682)
    {
        _1718 = _746;
    }
    float _1722 = _1718;
    float _1724 = -_1660;
    float _1726 = fma(_1714, 2.0, _1724);
    float _1728 = _1722;
    if (!_1682)
    {
        _1728 = _1622;
    }
    float _1730 = _1728;
    float _1732 = _1614 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1734 = _1732;
    if (_1644)
    {
        float _1736 = _1708 ? _1628 : _408;
        _484 = _1736;
    }
    float _1738 = _484;
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1742 = _1646 > 0.0;
    float _1744 = _1730 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1746 = _1646 >= 0.0;
    bool _1748 = isnan(_1646);
    bool _1750 = _1746 || _1748;
    bool _1752 = isnan(0.0);
    bool _1754 = _1750 || _1752;
    float _1756 = fma(_1732, -2.0, _1664);
    float _1758 = _1744;
    float _1760 = _1646;
    if (!_1682)
    {
        _1734 = _1622;
    }
    float _1762 = _1734;
    float _1764 = -_1658;
    float _1766 = fma(_1744, 2.0, _1764);
    float _1768 = _1712 * _132;
    float _1770 = _1762;
    if (!_1682)
    {
        _1758 = _1614;
    }
    float _1772 = _1758;
    float _1774 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1756);
    float _1776 = _1754 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1778 = _746 + _1614;
    float _1780 = _1772;
    float _1782 = _1776;
    if (!_1682)
    {
        _1760 = _1772;
    }
    float _1784 = _1760;
    float _1786 = exp2(_1768);
    int _1788 = ~as_type<int>(_1776);
    int _1790 = _1788 + 1;
    int _1792 = _1790 + 1;
    float _1794 = _1778 + (-1.0);
    int _1796 = _1792;
    float _1798 = _1784;
    if (_1682)
    {
        _1780 = _1614;
    }
    float _1800 = _1780;
    float _1802 = _1716 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1804 = _1800;
    if (!_1742)
    {
        int _1806 = ~as_type<int>(_1776);
        int _1808 = _1806 + 1;
        _1796 = _1808;
    }
    int _1810 = _1796;
    float _1812 = _1656 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1814 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1816 = isnan(0.0);
    bool _1818 = _1814 || _1816;
    bool _1820 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1822 = _1818 || _1820;
    float _1824 = _1678 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (!_1682)
    {
        _1782 = _1622;
    }
    float _1826 = _1782;
    float _1828 = _1826;
    if (_1682)
    {
        _1770 = _1800;
    }
    float _1830 = _1770;
    if (_1682)
    {
        _1828 = _1800;
    }
    float _1832 = _1828;
    float _1834 = -_1786;
    float _1836 = _1834 + 1.0;
    if (!_1682)
    {
        _1804 = _746;
    }
    float _1838 = _1804;
    float _1840 = _1830 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1844 = _1822 ? _1836 : 0.0;
    float _1846 = _1838 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1848 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1850 = isnan(1.0);
    bool _1852 = _1848 || _1850;
    bool _1854 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1856 = _1852 || _1854;
    float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1860 = 1.0 + _1858;
    float _1862 = fma(_1832, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1740);
    float _1864 = fma(_1846, -2.0, _1842);
    if (_1682)
    {
        _1798 = _746;
    }
    float _1866 = _1798;
    float _1868 = fma(_1840, -2.0, _1674);
    float _1870 = 1.0 / _1860;
    float _1872 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1874 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1876 = _1874 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1878 = fma(_1866, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1872);
    float _1880 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1882 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1884 = _1866 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1888 = _1886 != 0;
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1892 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1894 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1896 = 1.0 / _1876;
    float _1898 = -_1882;
    float _1900 = fma(_1884, 2.0, _1898);
    float _1902 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1880);
    float _1904 = fma(_1614, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1890);
    float _1906 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1892);
    float _1908 = fma(_1614, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1894);
    float _1910 = -_132;
    float _1912 = fma(_1910, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1726);
    float _1914 = -_132;
    float _1916 = fma(_1914, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1766);
    float _1918 = floor(_1666);
    float _1920 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1902);
    float _1922 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1904);
    float _1924 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1906);
    float _1926 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1908);
    float _1928 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1878);
    float _1930 = -_132;
    float _1932 = fma(_1930, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1900);
    float _1934 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1862);
    float _1936 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1868);
    float _1938 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1864);
    if (_1856)
    {
        float _1940 = _1844 * _1870;
        _154 = _1940;
    }
    float _1942 = _154;
    float _1944 = floor(_1670);
    float _1946 = _1894;
    if (_1888)
    {
        float _1948 = in.m_65.z;
        _1946 = _1948;
    }
    float _1950 = _1946;
    float _1952 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1952;
    float _1956 = in.m_59.x;
    float _1958 = fma(_144, 0.4000000059604644775390625, 0.300000011920928955078125);
    float _1960 = _1954 * _1896;
    bool _1962 = !_1696;
    float _1964 = _1962 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1966 = _1918 >= 0.0;
    bool _1968 = isnan(_1918);
    bool _1970 = _1966 || _1968;
    bool _1972 = isnan(0.0);
    bool _1974 = _1970 || _1972;
    int _1976 = _1974 ? 0 : 1;
    bool _1978 = _1944 >= 0.0;
    bool _1980 = isnan(_1944);
    bool _1982 = _1978 || _1980;
    bool _1984 = isnan(0.0);
    bool _1986 = _1982 || _1984;
    float _1988 = fma(_1794, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1990 = _1614 + _1622;
    bool _1992 = !_1692;
    int _1994 = _1992 ? 0 : 1;
    int _1996 = _1986 ? 0 : 1;
    float _1998 = _1990 + (-1.0);
    bool _2000 = _1944 > 0.0;
    float _2002 = _740 * _740;
    float _2004 = _1964;
    if (_1888)
    {
        bool _2006 = _1950 > 0.5;
        _1720 = _2006;
    }
    bool _2008 = _1720;
    float _2010 = fma(_1998, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _2012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2014 = _2012 != 0;
    float _2016 = fma(_742, _742, _2002);
    float _2018 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2020 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2022 = _1612 + _2020;
    float _2024 = fma(_744, _744, _2016);
    int _2026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2028 = _2026 != 0;
    int _2030 = ~_1996;
    int _2032 = _2030 + 1;
    int _2034 = _2032 + 1;
    float _2036 = fma(_1702, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _2038 = _2034;
    if (!_2000)
    {
        int _2040 = ~_1996;
        int _2042 = _2040 + 1;
        _2038 = _2042;
    }
    int _2044 = _2038;
    float _2046 = rsqrt(_2024);
    bool _2048 = _1918 > 0.0;
    float _2050 = fma(_1960, _2022, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2052 = abs(as_type<int>(_1964));
    float _2054 = in.m_69.x;
    float _2056 = in.m_69.y;
    float _2058 = in.m_69.z;
    bool _2060 = _2048;
    if (!_2014)
    {
        _2004 = _1956;
    }
    float _2062 = _2004;
    int _2064 = abs(_1994);
    float _2066 = _2018 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2068 = _2018;
    float _2070 = _2062;
    if (!_2014)
    {
        _2068 = _2062;
    }
    float _2072 = _2068;
    float _2074 = _2072;
    if (_2014)
    {
        _2070 = _1956;
    }
    float _2076 = _2070;
    float _2078 = fma(_2066, _1686, -0.5);
    float _2080 = float(_2064);
    float _2082 = float(_2052);
    float _2084 = _2046 * _740;
    float _2086 = float(_1810);
    float _2088 = _2046 * _742;
    float _2090 = float(_2044);
    float _2092 = _2046 * _744;
    int _2094 = ~_1976;
    int _2096 = _2094 + 1;
    int _2098 = _2096 + 1;
    float _2100 = _2082 * _2086;
    int _2102 = _2098;
    float _2104 = _2076;
    if (!_2048)
    {
        int _2106 = ~_1976;
        int _2108 = _2106 + 1;
        _2102 = _2108;
    }
    int _2110 = _2102;
    float _2112 = _2080 * _2090;
    float _2114 = _746 + _2076;
    float _2116 = _2084 * _476;
    float _2118 = _2100 * (-2.0);
    float _2120 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2122 = _2114 * 6.283185482025146484375;
    float _2124 = fma(_2088, _470, _2116);
    float _2126 = fma(_2118, _2056, _2056);
    float _2128 = _1614 + _2076;
    float _2130 = fma(_2010, _2118, _2010);
    float _2132 = _2122 * 0.15915493667125701904296875;
    float _2134 = fma(_2092, _480, _2124);
    float _2136 = _1614 + (-0.5);
    float _2138 = _2128 * 18.84955596923828125;
    bool _2140 = !_1700;
    int _2142 = _2140 ? 0 : 1;
    float _2144 = _2132 * 6.283185482025146484375;
    float _2146 = sin(_2144);
    float _2148 = fma(_2136, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2126);
    float _2150 = abs(_2134);
    bool _2152 = _2150 > 0.99989998340606689453125;
    float _2154 = _2138 * 0.15915493667125701904296875;
    int _2156 = abs(_2142);
    float _2158 = fma(_2130, _1942, _2148);
    float _2160 = _2112 * (-2.0);
    float _2162 = float(_2110);
    float _2164 = _2154 * 6.283185482025146484375;
    float _2166 = sin(_2164);
    float _2168 = float(_2156);
    float _2170 = fma(_2160, _2054, _2054);
    float _2172 = _2146;
    if (_2014)
    {
        bool _2174 = _746 > 0.5;
        _2060 = _2174;
    }
    bool _2176 = _2060;
    float _2178 = _746 + (-0.5);
    float _2180 = _2120 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2182 = _2168 * _2162;
    float _2184 = fma(_1988, _2160, _1988);
    float _2186 = fma(_2178, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2170);
    float _2188 = fma(_1704, _2180, -0.5);
    float _2190 = _2182 * (-2.0);
    if (_2152)
    {
        float _2192 = fma(_536, 0.001000000047497451305389404296875, _470);
        _472 = _2192;
    }
    float _2194 = _472;
    float _2196 = fma(_2184, _1942, _2186);
    float _2198 = _1622 + (-0.5);
    float _2200 = fma(_2190, _2058, _2058);
    float _2202 = fma(_2036, _2190, _2036);
    float _2204 = _2166 * 0.125;
    float _2206 = in.m_71.x;
    float _2208 = in.m_71.y;
    float _2210 = in.m_71.z;
    float _2212 = fma(_2198, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2200);
    if (_2152)
    {
        float _2214 = fma(_544, 0.001000000047497451305389404296875, _480);
        _486 = _2214;
    }
    float _2216 = _486;
    float _2218 = fma(_2146, 0.5, _2204);
    float _2220 = -_2194;
    float _2222 = _2092 * _2220;
    float _2224 = fma(_2202, _1942, _2212);
    if (!_2152)
    {
        _2172 = _476;
    }
    float _2226 = _2172;
    float _2228 = _2218 + 0.625;
    float _2230 = _2226;
    if (_2152)
    {
        float _2232 = fma(_540, 0.001000000047497451305389404296875, _476);
        _2230 = _2232;
    }
    float _2234 = _2230;
    float _2236 = -_2216;
    float _2238 = -_2222;
    float _2240 = fma(_2088, _2236, _2238);
    float _2242 = _2224 * 0.15915493667125701904296875;
    float _2244 = _2228 * _1958;
    float _2246 = -_2216;
    float _2248 = _2084 * _2246;
    float _2250 = -_2234;
    float _2252 = _2088 * _2250;
    float _2254 = _2158 * 0.15915493667125701904296875;
    float _2256 = _2196 * 0.15915493667125701904296875;
    float _2258 = -_2234;
    float _2260 = -_2248;
    float _2262 = fma(_2092, _2258, _2260);
    float _2264 = _2240 * _2240;
    float _2266 = -_2194;
    float _2268 = -_2252;
    float _2270 = fma(_2084, _2266, _2268);
    float _2272 = _2254 * 6.283185482025146484375;
    float _2274 = sin(_2272);
    float _2276 = _1616 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2278 = fma(_2262, _2262, _2264);
    float _2280 = -_1774;
    float _2282 = fma(_1922, _2078, _2280);
    float _2284 = fma(_2206, _2244, _2206);
    float _2286 = fma(_2270, _2270, _2278);
    float _2288 = fma(_2208, _2244, _2208);
    float _2290 = _2254 * 6.283185482025146484375;
    float _2292 = cos(_2290);
    float _2294 = fma(_2210, _2244, _2210);
    float _2296 = _1618 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2298 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2284);
    float _2300 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2288);
    float _2302 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2294);
    float _2304 = _2276 * _2298;
    float _2306 = _2256 * 6.283185482025146484375;
    float _2308 = sin(_2306);
    float _2310 = _2296 * _2300;
    float _2312 = _1688 * _2302;
    float _2314 = _2256 * 6.283185482025146484375;
    float _2316 = cos(_2314);
    float _2318 = _2242 * 6.283185482025146484375;
    float _2320 = cos(_2318);
    float _2322 = _2308 * _2274;
    float _2324 = _2308 * _2292;
    float _2326 = _2242 * 6.283185482025146484375;
    float _2328 = sin(_2326);
    float _2330 = _2316 * _2292;
    float _2332 = _2316 * _2274;
    float _2334 = rsqrt(_2286);
    float _2336 = _2308 * _2320;
    float _2338 = _2292 * _2320;
    float _2340 = _2316 * _2320;
    float _2342 = _2274 * _2320;
    float _2344 = _2340 * _2092;
    float _2346 = fma(_2328, _2330, _2322);
    float _2348 = -_2332;
    float _2350 = fma(_2328, _2324, _2348);
    float _2352 = -_2324;
    float _2354 = fma(_2328, _2332, _2352);
    float _2356 = fma(_2328, _2322, _2330);
    float _2358 = _2346 * _2088;
    float _2360 = _2354 * _2088;
    float _2362 = _2354 * _2092;
    float _2364 = _2240 * _2334;
    float _2366 = _2262 * _2334;
    float _2368 = _2270 * _2334;
    float _2370 = _2340 * _2088;
    float _2372 = _2346 * _2092;
    float _2374 = fma(_2338, _2366, _2358);
    float _2376 = _2084 * _2368;
    float _2378 = -_2328;
    float _2380 = fma(_2378, _2366, _2370);
    float _2382 = _2088 * _2364;
    float _2384 = -_2328;
    float _2386 = fma(_2384, _2368, _2344);
    float _2388 = fma(_2342, _2366, _2360);
    float _2390 = -_2376;
    float _2392 = fma(_2092, _2364, _2390);
    float _2394 = fma(_2338, _2368, _2372);
    float _2396 = -_2382;
    float _2398 = fma(_2084, _2366, _2396);
    bool _2400 = _1612 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2402 = isnan(_1612);
    bool _2404 = _2400 || _2402;
    bool _2406 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2408 = _2404 || _2406;
    float _2410 = float(_2408);
    float _2412 = fma(_2350, _2392, _2374);
    float _2414 = fma(_2336, _2392, _2380);
    float _2416 = fma(_2356, _2392, _2388);
    float _2418 = fma(_2336, _2398, _2386);
    float _2420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2422 = fma(_2342, _2368, _2362);
    float _2424 = fma(_2350, _2398, _2394);
    float _2426 = _2310 * _2414;
    float _2428 = _2310 * _2418;
    bool _2430 = _1612 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2432 = isnan(_1612);
    bool _2434 = _2430 || _2432;
    bool _2436 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2438 = _2434 || _2436;
    float _2440 = float(_2438);
    float _2442 = -_2410;
    float _2444 = _2442 + 1.0;
    float _2446 = fma(_2356, _2398, _2422);
    float _2448 = fma(_2304, _2412, _2426);
    float _2450 = fma(_2304, _2424, _2428);
    float _2452 = _2440 * _2444;
    int _2454 = as_type<int>(_2398);
    int _2456 = as_type<int>(_2450);
    int _2458 = as_type<int>(_2426);
    float _2460 = _2312;
    float _2462 = _2354;
    if (_2014)
    {
        float _2464 = -_2076;
        float _2466 = _2464 + 1.0;
        _2454 = as_type<int>(_2466);
    }
    int _2468 = _2454;
    float _2470 = fma(_2312, _2416, _2448);
    float _2472 = fma(_2312, _2446, _2450);
    float _2474 = _2050 * _2452;
    float _2476 = as_type<float>(_2468);
    if (_2028)
    {
        float _2478 = -_2076;
        float _2480 = _2478 + 1.0;
        _2456 = as_type<int>(_2480);
    }
    int _2482 = _2456;
    float _2484 = _1802 + _2470;
    float _2486 = _1812 + _2472;
    float _2488 = _2420 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2490 = _2484;
    float _2492 = _2486;
    if (_2014)
    {
        float _2494 = _2176 ? as_type<float>(_2468) : _2076;
        _2074 = _2494;
    }
    float _2496 = _2074;
    float _2498 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2500 = _2484 + _2498;
    float _2502 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2504 = _2486 + _2502;
    float _2506 = fma(_2488, _1738, -0.5);
    if (!_2028)
    {
        _2476 = _2076;
    }
    float _2508 = _2476;
    float _2510 = _2500 * _2500;
    float _2512 = _2504 * _2504;
    float _2514 = _2508;
    float _2516 = _2510;
    float _2518 = _2512;
    if (_2028)
    {
        float _2520 = _1662 ? as_type<float>(_2482) : _2076;
        _2514 = _2520;
    }
    float _2522 = _2514;
    float _2524 = _2340 * _2084;
    float _2526 = _2092 * _2366;
    float _2528 = _2510 + _2512;
    float _2530 = _2346 * _2084;
    float _2532 = -_2328;
    float _2534 = fma(_2532, _2364, _2524);
    float _2536 = -_2526;
    float _2538 = fma(_2088, _2368, _2536);
    float _2540 = sqrt(_2528);
    float _2542 = _2354 * _2084;
    float _2544 = fma(_2338, _2364, _2530);
    float _2546 = fma(_2336, _2538, _2534);
    if (_1888)
    {
        float _2548 = -_2076;
        float _2550 = _2548 + 1.0;
        _2458 = as_type<int>(_2550);
    }
    int _2552 = _2458;
    float _2554 = fma(_2342, _2364, _2542);
    float _2556 = fma(_2350, _2538, _2544);
    float _2558 = _2310 * _2546;
    float _2560 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2562 = in.m_73.w;
    float _2564 = fma(_2356, _2538, _2554);
    float _2566 = fma(_2304, _2556, _2558);
    if (_1888)
    {
        float _2568 = _2008 ? as_type<float>(_2552) : _2076;
        _2104 = _2568;
    }
    float _2570 = _2104;
    float _2572 = -_2440;
    float _2574 = _2572 + 1.0;
    float _2576 = fma(_2312, _2564, _2566);
    float _2578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2580 = _2540 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2582 = fma(_2574, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2474);
    float _2584 = _1824 + _2576;
    float _2586 = fma(_2410, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2582);
    float _2588 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2590 = _2560 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2592 = fma(_2590, _2496, -0.5);
    if (!_2580)
    {
        _2460 = _2584;
    }
    float _2594 = _2460;
    float _2596 = _2578 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2598 = fma(_1920, _2592, _1912);
    float _2600 = fma(_2596, _2570, -0.5);
    float _2602 = _2588 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2604 = fma(_1928, _2600, _1932);
    float _2606 = fma(_2602, _2522, -0.5);
    bool _2608 = !_2580;
    float _2610 = _2594;
    if (!_2608)
    {
        float _2612 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2614 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2616 = _2540 + _2614;
        float _2618 = rsqrt(_2528);
        float _2620 = _2616 * _2612;
        float _2622 = _2584 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2624 = _2620 * 0.15915493667125701904296875;
        float _2626 = _2624 * 6.283185482025146484375;
        float _2628 = sin(_2626);
        float _2630 = _2624 * 6.283185482025146484375;
        float _2632 = cos(_2630);
        float _2634 = fma(_2628, _2622, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2636 = _2618 * _2634;
        float _2638 = _2632 + (-1.0);
        float _2640 = fma(_2500, _2636, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2642 = fma(_2504, _2636, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2644 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2648 = _2640 + _2646;
        float _2650 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2652 = _2642 + _2650;
        float _2654 = fma(_2584, _2632, _2644);
        float _2656 = _2648 * _2648;
        float _2658 = _2652 * _2652;
        _2610 = _2654;
        _2516 = _2656;
        _2518 = _2658;
        _2490 = _2640;
        _2492 = _2642;
    }
    float _2660 = _2610;
    float _2662 = _2516;
    float _2664 = _2518;
    float _2666 = _2490;
    float _2668 = _2492;
    float _2670 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2672 = _2660 + _2670;
    float _2674 = fma(_1924, _2606, _1916);
    float _2676 = -_1938;
    float _2678 = fma(_1926, _2188, _2676);
    float _2680 = -_1936;
    float _2682 = fma(_1934, _2506, _2680);
    float _2684 = fma(_2672, _2672, _2662);
    float _2686 = _1586 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2688 = _1588 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2690 = _1590 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2692 = _2684 + _2664;
    float _2694 = _2686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2696 = _2688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2698 = _2690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2700 = _2282 + 0.5;
    float _2702 = _2586 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2704 = sqrt(_2692);
    float _2706 = _2674 + 0.5;
    float _2708 = _2598 + 0.5;
    float _2710 = _2604 + 0.5;
    float _2712 = _2682 + 0.5;
    float _2714 = _2678 + 0.5;
    out.m_75.w = _2562;
    out.m_77.x = _2694;
    out.m_77.y = _2696;
    out.m_77.z = _2698;
    out.m_77.w = _2702;
    out.m_79.x = _2708;
    out.m_79.y = _2700;
    out.m_79.z = _2710;
    out.m_79.w = _2712;
    bool _2716 = _2704 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2718 = isnan(_2704);
    bool _2720 = _2716 || _2718;
    bool _2722 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2724 = _2720 || _2722;
    out.m_81.x = _2706;
    out.m_81.y = _2714;
    float _2726 = _2672;
    if (!_2724)
    {
        _2726 = 1.0;
    }
    float _2728 = _2726;
    bool _2730 = !_2724;
    float _2732 = _2728;
    if (!_2730)
    {
        bool _2734 = _2704 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2736 = isnan(_2704);
        bool _2738 = _2734 || _2736;
        bool _2740 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2742 = _2738 || _2740;
        if (!_2742)
        {
            float _2744 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2746 = _2704 + _2744;
            float _2748 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2750 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2748;
            float _2752 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2754 = _2752 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2756 = 1.0 / _2750;
            float _2758 = _2746 * _2756;
            float _2760 = fma(_2758, _2754, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2732 = _2760;
            _2762 = true;
        }
        else
        {
            bool _2764 = _2704 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2766 = isnan(_2704);
            bool _2768 = _2764 || _2766;
            bool _2770 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2772 = _2768 || _2770;
            if (!_2772)
            {
                float _2774 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2776 = _2704 + _2774;
                float _2778 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2780 = _2778 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2782 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2784 = _2782 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2786 = 1.0 / _2780;
                float _2788 = _2776 * _2786;
                float _2790 = fma(_2788, _2784, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2732 = _2790;
                _2762 = true;
            }
            else
            {
                _2732 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2762 = false;
    float _2792 = _2732;
    float _2794 = _1824 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2796 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2798 = _2660 + _2796;
    float _2800 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2794);
    float _2802 = fma(_2798, _2792, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    bool _2804 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2806 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2808 = _2804 || _2806;
    bool _2810 = isnan(0.5);
    bool _2812 = _2808 || _2810;
    float _2814 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2800);
    float _2816 = _1824 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2818 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2820 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2822 = _2818 || _2820;
    bool _2824 = isnan(0.5);
    bool _2826 = _2822 || _2824;
    float _2828 = _2814 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2830 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2816);
    float _2832 = 1.0 / _2828;
    float _2834 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2830);
    float _2836 = _2834 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2838 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2840 = _2798;
    float _2842 = _2802;
    if (_2826)
    {
        _2838 = 1.0;
    }
    float _2844 = _2838;
    float _2846 = _2836 + _2828;
    float _2848 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2850 = _2666 + _2848;
    float _2852 = fma(_2850, _2792, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2854 = _2846 * _2832;
    float _2856 = _2854 * 0.5;
    float _2858 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2860 = _2668 + _2858;
    float _2862 = _2850;
    float _2864 = _2860;
    float _2866 = _2856;
    float _2868 = _2844;
    if (_2812)
    {
        _2862 = _2852;
    }
    float _2870 = _2862;
    float _2872 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2874 = fma(_2856, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2872);
    float _2876 = fma(_2860, _2792, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2878 = _2870;
    if (_2812)
    {
        _2864 = _2802;
    }
    float _2880 = _2864;
    float _2882 = 1.0 / _2874;
    float _2884 = _2880;
    if (_2812)
    {
        _2866 = _2876;
    }
    float _2886 = _2866;
    float _2888 = _2886;
    if (!_2812)
    {
        float _2890 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2892 = _1824 + _2890;
        float _2894 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2896 = _1802 + _2894;
        float _2898 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2900 = _2892 * _2892;
        float _2902 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2904 = _1812 + _2902;
        float _2906 = fma(_2896, _2896, _2900);
        float _2908 = fma(_2904, _2904, _2906);
        float _2910 = -_1802;
        float _2912 = _2910 + _2852;
        float _2914 = -_1812;
        float _2916 = _2914 + _2876;
        float _2918 = sqrt(_2908);
        float _2920 = precise::min(_2918, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2922 = _2920 * _2898;
        float _2924 = -_1824;
        float _2926 = _2924 + _2802;
        float _2928 = fma(_2912, _2922, _1802);
        float _2930 = fma(_2926, _2922, _1824);
        float _2932 = fma(_2916, _2922, _1812);
        _2840 = _2922;
        _2884 = _2930;
        _2878 = _2928;
        _2888 = _2932;
    }
    float _2934 = _2840;
    float _2936 = _2884;
    float _2938 = _2878;
    float _2940 = _2888;
    float _2942 = _2934;
    if (_2826)
    {
        _2942 = 1.0;
    }
    float _2944 = _2942;
    float _2946 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2948 = _2882 * _2946;
    float _2950 = _2944;
    float _2952 = _2948;
    if (!_2826)
    {
        float _2954 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2956 = _2954 * 0.15915493667125701904296875;
        float _2958 = _2956 * 6.283185482025146484375;
        float _2960 = cos(_2958);
        float _2962 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2964 = _2962 * 0.15915493667125701904296875;
        float _2966 = _2956 * 6.283185482025146484375;
        float _2968 = sin(_2966);
        float _2970 = 1.0 / _2960;
        float _2972 = _2964 * 6.283185482025146484375;
        float _2974 = cos(_2972);
        float _2976 = _2968 * _2970;
        float _2978 = _2964 * 6.283185482025146484375;
        float _2980 = sin(_2978);
        float _2982 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2984 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2982;
        float _2986 = _2974 * _2976;
        float _2988 = 1.0 / _2984;
        float _2990 = 1.0 / _2986;
        float _2992 = _2980 * _2990;
        float _2994 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2996 = fma(_2948, _2992, _2994);
        float _2998 = _2996 * _2988;
        float _3000 = precise::clamp(_2998, 0.0, 1.0);
        _2842 = _2956;
        _2868 = _3000;
    }
    float _3002 = _2842;
    float _3004 = _2868;
    float _3006 = _3002;
    if (!_2826)
    {
        float _3008 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3010 = _3008 * 0.15915493667125701904296875;
        float _3012 = _3010 * 6.283185482025146484375;
        float _3014 = cos(_3012);
        float _3016 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3018 = _3016 * 0.15915493667125701904296875;
        float _3020 = _3010 * 6.283185482025146484375;
        float _3022 = sin(_3020);
        float _3024 = 1.0 / _3014;
        float _3026 = _3018 * 6.283185482025146484375;
        float _3028 = cos(_3026);
        float _3030 = _3022 * _3024;
        float _3032 = _3018 * 6.283185482025146484375;
        float _3034 = sin(_3032);
        float _3036 = _3028 * _3030;
        float _3038 = 1.0 / _3036;
        float _3040 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3042 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3040;
        float _3044 = 1.0 / _3042;
        float _3046 = _3034 * _3038;
        float _3048 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3050 = fma(_2948, _3046, _3048);
        float _3052 = _3050 * _3044;
        float _3054 = precise::clamp(_3052, 0.0, 1.0);
        float _3056 = -_3054;
        float _3058 = _3056 + 1.0;
        _3006 = _3036;
        _2950 = _3058;
    }
    float _3060 = _3006;
    float _3062 = _2950;
    float _3064 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3066 = _2936 + _3064;
    float _3068 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3070 = _2938 + _3068;
    float _3072 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3074 = _2940 + _3072;
    float _3076 = _3066 * _3066;
    float _3078 = fma(_3070, _3070, _3076);
    float _3080 = fma(_3074, _3074, _3078);
    float _3082 = rsqrt(_3080);
    float _3084 = _3082 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3086 = _3070 * _3084;
    float _3088 = _3074 * _3084;
    float _3090 = _3086 * _3086;
    float _3092 = _3088 * _3088;
    float _3094 = _3090 + _3092;
    float _3096 = sqrt(_3094);
    bool _3098 = _3096 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3100 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3102 = _3096 + _3100;
    float _3104 = _3074;
    float _3106 = _3060;
    float _3108 = _3102;
    float _3110 = _3066;
    float _3112 = _3086;
    if (_3098)
    {
        float _3114 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3104 = _3114;
    }
    float _3116 = _3104;
    if (_3098)
    {
        float _3118 = rsqrt(_3094);
        _3106 = _3118;
    }
    float _3120 = _3106;
    float _3122 = _3120;
    if (_3098)
    {
        float _3124 = _3102 * _3116;
        _3108 = _3124;
    }
    float _3126 = _3108;
    if (_3098)
    {
        float _3128 = _3126 * 0.15915493667125701904296875;
        _2952 = _3128;
    }
    float _3130 = _2952;
    float _3132 = _3076;
    if (_3098)
    {
        float _3134 = _3130 * 6.283185482025146484375;
        float _3136 = sin(_3134);
        _3132 = _3136;
    }
    float _3138 = _3132;
    float _3140 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3142 = precise::max(0.0, _3140);
    float _3144 = _3082;
    float _3146 = _3140;
    float _3148 = _3142;
    if (_3098)
    {
        float _3150 = _3130 * 6.283185482025146484375;
        float _3152 = cos(_3150);
        _3144 = _3152;
    }
    float _3154 = _3144;
    float _3156 = -_3084;
    float _3158 = -_3142;
    float _3160 = fma(_3066, _3156, _3158);
    float _3162 = _3160;
    if (!_3098)
    {
        _3110 = _3092;
    }
    float _3164 = _3110;
    float _3166 = _3164;
    if (_3098)
    {
        float _3168 = _3160 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3146 = _3168;
    }
    float _3170 = _3146;
    float _3172 = _3138;
    float _3174 = _3170;
    if (_3098)
    {
        float _3176 = fma(_3138, _3170, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3172 = _3176;
    }
    float _3178 = _3172;
    if (_3098)
    {
        float _3180 = _3154 + (-1.0);
        _3174 = _3180;
    }
    float _3182 = _3174;
    float _3184 = _3182;
    if (_3098)
    {
        float _3186 = _3120 * _3178;
        _2462 = _3186;
    }
    float _3188 = _2462;
    if (!_3098)
    {
        _3122 = _3088;
    }
    float _3190 = _3122;
    float _3192 = sqrt(_3080);
    float _3194 = _3190;
    if (_3098)
    {
        float _3196 = _3182 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3148 = _3196;
    }
    float _3198 = _3148;
    if (_3098)
    {
        float _3200 = _3086 * _3188;
        _3112 = _3200;
    }
    float _3202 = _3112;
    if (!_3098)
    {
        _3184 = _3090;
    }
    float _3204 = _3184;
    float _3206 = _3204;
    if (_3098)
    {
        float _3208 = _3088 * _3188;
        _3194 = _3208;
    }
    float _3210 = _3194;
    if (_3098)
    {
        float _3212 = fma(_3160, _3154, _3198);
        _3162 = _3212;
    }
    float _3214 = _3162;
    if (_3098)
    {
        float _3216 = _3202 * _3202;
        _3206 = _3216;
    }
    float _3218 = _3206;
    if (_3098)
    {
        float _3220 = _3210 * _3210;
        _3166 = _3220;
    }
    float _3222 = _3166;
    float _3224 = _2936 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3226 = fma(_3214, _3214, _3218);
    float _3228 = _2936 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3230 = _3226 + _3222;
    float _3232 = fma(_2938, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3228);
    float _3234 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3236 = fma(_3192, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3234);
    float _3238 = precise::clamp(_3236, 0.0, 1.0);
    float _3240 = rsqrt(_3230);
    float _3242 = _2936 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3244 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3246 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3232);
    float _3248 = -_3238;
    float _3250 = _3248 + 1.0;
    float _3252 = _2936 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3254 = fma(_2938, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3242);
    float _3256 = _3246 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3258 = abs(_3250);
    float _3260 = log2(_3258);
    float _3262 = fma(_2938, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3252);
    float _3264 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3254);
    float _3266 = _3256 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3268 = fma(_2938, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3224);
    float _3270 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3262);
    float _3272 = _3264 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3274 = _3240 * _3202;
    float _3276 = -_3266;
    float _3278 = fma(_3276, _3244, 1.0);
    float _3280 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3268);
    float _3282 = _3270 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3284 = _3272 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3286 = _3240 * _3214;
    float _3288 = _3274 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3290 = _3280 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3292 = fma(_3282, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3284);
    float _3294 = _3240 * _3210;
    float _3296 = -_3288;
    float _3298 = fma(_3286, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3296);
    float _3300 = _3260 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3302 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3292);
    float _3304 = log2(_3278);
    float _3306 = -_3294;
    float _3308 = fma(_3306, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3298);
    float _3310 = _3272 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3312 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3302);
    float _3314 = _3272 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3316 = fma(_3308, -0.5, 0.5);
    float _3318 = fma(_3282, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3310);
    float _3320 = fma(_3308, 0.5, 0.5);
    float _3322 = exp2(_3300);
    float _3324 = fma(_3282, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3314);
    float _3326 = _3286 + 1.0;
    float _3328 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3318);
    float _3330 = fma(_3320, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3332 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3324);
    float _3334 = 1.0 / _3312;
    float _3336 = fma(_3320, _3330, -0.212114393711090087890625);
    float _3338 = _3304 * 0.693147182464599609375;
    float _3340 = fma(_3320, _3336, 1.570728778839111328125);
    float _3342 = _3338 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3344 = sqrt(_3316);
    float _3346 = -_3286;
    float _3348 = fma(_3322, _3326, _3346);
    float _3350 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3328);
    float _3352 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3332);
    float _3354 = fma(_3348, 0.5, 0.5);
    float _3356 = _3350 * _3334;
    float _3358 = _3352 * _3334;
    float _3360 = fma(_3356, 0.5, 0.5);
    float _3362 = fma(_3358, -0.5, 0.5);
    float _3364 = _3344 * 0.636619746685028076171875;
    float3 _8662 = float3(_3360, _3362, _3342);
    float _3366 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8662, float3(0.0), isnan(_8662)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8662, float3(0.0), isnan(_8662)), level(0.0)).x;
    float _3368 = -_3340;
    float _3370 = fma(_3364, _3368, 1.0);
    float3 _8678 = float3(_3360, _3362, _3342);
    float4 _3373 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8678, float3(0.0), isnan(_8678)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8678, float3(0.0), isnan(_8678)), level(0.0)).xyzw;
    float _3375 = _3373.x;
    float _3377 = _3373.y;
    float _3379 = _3373.z;
    float _3381 = _3373.w;
    float2 _8695 = float2(_3370, _3354);
    float3 _3385 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8695, float2(0.0), isnan(_8695)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8695, float2(0.0), isnan(_8695)), level(0.0)).xyz;
    float _3387 = _3385.x;
    float _3389 = _3385.y;
    float _3391 = _3385.z;
    float _3393 = _3260 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3395 = _3272 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3397 = _3004 * _3062;
    bool _3399 = _3004 > 0.0;
    bool _3401 = isnan(_3004);
    bool _3403 = _3399 || _3401;
    bool _3405 = isnan(0.0);
    bool _3407 = _3403 || _3405;
    float _3409 = _3312 * 0.5;
    float _3411 = fma(_3282, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3395);
    float _3413 = exp2(_3393);
    bool _3415 = _3062 <= 0.0;
    bool _3417 = !_3407;
    bool _3419 = _3415 || _3417;
    float _3421 = _3397 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3423 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3411);
    float _3425 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3423);
    float _3427 = _3350 + _3312;
    float _3429 = fma(_3352, -0.5, _3409);
    float _3431 = _3421 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3433 = _3425 + _3312;
    out.gl_Position.x = _3350;
    out.gl_Position.y = _3352;
    out.gl_Position.z = _3425;
    out.gl_Position.w = _3312;
    float _3435 = _3427 * 0.5;
    float _3437 = _3433 * 0.5;
    float _3439 = -_3413;
    float _3441 = _3439 + 1.0;
    out.m_47.x = _3431;
    float _3443 = _3441 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _3435;
    out.m_83.y = _3429;
    out.m_83.z = _3437;
    out.m_83.w = _3312;
    float _3445 = -_3443;
    float _3447 = _3445 + 1.0;
    float _3449 = _3443 * _3366;
    float _3451 = _3381 * _3449;
    float _3453 = _3391 * _3449;
    float _3455 = fma(_3387, _3451, _3375);
    float _3457 = fma(_3389, _3451, _3377);
    float _3459 = _3381 * _3447;
    float _3461 = fma(_3381, _3453, _3379);
    out.m_85.x = _3455;
    out.m_85.y = _3457;
    out.m_85.z = _3461;
    out.m_85.w = _3459;
    if (!_3419)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _3463 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3463;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2762 = false;
    bool _1610 = false;
    bool _1504 = false;
    bool _1294 = false;
    bool _1122 = false;
    bool _854 = false;
    bool _608 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    float _112 = as_type<float>(_104);
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _110;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3521 = as_type<float>(_120);
        out.gl_Position.z = _3521;
    }
    if (!_108)
    {
        return out;
    }
    float _124 = in.m_49.w;
    float _126 = float(_104);
    float _128 = 1.0 / _126;
    float _130 = -_124;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_124);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = _132 * _128;
    bool _146 = _132 >= _126;
    bool _148 = !_142;
    bool _150 = _146 || _148;
    out.m_51.x = _144;
    float _152 = 0.0;
    float _154 = _132;
    if (_150)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _112;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _158 = _156 * 5.0;
        _122 = as_type<int>(_158);
    }
    int _160 = _122;
    float _162 = as_type<float>(_160);
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3594 = as_type<float>(_160);
        out.gl_Position.z = _3594;
    }
    if (_150)
    {
        return out;
    }
    float _164 = in.m_53.y;
    float _166 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _168 = in.m_55.y;
    bool _170 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _172 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _174 = _170 || _172;
    bool _176 = isnan(1.0);
    bool _178 = _174 || _176;
    float _180 = in.m_57.y;
    float _182 = in.m_53.z;
    float _184 = in.m_55.z;
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
        float _198 = _132 * _132;
        float _200 = _198 * 0.5;
        _194 = _200;
    }
    float _202 = _194;
    float _204 = in.m_57.z;
    if (!_178)
    {
        float _206 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _206;
    }
    float _208 = _196;
    float _210 = _164 * _164;
    float _212 = fma(_168, _168, _210);
    float _214 = fma(_180, _180, _212);
    float _216 = in.m_49.x;
    float _218 = in.m_49.y;
    float _220 = in.m_49.z;
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
        _152 = _254;
        _232 = _264;
    }
    float _266 = _152;
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
    float _302 = _296;
    if (!_178)
    {
        _300 = _132;
    }
    float _304 = _300;
    float _306 = _304;
    if (!_178)
    {
        float _308 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _234 = _308;
    }
    float _310 = _234;
    bool _312 = !_178;
    float _314 = _310;
    if (!_312)
    {
        float _316 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _318 = log2(_316);
        float _320 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _322 = _320 + 1.0;
        float _324 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _326 = _132 * _318;
        float _328 = 1.0 / _322;
        float _330 = _324 * 0.693147182464599609375;
        float _332 = exp2(_326);
        float _334 = 1.0 / _330;
        float _336 = _332 + (-1.0);
        float _338 = -_336;
        float _340 = fma(_338, _334, _132);
        float _342 = _340 * _328;
        float _344 = _342 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _314 = _344;
    }
    float _346 = _314;
    bool _348 = !_178;
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
        _306 = _368;
    }
    float _370 = _306;
    float _372 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _374 = _346 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _376 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _378 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _380 = fma(_296, _218, _372);
    float _382 = _346 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _384 = fma(_370, _218, _374);
    float _386 = fma(_296, _216, _376);
    float _388 = _346 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _390 = fma(_370, _216, _382);
    float _392 = -_384;
    float _394 = _380 + _392;
    float _396 = sqrt(_298);
    float _398 = fma(_370, _220, _388);
    float _400 = fma(_296, _220, _378);
    float _402 = -_390;
    float _404 = _386 + _402;
    float _406 = _394 * _394;
    float _408 = in.m_59.y;
    float _410 = -_398;
    float _412 = _400 + _410;
    float _414 = 0.0;
    float _416 = _384;
    float _418 = _386;
    if (!_224)
    {
        _414 = 0.0;
    }
    float _420 = _414;
    float _422 = fma(_404, _404, _406);
    float _424 = in.m_55.x;
    float _426 = 0.0;
    float _428 = _420;
    if (_224)
    {
        float _430 = rsqrt(_214);
        _426 = _430;
    }
    float _432 = _426;
    if (!_224)
    {
        _302 = 0.0;
    }
    float _434 = _302;
    float _436 = fma(_412, _412, _422);
    float _438 = in.m_53.x;
    float _440 = _394 * _164;
    float _442 = _394 * _180;
    bool _444 = _396 > 0.0;
    float _446 = in.m_57.x;
    float _448 = sqrt(_436);
    float _450 = _396;
    float _452 = _434;
    if (!_224)
    {
        _450 = 0.0;
    }
    float _454 = _450;
    float _456 = in.m_61.w;
    float _458 = in.m_44.x;
    float _460 = in.m_44.y;
    float _462 = in.m_44.z;
    float _464 = _454;
    float _466 = _456;
    if (_224)
    {
        float _468 = _432 * _168;
        _464 = _468;
    }
    float _470 = _464;
    float _472 = _470;
    if (_224)
    {
        float _474 = _432 * _164;
        _428 = _474;
    }
    float _476 = _428;
    if (_224)
    {
        float _478 = _432 * _180;
        _452 = _478;
    }
    float _480 = _452;
    out.m_63.y = _408;
    float _482 = _298;
    float _484 = _408;
    float _486 = _480;
    if (_444)
    {
        float _488 = rsqrt(_298);
        _482 = _488;
    }
    float _490 = _482;
    float _492 = _394 * _168;
    float _494 = 0.0;
    if (!_444)
    {
        _494 = 0.0;
    }
    float _496 = _494;
    bool _498 = _448 >= 9.9999999747524270787835121154785e-07;
    bool _500 = isnan(_448);
    bool _502 = _498 || _500;
    bool _504 = isnan(9.9999999747524270787835121154785e-07);
    bool _506 = _502 || _504;
    float _508 = fma(_404, _424, _492);
    float _510 = _448;
    float _512 = _496;
    if (!_444)
    {
        _510 = 0.0;
    }
    float _514 = _510;
    float _516 = fma(_404, _438, _440);
    float _518 = _514;
    if (!_444)
    {
        _416 = 0.0;
    }
    float _520 = _416;
    float _522 = fma(_412, _184, _508);
    float _524 = fma(_404, _446, _442);
    float _526 = fma(_412, _182, _516);
    float _528 = fma(_412, _204, _524);
    float _530 = _520;
    float _532 = _522;
    if (_444)
    {
        float _534 = _490 * _184;
        _512 = _534;
    }
    float _536 = _512;
    if (_444)
    {
        float _538 = _490 * _182;
        _518 = _538;
    }
    float _540 = _518;
    if (_444)
    {
        float _542 = _490 * _204;
        _530 = _542;
    }
    float _544 = _530;
    float _546 = fma(_386, _456, _458);
    float _548 = fma(_380, _456, _460);
    float _550 = fma(_400, _456, _462);
    if (_506)
    {
        _418 = _522;
    }
    float _552 = _418;
    float _554 = _552;
    float _556 = _552;
    if (_506)
    {
        _466 = _526;
    }
    float _558 = _466;
    float _560 = _558;
    float _562 = _558;
    if (_506)
    {
        _532 = _528;
    }
    float _564 = _532;
    float _566 = _564;
    float _568 = _564;
    if (!_506)
    {
        bool _570 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _572 = !_570;
        if (!_572)
        {
            float _574 = _164 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _576 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _578 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _580 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[16].x, _574);
            float _582 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[16].x, _576);
            float _584 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[16].x, _578);
            float _586 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[16].z, _580);
            float _588 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[16].z, _582);
            float _590 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[16].z, _584);
            float _592 = _586 * _586;
            float _594 = fma(_588, _588, _592);
            float _596 = fma(_590, _590, _594);
            float _598 = rsqrt(_596);
            float _600 = _598 * 9.9999999747524270787835121154785e-07;
            float _602 = _588 * _600;
            float _604 = _586 * _600;
            float _606 = _590 * _600;
            _562 = _604;
            _556 = _602;
            _568 = _606;
            _608 = true;
        }
        else
        {
            float _610 = _218 * _218;
            float _612 = fma(_216, _216, _610);
            float _614 = fma(_220, _220, _612);
            float _616 = sqrt(_614);
            bool _618 = _616 >= 9.9999999747524270787835121154785e-07;
            bool _620 = isnan(_616);
            bool _622 = _618 || _620;
            bool _624 = isnan(9.9999999747524270787835121154785e-07);
            bool _626 = _622 || _624;
            if (!_626)
            {
                float _628 = _460 * _460;
                float _630 = fma(_458, _458, _628);
                float _632 = fma(_462, _462, _630);
                float _634 = sqrt(_632);
                bool _636 = _634 >= 9.9999999747524270787835121154785e-07;
                bool _638 = isnan(_634);
                bool _640 = _636 || _638;
                bool _642 = isnan(9.9999999747524270787835121154785e-07);
                bool _644 = _640 || _642;
                float _646 = _214;
                if (!_644)
                {
                    float _648 = rsqrt(_214);
                    _646 = _648;
                }
                float _650 = _646;
                if (!_644)
                {
                    float _652 = _650 * 9.9999999747524270787835121154785e-07;
                    _566 = _652;
                }
                float _654 = _566;
                float _656 = _654;
                if (!_644)
                {
                    float _658 = _168 * _654;
                    _554 = _658;
                }
                float _660 = _554;
                _556 = _660;
                if (!_644)
                {
                    float _662 = _164 * _654;
                    _560 = _662;
                }
                float _664 = _560;
                _562 = _664;
                if (!_644)
                {
                    float _666 = _180 * _654;
                    _656 = _666;
                }
                float _668 = _656;
                bool _670 = !_644;
                _568 = _668;
                _608 = _670;
                if (!_608)
                {
                    float _672 = _164 * _460;
                    float _674 = _168 * _460;
                    float _676 = _180 * _460;
                    float _678 = fma(_458, _438, _672);
                    float _680 = fma(_458, _424, _674);
                    float _682 = fma(_458, _446, _676);
                    float _684 = fma(_182, _462, _678);
                    float _686 = fma(_184, _462, _680);
                    float _688 = fma(_204, _462, _682);
                    float _690 = _684 * _684;
                    float _692 = fma(_686, _686, _690);
                    float _694 = fma(_688, _688, _692);
                    float _696 = rsqrt(_694);
                    float _698 = _696 * 9.9999999747524270787835121154785e-07;
                    float _700 = _686 * _698;
                    float _702 = _684 * _698;
                    float _704 = _688 * _698;
                    _562 = _702;
                    _556 = _700;
                    _568 = _704;
                    _608 = true;
                }
            }
            else
            {
                float _706 = _164 * _218;
                float _708 = _168 * _218;
                float _710 = _180 * _218;
                float _712 = fma(_216, _438, _706);
                float _714 = fma(_216, _424, _708);
                float _716 = fma(_216, _446, _710);
                float _718 = fma(_182, _220, _712);
                float _720 = fma(_184, _220, _714);
                float _722 = fma(_204, _220, _716);
                float _724 = _718 * _718;
                float _726 = fma(_720, _720, _724);
                float _728 = fma(_722, _722, _726);
                float _730 = rsqrt(_728);
                float _732 = _730 * 9.9999999747524270787835121154785e-07;
                float _734 = _720 * _732;
                float _736 = _718 * _732;
                float _738 = _722 * _732;
                _562 = _736;
                _556 = _734;
                _568 = _738;
            }
        }
    }
    _608 = false;
    float _740 = _562;
    float _742 = _556;
    float _744 = _568;
    float _746 = in.m_65.x;
    float _748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _750 = _132 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _754 = _752 != 0;
    int _756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _758 = _756 != 0;
    int _760 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _762 = _760 != 0;
    float _764 = _750 * _748;
    float _766 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[20].x, _764);
    float _768 = _766 * 6.283185482025146484375;
    float _770 = floor(_766);
    float _772 = _768 * 0.15915493667125701904296875;
    bool _774 = !_754;
    int _776 = _774 ? 0 : 1;
    int _778 = abs(_776);
    float _780 = _772 * 6.283185482025146484375;
    float _782 = cos(_780);
    bool _784 = !_762;
    int _786 = _784 ? 0 : 1;
    bool _788 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _790 = abs(_786);
    float _792 = -_770;
    float _794 = _766 + _792;
    bool _796 = !_758;
    int _798 = _796 ? 0 : 1;
    float _800 = float(_778);
    int _802 = abs(_798);
    float _804 = -_794;
    float _806 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _808 = fma(_782, 0.5, 0.5);
    float _810 = abs(_806);
    float _812 = _800 * _810;
    bool _814 = _794 < 0.5;
    float _816 = float(_814);
    float _818 = float(_790);
    float _820 = -_808;
    float _822 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _824 = float(_802);
    float _826 = -_816;
    float _828 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _830 = fma(_818, _822, _812);
    float _832 = abs(_828);
    float _834 = fma(_824, _832, _830);
    bool _836 = !_788;
    float _852;
    if (!_836)
    {
        float _838 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _840 = _746 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _842 = fma(_840, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _844 = _842 * _838;
        float _846 = floor(_844);
        float _848 = -_846;
        float _850 = _844 + _848;
        _852 = _850;
        _854 = true;
    }
    else
    {
        _852 = _144;
    }
    _854 = false;
    float _856 = _852;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _860 = _856 + _858;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _864 = _856 + _862;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _868 = _856 + _866;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _870;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _876 = _874 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _878;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _886 = 1.0 / _872;
    bool _888 = _856 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _890 = isnan(_856);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    float _900 = 1.0 / _876;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _904 = _856 + _902;
    bool _906 = _856 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _908 = isnan(_856);
    bool _910 = _906 || _908;
    bool _912 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _914 = _910 || _912;
    float _916 = float(_914);
    float _918 = 1.0 / _884;
    float _920 = _868 * _886;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _922;
    bool _926 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _928 = fma(_924, _920, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _930 = 1.0 / _880;
    float _932 = _860 * _900;
    float _934 = _904 * _918;
    bool _936 = _856 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _938 = isnan(_856);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _944 = _940 || _942;
    float _946 = float(_944);
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _950 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _948;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _952;
    float _956 = -_946;
    float _958 = _956 + 1.0;
    float _960 = fma(_954, _920, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _962 = _864 * _930;
    bool _964 = _856 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _966 = isnan(_856);
    bool _968 = _964 || _966;
    bool _970 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _972 = _968 || _970;
    float _974 = float(_972);
    float _976 = _974 * _958;
    float _978 = -_974;
    float _980 = _978 + 1.0;
    float _982 = fma(_950, _920, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _984 = _856 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _986 = isnan(_856);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _992 = _988 || _990;
    float _994 = float(_992);
    float _996 = -_898;
    float _998 = _996 + 1.0;
    float _1000 = _898 * _980;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1004 = _1002 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1008 = _1006 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1010 = -_994;
    float _1012 = _1010 + 1.0;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _1016 = _1014 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _1018 = _994 * _998;
    float _1020 = fma(_1008, _932, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1022 = _916 * _1012;
    float _1024 = fma(_1004, _932, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1026 = fma(_1016, _932, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _1028 = _928 * _1022;
    float _1030 = _982 * _1022;
    float _1032 = -_916;
    float _1034 = _1032 + 1.0;
    float _1036 = _960 * _1022;
    float _1038 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1038;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1042;
    float _1046 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1030);
    float _1048 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1036);
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _1050;
    float _1054 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[143].z, _1028);
    float _1056 = fma(_1040, _962, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1058 = fma(_1044, _962, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1060 = fma(_1020, _1018, _1046);
    float _1062 = fma(_1024, _1018, _1048);
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1066 = _1064 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1070 = _1068 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1072 = fma(_1052, _962, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _1074 = fma(_1026, _1018, _1054);
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _1078 = _1076 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _1080 = fma(_1056, _1000, _1060);
    float _1082 = fma(_1066, _934, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _1084 = fma(_1070, _934, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1086 = fma(_1058, _1000, _1062);
    float _1088 = fma(_1078, _934, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _1090 = fma(_1072, _1000, _1074);
    float _1092 = fma(_1082, _976, _1080);
    float _1094 = fma(_1084, _976, _1086);
    float _1096 = fma(_1088, _976, _1090);
    float _1098 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1092);
    float _1100 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1094);
    float _1102 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[147].z, _1096);
    bool _1104 = !_926;
    float _1120;
    if (!_1104)
    {
        float _1106 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _1108 = _746 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _1110 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[11].x, _132);
        float _1112 = _1110 * _1106;
        float _1114 = floor(_1112);
        float _1116 = -_1114;
        float _1118 = _1112 + _1116;
        _1120 = _1118;
        _1122 = true;
    }
    else
    {
        _1120 = _144;
    }
    _1122 = false;
    float _1124 = _1120;
    float _1126 = in.m_61.x;
    float _1128 = in.m_61.y;
    float _1130 = in.m_61.z;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1134 = _1124 + _1132;
    bool _1136 = _1124 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1138 = isnan(_1124);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1144 = _1140 || _1142;
    float _1146 = float(_1144);
    float _1148 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1150 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1148;
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1154 = _1152 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1156 = 1.0 / _1154;
    bool _1158 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _1160 = 1.0 / _1150;
    float _1162 = _1100 * _1128;
    bool _1164 = _1124 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1166 = isnan(_1124);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1172 = _1168 || _1170;
    float _1174 = float(_1172);
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1178 = _1124 + _1176;
    bool _1180 = _1124 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1182 = isnan(_1124);
    bool _1184 = _1180 || _1182;
    bool _1186 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1188 = _1184 || _1186;
    float _1190 = float(_1188);
    float _1192 = _1102 * _1130;
    float _1194 = _1178 * _1156;
    float _1196 = -_1146;
    float _1198 = _1196 + 1.0;
    float _1200 = -_1190;
    float _1202 = _1200 + 1.0;
    float _1204 = _1134 * _1160;
    float _1206 = -_1174;
    float _1208 = _1206 + 1.0;
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1210;
    float _1214 = _1146 * _1202;
    float _1216 = _1190 * _1208;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1218;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1222;
    float _1226 = fma(_1212, _1204, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1228 = fma(_1220, _1204, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1230 = fma(_1224, _1204, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1232 = _1226 * _1214;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1236 = _1234 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1238 = _1228 * _1214;
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1242 = _1240 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1244 = _1230 * _1214;
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1248 = _1246 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1250 = fma(_1236, _1194, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1252 = fma(_1242, _1194, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1254 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1238);
    float _1256 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1232);
    float _1258 = fma(_1248, _1194, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1260 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1244);
    float _1262 = fma(_1252, _1216, _1254);
    float _1264 = fma(_1250, _1216, _1256);
    float _1266 = _1098 * _1126;
    float _1268 = fma(_1258, _1216, _1260);
    float _1270 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1262);
    float _1272 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1264);
    float _1274 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1268);
    bool _1276 = !_1158;
    float _1292;
    if (!_1276)
    {
        float _1278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1280 = _746 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1282 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _1284 = _1282 * _1278;
        float _1286 = floor(_1284);
        float _1288 = -_1286;
        float _1290 = _1284 + _1288;
        _1292 = _1290;
        _1294 = true;
    }
    else
    {
        _1292 = _144;
    }
    _1294 = false;
    float _1296 = _1292;
    float _1298 = _1272 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1300 = _1270 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1304 = _1302 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1308 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1306;
    float _1310 = 1.0 / _1304;
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1314 = _1312 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1318 = _1316 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1320 = _1296 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1322 = isnan(_1296);
    bool _1324 = _1320 || _1322;
    bool _1326 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1328 = _1324 || _1326;
    float _1330 = float(_1328);
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1334 = _1332 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1336 = _1296 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1338 = isnan(_1296);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1344 = _1340 || _1342;
    float _1346 = float(_1344);
    float _1348 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1350 = 1.0 / _1314;
    float _1352 = -_1330;
    float _1354 = _1352 + 1.0;
    bool _1356 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1358 = _1308 * _1310;
    float _1360 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1362 = _1296 + _1360;
    float _1364 = 1.0 / _1318;
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1368 = _1366 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1370 = fma(_1358, _1362, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1372 = _1296 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1374 = isnan(_1296);
    bool _1376 = _1372 || _1374;
    bool _1378 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1380 = _1376 || _1378;
    float _1382 = float(_1380);
    bool _1384 = _1296 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1386 = isnan(_1296);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1392 = _1388 || _1390;
    float _1394 = float(_1392);
    float _1396 = _1368 * _1350;
    float _1398 = 1.0 / _1334;
    float _1400 = -_1382;
    float _1402 = _1400 + 1.0;
    float _1404 = _1382 * _1354;
    float _1406 = -_1394;
    float _1408 = _1406 + 1.0;
    float _1410 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1412 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1410;
    float _1414 = _1346 * _1402;
    float _1416 = _1330 * _1408;
    float _1418 = _1412 * _1364;
    float _1420 = _1370 * _1414;
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1424 = _1296 + _1422;
    float _1426 = -_1346;
    float _1428 = _1426 + 1.0;
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1432 = _1296 + _1430;
    bool _1434 = _1296 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1436 = isnan(_1296);
    bool _1438 = _1434 || _1436;
    bool _1440 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1442 = _1438 || _1440;
    float _1444 = float(_1442);
    float _1446 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1448 = _1446 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1450 = fma(_1396, _1424, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1452 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1420);
    float _1454 = fma(_1418, _1432, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1456 = _1448 * _1398;
    float _1458 = -_1444;
    float _1460 = _1458 + 1.0;
    float _1462 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1464 = _1296 + _1462;
    float _1466 = fma(_1450, _1404, _1452);
    float _1468 = _1394 * _1460;
    float _1470 = fma(_1456, _1464, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1472 = fma(_1454, _1416, _1466);
    float _1474 = _1274 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1476 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1478 = fma(_1470, _1468, _1472);
    float _1480 = _1474 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1482 = fma(_1444, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1478);
    float _1484 = _1482 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_67.x = _1348;
    out.m_67.y = _1476;
    out.m_67.z = _1480;
    out.m_67.w = _1484;
    bool _1486 = !_1356;
    float _1502;
    if (!_1486)
    {
        float _1488 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1490 = _746 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1492 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[11].z, _132);
        float _1494 = _1492 * _1488;
        float _1496 = floor(_1494);
        float _1498 = -_1496;
        float _1500 = _1494 + _1498;
        _1502 = _1500;
        _1504 = true;
    }
    else
    {
        _1502 = _144;
    }
    _1504 = false;
    float _1506 = _1502;
    float _1508 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1510 = _1506 + _1508;
    bool _1512 = _1506 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1514 = isnan(_1506);
    bool _1516 = _1512 || _1514;
    bool _1518 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1520 = _1516 || _1518;
    float _1522 = float(_1520);
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1524;
    bool _1528 = _1506 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1530 = isnan(_1506);
    bool _1532 = _1528 || _1530;
    bool _1534 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1536 = _1532 || _1534;
    float _1538 = float(_1536);
    float _1540 = -_1522;
    float _1542 = _1540 + 1.0;
    float _1544 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1546 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1544;
    float _1548 = 1.0 / _1526;
    bool _1550 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1552 = _1510 * _1548;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1554;
    float _1558 = _1538 * _1542;
    float _1560 = fma(_1546, _1552, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1562 = -_1538;
    float _1564 = _1562 + 1.0;
    float _1566 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1568 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1566;
    float _1570 = fma(_1556, _1552, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1572 = _1560 * _1558;
    float _1574 = fma(_1568, _1552, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1576 = _1570 * _1558;
    float _1578 = _1574 * _1558;
    float _1580 = fma(_1564, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1572);
    float _1582 = fma(_1564, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1576);
    float _1584 = fma(_1564, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1578);
    float _1586 = fma(_1522, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1580);
    float _1588 = fma(_1522, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1584);
    float _1590 = fma(_1522, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1582);
    bool _1592 = !_1550;
    float _1608;
    if (!_1592)
    {
        float _1594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1596 = _746 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1598 = fma(_1596, (*spvDescriptorSet0.vp_c9)._m0[11].w, _132);
        float _1600 = _1598 * _1594;
        float _1602 = floor(_1600);
        float _1604 = -_1602;
        float _1606 = _1600 + _1604;
        _1608 = _1606;
        _1610 = true;
    }
    else
    {
        _1608 = _144;
    }
    _1610 = false;
    float _1612 = _1608;
    float _1614 = in.m_65.y;
    float _1616 = _834 * _1266;
    float _1618 = _834 * _1162;
    float _1620 = _834 * _1192;
    float _1622 = in.m_65.z;
    float _1624 = in.m_65.w;
    float _1626 = -_408;
    float _1628 = _1626 + 1.0;
    float _1630 = _548 * _180;
    float _1632 = _548 * _168;
    float _1634 = _746 * 2.0;
    int _1636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1638 = _1636 != 0;
    float _1640 = _548 * _164;
    int _1642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1644 = _1642 != 0;
    float _1646 = floor(_1634);
    int _1648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1650 = _1648 != 0;
    float _1652 = fma(_546, _446, _1630);
    float _1654 = fma(_546, _438, _1640);
    float _1656 = fma(_550, _204, _1652);
    float _1658 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1660 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1662 = _1614 > 0.5;
    float _1664 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1666 = _1614 * 2.0;
    bool _1668 = _1622 > 0.5;
    float _1670 = _1622 * 2.0;
    int _1672 = _1662 ? as_type<int>(_1628) : as_type<int>(_408);
    float _1674 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1676 = _1668 ? as_type<int>(_1628) : as_type<int>(_408);
    float _1678 = fma(_550, _182, _1654);
    int _1680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1682 = _1680 != 0;
    float _1684 = _746 + _1622;
    float _1686 = _1638 ? as_type<float>(_1672) : _408;
    float _1688 = _1620 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1692 = _1690 != 0;
    int _1694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1696 = _1694 != 0;
    int _1698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1700 = _1698 != 0;
    float _1702 = _1684 + (-1.0);
    float _1704 = _1650 ? as_type<float>(_1676) : _408;
    float _1706 = fma(_546, _424, _1632);
    bool _1708 = _1624 > 0.5;
    float _1710 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1712 = log2(_1710);
    float _1714 = _746 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1716 = fma(_550, _184, _1706);
    float _1718 = _1634;
    bool _1720 = _1692;
    if (_1682)
    {
        _1718 = _746;
    }
    float _1722 = _1718;
    float _1724 = -_1660;
    float _1726 = fma(_1714, 2.0, _1724);
    float _1728 = _1722;
    if (!_1682)
    {
        _1728 = _1622;
    }
    float _1730 = _1728;
    float _1732 = _1614 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1734 = _1732;
    if (_1644)
    {
        float _1736 = _1708 ? _1628 : _408;
        _484 = _1736;
    }
    float _1738 = _484;
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1742 = _1646 > 0.0;
    float _1744 = _1730 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1746 = _1646 >= 0.0;
    bool _1748 = isnan(_1646);
    bool _1750 = _1746 || _1748;
    bool _1752 = isnan(0.0);
    bool _1754 = _1750 || _1752;
    float _1756 = fma(_1732, -2.0, _1664);
    float _1758 = _1744;
    float _1760 = _1646;
    if (!_1682)
    {
        _1734 = _1622;
    }
    float _1762 = _1734;
    float _1764 = -_1658;
    float _1766 = fma(_1744, 2.0, _1764);
    float _1768 = _1712 * _132;
    float _1770 = _1762;
    if (!_1682)
    {
        _1758 = _1614;
    }
    float _1772 = _1758;
    float _1774 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1756);
    float _1776 = _1754 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1778 = _746 + _1614;
    float _1780 = _1772;
    float _1782 = _1776;
    if (!_1682)
    {
        _1760 = _1772;
    }
    float _1784 = _1760;
    float _1786 = exp2(_1768);
    int _1788 = ~as_type<int>(_1776);
    int _1790 = _1788 + 1;
    int _1792 = _1790 + 1;
    float _1794 = _1778 + (-1.0);
    int _1796 = _1792;
    float _1798 = _1784;
    if (_1682)
    {
        _1780 = _1614;
    }
    float _1800 = _1780;
    float _1802 = _1716 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1804 = _1800;
    if (!_1742)
    {
        int _1806 = ~as_type<int>(_1776);
        int _1808 = _1806 + 1;
        _1796 = _1808;
    }
    int _1810 = _1796;
    float _1812 = _1656 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1814 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1816 = isnan(0.0);
    bool _1818 = _1814 || _1816;
    bool _1820 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1822 = _1818 || _1820;
    float _1824 = _1678 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (!_1682)
    {
        _1782 = _1622;
    }
    float _1826 = _1782;
    float _1828 = _1826;
    if (_1682)
    {
        _1770 = _1800;
    }
    float _1830 = _1770;
    if (_1682)
    {
        _1828 = _1800;
    }
    float _1832 = _1828;
    float _1834 = -_1786;
    float _1836 = _1834 + 1.0;
    if (!_1682)
    {
        _1804 = _746;
    }
    float _1838 = _1804;
    float _1840 = _1830 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1844 = _1822 ? _1836 : 0.0;
    float _1846 = _1838 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1848 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1850 = isnan(1.0);
    bool _1852 = _1848 || _1850;
    bool _1854 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1856 = _1852 || _1854;
    float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1860 = 1.0 + _1858;
    float _1862 = fma(_1832, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1740);
    float _1864 = fma(_1846, -2.0, _1842);
    if (_1682)
    {
        _1798 = _746;
    }
    float _1866 = _1798;
    float _1868 = fma(_1840, -2.0, _1674);
    float _1870 = 1.0 / _1860;
    float _1872 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1874 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1876 = _1874 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1878 = fma(_1866, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1872);
    float _1880 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1882 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1884 = _1866 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1888 = _1886 != 0;
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1892 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1894 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1896 = 1.0 / _1876;
    float _1898 = -_1882;
    float _1900 = fma(_1884, 2.0, _1898);
    float _1902 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1880);
    float _1904 = fma(_1614, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1890);
    float _1906 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1892);
    float _1908 = fma(_1614, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1894);
    float _1910 = -_132;
    float _1912 = fma(_1910, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1726);
    float _1914 = -_132;
    float _1916 = fma(_1914, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1766);
    float _1918 = floor(_1666);
    float _1920 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1902);
    float _1922 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1904);
    float _1924 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1906);
    float _1926 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1908);
    float _1928 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1878);
    float _1930 = -_132;
    float _1932 = fma(_1930, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1900);
    float _1934 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1862);
    float _1936 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1868);
    float _1938 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1864);
    if (_1856)
    {
        float _1940 = _1844 * _1870;
        _154 = _1940;
    }
    float _1942 = _154;
    float _1944 = floor(_1670);
    float _1946 = _1894;
    if (_1888)
    {
        float _1948 = in.m_65.z;
        _1946 = _1948;
    }
    float _1950 = _1946;
    float _1952 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1952;
    float _1956 = in.m_59.x;
    float _1958 = fma(_144, 0.4000000059604644775390625, 0.300000011920928955078125);
    float _1960 = _1954 * _1896;
    bool _1962 = !_1696;
    float _1964 = _1962 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1966 = _1918 >= 0.0;
    bool _1968 = isnan(_1918);
    bool _1970 = _1966 || _1968;
    bool _1972 = isnan(0.0);
    bool _1974 = _1970 || _1972;
    int _1976 = _1974 ? 0 : 1;
    bool _1978 = _1944 >= 0.0;
    bool _1980 = isnan(_1944);
    bool _1982 = _1978 || _1980;
    bool _1984 = isnan(0.0);
    bool _1986 = _1982 || _1984;
    float _1988 = fma(_1794, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1990 = _1614 + _1622;
    bool _1992 = !_1692;
    int _1994 = _1992 ? 0 : 1;
    int _1996 = _1986 ? 0 : 1;
    float _1998 = _1990 + (-1.0);
    bool _2000 = _1944 > 0.0;
    float _2002 = _740 * _740;
    float _2004 = _1964;
    if (_1888)
    {
        bool _2006 = _1950 > 0.5;
        _1720 = _2006;
    }
    bool _2008 = _1720;
    float _2010 = fma(_1998, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _2012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2014 = _2012 != 0;
    float _2016 = fma(_742, _742, _2002);
    float _2018 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2020 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2022 = _1612 + _2020;
    float _2024 = fma(_744, _744, _2016);
    int _2026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2028 = _2026 != 0;
    int _2030 = ~_1996;
    int _2032 = _2030 + 1;
    int _2034 = _2032 + 1;
    float _2036 = fma(_1702, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _2038 = _2034;
    if (!_2000)
    {
        int _2040 = ~_1996;
        int _2042 = _2040 + 1;
        _2038 = _2042;
    }
    int _2044 = _2038;
    float _2046 = rsqrt(_2024);
    bool _2048 = _1918 > 0.0;
    float _2050 = fma(_1960, _2022, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2052 = abs(as_type<int>(_1964));
    float _2054 = in.m_69.x;
    float _2056 = in.m_69.y;
    float _2058 = in.m_69.z;
    bool _2060 = _2048;
    if (!_2014)
    {
        _2004 = _1956;
    }
    float _2062 = _2004;
    int _2064 = abs(_1994);
    float _2066 = _2018 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2068 = _2018;
    float _2070 = _2062;
    if (!_2014)
    {
        _2068 = _2062;
    }
    float _2072 = _2068;
    float _2074 = _2072;
    if (_2014)
    {
        _2070 = _1956;
    }
    float _2076 = _2070;
    float _2078 = fma(_2066, _1686, -0.5);
    float _2080 = float(_2064);
    float _2082 = float(_2052);
    float _2084 = _2046 * _740;
    float _2086 = float(_1810);
    float _2088 = _2046 * _742;
    float _2090 = float(_2044);
    float _2092 = _2046 * _744;
    int _2094 = ~_1976;
    int _2096 = _2094 + 1;
    int _2098 = _2096 + 1;
    float _2100 = _2082 * _2086;
    int _2102 = _2098;
    float _2104 = _2076;
    if (!_2048)
    {
        int _2106 = ~_1976;
        int _2108 = _2106 + 1;
        _2102 = _2108;
    }
    int _2110 = _2102;
    float _2112 = _2080 * _2090;
    float _2114 = _746 + _2076;
    float _2116 = _2084 * _476;
    float _2118 = _2100 * (-2.0);
    float _2120 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2122 = _2114 * 6.283185482025146484375;
    float _2124 = fma(_2088, _470, _2116);
    float _2126 = fma(_2118, _2056, _2056);
    float _2128 = _1614 + _2076;
    float _2130 = fma(_2010, _2118, _2010);
    float _2132 = _2122 * 0.15915493667125701904296875;
    float _2134 = fma(_2092, _480, _2124);
    float _2136 = _1614 + (-0.5);
    float _2138 = _2128 * 18.84955596923828125;
    bool _2140 = !_1700;
    int _2142 = _2140 ? 0 : 1;
    float _2144 = _2132 * 6.283185482025146484375;
    float _2146 = sin(_2144);
    float _2148 = fma(_2136, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2126);
    float _2150 = abs(_2134);
    bool _2152 = _2150 > 0.99989998340606689453125;
    float _2154 = _2138 * 0.15915493667125701904296875;
    int _2156 = abs(_2142);
    float _2158 = fma(_2130, _1942, _2148);
    float _2160 = _2112 * (-2.0);
    float _2162 = float(_2110);
    float _2164 = _2154 * 6.283185482025146484375;
    float _2166 = sin(_2164);
    float _2168 = float(_2156);
    float _2170 = fma(_2160, _2054, _2054);
    float _2172 = _2146;
    if (_2014)
    {
        bool _2174 = _746 > 0.5;
        _2060 = _2174;
    }
    bool _2176 = _2060;
    float _2178 = _746 + (-0.5);
    float _2180 = _2120 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2182 = _2168 * _2162;
    float _2184 = fma(_1988, _2160, _1988);
    float _2186 = fma(_2178, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2170);
    float _2188 = fma(_1704, _2180, -0.5);
    float _2190 = _2182 * (-2.0);
    if (_2152)
    {
        float _2192 = fma(_536, 0.001000000047497451305389404296875, _470);
        _472 = _2192;
    }
    float _2194 = _472;
    float _2196 = fma(_2184, _1942, _2186);
    float _2198 = _1622 + (-0.5);
    float _2200 = fma(_2190, _2058, _2058);
    float _2202 = fma(_2036, _2190, _2036);
    float _2204 = _2166 * 0.125;
    float _2206 = in.m_71.x;
    float _2208 = in.m_71.y;
    float _2210 = in.m_71.z;
    float _2212 = fma(_2198, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2200);
    if (_2152)
    {
        float _2214 = fma(_544, 0.001000000047497451305389404296875, _480);
        _486 = _2214;
    }
    float _2216 = _486;
    float _2218 = fma(_2146, 0.5, _2204);
    float _2220 = -_2194;
    float _2222 = _2092 * _2220;
    float _2224 = fma(_2202, _1942, _2212);
    if (!_2152)
    {
        _2172 = _476;
    }
    float _2226 = _2172;
    float _2228 = _2218 + 0.625;
    float _2230 = _2226;
    if (_2152)
    {
        float _2232 = fma(_540, 0.001000000047497451305389404296875, _476);
        _2230 = _2232;
    }
    float _2234 = _2230;
    float _2236 = -_2216;
    float _2238 = -_2222;
    float _2240 = fma(_2088, _2236, _2238);
    float _2242 = _2224 * 0.15915493667125701904296875;
    float _2244 = _2228 * _1958;
    float _2246 = -_2216;
    float _2248 = _2084 * _2246;
    float _2250 = -_2234;
    float _2252 = _2088 * _2250;
    float _2254 = _2158 * 0.15915493667125701904296875;
    float _2256 = _2196 * 0.15915493667125701904296875;
    float _2258 = -_2234;
    float _2260 = -_2248;
    float _2262 = fma(_2092, _2258, _2260);
    float _2264 = _2240 * _2240;
    float _2266 = -_2194;
    float _2268 = -_2252;
    float _2270 = fma(_2084, _2266, _2268);
    float _2272 = _2254 * 6.283185482025146484375;
    float _2274 = sin(_2272);
    float _2276 = _1616 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2278 = fma(_2262, _2262, _2264);
    float _2280 = -_1774;
    float _2282 = fma(_1922, _2078, _2280);
    float _2284 = fma(_2206, _2244, _2206);
    float _2286 = fma(_2270, _2270, _2278);
    float _2288 = fma(_2208, _2244, _2208);
    float _2290 = _2254 * 6.283185482025146484375;
    float _2292 = cos(_2290);
    float _2294 = fma(_2210, _2244, _2210);
    float _2296 = _1618 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2298 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2284);
    float _2300 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2288);
    float _2302 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2294);
    float _2304 = _2276 * _2298;
    float _2306 = _2256 * 6.283185482025146484375;
    float _2308 = sin(_2306);
    float _2310 = _2296 * _2300;
    float _2312 = _1688 * _2302;
    float _2314 = _2256 * 6.283185482025146484375;
    float _2316 = cos(_2314);
    float _2318 = _2242 * 6.283185482025146484375;
    float _2320 = cos(_2318);
    float _2322 = _2308 * _2274;
    float _2324 = _2308 * _2292;
    float _2326 = _2242 * 6.283185482025146484375;
    float _2328 = sin(_2326);
    float _2330 = _2316 * _2292;
    float _2332 = _2316 * _2274;
    float _2334 = rsqrt(_2286);
    float _2336 = _2308 * _2320;
    float _2338 = _2292 * _2320;
    float _2340 = _2316 * _2320;
    float _2342 = _2274 * _2320;
    float _2344 = _2340 * _2092;
    float _2346 = fma(_2328, _2330, _2322);
    float _2348 = -_2332;
    float _2350 = fma(_2328, _2324, _2348);
    float _2352 = -_2324;
    float _2354 = fma(_2328, _2332, _2352);
    float _2356 = fma(_2328, _2322, _2330);
    float _2358 = _2346 * _2088;
    float _2360 = _2354 * _2088;
    float _2362 = _2354 * _2092;
    float _2364 = _2240 * _2334;
    float _2366 = _2262 * _2334;
    float _2368 = _2270 * _2334;
    float _2370 = _2340 * _2088;
    float _2372 = _2346 * _2092;
    float _2374 = fma(_2338, _2366, _2358);
    float _2376 = _2084 * _2368;
    float _2378 = -_2328;
    float _2380 = fma(_2378, _2366, _2370);
    float _2382 = _2088 * _2364;
    float _2384 = -_2328;
    float _2386 = fma(_2384, _2368, _2344);
    float _2388 = fma(_2342, _2366, _2360);
    float _2390 = -_2376;
    float _2392 = fma(_2092, _2364, _2390);
    float _2394 = fma(_2338, _2368, _2372);
    float _2396 = -_2382;
    float _2398 = fma(_2084, _2366, _2396);
    bool _2400 = _1612 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2402 = isnan(_1612);
    bool _2404 = _2400 || _2402;
    bool _2406 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2408 = _2404 || _2406;
    float _2410 = float(_2408);
    float _2412 = fma(_2350, _2392, _2374);
    float _2414 = fma(_2336, _2392, _2380);
    float _2416 = fma(_2356, _2392, _2388);
    float _2418 = fma(_2336, _2398, _2386);
    float _2420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2422 = fma(_2342, _2368, _2362);
    float _2424 = fma(_2350, _2398, _2394);
    float _2426 = _2310 * _2414;
    float _2428 = _2310 * _2418;
    bool _2430 = _1612 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2432 = isnan(_1612);
    bool _2434 = _2430 || _2432;
    bool _2436 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2438 = _2434 || _2436;
    float _2440 = float(_2438);
    float _2442 = -_2410;
    float _2444 = _2442 + 1.0;
    float _2446 = fma(_2356, _2398, _2422);
    float _2448 = fma(_2304, _2412, _2426);
    float _2450 = fma(_2304, _2424, _2428);
    float _2452 = _2440 * _2444;
    int _2454 = as_type<int>(_2398);
    int _2456 = as_type<int>(_2450);
    int _2458 = as_type<int>(_2426);
    float _2460 = _2312;
    float _2462 = _2354;
    if (_2014)
    {
        float _2464 = -_2076;
        float _2466 = _2464 + 1.0;
        _2454 = as_type<int>(_2466);
    }
    int _2468 = _2454;
    float _2470 = fma(_2312, _2416, _2448);
    float _2472 = fma(_2312, _2446, _2450);
    float _2474 = _2050 * _2452;
    float _2476 = as_type<float>(_2468);
    if (_2028)
    {
        float _2478 = -_2076;
        float _2480 = _2478 + 1.0;
        _2456 = as_type<int>(_2480);
    }
    int _2482 = _2456;
    float _2484 = _1802 + _2470;
    float _2486 = _1812 + _2472;
    float _2488 = _2420 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2490 = _2484;
    float _2492 = _2486;
    if (_2014)
    {
        float _2494 = _2176 ? as_type<float>(_2468) : _2076;
        _2074 = _2494;
    }
    float _2496 = _2074;
    float _2498 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2500 = _2484 + _2498;
    float _2502 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2504 = _2486 + _2502;
    float _2506 = fma(_2488, _1738, -0.5);
    if (!_2028)
    {
        _2476 = _2076;
    }
    float _2508 = _2476;
    float _2510 = _2500 * _2500;
    float _2512 = _2504 * _2504;
    float _2514 = _2508;
    float _2516 = _2510;
    float _2518 = _2512;
    if (_2028)
    {
        float _2520 = _1662 ? as_type<float>(_2482) : _2076;
        _2514 = _2520;
    }
    float _2522 = _2514;
    float _2524 = _2340 * _2084;
    float _2526 = _2092 * _2366;
    float _2528 = _2510 + _2512;
    float _2530 = _2346 * _2084;
    float _2532 = -_2328;
    float _2534 = fma(_2532, _2364, _2524);
    float _2536 = -_2526;
    float _2538 = fma(_2088, _2368, _2536);
    float _2540 = sqrt(_2528);
    float _2542 = _2354 * _2084;
    float _2544 = fma(_2338, _2364, _2530);
    float _2546 = fma(_2336, _2538, _2534);
    if (_1888)
    {
        float _2548 = -_2076;
        float _2550 = _2548 + 1.0;
        _2458 = as_type<int>(_2550);
    }
    int _2552 = _2458;
    float _2554 = fma(_2342, _2364, _2542);
    float _2556 = fma(_2350, _2538, _2544);
    float _2558 = _2310 * _2546;
    float _2560 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2562 = in.m_73.w;
    float _2564 = fma(_2356, _2538, _2554);
    float _2566 = fma(_2304, _2556, _2558);
    if (_1888)
    {
        float _2568 = _2008 ? as_type<float>(_2552) : _2076;
        _2104 = _2568;
    }
    float _2570 = _2104;
    float _2572 = -_2440;
    float _2574 = _2572 + 1.0;
    float _2576 = fma(_2312, _2564, _2566);
    float _2578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2580 = _2540 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2582 = fma(_2574, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2474);
    float _2584 = _1824 + _2576;
    float _2586 = fma(_2410, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2582);
    float _2588 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2590 = _2560 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2592 = fma(_2590, _2496, -0.5);
    if (!_2580)
    {
        _2460 = _2584;
    }
    float _2594 = _2460;
    float _2596 = _2578 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2598 = fma(_1920, _2592, _1912);
    float _2600 = fma(_2596, _2570, -0.5);
    float _2602 = _2588 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2604 = fma(_1928, _2600, _1932);
    float _2606 = fma(_2602, _2522, -0.5);
    bool _2608 = !_2580;
    float _2610 = _2594;
    if (!_2608)
    {
        float _2612 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2614 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2616 = _2540 + _2614;
        float _2618 = rsqrt(_2528);
        float _2620 = _2616 * _2612;
        float _2622 = _2584 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2624 = _2620 * 0.15915493667125701904296875;
        float _2626 = _2624 * 6.283185482025146484375;
        float _2628 = sin(_2626);
        float _2630 = _2624 * 6.283185482025146484375;
        float _2632 = cos(_2630);
        float _2634 = fma(_2628, _2622, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2636 = _2618 * _2634;
        float _2638 = _2632 + (-1.0);
        float _2640 = fma(_2500, _2636, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2642 = fma(_2504, _2636, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2644 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2648 = _2640 + _2646;
        float _2650 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2652 = _2642 + _2650;
        float _2654 = fma(_2584, _2632, _2644);
        float _2656 = _2648 * _2648;
        float _2658 = _2652 * _2652;
        _2610 = _2654;
        _2516 = _2656;
        _2518 = _2658;
        _2490 = _2640;
        _2492 = _2642;
    }
    float _2660 = _2610;
    float _2662 = _2516;
    float _2664 = _2518;
    float _2666 = _2490;
    float _2668 = _2492;
    float _2670 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2672 = _2660 + _2670;
    float _2674 = fma(_1924, _2606, _1916);
    float _2676 = -_1938;
    float _2678 = fma(_1926, _2188, _2676);
    float _2680 = -_1936;
    float _2682 = fma(_1934, _2506, _2680);
    float _2684 = fma(_2672, _2672, _2662);
    float _2686 = _1586 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2688 = _1588 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2690 = _1590 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2692 = _2684 + _2664;
    float _2694 = _2686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2696 = _2688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2698 = _2690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2700 = _2282 + 0.5;
    float _2702 = _2586 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2704 = sqrt(_2692);
    float _2706 = _2674 + 0.5;
    float _2708 = _2598 + 0.5;
    float _2710 = _2604 + 0.5;
    float _2712 = _2682 + 0.5;
    float _2714 = _2678 + 0.5;
    out.m_75.w = _2562;
    out.m_77.x = _2694;
    out.m_77.y = _2696;
    out.m_77.z = _2698;
    out.m_77.w = _2702;
    out.m_79.x = _2708;
    out.m_79.y = _2700;
    out.m_79.z = _2710;
    out.m_79.w = _2712;
    bool _2716 = _2704 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2718 = isnan(_2704);
    bool _2720 = _2716 || _2718;
    bool _2722 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2724 = _2720 || _2722;
    out.m_81.x = _2706;
    out.m_81.y = _2714;
    float _2726 = _2672;
    if (!_2724)
    {
        _2726 = 1.0;
    }
    float _2728 = _2726;
    bool _2730 = !_2724;
    float _2732 = _2728;
    if (!_2730)
    {
        bool _2734 = _2704 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2736 = isnan(_2704);
        bool _2738 = _2734 || _2736;
        bool _2740 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2742 = _2738 || _2740;
        if (!_2742)
        {
            float _2744 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2746 = _2704 + _2744;
            float _2748 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2750 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2748;
            float _2752 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2754 = _2752 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2756 = 1.0 / _2750;
            float _2758 = _2746 * _2756;
            float _2760 = fma(_2758, _2754, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2732 = _2760;
            _2762 = true;
        }
        else
        {
            bool _2764 = _2704 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2766 = isnan(_2704);
            bool _2768 = _2764 || _2766;
            bool _2770 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2772 = _2768 || _2770;
            if (!_2772)
            {
                float _2774 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2776 = _2704 + _2774;
                float _2778 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2780 = _2778 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2782 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2784 = _2782 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2786 = 1.0 / _2780;
                float _2788 = _2776 * _2786;
                float _2790 = fma(_2788, _2784, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2732 = _2790;
                _2762 = true;
            }
            else
            {
                _2732 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2762 = false;
    float _2792 = _2732;
    float _2794 = _1824 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2796 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2798 = _2660 + _2796;
    float _2800 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2794);
    float _2802 = fma(_2798, _2792, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    bool _2804 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2806 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2808 = _2804 || _2806;
    bool _2810 = isnan(0.5);
    bool _2812 = _2808 || _2810;
    float _2814 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2800);
    float _2816 = _1824 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2818 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2820 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2822 = _2818 || _2820;
    bool _2824 = isnan(0.5);
    bool _2826 = _2822 || _2824;
    float _2828 = _2814 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2830 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2816);
    float _2832 = 1.0 / _2828;
    float _2834 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2830);
    float _2836 = _2834 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2838 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2840 = _2798;
    float _2842 = _2802;
    if (_2826)
    {
        _2838 = 1.0;
    }
    float _2844 = _2838;
    float _2846 = _2836 + _2828;
    float _2848 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2850 = _2666 + _2848;
    float _2852 = fma(_2850, _2792, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2854 = _2846 * _2832;
    float _2856 = _2854 * 0.5;
    float _2858 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2860 = _2668 + _2858;
    float _2862 = _2850;
    float _2864 = _2860;
    float _2866 = _2856;
    float _2868 = _2844;
    if (_2812)
    {
        _2862 = _2852;
    }
    float _2870 = _2862;
    float _2872 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2874 = fma(_2856, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2872);
    float _2876 = fma(_2860, _2792, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2878 = _2870;
    if (_2812)
    {
        _2864 = _2802;
    }
    float _2880 = _2864;
    float _2882 = 1.0 / _2874;
    float _2884 = _2880;
    if (_2812)
    {
        _2866 = _2876;
    }
    float _2886 = _2866;
    float _2888 = _2886;
    if (!_2812)
    {
        float _2890 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2892 = _1824 + _2890;
        float _2894 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2896 = _1802 + _2894;
        float _2898 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2900 = _2892 * _2892;
        float _2902 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2904 = _1812 + _2902;
        float _2906 = fma(_2896, _2896, _2900);
        float _2908 = fma(_2904, _2904, _2906);
        float _2910 = -_1802;
        float _2912 = _2910 + _2852;
        float _2914 = -_1812;
        float _2916 = _2914 + _2876;
        float _2918 = sqrt(_2908);
        float _2920 = precise::min(_2918, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2922 = _2920 * _2898;
        float _2924 = -_1824;
        float _2926 = _2924 + _2802;
        float _2928 = fma(_2912, _2922, _1802);
        float _2930 = fma(_2926, _2922, _1824);
        float _2932 = fma(_2916, _2922, _1812);
        _2840 = _2922;
        _2884 = _2930;
        _2878 = _2928;
        _2888 = _2932;
    }
    float _2934 = _2840;
    float _2936 = _2884;
    float _2938 = _2878;
    float _2940 = _2888;
    float _2942 = _2934;
    if (_2826)
    {
        _2942 = 1.0;
    }
    float _2944 = _2942;
    float _2946 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2948 = _2882 * _2946;
    float _2950 = _2944;
    float _2952 = _2948;
    if (!_2826)
    {
        float _2954 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2956 = _2954 * 0.15915493667125701904296875;
        float _2958 = _2956 * 6.283185482025146484375;
        float _2960 = cos(_2958);
        float _2962 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2964 = _2962 * 0.15915493667125701904296875;
        float _2966 = _2956 * 6.283185482025146484375;
        float _2968 = sin(_2966);
        float _2970 = 1.0 / _2960;
        float _2972 = _2964 * 6.283185482025146484375;
        float _2974 = cos(_2972);
        float _2976 = _2968 * _2970;
        float _2978 = _2964 * 6.283185482025146484375;
        float _2980 = sin(_2978);
        float _2982 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2984 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2982;
        float _2986 = _2974 * _2976;
        float _2988 = 1.0 / _2984;
        float _2990 = 1.0 / _2986;
        float _2992 = _2980 * _2990;
        float _2994 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2996 = fma(_2948, _2992, _2994);
        float _2998 = _2996 * _2988;
        float _3000 = precise::clamp(_2998, 0.0, 1.0);
        _2842 = _2956;
        _2868 = _3000;
    }
    float _3002 = _2842;
    float _3004 = _2868;
    float _3006 = _3002;
    if (!_2826)
    {
        float _3008 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3010 = _3008 * 0.15915493667125701904296875;
        float _3012 = _3010 * 6.283185482025146484375;
        float _3014 = cos(_3012);
        float _3016 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3018 = _3016 * 0.15915493667125701904296875;
        float _3020 = _3010 * 6.283185482025146484375;
        float _3022 = sin(_3020);
        float _3024 = 1.0 / _3014;
        float _3026 = _3018 * 6.283185482025146484375;
        float _3028 = cos(_3026);
        float _3030 = _3022 * _3024;
        float _3032 = _3018 * 6.283185482025146484375;
        float _3034 = sin(_3032);
        float _3036 = _3028 * _3030;
        float _3038 = 1.0 / _3036;
        float _3040 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3042 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3040;
        float _3044 = 1.0 / _3042;
        float _3046 = _3034 * _3038;
        float _3048 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3050 = fma(_2948, _3046, _3048);
        float _3052 = _3050 * _3044;
        float _3054 = precise::clamp(_3052, 0.0, 1.0);
        float _3056 = -_3054;
        float _3058 = _3056 + 1.0;
        _3006 = _3036;
        _2950 = _3058;
    }
    float _3060 = _3006;
    float _3062 = _2950;
    float _3064 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3066 = _2936 + _3064;
    float _3068 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3070 = _2938 + _3068;
    float _3072 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3074 = _2940 + _3072;
    float _3076 = _3066 * _3066;
    float _3078 = fma(_3070, _3070, _3076);
    float _3080 = fma(_3074, _3074, _3078);
    float _3082 = rsqrt(_3080);
    float _3084 = _3082 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3086 = _3070 * _3084;
    float _3088 = _3074 * _3084;
    float _3090 = _3086 * _3086;
    float _3092 = _3088 * _3088;
    float _3094 = _3090 + _3092;
    float _3096 = sqrt(_3094);
    bool _3098 = _3096 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3100 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3102 = _3096 + _3100;
    float _3104 = _3074;
    float _3106 = _3060;
    float _3108 = _3102;
    float _3110 = _3066;
    float _3112 = _3086;
    if (_3098)
    {
        float _3114 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3104 = _3114;
    }
    float _3116 = _3104;
    if (_3098)
    {
        float _3118 = rsqrt(_3094);
        _3106 = _3118;
    }
    float _3120 = _3106;
    float _3122 = _3120;
    if (_3098)
    {
        float _3124 = _3102 * _3116;
        _3108 = _3124;
    }
    float _3126 = _3108;
    if (_3098)
    {
        float _3128 = _3126 * 0.15915493667125701904296875;
        _2952 = _3128;
    }
    float _3130 = _2952;
    float _3132 = _3076;
    if (_3098)
    {
        float _3134 = _3130 * 6.283185482025146484375;
        float _3136 = sin(_3134);
        _3132 = _3136;
    }
    float _3138 = _3132;
    float _3140 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3142 = precise::max(0.0, _3140);
    float _3144 = _3082;
    float _3146 = _3140;
    float _3148 = _3142;
    if (_3098)
    {
        float _3150 = _3130 * 6.283185482025146484375;
        float _3152 = cos(_3150);
        _3144 = _3152;
    }
    float _3154 = _3144;
    float _3156 = -_3084;
    float _3158 = -_3142;
    float _3160 = fma(_3066, _3156, _3158);
    float _3162 = _3160;
    if (!_3098)
    {
        _3110 = _3092;
    }
    float _3164 = _3110;
    float _3166 = _3164;
    if (_3098)
    {
        float _3168 = _3160 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3146 = _3168;
    }
    float _3170 = _3146;
    float _3172 = _3138;
    float _3174 = _3170;
    if (_3098)
    {
        float _3176 = fma(_3138, _3170, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3172 = _3176;
    }
    float _3178 = _3172;
    if (_3098)
    {
        float _3180 = _3154 + (-1.0);
        _3174 = _3180;
    }
    float _3182 = _3174;
    float _3184 = _3182;
    if (_3098)
    {
        float _3186 = _3120 * _3178;
        _2462 = _3186;
    }
    float _3188 = _2462;
    if (!_3098)
    {
        _3122 = _3088;
    }
    float _3190 = _3122;
    float _3192 = sqrt(_3080);
    float _3194 = _3190;
    if (_3098)
    {
        float _3196 = _3182 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3148 = _3196;
    }
    float _3198 = _3148;
    if (_3098)
    {
        float _3200 = _3086 * _3188;
        _3112 = _3200;
    }
    float _3202 = _3112;
    if (!_3098)
    {
        _3184 = _3090;
    }
    float _3204 = _3184;
    float _3206 = _3204;
    if (_3098)
    {
        float _3208 = _3088 * _3188;
        _3194 = _3208;
    }
    float _3210 = _3194;
    if (_3098)
    {
        float _3212 = fma(_3160, _3154, _3198);
        _3162 = _3212;
    }
    float _3214 = _3162;
    if (_3098)
    {
        float _3216 = _3202 * _3202;
        _3206 = _3216;
    }
    float _3218 = _3206;
    if (_3098)
    {
        float _3220 = _3210 * _3210;
        _3166 = _3220;
    }
    float _3222 = _3166;
    float _3224 = _2936 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3226 = fma(_3214, _3214, _3218);
    float _3228 = _2936 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3230 = _3226 + _3222;
    float _3232 = fma(_2938, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3228);
    float _3234 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3236 = fma(_3192, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3234);
    float _3238 = precise::clamp(_3236, 0.0, 1.0);
    float _3240 = rsqrt(_3230);
    float _3242 = _2936 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3244 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3246 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3232);
    float _3248 = -_3238;
    float _3250 = _3248 + 1.0;
    float _3252 = _2936 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3254 = fma(_2938, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3242);
    float _3256 = _3246 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3258 = abs(_3250);
    float _3260 = log2(_3258);
    float _3262 = fma(_2938, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3252);
    float _3264 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3254);
    float _3266 = _3256 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3268 = fma(_2938, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3224);
    float _3270 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3262);
    float _3272 = _3264 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3274 = _3240 * _3202;
    float _3276 = -_3266;
    float _3278 = fma(_3276, _3244, 1.0);
    float _3280 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3268);
    float _3282 = _3270 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3284 = _3272 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3286 = _3240 * _3214;
    float _3288 = _3274 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3290 = _3280 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3292 = fma(_3282, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3284);
    float _3294 = _3240 * _3210;
    float _3296 = -_3288;
    float _3298 = fma(_3286, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3296);
    float _3300 = _3260 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3302 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3292);
    float _3304 = log2(_3278);
    float _3306 = -_3294;
    float _3308 = fma(_3306, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3298);
    float _3310 = _3272 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3312 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3302);
    float _3314 = _3272 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3316 = fma(_3308, -0.5, 0.5);
    float _3318 = fma(_3282, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3310);
    float _3320 = fma(_3308, 0.5, 0.5);
    float _3322 = exp2(_3300);
    float _3324 = fma(_3282, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3314);
    float _3326 = _3286 + 1.0;
    float _3328 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3318);
    float _3330 = fma(_3320, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3332 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3324);
    float _3334 = 1.0 / _3312;
    float _3336 = fma(_3320, _3330, -0.212114393711090087890625);
    float _3338 = _3304 * 0.693147182464599609375;
    float _3340 = fma(_3320, _3336, 1.570728778839111328125);
    float _3342 = _3338 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3344 = sqrt(_3316);
    float _3346 = -_3286;
    float _3348 = fma(_3322, _3326, _3346);
    float _3350 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3328);
    float _3352 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3332);
    float _3354 = fma(_3348, 0.5, 0.5);
    float _3356 = _3350 * _3334;
    float _3358 = _3352 * _3334;
    float _3360 = fma(_3356, 0.5, 0.5);
    float _3362 = fma(_3358, -0.5, 0.5);
    float _3364 = _3344 * 0.636619746685028076171875;
    float3 _8662 = float3(_3360, _3362, _3342);
    float _3366 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8662, float3(0.0), isnan(_8662)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8662, float3(0.0), isnan(_8662)), level(0.0)).x;
    float _3368 = -_3340;
    float _3370 = fma(_3364, _3368, 1.0);
    float3 _8678 = float3(_3360, _3362, _3342);
    float4 _3373 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8678, float3(0.0), isnan(_8678)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8678, float3(0.0), isnan(_8678)), level(0.0)).xyzw;
    float _3375 = _3373.x;
    float _3377 = _3373.y;
    float _3379 = _3373.z;
    float _3381 = _3373.w;
    float2 _8695 = float2(_3370, _3354);
    float3 _3385 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8695, float2(0.0), isnan(_8695)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8695, float2(0.0), isnan(_8695)), level(0.0)).xyz;
    float _3387 = _3385.x;
    float _3389 = _3385.y;
    float _3391 = _3385.z;
    float _3393 = _3260 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3395 = _3272 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3397 = _3004 * _3062;
    bool _3399 = _3004 > 0.0;
    bool _3401 = isnan(_3004);
    bool _3403 = _3399 || _3401;
    bool _3405 = isnan(0.0);
    bool _3407 = _3403 || _3405;
    float _3409 = _3312 * 0.5;
    float _3411 = fma(_3282, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3395);
    float _3413 = exp2(_3393);
    bool _3415 = _3062 <= 0.0;
    bool _3417 = !_3407;
    bool _3419 = _3415 || _3417;
    float _3421 = _3397 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3423 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3411);
    float _3425 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3423);
    float _3427 = _3350 + _3312;
    float _3429 = fma(_3352, -0.5, _3409);
    float _3431 = _3421 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3433 = _3425 + _3312;
    out.gl_Position.x = _3350;
    out.gl_Position.y = _3352;
    out.gl_Position.z = _3425;
    out.gl_Position.w = _3312;
    float _3435 = _3427 * 0.5;
    float _3437 = _3433 * 0.5;
    float _3439 = -_3413;
    float _3441 = _3439 + 1.0;
    out.m_47.x = _3431;
    float _3443 = _3441 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _3435;
    out.m_83.y = _3429;
    out.m_83.z = _3437;
    out.m_83.w = _3312;
    float _3445 = -_3443;
    float _3447 = _3445 + 1.0;
    float _3449 = _3443 * _3366;
    float _3451 = _3381 * _3449;
    float _3453 = _3391 * _3449;
    float _3455 = fma(_3387, _3451, _3375);
    float _3457 = fma(_3389, _3451, _3377);
    float _3459 = _3381 * _3447;
    float _3461 = fma(_3381, _3453, _3379);
    out.m_85.x = _3455;
    out.m_85.y = _3457;
    out.m_85.z = _3461;
    out.m_85.w = _3459;
    if (!_3419)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _3463 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3463;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2762 = false;
    bool _1610 = false;
    bool _1504 = false;
    bool _1294 = false;
    bool _1122 = false;
    bool _854 = false;
    bool _608 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    float _112 = as_type<float>(_104);
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _110;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3521 = as_type<float>(_120);
        out.gl_Position.z = _3521;
    }
    if (!_108)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _124 = in.m_49.w;
    float _126 = float(_104);
    float _128 = 1.0 / _126;
    float _130 = -_124;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_124);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = _132 * _128;
    bool _146 = _132 >= _126;
    bool _148 = !_142;
    bool _150 = _146 || _148;
    out.m_51.x = _144;
    float _152 = 0.0;
    float _154 = _132;
    if (_150)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _112;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _158 = _156 * 5.0;
        _122 = as_type<int>(_158);
    }
    int _160 = _122;
    float _162 = as_type<float>(_160);
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3594 = as_type<float>(_160);
        out.gl_Position.z = _3594;
    }
    if (_150)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _164 = in.m_53.y;
    float _166 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _168 = in.m_55.y;
    bool _170 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _172 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _174 = _170 || _172;
    bool _176 = isnan(1.0);
    bool _178 = _174 || _176;
    float _180 = in.m_57.y;
    float _182 = in.m_53.z;
    float _184 = in.m_55.z;
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
        float _198 = _132 * _132;
        float _200 = _198 * 0.5;
        _194 = _200;
    }
    float _202 = _194;
    float _204 = in.m_57.z;
    if (!_178)
    {
        float _206 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _206;
    }
    float _208 = _196;
    float _210 = _164 * _164;
    float _212 = fma(_168, _168, _210);
    float _214 = fma(_180, _180, _212);
    float _216 = in.m_49.x;
    float _218 = in.m_49.y;
    float _220 = in.m_49.z;
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
        _152 = _254;
        _232 = _264;
    }
    float _266 = _152;
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
    float _302 = _296;
    if (!_178)
    {
        _300 = _132;
    }
    float _304 = _300;
    float _306 = _304;
    if (!_178)
    {
        float _308 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _234 = _308;
    }
    float _310 = _234;
    bool _312 = !_178;
    float _314 = _310;
    if (!_312)
    {
        float _316 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _318 = log2(_316);
        float _320 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _322 = _320 + 1.0;
        float _324 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _326 = _132 * _318;
        float _328 = 1.0 / _322;
        float _330 = _324 * 0.693147182464599609375;
        float _332 = exp2(_326);
        float _334 = 1.0 / _330;
        float _336 = _332 + (-1.0);
        float _338 = -_336;
        float _340 = fma(_338, _334, _132);
        float _342 = _340 * _328;
        float _344 = _342 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _314 = _344;
    }
    float _346 = _314;
    bool _348 = !_178;
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
        _306 = _368;
    }
    float _370 = _306;
    float _372 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _374 = _346 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _376 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _378 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _380 = fma(_296, _218, _372);
    float _382 = _346 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _384 = fma(_370, _218, _374);
    float _386 = fma(_296, _216, _376);
    float _388 = _346 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _390 = fma(_370, _216, _382);
    float _392 = -_384;
    float _394 = _380 + _392;
    float _396 = sqrt(_298);
    float _398 = fma(_370, _220, _388);
    float _400 = fma(_296, _220, _378);
    float _402 = -_390;
    float _404 = _386 + _402;
    float _406 = _394 * _394;
    float _408 = in.m_59.y;
    float _410 = -_398;
    float _412 = _400 + _410;
    float _414 = 0.0;
    float _416 = _384;
    float _418 = _386;
    if (!_224)
    {
        _414 = 0.0;
    }
    float _420 = _414;
    float _422 = fma(_404, _404, _406);
    float _424 = in.m_55.x;
    float _426 = 0.0;
    float _428 = _420;
    if (_224)
    {
        float _430 = rsqrt(_214);
        _426 = _430;
    }
    float _432 = _426;
    if (!_224)
    {
        _302 = 0.0;
    }
    float _434 = _302;
    float _436 = fma(_412, _412, _422);
    float _438 = in.m_53.x;
    float _440 = _394 * _164;
    float _442 = _394 * _180;
    bool _444 = _396 > 0.0;
    float _446 = in.m_57.x;
    float _448 = sqrt(_436);
    float _450 = _396;
    float _452 = _434;
    if (!_224)
    {
        _450 = 0.0;
    }
    float _454 = _450;
    float _456 = in.m_61.w;
    float _458 = in.m_44.x;
    float _460 = in.m_44.y;
    float _462 = in.m_44.z;
    float _464 = _454;
    float _466 = _456;
    if (_224)
    {
        float _468 = _432 * _168;
        _464 = _468;
    }
    float _470 = _464;
    float _472 = _470;
    if (_224)
    {
        float _474 = _432 * _164;
        _428 = _474;
    }
    float _476 = _428;
    if (_224)
    {
        float _478 = _432 * _180;
        _452 = _478;
    }
    float _480 = _452;
    out.m_63.y = _408;
    float _482 = _298;
    float _484 = _408;
    float _486 = _480;
    if (_444)
    {
        float _488 = rsqrt(_298);
        _482 = _488;
    }
    float _490 = _482;
    float _492 = _394 * _168;
    float _494 = 0.0;
    if (!_444)
    {
        _494 = 0.0;
    }
    float _496 = _494;
    bool _498 = _448 >= 9.9999999747524270787835121154785e-07;
    bool _500 = isnan(_448);
    bool _502 = _498 || _500;
    bool _504 = isnan(9.9999999747524270787835121154785e-07);
    bool _506 = _502 || _504;
    float _508 = fma(_404, _424, _492);
    float _510 = _448;
    float _512 = _496;
    if (!_444)
    {
        _510 = 0.0;
    }
    float _514 = _510;
    float _516 = fma(_404, _438, _440);
    float _518 = _514;
    if (!_444)
    {
        _416 = 0.0;
    }
    float _520 = _416;
    float _522 = fma(_412, _184, _508);
    float _524 = fma(_404, _446, _442);
    float _526 = fma(_412, _182, _516);
    float _528 = fma(_412, _204, _524);
    float _530 = _520;
    float _532 = _522;
    if (_444)
    {
        float _534 = _490 * _184;
        _512 = _534;
    }
    float _536 = _512;
    if (_444)
    {
        float _538 = _490 * _182;
        _518 = _538;
    }
    float _540 = _518;
    if (_444)
    {
        float _542 = _490 * _204;
        _530 = _542;
    }
    float _544 = _530;
    float _546 = fma(_386, _456, _458);
    float _548 = fma(_380, _456, _460);
    float _550 = fma(_400, _456, _462);
    if (_506)
    {
        _418 = _522;
    }
    float _552 = _418;
    float _554 = _552;
    float _556 = _552;
    if (_506)
    {
        _466 = _526;
    }
    float _558 = _466;
    float _560 = _558;
    float _562 = _558;
    if (_506)
    {
        _532 = _528;
    }
    float _564 = _532;
    float _566 = _564;
    float _568 = _564;
    if (!_506)
    {
        bool _570 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _572 = !_570;
        if (!_572)
        {
            float _574 = _164 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _576 = _168 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _578 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _580 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[16].x, _574);
            float _582 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[16].x, _576);
            float _584 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[16].x, _578);
            float _586 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[16].z, _580);
            float _588 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[16].z, _582);
            float _590 = fma(_204, (*spvDescriptorSet0.vp_c9)._m0[16].z, _584);
            float _592 = _586 * _586;
            float _594 = fma(_588, _588, _592);
            float _596 = fma(_590, _590, _594);
            float _598 = rsqrt(_596);
            float _600 = _598 * 9.9999999747524270787835121154785e-07;
            float _602 = _588 * _600;
            float _604 = _586 * _600;
            float _606 = _590 * _600;
            _562 = _604;
            _556 = _602;
            _568 = _606;
            _608 = true;
        }
        else
        {
            float _610 = _218 * _218;
            float _612 = fma(_216, _216, _610);
            float _614 = fma(_220, _220, _612);
            float _616 = sqrt(_614);
            bool _618 = _616 >= 9.9999999747524270787835121154785e-07;
            bool _620 = isnan(_616);
            bool _622 = _618 || _620;
            bool _624 = isnan(9.9999999747524270787835121154785e-07);
            bool _626 = _622 || _624;
            if (!_626)
            {
                float _628 = _460 * _460;
                float _630 = fma(_458, _458, _628);
                float _632 = fma(_462, _462, _630);
                float _634 = sqrt(_632);
                bool _636 = _634 >= 9.9999999747524270787835121154785e-07;
                bool _638 = isnan(_634);
                bool _640 = _636 || _638;
                bool _642 = isnan(9.9999999747524270787835121154785e-07);
                bool _644 = _640 || _642;
                float _646 = _214;
                if (!_644)
                {
                    float _648 = rsqrt(_214);
                    _646 = _648;
                }
                float _650 = _646;
                if (!_644)
                {
                    float _652 = _650 * 9.9999999747524270787835121154785e-07;
                    _566 = _652;
                }
                float _654 = _566;
                float _656 = _654;
                if (!_644)
                {
                    float _658 = _168 * _654;
                    _554 = _658;
                }
                float _660 = _554;
                _556 = _660;
                if (!_644)
                {
                    float _662 = _164 * _654;
                    _560 = _662;
                }
                float _664 = _560;
                _562 = _664;
                if (!_644)
                {
                    float _666 = _180 * _654;
                    _656 = _666;
                }
                float _668 = _656;
                bool _670 = !_644;
                _568 = _668;
                _608 = _670;
                if (!_608)
                {
                    float _672 = _164 * _460;
                    float _674 = _168 * _460;
                    float _676 = _180 * _460;
                    float _678 = fma(_458, _438, _672);
                    float _680 = fma(_458, _424, _674);
                    float _682 = fma(_458, _446, _676);
                    float _684 = fma(_182, _462, _678);
                    float _686 = fma(_184, _462, _680);
                    float _688 = fma(_204, _462, _682);
                    float _690 = _684 * _684;
                    float _692 = fma(_686, _686, _690);
                    float _694 = fma(_688, _688, _692);
                    float _696 = rsqrt(_694);
                    float _698 = _696 * 9.9999999747524270787835121154785e-07;
                    float _700 = _686 * _698;
                    float _702 = _684 * _698;
                    float _704 = _688 * _698;
                    _562 = _702;
                    _556 = _700;
                    _568 = _704;
                    _608 = true;
                }
            }
            else
            {
                float _706 = _164 * _218;
                float _708 = _168 * _218;
                float _710 = _180 * _218;
                float _712 = fma(_216, _438, _706);
                float _714 = fma(_216, _424, _708);
                float _716 = fma(_216, _446, _710);
                float _718 = fma(_182, _220, _712);
                float _720 = fma(_184, _220, _714);
                float _722 = fma(_204, _220, _716);
                float _724 = _718 * _718;
                float _726 = fma(_720, _720, _724);
                float _728 = fma(_722, _722, _726);
                float _730 = rsqrt(_728);
                float _732 = _730 * 9.9999999747524270787835121154785e-07;
                float _734 = _720 * _732;
                float _736 = _718 * _732;
                float _738 = _722 * _732;
                _562 = _736;
                _556 = _734;
                _568 = _738;
            }
        }
    }
    _608 = false;
    float _740 = _562;
    float _742 = _556;
    float _744 = _568;
    float _746 = in.m_65.x;
    float _748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _750 = _132 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _754 = _752 != 0;
    int _756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _758 = _756 != 0;
    int _760 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _762 = _760 != 0;
    float _764 = _750 * _748;
    float _766 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[20].x, _764);
    float _768 = _766 * 6.283185482025146484375;
    float _770 = floor(_766);
    float _772 = _768 * 0.15915493667125701904296875;
    bool _774 = !_754;
    int _776 = _774 ? 0 : 1;
    int _778 = abs(_776);
    float _780 = _772 * 6.283185482025146484375;
    float _782 = cos(_780);
    bool _784 = !_762;
    int _786 = _784 ? 0 : 1;
    bool _788 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _790 = abs(_786);
    float _792 = -_770;
    float _794 = _766 + _792;
    bool _796 = !_758;
    int _798 = _796 ? 0 : 1;
    float _800 = float(_778);
    int _802 = abs(_798);
    float _804 = -_794;
    float _806 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _808 = fma(_782, 0.5, 0.5);
    float _810 = abs(_806);
    float _812 = _800 * _810;
    bool _814 = _794 < 0.5;
    float _816 = float(_814);
    float _818 = float(_790);
    float _820 = -_808;
    float _822 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _824 = float(_802);
    float _826 = -_816;
    float _828 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _830 = fma(_818, _822, _812);
    float _832 = abs(_828);
    float _834 = fma(_824, _832, _830);
    bool _836 = !_788;
    float _852;
    if (!_836)
    {
        float _838 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _840 = _746 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _842 = fma(_840, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _844 = _842 * _838;
        float _846 = floor(_844);
        float _848 = -_846;
        float _850 = _844 + _848;
        _852 = _850;
        _854 = true;
    }
    else
    {
        _852 = _144;
    }
    _854 = false;
    float _856 = _852;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _860 = _856 + _858;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _864 = _856 + _862;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _868 = _856 + _866;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _870;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _876 = _874 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _878;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _886 = 1.0 / _872;
    bool _888 = _856 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _890 = isnan(_856);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    float _900 = 1.0 / _876;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _904 = _856 + _902;
    bool _906 = _856 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _908 = isnan(_856);
    bool _910 = _906 || _908;
    bool _912 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _914 = _910 || _912;
    float _916 = float(_914);
    float _918 = 1.0 / _884;
    float _920 = _868 * _886;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _922;
    bool _926 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _928 = fma(_924, _920, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _930 = 1.0 / _880;
    float _932 = _860 * _900;
    float _934 = _904 * _918;
    bool _936 = _856 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _938 = isnan(_856);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _944 = _940 || _942;
    float _946 = float(_944);
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _950 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _948;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _954 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _952;
    float _956 = -_946;
    float _958 = _956 + 1.0;
    float _960 = fma(_954, _920, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _962 = _864 * _930;
    bool _964 = _856 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _966 = isnan(_856);
    bool _968 = _964 || _966;
    bool _970 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _972 = _968 || _970;
    float _974 = float(_972);
    float _976 = _974 * _958;
    float _978 = -_974;
    float _980 = _978 + 1.0;
    float _982 = fma(_950, _920, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _984 = _856 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _986 = isnan(_856);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _992 = _988 || _990;
    float _994 = float(_992);
    float _996 = -_898;
    float _998 = _996 + 1.0;
    float _1000 = _898 * _980;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1004 = _1002 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1008 = _1006 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1010 = -_994;
    float _1012 = _1010 + 1.0;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _1016 = _1014 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _1018 = _994 * _998;
    float _1020 = fma(_1008, _932, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1022 = _916 * _1012;
    float _1024 = fma(_1004, _932, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1026 = fma(_1016, _932, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _1028 = _928 * _1022;
    float _1030 = _982 * _1022;
    float _1032 = -_916;
    float _1034 = _1032 + 1.0;
    float _1036 = _960 * _1022;
    float _1038 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1038;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1042;
    float _1046 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1030);
    float _1048 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1036);
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _1050;
    float _1054 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[143].z, _1028);
    float _1056 = fma(_1040, _962, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1058 = fma(_1044, _962, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1060 = fma(_1020, _1018, _1046);
    float _1062 = fma(_1024, _1018, _1048);
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1066 = _1064 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1070 = _1068 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1072 = fma(_1052, _962, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _1074 = fma(_1026, _1018, _1054);
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _1078 = _1076 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _1080 = fma(_1056, _1000, _1060);
    float _1082 = fma(_1066, _934, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _1084 = fma(_1070, _934, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1086 = fma(_1058, _1000, _1062);
    float _1088 = fma(_1078, _934, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _1090 = fma(_1072, _1000, _1074);
    float _1092 = fma(_1082, _976, _1080);
    float _1094 = fma(_1084, _976, _1086);
    float _1096 = fma(_1088, _976, _1090);
    float _1098 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1092);
    float _1100 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1094);
    float _1102 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[147].z, _1096);
    bool _1104 = !_926;
    float _1120;
    if (!_1104)
    {
        float _1106 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _1108 = _746 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _1110 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[11].x, _132);
        float _1112 = _1110 * _1106;
        float _1114 = floor(_1112);
        float _1116 = -_1114;
        float _1118 = _1112 + _1116;
        _1120 = _1118;
        _1122 = true;
    }
    else
    {
        _1120 = _144;
    }
    _1122 = false;
    float _1124 = _1120;
    float _1126 = in.m_61.x;
    float _1128 = in.m_61.y;
    float _1130 = in.m_61.z;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1134 = _1124 + _1132;
    bool _1136 = _1124 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1138 = isnan(_1124);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1144 = _1140 || _1142;
    float _1146 = float(_1144);
    float _1148 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1150 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1148;
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1154 = _1152 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1156 = 1.0 / _1154;
    bool _1158 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _1160 = 1.0 / _1150;
    float _1162 = _1100 * _1128;
    bool _1164 = _1124 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1166 = isnan(_1124);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1172 = _1168 || _1170;
    float _1174 = float(_1172);
    float _1176 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1178 = _1124 + _1176;
    bool _1180 = _1124 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1182 = isnan(_1124);
    bool _1184 = _1180 || _1182;
    bool _1186 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1188 = _1184 || _1186;
    float _1190 = float(_1188);
    float _1192 = _1102 * _1130;
    float _1194 = _1178 * _1156;
    float _1196 = -_1146;
    float _1198 = _1196 + 1.0;
    float _1200 = -_1190;
    float _1202 = _1200 + 1.0;
    float _1204 = _1134 * _1160;
    float _1206 = -_1174;
    float _1208 = _1206 + 1.0;
    float _1210 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1210;
    float _1214 = _1146 * _1202;
    float _1216 = _1190 * _1208;
    float _1218 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1220 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1218;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1222;
    float _1226 = fma(_1212, _1204, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1228 = fma(_1220, _1204, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1230 = fma(_1224, _1204, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1232 = _1226 * _1214;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1236 = _1234 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1238 = _1228 * _1214;
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1242 = _1240 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1244 = _1230 * _1214;
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1248 = _1246 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1250 = fma(_1236, _1194, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1252 = fma(_1242, _1194, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1254 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1238);
    float _1256 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1232);
    float _1258 = fma(_1248, _1194, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1260 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1244);
    float _1262 = fma(_1252, _1216, _1254);
    float _1264 = fma(_1250, _1216, _1256);
    float _1266 = _1098 * _1126;
    float _1268 = fma(_1258, _1216, _1260);
    float _1270 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[109].x, _1262);
    float _1272 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[109].y, _1264);
    float _1274 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[109].z, _1268);
    bool _1276 = !_1158;
    float _1292;
    if (!_1276)
    {
        float _1278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1280 = _746 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1282 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _1284 = _1282 * _1278;
        float _1286 = floor(_1284);
        float _1288 = -_1286;
        float _1290 = _1284 + _1288;
        _1292 = _1290;
        _1294 = true;
    }
    else
    {
        _1292 = _144;
    }
    _1294 = false;
    float _1296 = _1292;
    float _1298 = _1272 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1300 = _1270 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1304 = _1302 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1308 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1306;
    float _1310 = 1.0 / _1304;
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1314 = _1312 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1318 = _1316 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1320 = _1296 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1322 = isnan(_1296);
    bool _1324 = _1320 || _1322;
    bool _1326 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1328 = _1324 || _1326;
    float _1330 = float(_1328);
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1334 = _1332 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1336 = _1296 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1338 = isnan(_1296);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1344 = _1340 || _1342;
    float _1346 = float(_1344);
    float _1348 = _1300 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1350 = 1.0 / _1314;
    float _1352 = -_1330;
    float _1354 = _1352 + 1.0;
    bool _1356 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1358 = _1308 * _1310;
    float _1360 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1362 = _1296 + _1360;
    float _1364 = 1.0 / _1318;
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1368 = _1366 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1370 = fma(_1358, _1362, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1372 = _1296 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1374 = isnan(_1296);
    bool _1376 = _1372 || _1374;
    bool _1378 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1380 = _1376 || _1378;
    float _1382 = float(_1380);
    bool _1384 = _1296 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1386 = isnan(_1296);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1392 = _1388 || _1390;
    float _1394 = float(_1392);
    float _1396 = _1368 * _1350;
    float _1398 = 1.0 / _1334;
    float _1400 = -_1382;
    float _1402 = _1400 + 1.0;
    float _1404 = _1382 * _1354;
    float _1406 = -_1394;
    float _1408 = _1406 + 1.0;
    float _1410 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1412 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1410;
    float _1414 = _1346 * _1402;
    float _1416 = _1330 * _1408;
    float _1418 = _1412 * _1364;
    float _1420 = _1370 * _1414;
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1424 = _1296 + _1422;
    float _1426 = -_1346;
    float _1428 = _1426 + 1.0;
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1432 = _1296 + _1430;
    bool _1434 = _1296 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1436 = isnan(_1296);
    bool _1438 = _1434 || _1436;
    bool _1440 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1442 = _1438 || _1440;
    float _1444 = float(_1442);
    float _1446 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1448 = _1446 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1450 = fma(_1396, _1424, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1452 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1420);
    float _1454 = fma(_1418, _1432, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1456 = _1448 * _1398;
    float _1458 = -_1444;
    float _1460 = _1458 + 1.0;
    float _1462 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1464 = _1296 + _1462;
    float _1466 = fma(_1450, _1404, _1452);
    float _1468 = _1394 * _1460;
    float _1470 = fma(_1456, _1464, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1472 = fma(_1454, _1416, _1466);
    float _1474 = _1274 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1476 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1478 = fma(_1470, _1468, _1472);
    float _1480 = _1474 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1482 = fma(_1444, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1478);
    float _1484 = _1482 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_67.x = _1348;
    out.m_67.y = _1476;
    out.m_67.z = _1480;
    out.m_67.w = _1484;
    bool _1486 = !_1356;
    float _1502;
    if (!_1486)
    {
        float _1488 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1490 = _746 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1492 = fma(_1490, (*spvDescriptorSet0.vp_c9)._m0[11].z, _132);
        float _1494 = _1492 * _1488;
        float _1496 = floor(_1494);
        float _1498 = -_1496;
        float _1500 = _1494 + _1498;
        _1502 = _1500;
        _1504 = true;
    }
    else
    {
        _1502 = _144;
    }
    _1504 = false;
    float _1506 = _1502;
    float _1508 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1510 = _1506 + _1508;
    bool _1512 = _1506 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1514 = isnan(_1506);
    bool _1516 = _1512 || _1514;
    bool _1518 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1520 = _1516 || _1518;
    float _1522 = float(_1520);
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1524;
    bool _1528 = _1506 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1530 = isnan(_1506);
    bool _1532 = _1528 || _1530;
    bool _1534 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1536 = _1532 || _1534;
    float _1538 = float(_1536);
    float _1540 = -_1522;
    float _1542 = _1540 + 1.0;
    float _1544 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1546 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1544;
    float _1548 = 1.0 / _1526;
    bool _1550 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1552 = _1510 * _1548;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1554;
    float _1558 = _1538 * _1542;
    float _1560 = fma(_1546, _1552, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1562 = -_1538;
    float _1564 = _1562 + 1.0;
    float _1566 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1568 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1566;
    float _1570 = fma(_1556, _1552, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1572 = _1560 * _1558;
    float _1574 = fma(_1568, _1552, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1576 = _1570 * _1558;
    float _1578 = _1574 * _1558;
    float _1580 = fma(_1564, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1572);
    float _1582 = fma(_1564, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1576);
    float _1584 = fma(_1564, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1578);
    float _1586 = fma(_1522, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1580);
    float _1588 = fma(_1522, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1584);
    float _1590 = fma(_1522, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1582);
    bool _1592 = !_1550;
    float _1608;
    if (!_1592)
    {
        float _1594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1596 = _746 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1598 = fma(_1596, (*spvDescriptorSet0.vp_c9)._m0[11].w, _132);
        float _1600 = _1598 * _1594;
        float _1602 = floor(_1600);
        float _1604 = -_1602;
        float _1606 = _1600 + _1604;
        _1608 = _1606;
        _1610 = true;
    }
    else
    {
        _1608 = _144;
    }
    _1610 = false;
    float _1612 = _1608;
    float _1614 = in.m_65.y;
    float _1616 = _834 * _1266;
    float _1618 = _834 * _1162;
    float _1620 = _834 * _1192;
    float _1622 = in.m_65.z;
    float _1624 = in.m_65.w;
    float _1626 = -_408;
    float _1628 = _1626 + 1.0;
    float _1630 = _548 * _180;
    float _1632 = _548 * _168;
    float _1634 = _746 * 2.0;
    int _1636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1638 = _1636 != 0;
    float _1640 = _548 * _164;
    int _1642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1644 = _1642 != 0;
    float _1646 = floor(_1634);
    int _1648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1650 = _1648 != 0;
    float _1652 = fma(_546, _446, _1630);
    float _1654 = fma(_546, _438, _1640);
    float _1656 = fma(_550, _204, _1652);
    float _1658 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1660 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1662 = _1614 > 0.5;
    float _1664 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1666 = _1614 * 2.0;
    bool _1668 = _1622 > 0.5;
    float _1670 = _1622 * 2.0;
    int _1672 = _1662 ? as_type<int>(_1628) : as_type<int>(_408);
    float _1674 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1676 = _1668 ? as_type<int>(_1628) : as_type<int>(_408);
    float _1678 = fma(_550, _182, _1654);
    int _1680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1682 = _1680 != 0;
    float _1684 = _746 + _1622;
    float _1686 = _1638 ? as_type<float>(_1672) : _408;
    float _1688 = _1620 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _1690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1692 = _1690 != 0;
    int _1694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1696 = _1694 != 0;
    int _1698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1700 = _1698 != 0;
    float _1702 = _1684 + (-1.0);
    float _1704 = _1650 ? as_type<float>(_1676) : _408;
    float _1706 = fma(_546, _424, _1632);
    bool _1708 = _1624 > 0.5;
    float _1710 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1712 = log2(_1710);
    float _1714 = _746 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1716 = fma(_550, _184, _1706);
    float _1718 = _1634;
    bool _1720 = _1692;
    if (_1682)
    {
        _1718 = _746;
    }
    float _1722 = _1718;
    float _1724 = -_1660;
    float _1726 = fma(_1714, 2.0, _1724);
    float _1728 = _1722;
    if (!_1682)
    {
        _1728 = _1622;
    }
    float _1730 = _1728;
    float _1732 = _1614 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1734 = _1732;
    if (_1644)
    {
        float _1736 = _1708 ? _1628 : _408;
        _484 = _1736;
    }
    float _1738 = _484;
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1742 = _1646 > 0.0;
    float _1744 = _1730 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1746 = _1646 >= 0.0;
    bool _1748 = isnan(_1646);
    bool _1750 = _1746 || _1748;
    bool _1752 = isnan(0.0);
    bool _1754 = _1750 || _1752;
    float _1756 = fma(_1732, -2.0, _1664);
    float _1758 = _1744;
    float _1760 = _1646;
    if (!_1682)
    {
        _1734 = _1622;
    }
    float _1762 = _1734;
    float _1764 = -_1658;
    float _1766 = fma(_1744, 2.0, _1764);
    float _1768 = _1712 * _132;
    float _1770 = _1762;
    if (!_1682)
    {
        _1758 = _1614;
    }
    float _1772 = _1758;
    float _1774 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1756);
    float _1776 = _1754 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1778 = _746 + _1614;
    float _1780 = _1772;
    float _1782 = _1776;
    if (!_1682)
    {
        _1760 = _1772;
    }
    float _1784 = _1760;
    float _1786 = exp2(_1768);
    int _1788 = ~as_type<int>(_1776);
    int _1790 = _1788 + 1;
    int _1792 = _1790 + 1;
    float _1794 = _1778 + (-1.0);
    int _1796 = _1792;
    float _1798 = _1784;
    if (_1682)
    {
        _1780 = _1614;
    }
    float _1800 = _1780;
    float _1802 = _1716 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1804 = _1800;
    if (!_1742)
    {
        int _1806 = ~as_type<int>(_1776);
        int _1808 = _1806 + 1;
        _1796 = _1808;
    }
    int _1810 = _1796;
    float _1812 = _1656 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1814 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1816 = isnan(0.0);
    bool _1818 = _1814 || _1816;
    bool _1820 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1822 = _1818 || _1820;
    float _1824 = _1678 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (!_1682)
    {
        _1782 = _1622;
    }
    float _1826 = _1782;
    float _1828 = _1826;
    if (_1682)
    {
        _1770 = _1800;
    }
    float _1830 = _1770;
    if (_1682)
    {
        _1828 = _1800;
    }
    float _1832 = _1828;
    float _1834 = -_1786;
    float _1836 = _1834 + 1.0;
    if (!_1682)
    {
        _1804 = _746;
    }
    float _1838 = _1804;
    float _1840 = _1830 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1844 = _1822 ? _1836 : 0.0;
    float _1846 = _1838 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1848 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1850 = isnan(1.0);
    bool _1852 = _1848 || _1850;
    bool _1854 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1856 = _1852 || _1854;
    float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1860 = 1.0 + _1858;
    float _1862 = fma(_1832, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1740);
    float _1864 = fma(_1846, -2.0, _1842);
    if (_1682)
    {
        _1798 = _746;
    }
    float _1866 = _1798;
    float _1868 = fma(_1840, -2.0, _1674);
    float _1870 = 1.0 / _1860;
    float _1872 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1874 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1876 = _1874 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1878 = fma(_1866, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1872);
    float _1880 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1882 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1884 = _1866 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1888 = _1886 != 0;
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1892 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1894 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1896 = 1.0 / _1876;
    float _1898 = -_1882;
    float _1900 = fma(_1884, 2.0, _1898);
    float _1902 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1880);
    float _1904 = fma(_1614, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1890);
    float _1906 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1892);
    float _1908 = fma(_1614, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1894);
    float _1910 = -_132;
    float _1912 = fma(_1910, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1726);
    float _1914 = -_132;
    float _1916 = fma(_1914, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1766);
    float _1918 = floor(_1666);
    float _1920 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1902);
    float _1922 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1904);
    float _1924 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1906);
    float _1926 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1908);
    float _1928 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1878);
    float _1930 = -_132;
    float _1932 = fma(_1930, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1900);
    float _1934 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1862);
    float _1936 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1868);
    float _1938 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1864);
    if (_1856)
    {
        float _1940 = _1844 * _1870;
        _154 = _1940;
    }
    float _1942 = _154;
    float _1944 = floor(_1670);
    float _1946 = _1894;
    if (_1888)
    {
        float _1948 = in.m_65.z;
        _1946 = _1948;
    }
    float _1950 = _1946;
    float _1952 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1952;
    float _1956 = in.m_59.x;
    float _1958 = fma(_144, 0.4000000059604644775390625, 0.300000011920928955078125);
    float _1960 = _1954 * _1896;
    bool _1962 = !_1696;
    float _1964 = _1962 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1966 = _1918 >= 0.0;
    bool _1968 = isnan(_1918);
    bool _1970 = _1966 || _1968;
    bool _1972 = isnan(0.0);
    bool _1974 = _1970 || _1972;
    int _1976 = _1974 ? 0 : 1;
    bool _1978 = _1944 >= 0.0;
    bool _1980 = isnan(_1944);
    bool _1982 = _1978 || _1980;
    bool _1984 = isnan(0.0);
    bool _1986 = _1982 || _1984;
    float _1988 = fma(_1794, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1990 = _1614 + _1622;
    bool _1992 = !_1692;
    int _1994 = _1992 ? 0 : 1;
    int _1996 = _1986 ? 0 : 1;
    float _1998 = _1990 + (-1.0);
    bool _2000 = _1944 > 0.0;
    float _2002 = _740 * _740;
    float _2004 = _1964;
    if (_1888)
    {
        bool _2006 = _1950 > 0.5;
        _1720 = _2006;
    }
    bool _2008 = _1720;
    float _2010 = fma(_1998, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _2012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2014 = _2012 != 0;
    float _2016 = fma(_742, _742, _2002);
    float _2018 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2020 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2022 = _1612 + _2020;
    float _2024 = fma(_744, _744, _2016);
    int _2026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2028 = _2026 != 0;
    int _2030 = ~_1996;
    int _2032 = _2030 + 1;
    int _2034 = _2032 + 1;
    float _2036 = fma(_1702, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _2038 = _2034;
    if (!_2000)
    {
        int _2040 = ~_1996;
        int _2042 = _2040 + 1;
        _2038 = _2042;
    }
    int _2044 = _2038;
    float _2046 = rsqrt(_2024);
    bool _2048 = _1918 > 0.0;
    float _2050 = fma(_1960, _2022, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2052 = abs(as_type<int>(_1964));
    float _2054 = in.m_69.x;
    float _2056 = in.m_69.y;
    float _2058 = in.m_69.z;
    bool _2060 = _2048;
    if (!_2014)
    {
        _2004 = _1956;
    }
    float _2062 = _2004;
    int _2064 = abs(_1994);
    float _2066 = _2018 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2068 = _2018;
    float _2070 = _2062;
    if (!_2014)
    {
        _2068 = _2062;
    }
    float _2072 = _2068;
    float _2074 = _2072;
    if (_2014)
    {
        _2070 = _1956;
    }
    float _2076 = _2070;
    float _2078 = fma(_2066, _1686, -0.5);
    float _2080 = float(_2064);
    float _2082 = float(_2052);
    float _2084 = _2046 * _740;
    float _2086 = float(_1810);
    float _2088 = _2046 * _742;
    float _2090 = float(_2044);
    float _2092 = _2046 * _744;
    int _2094 = ~_1976;
    int _2096 = _2094 + 1;
    int _2098 = _2096 + 1;
    float _2100 = _2082 * _2086;
    int _2102 = _2098;
    float _2104 = _2076;
    if (!_2048)
    {
        int _2106 = ~_1976;
        int _2108 = _2106 + 1;
        _2102 = _2108;
    }
    int _2110 = _2102;
    float _2112 = _2080 * _2090;
    float _2114 = _746 + _2076;
    float _2116 = _2084 * _476;
    float _2118 = _2100 * (-2.0);
    float _2120 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2122 = _2114 * 6.283185482025146484375;
    float _2124 = fma(_2088, _470, _2116);
    float _2126 = fma(_2118, _2056, _2056);
    float _2128 = _1614 + _2076;
    float _2130 = fma(_2010, _2118, _2010);
    float _2132 = _2122 * 0.15915493667125701904296875;
    float _2134 = fma(_2092, _480, _2124);
    float _2136 = _1614 + (-0.5);
    float _2138 = _2128 * 18.84955596923828125;
    bool _2140 = !_1700;
    int _2142 = _2140 ? 0 : 1;
    float _2144 = _2132 * 6.283185482025146484375;
    float _2146 = sin(_2144);
    float _2148 = fma(_2136, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2126);
    float _2150 = abs(_2134);
    bool _2152 = _2150 > 0.99989998340606689453125;
    float _2154 = _2138 * 0.15915493667125701904296875;
    int _2156 = abs(_2142);
    float _2158 = fma(_2130, _1942, _2148);
    float _2160 = _2112 * (-2.0);
    float _2162 = float(_2110);
    float _2164 = _2154 * 6.283185482025146484375;
    float _2166 = sin(_2164);
    float _2168 = float(_2156);
    float _2170 = fma(_2160, _2054, _2054);
    float _2172 = _2146;
    if (_2014)
    {
        bool _2174 = _746 > 0.5;
        _2060 = _2174;
    }
    bool _2176 = _2060;
    float _2178 = _746 + (-0.5);
    float _2180 = _2120 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2182 = _2168 * _2162;
    float _2184 = fma(_1988, _2160, _1988);
    float _2186 = fma(_2178, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2170);
    float _2188 = fma(_1704, _2180, -0.5);
    float _2190 = _2182 * (-2.0);
    if (_2152)
    {
        float _2192 = fma(_536, 0.001000000047497451305389404296875, _470);
        _472 = _2192;
    }
    float _2194 = _472;
    float _2196 = fma(_2184, _1942, _2186);
    float _2198 = _1622 + (-0.5);
    float _2200 = fma(_2190, _2058, _2058);
    float _2202 = fma(_2036, _2190, _2036);
    float _2204 = _2166 * 0.125;
    float _2206 = in.m_71.x;
    float _2208 = in.m_71.y;
    float _2210 = in.m_71.z;
    float _2212 = fma(_2198, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2200);
    if (_2152)
    {
        float _2214 = fma(_544, 0.001000000047497451305389404296875, _480);
        _486 = _2214;
    }
    float _2216 = _486;
    float _2218 = fma(_2146, 0.5, _2204);
    float _2220 = -_2194;
    float _2222 = _2092 * _2220;
    float _2224 = fma(_2202, _1942, _2212);
    if (!_2152)
    {
        _2172 = _476;
    }
    float _2226 = _2172;
    float _2228 = _2218 + 0.625;
    float _2230 = _2226;
    if (_2152)
    {
        float _2232 = fma(_540, 0.001000000047497451305389404296875, _476);
        _2230 = _2232;
    }
    float _2234 = _2230;
    float _2236 = -_2216;
    float _2238 = -_2222;
    float _2240 = fma(_2088, _2236, _2238);
    float _2242 = _2224 * 0.15915493667125701904296875;
    float _2244 = _2228 * _1958;
    float _2246 = -_2216;
    float _2248 = _2084 * _2246;
    float _2250 = -_2234;
    float _2252 = _2088 * _2250;
    float _2254 = _2158 * 0.15915493667125701904296875;
    float _2256 = _2196 * 0.15915493667125701904296875;
    float _2258 = -_2234;
    float _2260 = -_2248;
    float _2262 = fma(_2092, _2258, _2260);
    float _2264 = _2240 * _2240;
    float _2266 = -_2194;
    float _2268 = -_2252;
    float _2270 = fma(_2084, _2266, _2268);
    float _2272 = _2254 * 6.283185482025146484375;
    float _2274 = sin(_2272);
    float _2276 = _1616 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2278 = fma(_2262, _2262, _2264);
    float _2280 = -_1774;
    float _2282 = fma(_1922, _2078, _2280);
    float _2284 = fma(_2206, _2244, _2206);
    float _2286 = fma(_2270, _2270, _2278);
    float _2288 = fma(_2208, _2244, _2208);
    float _2290 = _2254 * 6.283185482025146484375;
    float _2292 = cos(_2290);
    float _2294 = fma(_2210, _2244, _2210);
    float _2296 = _1618 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2298 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2284);
    float _2300 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2288);
    float _2302 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2294);
    float _2304 = _2276 * _2298;
    float _2306 = _2256 * 6.283185482025146484375;
    float _2308 = sin(_2306);
    float _2310 = _2296 * _2300;
    float _2312 = _1688 * _2302;
    float _2314 = _2256 * 6.283185482025146484375;
    float _2316 = cos(_2314);
    float _2318 = _2242 * 6.283185482025146484375;
    float _2320 = cos(_2318);
    float _2322 = _2308 * _2274;
    float _2324 = _2308 * _2292;
    float _2326 = _2242 * 6.283185482025146484375;
    float _2328 = sin(_2326);
    float _2330 = _2316 * _2292;
    float _2332 = _2316 * _2274;
    float _2334 = rsqrt(_2286);
    float _2336 = _2308 * _2320;
    float _2338 = _2292 * _2320;
    float _2340 = _2316 * _2320;
    float _2342 = _2274 * _2320;
    float _2344 = _2340 * _2092;
    float _2346 = fma(_2328, _2330, _2322);
    float _2348 = -_2332;
    float _2350 = fma(_2328, _2324, _2348);
    float _2352 = -_2324;
    float _2354 = fma(_2328, _2332, _2352);
    float _2356 = fma(_2328, _2322, _2330);
    float _2358 = _2346 * _2088;
    float _2360 = _2354 * _2088;
    float _2362 = _2354 * _2092;
    float _2364 = _2240 * _2334;
    float _2366 = _2262 * _2334;
    float _2368 = _2270 * _2334;
    float _2370 = _2340 * _2088;
    float _2372 = _2346 * _2092;
    float _2374 = fma(_2338, _2366, _2358);
    float _2376 = _2084 * _2368;
    float _2378 = -_2328;
    float _2380 = fma(_2378, _2366, _2370);
    float _2382 = _2088 * _2364;
    float _2384 = -_2328;
    float _2386 = fma(_2384, _2368, _2344);
    float _2388 = fma(_2342, _2366, _2360);
    float _2390 = -_2376;
    float _2392 = fma(_2092, _2364, _2390);
    float _2394 = fma(_2338, _2368, _2372);
    float _2396 = -_2382;
    float _2398 = fma(_2084, _2366, _2396);
    bool _2400 = _1612 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2402 = isnan(_1612);
    bool _2404 = _2400 || _2402;
    bool _2406 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2408 = _2404 || _2406;
    float _2410 = float(_2408);
    float _2412 = fma(_2350, _2392, _2374);
    float _2414 = fma(_2336, _2392, _2380);
    float _2416 = fma(_2356, _2392, _2388);
    float _2418 = fma(_2336, _2398, _2386);
    float _2420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2422 = fma(_2342, _2368, _2362);
    float _2424 = fma(_2350, _2398, _2394);
    float _2426 = _2310 * _2414;
    float _2428 = _2310 * _2418;
    bool _2430 = _1612 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2432 = isnan(_1612);
    bool _2434 = _2430 || _2432;
    bool _2436 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2438 = _2434 || _2436;
    float _2440 = float(_2438);
    float _2442 = -_2410;
    float _2444 = _2442 + 1.0;
    float _2446 = fma(_2356, _2398, _2422);
    float _2448 = fma(_2304, _2412, _2426);
    float _2450 = fma(_2304, _2424, _2428);
    float _2452 = _2440 * _2444;
    int _2454 = as_type<int>(_2398);
    int _2456 = as_type<int>(_2450);
    int _2458 = as_type<int>(_2426);
    float _2460 = _2312;
    float _2462 = _2354;
    if (_2014)
    {
        float _2464 = -_2076;
        float _2466 = _2464 + 1.0;
        _2454 = as_type<int>(_2466);
    }
    int _2468 = _2454;
    float _2470 = fma(_2312, _2416, _2448);
    float _2472 = fma(_2312, _2446, _2450);
    float _2474 = _2050 * _2452;
    float _2476 = as_type<float>(_2468);
    if (_2028)
    {
        float _2478 = -_2076;
        float _2480 = _2478 + 1.0;
        _2456 = as_type<int>(_2480);
    }
    int _2482 = _2456;
    float _2484 = _1802 + _2470;
    float _2486 = _1812 + _2472;
    float _2488 = _2420 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2490 = _2484;
    float _2492 = _2486;
    if (_2014)
    {
        float _2494 = _2176 ? as_type<float>(_2468) : _2076;
        _2074 = _2494;
    }
    float _2496 = _2074;
    float _2498 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2500 = _2484 + _2498;
    float _2502 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2504 = _2486 + _2502;
    float _2506 = fma(_2488, _1738, -0.5);
    if (!_2028)
    {
        _2476 = _2076;
    }
    float _2508 = _2476;
    float _2510 = _2500 * _2500;
    float _2512 = _2504 * _2504;
    float _2514 = _2508;
    float _2516 = _2510;
    float _2518 = _2512;
    if (_2028)
    {
        float _2520 = _1662 ? as_type<float>(_2482) : _2076;
        _2514 = _2520;
    }
    float _2522 = _2514;
    float _2524 = _2340 * _2084;
    float _2526 = _2092 * _2366;
    float _2528 = _2510 + _2512;
    float _2530 = _2346 * _2084;
    float _2532 = -_2328;
    float _2534 = fma(_2532, _2364, _2524);
    float _2536 = -_2526;
    float _2538 = fma(_2088, _2368, _2536);
    float _2540 = sqrt(_2528);
    float _2542 = _2354 * _2084;
    float _2544 = fma(_2338, _2364, _2530);
    float _2546 = fma(_2336, _2538, _2534);
    if (_1888)
    {
        float _2548 = -_2076;
        float _2550 = _2548 + 1.0;
        _2458 = as_type<int>(_2550);
    }
    int _2552 = _2458;
    float _2554 = fma(_2342, _2364, _2542);
    float _2556 = fma(_2350, _2538, _2544);
    float _2558 = _2310 * _2546;
    float _2560 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2562 = in.m_73.w;
    float _2564 = fma(_2356, _2538, _2554);
    float _2566 = fma(_2304, _2556, _2558);
    if (_1888)
    {
        float _2568 = _2008 ? as_type<float>(_2552) : _2076;
        _2104 = _2568;
    }
    float _2570 = _2104;
    float _2572 = -_2440;
    float _2574 = _2572 + 1.0;
    float _2576 = fma(_2312, _2564, _2566);
    float _2578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2580 = _2540 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2582 = fma(_2574, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2474);
    float _2584 = _1824 + _2576;
    float _2586 = fma(_2410, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2582);
    float _2588 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2590 = _2560 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2592 = fma(_2590, _2496, -0.5);
    if (!_2580)
    {
        _2460 = _2584;
    }
    float _2594 = _2460;
    float _2596 = _2578 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2598 = fma(_1920, _2592, _1912);
    float _2600 = fma(_2596, _2570, -0.5);
    float _2602 = _2588 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2604 = fma(_1928, _2600, _1932);
    float _2606 = fma(_2602, _2522, -0.5);
    bool _2608 = !_2580;
    float _2610 = _2594;
    if (!_2608)
    {
        float _2612 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2614 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2616 = _2540 + _2614;
        float _2618 = rsqrt(_2528);
        float _2620 = _2616 * _2612;
        float _2622 = _2584 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2624 = _2620 * 0.15915493667125701904296875;
        float _2626 = _2624 * 6.283185482025146484375;
        float _2628 = sin(_2626);
        float _2630 = _2624 * 6.283185482025146484375;
        float _2632 = cos(_2630);
        float _2634 = fma(_2628, _2622, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2636 = _2618 * _2634;
        float _2638 = _2632 + (-1.0);
        float _2640 = fma(_2500, _2636, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2642 = fma(_2504, _2636, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2644 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2648 = _2640 + _2646;
        float _2650 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2652 = _2642 + _2650;
        float _2654 = fma(_2584, _2632, _2644);
        float _2656 = _2648 * _2648;
        float _2658 = _2652 * _2652;
        _2610 = _2654;
        _2516 = _2656;
        _2518 = _2658;
        _2490 = _2640;
        _2492 = _2642;
    }
    float _2660 = _2610;
    float _2662 = _2516;
    float _2664 = _2518;
    float _2666 = _2490;
    float _2668 = _2492;
    float _2670 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2672 = _2660 + _2670;
    float _2674 = fma(_1924, _2606, _1916);
    float _2676 = -_1938;
    float _2678 = fma(_1926, _2188, _2676);
    float _2680 = -_1936;
    float _2682 = fma(_1934, _2506, _2680);
    float _2684 = fma(_2672, _2672, _2662);
    float _2686 = _1586 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2688 = _1588 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2690 = _1590 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2692 = _2684 + _2664;
    float _2694 = _2686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2696 = _2688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2698 = _2690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2700 = _2282 + 0.5;
    float _2702 = _2586 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2704 = sqrt(_2692);
    float _2706 = _2674 + 0.5;
    float _2708 = _2598 + 0.5;
    float _2710 = _2604 + 0.5;
    float _2712 = _2682 + 0.5;
    float _2714 = _2678 + 0.5;
    out.m_75.w = _2562;
    out.m_77.x = _2694;
    out.m_77.y = _2696;
    out.m_77.z = _2698;
    out.m_77.w = _2702;
    out.m_79.x = _2708;
    out.m_79.y = _2700;
    out.m_79.z = _2710;
    out.m_79.w = _2712;
    bool _2716 = _2704 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2718 = isnan(_2704);
    bool _2720 = _2716 || _2718;
    bool _2722 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2724 = _2720 || _2722;
    out.m_81.x = _2706;
    out.m_81.y = _2714;
    float _2726 = _2672;
    if (!_2724)
    {
        _2726 = 1.0;
    }
    float _2728 = _2726;
    bool _2730 = !_2724;
    float _2732 = _2728;
    if (!_2730)
    {
        bool _2734 = _2704 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2736 = isnan(_2704);
        bool _2738 = _2734 || _2736;
        bool _2740 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2742 = _2738 || _2740;
        if (!_2742)
        {
            float _2744 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2746 = _2704 + _2744;
            float _2748 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2750 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2748;
            float _2752 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2754 = _2752 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2756 = 1.0 / _2750;
            float _2758 = _2746 * _2756;
            float _2760 = fma(_2758, _2754, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2732 = _2760;
            _2762 = true;
        }
        else
        {
            bool _2764 = _2704 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2766 = isnan(_2704);
            bool _2768 = _2764 || _2766;
            bool _2770 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2772 = _2768 || _2770;
            if (!_2772)
            {
                float _2774 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2776 = _2704 + _2774;
                float _2778 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2780 = _2778 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2782 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2784 = _2782 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2786 = 1.0 / _2780;
                float _2788 = _2776 * _2786;
                float _2790 = fma(_2788, _2784, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2732 = _2790;
                _2762 = true;
            }
            else
            {
                _2732 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2762 = false;
    float _2792 = _2732;
    float _2794 = _1824 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2796 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2798 = _2660 + _2796;
    float _2800 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2794);
    float _2802 = fma(_2798, _2792, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    bool _2804 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2806 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2808 = _2804 || _2806;
    bool _2810 = isnan(0.5);
    bool _2812 = _2808 || _2810;
    float _2814 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2800);
    float _2816 = _1824 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2818 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2820 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2822 = _2818 || _2820;
    bool _2824 = isnan(0.5);
    bool _2826 = _2822 || _2824;
    float _2828 = _2814 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2830 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2816);
    float _2832 = 1.0 / _2828;
    float _2834 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2830);
    float _2836 = _2834 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2838 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2840 = _2798;
    float _2842 = _2802;
    if (_2826)
    {
        _2838 = 1.0;
    }
    float _2844 = _2838;
    float _2846 = _2836 + _2828;
    float _2848 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2850 = _2666 + _2848;
    float _2852 = fma(_2850, _2792, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2854 = _2846 * _2832;
    float _2856 = _2854 * 0.5;
    float _2858 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2860 = _2668 + _2858;
    float _2862 = _2850;
    float _2864 = _2860;
    float _2866 = _2856;
    float _2868 = _2844;
    if (_2812)
    {
        _2862 = _2852;
    }
    float _2870 = _2862;
    float _2872 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2874 = fma(_2856, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2872);
    float _2876 = fma(_2860, _2792, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2878 = _2870;
    if (_2812)
    {
        _2864 = _2802;
    }
    float _2880 = _2864;
    float _2882 = 1.0 / _2874;
    float _2884 = _2880;
    if (_2812)
    {
        _2866 = _2876;
    }
    float _2886 = _2866;
    float _2888 = _2886;
    if (!_2812)
    {
        float _2890 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2892 = _1824 + _2890;
        float _2894 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2896 = _1802 + _2894;
        float _2898 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2900 = _2892 * _2892;
        float _2902 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2904 = _1812 + _2902;
        float _2906 = fma(_2896, _2896, _2900);
        float _2908 = fma(_2904, _2904, _2906);
        float _2910 = -_1802;
        float _2912 = _2910 + _2852;
        float _2914 = -_1812;
        float _2916 = _2914 + _2876;
        float _2918 = sqrt(_2908);
        float _2920 = precise::min(_2918, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2922 = _2920 * _2898;
        float _2924 = -_1824;
        float _2926 = _2924 + _2802;
        float _2928 = fma(_2912, _2922, _1802);
        float _2930 = fma(_2926, _2922, _1824);
        float _2932 = fma(_2916, _2922, _1812);
        _2840 = _2922;
        _2884 = _2930;
        _2878 = _2928;
        _2888 = _2932;
    }
    float _2934 = _2840;
    float _2936 = _2884;
    float _2938 = _2878;
    float _2940 = _2888;
    float _2942 = _2934;
    if (_2826)
    {
        _2942 = 1.0;
    }
    float _2944 = _2942;
    float _2946 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2948 = _2882 * _2946;
    float _2950 = _2944;
    float _2952 = _2948;
    if (!_2826)
    {
        float _2954 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2956 = _2954 * 0.15915493667125701904296875;
        float _2958 = _2956 * 6.283185482025146484375;
        float _2960 = cos(_2958);
        float _2962 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2964 = _2962 * 0.15915493667125701904296875;
        float _2966 = _2956 * 6.283185482025146484375;
        float _2968 = sin(_2966);
        float _2970 = 1.0 / _2960;
        float _2972 = _2964 * 6.283185482025146484375;
        float _2974 = cos(_2972);
        float _2976 = _2968 * _2970;
        float _2978 = _2964 * 6.283185482025146484375;
        float _2980 = sin(_2978);
        float _2982 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2984 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2982;
        float _2986 = _2974 * _2976;
        float _2988 = 1.0 / _2984;
        float _2990 = 1.0 / _2986;
        float _2992 = _2980 * _2990;
        float _2994 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2996 = fma(_2948, _2992, _2994);
        float _2998 = _2996 * _2988;
        float _3000 = precise::clamp(_2998, 0.0, 1.0);
        _2842 = _2956;
        _2868 = _3000;
    }
    float _3002 = _2842;
    float _3004 = _2868;
    float _3006 = _3002;
    if (!_2826)
    {
        float _3008 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3010 = _3008 * 0.15915493667125701904296875;
        float _3012 = _3010 * 6.283185482025146484375;
        float _3014 = cos(_3012);
        float _3016 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3018 = _3016 * 0.15915493667125701904296875;
        float _3020 = _3010 * 6.283185482025146484375;
        float _3022 = sin(_3020);
        float _3024 = 1.0 / _3014;
        float _3026 = _3018 * 6.283185482025146484375;
        float _3028 = cos(_3026);
        float _3030 = _3022 * _3024;
        float _3032 = _3018 * 6.283185482025146484375;
        float _3034 = sin(_3032);
        float _3036 = _3028 * _3030;
        float _3038 = 1.0 / _3036;
        float _3040 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3042 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3040;
        float _3044 = 1.0 / _3042;
        float _3046 = _3034 * _3038;
        float _3048 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3050 = fma(_2948, _3046, _3048);
        float _3052 = _3050 * _3044;
        float _3054 = precise::clamp(_3052, 0.0, 1.0);
        float _3056 = -_3054;
        float _3058 = _3056 + 1.0;
        _3006 = _3036;
        _2950 = _3058;
    }
    float _3060 = _3006;
    float _3062 = _2950;
    float _3064 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3066 = _2936 + _3064;
    float _3068 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3070 = _2938 + _3068;
    float _3072 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3074 = _2940 + _3072;
    float _3076 = _3066 * _3066;
    float _3078 = fma(_3070, _3070, _3076);
    float _3080 = fma(_3074, _3074, _3078);
    float _3082 = rsqrt(_3080);
    float _3084 = _3082 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3086 = _3070 * _3084;
    float _3088 = _3074 * _3084;
    float _3090 = _3086 * _3086;
    float _3092 = _3088 * _3088;
    float _3094 = _3090 + _3092;
    float _3096 = sqrt(_3094);
    bool _3098 = _3096 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3100 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3102 = _3096 + _3100;
    float _3104 = _3074;
    float _3106 = _3060;
    float _3108 = _3102;
    float _3110 = _3066;
    float _3112 = _3086;
    if (_3098)
    {
        float _3114 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3104 = _3114;
    }
    float _3116 = _3104;
    if (_3098)
    {
        float _3118 = rsqrt(_3094);
        _3106 = _3118;
    }
    float _3120 = _3106;
    float _3122 = _3120;
    if (_3098)
    {
        float _3124 = _3102 * _3116;
        _3108 = _3124;
    }
    float _3126 = _3108;
    if (_3098)
    {
        float _3128 = _3126 * 0.15915493667125701904296875;
        _2952 = _3128;
    }
    float _3130 = _2952;
    float _3132 = _3076;
    if (_3098)
    {
        float _3134 = _3130 * 6.283185482025146484375;
        float _3136 = sin(_3134);
        _3132 = _3136;
    }
    float _3138 = _3132;
    float _3140 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3142 = precise::max(0.0, _3140);
    float _3144 = _3082;
    float _3146 = _3140;
    float _3148 = _3142;
    if (_3098)
    {
        float _3150 = _3130 * 6.283185482025146484375;
        float _3152 = cos(_3150);
        _3144 = _3152;
    }
    float _3154 = _3144;
    float _3156 = -_3084;
    float _3158 = -_3142;
    float _3160 = fma(_3066, _3156, _3158);
    float _3162 = _3160;
    if (!_3098)
    {
        _3110 = _3092;
    }
    float _3164 = _3110;
    float _3166 = _3164;
    if (_3098)
    {
        float _3168 = _3160 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3146 = _3168;
    }
    float _3170 = _3146;
    float _3172 = _3138;
    float _3174 = _3170;
    if (_3098)
    {
        float _3176 = fma(_3138, _3170, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3172 = _3176;
    }
    float _3178 = _3172;
    if (_3098)
    {
        float _3180 = _3154 + (-1.0);
        _3174 = _3180;
    }
    float _3182 = _3174;
    float _3184 = _3182;
    if (_3098)
    {
        float _3186 = _3120 * _3178;
        _2462 = _3186;
    }
    float _3188 = _2462;
    if (!_3098)
    {
        _3122 = _3088;
    }
    float _3190 = _3122;
    float _3192 = sqrt(_3080);
    float _3194 = _3190;
    if (_3098)
    {
        float _3196 = _3182 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3148 = _3196;
    }
    float _3198 = _3148;
    if (_3098)
    {
        float _3200 = _3086 * _3188;
        _3112 = _3200;
    }
    float _3202 = _3112;
    if (!_3098)
    {
        _3184 = _3090;
    }
    float _3204 = _3184;
    float _3206 = _3204;
    if (_3098)
    {
        float _3208 = _3088 * _3188;
        _3194 = _3208;
    }
    float _3210 = _3194;
    if (_3098)
    {
        float _3212 = fma(_3160, _3154, _3198);
        _3162 = _3212;
    }
    float _3214 = _3162;
    if (_3098)
    {
        float _3216 = _3202 * _3202;
        _3206 = _3216;
    }
    float _3218 = _3206;
    if (_3098)
    {
        float _3220 = _3210 * _3210;
        _3166 = _3220;
    }
    float _3222 = _3166;
    float _3224 = _2936 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3226 = fma(_3214, _3214, _3218);
    float _3228 = _2936 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3230 = _3226 + _3222;
    float _3232 = fma(_2938, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3228);
    float _3234 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3236 = fma(_3192, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3234);
    float _3238 = precise::clamp(_3236, 0.0, 1.0);
    float _3240 = rsqrt(_3230);
    float _3242 = _2936 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3244 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3246 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3232);
    float _3248 = -_3238;
    float _3250 = _3248 + 1.0;
    float _3252 = _2936 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3254 = fma(_2938, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3242);
    float _3256 = _3246 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3258 = abs(_3250);
    float _3260 = log2(_3258);
    float _3262 = fma(_2938, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3252);
    float _3264 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3254);
    float _3266 = _3256 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3268 = fma(_2938, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3224);
    float _3270 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3262);
    float _3272 = _3264 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3274 = _3240 * _3202;
    float _3276 = -_3266;
    float _3278 = fma(_3276, _3244, 1.0);
    float _3280 = fma(_2940, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3268);
    float _3282 = _3270 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3284 = _3272 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3286 = _3240 * _3214;
    float _3288 = _3274 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3290 = _3280 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3292 = fma(_3282, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3284);
    float _3294 = _3240 * _3210;
    float _3296 = -_3288;
    float _3298 = fma(_3286, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3296);
    float _3300 = _3260 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3302 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3292);
    float _3304 = log2(_3278);
    float _3306 = -_3294;
    float _3308 = fma(_3306, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3298);
    float _3310 = _3272 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3312 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3302);
    float _3314 = _3272 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3316 = fma(_3308, -0.5, 0.5);
    float _3318 = fma(_3282, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3310);
    float _3320 = fma(_3308, 0.5, 0.5);
    float _3322 = exp2(_3300);
    float _3324 = fma(_3282, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3314);
    float _3326 = _3286 + 1.0;
    float _3328 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3318);
    float _3330 = fma(_3320, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3332 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3324);
    float _3334 = 1.0 / _3312;
    float _3336 = fma(_3320, _3330, -0.212114393711090087890625);
    float _3338 = _3304 * 0.693147182464599609375;
    float _3340 = fma(_3320, _3336, 1.570728778839111328125);
    float _3342 = _3338 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3344 = sqrt(_3316);
    float _3346 = -_3286;
    float _3348 = fma(_3322, _3326, _3346);
    float _3350 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3328);
    float _3352 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3332);
    float _3354 = fma(_3348, 0.5, 0.5);
    float _3356 = _3350 * _3334;
    float _3358 = _3352 * _3334;
    float _3360 = fma(_3356, 0.5, 0.5);
    float _3362 = fma(_3358, -0.5, 0.5);
    float _3364 = _3344 * 0.636619746685028076171875;
    float3 _8662 = float3(_3360, _3362, _3342);
    float _3366 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8662, float3(0.0), isnan(_8662)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8662, float3(0.0), isnan(_8662)), level(0.0)).x;
    float _3368 = -_3340;
    float _3370 = fma(_3364, _3368, 1.0);
    float3 _8678 = float3(_3360, _3362, _3342);
    float4 _3373 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8678, float3(0.0), isnan(_8678)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8678, float3(0.0), isnan(_8678)), level(0.0)).xyzw;
    float _3375 = _3373.x;
    float _3377 = _3373.y;
    float _3379 = _3373.z;
    float _3381 = _3373.w;
    float2 _8695 = float2(_3370, _3354);
    float3 _3385 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8695, float2(0.0), isnan(_8695)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8695, float2(0.0), isnan(_8695)), level(0.0)).xyz;
    float _3387 = _3385.x;
    float _3389 = _3385.y;
    float _3391 = _3385.z;
    float _3393 = _3260 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3395 = _3272 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3397 = _3004 * _3062;
    bool _3399 = _3004 > 0.0;
    bool _3401 = isnan(_3004);
    bool _3403 = _3399 || _3401;
    bool _3405 = isnan(0.0);
    bool _3407 = _3403 || _3405;
    float _3409 = _3312 * 0.5;
    float _3411 = fma(_3282, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3395);
    float _3413 = exp2(_3393);
    bool _3415 = _3062 <= 0.0;
    bool _3417 = !_3407;
    bool _3419 = _3415 || _3417;
    float _3421 = _3397 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3423 = fma(_3256, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3411);
    float _3425 = fma(_3290, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3423);
    float _3427 = _3350 + _3312;
    float _3429 = fma(_3352, -0.5, _3409);
    float _3431 = _3421 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3433 = _3425 + _3312;
    out.gl_Position.x = _3350;
    out.gl_Position.y = _3352;
    out.gl_Position.z = _3425;
    out.gl_Position.w = _3312;
    float _3435 = _3427 * 0.5;
    float _3437 = _3433 * 0.5;
    float _3439 = -_3413;
    float _3441 = _3439 + 1.0;
    out.m_47.x = _3431;
    float _3443 = _3441 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _3435;
    out.m_83.y = _3429;
    out.m_83.z = _3437;
    out.m_83.w = _3312;
    float _3445 = -_3443;
    float _3447 = _3445 + 1.0;
    float _3449 = _3443 * _3366;
    float _3451 = _3381 * _3449;
    float _3453 = _3391 * _3449;
    float _3455 = fma(_3387, _3451, _3375);
    float _3457 = fma(_3389, _3451, _3377);
    float _3459 = _3381 * _3447;
    float _3461 = fma(_3381, _3453, _3379);
    out.m_85.x = _3455;
    out.m_85.y = _3457;
    out.m_85.z = _3461;
    out.m_85.w = _3459;
    if (!_3419)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _3463 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3463;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

