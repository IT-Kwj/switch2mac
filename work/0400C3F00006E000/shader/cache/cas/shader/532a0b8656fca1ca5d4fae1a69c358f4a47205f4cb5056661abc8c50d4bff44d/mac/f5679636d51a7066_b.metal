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
    float4 m_69 [[user(locn2)]];
    float4 m_79 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_67 [[user(locn5)]];
    float4 m_77 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
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
    float4 m_71 [[attribute(7)]];
    float4 m_63 [[attribute(8)]];
    float4 m_55 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
    float4 m_65 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _814 = false;
    bool _674 = false;
    bool _550 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_42.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    float _110 = _108;
    if (!_104)
    {
        out.m_45.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2224 = as_type<float>(_116);
        out.gl_Position.z = _2224;
    }
    if (!_104)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _120 = in.m_47.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _136 = 0.0;
    float _138 = _134;
    if (_130)
    {
        float _140 = float(_100);
        _136 = _140;
    }
    float _142 = _136;
    bool _144 = _134 >= _142;
    bool _146 = !_130;
    bool _148 = _144 || _146;
    if (_148)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _110;
    if (_148)
    {
        out.m_45.x = 0.0;
    }
    if (_148)
    {
        float _152 = _150 * 5.0;
        _118 = as_type<int>(_152);
    }
    int _154 = _118;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2293 = as_type<float>(_154);
        out.gl_Position.z = _2293;
    }
    if (_148)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _156 = in.m_49.x;
    float _158 = in.m_49.y;
    float _160 = in.m_49.z;
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _164 = _134 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _166 = in.m_51.x;
    float _168 = in.m_51.y;
    float _170 = in.m_51.z;
    float _172 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _174 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _176 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _178 = _174 || _176;
    bool _180 = isnan(1.0);
    bool _182 = _178 || _180;
    float _184 = in.m_53.x;
    float _186 = in.m_53.y;
    float _188 = in.m_53.z;
    float _190 = in.m_55.x;
    float _192 = _164 * _162;
    float _194 = 0.0;
    float _196 = _172;
    if (!_182)
    {
        float _198 = _172 * _172;
        float _200 = _198 * 0.5;
        _194 = _200;
    }
    float _202 = _194;
    float _204 = _156 * _156;
    float _206 = _158 * _158;
    float _208 = _160 * _160;
    float _210 = _202;
    float _212 = _158;
    float _214 = _160;
    if (!_182)
    {
        float _216 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _216;
    }
    float _218 = _210;
    float _220 = fma(_166, _166, _204);
    float _222 = fma(_168, _168, _206);
    float _224 = fma(_170, _170, _208);
    float _226 = fma(_184, _184, _220);
    float _228 = fma(_186, _186, _222);
    float _230 = fma(_188, _188, _224);
    float _232 = sqrt(_226);
    float _234 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[20].x, _192);
    float _236 = sqrt(_228);
    float _238 = sqrt(_230);
    bool _240 = _232 > 0.0;
    bool _242 = _236 > 0.0;
    float _244 = floor(_234);
    int _246 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _248 = _246 != 0;
    bool _250 = _238 > 0.0;
    float _252 = 0.0;
    float _254 = _232;
    float _256 = _218;
    if (_240)
    {
        float _258 = rsqrt(_226);
        _252 = _258;
    }
    float _260 = _252;
    if (!_240)
    {
        _254 = 0.0;
    }
    float _262 = _254;
    float _264 = 0.0;
    float _266 = _262;
    if (!_240)
    {
        _264 = 0.0;
    }
    float _268 = _264;
    float _270 = 0.0;
    float _272 = _268;
    if (_242)
    {
        float _274 = rsqrt(_228);
        _270 = _274;
    }
    float _276 = _270;
    float _278 = -_244;
    float _280 = _234 + _278;
    float _282 = _234 * 6.283185482025146484375;
    float _284 = _244;
    if (!_240)
    {
        _284 = 0.0;
    }
    float _286 = _284;
    float _288 = 0.0;
    float _290 = _286;
    if (_250)
    {
        float _292 = rsqrt(_230);
        _288 = _292;
    }
    float _294 = _288;
    bool _296 = !_182;
    float _298 = 0.0;
    if (!_296)
    {
        float _300 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _302 = log2(_300);
        float _304 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _306 = _304 + 1.0;
        float _308 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _310 = _172 * _302;
        float _312 = 1.0 / _306;
        float _314 = _308 * 0.693147182464599609375;
        float _316 = exp2(_310);
        float _318 = 1.0 / _314;
        float _320 = _316 + (-1.0);
        float _322 = -_320;
        float _324 = fma(_322, _318, _172);
        float _326 = _324 * _312;
        float _328 = _326 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _256 = _328;
        _298 = _318;
    }
    float _330 = _256;
    float _332 = _298;
    bool _334 = !_182;
    float _336 = _332;
    if (!_334)
    {
        float _338 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _340 = log2(_338);
        float _342 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _344 = _342 + 1.0;
        float _346 = 1.0 / _344;
        float _348 = _172 * _340;
        float _350 = exp2(_348);
        float _352 = -_350;
        float _354 = _352 + 1.0;
        float _356 = _354 * _346;
        _196 = _356;
    }
    float _358 = _196;
    float _360 = _282 * 0.15915493667125701904296875;
    float _362 = in.m_47.x;
    float _364 = in.m_47.y;
    float _366 = in.m_47.z;
    float _368 = 0.0;
    if (!_242)
    {
        _368 = 0.0;
        _336 = 0.0;
    }
    float _370 = _368;
    float _372 = _336;
    float _374 = 0.0;
    float _376 = _370;
    float _378 = _372;
    if (!_242)
    {
        _374 = 0.0;
    }
    float _380 = _374;
    float _382 = _380;
    if (_240)
    {
        float _384 = _260 * _166;
        _290 = _384;
    }
    float _386 = _290;
    float _388 = _360 * 6.283185482025146484375;
    float _390 = cos(_388);
    float _392 = _386;
    if (_240)
    {
        float _394 = _260 * _156;
        _266 = _394;
    }
    float _396 = _266;
    if (_240)
    {
        float _398 = _260 * _184;
        _272 = _398;
    }
    float _400 = _272;
    if (_242)
    {
        float _402 = _276 * _168;
        _376 = _402;
    }
    float _404 = _376;
    if (_242)
    {
        float _406 = _276 * _158;
        _378 = _406;
    }
    float _408 = _378;
    if (_242)
    {
        float _410 = _276 * _186;
        _382 = _410;
    }
    float _412 = _382;
    float _414 = 0.0;
    float _416 = 0.0;
    if (!_250)
    {
        _414 = 0.0;
        _416 = 0.0;
    }
    float _418 = _414;
    float _420 = _416;
    float _422 = _420;
    float _424 = _418;
    if (_250)
    {
        float _426 = _294 * _160;
        _422 = _426;
    }
    float _428 = _422;
    int _430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _432 = _430 != 0;
    int _434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _436 = _434 != 0;
    if (_250)
    {
        float _438 = _294 * _188;
        _424 = _438;
    }
    float _440 = _424;
    float _442 = 0.0;
    if (!_250)
    {
        _442 = 0.0;
    }
    float _444 = _442;
    float _446 = _444;
    if (_250)
    {
        float _448 = _294 * _170;
        _446 = _448;
    }
    float _450 = _446;
    bool _452 = _280 < 0.5;
    float _454 = float(_452);
    float _456 = -_280;
    float _458 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _460 = fma(_390, 0.5, 0.5);
    float _462 = in.m_57.w;
    bool _464 = !_432;
    int _466 = _464 ? 0 : 1;
    float _468 = _330 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _470 = -_454;
    float _472 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _474 = in.m_42.x;
    float _476 = in.m_42.y;
    float _478 = in.m_42.z;
    float _480 = -_460;
    float _482 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _484 = abs(_466);
    float _486 = fma(_358, _362, _468);
    bool _488 = !_436;
    int _490 = _488 ? 0 : 1;
    float _492 = _330 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _494 = !_248;
    int _496 = _494 ? 0 : 1;
    float _498 = _330 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _500 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _502 = fma(_358, _364, _492);
    int _504 = abs(_490);
    float _506 = fma(_358, _366, _498);
    int _508 = abs(_496);
    float _510 = float(_484);
    float _512 = float(_508);
    float _514 = abs(_458);
    float _516 = _510 * _514;
    float _518 = float(_504);
    float _520 = fma(_512, _482, _516);
    float _522 = fma(_486, _462, _474);
    float _524 = fma(_502, _462, _476);
    float _526 = fma(_506, _462, _478);
    float _528 = abs(_472);
    float _530 = fma(_518, _528, _520);
    bool _532 = !_500;
    float _548;
    if (!_532)
    {
        float _534 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _536 = _190 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _538 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _540 = _538 * _534;
        float _542 = floor(_540);
        float _544 = -_542;
        float _546 = _540 + _544;
        _548 = _546;
        _550 = true;
    }
    else
    {
        float _552 = float(_100);
        float _554 = 1.0 / _552;
        float _556 = _134 * _554;
        _548 = _556;
    }
    _550 = false;
    float _558 = _548;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _562 = _558 + _560;
    bool _564 = _558 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _566 = isnan(_558);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _576;
    float _580 = 1.0 / _578;
    bool _582 = _558 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _584 = isnan(_558);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = -_574;
    float _596 = _594 + 1.0;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _598;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _602;
    bool _606 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _608 = _592 * _596;
    float _610 = -_592;
    float _612 = _610 + 1.0;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _614;
    float _618 = _562 * _580;
    float _620 = in.m_57.x;
    float _622 = in.m_57.y;
    float _624 = in.m_57.z;
    float _626 = fma(_600, _618, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _628 = fma(_616, _618, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _630 = fma(_604, _618, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _632 = _626 * _608;
    float _634 = _628 * _608;
    float _636 = _630 * _608;
    float _638 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[143].x, _632);
    float _640 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[143].y, _634);
    float _642 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[143].z, _636);
    float _644 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[144].x, _638);
    float _646 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[144].y, _640);
    float _648 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[144].z, _642);
    float _650 = _644 * _620;
    float _652 = _646 * _622;
    float _654 = _648 * _624;
    bool _656 = !_606;
    float _672;
    if (!_656)
    {
        float _658 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _660 = _190 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _662 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _664 = _662 * _658;
        float _666 = floor(_664);
        float _668 = -_666;
        float _670 = _664 + _668;
        _672 = _670;
        _674 = true;
    }
    else
    {
        float _676 = float(_100);
        float _678 = 1.0 / _676;
        float _680 = _134 * _678;
        _672 = _680;
    }
    _674 = false;
    float _682 = _672;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _686 = _682 + _684;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _690 = _688 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _692 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _694 = isnan(_682);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _700 = _696 || _698;
    float _702 = float(_700);
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _708 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _710 = isnan(_682);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _720;
    bool _724 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _726 = isnan(_682);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = 1.0 / _690;
    float _738 = -_702;
    float _740 = _738 + 1.0;
    bool _742 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _744 = _718 * _740;
    float _746 = -_718;
    float _748 = _746 + 1.0;
    float _750 = 1.0 / _706;
    float _752 = _722 * _736;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _758 = fma(_752, _686, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _762 = _756 * _750;
    float _764 = _758 * _744;
    float _766 = -_734;
    float _768 = _766 + 1.0;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _772 = _682 + _770;
    float _774 = _760 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _776 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[115].x, _764);
    float _778 = _702 * _768;
    float _780 = fma(_762, _772, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _782 = fma(_780, _778, _776);
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _788 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[117].x, _782);
    float _790 = _784 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _792 = _786 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _794 = _788 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _774;
    out.m_59.y = _790;
    out.m_59.z = _792;
    out.m_59.w = _794;
    bool _796 = !_742;
    float _812;
    if (!_796)
    {
        float _798 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _800 = _190 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _802 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[11].w, _134);
        float _804 = _802 * _798;
        float _806 = floor(_804);
        float _808 = -_806;
        float _810 = _804 + _808;
        _812 = _810;
        _814 = true;
    }
    else
    {
        float _816 = float(_100);
        float _818 = 1.0 / _816;
        float _820 = _134 * _818;
        _812 = _820;
    }
    _814 = false;
    float _822 = _812;
    float _824 = in.m_55.y;
    float _826 = _190 * 2.0;
    float _828 = _530 * _652;
    float _830 = in.m_55.z;
    float _832 = _530 * _654;
    float _834 = floor(_826);
    int _836 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _838 = _836 != 0;
    int _840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _842 = _840 != 0;
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _846 = _844 != 0;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _852 = _850 != 0;
    float _854 = _190 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _856 = _530 * _650;
    float _858 = -_848;
    float _860 = fma(_854, 2.0, _858);
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _864 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _866 = log2(_864);
    float _868 = _828 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _870 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _872 = _832 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _874 = _824 * 2.0;
    float _876 = _824 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _878 = _834 > 0.0;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _882 = _824 + _830;
    float _884 = _830 * 2.0;
    float _886 = floor(_874);
    float _888 = fma(_876, -2.0, _862);
    float _890 = _882 + (-1.0);
    bool _892 = _834 >= 0.0;
    bool _894 = isnan(_834);
    bool _896 = _892 || _894;
    bool _898 = isnan(0.0);
    bool _900 = _896 || _898;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _904 = _876;
    float _906 = _834;
    float _908 = _890;
    if (!_852)
    {
        _904 = _824;
    }
    float _910 = _904;
    float _912 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _914 = floor(_884);
    float _916 = _910;
    if (!_852)
    {
        _906 = _830;
    }
    float _918 = _906;
    float _920 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _888);
    float _922 = _918;
    if (!_852)
    {
        _908 = _830;
    }
    float _924 = _908;
    float _926 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _928 = _924;
    if (_852)
    {
        _916 = _190;
    }
    float _930 = _916;
    float _932 = _824 + (-0.5);
    if (_852)
    {
        _922 = _824;
    }
    float _934 = _922;
    float _936 = _856 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (_852)
    {
        _928 = _824;
    }
    float _938 = _928;
    float _940 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[83].z, _870);
    bool _942 = _886 > 0.0;
    bool _944 = _886 >= 0.0;
    bool _946 = isnan(_886);
    bool _948 = _944 || _946;
    bool _950 = isnan(0.0);
    bool _952 = _948 || _950;
    float _954 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[83].w, _926);
    int _956 = _900 ? 0 : 1;
    float _958 = _930 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _960 = !_842;
    int _962 = _960 ? 0 : 1;
    float _964 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _954);
    int _966 = ~_956;
    int _968 = _966 + 1;
    int _970 = _968 + 1;
    float _972 = -_880;
    float _974 = fma(_958, 2.0, _972);
    int _976 = _952 ? 0 : 1;
    float _978 = _934 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _980 = abs(_962);
    int _982 = _970;
    if (!_878)
    {
        int _984 = ~_956;
        int _986 = _984 + 1;
        _982 = _986;
    }
    int _988 = _982;
    float _990 = fma(_978, -2.0, _902);
    bool _992 = _914 > 0.0;
    bool _994 = _914 >= 0.0;
    bool _996 = isnan(_914);
    bool _998 = _994 || _996;
    bool _1000 = isnan(0.0);
    bool _1002 = _998 || _1000;
    int _1004 = ~_976;
    int _1006 = _1004 + 1;
    int _1008 = _1006 + 1;
    float _1010 = float(_980);
    float _1012 = float(_988);
    int _1014 = _1008;
    if (!_942)
    {
        int _1016 = ~_976;
        int _1018 = _1016 + 1;
        _1014 = _1018;
    }
    int _1020 = _1014;
    float _1022 = _866 * _134;
    int _1024 = _1002 ? 0 : 1;
    float _1026 = _1010 * _1012;
    float _1028 = in.m_61.x;
    float _1030 = in.m_61.y;
    float _1032 = in.m_61.z;
    int _1034 = ~_1024;
    int _1036 = _1034 + 1;
    int _1038 = _1036 + 1;
    float _1040 = exp2(_1022);
    int _1042 = _1038;
    if (!_992)
    {
        int _1044 = ~_1024;
        int _1046 = _1044 + 1;
        _1042 = _1046;
    }
    int _1048 = _1042;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1052 = 1.0 + _1050;
    float _1054 = _1026 * (-2.0);
    bool _1056 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1058 = isnan(1.0);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1064 = _1060 || _1062;
    float _1066 = 1.0 / _1052;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1070 = !_838;
    int _1072 = _1070 ? 0 : 1;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1076 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1078 = isnan(0.0);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1084 = _1080 || _1082;
    float _1086 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1068);
    int _1088 = abs(_1072);
    float _1090 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1074);
    float _1092 = -_1040;
    float _1094 = _1092 + 1.0;
    float _1096 = -_134;
    float _1098 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[76].x, _860);
    float _1100 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _940);
    bool _1102 = !_846;
    int _1104 = _1102 ? 0 : 1;
    float _1106 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1086);
    float _1108 = _1084 ? _1094 : 0.0;
    float _1110 = fma(_1054, _1030, _1030);
    float _1112 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1090);
    float _1114 = float(_1088);
    float _1116 = -_134;
    float _1118 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[81].x, _974);
    float _1120 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _990);
    float _1122 = float(_1048);
    if (_1064)
    {
        float _1124 = _1108 * _1066;
        _138 = _1124;
    }
    float _1126 = _138;
    float _1128 = fma(_912, _1054, _912);
    float _1130 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1110);
    int _1132 = abs(_1104);
    float _1134 = _190 + _824;
    float _1136 = _1114 * _1122;
    float _1138 = fma(_1128, _1126, _1130);
    float _1140 = _1134 + (-1.0);
    float _1142 = float(_1132);
    float _1144 = _1136 * (-2.0);
    float _1146 = float(_1020);
    float _1148 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1150 = _190 + (-0.5);
    float _1152 = _1138 * 0.15915493667125701904296875;
    float _1154 = _524 * _186;
    float _1156 = _1142 * _1146;
    float _1158 = fma(_1144, _1028, _1028);
    float _1160 = _190 + _830;
    float _1162 = fma(_1148, _1144, _1148);
    float _1164 = _1156 * (-2.0);
    float _1166 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1158);
    float _1168 = _1160 + (-1.0);
    float _1170 = _830 + (-0.5);
    float _1172 = fma(_1162, _1126, _1166);
    float _1174 = fma(_1164, _1032, _1032);
    float _1176 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1178 = _1152 * 6.283185482025146484375;
    float _1180 = sin(_1178);
    float _1182 = in.m_63.x;
    float _1184 = in.m_63.y;
    float _1186 = in.m_63.z;
    float _1188 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1174);
    float _1190 = fma(_1176, _1164, _1176);
    float _1192 = _1172 * 0.15915493667125701904296875;
    float _1194 = fma(_522, _184, _1154);
    float _1196 = fma(_1190, _1126, _1188);
    float _1198 = _1152 * 6.283185482025146484375;
    float _1200 = cos(_1198);
    float _1202 = fma(_526, _188, _1194);
    float _1204 = _1196 * 0.15915493667125701904296875;
    float _1206 = _524 * _168;
    float _1208 = _524 * _158;
    float _1210 = _1192 * 6.283185482025146484375;
    float _1212 = sin(_1210);
    float _1214 = fma(_522, _166, _1206);
    float _1216 = fma(_522, _156, _1208);
    float _1218 = fma(_526, _160, _1216);
    float _1220 = _1192 * 6.283185482025146484375;
    float _1222 = cos(_1220);
    float _1224 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1184);
    float _1226 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1186);
    float _1228 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1182);
    float _1230 = _868 * _1224;
    float _1232 = _872 * _1226;
    float _1234 = in.m_53.w;
    float _1236 = _1204 * 6.283185482025146484375;
    float _1238 = cos(_1236);
    float _1240 = _1212 * _1180;
    float _1242 = _936 * _1228;
    float _1244 = in.m_51.w;
    float _1246 = _1212 * _1200;
    float _1248 = _1204 * 6.283185482025146484375;
    float _1250 = sin(_1248);
    float _1252 = _1222 * _1200;
    float _1254 = _1222 * _1180;
    float _1256 = _1222 * _1238;
    float _1258 = _1212 * _1238;
    float _1260 = _1200 * _1238;
    float _1262 = _1180 * _1238;
    float _1264 = _1256 * _1230;
    float _1266 = _1258 * _1230;
    float _1268 = fma(_1250, _1252, _1240);
    float _1270 = -_1230;
    float _1272 = _1250 * _1270;
    float _1274 = -_1246;
    float _1276 = fma(_1250, _1254, _1274);
    float _1278 = -_1254;
    float _1280 = fma(_1250, _1246, _1278);
    float _1282 = fma(_1268, _1242, _1264);
    float _1284 = fma(_1260, _1242, _1272);
    float _1286 = fma(_1250, _1240, _1252);
    float _1288 = fma(_1276, _1232, _1282);
    float _1290 = fma(_1280, _1242, _1266);
    float _1292 = fma(_1262, _1232, _1284);
    float _1294 = _1288 * _412;
    float _1296 = fma(_1286, _1232, _1290);
    float _1298 = _1288 * _404;
    float _1300 = _1288 * _408;
    float _1302 = fma(_1292, _400, _1294);
    float _1304 = fma(_526, _170, _1214);
    float _1306 = _1202 + _1234;
    float _1308 = fma(_1292, _386, _1298);
    float _1310 = fma(_1296, _440, _1302);
    float _1312 = _1304 + _1244;
    float _1314 = fma(_1292, _396, _1300);
    float _1316 = fma(_1296, _450, _1308);
    float _1318 = _1306 + _1310;
    float _1320 = fma(_1296, _428, _1314);
    float _1322 = _1312 + _1316;
    float _1324 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1326 = _1318 + _1324;
    float _1328 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1330 = _1322 + _1328;
    float _1332 = _1326 * _1326;
    float _1334 = fma(_1330, _1330, _1332);
    float _1336 = in.m_49.w;
    float _1338 = sqrt(_1334);
    bool _1340 = _1338 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1342 = _1218 + _1336;
    float _1344 = _1342 + _1320;
    float _1346 = _1336;
    float _1348 = _1338;
    float _1350 = _1334;
    float _1352 = _1266;
    int _1354 = as_type<int>(_1186);
    if (!_1340)
    {
        _212 = _1322;
    }
    float _1356 = _212;
    float _1358 = _1356;
    if (!_1340)
    {
        _1346 = _1318;
    }
    float _1360 = _1346;
    float _1362 = _1360;
    if (!_1340)
    {
        _214 = _1344;
    }
    float _1364 = _214;
    bool _1366 = !_1340;
    float _1368 = _1364;
    if (!_1366)
    {
        float _1370 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1372 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1374 = _1338 + _1372;
        float _1376 = _1344 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1378 = rsqrt(_1334);
        float _1380 = _1374 * _1370;
        float _1382 = _1380 * 0.15915493667125701904296875;
        float _1384 = _1382 * 6.283185482025146484375;
        float _1386 = sin(_1384);
        float _1388 = _1382 * 6.283185482025146484375;
        float _1390 = cos(_1388);
        float _1392 = fma(_1386, _1376, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1394 = _1378 * _1392;
        float _1396 = _1390 + (-1.0);
        float _1398 = fma(_1330, _1394, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1400 = fma(_1326, _1394, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1402 = _1396 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1404 = fma(_1344, _1390, _1402);
        _1368 = _1404;
        _1358 = _1398;
        _1362 = _1400;
        _1348 = _1374;
    }
    float _1406 = _1368;
    float _1408 = _1358;
    float _1410 = _1362;
    float _1412 = _1348;
    float _1414 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1416 = _1406 + _1414;
    float _1418 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1420 = _1408 + _1418;
    float _1422 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1424 = _1410 + _1422;
    float _1426 = _1416 * _1416;
    float _1428 = fma(_1420, _1420, _1426);
    float _1430 = fma(_1424, _1424, _1428);
    float _1432 = rsqrt(_1430);
    float _1434 = sqrt(_1430);
    float _1436 = _1432 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1438 = _1420 * _1436;
    float _1440 = _1424 * _1436;
    float _1442 = _1438 * _1438;
    float _1444 = _1440 * _1440;
    float _1446 = _1442 + _1444;
    float _1448 = sqrt(_1446);
    bool _1450 = _1448 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1452 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1454 = _1448 + _1452;
    float _1456 = _1412;
    float _1458 = _1454;
    float _1460 = _1438;
    float _1462 = _1440;
    float _1464 = _1442;
    float _1466 = _1444;
    if (_1450)
    {
        float _1468 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1456 = _1468;
    }
    float _1470 = _1456;
    if (_1450)
    {
        float _1472 = _1454 * _1470;
        _1458 = _1472;
    }
    float _1474 = _1458;
    if (_1450)
    {
        float _1476 = _1474 * 0.15915493667125701904296875;
        _1350 = _1476;
    }
    float _1478 = _1350;
    float _1480 = _1318;
    if (_1450)
    {
        float _1482 = _1478 * 6.283185482025146484375;
        float _1484 = sin(_1482);
        _1480 = _1484;
    }
    float _1486 = _1480;
    float _1488 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1490 = precise::max(0.0, _1488);
    float _1492 = _1292;
    float _1494 = _1490;
    if (_1450)
    {
        float _1496 = _1478 * 6.283185482025146484375;
        float _1498 = cos(_1496);
        _1492 = _1498;
    }
    float _1500 = _1492;
    float _1502 = -_1436;
    float _1504 = -_1490;
    float _1506 = fma(_1416, _1502, _1504);
    float _1508 = _1488;
    if (_1450)
    {
        float _1510 = rsqrt(_1446);
        _1508 = _1510;
    }
    float _1512 = _1508;
    if (_1450)
    {
        float _1514 = _1506 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1494 = _1514;
    }
    float _1516 = _1494;
    float _1518 = _1516;
    float _1520 = _1486;
    if (_1450)
    {
        float _1522 = fma(_1486, _1516, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1352 = _1522;
    }
    float _1524 = _1352;
    float _1526 = _1524;
    if (_1450)
    {
        float _1528 = _1500 + (-1.0);
        _1518 = _1528;
    }
    float _1530 = _1518;
    if (_1450)
    {
        float _1532 = _1530 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1520 = _1532;
    }
    float _1534 = _1520;
    float _1536 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1538 = _1512;
    if (_1450)
    {
        float _1540 = _1512 * _1524;
        _1526 = _1540;
    }
    float _1542 = _1526;
    if (!_1450)
    {
        _1538 = _1506;
    }
    float _1544 = _1538;
    float _1546 = _1544;
    if (_1450)
    {
        float _1548 = fma(_1506, _1500, _1534);
        _1546 = _1548;
    }
    float _1550 = _1546;
    if (_1450)
    {
        float _1552 = _1438 * _1542;
        _1460 = _1552;
    }
    float _1554 = _1460;
    if (_1450)
    {
        float _1556 = _1440 * _1542;
        _1462 = _1556;
    }
    float _1558 = _1462;
    float _1560 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1536);
    float _1562 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1450)
    {
        float _1564 = _1554 * _1554;
        _1464 = _1564;
    }
    float _1566 = _1464;
    if (_1450)
    {
        float _1568 = _1558 * _1558;
        _1466 = _1568;
    }
    float _1570 = _1466;
    float _1572 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1560);
    float _1574 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1576 = fma(_1550, _1550, _1566);
    float _1578 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1562);
    float _1580 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1582 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1574);
    float _1584 = _1576 + _1570;
    float _1586 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1588 = fma(_1434, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1586);
    float _1590 = precise::clamp(_1588, 0.0, 1.0);
    float _1592 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1578);
    float _1594 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1580);
    float _1596 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1582);
    float _1598 = -_1590;
    float _1600 = _1598 + 1.0;
    float _1602 = rsqrt(_1584);
    float _1604 = _1592 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1606 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1608 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1594);
    float _1610 = _1596 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1612 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1614 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1616 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1618 = abs(_1600);
    float _1620 = log2(_1618);
    float _1622 = _1608 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1624 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1612);
    float _1626 = -_1616;
    float _1628 = fma(_1626, _1614, 1.0);
    float _1630 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1632 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1624);
    float _1634 = _1602 * _1554;
    float _1636 = _1602 * _1550;
    float _1638 = _1602 * _1558;
    float _1640 = log2(_1628);
    float _1642 = _1634 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1644 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1632);
    float _1646 = -_1642;
    float _1648 = fma(_1636, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1646);
    float _1650 = _1620 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1652 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1654 = -_1638;
    float _1656 = fma(_1654, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1648);
    float _1658 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1630);
    float _1660 = 1.0 / _1644;
    float _1662 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1652);
    float _1664 = fma(_1656, -0.5, 0.5);
    float _1666 = fma(_1656, 0.5, 0.5);
    float _1668 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1658);
    float _1670 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1662);
    float _1672 = _1636 + 1.0;
    float _1674 = fma(_1666, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1676 = exp2(_1650);
    float _1678 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1670);
    float _1680 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1668);
    float _1682 = fma(_1666, _1674, -0.212114393711090087890625);
    float _1684 = _1640 * 0.693147182464599609375;
    float _1686 = fma(_1666, _1682, 1.570728778839111328125);
    float _1688 = sqrt(_1664);
    float _1690 = _1684 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1692 = -_1636;
    float _1694 = fma(_1676, _1672, _1692);
    float _1696 = _1678 * _1660;
    float _1698 = _1680 * _1660;
    float _1700 = fma(_1694, 0.5, 0.5);
    float _1702 = fma(_1698, -0.5, 0.5);
    float _1704 = _1688 * 0.636619746685028076171875;
    float _1706 = fma(_1696, 0.5, 0.5);
    float _1708 = -_1686;
    float _1710 = fma(_1704, _1708, 1.0);
    float3 _4669 = float3(_1706, _1702, _1690);
    float _1712 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4669, float3(0.0), isnan(_4669)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4669, float3(0.0), isnan(_4669)), level(0.0)).x;
    float3 _4680 = float3(_1706, _1702, _1690);
    float4 _1715 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4680, float3(0.0), isnan(_4680)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4680, float3(0.0), isnan(_4680)), level(0.0)).xyzw;
    float _1717 = _1715.x;
    float _1719 = _1715.y;
    float _1721 = _1715.z;
    float _1723 = _1715.w;
    float2 _4697 = float2(_1710, _1700);
    float3 _1727 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4697, float2(0.0), isnan(_4697)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4697, float2(0.0), isnan(_4697)), level(0.0)).xyz;
    float _1729 = _1727.x;
    float _1731 = _1727.y;
    float _1733 = _1727.z;
    float _1735 = in.m_55.w;
    float _1737 = _1620 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1739 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1741 = isnan(0.5);
    bool _1743 = _1739 || _1741;
    bool _1745 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1747 = _1743 || _1745;
    float _1749 = in.m_65.y;
    float _1751 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1753 = _1751 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1755 = in.m_65.x;
    float _1757 = 1.0 / _1753;
    bool _1759 = _1184 != 0.0;
    bool _1761 = isnan(_1184);
    bool _1763 = _1759 || _1761;
    bool _1765 = isnan(0.0);
    bool _1767 = _1763 || _1765;
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    int _1769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1771 = _1769 != 0;
    int _1773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1775 = _1773 != 0;
    out.m_69.x = _1420;
    out.m_69.y = _1416;
    out.m_69.z = _1424;
    int _1777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1779 = _1777 != 0;
    float _1781 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1785 = _1783 != 0;
    bool _1787 = _1182 == 0.0;
    bool _1789 = !_1767;
    bool _1791 = _1787 && _1789;
    bool _1793 = _1735 > 0.5;
    float _1795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1797 = in.m_71.x;
    float _1799 = in.m_71.y;
    float _1801 = in.m_71.z;
    float _1803 = -_1749;
    float _1805 = _1803 + 1.0;
    float _1807 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1809 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1807;
    bool _1811 = _1186 == 0.0;
    bool _1813 = _1811 && _1791;
    int _1815 = _1793 ? as_type<int>(_1805) : as_type<int>(_1749);
    float _1817 = _1781 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1819 = _824 > 0.5;
    float _1821 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1823 = _822 + _1821;
    float _1825 = _1785 ? as_type<float>(_1815) : _1749;
    float _1827 = exp2(_1737);
    bool _1829 = _1785;
    float _1831 = _1749;
    float _1833 = _1809;
    bool _1835 = _1775;
    int _1837 = as_type<int>(_1823);
    if (_1771)
    {
        bool _1839 = _190 > 0.5;
        _1829 = _1839;
    }
    bool _1841 = _1829;
    float _1843 = _1809 * _1757;
    float _1845 = _1843;
    if (_1775)
    {
        float _1847 = _1819 ? _1805 : _1749;
        _1831 = _1847;
    }
    float _1849 = _1831;
    float _1851 = _1795 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (!_1771)
    {
        _1833 = _1755;
    }
    float _1853 = _1833;
    bool _1855 = _822 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1857 = isnan(_822);
    bool _1859 = _1855 || _1857;
    bool _1861 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1863 = _1859 || _1861;
    float _1865 = float(_1863);
    float _1867 = fma(_1825, _1851, -0.5);
    float _1869 = _1853;
    float _1871 = _1865;
    if (_1779)
    {
        bool _1873 = _830 > 0.5;
        _1835 = _1873;
    }
    bool _1875 = _1835;
    float _1877 = fma(_1843, _1823, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (!_1771)
    {
        _1845 = _1853;
    }
    float _1879 = _1845;
    float _1881 = fma(_1817, _1849, -0.5);
    float _1883 = _1879;
    if (_1771)
    {
        _1869 = _1755;
    }
    float _1885 = _1869;
    float _1887 = -_1865;
    float _1889 = _1887 + 1.0;
    bool _1891 = _822 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1893 = isnan(_822);
    bool _1895 = _1891 || _1893;
    bool _1897 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1899 = _1895 || _1897;
    float _1901 = float(_1899);
    float _1903 = _1799;
    float _1905 = _1797;
    float _1907 = _1801;
    float _1909 = _1885;
    if (!_1813)
    {
        float _1911 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1799);
        _1903 = _1911;
    }
    float _1913 = _1903;
    float _1915 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (!_1813)
    {
        float _1917 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1797);
        _1905 = _1917;
    }
    float _1919 = _1905;
    if (!_1813)
    {
        float _1921 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1801);
        _1907 = _1921;
    }
    float _1923 = _1907;
    float _1925 = _1901 * _1889;
    float _1927 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1771)
    {
        float _1929 = -_1885;
        float _1931 = _1929 + 1.0;
        _1354 = as_type<int>(_1931);
    }
    int _1933 = _1354;
    float _1935 = _1256 * _1913;
    float _1937 = _1877 * _1925;
    float _1939 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1915);
    float _1941 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    if (_1771)
    {
        float _1943 = _1841 ? as_type<float>(_1933) : _1885;
        _1883 = _1943;
    }
    float _1945 = _1883;
    float _1947 = -_1913;
    float _1949 = _1250 * _1947;
    float _1951 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1939);
    float _1953 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1941);
    float _1955 = fma(_1268, _1919, _1935);
    float _1957 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1959 = _1951 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1961 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1953);
    float _1963 = -_1901;
    float _1965 = _1963 + 1.0;
    float _1967 = fma(_1260, _1919, _1949);
    float _1969 = _1927 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1971 = _1961 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1973 = fma(_1965, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1937);
    float _1975 = 1.0 / _1959;
    float _1977 = fma(_1969, _1945, -0.5);
    float _1979 = fma(_1276, _1923, _1955);
    float _1981 = fma(_1865, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1973);
    if (!_1747)
    {
        _1871 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1983 = _1871;
    float _1985 = fma(_1262, _1923, _1967);
    float _1987 = _1258 * _1913;
    float _1989 = _1983;
    float _1991 = _1985;
    if (_1779)
    {
        float _1993 = -_1885;
        float _1995 = _1993 + 1.0;
        _1837 = as_type<int>(_1995);
    }
    int _1997 = _1837;
    float _1999 = fma(_1106, _1977, _1098);
    float _2001 = _1971 + _1959;
    float _2003 = fma(_1280, _1919, _1987);
    float _2005 = _1979 * _408;
    if (_1779)
    {
        float _2007 = _1875 ? as_type<float>(_1997) : _1885;
        _1909 = _2007;
    }
    float _2009 = _1909;
    float _2011 = -_1120;
    float _2013 = fma(_964, _1867, _2011);
    float _2015 = fma(_1286, _1923, _2003);
    float _2017 = _1957 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2019 = _2001 * _1975;
    float _2021 = _2019 * 0.5;
    float _2023 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2025 = fma(_1985, _396, _2005);
    float _2027 = fma(_2017, _2009, -0.5);
    float _2029 = _2023;
    float _2031 = _2025;
    if (!_1747)
    {
        float _2033 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2035 = fma(_2021, _1983, _2033);
        _1989 = _2035;
    }
    float _2037 = _1989;
    float _2039 = _1979 * _404;
    float _2041 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2023);
    float _2043 = _1979 * _412;
    float _2045 = fma(_1100, _2027, _1118);
    float _2047 = fma(_1985, _386, _2039);
    float _2049 = _2037;
    if (!_1747)
    {
        float _2051 = 1.0 / _2037;
        _2049 = _2051;
    }
    float _2053 = _2049;
    if (!_1747)
    {
        _392 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2055 = _392;
    float _2057 = fma(_1985, _400, _2043);
    float _2059 = fma(_2015, _450, _2047);
    float _2061 = -_1827;
    float _2063 = _2061 + 1.0;
    if (!_1747)
    {
        float _2065 = -_2055;
        float _2067 = _2065 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2029 = _2067;
    }
    float _2069 = _2029;
    float _2071 = fma(_2015, _428, _2025);
    float _2073 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2041);
    float _2075 = _450;
    if (!_1747)
    {
        float _2077 = 1.0 / _2069;
        _2075 = _2077;
    }
    float _2079 = _2075;
    if (_1747)
    {
        _2031 = 1.0;
    }
    float _2081 = _2031;
    float _2083 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2085 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2073);
    float _2087 = -_920;
    float _2089 = fma(_1112, _1881, _2087);
    float _2091 = _2013 + 0.5;
    float _2093 = _2081;
    if (!_1747)
    {
        float _2095 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2097 = -_2055;
        float _2099 = fma(_2053, _2095, _2097);
        _1991 = _2099;
    }
    float _2101 = _1991;
    float _2103 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2105 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2107 = fma(_2015, _440, _2057);
    float _2109 = _2089 + 0.5;
    float _2111 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2113 = _2103 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2115 = _2105 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2117 = _1981 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (!_1747)
    {
        float _2119 = _2101 * _2079;
        float _2121 = precise::clamp(_2119, 0.0, 1.0);
        _2093 = _2121;
    }
    float _2123 = _2093;
    float _2125 = _2111 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_73.x = _2059;
    out.m_73.y = _2071;
    out.m_73.z = _2107;
    float _2127 = _2085 + _1644;
    float _2129 = _2123 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2131 = _2123 > 0.0;
    bool _2133 = isnan(_2123);
    bool _2135 = _2131 || _2133;
    bool _2137 = isnan(0.0);
    bool _2139 = _2135 || _2137;
    out.m_75.x = _2113;
    out.m_75.y = _2115;
    out.m_75.z = _2125;
    out.m_75.w = _2117;
    float _2141 = _2127 * 0.5;
    float _2143 = _1999 + 0.5;
    float _2145 = _2045 + 0.5;
    float _2147 = _2129 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2149 = -_2083;
    float _2151 = _2149 + 1.0;
    out.m_77.x = _2143;
    out.m_77.y = _2109;
    out.m_77.z = _2145;
    out.m_77.w = _2091;
    out.gl_Position.x = _1678;
    out.gl_Position.y = _1680;
    out.gl_Position.z = _2085;
    out.gl_Position.w = _1644;
    out.m_79.z = _2141;
    out.m_79.w = _1644;
    out.m_45.x = _2147;
    float _2153 = _2083 * _1712;
    float _2155 = _1723 * _2151;
    float _2157 = _1723 * _2153;
    float _2159 = _1733 * _2153;
    float _2161 = fma(_1729, _2157, _1717);
    float _2163 = fma(_1731, _2157, _1719);
    float _2165 = fma(_1723, _2159, _1721);
    out.m_81.x = _2161;
    out.m_81.y = _2163;
    out.m_81.z = _2165;
    out.m_81.w = _2155;
    if (_2139)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2167 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2167;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _814 = false;
    bool _674 = false;
    bool _550 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_42.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    float _110 = _108;
    if (!_104)
    {
        out.m_45.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2224 = as_type<float>(_116);
        out.gl_Position.z = _2224;
    }
    if (!_104)
    {
        return out;
    }
    float _120 = in.m_47.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _136 = 0.0;
    float _138 = _134;
    if (_130)
    {
        float _140 = float(_100);
        _136 = _140;
    }
    float _142 = _136;
    bool _144 = _134 >= _142;
    bool _146 = !_130;
    bool _148 = _144 || _146;
    if (_148)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _110;
    if (_148)
    {
        out.m_45.x = 0.0;
    }
    if (_148)
    {
        float _152 = _150 * 5.0;
        _118 = as_type<int>(_152);
    }
    int _154 = _118;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2293 = as_type<float>(_154);
        out.gl_Position.z = _2293;
    }
    if (_148)
    {
        return out;
    }
    float _156 = in.m_49.x;
    float _158 = in.m_49.y;
    float _160 = in.m_49.z;
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _164 = _134 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _166 = in.m_51.x;
    float _168 = in.m_51.y;
    float _170 = in.m_51.z;
    float _172 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _174 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _176 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _178 = _174 || _176;
    bool _180 = isnan(1.0);
    bool _182 = _178 || _180;
    float _184 = in.m_53.x;
    float _186 = in.m_53.y;
    float _188 = in.m_53.z;
    float _190 = in.m_55.x;
    float _192 = _164 * _162;
    float _194 = 0.0;
    float _196 = _172;
    if (!_182)
    {
        float _198 = _172 * _172;
        float _200 = _198 * 0.5;
        _194 = _200;
    }
    float _202 = _194;
    float _204 = _156 * _156;
    float _206 = _158 * _158;
    float _208 = _160 * _160;
    float _210 = _202;
    float _212 = _158;
    float _214 = _160;
    if (!_182)
    {
        float _216 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _216;
    }
    float _218 = _210;
    float _220 = fma(_166, _166, _204);
    float _222 = fma(_168, _168, _206);
    float _224 = fma(_170, _170, _208);
    float _226 = fma(_184, _184, _220);
    float _228 = fma(_186, _186, _222);
    float _230 = fma(_188, _188, _224);
    float _232 = sqrt(_226);
    float _234 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[20].x, _192);
    float _236 = sqrt(_228);
    float _238 = sqrt(_230);
    bool _240 = _232 > 0.0;
    bool _242 = _236 > 0.0;
    float _244 = floor(_234);
    int _246 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _248 = _246 != 0;
    bool _250 = _238 > 0.0;
    float _252 = 0.0;
    float _254 = _232;
    float _256 = _218;
    if (_240)
    {
        float _258 = rsqrt(_226);
        _252 = _258;
    }
    float _260 = _252;
    if (!_240)
    {
        _254 = 0.0;
    }
    float _262 = _254;
    float _264 = 0.0;
    float _266 = _262;
    if (!_240)
    {
        _264 = 0.0;
    }
    float _268 = _264;
    float _270 = 0.0;
    float _272 = _268;
    if (_242)
    {
        float _274 = rsqrt(_228);
        _270 = _274;
    }
    float _276 = _270;
    float _278 = -_244;
    float _280 = _234 + _278;
    float _282 = _234 * 6.283185482025146484375;
    float _284 = _244;
    if (!_240)
    {
        _284 = 0.0;
    }
    float _286 = _284;
    float _288 = 0.0;
    float _290 = _286;
    if (_250)
    {
        float _292 = rsqrt(_230);
        _288 = _292;
    }
    float _294 = _288;
    bool _296 = !_182;
    float _298 = 0.0;
    if (!_296)
    {
        float _300 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _302 = log2(_300);
        float _304 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _306 = _304 + 1.0;
        float _308 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _310 = _172 * _302;
        float _312 = 1.0 / _306;
        float _314 = _308 * 0.693147182464599609375;
        float _316 = exp2(_310);
        float _318 = 1.0 / _314;
        float _320 = _316 + (-1.0);
        float _322 = -_320;
        float _324 = fma(_322, _318, _172);
        float _326 = _324 * _312;
        float _328 = _326 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _256 = _328;
        _298 = _318;
    }
    float _330 = _256;
    float _332 = _298;
    bool _334 = !_182;
    float _336 = _332;
    if (!_334)
    {
        float _338 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _340 = log2(_338);
        float _342 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _344 = _342 + 1.0;
        float _346 = 1.0 / _344;
        float _348 = _172 * _340;
        float _350 = exp2(_348);
        float _352 = -_350;
        float _354 = _352 + 1.0;
        float _356 = _354 * _346;
        _196 = _356;
    }
    float _358 = _196;
    float _360 = _282 * 0.15915493667125701904296875;
    float _362 = in.m_47.x;
    float _364 = in.m_47.y;
    float _366 = in.m_47.z;
    float _368 = 0.0;
    if (!_242)
    {
        _368 = 0.0;
        _336 = 0.0;
    }
    float _370 = _368;
    float _372 = _336;
    float _374 = 0.0;
    float _376 = _370;
    float _378 = _372;
    if (!_242)
    {
        _374 = 0.0;
    }
    float _380 = _374;
    float _382 = _380;
    if (_240)
    {
        float _384 = _260 * _166;
        _290 = _384;
    }
    float _386 = _290;
    float _388 = _360 * 6.283185482025146484375;
    float _390 = cos(_388);
    float _392 = _386;
    if (_240)
    {
        float _394 = _260 * _156;
        _266 = _394;
    }
    float _396 = _266;
    if (_240)
    {
        float _398 = _260 * _184;
        _272 = _398;
    }
    float _400 = _272;
    if (_242)
    {
        float _402 = _276 * _168;
        _376 = _402;
    }
    float _404 = _376;
    if (_242)
    {
        float _406 = _276 * _158;
        _378 = _406;
    }
    float _408 = _378;
    if (_242)
    {
        float _410 = _276 * _186;
        _382 = _410;
    }
    float _412 = _382;
    float _414 = 0.0;
    float _416 = 0.0;
    if (!_250)
    {
        _414 = 0.0;
        _416 = 0.0;
    }
    float _418 = _414;
    float _420 = _416;
    float _422 = _420;
    float _424 = _418;
    if (_250)
    {
        float _426 = _294 * _160;
        _422 = _426;
    }
    float _428 = _422;
    int _430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _432 = _430 != 0;
    int _434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _436 = _434 != 0;
    if (_250)
    {
        float _438 = _294 * _188;
        _424 = _438;
    }
    float _440 = _424;
    float _442 = 0.0;
    if (!_250)
    {
        _442 = 0.0;
    }
    float _444 = _442;
    float _446 = _444;
    if (_250)
    {
        float _448 = _294 * _170;
        _446 = _448;
    }
    float _450 = _446;
    bool _452 = _280 < 0.5;
    float _454 = float(_452);
    float _456 = -_280;
    float _458 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _460 = fma(_390, 0.5, 0.5);
    float _462 = in.m_57.w;
    bool _464 = !_432;
    int _466 = _464 ? 0 : 1;
    float _468 = _330 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _470 = -_454;
    float _472 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _474 = in.m_42.x;
    float _476 = in.m_42.y;
    float _478 = in.m_42.z;
    float _480 = -_460;
    float _482 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _484 = abs(_466);
    float _486 = fma(_358, _362, _468);
    bool _488 = !_436;
    int _490 = _488 ? 0 : 1;
    float _492 = _330 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _494 = !_248;
    int _496 = _494 ? 0 : 1;
    float _498 = _330 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _500 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _502 = fma(_358, _364, _492);
    int _504 = abs(_490);
    float _506 = fma(_358, _366, _498);
    int _508 = abs(_496);
    float _510 = float(_484);
    float _512 = float(_508);
    float _514 = abs(_458);
    float _516 = _510 * _514;
    float _518 = float(_504);
    float _520 = fma(_512, _482, _516);
    float _522 = fma(_486, _462, _474);
    float _524 = fma(_502, _462, _476);
    float _526 = fma(_506, _462, _478);
    float _528 = abs(_472);
    float _530 = fma(_518, _528, _520);
    bool _532 = !_500;
    float _548;
    if (!_532)
    {
        float _534 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _536 = _190 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _538 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _540 = _538 * _534;
        float _542 = floor(_540);
        float _544 = -_542;
        float _546 = _540 + _544;
        _548 = _546;
        _550 = true;
    }
    else
    {
        float _552 = float(_100);
        float _554 = 1.0 / _552;
        float _556 = _134 * _554;
        _548 = _556;
    }
    _550 = false;
    float _558 = _548;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _562 = _558 + _560;
    bool _564 = _558 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _566 = isnan(_558);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _576;
    float _580 = 1.0 / _578;
    bool _582 = _558 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _584 = isnan(_558);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = -_574;
    float _596 = _594 + 1.0;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _598;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _602;
    bool _606 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _608 = _592 * _596;
    float _610 = -_592;
    float _612 = _610 + 1.0;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _614;
    float _618 = _562 * _580;
    float _620 = in.m_57.x;
    float _622 = in.m_57.y;
    float _624 = in.m_57.z;
    float _626 = fma(_600, _618, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _628 = fma(_616, _618, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _630 = fma(_604, _618, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _632 = _626 * _608;
    float _634 = _628 * _608;
    float _636 = _630 * _608;
    float _638 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[143].x, _632);
    float _640 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[143].y, _634);
    float _642 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[143].z, _636);
    float _644 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[144].x, _638);
    float _646 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[144].y, _640);
    float _648 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[144].z, _642);
    float _650 = _644 * _620;
    float _652 = _646 * _622;
    float _654 = _648 * _624;
    bool _656 = !_606;
    float _672;
    if (!_656)
    {
        float _658 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _660 = _190 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _662 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _664 = _662 * _658;
        float _666 = floor(_664);
        float _668 = -_666;
        float _670 = _664 + _668;
        _672 = _670;
        _674 = true;
    }
    else
    {
        float _676 = float(_100);
        float _678 = 1.0 / _676;
        float _680 = _134 * _678;
        _672 = _680;
    }
    _674 = false;
    float _682 = _672;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _686 = _682 + _684;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _690 = _688 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _692 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _694 = isnan(_682);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _700 = _696 || _698;
    float _702 = float(_700);
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _708 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _710 = isnan(_682);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _720;
    bool _724 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _726 = isnan(_682);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = 1.0 / _690;
    float _738 = -_702;
    float _740 = _738 + 1.0;
    bool _742 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _744 = _718 * _740;
    float _746 = -_718;
    float _748 = _746 + 1.0;
    float _750 = 1.0 / _706;
    float _752 = _722 * _736;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _758 = fma(_752, _686, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _762 = _756 * _750;
    float _764 = _758 * _744;
    float _766 = -_734;
    float _768 = _766 + 1.0;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _772 = _682 + _770;
    float _774 = _760 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _776 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[115].x, _764);
    float _778 = _702 * _768;
    float _780 = fma(_762, _772, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _782 = fma(_780, _778, _776);
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _788 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[117].x, _782);
    float _790 = _784 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _792 = _786 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _794 = _788 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _774;
    out.m_59.y = _790;
    out.m_59.z = _792;
    out.m_59.w = _794;
    bool _796 = !_742;
    float _812;
    if (!_796)
    {
        float _798 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _800 = _190 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _802 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[11].w, _134);
        float _804 = _802 * _798;
        float _806 = floor(_804);
        float _808 = -_806;
        float _810 = _804 + _808;
        _812 = _810;
        _814 = true;
    }
    else
    {
        float _816 = float(_100);
        float _818 = 1.0 / _816;
        float _820 = _134 * _818;
        _812 = _820;
    }
    _814 = false;
    float _822 = _812;
    float _824 = in.m_55.y;
    float _826 = _190 * 2.0;
    float _828 = _530 * _652;
    float _830 = in.m_55.z;
    float _832 = _530 * _654;
    float _834 = floor(_826);
    int _836 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _838 = _836 != 0;
    int _840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _842 = _840 != 0;
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _846 = _844 != 0;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _852 = _850 != 0;
    float _854 = _190 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _856 = _530 * _650;
    float _858 = -_848;
    float _860 = fma(_854, 2.0, _858);
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _864 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _866 = log2(_864);
    float _868 = _828 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _870 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _872 = _832 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _874 = _824 * 2.0;
    float _876 = _824 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _878 = _834 > 0.0;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _882 = _824 + _830;
    float _884 = _830 * 2.0;
    float _886 = floor(_874);
    float _888 = fma(_876, -2.0, _862);
    float _890 = _882 + (-1.0);
    bool _892 = _834 >= 0.0;
    bool _894 = isnan(_834);
    bool _896 = _892 || _894;
    bool _898 = isnan(0.0);
    bool _900 = _896 || _898;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _904 = _876;
    float _906 = _834;
    float _908 = _890;
    if (!_852)
    {
        _904 = _824;
    }
    float _910 = _904;
    float _912 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _914 = floor(_884);
    float _916 = _910;
    if (!_852)
    {
        _906 = _830;
    }
    float _918 = _906;
    float _920 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _888);
    float _922 = _918;
    if (!_852)
    {
        _908 = _830;
    }
    float _924 = _908;
    float _926 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _928 = _924;
    if (_852)
    {
        _916 = _190;
    }
    float _930 = _916;
    float _932 = _824 + (-0.5);
    if (_852)
    {
        _922 = _824;
    }
    float _934 = _922;
    float _936 = _856 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (_852)
    {
        _928 = _824;
    }
    float _938 = _928;
    float _940 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[83].z, _870);
    bool _942 = _886 > 0.0;
    bool _944 = _886 >= 0.0;
    bool _946 = isnan(_886);
    bool _948 = _944 || _946;
    bool _950 = isnan(0.0);
    bool _952 = _948 || _950;
    float _954 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[83].w, _926);
    int _956 = _900 ? 0 : 1;
    float _958 = _930 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _960 = !_842;
    int _962 = _960 ? 0 : 1;
    float _964 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _954);
    int _966 = ~_956;
    int _968 = _966 + 1;
    int _970 = _968 + 1;
    float _972 = -_880;
    float _974 = fma(_958, 2.0, _972);
    int _976 = _952 ? 0 : 1;
    float _978 = _934 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _980 = abs(_962);
    int _982 = _970;
    if (!_878)
    {
        int _984 = ~_956;
        int _986 = _984 + 1;
        _982 = _986;
    }
    int _988 = _982;
    float _990 = fma(_978, -2.0, _902);
    bool _992 = _914 > 0.0;
    bool _994 = _914 >= 0.0;
    bool _996 = isnan(_914);
    bool _998 = _994 || _996;
    bool _1000 = isnan(0.0);
    bool _1002 = _998 || _1000;
    int _1004 = ~_976;
    int _1006 = _1004 + 1;
    int _1008 = _1006 + 1;
    float _1010 = float(_980);
    float _1012 = float(_988);
    int _1014 = _1008;
    if (!_942)
    {
        int _1016 = ~_976;
        int _1018 = _1016 + 1;
        _1014 = _1018;
    }
    int _1020 = _1014;
    float _1022 = _866 * _134;
    int _1024 = _1002 ? 0 : 1;
    float _1026 = _1010 * _1012;
    float _1028 = in.m_61.x;
    float _1030 = in.m_61.y;
    float _1032 = in.m_61.z;
    int _1034 = ~_1024;
    int _1036 = _1034 + 1;
    int _1038 = _1036 + 1;
    float _1040 = exp2(_1022);
    int _1042 = _1038;
    if (!_992)
    {
        int _1044 = ~_1024;
        int _1046 = _1044 + 1;
        _1042 = _1046;
    }
    int _1048 = _1042;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1052 = 1.0 + _1050;
    float _1054 = _1026 * (-2.0);
    bool _1056 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1058 = isnan(1.0);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1064 = _1060 || _1062;
    float _1066 = 1.0 / _1052;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1070 = !_838;
    int _1072 = _1070 ? 0 : 1;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1076 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1078 = isnan(0.0);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1084 = _1080 || _1082;
    float _1086 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1068);
    int _1088 = abs(_1072);
    float _1090 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1074);
    float _1092 = -_1040;
    float _1094 = _1092 + 1.0;
    float _1096 = -_134;
    float _1098 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[76].x, _860);
    float _1100 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _940);
    bool _1102 = !_846;
    int _1104 = _1102 ? 0 : 1;
    float _1106 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1086);
    float _1108 = _1084 ? _1094 : 0.0;
    float _1110 = fma(_1054, _1030, _1030);
    float _1112 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1090);
    float _1114 = float(_1088);
    float _1116 = -_134;
    float _1118 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[81].x, _974);
    float _1120 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _990);
    float _1122 = float(_1048);
    if (_1064)
    {
        float _1124 = _1108 * _1066;
        _138 = _1124;
    }
    float _1126 = _138;
    float _1128 = fma(_912, _1054, _912);
    float _1130 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1110);
    int _1132 = abs(_1104);
    float _1134 = _190 + _824;
    float _1136 = _1114 * _1122;
    float _1138 = fma(_1128, _1126, _1130);
    float _1140 = _1134 + (-1.0);
    float _1142 = float(_1132);
    float _1144 = _1136 * (-2.0);
    float _1146 = float(_1020);
    float _1148 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1150 = _190 + (-0.5);
    float _1152 = _1138 * 0.15915493667125701904296875;
    float _1154 = _524 * _186;
    float _1156 = _1142 * _1146;
    float _1158 = fma(_1144, _1028, _1028);
    float _1160 = _190 + _830;
    float _1162 = fma(_1148, _1144, _1148);
    float _1164 = _1156 * (-2.0);
    float _1166 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1158);
    float _1168 = _1160 + (-1.0);
    float _1170 = _830 + (-0.5);
    float _1172 = fma(_1162, _1126, _1166);
    float _1174 = fma(_1164, _1032, _1032);
    float _1176 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1178 = _1152 * 6.283185482025146484375;
    float _1180 = sin(_1178);
    float _1182 = in.m_63.x;
    float _1184 = in.m_63.y;
    float _1186 = in.m_63.z;
    float _1188 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1174);
    float _1190 = fma(_1176, _1164, _1176);
    float _1192 = _1172 * 0.15915493667125701904296875;
    float _1194 = fma(_522, _184, _1154);
    float _1196 = fma(_1190, _1126, _1188);
    float _1198 = _1152 * 6.283185482025146484375;
    float _1200 = cos(_1198);
    float _1202 = fma(_526, _188, _1194);
    float _1204 = _1196 * 0.15915493667125701904296875;
    float _1206 = _524 * _168;
    float _1208 = _524 * _158;
    float _1210 = _1192 * 6.283185482025146484375;
    float _1212 = sin(_1210);
    float _1214 = fma(_522, _166, _1206);
    float _1216 = fma(_522, _156, _1208);
    float _1218 = fma(_526, _160, _1216);
    float _1220 = _1192 * 6.283185482025146484375;
    float _1222 = cos(_1220);
    float _1224 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1184);
    float _1226 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1186);
    float _1228 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1182);
    float _1230 = _868 * _1224;
    float _1232 = _872 * _1226;
    float _1234 = in.m_53.w;
    float _1236 = _1204 * 6.283185482025146484375;
    float _1238 = cos(_1236);
    float _1240 = _1212 * _1180;
    float _1242 = _936 * _1228;
    float _1244 = in.m_51.w;
    float _1246 = _1212 * _1200;
    float _1248 = _1204 * 6.283185482025146484375;
    float _1250 = sin(_1248);
    float _1252 = _1222 * _1200;
    float _1254 = _1222 * _1180;
    float _1256 = _1222 * _1238;
    float _1258 = _1212 * _1238;
    float _1260 = _1200 * _1238;
    float _1262 = _1180 * _1238;
    float _1264 = _1256 * _1230;
    float _1266 = _1258 * _1230;
    float _1268 = fma(_1250, _1252, _1240);
    float _1270 = -_1230;
    float _1272 = _1250 * _1270;
    float _1274 = -_1246;
    float _1276 = fma(_1250, _1254, _1274);
    float _1278 = -_1254;
    float _1280 = fma(_1250, _1246, _1278);
    float _1282 = fma(_1268, _1242, _1264);
    float _1284 = fma(_1260, _1242, _1272);
    float _1286 = fma(_1250, _1240, _1252);
    float _1288 = fma(_1276, _1232, _1282);
    float _1290 = fma(_1280, _1242, _1266);
    float _1292 = fma(_1262, _1232, _1284);
    float _1294 = _1288 * _412;
    float _1296 = fma(_1286, _1232, _1290);
    float _1298 = _1288 * _404;
    float _1300 = _1288 * _408;
    float _1302 = fma(_1292, _400, _1294);
    float _1304 = fma(_526, _170, _1214);
    float _1306 = _1202 + _1234;
    float _1308 = fma(_1292, _386, _1298);
    float _1310 = fma(_1296, _440, _1302);
    float _1312 = _1304 + _1244;
    float _1314 = fma(_1292, _396, _1300);
    float _1316 = fma(_1296, _450, _1308);
    float _1318 = _1306 + _1310;
    float _1320 = fma(_1296, _428, _1314);
    float _1322 = _1312 + _1316;
    float _1324 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1326 = _1318 + _1324;
    float _1328 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1330 = _1322 + _1328;
    float _1332 = _1326 * _1326;
    float _1334 = fma(_1330, _1330, _1332);
    float _1336 = in.m_49.w;
    float _1338 = sqrt(_1334);
    bool _1340 = _1338 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1342 = _1218 + _1336;
    float _1344 = _1342 + _1320;
    float _1346 = _1336;
    float _1348 = _1338;
    float _1350 = _1334;
    float _1352 = _1266;
    int _1354 = as_type<int>(_1186);
    if (!_1340)
    {
        _212 = _1322;
    }
    float _1356 = _212;
    float _1358 = _1356;
    if (!_1340)
    {
        _1346 = _1318;
    }
    float _1360 = _1346;
    float _1362 = _1360;
    if (!_1340)
    {
        _214 = _1344;
    }
    float _1364 = _214;
    bool _1366 = !_1340;
    float _1368 = _1364;
    if (!_1366)
    {
        float _1370 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1372 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1374 = _1338 + _1372;
        float _1376 = _1344 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1378 = rsqrt(_1334);
        float _1380 = _1374 * _1370;
        float _1382 = _1380 * 0.15915493667125701904296875;
        float _1384 = _1382 * 6.283185482025146484375;
        float _1386 = sin(_1384);
        float _1388 = _1382 * 6.283185482025146484375;
        float _1390 = cos(_1388);
        float _1392 = fma(_1386, _1376, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1394 = _1378 * _1392;
        float _1396 = _1390 + (-1.0);
        float _1398 = fma(_1330, _1394, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1400 = fma(_1326, _1394, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1402 = _1396 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1404 = fma(_1344, _1390, _1402);
        _1368 = _1404;
        _1358 = _1398;
        _1362 = _1400;
        _1348 = _1374;
    }
    float _1406 = _1368;
    float _1408 = _1358;
    float _1410 = _1362;
    float _1412 = _1348;
    float _1414 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1416 = _1406 + _1414;
    float _1418 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1420 = _1408 + _1418;
    float _1422 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1424 = _1410 + _1422;
    float _1426 = _1416 * _1416;
    float _1428 = fma(_1420, _1420, _1426);
    float _1430 = fma(_1424, _1424, _1428);
    float _1432 = rsqrt(_1430);
    float _1434 = sqrt(_1430);
    float _1436 = _1432 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1438 = _1420 * _1436;
    float _1440 = _1424 * _1436;
    float _1442 = _1438 * _1438;
    float _1444 = _1440 * _1440;
    float _1446 = _1442 + _1444;
    float _1448 = sqrt(_1446);
    bool _1450 = _1448 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1452 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1454 = _1448 + _1452;
    float _1456 = _1412;
    float _1458 = _1454;
    float _1460 = _1438;
    float _1462 = _1440;
    float _1464 = _1442;
    float _1466 = _1444;
    if (_1450)
    {
        float _1468 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1456 = _1468;
    }
    float _1470 = _1456;
    if (_1450)
    {
        float _1472 = _1454 * _1470;
        _1458 = _1472;
    }
    float _1474 = _1458;
    if (_1450)
    {
        float _1476 = _1474 * 0.15915493667125701904296875;
        _1350 = _1476;
    }
    float _1478 = _1350;
    float _1480 = _1318;
    if (_1450)
    {
        float _1482 = _1478 * 6.283185482025146484375;
        float _1484 = sin(_1482);
        _1480 = _1484;
    }
    float _1486 = _1480;
    float _1488 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1490 = precise::max(0.0, _1488);
    float _1492 = _1292;
    float _1494 = _1490;
    if (_1450)
    {
        float _1496 = _1478 * 6.283185482025146484375;
        float _1498 = cos(_1496);
        _1492 = _1498;
    }
    float _1500 = _1492;
    float _1502 = -_1436;
    float _1504 = -_1490;
    float _1506 = fma(_1416, _1502, _1504);
    float _1508 = _1488;
    if (_1450)
    {
        float _1510 = rsqrt(_1446);
        _1508 = _1510;
    }
    float _1512 = _1508;
    if (_1450)
    {
        float _1514 = _1506 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1494 = _1514;
    }
    float _1516 = _1494;
    float _1518 = _1516;
    float _1520 = _1486;
    if (_1450)
    {
        float _1522 = fma(_1486, _1516, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1352 = _1522;
    }
    float _1524 = _1352;
    float _1526 = _1524;
    if (_1450)
    {
        float _1528 = _1500 + (-1.0);
        _1518 = _1528;
    }
    float _1530 = _1518;
    if (_1450)
    {
        float _1532 = _1530 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1520 = _1532;
    }
    float _1534 = _1520;
    float _1536 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1538 = _1512;
    if (_1450)
    {
        float _1540 = _1512 * _1524;
        _1526 = _1540;
    }
    float _1542 = _1526;
    if (!_1450)
    {
        _1538 = _1506;
    }
    float _1544 = _1538;
    float _1546 = _1544;
    if (_1450)
    {
        float _1548 = fma(_1506, _1500, _1534);
        _1546 = _1548;
    }
    float _1550 = _1546;
    if (_1450)
    {
        float _1552 = _1438 * _1542;
        _1460 = _1552;
    }
    float _1554 = _1460;
    if (_1450)
    {
        float _1556 = _1440 * _1542;
        _1462 = _1556;
    }
    float _1558 = _1462;
    float _1560 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1536);
    float _1562 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1450)
    {
        float _1564 = _1554 * _1554;
        _1464 = _1564;
    }
    float _1566 = _1464;
    if (_1450)
    {
        float _1568 = _1558 * _1558;
        _1466 = _1568;
    }
    float _1570 = _1466;
    float _1572 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1560);
    float _1574 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1576 = fma(_1550, _1550, _1566);
    float _1578 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1562);
    float _1580 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1582 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1574);
    float _1584 = _1576 + _1570;
    float _1586 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1588 = fma(_1434, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1586);
    float _1590 = precise::clamp(_1588, 0.0, 1.0);
    float _1592 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1578);
    float _1594 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1580);
    float _1596 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1582);
    float _1598 = -_1590;
    float _1600 = _1598 + 1.0;
    float _1602 = rsqrt(_1584);
    float _1604 = _1592 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1606 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1608 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1594);
    float _1610 = _1596 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1612 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1614 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1616 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1618 = abs(_1600);
    float _1620 = log2(_1618);
    float _1622 = _1608 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1624 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1612);
    float _1626 = -_1616;
    float _1628 = fma(_1626, _1614, 1.0);
    float _1630 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1632 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1624);
    float _1634 = _1602 * _1554;
    float _1636 = _1602 * _1550;
    float _1638 = _1602 * _1558;
    float _1640 = log2(_1628);
    float _1642 = _1634 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1644 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1632);
    float _1646 = -_1642;
    float _1648 = fma(_1636, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1646);
    float _1650 = _1620 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1652 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1654 = -_1638;
    float _1656 = fma(_1654, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1648);
    float _1658 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1630);
    float _1660 = 1.0 / _1644;
    float _1662 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1652);
    float _1664 = fma(_1656, -0.5, 0.5);
    float _1666 = fma(_1656, 0.5, 0.5);
    float _1668 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1658);
    float _1670 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1662);
    float _1672 = _1636 + 1.0;
    float _1674 = fma(_1666, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1676 = exp2(_1650);
    float _1678 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1670);
    float _1680 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1668);
    float _1682 = fma(_1666, _1674, -0.212114393711090087890625);
    float _1684 = _1640 * 0.693147182464599609375;
    float _1686 = fma(_1666, _1682, 1.570728778839111328125);
    float _1688 = sqrt(_1664);
    float _1690 = _1684 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1692 = -_1636;
    float _1694 = fma(_1676, _1672, _1692);
    float _1696 = _1678 * _1660;
    float _1698 = _1680 * _1660;
    float _1700 = fma(_1694, 0.5, 0.5);
    float _1702 = fma(_1698, -0.5, 0.5);
    float _1704 = _1688 * 0.636619746685028076171875;
    float _1706 = fma(_1696, 0.5, 0.5);
    float _1708 = -_1686;
    float _1710 = fma(_1704, _1708, 1.0);
    float3 _4669 = float3(_1706, _1702, _1690);
    float _1712 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4669, float3(0.0), isnan(_4669)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4669, float3(0.0), isnan(_4669)), level(0.0)).x;
    float3 _4680 = float3(_1706, _1702, _1690);
    float4 _1715 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4680, float3(0.0), isnan(_4680)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4680, float3(0.0), isnan(_4680)), level(0.0)).xyzw;
    float _1717 = _1715.x;
    float _1719 = _1715.y;
    float _1721 = _1715.z;
    float _1723 = _1715.w;
    float2 _4697 = float2(_1710, _1700);
    float3 _1727 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4697, float2(0.0), isnan(_4697)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4697, float2(0.0), isnan(_4697)), level(0.0)).xyz;
    float _1729 = _1727.x;
    float _1731 = _1727.y;
    float _1733 = _1727.z;
    float _1735 = in.m_55.w;
    float _1737 = _1620 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1739 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1741 = isnan(0.5);
    bool _1743 = _1739 || _1741;
    bool _1745 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1747 = _1743 || _1745;
    float _1749 = in.m_65.y;
    float _1751 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1753 = _1751 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1755 = in.m_65.x;
    float _1757 = 1.0 / _1753;
    bool _1759 = _1184 != 0.0;
    bool _1761 = isnan(_1184);
    bool _1763 = _1759 || _1761;
    bool _1765 = isnan(0.0);
    bool _1767 = _1763 || _1765;
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    int _1769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1771 = _1769 != 0;
    int _1773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1775 = _1773 != 0;
    out.m_69.x = _1420;
    out.m_69.y = _1416;
    out.m_69.z = _1424;
    int _1777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1779 = _1777 != 0;
    float _1781 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1785 = _1783 != 0;
    bool _1787 = _1182 == 0.0;
    bool _1789 = !_1767;
    bool _1791 = _1787 && _1789;
    bool _1793 = _1735 > 0.5;
    float _1795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1797 = in.m_71.x;
    float _1799 = in.m_71.y;
    float _1801 = in.m_71.z;
    float _1803 = -_1749;
    float _1805 = _1803 + 1.0;
    float _1807 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1809 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1807;
    bool _1811 = _1186 == 0.0;
    bool _1813 = _1811 && _1791;
    int _1815 = _1793 ? as_type<int>(_1805) : as_type<int>(_1749);
    float _1817 = _1781 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1819 = _824 > 0.5;
    float _1821 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1823 = _822 + _1821;
    float _1825 = _1785 ? as_type<float>(_1815) : _1749;
    float _1827 = exp2(_1737);
    bool _1829 = _1785;
    float _1831 = _1749;
    float _1833 = _1809;
    bool _1835 = _1775;
    int _1837 = as_type<int>(_1823);
    if (_1771)
    {
        bool _1839 = _190 > 0.5;
        _1829 = _1839;
    }
    bool _1841 = _1829;
    float _1843 = _1809 * _1757;
    float _1845 = _1843;
    if (_1775)
    {
        float _1847 = _1819 ? _1805 : _1749;
        _1831 = _1847;
    }
    float _1849 = _1831;
    float _1851 = _1795 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (!_1771)
    {
        _1833 = _1755;
    }
    float _1853 = _1833;
    bool _1855 = _822 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1857 = isnan(_822);
    bool _1859 = _1855 || _1857;
    bool _1861 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1863 = _1859 || _1861;
    float _1865 = float(_1863);
    float _1867 = fma(_1825, _1851, -0.5);
    float _1869 = _1853;
    float _1871 = _1865;
    if (_1779)
    {
        bool _1873 = _830 > 0.5;
        _1835 = _1873;
    }
    bool _1875 = _1835;
    float _1877 = fma(_1843, _1823, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (!_1771)
    {
        _1845 = _1853;
    }
    float _1879 = _1845;
    float _1881 = fma(_1817, _1849, -0.5);
    float _1883 = _1879;
    if (_1771)
    {
        _1869 = _1755;
    }
    float _1885 = _1869;
    float _1887 = -_1865;
    float _1889 = _1887 + 1.0;
    bool _1891 = _822 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1893 = isnan(_822);
    bool _1895 = _1891 || _1893;
    bool _1897 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1899 = _1895 || _1897;
    float _1901 = float(_1899);
    float _1903 = _1799;
    float _1905 = _1797;
    float _1907 = _1801;
    float _1909 = _1885;
    if (!_1813)
    {
        float _1911 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1799);
        _1903 = _1911;
    }
    float _1913 = _1903;
    float _1915 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (!_1813)
    {
        float _1917 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1797);
        _1905 = _1917;
    }
    float _1919 = _1905;
    if (!_1813)
    {
        float _1921 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1801);
        _1907 = _1921;
    }
    float _1923 = _1907;
    float _1925 = _1901 * _1889;
    float _1927 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1771)
    {
        float _1929 = -_1885;
        float _1931 = _1929 + 1.0;
        _1354 = as_type<int>(_1931);
    }
    int _1933 = _1354;
    float _1935 = _1256 * _1913;
    float _1937 = _1877 * _1925;
    float _1939 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1915);
    float _1941 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    if (_1771)
    {
        float _1943 = _1841 ? as_type<float>(_1933) : _1885;
        _1883 = _1943;
    }
    float _1945 = _1883;
    float _1947 = -_1913;
    float _1949 = _1250 * _1947;
    float _1951 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1939);
    float _1953 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1941);
    float _1955 = fma(_1268, _1919, _1935);
    float _1957 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1959 = _1951 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1961 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1953);
    float _1963 = -_1901;
    float _1965 = _1963 + 1.0;
    float _1967 = fma(_1260, _1919, _1949);
    float _1969 = _1927 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1971 = _1961 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1973 = fma(_1965, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1937);
    float _1975 = 1.0 / _1959;
    float _1977 = fma(_1969, _1945, -0.5);
    float _1979 = fma(_1276, _1923, _1955);
    float _1981 = fma(_1865, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1973);
    if (!_1747)
    {
        _1871 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1983 = _1871;
    float _1985 = fma(_1262, _1923, _1967);
    float _1987 = _1258 * _1913;
    float _1989 = _1983;
    float _1991 = _1985;
    if (_1779)
    {
        float _1993 = -_1885;
        float _1995 = _1993 + 1.0;
        _1837 = as_type<int>(_1995);
    }
    int _1997 = _1837;
    float _1999 = fma(_1106, _1977, _1098);
    float _2001 = _1971 + _1959;
    float _2003 = fma(_1280, _1919, _1987);
    float _2005 = _1979 * _408;
    if (_1779)
    {
        float _2007 = _1875 ? as_type<float>(_1997) : _1885;
        _1909 = _2007;
    }
    float _2009 = _1909;
    float _2011 = -_1120;
    float _2013 = fma(_964, _1867, _2011);
    float _2015 = fma(_1286, _1923, _2003);
    float _2017 = _1957 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2019 = _2001 * _1975;
    float _2021 = _2019 * 0.5;
    float _2023 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2025 = fma(_1985, _396, _2005);
    float _2027 = fma(_2017, _2009, -0.5);
    float _2029 = _2023;
    float _2031 = _2025;
    if (!_1747)
    {
        float _2033 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2035 = fma(_2021, _1983, _2033);
        _1989 = _2035;
    }
    float _2037 = _1989;
    float _2039 = _1979 * _404;
    float _2041 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2023);
    float _2043 = _1979 * _412;
    float _2045 = fma(_1100, _2027, _1118);
    float _2047 = fma(_1985, _386, _2039);
    float _2049 = _2037;
    if (!_1747)
    {
        float _2051 = 1.0 / _2037;
        _2049 = _2051;
    }
    float _2053 = _2049;
    if (!_1747)
    {
        _392 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2055 = _392;
    float _2057 = fma(_1985, _400, _2043);
    float _2059 = fma(_2015, _450, _2047);
    float _2061 = -_1827;
    float _2063 = _2061 + 1.0;
    if (!_1747)
    {
        float _2065 = -_2055;
        float _2067 = _2065 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2029 = _2067;
    }
    float _2069 = _2029;
    float _2071 = fma(_2015, _428, _2025);
    float _2073 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2041);
    float _2075 = _450;
    if (!_1747)
    {
        float _2077 = 1.0 / _2069;
        _2075 = _2077;
    }
    float _2079 = _2075;
    if (_1747)
    {
        _2031 = 1.0;
    }
    float _2081 = _2031;
    float _2083 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2085 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2073);
    float _2087 = -_920;
    float _2089 = fma(_1112, _1881, _2087);
    float _2091 = _2013 + 0.5;
    float _2093 = _2081;
    if (!_1747)
    {
        float _2095 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2097 = -_2055;
        float _2099 = fma(_2053, _2095, _2097);
        _1991 = _2099;
    }
    float _2101 = _1991;
    float _2103 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2105 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2107 = fma(_2015, _440, _2057);
    float _2109 = _2089 + 0.5;
    float _2111 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2113 = _2103 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2115 = _2105 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2117 = _1981 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (!_1747)
    {
        float _2119 = _2101 * _2079;
        float _2121 = precise::clamp(_2119, 0.0, 1.0);
        _2093 = _2121;
    }
    float _2123 = _2093;
    float _2125 = _2111 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_73.x = _2059;
    out.m_73.y = _2071;
    out.m_73.z = _2107;
    float _2127 = _2085 + _1644;
    float _2129 = _2123 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2131 = _2123 > 0.0;
    bool _2133 = isnan(_2123);
    bool _2135 = _2131 || _2133;
    bool _2137 = isnan(0.0);
    bool _2139 = _2135 || _2137;
    out.m_75.x = _2113;
    out.m_75.y = _2115;
    out.m_75.z = _2125;
    out.m_75.w = _2117;
    float _2141 = _2127 * 0.5;
    float _2143 = _1999 + 0.5;
    float _2145 = _2045 + 0.5;
    float _2147 = _2129 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2149 = -_2083;
    float _2151 = _2149 + 1.0;
    out.m_77.x = _2143;
    out.m_77.y = _2109;
    out.m_77.z = _2145;
    out.m_77.w = _2091;
    out.gl_Position.x = _1678;
    out.gl_Position.y = _1680;
    out.gl_Position.z = _2085;
    out.gl_Position.w = _1644;
    out.m_79.z = _2141;
    out.m_79.w = _1644;
    out.m_45.x = _2147;
    float _2153 = _2083 * _1712;
    float _2155 = _1723 * _2151;
    float _2157 = _1723 * _2153;
    float _2159 = _1733 * _2153;
    float _2161 = fma(_1729, _2157, _1717);
    float _2163 = fma(_1731, _2157, _1719);
    float _2165 = fma(_1723, _2159, _1721);
    out.m_81.x = _2161;
    out.m_81.y = _2163;
    out.m_81.z = _2165;
    out.m_81.w = _2155;
    if (_2139)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2167 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2167;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _814 = false;
    bool _674 = false;
    bool _550 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_42.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    float _110 = _108;
    if (!_104)
    {
        out.m_45.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2224 = as_type<float>(_116);
        out.gl_Position.z = _2224;
    }
    if (!_104)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _120 = in.m_47.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _136 = 0.0;
    float _138 = _134;
    if (_130)
    {
        float _140 = float(_100);
        _136 = _140;
    }
    float _142 = _136;
    bool _144 = _134 >= _142;
    bool _146 = !_130;
    bool _148 = _144 || _146;
    if (_148)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _110;
    if (_148)
    {
        out.m_45.x = 0.0;
    }
    if (_148)
    {
        float _152 = _150 * 5.0;
        _118 = as_type<int>(_152);
    }
    int _154 = _118;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2293 = as_type<float>(_154);
        out.gl_Position.z = _2293;
    }
    if (_148)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _156 = in.m_49.x;
    float _158 = in.m_49.y;
    float _160 = in.m_49.z;
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _164 = _134 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _166 = in.m_51.x;
    float _168 = in.m_51.y;
    float _170 = in.m_51.z;
    float _172 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _174 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _176 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _178 = _174 || _176;
    bool _180 = isnan(1.0);
    bool _182 = _178 || _180;
    float _184 = in.m_53.x;
    float _186 = in.m_53.y;
    float _188 = in.m_53.z;
    float _190 = in.m_55.x;
    float _192 = _164 * _162;
    float _194 = 0.0;
    float _196 = _172;
    if (!_182)
    {
        float _198 = _172 * _172;
        float _200 = _198 * 0.5;
        _194 = _200;
    }
    float _202 = _194;
    float _204 = _156 * _156;
    float _206 = _158 * _158;
    float _208 = _160 * _160;
    float _210 = _202;
    float _212 = _158;
    float _214 = _160;
    if (!_182)
    {
        float _216 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _216;
    }
    float _218 = _210;
    float _220 = fma(_166, _166, _204);
    float _222 = fma(_168, _168, _206);
    float _224 = fma(_170, _170, _208);
    float _226 = fma(_184, _184, _220);
    float _228 = fma(_186, _186, _222);
    float _230 = fma(_188, _188, _224);
    float _232 = sqrt(_226);
    float _234 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[20].x, _192);
    float _236 = sqrt(_228);
    float _238 = sqrt(_230);
    bool _240 = _232 > 0.0;
    bool _242 = _236 > 0.0;
    float _244 = floor(_234);
    int _246 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _248 = _246 != 0;
    bool _250 = _238 > 0.0;
    float _252 = 0.0;
    float _254 = _232;
    float _256 = _218;
    if (_240)
    {
        float _258 = rsqrt(_226);
        _252 = _258;
    }
    float _260 = _252;
    if (!_240)
    {
        _254 = 0.0;
    }
    float _262 = _254;
    float _264 = 0.0;
    float _266 = _262;
    if (!_240)
    {
        _264 = 0.0;
    }
    float _268 = _264;
    float _270 = 0.0;
    float _272 = _268;
    if (_242)
    {
        float _274 = rsqrt(_228);
        _270 = _274;
    }
    float _276 = _270;
    float _278 = -_244;
    float _280 = _234 + _278;
    float _282 = _234 * 6.283185482025146484375;
    float _284 = _244;
    if (!_240)
    {
        _284 = 0.0;
    }
    float _286 = _284;
    float _288 = 0.0;
    float _290 = _286;
    if (_250)
    {
        float _292 = rsqrt(_230);
        _288 = _292;
    }
    float _294 = _288;
    bool _296 = !_182;
    float _298 = 0.0;
    if (!_296)
    {
        float _300 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _302 = log2(_300);
        float _304 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _306 = _304 + 1.0;
        float _308 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _310 = _172 * _302;
        float _312 = 1.0 / _306;
        float _314 = _308 * 0.693147182464599609375;
        float _316 = exp2(_310);
        float _318 = 1.0 / _314;
        float _320 = _316 + (-1.0);
        float _322 = -_320;
        float _324 = fma(_322, _318, _172);
        float _326 = _324 * _312;
        float _328 = _326 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _256 = _328;
        _298 = _318;
    }
    float _330 = _256;
    float _332 = _298;
    bool _334 = !_182;
    float _336 = _332;
    if (!_334)
    {
        float _338 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _340 = log2(_338);
        float _342 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _344 = _342 + 1.0;
        float _346 = 1.0 / _344;
        float _348 = _172 * _340;
        float _350 = exp2(_348);
        float _352 = -_350;
        float _354 = _352 + 1.0;
        float _356 = _354 * _346;
        _196 = _356;
    }
    float _358 = _196;
    float _360 = _282 * 0.15915493667125701904296875;
    float _362 = in.m_47.x;
    float _364 = in.m_47.y;
    float _366 = in.m_47.z;
    float _368 = 0.0;
    if (!_242)
    {
        _368 = 0.0;
        _336 = 0.0;
    }
    float _370 = _368;
    float _372 = _336;
    float _374 = 0.0;
    float _376 = _370;
    float _378 = _372;
    if (!_242)
    {
        _374 = 0.0;
    }
    float _380 = _374;
    float _382 = _380;
    if (_240)
    {
        float _384 = _260 * _166;
        _290 = _384;
    }
    float _386 = _290;
    float _388 = _360 * 6.283185482025146484375;
    float _390 = cos(_388);
    float _392 = _386;
    if (_240)
    {
        float _394 = _260 * _156;
        _266 = _394;
    }
    float _396 = _266;
    if (_240)
    {
        float _398 = _260 * _184;
        _272 = _398;
    }
    float _400 = _272;
    if (_242)
    {
        float _402 = _276 * _168;
        _376 = _402;
    }
    float _404 = _376;
    if (_242)
    {
        float _406 = _276 * _158;
        _378 = _406;
    }
    float _408 = _378;
    if (_242)
    {
        float _410 = _276 * _186;
        _382 = _410;
    }
    float _412 = _382;
    float _414 = 0.0;
    float _416 = 0.0;
    if (!_250)
    {
        _414 = 0.0;
        _416 = 0.0;
    }
    float _418 = _414;
    float _420 = _416;
    float _422 = _420;
    float _424 = _418;
    if (_250)
    {
        float _426 = _294 * _160;
        _422 = _426;
    }
    float _428 = _422;
    int _430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _432 = _430 != 0;
    int _434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _436 = _434 != 0;
    if (_250)
    {
        float _438 = _294 * _188;
        _424 = _438;
    }
    float _440 = _424;
    float _442 = 0.0;
    if (!_250)
    {
        _442 = 0.0;
    }
    float _444 = _442;
    float _446 = _444;
    if (_250)
    {
        float _448 = _294 * _170;
        _446 = _448;
    }
    float _450 = _446;
    bool _452 = _280 < 0.5;
    float _454 = float(_452);
    float _456 = -_280;
    float _458 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _460 = fma(_390, 0.5, 0.5);
    float _462 = in.m_57.w;
    bool _464 = !_432;
    int _466 = _464 ? 0 : 1;
    float _468 = _330 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _470 = -_454;
    float _472 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _474 = in.m_42.x;
    float _476 = in.m_42.y;
    float _478 = in.m_42.z;
    float _480 = -_460;
    float _482 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _484 = abs(_466);
    float _486 = fma(_358, _362, _468);
    bool _488 = !_436;
    int _490 = _488 ? 0 : 1;
    float _492 = _330 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _494 = !_248;
    int _496 = _494 ? 0 : 1;
    float _498 = _330 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _500 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _502 = fma(_358, _364, _492);
    int _504 = abs(_490);
    float _506 = fma(_358, _366, _498);
    int _508 = abs(_496);
    float _510 = float(_484);
    float _512 = float(_508);
    float _514 = abs(_458);
    float _516 = _510 * _514;
    float _518 = float(_504);
    float _520 = fma(_512, _482, _516);
    float _522 = fma(_486, _462, _474);
    float _524 = fma(_502, _462, _476);
    float _526 = fma(_506, _462, _478);
    float _528 = abs(_472);
    float _530 = fma(_518, _528, _520);
    bool _532 = !_500;
    float _548;
    if (!_532)
    {
        float _534 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _536 = _190 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _538 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _540 = _538 * _534;
        float _542 = floor(_540);
        float _544 = -_542;
        float _546 = _540 + _544;
        _548 = _546;
        _550 = true;
    }
    else
    {
        float _552 = float(_100);
        float _554 = 1.0 / _552;
        float _556 = _134 * _554;
        _548 = _556;
    }
    _550 = false;
    float _558 = _548;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _562 = _558 + _560;
    bool _564 = _558 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _566 = isnan(_558);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _576;
    float _580 = 1.0 / _578;
    bool _582 = _558 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _584 = isnan(_558);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = -_574;
    float _596 = _594 + 1.0;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _598;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _602;
    bool _606 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _608 = _592 * _596;
    float _610 = -_592;
    float _612 = _610 + 1.0;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _614;
    float _618 = _562 * _580;
    float _620 = in.m_57.x;
    float _622 = in.m_57.y;
    float _624 = in.m_57.z;
    float _626 = fma(_600, _618, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _628 = fma(_616, _618, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _630 = fma(_604, _618, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _632 = _626 * _608;
    float _634 = _628 * _608;
    float _636 = _630 * _608;
    float _638 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[143].x, _632);
    float _640 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[143].y, _634);
    float _642 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[143].z, _636);
    float _644 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[144].x, _638);
    float _646 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[144].y, _640);
    float _648 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[144].z, _642);
    float _650 = _644 * _620;
    float _652 = _646 * _622;
    float _654 = _648 * _624;
    bool _656 = !_606;
    float _672;
    if (!_656)
    {
        float _658 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _660 = _190 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _662 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _664 = _662 * _658;
        float _666 = floor(_664);
        float _668 = -_666;
        float _670 = _664 + _668;
        _672 = _670;
        _674 = true;
    }
    else
    {
        float _676 = float(_100);
        float _678 = 1.0 / _676;
        float _680 = _134 * _678;
        _672 = _680;
    }
    _674 = false;
    float _682 = _672;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _686 = _682 + _684;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _690 = _688 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _692 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _694 = isnan(_682);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _700 = _696 || _698;
    float _702 = float(_700);
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _708 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _710 = isnan(_682);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _720;
    bool _724 = _682 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _726 = isnan(_682);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = 1.0 / _690;
    float _738 = -_702;
    float _740 = _738 + 1.0;
    bool _742 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _744 = _718 * _740;
    float _746 = -_718;
    float _748 = _746 + 1.0;
    float _750 = 1.0 / _706;
    float _752 = _722 * _736;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _758 = fma(_752, _686, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _762 = _756 * _750;
    float _764 = _758 * _744;
    float _766 = -_734;
    float _768 = _766 + 1.0;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _772 = _682 + _770;
    float _774 = _760 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _776 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[115].x, _764);
    float _778 = _702 * _768;
    float _780 = fma(_762, _772, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _782 = fma(_780, _778, _776);
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _788 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[117].x, _782);
    float _790 = _784 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _792 = _786 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _794 = _788 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _774;
    out.m_59.y = _790;
    out.m_59.z = _792;
    out.m_59.w = _794;
    bool _796 = !_742;
    float _812;
    if (!_796)
    {
        float _798 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _800 = _190 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _802 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[11].w, _134);
        float _804 = _802 * _798;
        float _806 = floor(_804);
        float _808 = -_806;
        float _810 = _804 + _808;
        _812 = _810;
        _814 = true;
    }
    else
    {
        float _816 = float(_100);
        float _818 = 1.0 / _816;
        float _820 = _134 * _818;
        _812 = _820;
    }
    _814 = false;
    float _822 = _812;
    float _824 = in.m_55.y;
    float _826 = _190 * 2.0;
    float _828 = _530 * _652;
    float _830 = in.m_55.z;
    float _832 = _530 * _654;
    float _834 = floor(_826);
    int _836 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _838 = _836 != 0;
    int _840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _842 = _840 != 0;
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _846 = _844 != 0;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _852 = _850 != 0;
    float _854 = _190 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _856 = _530 * _650;
    float _858 = -_848;
    float _860 = fma(_854, 2.0, _858);
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _864 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _866 = log2(_864);
    float _868 = _828 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _870 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _872 = _832 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _874 = _824 * 2.0;
    float _876 = _824 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _878 = _834 > 0.0;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _882 = _824 + _830;
    float _884 = _830 * 2.0;
    float _886 = floor(_874);
    float _888 = fma(_876, -2.0, _862);
    float _890 = _882 + (-1.0);
    bool _892 = _834 >= 0.0;
    bool _894 = isnan(_834);
    bool _896 = _892 || _894;
    bool _898 = isnan(0.0);
    bool _900 = _896 || _898;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _904 = _876;
    float _906 = _834;
    float _908 = _890;
    if (!_852)
    {
        _904 = _824;
    }
    float _910 = _904;
    float _912 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _914 = floor(_884);
    float _916 = _910;
    if (!_852)
    {
        _906 = _830;
    }
    float _918 = _906;
    float _920 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _888);
    float _922 = _918;
    if (!_852)
    {
        _908 = _830;
    }
    float _924 = _908;
    float _926 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _928 = _924;
    if (_852)
    {
        _916 = _190;
    }
    float _930 = _916;
    float _932 = _824 + (-0.5);
    if (_852)
    {
        _922 = _824;
    }
    float _934 = _922;
    float _936 = _856 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    if (_852)
    {
        _928 = _824;
    }
    float _938 = _928;
    float _940 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[83].z, _870);
    bool _942 = _886 > 0.0;
    bool _944 = _886 >= 0.0;
    bool _946 = isnan(_886);
    bool _948 = _944 || _946;
    bool _950 = isnan(0.0);
    bool _952 = _948 || _950;
    float _954 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[83].w, _926);
    int _956 = _900 ? 0 : 1;
    float _958 = _930 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _960 = !_842;
    int _962 = _960 ? 0 : 1;
    float _964 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _954);
    int _966 = ~_956;
    int _968 = _966 + 1;
    int _970 = _968 + 1;
    float _972 = -_880;
    float _974 = fma(_958, 2.0, _972);
    int _976 = _952 ? 0 : 1;
    float _978 = _934 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _980 = abs(_962);
    int _982 = _970;
    if (!_878)
    {
        int _984 = ~_956;
        int _986 = _984 + 1;
        _982 = _986;
    }
    int _988 = _982;
    float _990 = fma(_978, -2.0, _902);
    bool _992 = _914 > 0.0;
    bool _994 = _914 >= 0.0;
    bool _996 = isnan(_914);
    bool _998 = _994 || _996;
    bool _1000 = isnan(0.0);
    bool _1002 = _998 || _1000;
    int _1004 = ~_976;
    int _1006 = _1004 + 1;
    int _1008 = _1006 + 1;
    float _1010 = float(_980);
    float _1012 = float(_988);
    int _1014 = _1008;
    if (!_942)
    {
        int _1016 = ~_976;
        int _1018 = _1016 + 1;
        _1014 = _1018;
    }
    int _1020 = _1014;
    float _1022 = _866 * _134;
    int _1024 = _1002 ? 0 : 1;
    float _1026 = _1010 * _1012;
    float _1028 = in.m_61.x;
    float _1030 = in.m_61.y;
    float _1032 = in.m_61.z;
    int _1034 = ~_1024;
    int _1036 = _1034 + 1;
    int _1038 = _1036 + 1;
    float _1040 = exp2(_1022);
    int _1042 = _1038;
    if (!_992)
    {
        int _1044 = ~_1024;
        int _1046 = _1044 + 1;
        _1042 = _1046;
    }
    int _1048 = _1042;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1052 = 1.0 + _1050;
    float _1054 = _1026 * (-2.0);
    bool _1056 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1058 = isnan(1.0);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1064 = _1060 || _1062;
    float _1066 = 1.0 / _1052;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1070 = !_838;
    int _1072 = _1070 ? 0 : 1;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1076 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1078 = isnan(0.0);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1084 = _1080 || _1082;
    float _1086 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1068);
    int _1088 = abs(_1072);
    float _1090 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1074);
    float _1092 = -_1040;
    float _1094 = _1092 + 1.0;
    float _1096 = -_134;
    float _1098 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[76].x, _860);
    float _1100 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _940);
    bool _1102 = !_846;
    int _1104 = _1102 ? 0 : 1;
    float _1106 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1086);
    float _1108 = _1084 ? _1094 : 0.0;
    float _1110 = fma(_1054, _1030, _1030);
    float _1112 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1090);
    float _1114 = float(_1088);
    float _1116 = -_134;
    float _1118 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[81].x, _974);
    float _1120 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _990);
    float _1122 = float(_1048);
    if (_1064)
    {
        float _1124 = _1108 * _1066;
        _138 = _1124;
    }
    float _1126 = _138;
    float _1128 = fma(_912, _1054, _912);
    float _1130 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1110);
    int _1132 = abs(_1104);
    float _1134 = _190 + _824;
    float _1136 = _1114 * _1122;
    float _1138 = fma(_1128, _1126, _1130);
    float _1140 = _1134 + (-1.0);
    float _1142 = float(_1132);
    float _1144 = _1136 * (-2.0);
    float _1146 = float(_1020);
    float _1148 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1150 = _190 + (-0.5);
    float _1152 = _1138 * 0.15915493667125701904296875;
    float _1154 = _524 * _186;
    float _1156 = _1142 * _1146;
    float _1158 = fma(_1144, _1028, _1028);
    float _1160 = _190 + _830;
    float _1162 = fma(_1148, _1144, _1148);
    float _1164 = _1156 * (-2.0);
    float _1166 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1158);
    float _1168 = _1160 + (-1.0);
    float _1170 = _830 + (-0.5);
    float _1172 = fma(_1162, _1126, _1166);
    float _1174 = fma(_1164, _1032, _1032);
    float _1176 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1178 = _1152 * 6.283185482025146484375;
    float _1180 = sin(_1178);
    float _1182 = in.m_63.x;
    float _1184 = in.m_63.y;
    float _1186 = in.m_63.z;
    float _1188 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1174);
    float _1190 = fma(_1176, _1164, _1176);
    float _1192 = _1172 * 0.15915493667125701904296875;
    float _1194 = fma(_522, _184, _1154);
    float _1196 = fma(_1190, _1126, _1188);
    float _1198 = _1152 * 6.283185482025146484375;
    float _1200 = cos(_1198);
    float _1202 = fma(_526, _188, _1194);
    float _1204 = _1196 * 0.15915493667125701904296875;
    float _1206 = _524 * _168;
    float _1208 = _524 * _158;
    float _1210 = _1192 * 6.283185482025146484375;
    float _1212 = sin(_1210);
    float _1214 = fma(_522, _166, _1206);
    float _1216 = fma(_522, _156, _1208);
    float _1218 = fma(_526, _160, _1216);
    float _1220 = _1192 * 6.283185482025146484375;
    float _1222 = cos(_1220);
    float _1224 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1184);
    float _1226 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1186);
    float _1228 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1182);
    float _1230 = _868 * _1224;
    float _1232 = _872 * _1226;
    float _1234 = in.m_53.w;
    float _1236 = _1204 * 6.283185482025146484375;
    float _1238 = cos(_1236);
    float _1240 = _1212 * _1180;
    float _1242 = _936 * _1228;
    float _1244 = in.m_51.w;
    float _1246 = _1212 * _1200;
    float _1248 = _1204 * 6.283185482025146484375;
    float _1250 = sin(_1248);
    float _1252 = _1222 * _1200;
    float _1254 = _1222 * _1180;
    float _1256 = _1222 * _1238;
    float _1258 = _1212 * _1238;
    float _1260 = _1200 * _1238;
    float _1262 = _1180 * _1238;
    float _1264 = _1256 * _1230;
    float _1266 = _1258 * _1230;
    float _1268 = fma(_1250, _1252, _1240);
    float _1270 = -_1230;
    float _1272 = _1250 * _1270;
    float _1274 = -_1246;
    float _1276 = fma(_1250, _1254, _1274);
    float _1278 = -_1254;
    float _1280 = fma(_1250, _1246, _1278);
    float _1282 = fma(_1268, _1242, _1264);
    float _1284 = fma(_1260, _1242, _1272);
    float _1286 = fma(_1250, _1240, _1252);
    float _1288 = fma(_1276, _1232, _1282);
    float _1290 = fma(_1280, _1242, _1266);
    float _1292 = fma(_1262, _1232, _1284);
    float _1294 = _1288 * _412;
    float _1296 = fma(_1286, _1232, _1290);
    float _1298 = _1288 * _404;
    float _1300 = _1288 * _408;
    float _1302 = fma(_1292, _400, _1294);
    float _1304 = fma(_526, _170, _1214);
    float _1306 = _1202 + _1234;
    float _1308 = fma(_1292, _386, _1298);
    float _1310 = fma(_1296, _440, _1302);
    float _1312 = _1304 + _1244;
    float _1314 = fma(_1292, _396, _1300);
    float _1316 = fma(_1296, _450, _1308);
    float _1318 = _1306 + _1310;
    float _1320 = fma(_1296, _428, _1314);
    float _1322 = _1312 + _1316;
    float _1324 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1326 = _1318 + _1324;
    float _1328 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1330 = _1322 + _1328;
    float _1332 = _1326 * _1326;
    float _1334 = fma(_1330, _1330, _1332);
    float _1336 = in.m_49.w;
    float _1338 = sqrt(_1334);
    bool _1340 = _1338 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1342 = _1218 + _1336;
    float _1344 = _1342 + _1320;
    float _1346 = _1336;
    float _1348 = _1338;
    float _1350 = _1334;
    float _1352 = _1266;
    int _1354 = as_type<int>(_1186);
    if (!_1340)
    {
        _212 = _1322;
    }
    float _1356 = _212;
    float _1358 = _1356;
    if (!_1340)
    {
        _1346 = _1318;
    }
    float _1360 = _1346;
    float _1362 = _1360;
    if (!_1340)
    {
        _214 = _1344;
    }
    float _1364 = _214;
    bool _1366 = !_1340;
    float _1368 = _1364;
    if (!_1366)
    {
        float _1370 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1372 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1374 = _1338 + _1372;
        float _1376 = _1344 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1378 = rsqrt(_1334);
        float _1380 = _1374 * _1370;
        float _1382 = _1380 * 0.15915493667125701904296875;
        float _1384 = _1382 * 6.283185482025146484375;
        float _1386 = sin(_1384);
        float _1388 = _1382 * 6.283185482025146484375;
        float _1390 = cos(_1388);
        float _1392 = fma(_1386, _1376, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1394 = _1378 * _1392;
        float _1396 = _1390 + (-1.0);
        float _1398 = fma(_1330, _1394, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1400 = fma(_1326, _1394, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1402 = _1396 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1404 = fma(_1344, _1390, _1402);
        _1368 = _1404;
        _1358 = _1398;
        _1362 = _1400;
        _1348 = _1374;
    }
    float _1406 = _1368;
    float _1408 = _1358;
    float _1410 = _1362;
    float _1412 = _1348;
    float _1414 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1416 = _1406 + _1414;
    float _1418 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1420 = _1408 + _1418;
    float _1422 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1424 = _1410 + _1422;
    float _1426 = _1416 * _1416;
    float _1428 = fma(_1420, _1420, _1426);
    float _1430 = fma(_1424, _1424, _1428);
    float _1432 = rsqrt(_1430);
    float _1434 = sqrt(_1430);
    float _1436 = _1432 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1438 = _1420 * _1436;
    float _1440 = _1424 * _1436;
    float _1442 = _1438 * _1438;
    float _1444 = _1440 * _1440;
    float _1446 = _1442 + _1444;
    float _1448 = sqrt(_1446);
    bool _1450 = _1448 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1452 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1454 = _1448 + _1452;
    float _1456 = _1412;
    float _1458 = _1454;
    float _1460 = _1438;
    float _1462 = _1440;
    float _1464 = _1442;
    float _1466 = _1444;
    if (_1450)
    {
        float _1468 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1456 = _1468;
    }
    float _1470 = _1456;
    if (_1450)
    {
        float _1472 = _1454 * _1470;
        _1458 = _1472;
    }
    float _1474 = _1458;
    if (_1450)
    {
        float _1476 = _1474 * 0.15915493667125701904296875;
        _1350 = _1476;
    }
    float _1478 = _1350;
    float _1480 = _1318;
    if (_1450)
    {
        float _1482 = _1478 * 6.283185482025146484375;
        float _1484 = sin(_1482);
        _1480 = _1484;
    }
    float _1486 = _1480;
    float _1488 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1490 = precise::max(0.0, _1488);
    float _1492 = _1292;
    float _1494 = _1490;
    if (_1450)
    {
        float _1496 = _1478 * 6.283185482025146484375;
        float _1498 = cos(_1496);
        _1492 = _1498;
    }
    float _1500 = _1492;
    float _1502 = -_1436;
    float _1504 = -_1490;
    float _1506 = fma(_1416, _1502, _1504);
    float _1508 = _1488;
    if (_1450)
    {
        float _1510 = rsqrt(_1446);
        _1508 = _1510;
    }
    float _1512 = _1508;
    if (_1450)
    {
        float _1514 = _1506 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1494 = _1514;
    }
    float _1516 = _1494;
    float _1518 = _1516;
    float _1520 = _1486;
    if (_1450)
    {
        float _1522 = fma(_1486, _1516, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1352 = _1522;
    }
    float _1524 = _1352;
    float _1526 = _1524;
    if (_1450)
    {
        float _1528 = _1500 + (-1.0);
        _1518 = _1528;
    }
    float _1530 = _1518;
    if (_1450)
    {
        float _1532 = _1530 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1520 = _1532;
    }
    float _1534 = _1520;
    float _1536 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1538 = _1512;
    if (_1450)
    {
        float _1540 = _1512 * _1524;
        _1526 = _1540;
    }
    float _1542 = _1526;
    if (!_1450)
    {
        _1538 = _1506;
    }
    float _1544 = _1538;
    float _1546 = _1544;
    if (_1450)
    {
        float _1548 = fma(_1506, _1500, _1534);
        _1546 = _1548;
    }
    float _1550 = _1546;
    if (_1450)
    {
        float _1552 = _1438 * _1542;
        _1460 = _1552;
    }
    float _1554 = _1460;
    if (_1450)
    {
        float _1556 = _1440 * _1542;
        _1462 = _1556;
    }
    float _1558 = _1462;
    float _1560 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1536);
    float _1562 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1450)
    {
        float _1564 = _1554 * _1554;
        _1464 = _1564;
    }
    float _1566 = _1464;
    if (_1450)
    {
        float _1568 = _1558 * _1558;
        _1466 = _1568;
    }
    float _1570 = _1466;
    float _1572 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1560);
    float _1574 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1576 = fma(_1550, _1550, _1566);
    float _1578 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1562);
    float _1580 = _1406 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1582 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1574);
    float _1584 = _1576 + _1570;
    float _1586 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1588 = fma(_1434, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1586);
    float _1590 = precise::clamp(_1588, 0.0, 1.0);
    float _1592 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1578);
    float _1594 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1580);
    float _1596 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1582);
    float _1598 = -_1590;
    float _1600 = _1598 + 1.0;
    float _1602 = rsqrt(_1584);
    float _1604 = _1592 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1606 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1608 = fma(_1410, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1594);
    float _1610 = _1596 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1612 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1614 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1616 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1618 = abs(_1600);
    float _1620 = log2(_1618);
    float _1622 = _1608 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1624 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1612);
    float _1626 = -_1616;
    float _1628 = fma(_1626, _1614, 1.0);
    float _1630 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1632 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1624);
    float _1634 = _1602 * _1554;
    float _1636 = _1602 * _1550;
    float _1638 = _1602 * _1558;
    float _1640 = log2(_1628);
    float _1642 = _1634 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1644 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1632);
    float _1646 = -_1642;
    float _1648 = fma(_1636, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1646);
    float _1650 = _1620 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1652 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1654 = -_1638;
    float _1656 = fma(_1654, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1648);
    float _1658 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1630);
    float _1660 = 1.0 / _1644;
    float _1662 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1652);
    float _1664 = fma(_1656, -0.5, 0.5);
    float _1666 = fma(_1656, 0.5, 0.5);
    float _1668 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1658);
    float _1670 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1662);
    float _1672 = _1636 + 1.0;
    float _1674 = fma(_1666, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1676 = exp2(_1650);
    float _1678 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1670);
    float _1680 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1668);
    float _1682 = fma(_1666, _1674, -0.212114393711090087890625);
    float _1684 = _1640 * 0.693147182464599609375;
    float _1686 = fma(_1666, _1682, 1.570728778839111328125);
    float _1688 = sqrt(_1664);
    float _1690 = _1684 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1692 = -_1636;
    float _1694 = fma(_1676, _1672, _1692);
    float _1696 = _1678 * _1660;
    float _1698 = _1680 * _1660;
    float _1700 = fma(_1694, 0.5, 0.5);
    float _1702 = fma(_1698, -0.5, 0.5);
    float _1704 = _1688 * 0.636619746685028076171875;
    float _1706 = fma(_1696, 0.5, 0.5);
    float _1708 = -_1686;
    float _1710 = fma(_1704, _1708, 1.0);
    float3 _4669 = float3(_1706, _1702, _1690);
    float _1712 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4669, float3(0.0), isnan(_4669)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4669, float3(0.0), isnan(_4669)), level(0.0)).x;
    float3 _4680 = float3(_1706, _1702, _1690);
    float4 _1715 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4680, float3(0.0), isnan(_4680)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4680, float3(0.0), isnan(_4680)), level(0.0)).xyzw;
    float _1717 = _1715.x;
    float _1719 = _1715.y;
    float _1721 = _1715.z;
    float _1723 = _1715.w;
    float2 _4697 = float2(_1710, _1700);
    float3 _1727 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4697, float2(0.0), isnan(_4697)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4697, float2(0.0), isnan(_4697)), level(0.0)).xyz;
    float _1729 = _1727.x;
    float _1731 = _1727.y;
    float _1733 = _1727.z;
    float _1735 = in.m_55.w;
    float _1737 = _1620 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1739 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1741 = isnan(0.5);
    bool _1743 = _1739 || _1741;
    bool _1745 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1747 = _1743 || _1745;
    float _1749 = in.m_65.y;
    float _1751 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1753 = _1751 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1755 = in.m_65.x;
    float _1757 = 1.0 / _1753;
    bool _1759 = _1184 != 0.0;
    bool _1761 = isnan(_1184);
    bool _1763 = _1759 || _1761;
    bool _1765 = isnan(0.0);
    bool _1767 = _1763 || _1765;
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    int _1769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1771 = _1769 != 0;
    int _1773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1775 = _1773 != 0;
    out.m_69.x = _1420;
    out.m_69.y = _1416;
    out.m_69.z = _1424;
    int _1777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1779 = _1777 != 0;
    float _1781 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1785 = _1783 != 0;
    bool _1787 = _1182 == 0.0;
    bool _1789 = !_1767;
    bool _1791 = _1787 && _1789;
    bool _1793 = _1735 > 0.5;
    float _1795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1797 = in.m_71.x;
    float _1799 = in.m_71.y;
    float _1801 = in.m_71.z;
    float _1803 = -_1749;
    float _1805 = _1803 + 1.0;
    float _1807 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1809 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1807;
    bool _1811 = _1186 == 0.0;
    bool _1813 = _1811 && _1791;
    int _1815 = _1793 ? as_type<int>(_1805) : as_type<int>(_1749);
    float _1817 = _1781 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1819 = _824 > 0.5;
    float _1821 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1823 = _822 + _1821;
    float _1825 = _1785 ? as_type<float>(_1815) : _1749;
    float _1827 = exp2(_1737);
    bool _1829 = _1785;
    float _1831 = _1749;
    float _1833 = _1809;
    bool _1835 = _1775;
    int _1837 = as_type<int>(_1823);
    if (_1771)
    {
        bool _1839 = _190 > 0.5;
        _1829 = _1839;
    }
    bool _1841 = _1829;
    float _1843 = _1809 * _1757;
    float _1845 = _1843;
    if (_1775)
    {
        float _1847 = _1819 ? _1805 : _1749;
        _1831 = _1847;
    }
    float _1849 = _1831;
    float _1851 = _1795 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (!_1771)
    {
        _1833 = _1755;
    }
    float _1853 = _1833;
    bool _1855 = _822 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1857 = isnan(_822);
    bool _1859 = _1855 || _1857;
    bool _1861 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1863 = _1859 || _1861;
    float _1865 = float(_1863);
    float _1867 = fma(_1825, _1851, -0.5);
    float _1869 = _1853;
    float _1871 = _1865;
    if (_1779)
    {
        bool _1873 = _830 > 0.5;
        _1835 = _1873;
    }
    bool _1875 = _1835;
    float _1877 = fma(_1843, _1823, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (!_1771)
    {
        _1845 = _1853;
    }
    float _1879 = _1845;
    float _1881 = fma(_1817, _1849, -0.5);
    float _1883 = _1879;
    if (_1771)
    {
        _1869 = _1755;
    }
    float _1885 = _1869;
    float _1887 = -_1865;
    float _1889 = _1887 + 1.0;
    bool _1891 = _822 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1893 = isnan(_822);
    bool _1895 = _1891 || _1893;
    bool _1897 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1899 = _1895 || _1897;
    float _1901 = float(_1899);
    float _1903 = _1799;
    float _1905 = _1797;
    float _1907 = _1801;
    float _1909 = _1885;
    if (!_1813)
    {
        float _1911 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1799);
        _1903 = _1911;
    }
    float _1913 = _1903;
    float _1915 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (!_1813)
    {
        float _1917 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1797);
        _1905 = _1917;
    }
    float _1919 = _1905;
    if (!_1813)
    {
        float _1921 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1801);
        _1907 = _1921;
    }
    float _1923 = _1907;
    float _1925 = _1901 * _1889;
    float _1927 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1771)
    {
        float _1929 = -_1885;
        float _1931 = _1929 + 1.0;
        _1354 = as_type<int>(_1931);
    }
    int _1933 = _1354;
    float _1935 = _1256 * _1913;
    float _1937 = _1877 * _1925;
    float _1939 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1915);
    float _1941 = _1342 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    if (_1771)
    {
        float _1943 = _1841 ? as_type<float>(_1933) : _1885;
        _1883 = _1943;
    }
    float _1945 = _1883;
    float _1947 = -_1913;
    float _1949 = _1250 * _1947;
    float _1951 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1939);
    float _1953 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1941);
    float _1955 = fma(_1268, _1919, _1935);
    float _1957 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1959 = _1951 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1961 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1953);
    float _1963 = -_1901;
    float _1965 = _1963 + 1.0;
    float _1967 = fma(_1260, _1919, _1949);
    float _1969 = _1927 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1971 = _1961 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1973 = fma(_1965, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1937);
    float _1975 = 1.0 / _1959;
    float _1977 = fma(_1969, _1945, -0.5);
    float _1979 = fma(_1276, _1923, _1955);
    float _1981 = fma(_1865, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1973);
    if (!_1747)
    {
        _1871 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1983 = _1871;
    float _1985 = fma(_1262, _1923, _1967);
    float _1987 = _1258 * _1913;
    float _1989 = _1983;
    float _1991 = _1985;
    if (_1779)
    {
        float _1993 = -_1885;
        float _1995 = _1993 + 1.0;
        _1837 = as_type<int>(_1995);
    }
    int _1997 = _1837;
    float _1999 = fma(_1106, _1977, _1098);
    float _2001 = _1971 + _1959;
    float _2003 = fma(_1280, _1919, _1987);
    float _2005 = _1979 * _408;
    if (_1779)
    {
        float _2007 = _1875 ? as_type<float>(_1997) : _1885;
        _1909 = _2007;
    }
    float _2009 = _1909;
    float _2011 = -_1120;
    float _2013 = fma(_964, _1867, _2011);
    float _2015 = fma(_1286, _1923, _2003);
    float _2017 = _1957 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2019 = _2001 * _1975;
    float _2021 = _2019 * 0.5;
    float _2023 = _1604 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2025 = fma(_1985, _396, _2005);
    float _2027 = fma(_2017, _2009, -0.5);
    float _2029 = _2023;
    float _2031 = _2025;
    if (!_1747)
    {
        float _2033 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2035 = fma(_2021, _1983, _2033);
        _1989 = _2035;
    }
    float _2037 = _1989;
    float _2039 = _1979 * _404;
    float _2041 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2023);
    float _2043 = _1979 * _412;
    float _2045 = fma(_1100, _2027, _1118);
    float _2047 = fma(_1985, _386, _2039);
    float _2049 = _2037;
    if (!_1747)
    {
        float _2051 = 1.0 / _2037;
        _2049 = _2051;
    }
    float _2053 = _2049;
    if (!_1747)
    {
        _392 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2055 = _392;
    float _2057 = fma(_1985, _400, _2043);
    float _2059 = fma(_2015, _450, _2047);
    float _2061 = -_1827;
    float _2063 = _2061 + 1.0;
    if (!_1747)
    {
        float _2065 = -_2055;
        float _2067 = _2065 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2029 = _2067;
    }
    float _2069 = _2029;
    float _2071 = fma(_2015, _428, _2025);
    float _2073 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2041);
    float _2075 = _450;
    if (!_1747)
    {
        float _2077 = 1.0 / _2069;
        _2075 = _2077;
    }
    float _2079 = _2075;
    if (_1747)
    {
        _2031 = 1.0;
    }
    float _2081 = _2031;
    float _2083 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2085 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2073);
    float _2087 = -_920;
    float _2089 = fma(_1112, _1881, _2087);
    float _2091 = _2013 + 0.5;
    float _2093 = _2081;
    if (!_1747)
    {
        float _2095 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2097 = -_2055;
        float _2099 = fma(_2053, _2095, _2097);
        _1991 = _2099;
    }
    float _2101 = _1991;
    float _2103 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2105 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2107 = fma(_2015, _440, _2057);
    float _2109 = _2089 + 0.5;
    float _2111 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2113 = _2103 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2115 = _2105 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2117 = _1981 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (!_1747)
    {
        float _2119 = _2101 * _2079;
        float _2121 = precise::clamp(_2119, 0.0, 1.0);
        _2093 = _2121;
    }
    float _2123 = _2093;
    float _2125 = _2111 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_73.x = _2059;
    out.m_73.y = _2071;
    out.m_73.z = _2107;
    float _2127 = _2085 + _1644;
    float _2129 = _2123 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2131 = _2123 > 0.0;
    bool _2133 = isnan(_2123);
    bool _2135 = _2131 || _2133;
    bool _2137 = isnan(0.0);
    bool _2139 = _2135 || _2137;
    out.m_75.x = _2113;
    out.m_75.y = _2115;
    out.m_75.z = _2125;
    out.m_75.w = _2117;
    float _2141 = _2127 * 0.5;
    float _2143 = _1999 + 0.5;
    float _2145 = _2045 + 0.5;
    float _2147 = _2129 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2149 = -_2083;
    float _2151 = _2149 + 1.0;
    out.m_77.x = _2143;
    out.m_77.y = _2109;
    out.m_77.z = _2145;
    out.m_77.w = _2091;
    out.gl_Position.x = _1678;
    out.gl_Position.y = _1680;
    out.gl_Position.z = _2085;
    out.gl_Position.w = _1644;
    out.m_79.z = _2141;
    out.m_79.w = _1644;
    out.m_45.x = _2147;
    float _2153 = _2083 * _1712;
    float _2155 = _1723 * _2151;
    float _2157 = _1723 * _2153;
    float _2159 = _1733 * _2153;
    float _2161 = fma(_1729, _2157, _1717);
    float _2163 = fma(_1731, _2157, _1719);
    float _2165 = fma(_1723, _2159, _1721);
    out.m_81.x = _2161;
    out.m_81.y = _2163;
    out.m_81.z = _2165;
    out.m_81.w = _2155;
    if (_2139)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2167 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2167;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

