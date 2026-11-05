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
    float4 m_75 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_73 [[user(locn2)]];
    float4 m_77 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_69 [[user(locn5)]];
    float4 m_79 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_51 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_55 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_61 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
    float4 m_67 [[attribute(11)]];
    float4 m_63 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1765 = false;
    bool _668 = false;
    bool _508 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2241 = as_type<float>(_114);
        out.gl_Position.z = _2241;
    }
    if (!_102)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _118 = in.m_49.w;
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
        _108 = _140;
    }
    float _142 = _108;
    bool _144 = _132 >= _142;
    bool _146 = !_128;
    bool _148 = _144 || _146;
    float _150 = _142;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_47.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _116 = as_type<int>(_154);
    }
    int _156 = _116;
    float _158 = as_type<float>(_156);
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2313 = as_type<float>(_156);
        out.gl_Position.z = _2313;
    }
    if (_148)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _160 = in.m_49.x;
    float _162 = in.m_49.y;
    float _164 = in.m_49.z;
    float _166 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    float _178 = _166;
    if (!_176)
    {
        float _180 = _166 * _166;
        float _182 = _180 * 0.5;
        _158 = _182;
    }
    float _184 = _158;
    float _186 = 0.0;
    float _188 = _184;
    if (!_176)
    {
        float _190 = _132 * _132;
        float _192 = _190 * 0.5;
        _186 = _192;
    }
    float _194 = _186;
    if (!_176)
    {
        float _196 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _196;
    }
    float _198 = _188;
    bool _200 = !_176;
    float _202 = _198;
    if (!_200)
    {
        float _204 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = log2(_204);
        float _208 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _210 = _208 + 1.0;
        float _212 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = _166 * _206;
        float _216 = 1.0 / _210;
        float _218 = _212 * 0.693147182464599609375;
        float _220 = exp2(_214);
        float _222 = 1.0 / _218;
        float _224 = _220 + (-1.0);
        float _226 = -_224;
        float _228 = fma(_226, _222, _166);
        float _230 = _228 * _216;
        float _232 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _134 = _218;
        _202 = _232;
        _136 = _220;
    }
    float _234 = _134;
    float _236 = _202;
    float _238 = _136;
    bool _240 = !_176;
    float _242 = _234;
    float _244 = _238;
    if (!_240)
    {
        float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = log2(_246);
        float _250 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _252 = _250 + 1.0;
        float _254 = 1.0 / _252;
        float _256 = _166 * _248;
        float _258 = exp2(_256);
        float _260 = -_258;
        float _262 = _260 + 1.0;
        float _264 = _262 * _254;
        _242 = _258;
        _244 = _252;
        _178 = _264;
    }
    float _266 = _242;
    float _268 = _244;
    float _270 = _178;
    float _272 = _268;
    float _274 = _266;
    if (!_176)
    {
        _272 = _132;
    }
    float _276 = _272;
    float _278 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _280 = _276;
    if (!_176)
    {
        float _282 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _274 = _282;
    }
    float _284 = _274;
    bool _286 = !_176;
    float _288 = _284;
    if (!_286)
    {
        float _290 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = log2(_290);
        float _294 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _296 = _294 + 1.0;
        float _298 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _300 = _132 * _292;
        float _302 = 1.0 / _296;
        float _304 = _298 * 0.693147182464599609375;
        float _306 = exp2(_300);
        float _308 = 1.0 / _304;
        float _310 = _306 + (-1.0);
        float _312 = -_310;
        float _314 = fma(_312, _308, _132);
        float _316 = _314 * _302;
        float _318 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _288 = _318;
    }
    float _320 = _288;
    bool _322 = !_176;
    if (!_322)
    {
        float _324 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _326 = log2(_324);
        float _328 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _330 = _328 + 1.0;
        float _332 = 1.0 / _330;
        float _334 = _132 * _326;
        float _336 = exp2(_334);
        float _338 = -_336;
        float _340 = _338 + 1.0;
        float _342 = _340 * _332;
        _280 = _342;
    }
    float _344 = _280;
    float _346 = fma(_270, _160, _278);
    float _348 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _350 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _352 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _354 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _356 = fma(_270, _162, _348);
    float _358 = fma(_344, _162, _350);
    float _360 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _362 = fma(_344, _160, _352);
    float _364 = fma(_270, _164, _354);
    float _366 = -_358;
    float _368 = _356 + _366;
    float _370 = fma(_344, _164, _360);
    float _372 = -_362;
    float _374 = _346 + _372;
    float _376 = in.m_51.y;
    float _378 = _368 * _368;
    float _380 = -_370;
    float _382 = _364 + _380;
    float _384 = in.m_53.y;
    float _386 = fma(_374, _374, _378);
    float _388 = in.m_55.y;
    float _390 = fma(_382, _382, _386);
    float _392 = in.m_51.x;
    float _394 = sqrt(_390);
    float _396 = in.m_51.z;
    float _398 = in.m_53.x;
    float _400 = in.m_55.x;
    float _402 = _368 * _376;
    float _404 = in.m_57.w;
    float _406 = _368 * _384;
    bool _408 = _394 >= 9.9999999747524270787835121154785e-07;
    bool _410 = isnan(_394);
    bool _412 = _408 || _410;
    bool _414 = isnan(9.9999999747524270787835121154785e-07);
    bool _416 = _412 || _414;
    float _418 = in.m_44.x;
    float _420 = in.m_44.y;
    float _422 = in.m_44.z;
    float _424 = _368 * _388;
    float _426 = _384 * _384;
    float _428 = in.m_53.z;
    float _430 = fma(_374, _392, _402);
    float _432 = fma(_376, _376, _426);
    float _434 = in.m_55.z;
    float _436 = fma(_382, _396, _430);
    float _438 = fma(_388, _388, _432);
    float _440 = fma(_374, _398, _406);
    float _442 = fma(_374, _400, _424);
    float _444 = fma(_356, _404, _420);
    float _446 = fma(_346, _404, _418);
    float _448 = fma(_364, _404, _422);
    float _450 = _356;
    if (_416)
    {
        _450 = _436;
    }
    float _452 = _450;
    float _454 = fma(_382, _428, _440);
    float _456 = fma(_382, _434, _442);
    float _458 = _452;
    float _460 = _454;
    float _462 = _456;
    float _464 = _454;
    float _466 = _452;
    float _468 = _456;
    if (!_416)
    {
        bool _470 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _472 = !_470;
        if (!_472)
        {
            float _474 = _384 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _476 = _376 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _478 = _388 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _480 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[16].x, _474);
            float _482 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[16].x, _476);
            float _484 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[16].x, _478);
            float _486 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[16].z, _480);
            float _488 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[16].z, _482);
            float _490 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[16].z, _484);
            float _492 = _486 * _486;
            float _494 = fma(_488, _488, _492);
            float _496 = fma(_490, _490, _494);
            float _498 = rsqrt(_496);
            float _500 = _498 * 9.9999999747524270787835121154785e-07;
            float _502 = _488 * _500;
            float _504 = _486 * _500;
            float _506 = _490 * _500;
            _464 = _504;
            _466 = _502;
            _468 = _506;
            _508 = true;
        }
        else
        {
            float _510 = _162 * _162;
            float _512 = fma(_160, _160, _510);
            float _514 = fma(_164, _164, _512);
            float _516 = sqrt(_514);
            bool _518 = _516 >= 9.9999999747524270787835121154785e-07;
            bool _520 = isnan(_516);
            bool _522 = _518 || _520;
            bool _524 = isnan(9.9999999747524270787835121154785e-07);
            bool _526 = _522 || _524;
            float _528 = _516;
            if (!_526)
            {
                float _530 = _420 * _420;
                float _532 = fma(_418, _418, _530);
                float _534 = fma(_422, _422, _532);
                float _536 = sqrt(_534);
                bool _538 = _536 >= 9.9999999747524270787835121154785e-07;
                bool _540 = isnan(_536);
                bool _542 = _538 || _540;
                bool _544 = isnan(9.9999999747524270787835121154785e-07);
                bool _546 = _542 || _544;
                float _548 = _438;
                if (!_546)
                {
                    float _550 = rsqrt(_438);
                    _548 = _550;
                }
                float _552 = _548;
                if (!_546)
                {
                    float _554 = _552 * 9.9999999747524270787835121154785e-07;
                    _528 = _554;
                }
                float _556 = _528;
                if (!_546)
                {
                    float _558 = _376 * _556;
                    _458 = _558;
                }
                float _560 = _458;
                _466 = _560;
                if (!_546)
                {
                    float _562 = _384 * _556;
                    _460 = _562;
                }
                float _564 = _460;
                _464 = _564;
                if (!_546)
                {
                    float _566 = _388 * _556;
                    _462 = _566;
                }
                float _568 = _462;
                bool _570 = !_546;
                _468 = _568;
                _508 = _570;
                if (!_508)
                {
                    float _572 = _384 * _420;
                    float _574 = _376 * _420;
                    float _576 = _388 * _420;
                    float _578 = fma(_418, _398, _572);
                    float _580 = fma(_418, _392, _574);
                    float _582 = fma(_418, _400, _576);
                    float _584 = fma(_422, _428, _578);
                    float _586 = fma(_422, _396, _580);
                    float _588 = fma(_422, _434, _582);
                    float _590 = _584 * _584;
                    float _592 = fma(_586, _586, _590);
                    float _594 = fma(_588, _588, _592);
                    float _596 = rsqrt(_594);
                    float _598 = _596 * 9.9999999747524270787835121154785e-07;
                    float _600 = _586 * _598;
                    float _602 = _584 * _598;
                    float _604 = _588 * _598;
                    _464 = _602;
                    _466 = _600;
                    _468 = _604;
                    _508 = true;
                }
            }
            else
            {
                float _606 = _384 * _162;
                float _608 = _376 * _162;
                float _610 = _388 * _162;
                float _612 = fma(_160, _398, _606);
                float _614 = fma(_160, _392, _608);
                float _616 = fma(_160, _400, _610);
                float _618 = fma(_164, _428, _612);
                float _620 = fma(_164, _396, _614);
                float _622 = fma(_164, _434, _616);
                float _624 = _618 * _618;
                float _626 = fma(_620, _620, _624);
                float _628 = fma(_622, _622, _626);
                float _630 = rsqrt(_628);
                float _632 = _630 * 9.9999999747524270787835121154785e-07;
                float _634 = _620 * _632;
                float _636 = _618 * _632;
                float _638 = _622 * _632;
                _464 = _636;
                _466 = _634;
                _468 = _638;
            }
        }
    }
    _508 = false;
    float _640 = _464;
    float _642 = _466;
    float _644 = _468;
    bool _646 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    bool _648 = !_646;
    float _666;
    if (!_648)
    {
        float _650 = in.m_59.x;
        float _652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _654 = _650 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _656 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[11].x, _132);
        float _658 = _656 * _652;
        float _660 = floor(_658);
        float _662 = -_660;
        float _664 = _658 + _662;
        _666 = _664;
        _668 = true;
    }
    else
    {
        float _670 = float(_98);
        float _672 = 1.0 / _670;
        float _674 = _132 * _672;
        _666 = _674;
    }
    _668 = false;
    float _676 = _666;
    float _678 = in.m_59.z;
    float _680 = _444 * _376;
    float _682 = _444 * _388;
    float _684 = _444 * _384;
    float _686 = in.m_59.x;
    float _688 = fma(_446, _392, _680);
    float _690 = fma(_446, _400, _682);
    float _692 = fma(_446, _398, _684);
    float _694 = in.m_59.y;
    float _696 = fma(_448, _396, _688);
    float _698 = in.m_57.x;
    float _700 = in.m_57.y;
    float _702 = in.m_57.z;
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _706 = _704 != 0;
    float _708 = fma(_448, _428, _692);
    float _710 = in.m_61.x;
    float _712 = in.m_61.y;
    float _714 = in.m_61.z;
    float _716 = fma(_448, _434, _690);
    float _718 = in.m_59.w;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _722 = _676 + _720;
    float _724 = _678 * 2.0;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _728 = 0.0;
    if (!_706)
    {
        _728 = _678;
    }
    float _730 = _728;
    float _732 = _686 * 2.0;
    float _734 = 0.0;
    float _736 = _730;
    if (!_706)
    {
        _734 = _678;
    }
    float _738 = _734;
    float _740 = floor(_724);
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _744 = 0.0;
    float _746 = _738;
    if (!_706)
    {
        _744 = _694;
    }
    float _748 = _744;
    float _750 = _748;
    if (_706)
    {
        _750 = _686;
    }
    float _752 = _750;
    float _754 = _702 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    if (_706)
    {
        _736 = _694;
    }
    float _756 = _736;
    float _758 = floor(_732);
    if (_706)
    {
        _746 = _694;
    }
    float _760 = _746;
    float _762 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[83].z, _742);
    float _764 = _756 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _766 = _740 > 0.0;
    float _768 = fma(_764, -2.0, _726);
    bool _770 = _740 >= 0.0;
    bool _772 = isnan(_740);
    bool _774 = _770 || _772;
    bool _776 = isnan(0.0);
    bool _778 = _774 || _776;
    int _780 = _778 ? 0 : 1;
    bool _782 = _758 > 0.0;
    bool _784 = _758 >= 0.0;
    bool _786 = isnan(_758);
    bool _788 = _784 || _786;
    bool _790 = isnan(0.0);
    bool _792 = _788 || _790;
    float _794 = in.m_63.x;
    float _796 = in.m_63.y;
    float _798 = in.m_63.z;
    int _800 = ~_780;
    int _802 = _800 + 1;
    int _804 = _802 + 1;
    int _806 = _792 ? 0 : 1;
    int _808 = _804;
    if (!_766)
    {
        int _810 = ~_780;
        int _812 = _810 + 1;
        _808 = _812;
    }
    int _814 = _808;
    int _816 = ~_806;
    int _818 = _816 + 1;
    int _820 = _818 + 1;
    int _822 = _820;
    if (!_782)
    {
        int _824 = ~_806;
        int _826 = _824 + 1;
        _822 = _826;
    }
    int _828 = _822;
    int _830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _832 = _830 != 0;
    int _834 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _836 = _834 != 0;
    int _838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _840 = _838 != 0;
    float _842 = _698 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _844 = !_832;
    int _846 = _844 ? 0 : 1;
    float _848 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _710);
    float _850 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _714);
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _854 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _712);
    bool _856 = _718 > 0.5;
    float _858 = _798 * _798;
    float _860 = _694 * 2.0;
    float _862 = _796 * _796;
    float _864 = _686 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _866 = _794 * _794;
    float _868 = floor(_860);
    float _870 = _686 + _694;
    float _872 = -_852;
    float _874 = fma(_864, 2.0, _872);
    float _876 = _640 * _640;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _880 = _694 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _884 = _882 != 0;
    float _886 = fma(_642, _642, _876);
    float _888 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _890 = log2(_888);
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _894 = _892 != 0;
    float _896 = _870 + (-1.0);
    int _898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _900 = _898 != 0;
    float _902 = fma(_880, -2.0, _878);
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _906 = _904 != 0;
    float _908 = _700 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _910 = fma(_644, _644, _886);
    bool _912 = !_836;
    int _914 = _912 ? 0 : 1;
    float _916 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _918 = _868 >= 0.0;
    bool _920 = isnan(_868);
    bool _922 = _918 || _920;
    bool _924 = isnan(0.0);
    bool _926 = _922 || _924;
    float _928 = _694 + _678;
    float _930 = rsqrt(_910);
    float _932 = -_132;
    float _934 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[76].x, _874);
    int _936 = _926 ? 0 : 1;
    float _938 = _890 * _132;
    bool _940 = _868 > 0.0;
    float _942 = _928 + (-1.0);
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _946 = exp2(_938);
    float _948 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _950 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[83].w, _944);
    float _952 = _752 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _954 = abs(_846);
    float _956 = _930 * _642;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _960 = ~_936;
    int _962 = _960 + 1;
    int _964 = _962 + 1;
    float _966 = _930 * _640;
    int _968 = _964;
    bool _970 = _856;
    if (!_940)
    {
        int _972 = ~_936;
        int _974 = _972 + 1;
        _968 = _974;
    }
    int _976 = _968;
    float _978 = _930 * _644;
    int _980 = abs(_914);
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _984 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _986 = isnan(0.0);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _992 = _988 || _990;
    float _994 = -_958;
    float _996 = fma(_952, 2.0, _994);
    float _998 = -_946;
    float _1000 = _998 + 1.0;
    float _1002 = in.m_65.x;
    float _1004 = in.m_65.y;
    float _1006 = in.m_65.z;
    float _1008 = float(_954);
    float _1010 = float(_814);
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1014 = _992 ? _1000 : 0.0;
    float _1016 = in.m_55.w;
    bool _1018 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1020 = isnan(1.0);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1026 = _1022 || _1024;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1030 = 1.0 + _1028;
    bool _1032 = !_840;
    int _1034 = _1032 ? 0 : 1;
    float _1036 = _1008 * _1010;
    float _1038 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[78].z, _982);
    float _1040 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1012);
    float _1042 = float(_828);
    float _1044 = 1.0 / _1030;
    int _1046 = abs(_1034);
    float _1048 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1038);
    float _1050 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1040);
    float _1052 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _950);
    float _1054 = float(_980);
    float _1056 = _1036 * (-2.0);
    float _1058 = float(_1046);
    float _1060 = in.m_53.w;
    float _1062 = float(_976);
    float _1064 = _1054 * _1042;
    float _1066 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _902);
    float _1068 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _762);
    float _1070 = -_132;
    float _1072 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[81].x, _996);
    float _1074 = _1058 * _1062;
    float _1076 = _1064 * (-2.0);
    float _1078 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _768);
    bool _1080 = _1026;
    if (_1026)
    {
        float _1082 = _1014 * _1044;
        _138 = _1082;
    }
    float _1084 = _138;
    float _1086 = _1074 * (-2.0);
    float _1088 = fma(_916, _1056, _916);
    float _1090 = fma(_1076, _1004, _1004);
    float _1092 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1094 = _978 * _1092;
    float _1096 = fma(_1086, _1006, _1006);
    float _1098 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1100 = _966 * _1098;
    float _1102 = in.m_67.y;
    float _1104 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1106 = _956 * _1104;
    float _1108 = fma(_1056, _1002, _1002);
    float _1110 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1112 = -_1094;
    float _1114 = fma(_956, _1110, _1112);
    float _1116 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1118 = -_1100;
    float _1120 = fma(_978, _1116, _1118);
    float _1122 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1124 = -_1106;
    float _1126 = fma(_966, _1122, _1124);
    float _1128 = fma(_948, _1076, _948);
    float _1130 = _694 + (-0.5);
    float _1132 = _1114 * _1114;
    float _1134 = _686 + _678;
    float _1136 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1090);
    float _1138 = _686 + (-0.5);
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1140;
    float _1144 = fma(_1120, _1120, _1132);
    float _1146 = _1134 + (-1.0);
    float _1148 = fma(_1128, _1084, _1136);
    float _1150 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1108);
    float _1152 = fma(_1126, _1126, _1144);
    float _1154 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1156 = 1.0 / _1142;
    float _1158 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1160 = _1148 * 0.15915493667125701904296875;
    float _1162 = _678 + (-0.5);
    float _1164 = fma(_1088, _1084, _1150);
    float _1166 = fma(_1154, _1086, _1154);
    float _1168 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1096);
    float _1170 = rsqrt(_1152);
    float _1172 = _1164 * 0.15915493667125701904296875;
    if (_884)
    {
        bool _1174 = _686 > 0.5;
        _1080 = _1174;
    }
    bool _1176 = _1080;
    float _1178 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[191].x, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _1180 = fma(_1166, _1084, _1168);
    bool _1182 = _694 > 0.5;
    float _1184 = fma((*spvDescriptorSet0.vp_c9)._m0[191].x, _678, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _1186 = _908 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1188 = _1172 * 6.283185482025146484375;
    float _1190 = sin(_1188);
    float _1192 = _1158 * _686;
    float _1194 = -_1102;
    float _1196 = _1194 + 1.0;
    float _1198 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[191].x, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _1200 = _754 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1202 = _1180 * 0.15915493667125701904296875;
    float _1204 = in.m_51.w;
    int _1206 = _856 ? as_type<int>(_1196) : as_type<int>(_1102);
    float _1208 = _1172 * 6.283185482025146484375;
    float _1210 = cos(_1208);
    float _1212 = _1102;
    if (_894)
    {
        bool _1214 = _678 > 0.5;
        _970 = _1214;
    }
    bool _1216 = _970;
    float _1218 = _842 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1220 = _722 * _1156;
    float _1222 = _716 + _1016;
    float _1224 = _1200 * _850;
    float _1226 = _708 + _1060;
    float _1228 = _1160 * 6.283185482025146484375;
    float _1230 = sin(_1228);
    float _1232 = _1114 * _1170;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1234;
    float _1238 = _1126 * _1170;
    float _1240 = _1186 * _854;
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1242;
    float _1246 = fma(_1236, _1220, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1248 = _1160 * 6.283185482025146484375;
    float _1250 = cos(_1248);
    float _1252 = _1218 * _848;
    float _1254 = fma(_1244, _1220, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1256 = _1120 * _1170;
    float _1258 = in.m_67.x;
    float _1260 = _696 + _1204;
    float _1262 = _978 * _1256;
    float _1264 = _1202 * 6.283185482025146484375;
    float _1266 = cos(_1264);
    float _1268 = _1190 * _1230;
    float _1270 = _1210 * _1230;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1272;
    float _1276 = fma(_1274, _1220, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1278 = _1202 * 6.283185482025146484375;
    float _1280 = sin(_1278);
    float _1282 = _1210 * _1250;
    float _1284 = _1190 * _1250;
    float _1286 = _1190 * _1266;
    float _1288 = _1250 * _1266;
    float _1290 = _1210 * _1266;
    float _1292 = _1230 * _1266;
    float _1294 = -_1262;
    float _1296 = fma(_956, _1238, _1294);
    float _1298 = trunc(_1192);
    int _1300 = int(_1298);
    float _1302 = _1290 * _956;
    float _1304 = _1290 * _978;
    float _1306 = fma(_1280, _1282, _1268);
    float _1308 = fma(_1280, _1268, _1282);
    float _1310 = -_1270;
    float _1312 = fma(_1280, _1284, _1310);
    float _1314 = _966 * _1238;
    float _1316 = -_1284;
    float _1318 = fma(_1280, _1270, _1316);
    float _1320 = _1290 * _966;
    float _1322 = _956 * _1232;
    float _1324 = -_1314;
    float _1326 = fma(_978, _1232, _1324);
    float _1328 = _1306 * _956;
    float _1330 = _1306 * _966;
    float _1332 = _1306 * _978;
    float _1334 = -_1280;
    float _1336 = fma(_1334, _1256, _1302);
    float _1338 = -_1280;
    float _1340 = fma(_1338, _1232, _1320);
    float _1342 = -_1280;
    float _1344 = fma(_1342, _1238, _1304);
    float _1346 = _1318 * _956;
    float _1348 = _1318 * _978;
    float _1350 = -_1322;
    float _1352 = fma(_966, _1256, _1350);
    float _1354 = _1318 * _966;
    float _1356 = fma(_1288, _1256, _1328);
    float _1358 = fma(_1288, _1238, _1332);
    float _1360 = fma(_1292, _1256, _1346);
    float _1362 = fma(_1292, _1238, _1348);
    float _1364 = fma(_1286, _1326, _1336);
    float _1366 = fma(_1286, _1352, _1344);
    float _1368 = fma(_1288, _1232, _1330);
    float _1370 = fma(_1312, _1326, _1356);
    float _1372 = fma(_1312, _1352, _1358);
    float _1374 = _1240 * _1364;
    float _1376 = _1240 * _1366;
    float _1378 = fma(_1308, _1326, _1360);
    float _1380 = fma(_1308, _1352, _1362);
    float _1382 = fma(_1252, _1370, _1374);
    float _1384 = fma(_1252, _1372, _1376);
    float _1386 = fma(_1292, _1232, _1354);
    float _1388 = fma(_1286, _1296, _1340);
    float _1390 = fma(_1224, _1378, _1382);
    float _1392 = fma(_1224, _1380, _1384);
    float _1394 = fma(_1312, _1296, _1368);
    float _1396 = fma(_1308, _1296, _1386);
    int _1398 = _1300 << 4;
    int _1400 = _1398 + 1968;
    float _1402 = _1260 + _1390;
    float _1404 = _1222 + _1392;
    float _1406 = _1240 * _1388;
    int _1408 = _1400 + 8;
    uint _1411 = uint(int(uint(_1408) >> uint(2)));
    uint _1413 = uint(int(uint(int(_1411)) >> uint(2)));
    int _1415 = int(_1411) & 3;
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[int(_1413)][_1415];
    float _1419 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1421 = _1402 + _1419;
    float _1423 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1425 = _1404 + _1423;
    bool _1427 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1429 = isnan(_676);
    bool _1431 = _1427 || _1429;
    bool _1433 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1435 = _1431 || _1433;
    float _1437 = float(_1435);
    float _1439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1441 = _1421 * _1421;
    float _1443 = _1425 * _1425;
    bool _1445 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1447 = isnan(_676);
    bool _1449 = _1445 || _1447;
    bool _1451 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1453 = _1449 || _1451;
    float _1455 = float(_1453);
    uint _1457 = uint(int(uint(_1400) >> uint(2)));
    uint _1459 = uint(int(uint(int(_1457)) >> uint(2)));
    int _1461 = int(_1457) & 3;
    float _1463 = (*spvDescriptorSet0.vp_c9)._m0[int(_1459)][_1461];
    int _1465 = int(_1457) + 1;
    uint _1467 = uint(int(uint(_1465) >> uint(2)));
    int _1469 = _1465 & 3;
    float _1471 = (*spvDescriptorSet0.vp_c9)._m0[int(_1467)][_1469];
    float _1473 = _900 ? as_type<float>(_1206) : _1102;
    float _1475 = _1441 + _1443;
    float _1477 = fma(_1252, _1394, _1406);
    float _1479 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1481 = -_1437;
    float _1483 = _1481 + 1.0;
    float _1485 = _1220;
    int _1487 = as_type<int>(_1246);
    float _1489 = _1441;
    float _1491 = _1443;
    float _1493 = _1402;
    float _1495 = _1404;
    if (_906)
    {
        float _1497 = _1182 ? _1196 : _1102;
        _1212 = _1497;
    }
    float _1499 = _1212;
    float _1501 = fma(_1224, _1396, _1477);
    float _1503 = _1258;
    if (!_884)
    {
        _1485 = _1258;
    }
    float _1505 = _1485;
    float _1507 = _1455 * _1483;
    float _1509 = -_1455;
    float _1511 = _1509 + 1.0;
    float _1513 = _1226 + _1501;
    float _1515 = sqrt(_1475);
    float _1517 = _1439 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1519 = _1246 * _1507;
    float _1521 = fma(_1178, _858, _1513);
    float _1523 = _1505;
    int _1525 = as_type<int>(_1507);
    float _1527 = _1521;
    if (_884)
    {
        float _1529 = -_1258;
        float _1531 = _1529 + 1.0;
        _1487 = as_type<int>(_1531);
    }
    int _1533 = _1487;
    float _1535 = fma(_1517, _1499, -0.5);
    float _1537 = _1276 * _1507;
    float _1539 = fma(_866, _1198, _1521);
    float _1541 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1543 = _1479 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1545 = _1254 * _1507;
    if (_884)
    {
        float _1547 = _1176 ? as_type<float>(_1533) : _1258;
        _1523 = _1547;
    }
    float _1549 = _1523;
    if (_894)
    {
        float _1551 = -_1258;
        float _1553 = _1551 + 1.0;
        _1525 = as_type<int>(_1553);
    }
    int _1555 = _1525;
    float _1557 = fma(_862, _1184, _1539);
    float _1559 = fma(_1473, _1543, -0.5);
    float _1561 = -_1066;
    float _1563 = fma(_1050, _1535, _1561);
    bool _1565 = _1515 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_894)
    {
        float _1569 = _1216 ? as_type<float>(_1555) : _1258;
        _1503 = _1569;
    }
    float _1571 = _1503;
    float _1573 = fma(_1511, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1537);
    float _1575 = fma(_1511, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1519);
    float _1577 = fma(_1511, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1545);
    float _1579 = -_1078;
    float _1581 = fma(_1052, _1559, _1579);
    float _1583 = _1581;
    if (!_1565)
    {
        _1527 = _1557;
    }
    float _1585 = _1527;
    bool _1587 = !_1565;
    float _1589 = _1585;
    float _1591 = _1417;
    if (!_1587)
    {
        float _1593 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1595 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1597 = _1515 + _1595;
        float _1599 = _1557 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1601 = rsqrt(_1475);
        float _1603 = _1597 * _1593;
        float _1605 = _1603 * 0.15915493667125701904296875;
        float _1607 = _1605 * 6.283185482025146484375;
        float _1609 = sin(_1607);
        float _1611 = _1605 * 6.283185482025146484375;
        float _1613 = cos(_1611);
        float _1615 = fma(_1609, _1599, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1617 = _1601 * _1615;
        float _1619 = _1613 + (-1.0);
        float _1621 = fma(_1421, _1617, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1623 = fma(_1425, _1617, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1625 = _1619 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1627 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1629 = _1621 + _1627;
        float _1631 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1633 = _1623 + _1631;
        float _1635 = fma(_1557, _1613, _1625);
        float _1637 = _1629 * _1629;
        float _1639 = _1633 * _1633;
        _1589 = _1635;
        _1489 = _1637;
        _1491 = _1639;
        _1493 = _1621;
        _1495 = _1623;
    }
    float _1641 = _1589;
    float _1643 = _1489;
    float _1645 = _1491;
    float _1647 = _1493;
    float _1649 = _1495;
    float _1651 = _1567 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1653 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1655 = _1641 + _1653;
    float _1657 = in.m_63.w;
    float _1659 = _1541 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1661 = fma(_1651, _1571, -0.5);
    float _1663 = fma(_1655, _1655, _1643);
    float _1665 = _1463 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1667 = fma(_1437, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1573);
    float _1669 = _1471 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1671 = _1663 + _1645;
    float _1673 = fma(_1437, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1575);
    float _1675 = fma(_1437, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1577);
    float _1677 = fma(_1659, _1549, -0.5);
    float _1679 = fma(_1068, _1661, _1072);
    float _1681 = _1665 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1683 = sqrt(_1671);
    float _1685 = _1669 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1687 = _1667 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1689 = fma(_1048, _1677, _934);
    float _1691 = _1417 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1693 = _1673 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1695 = _1675 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1697 = _1563 + 0.5;
    float _1699 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1701 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1703 = _1581 + 0.5;
    float _1705 = _1687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1707 = _1693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1709 = _1689 + 0.5;
    float _1711 = _1679 + 0.5;
    float _1713 = _1695 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_69.w = _1657;
    bool _1715 = _1683 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1717 = isnan(_1683);
    bool _1719 = _1715 || _1717;
    bool _1721 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1723 = _1719 || _1721;
    out.m_71.x = _1681;
    out.m_71.y = _1685;
    out.m_71.z = _1701;
    out.m_73.x = _1709;
    out.m_73.y = _1697;
    out.m_73.z = _1711;
    out.m_73.w = _1703;
    out.m_75.x = _1705;
    out.m_75.y = _1707;
    out.m_75.z = _1713;
    out.m_75.w = _1699;
    float _1725 = _1679;
    float _1727 = _1681;
    float _1729 = _1701;
    if (!_1723)
    {
        _1725 = 1.0;
    }
    float _1731 = _1725;
    bool _1733 = !_1723;
    float _1735 = _1731;
    if (!_1733)
    {
        bool _1737 = _1683 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1739 = isnan(_1683);
        bool _1741 = _1737 || _1739;
        bool _1743 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1745 = _1741 || _1743;
        if (!_1745)
        {
            float _1747 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1749 = _1683 + _1747;
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
            bool _1767 = _1683 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1769 = isnan(_1683);
            bool _1771 = _1767 || _1769;
            bool _1773 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1775 = _1771 || _1773;
            if (!_1775)
            {
                float _1777 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1779 = _1683 + _1777;
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
    float _1799 = _1641 + _1797;
    float _1801 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1803 = _1647 + _1801;
    float _1805 = fma(_1799, _1795, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1807 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1809 = _1649 + _1807;
    float _1811 = fma(_1803, _1795, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1813 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1815 = _1805 + _1813;
    float _1817 = fma(_1809, _1795, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1819 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1821 = _1811 + _1819;
    float _1823 = _1815 * _1815;
    float _1825 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1827 = _1817 + _1825;
    float _1829 = fma(_1821, _1821, _1823);
    float _1831 = fma(_1827, _1827, _1829);
    float _1833 = rsqrt(_1831);
    float _1835 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1837 = _1821 * _1835;
    float _1839 = _1827 * _1835;
    float _1841 = _1837 * _1837;
    float _1843 = _1839 * _1839;
    float _1845 = _1841 + _1843;
    float _1847 = sqrt(_1845);
    bool _1849 = _1847 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1851 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1853 = _1847 + _1851;
    float _1855 = _1827;
    float _1857 = _1853;
    float _1859 = _1837;
    if (_1849)
    {
        float _1861 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1855 = _1861;
    }
    float _1863 = _1855;
    if (_1849)
    {
        float _1865 = rsqrt(_1845);
        _1727 = _1865;
    }
    float _1867 = _1727;
    float _1869 = _1867;
    if (_1849)
    {
        float _1871 = _1853 * _1863;
        _1857 = _1871;
    }
    float _1873 = _1857;
    if (_1849)
    {
        float _1875 = _1873 * 0.15915493667125701904296875;
        _1729 = _1875;
    }
    float _1877 = _1729;
    float _1879 = _1823;
    if (_1849)
    {
        float _1881 = _1877 * 6.283185482025146484375;
        float _1883 = sin(_1881);
        _1879 = _1883;
    }
    float _1885 = _1879;
    float _1887 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1889 = precise::max(0.0, _1887);
    float _1891 = _1833;
    float _1893 = _1889;
    float _1895 = _1887;
    if (_1849)
    {
        float _1897 = _1877 * 6.283185482025146484375;
        float _1899 = cos(_1897);
        _1891 = _1899;
    }
    float _1901 = _1891;
    float _1903 = -_1835;
    float _1905 = -_1889;
    float _1907 = fma(_1815, _1903, _1905);
    if (!_1849)
    {
        _1893 = _1839;
    }
    float _1909 = _1893;
    float _1911 = _1909;
    if (_1849)
    {
        float _1913 = _1907 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1895 = _1913;
    }
    float _1915 = _1895;
    float _1917 = sqrt(_1831);
    float _1919 = _1885;
    float _1921 = _1915;
    if (_1849)
    {
        float _1923 = fma(_1885, _1915, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1919 = _1923;
    }
    float _1925 = _1919;
    float _1927 = _1925;
    if (_1849)
    {
        float _1929 = _1901 + (-1.0);
        _1921 = _1929;
    }
    float _1931 = _1921;
    float _1933 = _1931;
    if (_1849)
    {
        float _1935 = _1867 * _1925;
        _1583 = _1935;
    }
    float _1937 = _1583;
    if (!_1849)
    {
        _1869 = _1907;
    }
    float _1939 = _1869;
    float _1941 = _1939;
    if (_1849)
    {
        float _1943 = _1931 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1591 = _1943;
    }
    float _1945 = _1591;
    if (_1849)
    {
        float _1947 = _1837 * _1937;
        _1859 = _1947;
    }
    float _1949 = _1859;
    if (!_1849)
    {
        _1927 = _1841;
    }
    float _1951 = _1927;
    float _1953 = _1951;
    if (_1849)
    {
        float _1955 = _1839 * _1937;
        _1911 = _1955;
    }
    float _1957 = _1911;
    if (_1849)
    {
        float _1959 = fma(_1907, _1901, _1945);
        _1941 = _1959;
    }
    float _1961 = _1941;
    if (_1849)
    {
        float _1963 = _1949 * _1949;
        _1953 = _1963;
    }
    float _1965 = _1953;
    if (!_1849)
    {
        _1933 = _1843;
    }
    float _1967 = _1933;
    float _1969 = _1967;
    if (_1849)
    {
        float _1971 = _1957 * _1957;
        _1969 = _1971;
    }
    float _1973 = _1969;
    float _1975 = fma(_1961, _1961, _1965);
    float _1977 = _1975 + _1973;
    float _1979 = _1805 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1981 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1983 = fma(_1917, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1981);
    float _1985 = precise::clamp(_1983, 0.0, 1.0);
    float _1987 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1989 = rsqrt(_1977);
    float _1991 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1979);
    float _1993 = _1805 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1995 = -_1985;
    float _1997 = _1995 + 1.0;
    float _1999 = _1805 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2001 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1991);
    float _2003 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1993);
    float _2005 = _1805 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2007 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1999);
    float _2009 = _2001 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2011 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2003);
    float _2013 = abs(_1997);
    float _2015 = log2(_2013);
    float _2017 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2005);
    float _2019 = _2009 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2021 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2007);
    float _2023 = _2011 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2025 = _1989 * _1949;
    float _2027 = -_2019;
    float _2029 = fma(_2027, _1987, 1.0);
    float _2031 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2017);
    float _2033 = _2021 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2035 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2037 = _1989 * _1961;
    float _2039 = _2025 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2041 = _1989 * _1957;
    float _2043 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2035);
    float _2045 = _2031 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2047 = -_2039;
    float _2049 = fma(_2037, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2047);
    float _2051 = _2015 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2053 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2043);
    float _2055 = log2(_2029);
    float _2057 = -_2041;
    float _2059 = fma(_2057, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2049);
    float _2061 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2063 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2053);
    float _2065 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2067 = fma(_2059, -0.5, 0.5);
    float _2069 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2061);
    float _2071 = fma(_2059, 0.5, 0.5);
    float _2073 = exp2(_2051);
    float _2075 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2065);
    float _2077 = _2037 + 1.0;
    float _2079 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2069);
    float _2081 = fma(_2071, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2083 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2075);
    float _2085 = 1.0 / _2063;
    float _2087 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2083);
    float _2089 = fma(_2071, _2081, -0.212114393711090087890625);
    float _2091 = _2055 * 0.693147182464599609375;
    float _2093 = fma(_2071, _2089, 1.570728778839111328125);
    float _2095 = sqrt(_2067);
    float _2097 = -_2037;
    float _2099 = fma(_2073, _2077, _2097);
    float _2101 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2079);
    float _2103 = fma(_2099, 0.5, 0.5);
    float _2105 = _2101 * _2085;
    float _2107 = _2087 * _2085;
    float _2109 = _2091 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2111 = fma(_2105, 0.5, 0.5);
    float _2113 = fma(_2107, -0.5, 0.5);
    float _2115 = _2095 * 0.636619746685028076171875;
    float3 _5439 = float3(_2111, _2113, _2109);
    float _2117 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5439, float3(0.0), isnan(_5439)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5439, float3(0.0), isnan(_5439)), level(0.0)).x;
    float3 _5450 = float3(_2111, _2113, _2109);
    float4 _2120 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5450, float3(0.0), isnan(_5450)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5450, float3(0.0), isnan(_5450)), level(0.0)).xyzw;
    float _2122 = _2120.x;
    float _2124 = _2120.y;
    float _2126 = _2120.z;
    float _2128 = _2120.w;
    float _2130 = -_2093;
    float _2132 = fma(_2115, _2130, 1.0);
    float2 _5472 = float2(_2132, _2103);
    float3 _2136 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5472, float2(0.0), isnan(_5472)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5472, float2(0.0), isnan(_5472)), level(0.0)).xyz;
    float _2138 = _2136.x;
    float _2140 = _2136.y;
    float _2142 = _2136.z;
    float _2144 = _2015 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2146 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2148 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2146);
    float _2150 = exp2(_2144);
    float _2152 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2148);
    float _2154 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2152);
    float _2156 = _2154 + _2063;
    out.gl_Position.x = _2101;
    out.gl_Position.y = _2087;
    out.gl_Position.z = _2154;
    out.gl_Position.w = _2063;
    float _2158 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2160 = _2156 * 0.5;
    float _2162 = -_2150;
    float _2164 = _2162 + 1.0;
    out.m_47.x = _2158;
    float _2166 = _2164 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.z = _2160;
    out.m_77.w = _2063;
    float _2168 = _2166 * _2117;
    float _2170 = -_2166;
    float _2172 = _2170 + 1.0;
    float _2174 = _2128 * _2168;
    float _2176 = _2128 * _2172;
    float _2178 = _2142 * _2168;
    float _2180 = fma(_2138, _2174, _2122);
    float _2182 = fma(_2140, _2174, _2124);
    float _2184 = fma(_2128, _2178, _2126);
    out.m_79.x = _2180;
    out.m_79.y = _2182;
    out.m_79.z = _2184;
    out.m_79.w = _2176;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1765 = false;
    bool _668 = false;
    bool _508 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2241 = as_type<float>(_114);
        out.gl_Position.z = _2241;
    }
    if (!_102)
    {
        return out;
    }
    float _118 = in.m_49.w;
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
        _108 = _140;
    }
    float _142 = _108;
    bool _144 = _132 >= _142;
    bool _146 = !_128;
    bool _148 = _144 || _146;
    float _150 = _142;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_47.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _116 = as_type<int>(_154);
    }
    int _156 = _116;
    float _158 = as_type<float>(_156);
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2313 = as_type<float>(_156);
        out.gl_Position.z = _2313;
    }
    if (_148)
    {
        return out;
    }
    float _160 = in.m_49.x;
    float _162 = in.m_49.y;
    float _164 = in.m_49.z;
    float _166 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    float _178 = _166;
    if (!_176)
    {
        float _180 = _166 * _166;
        float _182 = _180 * 0.5;
        _158 = _182;
    }
    float _184 = _158;
    float _186 = 0.0;
    float _188 = _184;
    if (!_176)
    {
        float _190 = _132 * _132;
        float _192 = _190 * 0.5;
        _186 = _192;
    }
    float _194 = _186;
    if (!_176)
    {
        float _196 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _196;
    }
    float _198 = _188;
    bool _200 = !_176;
    float _202 = _198;
    if (!_200)
    {
        float _204 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = log2(_204);
        float _208 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _210 = _208 + 1.0;
        float _212 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = _166 * _206;
        float _216 = 1.0 / _210;
        float _218 = _212 * 0.693147182464599609375;
        float _220 = exp2(_214);
        float _222 = 1.0 / _218;
        float _224 = _220 + (-1.0);
        float _226 = -_224;
        float _228 = fma(_226, _222, _166);
        float _230 = _228 * _216;
        float _232 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _134 = _218;
        _202 = _232;
        _136 = _220;
    }
    float _234 = _134;
    float _236 = _202;
    float _238 = _136;
    bool _240 = !_176;
    float _242 = _234;
    float _244 = _238;
    if (!_240)
    {
        float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = log2(_246);
        float _250 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _252 = _250 + 1.0;
        float _254 = 1.0 / _252;
        float _256 = _166 * _248;
        float _258 = exp2(_256);
        float _260 = -_258;
        float _262 = _260 + 1.0;
        float _264 = _262 * _254;
        _242 = _258;
        _244 = _252;
        _178 = _264;
    }
    float _266 = _242;
    float _268 = _244;
    float _270 = _178;
    float _272 = _268;
    float _274 = _266;
    if (!_176)
    {
        _272 = _132;
    }
    float _276 = _272;
    float _278 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _280 = _276;
    if (!_176)
    {
        float _282 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _274 = _282;
    }
    float _284 = _274;
    bool _286 = !_176;
    float _288 = _284;
    if (!_286)
    {
        float _290 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = log2(_290);
        float _294 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _296 = _294 + 1.0;
        float _298 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _300 = _132 * _292;
        float _302 = 1.0 / _296;
        float _304 = _298 * 0.693147182464599609375;
        float _306 = exp2(_300);
        float _308 = 1.0 / _304;
        float _310 = _306 + (-1.0);
        float _312 = -_310;
        float _314 = fma(_312, _308, _132);
        float _316 = _314 * _302;
        float _318 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _288 = _318;
    }
    float _320 = _288;
    bool _322 = !_176;
    if (!_322)
    {
        float _324 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _326 = log2(_324);
        float _328 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _330 = _328 + 1.0;
        float _332 = 1.0 / _330;
        float _334 = _132 * _326;
        float _336 = exp2(_334);
        float _338 = -_336;
        float _340 = _338 + 1.0;
        float _342 = _340 * _332;
        _280 = _342;
    }
    float _344 = _280;
    float _346 = fma(_270, _160, _278);
    float _348 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _350 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _352 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _354 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _356 = fma(_270, _162, _348);
    float _358 = fma(_344, _162, _350);
    float _360 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _362 = fma(_344, _160, _352);
    float _364 = fma(_270, _164, _354);
    float _366 = -_358;
    float _368 = _356 + _366;
    float _370 = fma(_344, _164, _360);
    float _372 = -_362;
    float _374 = _346 + _372;
    float _376 = in.m_51.y;
    float _378 = _368 * _368;
    float _380 = -_370;
    float _382 = _364 + _380;
    float _384 = in.m_53.y;
    float _386 = fma(_374, _374, _378);
    float _388 = in.m_55.y;
    float _390 = fma(_382, _382, _386);
    float _392 = in.m_51.x;
    float _394 = sqrt(_390);
    float _396 = in.m_51.z;
    float _398 = in.m_53.x;
    float _400 = in.m_55.x;
    float _402 = _368 * _376;
    float _404 = in.m_57.w;
    float _406 = _368 * _384;
    bool _408 = _394 >= 9.9999999747524270787835121154785e-07;
    bool _410 = isnan(_394);
    bool _412 = _408 || _410;
    bool _414 = isnan(9.9999999747524270787835121154785e-07);
    bool _416 = _412 || _414;
    float _418 = in.m_44.x;
    float _420 = in.m_44.y;
    float _422 = in.m_44.z;
    float _424 = _368 * _388;
    float _426 = _384 * _384;
    float _428 = in.m_53.z;
    float _430 = fma(_374, _392, _402);
    float _432 = fma(_376, _376, _426);
    float _434 = in.m_55.z;
    float _436 = fma(_382, _396, _430);
    float _438 = fma(_388, _388, _432);
    float _440 = fma(_374, _398, _406);
    float _442 = fma(_374, _400, _424);
    float _444 = fma(_356, _404, _420);
    float _446 = fma(_346, _404, _418);
    float _448 = fma(_364, _404, _422);
    float _450 = _356;
    if (_416)
    {
        _450 = _436;
    }
    float _452 = _450;
    float _454 = fma(_382, _428, _440);
    float _456 = fma(_382, _434, _442);
    float _458 = _452;
    float _460 = _454;
    float _462 = _456;
    float _464 = _454;
    float _466 = _452;
    float _468 = _456;
    if (!_416)
    {
        bool _470 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _472 = !_470;
        if (!_472)
        {
            float _474 = _384 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _476 = _376 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _478 = _388 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _480 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[16].x, _474);
            float _482 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[16].x, _476);
            float _484 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[16].x, _478);
            float _486 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[16].z, _480);
            float _488 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[16].z, _482);
            float _490 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[16].z, _484);
            float _492 = _486 * _486;
            float _494 = fma(_488, _488, _492);
            float _496 = fma(_490, _490, _494);
            float _498 = rsqrt(_496);
            float _500 = _498 * 9.9999999747524270787835121154785e-07;
            float _502 = _488 * _500;
            float _504 = _486 * _500;
            float _506 = _490 * _500;
            _464 = _504;
            _466 = _502;
            _468 = _506;
            _508 = true;
        }
        else
        {
            float _510 = _162 * _162;
            float _512 = fma(_160, _160, _510);
            float _514 = fma(_164, _164, _512);
            float _516 = sqrt(_514);
            bool _518 = _516 >= 9.9999999747524270787835121154785e-07;
            bool _520 = isnan(_516);
            bool _522 = _518 || _520;
            bool _524 = isnan(9.9999999747524270787835121154785e-07);
            bool _526 = _522 || _524;
            float _528 = _516;
            if (!_526)
            {
                float _530 = _420 * _420;
                float _532 = fma(_418, _418, _530);
                float _534 = fma(_422, _422, _532);
                float _536 = sqrt(_534);
                bool _538 = _536 >= 9.9999999747524270787835121154785e-07;
                bool _540 = isnan(_536);
                bool _542 = _538 || _540;
                bool _544 = isnan(9.9999999747524270787835121154785e-07);
                bool _546 = _542 || _544;
                float _548 = _438;
                if (!_546)
                {
                    float _550 = rsqrt(_438);
                    _548 = _550;
                }
                float _552 = _548;
                if (!_546)
                {
                    float _554 = _552 * 9.9999999747524270787835121154785e-07;
                    _528 = _554;
                }
                float _556 = _528;
                if (!_546)
                {
                    float _558 = _376 * _556;
                    _458 = _558;
                }
                float _560 = _458;
                _466 = _560;
                if (!_546)
                {
                    float _562 = _384 * _556;
                    _460 = _562;
                }
                float _564 = _460;
                _464 = _564;
                if (!_546)
                {
                    float _566 = _388 * _556;
                    _462 = _566;
                }
                float _568 = _462;
                bool _570 = !_546;
                _468 = _568;
                _508 = _570;
                if (!_508)
                {
                    float _572 = _384 * _420;
                    float _574 = _376 * _420;
                    float _576 = _388 * _420;
                    float _578 = fma(_418, _398, _572);
                    float _580 = fma(_418, _392, _574);
                    float _582 = fma(_418, _400, _576);
                    float _584 = fma(_422, _428, _578);
                    float _586 = fma(_422, _396, _580);
                    float _588 = fma(_422, _434, _582);
                    float _590 = _584 * _584;
                    float _592 = fma(_586, _586, _590);
                    float _594 = fma(_588, _588, _592);
                    float _596 = rsqrt(_594);
                    float _598 = _596 * 9.9999999747524270787835121154785e-07;
                    float _600 = _586 * _598;
                    float _602 = _584 * _598;
                    float _604 = _588 * _598;
                    _464 = _602;
                    _466 = _600;
                    _468 = _604;
                    _508 = true;
                }
            }
            else
            {
                float _606 = _384 * _162;
                float _608 = _376 * _162;
                float _610 = _388 * _162;
                float _612 = fma(_160, _398, _606);
                float _614 = fma(_160, _392, _608);
                float _616 = fma(_160, _400, _610);
                float _618 = fma(_164, _428, _612);
                float _620 = fma(_164, _396, _614);
                float _622 = fma(_164, _434, _616);
                float _624 = _618 * _618;
                float _626 = fma(_620, _620, _624);
                float _628 = fma(_622, _622, _626);
                float _630 = rsqrt(_628);
                float _632 = _630 * 9.9999999747524270787835121154785e-07;
                float _634 = _620 * _632;
                float _636 = _618 * _632;
                float _638 = _622 * _632;
                _464 = _636;
                _466 = _634;
                _468 = _638;
            }
        }
    }
    _508 = false;
    float _640 = _464;
    float _642 = _466;
    float _644 = _468;
    bool _646 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    bool _648 = !_646;
    float _666;
    if (!_648)
    {
        float _650 = in.m_59.x;
        float _652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _654 = _650 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _656 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[11].x, _132);
        float _658 = _656 * _652;
        float _660 = floor(_658);
        float _662 = -_660;
        float _664 = _658 + _662;
        _666 = _664;
        _668 = true;
    }
    else
    {
        float _670 = float(_98);
        float _672 = 1.0 / _670;
        float _674 = _132 * _672;
        _666 = _674;
    }
    _668 = false;
    float _676 = _666;
    float _678 = in.m_59.z;
    float _680 = _444 * _376;
    float _682 = _444 * _388;
    float _684 = _444 * _384;
    float _686 = in.m_59.x;
    float _688 = fma(_446, _392, _680);
    float _690 = fma(_446, _400, _682);
    float _692 = fma(_446, _398, _684);
    float _694 = in.m_59.y;
    float _696 = fma(_448, _396, _688);
    float _698 = in.m_57.x;
    float _700 = in.m_57.y;
    float _702 = in.m_57.z;
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _706 = _704 != 0;
    float _708 = fma(_448, _428, _692);
    float _710 = in.m_61.x;
    float _712 = in.m_61.y;
    float _714 = in.m_61.z;
    float _716 = fma(_448, _434, _690);
    float _718 = in.m_59.w;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _722 = _676 + _720;
    float _724 = _678 * 2.0;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _728 = 0.0;
    if (!_706)
    {
        _728 = _678;
    }
    float _730 = _728;
    float _732 = _686 * 2.0;
    float _734 = 0.0;
    float _736 = _730;
    if (!_706)
    {
        _734 = _678;
    }
    float _738 = _734;
    float _740 = floor(_724);
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _744 = 0.0;
    float _746 = _738;
    if (!_706)
    {
        _744 = _694;
    }
    float _748 = _744;
    float _750 = _748;
    if (_706)
    {
        _750 = _686;
    }
    float _752 = _750;
    float _754 = _702 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    if (_706)
    {
        _736 = _694;
    }
    float _756 = _736;
    float _758 = floor(_732);
    if (_706)
    {
        _746 = _694;
    }
    float _760 = _746;
    float _762 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[83].z, _742);
    float _764 = _756 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _766 = _740 > 0.0;
    float _768 = fma(_764, -2.0, _726);
    bool _770 = _740 >= 0.0;
    bool _772 = isnan(_740);
    bool _774 = _770 || _772;
    bool _776 = isnan(0.0);
    bool _778 = _774 || _776;
    int _780 = _778 ? 0 : 1;
    bool _782 = _758 > 0.0;
    bool _784 = _758 >= 0.0;
    bool _786 = isnan(_758);
    bool _788 = _784 || _786;
    bool _790 = isnan(0.0);
    bool _792 = _788 || _790;
    float _794 = in.m_63.x;
    float _796 = in.m_63.y;
    float _798 = in.m_63.z;
    int _800 = ~_780;
    int _802 = _800 + 1;
    int _804 = _802 + 1;
    int _806 = _792 ? 0 : 1;
    int _808 = _804;
    if (!_766)
    {
        int _810 = ~_780;
        int _812 = _810 + 1;
        _808 = _812;
    }
    int _814 = _808;
    int _816 = ~_806;
    int _818 = _816 + 1;
    int _820 = _818 + 1;
    int _822 = _820;
    if (!_782)
    {
        int _824 = ~_806;
        int _826 = _824 + 1;
        _822 = _826;
    }
    int _828 = _822;
    int _830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _832 = _830 != 0;
    int _834 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _836 = _834 != 0;
    int _838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _840 = _838 != 0;
    float _842 = _698 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _844 = !_832;
    int _846 = _844 ? 0 : 1;
    float _848 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _710);
    float _850 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _714);
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _854 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _712);
    bool _856 = _718 > 0.5;
    float _858 = _798 * _798;
    float _860 = _694 * 2.0;
    float _862 = _796 * _796;
    float _864 = _686 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _866 = _794 * _794;
    float _868 = floor(_860);
    float _870 = _686 + _694;
    float _872 = -_852;
    float _874 = fma(_864, 2.0, _872);
    float _876 = _640 * _640;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _880 = _694 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _884 = _882 != 0;
    float _886 = fma(_642, _642, _876);
    float _888 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _890 = log2(_888);
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _894 = _892 != 0;
    float _896 = _870 + (-1.0);
    int _898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _900 = _898 != 0;
    float _902 = fma(_880, -2.0, _878);
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _906 = _904 != 0;
    float _908 = _700 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _910 = fma(_644, _644, _886);
    bool _912 = !_836;
    int _914 = _912 ? 0 : 1;
    float _916 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _918 = _868 >= 0.0;
    bool _920 = isnan(_868);
    bool _922 = _918 || _920;
    bool _924 = isnan(0.0);
    bool _926 = _922 || _924;
    float _928 = _694 + _678;
    float _930 = rsqrt(_910);
    float _932 = -_132;
    float _934 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[76].x, _874);
    int _936 = _926 ? 0 : 1;
    float _938 = _890 * _132;
    bool _940 = _868 > 0.0;
    float _942 = _928 + (-1.0);
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _946 = exp2(_938);
    float _948 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _950 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[83].w, _944);
    float _952 = _752 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _954 = abs(_846);
    float _956 = _930 * _642;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _960 = ~_936;
    int _962 = _960 + 1;
    int _964 = _962 + 1;
    float _966 = _930 * _640;
    int _968 = _964;
    bool _970 = _856;
    if (!_940)
    {
        int _972 = ~_936;
        int _974 = _972 + 1;
        _968 = _974;
    }
    int _976 = _968;
    float _978 = _930 * _644;
    int _980 = abs(_914);
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _984 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _986 = isnan(0.0);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _992 = _988 || _990;
    float _994 = -_958;
    float _996 = fma(_952, 2.0, _994);
    float _998 = -_946;
    float _1000 = _998 + 1.0;
    float _1002 = in.m_65.x;
    float _1004 = in.m_65.y;
    float _1006 = in.m_65.z;
    float _1008 = float(_954);
    float _1010 = float(_814);
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1014 = _992 ? _1000 : 0.0;
    float _1016 = in.m_55.w;
    bool _1018 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1020 = isnan(1.0);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1026 = _1022 || _1024;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1030 = 1.0 + _1028;
    bool _1032 = !_840;
    int _1034 = _1032 ? 0 : 1;
    float _1036 = _1008 * _1010;
    float _1038 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[78].z, _982);
    float _1040 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1012);
    float _1042 = float(_828);
    float _1044 = 1.0 / _1030;
    int _1046 = abs(_1034);
    float _1048 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1038);
    float _1050 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1040);
    float _1052 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _950);
    float _1054 = float(_980);
    float _1056 = _1036 * (-2.0);
    float _1058 = float(_1046);
    float _1060 = in.m_53.w;
    float _1062 = float(_976);
    float _1064 = _1054 * _1042;
    float _1066 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _902);
    float _1068 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _762);
    float _1070 = -_132;
    float _1072 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[81].x, _996);
    float _1074 = _1058 * _1062;
    float _1076 = _1064 * (-2.0);
    float _1078 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _768);
    bool _1080 = _1026;
    if (_1026)
    {
        float _1082 = _1014 * _1044;
        _138 = _1082;
    }
    float _1084 = _138;
    float _1086 = _1074 * (-2.0);
    float _1088 = fma(_916, _1056, _916);
    float _1090 = fma(_1076, _1004, _1004);
    float _1092 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1094 = _978 * _1092;
    float _1096 = fma(_1086, _1006, _1006);
    float _1098 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1100 = _966 * _1098;
    float _1102 = in.m_67.y;
    float _1104 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1106 = _956 * _1104;
    float _1108 = fma(_1056, _1002, _1002);
    float _1110 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1112 = -_1094;
    float _1114 = fma(_956, _1110, _1112);
    float _1116 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1118 = -_1100;
    float _1120 = fma(_978, _1116, _1118);
    float _1122 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1124 = -_1106;
    float _1126 = fma(_966, _1122, _1124);
    float _1128 = fma(_948, _1076, _948);
    float _1130 = _694 + (-0.5);
    float _1132 = _1114 * _1114;
    float _1134 = _686 + _678;
    float _1136 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1090);
    float _1138 = _686 + (-0.5);
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1140;
    float _1144 = fma(_1120, _1120, _1132);
    float _1146 = _1134 + (-1.0);
    float _1148 = fma(_1128, _1084, _1136);
    float _1150 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1108);
    float _1152 = fma(_1126, _1126, _1144);
    float _1154 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1156 = 1.0 / _1142;
    float _1158 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1160 = _1148 * 0.15915493667125701904296875;
    float _1162 = _678 + (-0.5);
    float _1164 = fma(_1088, _1084, _1150);
    float _1166 = fma(_1154, _1086, _1154);
    float _1168 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1096);
    float _1170 = rsqrt(_1152);
    float _1172 = _1164 * 0.15915493667125701904296875;
    if (_884)
    {
        bool _1174 = _686 > 0.5;
        _1080 = _1174;
    }
    bool _1176 = _1080;
    float _1178 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[191].x, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _1180 = fma(_1166, _1084, _1168);
    bool _1182 = _694 > 0.5;
    float _1184 = fma((*spvDescriptorSet0.vp_c9)._m0[191].x, _678, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _1186 = _908 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1188 = _1172 * 6.283185482025146484375;
    float _1190 = sin(_1188);
    float _1192 = _1158 * _686;
    float _1194 = -_1102;
    float _1196 = _1194 + 1.0;
    float _1198 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[191].x, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _1200 = _754 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1202 = _1180 * 0.15915493667125701904296875;
    float _1204 = in.m_51.w;
    int _1206 = _856 ? as_type<int>(_1196) : as_type<int>(_1102);
    float _1208 = _1172 * 6.283185482025146484375;
    float _1210 = cos(_1208);
    float _1212 = _1102;
    if (_894)
    {
        bool _1214 = _678 > 0.5;
        _970 = _1214;
    }
    bool _1216 = _970;
    float _1218 = _842 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1220 = _722 * _1156;
    float _1222 = _716 + _1016;
    float _1224 = _1200 * _850;
    float _1226 = _708 + _1060;
    float _1228 = _1160 * 6.283185482025146484375;
    float _1230 = sin(_1228);
    float _1232 = _1114 * _1170;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1234;
    float _1238 = _1126 * _1170;
    float _1240 = _1186 * _854;
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1242;
    float _1246 = fma(_1236, _1220, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1248 = _1160 * 6.283185482025146484375;
    float _1250 = cos(_1248);
    float _1252 = _1218 * _848;
    float _1254 = fma(_1244, _1220, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1256 = _1120 * _1170;
    float _1258 = in.m_67.x;
    float _1260 = _696 + _1204;
    float _1262 = _978 * _1256;
    float _1264 = _1202 * 6.283185482025146484375;
    float _1266 = cos(_1264);
    float _1268 = _1190 * _1230;
    float _1270 = _1210 * _1230;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1272;
    float _1276 = fma(_1274, _1220, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1278 = _1202 * 6.283185482025146484375;
    float _1280 = sin(_1278);
    float _1282 = _1210 * _1250;
    float _1284 = _1190 * _1250;
    float _1286 = _1190 * _1266;
    float _1288 = _1250 * _1266;
    float _1290 = _1210 * _1266;
    float _1292 = _1230 * _1266;
    float _1294 = -_1262;
    float _1296 = fma(_956, _1238, _1294);
    float _1298 = trunc(_1192);
    int _1300 = int(_1298);
    float _1302 = _1290 * _956;
    float _1304 = _1290 * _978;
    float _1306 = fma(_1280, _1282, _1268);
    float _1308 = fma(_1280, _1268, _1282);
    float _1310 = -_1270;
    float _1312 = fma(_1280, _1284, _1310);
    float _1314 = _966 * _1238;
    float _1316 = -_1284;
    float _1318 = fma(_1280, _1270, _1316);
    float _1320 = _1290 * _966;
    float _1322 = _956 * _1232;
    float _1324 = -_1314;
    float _1326 = fma(_978, _1232, _1324);
    float _1328 = _1306 * _956;
    float _1330 = _1306 * _966;
    float _1332 = _1306 * _978;
    float _1334 = -_1280;
    float _1336 = fma(_1334, _1256, _1302);
    float _1338 = -_1280;
    float _1340 = fma(_1338, _1232, _1320);
    float _1342 = -_1280;
    float _1344 = fma(_1342, _1238, _1304);
    float _1346 = _1318 * _956;
    float _1348 = _1318 * _978;
    float _1350 = -_1322;
    float _1352 = fma(_966, _1256, _1350);
    float _1354 = _1318 * _966;
    float _1356 = fma(_1288, _1256, _1328);
    float _1358 = fma(_1288, _1238, _1332);
    float _1360 = fma(_1292, _1256, _1346);
    float _1362 = fma(_1292, _1238, _1348);
    float _1364 = fma(_1286, _1326, _1336);
    float _1366 = fma(_1286, _1352, _1344);
    float _1368 = fma(_1288, _1232, _1330);
    float _1370 = fma(_1312, _1326, _1356);
    float _1372 = fma(_1312, _1352, _1358);
    float _1374 = _1240 * _1364;
    float _1376 = _1240 * _1366;
    float _1378 = fma(_1308, _1326, _1360);
    float _1380 = fma(_1308, _1352, _1362);
    float _1382 = fma(_1252, _1370, _1374);
    float _1384 = fma(_1252, _1372, _1376);
    float _1386 = fma(_1292, _1232, _1354);
    float _1388 = fma(_1286, _1296, _1340);
    float _1390 = fma(_1224, _1378, _1382);
    float _1392 = fma(_1224, _1380, _1384);
    float _1394 = fma(_1312, _1296, _1368);
    float _1396 = fma(_1308, _1296, _1386);
    int _1398 = _1300 << 4;
    int _1400 = _1398 + 1968;
    float _1402 = _1260 + _1390;
    float _1404 = _1222 + _1392;
    float _1406 = _1240 * _1388;
    int _1408 = _1400 + 8;
    uint _1411 = uint(int(uint(_1408) >> uint(2)));
    uint _1413 = uint(int(uint(int(_1411)) >> uint(2)));
    int _1415 = int(_1411) & 3;
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[int(_1413)][_1415];
    float _1419 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1421 = _1402 + _1419;
    float _1423 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1425 = _1404 + _1423;
    bool _1427 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1429 = isnan(_676);
    bool _1431 = _1427 || _1429;
    bool _1433 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1435 = _1431 || _1433;
    float _1437 = float(_1435);
    float _1439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1441 = _1421 * _1421;
    float _1443 = _1425 * _1425;
    bool _1445 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1447 = isnan(_676);
    bool _1449 = _1445 || _1447;
    bool _1451 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1453 = _1449 || _1451;
    float _1455 = float(_1453);
    uint _1457 = uint(int(uint(_1400) >> uint(2)));
    uint _1459 = uint(int(uint(int(_1457)) >> uint(2)));
    int _1461 = int(_1457) & 3;
    float _1463 = (*spvDescriptorSet0.vp_c9)._m0[int(_1459)][_1461];
    int _1465 = int(_1457) + 1;
    uint _1467 = uint(int(uint(_1465) >> uint(2)));
    int _1469 = _1465 & 3;
    float _1471 = (*spvDescriptorSet0.vp_c9)._m0[int(_1467)][_1469];
    float _1473 = _900 ? as_type<float>(_1206) : _1102;
    float _1475 = _1441 + _1443;
    float _1477 = fma(_1252, _1394, _1406);
    float _1479 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1481 = -_1437;
    float _1483 = _1481 + 1.0;
    float _1485 = _1220;
    int _1487 = as_type<int>(_1246);
    float _1489 = _1441;
    float _1491 = _1443;
    float _1493 = _1402;
    float _1495 = _1404;
    if (_906)
    {
        float _1497 = _1182 ? _1196 : _1102;
        _1212 = _1497;
    }
    float _1499 = _1212;
    float _1501 = fma(_1224, _1396, _1477);
    float _1503 = _1258;
    if (!_884)
    {
        _1485 = _1258;
    }
    float _1505 = _1485;
    float _1507 = _1455 * _1483;
    float _1509 = -_1455;
    float _1511 = _1509 + 1.0;
    float _1513 = _1226 + _1501;
    float _1515 = sqrt(_1475);
    float _1517 = _1439 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1519 = _1246 * _1507;
    float _1521 = fma(_1178, _858, _1513);
    float _1523 = _1505;
    int _1525 = as_type<int>(_1507);
    float _1527 = _1521;
    if (_884)
    {
        float _1529 = -_1258;
        float _1531 = _1529 + 1.0;
        _1487 = as_type<int>(_1531);
    }
    int _1533 = _1487;
    float _1535 = fma(_1517, _1499, -0.5);
    float _1537 = _1276 * _1507;
    float _1539 = fma(_866, _1198, _1521);
    float _1541 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1543 = _1479 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1545 = _1254 * _1507;
    if (_884)
    {
        float _1547 = _1176 ? as_type<float>(_1533) : _1258;
        _1523 = _1547;
    }
    float _1549 = _1523;
    if (_894)
    {
        float _1551 = -_1258;
        float _1553 = _1551 + 1.0;
        _1525 = as_type<int>(_1553);
    }
    int _1555 = _1525;
    float _1557 = fma(_862, _1184, _1539);
    float _1559 = fma(_1473, _1543, -0.5);
    float _1561 = -_1066;
    float _1563 = fma(_1050, _1535, _1561);
    bool _1565 = _1515 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_894)
    {
        float _1569 = _1216 ? as_type<float>(_1555) : _1258;
        _1503 = _1569;
    }
    float _1571 = _1503;
    float _1573 = fma(_1511, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1537);
    float _1575 = fma(_1511, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1519);
    float _1577 = fma(_1511, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1545);
    float _1579 = -_1078;
    float _1581 = fma(_1052, _1559, _1579);
    float _1583 = _1581;
    if (!_1565)
    {
        _1527 = _1557;
    }
    float _1585 = _1527;
    bool _1587 = !_1565;
    float _1589 = _1585;
    float _1591 = _1417;
    if (!_1587)
    {
        float _1593 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1595 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1597 = _1515 + _1595;
        float _1599 = _1557 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1601 = rsqrt(_1475);
        float _1603 = _1597 * _1593;
        float _1605 = _1603 * 0.15915493667125701904296875;
        float _1607 = _1605 * 6.283185482025146484375;
        float _1609 = sin(_1607);
        float _1611 = _1605 * 6.283185482025146484375;
        float _1613 = cos(_1611);
        float _1615 = fma(_1609, _1599, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1617 = _1601 * _1615;
        float _1619 = _1613 + (-1.0);
        float _1621 = fma(_1421, _1617, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1623 = fma(_1425, _1617, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1625 = _1619 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1627 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1629 = _1621 + _1627;
        float _1631 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1633 = _1623 + _1631;
        float _1635 = fma(_1557, _1613, _1625);
        float _1637 = _1629 * _1629;
        float _1639 = _1633 * _1633;
        _1589 = _1635;
        _1489 = _1637;
        _1491 = _1639;
        _1493 = _1621;
        _1495 = _1623;
    }
    float _1641 = _1589;
    float _1643 = _1489;
    float _1645 = _1491;
    float _1647 = _1493;
    float _1649 = _1495;
    float _1651 = _1567 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1653 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1655 = _1641 + _1653;
    float _1657 = in.m_63.w;
    float _1659 = _1541 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1661 = fma(_1651, _1571, -0.5);
    float _1663 = fma(_1655, _1655, _1643);
    float _1665 = _1463 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1667 = fma(_1437, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1573);
    float _1669 = _1471 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1671 = _1663 + _1645;
    float _1673 = fma(_1437, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1575);
    float _1675 = fma(_1437, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1577);
    float _1677 = fma(_1659, _1549, -0.5);
    float _1679 = fma(_1068, _1661, _1072);
    float _1681 = _1665 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1683 = sqrt(_1671);
    float _1685 = _1669 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1687 = _1667 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1689 = fma(_1048, _1677, _934);
    float _1691 = _1417 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1693 = _1673 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1695 = _1675 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1697 = _1563 + 0.5;
    float _1699 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1701 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1703 = _1581 + 0.5;
    float _1705 = _1687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1707 = _1693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1709 = _1689 + 0.5;
    float _1711 = _1679 + 0.5;
    float _1713 = _1695 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_69.w = _1657;
    bool _1715 = _1683 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1717 = isnan(_1683);
    bool _1719 = _1715 || _1717;
    bool _1721 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1723 = _1719 || _1721;
    out.m_71.x = _1681;
    out.m_71.y = _1685;
    out.m_71.z = _1701;
    out.m_73.x = _1709;
    out.m_73.y = _1697;
    out.m_73.z = _1711;
    out.m_73.w = _1703;
    out.m_75.x = _1705;
    out.m_75.y = _1707;
    out.m_75.z = _1713;
    out.m_75.w = _1699;
    float _1725 = _1679;
    float _1727 = _1681;
    float _1729 = _1701;
    if (!_1723)
    {
        _1725 = 1.0;
    }
    float _1731 = _1725;
    bool _1733 = !_1723;
    float _1735 = _1731;
    if (!_1733)
    {
        bool _1737 = _1683 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1739 = isnan(_1683);
        bool _1741 = _1737 || _1739;
        bool _1743 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1745 = _1741 || _1743;
        if (!_1745)
        {
            float _1747 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1749 = _1683 + _1747;
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
            bool _1767 = _1683 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1769 = isnan(_1683);
            bool _1771 = _1767 || _1769;
            bool _1773 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1775 = _1771 || _1773;
            if (!_1775)
            {
                float _1777 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1779 = _1683 + _1777;
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
    float _1799 = _1641 + _1797;
    float _1801 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1803 = _1647 + _1801;
    float _1805 = fma(_1799, _1795, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1807 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1809 = _1649 + _1807;
    float _1811 = fma(_1803, _1795, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1813 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1815 = _1805 + _1813;
    float _1817 = fma(_1809, _1795, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1819 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1821 = _1811 + _1819;
    float _1823 = _1815 * _1815;
    float _1825 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1827 = _1817 + _1825;
    float _1829 = fma(_1821, _1821, _1823);
    float _1831 = fma(_1827, _1827, _1829);
    float _1833 = rsqrt(_1831);
    float _1835 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1837 = _1821 * _1835;
    float _1839 = _1827 * _1835;
    float _1841 = _1837 * _1837;
    float _1843 = _1839 * _1839;
    float _1845 = _1841 + _1843;
    float _1847 = sqrt(_1845);
    bool _1849 = _1847 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1851 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1853 = _1847 + _1851;
    float _1855 = _1827;
    float _1857 = _1853;
    float _1859 = _1837;
    if (_1849)
    {
        float _1861 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1855 = _1861;
    }
    float _1863 = _1855;
    if (_1849)
    {
        float _1865 = rsqrt(_1845);
        _1727 = _1865;
    }
    float _1867 = _1727;
    float _1869 = _1867;
    if (_1849)
    {
        float _1871 = _1853 * _1863;
        _1857 = _1871;
    }
    float _1873 = _1857;
    if (_1849)
    {
        float _1875 = _1873 * 0.15915493667125701904296875;
        _1729 = _1875;
    }
    float _1877 = _1729;
    float _1879 = _1823;
    if (_1849)
    {
        float _1881 = _1877 * 6.283185482025146484375;
        float _1883 = sin(_1881);
        _1879 = _1883;
    }
    float _1885 = _1879;
    float _1887 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1889 = precise::max(0.0, _1887);
    float _1891 = _1833;
    float _1893 = _1889;
    float _1895 = _1887;
    if (_1849)
    {
        float _1897 = _1877 * 6.283185482025146484375;
        float _1899 = cos(_1897);
        _1891 = _1899;
    }
    float _1901 = _1891;
    float _1903 = -_1835;
    float _1905 = -_1889;
    float _1907 = fma(_1815, _1903, _1905);
    if (!_1849)
    {
        _1893 = _1839;
    }
    float _1909 = _1893;
    float _1911 = _1909;
    if (_1849)
    {
        float _1913 = _1907 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1895 = _1913;
    }
    float _1915 = _1895;
    float _1917 = sqrt(_1831);
    float _1919 = _1885;
    float _1921 = _1915;
    if (_1849)
    {
        float _1923 = fma(_1885, _1915, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1919 = _1923;
    }
    float _1925 = _1919;
    float _1927 = _1925;
    if (_1849)
    {
        float _1929 = _1901 + (-1.0);
        _1921 = _1929;
    }
    float _1931 = _1921;
    float _1933 = _1931;
    if (_1849)
    {
        float _1935 = _1867 * _1925;
        _1583 = _1935;
    }
    float _1937 = _1583;
    if (!_1849)
    {
        _1869 = _1907;
    }
    float _1939 = _1869;
    float _1941 = _1939;
    if (_1849)
    {
        float _1943 = _1931 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1591 = _1943;
    }
    float _1945 = _1591;
    if (_1849)
    {
        float _1947 = _1837 * _1937;
        _1859 = _1947;
    }
    float _1949 = _1859;
    if (!_1849)
    {
        _1927 = _1841;
    }
    float _1951 = _1927;
    float _1953 = _1951;
    if (_1849)
    {
        float _1955 = _1839 * _1937;
        _1911 = _1955;
    }
    float _1957 = _1911;
    if (_1849)
    {
        float _1959 = fma(_1907, _1901, _1945);
        _1941 = _1959;
    }
    float _1961 = _1941;
    if (_1849)
    {
        float _1963 = _1949 * _1949;
        _1953 = _1963;
    }
    float _1965 = _1953;
    if (!_1849)
    {
        _1933 = _1843;
    }
    float _1967 = _1933;
    float _1969 = _1967;
    if (_1849)
    {
        float _1971 = _1957 * _1957;
        _1969 = _1971;
    }
    float _1973 = _1969;
    float _1975 = fma(_1961, _1961, _1965);
    float _1977 = _1975 + _1973;
    float _1979 = _1805 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1981 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1983 = fma(_1917, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1981);
    float _1985 = precise::clamp(_1983, 0.0, 1.0);
    float _1987 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1989 = rsqrt(_1977);
    float _1991 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1979);
    float _1993 = _1805 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1995 = -_1985;
    float _1997 = _1995 + 1.0;
    float _1999 = _1805 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2001 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1991);
    float _2003 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1993);
    float _2005 = _1805 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2007 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1999);
    float _2009 = _2001 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2011 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2003);
    float _2013 = abs(_1997);
    float _2015 = log2(_2013);
    float _2017 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2005);
    float _2019 = _2009 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2021 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2007);
    float _2023 = _2011 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2025 = _1989 * _1949;
    float _2027 = -_2019;
    float _2029 = fma(_2027, _1987, 1.0);
    float _2031 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2017);
    float _2033 = _2021 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2035 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2037 = _1989 * _1961;
    float _2039 = _2025 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2041 = _1989 * _1957;
    float _2043 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2035);
    float _2045 = _2031 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2047 = -_2039;
    float _2049 = fma(_2037, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2047);
    float _2051 = _2015 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2053 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2043);
    float _2055 = log2(_2029);
    float _2057 = -_2041;
    float _2059 = fma(_2057, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2049);
    float _2061 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2063 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2053);
    float _2065 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2067 = fma(_2059, -0.5, 0.5);
    float _2069 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2061);
    float _2071 = fma(_2059, 0.5, 0.5);
    float _2073 = exp2(_2051);
    float _2075 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2065);
    float _2077 = _2037 + 1.0;
    float _2079 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2069);
    float _2081 = fma(_2071, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2083 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2075);
    float _2085 = 1.0 / _2063;
    float _2087 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2083);
    float _2089 = fma(_2071, _2081, -0.212114393711090087890625);
    float _2091 = _2055 * 0.693147182464599609375;
    float _2093 = fma(_2071, _2089, 1.570728778839111328125);
    float _2095 = sqrt(_2067);
    float _2097 = -_2037;
    float _2099 = fma(_2073, _2077, _2097);
    float _2101 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2079);
    float _2103 = fma(_2099, 0.5, 0.5);
    float _2105 = _2101 * _2085;
    float _2107 = _2087 * _2085;
    float _2109 = _2091 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2111 = fma(_2105, 0.5, 0.5);
    float _2113 = fma(_2107, -0.5, 0.5);
    float _2115 = _2095 * 0.636619746685028076171875;
    float3 _5439 = float3(_2111, _2113, _2109);
    float _2117 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5439, float3(0.0), isnan(_5439)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5439, float3(0.0), isnan(_5439)), level(0.0)).x;
    float3 _5450 = float3(_2111, _2113, _2109);
    float4 _2120 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5450, float3(0.0), isnan(_5450)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5450, float3(0.0), isnan(_5450)), level(0.0)).xyzw;
    float _2122 = _2120.x;
    float _2124 = _2120.y;
    float _2126 = _2120.z;
    float _2128 = _2120.w;
    float _2130 = -_2093;
    float _2132 = fma(_2115, _2130, 1.0);
    float2 _5472 = float2(_2132, _2103);
    float3 _2136 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5472, float2(0.0), isnan(_5472)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5472, float2(0.0), isnan(_5472)), level(0.0)).xyz;
    float _2138 = _2136.x;
    float _2140 = _2136.y;
    float _2142 = _2136.z;
    float _2144 = _2015 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2146 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2148 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2146);
    float _2150 = exp2(_2144);
    float _2152 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2148);
    float _2154 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2152);
    float _2156 = _2154 + _2063;
    out.gl_Position.x = _2101;
    out.gl_Position.y = _2087;
    out.gl_Position.z = _2154;
    out.gl_Position.w = _2063;
    float _2158 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2160 = _2156 * 0.5;
    float _2162 = -_2150;
    float _2164 = _2162 + 1.0;
    out.m_47.x = _2158;
    float _2166 = _2164 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.z = _2160;
    out.m_77.w = _2063;
    float _2168 = _2166 * _2117;
    float _2170 = -_2166;
    float _2172 = _2170 + 1.0;
    float _2174 = _2128 * _2168;
    float _2176 = _2128 * _2172;
    float _2178 = _2142 * _2168;
    float _2180 = fma(_2138, _2174, _2122);
    float _2182 = fma(_2140, _2174, _2124);
    float _2184 = fma(_2128, _2178, _2126);
    out.m_79.x = _2180;
    out.m_79.y = _2182;
    out.m_79.z = _2184;
    out.m_79.w = _2176;
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1765 = false;
    bool _668 = false;
    bool _508 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2241 = as_type<float>(_114);
        out.gl_Position.z = _2241;
    }
    if (!_102)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _118 = in.m_49.w;
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
        _108 = _140;
    }
    float _142 = _108;
    bool _144 = _132 >= _142;
    bool _146 = !_128;
    bool _148 = _144 || _146;
    float _150 = _142;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_47.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _116 = as_type<int>(_154);
    }
    int _156 = _116;
    float _158 = as_type<float>(_156);
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2313 = as_type<float>(_156);
        out.gl_Position.z = _2313;
    }
    if (_148)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _160 = in.m_49.x;
    float _162 = in.m_49.y;
    float _164 = in.m_49.z;
    float _166 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    float _178 = _166;
    if (!_176)
    {
        float _180 = _166 * _166;
        float _182 = _180 * 0.5;
        _158 = _182;
    }
    float _184 = _158;
    float _186 = 0.0;
    float _188 = _184;
    if (!_176)
    {
        float _190 = _132 * _132;
        float _192 = _190 * 0.5;
        _186 = _192;
    }
    float _194 = _186;
    if (!_176)
    {
        float _196 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _196;
    }
    float _198 = _188;
    bool _200 = !_176;
    float _202 = _198;
    if (!_200)
    {
        float _204 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = log2(_204);
        float _208 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _210 = _208 + 1.0;
        float _212 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = _166 * _206;
        float _216 = 1.0 / _210;
        float _218 = _212 * 0.693147182464599609375;
        float _220 = exp2(_214);
        float _222 = 1.0 / _218;
        float _224 = _220 + (-1.0);
        float _226 = -_224;
        float _228 = fma(_226, _222, _166);
        float _230 = _228 * _216;
        float _232 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _134 = _218;
        _202 = _232;
        _136 = _220;
    }
    float _234 = _134;
    float _236 = _202;
    float _238 = _136;
    bool _240 = !_176;
    float _242 = _234;
    float _244 = _238;
    if (!_240)
    {
        float _246 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _248 = log2(_246);
        float _250 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _252 = _250 + 1.0;
        float _254 = 1.0 / _252;
        float _256 = _166 * _248;
        float _258 = exp2(_256);
        float _260 = -_258;
        float _262 = _260 + 1.0;
        float _264 = _262 * _254;
        _242 = _258;
        _244 = _252;
        _178 = _264;
    }
    float _266 = _242;
    float _268 = _244;
    float _270 = _178;
    float _272 = _268;
    float _274 = _266;
    if (!_176)
    {
        _272 = _132;
    }
    float _276 = _272;
    float _278 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _280 = _276;
    if (!_176)
    {
        float _282 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _274 = _282;
    }
    float _284 = _274;
    bool _286 = !_176;
    float _288 = _284;
    if (!_286)
    {
        float _290 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _292 = log2(_290);
        float _294 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _296 = _294 + 1.0;
        float _298 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _300 = _132 * _292;
        float _302 = 1.0 / _296;
        float _304 = _298 * 0.693147182464599609375;
        float _306 = exp2(_300);
        float _308 = 1.0 / _304;
        float _310 = _306 + (-1.0);
        float _312 = -_310;
        float _314 = fma(_312, _308, _132);
        float _316 = _314 * _302;
        float _318 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _288 = _318;
    }
    float _320 = _288;
    bool _322 = !_176;
    if (!_322)
    {
        float _324 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _326 = log2(_324);
        float _328 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _330 = _328 + 1.0;
        float _332 = 1.0 / _330;
        float _334 = _132 * _326;
        float _336 = exp2(_334);
        float _338 = -_336;
        float _340 = _338 + 1.0;
        float _342 = _340 * _332;
        _280 = _342;
    }
    float _344 = _280;
    float _346 = fma(_270, _160, _278);
    float _348 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _350 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _352 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _354 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _356 = fma(_270, _162, _348);
    float _358 = fma(_344, _162, _350);
    float _360 = _320 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _362 = fma(_344, _160, _352);
    float _364 = fma(_270, _164, _354);
    float _366 = -_358;
    float _368 = _356 + _366;
    float _370 = fma(_344, _164, _360);
    float _372 = -_362;
    float _374 = _346 + _372;
    float _376 = in.m_51.y;
    float _378 = _368 * _368;
    float _380 = -_370;
    float _382 = _364 + _380;
    float _384 = in.m_53.y;
    float _386 = fma(_374, _374, _378);
    float _388 = in.m_55.y;
    float _390 = fma(_382, _382, _386);
    float _392 = in.m_51.x;
    float _394 = sqrt(_390);
    float _396 = in.m_51.z;
    float _398 = in.m_53.x;
    float _400 = in.m_55.x;
    float _402 = _368 * _376;
    float _404 = in.m_57.w;
    float _406 = _368 * _384;
    bool _408 = _394 >= 9.9999999747524270787835121154785e-07;
    bool _410 = isnan(_394);
    bool _412 = _408 || _410;
    bool _414 = isnan(9.9999999747524270787835121154785e-07);
    bool _416 = _412 || _414;
    float _418 = in.m_44.x;
    float _420 = in.m_44.y;
    float _422 = in.m_44.z;
    float _424 = _368 * _388;
    float _426 = _384 * _384;
    float _428 = in.m_53.z;
    float _430 = fma(_374, _392, _402);
    float _432 = fma(_376, _376, _426);
    float _434 = in.m_55.z;
    float _436 = fma(_382, _396, _430);
    float _438 = fma(_388, _388, _432);
    float _440 = fma(_374, _398, _406);
    float _442 = fma(_374, _400, _424);
    float _444 = fma(_356, _404, _420);
    float _446 = fma(_346, _404, _418);
    float _448 = fma(_364, _404, _422);
    float _450 = _356;
    if (_416)
    {
        _450 = _436;
    }
    float _452 = _450;
    float _454 = fma(_382, _428, _440);
    float _456 = fma(_382, _434, _442);
    float _458 = _452;
    float _460 = _454;
    float _462 = _456;
    float _464 = _454;
    float _466 = _452;
    float _468 = _456;
    if (!_416)
    {
        bool _470 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _472 = !_470;
        if (!_472)
        {
            float _474 = _384 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _476 = _376 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _478 = _388 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _480 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[16].x, _474);
            float _482 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[16].x, _476);
            float _484 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[16].x, _478);
            float _486 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[16].z, _480);
            float _488 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[16].z, _482);
            float _490 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[16].z, _484);
            float _492 = _486 * _486;
            float _494 = fma(_488, _488, _492);
            float _496 = fma(_490, _490, _494);
            float _498 = rsqrt(_496);
            float _500 = _498 * 9.9999999747524270787835121154785e-07;
            float _502 = _488 * _500;
            float _504 = _486 * _500;
            float _506 = _490 * _500;
            _464 = _504;
            _466 = _502;
            _468 = _506;
            _508 = true;
        }
        else
        {
            float _510 = _162 * _162;
            float _512 = fma(_160, _160, _510);
            float _514 = fma(_164, _164, _512);
            float _516 = sqrt(_514);
            bool _518 = _516 >= 9.9999999747524270787835121154785e-07;
            bool _520 = isnan(_516);
            bool _522 = _518 || _520;
            bool _524 = isnan(9.9999999747524270787835121154785e-07);
            bool _526 = _522 || _524;
            float _528 = _516;
            if (!_526)
            {
                float _530 = _420 * _420;
                float _532 = fma(_418, _418, _530);
                float _534 = fma(_422, _422, _532);
                float _536 = sqrt(_534);
                bool _538 = _536 >= 9.9999999747524270787835121154785e-07;
                bool _540 = isnan(_536);
                bool _542 = _538 || _540;
                bool _544 = isnan(9.9999999747524270787835121154785e-07);
                bool _546 = _542 || _544;
                float _548 = _438;
                if (!_546)
                {
                    float _550 = rsqrt(_438);
                    _548 = _550;
                }
                float _552 = _548;
                if (!_546)
                {
                    float _554 = _552 * 9.9999999747524270787835121154785e-07;
                    _528 = _554;
                }
                float _556 = _528;
                if (!_546)
                {
                    float _558 = _376 * _556;
                    _458 = _558;
                }
                float _560 = _458;
                _466 = _560;
                if (!_546)
                {
                    float _562 = _384 * _556;
                    _460 = _562;
                }
                float _564 = _460;
                _464 = _564;
                if (!_546)
                {
                    float _566 = _388 * _556;
                    _462 = _566;
                }
                float _568 = _462;
                bool _570 = !_546;
                _468 = _568;
                _508 = _570;
                if (!_508)
                {
                    float _572 = _384 * _420;
                    float _574 = _376 * _420;
                    float _576 = _388 * _420;
                    float _578 = fma(_418, _398, _572);
                    float _580 = fma(_418, _392, _574);
                    float _582 = fma(_418, _400, _576);
                    float _584 = fma(_422, _428, _578);
                    float _586 = fma(_422, _396, _580);
                    float _588 = fma(_422, _434, _582);
                    float _590 = _584 * _584;
                    float _592 = fma(_586, _586, _590);
                    float _594 = fma(_588, _588, _592);
                    float _596 = rsqrt(_594);
                    float _598 = _596 * 9.9999999747524270787835121154785e-07;
                    float _600 = _586 * _598;
                    float _602 = _584 * _598;
                    float _604 = _588 * _598;
                    _464 = _602;
                    _466 = _600;
                    _468 = _604;
                    _508 = true;
                }
            }
            else
            {
                float _606 = _384 * _162;
                float _608 = _376 * _162;
                float _610 = _388 * _162;
                float _612 = fma(_160, _398, _606);
                float _614 = fma(_160, _392, _608);
                float _616 = fma(_160, _400, _610);
                float _618 = fma(_164, _428, _612);
                float _620 = fma(_164, _396, _614);
                float _622 = fma(_164, _434, _616);
                float _624 = _618 * _618;
                float _626 = fma(_620, _620, _624);
                float _628 = fma(_622, _622, _626);
                float _630 = rsqrt(_628);
                float _632 = _630 * 9.9999999747524270787835121154785e-07;
                float _634 = _620 * _632;
                float _636 = _618 * _632;
                float _638 = _622 * _632;
                _464 = _636;
                _466 = _634;
                _468 = _638;
            }
        }
    }
    _508 = false;
    float _640 = _464;
    float _642 = _466;
    float _644 = _468;
    bool _646 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    bool _648 = !_646;
    float _666;
    if (!_648)
    {
        float _650 = in.m_59.x;
        float _652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _654 = _650 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _656 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[11].x, _132);
        float _658 = _656 * _652;
        float _660 = floor(_658);
        float _662 = -_660;
        float _664 = _658 + _662;
        _666 = _664;
        _668 = true;
    }
    else
    {
        float _670 = float(_98);
        float _672 = 1.0 / _670;
        float _674 = _132 * _672;
        _666 = _674;
    }
    _668 = false;
    float _676 = _666;
    float _678 = in.m_59.z;
    float _680 = _444 * _376;
    float _682 = _444 * _388;
    float _684 = _444 * _384;
    float _686 = in.m_59.x;
    float _688 = fma(_446, _392, _680);
    float _690 = fma(_446, _400, _682);
    float _692 = fma(_446, _398, _684);
    float _694 = in.m_59.y;
    float _696 = fma(_448, _396, _688);
    float _698 = in.m_57.x;
    float _700 = in.m_57.y;
    float _702 = in.m_57.z;
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _706 = _704 != 0;
    float _708 = fma(_448, _428, _692);
    float _710 = in.m_61.x;
    float _712 = in.m_61.y;
    float _714 = in.m_61.z;
    float _716 = fma(_448, _434, _690);
    float _718 = in.m_59.w;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _722 = _676 + _720;
    float _724 = _678 * 2.0;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _728 = 0.0;
    if (!_706)
    {
        _728 = _678;
    }
    float _730 = _728;
    float _732 = _686 * 2.0;
    float _734 = 0.0;
    float _736 = _730;
    if (!_706)
    {
        _734 = _678;
    }
    float _738 = _734;
    float _740 = floor(_724);
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _744 = 0.0;
    float _746 = _738;
    if (!_706)
    {
        _744 = _694;
    }
    float _748 = _744;
    float _750 = _748;
    if (_706)
    {
        _750 = _686;
    }
    float _752 = _750;
    float _754 = _702 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    if (_706)
    {
        _736 = _694;
    }
    float _756 = _736;
    float _758 = floor(_732);
    if (_706)
    {
        _746 = _694;
    }
    float _760 = _746;
    float _762 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[83].z, _742);
    float _764 = _756 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _766 = _740 > 0.0;
    float _768 = fma(_764, -2.0, _726);
    bool _770 = _740 >= 0.0;
    bool _772 = isnan(_740);
    bool _774 = _770 || _772;
    bool _776 = isnan(0.0);
    bool _778 = _774 || _776;
    int _780 = _778 ? 0 : 1;
    bool _782 = _758 > 0.0;
    bool _784 = _758 >= 0.0;
    bool _786 = isnan(_758);
    bool _788 = _784 || _786;
    bool _790 = isnan(0.0);
    bool _792 = _788 || _790;
    float _794 = in.m_63.x;
    float _796 = in.m_63.y;
    float _798 = in.m_63.z;
    int _800 = ~_780;
    int _802 = _800 + 1;
    int _804 = _802 + 1;
    int _806 = _792 ? 0 : 1;
    int _808 = _804;
    if (!_766)
    {
        int _810 = ~_780;
        int _812 = _810 + 1;
        _808 = _812;
    }
    int _814 = _808;
    int _816 = ~_806;
    int _818 = _816 + 1;
    int _820 = _818 + 1;
    int _822 = _820;
    if (!_782)
    {
        int _824 = ~_806;
        int _826 = _824 + 1;
        _822 = _826;
    }
    int _828 = _822;
    int _830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _832 = _830 != 0;
    int _834 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _836 = _834 != 0;
    int _838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _840 = _838 != 0;
    float _842 = _698 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _844 = !_832;
    int _846 = _844 ? 0 : 1;
    float _848 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _710);
    float _850 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _714);
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _854 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _712);
    bool _856 = _718 > 0.5;
    float _858 = _798 * _798;
    float _860 = _694 * 2.0;
    float _862 = _796 * _796;
    float _864 = _686 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _866 = _794 * _794;
    float _868 = floor(_860);
    float _870 = _686 + _694;
    float _872 = -_852;
    float _874 = fma(_864, 2.0, _872);
    float _876 = _640 * _640;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _880 = _694 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _884 = _882 != 0;
    float _886 = fma(_642, _642, _876);
    float _888 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _890 = log2(_888);
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _894 = _892 != 0;
    float _896 = _870 + (-1.0);
    int _898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _900 = _898 != 0;
    float _902 = fma(_880, -2.0, _878);
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _906 = _904 != 0;
    float _908 = _700 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _910 = fma(_644, _644, _886);
    bool _912 = !_836;
    int _914 = _912 ? 0 : 1;
    float _916 = fma(_896, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _918 = _868 >= 0.0;
    bool _920 = isnan(_868);
    bool _922 = _918 || _920;
    bool _924 = isnan(0.0);
    bool _926 = _922 || _924;
    float _928 = _694 + _678;
    float _930 = rsqrt(_910);
    float _932 = -_132;
    float _934 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[76].x, _874);
    int _936 = _926 ? 0 : 1;
    float _938 = _890 * _132;
    bool _940 = _868 > 0.0;
    float _942 = _928 + (-1.0);
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _946 = exp2(_938);
    float _948 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _950 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[83].w, _944);
    float _952 = _752 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _954 = abs(_846);
    float _956 = _930 * _642;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _960 = ~_936;
    int _962 = _960 + 1;
    int _964 = _962 + 1;
    float _966 = _930 * _640;
    int _968 = _964;
    bool _970 = _856;
    if (!_940)
    {
        int _972 = ~_936;
        int _974 = _972 + 1;
        _968 = _974;
    }
    int _976 = _968;
    float _978 = _930 * _644;
    int _980 = abs(_914);
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _984 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _986 = isnan(0.0);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _992 = _988 || _990;
    float _994 = -_958;
    float _996 = fma(_952, 2.0, _994);
    float _998 = -_946;
    float _1000 = _998 + 1.0;
    float _1002 = in.m_65.x;
    float _1004 = in.m_65.y;
    float _1006 = in.m_65.z;
    float _1008 = float(_954);
    float _1010 = float(_814);
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1014 = _992 ? _1000 : 0.0;
    float _1016 = in.m_55.w;
    bool _1018 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1020 = isnan(1.0);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1026 = _1022 || _1024;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1030 = 1.0 + _1028;
    bool _1032 = !_840;
    int _1034 = _1032 ? 0 : 1;
    float _1036 = _1008 * _1010;
    float _1038 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[78].z, _982);
    float _1040 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1012);
    float _1042 = float(_828);
    float _1044 = 1.0 / _1030;
    int _1046 = abs(_1034);
    float _1048 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1038);
    float _1050 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1040);
    float _1052 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _950);
    float _1054 = float(_980);
    float _1056 = _1036 * (-2.0);
    float _1058 = float(_1046);
    float _1060 = in.m_53.w;
    float _1062 = float(_976);
    float _1064 = _1054 * _1042;
    float _1066 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _902);
    float _1068 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _762);
    float _1070 = -_132;
    float _1072 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[81].x, _996);
    float _1074 = _1058 * _1062;
    float _1076 = _1064 * (-2.0);
    float _1078 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _768);
    bool _1080 = _1026;
    if (_1026)
    {
        float _1082 = _1014 * _1044;
        _138 = _1082;
    }
    float _1084 = _138;
    float _1086 = _1074 * (-2.0);
    float _1088 = fma(_916, _1056, _916);
    float _1090 = fma(_1076, _1004, _1004);
    float _1092 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1094 = _978 * _1092;
    float _1096 = fma(_1086, _1006, _1006);
    float _1098 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1100 = _966 * _1098;
    float _1102 = in.m_67.y;
    float _1104 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1106 = _956 * _1104;
    float _1108 = fma(_1056, _1002, _1002);
    float _1110 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1112 = -_1094;
    float _1114 = fma(_956, _1110, _1112);
    float _1116 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1118 = -_1100;
    float _1120 = fma(_978, _1116, _1118);
    float _1122 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1124 = -_1106;
    float _1126 = fma(_966, _1122, _1124);
    float _1128 = fma(_948, _1076, _948);
    float _1130 = _694 + (-0.5);
    float _1132 = _1114 * _1114;
    float _1134 = _686 + _678;
    float _1136 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1090);
    float _1138 = _686 + (-0.5);
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1140;
    float _1144 = fma(_1120, _1120, _1132);
    float _1146 = _1134 + (-1.0);
    float _1148 = fma(_1128, _1084, _1136);
    float _1150 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1108);
    float _1152 = fma(_1126, _1126, _1144);
    float _1154 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1156 = 1.0 / _1142;
    float _1158 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _1160 = _1148 * 0.15915493667125701904296875;
    float _1162 = _678 + (-0.5);
    float _1164 = fma(_1088, _1084, _1150);
    float _1166 = fma(_1154, _1086, _1154);
    float _1168 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1096);
    float _1170 = rsqrt(_1152);
    float _1172 = _1164 * 0.15915493667125701904296875;
    if (_884)
    {
        bool _1174 = _686 > 0.5;
        _1080 = _1174;
    }
    bool _1176 = _1080;
    float _1178 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[191].x, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _1180 = fma(_1166, _1084, _1168);
    bool _1182 = _694 > 0.5;
    float _1184 = fma((*spvDescriptorSet0.vp_c9)._m0[191].x, _678, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _1186 = _908 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1188 = _1172 * 6.283185482025146484375;
    float _1190 = sin(_1188);
    float _1192 = _1158 * _686;
    float _1194 = -_1102;
    float _1196 = _1194 + 1.0;
    float _1198 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[191].x, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    float _1200 = _754 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1202 = _1180 * 0.15915493667125701904296875;
    float _1204 = in.m_51.w;
    int _1206 = _856 ? as_type<int>(_1196) : as_type<int>(_1102);
    float _1208 = _1172 * 6.283185482025146484375;
    float _1210 = cos(_1208);
    float _1212 = _1102;
    if (_894)
    {
        bool _1214 = _678 > 0.5;
        _970 = _1214;
    }
    bool _1216 = _970;
    float _1218 = _842 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1220 = _722 * _1156;
    float _1222 = _716 + _1016;
    float _1224 = _1200 * _850;
    float _1226 = _708 + _1060;
    float _1228 = _1160 * 6.283185482025146484375;
    float _1230 = sin(_1228);
    float _1232 = _1114 * _1170;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1234;
    float _1238 = _1126 * _1170;
    float _1240 = _1186 * _854;
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1242;
    float _1246 = fma(_1236, _1220, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1248 = _1160 * 6.283185482025146484375;
    float _1250 = cos(_1248);
    float _1252 = _1218 * _848;
    float _1254 = fma(_1244, _1220, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1256 = _1120 * _1170;
    float _1258 = in.m_67.x;
    float _1260 = _696 + _1204;
    float _1262 = _978 * _1256;
    float _1264 = _1202 * 6.283185482025146484375;
    float _1266 = cos(_1264);
    float _1268 = _1190 * _1230;
    float _1270 = _1210 * _1230;
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1272;
    float _1276 = fma(_1274, _1220, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1278 = _1202 * 6.283185482025146484375;
    float _1280 = sin(_1278);
    float _1282 = _1210 * _1250;
    float _1284 = _1190 * _1250;
    float _1286 = _1190 * _1266;
    float _1288 = _1250 * _1266;
    float _1290 = _1210 * _1266;
    float _1292 = _1230 * _1266;
    float _1294 = -_1262;
    float _1296 = fma(_956, _1238, _1294);
    float _1298 = trunc(_1192);
    int _1300 = int(_1298);
    float _1302 = _1290 * _956;
    float _1304 = _1290 * _978;
    float _1306 = fma(_1280, _1282, _1268);
    float _1308 = fma(_1280, _1268, _1282);
    float _1310 = -_1270;
    float _1312 = fma(_1280, _1284, _1310);
    float _1314 = _966 * _1238;
    float _1316 = -_1284;
    float _1318 = fma(_1280, _1270, _1316);
    float _1320 = _1290 * _966;
    float _1322 = _956 * _1232;
    float _1324 = -_1314;
    float _1326 = fma(_978, _1232, _1324);
    float _1328 = _1306 * _956;
    float _1330 = _1306 * _966;
    float _1332 = _1306 * _978;
    float _1334 = -_1280;
    float _1336 = fma(_1334, _1256, _1302);
    float _1338 = -_1280;
    float _1340 = fma(_1338, _1232, _1320);
    float _1342 = -_1280;
    float _1344 = fma(_1342, _1238, _1304);
    float _1346 = _1318 * _956;
    float _1348 = _1318 * _978;
    float _1350 = -_1322;
    float _1352 = fma(_966, _1256, _1350);
    float _1354 = _1318 * _966;
    float _1356 = fma(_1288, _1256, _1328);
    float _1358 = fma(_1288, _1238, _1332);
    float _1360 = fma(_1292, _1256, _1346);
    float _1362 = fma(_1292, _1238, _1348);
    float _1364 = fma(_1286, _1326, _1336);
    float _1366 = fma(_1286, _1352, _1344);
    float _1368 = fma(_1288, _1232, _1330);
    float _1370 = fma(_1312, _1326, _1356);
    float _1372 = fma(_1312, _1352, _1358);
    float _1374 = _1240 * _1364;
    float _1376 = _1240 * _1366;
    float _1378 = fma(_1308, _1326, _1360);
    float _1380 = fma(_1308, _1352, _1362);
    float _1382 = fma(_1252, _1370, _1374);
    float _1384 = fma(_1252, _1372, _1376);
    float _1386 = fma(_1292, _1232, _1354);
    float _1388 = fma(_1286, _1296, _1340);
    float _1390 = fma(_1224, _1378, _1382);
    float _1392 = fma(_1224, _1380, _1384);
    float _1394 = fma(_1312, _1296, _1368);
    float _1396 = fma(_1308, _1296, _1386);
    int _1398 = _1300 << 4;
    int _1400 = _1398 + 1968;
    float _1402 = _1260 + _1390;
    float _1404 = _1222 + _1392;
    float _1406 = _1240 * _1388;
    int _1408 = _1400 + 8;
    uint _1411 = uint(int(uint(_1408) >> uint(2)));
    uint _1413 = uint(int(uint(int(_1411)) >> uint(2)));
    int _1415 = int(_1411) & 3;
    float _1417 = (*spvDescriptorSet0.vp_c9)._m0[int(_1413)][_1415];
    float _1419 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1421 = _1402 + _1419;
    float _1423 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1425 = _1404 + _1423;
    bool _1427 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1429 = isnan(_676);
    bool _1431 = _1427 || _1429;
    bool _1433 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1435 = _1431 || _1433;
    float _1437 = float(_1435);
    float _1439 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1441 = _1421 * _1421;
    float _1443 = _1425 * _1425;
    bool _1445 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1447 = isnan(_676);
    bool _1449 = _1445 || _1447;
    bool _1451 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1453 = _1449 || _1451;
    float _1455 = float(_1453);
    uint _1457 = uint(int(uint(_1400) >> uint(2)));
    uint _1459 = uint(int(uint(int(_1457)) >> uint(2)));
    int _1461 = int(_1457) & 3;
    float _1463 = (*spvDescriptorSet0.vp_c9)._m0[int(_1459)][_1461];
    int _1465 = int(_1457) + 1;
    uint _1467 = uint(int(uint(_1465) >> uint(2)));
    int _1469 = _1465 & 3;
    float _1471 = (*spvDescriptorSet0.vp_c9)._m0[int(_1467)][_1469];
    float _1473 = _900 ? as_type<float>(_1206) : _1102;
    float _1475 = _1441 + _1443;
    float _1477 = fma(_1252, _1394, _1406);
    float _1479 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1481 = -_1437;
    float _1483 = _1481 + 1.0;
    float _1485 = _1220;
    int _1487 = as_type<int>(_1246);
    float _1489 = _1441;
    float _1491 = _1443;
    float _1493 = _1402;
    float _1495 = _1404;
    if (_906)
    {
        float _1497 = _1182 ? _1196 : _1102;
        _1212 = _1497;
    }
    float _1499 = _1212;
    float _1501 = fma(_1224, _1396, _1477);
    float _1503 = _1258;
    if (!_884)
    {
        _1485 = _1258;
    }
    float _1505 = _1485;
    float _1507 = _1455 * _1483;
    float _1509 = -_1455;
    float _1511 = _1509 + 1.0;
    float _1513 = _1226 + _1501;
    float _1515 = sqrt(_1475);
    float _1517 = _1439 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1519 = _1246 * _1507;
    float _1521 = fma(_1178, _858, _1513);
    float _1523 = _1505;
    int _1525 = as_type<int>(_1507);
    float _1527 = _1521;
    if (_884)
    {
        float _1529 = -_1258;
        float _1531 = _1529 + 1.0;
        _1487 = as_type<int>(_1531);
    }
    int _1533 = _1487;
    float _1535 = fma(_1517, _1499, -0.5);
    float _1537 = _1276 * _1507;
    float _1539 = fma(_866, _1198, _1521);
    float _1541 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1543 = _1479 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1545 = _1254 * _1507;
    if (_884)
    {
        float _1547 = _1176 ? as_type<float>(_1533) : _1258;
        _1523 = _1547;
    }
    float _1549 = _1523;
    if (_894)
    {
        float _1551 = -_1258;
        float _1553 = _1551 + 1.0;
        _1525 = as_type<int>(_1553);
    }
    int _1555 = _1525;
    float _1557 = fma(_862, _1184, _1539);
    float _1559 = fma(_1473, _1543, -0.5);
    float _1561 = -_1066;
    float _1563 = fma(_1050, _1535, _1561);
    bool _1565 = _1515 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_894)
    {
        float _1569 = _1216 ? as_type<float>(_1555) : _1258;
        _1503 = _1569;
    }
    float _1571 = _1503;
    float _1573 = fma(_1511, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1537);
    float _1575 = fma(_1511, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1519);
    float _1577 = fma(_1511, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1545);
    float _1579 = -_1078;
    float _1581 = fma(_1052, _1559, _1579);
    float _1583 = _1581;
    if (!_1565)
    {
        _1527 = _1557;
    }
    float _1585 = _1527;
    bool _1587 = !_1565;
    float _1589 = _1585;
    float _1591 = _1417;
    if (!_1587)
    {
        float _1593 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1595 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1597 = _1515 + _1595;
        float _1599 = _1557 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1601 = rsqrt(_1475);
        float _1603 = _1597 * _1593;
        float _1605 = _1603 * 0.15915493667125701904296875;
        float _1607 = _1605 * 6.283185482025146484375;
        float _1609 = sin(_1607);
        float _1611 = _1605 * 6.283185482025146484375;
        float _1613 = cos(_1611);
        float _1615 = fma(_1609, _1599, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1617 = _1601 * _1615;
        float _1619 = _1613 + (-1.0);
        float _1621 = fma(_1421, _1617, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1623 = fma(_1425, _1617, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1625 = _1619 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1627 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1629 = _1621 + _1627;
        float _1631 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1633 = _1623 + _1631;
        float _1635 = fma(_1557, _1613, _1625);
        float _1637 = _1629 * _1629;
        float _1639 = _1633 * _1633;
        _1589 = _1635;
        _1489 = _1637;
        _1491 = _1639;
        _1493 = _1621;
        _1495 = _1623;
    }
    float _1641 = _1589;
    float _1643 = _1489;
    float _1645 = _1491;
    float _1647 = _1493;
    float _1649 = _1495;
    float _1651 = _1567 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1653 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1655 = _1641 + _1653;
    float _1657 = in.m_63.w;
    float _1659 = _1541 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1661 = fma(_1651, _1571, -0.5);
    float _1663 = fma(_1655, _1655, _1643);
    float _1665 = _1463 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1667 = fma(_1437, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1573);
    float _1669 = _1471 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1671 = _1663 + _1645;
    float _1673 = fma(_1437, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1575);
    float _1675 = fma(_1437, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1577);
    float _1677 = fma(_1659, _1549, -0.5);
    float _1679 = fma(_1068, _1661, _1072);
    float _1681 = _1665 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1683 = sqrt(_1671);
    float _1685 = _1669 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1687 = _1667 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1689 = fma(_1048, _1677, _934);
    float _1691 = _1417 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1693 = _1673 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1695 = _1675 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1697 = _1563 + 0.5;
    float _1699 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1701 = _1691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1703 = _1581 + 0.5;
    float _1705 = _1687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1707 = _1693 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1709 = _1689 + 0.5;
    float _1711 = _1679 + 0.5;
    float _1713 = _1695 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_69.w = _1657;
    bool _1715 = _1683 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1717 = isnan(_1683);
    bool _1719 = _1715 || _1717;
    bool _1721 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1723 = _1719 || _1721;
    out.m_71.x = _1681;
    out.m_71.y = _1685;
    out.m_71.z = _1701;
    out.m_73.x = _1709;
    out.m_73.y = _1697;
    out.m_73.z = _1711;
    out.m_73.w = _1703;
    out.m_75.x = _1705;
    out.m_75.y = _1707;
    out.m_75.z = _1713;
    out.m_75.w = _1699;
    float _1725 = _1679;
    float _1727 = _1681;
    float _1729 = _1701;
    if (!_1723)
    {
        _1725 = 1.0;
    }
    float _1731 = _1725;
    bool _1733 = !_1723;
    float _1735 = _1731;
    if (!_1733)
    {
        bool _1737 = _1683 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1739 = isnan(_1683);
        bool _1741 = _1737 || _1739;
        bool _1743 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1745 = _1741 || _1743;
        if (!_1745)
        {
            float _1747 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1749 = _1683 + _1747;
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
            bool _1767 = _1683 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1769 = isnan(_1683);
            bool _1771 = _1767 || _1769;
            bool _1773 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1775 = _1771 || _1773;
            if (!_1775)
            {
                float _1777 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1779 = _1683 + _1777;
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
    float _1799 = _1641 + _1797;
    float _1801 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1803 = _1647 + _1801;
    float _1805 = fma(_1799, _1795, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1807 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1809 = _1649 + _1807;
    float _1811 = fma(_1803, _1795, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1813 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1815 = _1805 + _1813;
    float _1817 = fma(_1809, _1795, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1819 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1821 = _1811 + _1819;
    float _1823 = _1815 * _1815;
    float _1825 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1827 = _1817 + _1825;
    float _1829 = fma(_1821, _1821, _1823);
    float _1831 = fma(_1827, _1827, _1829);
    float _1833 = rsqrt(_1831);
    float _1835 = _1833 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1837 = _1821 * _1835;
    float _1839 = _1827 * _1835;
    float _1841 = _1837 * _1837;
    float _1843 = _1839 * _1839;
    float _1845 = _1841 + _1843;
    float _1847 = sqrt(_1845);
    bool _1849 = _1847 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1851 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1853 = _1847 + _1851;
    float _1855 = _1827;
    float _1857 = _1853;
    float _1859 = _1837;
    if (_1849)
    {
        float _1861 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1855 = _1861;
    }
    float _1863 = _1855;
    if (_1849)
    {
        float _1865 = rsqrt(_1845);
        _1727 = _1865;
    }
    float _1867 = _1727;
    float _1869 = _1867;
    if (_1849)
    {
        float _1871 = _1853 * _1863;
        _1857 = _1871;
    }
    float _1873 = _1857;
    if (_1849)
    {
        float _1875 = _1873 * 0.15915493667125701904296875;
        _1729 = _1875;
    }
    float _1877 = _1729;
    float _1879 = _1823;
    if (_1849)
    {
        float _1881 = _1877 * 6.283185482025146484375;
        float _1883 = sin(_1881);
        _1879 = _1883;
    }
    float _1885 = _1879;
    float _1887 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1889 = precise::max(0.0, _1887);
    float _1891 = _1833;
    float _1893 = _1889;
    float _1895 = _1887;
    if (_1849)
    {
        float _1897 = _1877 * 6.283185482025146484375;
        float _1899 = cos(_1897);
        _1891 = _1899;
    }
    float _1901 = _1891;
    float _1903 = -_1835;
    float _1905 = -_1889;
    float _1907 = fma(_1815, _1903, _1905);
    if (!_1849)
    {
        _1893 = _1839;
    }
    float _1909 = _1893;
    float _1911 = _1909;
    if (_1849)
    {
        float _1913 = _1907 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1895 = _1913;
    }
    float _1915 = _1895;
    float _1917 = sqrt(_1831);
    float _1919 = _1885;
    float _1921 = _1915;
    if (_1849)
    {
        float _1923 = fma(_1885, _1915, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1919 = _1923;
    }
    float _1925 = _1919;
    float _1927 = _1925;
    if (_1849)
    {
        float _1929 = _1901 + (-1.0);
        _1921 = _1929;
    }
    float _1931 = _1921;
    float _1933 = _1931;
    if (_1849)
    {
        float _1935 = _1867 * _1925;
        _1583 = _1935;
    }
    float _1937 = _1583;
    if (!_1849)
    {
        _1869 = _1907;
    }
    float _1939 = _1869;
    float _1941 = _1939;
    if (_1849)
    {
        float _1943 = _1931 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1591 = _1943;
    }
    float _1945 = _1591;
    if (_1849)
    {
        float _1947 = _1837 * _1937;
        _1859 = _1947;
    }
    float _1949 = _1859;
    if (!_1849)
    {
        _1927 = _1841;
    }
    float _1951 = _1927;
    float _1953 = _1951;
    if (_1849)
    {
        float _1955 = _1839 * _1937;
        _1911 = _1955;
    }
    float _1957 = _1911;
    if (_1849)
    {
        float _1959 = fma(_1907, _1901, _1945);
        _1941 = _1959;
    }
    float _1961 = _1941;
    if (_1849)
    {
        float _1963 = _1949 * _1949;
        _1953 = _1963;
    }
    float _1965 = _1953;
    if (!_1849)
    {
        _1933 = _1843;
    }
    float _1967 = _1933;
    float _1969 = _1967;
    if (_1849)
    {
        float _1971 = _1957 * _1957;
        _1969 = _1971;
    }
    float _1973 = _1969;
    float _1975 = fma(_1961, _1961, _1965);
    float _1977 = _1975 + _1973;
    float _1979 = _1805 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1981 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1983 = fma(_1917, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1981);
    float _1985 = precise::clamp(_1983, 0.0, 1.0);
    float _1987 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1989 = rsqrt(_1977);
    float _1991 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1979);
    float _1993 = _1805 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1995 = -_1985;
    float _1997 = _1995 + 1.0;
    float _1999 = _1805 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2001 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1991);
    float _2003 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1993);
    float _2005 = _1805 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2007 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1999);
    float _2009 = _2001 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2011 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2003);
    float _2013 = abs(_1997);
    float _2015 = log2(_2013);
    float _2017 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2005);
    float _2019 = _2009 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2021 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2007);
    float _2023 = _2011 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2025 = _1989 * _1949;
    float _2027 = -_2019;
    float _2029 = fma(_2027, _1987, 1.0);
    float _2031 = fma(_1817, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2017);
    float _2033 = _2021 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2035 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2037 = _1989 * _1961;
    float _2039 = _2025 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2041 = _1989 * _1957;
    float _2043 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2035);
    float _2045 = _2031 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2047 = -_2039;
    float _2049 = fma(_2037, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2047);
    float _2051 = _2015 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2053 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2043);
    float _2055 = log2(_2029);
    float _2057 = -_2041;
    float _2059 = fma(_2057, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2049);
    float _2061 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2063 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2053);
    float _2065 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2067 = fma(_2059, -0.5, 0.5);
    float _2069 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2061);
    float _2071 = fma(_2059, 0.5, 0.5);
    float _2073 = exp2(_2051);
    float _2075 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2065);
    float _2077 = _2037 + 1.0;
    float _2079 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2069);
    float _2081 = fma(_2071, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2083 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2075);
    float _2085 = 1.0 / _2063;
    float _2087 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2083);
    float _2089 = fma(_2071, _2081, -0.212114393711090087890625);
    float _2091 = _2055 * 0.693147182464599609375;
    float _2093 = fma(_2071, _2089, 1.570728778839111328125);
    float _2095 = sqrt(_2067);
    float _2097 = -_2037;
    float _2099 = fma(_2073, _2077, _2097);
    float _2101 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2079);
    float _2103 = fma(_2099, 0.5, 0.5);
    float _2105 = _2101 * _2085;
    float _2107 = _2087 * _2085;
    float _2109 = _2091 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2111 = fma(_2105, 0.5, 0.5);
    float _2113 = fma(_2107, -0.5, 0.5);
    float _2115 = _2095 * 0.636619746685028076171875;
    float3 _5439 = float3(_2111, _2113, _2109);
    float _2117 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5439, float3(0.0), isnan(_5439)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5439, float3(0.0), isnan(_5439)), level(0.0)).x;
    float3 _5450 = float3(_2111, _2113, _2109);
    float4 _2120 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5450, float3(0.0), isnan(_5450)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5450, float3(0.0), isnan(_5450)), level(0.0)).xyzw;
    float _2122 = _2120.x;
    float _2124 = _2120.y;
    float _2126 = _2120.z;
    float _2128 = _2120.w;
    float _2130 = -_2093;
    float _2132 = fma(_2115, _2130, 1.0);
    float2 _5472 = float2(_2132, _2103);
    float3 _2136 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5472, float2(0.0), isnan(_5472)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5472, float2(0.0), isnan(_5472)), level(0.0)).xyz;
    float _2138 = _2136.x;
    float _2140 = _2136.y;
    float _2142 = _2136.z;
    float _2144 = _2015 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2146 = _2023 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2148 = fma(_2033, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2146);
    float _2150 = exp2(_2144);
    float _2152 = fma(_2009, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2148);
    float _2154 = fma(_2045, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2152);
    float _2156 = _2154 + _2063;
    out.gl_Position.x = _2101;
    out.gl_Position.y = _2087;
    out.gl_Position.z = _2154;
    out.gl_Position.w = _2063;
    float _2158 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2160 = _2156 * 0.5;
    float _2162 = -_2150;
    float _2164 = _2162 + 1.0;
    out.m_47.x = _2158;
    float _2166 = _2164 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.z = _2160;
    out.m_77.w = _2063;
    float _2168 = _2166 * _2117;
    float _2170 = -_2166;
    float _2172 = _2170 + 1.0;
    float _2174 = _2128 * _2168;
    float _2176 = _2128 * _2172;
    float _2178 = _2142 * _2168;
    float _2180 = fma(_2138, _2174, _2122);
    float _2182 = fma(_2140, _2174, _2124);
    float _2184 = fma(_2128, _2178, _2126);
    out.m_79.x = _2180;
    out.m_79.y = _2182;
    out.m_79.z = _2184;
    out.m_79.w = _2176;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

