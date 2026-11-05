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
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_28 [[id(6)]];
    sampler vp_t_tcb_28Smplr [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d<float> vp_t_tcb_1C [[id(14)]];
    sampler vp_t_tcb_1CSmplr [[id(15)]];
    sampler vp_t_tcb_28Smplr_w [[id(16)]];
    sampler vp_t_tcb_24Smplr_w [[id(17)]];
    sampler vp_t_tcb_32Smplr_w [[id(18)]];
    sampler vp_t_tcb_30Smplr_w [[id(19)]];
    sampler vp_t_tcb_1CSmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_85 [[user(locn0)]];
    float4 m_75 [[user(locn1)]];
    float4 m_89 [[user(locn2)]];
    float4 m_93 [[user(locn3)]];
    float4 m_95 [[user(locn4)]];
    float4 m_101 [[user(locn5)]];
    float4 m_99 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_83 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 m_97 [[user(locn10)]];
    float4 m_91 [[user(locn11)]];
    float4 m_55 [[user(locn12)]];
    float4 m_81 [[user(locn13)]];
    float4 m_77 [[user(locn14)]];
    float4 m_73 [[user(locn15)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_65 [[attribute(0)]];
    float4 m_61 [[attribute(1)]];
    float4 m_69 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_48 [[attribute(5)]];
    float4 m_50 [[attribute(6)]];
    float4 m_87 [[attribute(7)]];
    float4 m_67 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
    float4 m_71 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2410 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_48.w;
    float _117 = in.m_50.w;
    float _119 = trunc(_115);
    int _122 = int(_119);
    float _124 = -_117;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _126;
    bool _130 = _122 >= 1;
    float _132 = 0.0;
    float _134 = as_type<float>(_122);
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _132;
    if (!_130)
    {
        out.m_55.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _136 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2726 = as_type<float>(_142);
        out.gl_Position.z = _2726;
    }
    if (!_130)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _146 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_117);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    float _156 = float(_122);
    bool _158 = _126 >= _156;
    bool _160 = !_154;
    bool _162 = _158 || _160;
    if (_162)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _134;
    if (_162)
    {
        out.m_55.x = 0.0;
    }
    if (_162)
    {
        float _166 = _164 * 5.0;
        _144 = as_type<int>(_166);
    }
    int _168 = _144;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2781 = as_type<float>(_168);
        out.gl_Position.z = _2781;
    }
    if (_162)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _170 = in.m_57.x;
    float _172 = in.m_57.y;
    float _174 = in.m_57.z;
    float _176 = 1.0 / _156;
    bool _178 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _180 = _126 * _176;
    float _182 = _170 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _184 = _172 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _186 = _174 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _188 = !_178;
    float _190 = _180;
    if (!_188)
    {
        float _192 = in.m_59.x;
        float _194 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _198 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _200 = _198 * _194;
        float _202 = floor(_200);
        float _204 = -_202;
        float _206 = _200 + _204;
        _190 = _206;
    }
    float _208 = _190;
    float _210 = in.m_48.x;
    float _212 = in.m_48.y;
    float _214 = in.m_48.z;
    float _216 = _182 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _218 = in.m_61.x;
    float _220 = in.m_61.y;
    float _222 = in.m_61.z;
    float _224 = in.m_61.w;
    float _226 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _228 = _216 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _230 = in.m_63.x;
    float _232 = in.m_63.y;
    float _234 = in.m_63.z;
    float _236 = in.m_63.w;
    float _238 = _184 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _240 = _186 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _242 = in.m_65.y;
    float _244 = in.m_67.z;
    float _246 = _212 * _220;
    float _248 = _212 * _232;
    float _250 = fma(_210, _218, _246);
    float _252 = fma(_210, _230, _248);
    float _254 = _212 + _242;
    float _256 = fma(_214, _222, _250);
    float _258 = fma(_214, _234, _252);
    float _260 = -_254;
    float _262 = _260 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _264 = _256 + _224;
    float _266 = _258 + _236;
    float _268 = _262 * _262;
    float _270 = -_264;
    float _272 = _270 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _274 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _276 = -_266;
    float _278 = _276 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _280 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _282 = fma(_272, _272, _268);
    float _284 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _286 = -_274;
    float _288 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _286);
    float _290 = -_280;
    float _292 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _290);
    float _294 = fma(_278, _278, _282);
    float _296 = -_284;
    float _298 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _296);
    float _300 = _298 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _302 = rsqrt(_294);
    float _304 = -_300;
    float _306 = fma(_288, (*spvDescriptorSet0.vp_c8)._m0[1].x, _304);
    float _308 = _272 * _302;
    float _310 = _278 * _302;
    float _312 = _262 * _302;
    float _314 = _298 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _316 = _308 * _308;
    float _318 = -_314;
    float _320 = fma(_292, (*spvDescriptorSet0.vp_c8)._m0[1].x, _318);
    float _322 = fma(_310, _310, _316);
    float _324 = rsqrt(_322);
    float _326 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _328 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _330 = -_326;
    float _332 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _330);
    float _334 = -_328;
    float _336 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _334);
    float _338 = _292 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _340 = -_226;
    float _342 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _340);
    float _344 = fma(_336, (*spvDescriptorSet0.vp_c8)._m0[1].w, _306);
    float _346 = -_338;
    float _348 = fma(_288, (*spvDescriptorSet0.vp_c8)._m0[1].y, _346);
    float _350 = _310 * _324;
    float _352 = _308 * _324;
    float _354 = fma(_332, (*spvDescriptorSet0.vp_c8)._m0[1].w, _348);
    float _356 = _344 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _358 = -_350;
    float _360 = _310 * _358;
    float _362 = _336 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _364 = -_350;
    float _366 = _312 * _364;
    float _368 = -_356;
    float _370 = fma(_354, (*spvDescriptorSet0.vp_c8)._m0[0].x, _368);
    float _372 = -_360;
    float _374 = fma(_308, _352, _372);
    float _376 = _312 * _352;
    float _378 = -_362;
    float _380 = fma(_332, (*spvDescriptorSet0.vp_c8)._m0[1].x, _378);
    float _382 = fma(_342, (*spvDescriptorSet0.vp_c8)._m0[1].w, _320);
    float _384 = _374 * _374;
    float _386 = _298 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _388 = fma(_382, (*spvDescriptorSet0.vp_c8)._m0[0].z, _370);
    float _390 = fma(_376, _376, _384);
    float _392 = _298 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _394 = fma(_366, _366, _390);
    float _396 = fma(_342, (*spvDescriptorSet0.vp_c8)._m0[1].z, _380);
    float _398 = -_386;
    float _400 = fma(_288, (*spvDescriptorSet0.vp_c8)._m0[0].x, _398);
    float _402 = _292 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _404 = rsqrt(_394);
    float _406 = -_396;
    float _408 = fma(_406, (*spvDescriptorSet0.vp_c8)._m0[0].w, _388);
    float _410 = fma(_336, (*spvDescriptorSet0.vp_c8)._m0[0].w, _400);
    float _412 = -_402;
    float _414 = fma(_288, (*spvDescriptorSet0.vp_c8)._m0[0].y, _412);
    float _416 = -_392;
    float _418 = fma(_292, (*spvDescriptorSet0.vp_c8)._m0[0].x, _416);
    float _420 = fma(_332, (*spvDescriptorSet0.vp_c8)._m0[0].w, _414);
    float _422 = 1.0 / _408;
    float _424 = fma(_342, (*spvDescriptorSet0.vp_c8)._m0[0].w, _418);
    float _426 = _374 * _404;
    float _428 = precise::clamp(_426, 0.0, 1.0);
    float _430 = -_428;
    float _432 = _430 + 1.0;
    float _434 = fma(_410, _422, -1.0);
    float _436 = _432 * _422;
    float _438 = fma(_432, _434, 1.0);
    float _440 = _420 * _436;
    float _442 = _424 * _436;
    float _444 = _438 * _438;
    float _446 = fma(_440, _440, _444);
    float _448 = in.m_69.x;
    float _450 = in.m_69.y;
    float _452 = in.m_69.z;
    float _454 = in.m_69.w;
    float _456 = fma(_442, _442, _446);
    float _458 = rsqrt(_456);
    float _460 = _442 * _458;
    float _462 = _212 * _450;
    float _464 = _438 * _458;
    float _466 = _440 * _458;
    float _468 = -_460;
    float _470 = _308 * _468;
    float _472 = fma(_210, _448, _462);
    float _474 = _310 * _464;
    float _476 = -_466;
    float _478 = -_470;
    float _480 = fma(_310, _476, _478);
    float _482 = -_466;
    float _484 = _312 * _482;
    float _486 = -_460;
    float _488 = -_474;
    float _490 = fma(_312, _486, _488);
    float _492 = fma(_214, _452, _472);
    float _494 = _480 * _480;
    float _496 = -_484;
    float _498 = fma(_308, _464, _496);
    float _500 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _502 = _264 + _500;
    float _504 = _492 + _454;
    float _506 = fma(_490, _490, _494);
    float _508 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _510 = _266 + _508;
    float _512 = in.m_59.x;
    float _514 = in.m_59.y;
    float _516 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _518 = _504 + _516;
    float _520 = fma(_498, _498, _506);
    float _522 = _518 * _518;
    float _524 = rsqrt(_520);
    float _526 = fma(_502, _502, _522);
    float _528 = fma(_510, _510, _526);
    float _530 = sqrt(_528);
    float _532 = _490 * _524;
    float _534 = _498 * _524;
    float _536 = _480 * _524;
    float _538 = _310 * _532;
    float _540 = _312 * _534;
    float _542 = rsqrt(_528);
    float _544 = -_538;
    float _546 = fma(_308, _534, _544);
    float _548 = -_540;
    float _550 = fma(_310, _536, _548);
    float _552 = _308 * _536;
    float _554 = _530 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _556 = _546 * _546;
    float _558 = -_552;
    float _560 = fma(_312, _532, _558);
    float _562 = fma(_550, _550, _556);
    float _564 = precise::min(_228, _554);
    float _566 = fma(_560, _560, _562);
    float _568 = _512 * 6.283185482025146484375;
    float _570 = _542 * _564;
    float _572 = _568 * 0.15915493667125701904296875;
    float _574 = rsqrt(_566);
    float _576 = _518 * _570;
    float _578 = _502 * _570;
    float _580 = -_576;
    float _582 = _518 + _580;
    float _584 = -_578;
    float _586 = _502 + _584;
    float _588 = in.m_67.x;
    float _590 = in.m_67.y;
    float _592 = _582 * _582;
    float _594 = _510 * _570;
    float _596 = _572 * 6.283185482025146484375;
    float _598 = cos(_596);
    float _600 = fma(_586, _586, _592);
    float _602 = -_594;
    float _604 = _510 + _602;
    float _606 = _560 * _574;
    float _608 = _546 * _574;
    float _610 = _550 * _574;
    float _612 = fma(_604, _604, _600);
    float _614 = _308 * _606;
    float _616 = _310 * _608;
    float _618 = _572 * 6.283185482025146484375;
    float _620 = sin(_618);
    float _622 = -_614;
    float _624 = fma(_310, _610, _622);
    float _626 = -_616;
    float _628 = fma(_312, _606, _626);
    float _630 = _312 * _610;
    float _632 = _624 * _624;
    float _634 = sqrt(_612);
    float _636 = -_630;
    float _638 = fma(_308, _608, _636);
    float _640 = fma(_628, _628, _632);
    float _642 = _598 * _590;
    float _644 = fma(_638, _638, _640);
    float _646 = _620 * _590;
    float _648 = fma(_620, _588, _642);
    float _650 = rsqrt(_644);
    float _652 = -_646;
    float _654 = fma(_598, _588, _652);
    float _656 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _648);
    float _658 = _542 * _634;
    float _660 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _654);
    float _662 = _238 * _658;
    float _664 = _216 * _658;
    float _666 = _240 * _658;
    float _668 = _662 * _656;
    float _670 = _664 * _660;
    float _672 = _638 * _650;
    float _674 = _666 * _244;
    float _676 = _668 * _606;
    float _678 = _668 * _610;
    float _680 = _628 * _650;
    float _682 = _668 * _608;
    float _684 = fma(_670, _672, _676);
    float _686 = _624 * _650;
    float _688 = fma(_670, _680, _678);
    float _690 = fma(_674, _310, _684);
    float _692 = fma(_670, _686, _682);
    float _694 = fma(_674, _308, _688);
    float _696 = _266 + _690;
    float _698 = fma(_674, _312, _692);
    float _700 = _264 + _694;
    float _702 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _704 = _696 + _702;
    float _706 = _254 + _698;
    float _708 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _710 = _700 + _708;
    float _712 = _704 * _704;
    float _714 = fma(_710, _710, _712);
    float _716 = sqrt(_714);
    bool _718 = _716 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _722 = _720 != 0;
    int _724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _726 = _724 != 0;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _730 = _728 != 0;
    bool _732 = !_726;
    int _734 = _732 ? 0 : 1;
    bool _736 = !_722;
    int _738 = _736 ? 0 : 1;
    bool _740 = !_730;
    int _742 = _740 ? 0 : 1;
    float _744 = _698;
    float _746 = _670;
    float _748 = _706;
    if (!_718)
    {
        _744 = _700;
    }
    float _750 = _744;
    float _752 = _750;
    if (!_718)
    {
        _746 = _696;
    }
    float _754 = _746;
    bool _756 = !_718;
    float _758 = _754;
    if (!_756)
    {
        float _760 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _762 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _764 = _716 + _762;
        float _766 = _706 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _768 = rsqrt(_714);
        float _770 = _764 * _760;
        float _772 = _770 * 0.15915493667125701904296875;
        float _774 = _772 * 6.283185482025146484375;
        float _776 = cos(_774);
        float _778 = _772 * 6.283185482025146484375;
        float _780 = sin(_778);
        float _782 = _776 + (-1.0);
        float _784 = fma(_780, _766, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _786 = _782 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _788 = _768 * _784;
        float _790 = fma(_706, _776, _786);
        float _792 = fma(_710, _788, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _794 = fma(_704, _788, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _752 = _792;
        _758 = _794;
        _748 = _790;
    }
    float _796 = _752;
    float _798 = _758;
    float _800 = _748;
    float _802 = -_578;
    float _804 = _802 + _796;
    float _806 = -_594;
    float _808 = _806 + _798;
    float _810 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _812 = _804 + _810;
    float _814 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _816 = _808 + _814;
    float _818 = fma(_812, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _820 = fma(_816, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _3818 = float2(_818, _820);
    float _822 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_3818, float2(0.0), isnan(_3818)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_3818, float2(0.0), isnan(_3818)), level(0.0)).x;
    float _824 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _826 = int(_824);
    int _828 = abs(_734);
    float _830 = -_578;
    float _832 = _264 + _830;
    int _834 = abs(_738);
    float _836 = -_594;
    float _838 = _266 + _836;
    int _840 = abs(_742);
    float _842 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _844 = _804 + _842;
    float _846 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _848 = int(_846);
    float _850 = in.m_71.y;
    float _852 = float(_826);
    float _854 = 1.0 / _852;
    float _856 = float(uint(_848));
    int _858 = ~_848;
    int _860 = _858 + 1;
    int _862 = ~_848;
    int _864 = _862 + 1;
    float _866 = 1.0 / _856;
    bool _868 = _848 == 0;
    float _870 = _126 * _854;
    float _872 = trunc(_870);
    int _874 = int(_872);
    int _876 = as_type<int>(_866) + (-2);
    float _878 = float(uint(_874));
    float _880 = as_type<float>(_876) * _878;
    float _882 = trunc(_880);
    float _884 = precise::max(_882, 0.0);
    uint _887 = uint(_884);
    float _889 = float(_848);
    int _891 = _860 * int(_887);
    int _893 = _891 + _874;
    float _895 = float(_874);
    float _897 = float(uint(_893));
    float _899 = as_type<float>(_876) * _897;
    int _901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _903 = _901 != 0;
    float _905 = trunc(_899);
    float _907 = precise::max(_905, 0.0);
    uint _909 = uint(_907);
    bool _911 = !_903;
    float _913 = _911 ? 7.345489978790283203125 : 1.0;
    float _915 = _913 * _512;
    int _917 = int(_887) + int(_909);
    float _919 = floor(_915);
    int _921 = _864 * _917;
    int _923 = _921 + _874;
    bool _925 = _895 >= _889;
    bool _927 = isnan(_895);
    bool _929 = _925 || _927;
    bool _931 = isnan(_889);
    bool _933 = _929 || _931;
    float _935 = float(_933);
    float _937 = _126 * _889;
    bool _939 = uint(_923) >= uint(_848);
    float _941 = _937 * _176;
    float _943 = trunc(_935);
    int _945 = int(_943);
    bool _947 = !_939;
    int _949 = _947 ? 0 : (-1);
    int _951 = ~_917;
    int _953 = _951 + _949;
    int _955 = _953 + 1;
    float _957 = -_919;
    float _959 = _915 + _957;
    float _961 = trunc(_941);
    int _963 = int(_961);
    int _965 = _848 + (-1);
    int _967 = _848 * _955;
    int _969 = _967 + _874;
    float _971 = _959 * _889;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _975 = _973 != 0;
    int _977 = ~_945;
    int _979 = _977 + 1;
    int _981 = _979 + 1;
    float _983 = trunc(_971);
    int _985 = int(_983);
    bool _987 = !_868;
    int _989 = _987 ? _969 : (-1);
    bool _991 = !_975;
    float _993 = _991 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _997 = _995 != 0;
    int _999 = _989 * _981;
    int _1001 = abs(as_type<int>(_993));
    int _1003 = _945 * _965;
    int _1005 = _1003 + _999;
    bool _1007 = !_997;
    int _1009 = _1007 ? 0 : 1;
    int _1011 = _1005 * _828;
    int _1013 = abs(_1009);
    int _1015 = _985 * _1001;
    int _1017 = _1015 + _874;
    float _1019 = -_576;
    float _1021 = _1019 + _800;
    int _1023 = _963 * _834;
    int _1025 = _1023 + _1011;
    int _1027 = _1017 * _840;
    int _1029 = _1027 + _1025;
    int _1031 = _985 * _1013;
    int _1033 = _1031 + _1029;
    float _1035 = fma(_822, 100.0, _1021);
    float _1037 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1039 = _808 + _1037;
    float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1043 = _1035 + _1041;
    float _1045 = _1043 * _1043;
    float _1047 = fma(_844, _844, _1045);
    float _1049 = fma(_1039, _1039, _1047);
    float _1051 = rsqrt(_1049);
    float _1053 = _1051 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1055 = _844 * _1053;
    float _1057 = _1039 * _1053;
    float _1059 = _1055 * _1055;
    float _1061 = _1057 * _1057;
    float _1063 = _1059 + _1061;
    float _1065 = sqrt(_1063);
    bool _1067 = _1065 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1069 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1071 = _1065 + _1069;
    float _1073 = _1039;
    float _1075 = _993;
    float _1077 = _1071;
    float _1079 = _971;
    float _1081 = _1043;
    float _1083 = _1049;
    if (_1067)
    {
        float _1085 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1073 = _1085;
    }
    float _1087 = _1073;
    if (_1067)
    {
        float _1089 = rsqrt(_1063);
        _1075 = _1089;
    }
    float _1091 = _1075;
    float _1093 = _1091;
    if (_1067)
    {
        float _1095 = _1071 * _1087;
        _1077 = _1095;
    }
    float _1097 = _1077;
    if (_1067)
    {
        float _1099 = _1097 * 0.15915493667125701904296875;
        _1079 = _1099;
    }
    float _1101 = _1079;
    float _1103 = as_type<float>(_1011);
    float _1105 = _1101;
    if (_1067)
    {
        float _1107 = _1101 * 6.283185482025146484375;
        float _1109 = sin(_1107);
        _1103 = _1109;
    }
    float _1111 = _1103;
    float _1113 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1115 = precise::max(0.0, _1113);
    float _1117 = _1051;
    float _1119 = _1115;
    if (_1067)
    {
        float _1121 = _1101 * 6.283185482025146484375;
        float _1123 = cos(_1121);
        _1117 = _1123;
    }
    float _1125 = _1117;
    float _1127 = -_1053;
    float _1129 = -_1115;
    float _1131 = fma(_1043, _1127, _1129);
    float _1133 = sqrt(_1049);
    float _1135 = _1131;
    if (_1067)
    {
        float _1137 = _1131 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1119 = _1137;
    }
    float _1139 = _1119;
    float _1141 = _1139;
    float _1143 = _1111;
    if (_1067)
    {
        float _1145 = fma(_1111, _1139, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1141 = _1145;
    }
    float _1147 = _1141;
    if (_1067)
    {
        float _1149 = _1125 + (-1.0);
        _1081 = _1149;
    }
    float _1151 = _1081;
    if (_1067)
    {
        float _1153 = _1091 * _1147;
        _1105 = _1153;
    }
    float _1155 = _1105;
    if (!_1067)
    {
        _1093 = _1055;
    }
    float _1157 = _1093;
    float _1159 = _1157;
    if (_1067)
    {
        float _1161 = _1151 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1143 = _1161;
    }
    float _1163 = _1143;
    float _1165 = _1163;
    if (_1067)
    {
        float _1167 = _1055 * _1155;
        _1159 = _1167;
    }
    float _1169 = _1159;
    if (!_1067)
    {
        _1083 = _1059;
    }
    float _1171 = _1083;
    float _1173 = fma(_832, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1175 = _1171;
    if (_1067)
    {
        float _1177 = fma(_1131, _1125, _1163);
        _1135 = _1177;
    }
    float _1179 = _1135;
    float _1181 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1183 = fma(_1133, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1181);
    float _1185 = precise::clamp(_1183, 0.0, 1.0);
    float _1187 = _1185;
    if (!_1067)
    {
        _1165 = _1057;
    }
    float _1189 = _1165;
    float _1191 = _1189;
    if (_1067)
    {
        float _1193 = _1057 * _1155;
        _1191 = _1193;
    }
    float _1195 = _1191;
    if (_1067)
    {
        float _1197 = _1169 * _1169;
        _1175 = _1197;
    }
    float _1199 = _1175;
    float _1201 = -_1185;
    float _1203 = _1201 + 1.0;
    if (!_1067)
    {
        _1187 = _1061;
    }
    float _1205 = _1187;
    float _1207 = _1205;
    if (_1067)
    {
        float _1209 = _1195 * _1195;
        _1207 = _1209;
    }
    float _1211 = _1207;
    float _1213 = fma(_1179, _1179, _1199);
    float _1215 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1217 = abs(_1203);
    float _1219 = log2(_1217);
    float _1221 = _1213 + _1211;
    float _1223 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1215);
    float _1225 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1227 = float(uint(_1033));
    float _1229 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1223);
    float _1231 = rsqrt(_1221);
    float _1233 = fma(_838, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1235 = _1229 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1237 = as_type<float>(_876) * _1227;
    float _1239 = _1235 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1241 = _1219 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1243 = floor(_1173);
    float _1245 = -_1239;
    float _1247 = fma(_1245, _1225, 1.0);
    float _1249 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1251 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1249);
    float _1253 = _1231 * _1169;
    float _1255 = _1231 * _1179;
    float _1257 = _1231 * _1195;
    float _1259 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1261 = _1253 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1263 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1251);
    float _1265 = exp2(_1241);
    float _1267 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1259);
    float _1269 = -_1261;
    float _1271 = fma(_1255, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1269);
    float _1273 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1275 = _1263 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1277 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1267);
    float _1279 = -_1257;
    float _1281 = fma(_1279, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1271);
    float _1283 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1273);
    float _1285 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1287 = _1277 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1289 = floor(_1233);
    float _1291 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1283);
    float _1293 = -_1243;
    float _1295 = _1173 + _1293;
    float _1297 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1285);
    float _1299 = fma(_1281, -0.5, 0.5);
    float _1301 = _1291 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1303 = _1255 + 1.0;
    float _1305 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1297);
    float _1307 = log2(_1247);
    float _1309 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1311 = -_1255;
    float _1313 = fma(_1265, _1303, _1311);
    float _1315 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1305);
    float _1317 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1319 = fma(_1281, 0.5, 0.5);
    int _1321 = ~_848;
    int _1323 = _1321 + 1;
    float _1325 = fma(_1313, 0.5, 0.5);
    float _1327 = 1.0 / _1315;
    float _1329 = -_1289;
    float _1331 = _1233 + _1329;
    float _1333 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1309);
    float _1335 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1317);
    float _1337 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1333);
    float _1339 = sqrt(_1299);
    float _1341 = fma(_1319, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1343 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1335);
    float _1345 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1337);
    float _1347 = _1307 * 0.693147182464599609375;
    float _1349 = fma(_1319, _1341, -0.212114393711090087890625);
    float _1351 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1343);
    float _1353 = trunc(_1237);
    float _1355 = precise::max(_1353, 0.0);
    uint _1357 = uint(_1355);
    float _1359 = _1345 * _1327;
    float _1361 = fma(_1319, _1349, 1.570728778839111328125);
    float _1363 = _1351 * _1327;
    float _1365 = _1347 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1367 = fma(_1359, 0.5, 0.5);
    float _1369 = fma(_1363, -0.5, 0.5);
    float _1371 = _1339 * 0.636619746685028076171875;
    float2 _4661 = float2(_1295, _1331);
    float _1373 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4661, float2(0.0), isnan(_4661)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4661, float2(0.0), isnan(_4661)), level(0.0)).x;
    float _1375 = -_1361;
    float _1377 = fma(_1371, _1375, 1.0);
    int _1379 = _1323 * int(_1357);
    int _1381 = _1379 + _1033;
    float3 _4682 = float3(_1367, _1369, _1365);
    float _1383 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4682, float3(0.0), isnan(_4682)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4682, float3(0.0), isnan(_4682)), level(0.0)).x;
    float _1385 = float(uint(_1381));
    float3 _4696 = float3(_1367, _1369, _1365);
    float4 _1388 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4696, float3(0.0), isnan(_4696)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4696, float3(0.0), isnan(_4696)), level(0.0)).xyzw;
    float _1390 = _1388.x;
    float _1392 = _1388.y;
    float _1394 = _1388.z;
    float _1396 = _1388.w;
    float2 _4712 = float2(_1377, _1325);
    float3 _1400 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4712, float2(0.0), isnan(_4712)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4712, float2(0.0), isnan(_4712)), level(0.0)).xyz;
    float _1402 = _1400.x;
    float _1404 = _1400.y;
    float _1406 = _1400.z;
    float _1408 = as_type<float>(_876) * _1385;
    float _1410 = -_576;
    float _1412 = _1410 + _254;
    int _1414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1416 = _1414 != 0;
    float _1418 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1420 = trunc(_1408);
    float _1422 = precise::max(_1420, 0.0);
    uint _1424 = uint(_1422);
    int _1426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1428 = _1426 != 0;
    out.m_73.w = _564;
    int _1430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1432 = _1430 != 0;
    float _1434 = _512 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1436 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1418);
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1440 = _1438 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1442 = _514 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1446 = -_850;
    float _1448 = _1446 + 1.0;
    float _1450 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1452 = _1450 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1454 = fma(_1442, -2.0, _1444);
    float _1456 = 1.0 / _1440;
    float _1458 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1460 = int(_1357) + int(_1424);
    float _1462 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1464 = _1462 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1466 = ~_848;
    int _1468 = _1466 + 1;
    float _1470 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1472 = _514 > 0.5;
    float _1474 = 1.0 / _1452;
    float _1476 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1458);
    int _1478 = _1468 * _1460;
    int _1480 = _1478 + _1033;
    float _1482 = -_1470;
    float _1484 = fma(_1434, 2.0, _1482);
    float _1486 = _850;
    float _1488 = _1315;
    float _1490 = _1351;
    if (_1428)
    {
        float _1492 = _1472 ? _1448 : _850;
        _1486 = _1492;
    }
    float _1494 = _1486;
    float _1496 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1498 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1496;
    float _1500 = 1.0 / _1464;
    float _1502 = _1408;
    if (_1416)
    {
        float _1504 = in.m_59.x;
        _1502 = _1504;
    }
    float _1506 = _1502;
    float _1508 = _1498 * _1456;
    float _1510 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1512 = uint(_1480) >= uint(_848);
    float _1514 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1516 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1514;
    float _1518 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1520 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1522 = _1516 * _1474;
    float _1524 = float(uint(_1017));
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1528 = _1510 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1530 = _1518 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1532 = _1520 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1534 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1536 = _1534 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1538 = as_type<float>(_876) * _1524;
    int _1540 = ~_848;
    int _1542 = _1540 + 1;
    float _1544 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1546 = _208 + _1544;
    out.m_75.x = _1528;
    out.m_75.y = _1530;
    out.m_75.z = _1532;
    out.m_75.w = _1526;
    float _1548 = _1536 * _1500;
    bool _1550 = !_1512;
    int _1552 = _1550 ? 0 : (-1);
    float _1554 = fma(_1508, _1546, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1556 = _1506 > 0.5;
    bool _1558 = _1556 && _1416;
    float _1560 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1562 = _208 + _1560;
    int _1564 = ~_1460;
    int _1566 = _1564 + _1552;
    int _1568 = _1566 + 1;
    float _1570 = fma(_822, 100.0, _1412);
    float _1572 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1574 = fma(_1548, _1562, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    out.m_77.y = _648;
    int _1576 = _848 * _1568;
    int _1578 = _1576 + _1033;
    bool _1580 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1582 = isnan(_208);
    bool _1584 = _1580 || _1582;
    bool _1586 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1588 = _1584 || _1586;
    float _1590 = float(_1588);
    float _1592 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1572);
    float _1594 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1454);
    float _1596 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1436);
    float _1598 = -_126;
    float _1600 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1484);
    float _1602 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1476);
    float _1604 = in.m_71.x;
    float _1606 = trunc(_1538);
    float _1608 = precise::max(_1606, 0.0);
    uint _1610 = uint(_1608);
    bool _1612 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1614 = isnan(_208);
    bool _1616 = _1612 || _1614;
    bool _1618 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1620 = _1616 || _1618;
    float _1622 = float(_1620);
    float _1624 = -_1590;
    float _1626 = _1624 + 1.0;
    bool _1628 = !_868;
    int _1630 = _1628 ? _1578 : (-1);
    float _1632 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1592);
    bool _1634 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1636 = isnan(_208);
    bool _1638 = _1634 || _1636;
    bool _1640 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1642 = _1638 || _1640;
    float _1644 = float(_1642);
    float _1646 = -_1622;
    float _1648 = _1646 + 1.0;
    int _1650 = _1630 >> 31;
    float _1652 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1632);
    float _1654 = _1590 * _1648;
    bool _1656 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1658 = isnan(_208);
    bool _1660 = _1656 || _1658;
    bool _1662 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1664 = _1660 || _1662;
    float _1666 = float(_1664);
    float _1668 = -_1644;
    float _1670 = _1668 + 1.0;
    int _1672 = _1650 & 3;
    float _1674 = _1644 * _1626;
    out.m_79.x = _664;
    int _1676 = _1542 * int(_1610);
    int _1678 = _1676 + _1017;
    float _1680 = _1666 * _1670;
    int _1682 = _1630 + _1672;
    float _1684 = _1219 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_81.x = _832;
    out.m_81.y = _1570;
    out.m_81.z = _838;
    float _1686 = float(uint(_1678));
    float _1688 = _1554 * _1680;
    int _1690 = _1682 >> 2;
    out.gl_Position.x = _1345;
    out.gl_Position.y = _1351;
    out.gl_Position.z = _1652;
    out.gl_Position.w = _1315;
    float _1692 = _1554;
    float _1694 = as_type<float>(_1682);
    if (_1416)
    {
        _1692 = _1604;
    }
    float _1696 = _1692;
    float _1698 = as_type<float>(_876) * _1686;
    float _1700 = _1696;
    if (!_1416)
    {
        _1694 = _1604;
    }
    float _1702 = _1694;
    float _1704 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1706 = _208 + _1704;
    int _1708 = _1690 << 4;
    int _1710 = _1708 + 368;
    float _1712 = trunc(_1698);
    float _1714 = precise::max(_1712, 0.0);
    uint _1716 = uint(_1714);
    float _1718 = -_1666;
    float _1720 = _1718 + 1.0;
    float _1722 = _1702;
    if (_1558)
    {
        float _1724 = -_1696;
        float _1726 = _1724 + 1.0;
        _1700 = _1726;
    }
    float _1728 = _1700;
    uint _1730 = uint(int(uint(_1710) >> uint(2)));
    uint _1732 = uint(int(uint(int(_1730)) >> uint(2)));
    int _1734 = int(_1730) & 3;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[int(_1732)][_1734];
    int _1738 = int(_1730) + 1;
    uint _1740 = uint(int(uint(_1738) >> uint(2)));
    int _1742 = _1738 & 3;
    float _1744 = (*spvDescriptorSet0.vp_c9)._m0[int(_1740)][_1742];
    int _1746 = _1630 & 3;
    bool _1748 = _1746 != 0;
    float _1750 = fma(_1720, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1688);
    int _1752 = _1630 & 3;
    bool _1754 = _1752 != 0;
    float _1756 = fma(_1522, _1706, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    if (_1416)
    {
        _1722 = _1728;
    }
    float _1758 = _1722;
    float _1760 = fma(_1574, _1674, _1750);
    float _1762 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    bool _1764 = uint(_1752) > 1u;
    float _1766 = exp2(_1684);
    float _1768 = fma(_1758, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1770 = fma(_1756, _1654, _1760);
    bool _1772 = _1752 != 3;
    float _1774 = -_1594;
    float _1776 = fma(_1602, _1762, _1774);
    int _1778 = int(_1610) + int(_1716);
    float _1780 = fma(_1596, _1768, _1600);
    int _1782 = _1710 + 8;
    uint _1784 = uint(int(uint(_1782) >> uint(2)));
    uint _1786 = uint(int(uint(int(_1784)) >> uint(2)));
    int _1788 = int(_1784) & 3;
    float _1790 = (*spvDescriptorSet0.vp_c9)._m0[int(_1786)][_1788];
    int _1792 = int(_1784) + 1;
    uint _1794 = uint(int(uint(_1792) >> uint(2)));
    int _1796 = _1792 & 3;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[int(_1794)][_1796];
    int _1800 = _1748 ? 0 : 1;
    float _1802 = fma(_1622, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1770);
    float _1804 = _1776 + 0.5;
    int _1806 = ~_1800;
    int _1808 = _1806 + 1;
    int _1810 = _1808 + 1;
    float _1812 = _1802 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1814 = _1810;
    if (!_1764)
    {
        int _1816 = ~_1800;
        int _1818 = _1816 + 1;
        _1814 = _1818;
    }
    int _1820 = _1814;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1824 = uint(_1752) >= 2u;
    float _1826 = _1780 + 0.5;
    float _1828 = _1822 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1830 = abs(_1820);
    float _1832 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1834 = _1824 ? 0 : 1;
    float _1836 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1838 = ~_848;
    int _1840 = _1838 + 1;
    float _1842 = _1832 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1844 = ~_1834;
    int _1846 = _1844 + 1;
    int _1848 = _1846 + 1;
    float _1850 = _1836 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1852 = _1848;
    if (_1772)
    {
        int _1854 = ~_1834;
        int _1856 = _1854 + 1;
        _1852 = _1856;
    }
    int _1858 = _1852;
    int _1860 = _1840 * _1778;
    int _1862 = _1860 + _1017;
    bool _1864 = !_1754;
    int _1866 = _1864 ? 0 : 1;
    out.m_83.x = _1826;
    out.m_83.y = _1804;
    int _1868 = ~_1830;
    int _1870 = _1868 + 1;
    int _1872 = _1870 + 1;
    int _1874 = abs(_1866);
    out.m_85.x = _1828;
    out.m_85.y = _1842;
    out.m_85.z = _1850;
    out.m_85.w = _1812;
    bool _1876 = _1752 != 3;
    int _1878 = _1872 * as_type<int>(_1744);
    bool _1880 = uint(_1862) >= uint(_848);
    float _1882 = in.m_87.x;
    float _1884 = in.m_87.y;
    float _1886 = in.m_87.z;
    bool _1888 = !_1432;
    int _1890 = _1888 ? 0 : 1;
    bool _1892 = _648 != 0.0;
    bool _1894 = isnan(_648);
    bool _1896 = _1892 || _1894;
    bool _1898 = isnan(0.0);
    bool _1900 = _1896 || _1898;
    bool _1902 = _654 == 0.0;
    bool _1904 = !_1900;
    bool _1906 = _1902 && _1904;
    bool _1908 = !_1876;
    int _1910 = _1908 ? 0 : (-1);
    int _1912 = abs(_1858);
    int _1914 = ~_1874;
    int _1916 = _1914 + 1;
    int _1918 = _1916 + 1;
    int _1920 = abs(_1910);
    bool _1922 = !_1880;
    int _1924 = _1922 ? 0 : (-1);
    int _1926 = _1918 * as_type<int>(_1736);
    int _1928 = _1926 + _1878;
    int _1930 = ~_1912;
    int _1932 = _1930 + 1;
    int _1934 = _1932 + 1;
    int _1936 = abs(_1890);
    int _1938 = ~_1778;
    int _1940 = _1938 + _1924;
    int _1942 = _1940 + 1;
    int _1944 = _1934 * as_type<int>(_1790);
    int _1946 = _1944 + _1928;
    int _1948 = ~_1920;
    int _1950 = _1948 + 1;
    int _1952 = _1950 + 1;
    float _1954 = _1315 * 0.5;
    int _1956 = ~_1936;
    int _1958 = _1956 + 1;
    int _1960 = _1958 + 1;
    int _1962 = _848 * _1942;
    int _1964 = _1962 + _1017;
    bool _1966 = _244 == 0.0;
    bool _1968 = _1966 && _1906;
    int _1970 = _1952 * as_type<int>(_1798);
    int _1972 = _1970 + _1946;
    float _1974 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1976 = _1972 * _1960;
    bool _1978 = !_868;
    int _1980 = _1978 ? _1964 : (-1);
    float _1982 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1974);
    int _1984 = _1980 * _1936;
    int _1986 = _1984 + _1976;
    float _1988 = fma(_838, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1982);
    float _1990 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1992 = _1884;
    float _1994 = _1882;
    float _1996 = _1886;
    if (!_1968)
    {
        float _1998 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1884);
        _1992 = _1998;
    }
    float _2000 = _1992;
    float _2002 = _1988 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2004 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1990);
    float _2006 = float(_1986);
    if (!_1968)
    {
        float _2008 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1882);
        _1994 = _2008;
    }
    float _2010 = _1994;
    float _2012 = 1.0 / _2002;
    float _2014 = fma(_838, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2004);
    if (!_1968)
    {
        float _2016 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1886);
        _1996 = _2016;
    }
    float _2018 = _1996;
    out.m_89.x = _2006;
    float _2020 = _610 * _2000;
    float _2022 = _2014 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2024 = _608 * _2000;
    float _2026 = _606 * _2000;
    float _2028 = fma(_680, _2010, _2020);
    float _2030 = _2022 + _2002;
    float _2032 = _1652 + _1315;
    float _2034 = fma(_686, _2010, _2024);
    float _2036 = fma(_672, _2010, _2026);
    float _2038 = _2032 * 0.5;
    float _2040 = fma(_308, _2018, _2028);
    float _2042 = _2030 * _2012;
    float _2044 = _2042 * 0.5;
    float _2046 = fma(_312, _2018, _2034);
    float _2048 = fma(_310, _2018, _2036);
    float _2050 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2052 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2050);
    float _2054 = 1.0 / _2052;
    float _2056 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2058 = _2054 * _2056;
    float _2060 = fma(_1351, -0.5, _1954);
    float _2062 = abs(_2058);
    float _2064 = log2(_2062);
    bool _2066 = _2058 <= 8000.0;
    bool _2068 = isnan(_2058);
    bool _2070 = _2066 || _2068;
    bool _2072 = isnan(8000.0);
    bool _2074 = _2070 || _2072;
    float _2076 = float(_2074);
    float _2078 = _2064 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2080 = _1345 + _1315;
    float _2082 = _2080 * 0.5;
    float _2084 = exp2(_2078);
    out.m_91.x = _2082;
    out.m_91.y = _2060;
    out.m_91.z = _2038;
    out.m_91.w = _1315;
    float _2086 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2088 = precise::clamp(_2086, 0.0, 1.0);
    float _2090 = in.m_65.x;
    float _2092 = fma(_2088, -2.0, 3.0);
    float _2094 = _2088 * _2088;
    bool _2096 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2098 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2100 = _2096 || _2098;
    bool _2102 = isnan(0.5);
    bool _2104 = _2100 || _2102;
    float _2106 = _2094 * _2092;
    float _2108 = -_2106;
    float _2110 = _2108 + 1.0;
    float _2112 = fma(_2110, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2106);
    float _2114 = _2076 * _2112;
    float _2116 = _2076;
    float _2118 = _2112;
    if (_2104)
    {
        _2116 = 1.0;
    }
    float _2120 = _2116;
    float _2122 = _2120;
    if (_2104)
    {
        _2118 = 1.0;
    }
    float _2124 = _2118;
    float _2126 = _2124;
    if (!_2104)
    {
        float _2128 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2130 = _2128 * 0.15915493667125701904296875;
        float _2132 = _2130 * 6.283185482025146484375;
        float _2134 = cos(_2132);
        float _2136 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2138 = _2136 * 0.15915493667125701904296875;
        float _2140 = _2130 * 6.283185482025146484375;
        float _2142 = sin(_2140);
        float _2144 = 1.0 / _2134;
        float _2146 = _2138 * 6.283185482025146484375;
        float _2148 = cos(_2146);
        float _2150 = _2142 * _2144;
        float _2152 = _2138 * 6.283185482025146484375;
        float _2154 = sin(_2152);
        float _2156 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2158 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2156;
        float _2160 = _2148 * _2150;
        float _2162 = 1.0 / _2158;
        float _2164 = 1.0 / _2160;
        float _2166 = _2154 * _2164;
        float _2168 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2170 = fma(_2058, _2166, _2168);
        float _2172 = _2170 * _2162;
        float _2174 = precise::clamp(_2172, 0.0, 1.0);
        _2126 = _2174;
        _1488 = _2150;
        _1490 = _2144;
    }
    float _2176 = _2126;
    float _2178 = _1488;
    float _2180 = _1490;
    float _2182 = _2178;
    float _2184 = _2180;
    if (!_2104)
    {
        float _2186 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2188 = _2186 * 0.15915493667125701904296875;
        float _2190 = _2188 * 6.283185482025146484375;
        float _2192 = cos(_2190);
        float _2194 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2196 = _2194 * 0.15915493667125701904296875;
        float _2198 = _2188 * 6.283185482025146484375;
        float _2200 = sin(_2198);
        float _2202 = 1.0 / _2192;
        float _2204 = _2196 * 6.283185482025146484375;
        float _2206 = cos(_2204);
        float _2208 = _2200 * _2202;
        float _2210 = _2196 * 6.283185482025146484375;
        float _2212 = sin(_2210);
        float _2214 = _2206 * _2208;
        float _2216 = 1.0 / _2214;
        float _2218 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2220 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2218;
        float _2222 = 1.0 / _2220;
        float _2224 = _2212 * _2216;
        float _2226 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2228 = fma(_2058, _2224, _2226);
        float _2230 = _2228 * _2222;
        float _2232 = precise::clamp(_2230, 0.0, 1.0);
        float _2234 = -_2232;
        float _2236 = _2234 + 1.0;
        _2122 = _2236;
        _2182 = _2216;
        _2184 = _2222;
    }
    float _2238 = _2122;
    float _2240 = _2182;
    float _2242 = _2184;
    float _2244 = -_1766;
    float _2246 = _2244 + 1.0;
    float _2248 = _2114 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2250 = -_1373;
    float _2252 = _2250 + 1.0;
    float _2254 = _2246 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_93.x = _2040;
    out.m_93.y = _2046;
    out.m_93.z = _2048;
    float _2256 = _2252 * _2248;
    float _2258 = precise::clamp(_2256, 0.0, 1.0);
    bool _2260 = _1133 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2262 = isnan(_1133);
    bool _2264 = _2260 || _2262;
    bool _2266 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2268 = _2264 || _2266;
    float _2270 = _2254 * _1383;
    float _2272 = -_2254;
    float _2274 = _2272 + 1.0;
    float _2276 = -_2258;
    float _2278 = fma(_2276, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_95.x = _804;
    out.m_95.y = _1035;
    out.m_95.z = _808;
    float _2280 = _1396 * _2270;
    float _2282 = _1406 * _2270;
    float _2284 = _2278 * _2090;
    float _2286 = _2176 * _2238;
    float _2288 = fma(_1402, _2280, _1390);
    float _2290 = fma(_1404, _2280, _1392);
    float _2292 = _1396 * _2274;
    float _2294 = fma(_1396, _2282, _1394);
    float _2296 = _2284 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2298 = _2240;
    float _2300 = _2270;
    float _2302 = _2242;
    float _2304 = _2274;
    float _2306 = _2280;
    float _2308 = _2296;
    if (!_2268)
    {
        _2298 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2310 = _2298;
    float _2312 = _2286 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_97.x = _2288;
    out.m_97.y = _2290;
    out.m_97.z = _2294;
    out.m_97.w = _2292;
    float _2314 = _2310;
    float _2316 = _2310;
    if (!_2268)
    {
        _2300 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2318 = _2300;
    float _2320 = _2318;
    float _2322 = _2318;
    if (!_2268)
    {
        _2302 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2324 = _2302;
    out.m_99.x = _2296;
    float _2326 = _2324;
    float _2328 = _2324;
    if (!_2268)
    {
        _2304 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2330 = _2304;
    float _2332 = _2330;
    float _2334 = _2330;
    if (!_2268)
    {
        _2306 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2336 = _2306;
    float _2338 = _2336;
    float _2340 = _2336;
    if (!_2268)
    {
        _2308 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2342 = _2308;
    bool _2344 = !_2268;
    float _2346 = _2342;
    float _2348 = _2342;
    if (!_2344)
    {
        bool _2350 = _1133 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2352 = isnan(_1133);
        bool _2354 = _2350 || _2352;
        bool _2356 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2358 = _2354 || _2356;
        if (!_2358)
        {
            float _2360 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2362 = _1133 + _2360;
            float _2364 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2366 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2364;
            float _2368 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2370 = _2368 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2372 = 1.0 / _2366;
            float _2374 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2376 = _2374 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2378 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2380 = _2378 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2382 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2384 = _2382 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2386 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2388 = _2386 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2390 = _2362 * _2372;
            float _2392 = precise::clamp(_2390, 0.0, 1.0);
            float _2394 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2396 = _2394 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2398 = fma(_2392, _2370, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2400 = fma(_2392, _2396, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2402 = fma(_2392, _2376, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2404 = fma(_2392, _2380, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2406 = fma(_2392, _2384, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2408 = fma(_2392, _2388, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2322 = _2402;
            _2340 = _2406;
            _2316 = _2398;
            _2334 = _2404;
            _2328 = _2400;
            _2348 = _2408;
            _2410 = true;
        }
        else
        {
            bool _2412 = _1133 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2414 = isnan(_1133);
            bool _2416 = _2412 || _2414;
            bool _2418 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2420 = _2416 || _2418;
            if (!_2420)
            {
                _2314 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2422 = _2314;
            _2316 = _2422;
            if (!_2420)
            {
                _2320 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2424 = _2320;
            _2322 = _2424;
            if (!_2420)
            {
                _2326 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2426 = _2326;
            _2328 = _2426;
            if (!_2420)
            {
                _2332 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2428 = _2332;
            _2334 = _2428;
            if (!_2420)
            {
                _2338 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2430 = _2338;
            _2340 = _2430;
            if (!_2420)
            {
                _2346 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2432 = _2346;
            bool _2434 = !_2420;
            _2348 = _2432;
            if (!_2434)
            {
                bool _2436 = _1133 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2438 = isnan(_1133);
                bool _2440 = _2436 || _2438;
                bool _2442 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2444 = _2440 || _2442;
                if (!_2444)
                {
                    float _2446 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2448 = _1133 + _2446;
                    float _2450 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2452 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2450;
                    float _2454 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2456 = _2454 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2458 = 1.0 / _2452;
                    float _2460 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2462 = _2460 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2464 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2466 = _2464 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2468 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2470 = _2468 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2472 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2474 = _2472 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2476 = _2448 * _2458;
                    float _2478 = precise::clamp(_2476, 0.0, 1.0);
                    float _2480 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2482 = _2480 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2484 = fma(_2478, _2456, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2486 = fma(_2478, _2482, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2488 = fma(_2478, _2462, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2490 = fma(_2478, _2466, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2492 = fma(_2478, _2470, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2494 = fma(_2478, _2474, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2322 = _2488;
                    _2340 = _2492;
                    _2316 = _2484;
                    _2334 = _2490;
                    _2328 = _2486;
                    _2348 = _2494;
                    _2410 = true;
                }
                else
                {
                    _2322 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2340 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2316 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2334 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2328 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2348 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2410 = false;
    float _2496 = _2322;
    float _2498 = _2340;
    float _2500 = _2316;
    float _2502 = _2334;
    float _2504 = _2328;
    float _2506 = _2348;
    float _2508 = fma(_2046, -0.5, 0.5);
    float _2510 = precise::clamp(_2508, 0.0, 1.0);
    float _2512 = -_2496;
    float _2514 = _2512 + _2498;
    float _2516 = _2312 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2518 = -_2500;
    float _2520 = _2518 + _2502;
    out.m_101.x = 0.0;
    float _2522 = fma(_2510, _2514, _2496);
    float _2524 = fma(_2510, _2520, _2500);
    out.m_55.x = _2516;
    float _2526 = -_2504;
    float _2528 = _2526 + _2506;
    float _2530 = _2522 * 0.586610972881317138671875;
    bool _2532 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2534 = fma(_2510, _2528, _2504);
    float _2536 = fma(_2524, 0.298911988735198974609375, _2530);
    bool _2538 = _2176 > 0.0;
    bool _2540 = isnan(_2176);
    bool _2542 = _2538 || _2540;
    bool _2544 = isnan(0.0);
    bool _2546 = _2542 || _2544;
    float _2548 = fma(_2534, 0.114477999508380889892578125, _2536);
    bool _2550 = _2238 <= 0.0;
    bool _2552 = !_2546;
    bool _2554 = _2550 || _2552;
    float _2556 = -_2548;
    float _2558 = _2524 + _2556;
    float _2560 = -_2548;
    float _2562 = _2522 + _2560;
    float _2564 = -_2548;
    float _2566 = _2534 + _2564;
    float _2568 = fma(_2558, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2548);
    float _2570 = fma(_2562, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2548);
    float _2572 = fma(_2566, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2548);
    bool _2574 = !_2532;
    if (!_2574)
    {
        float _2576 = -_1035;
        float _2578 = _2576 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2580 = -_804;
        float _2582 = _2580 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2584 = -_808;
        float _2586 = _2584 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2588 = _2578 * _2578;
        float _2590 = fma(_2582, _2582, _2588);
        float _2592 = fma(_2586, _2586, _2590);
        float _2594 = sqrt(_2592);
        float _2596 = rsqrt(_2592);
        float _2598 = -_2594;
        float _2600 = _2598 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2602 = _2600 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2604 = precise::clamp(_2602, 0.0, 1.0);
        float _2606 = _2582 * _2596;
        float _2608 = _2578 * _2596;
        float _2610 = abs(_2604);
        float _2612 = log2(_2610);
        float _2614 = _2586 * _2596;
        float _2616 = _2606 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2618 = _2046 * _2608;
        float _2620 = -_2608;
        float _2622 = -_2616;
        float _2624 = fma(_2620, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2622);
        float _2626 = fma(_2040, _2606, _2618);
        float _2628 = -_2614;
        float _2630 = fma(_2628, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2624);
        float _2632 = fma(_2048, _2614, _2626);
        float _2634 = precise::clamp(_2632, 0.0, 1.0);
        float _2636 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2638 = _2630 + _2636;
        float _2640 = _2612 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2642 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2644 = precise::clamp(_2642, 0.0, 1.0);
        float _2646 = exp2(_2640);
        float _2648 = _2646 * _2644;
        float _2650 = _2634 * _2648;
        float _2652 = _2650 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2654 = _2650 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2656 = _2650 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _2652;
        out.m_101.y = _2654;
        out.m_101.z = _2656;
    }
    out.m_73.x = _2568;
    out.m_73.y = _2570;
    out.m_73.z = _2572;
    if (!_2554)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_55.x = 0.0;
    float _2658 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2658;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2410 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_48.w;
    float _117 = in.m_50.w;
    float _119 = trunc(_115);
    int _122 = int(_119);
    float _124 = -_117;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _126;
    bool _130 = _122 >= 1;
    float _132 = 0.0;
    float _134 = as_type<float>(_122);
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _132;
    if (!_130)
    {
        out.m_55.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _136 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2726 = as_type<float>(_142);
        out.gl_Position.z = _2726;
    }
    if (!_130)
    {
        return out;
    }
    bool _146 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_117);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    float _156 = float(_122);
    bool _158 = _126 >= _156;
    bool _160 = !_154;
    bool _162 = _158 || _160;
    if (_162)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _134;
    if (_162)
    {
        out.m_55.x = 0.0;
    }
    if (_162)
    {
        float _166 = _164 * 5.0;
        _144 = as_type<int>(_166);
    }
    int _168 = _144;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2781 = as_type<float>(_168);
        out.gl_Position.z = _2781;
    }
    if (_162)
    {
        return out;
    }
    float _170 = in.m_57.x;
    float _172 = in.m_57.y;
    float _174 = in.m_57.z;
    float _176 = 1.0 / _156;
    bool _178 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _180 = _126 * _176;
    float _182 = _170 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _184 = _172 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _186 = _174 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _188 = !_178;
    float _190 = _180;
    if (!_188)
    {
        float _192 = in.m_59.x;
        float _194 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _198 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _200 = _198 * _194;
        float _202 = floor(_200);
        float _204 = -_202;
        float _206 = _200 + _204;
        _190 = _206;
    }
    float _208 = _190;
    float _210 = in.m_48.x;
    float _212 = in.m_48.y;
    float _214 = in.m_48.z;
    float _216 = _182 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _218 = in.m_61.x;
    float _220 = in.m_61.y;
    float _222 = in.m_61.z;
    float _224 = in.m_61.w;
    float _226 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _228 = _216 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _230 = in.m_63.x;
    float _232 = in.m_63.y;
    float _234 = in.m_63.z;
    float _236 = in.m_63.w;
    float _238 = _184 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _240 = _186 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _242 = in.m_65.y;
    float _244 = in.m_67.z;
    float _246 = _212 * _220;
    float _248 = _212 * _232;
    float _250 = fma(_210, _218, _246);
    float _252 = fma(_210, _230, _248);
    float _254 = _212 + _242;
    float _256 = fma(_214, _222, _250);
    float _258 = fma(_214, _234, _252);
    float _260 = -_254;
    float _262 = _260 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _264 = _256 + _224;
    float _266 = _258 + _236;
    float _268 = _262 * _262;
    float _270 = -_264;
    float _272 = _270 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _274 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _276 = -_266;
    float _278 = _276 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _280 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _282 = fma(_272, _272, _268);
    float _284 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _286 = -_274;
    float _288 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _286);
    float _290 = -_280;
    float _292 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _290);
    float _294 = fma(_278, _278, _282);
    float _296 = -_284;
    float _298 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _296);
    float _300 = _298 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _302 = rsqrt(_294);
    float _304 = -_300;
    float _306 = fma(_288, (*spvDescriptorSet0.vp_c8)._m0[1].x, _304);
    float _308 = _272 * _302;
    float _310 = _278 * _302;
    float _312 = _262 * _302;
    float _314 = _298 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _316 = _308 * _308;
    float _318 = -_314;
    float _320 = fma(_292, (*spvDescriptorSet0.vp_c8)._m0[1].x, _318);
    float _322 = fma(_310, _310, _316);
    float _324 = rsqrt(_322);
    float _326 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _328 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _330 = -_326;
    float _332 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _330);
    float _334 = -_328;
    float _336 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _334);
    float _338 = _292 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _340 = -_226;
    float _342 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _340);
    float _344 = fma(_336, (*spvDescriptorSet0.vp_c8)._m0[1].w, _306);
    float _346 = -_338;
    float _348 = fma(_288, (*spvDescriptorSet0.vp_c8)._m0[1].y, _346);
    float _350 = _310 * _324;
    float _352 = _308 * _324;
    float _354 = fma(_332, (*spvDescriptorSet0.vp_c8)._m0[1].w, _348);
    float _356 = _344 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _358 = -_350;
    float _360 = _310 * _358;
    float _362 = _336 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _364 = -_350;
    float _366 = _312 * _364;
    float _368 = -_356;
    float _370 = fma(_354, (*spvDescriptorSet0.vp_c8)._m0[0].x, _368);
    float _372 = -_360;
    float _374 = fma(_308, _352, _372);
    float _376 = _312 * _352;
    float _378 = -_362;
    float _380 = fma(_332, (*spvDescriptorSet0.vp_c8)._m0[1].x, _378);
    float _382 = fma(_342, (*spvDescriptorSet0.vp_c8)._m0[1].w, _320);
    float _384 = _374 * _374;
    float _386 = _298 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _388 = fma(_382, (*spvDescriptorSet0.vp_c8)._m0[0].z, _370);
    float _390 = fma(_376, _376, _384);
    float _392 = _298 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _394 = fma(_366, _366, _390);
    float _396 = fma(_342, (*spvDescriptorSet0.vp_c8)._m0[1].z, _380);
    float _398 = -_386;
    float _400 = fma(_288, (*spvDescriptorSet0.vp_c8)._m0[0].x, _398);
    float _402 = _292 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _404 = rsqrt(_394);
    float _406 = -_396;
    float _408 = fma(_406, (*spvDescriptorSet0.vp_c8)._m0[0].w, _388);
    float _410 = fma(_336, (*spvDescriptorSet0.vp_c8)._m0[0].w, _400);
    float _412 = -_402;
    float _414 = fma(_288, (*spvDescriptorSet0.vp_c8)._m0[0].y, _412);
    float _416 = -_392;
    float _418 = fma(_292, (*spvDescriptorSet0.vp_c8)._m0[0].x, _416);
    float _420 = fma(_332, (*spvDescriptorSet0.vp_c8)._m0[0].w, _414);
    float _422 = 1.0 / _408;
    float _424 = fma(_342, (*spvDescriptorSet0.vp_c8)._m0[0].w, _418);
    float _426 = _374 * _404;
    float _428 = precise::clamp(_426, 0.0, 1.0);
    float _430 = -_428;
    float _432 = _430 + 1.0;
    float _434 = fma(_410, _422, -1.0);
    float _436 = _432 * _422;
    float _438 = fma(_432, _434, 1.0);
    float _440 = _420 * _436;
    float _442 = _424 * _436;
    float _444 = _438 * _438;
    float _446 = fma(_440, _440, _444);
    float _448 = in.m_69.x;
    float _450 = in.m_69.y;
    float _452 = in.m_69.z;
    float _454 = in.m_69.w;
    float _456 = fma(_442, _442, _446);
    float _458 = rsqrt(_456);
    float _460 = _442 * _458;
    float _462 = _212 * _450;
    float _464 = _438 * _458;
    float _466 = _440 * _458;
    float _468 = -_460;
    float _470 = _308 * _468;
    float _472 = fma(_210, _448, _462);
    float _474 = _310 * _464;
    float _476 = -_466;
    float _478 = -_470;
    float _480 = fma(_310, _476, _478);
    float _482 = -_466;
    float _484 = _312 * _482;
    float _486 = -_460;
    float _488 = -_474;
    float _490 = fma(_312, _486, _488);
    float _492 = fma(_214, _452, _472);
    float _494 = _480 * _480;
    float _496 = -_484;
    float _498 = fma(_308, _464, _496);
    float _500 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _502 = _264 + _500;
    float _504 = _492 + _454;
    float _506 = fma(_490, _490, _494);
    float _508 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _510 = _266 + _508;
    float _512 = in.m_59.x;
    float _514 = in.m_59.y;
    float _516 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _518 = _504 + _516;
    float _520 = fma(_498, _498, _506);
    float _522 = _518 * _518;
    float _524 = rsqrt(_520);
    float _526 = fma(_502, _502, _522);
    float _528 = fma(_510, _510, _526);
    float _530 = sqrt(_528);
    float _532 = _490 * _524;
    float _534 = _498 * _524;
    float _536 = _480 * _524;
    float _538 = _310 * _532;
    float _540 = _312 * _534;
    float _542 = rsqrt(_528);
    float _544 = -_538;
    float _546 = fma(_308, _534, _544);
    float _548 = -_540;
    float _550 = fma(_310, _536, _548);
    float _552 = _308 * _536;
    float _554 = _530 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _556 = _546 * _546;
    float _558 = -_552;
    float _560 = fma(_312, _532, _558);
    float _562 = fma(_550, _550, _556);
    float _564 = precise::min(_228, _554);
    float _566 = fma(_560, _560, _562);
    float _568 = _512 * 6.283185482025146484375;
    float _570 = _542 * _564;
    float _572 = _568 * 0.15915493667125701904296875;
    float _574 = rsqrt(_566);
    float _576 = _518 * _570;
    float _578 = _502 * _570;
    float _580 = -_576;
    float _582 = _518 + _580;
    float _584 = -_578;
    float _586 = _502 + _584;
    float _588 = in.m_67.x;
    float _590 = in.m_67.y;
    float _592 = _582 * _582;
    float _594 = _510 * _570;
    float _596 = _572 * 6.283185482025146484375;
    float _598 = cos(_596);
    float _600 = fma(_586, _586, _592);
    float _602 = -_594;
    float _604 = _510 + _602;
    float _606 = _560 * _574;
    float _608 = _546 * _574;
    float _610 = _550 * _574;
    float _612 = fma(_604, _604, _600);
    float _614 = _308 * _606;
    float _616 = _310 * _608;
    float _618 = _572 * 6.283185482025146484375;
    float _620 = sin(_618);
    float _622 = -_614;
    float _624 = fma(_310, _610, _622);
    float _626 = -_616;
    float _628 = fma(_312, _606, _626);
    float _630 = _312 * _610;
    float _632 = _624 * _624;
    float _634 = sqrt(_612);
    float _636 = -_630;
    float _638 = fma(_308, _608, _636);
    float _640 = fma(_628, _628, _632);
    float _642 = _598 * _590;
    float _644 = fma(_638, _638, _640);
    float _646 = _620 * _590;
    float _648 = fma(_620, _588, _642);
    float _650 = rsqrt(_644);
    float _652 = -_646;
    float _654 = fma(_598, _588, _652);
    float _656 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _648);
    float _658 = _542 * _634;
    float _660 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _654);
    float _662 = _238 * _658;
    float _664 = _216 * _658;
    float _666 = _240 * _658;
    float _668 = _662 * _656;
    float _670 = _664 * _660;
    float _672 = _638 * _650;
    float _674 = _666 * _244;
    float _676 = _668 * _606;
    float _678 = _668 * _610;
    float _680 = _628 * _650;
    float _682 = _668 * _608;
    float _684 = fma(_670, _672, _676);
    float _686 = _624 * _650;
    float _688 = fma(_670, _680, _678);
    float _690 = fma(_674, _310, _684);
    float _692 = fma(_670, _686, _682);
    float _694 = fma(_674, _308, _688);
    float _696 = _266 + _690;
    float _698 = fma(_674, _312, _692);
    float _700 = _264 + _694;
    float _702 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _704 = _696 + _702;
    float _706 = _254 + _698;
    float _708 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _710 = _700 + _708;
    float _712 = _704 * _704;
    float _714 = fma(_710, _710, _712);
    float _716 = sqrt(_714);
    bool _718 = _716 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _722 = _720 != 0;
    int _724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _726 = _724 != 0;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _730 = _728 != 0;
    bool _732 = !_726;
    int _734 = _732 ? 0 : 1;
    bool _736 = !_722;
    int _738 = _736 ? 0 : 1;
    bool _740 = !_730;
    int _742 = _740 ? 0 : 1;
    float _744 = _698;
    float _746 = _670;
    float _748 = _706;
    if (!_718)
    {
        _744 = _700;
    }
    float _750 = _744;
    float _752 = _750;
    if (!_718)
    {
        _746 = _696;
    }
    float _754 = _746;
    bool _756 = !_718;
    float _758 = _754;
    if (!_756)
    {
        float _760 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _762 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _764 = _716 + _762;
        float _766 = _706 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _768 = rsqrt(_714);
        float _770 = _764 * _760;
        float _772 = _770 * 0.15915493667125701904296875;
        float _774 = _772 * 6.283185482025146484375;
        float _776 = cos(_774);
        float _778 = _772 * 6.283185482025146484375;
        float _780 = sin(_778);
        float _782 = _776 + (-1.0);
        float _784 = fma(_780, _766, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _786 = _782 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _788 = _768 * _784;
        float _790 = fma(_706, _776, _786);
        float _792 = fma(_710, _788, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _794 = fma(_704, _788, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _752 = _792;
        _758 = _794;
        _748 = _790;
    }
    float _796 = _752;
    float _798 = _758;
    float _800 = _748;
    float _802 = -_578;
    float _804 = _802 + _796;
    float _806 = -_594;
    float _808 = _806 + _798;
    float _810 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _812 = _804 + _810;
    float _814 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _816 = _808 + _814;
    float _818 = fma(_812, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _820 = fma(_816, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _3818 = float2(_818, _820);
    float _822 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_3818, float2(0.0), isnan(_3818)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_3818, float2(0.0), isnan(_3818)), level(0.0)).x;
    float _824 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _826 = int(_824);
    int _828 = abs(_734);
    float _830 = -_578;
    float _832 = _264 + _830;
    int _834 = abs(_738);
    float _836 = -_594;
    float _838 = _266 + _836;
    int _840 = abs(_742);
    float _842 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _844 = _804 + _842;
    float _846 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _848 = int(_846);
    float _850 = in.m_71.y;
    float _852 = float(_826);
    float _854 = 1.0 / _852;
    float _856 = float(uint(_848));
    int _858 = ~_848;
    int _860 = _858 + 1;
    int _862 = ~_848;
    int _864 = _862 + 1;
    float _866 = 1.0 / _856;
    bool _868 = _848 == 0;
    float _870 = _126 * _854;
    float _872 = trunc(_870);
    int _874 = int(_872);
    int _876 = as_type<int>(_866) + (-2);
    float _878 = float(uint(_874));
    float _880 = as_type<float>(_876) * _878;
    float _882 = trunc(_880);
    float _884 = precise::max(_882, 0.0);
    uint _887 = uint(_884);
    float _889 = float(_848);
    int _891 = _860 * int(_887);
    int _893 = _891 + _874;
    float _895 = float(_874);
    float _897 = float(uint(_893));
    float _899 = as_type<float>(_876) * _897;
    int _901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _903 = _901 != 0;
    float _905 = trunc(_899);
    float _907 = precise::max(_905, 0.0);
    uint _909 = uint(_907);
    bool _911 = !_903;
    float _913 = _911 ? 7.345489978790283203125 : 1.0;
    float _915 = _913 * _512;
    int _917 = int(_887) + int(_909);
    float _919 = floor(_915);
    int _921 = _864 * _917;
    int _923 = _921 + _874;
    bool _925 = _895 >= _889;
    bool _927 = isnan(_895);
    bool _929 = _925 || _927;
    bool _931 = isnan(_889);
    bool _933 = _929 || _931;
    float _935 = float(_933);
    float _937 = _126 * _889;
    bool _939 = uint(_923) >= uint(_848);
    float _941 = _937 * _176;
    float _943 = trunc(_935);
    int _945 = int(_943);
    bool _947 = !_939;
    int _949 = _947 ? 0 : (-1);
    int _951 = ~_917;
    int _953 = _951 + _949;
    int _955 = _953 + 1;
    float _957 = -_919;
    float _959 = _915 + _957;
    float _961 = trunc(_941);
    int _963 = int(_961);
    int _965 = _848 + (-1);
    int _967 = _848 * _955;
    int _969 = _967 + _874;
    float _971 = _959 * _889;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _975 = _973 != 0;
    int _977 = ~_945;
    int _979 = _977 + 1;
    int _981 = _979 + 1;
    float _983 = trunc(_971);
    int _985 = int(_983);
    bool _987 = !_868;
    int _989 = _987 ? _969 : (-1);
    bool _991 = !_975;
    float _993 = _991 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _997 = _995 != 0;
    int _999 = _989 * _981;
    int _1001 = abs(as_type<int>(_993));
    int _1003 = _945 * _965;
    int _1005 = _1003 + _999;
    bool _1007 = !_997;
    int _1009 = _1007 ? 0 : 1;
    int _1011 = _1005 * _828;
    int _1013 = abs(_1009);
    int _1015 = _985 * _1001;
    int _1017 = _1015 + _874;
    float _1019 = -_576;
    float _1021 = _1019 + _800;
    int _1023 = _963 * _834;
    int _1025 = _1023 + _1011;
    int _1027 = _1017 * _840;
    int _1029 = _1027 + _1025;
    int _1031 = _985 * _1013;
    int _1033 = _1031 + _1029;
    float _1035 = fma(_822, 100.0, _1021);
    float _1037 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1039 = _808 + _1037;
    float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1043 = _1035 + _1041;
    float _1045 = _1043 * _1043;
    float _1047 = fma(_844, _844, _1045);
    float _1049 = fma(_1039, _1039, _1047);
    float _1051 = rsqrt(_1049);
    float _1053 = _1051 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1055 = _844 * _1053;
    float _1057 = _1039 * _1053;
    float _1059 = _1055 * _1055;
    float _1061 = _1057 * _1057;
    float _1063 = _1059 + _1061;
    float _1065 = sqrt(_1063);
    bool _1067 = _1065 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1069 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1071 = _1065 + _1069;
    float _1073 = _1039;
    float _1075 = _993;
    float _1077 = _1071;
    float _1079 = _971;
    float _1081 = _1043;
    float _1083 = _1049;
    if (_1067)
    {
        float _1085 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1073 = _1085;
    }
    float _1087 = _1073;
    if (_1067)
    {
        float _1089 = rsqrt(_1063);
        _1075 = _1089;
    }
    float _1091 = _1075;
    float _1093 = _1091;
    if (_1067)
    {
        float _1095 = _1071 * _1087;
        _1077 = _1095;
    }
    float _1097 = _1077;
    if (_1067)
    {
        float _1099 = _1097 * 0.15915493667125701904296875;
        _1079 = _1099;
    }
    float _1101 = _1079;
    float _1103 = as_type<float>(_1011);
    float _1105 = _1101;
    if (_1067)
    {
        float _1107 = _1101 * 6.283185482025146484375;
        float _1109 = sin(_1107);
        _1103 = _1109;
    }
    float _1111 = _1103;
    float _1113 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1115 = precise::max(0.0, _1113);
    float _1117 = _1051;
    float _1119 = _1115;
    if (_1067)
    {
        float _1121 = _1101 * 6.283185482025146484375;
        float _1123 = cos(_1121);
        _1117 = _1123;
    }
    float _1125 = _1117;
    float _1127 = -_1053;
    float _1129 = -_1115;
    float _1131 = fma(_1043, _1127, _1129);
    float _1133 = sqrt(_1049);
    float _1135 = _1131;
    if (_1067)
    {
        float _1137 = _1131 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1119 = _1137;
    }
    float _1139 = _1119;
    float _1141 = _1139;
    float _1143 = _1111;
    if (_1067)
    {
        float _1145 = fma(_1111, _1139, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1141 = _1145;
    }
    float _1147 = _1141;
    if (_1067)
    {
        float _1149 = _1125 + (-1.0);
        _1081 = _1149;
    }
    float _1151 = _1081;
    if (_1067)
    {
        float _1153 = _1091 * _1147;
        _1105 = _1153;
    }
    float _1155 = _1105;
    if (!_1067)
    {
        _1093 = _1055;
    }
    float _1157 = _1093;
    float _1159 = _1157;
    if (_1067)
    {
        float _1161 = _1151 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1143 = _1161;
    }
    float _1163 = _1143;
    float _1165 = _1163;
    if (_1067)
    {
        float _1167 = _1055 * _1155;
        _1159 = _1167;
    }
    float _1169 = _1159;
    if (!_1067)
    {
        _1083 = _1059;
    }
    float _1171 = _1083;
    float _1173 = fma(_832, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1175 = _1171;
    if (_1067)
    {
        float _1177 = fma(_1131, _1125, _1163);
        _1135 = _1177;
    }
    float _1179 = _1135;
    float _1181 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1183 = fma(_1133, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1181);
    float _1185 = precise::clamp(_1183, 0.0, 1.0);
    float _1187 = _1185;
    if (!_1067)
    {
        _1165 = _1057;
    }
    float _1189 = _1165;
    float _1191 = _1189;
    if (_1067)
    {
        float _1193 = _1057 * _1155;
        _1191 = _1193;
    }
    float _1195 = _1191;
    if (_1067)
    {
        float _1197 = _1169 * _1169;
        _1175 = _1197;
    }
    float _1199 = _1175;
    float _1201 = -_1185;
    float _1203 = _1201 + 1.0;
    if (!_1067)
    {
        _1187 = _1061;
    }
    float _1205 = _1187;
    float _1207 = _1205;
    if (_1067)
    {
        float _1209 = _1195 * _1195;
        _1207 = _1209;
    }
    float _1211 = _1207;
    float _1213 = fma(_1179, _1179, _1199);
    float _1215 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1217 = abs(_1203);
    float _1219 = log2(_1217);
    float _1221 = _1213 + _1211;
    float _1223 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1215);
    float _1225 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1227 = float(uint(_1033));
    float _1229 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1223);
    float _1231 = rsqrt(_1221);
    float _1233 = fma(_838, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1235 = _1229 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1237 = as_type<float>(_876) * _1227;
    float _1239 = _1235 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1241 = _1219 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1243 = floor(_1173);
    float _1245 = -_1239;
    float _1247 = fma(_1245, _1225, 1.0);
    float _1249 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1251 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1249);
    float _1253 = _1231 * _1169;
    float _1255 = _1231 * _1179;
    float _1257 = _1231 * _1195;
    float _1259 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1261 = _1253 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1263 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1251);
    float _1265 = exp2(_1241);
    float _1267 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1259);
    float _1269 = -_1261;
    float _1271 = fma(_1255, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1269);
    float _1273 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1275 = _1263 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1277 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1267);
    float _1279 = -_1257;
    float _1281 = fma(_1279, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1271);
    float _1283 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1273);
    float _1285 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1287 = _1277 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1289 = floor(_1233);
    float _1291 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1283);
    float _1293 = -_1243;
    float _1295 = _1173 + _1293;
    float _1297 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1285);
    float _1299 = fma(_1281, -0.5, 0.5);
    float _1301 = _1291 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1303 = _1255 + 1.0;
    float _1305 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1297);
    float _1307 = log2(_1247);
    float _1309 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1311 = -_1255;
    float _1313 = fma(_1265, _1303, _1311);
    float _1315 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1305);
    float _1317 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1319 = fma(_1281, 0.5, 0.5);
    int _1321 = ~_848;
    int _1323 = _1321 + 1;
    float _1325 = fma(_1313, 0.5, 0.5);
    float _1327 = 1.0 / _1315;
    float _1329 = -_1289;
    float _1331 = _1233 + _1329;
    float _1333 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1309);
    float _1335 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1317);
    float _1337 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1333);
    float _1339 = sqrt(_1299);
    float _1341 = fma(_1319, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1343 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1335);
    float _1345 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1337);
    float _1347 = _1307 * 0.693147182464599609375;
    float _1349 = fma(_1319, _1341, -0.212114393711090087890625);
    float _1351 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1343);
    float _1353 = trunc(_1237);
    float _1355 = precise::max(_1353, 0.0);
    uint _1357 = uint(_1355);
    float _1359 = _1345 * _1327;
    float _1361 = fma(_1319, _1349, 1.570728778839111328125);
    float _1363 = _1351 * _1327;
    float _1365 = _1347 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1367 = fma(_1359, 0.5, 0.5);
    float _1369 = fma(_1363, -0.5, 0.5);
    float _1371 = _1339 * 0.636619746685028076171875;
    float2 _4661 = float2(_1295, _1331);
    float _1373 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4661, float2(0.0), isnan(_4661)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4661, float2(0.0), isnan(_4661)), level(0.0)).x;
    float _1375 = -_1361;
    float _1377 = fma(_1371, _1375, 1.0);
    int _1379 = _1323 * int(_1357);
    int _1381 = _1379 + _1033;
    float3 _4682 = float3(_1367, _1369, _1365);
    float _1383 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4682, float3(0.0), isnan(_4682)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4682, float3(0.0), isnan(_4682)), level(0.0)).x;
    float _1385 = float(uint(_1381));
    float3 _4696 = float3(_1367, _1369, _1365);
    float4 _1388 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4696, float3(0.0), isnan(_4696)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4696, float3(0.0), isnan(_4696)), level(0.0)).xyzw;
    float _1390 = _1388.x;
    float _1392 = _1388.y;
    float _1394 = _1388.z;
    float _1396 = _1388.w;
    float2 _4712 = float2(_1377, _1325);
    float3 _1400 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4712, float2(0.0), isnan(_4712)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4712, float2(0.0), isnan(_4712)), level(0.0)).xyz;
    float _1402 = _1400.x;
    float _1404 = _1400.y;
    float _1406 = _1400.z;
    float _1408 = as_type<float>(_876) * _1385;
    float _1410 = -_576;
    float _1412 = _1410 + _254;
    int _1414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1416 = _1414 != 0;
    float _1418 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1420 = trunc(_1408);
    float _1422 = precise::max(_1420, 0.0);
    uint _1424 = uint(_1422);
    int _1426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1428 = _1426 != 0;
    out.m_73.w = _564;
    int _1430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1432 = _1430 != 0;
    float _1434 = _512 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1436 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1418);
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1440 = _1438 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1442 = _514 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1446 = -_850;
    float _1448 = _1446 + 1.0;
    float _1450 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1452 = _1450 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1454 = fma(_1442, -2.0, _1444);
    float _1456 = 1.0 / _1440;
    float _1458 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1460 = int(_1357) + int(_1424);
    float _1462 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1464 = _1462 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1466 = ~_848;
    int _1468 = _1466 + 1;
    float _1470 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1472 = _514 > 0.5;
    float _1474 = 1.0 / _1452;
    float _1476 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1458);
    int _1478 = _1468 * _1460;
    int _1480 = _1478 + _1033;
    float _1482 = -_1470;
    float _1484 = fma(_1434, 2.0, _1482);
    float _1486 = _850;
    float _1488 = _1315;
    float _1490 = _1351;
    if (_1428)
    {
        float _1492 = _1472 ? _1448 : _850;
        _1486 = _1492;
    }
    float _1494 = _1486;
    float _1496 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1498 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1496;
    float _1500 = 1.0 / _1464;
    float _1502 = _1408;
    if (_1416)
    {
        float _1504 = in.m_59.x;
        _1502 = _1504;
    }
    float _1506 = _1502;
    float _1508 = _1498 * _1456;
    float _1510 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1512 = uint(_1480) >= uint(_848);
    float _1514 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1516 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1514;
    float _1518 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1520 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1522 = _1516 * _1474;
    float _1524 = float(uint(_1017));
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1528 = _1510 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1530 = _1518 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1532 = _1520 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1534 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1536 = _1534 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1538 = as_type<float>(_876) * _1524;
    int _1540 = ~_848;
    int _1542 = _1540 + 1;
    float _1544 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1546 = _208 + _1544;
    out.m_75.x = _1528;
    out.m_75.y = _1530;
    out.m_75.z = _1532;
    out.m_75.w = _1526;
    float _1548 = _1536 * _1500;
    bool _1550 = !_1512;
    int _1552 = _1550 ? 0 : (-1);
    float _1554 = fma(_1508, _1546, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1556 = _1506 > 0.5;
    bool _1558 = _1556 && _1416;
    float _1560 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1562 = _208 + _1560;
    int _1564 = ~_1460;
    int _1566 = _1564 + _1552;
    int _1568 = _1566 + 1;
    float _1570 = fma(_822, 100.0, _1412);
    float _1572 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1574 = fma(_1548, _1562, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    out.m_77.y = _648;
    int _1576 = _848 * _1568;
    int _1578 = _1576 + _1033;
    bool _1580 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1582 = isnan(_208);
    bool _1584 = _1580 || _1582;
    bool _1586 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1588 = _1584 || _1586;
    float _1590 = float(_1588);
    float _1592 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1572);
    float _1594 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1454);
    float _1596 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1436);
    float _1598 = -_126;
    float _1600 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1484);
    float _1602 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1476);
    float _1604 = in.m_71.x;
    float _1606 = trunc(_1538);
    float _1608 = precise::max(_1606, 0.0);
    uint _1610 = uint(_1608);
    bool _1612 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1614 = isnan(_208);
    bool _1616 = _1612 || _1614;
    bool _1618 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1620 = _1616 || _1618;
    float _1622 = float(_1620);
    float _1624 = -_1590;
    float _1626 = _1624 + 1.0;
    bool _1628 = !_868;
    int _1630 = _1628 ? _1578 : (-1);
    float _1632 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1592);
    bool _1634 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1636 = isnan(_208);
    bool _1638 = _1634 || _1636;
    bool _1640 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1642 = _1638 || _1640;
    float _1644 = float(_1642);
    float _1646 = -_1622;
    float _1648 = _1646 + 1.0;
    int _1650 = _1630 >> 31;
    float _1652 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1632);
    float _1654 = _1590 * _1648;
    bool _1656 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1658 = isnan(_208);
    bool _1660 = _1656 || _1658;
    bool _1662 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1664 = _1660 || _1662;
    float _1666 = float(_1664);
    float _1668 = -_1644;
    float _1670 = _1668 + 1.0;
    int _1672 = _1650 & 3;
    float _1674 = _1644 * _1626;
    out.m_79.x = _664;
    int _1676 = _1542 * int(_1610);
    int _1678 = _1676 + _1017;
    float _1680 = _1666 * _1670;
    int _1682 = _1630 + _1672;
    float _1684 = _1219 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_81.x = _832;
    out.m_81.y = _1570;
    out.m_81.z = _838;
    float _1686 = float(uint(_1678));
    float _1688 = _1554 * _1680;
    int _1690 = _1682 >> 2;
    out.gl_Position.x = _1345;
    out.gl_Position.y = _1351;
    out.gl_Position.z = _1652;
    out.gl_Position.w = _1315;
    float _1692 = _1554;
    float _1694 = as_type<float>(_1682);
    if (_1416)
    {
        _1692 = _1604;
    }
    float _1696 = _1692;
    float _1698 = as_type<float>(_876) * _1686;
    float _1700 = _1696;
    if (!_1416)
    {
        _1694 = _1604;
    }
    float _1702 = _1694;
    float _1704 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1706 = _208 + _1704;
    int _1708 = _1690 << 4;
    int _1710 = _1708 + 368;
    float _1712 = trunc(_1698);
    float _1714 = precise::max(_1712, 0.0);
    uint _1716 = uint(_1714);
    float _1718 = -_1666;
    float _1720 = _1718 + 1.0;
    float _1722 = _1702;
    if (_1558)
    {
        float _1724 = -_1696;
        float _1726 = _1724 + 1.0;
        _1700 = _1726;
    }
    float _1728 = _1700;
    uint _1730 = uint(int(uint(_1710) >> uint(2)));
    uint _1732 = uint(int(uint(int(_1730)) >> uint(2)));
    int _1734 = int(_1730) & 3;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[int(_1732)][_1734];
    int _1738 = int(_1730) + 1;
    uint _1740 = uint(int(uint(_1738) >> uint(2)));
    int _1742 = _1738 & 3;
    float _1744 = (*spvDescriptorSet0.vp_c9)._m0[int(_1740)][_1742];
    int _1746 = _1630 & 3;
    bool _1748 = _1746 != 0;
    float _1750 = fma(_1720, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1688);
    int _1752 = _1630 & 3;
    bool _1754 = _1752 != 0;
    float _1756 = fma(_1522, _1706, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    if (_1416)
    {
        _1722 = _1728;
    }
    float _1758 = _1722;
    float _1760 = fma(_1574, _1674, _1750);
    float _1762 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    bool _1764 = uint(_1752) > 1u;
    float _1766 = exp2(_1684);
    float _1768 = fma(_1758, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1770 = fma(_1756, _1654, _1760);
    bool _1772 = _1752 != 3;
    float _1774 = -_1594;
    float _1776 = fma(_1602, _1762, _1774);
    int _1778 = int(_1610) + int(_1716);
    float _1780 = fma(_1596, _1768, _1600);
    int _1782 = _1710 + 8;
    uint _1784 = uint(int(uint(_1782) >> uint(2)));
    uint _1786 = uint(int(uint(int(_1784)) >> uint(2)));
    int _1788 = int(_1784) & 3;
    float _1790 = (*spvDescriptorSet0.vp_c9)._m0[int(_1786)][_1788];
    int _1792 = int(_1784) + 1;
    uint _1794 = uint(int(uint(_1792) >> uint(2)));
    int _1796 = _1792 & 3;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[int(_1794)][_1796];
    int _1800 = _1748 ? 0 : 1;
    float _1802 = fma(_1622, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1770);
    float _1804 = _1776 + 0.5;
    int _1806 = ~_1800;
    int _1808 = _1806 + 1;
    int _1810 = _1808 + 1;
    float _1812 = _1802 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1814 = _1810;
    if (!_1764)
    {
        int _1816 = ~_1800;
        int _1818 = _1816 + 1;
        _1814 = _1818;
    }
    int _1820 = _1814;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1824 = uint(_1752) >= 2u;
    float _1826 = _1780 + 0.5;
    float _1828 = _1822 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1830 = abs(_1820);
    float _1832 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1834 = _1824 ? 0 : 1;
    float _1836 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1838 = ~_848;
    int _1840 = _1838 + 1;
    float _1842 = _1832 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1844 = ~_1834;
    int _1846 = _1844 + 1;
    int _1848 = _1846 + 1;
    float _1850 = _1836 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1852 = _1848;
    if (_1772)
    {
        int _1854 = ~_1834;
        int _1856 = _1854 + 1;
        _1852 = _1856;
    }
    int _1858 = _1852;
    int _1860 = _1840 * _1778;
    int _1862 = _1860 + _1017;
    bool _1864 = !_1754;
    int _1866 = _1864 ? 0 : 1;
    out.m_83.x = _1826;
    out.m_83.y = _1804;
    int _1868 = ~_1830;
    int _1870 = _1868 + 1;
    int _1872 = _1870 + 1;
    int _1874 = abs(_1866);
    out.m_85.x = _1828;
    out.m_85.y = _1842;
    out.m_85.z = _1850;
    out.m_85.w = _1812;
    bool _1876 = _1752 != 3;
    int _1878 = _1872 * as_type<int>(_1744);
    bool _1880 = uint(_1862) >= uint(_848);
    float _1882 = in.m_87.x;
    float _1884 = in.m_87.y;
    float _1886 = in.m_87.z;
    bool _1888 = !_1432;
    int _1890 = _1888 ? 0 : 1;
    bool _1892 = _648 != 0.0;
    bool _1894 = isnan(_648);
    bool _1896 = _1892 || _1894;
    bool _1898 = isnan(0.0);
    bool _1900 = _1896 || _1898;
    bool _1902 = _654 == 0.0;
    bool _1904 = !_1900;
    bool _1906 = _1902 && _1904;
    bool _1908 = !_1876;
    int _1910 = _1908 ? 0 : (-1);
    int _1912 = abs(_1858);
    int _1914 = ~_1874;
    int _1916 = _1914 + 1;
    int _1918 = _1916 + 1;
    int _1920 = abs(_1910);
    bool _1922 = !_1880;
    int _1924 = _1922 ? 0 : (-1);
    int _1926 = _1918 * as_type<int>(_1736);
    int _1928 = _1926 + _1878;
    int _1930 = ~_1912;
    int _1932 = _1930 + 1;
    int _1934 = _1932 + 1;
    int _1936 = abs(_1890);
    int _1938 = ~_1778;
    int _1940 = _1938 + _1924;
    int _1942 = _1940 + 1;
    int _1944 = _1934 * as_type<int>(_1790);
    int _1946 = _1944 + _1928;
    int _1948 = ~_1920;
    int _1950 = _1948 + 1;
    int _1952 = _1950 + 1;
    float _1954 = _1315 * 0.5;
    int _1956 = ~_1936;
    int _1958 = _1956 + 1;
    int _1960 = _1958 + 1;
    int _1962 = _848 * _1942;
    int _1964 = _1962 + _1017;
    bool _1966 = _244 == 0.0;
    bool _1968 = _1966 && _1906;
    int _1970 = _1952 * as_type<int>(_1798);
    int _1972 = _1970 + _1946;
    float _1974 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1976 = _1972 * _1960;
    bool _1978 = !_868;
    int _1980 = _1978 ? _1964 : (-1);
    float _1982 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1974);
    int _1984 = _1980 * _1936;
    int _1986 = _1984 + _1976;
    float _1988 = fma(_838, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1982);
    float _1990 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1992 = _1884;
    float _1994 = _1882;
    float _1996 = _1886;
    if (!_1968)
    {
        float _1998 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1884);
        _1992 = _1998;
    }
    float _2000 = _1992;
    float _2002 = _1988 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2004 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1990);
    float _2006 = float(_1986);
    if (!_1968)
    {
        float _2008 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1882);
        _1994 = _2008;
    }
    float _2010 = _1994;
    float _2012 = 1.0 / _2002;
    float _2014 = fma(_838, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2004);
    if (!_1968)
    {
        float _2016 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1886);
        _1996 = _2016;
    }
    float _2018 = _1996;
    out.m_89.x = _2006;
    float _2020 = _610 * _2000;
    float _2022 = _2014 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2024 = _608 * _2000;
    float _2026 = _606 * _2000;
    float _2028 = fma(_680, _2010, _2020);
    float _2030 = _2022 + _2002;
    float _2032 = _1652 + _1315;
    float _2034 = fma(_686, _2010, _2024);
    float _2036 = fma(_672, _2010, _2026);
    float _2038 = _2032 * 0.5;
    float _2040 = fma(_308, _2018, _2028);
    float _2042 = _2030 * _2012;
    float _2044 = _2042 * 0.5;
    float _2046 = fma(_312, _2018, _2034);
    float _2048 = fma(_310, _2018, _2036);
    float _2050 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2052 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2050);
    float _2054 = 1.0 / _2052;
    float _2056 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2058 = _2054 * _2056;
    float _2060 = fma(_1351, -0.5, _1954);
    float _2062 = abs(_2058);
    float _2064 = log2(_2062);
    bool _2066 = _2058 <= 8000.0;
    bool _2068 = isnan(_2058);
    bool _2070 = _2066 || _2068;
    bool _2072 = isnan(8000.0);
    bool _2074 = _2070 || _2072;
    float _2076 = float(_2074);
    float _2078 = _2064 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2080 = _1345 + _1315;
    float _2082 = _2080 * 0.5;
    float _2084 = exp2(_2078);
    out.m_91.x = _2082;
    out.m_91.y = _2060;
    out.m_91.z = _2038;
    out.m_91.w = _1315;
    float _2086 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2088 = precise::clamp(_2086, 0.0, 1.0);
    float _2090 = in.m_65.x;
    float _2092 = fma(_2088, -2.0, 3.0);
    float _2094 = _2088 * _2088;
    bool _2096 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2098 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2100 = _2096 || _2098;
    bool _2102 = isnan(0.5);
    bool _2104 = _2100 || _2102;
    float _2106 = _2094 * _2092;
    float _2108 = -_2106;
    float _2110 = _2108 + 1.0;
    float _2112 = fma(_2110, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2106);
    float _2114 = _2076 * _2112;
    float _2116 = _2076;
    float _2118 = _2112;
    if (_2104)
    {
        _2116 = 1.0;
    }
    float _2120 = _2116;
    float _2122 = _2120;
    if (_2104)
    {
        _2118 = 1.0;
    }
    float _2124 = _2118;
    float _2126 = _2124;
    if (!_2104)
    {
        float _2128 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2130 = _2128 * 0.15915493667125701904296875;
        float _2132 = _2130 * 6.283185482025146484375;
        float _2134 = cos(_2132);
        float _2136 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2138 = _2136 * 0.15915493667125701904296875;
        float _2140 = _2130 * 6.283185482025146484375;
        float _2142 = sin(_2140);
        float _2144 = 1.0 / _2134;
        float _2146 = _2138 * 6.283185482025146484375;
        float _2148 = cos(_2146);
        float _2150 = _2142 * _2144;
        float _2152 = _2138 * 6.283185482025146484375;
        float _2154 = sin(_2152);
        float _2156 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2158 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2156;
        float _2160 = _2148 * _2150;
        float _2162 = 1.0 / _2158;
        float _2164 = 1.0 / _2160;
        float _2166 = _2154 * _2164;
        float _2168 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2170 = fma(_2058, _2166, _2168);
        float _2172 = _2170 * _2162;
        float _2174 = precise::clamp(_2172, 0.0, 1.0);
        _2126 = _2174;
        _1488 = _2150;
        _1490 = _2144;
    }
    float _2176 = _2126;
    float _2178 = _1488;
    float _2180 = _1490;
    float _2182 = _2178;
    float _2184 = _2180;
    if (!_2104)
    {
        float _2186 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2188 = _2186 * 0.15915493667125701904296875;
        float _2190 = _2188 * 6.283185482025146484375;
        float _2192 = cos(_2190);
        float _2194 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2196 = _2194 * 0.15915493667125701904296875;
        float _2198 = _2188 * 6.283185482025146484375;
        float _2200 = sin(_2198);
        float _2202 = 1.0 / _2192;
        float _2204 = _2196 * 6.283185482025146484375;
        float _2206 = cos(_2204);
        float _2208 = _2200 * _2202;
        float _2210 = _2196 * 6.283185482025146484375;
        float _2212 = sin(_2210);
        float _2214 = _2206 * _2208;
        float _2216 = 1.0 / _2214;
        float _2218 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2220 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2218;
        float _2222 = 1.0 / _2220;
        float _2224 = _2212 * _2216;
        float _2226 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2228 = fma(_2058, _2224, _2226);
        float _2230 = _2228 * _2222;
        float _2232 = precise::clamp(_2230, 0.0, 1.0);
        float _2234 = -_2232;
        float _2236 = _2234 + 1.0;
        _2122 = _2236;
        _2182 = _2216;
        _2184 = _2222;
    }
    float _2238 = _2122;
    float _2240 = _2182;
    float _2242 = _2184;
    float _2244 = -_1766;
    float _2246 = _2244 + 1.0;
    float _2248 = _2114 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2250 = -_1373;
    float _2252 = _2250 + 1.0;
    float _2254 = _2246 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_93.x = _2040;
    out.m_93.y = _2046;
    out.m_93.z = _2048;
    float _2256 = _2252 * _2248;
    float _2258 = precise::clamp(_2256, 0.0, 1.0);
    bool _2260 = _1133 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2262 = isnan(_1133);
    bool _2264 = _2260 || _2262;
    bool _2266 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2268 = _2264 || _2266;
    float _2270 = _2254 * _1383;
    float _2272 = -_2254;
    float _2274 = _2272 + 1.0;
    float _2276 = -_2258;
    float _2278 = fma(_2276, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_95.x = _804;
    out.m_95.y = _1035;
    out.m_95.z = _808;
    float _2280 = _1396 * _2270;
    float _2282 = _1406 * _2270;
    float _2284 = _2278 * _2090;
    float _2286 = _2176 * _2238;
    float _2288 = fma(_1402, _2280, _1390);
    float _2290 = fma(_1404, _2280, _1392);
    float _2292 = _1396 * _2274;
    float _2294 = fma(_1396, _2282, _1394);
    float _2296 = _2284 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2298 = _2240;
    float _2300 = _2270;
    float _2302 = _2242;
    float _2304 = _2274;
    float _2306 = _2280;
    float _2308 = _2296;
    if (!_2268)
    {
        _2298 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2310 = _2298;
    float _2312 = _2286 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_97.x = _2288;
    out.m_97.y = _2290;
    out.m_97.z = _2294;
    out.m_97.w = _2292;
    float _2314 = _2310;
    float _2316 = _2310;
    if (!_2268)
    {
        _2300 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2318 = _2300;
    float _2320 = _2318;
    float _2322 = _2318;
    if (!_2268)
    {
        _2302 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2324 = _2302;
    out.m_99.x = _2296;
    float _2326 = _2324;
    float _2328 = _2324;
    if (!_2268)
    {
        _2304 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2330 = _2304;
    float _2332 = _2330;
    float _2334 = _2330;
    if (!_2268)
    {
        _2306 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2336 = _2306;
    float _2338 = _2336;
    float _2340 = _2336;
    if (!_2268)
    {
        _2308 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2342 = _2308;
    bool _2344 = !_2268;
    float _2346 = _2342;
    float _2348 = _2342;
    if (!_2344)
    {
        bool _2350 = _1133 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2352 = isnan(_1133);
        bool _2354 = _2350 || _2352;
        bool _2356 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2358 = _2354 || _2356;
        if (!_2358)
        {
            float _2360 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2362 = _1133 + _2360;
            float _2364 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2366 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2364;
            float _2368 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2370 = _2368 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2372 = 1.0 / _2366;
            float _2374 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2376 = _2374 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2378 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2380 = _2378 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2382 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2384 = _2382 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2386 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2388 = _2386 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2390 = _2362 * _2372;
            float _2392 = precise::clamp(_2390, 0.0, 1.0);
            float _2394 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2396 = _2394 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2398 = fma(_2392, _2370, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2400 = fma(_2392, _2396, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2402 = fma(_2392, _2376, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2404 = fma(_2392, _2380, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2406 = fma(_2392, _2384, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2408 = fma(_2392, _2388, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2322 = _2402;
            _2340 = _2406;
            _2316 = _2398;
            _2334 = _2404;
            _2328 = _2400;
            _2348 = _2408;
            _2410 = true;
        }
        else
        {
            bool _2412 = _1133 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2414 = isnan(_1133);
            bool _2416 = _2412 || _2414;
            bool _2418 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2420 = _2416 || _2418;
            if (!_2420)
            {
                _2314 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2422 = _2314;
            _2316 = _2422;
            if (!_2420)
            {
                _2320 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2424 = _2320;
            _2322 = _2424;
            if (!_2420)
            {
                _2326 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2426 = _2326;
            _2328 = _2426;
            if (!_2420)
            {
                _2332 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2428 = _2332;
            _2334 = _2428;
            if (!_2420)
            {
                _2338 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2430 = _2338;
            _2340 = _2430;
            if (!_2420)
            {
                _2346 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2432 = _2346;
            bool _2434 = !_2420;
            _2348 = _2432;
            if (!_2434)
            {
                bool _2436 = _1133 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2438 = isnan(_1133);
                bool _2440 = _2436 || _2438;
                bool _2442 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2444 = _2440 || _2442;
                if (!_2444)
                {
                    float _2446 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2448 = _1133 + _2446;
                    float _2450 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2452 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2450;
                    float _2454 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2456 = _2454 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2458 = 1.0 / _2452;
                    float _2460 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2462 = _2460 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2464 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2466 = _2464 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2468 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2470 = _2468 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2472 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2474 = _2472 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2476 = _2448 * _2458;
                    float _2478 = precise::clamp(_2476, 0.0, 1.0);
                    float _2480 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2482 = _2480 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2484 = fma(_2478, _2456, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2486 = fma(_2478, _2482, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2488 = fma(_2478, _2462, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2490 = fma(_2478, _2466, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2492 = fma(_2478, _2470, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2494 = fma(_2478, _2474, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2322 = _2488;
                    _2340 = _2492;
                    _2316 = _2484;
                    _2334 = _2490;
                    _2328 = _2486;
                    _2348 = _2494;
                    _2410 = true;
                }
                else
                {
                    _2322 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2340 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2316 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2334 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2328 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2348 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2410 = false;
    float _2496 = _2322;
    float _2498 = _2340;
    float _2500 = _2316;
    float _2502 = _2334;
    float _2504 = _2328;
    float _2506 = _2348;
    float _2508 = fma(_2046, -0.5, 0.5);
    float _2510 = precise::clamp(_2508, 0.0, 1.0);
    float _2512 = -_2496;
    float _2514 = _2512 + _2498;
    float _2516 = _2312 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2518 = -_2500;
    float _2520 = _2518 + _2502;
    out.m_101.x = 0.0;
    float _2522 = fma(_2510, _2514, _2496);
    float _2524 = fma(_2510, _2520, _2500);
    out.m_55.x = _2516;
    float _2526 = -_2504;
    float _2528 = _2526 + _2506;
    float _2530 = _2522 * 0.586610972881317138671875;
    bool _2532 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2534 = fma(_2510, _2528, _2504);
    float _2536 = fma(_2524, 0.298911988735198974609375, _2530);
    bool _2538 = _2176 > 0.0;
    bool _2540 = isnan(_2176);
    bool _2542 = _2538 || _2540;
    bool _2544 = isnan(0.0);
    bool _2546 = _2542 || _2544;
    float _2548 = fma(_2534, 0.114477999508380889892578125, _2536);
    bool _2550 = _2238 <= 0.0;
    bool _2552 = !_2546;
    bool _2554 = _2550 || _2552;
    float _2556 = -_2548;
    float _2558 = _2524 + _2556;
    float _2560 = -_2548;
    float _2562 = _2522 + _2560;
    float _2564 = -_2548;
    float _2566 = _2534 + _2564;
    float _2568 = fma(_2558, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2548);
    float _2570 = fma(_2562, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2548);
    float _2572 = fma(_2566, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2548);
    bool _2574 = !_2532;
    if (!_2574)
    {
        float _2576 = -_1035;
        float _2578 = _2576 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2580 = -_804;
        float _2582 = _2580 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2584 = -_808;
        float _2586 = _2584 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2588 = _2578 * _2578;
        float _2590 = fma(_2582, _2582, _2588);
        float _2592 = fma(_2586, _2586, _2590);
        float _2594 = sqrt(_2592);
        float _2596 = rsqrt(_2592);
        float _2598 = -_2594;
        float _2600 = _2598 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2602 = _2600 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2604 = precise::clamp(_2602, 0.0, 1.0);
        float _2606 = _2582 * _2596;
        float _2608 = _2578 * _2596;
        float _2610 = abs(_2604);
        float _2612 = log2(_2610);
        float _2614 = _2586 * _2596;
        float _2616 = _2606 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2618 = _2046 * _2608;
        float _2620 = -_2608;
        float _2622 = -_2616;
        float _2624 = fma(_2620, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2622);
        float _2626 = fma(_2040, _2606, _2618);
        float _2628 = -_2614;
        float _2630 = fma(_2628, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2624);
        float _2632 = fma(_2048, _2614, _2626);
        float _2634 = precise::clamp(_2632, 0.0, 1.0);
        float _2636 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2638 = _2630 + _2636;
        float _2640 = _2612 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2642 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2644 = precise::clamp(_2642, 0.0, 1.0);
        float _2646 = exp2(_2640);
        float _2648 = _2646 * _2644;
        float _2650 = _2634 * _2648;
        float _2652 = _2650 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2654 = _2650 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2656 = _2650 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _2652;
        out.m_101.y = _2654;
        out.m_101.z = _2656;
    }
    out.m_73.x = _2568;
    out.m_73.y = _2570;
    out.m_73.z = _2572;
    if (!_2554)
    {
        return out;
    }
    out.m_55.x = 0.0;
    float _2658 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2658;
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
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2410 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_48.w;
    float _117 = in.m_50.w;
    float _119 = trunc(_115);
    int _122 = int(_119);
    float _124 = -_117;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _126;
    bool _130 = _122 >= 1;
    float _132 = 0.0;
    float _134 = as_type<float>(_122);
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _132;
    if (!_130)
    {
        out.m_55.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _136 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2726 = as_type<float>(_142);
        out.gl_Position.z = _2726;
    }
    if (!_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _146 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_117);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    float _156 = float(_122);
    bool _158 = _126 >= _156;
    bool _160 = !_154;
    bool _162 = _158 || _160;
    if (_162)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _134;
    if (_162)
    {
        out.m_55.x = 0.0;
    }
    if (_162)
    {
        float _166 = _164 * 5.0;
        _144 = as_type<int>(_166);
    }
    int _168 = _144;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2781 = as_type<float>(_168);
        out.gl_Position.z = _2781;
    }
    if (_162)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _170 = in.m_57.x;
    float _172 = in.m_57.y;
    float _174 = in.m_57.z;
    float _176 = 1.0 / _156;
    bool _178 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _180 = _126 * _176;
    float _182 = _170 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _184 = _172 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _186 = _174 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _188 = !_178;
    float _190 = _180;
    if (!_188)
    {
        float _192 = in.m_59.x;
        float _194 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _198 = fma(_196, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _200 = _198 * _194;
        float _202 = floor(_200);
        float _204 = -_202;
        float _206 = _200 + _204;
        _190 = _206;
    }
    float _208 = _190;
    float _210 = in.m_48.x;
    float _212 = in.m_48.y;
    float _214 = in.m_48.z;
    float _216 = _182 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _218 = in.m_61.x;
    float _220 = in.m_61.y;
    float _222 = in.m_61.z;
    float _224 = in.m_61.w;
    float _226 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _228 = _216 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _230 = in.m_63.x;
    float _232 = in.m_63.y;
    float _234 = in.m_63.z;
    float _236 = in.m_63.w;
    float _238 = _184 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _240 = _186 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _242 = in.m_65.y;
    float _244 = in.m_67.z;
    float _246 = _212 * _220;
    float _248 = _212 * _232;
    float _250 = fma(_210, _218, _246);
    float _252 = fma(_210, _230, _248);
    float _254 = _212 + _242;
    float _256 = fma(_214, _222, _250);
    float _258 = fma(_214, _234, _252);
    float _260 = -_254;
    float _262 = _260 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _264 = _256 + _224;
    float _266 = _258 + _236;
    float _268 = _262 * _262;
    float _270 = -_264;
    float _272 = _270 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _274 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _276 = -_266;
    float _278 = _276 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _280 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _282 = fma(_272, _272, _268);
    float _284 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _286 = -_274;
    float _288 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _286);
    float _290 = -_280;
    float _292 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _290);
    float _294 = fma(_278, _278, _282);
    float _296 = -_284;
    float _298 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _296);
    float _300 = _298 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _302 = rsqrt(_294);
    float _304 = -_300;
    float _306 = fma(_288, (*spvDescriptorSet0.vp_c8)._m0[1].x, _304);
    float _308 = _272 * _302;
    float _310 = _278 * _302;
    float _312 = _262 * _302;
    float _314 = _298 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _316 = _308 * _308;
    float _318 = -_314;
    float _320 = fma(_292, (*spvDescriptorSet0.vp_c8)._m0[1].x, _318);
    float _322 = fma(_310, _310, _316);
    float _324 = rsqrt(_322);
    float _326 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _328 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _330 = -_326;
    float _332 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _330);
    float _334 = -_328;
    float _336 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _334);
    float _338 = _292 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _340 = -_226;
    float _342 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _340);
    float _344 = fma(_336, (*spvDescriptorSet0.vp_c8)._m0[1].w, _306);
    float _346 = -_338;
    float _348 = fma(_288, (*spvDescriptorSet0.vp_c8)._m0[1].y, _346);
    float _350 = _310 * _324;
    float _352 = _308 * _324;
    float _354 = fma(_332, (*spvDescriptorSet0.vp_c8)._m0[1].w, _348);
    float _356 = _344 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _358 = -_350;
    float _360 = _310 * _358;
    float _362 = _336 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _364 = -_350;
    float _366 = _312 * _364;
    float _368 = -_356;
    float _370 = fma(_354, (*spvDescriptorSet0.vp_c8)._m0[0].x, _368);
    float _372 = -_360;
    float _374 = fma(_308, _352, _372);
    float _376 = _312 * _352;
    float _378 = -_362;
    float _380 = fma(_332, (*spvDescriptorSet0.vp_c8)._m0[1].x, _378);
    float _382 = fma(_342, (*spvDescriptorSet0.vp_c8)._m0[1].w, _320);
    float _384 = _374 * _374;
    float _386 = _298 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _388 = fma(_382, (*spvDescriptorSet0.vp_c8)._m0[0].z, _370);
    float _390 = fma(_376, _376, _384);
    float _392 = _298 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _394 = fma(_366, _366, _390);
    float _396 = fma(_342, (*spvDescriptorSet0.vp_c8)._m0[1].z, _380);
    float _398 = -_386;
    float _400 = fma(_288, (*spvDescriptorSet0.vp_c8)._m0[0].x, _398);
    float _402 = _292 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _404 = rsqrt(_394);
    float _406 = -_396;
    float _408 = fma(_406, (*spvDescriptorSet0.vp_c8)._m0[0].w, _388);
    float _410 = fma(_336, (*spvDescriptorSet0.vp_c8)._m0[0].w, _400);
    float _412 = -_402;
    float _414 = fma(_288, (*spvDescriptorSet0.vp_c8)._m0[0].y, _412);
    float _416 = -_392;
    float _418 = fma(_292, (*spvDescriptorSet0.vp_c8)._m0[0].x, _416);
    float _420 = fma(_332, (*spvDescriptorSet0.vp_c8)._m0[0].w, _414);
    float _422 = 1.0 / _408;
    float _424 = fma(_342, (*spvDescriptorSet0.vp_c8)._m0[0].w, _418);
    float _426 = _374 * _404;
    float _428 = precise::clamp(_426, 0.0, 1.0);
    float _430 = -_428;
    float _432 = _430 + 1.0;
    float _434 = fma(_410, _422, -1.0);
    float _436 = _432 * _422;
    float _438 = fma(_432, _434, 1.0);
    float _440 = _420 * _436;
    float _442 = _424 * _436;
    float _444 = _438 * _438;
    float _446 = fma(_440, _440, _444);
    float _448 = in.m_69.x;
    float _450 = in.m_69.y;
    float _452 = in.m_69.z;
    float _454 = in.m_69.w;
    float _456 = fma(_442, _442, _446);
    float _458 = rsqrt(_456);
    float _460 = _442 * _458;
    float _462 = _212 * _450;
    float _464 = _438 * _458;
    float _466 = _440 * _458;
    float _468 = -_460;
    float _470 = _308 * _468;
    float _472 = fma(_210, _448, _462);
    float _474 = _310 * _464;
    float _476 = -_466;
    float _478 = -_470;
    float _480 = fma(_310, _476, _478);
    float _482 = -_466;
    float _484 = _312 * _482;
    float _486 = -_460;
    float _488 = -_474;
    float _490 = fma(_312, _486, _488);
    float _492 = fma(_214, _452, _472);
    float _494 = _480 * _480;
    float _496 = -_484;
    float _498 = fma(_308, _464, _496);
    float _500 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _502 = _264 + _500;
    float _504 = _492 + _454;
    float _506 = fma(_490, _490, _494);
    float _508 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _510 = _266 + _508;
    float _512 = in.m_59.x;
    float _514 = in.m_59.y;
    float _516 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _518 = _504 + _516;
    float _520 = fma(_498, _498, _506);
    float _522 = _518 * _518;
    float _524 = rsqrt(_520);
    float _526 = fma(_502, _502, _522);
    float _528 = fma(_510, _510, _526);
    float _530 = sqrt(_528);
    float _532 = _490 * _524;
    float _534 = _498 * _524;
    float _536 = _480 * _524;
    float _538 = _310 * _532;
    float _540 = _312 * _534;
    float _542 = rsqrt(_528);
    float _544 = -_538;
    float _546 = fma(_308, _534, _544);
    float _548 = -_540;
    float _550 = fma(_310, _536, _548);
    float _552 = _308 * _536;
    float _554 = _530 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _556 = _546 * _546;
    float _558 = -_552;
    float _560 = fma(_312, _532, _558);
    float _562 = fma(_550, _550, _556);
    float _564 = precise::min(_228, _554);
    float _566 = fma(_560, _560, _562);
    float _568 = _512 * 6.283185482025146484375;
    float _570 = _542 * _564;
    float _572 = _568 * 0.15915493667125701904296875;
    float _574 = rsqrt(_566);
    float _576 = _518 * _570;
    float _578 = _502 * _570;
    float _580 = -_576;
    float _582 = _518 + _580;
    float _584 = -_578;
    float _586 = _502 + _584;
    float _588 = in.m_67.x;
    float _590 = in.m_67.y;
    float _592 = _582 * _582;
    float _594 = _510 * _570;
    float _596 = _572 * 6.283185482025146484375;
    float _598 = cos(_596);
    float _600 = fma(_586, _586, _592);
    float _602 = -_594;
    float _604 = _510 + _602;
    float _606 = _560 * _574;
    float _608 = _546 * _574;
    float _610 = _550 * _574;
    float _612 = fma(_604, _604, _600);
    float _614 = _308 * _606;
    float _616 = _310 * _608;
    float _618 = _572 * 6.283185482025146484375;
    float _620 = sin(_618);
    float _622 = -_614;
    float _624 = fma(_310, _610, _622);
    float _626 = -_616;
    float _628 = fma(_312, _606, _626);
    float _630 = _312 * _610;
    float _632 = _624 * _624;
    float _634 = sqrt(_612);
    float _636 = -_630;
    float _638 = fma(_308, _608, _636);
    float _640 = fma(_628, _628, _632);
    float _642 = _598 * _590;
    float _644 = fma(_638, _638, _640);
    float _646 = _620 * _590;
    float _648 = fma(_620, _588, _642);
    float _650 = rsqrt(_644);
    float _652 = -_646;
    float _654 = fma(_598, _588, _652);
    float _656 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _648);
    float _658 = _542 * _634;
    float _660 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _654);
    float _662 = _238 * _658;
    float _664 = _216 * _658;
    float _666 = _240 * _658;
    float _668 = _662 * _656;
    float _670 = _664 * _660;
    float _672 = _638 * _650;
    float _674 = _666 * _244;
    float _676 = _668 * _606;
    float _678 = _668 * _610;
    float _680 = _628 * _650;
    float _682 = _668 * _608;
    float _684 = fma(_670, _672, _676);
    float _686 = _624 * _650;
    float _688 = fma(_670, _680, _678);
    float _690 = fma(_674, _310, _684);
    float _692 = fma(_670, _686, _682);
    float _694 = fma(_674, _308, _688);
    float _696 = _266 + _690;
    float _698 = fma(_674, _312, _692);
    float _700 = _264 + _694;
    float _702 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _704 = _696 + _702;
    float _706 = _254 + _698;
    float _708 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _710 = _700 + _708;
    float _712 = _704 * _704;
    float _714 = fma(_710, _710, _712);
    float _716 = sqrt(_714);
    bool _718 = _716 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _722 = _720 != 0;
    int _724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _726 = _724 != 0;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _730 = _728 != 0;
    bool _732 = !_726;
    int _734 = _732 ? 0 : 1;
    bool _736 = !_722;
    int _738 = _736 ? 0 : 1;
    bool _740 = !_730;
    int _742 = _740 ? 0 : 1;
    float _744 = _698;
    float _746 = _670;
    float _748 = _706;
    if (!_718)
    {
        _744 = _700;
    }
    float _750 = _744;
    float _752 = _750;
    if (!_718)
    {
        _746 = _696;
    }
    float _754 = _746;
    bool _756 = !_718;
    float _758 = _754;
    if (!_756)
    {
        float _760 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _762 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _764 = _716 + _762;
        float _766 = _706 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _768 = rsqrt(_714);
        float _770 = _764 * _760;
        float _772 = _770 * 0.15915493667125701904296875;
        float _774 = _772 * 6.283185482025146484375;
        float _776 = cos(_774);
        float _778 = _772 * 6.283185482025146484375;
        float _780 = sin(_778);
        float _782 = _776 + (-1.0);
        float _784 = fma(_780, _766, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _786 = _782 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _788 = _768 * _784;
        float _790 = fma(_706, _776, _786);
        float _792 = fma(_710, _788, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _794 = fma(_704, _788, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _752 = _792;
        _758 = _794;
        _748 = _790;
    }
    float _796 = _752;
    float _798 = _758;
    float _800 = _748;
    float _802 = -_578;
    float _804 = _802 + _796;
    float _806 = -_594;
    float _808 = _806 + _798;
    float _810 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _812 = _804 + _810;
    float _814 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _816 = _808 + _814;
    float _818 = fma(_812, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _820 = fma(_816, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _3818 = float2(_818, _820);
    float _822 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_3818, float2(0.0), isnan(_3818)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_3818, float2(0.0), isnan(_3818)), level(0.0)).x;
    float _824 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _826 = int(_824);
    int _828 = abs(_734);
    float _830 = -_578;
    float _832 = _264 + _830;
    int _834 = abs(_738);
    float _836 = -_594;
    float _838 = _266 + _836;
    int _840 = abs(_742);
    float _842 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _844 = _804 + _842;
    float _846 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _848 = int(_846);
    float _850 = in.m_71.y;
    float _852 = float(_826);
    float _854 = 1.0 / _852;
    float _856 = float(uint(_848));
    int _858 = ~_848;
    int _860 = _858 + 1;
    int _862 = ~_848;
    int _864 = _862 + 1;
    float _866 = 1.0 / _856;
    bool _868 = _848 == 0;
    float _870 = _126 * _854;
    float _872 = trunc(_870);
    int _874 = int(_872);
    int _876 = as_type<int>(_866) + (-2);
    float _878 = float(uint(_874));
    float _880 = as_type<float>(_876) * _878;
    float _882 = trunc(_880);
    float _884 = precise::max(_882, 0.0);
    uint _887 = uint(_884);
    float _889 = float(_848);
    int _891 = _860 * int(_887);
    int _893 = _891 + _874;
    float _895 = float(_874);
    float _897 = float(uint(_893));
    float _899 = as_type<float>(_876) * _897;
    int _901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _903 = _901 != 0;
    float _905 = trunc(_899);
    float _907 = precise::max(_905, 0.0);
    uint _909 = uint(_907);
    bool _911 = !_903;
    float _913 = _911 ? 7.345489978790283203125 : 1.0;
    float _915 = _913 * _512;
    int _917 = int(_887) + int(_909);
    float _919 = floor(_915);
    int _921 = _864 * _917;
    int _923 = _921 + _874;
    bool _925 = _895 >= _889;
    bool _927 = isnan(_895);
    bool _929 = _925 || _927;
    bool _931 = isnan(_889);
    bool _933 = _929 || _931;
    float _935 = float(_933);
    float _937 = _126 * _889;
    bool _939 = uint(_923) >= uint(_848);
    float _941 = _937 * _176;
    float _943 = trunc(_935);
    int _945 = int(_943);
    bool _947 = !_939;
    int _949 = _947 ? 0 : (-1);
    int _951 = ~_917;
    int _953 = _951 + _949;
    int _955 = _953 + 1;
    float _957 = -_919;
    float _959 = _915 + _957;
    float _961 = trunc(_941);
    int _963 = int(_961);
    int _965 = _848 + (-1);
    int _967 = _848 * _955;
    int _969 = _967 + _874;
    float _971 = _959 * _889;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _975 = _973 != 0;
    int _977 = ~_945;
    int _979 = _977 + 1;
    int _981 = _979 + 1;
    float _983 = trunc(_971);
    int _985 = int(_983);
    bool _987 = !_868;
    int _989 = _987 ? _969 : (-1);
    bool _991 = !_975;
    float _993 = _991 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _997 = _995 != 0;
    int _999 = _989 * _981;
    int _1001 = abs(as_type<int>(_993));
    int _1003 = _945 * _965;
    int _1005 = _1003 + _999;
    bool _1007 = !_997;
    int _1009 = _1007 ? 0 : 1;
    int _1011 = _1005 * _828;
    int _1013 = abs(_1009);
    int _1015 = _985 * _1001;
    int _1017 = _1015 + _874;
    float _1019 = -_576;
    float _1021 = _1019 + _800;
    int _1023 = _963 * _834;
    int _1025 = _1023 + _1011;
    int _1027 = _1017 * _840;
    int _1029 = _1027 + _1025;
    int _1031 = _985 * _1013;
    int _1033 = _1031 + _1029;
    float _1035 = fma(_822, 100.0, _1021);
    float _1037 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1039 = _808 + _1037;
    float _1041 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1043 = _1035 + _1041;
    float _1045 = _1043 * _1043;
    float _1047 = fma(_844, _844, _1045);
    float _1049 = fma(_1039, _1039, _1047);
    float _1051 = rsqrt(_1049);
    float _1053 = _1051 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1055 = _844 * _1053;
    float _1057 = _1039 * _1053;
    float _1059 = _1055 * _1055;
    float _1061 = _1057 * _1057;
    float _1063 = _1059 + _1061;
    float _1065 = sqrt(_1063);
    bool _1067 = _1065 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1069 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1071 = _1065 + _1069;
    float _1073 = _1039;
    float _1075 = _993;
    float _1077 = _1071;
    float _1079 = _971;
    float _1081 = _1043;
    float _1083 = _1049;
    if (_1067)
    {
        float _1085 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1073 = _1085;
    }
    float _1087 = _1073;
    if (_1067)
    {
        float _1089 = rsqrt(_1063);
        _1075 = _1089;
    }
    float _1091 = _1075;
    float _1093 = _1091;
    if (_1067)
    {
        float _1095 = _1071 * _1087;
        _1077 = _1095;
    }
    float _1097 = _1077;
    if (_1067)
    {
        float _1099 = _1097 * 0.15915493667125701904296875;
        _1079 = _1099;
    }
    float _1101 = _1079;
    float _1103 = as_type<float>(_1011);
    float _1105 = _1101;
    if (_1067)
    {
        float _1107 = _1101 * 6.283185482025146484375;
        float _1109 = sin(_1107);
        _1103 = _1109;
    }
    float _1111 = _1103;
    float _1113 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1115 = precise::max(0.0, _1113);
    float _1117 = _1051;
    float _1119 = _1115;
    if (_1067)
    {
        float _1121 = _1101 * 6.283185482025146484375;
        float _1123 = cos(_1121);
        _1117 = _1123;
    }
    float _1125 = _1117;
    float _1127 = -_1053;
    float _1129 = -_1115;
    float _1131 = fma(_1043, _1127, _1129);
    float _1133 = sqrt(_1049);
    float _1135 = _1131;
    if (_1067)
    {
        float _1137 = _1131 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1119 = _1137;
    }
    float _1139 = _1119;
    float _1141 = _1139;
    float _1143 = _1111;
    if (_1067)
    {
        float _1145 = fma(_1111, _1139, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1141 = _1145;
    }
    float _1147 = _1141;
    if (_1067)
    {
        float _1149 = _1125 + (-1.0);
        _1081 = _1149;
    }
    float _1151 = _1081;
    if (_1067)
    {
        float _1153 = _1091 * _1147;
        _1105 = _1153;
    }
    float _1155 = _1105;
    if (!_1067)
    {
        _1093 = _1055;
    }
    float _1157 = _1093;
    float _1159 = _1157;
    if (_1067)
    {
        float _1161 = _1151 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1143 = _1161;
    }
    float _1163 = _1143;
    float _1165 = _1163;
    if (_1067)
    {
        float _1167 = _1055 * _1155;
        _1159 = _1167;
    }
    float _1169 = _1159;
    if (!_1067)
    {
        _1083 = _1059;
    }
    float _1171 = _1083;
    float _1173 = fma(_832, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1175 = _1171;
    if (_1067)
    {
        float _1177 = fma(_1131, _1125, _1163);
        _1135 = _1177;
    }
    float _1179 = _1135;
    float _1181 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1183 = fma(_1133, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1181);
    float _1185 = precise::clamp(_1183, 0.0, 1.0);
    float _1187 = _1185;
    if (!_1067)
    {
        _1165 = _1057;
    }
    float _1189 = _1165;
    float _1191 = _1189;
    if (_1067)
    {
        float _1193 = _1057 * _1155;
        _1191 = _1193;
    }
    float _1195 = _1191;
    if (_1067)
    {
        float _1197 = _1169 * _1169;
        _1175 = _1197;
    }
    float _1199 = _1175;
    float _1201 = -_1185;
    float _1203 = _1201 + 1.0;
    if (!_1067)
    {
        _1187 = _1061;
    }
    float _1205 = _1187;
    float _1207 = _1205;
    if (_1067)
    {
        float _1209 = _1195 * _1195;
        _1207 = _1209;
    }
    float _1211 = _1207;
    float _1213 = fma(_1179, _1179, _1199);
    float _1215 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1217 = abs(_1203);
    float _1219 = log2(_1217);
    float _1221 = _1213 + _1211;
    float _1223 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1215);
    float _1225 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1227 = float(uint(_1033));
    float _1229 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1223);
    float _1231 = rsqrt(_1221);
    float _1233 = fma(_838, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1235 = _1229 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1237 = as_type<float>(_876) * _1227;
    float _1239 = _1235 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1241 = _1219 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1243 = floor(_1173);
    float _1245 = -_1239;
    float _1247 = fma(_1245, _1225, 1.0);
    float _1249 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1251 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1249);
    float _1253 = _1231 * _1169;
    float _1255 = _1231 * _1179;
    float _1257 = _1231 * _1195;
    float _1259 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1261 = _1253 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1263 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1251);
    float _1265 = exp2(_1241);
    float _1267 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1259);
    float _1269 = -_1261;
    float _1271 = fma(_1255, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1269);
    float _1273 = _1035 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1275 = _1263 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1277 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1267);
    float _1279 = -_1257;
    float _1281 = fma(_1279, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1271);
    float _1283 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1273);
    float _1285 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1287 = _1277 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1289 = floor(_1233);
    float _1291 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1283);
    float _1293 = -_1243;
    float _1295 = _1173 + _1293;
    float _1297 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1285);
    float _1299 = fma(_1281, -0.5, 0.5);
    float _1301 = _1291 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1303 = _1255 + 1.0;
    float _1305 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1297);
    float _1307 = log2(_1247);
    float _1309 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1311 = -_1255;
    float _1313 = fma(_1265, _1303, _1311);
    float _1315 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1305);
    float _1317 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1319 = fma(_1281, 0.5, 0.5);
    int _1321 = ~_848;
    int _1323 = _1321 + 1;
    float _1325 = fma(_1313, 0.5, 0.5);
    float _1327 = 1.0 / _1315;
    float _1329 = -_1289;
    float _1331 = _1233 + _1329;
    float _1333 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1309);
    float _1335 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1317);
    float _1337 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1333);
    float _1339 = sqrt(_1299);
    float _1341 = fma(_1319, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1343 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1335);
    float _1345 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1337);
    float _1347 = _1307 * 0.693147182464599609375;
    float _1349 = fma(_1319, _1341, -0.212114393711090087890625);
    float _1351 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1343);
    float _1353 = trunc(_1237);
    float _1355 = precise::max(_1353, 0.0);
    uint _1357 = uint(_1355);
    float _1359 = _1345 * _1327;
    float _1361 = fma(_1319, _1349, 1.570728778839111328125);
    float _1363 = _1351 * _1327;
    float _1365 = _1347 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1367 = fma(_1359, 0.5, 0.5);
    float _1369 = fma(_1363, -0.5, 0.5);
    float _1371 = _1339 * 0.636619746685028076171875;
    float2 _4661 = float2(_1295, _1331);
    float _1373 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4661, float2(0.0), isnan(_4661)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4661, float2(0.0), isnan(_4661)), level(0.0)).x;
    float _1375 = -_1361;
    float _1377 = fma(_1371, _1375, 1.0);
    int _1379 = _1323 * int(_1357);
    int _1381 = _1379 + _1033;
    float3 _4682 = float3(_1367, _1369, _1365);
    float _1383 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4682, float3(0.0), isnan(_4682)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4682, float3(0.0), isnan(_4682)), level(0.0)).x;
    float _1385 = float(uint(_1381));
    float3 _4696 = float3(_1367, _1369, _1365);
    float4 _1388 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4696, float3(0.0), isnan(_4696)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4696, float3(0.0), isnan(_4696)), level(0.0)).xyzw;
    float _1390 = _1388.x;
    float _1392 = _1388.y;
    float _1394 = _1388.z;
    float _1396 = _1388.w;
    float2 _4712 = float2(_1377, _1325);
    float3 _1400 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4712, float2(0.0), isnan(_4712)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4712, float2(0.0), isnan(_4712)), level(0.0)).xyz;
    float _1402 = _1400.x;
    float _1404 = _1400.y;
    float _1406 = _1400.z;
    float _1408 = as_type<float>(_876) * _1385;
    float _1410 = -_576;
    float _1412 = _1410 + _254;
    int _1414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1416 = _1414 != 0;
    float _1418 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1420 = trunc(_1408);
    float _1422 = precise::max(_1420, 0.0);
    uint _1424 = uint(_1422);
    int _1426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1428 = _1426 != 0;
    out.m_73.w = _564;
    int _1430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1432 = _1430 != 0;
    float _1434 = _512 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1436 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1418);
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1440 = _1438 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1442 = _514 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1446 = -_850;
    float _1448 = _1446 + 1.0;
    float _1450 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1452 = _1450 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1454 = fma(_1442, -2.0, _1444);
    float _1456 = 1.0 / _1440;
    float _1458 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1460 = int(_1357) + int(_1424);
    float _1462 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1464 = _1462 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1466 = ~_848;
    int _1468 = _1466 + 1;
    float _1470 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1472 = _514 > 0.5;
    float _1474 = 1.0 / _1452;
    float _1476 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1458);
    int _1478 = _1468 * _1460;
    int _1480 = _1478 + _1033;
    float _1482 = -_1470;
    float _1484 = fma(_1434, 2.0, _1482);
    float _1486 = _850;
    float _1488 = _1315;
    float _1490 = _1351;
    if (_1428)
    {
        float _1492 = _1472 ? _1448 : _850;
        _1486 = _1492;
    }
    float _1494 = _1486;
    float _1496 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1498 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1496;
    float _1500 = 1.0 / _1464;
    float _1502 = _1408;
    if (_1416)
    {
        float _1504 = in.m_59.x;
        _1502 = _1504;
    }
    float _1506 = _1502;
    float _1508 = _1498 * _1456;
    float _1510 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1512 = uint(_1480) >= uint(_848);
    float _1514 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1516 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1514;
    float _1518 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1520 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1522 = _1516 * _1474;
    float _1524 = float(uint(_1017));
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1528 = _1510 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1530 = _1518 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1532 = _1520 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1534 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1536 = _1534 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1538 = as_type<float>(_876) * _1524;
    int _1540 = ~_848;
    int _1542 = _1540 + 1;
    float _1544 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1546 = _208 + _1544;
    out.m_75.x = _1528;
    out.m_75.y = _1530;
    out.m_75.z = _1532;
    out.m_75.w = _1526;
    float _1548 = _1536 * _1500;
    bool _1550 = !_1512;
    int _1552 = _1550 ? 0 : (-1);
    float _1554 = fma(_1508, _1546, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1556 = _1506 > 0.5;
    bool _1558 = _1556 && _1416;
    float _1560 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1562 = _208 + _1560;
    int _1564 = ~_1460;
    int _1566 = _1564 + _1552;
    int _1568 = _1566 + 1;
    float _1570 = fma(_822, 100.0, _1412);
    float _1572 = _1275 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1574 = fma(_1548, _1562, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    out.m_77.y = _648;
    int _1576 = _848 * _1568;
    int _1578 = _1576 + _1033;
    bool _1580 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1582 = isnan(_208);
    bool _1584 = _1580 || _1582;
    bool _1586 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1588 = _1584 || _1586;
    float _1590 = float(_1588);
    float _1592 = fma(_1287, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1572);
    float _1594 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1454);
    float _1596 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1436);
    float _1598 = -_126;
    float _1600 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1484);
    float _1602 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1476);
    float _1604 = in.m_71.x;
    float _1606 = trunc(_1538);
    float _1608 = precise::max(_1606, 0.0);
    uint _1610 = uint(_1608);
    bool _1612 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1614 = isnan(_208);
    bool _1616 = _1612 || _1614;
    bool _1618 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1620 = _1616 || _1618;
    float _1622 = float(_1620);
    float _1624 = -_1590;
    float _1626 = _1624 + 1.0;
    bool _1628 = !_868;
    int _1630 = _1628 ? _1578 : (-1);
    float _1632 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1592);
    bool _1634 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1636 = isnan(_208);
    bool _1638 = _1634 || _1636;
    bool _1640 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1642 = _1638 || _1640;
    float _1644 = float(_1642);
    float _1646 = -_1622;
    float _1648 = _1646 + 1.0;
    int _1650 = _1630 >> 31;
    float _1652 = fma(_1301, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1632);
    float _1654 = _1590 * _1648;
    bool _1656 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1658 = isnan(_208);
    bool _1660 = _1656 || _1658;
    bool _1662 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1664 = _1660 || _1662;
    float _1666 = float(_1664);
    float _1668 = -_1644;
    float _1670 = _1668 + 1.0;
    int _1672 = _1650 & 3;
    float _1674 = _1644 * _1626;
    out.m_79.x = _664;
    int _1676 = _1542 * int(_1610);
    int _1678 = _1676 + _1017;
    float _1680 = _1666 * _1670;
    int _1682 = _1630 + _1672;
    float _1684 = _1219 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_81.x = _832;
    out.m_81.y = _1570;
    out.m_81.z = _838;
    float _1686 = float(uint(_1678));
    float _1688 = _1554 * _1680;
    int _1690 = _1682 >> 2;
    out.gl_Position.x = _1345;
    out.gl_Position.y = _1351;
    out.gl_Position.z = _1652;
    out.gl_Position.w = _1315;
    float _1692 = _1554;
    float _1694 = as_type<float>(_1682);
    if (_1416)
    {
        _1692 = _1604;
    }
    float _1696 = _1692;
    float _1698 = as_type<float>(_876) * _1686;
    float _1700 = _1696;
    if (!_1416)
    {
        _1694 = _1604;
    }
    float _1702 = _1694;
    float _1704 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1706 = _208 + _1704;
    int _1708 = _1690 << 4;
    int _1710 = _1708 + 368;
    float _1712 = trunc(_1698);
    float _1714 = precise::max(_1712, 0.0);
    uint _1716 = uint(_1714);
    float _1718 = -_1666;
    float _1720 = _1718 + 1.0;
    float _1722 = _1702;
    if (_1558)
    {
        float _1724 = -_1696;
        float _1726 = _1724 + 1.0;
        _1700 = _1726;
    }
    float _1728 = _1700;
    uint _1730 = uint(int(uint(_1710) >> uint(2)));
    uint _1732 = uint(int(uint(int(_1730)) >> uint(2)));
    int _1734 = int(_1730) & 3;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[int(_1732)][_1734];
    int _1738 = int(_1730) + 1;
    uint _1740 = uint(int(uint(_1738) >> uint(2)));
    int _1742 = _1738 & 3;
    float _1744 = (*spvDescriptorSet0.vp_c9)._m0[int(_1740)][_1742];
    int _1746 = _1630 & 3;
    bool _1748 = _1746 != 0;
    float _1750 = fma(_1720, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1688);
    int _1752 = _1630 & 3;
    bool _1754 = _1752 != 0;
    float _1756 = fma(_1522, _1706, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    if (_1416)
    {
        _1722 = _1728;
    }
    float _1758 = _1722;
    float _1760 = fma(_1574, _1674, _1750);
    float _1762 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    bool _1764 = uint(_1752) > 1u;
    float _1766 = exp2(_1684);
    float _1768 = fma(_1758, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _1770 = fma(_1756, _1654, _1760);
    bool _1772 = _1752 != 3;
    float _1774 = -_1594;
    float _1776 = fma(_1602, _1762, _1774);
    int _1778 = int(_1610) + int(_1716);
    float _1780 = fma(_1596, _1768, _1600);
    int _1782 = _1710 + 8;
    uint _1784 = uint(int(uint(_1782) >> uint(2)));
    uint _1786 = uint(int(uint(int(_1784)) >> uint(2)));
    int _1788 = int(_1784) & 3;
    float _1790 = (*spvDescriptorSet0.vp_c9)._m0[int(_1786)][_1788];
    int _1792 = int(_1784) + 1;
    uint _1794 = uint(int(uint(_1792) >> uint(2)));
    int _1796 = _1792 & 3;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[int(_1794)][_1796];
    int _1800 = _1748 ? 0 : 1;
    float _1802 = fma(_1622, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1770);
    float _1804 = _1776 + 0.5;
    int _1806 = ~_1800;
    int _1808 = _1806 + 1;
    int _1810 = _1808 + 1;
    float _1812 = _1802 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1814 = _1810;
    if (!_1764)
    {
        int _1816 = ~_1800;
        int _1818 = _1816 + 1;
        _1814 = _1818;
    }
    int _1820 = _1814;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1824 = uint(_1752) >= 2u;
    float _1826 = _1780 + 0.5;
    float _1828 = _1822 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1830 = abs(_1820);
    float _1832 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1834 = _1824 ? 0 : 1;
    float _1836 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1838 = ~_848;
    int _1840 = _1838 + 1;
    float _1842 = _1832 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1844 = ~_1834;
    int _1846 = _1844 + 1;
    int _1848 = _1846 + 1;
    float _1850 = _1836 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1852 = _1848;
    if (_1772)
    {
        int _1854 = ~_1834;
        int _1856 = _1854 + 1;
        _1852 = _1856;
    }
    int _1858 = _1852;
    int _1860 = _1840 * _1778;
    int _1862 = _1860 + _1017;
    bool _1864 = !_1754;
    int _1866 = _1864 ? 0 : 1;
    out.m_83.x = _1826;
    out.m_83.y = _1804;
    int _1868 = ~_1830;
    int _1870 = _1868 + 1;
    int _1872 = _1870 + 1;
    int _1874 = abs(_1866);
    out.m_85.x = _1828;
    out.m_85.y = _1842;
    out.m_85.z = _1850;
    out.m_85.w = _1812;
    bool _1876 = _1752 != 3;
    int _1878 = _1872 * as_type<int>(_1744);
    bool _1880 = uint(_1862) >= uint(_848);
    float _1882 = in.m_87.x;
    float _1884 = in.m_87.y;
    float _1886 = in.m_87.z;
    bool _1888 = !_1432;
    int _1890 = _1888 ? 0 : 1;
    bool _1892 = _648 != 0.0;
    bool _1894 = isnan(_648);
    bool _1896 = _1892 || _1894;
    bool _1898 = isnan(0.0);
    bool _1900 = _1896 || _1898;
    bool _1902 = _654 == 0.0;
    bool _1904 = !_1900;
    bool _1906 = _1902 && _1904;
    bool _1908 = !_1876;
    int _1910 = _1908 ? 0 : (-1);
    int _1912 = abs(_1858);
    int _1914 = ~_1874;
    int _1916 = _1914 + 1;
    int _1918 = _1916 + 1;
    int _1920 = abs(_1910);
    bool _1922 = !_1880;
    int _1924 = _1922 ? 0 : (-1);
    int _1926 = _1918 * as_type<int>(_1736);
    int _1928 = _1926 + _1878;
    int _1930 = ~_1912;
    int _1932 = _1930 + 1;
    int _1934 = _1932 + 1;
    int _1936 = abs(_1890);
    int _1938 = ~_1778;
    int _1940 = _1938 + _1924;
    int _1942 = _1940 + 1;
    int _1944 = _1934 * as_type<int>(_1790);
    int _1946 = _1944 + _1928;
    int _1948 = ~_1920;
    int _1950 = _1948 + 1;
    int _1952 = _1950 + 1;
    float _1954 = _1315 * 0.5;
    int _1956 = ~_1936;
    int _1958 = _1956 + 1;
    int _1960 = _1958 + 1;
    int _1962 = _848 * _1942;
    int _1964 = _1962 + _1017;
    bool _1966 = _244 == 0.0;
    bool _1968 = _1966 && _1906;
    int _1970 = _1952 * as_type<int>(_1798);
    int _1972 = _1970 + _1946;
    float _1974 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1976 = _1972 * _1960;
    bool _1978 = !_868;
    int _1980 = _1978 ? _1964 : (-1);
    float _1982 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1974);
    int _1984 = _1980 * _1936;
    int _1986 = _1984 + _1976;
    float _1988 = fma(_838, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1982);
    float _1990 = _1570 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1992 = _1884;
    float _1994 = _1882;
    float _1996 = _1886;
    if (!_1968)
    {
        float _1998 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1884);
        _1992 = _1998;
    }
    float _2000 = _1992;
    float _2002 = _1988 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2004 = fma(_832, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1990);
    float _2006 = float(_1986);
    if (!_1968)
    {
        float _2008 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1882);
        _1994 = _2008;
    }
    float _2010 = _1994;
    float _2012 = 1.0 / _2002;
    float _2014 = fma(_838, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2004);
    if (!_1968)
    {
        float _2016 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1886);
        _1996 = _2016;
    }
    float _2018 = _1996;
    out.m_89.x = _2006;
    float _2020 = _610 * _2000;
    float _2022 = _2014 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2024 = _608 * _2000;
    float _2026 = _606 * _2000;
    float _2028 = fma(_680, _2010, _2020);
    float _2030 = _2022 + _2002;
    float _2032 = _1652 + _1315;
    float _2034 = fma(_686, _2010, _2024);
    float _2036 = fma(_672, _2010, _2026);
    float _2038 = _2032 * 0.5;
    float _2040 = fma(_308, _2018, _2028);
    float _2042 = _2030 * _2012;
    float _2044 = _2042 * 0.5;
    float _2046 = fma(_312, _2018, _2034);
    float _2048 = fma(_310, _2018, _2036);
    float _2050 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2052 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2050);
    float _2054 = 1.0 / _2052;
    float _2056 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2058 = _2054 * _2056;
    float _2060 = fma(_1351, -0.5, _1954);
    float _2062 = abs(_2058);
    float _2064 = log2(_2062);
    bool _2066 = _2058 <= 8000.0;
    bool _2068 = isnan(_2058);
    bool _2070 = _2066 || _2068;
    bool _2072 = isnan(8000.0);
    bool _2074 = _2070 || _2072;
    float _2076 = float(_2074);
    float _2078 = _2064 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2080 = _1345 + _1315;
    float _2082 = _2080 * 0.5;
    float _2084 = exp2(_2078);
    out.m_91.x = _2082;
    out.m_91.y = _2060;
    out.m_91.z = _2038;
    out.m_91.w = _1315;
    float _2086 = fma(_2084, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2088 = precise::clamp(_2086, 0.0, 1.0);
    float _2090 = in.m_65.x;
    float _2092 = fma(_2088, -2.0, 3.0);
    float _2094 = _2088 * _2088;
    bool _2096 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2098 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2100 = _2096 || _2098;
    bool _2102 = isnan(0.5);
    bool _2104 = _2100 || _2102;
    float _2106 = _2094 * _2092;
    float _2108 = -_2106;
    float _2110 = _2108 + 1.0;
    float _2112 = fma(_2110, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2106);
    float _2114 = _2076 * _2112;
    float _2116 = _2076;
    float _2118 = _2112;
    if (_2104)
    {
        _2116 = 1.0;
    }
    float _2120 = _2116;
    float _2122 = _2120;
    if (_2104)
    {
        _2118 = 1.0;
    }
    float _2124 = _2118;
    float _2126 = _2124;
    if (!_2104)
    {
        float _2128 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2130 = _2128 * 0.15915493667125701904296875;
        float _2132 = _2130 * 6.283185482025146484375;
        float _2134 = cos(_2132);
        float _2136 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2138 = _2136 * 0.15915493667125701904296875;
        float _2140 = _2130 * 6.283185482025146484375;
        float _2142 = sin(_2140);
        float _2144 = 1.0 / _2134;
        float _2146 = _2138 * 6.283185482025146484375;
        float _2148 = cos(_2146);
        float _2150 = _2142 * _2144;
        float _2152 = _2138 * 6.283185482025146484375;
        float _2154 = sin(_2152);
        float _2156 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2158 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2156;
        float _2160 = _2148 * _2150;
        float _2162 = 1.0 / _2158;
        float _2164 = 1.0 / _2160;
        float _2166 = _2154 * _2164;
        float _2168 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2170 = fma(_2058, _2166, _2168);
        float _2172 = _2170 * _2162;
        float _2174 = precise::clamp(_2172, 0.0, 1.0);
        _2126 = _2174;
        _1488 = _2150;
        _1490 = _2144;
    }
    float _2176 = _2126;
    float _2178 = _1488;
    float _2180 = _1490;
    float _2182 = _2178;
    float _2184 = _2180;
    if (!_2104)
    {
        float _2186 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2188 = _2186 * 0.15915493667125701904296875;
        float _2190 = _2188 * 6.283185482025146484375;
        float _2192 = cos(_2190);
        float _2194 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2196 = _2194 * 0.15915493667125701904296875;
        float _2198 = _2188 * 6.283185482025146484375;
        float _2200 = sin(_2198);
        float _2202 = 1.0 / _2192;
        float _2204 = _2196 * 6.283185482025146484375;
        float _2206 = cos(_2204);
        float _2208 = _2200 * _2202;
        float _2210 = _2196 * 6.283185482025146484375;
        float _2212 = sin(_2210);
        float _2214 = _2206 * _2208;
        float _2216 = 1.0 / _2214;
        float _2218 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2220 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2218;
        float _2222 = 1.0 / _2220;
        float _2224 = _2212 * _2216;
        float _2226 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2228 = fma(_2058, _2224, _2226);
        float _2230 = _2228 * _2222;
        float _2232 = precise::clamp(_2230, 0.0, 1.0);
        float _2234 = -_2232;
        float _2236 = _2234 + 1.0;
        _2122 = _2236;
        _2182 = _2216;
        _2184 = _2222;
    }
    float _2238 = _2122;
    float _2240 = _2182;
    float _2242 = _2184;
    float _2244 = -_1766;
    float _2246 = _2244 + 1.0;
    float _2248 = _2114 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2250 = -_1373;
    float _2252 = _2250 + 1.0;
    float _2254 = _2246 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_93.x = _2040;
    out.m_93.y = _2046;
    out.m_93.z = _2048;
    float _2256 = _2252 * _2248;
    float _2258 = precise::clamp(_2256, 0.0, 1.0);
    bool _2260 = _1133 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2262 = isnan(_1133);
    bool _2264 = _2260 || _2262;
    bool _2266 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2268 = _2264 || _2266;
    float _2270 = _2254 * _1383;
    float _2272 = -_2254;
    float _2274 = _2272 + 1.0;
    float _2276 = -_2258;
    float _2278 = fma(_2276, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_95.x = _804;
    out.m_95.y = _1035;
    out.m_95.z = _808;
    float _2280 = _1396 * _2270;
    float _2282 = _1406 * _2270;
    float _2284 = _2278 * _2090;
    float _2286 = _2176 * _2238;
    float _2288 = fma(_1402, _2280, _1390);
    float _2290 = fma(_1404, _2280, _1392);
    float _2292 = _1396 * _2274;
    float _2294 = fma(_1396, _2282, _1394);
    float _2296 = _2284 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2298 = _2240;
    float _2300 = _2270;
    float _2302 = _2242;
    float _2304 = _2274;
    float _2306 = _2280;
    float _2308 = _2296;
    if (!_2268)
    {
        _2298 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2310 = _2298;
    float _2312 = _2286 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_97.x = _2288;
    out.m_97.y = _2290;
    out.m_97.z = _2294;
    out.m_97.w = _2292;
    float _2314 = _2310;
    float _2316 = _2310;
    if (!_2268)
    {
        _2300 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2318 = _2300;
    float _2320 = _2318;
    float _2322 = _2318;
    if (!_2268)
    {
        _2302 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2324 = _2302;
    out.m_99.x = _2296;
    float _2326 = _2324;
    float _2328 = _2324;
    if (!_2268)
    {
        _2304 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2330 = _2304;
    float _2332 = _2330;
    float _2334 = _2330;
    if (!_2268)
    {
        _2306 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2336 = _2306;
    float _2338 = _2336;
    float _2340 = _2336;
    if (!_2268)
    {
        _2308 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2342 = _2308;
    bool _2344 = !_2268;
    float _2346 = _2342;
    float _2348 = _2342;
    if (!_2344)
    {
        bool _2350 = _1133 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2352 = isnan(_1133);
        bool _2354 = _2350 || _2352;
        bool _2356 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2358 = _2354 || _2356;
        if (!_2358)
        {
            float _2360 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2362 = _1133 + _2360;
            float _2364 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2366 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2364;
            float _2368 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2370 = _2368 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2372 = 1.0 / _2366;
            float _2374 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2376 = _2374 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2378 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2380 = _2378 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2382 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2384 = _2382 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2386 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2388 = _2386 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2390 = _2362 * _2372;
            float _2392 = precise::clamp(_2390, 0.0, 1.0);
            float _2394 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2396 = _2394 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2398 = fma(_2392, _2370, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2400 = fma(_2392, _2396, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2402 = fma(_2392, _2376, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2404 = fma(_2392, _2380, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2406 = fma(_2392, _2384, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2408 = fma(_2392, _2388, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2322 = _2402;
            _2340 = _2406;
            _2316 = _2398;
            _2334 = _2404;
            _2328 = _2400;
            _2348 = _2408;
            _2410 = true;
        }
        else
        {
            bool _2412 = _1133 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2414 = isnan(_1133);
            bool _2416 = _2412 || _2414;
            bool _2418 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2420 = _2416 || _2418;
            if (!_2420)
            {
                _2314 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2422 = _2314;
            _2316 = _2422;
            if (!_2420)
            {
                _2320 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2424 = _2320;
            _2322 = _2424;
            if (!_2420)
            {
                _2326 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2426 = _2326;
            _2328 = _2426;
            if (!_2420)
            {
                _2332 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2428 = _2332;
            _2334 = _2428;
            if (!_2420)
            {
                _2338 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2430 = _2338;
            _2340 = _2430;
            if (!_2420)
            {
                _2346 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2432 = _2346;
            bool _2434 = !_2420;
            _2348 = _2432;
            if (!_2434)
            {
                bool _2436 = _1133 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2438 = isnan(_1133);
                bool _2440 = _2436 || _2438;
                bool _2442 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2444 = _2440 || _2442;
                if (!_2444)
                {
                    float _2446 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2448 = _1133 + _2446;
                    float _2450 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2452 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2450;
                    float _2454 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2456 = _2454 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2458 = 1.0 / _2452;
                    float _2460 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2462 = _2460 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2464 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2466 = _2464 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2468 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2470 = _2468 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2472 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2474 = _2472 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2476 = _2448 * _2458;
                    float _2478 = precise::clamp(_2476, 0.0, 1.0);
                    float _2480 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2482 = _2480 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2484 = fma(_2478, _2456, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2486 = fma(_2478, _2482, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2488 = fma(_2478, _2462, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2490 = fma(_2478, _2466, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2492 = fma(_2478, _2470, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2494 = fma(_2478, _2474, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2322 = _2488;
                    _2340 = _2492;
                    _2316 = _2484;
                    _2334 = _2490;
                    _2328 = _2486;
                    _2348 = _2494;
                    _2410 = true;
                }
                else
                {
                    _2322 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2340 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2316 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2334 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2328 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2348 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2410 = false;
    float _2496 = _2322;
    float _2498 = _2340;
    float _2500 = _2316;
    float _2502 = _2334;
    float _2504 = _2328;
    float _2506 = _2348;
    float _2508 = fma(_2046, -0.5, 0.5);
    float _2510 = precise::clamp(_2508, 0.0, 1.0);
    float _2512 = -_2496;
    float _2514 = _2512 + _2498;
    float _2516 = _2312 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2518 = -_2500;
    float _2520 = _2518 + _2502;
    out.m_101.x = 0.0;
    float _2522 = fma(_2510, _2514, _2496);
    float _2524 = fma(_2510, _2520, _2500);
    out.m_55.x = _2516;
    float _2526 = -_2504;
    float _2528 = _2526 + _2506;
    float _2530 = _2522 * 0.586610972881317138671875;
    bool _2532 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2534 = fma(_2510, _2528, _2504);
    float _2536 = fma(_2524, 0.298911988735198974609375, _2530);
    bool _2538 = _2176 > 0.0;
    bool _2540 = isnan(_2176);
    bool _2542 = _2538 || _2540;
    bool _2544 = isnan(0.0);
    bool _2546 = _2542 || _2544;
    float _2548 = fma(_2534, 0.114477999508380889892578125, _2536);
    bool _2550 = _2238 <= 0.0;
    bool _2552 = !_2546;
    bool _2554 = _2550 || _2552;
    float _2556 = -_2548;
    float _2558 = _2524 + _2556;
    float _2560 = -_2548;
    float _2562 = _2522 + _2560;
    float _2564 = -_2548;
    float _2566 = _2534 + _2564;
    float _2568 = fma(_2558, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2548);
    float _2570 = fma(_2562, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2548);
    float _2572 = fma(_2566, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2548);
    bool _2574 = !_2532;
    if (!_2574)
    {
        float _2576 = -_1035;
        float _2578 = _2576 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2580 = -_804;
        float _2582 = _2580 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2584 = -_808;
        float _2586 = _2584 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2588 = _2578 * _2578;
        float _2590 = fma(_2582, _2582, _2588);
        float _2592 = fma(_2586, _2586, _2590);
        float _2594 = sqrt(_2592);
        float _2596 = rsqrt(_2592);
        float _2598 = -_2594;
        float _2600 = _2598 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2602 = _2600 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2604 = precise::clamp(_2602, 0.0, 1.0);
        float _2606 = _2582 * _2596;
        float _2608 = _2578 * _2596;
        float _2610 = abs(_2604);
        float _2612 = log2(_2610);
        float _2614 = _2586 * _2596;
        float _2616 = _2606 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2618 = _2046 * _2608;
        float _2620 = -_2608;
        float _2622 = -_2616;
        float _2624 = fma(_2620, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2622);
        float _2626 = fma(_2040, _2606, _2618);
        float _2628 = -_2614;
        float _2630 = fma(_2628, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2624);
        float _2632 = fma(_2048, _2614, _2626);
        float _2634 = precise::clamp(_2632, 0.0, 1.0);
        float _2636 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2638 = _2630 + _2636;
        float _2640 = _2612 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2642 = _2638 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2644 = precise::clamp(_2642, 0.0, 1.0);
        float _2646 = exp2(_2640);
        float _2648 = _2646 * _2644;
        float _2650 = _2634 * _2648;
        float _2652 = _2650 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2654 = _2650 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2656 = _2650 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _2652;
        out.m_101.y = _2654;
        out.m_101.z = _2656;
    }
    out.m_73.x = _2568;
    out.m_73.y = _2570;
    out.m_73.z = _2572;
    if (!_2554)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_55.x = 0.0;
    float _2658 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2658;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

