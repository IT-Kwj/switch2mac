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
    float4 m_87 [[user(locn0)]];
    float4 m_79 [[user(locn1)]];
    float4 m_89 [[user(locn2)]];
    float4 m_93 [[user(locn3)]];
    float4 m_95 [[user(locn4)]];
    float4 m_101 [[user(locn5)]];
    float4 m_99 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
    float4 m_77 [[user(locn9)]];
    float4 m_97 [[user(locn10)]];
    float4 m_91 [[user(locn11)]];
    float4 m_55 [[user(locn12)]];
    float4 m_83 [[user(locn13)]];
    float4 m_75 [[user(locn14)]];
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
    float4 m_85 [[attribute(7)]];
    float4 m_67 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
    float4 m_71 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2554 = false;
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
    float _134 = _117;
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
        float _2869 = as_type<float>(_142);
        out.gl_Position.z = _2869;
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
        float _2924 = as_type<float>(_168);
        out.gl_Position.z = _2924;
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
    float _226 = _216 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _228 = in.m_63.x;
    float _230 = in.m_63.y;
    float _232 = in.m_63.z;
    float _234 = in.m_63.w;
    float _236 = _184 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _238 = _186 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _240 = in.m_65.y;
    float _242 = in.m_67.z;
    float _244 = _212 * _220;
    float _246 = _212 * _230;
    float _248 = fma(_210, _218, _244);
    float _250 = _212 + _240;
    float _252 = fma(_210, _228, _246);
    float _254 = fma(_214, _222, _248);
    float _256 = -_250;
    float _258 = _256 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _260 = fma(_214, _232, _252);
    float _262 = _254 + _224;
    float _264 = _258 * _258;
    float _266 = _260 + _234;
    float _268 = -_262;
    float _270 = _268 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _272 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _274 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _276 = -_266;
    float _278 = _276 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _280 = fma(_270, _270, _264);
    float _282 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _284 = -_274;
    float _286 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _284);
    float _288 = -_272;
    float _290 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _288);
    float _292 = fma(_278, _278, _280);
    float _294 = -_282;
    float _296 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _294);
    float _298 = rsqrt(_292);
    float _300 = _270 * _298;
    float _302 = _278 * _298;
    float _304 = _258 * _298;
    float _306 = _296 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _308 = _300 * _300;
    float _310 = fma(_302, _302, _308);
    float _312 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _314 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _316 = rsqrt(_310);
    float _318 = -_312;
    float _320 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _318);
    float _322 = -_314;
    float _324 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _322);
    float _326 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _328 = _320 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _330 = _324 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _332 = -_326;
    float _334 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _332);
    float _336 = _324 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _338 = -_328;
    float _340 = fma(_286, (*spvDescriptorSet0.vp_c8)._m0[1].y, _338);
    float _342 = -_330;
    float _344 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[1].x, _342);
    float _346 = -_336;
    float _348 = fma(_286, (*spvDescriptorSet0.vp_c8)._m0[1].x, _346);
    float _350 = fma(_290, (*spvDescriptorSet0.vp_c8)._m0[1].w, _340);
    float _352 = fma(_334, (*spvDescriptorSet0.vp_c8)._m0[1].w, _344);
    float _354 = _302 * _316;
    float _356 = _300 * _316;
    float _358 = fma(_296, (*spvDescriptorSet0.vp_c8)._m0[1].w, _348);
    float _360 = -_354;
    float _362 = _302 * _360;
    float _364 = -_354;
    float _366 = _304 * _364;
    float _368 = _358 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _370 = -_362;
    float _372 = fma(_300, _356, _370);
    float _374 = _304 * _356;
    float _376 = -_368;
    float _378 = fma(_350, (*spvDescriptorSet0.vp_c8)._m0[0].x, _376);
    float _380 = -_306;
    float _382 = fma(_290, (*spvDescriptorSet0.vp_c8)._m0[1].x, _380);
    float _384 = _372 * _372;
    float _386 = _324 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _388 = fma(_352, (*spvDescriptorSet0.vp_c8)._m0[0].z, _378);
    float _390 = fma(_334, (*spvDescriptorSet0.vp_c8)._m0[1].z, _382);
    float _392 = fma(_374, _374, _384);
    float _394 = -_386;
    float _396 = fma(_286, (*spvDescriptorSet0.vp_c8)._m0[0].x, _394);
    float _398 = _320 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _400 = -_390;
    float _402 = fma(_400, (*spvDescriptorSet0.vp_c8)._m0[0].w, _388);
    float _404 = fma(_366, _366, _392);
    float _406 = fma(_296, (*spvDescriptorSet0.vp_c8)._m0[0].w, _396);
    float _408 = -_398;
    float _410 = fma(_286, (*spvDescriptorSet0.vp_c8)._m0[0].y, _408);
    float _412 = 1.0 / _402;
    float _414 = _324 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _416 = fma(_290, (*spvDescriptorSet0.vp_c8)._m0[0].w, _410);
    float _418 = -_414;
    float _420 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[0].x, _418);
    float _422 = rsqrt(_404);
    float _424 = fma(_334, (*spvDescriptorSet0.vp_c8)._m0[0].w, _420);
    float _426 = fma(_406, _412, -1.0);
    float _428 = _372 * _422;
    float _430 = precise::clamp(_428, 0.0, 1.0);
    float _432 = -_430;
    float _434 = _432 + 1.0;
    float _436 = _434 * _412;
    float _438 = fma(_434, _426, 1.0);
    float _440 = _416 * _436;
    float _442 = _438 * _438;
    float _444 = _424 * _436;
    float _446 = fma(_440, _440, _442);
    float _448 = in.m_69.x;
    float _450 = in.m_69.y;
    float _452 = in.m_69.z;
    float _454 = in.m_69.w;
    float _456 = fma(_444, _444, _446);
    float _458 = rsqrt(_456);
    float _460 = _444 * _458;
    float _462 = _438 * _458;
    float _464 = _212 * _450;
    float _466 = _440 * _458;
    float _468 = -_460;
    float _470 = _300 * _468;
    float _472 = fma(_210, _448, _464);
    float _474 = _302 * _462;
    float _476 = -_466;
    float _478 = -_470;
    float _480 = fma(_302, _476, _478);
    float _482 = -_466;
    float _484 = _304 * _482;
    float _486 = fma(_214, _452, _472);
    float _488 = -_460;
    float _490 = -_474;
    float _492 = fma(_304, _488, _490);
    float _494 = _480 * _480;
    float _496 = -_484;
    float _498 = fma(_300, _462, _496);
    float _500 = _486 + _454;
    float _502 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _504 = _262 + _502;
    float _506 = fma(_492, _492, _494);
    float _508 = in.m_59.x;
    float _510 = in.m_59.y;
    float _512 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _514 = _500 + _512;
    float _516 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _518 = _266 + _516;
    float _520 = fma(_498, _498, _506);
    float _522 = _514 * _514;
    float _524 = rsqrt(_520);
    float _526 = fma(_504, _504, _522);
    float _528 = fma(_518, _518, _526);
    float _530 = sqrt(_528);
    float _532 = _492 * _524;
    float _534 = _498 * _524;
    float _536 = _480 * _524;
    float _538 = _302 * _532;
    float _540 = _304 * _534;
    float _542 = rsqrt(_528);
    float _544 = -_538;
    float _546 = fma(_300, _534, _544);
    float _548 = -_540;
    float _550 = fma(_302, _536, _548);
    float _552 = _300 * _536;
    float _554 = _530 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _556 = _546 * _546;
    float _558 = -_552;
    float _560 = fma(_304, _532, _558);
    float _562 = fma(_550, _550, _556);
    float _564 = precise::min(_226, _554);
    float _566 = _508 * 6.283185482025146484375;
    float _568 = fma(_560, _560, _562);
    float _570 = _542 * _564;
    float _572 = _566 * 0.15915493667125701904296875;
    float _574 = rsqrt(_568);
    float _576 = _514 * _570;
    float _578 = _504 * _570;
    float _580 = _518 * _570;
    float _582 = -_576;
    float _584 = _514 + _582;
    float _586 = -_578;
    float _588 = _504 + _586;
    float _590 = -_580;
    float _592 = _518 + _590;
    float _594 = _572 * 6.283185482025146484375;
    float _596 = cos(_594);
    float _598 = _584 * _584;
    float _600 = in.m_67.x;
    float _602 = in.m_67.y;
    float _604 = fma(_588, _588, _598);
    float _606 = _560 * _574;
    float _608 = _550 * _574;
    float _610 = _546 * _574;
    float _612 = fma(_592, _592, _604);
    float _614 = _300 * _606;
    float _616 = _304 * _608;
    float _618 = _302 * _610;
    float _620 = _572 * 6.283185482025146484375;
    float _622 = sin(_620);
    float _624 = -_614;
    float _626 = fma(_302, _608, _624);
    float _628 = -_616;
    float _630 = fma(_300, _610, _628);
    float _632 = -_618;
    float _634 = fma(_304, _606, _632);
    float _636 = _626 * _626;
    float _638 = sqrt(_612);
    float _640 = fma(_634, _634, _636);
    float _642 = fma(_630, _630, _640);
    float _644 = _596 * _602;
    float _646 = _622 * _602;
    float _648 = fma(_622, _600, _644);
    float _650 = rsqrt(_642);
    float _652 = -_646;
    float _654 = fma(_596, _600, _652);
    float _656 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _648);
    float _658 = _542 * _638;
    float _660 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _654);
    float _662 = _236 * _658;
    float _664 = _216 * _658;
    float _666 = _238 * _658;
    float _668 = _662 * _656;
    float _670 = _664 * _660;
    float _672 = _666 * _242;
    float _674 = _630 * _650;
    float _676 = _668 * _606;
    float _678 = _668 * _608;
    float _680 = _634 * _650;
    float _682 = _668 * _610;
    float _684 = fma(_670, _674, _676);
    float _686 = _626 * _650;
    float _688 = fma(_670, _680, _678);
    float _690 = fma(_672, _302, _684);
    float _692 = fma(_670, _686, _682);
    float _694 = fma(_672, _300, _688);
    float _696 = _266 + _690;
    float _698 = fma(_672, _304, _692);
    float _700 = _262 + _694;
    float _702 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _704 = _696 + _702;
    float _706 = _250 + _698;
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
    float _744 = _692;
    float _746 = _696;
    float _748 = _706;
    float _750 = _576;
    float _752 = _266;
    float _754 = _250;
    float _756 = _580;
    if (!_718)
    {
        _744 = _700;
    }
    float _758 = _744;
    bool _760 = !_718;
    float _762 = _758;
    if (!_760)
    {
        float _764 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _766 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _768 = _716 + _766;
        float _770 = _706 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _772 = rsqrt(_714);
        float _774 = _768 * _764;
        float _776 = _774 * 0.15915493667125701904296875;
        float _778 = _776 * 6.283185482025146484375;
        float _780 = cos(_778);
        float _782 = _776 * 6.283185482025146484375;
        float _784 = sin(_782);
        float _786 = _780 + (-1.0);
        float _788 = _786 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _790 = fma(_784, _770, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _792 = fma(_706, _780, _788);
        float _794 = _772 * _790;
        float _796 = fma(_710, _794, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _798 = fma(_704, _794, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _762 = _796;
        _746 = _798;
        _748 = _792;
    }
    float _800 = _762;
    float _802 = _746;
    float _804 = _748;
    float _806 = -_578;
    float _808 = _806 + _800;
    float _810 = -_580;
    float _812 = _810 + _802;
    float _814 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _816 = _808 + _814;
    float _818 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _820 = _812 + _818;
    float _822 = fma(_816, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _824 = fma(_820, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _3958 = float2(_822, _824);
    float _826 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_3958, float2(0.0), isnan(_3958)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_3958, float2(0.0), isnan(_3958)), level(0.0)).x;
    float _828 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _830 = int(_828);
    int _832 = abs(_738);
    float _834 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _836 = int(_834);
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _842 = float(_830);
    float _844 = 1.0 / _840;
    float _846 = float(uint(_836));
    float _848 = 1.0 / _842;
    int _850 = ~_836;
    int _852 = _850 + 1;
    bool _854 = _836 == 0;
    float _856 = 1.0 / _846;
    float _858 = _126 * _848;
    int _860 = ~_836;
    int _862 = _860 + 1;
    float _864 = float(_836);
    float _866 = trunc(_858);
    int _868 = int(_866);
    int _870 = as_type<int>(_856) + (-2);
    float _872 = float(uint(_868));
    float _874 = as_type<float>(_870) * _872;
    float _876 = trunc(_874);
    float _878 = precise::max(_876, 0.0);
    uint _881 = uint(_878);
    float _883 = float(_868);
    bool _885 = _883 >= _864;
    bool _887 = isnan(_883);
    bool _889 = _885 || _887;
    bool _891 = isnan(_864);
    bool _893 = _889 || _891;
    float _895 = float(_893);
    int _897 = _862 * int(_881);
    int _899 = _897 + _868;
    float _901 = trunc(_895);
    int _903 = int(_901);
    float _905 = float(uint(_899));
    float _907 = as_type<float>(_870) * _905;
    int _909 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _911 = _909 != 0;
    float _913 = trunc(_907);
    float _915 = precise::max(_913, 0.0);
    uint _917 = uint(_915);
    bool _919 = !_911;
    float _921 = _919 ? 7.345489978790283203125 : 1.0;
    float _923 = _921 * _508;
    float _925 = floor(_923);
    int _927 = int(_881) + int(_917);
    int _929 = _852 * _927;
    int _931 = _929 + _868;
    bool _933 = uint(_931) >= uint(_836);
    float _935 = -_925;
    float _937 = _923 + _935;
    int _939 = ~_903;
    int _941 = _939 + 1;
    int _943 = _941 + 1;
    bool _945 = !_933;
    int _947 = _945 ? 0 : (-1);
    int _949 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _951 = _949 != 0;
    float _953 = _126 * _864;
    int _955 = ~_927;
    int _957 = _955 + _947;
    int _959 = _957 + 1;
    float _961 = _937 * _864;
    float _963 = _953 * _176;
    int _965 = _836 + (-1);
    int _967 = _836 * _959;
    int _969 = _967 + _868;
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _973 = _971 != 0;
    float _975 = trunc(_961);
    int _977 = int(_975);
    bool _979 = !_854;
    int _981 = _979 ? _969 : (-1);
    bool _983 = !_973;
    int _985 = _983 ? 0 : 1;
    bool _987 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _989 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _991 = _987 || _989;
    bool _993 = isnan(0.5);
    bool _995 = _991 || _993;
    float _997 = trunc(_963);
    int _999 = int(_997);
    int _1001 = _981 * _943;
    int _1003 = abs(_734);
    int _1005 = abs(_985);
    int _1007 = _903 * _965;
    int _1009 = _1007 + _1001;
    int _1011 = abs(_742);
    int _1013 = _1009 * _1003;
    bool _1015 = !_951;
    int _1017 = _1015 ? 0 : 1;
    int _1019 = _977 * _1005;
    int _1021 = _1019 + _868;
    float _1023 = _802;
    float _1025 = _808;
    float _1027 = _961;
    if (!_995)
    {
        float _1029 = -_266;
        float _1031 = _1029 + _802;
        _1023 = _1031;
    }
    float _1033 = _1023;
    int _1035 = abs(_1017);
    int _1037 = _999 * _832;
    int _1039 = _1037 + _1013;
    float _1041 = -_576;
    float _1043 = _1041 + _250;
    float _1045 = as_type<float>(_999);
    float _1047 = as_type<float>(_1035);
    float _1049 = _1043;
    if (!_995)
    {
        float _1051 = -_262;
        float _1053 = _1051 + _800;
        _1045 = _1053;
    }
    float _1055 = _1045;
    float _1057 = -_578;
    float _1059 = _262 + _1057;
    float _1061 = -_576;
    float _1063 = _1061 + _804;
    int _1065 = _1021 * _1011;
    int _1067 = _1065 + _1039;
    float _1069 = _1063;
    if (!_995)
    {
        float _1071 = -_250;
        float _1073 = _1071 + _804;
        _750 = _1073;
    }
    float _1075 = _750;
    float _1077 = -_580;
    float _1079 = _266 + _1077;
    if (_995)
    {
        _752 = _812;
    }
    float _1081 = _752;
    int _1083 = _977 * _1035;
    int _1085 = _1083 + _1067;
    float _1087 = _1081;
    if (!_995)
    {
        float _1089 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1091 = _1059 + _1089;
        _1047 = _1091;
    }
    float _1093 = _1047;
    float _1095 = fma(_826, 100.0, _1043);
    float _1097 = _1093;
    if (!_995)
    {
        float _1099 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        _1049 = _1099;
    }
    float _1101 = _1049;
    if (!_995)
    {
        float _1103 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1105 = _1095 + _1103;
        _754 = _1105;
    }
    float _1107 = _754;
    float _1109 = _1107;
    if (!_995)
    {
        float _1111 = _1107 * _1107;
        _1109 = _1111;
    }
    float _1113 = _1109;
    float _1115 = _1113;
    if (!_995)
    {
        float _1117 = fma(_1093, _1093, _1113);
        _1115 = _1117;
    }
    float _1119 = _1115;
    if (!_995)
    {
        float _1121 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1123 = _1079 + _1121;
        _1097 = _1123;
    }
    float _1125 = _1097;
    float _1127 = _1125;
    if (!_995)
    {
        float _1129 = fma(_1125, _1125, _1119);
        _756 = _1129;
    }
    float _1131 = _756;
    float _1133 = fma(_826, 100.0, _1063);
    float _1135 = _1131;
    float _1137 = _1133;
    if (!_995)
    {
        float _1139 = sqrt(_1131);
        _1135 = _1139;
    }
    float _1141 = _1135;
    if (!_995)
    {
        float _1143 = precise::min(_1141, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        _1127 = _1143;
    }
    float _1145 = _1127;
    float _1147 = _1145;
    if (!_995)
    {
        float _1149 = _1145 * _1101;
        _1069 = _1149;
    }
    float _1151 = _1069;
    if (_995)
    {
        _1147 = _808;
    }
    float _1153 = _1147;
    float _1155 = _1153;
    if (!_995)
    {
        float _1157 = fma(_1075, _1151, _1095);
        _1137 = _1157;
    }
    float _1159 = _1137;
    if (!_995)
    {
        float _1161 = fma(_1055, _1151, _1059);
        _1155 = _1161;
    }
    float _1163 = _1155;
    if (!_995)
    {
        float _1165 = fma(_1033, _1151, _1079);
        _1087 = _1165;
    }
    float _1167 = _1087;
    float _1169 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1171 = _1159 + _1169;
    float _1173 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1175 = _1163 + _1173;
    float _1177 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1179 = _1167 + _1177;
    float _1181 = _1171 * _1171;
    float _1183 = fma(_1175, _1175, _1181);
    float _1185 = fma(_1179, _1179, _1183);
    float _1187 = rsqrt(_1185);
    float _1189 = _1187 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1191 = _1175 * _1189;
    float _1193 = _1179 * _1189;
    float _1195 = _1191 * _1191;
    float _1197 = _1193 * _1193;
    float _1199 = _1195 + _1197;
    float _1201 = sqrt(_1199);
    bool _1203 = _1201 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1205 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1207 = _1201 + _1205;
    float _1209 = _1187;
    float _1211 = _1207;
    float _1213 = _1171;
    float _1215 = _1189;
    if (_1203)
    {
        float _1217 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1209 = _1217;
    }
    float _1219 = _1209;
    float _1221 = _1219;
    if (_1203)
    {
        float _1223 = _1207 * _1219;
        _1211 = _1223;
    }
    float _1225 = _1211;
    if (_1203)
    {
        float _1227 = rsqrt(_1199);
        _1221 = _1227;
    }
    float _1229 = _1221;
    float _1231 = _1229;
    if (_1203)
    {
        float _1233 = _1225 * 0.15915493667125701904296875;
        _1025 = _1233;
    }
    float _1235 = _1025;
    float _1237 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1239 = _1179;
    float _1241 = _1235;
    if (_1203)
    {
        float _1243 = _1235 * 6.283185482025146484375;
        float _1245 = sin(_1243);
        _1239 = _1245;
    }
    float _1247 = _1239;
    float _1249 = precise::max(0.0, _1237);
    float _1251 = _1033;
    float _1253 = _1249;
    if (_1203)
    {
        float _1255 = _1235 * 6.283185482025146484375;
        float _1257 = cos(_1255);
        _1251 = _1257;
    }
    float _1259 = _1251;
    float _1261 = -_1189;
    float _1263 = -_1249;
    float _1265 = fma(_1171, _1261, _1263);
    if (_1203)
    {
        float _1267 = _1265 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1213 = _1267;
    }
    float _1269 = _1213;
    float _1271 = _1247;
    float _1273 = _1269;
    if (_1203)
    {
        float _1275 = fma(_1247, _1269, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1271 = _1275;
    }
    float _1277 = _1271;
    float _1279 = _1277;
    if (!_1203)
    {
        _1273 = _1265;
    }
    float _1281 = _1273;
    float _1283 = _1281;
    if (!_1203)
    {
        _1241 = _1195;
    }
    float _1285 = _1241;
    float _1287 = _1285;
    if (_1203)
    {
        float _1289 = _1229 * _1277;
        _1027 = _1289;
    }
    float _1291 = _1027;
    if (!_1203)
    {
        _1231 = _1191;
    }
    float _1293 = _1231;
    float _1295 = _1293;
    float _1297 = _1259;
    if (_1203)
    {
        float _1299 = _1259 + (-1.0);
        _1253 = _1299;
    }
    float _1301 = _1253;
    if (_1203)
    {
        float _1303 = _1191 * _1291;
        _1295 = _1303;
    }
    float _1305 = _1295;
    if (!_1203)
    {
        _1279 = _1193;
    }
    float _1307 = _1279;
    float _1309 = _1307;
    if (_1203)
    {
        float _1311 = _1193 * _1291;
        _1309 = _1311;
    }
    float _1313 = _1309;
    if (_1203)
    {
        float _1315 = _1301 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1215 = _1315;
    }
    float _1317 = _1215;
    if (_1203)
    {
        float _1319 = _1305 * _1305;
        _1287 = _1319;
    }
    float _1321 = _1287;
    float _1323 = sqrt(_1185);
    if (_1203)
    {
        float _1325 = fma(_1265, _1259, _1317);
        _1283 = _1325;
    }
    float _1327 = _1283;
    if (!_1203)
    {
        _1297 = _1197;
    }
    float _1329 = _1297;
    float _1331 = _1329;
    if (_1203)
    {
        float _1333 = _1313 * _1313;
        _1331 = _1333;
    }
    float _1335 = _1331;
    float _1337 = fma(_1327, _1327, _1321);
    float _1339 = _1337 + _1335;
    float _1341 = fma(_1079, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1343 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1345 = rsqrt(_1339);
    float _1347 = fma(_1059, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1349 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1351 = fma(_1323, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1349);
    float _1353 = precise::clamp(_1351, 0.0, 1.0);
    float _1355 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1343);
    float _1357 = -_1353;
    float _1359 = _1357 + 1.0;
    float _1361 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1355);
    float _1363 = floor(_1347);
    float _1365 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1367 = _1345 * _1305;
    float _1369 = _1345 * _1327;
    float _1371 = _1345 * _1313;
    float _1373 = _1367 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1375 = abs(_1359);
    float _1377 = log2(_1375);
    float _1379 = _1369 + 1.0;
    float _1381 = -_1373;
    float _1383 = fma(_1369, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1381);
    float _1385 = -_1363;
    float _1387 = _1347 + _1385;
    float _1389 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1391 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1393 = -_1371;
    float _1395 = fma(_1393, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1383);
    float _1397 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1399 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1401 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1391);
    float _1403 = floor(_1341);
    float _1405 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1397);
    float _1407 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1399);
    float _1409 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1401);
    float _1411 = fma(_1395, -0.5, 0.5);
    float _1413 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1405);
    float _1415 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1407);
    float _1417 = _1409 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1419 = _1377 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1421 = _1413 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1423 = _1415 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1425 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1427 = exp2(_1419);
    float _1429 = fma(_1395, 0.5, 0.5);
    float _1431 = _1423 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1433 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1425);
    float _1435 = -_1403;
    float _1437 = _1341 + _1435;
    float _1439 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1441 = fma(_1429, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1443 = sqrt(_1411);
    float _1445 = -_1431;
    float _1447 = fma(_1445, _1389, 1.0);
    float _1449 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1433);
    float _1451 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1453 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1439);
    float _1455 = fma(_1429, _1441, -0.212114393711090087890625);
    float _1457 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1449);
    float _1459 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1451);
    float _1461 = log2(_1447);
    float _1463 = -_1369;
    float _1465 = fma(_1427, _1379, _1463);
    float _1467 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1453);
    float _1469 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1459);
    float _1471 = fma(_1429, _1455, 1.570728778839111328125);
    float2 _4976 = float2(_1387, _1437);
    float _1473 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4976, float2(0.0), isnan(_4976)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4976, float2(0.0), isnan(_4976)), level(0.0)).x;
    float _1475 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1467);
    float _1477 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1469);
    float _1479 = 1.0 / _1457;
    float _1481 = _1443 * 0.636619746685028076171875;
    float _1483 = in.m_71.y;
    float _1485 = -_1471;
    float _1487 = fma(_1481, _1485, 1.0);
    float _1489 = float(uint(_1085));
    float _1491 = _1461 * 0.693147182464599609375;
    float _1493 = as_type<float>(_870) * _1489;
    float _1495 = _1491 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1497 = fma(_1465, 0.5, 0.5);
    float _1499 = _1477 * _1479;
    float _1501 = _1475 * _1479;
    float _1503 = trunc(_1493);
    float _1505 = precise::max(_1503, 0.0);
    uint _1507 = uint(_1505);
    float _1509 = fma(_1499, 0.5, 0.5);
    float _1511 = fma(_1501, -0.5, 0.5);
    float3 _5039 = float3(_1509, _1511, _1495);
    float _1513 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5039, float3(0.0), isnan(_5039)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5039, float3(0.0), isnan(_5039)), level(0.0)).x;
    float3 _5050 = float3(_1509, _1511, _1495);
    float4 _1516 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5050, float3(0.0), isnan(_5050)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5050, float3(0.0), isnan(_5050)), level(0.0)).xyzw;
    float _1518 = _1516.x;
    float _1520 = _1516.y;
    float _1522 = _1516.z;
    float _1524 = _1516.w;
    float2 _5066 = float2(_1487, _1497);
    float3 _1528 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5066, float2(0.0), isnan(_5066)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5066, float2(0.0), isnan(_5066)), level(0.0)).xyz;
    float _1530 = _1528.x;
    float _1532 = _1528.y;
    float _1534 = _1528.z;
    int _1536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1538 = _1536 != 0;
    float _1540 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1542 = _1540 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    out.m_73.w = _564;
    int _1544 = ~_836;
    int _1546 = _1544 + 1;
    float _1548 = -_1483;
    float _1550 = _1548 + 1.0;
    float _1552 = 1.0 / _1542;
    bool _1554 = _510 > 0.5;
    float _1556 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1558 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1560 = _1546 * int(_1507);
    int _1562 = _1560 + _1085;
    int _1564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1566 = _1564 != 0;
    float _1568 = _508 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1570 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1572 = _1570 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1574 = _1483;
    float _1576 = _1457;
    if (_1538)
    {
        float _1578 = _1554 ? _1550 : _1483;
        _1574 = _1578;
    }
    float _1580 = _1574;
    float _1582 = _510 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1584 = float(uint(_1562));
    float _1586 = -_1558;
    float _1588 = fma(_1568, 2.0, _1586);
    float _1590 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1592 = _1590 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1594 = 1.0 / _1572;
    float _1596 = as_type<float>(_870) * _1584;
    float _1598 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[118].w;
    if (_1566)
    {
        float _1602 = in.m_59.x;
        _1600 = _1602;
    }
    float _1604 = _1600;
    float _1606 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1608 = 1.0 / _1592;
    float _1610 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1598);
    float _1612 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1614 = fma(_1582, -2.0, _1606);
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1618 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1616;
    float _1620 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1612);
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1624 = _1622 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1626 = trunc(_1596);
    float _1628 = precise::max(_1626, 0.0);
    uint _1630 = uint(_1628);
    float _1632 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1634 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1632;
    float _1636 = _1618 * _844;
    float _1638 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1640 = _1638 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1642 = _1624 * _1552;
    float _1644 = _1634 * _1594;
    int _1646 = ~_836;
    int _1648 = _1646 + 1;
    float _1650 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1614);
    float _1652 = _1640 * _1608;
    float _1654 = in.m_71.x;
    float _1656 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1610);
    float _1658 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1660 = _208 + _1658;
    bool _1662 = _1604 > 0.5;
    bool _1664 = _1662 && _1566;
    float _1666 = -_126;
    float _1668 = fma(_1666, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1588);
    bool _1670 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1672 = isnan(_208);
    bool _1674 = _1670 || _1672;
    bool _1676 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1678 = _1674 || _1676;
    float _1680 = float(_1678);
    float _1682 = fma(_1642, _1660, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _1684 = int(_1507) + int(_1630);
    float _1686 = fma(_1580, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1688 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1620);
    float _1690 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1692 = _208 + _1690;
    bool _1694 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1696 = isnan(_208);
    bool _1698 = _1694 || _1696;
    bool _1700 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1702 = _1698 || _1700;
    float _1704 = float(_1702);
    int _1706 = _1648 * _1684;
    int _1708 = _1706 + _1085;
    float _1710 = -_1650;
    float _1712 = fma(_1688, _1686, _1710);
    bool _1714 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1716 = isnan(_208);
    bool _1718 = _1714 || _1716;
    bool _1720 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1722 = _1718 || _1720;
    float _1724 = float(_1722);
    float _1726 = fma(_1636, _1692, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1728 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1730 = isnan(_208);
    bool _1732 = _1728 || _1730;
    bool _1734 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1736 = _1732 || _1734;
    float _1738 = float(_1736);
    float _1740 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1742 = _208 + _1740;
    bool _1744 = uint(_1708) >= uint(_836);
    float _1746 = -_1724;
    float _1748 = _1746 + 1.0;
    float _1750 = -_1680;
    float _1752 = _1750 + 1.0;
    float _1754 = float(uint(_1021));
    float _1756 = fma(_1644, _1742, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1758 = !_1744;
    int _1760 = _1758 ? 0 : (-1);
    float _1762 = _1680 * _1748;
    float _1764 = _1738 * _1752;
    float _1766 = -_1738;
    float _1768 = _1766 + 1.0;
    int _1770 = ~_1684;
    int _1772 = _1770 + _1760;
    int _1774 = _1772 + 1;
    float _1776 = -_1704;
    float _1778 = _1776 + 1.0;
    bool _1780 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1782 = isnan(_208);
    bool _1784 = _1780 || _1782;
    bool _1786 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1788 = _1784 || _1786;
    float _1790 = float(_1788);
    float _1792 = _1712 + 0.5;
    float _1794 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1556);
    int _1796 = _836 * _1774;
    int _1798 = _1796 + _1085;
    float _1800 = _1704 * _1768;
    float _1802 = _1790 * _1778;
    float _1804 = _1778;
    float _1806 = _1654;
    if (_1566)
    {
        _1804 = _1654;
    }
    float _1808 = _1804;
    float _1810 = as_type<float>(_870) * _1754;
    bool _1812 = !_854;
    int _1814 = _1812 ? _1798 : (-1);
    float _1816 = _1726 * _1802;
    float _1818 = -_1790;
    float _1820 = _1818 + 1.0;
    float _1822 = _1808;
    if (_1664)
    {
        float _1824 = -_1808;
        float _1826 = _1824 + 1.0;
        _1822 = _1826;
    }
    float _1828 = _1822;
    int _1830 = _1814 >> 31;
    float _1832 = trunc(_1810);
    float _1834 = precise::max(_1832, 0.0);
    uint _1836 = uint(_1834);
    int _1838 = _1814 & 3;
    bool _1840 = _1838 != 0;
    out.m_75.y = _648;
    int _1842 = _1830 & 3;
    float _1844 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1794);
    if (_1566)
    {
        _1806 = _1828;
    }
    float _1846 = _1806;
    float _1848 = fma(_1820, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1816);
    int _1850 = _1814 + _1842;
    float _1852 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1854 = _208 + _1852;
    int _1856 = ~_836;
    int _1858 = _1856 + 1;
    float _1860 = fma(_1846, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1862 = _1850 >> 2;
    float _1864 = fma(_1682, _1800, _1848);
    int _1866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1868 = _1866 != 0;
    float _1870 = fma(_1656, _1860, _1668);
    int _1872 = _1862 << 4;
    int _1874 = _1872 + 368;
    int _1876 = _1858 * int(_1836);
    int _1878 = _1876 + _1021;
    float _1880 = fma(_1652, _1854, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1882 = fma(_1756, _1764, _1864);
    uint _1884 = uint(int(uint(_1874) >> uint(2)));
    uint _1886 = uint(int(uint(int(_1884)) >> uint(2)));
    int _1888 = int(_1884) & 3;
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[int(_1886)][_1888];
    int _1892 = int(_1884) + 1;
    uint _1894 = uint(int(uint(_1892) >> uint(2)));
    int _1896 = _1892 & 3;
    float _1898 = (*spvDescriptorSet0.vp_c9)._m0[int(_1894)][_1896];
    int _1900 = _1814 & 3;
    bool _1902 = _1900 != 0;
    out.m_77.x = _664;
    float _1904 = float(uint(_1878));
    float _1906 = fma(_1880, _1762, _1882);
    bool _1908 = uint(_1900) > 1u;
    float _1910 = _1377 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1912 = as_type<float>(_870) * _1904;
    int _1914 = _1874 + 8;
    uint _1916 = uint(int(uint(_1914) >> uint(2)));
    uint _1918 = uint(int(uint(int(_1916)) >> uint(2)));
    int _1920 = int(_1916) & 3;
    float _1922 = (*spvDescriptorSet0.vp_c9)._m0[int(_1918)][_1920];
    int _1924 = int(_1916) + 1;
    uint _1926 = uint(int(uint(_1924) >> uint(2)));
    int _1928 = _1924 & 3;
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[int(_1926)][_1928];
    float _1932 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1934 = trunc(_1912);
    float _1936 = precise::max(_1934, 0.0);
    uint _1938 = uint(_1936);
    float _1940 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1944 = _1840 ? 0 : 1;
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1948 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1950 = _1940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1952 = _1942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1954 = _1870 + 0.5;
    int _1956 = ~_1944;
    int _1958 = _1956 + 1;
    int _1960 = _1958 + 1;
    float _1962 = exp2(_1910);
    int _1964 = ~_836;
    int _1966 = _1964 + 1;
    out.m_79.x = _1948;
    out.m_79.y = _1950;
    out.m_79.z = _1952;
    out.m_79.w = _1946;
    int _1968 = _1960;
    if (!_1908)
    {
        int _1970 = ~_1944;
        int _1972 = _1970 + 1;
        _1968 = _1972;
    }
    int _1974 = _1968;
    float _1976 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1844);
    bool _1978 = _1900 != 3;
    out.m_81.x = _1954;
    out.m_81.y = _1792;
    int _1980 = int(_1836) + int(_1938);
    out.m_83.x = _1059;
    out.m_83.y = _1095;
    out.m_83.z = _1079;
    bool _1982 = !_1902;
    int _1984 = _1982 ? 0 : 1;
    bool _1986 = uint(_1900) >= 2u;
    int _1988 = _1966 * _1980;
    int _1990 = _1988 + _1021;
    int _1992 = abs(_1984);
    float _1994 = fma(_1724, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1906);
    int _1996 = abs(_1974);
    int _1998 = ~_1992;
    int _2000 = _1998 + 1;
    int _2002 = _2000 + 1;
    float _2004 = _1994 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2006 = ~_1996;
    int _2008 = _2006 + 1;
    int _2010 = _2008 + 1;
    int _2012 = _2010 * as_type<int>(_1898);
    int _2014 = _1986 ? 0 : 1;
    int _2016 = _2002 * as_type<int>(_1890);
    int _2018 = _2016 + _2012;
    bool _2020 = _1900 != 3;
    float _2022 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2024 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2028 = ~_2014;
    int _2030 = _2028 + 1;
    int _2032 = _2030 + 1;
    float _2034 = _2022 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2036 = _2024 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2038 = _2026 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2040 = _2032;
    float _2042 = _1976;
    if (_1978)
    {
        int _2044 = ~_2014;
        int _2046 = _2044 + 1;
        _2040 = _2046;
    }
    int _2048 = _2040;
    bool _2050 = uint(_1990) >= uint(_836);
    float _2052 = in.m_85.x;
    float _2054 = in.m_85.y;
    float _2056 = in.m_85.z;
    bool _2058 = !_1868;
    int _2060 = _2058 ? 0 : 1;
    bool _2062 = !_2020;
    int _2064 = _2062 ? 0 : (-1);
    out.m_87.x = _2034;
    out.m_87.y = _2036;
    out.m_87.z = _2038;
    out.m_87.w = _2004;
    int _2066 = abs(_2048);
    int _2068 = abs(_2060);
    bool _2070 = !_2050;
    int _2072 = _2070 ? 0 : (-1);
    int _2074 = abs(_2064);
    int _2076 = ~_2066;
    int _2078 = _2076 + 1;
    int _2080 = _2078 + 1;
    int _2082 = ~_1980;
    int _2084 = _2082 + _2072;
    int _2086 = _2084 + 1;
    float _2088 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2090 = ~_2074;
    int _2092 = _2090 + 1;
    int _2094 = _2092 + 1;
    int _2096 = _2080 * as_type<int>(_1922);
    int _2098 = _2096 + _2018;
    int _2100 = ~_2068;
    int _2102 = _2100 + 1;
    int _2104 = _2102 + 1;
    float _2106 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2088);
    int _2108 = _836 * _2086;
    int _2110 = _2108 + _1021;
    bool _2112 = _648 != 0.0;
    bool _2114 = isnan(_648);
    bool _2116 = _2112 || _2114;
    bool _2118 = isnan(0.0);
    bool _2120 = _2116 || _2118;
    int _2122 = _2094 * as_type<int>(_1930);
    int _2124 = _2122 + _2098;
    float _2126 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2106);
    float _2128 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2130 = _654 == 0.0;
    bool _2132 = !_2120;
    bool _2134 = _2130 && _2132;
    int _2136 = _2124 * _2104;
    float _2138 = _2126 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2140 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2128);
    bool _2142 = !_854;
    int _2144 = _2142 ? _2110 : (-1);
    float _2146 = in.m_65.x;
    float _2148 = 1.0 / _2138;
    float _2150 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2140);
    bool _2152 = _242 == 0.0;
    bool _2154 = _2152 && _2134;
    int _2156 = _2144 * _2068;
    int _2158 = _2156 + _2136;
    float _2160 = _2150 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2162 = _1457 * 0.5;
    float _2164 = float(_2158);
    float _2166 = _2160 + _2138;
    out.m_89.x = _2164;
    float _2168 = _2054;
    float _2170 = _2052;
    float _2172 = _2056;
    float _2174 = _2162;
    if (!_2154)
    {
        float _2176 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2054);
        _2168 = _2176;
    }
    float _2178 = _2168;
    float _2180 = _2166 * _2148;
    float _2182 = _2180 * 0.5;
    if (!_2154)
    {
        float _2184 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2052);
        _2170 = _2184;
    }
    float _2186 = _2170;
    if (!_2154)
    {
        float _2188 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2056);
        _2172 = _2188;
    }
    float _2190 = _2172;
    float _2192 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2194 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2192);
    bool _2196 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2198 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2200 = _2196 || _2198;
    bool _2202 = isnan(0.5);
    bool _2204 = _2200 || _2202;
    float _2206 = _608 * _2178;
    float _2208 = _610 * _2178;
    float _2210 = _606 * _2178;
    float _2212 = _1976 + _1457;
    float _2214 = 1.0 / _2194;
    float _2216 = fma(_680, _2186, _2206);
    float _2218 = fma(_686, _2186, _2208);
    float _2220 = fma(_674, _2186, _2210);
    float _2222 = _2212 * 0.5;
    float _2224 = fma(_300, _2190, _2216);
    float _2226 = fma(_304, _2190, _2218);
    float _2228 = fma(_302, _2190, _2220);
    float _2230 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2232 = _2214 * _2230;
    float _2234 = fma(_1475, -0.5, _2162);
    if (_2204)
    {
        _2174 = 1.0;
    }
    float _2236 = _2174;
    float _2238 = abs(_2232);
    float _2240 = log2(_2238);
    bool _2242 = _2232 <= 8000.0;
    bool _2244 = isnan(_2232);
    bool _2246 = _2242 || _2244;
    bool _2248 = isnan(8000.0);
    bool _2250 = _2246 || _2248;
    float _2252 = float(_2250);
    float _2254 = _2240 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2256 = exp2(_2254);
    float _2258 = fma(_2256, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2260 = precise::clamp(_2258, 0.0, 1.0);
    float _2262 = fma(_2260, -2.0, 3.0);
    float _2264 = _2260 * _2260;
    float _2266 = _2264 * _2262;
    float _2268 = -_2266;
    float _2270 = _2268 + 1.0;
    float _2272 = fma(_2270, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2266);
    float _2274 = _2270;
    float _2276 = _2236;
    if (_2204)
    {
        _2274 = 1.0;
    }
    float _2278 = _2274;
    float _2280 = _2252 * _2272;
    float _2282 = _1477 + _1457;
    float _2284 = _2282 * 0.5;
    float _2286 = _2278;
    if (!_2204)
    {
        float _2288 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2290 = _2288 * 0.15915493667125701904296875;
        float _2292 = _2290 * 6.283185482025146484375;
        float _2294 = cos(_2292);
        float _2296 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2298 = _2296 * 0.15915493667125701904296875;
        float _2300 = _2290 * 6.283185482025146484375;
        float _2302 = sin(_2300);
        float _2304 = 1.0 / _2294;
        float _2306 = _2298 * 6.283185482025146484375;
        float _2308 = cos(_2306);
        float _2310 = _2302 * _2304;
        float _2312 = _2298 * 6.283185482025146484375;
        float _2314 = sin(_2312);
        float _2316 = _2308 * _2310;
        float _2318 = 1.0 / _2316;
        float _2320 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2322 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2320;
        float _2324 = 1.0 / _2322;
        float _2326 = _2314 * _2318;
        float _2328 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2330 = fma(_2232, _2326, _2328);
        float _2332 = _2330 * _2324;
        float _2334 = precise::clamp(_2332, 0.0, 1.0);
        _2276 = _2334;
    }
    float _2336 = _2276;
    if (!_2204)
    {
        float _2338 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2340 = _2338 * 0.15915493667125701904296875;
        float _2342 = _2340 * 6.283185482025146484375;
        float _2344 = cos(_2342);
        float _2346 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2348 = _2346 * 0.15915493667125701904296875;
        float _2350 = _2340 * 6.283185482025146484375;
        float _2352 = sin(_2350);
        float _2354 = 1.0 / _2344;
        float _2356 = _2348 * 6.283185482025146484375;
        float _2358 = cos(_2356);
        float _2360 = _2352 * _2354;
        float _2362 = _2348 * 6.283185482025146484375;
        float _2364 = sin(_2362);
        float _2366 = _2358 * _2360;
        float _2368 = 1.0 / _2366;
        float _2370 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2372 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2370;
        float _2374 = 1.0 / _2372;
        float _2376 = _2364 * _2368;
        float _2378 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2380 = fma(_2232, _2376, _2378);
        float _2382 = _2380 * _2374;
        float _2384 = precise::clamp(_2382, 0.0, 1.0);
        float _2386 = -_2384;
        float _2388 = _2386 + 1.0;
        _2286 = _2388;
    }
    float _2390 = _2286;
    float _2392 = -_1962;
    float _2394 = _2392 + 1.0;
    float _2396 = _2280 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2398 = -_1473;
    float _2400 = _2398 + 1.0;
    float _2402 = _2394 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_91.x = _2284;
    out.m_91.y = _2234;
    out.m_91.z = _2222;
    out.m_91.w = _1457;
    float _2404 = _2400 * _2396;
    float _2406 = precise::clamp(_2404, 0.0, 1.0);
    bool _2408 = _1323 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2410 = isnan(_1323);
    bool _2412 = _2408 || _2410;
    bool _2414 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2416 = _2412 || _2414;
    float _2418 = _2402 * _1513;
    float _2420 = -_2402;
    float _2422 = _2420 + 1.0;
    float _2424 = -_2406;
    float _2426 = fma(_2424, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_93.x = _2224;
    out.m_93.y = _2226;
    out.m_93.z = _2228;
    float _2428 = _1524 * _2418;
    float _2430 = _1534 * _2418;
    float _2432 = _2426 * _2146;
    float _2434 = _1524 * _2422;
    float _2436 = fma(_1530, _2428, _1518);
    float _2438 = fma(_1532, _2428, _1520);
    float _2440 = fma(_1524, _2430, _1522);
    out.m_95.x = _1163;
    out.m_95.y = _1159;
    out.m_95.z = _1167;
    float _2442 = _2428;
    float _2444 = _2432;
    if (!_2416)
    {
        _2442 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2446 = _2442;
    out.m_97.x = _2436;
    out.m_97.y = _2438;
    out.m_97.z = _2440;
    out.m_97.w = _2434;
    out.gl_Position.x = _1477;
    out.gl_Position.y = _1475;
    out.gl_Position.z = _1976;
    out.gl_Position.w = _1457;
    float _2448 = _2432 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2450 = _2336 * _2390;
    float _2452 = _2450;
    float _2454 = _2448;
    float _2456 = _2446;
    float _2458 = _2446;
    if (!_2416)
    {
        _2444 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2460 = _2444;
    float _2462 = _2460;
    float _2464 = _2460;
    if (!_2416)
    {
        _1576 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2466 = _1576;
    out.m_99.x = _2448;
    float _2468 = _2450 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2470 = _2466;
    float _2472 = _2466;
    if (!_2416)
    {
        _2042 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2474 = _2042;
    float _2476 = _2474;
    float _2478 = _2474;
    if (!_2416)
    {
        _2452 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2480 = _2452;
    float _2482 = _2480;
    float _2484 = _2480;
    if (!_2416)
    {
        _2454 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2486 = _2454;
    bool _2488 = !_2416;
    float _2490 = _2486;
    float _2492 = _2486;
    if (!_2488)
    {
        bool _2494 = _1323 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2496 = isnan(_1323);
        bool _2498 = _2494 || _2496;
        bool _2500 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2502 = _2498 || _2500;
        if (!_2502)
        {
            float _2504 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2506 = _1323 + _2504;
            float _2508 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2510 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2508;
            float _2512 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2514 = _2512 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2516 = 1.0 / _2510;
            float _2518 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2520 = _2518 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2522 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2524 = _2522 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2526 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2528 = _2526 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2532 = _2530 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2534 = _2506 * _2516;
            float _2536 = precise::clamp(_2534, 0.0, 1.0);
            float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2540 = _2538 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2542 = fma(_2536, _2514, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2544 = fma(_2536, _2540, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2546 = fma(_2536, _2520, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2548 = fma(_2536, _2524, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2550 = fma(_2536, _2528, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2552 = fma(_2536, _2532, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2464 = _2546;
            _2492 = _2550;
            _2458 = _2542;
            _2478 = _2548;
            _2472 = _2544;
            _2484 = _2552;
            _2554 = true;
        }
        else
        {
            bool _2556 = _1323 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2558 = isnan(_1323);
            bool _2560 = _2556 || _2558;
            bool _2562 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2564 = _2560 || _2562;
            if (!_2564)
            {
                _2456 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2566 = _2456;
            _2458 = _2566;
            if (!_2564)
            {
                _2462 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2568 = _2462;
            _2464 = _2568;
            if (!_2564)
            {
                _2470 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2570 = _2470;
            _2472 = _2570;
            if (!_2564)
            {
                _2476 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2572 = _2476;
            _2478 = _2572;
            if (!_2564)
            {
                _2490 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2574 = _2490;
            _2492 = _2574;
            if (!_2564)
            {
                _2482 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2576 = _2482;
            bool _2578 = !_2564;
            _2484 = _2576;
            if (!_2578)
            {
                bool _2580 = _1323 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2582 = isnan(_1323);
                bool _2584 = _2580 || _2582;
                bool _2586 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2588 = _2584 || _2586;
                if (!_2588)
                {
                    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2592 = _1323 + _2590;
                    float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2596 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2594;
                    float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2600 = _2598 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2602 = 1.0 / _2596;
                    float _2604 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2606 = _2604 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2612 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2614 = _2612 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2616 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2618 = _2616 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2620 = _2592 * _2602;
                    float _2622 = precise::clamp(_2620, 0.0, 1.0);
                    float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2626 = _2624 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2628 = fma(_2622, _2600, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2630 = fma(_2622, _2626, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2632 = fma(_2622, _2606, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2634 = fma(_2622, _2610, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2636 = fma(_2622, _2614, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2638 = fma(_2622, _2618, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2464 = _2632;
                    _2492 = _2636;
                    _2458 = _2628;
                    _2478 = _2634;
                    _2472 = _2630;
                    _2484 = _2638;
                    _2554 = true;
                }
                else
                {
                    _2464 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2492 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2458 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2478 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2472 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2484 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2554 = false;
    float _2640 = _2464;
    float _2642 = _2492;
    float _2644 = _2458;
    float _2646 = _2478;
    float _2648 = _2472;
    float _2650 = _2484;
    float _2652 = fma(_2226, -0.5, 0.5);
    float _2654 = precise::clamp(_2652, 0.0, 1.0);
    float _2656 = -_2640;
    float _2658 = _2656 + _2642;
    float _2660 = _2468 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2662 = -_2644;
    float _2664 = _2662 + _2646;
    float _2666 = fma(_2654, _2658, _2640);
    out.m_101.x = 0.0;
    float _2668 = -_2648;
    float _2670 = _2668 + _2650;
    float _2672 = fma(_2654, _2664, _2644);
    float _2674 = _2666 * 0.586610972881317138671875;
    out.m_55.x = _2660;
    bool _2676 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2678 = fma(_2654, _2670, _2648);
    float _2680 = fma(_2672, 0.298911988735198974609375, _2674);
    bool _2682 = _2336 > 0.0;
    bool _2684 = isnan(_2336);
    bool _2686 = _2682 || _2684;
    bool _2688 = isnan(0.0);
    bool _2690 = _2686 || _2688;
    float _2692 = fma(_2678, 0.114477999508380889892578125, _2680);
    bool _2694 = _2390 <= 0.0;
    bool _2696 = !_2690;
    bool _2698 = _2694 || _2696;
    float _2700 = -_2692;
    float _2702 = _2672 + _2700;
    float _2704 = -_2692;
    float _2706 = _2666 + _2704;
    float _2708 = -_2692;
    float _2710 = _2678 + _2708;
    float _2712 = fma(_2702, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2692);
    float _2714 = fma(_2706, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2692);
    float _2716 = fma(_2710, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2692);
    bool _2718 = !_2676;
    if (!_2718)
    {
        float _2720 = -_1159;
        float _2722 = _2720 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2724 = -_1163;
        float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2728 = -_1167;
        float _2730 = _2728 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2732 = _2722 * _2722;
        float _2734 = fma(_2726, _2726, _2732);
        float _2736 = fma(_2730, _2730, _2734);
        float _2738 = sqrt(_2736);
        float _2740 = rsqrt(_2736);
        float _2742 = -_2738;
        float _2744 = _2742 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2746 = _2744 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2748 = precise::clamp(_2746, 0.0, 1.0);
        float _2750 = _2726 * _2740;
        float _2752 = _2722 * _2740;
        float _2754 = abs(_2748);
        float _2756 = log2(_2754);
        float _2758 = _2730 * _2740;
        float _2760 = _2750 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2762 = _2226 * _2752;
        float _2764 = -_2752;
        float _2766 = -_2760;
        float _2768 = fma(_2764, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2766);
        float _2770 = fma(_2224, _2750, _2762);
        float _2772 = -_2758;
        float _2774 = fma(_2772, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2768);
        float _2776 = fma(_2228, _2758, _2770);
        float _2778 = precise::clamp(_2776, 0.0, 1.0);
        float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2782 = _2774 + _2780;
        float _2784 = _2756 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2786 = _2782 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2788 = precise::clamp(_2786, 0.0, 1.0);
        float _2790 = exp2(_2784);
        float _2792 = _2790 * _2788;
        float _2794 = _2778 * _2792;
        float _2796 = _2794 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2798 = _2794 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2800 = _2794 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _2796;
        out.m_101.y = _2798;
        out.m_101.z = _2800;
    }
    out.m_73.x = _2712;
    out.m_73.y = _2714;
    out.m_73.z = _2716;
    if (!_2698)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_55.x = 0.0;
    float _2802 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2802;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2554 = false;
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
    float _134 = _117;
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
        float _2869 = as_type<float>(_142);
        out.gl_Position.z = _2869;
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
        float _2924 = as_type<float>(_168);
        out.gl_Position.z = _2924;
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
    float _226 = _216 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _228 = in.m_63.x;
    float _230 = in.m_63.y;
    float _232 = in.m_63.z;
    float _234 = in.m_63.w;
    float _236 = _184 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _238 = _186 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _240 = in.m_65.y;
    float _242 = in.m_67.z;
    float _244 = _212 * _220;
    float _246 = _212 * _230;
    float _248 = fma(_210, _218, _244);
    float _250 = _212 + _240;
    float _252 = fma(_210, _228, _246);
    float _254 = fma(_214, _222, _248);
    float _256 = -_250;
    float _258 = _256 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _260 = fma(_214, _232, _252);
    float _262 = _254 + _224;
    float _264 = _258 * _258;
    float _266 = _260 + _234;
    float _268 = -_262;
    float _270 = _268 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _272 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _274 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _276 = -_266;
    float _278 = _276 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _280 = fma(_270, _270, _264);
    float _282 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _284 = -_274;
    float _286 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _284);
    float _288 = -_272;
    float _290 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _288);
    float _292 = fma(_278, _278, _280);
    float _294 = -_282;
    float _296 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _294);
    float _298 = rsqrt(_292);
    float _300 = _270 * _298;
    float _302 = _278 * _298;
    float _304 = _258 * _298;
    float _306 = _296 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _308 = _300 * _300;
    float _310 = fma(_302, _302, _308);
    float _312 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _314 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _316 = rsqrt(_310);
    float _318 = -_312;
    float _320 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _318);
    float _322 = -_314;
    float _324 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _322);
    float _326 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _328 = _320 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _330 = _324 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _332 = -_326;
    float _334 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _332);
    float _336 = _324 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _338 = -_328;
    float _340 = fma(_286, (*spvDescriptorSet0.vp_c8)._m0[1].y, _338);
    float _342 = -_330;
    float _344 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[1].x, _342);
    float _346 = -_336;
    float _348 = fma(_286, (*spvDescriptorSet0.vp_c8)._m0[1].x, _346);
    float _350 = fma(_290, (*spvDescriptorSet0.vp_c8)._m0[1].w, _340);
    float _352 = fma(_334, (*spvDescriptorSet0.vp_c8)._m0[1].w, _344);
    float _354 = _302 * _316;
    float _356 = _300 * _316;
    float _358 = fma(_296, (*spvDescriptorSet0.vp_c8)._m0[1].w, _348);
    float _360 = -_354;
    float _362 = _302 * _360;
    float _364 = -_354;
    float _366 = _304 * _364;
    float _368 = _358 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _370 = -_362;
    float _372 = fma(_300, _356, _370);
    float _374 = _304 * _356;
    float _376 = -_368;
    float _378 = fma(_350, (*spvDescriptorSet0.vp_c8)._m0[0].x, _376);
    float _380 = -_306;
    float _382 = fma(_290, (*spvDescriptorSet0.vp_c8)._m0[1].x, _380);
    float _384 = _372 * _372;
    float _386 = _324 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _388 = fma(_352, (*spvDescriptorSet0.vp_c8)._m0[0].z, _378);
    float _390 = fma(_334, (*spvDescriptorSet0.vp_c8)._m0[1].z, _382);
    float _392 = fma(_374, _374, _384);
    float _394 = -_386;
    float _396 = fma(_286, (*spvDescriptorSet0.vp_c8)._m0[0].x, _394);
    float _398 = _320 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _400 = -_390;
    float _402 = fma(_400, (*spvDescriptorSet0.vp_c8)._m0[0].w, _388);
    float _404 = fma(_366, _366, _392);
    float _406 = fma(_296, (*spvDescriptorSet0.vp_c8)._m0[0].w, _396);
    float _408 = -_398;
    float _410 = fma(_286, (*spvDescriptorSet0.vp_c8)._m0[0].y, _408);
    float _412 = 1.0 / _402;
    float _414 = _324 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _416 = fma(_290, (*spvDescriptorSet0.vp_c8)._m0[0].w, _410);
    float _418 = -_414;
    float _420 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[0].x, _418);
    float _422 = rsqrt(_404);
    float _424 = fma(_334, (*spvDescriptorSet0.vp_c8)._m0[0].w, _420);
    float _426 = fma(_406, _412, -1.0);
    float _428 = _372 * _422;
    float _430 = precise::clamp(_428, 0.0, 1.0);
    float _432 = -_430;
    float _434 = _432 + 1.0;
    float _436 = _434 * _412;
    float _438 = fma(_434, _426, 1.0);
    float _440 = _416 * _436;
    float _442 = _438 * _438;
    float _444 = _424 * _436;
    float _446 = fma(_440, _440, _442);
    float _448 = in.m_69.x;
    float _450 = in.m_69.y;
    float _452 = in.m_69.z;
    float _454 = in.m_69.w;
    float _456 = fma(_444, _444, _446);
    float _458 = rsqrt(_456);
    float _460 = _444 * _458;
    float _462 = _438 * _458;
    float _464 = _212 * _450;
    float _466 = _440 * _458;
    float _468 = -_460;
    float _470 = _300 * _468;
    float _472 = fma(_210, _448, _464);
    float _474 = _302 * _462;
    float _476 = -_466;
    float _478 = -_470;
    float _480 = fma(_302, _476, _478);
    float _482 = -_466;
    float _484 = _304 * _482;
    float _486 = fma(_214, _452, _472);
    float _488 = -_460;
    float _490 = -_474;
    float _492 = fma(_304, _488, _490);
    float _494 = _480 * _480;
    float _496 = -_484;
    float _498 = fma(_300, _462, _496);
    float _500 = _486 + _454;
    float _502 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _504 = _262 + _502;
    float _506 = fma(_492, _492, _494);
    float _508 = in.m_59.x;
    float _510 = in.m_59.y;
    float _512 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _514 = _500 + _512;
    float _516 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _518 = _266 + _516;
    float _520 = fma(_498, _498, _506);
    float _522 = _514 * _514;
    float _524 = rsqrt(_520);
    float _526 = fma(_504, _504, _522);
    float _528 = fma(_518, _518, _526);
    float _530 = sqrt(_528);
    float _532 = _492 * _524;
    float _534 = _498 * _524;
    float _536 = _480 * _524;
    float _538 = _302 * _532;
    float _540 = _304 * _534;
    float _542 = rsqrt(_528);
    float _544 = -_538;
    float _546 = fma(_300, _534, _544);
    float _548 = -_540;
    float _550 = fma(_302, _536, _548);
    float _552 = _300 * _536;
    float _554 = _530 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _556 = _546 * _546;
    float _558 = -_552;
    float _560 = fma(_304, _532, _558);
    float _562 = fma(_550, _550, _556);
    float _564 = precise::min(_226, _554);
    float _566 = _508 * 6.283185482025146484375;
    float _568 = fma(_560, _560, _562);
    float _570 = _542 * _564;
    float _572 = _566 * 0.15915493667125701904296875;
    float _574 = rsqrt(_568);
    float _576 = _514 * _570;
    float _578 = _504 * _570;
    float _580 = _518 * _570;
    float _582 = -_576;
    float _584 = _514 + _582;
    float _586 = -_578;
    float _588 = _504 + _586;
    float _590 = -_580;
    float _592 = _518 + _590;
    float _594 = _572 * 6.283185482025146484375;
    float _596 = cos(_594);
    float _598 = _584 * _584;
    float _600 = in.m_67.x;
    float _602 = in.m_67.y;
    float _604 = fma(_588, _588, _598);
    float _606 = _560 * _574;
    float _608 = _550 * _574;
    float _610 = _546 * _574;
    float _612 = fma(_592, _592, _604);
    float _614 = _300 * _606;
    float _616 = _304 * _608;
    float _618 = _302 * _610;
    float _620 = _572 * 6.283185482025146484375;
    float _622 = sin(_620);
    float _624 = -_614;
    float _626 = fma(_302, _608, _624);
    float _628 = -_616;
    float _630 = fma(_300, _610, _628);
    float _632 = -_618;
    float _634 = fma(_304, _606, _632);
    float _636 = _626 * _626;
    float _638 = sqrt(_612);
    float _640 = fma(_634, _634, _636);
    float _642 = fma(_630, _630, _640);
    float _644 = _596 * _602;
    float _646 = _622 * _602;
    float _648 = fma(_622, _600, _644);
    float _650 = rsqrt(_642);
    float _652 = -_646;
    float _654 = fma(_596, _600, _652);
    float _656 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _648);
    float _658 = _542 * _638;
    float _660 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _654);
    float _662 = _236 * _658;
    float _664 = _216 * _658;
    float _666 = _238 * _658;
    float _668 = _662 * _656;
    float _670 = _664 * _660;
    float _672 = _666 * _242;
    float _674 = _630 * _650;
    float _676 = _668 * _606;
    float _678 = _668 * _608;
    float _680 = _634 * _650;
    float _682 = _668 * _610;
    float _684 = fma(_670, _674, _676);
    float _686 = _626 * _650;
    float _688 = fma(_670, _680, _678);
    float _690 = fma(_672, _302, _684);
    float _692 = fma(_670, _686, _682);
    float _694 = fma(_672, _300, _688);
    float _696 = _266 + _690;
    float _698 = fma(_672, _304, _692);
    float _700 = _262 + _694;
    float _702 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _704 = _696 + _702;
    float _706 = _250 + _698;
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
    float _744 = _692;
    float _746 = _696;
    float _748 = _706;
    float _750 = _576;
    float _752 = _266;
    float _754 = _250;
    float _756 = _580;
    if (!_718)
    {
        _744 = _700;
    }
    float _758 = _744;
    bool _760 = !_718;
    float _762 = _758;
    if (!_760)
    {
        float _764 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _766 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _768 = _716 + _766;
        float _770 = _706 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _772 = rsqrt(_714);
        float _774 = _768 * _764;
        float _776 = _774 * 0.15915493667125701904296875;
        float _778 = _776 * 6.283185482025146484375;
        float _780 = cos(_778);
        float _782 = _776 * 6.283185482025146484375;
        float _784 = sin(_782);
        float _786 = _780 + (-1.0);
        float _788 = _786 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _790 = fma(_784, _770, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _792 = fma(_706, _780, _788);
        float _794 = _772 * _790;
        float _796 = fma(_710, _794, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _798 = fma(_704, _794, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _762 = _796;
        _746 = _798;
        _748 = _792;
    }
    float _800 = _762;
    float _802 = _746;
    float _804 = _748;
    float _806 = -_578;
    float _808 = _806 + _800;
    float _810 = -_580;
    float _812 = _810 + _802;
    float _814 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _816 = _808 + _814;
    float _818 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _820 = _812 + _818;
    float _822 = fma(_816, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _824 = fma(_820, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _3958 = float2(_822, _824);
    float _826 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_3958, float2(0.0), isnan(_3958)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_3958, float2(0.0), isnan(_3958)), level(0.0)).x;
    float _828 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _830 = int(_828);
    int _832 = abs(_738);
    float _834 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _836 = int(_834);
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _842 = float(_830);
    float _844 = 1.0 / _840;
    float _846 = float(uint(_836));
    float _848 = 1.0 / _842;
    int _850 = ~_836;
    int _852 = _850 + 1;
    bool _854 = _836 == 0;
    float _856 = 1.0 / _846;
    float _858 = _126 * _848;
    int _860 = ~_836;
    int _862 = _860 + 1;
    float _864 = float(_836);
    float _866 = trunc(_858);
    int _868 = int(_866);
    int _870 = as_type<int>(_856) + (-2);
    float _872 = float(uint(_868));
    float _874 = as_type<float>(_870) * _872;
    float _876 = trunc(_874);
    float _878 = precise::max(_876, 0.0);
    uint _881 = uint(_878);
    float _883 = float(_868);
    bool _885 = _883 >= _864;
    bool _887 = isnan(_883);
    bool _889 = _885 || _887;
    bool _891 = isnan(_864);
    bool _893 = _889 || _891;
    float _895 = float(_893);
    int _897 = _862 * int(_881);
    int _899 = _897 + _868;
    float _901 = trunc(_895);
    int _903 = int(_901);
    float _905 = float(uint(_899));
    float _907 = as_type<float>(_870) * _905;
    int _909 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _911 = _909 != 0;
    float _913 = trunc(_907);
    float _915 = precise::max(_913, 0.0);
    uint _917 = uint(_915);
    bool _919 = !_911;
    float _921 = _919 ? 7.345489978790283203125 : 1.0;
    float _923 = _921 * _508;
    float _925 = floor(_923);
    int _927 = int(_881) + int(_917);
    int _929 = _852 * _927;
    int _931 = _929 + _868;
    bool _933 = uint(_931) >= uint(_836);
    float _935 = -_925;
    float _937 = _923 + _935;
    int _939 = ~_903;
    int _941 = _939 + 1;
    int _943 = _941 + 1;
    bool _945 = !_933;
    int _947 = _945 ? 0 : (-1);
    int _949 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _951 = _949 != 0;
    float _953 = _126 * _864;
    int _955 = ~_927;
    int _957 = _955 + _947;
    int _959 = _957 + 1;
    float _961 = _937 * _864;
    float _963 = _953 * _176;
    int _965 = _836 + (-1);
    int _967 = _836 * _959;
    int _969 = _967 + _868;
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _973 = _971 != 0;
    float _975 = trunc(_961);
    int _977 = int(_975);
    bool _979 = !_854;
    int _981 = _979 ? _969 : (-1);
    bool _983 = !_973;
    int _985 = _983 ? 0 : 1;
    bool _987 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _989 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _991 = _987 || _989;
    bool _993 = isnan(0.5);
    bool _995 = _991 || _993;
    float _997 = trunc(_963);
    int _999 = int(_997);
    int _1001 = _981 * _943;
    int _1003 = abs(_734);
    int _1005 = abs(_985);
    int _1007 = _903 * _965;
    int _1009 = _1007 + _1001;
    int _1011 = abs(_742);
    int _1013 = _1009 * _1003;
    bool _1015 = !_951;
    int _1017 = _1015 ? 0 : 1;
    int _1019 = _977 * _1005;
    int _1021 = _1019 + _868;
    float _1023 = _802;
    float _1025 = _808;
    float _1027 = _961;
    if (!_995)
    {
        float _1029 = -_266;
        float _1031 = _1029 + _802;
        _1023 = _1031;
    }
    float _1033 = _1023;
    int _1035 = abs(_1017);
    int _1037 = _999 * _832;
    int _1039 = _1037 + _1013;
    float _1041 = -_576;
    float _1043 = _1041 + _250;
    float _1045 = as_type<float>(_999);
    float _1047 = as_type<float>(_1035);
    float _1049 = _1043;
    if (!_995)
    {
        float _1051 = -_262;
        float _1053 = _1051 + _800;
        _1045 = _1053;
    }
    float _1055 = _1045;
    float _1057 = -_578;
    float _1059 = _262 + _1057;
    float _1061 = -_576;
    float _1063 = _1061 + _804;
    int _1065 = _1021 * _1011;
    int _1067 = _1065 + _1039;
    float _1069 = _1063;
    if (!_995)
    {
        float _1071 = -_250;
        float _1073 = _1071 + _804;
        _750 = _1073;
    }
    float _1075 = _750;
    float _1077 = -_580;
    float _1079 = _266 + _1077;
    if (_995)
    {
        _752 = _812;
    }
    float _1081 = _752;
    int _1083 = _977 * _1035;
    int _1085 = _1083 + _1067;
    float _1087 = _1081;
    if (!_995)
    {
        float _1089 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1091 = _1059 + _1089;
        _1047 = _1091;
    }
    float _1093 = _1047;
    float _1095 = fma(_826, 100.0, _1043);
    float _1097 = _1093;
    if (!_995)
    {
        float _1099 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        _1049 = _1099;
    }
    float _1101 = _1049;
    if (!_995)
    {
        float _1103 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1105 = _1095 + _1103;
        _754 = _1105;
    }
    float _1107 = _754;
    float _1109 = _1107;
    if (!_995)
    {
        float _1111 = _1107 * _1107;
        _1109 = _1111;
    }
    float _1113 = _1109;
    float _1115 = _1113;
    if (!_995)
    {
        float _1117 = fma(_1093, _1093, _1113);
        _1115 = _1117;
    }
    float _1119 = _1115;
    if (!_995)
    {
        float _1121 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1123 = _1079 + _1121;
        _1097 = _1123;
    }
    float _1125 = _1097;
    float _1127 = _1125;
    if (!_995)
    {
        float _1129 = fma(_1125, _1125, _1119);
        _756 = _1129;
    }
    float _1131 = _756;
    float _1133 = fma(_826, 100.0, _1063);
    float _1135 = _1131;
    float _1137 = _1133;
    if (!_995)
    {
        float _1139 = sqrt(_1131);
        _1135 = _1139;
    }
    float _1141 = _1135;
    if (!_995)
    {
        float _1143 = precise::min(_1141, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        _1127 = _1143;
    }
    float _1145 = _1127;
    float _1147 = _1145;
    if (!_995)
    {
        float _1149 = _1145 * _1101;
        _1069 = _1149;
    }
    float _1151 = _1069;
    if (_995)
    {
        _1147 = _808;
    }
    float _1153 = _1147;
    float _1155 = _1153;
    if (!_995)
    {
        float _1157 = fma(_1075, _1151, _1095);
        _1137 = _1157;
    }
    float _1159 = _1137;
    if (!_995)
    {
        float _1161 = fma(_1055, _1151, _1059);
        _1155 = _1161;
    }
    float _1163 = _1155;
    if (!_995)
    {
        float _1165 = fma(_1033, _1151, _1079);
        _1087 = _1165;
    }
    float _1167 = _1087;
    float _1169 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1171 = _1159 + _1169;
    float _1173 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1175 = _1163 + _1173;
    float _1177 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1179 = _1167 + _1177;
    float _1181 = _1171 * _1171;
    float _1183 = fma(_1175, _1175, _1181);
    float _1185 = fma(_1179, _1179, _1183);
    float _1187 = rsqrt(_1185);
    float _1189 = _1187 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1191 = _1175 * _1189;
    float _1193 = _1179 * _1189;
    float _1195 = _1191 * _1191;
    float _1197 = _1193 * _1193;
    float _1199 = _1195 + _1197;
    float _1201 = sqrt(_1199);
    bool _1203 = _1201 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1205 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1207 = _1201 + _1205;
    float _1209 = _1187;
    float _1211 = _1207;
    float _1213 = _1171;
    float _1215 = _1189;
    if (_1203)
    {
        float _1217 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1209 = _1217;
    }
    float _1219 = _1209;
    float _1221 = _1219;
    if (_1203)
    {
        float _1223 = _1207 * _1219;
        _1211 = _1223;
    }
    float _1225 = _1211;
    if (_1203)
    {
        float _1227 = rsqrt(_1199);
        _1221 = _1227;
    }
    float _1229 = _1221;
    float _1231 = _1229;
    if (_1203)
    {
        float _1233 = _1225 * 0.15915493667125701904296875;
        _1025 = _1233;
    }
    float _1235 = _1025;
    float _1237 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1239 = _1179;
    float _1241 = _1235;
    if (_1203)
    {
        float _1243 = _1235 * 6.283185482025146484375;
        float _1245 = sin(_1243);
        _1239 = _1245;
    }
    float _1247 = _1239;
    float _1249 = precise::max(0.0, _1237);
    float _1251 = _1033;
    float _1253 = _1249;
    if (_1203)
    {
        float _1255 = _1235 * 6.283185482025146484375;
        float _1257 = cos(_1255);
        _1251 = _1257;
    }
    float _1259 = _1251;
    float _1261 = -_1189;
    float _1263 = -_1249;
    float _1265 = fma(_1171, _1261, _1263);
    if (_1203)
    {
        float _1267 = _1265 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1213 = _1267;
    }
    float _1269 = _1213;
    float _1271 = _1247;
    float _1273 = _1269;
    if (_1203)
    {
        float _1275 = fma(_1247, _1269, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1271 = _1275;
    }
    float _1277 = _1271;
    float _1279 = _1277;
    if (!_1203)
    {
        _1273 = _1265;
    }
    float _1281 = _1273;
    float _1283 = _1281;
    if (!_1203)
    {
        _1241 = _1195;
    }
    float _1285 = _1241;
    float _1287 = _1285;
    if (_1203)
    {
        float _1289 = _1229 * _1277;
        _1027 = _1289;
    }
    float _1291 = _1027;
    if (!_1203)
    {
        _1231 = _1191;
    }
    float _1293 = _1231;
    float _1295 = _1293;
    float _1297 = _1259;
    if (_1203)
    {
        float _1299 = _1259 + (-1.0);
        _1253 = _1299;
    }
    float _1301 = _1253;
    if (_1203)
    {
        float _1303 = _1191 * _1291;
        _1295 = _1303;
    }
    float _1305 = _1295;
    if (!_1203)
    {
        _1279 = _1193;
    }
    float _1307 = _1279;
    float _1309 = _1307;
    if (_1203)
    {
        float _1311 = _1193 * _1291;
        _1309 = _1311;
    }
    float _1313 = _1309;
    if (_1203)
    {
        float _1315 = _1301 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1215 = _1315;
    }
    float _1317 = _1215;
    if (_1203)
    {
        float _1319 = _1305 * _1305;
        _1287 = _1319;
    }
    float _1321 = _1287;
    float _1323 = sqrt(_1185);
    if (_1203)
    {
        float _1325 = fma(_1265, _1259, _1317);
        _1283 = _1325;
    }
    float _1327 = _1283;
    if (!_1203)
    {
        _1297 = _1197;
    }
    float _1329 = _1297;
    float _1331 = _1329;
    if (_1203)
    {
        float _1333 = _1313 * _1313;
        _1331 = _1333;
    }
    float _1335 = _1331;
    float _1337 = fma(_1327, _1327, _1321);
    float _1339 = _1337 + _1335;
    float _1341 = fma(_1079, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1343 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1345 = rsqrt(_1339);
    float _1347 = fma(_1059, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1349 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1351 = fma(_1323, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1349);
    float _1353 = precise::clamp(_1351, 0.0, 1.0);
    float _1355 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1343);
    float _1357 = -_1353;
    float _1359 = _1357 + 1.0;
    float _1361 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1355);
    float _1363 = floor(_1347);
    float _1365 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1367 = _1345 * _1305;
    float _1369 = _1345 * _1327;
    float _1371 = _1345 * _1313;
    float _1373 = _1367 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1375 = abs(_1359);
    float _1377 = log2(_1375);
    float _1379 = _1369 + 1.0;
    float _1381 = -_1373;
    float _1383 = fma(_1369, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1381);
    float _1385 = -_1363;
    float _1387 = _1347 + _1385;
    float _1389 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1391 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1393 = -_1371;
    float _1395 = fma(_1393, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1383);
    float _1397 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1399 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1401 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1391);
    float _1403 = floor(_1341);
    float _1405 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1397);
    float _1407 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1399);
    float _1409 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1401);
    float _1411 = fma(_1395, -0.5, 0.5);
    float _1413 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1405);
    float _1415 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1407);
    float _1417 = _1409 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1419 = _1377 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1421 = _1413 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1423 = _1415 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1425 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1427 = exp2(_1419);
    float _1429 = fma(_1395, 0.5, 0.5);
    float _1431 = _1423 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1433 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1425);
    float _1435 = -_1403;
    float _1437 = _1341 + _1435;
    float _1439 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1441 = fma(_1429, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1443 = sqrt(_1411);
    float _1445 = -_1431;
    float _1447 = fma(_1445, _1389, 1.0);
    float _1449 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1433);
    float _1451 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1453 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1439);
    float _1455 = fma(_1429, _1441, -0.212114393711090087890625);
    float _1457 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1449);
    float _1459 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1451);
    float _1461 = log2(_1447);
    float _1463 = -_1369;
    float _1465 = fma(_1427, _1379, _1463);
    float _1467 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1453);
    float _1469 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1459);
    float _1471 = fma(_1429, _1455, 1.570728778839111328125);
    float2 _4976 = float2(_1387, _1437);
    float _1473 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4976, float2(0.0), isnan(_4976)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4976, float2(0.0), isnan(_4976)), level(0.0)).x;
    float _1475 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1467);
    float _1477 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1469);
    float _1479 = 1.0 / _1457;
    float _1481 = _1443 * 0.636619746685028076171875;
    float _1483 = in.m_71.y;
    float _1485 = -_1471;
    float _1487 = fma(_1481, _1485, 1.0);
    float _1489 = float(uint(_1085));
    float _1491 = _1461 * 0.693147182464599609375;
    float _1493 = as_type<float>(_870) * _1489;
    float _1495 = _1491 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1497 = fma(_1465, 0.5, 0.5);
    float _1499 = _1477 * _1479;
    float _1501 = _1475 * _1479;
    float _1503 = trunc(_1493);
    float _1505 = precise::max(_1503, 0.0);
    uint _1507 = uint(_1505);
    float _1509 = fma(_1499, 0.5, 0.5);
    float _1511 = fma(_1501, -0.5, 0.5);
    float3 _5039 = float3(_1509, _1511, _1495);
    float _1513 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5039, float3(0.0), isnan(_5039)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5039, float3(0.0), isnan(_5039)), level(0.0)).x;
    float3 _5050 = float3(_1509, _1511, _1495);
    float4 _1516 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5050, float3(0.0), isnan(_5050)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5050, float3(0.0), isnan(_5050)), level(0.0)).xyzw;
    float _1518 = _1516.x;
    float _1520 = _1516.y;
    float _1522 = _1516.z;
    float _1524 = _1516.w;
    float2 _5066 = float2(_1487, _1497);
    float3 _1528 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5066, float2(0.0), isnan(_5066)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5066, float2(0.0), isnan(_5066)), level(0.0)).xyz;
    float _1530 = _1528.x;
    float _1532 = _1528.y;
    float _1534 = _1528.z;
    int _1536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1538 = _1536 != 0;
    float _1540 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1542 = _1540 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    out.m_73.w = _564;
    int _1544 = ~_836;
    int _1546 = _1544 + 1;
    float _1548 = -_1483;
    float _1550 = _1548 + 1.0;
    float _1552 = 1.0 / _1542;
    bool _1554 = _510 > 0.5;
    float _1556 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1558 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1560 = _1546 * int(_1507);
    int _1562 = _1560 + _1085;
    int _1564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1566 = _1564 != 0;
    float _1568 = _508 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1570 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1572 = _1570 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1574 = _1483;
    float _1576 = _1457;
    if (_1538)
    {
        float _1578 = _1554 ? _1550 : _1483;
        _1574 = _1578;
    }
    float _1580 = _1574;
    float _1582 = _510 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1584 = float(uint(_1562));
    float _1586 = -_1558;
    float _1588 = fma(_1568, 2.0, _1586);
    float _1590 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1592 = _1590 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1594 = 1.0 / _1572;
    float _1596 = as_type<float>(_870) * _1584;
    float _1598 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[118].w;
    if (_1566)
    {
        float _1602 = in.m_59.x;
        _1600 = _1602;
    }
    float _1604 = _1600;
    float _1606 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1608 = 1.0 / _1592;
    float _1610 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1598);
    float _1612 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1614 = fma(_1582, -2.0, _1606);
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1618 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1616;
    float _1620 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1612);
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1624 = _1622 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1626 = trunc(_1596);
    float _1628 = precise::max(_1626, 0.0);
    uint _1630 = uint(_1628);
    float _1632 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1634 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1632;
    float _1636 = _1618 * _844;
    float _1638 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1640 = _1638 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1642 = _1624 * _1552;
    float _1644 = _1634 * _1594;
    int _1646 = ~_836;
    int _1648 = _1646 + 1;
    float _1650 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1614);
    float _1652 = _1640 * _1608;
    float _1654 = in.m_71.x;
    float _1656 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1610);
    float _1658 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1660 = _208 + _1658;
    bool _1662 = _1604 > 0.5;
    bool _1664 = _1662 && _1566;
    float _1666 = -_126;
    float _1668 = fma(_1666, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1588);
    bool _1670 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1672 = isnan(_208);
    bool _1674 = _1670 || _1672;
    bool _1676 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1678 = _1674 || _1676;
    float _1680 = float(_1678);
    float _1682 = fma(_1642, _1660, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _1684 = int(_1507) + int(_1630);
    float _1686 = fma(_1580, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1688 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1620);
    float _1690 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1692 = _208 + _1690;
    bool _1694 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1696 = isnan(_208);
    bool _1698 = _1694 || _1696;
    bool _1700 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1702 = _1698 || _1700;
    float _1704 = float(_1702);
    int _1706 = _1648 * _1684;
    int _1708 = _1706 + _1085;
    float _1710 = -_1650;
    float _1712 = fma(_1688, _1686, _1710);
    bool _1714 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1716 = isnan(_208);
    bool _1718 = _1714 || _1716;
    bool _1720 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1722 = _1718 || _1720;
    float _1724 = float(_1722);
    float _1726 = fma(_1636, _1692, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1728 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1730 = isnan(_208);
    bool _1732 = _1728 || _1730;
    bool _1734 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1736 = _1732 || _1734;
    float _1738 = float(_1736);
    float _1740 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1742 = _208 + _1740;
    bool _1744 = uint(_1708) >= uint(_836);
    float _1746 = -_1724;
    float _1748 = _1746 + 1.0;
    float _1750 = -_1680;
    float _1752 = _1750 + 1.0;
    float _1754 = float(uint(_1021));
    float _1756 = fma(_1644, _1742, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1758 = !_1744;
    int _1760 = _1758 ? 0 : (-1);
    float _1762 = _1680 * _1748;
    float _1764 = _1738 * _1752;
    float _1766 = -_1738;
    float _1768 = _1766 + 1.0;
    int _1770 = ~_1684;
    int _1772 = _1770 + _1760;
    int _1774 = _1772 + 1;
    float _1776 = -_1704;
    float _1778 = _1776 + 1.0;
    bool _1780 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1782 = isnan(_208);
    bool _1784 = _1780 || _1782;
    bool _1786 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1788 = _1784 || _1786;
    float _1790 = float(_1788);
    float _1792 = _1712 + 0.5;
    float _1794 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1556);
    int _1796 = _836 * _1774;
    int _1798 = _1796 + _1085;
    float _1800 = _1704 * _1768;
    float _1802 = _1790 * _1778;
    float _1804 = _1778;
    float _1806 = _1654;
    if (_1566)
    {
        _1804 = _1654;
    }
    float _1808 = _1804;
    float _1810 = as_type<float>(_870) * _1754;
    bool _1812 = !_854;
    int _1814 = _1812 ? _1798 : (-1);
    float _1816 = _1726 * _1802;
    float _1818 = -_1790;
    float _1820 = _1818 + 1.0;
    float _1822 = _1808;
    if (_1664)
    {
        float _1824 = -_1808;
        float _1826 = _1824 + 1.0;
        _1822 = _1826;
    }
    float _1828 = _1822;
    int _1830 = _1814 >> 31;
    float _1832 = trunc(_1810);
    float _1834 = precise::max(_1832, 0.0);
    uint _1836 = uint(_1834);
    int _1838 = _1814 & 3;
    bool _1840 = _1838 != 0;
    out.m_75.y = _648;
    int _1842 = _1830 & 3;
    float _1844 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1794);
    if (_1566)
    {
        _1806 = _1828;
    }
    float _1846 = _1806;
    float _1848 = fma(_1820, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1816);
    int _1850 = _1814 + _1842;
    float _1852 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1854 = _208 + _1852;
    int _1856 = ~_836;
    int _1858 = _1856 + 1;
    float _1860 = fma(_1846, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1862 = _1850 >> 2;
    float _1864 = fma(_1682, _1800, _1848);
    int _1866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1868 = _1866 != 0;
    float _1870 = fma(_1656, _1860, _1668);
    int _1872 = _1862 << 4;
    int _1874 = _1872 + 368;
    int _1876 = _1858 * int(_1836);
    int _1878 = _1876 + _1021;
    float _1880 = fma(_1652, _1854, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1882 = fma(_1756, _1764, _1864);
    uint _1884 = uint(int(uint(_1874) >> uint(2)));
    uint _1886 = uint(int(uint(int(_1884)) >> uint(2)));
    int _1888 = int(_1884) & 3;
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[int(_1886)][_1888];
    int _1892 = int(_1884) + 1;
    uint _1894 = uint(int(uint(_1892) >> uint(2)));
    int _1896 = _1892 & 3;
    float _1898 = (*spvDescriptorSet0.vp_c9)._m0[int(_1894)][_1896];
    int _1900 = _1814 & 3;
    bool _1902 = _1900 != 0;
    out.m_77.x = _664;
    float _1904 = float(uint(_1878));
    float _1906 = fma(_1880, _1762, _1882);
    bool _1908 = uint(_1900) > 1u;
    float _1910 = _1377 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1912 = as_type<float>(_870) * _1904;
    int _1914 = _1874 + 8;
    uint _1916 = uint(int(uint(_1914) >> uint(2)));
    uint _1918 = uint(int(uint(int(_1916)) >> uint(2)));
    int _1920 = int(_1916) & 3;
    float _1922 = (*spvDescriptorSet0.vp_c9)._m0[int(_1918)][_1920];
    int _1924 = int(_1916) + 1;
    uint _1926 = uint(int(uint(_1924) >> uint(2)));
    int _1928 = _1924 & 3;
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[int(_1926)][_1928];
    float _1932 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1934 = trunc(_1912);
    float _1936 = precise::max(_1934, 0.0);
    uint _1938 = uint(_1936);
    float _1940 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1944 = _1840 ? 0 : 1;
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1948 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1950 = _1940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1952 = _1942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1954 = _1870 + 0.5;
    int _1956 = ~_1944;
    int _1958 = _1956 + 1;
    int _1960 = _1958 + 1;
    float _1962 = exp2(_1910);
    int _1964 = ~_836;
    int _1966 = _1964 + 1;
    out.m_79.x = _1948;
    out.m_79.y = _1950;
    out.m_79.z = _1952;
    out.m_79.w = _1946;
    int _1968 = _1960;
    if (!_1908)
    {
        int _1970 = ~_1944;
        int _1972 = _1970 + 1;
        _1968 = _1972;
    }
    int _1974 = _1968;
    float _1976 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1844);
    bool _1978 = _1900 != 3;
    out.m_81.x = _1954;
    out.m_81.y = _1792;
    int _1980 = int(_1836) + int(_1938);
    out.m_83.x = _1059;
    out.m_83.y = _1095;
    out.m_83.z = _1079;
    bool _1982 = !_1902;
    int _1984 = _1982 ? 0 : 1;
    bool _1986 = uint(_1900) >= 2u;
    int _1988 = _1966 * _1980;
    int _1990 = _1988 + _1021;
    int _1992 = abs(_1984);
    float _1994 = fma(_1724, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1906);
    int _1996 = abs(_1974);
    int _1998 = ~_1992;
    int _2000 = _1998 + 1;
    int _2002 = _2000 + 1;
    float _2004 = _1994 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2006 = ~_1996;
    int _2008 = _2006 + 1;
    int _2010 = _2008 + 1;
    int _2012 = _2010 * as_type<int>(_1898);
    int _2014 = _1986 ? 0 : 1;
    int _2016 = _2002 * as_type<int>(_1890);
    int _2018 = _2016 + _2012;
    bool _2020 = _1900 != 3;
    float _2022 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2024 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2028 = ~_2014;
    int _2030 = _2028 + 1;
    int _2032 = _2030 + 1;
    float _2034 = _2022 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2036 = _2024 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2038 = _2026 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2040 = _2032;
    float _2042 = _1976;
    if (_1978)
    {
        int _2044 = ~_2014;
        int _2046 = _2044 + 1;
        _2040 = _2046;
    }
    int _2048 = _2040;
    bool _2050 = uint(_1990) >= uint(_836);
    float _2052 = in.m_85.x;
    float _2054 = in.m_85.y;
    float _2056 = in.m_85.z;
    bool _2058 = !_1868;
    int _2060 = _2058 ? 0 : 1;
    bool _2062 = !_2020;
    int _2064 = _2062 ? 0 : (-1);
    out.m_87.x = _2034;
    out.m_87.y = _2036;
    out.m_87.z = _2038;
    out.m_87.w = _2004;
    int _2066 = abs(_2048);
    int _2068 = abs(_2060);
    bool _2070 = !_2050;
    int _2072 = _2070 ? 0 : (-1);
    int _2074 = abs(_2064);
    int _2076 = ~_2066;
    int _2078 = _2076 + 1;
    int _2080 = _2078 + 1;
    int _2082 = ~_1980;
    int _2084 = _2082 + _2072;
    int _2086 = _2084 + 1;
    float _2088 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2090 = ~_2074;
    int _2092 = _2090 + 1;
    int _2094 = _2092 + 1;
    int _2096 = _2080 * as_type<int>(_1922);
    int _2098 = _2096 + _2018;
    int _2100 = ~_2068;
    int _2102 = _2100 + 1;
    int _2104 = _2102 + 1;
    float _2106 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2088);
    int _2108 = _836 * _2086;
    int _2110 = _2108 + _1021;
    bool _2112 = _648 != 0.0;
    bool _2114 = isnan(_648);
    bool _2116 = _2112 || _2114;
    bool _2118 = isnan(0.0);
    bool _2120 = _2116 || _2118;
    int _2122 = _2094 * as_type<int>(_1930);
    int _2124 = _2122 + _2098;
    float _2126 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2106);
    float _2128 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2130 = _654 == 0.0;
    bool _2132 = !_2120;
    bool _2134 = _2130 && _2132;
    int _2136 = _2124 * _2104;
    float _2138 = _2126 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2140 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2128);
    bool _2142 = !_854;
    int _2144 = _2142 ? _2110 : (-1);
    float _2146 = in.m_65.x;
    float _2148 = 1.0 / _2138;
    float _2150 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2140);
    bool _2152 = _242 == 0.0;
    bool _2154 = _2152 && _2134;
    int _2156 = _2144 * _2068;
    int _2158 = _2156 + _2136;
    float _2160 = _2150 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2162 = _1457 * 0.5;
    float _2164 = float(_2158);
    float _2166 = _2160 + _2138;
    out.m_89.x = _2164;
    float _2168 = _2054;
    float _2170 = _2052;
    float _2172 = _2056;
    float _2174 = _2162;
    if (!_2154)
    {
        float _2176 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2054);
        _2168 = _2176;
    }
    float _2178 = _2168;
    float _2180 = _2166 * _2148;
    float _2182 = _2180 * 0.5;
    if (!_2154)
    {
        float _2184 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2052);
        _2170 = _2184;
    }
    float _2186 = _2170;
    if (!_2154)
    {
        float _2188 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2056);
        _2172 = _2188;
    }
    float _2190 = _2172;
    float _2192 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2194 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2192);
    bool _2196 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2198 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2200 = _2196 || _2198;
    bool _2202 = isnan(0.5);
    bool _2204 = _2200 || _2202;
    float _2206 = _608 * _2178;
    float _2208 = _610 * _2178;
    float _2210 = _606 * _2178;
    float _2212 = _1976 + _1457;
    float _2214 = 1.0 / _2194;
    float _2216 = fma(_680, _2186, _2206);
    float _2218 = fma(_686, _2186, _2208);
    float _2220 = fma(_674, _2186, _2210);
    float _2222 = _2212 * 0.5;
    float _2224 = fma(_300, _2190, _2216);
    float _2226 = fma(_304, _2190, _2218);
    float _2228 = fma(_302, _2190, _2220);
    float _2230 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2232 = _2214 * _2230;
    float _2234 = fma(_1475, -0.5, _2162);
    if (_2204)
    {
        _2174 = 1.0;
    }
    float _2236 = _2174;
    float _2238 = abs(_2232);
    float _2240 = log2(_2238);
    bool _2242 = _2232 <= 8000.0;
    bool _2244 = isnan(_2232);
    bool _2246 = _2242 || _2244;
    bool _2248 = isnan(8000.0);
    bool _2250 = _2246 || _2248;
    float _2252 = float(_2250);
    float _2254 = _2240 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2256 = exp2(_2254);
    float _2258 = fma(_2256, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2260 = precise::clamp(_2258, 0.0, 1.0);
    float _2262 = fma(_2260, -2.0, 3.0);
    float _2264 = _2260 * _2260;
    float _2266 = _2264 * _2262;
    float _2268 = -_2266;
    float _2270 = _2268 + 1.0;
    float _2272 = fma(_2270, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2266);
    float _2274 = _2270;
    float _2276 = _2236;
    if (_2204)
    {
        _2274 = 1.0;
    }
    float _2278 = _2274;
    float _2280 = _2252 * _2272;
    float _2282 = _1477 + _1457;
    float _2284 = _2282 * 0.5;
    float _2286 = _2278;
    if (!_2204)
    {
        float _2288 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2290 = _2288 * 0.15915493667125701904296875;
        float _2292 = _2290 * 6.283185482025146484375;
        float _2294 = cos(_2292);
        float _2296 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2298 = _2296 * 0.15915493667125701904296875;
        float _2300 = _2290 * 6.283185482025146484375;
        float _2302 = sin(_2300);
        float _2304 = 1.0 / _2294;
        float _2306 = _2298 * 6.283185482025146484375;
        float _2308 = cos(_2306);
        float _2310 = _2302 * _2304;
        float _2312 = _2298 * 6.283185482025146484375;
        float _2314 = sin(_2312);
        float _2316 = _2308 * _2310;
        float _2318 = 1.0 / _2316;
        float _2320 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2322 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2320;
        float _2324 = 1.0 / _2322;
        float _2326 = _2314 * _2318;
        float _2328 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2330 = fma(_2232, _2326, _2328);
        float _2332 = _2330 * _2324;
        float _2334 = precise::clamp(_2332, 0.0, 1.0);
        _2276 = _2334;
    }
    float _2336 = _2276;
    if (!_2204)
    {
        float _2338 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2340 = _2338 * 0.15915493667125701904296875;
        float _2342 = _2340 * 6.283185482025146484375;
        float _2344 = cos(_2342);
        float _2346 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2348 = _2346 * 0.15915493667125701904296875;
        float _2350 = _2340 * 6.283185482025146484375;
        float _2352 = sin(_2350);
        float _2354 = 1.0 / _2344;
        float _2356 = _2348 * 6.283185482025146484375;
        float _2358 = cos(_2356);
        float _2360 = _2352 * _2354;
        float _2362 = _2348 * 6.283185482025146484375;
        float _2364 = sin(_2362);
        float _2366 = _2358 * _2360;
        float _2368 = 1.0 / _2366;
        float _2370 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2372 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2370;
        float _2374 = 1.0 / _2372;
        float _2376 = _2364 * _2368;
        float _2378 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2380 = fma(_2232, _2376, _2378);
        float _2382 = _2380 * _2374;
        float _2384 = precise::clamp(_2382, 0.0, 1.0);
        float _2386 = -_2384;
        float _2388 = _2386 + 1.0;
        _2286 = _2388;
    }
    float _2390 = _2286;
    float _2392 = -_1962;
    float _2394 = _2392 + 1.0;
    float _2396 = _2280 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2398 = -_1473;
    float _2400 = _2398 + 1.0;
    float _2402 = _2394 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_91.x = _2284;
    out.m_91.y = _2234;
    out.m_91.z = _2222;
    out.m_91.w = _1457;
    float _2404 = _2400 * _2396;
    float _2406 = precise::clamp(_2404, 0.0, 1.0);
    bool _2408 = _1323 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2410 = isnan(_1323);
    bool _2412 = _2408 || _2410;
    bool _2414 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2416 = _2412 || _2414;
    float _2418 = _2402 * _1513;
    float _2420 = -_2402;
    float _2422 = _2420 + 1.0;
    float _2424 = -_2406;
    float _2426 = fma(_2424, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_93.x = _2224;
    out.m_93.y = _2226;
    out.m_93.z = _2228;
    float _2428 = _1524 * _2418;
    float _2430 = _1534 * _2418;
    float _2432 = _2426 * _2146;
    float _2434 = _1524 * _2422;
    float _2436 = fma(_1530, _2428, _1518);
    float _2438 = fma(_1532, _2428, _1520);
    float _2440 = fma(_1524, _2430, _1522);
    out.m_95.x = _1163;
    out.m_95.y = _1159;
    out.m_95.z = _1167;
    float _2442 = _2428;
    float _2444 = _2432;
    if (!_2416)
    {
        _2442 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2446 = _2442;
    out.m_97.x = _2436;
    out.m_97.y = _2438;
    out.m_97.z = _2440;
    out.m_97.w = _2434;
    out.gl_Position.x = _1477;
    out.gl_Position.y = _1475;
    out.gl_Position.z = _1976;
    out.gl_Position.w = _1457;
    float _2448 = _2432 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2450 = _2336 * _2390;
    float _2452 = _2450;
    float _2454 = _2448;
    float _2456 = _2446;
    float _2458 = _2446;
    if (!_2416)
    {
        _2444 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2460 = _2444;
    float _2462 = _2460;
    float _2464 = _2460;
    if (!_2416)
    {
        _1576 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2466 = _1576;
    out.m_99.x = _2448;
    float _2468 = _2450 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2470 = _2466;
    float _2472 = _2466;
    if (!_2416)
    {
        _2042 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2474 = _2042;
    float _2476 = _2474;
    float _2478 = _2474;
    if (!_2416)
    {
        _2452 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2480 = _2452;
    float _2482 = _2480;
    float _2484 = _2480;
    if (!_2416)
    {
        _2454 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2486 = _2454;
    bool _2488 = !_2416;
    float _2490 = _2486;
    float _2492 = _2486;
    if (!_2488)
    {
        bool _2494 = _1323 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2496 = isnan(_1323);
        bool _2498 = _2494 || _2496;
        bool _2500 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2502 = _2498 || _2500;
        if (!_2502)
        {
            float _2504 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2506 = _1323 + _2504;
            float _2508 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2510 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2508;
            float _2512 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2514 = _2512 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2516 = 1.0 / _2510;
            float _2518 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2520 = _2518 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2522 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2524 = _2522 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2526 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2528 = _2526 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2532 = _2530 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2534 = _2506 * _2516;
            float _2536 = precise::clamp(_2534, 0.0, 1.0);
            float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2540 = _2538 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2542 = fma(_2536, _2514, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2544 = fma(_2536, _2540, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2546 = fma(_2536, _2520, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2548 = fma(_2536, _2524, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2550 = fma(_2536, _2528, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2552 = fma(_2536, _2532, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2464 = _2546;
            _2492 = _2550;
            _2458 = _2542;
            _2478 = _2548;
            _2472 = _2544;
            _2484 = _2552;
            _2554 = true;
        }
        else
        {
            bool _2556 = _1323 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2558 = isnan(_1323);
            bool _2560 = _2556 || _2558;
            bool _2562 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2564 = _2560 || _2562;
            if (!_2564)
            {
                _2456 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2566 = _2456;
            _2458 = _2566;
            if (!_2564)
            {
                _2462 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2568 = _2462;
            _2464 = _2568;
            if (!_2564)
            {
                _2470 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2570 = _2470;
            _2472 = _2570;
            if (!_2564)
            {
                _2476 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2572 = _2476;
            _2478 = _2572;
            if (!_2564)
            {
                _2490 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2574 = _2490;
            _2492 = _2574;
            if (!_2564)
            {
                _2482 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2576 = _2482;
            bool _2578 = !_2564;
            _2484 = _2576;
            if (!_2578)
            {
                bool _2580 = _1323 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2582 = isnan(_1323);
                bool _2584 = _2580 || _2582;
                bool _2586 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2588 = _2584 || _2586;
                if (!_2588)
                {
                    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2592 = _1323 + _2590;
                    float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2596 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2594;
                    float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2600 = _2598 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2602 = 1.0 / _2596;
                    float _2604 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2606 = _2604 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2612 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2614 = _2612 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2616 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2618 = _2616 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2620 = _2592 * _2602;
                    float _2622 = precise::clamp(_2620, 0.0, 1.0);
                    float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2626 = _2624 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2628 = fma(_2622, _2600, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2630 = fma(_2622, _2626, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2632 = fma(_2622, _2606, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2634 = fma(_2622, _2610, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2636 = fma(_2622, _2614, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2638 = fma(_2622, _2618, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2464 = _2632;
                    _2492 = _2636;
                    _2458 = _2628;
                    _2478 = _2634;
                    _2472 = _2630;
                    _2484 = _2638;
                    _2554 = true;
                }
                else
                {
                    _2464 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2492 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2458 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2478 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2472 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2484 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2554 = false;
    float _2640 = _2464;
    float _2642 = _2492;
    float _2644 = _2458;
    float _2646 = _2478;
    float _2648 = _2472;
    float _2650 = _2484;
    float _2652 = fma(_2226, -0.5, 0.5);
    float _2654 = precise::clamp(_2652, 0.0, 1.0);
    float _2656 = -_2640;
    float _2658 = _2656 + _2642;
    float _2660 = _2468 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2662 = -_2644;
    float _2664 = _2662 + _2646;
    float _2666 = fma(_2654, _2658, _2640);
    out.m_101.x = 0.0;
    float _2668 = -_2648;
    float _2670 = _2668 + _2650;
    float _2672 = fma(_2654, _2664, _2644);
    float _2674 = _2666 * 0.586610972881317138671875;
    out.m_55.x = _2660;
    bool _2676 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2678 = fma(_2654, _2670, _2648);
    float _2680 = fma(_2672, 0.298911988735198974609375, _2674);
    bool _2682 = _2336 > 0.0;
    bool _2684 = isnan(_2336);
    bool _2686 = _2682 || _2684;
    bool _2688 = isnan(0.0);
    bool _2690 = _2686 || _2688;
    float _2692 = fma(_2678, 0.114477999508380889892578125, _2680);
    bool _2694 = _2390 <= 0.0;
    bool _2696 = !_2690;
    bool _2698 = _2694 || _2696;
    float _2700 = -_2692;
    float _2702 = _2672 + _2700;
    float _2704 = -_2692;
    float _2706 = _2666 + _2704;
    float _2708 = -_2692;
    float _2710 = _2678 + _2708;
    float _2712 = fma(_2702, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2692);
    float _2714 = fma(_2706, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2692);
    float _2716 = fma(_2710, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2692);
    bool _2718 = !_2676;
    if (!_2718)
    {
        float _2720 = -_1159;
        float _2722 = _2720 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2724 = -_1163;
        float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2728 = -_1167;
        float _2730 = _2728 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2732 = _2722 * _2722;
        float _2734 = fma(_2726, _2726, _2732);
        float _2736 = fma(_2730, _2730, _2734);
        float _2738 = sqrt(_2736);
        float _2740 = rsqrt(_2736);
        float _2742 = -_2738;
        float _2744 = _2742 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2746 = _2744 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2748 = precise::clamp(_2746, 0.0, 1.0);
        float _2750 = _2726 * _2740;
        float _2752 = _2722 * _2740;
        float _2754 = abs(_2748);
        float _2756 = log2(_2754);
        float _2758 = _2730 * _2740;
        float _2760 = _2750 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2762 = _2226 * _2752;
        float _2764 = -_2752;
        float _2766 = -_2760;
        float _2768 = fma(_2764, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2766);
        float _2770 = fma(_2224, _2750, _2762);
        float _2772 = -_2758;
        float _2774 = fma(_2772, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2768);
        float _2776 = fma(_2228, _2758, _2770);
        float _2778 = precise::clamp(_2776, 0.0, 1.0);
        float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2782 = _2774 + _2780;
        float _2784 = _2756 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2786 = _2782 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2788 = precise::clamp(_2786, 0.0, 1.0);
        float _2790 = exp2(_2784);
        float _2792 = _2790 * _2788;
        float _2794 = _2778 * _2792;
        float _2796 = _2794 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2798 = _2794 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2800 = _2794 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _2796;
        out.m_101.y = _2798;
        out.m_101.z = _2800;
    }
    out.m_73.x = _2712;
    out.m_73.y = _2714;
    out.m_73.z = _2716;
    if (!_2698)
    {
        return out;
    }
    out.m_55.x = 0.0;
    float _2802 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2802;
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
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2554 = false;
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
    float _134 = _117;
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
        float _2869 = as_type<float>(_142);
        out.gl_Position.z = _2869;
    }
    if (!_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2924 = as_type<float>(_168);
        out.gl_Position.z = _2924;
    }
    if (_162)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _226 = _216 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _228 = in.m_63.x;
    float _230 = in.m_63.y;
    float _232 = in.m_63.z;
    float _234 = in.m_63.w;
    float _236 = _184 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _238 = _186 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _240 = in.m_65.y;
    float _242 = in.m_67.z;
    float _244 = _212 * _220;
    float _246 = _212 * _230;
    float _248 = fma(_210, _218, _244);
    float _250 = _212 + _240;
    float _252 = fma(_210, _228, _246);
    float _254 = fma(_214, _222, _248);
    float _256 = -_250;
    float _258 = _256 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _260 = fma(_214, _232, _252);
    float _262 = _254 + _224;
    float _264 = _258 * _258;
    float _266 = _260 + _234;
    float _268 = -_262;
    float _270 = _268 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _272 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _274 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _276 = -_266;
    float _278 = _276 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _280 = fma(_270, _270, _264);
    float _282 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _284 = -_274;
    float _286 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _284);
    float _288 = -_272;
    float _290 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _288);
    float _292 = fma(_278, _278, _280);
    float _294 = -_282;
    float _296 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _294);
    float _298 = rsqrt(_292);
    float _300 = _270 * _298;
    float _302 = _278 * _298;
    float _304 = _258 * _298;
    float _306 = _296 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _308 = _300 * _300;
    float _310 = fma(_302, _302, _308);
    float _312 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _314 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _316 = rsqrt(_310);
    float _318 = -_312;
    float _320 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _318);
    float _322 = -_314;
    float _324 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _322);
    float _326 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _328 = _320 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _330 = _324 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _332 = -_326;
    float _334 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _332);
    float _336 = _324 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _338 = -_328;
    float _340 = fma(_286, (*spvDescriptorSet0.vp_c8)._m0[1].y, _338);
    float _342 = -_330;
    float _344 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[1].x, _342);
    float _346 = -_336;
    float _348 = fma(_286, (*spvDescriptorSet0.vp_c8)._m0[1].x, _346);
    float _350 = fma(_290, (*spvDescriptorSet0.vp_c8)._m0[1].w, _340);
    float _352 = fma(_334, (*spvDescriptorSet0.vp_c8)._m0[1].w, _344);
    float _354 = _302 * _316;
    float _356 = _300 * _316;
    float _358 = fma(_296, (*spvDescriptorSet0.vp_c8)._m0[1].w, _348);
    float _360 = -_354;
    float _362 = _302 * _360;
    float _364 = -_354;
    float _366 = _304 * _364;
    float _368 = _358 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _370 = -_362;
    float _372 = fma(_300, _356, _370);
    float _374 = _304 * _356;
    float _376 = -_368;
    float _378 = fma(_350, (*spvDescriptorSet0.vp_c8)._m0[0].x, _376);
    float _380 = -_306;
    float _382 = fma(_290, (*spvDescriptorSet0.vp_c8)._m0[1].x, _380);
    float _384 = _372 * _372;
    float _386 = _324 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _388 = fma(_352, (*spvDescriptorSet0.vp_c8)._m0[0].z, _378);
    float _390 = fma(_334, (*spvDescriptorSet0.vp_c8)._m0[1].z, _382);
    float _392 = fma(_374, _374, _384);
    float _394 = -_386;
    float _396 = fma(_286, (*spvDescriptorSet0.vp_c8)._m0[0].x, _394);
    float _398 = _320 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _400 = -_390;
    float _402 = fma(_400, (*spvDescriptorSet0.vp_c8)._m0[0].w, _388);
    float _404 = fma(_366, _366, _392);
    float _406 = fma(_296, (*spvDescriptorSet0.vp_c8)._m0[0].w, _396);
    float _408 = -_398;
    float _410 = fma(_286, (*spvDescriptorSet0.vp_c8)._m0[0].y, _408);
    float _412 = 1.0 / _402;
    float _414 = _324 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _416 = fma(_290, (*spvDescriptorSet0.vp_c8)._m0[0].w, _410);
    float _418 = -_414;
    float _420 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[0].x, _418);
    float _422 = rsqrt(_404);
    float _424 = fma(_334, (*spvDescriptorSet0.vp_c8)._m0[0].w, _420);
    float _426 = fma(_406, _412, -1.0);
    float _428 = _372 * _422;
    float _430 = precise::clamp(_428, 0.0, 1.0);
    float _432 = -_430;
    float _434 = _432 + 1.0;
    float _436 = _434 * _412;
    float _438 = fma(_434, _426, 1.0);
    float _440 = _416 * _436;
    float _442 = _438 * _438;
    float _444 = _424 * _436;
    float _446 = fma(_440, _440, _442);
    float _448 = in.m_69.x;
    float _450 = in.m_69.y;
    float _452 = in.m_69.z;
    float _454 = in.m_69.w;
    float _456 = fma(_444, _444, _446);
    float _458 = rsqrt(_456);
    float _460 = _444 * _458;
    float _462 = _438 * _458;
    float _464 = _212 * _450;
    float _466 = _440 * _458;
    float _468 = -_460;
    float _470 = _300 * _468;
    float _472 = fma(_210, _448, _464);
    float _474 = _302 * _462;
    float _476 = -_466;
    float _478 = -_470;
    float _480 = fma(_302, _476, _478);
    float _482 = -_466;
    float _484 = _304 * _482;
    float _486 = fma(_214, _452, _472);
    float _488 = -_460;
    float _490 = -_474;
    float _492 = fma(_304, _488, _490);
    float _494 = _480 * _480;
    float _496 = -_484;
    float _498 = fma(_300, _462, _496);
    float _500 = _486 + _454;
    float _502 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _504 = _262 + _502;
    float _506 = fma(_492, _492, _494);
    float _508 = in.m_59.x;
    float _510 = in.m_59.y;
    float _512 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _514 = _500 + _512;
    float _516 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _518 = _266 + _516;
    float _520 = fma(_498, _498, _506);
    float _522 = _514 * _514;
    float _524 = rsqrt(_520);
    float _526 = fma(_504, _504, _522);
    float _528 = fma(_518, _518, _526);
    float _530 = sqrt(_528);
    float _532 = _492 * _524;
    float _534 = _498 * _524;
    float _536 = _480 * _524;
    float _538 = _302 * _532;
    float _540 = _304 * _534;
    float _542 = rsqrt(_528);
    float _544 = -_538;
    float _546 = fma(_300, _534, _544);
    float _548 = -_540;
    float _550 = fma(_302, _536, _548);
    float _552 = _300 * _536;
    float _554 = _530 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _556 = _546 * _546;
    float _558 = -_552;
    float _560 = fma(_304, _532, _558);
    float _562 = fma(_550, _550, _556);
    float _564 = precise::min(_226, _554);
    float _566 = _508 * 6.283185482025146484375;
    float _568 = fma(_560, _560, _562);
    float _570 = _542 * _564;
    float _572 = _566 * 0.15915493667125701904296875;
    float _574 = rsqrt(_568);
    float _576 = _514 * _570;
    float _578 = _504 * _570;
    float _580 = _518 * _570;
    float _582 = -_576;
    float _584 = _514 + _582;
    float _586 = -_578;
    float _588 = _504 + _586;
    float _590 = -_580;
    float _592 = _518 + _590;
    float _594 = _572 * 6.283185482025146484375;
    float _596 = cos(_594);
    float _598 = _584 * _584;
    float _600 = in.m_67.x;
    float _602 = in.m_67.y;
    float _604 = fma(_588, _588, _598);
    float _606 = _560 * _574;
    float _608 = _550 * _574;
    float _610 = _546 * _574;
    float _612 = fma(_592, _592, _604);
    float _614 = _300 * _606;
    float _616 = _304 * _608;
    float _618 = _302 * _610;
    float _620 = _572 * 6.283185482025146484375;
    float _622 = sin(_620);
    float _624 = -_614;
    float _626 = fma(_302, _608, _624);
    float _628 = -_616;
    float _630 = fma(_300, _610, _628);
    float _632 = -_618;
    float _634 = fma(_304, _606, _632);
    float _636 = _626 * _626;
    float _638 = sqrt(_612);
    float _640 = fma(_634, _634, _636);
    float _642 = fma(_630, _630, _640);
    float _644 = _596 * _602;
    float _646 = _622 * _602;
    float _648 = fma(_622, _600, _644);
    float _650 = rsqrt(_642);
    float _652 = -_646;
    float _654 = fma(_596, _600, _652);
    float _656 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _648);
    float _658 = _542 * _638;
    float _660 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _654);
    float _662 = _236 * _658;
    float _664 = _216 * _658;
    float _666 = _238 * _658;
    float _668 = _662 * _656;
    float _670 = _664 * _660;
    float _672 = _666 * _242;
    float _674 = _630 * _650;
    float _676 = _668 * _606;
    float _678 = _668 * _608;
    float _680 = _634 * _650;
    float _682 = _668 * _610;
    float _684 = fma(_670, _674, _676);
    float _686 = _626 * _650;
    float _688 = fma(_670, _680, _678);
    float _690 = fma(_672, _302, _684);
    float _692 = fma(_670, _686, _682);
    float _694 = fma(_672, _300, _688);
    float _696 = _266 + _690;
    float _698 = fma(_672, _304, _692);
    float _700 = _262 + _694;
    float _702 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _704 = _696 + _702;
    float _706 = _250 + _698;
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
    float _744 = _692;
    float _746 = _696;
    float _748 = _706;
    float _750 = _576;
    float _752 = _266;
    float _754 = _250;
    float _756 = _580;
    if (!_718)
    {
        _744 = _700;
    }
    float _758 = _744;
    bool _760 = !_718;
    float _762 = _758;
    if (!_760)
    {
        float _764 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _766 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _768 = _716 + _766;
        float _770 = _706 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _772 = rsqrt(_714);
        float _774 = _768 * _764;
        float _776 = _774 * 0.15915493667125701904296875;
        float _778 = _776 * 6.283185482025146484375;
        float _780 = cos(_778);
        float _782 = _776 * 6.283185482025146484375;
        float _784 = sin(_782);
        float _786 = _780 + (-1.0);
        float _788 = _786 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _790 = fma(_784, _770, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _792 = fma(_706, _780, _788);
        float _794 = _772 * _790;
        float _796 = fma(_710, _794, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _798 = fma(_704, _794, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _762 = _796;
        _746 = _798;
        _748 = _792;
    }
    float _800 = _762;
    float _802 = _746;
    float _804 = _748;
    float _806 = -_578;
    float _808 = _806 + _800;
    float _810 = -_580;
    float _812 = _810 + _802;
    float _814 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _816 = _808 + _814;
    float _818 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _820 = _812 + _818;
    float _822 = fma(_816, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _824 = fma(_820, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _3958 = float2(_822, _824);
    float _826 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_3958, float2(0.0), isnan(_3958)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_3958, float2(0.0), isnan(_3958)), level(0.0)).x;
    float _828 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _830 = int(_828);
    int _832 = abs(_738);
    float _834 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _836 = int(_834);
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _842 = float(_830);
    float _844 = 1.0 / _840;
    float _846 = float(uint(_836));
    float _848 = 1.0 / _842;
    int _850 = ~_836;
    int _852 = _850 + 1;
    bool _854 = _836 == 0;
    float _856 = 1.0 / _846;
    float _858 = _126 * _848;
    int _860 = ~_836;
    int _862 = _860 + 1;
    float _864 = float(_836);
    float _866 = trunc(_858);
    int _868 = int(_866);
    int _870 = as_type<int>(_856) + (-2);
    float _872 = float(uint(_868));
    float _874 = as_type<float>(_870) * _872;
    float _876 = trunc(_874);
    float _878 = precise::max(_876, 0.0);
    uint _881 = uint(_878);
    float _883 = float(_868);
    bool _885 = _883 >= _864;
    bool _887 = isnan(_883);
    bool _889 = _885 || _887;
    bool _891 = isnan(_864);
    bool _893 = _889 || _891;
    float _895 = float(_893);
    int _897 = _862 * int(_881);
    int _899 = _897 + _868;
    float _901 = trunc(_895);
    int _903 = int(_901);
    float _905 = float(uint(_899));
    float _907 = as_type<float>(_870) * _905;
    int _909 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _911 = _909 != 0;
    float _913 = trunc(_907);
    float _915 = precise::max(_913, 0.0);
    uint _917 = uint(_915);
    bool _919 = !_911;
    float _921 = _919 ? 7.345489978790283203125 : 1.0;
    float _923 = _921 * _508;
    float _925 = floor(_923);
    int _927 = int(_881) + int(_917);
    int _929 = _852 * _927;
    int _931 = _929 + _868;
    bool _933 = uint(_931) >= uint(_836);
    float _935 = -_925;
    float _937 = _923 + _935;
    int _939 = ~_903;
    int _941 = _939 + 1;
    int _943 = _941 + 1;
    bool _945 = !_933;
    int _947 = _945 ? 0 : (-1);
    int _949 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _951 = _949 != 0;
    float _953 = _126 * _864;
    int _955 = ~_927;
    int _957 = _955 + _947;
    int _959 = _957 + 1;
    float _961 = _937 * _864;
    float _963 = _953 * _176;
    int _965 = _836 + (-1);
    int _967 = _836 * _959;
    int _969 = _967 + _868;
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _973 = _971 != 0;
    float _975 = trunc(_961);
    int _977 = int(_975);
    bool _979 = !_854;
    int _981 = _979 ? _969 : (-1);
    bool _983 = !_973;
    int _985 = _983 ? 0 : 1;
    bool _987 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _989 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _991 = _987 || _989;
    bool _993 = isnan(0.5);
    bool _995 = _991 || _993;
    float _997 = trunc(_963);
    int _999 = int(_997);
    int _1001 = _981 * _943;
    int _1003 = abs(_734);
    int _1005 = abs(_985);
    int _1007 = _903 * _965;
    int _1009 = _1007 + _1001;
    int _1011 = abs(_742);
    int _1013 = _1009 * _1003;
    bool _1015 = !_951;
    int _1017 = _1015 ? 0 : 1;
    int _1019 = _977 * _1005;
    int _1021 = _1019 + _868;
    float _1023 = _802;
    float _1025 = _808;
    float _1027 = _961;
    if (!_995)
    {
        float _1029 = -_266;
        float _1031 = _1029 + _802;
        _1023 = _1031;
    }
    float _1033 = _1023;
    int _1035 = abs(_1017);
    int _1037 = _999 * _832;
    int _1039 = _1037 + _1013;
    float _1041 = -_576;
    float _1043 = _1041 + _250;
    float _1045 = as_type<float>(_999);
    float _1047 = as_type<float>(_1035);
    float _1049 = _1043;
    if (!_995)
    {
        float _1051 = -_262;
        float _1053 = _1051 + _800;
        _1045 = _1053;
    }
    float _1055 = _1045;
    float _1057 = -_578;
    float _1059 = _262 + _1057;
    float _1061 = -_576;
    float _1063 = _1061 + _804;
    int _1065 = _1021 * _1011;
    int _1067 = _1065 + _1039;
    float _1069 = _1063;
    if (!_995)
    {
        float _1071 = -_250;
        float _1073 = _1071 + _804;
        _750 = _1073;
    }
    float _1075 = _750;
    float _1077 = -_580;
    float _1079 = _266 + _1077;
    if (_995)
    {
        _752 = _812;
    }
    float _1081 = _752;
    int _1083 = _977 * _1035;
    int _1085 = _1083 + _1067;
    float _1087 = _1081;
    if (!_995)
    {
        float _1089 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1091 = _1059 + _1089;
        _1047 = _1091;
    }
    float _1093 = _1047;
    float _1095 = fma(_826, 100.0, _1043);
    float _1097 = _1093;
    if (!_995)
    {
        float _1099 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        _1049 = _1099;
    }
    float _1101 = _1049;
    if (!_995)
    {
        float _1103 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1105 = _1095 + _1103;
        _754 = _1105;
    }
    float _1107 = _754;
    float _1109 = _1107;
    if (!_995)
    {
        float _1111 = _1107 * _1107;
        _1109 = _1111;
    }
    float _1113 = _1109;
    float _1115 = _1113;
    if (!_995)
    {
        float _1117 = fma(_1093, _1093, _1113);
        _1115 = _1117;
    }
    float _1119 = _1115;
    if (!_995)
    {
        float _1121 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1123 = _1079 + _1121;
        _1097 = _1123;
    }
    float _1125 = _1097;
    float _1127 = _1125;
    if (!_995)
    {
        float _1129 = fma(_1125, _1125, _1119);
        _756 = _1129;
    }
    float _1131 = _756;
    float _1133 = fma(_826, 100.0, _1063);
    float _1135 = _1131;
    float _1137 = _1133;
    if (!_995)
    {
        float _1139 = sqrt(_1131);
        _1135 = _1139;
    }
    float _1141 = _1135;
    if (!_995)
    {
        float _1143 = precise::min(_1141, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        _1127 = _1143;
    }
    float _1145 = _1127;
    float _1147 = _1145;
    if (!_995)
    {
        float _1149 = _1145 * _1101;
        _1069 = _1149;
    }
    float _1151 = _1069;
    if (_995)
    {
        _1147 = _808;
    }
    float _1153 = _1147;
    float _1155 = _1153;
    if (!_995)
    {
        float _1157 = fma(_1075, _1151, _1095);
        _1137 = _1157;
    }
    float _1159 = _1137;
    if (!_995)
    {
        float _1161 = fma(_1055, _1151, _1059);
        _1155 = _1161;
    }
    float _1163 = _1155;
    if (!_995)
    {
        float _1165 = fma(_1033, _1151, _1079);
        _1087 = _1165;
    }
    float _1167 = _1087;
    float _1169 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1171 = _1159 + _1169;
    float _1173 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1175 = _1163 + _1173;
    float _1177 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1179 = _1167 + _1177;
    float _1181 = _1171 * _1171;
    float _1183 = fma(_1175, _1175, _1181);
    float _1185 = fma(_1179, _1179, _1183);
    float _1187 = rsqrt(_1185);
    float _1189 = _1187 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1191 = _1175 * _1189;
    float _1193 = _1179 * _1189;
    float _1195 = _1191 * _1191;
    float _1197 = _1193 * _1193;
    float _1199 = _1195 + _1197;
    float _1201 = sqrt(_1199);
    bool _1203 = _1201 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1205 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1207 = _1201 + _1205;
    float _1209 = _1187;
    float _1211 = _1207;
    float _1213 = _1171;
    float _1215 = _1189;
    if (_1203)
    {
        float _1217 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1209 = _1217;
    }
    float _1219 = _1209;
    float _1221 = _1219;
    if (_1203)
    {
        float _1223 = _1207 * _1219;
        _1211 = _1223;
    }
    float _1225 = _1211;
    if (_1203)
    {
        float _1227 = rsqrt(_1199);
        _1221 = _1227;
    }
    float _1229 = _1221;
    float _1231 = _1229;
    if (_1203)
    {
        float _1233 = _1225 * 0.15915493667125701904296875;
        _1025 = _1233;
    }
    float _1235 = _1025;
    float _1237 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1239 = _1179;
    float _1241 = _1235;
    if (_1203)
    {
        float _1243 = _1235 * 6.283185482025146484375;
        float _1245 = sin(_1243);
        _1239 = _1245;
    }
    float _1247 = _1239;
    float _1249 = precise::max(0.0, _1237);
    float _1251 = _1033;
    float _1253 = _1249;
    if (_1203)
    {
        float _1255 = _1235 * 6.283185482025146484375;
        float _1257 = cos(_1255);
        _1251 = _1257;
    }
    float _1259 = _1251;
    float _1261 = -_1189;
    float _1263 = -_1249;
    float _1265 = fma(_1171, _1261, _1263);
    if (_1203)
    {
        float _1267 = _1265 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1213 = _1267;
    }
    float _1269 = _1213;
    float _1271 = _1247;
    float _1273 = _1269;
    if (_1203)
    {
        float _1275 = fma(_1247, _1269, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1271 = _1275;
    }
    float _1277 = _1271;
    float _1279 = _1277;
    if (!_1203)
    {
        _1273 = _1265;
    }
    float _1281 = _1273;
    float _1283 = _1281;
    if (!_1203)
    {
        _1241 = _1195;
    }
    float _1285 = _1241;
    float _1287 = _1285;
    if (_1203)
    {
        float _1289 = _1229 * _1277;
        _1027 = _1289;
    }
    float _1291 = _1027;
    if (!_1203)
    {
        _1231 = _1191;
    }
    float _1293 = _1231;
    float _1295 = _1293;
    float _1297 = _1259;
    if (_1203)
    {
        float _1299 = _1259 + (-1.0);
        _1253 = _1299;
    }
    float _1301 = _1253;
    if (_1203)
    {
        float _1303 = _1191 * _1291;
        _1295 = _1303;
    }
    float _1305 = _1295;
    if (!_1203)
    {
        _1279 = _1193;
    }
    float _1307 = _1279;
    float _1309 = _1307;
    if (_1203)
    {
        float _1311 = _1193 * _1291;
        _1309 = _1311;
    }
    float _1313 = _1309;
    if (_1203)
    {
        float _1315 = _1301 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1215 = _1315;
    }
    float _1317 = _1215;
    if (_1203)
    {
        float _1319 = _1305 * _1305;
        _1287 = _1319;
    }
    float _1321 = _1287;
    float _1323 = sqrt(_1185);
    if (_1203)
    {
        float _1325 = fma(_1265, _1259, _1317);
        _1283 = _1325;
    }
    float _1327 = _1283;
    if (!_1203)
    {
        _1297 = _1197;
    }
    float _1329 = _1297;
    float _1331 = _1329;
    if (_1203)
    {
        float _1333 = _1313 * _1313;
        _1331 = _1333;
    }
    float _1335 = _1331;
    float _1337 = fma(_1327, _1327, _1321);
    float _1339 = _1337 + _1335;
    float _1341 = fma(_1079, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1343 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1345 = rsqrt(_1339);
    float _1347 = fma(_1059, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1349 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1351 = fma(_1323, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1349);
    float _1353 = precise::clamp(_1351, 0.0, 1.0);
    float _1355 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1343);
    float _1357 = -_1353;
    float _1359 = _1357 + 1.0;
    float _1361 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1355);
    float _1363 = floor(_1347);
    float _1365 = _1361 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1367 = _1345 * _1305;
    float _1369 = _1345 * _1327;
    float _1371 = _1345 * _1313;
    float _1373 = _1367 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1375 = abs(_1359);
    float _1377 = log2(_1375);
    float _1379 = _1369 + 1.0;
    float _1381 = -_1373;
    float _1383 = fma(_1369, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1381);
    float _1385 = -_1363;
    float _1387 = _1347 + _1385;
    float _1389 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1391 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1393 = -_1371;
    float _1395 = fma(_1393, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1383);
    float _1397 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1399 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1401 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1391);
    float _1403 = floor(_1341);
    float _1405 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1397);
    float _1407 = fma(_1163, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1399);
    float _1409 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1401);
    float _1411 = fma(_1395, -0.5, 0.5);
    float _1413 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1405);
    float _1415 = fma(_1167, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1407);
    float _1417 = _1409 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1419 = _1377 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1421 = _1413 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1423 = _1415 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1425 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1427 = exp2(_1419);
    float _1429 = fma(_1395, 0.5, 0.5);
    float _1431 = _1423 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1433 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1425);
    float _1435 = -_1403;
    float _1437 = _1341 + _1435;
    float _1439 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1441 = fma(_1429, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1443 = sqrt(_1411);
    float _1445 = -_1431;
    float _1447 = fma(_1445, _1389, 1.0);
    float _1449 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1433);
    float _1451 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1453 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1439);
    float _1455 = fma(_1429, _1441, -0.212114393711090087890625);
    float _1457 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1449);
    float _1459 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1451);
    float _1461 = log2(_1447);
    float _1463 = -_1369;
    float _1465 = fma(_1427, _1379, _1463);
    float _1467 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1453);
    float _1469 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1459);
    float _1471 = fma(_1429, _1455, 1.570728778839111328125);
    float2 _4976 = float2(_1387, _1437);
    float _1473 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4976, float2(0.0), isnan(_4976)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4976, float2(0.0), isnan(_4976)), level(0.0)).x;
    float _1475 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1467);
    float _1477 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1469);
    float _1479 = 1.0 / _1457;
    float _1481 = _1443 * 0.636619746685028076171875;
    float _1483 = in.m_71.y;
    float _1485 = -_1471;
    float _1487 = fma(_1481, _1485, 1.0);
    float _1489 = float(uint(_1085));
    float _1491 = _1461 * 0.693147182464599609375;
    float _1493 = as_type<float>(_870) * _1489;
    float _1495 = _1491 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1497 = fma(_1465, 0.5, 0.5);
    float _1499 = _1477 * _1479;
    float _1501 = _1475 * _1479;
    float _1503 = trunc(_1493);
    float _1505 = precise::max(_1503, 0.0);
    uint _1507 = uint(_1505);
    float _1509 = fma(_1499, 0.5, 0.5);
    float _1511 = fma(_1501, -0.5, 0.5);
    float3 _5039 = float3(_1509, _1511, _1495);
    float _1513 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5039, float3(0.0), isnan(_5039)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5039, float3(0.0), isnan(_5039)), level(0.0)).x;
    float3 _5050 = float3(_1509, _1511, _1495);
    float4 _1516 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5050, float3(0.0), isnan(_5050)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5050, float3(0.0), isnan(_5050)), level(0.0)).xyzw;
    float _1518 = _1516.x;
    float _1520 = _1516.y;
    float _1522 = _1516.z;
    float _1524 = _1516.w;
    float2 _5066 = float2(_1487, _1497);
    float3 _1528 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5066, float2(0.0), isnan(_5066)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5066, float2(0.0), isnan(_5066)), level(0.0)).xyz;
    float _1530 = _1528.x;
    float _1532 = _1528.y;
    float _1534 = _1528.z;
    int _1536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1538 = _1536 != 0;
    float _1540 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1542 = _1540 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    out.m_73.w = _564;
    int _1544 = ~_836;
    int _1546 = _1544 + 1;
    float _1548 = -_1483;
    float _1550 = _1548 + 1.0;
    float _1552 = 1.0 / _1542;
    bool _1554 = _510 > 0.5;
    float _1556 = _1417 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1558 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1560 = _1546 * int(_1507);
    int _1562 = _1560 + _1085;
    int _1564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1566 = _1564 != 0;
    float _1568 = _508 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1570 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1572 = _1570 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1574 = _1483;
    float _1576 = _1457;
    if (_1538)
    {
        float _1578 = _1554 ? _1550 : _1483;
        _1574 = _1578;
    }
    float _1580 = _1574;
    float _1582 = _510 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1584 = float(uint(_1562));
    float _1586 = -_1558;
    float _1588 = fma(_1568, 2.0, _1586);
    float _1590 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1592 = _1590 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1594 = 1.0 / _1572;
    float _1596 = as_type<float>(_870) * _1584;
    float _1598 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[118].w;
    if (_1566)
    {
        float _1602 = in.m_59.x;
        _1600 = _1602;
    }
    float _1604 = _1600;
    float _1606 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1608 = 1.0 / _1592;
    float _1610 = fma(_508, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1598);
    float _1612 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1614 = fma(_1582, -2.0, _1606);
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1618 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1616;
    float _1620 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1612);
    float _1622 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1624 = _1622 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1626 = trunc(_1596);
    float _1628 = precise::max(_1626, 0.0);
    uint _1630 = uint(_1628);
    float _1632 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1634 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1632;
    float _1636 = _1618 * _844;
    float _1638 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1640 = _1638 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1642 = _1624 * _1552;
    float _1644 = _1634 * _1594;
    int _1646 = ~_836;
    int _1648 = _1646 + 1;
    float _1650 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1614);
    float _1652 = _1640 * _1608;
    float _1654 = in.m_71.x;
    float _1656 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1610);
    float _1658 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1660 = _208 + _1658;
    bool _1662 = _1604 > 0.5;
    bool _1664 = _1662 && _1566;
    float _1666 = -_126;
    float _1668 = fma(_1666, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1588);
    bool _1670 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1672 = isnan(_208);
    bool _1674 = _1670 || _1672;
    bool _1676 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1678 = _1674 || _1676;
    float _1680 = float(_1678);
    float _1682 = fma(_1642, _1660, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _1684 = int(_1507) + int(_1630);
    float _1686 = fma(_1580, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1688 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1620);
    float _1690 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1692 = _208 + _1690;
    bool _1694 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1696 = isnan(_208);
    bool _1698 = _1694 || _1696;
    bool _1700 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1702 = _1698 || _1700;
    float _1704 = float(_1702);
    int _1706 = _1648 * _1684;
    int _1708 = _1706 + _1085;
    float _1710 = -_1650;
    float _1712 = fma(_1688, _1686, _1710);
    bool _1714 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1716 = isnan(_208);
    bool _1718 = _1714 || _1716;
    bool _1720 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1722 = _1718 || _1720;
    float _1724 = float(_1722);
    float _1726 = fma(_1636, _1692, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1728 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1730 = isnan(_208);
    bool _1732 = _1728 || _1730;
    bool _1734 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1736 = _1732 || _1734;
    float _1738 = float(_1736);
    float _1740 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1742 = _208 + _1740;
    bool _1744 = uint(_1708) >= uint(_836);
    float _1746 = -_1724;
    float _1748 = _1746 + 1.0;
    float _1750 = -_1680;
    float _1752 = _1750 + 1.0;
    float _1754 = float(uint(_1021));
    float _1756 = fma(_1644, _1742, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1758 = !_1744;
    int _1760 = _1758 ? 0 : (-1);
    float _1762 = _1680 * _1748;
    float _1764 = _1738 * _1752;
    float _1766 = -_1738;
    float _1768 = _1766 + 1.0;
    int _1770 = ~_1684;
    int _1772 = _1770 + _1760;
    int _1774 = _1772 + 1;
    float _1776 = -_1704;
    float _1778 = _1776 + 1.0;
    bool _1780 = _208 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1782 = isnan(_208);
    bool _1784 = _1780 || _1782;
    bool _1786 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1788 = _1784 || _1786;
    float _1790 = float(_1788);
    float _1792 = _1712 + 0.5;
    float _1794 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1556);
    int _1796 = _836 * _1774;
    int _1798 = _1796 + _1085;
    float _1800 = _1704 * _1768;
    float _1802 = _1790 * _1778;
    float _1804 = _1778;
    float _1806 = _1654;
    if (_1566)
    {
        _1804 = _1654;
    }
    float _1808 = _1804;
    float _1810 = as_type<float>(_870) * _1754;
    bool _1812 = !_854;
    int _1814 = _1812 ? _1798 : (-1);
    float _1816 = _1726 * _1802;
    float _1818 = -_1790;
    float _1820 = _1818 + 1.0;
    float _1822 = _1808;
    if (_1664)
    {
        float _1824 = -_1808;
        float _1826 = _1824 + 1.0;
        _1822 = _1826;
    }
    float _1828 = _1822;
    int _1830 = _1814 >> 31;
    float _1832 = trunc(_1810);
    float _1834 = precise::max(_1832, 0.0);
    uint _1836 = uint(_1834);
    int _1838 = _1814 & 3;
    bool _1840 = _1838 != 0;
    out.m_75.y = _648;
    int _1842 = _1830 & 3;
    float _1844 = fma(_1423, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1794);
    if (_1566)
    {
        _1806 = _1828;
    }
    float _1846 = _1806;
    float _1848 = fma(_1820, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1816);
    int _1850 = _1814 + _1842;
    float _1852 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1854 = _208 + _1852;
    int _1856 = ~_836;
    int _1858 = _1856 + 1;
    float _1860 = fma(_1846, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1862 = _1850 >> 2;
    float _1864 = fma(_1682, _1800, _1848);
    int _1866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1868 = _1866 != 0;
    float _1870 = fma(_1656, _1860, _1668);
    int _1872 = _1862 << 4;
    int _1874 = _1872 + 368;
    int _1876 = _1858 * int(_1836);
    int _1878 = _1876 + _1021;
    float _1880 = fma(_1652, _1854, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1882 = fma(_1756, _1764, _1864);
    uint _1884 = uint(int(uint(_1874) >> uint(2)));
    uint _1886 = uint(int(uint(int(_1884)) >> uint(2)));
    int _1888 = int(_1884) & 3;
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[int(_1886)][_1888];
    int _1892 = int(_1884) + 1;
    uint _1894 = uint(int(uint(_1892) >> uint(2)));
    int _1896 = _1892 & 3;
    float _1898 = (*spvDescriptorSet0.vp_c9)._m0[int(_1894)][_1896];
    int _1900 = _1814 & 3;
    bool _1902 = _1900 != 0;
    out.m_77.x = _664;
    float _1904 = float(uint(_1878));
    float _1906 = fma(_1880, _1762, _1882);
    bool _1908 = uint(_1900) > 1u;
    float _1910 = _1377 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1912 = as_type<float>(_870) * _1904;
    int _1914 = _1874 + 8;
    uint _1916 = uint(int(uint(_1914) >> uint(2)));
    uint _1918 = uint(int(uint(int(_1916)) >> uint(2)));
    int _1920 = int(_1916) & 3;
    float _1922 = (*spvDescriptorSet0.vp_c9)._m0[int(_1918)][_1920];
    int _1924 = int(_1916) + 1;
    uint _1926 = uint(int(uint(_1924) >> uint(2)));
    int _1928 = _1924 & 3;
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[int(_1926)][_1928];
    float _1932 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1934 = trunc(_1912);
    float _1936 = precise::max(_1934, 0.0);
    uint _1938 = uint(_1936);
    float _1940 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1944 = _1840 ? 0 : 1;
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1948 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1950 = _1940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1952 = _1942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1954 = _1870 + 0.5;
    int _1956 = ~_1944;
    int _1958 = _1956 + 1;
    int _1960 = _1958 + 1;
    float _1962 = exp2(_1910);
    int _1964 = ~_836;
    int _1966 = _1964 + 1;
    out.m_79.x = _1948;
    out.m_79.y = _1950;
    out.m_79.z = _1952;
    out.m_79.w = _1946;
    int _1968 = _1960;
    if (!_1908)
    {
        int _1970 = ~_1944;
        int _1972 = _1970 + 1;
        _1968 = _1972;
    }
    int _1974 = _1968;
    float _1976 = fma(_1365, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1844);
    bool _1978 = _1900 != 3;
    out.m_81.x = _1954;
    out.m_81.y = _1792;
    int _1980 = int(_1836) + int(_1938);
    out.m_83.x = _1059;
    out.m_83.y = _1095;
    out.m_83.z = _1079;
    bool _1982 = !_1902;
    int _1984 = _1982 ? 0 : 1;
    bool _1986 = uint(_1900) >= 2u;
    int _1988 = _1966 * _1980;
    int _1990 = _1988 + _1021;
    int _1992 = abs(_1984);
    float _1994 = fma(_1724, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1906);
    int _1996 = abs(_1974);
    int _1998 = ~_1992;
    int _2000 = _1998 + 1;
    int _2002 = _2000 + 1;
    float _2004 = _1994 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2006 = ~_1996;
    int _2008 = _2006 + 1;
    int _2010 = _2008 + 1;
    int _2012 = _2010 * as_type<int>(_1898);
    int _2014 = _1986 ? 0 : 1;
    int _2016 = _2002 * as_type<int>(_1890);
    int _2018 = _2016 + _2012;
    bool _2020 = _1900 != 3;
    float _2022 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2024 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2028 = ~_2014;
    int _2030 = _2028 + 1;
    int _2032 = _2030 + 1;
    float _2034 = _2022 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2036 = _2024 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2038 = _2026 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2040 = _2032;
    float _2042 = _1976;
    if (_1978)
    {
        int _2044 = ~_2014;
        int _2046 = _2044 + 1;
        _2040 = _2046;
    }
    int _2048 = _2040;
    bool _2050 = uint(_1990) >= uint(_836);
    float _2052 = in.m_85.x;
    float _2054 = in.m_85.y;
    float _2056 = in.m_85.z;
    bool _2058 = !_1868;
    int _2060 = _2058 ? 0 : 1;
    bool _2062 = !_2020;
    int _2064 = _2062 ? 0 : (-1);
    out.m_87.x = _2034;
    out.m_87.y = _2036;
    out.m_87.z = _2038;
    out.m_87.w = _2004;
    int _2066 = abs(_2048);
    int _2068 = abs(_2060);
    bool _2070 = !_2050;
    int _2072 = _2070 ? 0 : (-1);
    int _2074 = abs(_2064);
    int _2076 = ~_2066;
    int _2078 = _2076 + 1;
    int _2080 = _2078 + 1;
    int _2082 = ~_1980;
    int _2084 = _2082 + _2072;
    int _2086 = _2084 + 1;
    float _2088 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2090 = ~_2074;
    int _2092 = _2090 + 1;
    int _2094 = _2092 + 1;
    int _2096 = _2080 * as_type<int>(_1922);
    int _2098 = _2096 + _2018;
    int _2100 = ~_2068;
    int _2102 = _2100 + 1;
    int _2104 = _2102 + 1;
    float _2106 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2088);
    int _2108 = _836 * _2086;
    int _2110 = _2108 + _1021;
    bool _2112 = _648 != 0.0;
    bool _2114 = isnan(_648);
    bool _2116 = _2112 || _2114;
    bool _2118 = isnan(0.0);
    bool _2120 = _2116 || _2118;
    int _2122 = _2094 * as_type<int>(_1930);
    int _2124 = _2122 + _2098;
    float _2126 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2106);
    float _2128 = _1095 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2130 = _654 == 0.0;
    bool _2132 = !_2120;
    bool _2134 = _2130 && _2132;
    int _2136 = _2124 * _2104;
    float _2138 = _2126 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2140 = fma(_1059, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2128);
    bool _2142 = !_854;
    int _2144 = _2142 ? _2110 : (-1);
    float _2146 = in.m_65.x;
    float _2148 = 1.0 / _2138;
    float _2150 = fma(_1079, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2140);
    bool _2152 = _242 == 0.0;
    bool _2154 = _2152 && _2134;
    int _2156 = _2144 * _2068;
    int _2158 = _2156 + _2136;
    float _2160 = _2150 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2162 = _1457 * 0.5;
    float _2164 = float(_2158);
    float _2166 = _2160 + _2138;
    out.m_89.x = _2164;
    float _2168 = _2054;
    float _2170 = _2052;
    float _2172 = _2056;
    float _2174 = _2162;
    if (!_2154)
    {
        float _2176 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2054);
        _2168 = _2176;
    }
    float _2178 = _2168;
    float _2180 = _2166 * _2148;
    float _2182 = _2180 * 0.5;
    if (!_2154)
    {
        float _2184 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2052);
        _2170 = _2184;
    }
    float _2186 = _2170;
    if (!_2154)
    {
        float _2188 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2056);
        _2172 = _2188;
    }
    float _2190 = _2172;
    float _2192 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2194 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2192);
    bool _2196 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2198 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2200 = _2196 || _2198;
    bool _2202 = isnan(0.5);
    bool _2204 = _2200 || _2202;
    float _2206 = _608 * _2178;
    float _2208 = _610 * _2178;
    float _2210 = _606 * _2178;
    float _2212 = _1976 + _1457;
    float _2214 = 1.0 / _2194;
    float _2216 = fma(_680, _2186, _2206);
    float _2218 = fma(_686, _2186, _2208);
    float _2220 = fma(_674, _2186, _2210);
    float _2222 = _2212 * 0.5;
    float _2224 = fma(_300, _2190, _2216);
    float _2226 = fma(_304, _2190, _2218);
    float _2228 = fma(_302, _2190, _2220);
    float _2230 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2232 = _2214 * _2230;
    float _2234 = fma(_1475, -0.5, _2162);
    if (_2204)
    {
        _2174 = 1.0;
    }
    float _2236 = _2174;
    float _2238 = abs(_2232);
    float _2240 = log2(_2238);
    bool _2242 = _2232 <= 8000.0;
    bool _2244 = isnan(_2232);
    bool _2246 = _2242 || _2244;
    bool _2248 = isnan(8000.0);
    bool _2250 = _2246 || _2248;
    float _2252 = float(_2250);
    float _2254 = _2240 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2256 = exp2(_2254);
    float _2258 = fma(_2256, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2260 = precise::clamp(_2258, 0.0, 1.0);
    float _2262 = fma(_2260, -2.0, 3.0);
    float _2264 = _2260 * _2260;
    float _2266 = _2264 * _2262;
    float _2268 = -_2266;
    float _2270 = _2268 + 1.0;
    float _2272 = fma(_2270, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2266);
    float _2274 = _2270;
    float _2276 = _2236;
    if (_2204)
    {
        _2274 = 1.0;
    }
    float _2278 = _2274;
    float _2280 = _2252 * _2272;
    float _2282 = _1477 + _1457;
    float _2284 = _2282 * 0.5;
    float _2286 = _2278;
    if (!_2204)
    {
        float _2288 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2290 = _2288 * 0.15915493667125701904296875;
        float _2292 = _2290 * 6.283185482025146484375;
        float _2294 = cos(_2292);
        float _2296 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2298 = _2296 * 0.15915493667125701904296875;
        float _2300 = _2290 * 6.283185482025146484375;
        float _2302 = sin(_2300);
        float _2304 = 1.0 / _2294;
        float _2306 = _2298 * 6.283185482025146484375;
        float _2308 = cos(_2306);
        float _2310 = _2302 * _2304;
        float _2312 = _2298 * 6.283185482025146484375;
        float _2314 = sin(_2312);
        float _2316 = _2308 * _2310;
        float _2318 = 1.0 / _2316;
        float _2320 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2322 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2320;
        float _2324 = 1.0 / _2322;
        float _2326 = _2314 * _2318;
        float _2328 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2330 = fma(_2232, _2326, _2328);
        float _2332 = _2330 * _2324;
        float _2334 = precise::clamp(_2332, 0.0, 1.0);
        _2276 = _2334;
    }
    float _2336 = _2276;
    if (!_2204)
    {
        float _2338 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2340 = _2338 * 0.15915493667125701904296875;
        float _2342 = _2340 * 6.283185482025146484375;
        float _2344 = cos(_2342);
        float _2346 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2348 = _2346 * 0.15915493667125701904296875;
        float _2350 = _2340 * 6.283185482025146484375;
        float _2352 = sin(_2350);
        float _2354 = 1.0 / _2344;
        float _2356 = _2348 * 6.283185482025146484375;
        float _2358 = cos(_2356);
        float _2360 = _2352 * _2354;
        float _2362 = _2348 * 6.283185482025146484375;
        float _2364 = sin(_2362);
        float _2366 = _2358 * _2360;
        float _2368 = 1.0 / _2366;
        float _2370 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2372 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2370;
        float _2374 = 1.0 / _2372;
        float _2376 = _2364 * _2368;
        float _2378 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2380 = fma(_2232, _2376, _2378);
        float _2382 = _2380 * _2374;
        float _2384 = precise::clamp(_2382, 0.0, 1.0);
        float _2386 = -_2384;
        float _2388 = _2386 + 1.0;
        _2286 = _2388;
    }
    float _2390 = _2286;
    float _2392 = -_1962;
    float _2394 = _2392 + 1.0;
    float _2396 = _2280 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2398 = -_1473;
    float _2400 = _2398 + 1.0;
    float _2402 = _2394 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_91.x = _2284;
    out.m_91.y = _2234;
    out.m_91.z = _2222;
    out.m_91.w = _1457;
    float _2404 = _2400 * _2396;
    float _2406 = precise::clamp(_2404, 0.0, 1.0);
    bool _2408 = _1323 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2410 = isnan(_1323);
    bool _2412 = _2408 || _2410;
    bool _2414 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2416 = _2412 || _2414;
    float _2418 = _2402 * _1513;
    float _2420 = -_2402;
    float _2422 = _2420 + 1.0;
    float _2424 = -_2406;
    float _2426 = fma(_2424, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_93.x = _2224;
    out.m_93.y = _2226;
    out.m_93.z = _2228;
    float _2428 = _1524 * _2418;
    float _2430 = _1534 * _2418;
    float _2432 = _2426 * _2146;
    float _2434 = _1524 * _2422;
    float _2436 = fma(_1530, _2428, _1518);
    float _2438 = fma(_1532, _2428, _1520);
    float _2440 = fma(_1524, _2430, _1522);
    out.m_95.x = _1163;
    out.m_95.y = _1159;
    out.m_95.z = _1167;
    float _2442 = _2428;
    float _2444 = _2432;
    if (!_2416)
    {
        _2442 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2446 = _2442;
    out.m_97.x = _2436;
    out.m_97.y = _2438;
    out.m_97.z = _2440;
    out.m_97.w = _2434;
    out.gl_Position.x = _1477;
    out.gl_Position.y = _1475;
    out.gl_Position.z = _1976;
    out.gl_Position.w = _1457;
    float _2448 = _2432 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2450 = _2336 * _2390;
    float _2452 = _2450;
    float _2454 = _2448;
    float _2456 = _2446;
    float _2458 = _2446;
    if (!_2416)
    {
        _2444 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2460 = _2444;
    float _2462 = _2460;
    float _2464 = _2460;
    if (!_2416)
    {
        _1576 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2466 = _1576;
    out.m_99.x = _2448;
    float _2468 = _2450 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2470 = _2466;
    float _2472 = _2466;
    if (!_2416)
    {
        _2042 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2474 = _2042;
    float _2476 = _2474;
    float _2478 = _2474;
    if (!_2416)
    {
        _2452 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2480 = _2452;
    float _2482 = _2480;
    float _2484 = _2480;
    if (!_2416)
    {
        _2454 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2486 = _2454;
    bool _2488 = !_2416;
    float _2490 = _2486;
    float _2492 = _2486;
    if (!_2488)
    {
        bool _2494 = _1323 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2496 = isnan(_1323);
        bool _2498 = _2494 || _2496;
        bool _2500 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2502 = _2498 || _2500;
        if (!_2502)
        {
            float _2504 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2506 = _1323 + _2504;
            float _2508 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2510 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2508;
            float _2512 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2514 = _2512 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2516 = 1.0 / _2510;
            float _2518 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2520 = _2518 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2522 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2524 = _2522 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2526 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2528 = _2526 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2532 = _2530 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2534 = _2506 * _2516;
            float _2536 = precise::clamp(_2534, 0.0, 1.0);
            float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2540 = _2538 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2542 = fma(_2536, _2514, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2544 = fma(_2536, _2540, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2546 = fma(_2536, _2520, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2548 = fma(_2536, _2524, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2550 = fma(_2536, _2528, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2552 = fma(_2536, _2532, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2464 = _2546;
            _2492 = _2550;
            _2458 = _2542;
            _2478 = _2548;
            _2472 = _2544;
            _2484 = _2552;
            _2554 = true;
        }
        else
        {
            bool _2556 = _1323 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2558 = isnan(_1323);
            bool _2560 = _2556 || _2558;
            bool _2562 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2564 = _2560 || _2562;
            if (!_2564)
            {
                _2456 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2566 = _2456;
            _2458 = _2566;
            if (!_2564)
            {
                _2462 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2568 = _2462;
            _2464 = _2568;
            if (!_2564)
            {
                _2470 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2570 = _2470;
            _2472 = _2570;
            if (!_2564)
            {
                _2476 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2572 = _2476;
            _2478 = _2572;
            if (!_2564)
            {
                _2490 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2574 = _2490;
            _2492 = _2574;
            if (!_2564)
            {
                _2482 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2576 = _2482;
            bool _2578 = !_2564;
            _2484 = _2576;
            if (!_2578)
            {
                bool _2580 = _1323 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2582 = isnan(_1323);
                bool _2584 = _2580 || _2582;
                bool _2586 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2588 = _2584 || _2586;
                if (!_2588)
                {
                    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2592 = _1323 + _2590;
                    float _2594 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2596 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2594;
                    float _2598 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2600 = _2598 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2602 = 1.0 / _2596;
                    float _2604 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2606 = _2604 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2608 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2612 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2614 = _2612 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2616 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2618 = _2616 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2620 = _2592 * _2602;
                    float _2622 = precise::clamp(_2620, 0.0, 1.0);
                    float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2626 = _2624 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2628 = fma(_2622, _2600, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2630 = fma(_2622, _2626, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2632 = fma(_2622, _2606, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2634 = fma(_2622, _2610, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2636 = fma(_2622, _2614, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2638 = fma(_2622, _2618, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2464 = _2632;
                    _2492 = _2636;
                    _2458 = _2628;
                    _2478 = _2634;
                    _2472 = _2630;
                    _2484 = _2638;
                    _2554 = true;
                }
                else
                {
                    _2464 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2492 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2458 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2478 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2472 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2484 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2554 = false;
    float _2640 = _2464;
    float _2642 = _2492;
    float _2644 = _2458;
    float _2646 = _2478;
    float _2648 = _2472;
    float _2650 = _2484;
    float _2652 = fma(_2226, -0.5, 0.5);
    float _2654 = precise::clamp(_2652, 0.0, 1.0);
    float _2656 = -_2640;
    float _2658 = _2656 + _2642;
    float _2660 = _2468 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2662 = -_2644;
    float _2664 = _2662 + _2646;
    float _2666 = fma(_2654, _2658, _2640);
    out.m_101.x = 0.0;
    float _2668 = -_2648;
    float _2670 = _2668 + _2650;
    float _2672 = fma(_2654, _2664, _2644);
    float _2674 = _2666 * 0.586610972881317138671875;
    out.m_55.x = _2660;
    bool _2676 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2678 = fma(_2654, _2670, _2648);
    float _2680 = fma(_2672, 0.298911988735198974609375, _2674);
    bool _2682 = _2336 > 0.0;
    bool _2684 = isnan(_2336);
    bool _2686 = _2682 || _2684;
    bool _2688 = isnan(0.0);
    bool _2690 = _2686 || _2688;
    float _2692 = fma(_2678, 0.114477999508380889892578125, _2680);
    bool _2694 = _2390 <= 0.0;
    bool _2696 = !_2690;
    bool _2698 = _2694 || _2696;
    float _2700 = -_2692;
    float _2702 = _2672 + _2700;
    float _2704 = -_2692;
    float _2706 = _2666 + _2704;
    float _2708 = -_2692;
    float _2710 = _2678 + _2708;
    float _2712 = fma(_2702, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2692);
    float _2714 = fma(_2706, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2692);
    float _2716 = fma(_2710, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2692);
    bool _2718 = !_2676;
    if (!_2718)
    {
        float _2720 = -_1159;
        float _2722 = _2720 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2724 = -_1163;
        float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2728 = -_1167;
        float _2730 = _2728 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2732 = _2722 * _2722;
        float _2734 = fma(_2726, _2726, _2732);
        float _2736 = fma(_2730, _2730, _2734);
        float _2738 = sqrt(_2736);
        float _2740 = rsqrt(_2736);
        float _2742 = -_2738;
        float _2744 = _2742 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2746 = _2744 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2748 = precise::clamp(_2746, 0.0, 1.0);
        float _2750 = _2726 * _2740;
        float _2752 = _2722 * _2740;
        float _2754 = abs(_2748);
        float _2756 = log2(_2754);
        float _2758 = _2730 * _2740;
        float _2760 = _2750 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2762 = _2226 * _2752;
        float _2764 = -_2752;
        float _2766 = -_2760;
        float _2768 = fma(_2764, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2766);
        float _2770 = fma(_2224, _2750, _2762);
        float _2772 = -_2758;
        float _2774 = fma(_2772, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2768);
        float _2776 = fma(_2228, _2758, _2770);
        float _2778 = precise::clamp(_2776, 0.0, 1.0);
        float _2780 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2782 = _2774 + _2780;
        float _2784 = _2756 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2786 = _2782 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2788 = precise::clamp(_2786, 0.0, 1.0);
        float _2790 = exp2(_2784);
        float _2792 = _2790 * _2788;
        float _2794 = _2778 * _2792;
        float _2796 = _2794 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2798 = _2794 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2800 = _2794 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _2796;
        out.m_101.y = _2798;
        out.m_101.z = _2800;
    }
    out.m_73.x = _2712;
    out.m_73.y = _2714;
    out.m_73.z = _2716;
    if (!_2698)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_55.x = 0.0;
    float _2802 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2802;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

