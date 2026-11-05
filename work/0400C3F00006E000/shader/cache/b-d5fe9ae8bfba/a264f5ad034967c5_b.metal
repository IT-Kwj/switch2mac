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

struct _35
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c12 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c11 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    constant _16* vp_c13 [[id(7)]];
    const device _35* vp_s0 [[id(8)]];
    texture2d<float> vp_t_tcb_2A [[id(9)]];
    sampler vp_t_tcb_2ASmplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_2ASmplr_w [[id(17)]];
    sampler vp_t_tcb_32Smplr_w [[id(18)]];
    sampler vp_t_tcb_30Smplr_w [[id(19)]];
    sampler vp_t_tcb_1CSmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_77 [[user(locn0)]];
    float4 m_75 [[user(locn1)]];
    float4 m_79 [[user(locn2)]];
    float4 m_87 [[user(locn3)]];
    float4 m_93 [[user(locn4)]];
    float4 m_58 [[user(locn5)]];
    float4 m_85 [[user(locn6)]];
    float4 m_83 [[user(locn7)]];
    float4 m_91 [[user(locn8)]];
    float4 m_89 [[user(locn9)]];
    float4 m_95 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_64 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_66 [[attribute(3)]];
    float4 m_81 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_60 [[attribute(6)]];
    float4 m_68 [[attribute(7)]];
    float4 m_73 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2072 = false;
    bool _842 = false;
    bool _830 = false;
    bool _348 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_55.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_58.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2437 = as_type<float>(_130);
        out.gl_Position.z = _2437;
    }
    if (!_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_60.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_144)
    {
        float _150 = float(_114);
        _124 = _150;
    }
    float _152 = _124;
    bool _154 = _148 >= _152;
    bool _156 = !_144;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_58.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _132 = as_type<int>(_164);
    }
    int _166 = _132;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2506 = as_type<float>(_166);
        out.gl_Position.z = _2506;
    }
    if (_158)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _168 = in.m_62.x;
    float _170 = in.m_62.y;
    float _172 = in.m_62.z;
    float _174 = in.m_64.x;
    float _176 = in.m_64.y;
    float _178 = in.m_64.z;
    float _180 = in.m_66.x;
    float _182 = in.m_66.y;
    float _184 = in.m_66.z;
    float _186 = _168 * _168;
    float _188 = _170 * _170;
    float _190 = fma(_174, _174, _186);
    float _192 = fma(_176, _176, _188);
    float _194 = fma(_180, _180, _190);
    float _196 = _172 * _172;
    float _198 = fma(_182, _182, _192);
    float _200 = sqrt(_194);
    float _202 = fma(_178, _178, _196);
    float _204 = fma(_184, _184, _202);
    float _206 = sqrt(_198);
    float _208 = sqrt(_204);
    bool _210 = _200 > 0.0;
    bool _212 = _206 > 0.0;
    float _214 = 0.0;
    float _216 = _206;
    float _218 = _200;
    if (_210)
    {
        float _220 = rsqrt(_194);
        _214 = _220;
    }
    float _222 = _214;
    if (!_210)
    {
        _216 = 0.0;
    }
    float _224 = _216;
    bool _226 = _208 > 0.0;
    float _228 = _208;
    float _230 = _224;
    if (!_210)
    {
        _228 = 0.0;
    }
    float _232 = _228;
    float _234 = _232;
    if (!_210)
    {
        _218 = 0.0;
    }
    float _236 = _218;
    float _238 = 0.0;
    float _240 = _236;
    if (_212)
    {
        float _242 = rsqrt(_198);
        _238 = _242;
    }
    float _244 = _238;
    float _246 = 0.0;
    float _248 = 0.0;
    if (!_212)
    {
        _246 = 0.0;
        _248 = 0.0;
    }
    float _250 = _246;
    float _252 = _248;
    float _254 = 0.0;
    float _256 = _250;
    float _258 = _252;
    if (!_212)
    {
        _254 = 0.0;
    }
    float _260 = _254;
    float _262 = 0.0;
    float _264 = _260;
    if (_226)
    {
        float _266 = rsqrt(_204);
        _262 = _266;
    }
    float _268 = _262;
    if (_210)
    {
        float _270 = _222 * _174;
        _230 = _270;
    }
    float _272 = _230;
    if (_210)
    {
        float _274 = _222 * _168;
        _234 = _274;
    }
    float _276 = _234;
    if (_210)
    {
        float _278 = _222 * _180;
        _240 = _278;
    }
    float _280 = _240;
    bool _282 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _284 = 0.0;
    float _286 = 0.0;
    if (!_226)
    {
        _284 = 0.0;
        _286 = 0.0;
    }
    float _288 = _284;
    float _290 = _286;
    float _292 = 0.0;
    float _294 = _288;
    float _296 = _290;
    if (!_226)
    {
        _292 = 0.0;
    }
    float _298 = _292;
    float _300 = _298;
    if (_212)
    {
        float _302 = _244 * _176;
        _264 = _302;
    }
    float _304 = _264;
    if (_212)
    {
        float _306 = _244 * _170;
        _256 = _306;
    }
    float _308 = _256;
    if (_212)
    {
        float _310 = _244 * _182;
        _258 = _310;
    }
    float _312 = _258;
    if (_226)
    {
        float _314 = _268 * _178;
        _294 = _314;
    }
    float _316 = _294;
    float _318 = _316;
    if (_226)
    {
        float _320 = _268 * _172;
        _296 = _320;
    }
    float _322 = _296;
    if (_226)
    {
        float _324 = _268 * _184;
        _300 = _324;
    }
    float _326 = _300;
    bool _328 = !_282;
    float _346;
    if (!_328)
    {
        float _330 = in.m_68.x;
        float _332 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _334 = _330 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _336 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[11].y, _148);
        float _338 = _336 * _332;
        float _340 = floor(_338);
        float _342 = -_340;
        float _344 = _338 + _342;
        _346 = _344;
        _348 = true;
    }
    else
    {
        float _350 = float(_114);
        float _352 = 1.0 / _350;
        float _354 = _148 * _352;
        _346 = _354;
    }
    _348 = false;
    float _356 = _346;
    float _358 = in.m_55.x;
    float _360 = in.m_55.y;
    float _362 = in.m_55.z;
    float _364 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _366 = in.m_68.x;
    float _368 = in.m_68.y;
    float _370 = as_type<float>(int(gl_VertexIndex));
    float _372 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _374 = in.m_62.w;
    float _376 = in.m_66.w;
    float _378 = _176 * _360;
    float _380 = _170 * _360;
    float _382 = _182 * _360;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _388 = _366 > 0.5;
    float _390 = fma(_180, _358, _382);
    bool _392 = _368 > 0.5;
    float _394 = fma(_168, _358, _380);
    float _396 = 1.0 / _386;
    int _398 = as_type<int>(_370) & 1;
    bool _400 = _398 != 0;
    int _402 = as_type<int>(_370) & 2;
    bool _404 = _402 != 0;
    float _406 = in.m_64.w;
    int _408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _410 = _408 != 0;
    float _412 = fma(_172, _362, _394);
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _416 = _414 != 0;
    float _418 = fma(_174, _358, _378);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _424 = in.m_73.x;
    float _426 = in.m_73.y;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _432 = 1.0 / _422;
    float _434 = fma(_184, _362, _390);
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _438 = _356 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _440 = isnan(_356);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _446 = _442 || _444;
    float _448 = float(_446);
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _452 = _434 + _376;
    float _454 = 1.0 / _430;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _456;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _462 = _436 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _464 = _450 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _466 = _458 * _396;
    float _468 = fma(_178, _362, _418);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _472 = _356 + _470;
    float _474 = _460 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _480;
    float _484 = -_448;
    float _486 = _484 + 1.0;
    float _488 = _468 + _406;
    float _490 = _478 * _432;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _494 = _356 + _492;
    out.m_75.x = _462;
    out.m_75.y = _464;
    out.m_75.z = _474;
    float _496 = _482 * _454;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _500 = _356 + _498;
    float _502 = fma(_466, _494, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _504 = _424 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _506 = fma(_496, _472, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _508 = _356 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _510 = isnan(_356);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = fma(_490, _500, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _522 = _356 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _524 = isnan(_356);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = _504 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _536 = _518 * _486;
    float _538 = -_518;
    float _540 = _538 + 1.0;
    float _542 = _412 + _374;
    bool _544 = _356 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _546 = isnan(_356);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = -_532;
    float _558 = _556 + 1.0;
    float _560 = _532 * _540;
    float _562 = _426 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _564 = _542 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    bool _566 = !_400;
    float _568 = _566 ? (-0.5) : 0.5;
    float _570 = _554 * _558;
    float _572 = _562 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _574 = _488 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _576 = _564 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _578 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _568);
    float _580 = _564 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _582 = _452 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _584 = fma(_574, (*spvDescriptorSet0.vp_c12)._m0[6].x, _576);
    float _586 = _534 * _578;
    bool _588 = !_404;
    float _590 = _588 ? (-0.5) : 0.5;
    float _592 = fma(_574, (*spvDescriptorSet0.vp_c12)._m0[6].y, _580);
    float _594 = fma(_582, (*spvDescriptorSet0.vp_c12)._m0[8].x, _584);
    float _596 = -_554;
    float _598 = _596 + 1.0;
    float _600 = fma(_582, (*spvDescriptorSet0.vp_c12)._m0[8].y, _592);
    float _602 = _594 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _604 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _590);
    float _606 = _600 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _608 = _602 * _364;
    float _610 = _572 * _604;
    float _612 = _502 * _570;
    float _614 = _606 * _372;
    float _616 = fma(_608, 0.5, 0.5);
    float _618 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _620 = _564 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _622 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[115].x, _612);
    float _624 = -_568;
    int _626 = _388 ? as_type<int>(_624) : as_type<int>(_568);
    float _628 = _590 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _630 = fma(_574, (*spvDescriptorSet0.vp_c12)._m0[6].z, _620);
    float _632 = fma(_520, _560, _622);
    float _634 = _610 * _304;
    float _636 = _610 * _308;
    float _638 = _610 * _312;
    bool _640 = !_410;
    float _642 = _640 ? _568 : as_type<float>(_626);
    float _644 = _568 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _646 = fma(_582, (*spvDescriptorSet0.vp_c12)._m0[8].z, _630);
    float _648 = -_590;
    int _650 = _392 ? as_type<int>(_648) : as_type<int>(_590);
    float _652 = _628 * _304;
    float _654 = _628 * _308;
    float _656 = _628 * _312;
    float _658 = fma(_586, _272, _634);
    float _660 = fma(_614, 0.5, 0.5);
    float _662 = fma(_586, _276, _636);
    float _664 = fma(_586, _280, _638);
    float _666 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _668 = _646 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    bool _670 = !_416;
    float _672 = _670 ? _590 : as_type<float>(_650);
    float _674 = fma(_644, _272, _652);
    float _676 = fma(_644, _276, _654);
    float _678 = fma(_644, _280, _656);
    float _680 = fma(_506, _536, _632);
    float _682 = floor(_660);
    float _684 = fma(_666, _316, _658);
    float _686 = fma(_666, _322, _662);
    float _688 = fma(_666, _326, _664);
    float _690 = _668 * _618;
    float _692 = _642 + 0.5;
    float _694 = -_672;
    float _696 = _694 + 0.5;
    float _698 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[118].x, _680);
    float _700 = fma(_690, 0.5, 0.5);
    float _702 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _704 = _692 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _706 = _696 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _708 = _698 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _710 = -_682;
    float _712 = _660 + _710;
    float _714 = floor(_616);
    float _716 = fma(_712, 2.0, -1.0);
    float _718 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _720 = _704 * _702;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _726 = _716 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _730 = _722 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _732 = _724 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _734 = floor(_700);
    float _736 = -_714;
    float _738 = _616 + _736;
    float _740 = _726 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _742 = _728 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _744 = fma(_738, 2.0, -1.0);
    float _746 = _706 * _718;
    out.m_77.x = _742;
    out.m_77.y = _730;
    out.m_77.z = _732;
    out.m_77.w = _708;
    float _748 = _678 + _326;
    out.m_79.x = _720;
    out.m_79.y = _746;
    float _750 = -_734;
    float _752 = _700 + _750;
    float _754 = _726 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _756 = fma(_752, 2.0, -1.0);
    float _758 = _744 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _760 = _726 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _762 = _756 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _764 = fma(_758, (*spvDescriptorSet0.vp_c12)._m0[2].x, _754);
    float _766 = fma(_758, (*spvDescriptorSet0.vp_c12)._m0[2].y, _760);
    bool _768 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _770 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _772 = _768 || _770;
    bool _774 = isnan(1.0);
    bool _776 = _772 || _774;
    float _778 = fma(_758, (*spvDescriptorSet0.vp_c12)._m0[2].z, _740);
    float _780 = fma(_762, (*spvDescriptorSet0.vp_c12)._m0[4].x, _764);
    float _782 = fma(_762, (*spvDescriptorSet0.vp_c12)._m0[4].y, _766);
    float _784 = _674 + _316;
    float _786 = fma(_762, (*spvDescriptorSet0.vp_c12)._m0[4].z, _778);
    float _788 = _676 + _322;
    float _790 = _780 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _792 = _782 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _794 = _786 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _796 = _684 + _790;
    float _798 = _686 + _792;
    float _800 = _688 + _794;
    float _802 = _684;
    float _804 = _678;
    float _806 = _688;
    float _808 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _810 = _678;
    float _812 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _814 = _744;
    float _816 = _716;
    float _818 = _730;
    float _820 = _756;
    float _822 = _742;
    float _824 = _790;
    float _834;
    float _836;
    float _838;
    float _840;
    if (!_776)
    {
        bool _826 = _792 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _828 = !_826;
        _830 = _828;
        if (!_830)
        {
            float _832 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _834 = _832;
            _836 = 0.0;
            _838 = 0.0;
            _840 = 0.0;
            _842 = true;
        }
    }
    if ((!_842) || _830)
    {
        bool _878;
        if (!_830)
        {
            bool _844 = _792 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _846 = isnan(_792);
            bool _848 = _844 || _846;
            bool _850 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _852 = _848 || _850;
            bool _854 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _856 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _858 = !_852;
            bool _860 = _856 && _858;
            if (_860)
            {
                _802 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _862 = _802;
            float _864 = _862;
            if (_860)
            {
                _804 = 0.0;
            }
            float _866 = _804;
            _810 = _866;
            _836 = _866;
            if (_860)
            {
                _806 = 0.0;
            }
            float _868 = _806;
            _838 = _868;
            if (_860)
            {
                float _870 = _862 * 5.0;
                _864 = _870;
            }
            float _872 = _864;
            _834 = _872;
            if (_860)
            {
                _808 = 0.0;
            }
            float _874 = _808;
            bool _876 = !_852;
            _878 = _876 && _854;
            _812 = _874;
            _840 = _874;
        }
        if ((!_878) || _830)
        {
            _830 = false;
            float _880 = _810;
            float _882 = _812;
            bool _884 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _886 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _888 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _890 = _708;
            float _892 = _882;
            _834 = _800;
            _838 = _798;
            if (_884)
            {
                float _894 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _890 = _894;
            }
            float _896 = _890;
            if (_884)
            {
                float _898 = abs(_744);
                float _900 = -_898;
                float _902 = _900 + 1.0;
                _814 = _902;
            }
            float _904 = _814;
            if (_886)
            {
                float _906 = abs(_716);
                float _908 = -_906;
                float _910 = _908 + 1.0;
                _816 = _910;
            }
            float _912 = _816;
            if (!_884)
            {
                _818 = 1.0;
            }
            float _914 = _818;
            float _916 = _914;
            if (_888)
            {
                float _918 = abs(_756);
                float _920 = -_918;
                float _922 = _920 + 1.0;
                _820 = _922;
            }
            float _924 = _820;
            if (!_886)
            {
                _822 = 1.0;
            }
            float _926 = _822;
            float _928 = _926;
            if (!_888)
            {
                _892 = 1.0;
            }
            float _930 = _892;
            float _932 = _686;
            float _934 = _930;
            if (_886)
            {
                float _936 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _932 = _936;
            }
            float _938 = _932;
            float _940 = _880;
            if (_888)
            {
                float _942 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _940 = _942;
            }
            float _944 = _940;
            if (_884)
            {
                float _946 = _904 * _896;
                float _948 = precise::clamp(_946, 0.0, 1.0);
                _916 = _948;
            }
            float _950 = _916;
            if (_886)
            {
                float _952 = _912 * _938;
                float _954 = precise::clamp(_952, 0.0, 1.0);
                _928 = _954;
            }
            float _956 = _928;
            float _958 = _950 * _956;
            if (_888)
            {
                float _960 = _924 * _944;
                float _962 = precise::clamp(_960, 0.0, 1.0);
                _934 = _962;
            }
            float _964 = _934;
            float _966 = _958 * _964;
            _836 = _796;
            _840 = _966;
        }
    }
    _842 = false;
    float _968 = _834;
    float _970 = _836;
    float _972 = _838;
    float _974 = _840;
    float _976 = fma(_790, 6.2500002968590706586837768554688e-05, 0.5);
    float _978 = fma(_794, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3784 = float2(_976, _978);
    float _980 = dm_bs(spvDescriptorSet0.vp_t_tcb_2A.sample(spvDescriptorSet0.vp_t_tcb_2ASmplr, select(_3784, float2(0.0), isnan(_3784)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2A, spvDescriptorSet0.vp_t_tcb_2ASmplr_w, select(_3784, float2(0.0), isnan(_3784)), level(0.0)).x;
    float _982 = in.m_81.w;
    float _984 = trunc(_982);
    int _986 = int(_984);
    int _988 = _986 << 5;
    uint _991 = uint(int(uint(_988) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_991)];
    float _993 = as_type<float>(_dmw0.x);
    int _995 = _988 + 4;
    uint _997 = uint(int(uint(_995) >> uint(2)));
    float _999 = as_type<float>(_dmw0.y);
    int _1001 = _988 + 8;
    uint _1003 = uint(int(uint(_1001) >> uint(2)));
    float _1005 = as_type<float>(_dmw0.z);
    int _1007 = _988 + 12;
    uint _1009 = uint(int(uint(_1007) >> uint(2)));
    float _1011 = as_type<float>(_dmw0.w);
    float _1013 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1015 = _968 + _1013;
    float _1017 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1019 = _970 + _1017;
    float _1021 = _1015 * _1015;
    float _1023 = fma(_1019, _1019, _1021);
    float _1025 = sqrt(_1023);
    bool _1027 = _1025 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1029 = _1021;
    float _1031 = _970;
    float _1033 = _968;
    float _1035 = _974;
    if (!_1027)
    {
        _1029 = _972;
    }
    float _1037 = _1029;
    float _1039 = _1011 * 2.0;
    bool _1041 = !_1027;
    float _1043 = _1037;
    if (!_1041)
    {
        float _1045 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1047 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1049 = _1025 + _1047;
        float _1051 = _972 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1053 = _1049 * _1045;
        float _1055 = rsqrt(_1023);
        float _1057 = _1053 * 0.15915493667125701904296875;
        float _1059 = _1057 * 6.283185482025146484375;
        float _1061 = cos(_1059);
        float _1063 = _1057 * 6.283185482025146484375;
        float _1065 = sin(_1063);
        float _1067 = _1061 + (-1.0);
        float _1069 = _1067 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1071 = fma(_1065, _1051, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1073 = fma(_1061, _972, _1069);
        float _1075 = _1055 * _1071;
        float _1077 = fma(_1019, _1075, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1079 = fma(_1015, _1075, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1043 = _1073;
        _1031 = _1077;
        _1033 = _1079;
    }
    float _1081 = _1043;
    float _1083 = _1031;
    float _1085 = _1033;
    float _1087 = _993 * 2.0;
    float _1089 = _999 * _1039;
    float _1091 = _993 * _993;
    float _1093 = _1005 * _1039;
    float _1095 = _999 * _999;
    float _1097 = _993 * _1039;
    float _1099 = _999 * 2.0;
    float _1101 = fma(_1005, _1087, _1089);
    float _1103 = -_1093;
    float _1105 = fma(_999, _1087, _1103);
    float _1107 = fma(_999, _1087, _1093);
    float _1109 = fma(_1091, -2.0, 1.0);
    float _1111 = -_1089;
    float _1113 = fma(_1005, _1087, _1111);
    float _1115 = _1005 * _1005;
    float _1117 = fma(_1095, -2.0, 1.0);
    float _1119 = -_1097;
    float _1121 = fma(_1005, _1099, _1119);
    float _1123 = fma(_1005, _1099, _1097);
    float _1125 = _792 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1127 = _792 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1129 = fma(_1115, -2.0, _1117);
    float _1131 = fma(_1115, -2.0, _1109);
    float _1133 = fma(_1095, -2.0, _1109);
    float _1135 = _980 * 2000.0;
    float _1137 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1125);
    float _1139 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1127);
    float _1141 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1137);
    bool _1143 = _792 >= _1135;
    bool _1145 = isnan(_792);
    bool _1147 = _1143 || _1145;
    bool _1149 = isnan(_1135);
    bool _1151 = _1147 || _1149;
    float _1153 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1139);
    float _1155 = _1141 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1157 = _1153 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1159 = _1157 + _1155;
    float _1161 = 1.0 / _1155;
    float _1163 = _1157;
    float _1165 = _1083;
    float _1167 = _1141;
    float _1169 = _1085;
    if (_1151)
    {
        _1163 = _1081;
    }
    float _1171 = _1163;
    float _1173 = _1171;
    if (!_1151)
    {
        _1173 = 0.0;
    }
    float _1175 = _1173;
    if (!_1151)
    {
        _1165 = 0.0;
    }
    float _1177 = _1165;
    if (!_1151)
    {
        _1167 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1179 = _1167;
    float _1181 = -_792;
    float _1183 = _1181 + _1175;
    float _1185 = -_790;
    float _1187 = _1185 + _1177;
    float _1189 = _1183 * _308;
    bool _1191 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1193 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1195 = _1191 || _1193;
    bool _1197 = isnan(0.5);
    bool _1199 = _1195 || _1197;
    if (!_1151)
    {
        float _1201 = _1179 * 5.0;
        _1169 = _1201;
    }
    float _1203 = _1169;
    float _1205 = _1183 * _276;
    float _1207 = _1159 * _1161;
    float _1209 = _1207 * 0.5;
    float _1211 = fma(_1187, _304, _1189);
    float _1213 = -_794;
    float _1215 = _1213 + _1203;
    float _1217 = _1183 * _322;
    float _1219 = fma(_1187, _272, _1205);
    float _1221 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1223 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1221);
    float _1225 = fma(_1215, _312, _1211);
    bool _1227 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1229 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1231 = _1227 || _1229;
    bool _1233 = isnan(0.5);
    bool _1235 = _1231 || _1233;
    float _1237 = fma(_1187, _316, _1217);
    float _1239 = fma(_1215, _280, _1219);
    float _1241 = _1225 * _1105;
    float _1243 = _1225 * _1131;
    float _1245 = _1225 * _1123;
    float _1247 = 1.0 / _1223;
    float _1249 = fma(_1215, _326, _1237);
    float _1251 = fma(_1239, _1129, _1241);
    float _1253 = fma(_1239, _1107, _1243);
    float _1255 = fma(_1239, _1113, _1245);
    float _1257 = fma(_1249, _1101, _1251);
    float _1259 = fma(_1249, _1121, _1253);
    float _1261 = fma(_1249, _1133, _1255);
    float _1263 = _1249;
    float _1265 = _1237;
    float _1267 = _1255;
    float _1269 = _1261;
    if (_1235)
    {
        _318 = 1.0;
    }
    float _1271 = _318;
    float _1273 = _790 + _1257;
    float _1275 = _792 + _1259;
    float _1277 = _794 + _1261;
    float _1279 = _1275;
    float _1281 = _1273;
    float _1283 = _1277;
    float _1285 = _1247;
    float _1287 = _1271;
    if (!_1199)
    {
        float _1289 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1291 = _792 + _1289;
        float _1293 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1295 = _790 + _1293;
        float _1297 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1299 = _1291 * _1291;
        float _1301 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1303 = _794 + _1301;
        float _1305 = fma(_1295, _1295, _1299);
        float _1307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1309 = fma(_1303, _1303, _1305);
        float _1311 = sqrt(_1309);
        float _1313 = _1297 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1315 = precise::min(_1311, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1317 = _1315 * _1307;
        float _1319 = _1313 * _1317;
        float _1321 = fma(_1259, _1319, _792);
        float _1323 = fma(_1257, _1319, _790);
        float _1325 = fma(_1261, _1319, _794);
        _1263 = _1307;
        _1279 = _1321;
        _1281 = _1323;
        _1283 = _1325;
    }
    float _1327 = _1263;
    float _1329 = _1279;
    float _1331 = _1281;
    float _1333 = _1283;
    float _1335 = _1327;
    if (_1235)
    {
        _1265 = 1.0;
    }
    float _1337 = _1265;
    float _1339 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1341 = _1247 * _1339;
    float _1343 = _1337;
    if (!_1235)
    {
        float _1345 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1347 = _1345 * 0.15915493667125701904296875;
        float _1349 = _1347 * 6.283185482025146484375;
        float _1351 = cos(_1349);
        float _1353 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1355 = _1353 * 0.15915493667125701904296875;
        float _1357 = _1347 * 6.283185482025146484375;
        float _1359 = sin(_1357);
        float _1361 = 1.0 / _1351;
        float _1363 = _1355 * 6.283185482025146484375;
        float _1365 = cos(_1363);
        float _1367 = _1359 * _1361;
        float _1369 = _1355 * 6.283185482025146484375;
        float _1371 = sin(_1369);
        float _1373 = _1365 * _1367;
        float _1375 = 1.0 / _1373;
        float _1377 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1379 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1377;
        float _1381 = 1.0 / _1379;
        float _1383 = _1371 * _1375;
        float _1385 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1387 = fma(_1341, _1383, _1385);
        float _1389 = _1387 * _1381;
        float _1391 = precise::clamp(_1389, 0.0, 1.0);
        _1267 = _1387;
        _1335 = _1361;
        _1285 = _1371;
        _1269 = _1355;
        _1287 = _1391;
    }
    float _1393 = _1267;
    float _1395 = _1335;
    float _1397 = _1285;
    float _1399 = _1269;
    float _1401 = _1287;
    float _1403 = _1395;
    float _1405 = _1397;
    float _1407 = _1393;
    float _1409 = _1399;
    if (!_1235)
    {
        float _1411 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1413 = _1411 * 0.15915493667125701904296875;
        float _1415 = _1413 * 6.283185482025146484375;
        float _1417 = cos(_1415);
        float _1419 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1421 = _1419 * 0.15915493667125701904296875;
        float _1423 = _1413 * 6.283185482025146484375;
        float _1425 = sin(_1423);
        float _1427 = 1.0 / _1417;
        float _1429 = _1421 * 6.283185482025146484375;
        float _1431 = cos(_1429);
        float _1433 = _1425 * _1427;
        float _1435 = _1421 * 6.283185482025146484375;
        float _1437 = sin(_1435);
        float _1439 = _1431 * _1433;
        float _1441 = 1.0 / _1439;
        float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1445 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1443;
        float _1447 = 1.0 / _1445;
        float _1449 = _1437 * _1441;
        float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1453 = fma(_1341, _1449, _1451);
        float _1455 = _1453 * _1447;
        float _1457 = precise::clamp(_1455, 0.0, 1.0);
        float _1459 = -_1457;
        float _1461 = _1459 + 1.0;
        _1403 = _1449;
        _1405 = _1445;
        _1407 = _1439;
        _1409 = _1441;
        _1343 = _1461;
    }
    float _1463 = _1403;
    float _1465 = _1405;
    float _1467 = _1407;
    float _1469 = _1409;
    float _1471 = _1343;
    float _1473 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1475 = _1329 + _1473;
    float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1479 = _1331 + _1477;
    float _1481 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1483 = _1333 + _1481;
    float _1485 = _1475 * _1475;
    float _1487 = fma(_1479, _1479, _1485);
    float _1489 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1491 = fma(_1483, _1483, _1487);
    float _1493 = rsqrt(_1491);
    float _1495 = sqrt(_1491);
    float _1497 = _1479 * _1493;
    float _1499 = _1483 * _1493;
    float _1501 = _1475 * _1493;
    float _1503 = _1497 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1505 = _1499 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1507 = _1503 * _1503;
    float _1509 = _1505 * _1505;
    float _1511 = _1507 + _1509;
    float _1513 = sqrt(_1511);
    bool _1515 = _1513 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1517 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1519 = _1513 + _1517;
    float _1521 = _1463;
    float _1523 = _1469;
    float _1525 = _1519;
    float _1527 = _1467;
    float _1529 = _1503;
    float _1531 = 0.0187292993068695068359375;
    if (_1515)
    {
        float _1533 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1521 = _1533;
    }
    float _1535 = _1521;
    if (_1515)
    {
        float _1537 = rsqrt(_1511);
        _1523 = _1537;
    }
    float _1539 = _1523;
    float _1541 = _1539;
    if (_1515)
    {
        float _1543 = _1519 * _1535;
        _1525 = _1543;
    }
    float _1545 = _1525;
    if (_1515)
    {
        float _1547 = _1545 * 0.15915493667125701904296875;
        _1527 = _1547;
    }
    float _1549 = _1527;
    float _1551 = _1465;
    if (_1515)
    {
        float _1553 = _1549 * 6.283185482025146484375;
        float _1555 = sin(_1553);
        _1551 = _1555;
    }
    float _1557 = _1551;
    float _1559 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1561 = precise::max(0.0, _1559);
    float _1563 = _1535;
    float _1565 = _1561;
    float _1567 = _1559;
    if (_1515)
    {
        float _1569 = _1549 * 6.283185482025146484375;
        float _1571 = cos(_1569);
        _1563 = _1571;
    }
    float _1573 = _1563;
    float _1575 = -_1501;
    float _1577 = -_1561;
    float _1579 = fma(_1575, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1577);
    if (_1515)
    {
        float _1581 = _1579 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1565 = _1581;
    }
    float _1583 = _1565;
    float _1585 = _1583;
    float _1587 = _1557;
    if (_1515)
    {
        float _1589 = fma(_1557, _1583, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1585 = _1589;
    }
    float _1591 = _1585;
    float _1593 = _1591;
    if (!_1515)
    {
        _1587 = _1579;
    }
    float _1595 = _1587;
    float _1597 = _1595;
    float _1599 = _1573;
    if (_1515)
    {
        float _1601 = _1573 + (-1.0);
        _1567 = _1601;
    }
    float _1603 = _1567;
    float _1605 = 0.0;
    float _1607 = _1603;
    if (_1515)
    {
        float _1609 = _1539 * _1591;
        _1605 = _1609;
    }
    float _1611 = _1605;
    if (!_1515)
    {
        _1593 = _1507;
    }
    float _1613 = _1593;
    float _1615 = _1613;
    if (_1515)
    {
        float _1617 = _1603 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1541 = _1617;
    }
    float _1619 = _1541;
    if (_1515)
    {
        float _1621 = _1503 * _1611;
        _1529 = _1621;
    }
    float _1623 = _1529;
    if (!_1515)
    {
        _1607 = _1505;
    }
    float _1625 = _1607;
    float _1627 = _1625;
    if (_1515)
    {
        float _1629 = _1505 * _1611;
        _1627 = _1629;
    }
    float _1631 = _1627;
    if (_1515)
    {
        float _1633 = fma(_1579, _1573, _1619);
        _1597 = _1633;
    }
    float _1635 = _1597;
    if (_1515)
    {
        float _1637 = _1623 * _1623;
        _1615 = _1637;
    }
    float _1639 = _1615;
    if (!_1515)
    {
        _1599 = _1509;
    }
    float _1641 = _1599;
    float _1643 = _1641;
    if (_1515)
    {
        float _1645 = _1631 * _1631;
        _1643 = _1645;
    }
    float _1647 = _1643;
    float _1649 = _1329 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1651 = fma(_1635, _1635, _1639);
    float _1653 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1649);
    float _1655 = _1651 + _1647;
    float _1657 = _1329 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1659 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1661 = fma(_1495, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1659);
    float _1663 = precise::clamp(_1661, 0.0, 1.0);
    float _1665 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1653);
    float _1667 = rsqrt(_1655);
    float _1669 = _1329 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1671 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1657);
    float _1673 = -_1663;
    float _1675 = _1673 + 1.0;
    float _1677 = _1329 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1679 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1669);
    float _1681 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1671);
    float _1683 = _1665 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1685 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1677);
    float _1687 = abs(_1675);
    float _1689 = log2(_1687);
    float _1691 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1679);
    float _1693 = _1681 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1695 = _1683 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1697 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1685);
    float _1699 = _1691 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1701 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1703 = _1667 * _1623;
    float _1705 = -_1695;
    float _1707 = fma(_1705, _1489, 1.0);
    float _1709 = _1667 * _1631;
    float _1711 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1701);
    float _1713 = _1667 * _1635;
    float _1715 = _1703 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1717 = _1697 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1719 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1711);
    float _1721 = log2(_1707);
    float _1723 = -_1715;
    float _1725 = fma(_1713, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1723);
    float _1727 = _1689 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1729 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1719);
    float _1731 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1733 = -_1709;
    float _1735 = fma(_1733, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1725);
    float _1737 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1739 = exp2(_1727);
    float _1741 = fma(_1735, -0.5, 0.5);
    float _1743 = fma(_1735, 0.5, 0.5);
    float _1745 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1737);
    float _1747 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1731);
    float _1749 = _1713 + 1.0;
    float _1751 = fma(_1743, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1753 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1745);
    float _1755 = 1.0 / _1729;
    float _1757 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1747);
    float _1759 = fma(_1743, _1751, -0.212114393711090087890625);
    float _1761 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1753);
    float _1763 = _1721 * 0.693147182464599609375;
    float _1765 = fma(_1743, _1759, 1.570728778839111328125);
    float _1767 = sqrt(_1741);
    float _1769 = -_1713;
    float _1771 = fma(_1739, _1749, _1769);
    float _1773 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1757);
    float _1775 = _1763 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1777 = fma(_1771, 0.5, 0.5);
    float _1779 = _1761 * _1755;
    float _1781 = _1773 * _1755;
    float _1783 = fma(_1779, 0.5, 0.5);
    float _1785 = fma(_1781, -0.5, 0.5);
    float _1787 = _1767 * 0.636619746685028076171875;
    float3 _5021 = float3(_1783, _1785, _1775);
    float _1789 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5021, float3(0.0), isnan(_5021)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5021, float3(0.0), isnan(_5021)), level(0.0)).x;
    float3 _5032 = float3(_1783, _1785, _1775);
    float4 _1792 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5032, float3(0.0), isnan(_5032)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5032, float3(0.0), isnan(_5032)), level(0.0)).xyzw;
    float _1794 = _1792.x;
    float _1796 = _1792.y;
    float _1798 = _1792.z;
    float _1800 = _1792.w;
    float _1802 = -_1765;
    float _1804 = fma(_1787, _1802, 1.0);
    float2 _5053 = float2(_1804, _1777);
    float3 _1808 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5053, float2(0.0), isnan(_5053)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5053, float2(0.0), isnan(_5053)), level(0.0)).xyz;
    float _1810 = _1808.x;
    float _1812 = _1808.y;
    float _1814 = _1808.z;
    float _1816 = _788 * _1105;
    float _1818 = _788 * _1123;
    float _1820 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    bool _1822 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1824 = isnan(0.0);
    bool _1826 = _1822 || _1824;
    bool _1828 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1830 = _1826 || _1828;
    float _1832 = _1729;
    float _1834 = _1773;
    if (!_1151)
    {
        _1035 = 0.0;
    }
    float _1836 = _1035;
    float _1838 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1840 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1838);
    float _1842 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1844 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1842);
    float _1846 = fma(_784, _1129, _1816);
    float _1848 = fma(_784, _1113, _1818);
    float _1850 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1840);
    float _1852 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1844);
    float _1854 = fma(_748, _1101, _1846);
    out.m_83.x = _1331;
    out.m_83.y = _1329;
    out.m_83.z = _1333;
    float _1856 = _790 + _1850;
    float _1858 = _794 + _1852;
    if (_1830)
    {
        float _1860 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1531 = _1860;
    }
    float _1862 = _1531;
    float _1864 = _1862;
    if (!_1830)
    {
        _824 = 1.0;
    }
    float _1866 = _824;
    float _1868 = -_1856;
    float _1870 = _1868 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1872 = -_1858;
    float _1874 = _1872 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1876 = _1495 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1878 = isnan(_1495);
    bool _1880 = _1876 || _1878;
    bool _1882 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1884 = _1880 || _1882;
    float _1886 = _1866;
    if (_1830)
    {
        float _1888 = precise::min(_1862, 20.0);
        _1864 = _1888;
    }
    float _1890 = _1864;
    float _1892 = precise::min(_1858, _1874);
    float _1894 = _1689 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1896 = precise::min(_1856, _1870);
    float _1898 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1900 = _1890;
    if (_1830)
    {
        float _1902 = 1.0 / _1890;
        _1900 = _1902;
    }
    float _1904 = _1900;
    float _1906 = precise::min(_1896, _1892);
    float _1908 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1898);
    float _1910 = _788 * _1131;
    float _1912 = exp2(_1894);
    float _1914 = fma(_784, _1107, _1910);
    float _1916 = fma(_748, _1121, _1914);
    float _1918 = fma(_748, _1133, _1848);
    float _1920 = _1401 * _1471;
    float _1922 = _1761;
    if (_1830)
    {
        float _1924 = _1906 * _1904;
        float _1926 = precise::clamp(_1924, 0.0, 1.0);
        _1886 = _1926;
    }
    float _1928 = _1886;
    float _1930 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1908);
    out.m_85.x = _1854;
    out.m_85.y = _1916;
    out.m_85.z = _1918;
    float _1932 = _1836 * _1928;
    float _1934 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1930);
    float _1936 = -_1912;
    float _1938 = _1936 + 1.0;
    float _1940 = _1934 + _1729;
    float _1942 = _1932 * _1920;
    out.gl_Position.x = _1761;
    out.gl_Position.y = _1773;
    out.gl_Position.z = _1934;
    out.gl_Position.w = _1729;
    float _1944 = _1938 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1946 = _1940 * 0.5;
    float _1948 = -_1944;
    float _1950 = _1948 + 1.0;
    out.m_87.z = _1946;
    out.m_87.w = _1729;
    float _1952 = _1934;
    float _1954 = _1942;
    if (!_1884)
    {
        _1832 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1956 = _1832;
    float _1958 = _1956;
    float _1960 = _1956;
    if (!_1884)
    {
        _1952 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1962 = _1952;
    float _1964 = _1962;
    float _1966 = _1962;
    if (!_1884)
    {
        _1834 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1968 = _1834;
    float _1970 = _1968;
    float _1972 = _1968;
    if (!_1884)
    {
        _1922 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1974 = _1922;
    float _1976 = _1944 * _1789;
    float _1978 = _1800 * _1950;
    float _1980 = _1800 * _1976;
    float _1982 = _1814 * _1976;
    float _1984 = fma(_1810, _1980, _1794);
    float _1986 = fma(_1812, _1980, _1796);
    float _1988 = _1794;
    float _1990 = _1974;
    float _1992 = _1974;
    if (!_1884)
    {
        _1988 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1994 = _1988;
    float _1996 = fma(_1800, _1982, _1798);
    float _1998 = _1942 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2000 = _1994;
    float _2002 = _1994;
    if (!_1884)
    {
        _1954 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2004 = _1954;
    out.m_89.x = _1984;
    out.m_89.y = _1986;
    out.m_89.z = _1996;
    out.m_89.w = _1978;
    bool _2006 = !_1884;
    float _2008 = _2004;
    float _2010 = _2004;
    if (!_2006)
    {
        bool _2012 = _1495 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2014 = isnan(_1495);
        bool _2016 = _2012 || _2014;
        bool _2018 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2020 = _2016 || _2018;
        if (!_2020)
        {
            float _2022 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2024 = _1495 + _2022;
            float _2026 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2028 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2026;
            float _2030 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2032 = _2030 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2034 = 1.0 / _2028;
            float _2036 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2038 = _2036 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2040 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2042 = _2040 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2044 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2046 = _2044 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2048 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2050 = _2048 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2052 = _2024 * _2034;
            float _2054 = precise::clamp(_2052, 0.0, 1.0);
            float _2056 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2058 = _2056 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2060 = fma(_2054, _2032, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2062 = fma(_2054, _2058, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2064 = fma(_2054, _2038, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2066 = fma(_2054, _2042, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2068 = fma(_2054, _2046, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2070 = fma(_2054, _2050, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1960 = _2064;
            _1992 = _2068;
            _2002 = _2060;
            _1972 = _2066;
            _1966 = _2062;
            _2010 = _2070;
            _2072 = true;
        }
        else
        {
            bool _2074 = _1495 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2076 = isnan(_1495);
            bool _2078 = _2074 || _2076;
            bool _2080 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2082 = _2078 || _2080;
            if (!_2082)
            {
                _2000 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2084 = _2000;
            _2002 = _2084;
            if (!_2082)
            {
                _1958 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2086 = _1958;
            _1960 = _2086;
            if (!_2082)
            {
                _1964 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2088 = _1964;
            _1966 = _2088;
            if (!_2082)
            {
                _1970 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2090 = _1970;
            _1972 = _2090;
            if (!_2082)
            {
                _1990 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2092 = _1990;
            _1992 = _2092;
            if (!_2082)
            {
                _2008 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2094 = _2008;
            bool _2096 = !_2082;
            _2010 = _2094;
            if (!_2096)
            {
                bool _2098 = _1495 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2100 = isnan(_1495);
                bool _2102 = _2098 || _2100;
                bool _2104 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2106 = _2102 || _2104;
                if (!_2106)
                {
                    float _2108 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2110 = _1495 + _2108;
                    float _2112 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2114 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2112;
                    float _2116 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2118 = _2116 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2120 = 1.0 / _2114;
                    float _2122 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2124 = _2122 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2126 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2128 = _2126 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2130 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2132 = _2130 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2134 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2136 = _2134 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2138 = _2110 * _2120;
                    float _2140 = precise::clamp(_2138, 0.0, 1.0);
                    float _2142 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2144 = _2142 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2146 = fma(_2140, _2118, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2148 = fma(_2140, _2144, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2150 = fma(_2140, _2124, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2152 = fma(_2140, _2128, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2154 = fma(_2140, _2132, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2156 = fma(_2140, _2136, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1960 = _2150;
                    _1992 = _2154;
                    _2002 = _2146;
                    _1972 = _2152;
                    _1966 = _2148;
                    _2010 = _2156;
                    _2072 = true;
                }
                else
                {
                    _1960 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1992 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2002 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1972 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1966 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2010 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2072 = false;
    float _2158 = _1960;
    float _2160 = _1992;
    float _2162 = _2002;
    float _2164 = _1972;
    float _2166 = _1966;
    float _2168 = _2010;
    float _2170 = _1998 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2172 = fma(_1916, -0.5, 0.5);
    float _2174 = precise::clamp(_2172, 0.0, 1.0);
    float _2176 = -_2158;
    float _2178 = _2176 + _2160;
    float _2180 = -_2162;
    float _2182 = _2180 + _2164;
    out.m_58.x = _2170;
    float _2184 = fma(_2174, _2178, _2158);
    float _2186 = -_2166;
    float _2188 = _2186 + _2168;
    float _2190 = fma(_2174, _2182, _2162);
    float _2192 = _2184 * 0.586610972881317138671875;
    bool _2194 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2196 = fma(_2174, _2188, _2166);
    out.m_91.x = 0.0;
    float _2198 = fma(_2190, 0.298911988735198974609375, _2192);
    bool _2200 = _1401 > 0.0;
    bool _2202 = isnan(_1401);
    bool _2204 = _2200 || _2202;
    bool _2206 = isnan(0.0);
    bool _2208 = _2204 || _2206;
    out.m_93.x = 0.0;
    float _2210 = fma(_2196, 0.114477999508380889892578125, _2198);
    bool _2212 = _1471 <= 0.0;
    bool _2214 = !_2208;
    bool _2216 = _2212 || _2214;
    float _2218 = -_2210;
    float _2220 = _2190 + _2218;
    float _2222 = -_2210;
    float _2224 = _2184 + _2222;
    float _2226 = -_2210;
    float _2228 = _2196 + _2226;
    float _2230 = fma(_2220, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2210);
    float _2232 = fma(_2224, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2210);
    float _2234 = fma(_2228, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2210);
    bool _2236 = !_2194;
    if (!_2236)
    {
        float _2238 = -_1329;
        float _2240 = _2238 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2242 = -_1331;
        float _2244 = _2242 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2246 = -_1333;
        float _2248 = _2246 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2250 = _2240 * _2240;
        float _2252 = fma(_2244, _2244, _2250);
        float _2254 = fma(_2248, _2248, _2252);
        float _2256 = rsqrt(_2254);
        float _2258 = _2240 * _2256;
        float _2260 = _2244 * _2256;
        float _2262 = _2248 * _2256;
        float _2264 = sqrt(_2254);
        float _2266 = -_1501;
        float _2268 = _2266 + _2258;
        float _2270 = -_1497;
        float _2272 = _2270 + _2260;
        float _2274 = -_1499;
        float _2276 = _2274 + _2262;
        float _2278 = _2268 * _2268;
        float _2280 = fma(_2272, _2272, _2278);
        float _2282 = fma(_2276, _2276, _2280);
        float _2284 = -_2264;
        float _2286 = _2284 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2288 = rsqrt(_2282);
        float _2290 = _2286 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2292 = precise::clamp(_2290, 0.0, 1.0);
        float _2294 = abs(_2292);
        float _2296 = log2(_2294);
        float _2298 = _2268 * _2288;
        float _2300 = _2272 * _2288;
        float _2302 = _2276 * _2288;
        float _2304 = _1916 * _2298;
        float _2306 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _2308 = precise::clamp(_2306, 0.0, 1.0);
        float _2310 = _1916 * _2258;
        float _2312 = fma(_1854, _2300, _2304);
        float _2314 = _2308 * _2308;
        float _2316 = _2296 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2318 = fma(_1854, _2260, _2310);
        float _2320 = fma(_1918, _2302, _2312);
        float _2322 = precise::clamp(_2320, 0.0, 1.0);
        float _2324 = _2314 + (-1.0);
        float _2326 = fma(_1918, _2262, _2318);
        float _2328 = precise::clamp(_2326, 0.0, 1.0);
        float _2330 = _2322 * _2322;
        float _2332 = _2260 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2334 = exp2(_2316);
        float _2336 = fma(_2330, _2324, 1.0);
        float _2338 = -_2258;
        float _2340 = -_2332;
        float _2342 = fma(_2338, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2340);
        float _2344 = _2336 * _2336;
        float _2346 = -_2262;
        float _2348 = fma(_2346, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2342);
        float _2350 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2352 = _2348 + _2350;
        float _2354 = 1.0 / _2344;
        float _2356 = _2352 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2358 = precise::clamp(_2356, 0.0, 1.0);
        float _2360 = _2334 * _2358;
        float _2362 = _2328 * _2360;
        float _2364 = _2362 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2366 = _2314 * _2354;
        float _2368 = _2362 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2370 = _2362 * _2366;
        float _2372 = _2362 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2374 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2376 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2378 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _2364;
        out.m_91.y = _2368;
        out.m_91.z = _2372;
        out.m_93.x = _2374;
        out.m_93.y = _2376;
        out.m_93.z = _2378;
    }
    out.m_95.x = _2230;
    out.m_95.y = _2232;
    out.m_95.z = _2234;
    if (!_2216)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_58.x = 0.0;
    float _2380 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2380;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2072 = false;
    bool _842 = false;
    bool _830 = false;
    bool _348 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_55.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_58.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2437 = as_type<float>(_130);
        out.gl_Position.z = _2437;
    }
    if (!_118)
    {
        return out;
    }
    float _134 = in.m_60.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_144)
    {
        float _150 = float(_114);
        _124 = _150;
    }
    float _152 = _124;
    bool _154 = _148 >= _152;
    bool _156 = !_144;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_58.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _132 = as_type<int>(_164);
    }
    int _166 = _132;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2506 = as_type<float>(_166);
        out.gl_Position.z = _2506;
    }
    if (_158)
    {
        return out;
    }
    float _168 = in.m_62.x;
    float _170 = in.m_62.y;
    float _172 = in.m_62.z;
    float _174 = in.m_64.x;
    float _176 = in.m_64.y;
    float _178 = in.m_64.z;
    float _180 = in.m_66.x;
    float _182 = in.m_66.y;
    float _184 = in.m_66.z;
    float _186 = _168 * _168;
    float _188 = _170 * _170;
    float _190 = fma(_174, _174, _186);
    float _192 = fma(_176, _176, _188);
    float _194 = fma(_180, _180, _190);
    float _196 = _172 * _172;
    float _198 = fma(_182, _182, _192);
    float _200 = sqrt(_194);
    float _202 = fma(_178, _178, _196);
    float _204 = fma(_184, _184, _202);
    float _206 = sqrt(_198);
    float _208 = sqrt(_204);
    bool _210 = _200 > 0.0;
    bool _212 = _206 > 0.0;
    float _214 = 0.0;
    float _216 = _206;
    float _218 = _200;
    if (_210)
    {
        float _220 = rsqrt(_194);
        _214 = _220;
    }
    float _222 = _214;
    if (!_210)
    {
        _216 = 0.0;
    }
    float _224 = _216;
    bool _226 = _208 > 0.0;
    float _228 = _208;
    float _230 = _224;
    if (!_210)
    {
        _228 = 0.0;
    }
    float _232 = _228;
    float _234 = _232;
    if (!_210)
    {
        _218 = 0.0;
    }
    float _236 = _218;
    float _238 = 0.0;
    float _240 = _236;
    if (_212)
    {
        float _242 = rsqrt(_198);
        _238 = _242;
    }
    float _244 = _238;
    float _246 = 0.0;
    float _248 = 0.0;
    if (!_212)
    {
        _246 = 0.0;
        _248 = 0.0;
    }
    float _250 = _246;
    float _252 = _248;
    float _254 = 0.0;
    float _256 = _250;
    float _258 = _252;
    if (!_212)
    {
        _254 = 0.0;
    }
    float _260 = _254;
    float _262 = 0.0;
    float _264 = _260;
    if (_226)
    {
        float _266 = rsqrt(_204);
        _262 = _266;
    }
    float _268 = _262;
    if (_210)
    {
        float _270 = _222 * _174;
        _230 = _270;
    }
    float _272 = _230;
    if (_210)
    {
        float _274 = _222 * _168;
        _234 = _274;
    }
    float _276 = _234;
    if (_210)
    {
        float _278 = _222 * _180;
        _240 = _278;
    }
    float _280 = _240;
    bool _282 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _284 = 0.0;
    float _286 = 0.0;
    if (!_226)
    {
        _284 = 0.0;
        _286 = 0.0;
    }
    float _288 = _284;
    float _290 = _286;
    float _292 = 0.0;
    float _294 = _288;
    float _296 = _290;
    if (!_226)
    {
        _292 = 0.0;
    }
    float _298 = _292;
    float _300 = _298;
    if (_212)
    {
        float _302 = _244 * _176;
        _264 = _302;
    }
    float _304 = _264;
    if (_212)
    {
        float _306 = _244 * _170;
        _256 = _306;
    }
    float _308 = _256;
    if (_212)
    {
        float _310 = _244 * _182;
        _258 = _310;
    }
    float _312 = _258;
    if (_226)
    {
        float _314 = _268 * _178;
        _294 = _314;
    }
    float _316 = _294;
    float _318 = _316;
    if (_226)
    {
        float _320 = _268 * _172;
        _296 = _320;
    }
    float _322 = _296;
    if (_226)
    {
        float _324 = _268 * _184;
        _300 = _324;
    }
    float _326 = _300;
    bool _328 = !_282;
    float _346;
    if (!_328)
    {
        float _330 = in.m_68.x;
        float _332 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _334 = _330 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _336 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[11].y, _148);
        float _338 = _336 * _332;
        float _340 = floor(_338);
        float _342 = -_340;
        float _344 = _338 + _342;
        _346 = _344;
        _348 = true;
    }
    else
    {
        float _350 = float(_114);
        float _352 = 1.0 / _350;
        float _354 = _148 * _352;
        _346 = _354;
    }
    _348 = false;
    float _356 = _346;
    float _358 = in.m_55.x;
    float _360 = in.m_55.y;
    float _362 = in.m_55.z;
    float _364 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _366 = in.m_68.x;
    float _368 = in.m_68.y;
    float _370 = as_type<float>(int(gl_VertexIndex));
    float _372 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _374 = in.m_62.w;
    float _376 = in.m_66.w;
    float _378 = _176 * _360;
    float _380 = _170 * _360;
    float _382 = _182 * _360;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _388 = _366 > 0.5;
    float _390 = fma(_180, _358, _382);
    bool _392 = _368 > 0.5;
    float _394 = fma(_168, _358, _380);
    float _396 = 1.0 / _386;
    int _398 = as_type<int>(_370) & 1;
    bool _400 = _398 != 0;
    int _402 = as_type<int>(_370) & 2;
    bool _404 = _402 != 0;
    float _406 = in.m_64.w;
    int _408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _410 = _408 != 0;
    float _412 = fma(_172, _362, _394);
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _416 = _414 != 0;
    float _418 = fma(_174, _358, _378);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _424 = in.m_73.x;
    float _426 = in.m_73.y;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _432 = 1.0 / _422;
    float _434 = fma(_184, _362, _390);
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _438 = _356 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _440 = isnan(_356);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _446 = _442 || _444;
    float _448 = float(_446);
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _452 = _434 + _376;
    float _454 = 1.0 / _430;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _456;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _462 = _436 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _464 = _450 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _466 = _458 * _396;
    float _468 = fma(_178, _362, _418);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _472 = _356 + _470;
    float _474 = _460 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _480;
    float _484 = -_448;
    float _486 = _484 + 1.0;
    float _488 = _468 + _406;
    float _490 = _478 * _432;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _494 = _356 + _492;
    out.m_75.x = _462;
    out.m_75.y = _464;
    out.m_75.z = _474;
    float _496 = _482 * _454;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _500 = _356 + _498;
    float _502 = fma(_466, _494, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _504 = _424 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _506 = fma(_496, _472, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _508 = _356 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _510 = isnan(_356);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = fma(_490, _500, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _522 = _356 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _524 = isnan(_356);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = _504 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _536 = _518 * _486;
    float _538 = -_518;
    float _540 = _538 + 1.0;
    float _542 = _412 + _374;
    bool _544 = _356 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _546 = isnan(_356);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = -_532;
    float _558 = _556 + 1.0;
    float _560 = _532 * _540;
    float _562 = _426 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _564 = _542 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    bool _566 = !_400;
    float _568 = _566 ? (-0.5) : 0.5;
    float _570 = _554 * _558;
    float _572 = _562 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _574 = _488 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _576 = _564 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _578 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _568);
    float _580 = _564 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _582 = _452 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _584 = fma(_574, (*spvDescriptorSet0.vp_c12)._m0[6].x, _576);
    float _586 = _534 * _578;
    bool _588 = !_404;
    float _590 = _588 ? (-0.5) : 0.5;
    float _592 = fma(_574, (*spvDescriptorSet0.vp_c12)._m0[6].y, _580);
    float _594 = fma(_582, (*spvDescriptorSet0.vp_c12)._m0[8].x, _584);
    float _596 = -_554;
    float _598 = _596 + 1.0;
    float _600 = fma(_582, (*spvDescriptorSet0.vp_c12)._m0[8].y, _592);
    float _602 = _594 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _604 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _590);
    float _606 = _600 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _608 = _602 * _364;
    float _610 = _572 * _604;
    float _612 = _502 * _570;
    float _614 = _606 * _372;
    float _616 = fma(_608, 0.5, 0.5);
    float _618 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _620 = _564 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _622 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[115].x, _612);
    float _624 = -_568;
    int _626 = _388 ? as_type<int>(_624) : as_type<int>(_568);
    float _628 = _590 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _630 = fma(_574, (*spvDescriptorSet0.vp_c12)._m0[6].z, _620);
    float _632 = fma(_520, _560, _622);
    float _634 = _610 * _304;
    float _636 = _610 * _308;
    float _638 = _610 * _312;
    bool _640 = !_410;
    float _642 = _640 ? _568 : as_type<float>(_626);
    float _644 = _568 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _646 = fma(_582, (*spvDescriptorSet0.vp_c12)._m0[8].z, _630);
    float _648 = -_590;
    int _650 = _392 ? as_type<int>(_648) : as_type<int>(_590);
    float _652 = _628 * _304;
    float _654 = _628 * _308;
    float _656 = _628 * _312;
    float _658 = fma(_586, _272, _634);
    float _660 = fma(_614, 0.5, 0.5);
    float _662 = fma(_586, _276, _636);
    float _664 = fma(_586, _280, _638);
    float _666 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _668 = _646 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    bool _670 = !_416;
    float _672 = _670 ? _590 : as_type<float>(_650);
    float _674 = fma(_644, _272, _652);
    float _676 = fma(_644, _276, _654);
    float _678 = fma(_644, _280, _656);
    float _680 = fma(_506, _536, _632);
    float _682 = floor(_660);
    float _684 = fma(_666, _316, _658);
    float _686 = fma(_666, _322, _662);
    float _688 = fma(_666, _326, _664);
    float _690 = _668 * _618;
    float _692 = _642 + 0.5;
    float _694 = -_672;
    float _696 = _694 + 0.5;
    float _698 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[118].x, _680);
    float _700 = fma(_690, 0.5, 0.5);
    float _702 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _704 = _692 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _706 = _696 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _708 = _698 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _710 = -_682;
    float _712 = _660 + _710;
    float _714 = floor(_616);
    float _716 = fma(_712, 2.0, -1.0);
    float _718 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _720 = _704 * _702;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _726 = _716 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _730 = _722 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _732 = _724 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _734 = floor(_700);
    float _736 = -_714;
    float _738 = _616 + _736;
    float _740 = _726 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _742 = _728 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _744 = fma(_738, 2.0, -1.0);
    float _746 = _706 * _718;
    out.m_77.x = _742;
    out.m_77.y = _730;
    out.m_77.z = _732;
    out.m_77.w = _708;
    float _748 = _678 + _326;
    out.m_79.x = _720;
    out.m_79.y = _746;
    float _750 = -_734;
    float _752 = _700 + _750;
    float _754 = _726 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _756 = fma(_752, 2.0, -1.0);
    float _758 = _744 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _760 = _726 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _762 = _756 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _764 = fma(_758, (*spvDescriptorSet0.vp_c12)._m0[2].x, _754);
    float _766 = fma(_758, (*spvDescriptorSet0.vp_c12)._m0[2].y, _760);
    bool _768 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _770 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _772 = _768 || _770;
    bool _774 = isnan(1.0);
    bool _776 = _772 || _774;
    float _778 = fma(_758, (*spvDescriptorSet0.vp_c12)._m0[2].z, _740);
    float _780 = fma(_762, (*spvDescriptorSet0.vp_c12)._m0[4].x, _764);
    float _782 = fma(_762, (*spvDescriptorSet0.vp_c12)._m0[4].y, _766);
    float _784 = _674 + _316;
    float _786 = fma(_762, (*spvDescriptorSet0.vp_c12)._m0[4].z, _778);
    float _788 = _676 + _322;
    float _790 = _780 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _792 = _782 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _794 = _786 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _796 = _684 + _790;
    float _798 = _686 + _792;
    float _800 = _688 + _794;
    float _802 = _684;
    float _804 = _678;
    float _806 = _688;
    float _808 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _810 = _678;
    float _812 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _814 = _744;
    float _816 = _716;
    float _818 = _730;
    float _820 = _756;
    float _822 = _742;
    float _824 = _790;
    float _834;
    float _836;
    float _838;
    float _840;
    if (!_776)
    {
        bool _826 = _792 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _828 = !_826;
        _830 = _828;
        if (!_830)
        {
            float _832 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _834 = _832;
            _836 = 0.0;
            _838 = 0.0;
            _840 = 0.0;
            _842 = true;
        }
    }
    if ((!_842) || _830)
    {
        bool _878;
        if (!_830)
        {
            bool _844 = _792 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _846 = isnan(_792);
            bool _848 = _844 || _846;
            bool _850 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _852 = _848 || _850;
            bool _854 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _856 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _858 = !_852;
            bool _860 = _856 && _858;
            if (_860)
            {
                _802 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _862 = _802;
            float _864 = _862;
            if (_860)
            {
                _804 = 0.0;
            }
            float _866 = _804;
            _810 = _866;
            _836 = _866;
            if (_860)
            {
                _806 = 0.0;
            }
            float _868 = _806;
            _838 = _868;
            if (_860)
            {
                float _870 = _862 * 5.0;
                _864 = _870;
            }
            float _872 = _864;
            _834 = _872;
            if (_860)
            {
                _808 = 0.0;
            }
            float _874 = _808;
            bool _876 = !_852;
            _878 = _876 && _854;
            _812 = _874;
            _840 = _874;
        }
        if ((!_878) || _830)
        {
            _830 = false;
            float _880 = _810;
            float _882 = _812;
            bool _884 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _886 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _888 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _890 = _708;
            float _892 = _882;
            _834 = _800;
            _838 = _798;
            if (_884)
            {
                float _894 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _890 = _894;
            }
            float _896 = _890;
            if (_884)
            {
                float _898 = abs(_744);
                float _900 = -_898;
                float _902 = _900 + 1.0;
                _814 = _902;
            }
            float _904 = _814;
            if (_886)
            {
                float _906 = abs(_716);
                float _908 = -_906;
                float _910 = _908 + 1.0;
                _816 = _910;
            }
            float _912 = _816;
            if (!_884)
            {
                _818 = 1.0;
            }
            float _914 = _818;
            float _916 = _914;
            if (_888)
            {
                float _918 = abs(_756);
                float _920 = -_918;
                float _922 = _920 + 1.0;
                _820 = _922;
            }
            float _924 = _820;
            if (!_886)
            {
                _822 = 1.0;
            }
            float _926 = _822;
            float _928 = _926;
            if (!_888)
            {
                _892 = 1.0;
            }
            float _930 = _892;
            float _932 = _686;
            float _934 = _930;
            if (_886)
            {
                float _936 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _932 = _936;
            }
            float _938 = _932;
            float _940 = _880;
            if (_888)
            {
                float _942 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _940 = _942;
            }
            float _944 = _940;
            if (_884)
            {
                float _946 = _904 * _896;
                float _948 = precise::clamp(_946, 0.0, 1.0);
                _916 = _948;
            }
            float _950 = _916;
            if (_886)
            {
                float _952 = _912 * _938;
                float _954 = precise::clamp(_952, 0.0, 1.0);
                _928 = _954;
            }
            float _956 = _928;
            float _958 = _950 * _956;
            if (_888)
            {
                float _960 = _924 * _944;
                float _962 = precise::clamp(_960, 0.0, 1.0);
                _934 = _962;
            }
            float _964 = _934;
            float _966 = _958 * _964;
            _836 = _796;
            _840 = _966;
        }
    }
    _842 = false;
    float _968 = _834;
    float _970 = _836;
    float _972 = _838;
    float _974 = _840;
    float _976 = fma(_790, 6.2500002968590706586837768554688e-05, 0.5);
    float _978 = fma(_794, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3784 = float2(_976, _978);
    float _980 = dm_bs(spvDescriptorSet0.vp_t_tcb_2A.sample(spvDescriptorSet0.vp_t_tcb_2ASmplr, select(_3784, float2(0.0), isnan(_3784)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2A, spvDescriptorSet0.vp_t_tcb_2ASmplr_w, select(_3784, float2(0.0), isnan(_3784)), level(0.0)).x;
    float _982 = in.m_81.w;
    float _984 = trunc(_982);
    int _986 = int(_984);
    int _988 = _986 << 5;
    uint _991 = uint(int(uint(_988) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_991)];
    float _993 = as_type<float>(_dmw0.x);
    int _995 = _988 + 4;
    uint _997 = uint(int(uint(_995) >> uint(2)));
    float _999 = as_type<float>(_dmw0.y);
    int _1001 = _988 + 8;
    uint _1003 = uint(int(uint(_1001) >> uint(2)));
    float _1005 = as_type<float>(_dmw0.z);
    int _1007 = _988 + 12;
    uint _1009 = uint(int(uint(_1007) >> uint(2)));
    float _1011 = as_type<float>(_dmw0.w);
    float _1013 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1015 = _968 + _1013;
    float _1017 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1019 = _970 + _1017;
    float _1021 = _1015 * _1015;
    float _1023 = fma(_1019, _1019, _1021);
    float _1025 = sqrt(_1023);
    bool _1027 = _1025 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1029 = _1021;
    float _1031 = _970;
    float _1033 = _968;
    float _1035 = _974;
    if (!_1027)
    {
        _1029 = _972;
    }
    float _1037 = _1029;
    float _1039 = _1011 * 2.0;
    bool _1041 = !_1027;
    float _1043 = _1037;
    if (!_1041)
    {
        float _1045 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1047 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1049 = _1025 + _1047;
        float _1051 = _972 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1053 = _1049 * _1045;
        float _1055 = rsqrt(_1023);
        float _1057 = _1053 * 0.15915493667125701904296875;
        float _1059 = _1057 * 6.283185482025146484375;
        float _1061 = cos(_1059);
        float _1063 = _1057 * 6.283185482025146484375;
        float _1065 = sin(_1063);
        float _1067 = _1061 + (-1.0);
        float _1069 = _1067 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1071 = fma(_1065, _1051, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1073 = fma(_1061, _972, _1069);
        float _1075 = _1055 * _1071;
        float _1077 = fma(_1019, _1075, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1079 = fma(_1015, _1075, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1043 = _1073;
        _1031 = _1077;
        _1033 = _1079;
    }
    float _1081 = _1043;
    float _1083 = _1031;
    float _1085 = _1033;
    float _1087 = _993 * 2.0;
    float _1089 = _999 * _1039;
    float _1091 = _993 * _993;
    float _1093 = _1005 * _1039;
    float _1095 = _999 * _999;
    float _1097 = _993 * _1039;
    float _1099 = _999 * 2.0;
    float _1101 = fma(_1005, _1087, _1089);
    float _1103 = -_1093;
    float _1105 = fma(_999, _1087, _1103);
    float _1107 = fma(_999, _1087, _1093);
    float _1109 = fma(_1091, -2.0, 1.0);
    float _1111 = -_1089;
    float _1113 = fma(_1005, _1087, _1111);
    float _1115 = _1005 * _1005;
    float _1117 = fma(_1095, -2.0, 1.0);
    float _1119 = -_1097;
    float _1121 = fma(_1005, _1099, _1119);
    float _1123 = fma(_1005, _1099, _1097);
    float _1125 = _792 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1127 = _792 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1129 = fma(_1115, -2.0, _1117);
    float _1131 = fma(_1115, -2.0, _1109);
    float _1133 = fma(_1095, -2.0, _1109);
    float _1135 = _980 * 2000.0;
    float _1137 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1125);
    float _1139 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1127);
    float _1141 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1137);
    bool _1143 = _792 >= _1135;
    bool _1145 = isnan(_792);
    bool _1147 = _1143 || _1145;
    bool _1149 = isnan(_1135);
    bool _1151 = _1147 || _1149;
    float _1153 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1139);
    float _1155 = _1141 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1157 = _1153 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1159 = _1157 + _1155;
    float _1161 = 1.0 / _1155;
    float _1163 = _1157;
    float _1165 = _1083;
    float _1167 = _1141;
    float _1169 = _1085;
    if (_1151)
    {
        _1163 = _1081;
    }
    float _1171 = _1163;
    float _1173 = _1171;
    if (!_1151)
    {
        _1173 = 0.0;
    }
    float _1175 = _1173;
    if (!_1151)
    {
        _1165 = 0.0;
    }
    float _1177 = _1165;
    if (!_1151)
    {
        _1167 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1179 = _1167;
    float _1181 = -_792;
    float _1183 = _1181 + _1175;
    float _1185 = -_790;
    float _1187 = _1185 + _1177;
    float _1189 = _1183 * _308;
    bool _1191 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1193 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1195 = _1191 || _1193;
    bool _1197 = isnan(0.5);
    bool _1199 = _1195 || _1197;
    if (!_1151)
    {
        float _1201 = _1179 * 5.0;
        _1169 = _1201;
    }
    float _1203 = _1169;
    float _1205 = _1183 * _276;
    float _1207 = _1159 * _1161;
    float _1209 = _1207 * 0.5;
    float _1211 = fma(_1187, _304, _1189);
    float _1213 = -_794;
    float _1215 = _1213 + _1203;
    float _1217 = _1183 * _322;
    float _1219 = fma(_1187, _272, _1205);
    float _1221 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1223 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1221);
    float _1225 = fma(_1215, _312, _1211);
    bool _1227 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1229 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1231 = _1227 || _1229;
    bool _1233 = isnan(0.5);
    bool _1235 = _1231 || _1233;
    float _1237 = fma(_1187, _316, _1217);
    float _1239 = fma(_1215, _280, _1219);
    float _1241 = _1225 * _1105;
    float _1243 = _1225 * _1131;
    float _1245 = _1225 * _1123;
    float _1247 = 1.0 / _1223;
    float _1249 = fma(_1215, _326, _1237);
    float _1251 = fma(_1239, _1129, _1241);
    float _1253 = fma(_1239, _1107, _1243);
    float _1255 = fma(_1239, _1113, _1245);
    float _1257 = fma(_1249, _1101, _1251);
    float _1259 = fma(_1249, _1121, _1253);
    float _1261 = fma(_1249, _1133, _1255);
    float _1263 = _1249;
    float _1265 = _1237;
    float _1267 = _1255;
    float _1269 = _1261;
    if (_1235)
    {
        _318 = 1.0;
    }
    float _1271 = _318;
    float _1273 = _790 + _1257;
    float _1275 = _792 + _1259;
    float _1277 = _794 + _1261;
    float _1279 = _1275;
    float _1281 = _1273;
    float _1283 = _1277;
    float _1285 = _1247;
    float _1287 = _1271;
    if (!_1199)
    {
        float _1289 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1291 = _792 + _1289;
        float _1293 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1295 = _790 + _1293;
        float _1297 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1299 = _1291 * _1291;
        float _1301 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1303 = _794 + _1301;
        float _1305 = fma(_1295, _1295, _1299);
        float _1307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1309 = fma(_1303, _1303, _1305);
        float _1311 = sqrt(_1309);
        float _1313 = _1297 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1315 = precise::min(_1311, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1317 = _1315 * _1307;
        float _1319 = _1313 * _1317;
        float _1321 = fma(_1259, _1319, _792);
        float _1323 = fma(_1257, _1319, _790);
        float _1325 = fma(_1261, _1319, _794);
        _1263 = _1307;
        _1279 = _1321;
        _1281 = _1323;
        _1283 = _1325;
    }
    float _1327 = _1263;
    float _1329 = _1279;
    float _1331 = _1281;
    float _1333 = _1283;
    float _1335 = _1327;
    if (_1235)
    {
        _1265 = 1.0;
    }
    float _1337 = _1265;
    float _1339 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1341 = _1247 * _1339;
    float _1343 = _1337;
    if (!_1235)
    {
        float _1345 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1347 = _1345 * 0.15915493667125701904296875;
        float _1349 = _1347 * 6.283185482025146484375;
        float _1351 = cos(_1349);
        float _1353 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1355 = _1353 * 0.15915493667125701904296875;
        float _1357 = _1347 * 6.283185482025146484375;
        float _1359 = sin(_1357);
        float _1361 = 1.0 / _1351;
        float _1363 = _1355 * 6.283185482025146484375;
        float _1365 = cos(_1363);
        float _1367 = _1359 * _1361;
        float _1369 = _1355 * 6.283185482025146484375;
        float _1371 = sin(_1369);
        float _1373 = _1365 * _1367;
        float _1375 = 1.0 / _1373;
        float _1377 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1379 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1377;
        float _1381 = 1.0 / _1379;
        float _1383 = _1371 * _1375;
        float _1385 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1387 = fma(_1341, _1383, _1385);
        float _1389 = _1387 * _1381;
        float _1391 = precise::clamp(_1389, 0.0, 1.0);
        _1267 = _1387;
        _1335 = _1361;
        _1285 = _1371;
        _1269 = _1355;
        _1287 = _1391;
    }
    float _1393 = _1267;
    float _1395 = _1335;
    float _1397 = _1285;
    float _1399 = _1269;
    float _1401 = _1287;
    float _1403 = _1395;
    float _1405 = _1397;
    float _1407 = _1393;
    float _1409 = _1399;
    if (!_1235)
    {
        float _1411 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1413 = _1411 * 0.15915493667125701904296875;
        float _1415 = _1413 * 6.283185482025146484375;
        float _1417 = cos(_1415);
        float _1419 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1421 = _1419 * 0.15915493667125701904296875;
        float _1423 = _1413 * 6.283185482025146484375;
        float _1425 = sin(_1423);
        float _1427 = 1.0 / _1417;
        float _1429 = _1421 * 6.283185482025146484375;
        float _1431 = cos(_1429);
        float _1433 = _1425 * _1427;
        float _1435 = _1421 * 6.283185482025146484375;
        float _1437 = sin(_1435);
        float _1439 = _1431 * _1433;
        float _1441 = 1.0 / _1439;
        float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1445 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1443;
        float _1447 = 1.0 / _1445;
        float _1449 = _1437 * _1441;
        float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1453 = fma(_1341, _1449, _1451);
        float _1455 = _1453 * _1447;
        float _1457 = precise::clamp(_1455, 0.0, 1.0);
        float _1459 = -_1457;
        float _1461 = _1459 + 1.0;
        _1403 = _1449;
        _1405 = _1445;
        _1407 = _1439;
        _1409 = _1441;
        _1343 = _1461;
    }
    float _1463 = _1403;
    float _1465 = _1405;
    float _1467 = _1407;
    float _1469 = _1409;
    float _1471 = _1343;
    float _1473 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1475 = _1329 + _1473;
    float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1479 = _1331 + _1477;
    float _1481 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1483 = _1333 + _1481;
    float _1485 = _1475 * _1475;
    float _1487 = fma(_1479, _1479, _1485);
    float _1489 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1491 = fma(_1483, _1483, _1487);
    float _1493 = rsqrt(_1491);
    float _1495 = sqrt(_1491);
    float _1497 = _1479 * _1493;
    float _1499 = _1483 * _1493;
    float _1501 = _1475 * _1493;
    float _1503 = _1497 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1505 = _1499 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1507 = _1503 * _1503;
    float _1509 = _1505 * _1505;
    float _1511 = _1507 + _1509;
    float _1513 = sqrt(_1511);
    bool _1515 = _1513 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1517 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1519 = _1513 + _1517;
    float _1521 = _1463;
    float _1523 = _1469;
    float _1525 = _1519;
    float _1527 = _1467;
    float _1529 = _1503;
    float _1531 = 0.0187292993068695068359375;
    if (_1515)
    {
        float _1533 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1521 = _1533;
    }
    float _1535 = _1521;
    if (_1515)
    {
        float _1537 = rsqrt(_1511);
        _1523 = _1537;
    }
    float _1539 = _1523;
    float _1541 = _1539;
    if (_1515)
    {
        float _1543 = _1519 * _1535;
        _1525 = _1543;
    }
    float _1545 = _1525;
    if (_1515)
    {
        float _1547 = _1545 * 0.15915493667125701904296875;
        _1527 = _1547;
    }
    float _1549 = _1527;
    float _1551 = _1465;
    if (_1515)
    {
        float _1553 = _1549 * 6.283185482025146484375;
        float _1555 = sin(_1553);
        _1551 = _1555;
    }
    float _1557 = _1551;
    float _1559 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1561 = precise::max(0.0, _1559);
    float _1563 = _1535;
    float _1565 = _1561;
    float _1567 = _1559;
    if (_1515)
    {
        float _1569 = _1549 * 6.283185482025146484375;
        float _1571 = cos(_1569);
        _1563 = _1571;
    }
    float _1573 = _1563;
    float _1575 = -_1501;
    float _1577 = -_1561;
    float _1579 = fma(_1575, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1577);
    if (_1515)
    {
        float _1581 = _1579 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1565 = _1581;
    }
    float _1583 = _1565;
    float _1585 = _1583;
    float _1587 = _1557;
    if (_1515)
    {
        float _1589 = fma(_1557, _1583, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1585 = _1589;
    }
    float _1591 = _1585;
    float _1593 = _1591;
    if (!_1515)
    {
        _1587 = _1579;
    }
    float _1595 = _1587;
    float _1597 = _1595;
    float _1599 = _1573;
    if (_1515)
    {
        float _1601 = _1573 + (-1.0);
        _1567 = _1601;
    }
    float _1603 = _1567;
    float _1605 = 0.0;
    float _1607 = _1603;
    if (_1515)
    {
        float _1609 = _1539 * _1591;
        _1605 = _1609;
    }
    float _1611 = _1605;
    if (!_1515)
    {
        _1593 = _1507;
    }
    float _1613 = _1593;
    float _1615 = _1613;
    if (_1515)
    {
        float _1617 = _1603 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1541 = _1617;
    }
    float _1619 = _1541;
    if (_1515)
    {
        float _1621 = _1503 * _1611;
        _1529 = _1621;
    }
    float _1623 = _1529;
    if (!_1515)
    {
        _1607 = _1505;
    }
    float _1625 = _1607;
    float _1627 = _1625;
    if (_1515)
    {
        float _1629 = _1505 * _1611;
        _1627 = _1629;
    }
    float _1631 = _1627;
    if (_1515)
    {
        float _1633 = fma(_1579, _1573, _1619);
        _1597 = _1633;
    }
    float _1635 = _1597;
    if (_1515)
    {
        float _1637 = _1623 * _1623;
        _1615 = _1637;
    }
    float _1639 = _1615;
    if (!_1515)
    {
        _1599 = _1509;
    }
    float _1641 = _1599;
    float _1643 = _1641;
    if (_1515)
    {
        float _1645 = _1631 * _1631;
        _1643 = _1645;
    }
    float _1647 = _1643;
    float _1649 = _1329 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1651 = fma(_1635, _1635, _1639);
    float _1653 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1649);
    float _1655 = _1651 + _1647;
    float _1657 = _1329 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1659 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1661 = fma(_1495, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1659);
    float _1663 = precise::clamp(_1661, 0.0, 1.0);
    float _1665 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1653);
    float _1667 = rsqrt(_1655);
    float _1669 = _1329 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1671 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1657);
    float _1673 = -_1663;
    float _1675 = _1673 + 1.0;
    float _1677 = _1329 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1679 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1669);
    float _1681 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1671);
    float _1683 = _1665 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1685 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1677);
    float _1687 = abs(_1675);
    float _1689 = log2(_1687);
    float _1691 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1679);
    float _1693 = _1681 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1695 = _1683 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1697 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1685);
    float _1699 = _1691 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1701 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1703 = _1667 * _1623;
    float _1705 = -_1695;
    float _1707 = fma(_1705, _1489, 1.0);
    float _1709 = _1667 * _1631;
    float _1711 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1701);
    float _1713 = _1667 * _1635;
    float _1715 = _1703 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1717 = _1697 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1719 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1711);
    float _1721 = log2(_1707);
    float _1723 = -_1715;
    float _1725 = fma(_1713, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1723);
    float _1727 = _1689 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1729 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1719);
    float _1731 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1733 = -_1709;
    float _1735 = fma(_1733, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1725);
    float _1737 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1739 = exp2(_1727);
    float _1741 = fma(_1735, -0.5, 0.5);
    float _1743 = fma(_1735, 0.5, 0.5);
    float _1745 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1737);
    float _1747 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1731);
    float _1749 = _1713 + 1.0;
    float _1751 = fma(_1743, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1753 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1745);
    float _1755 = 1.0 / _1729;
    float _1757 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1747);
    float _1759 = fma(_1743, _1751, -0.212114393711090087890625);
    float _1761 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1753);
    float _1763 = _1721 * 0.693147182464599609375;
    float _1765 = fma(_1743, _1759, 1.570728778839111328125);
    float _1767 = sqrt(_1741);
    float _1769 = -_1713;
    float _1771 = fma(_1739, _1749, _1769);
    float _1773 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1757);
    float _1775 = _1763 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1777 = fma(_1771, 0.5, 0.5);
    float _1779 = _1761 * _1755;
    float _1781 = _1773 * _1755;
    float _1783 = fma(_1779, 0.5, 0.5);
    float _1785 = fma(_1781, -0.5, 0.5);
    float _1787 = _1767 * 0.636619746685028076171875;
    float3 _5021 = float3(_1783, _1785, _1775);
    float _1789 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5021, float3(0.0), isnan(_5021)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5021, float3(0.0), isnan(_5021)), level(0.0)).x;
    float3 _5032 = float3(_1783, _1785, _1775);
    float4 _1792 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5032, float3(0.0), isnan(_5032)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5032, float3(0.0), isnan(_5032)), level(0.0)).xyzw;
    float _1794 = _1792.x;
    float _1796 = _1792.y;
    float _1798 = _1792.z;
    float _1800 = _1792.w;
    float _1802 = -_1765;
    float _1804 = fma(_1787, _1802, 1.0);
    float2 _5053 = float2(_1804, _1777);
    float3 _1808 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5053, float2(0.0), isnan(_5053)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5053, float2(0.0), isnan(_5053)), level(0.0)).xyz;
    float _1810 = _1808.x;
    float _1812 = _1808.y;
    float _1814 = _1808.z;
    float _1816 = _788 * _1105;
    float _1818 = _788 * _1123;
    float _1820 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    bool _1822 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1824 = isnan(0.0);
    bool _1826 = _1822 || _1824;
    bool _1828 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1830 = _1826 || _1828;
    float _1832 = _1729;
    float _1834 = _1773;
    if (!_1151)
    {
        _1035 = 0.0;
    }
    float _1836 = _1035;
    float _1838 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1840 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1838);
    float _1842 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1844 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1842);
    float _1846 = fma(_784, _1129, _1816);
    float _1848 = fma(_784, _1113, _1818);
    float _1850 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1840);
    float _1852 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1844);
    float _1854 = fma(_748, _1101, _1846);
    out.m_83.x = _1331;
    out.m_83.y = _1329;
    out.m_83.z = _1333;
    float _1856 = _790 + _1850;
    float _1858 = _794 + _1852;
    if (_1830)
    {
        float _1860 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1531 = _1860;
    }
    float _1862 = _1531;
    float _1864 = _1862;
    if (!_1830)
    {
        _824 = 1.0;
    }
    float _1866 = _824;
    float _1868 = -_1856;
    float _1870 = _1868 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1872 = -_1858;
    float _1874 = _1872 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1876 = _1495 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1878 = isnan(_1495);
    bool _1880 = _1876 || _1878;
    bool _1882 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1884 = _1880 || _1882;
    float _1886 = _1866;
    if (_1830)
    {
        float _1888 = precise::min(_1862, 20.0);
        _1864 = _1888;
    }
    float _1890 = _1864;
    float _1892 = precise::min(_1858, _1874);
    float _1894 = _1689 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1896 = precise::min(_1856, _1870);
    float _1898 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1900 = _1890;
    if (_1830)
    {
        float _1902 = 1.0 / _1890;
        _1900 = _1902;
    }
    float _1904 = _1900;
    float _1906 = precise::min(_1896, _1892);
    float _1908 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1898);
    float _1910 = _788 * _1131;
    float _1912 = exp2(_1894);
    float _1914 = fma(_784, _1107, _1910);
    float _1916 = fma(_748, _1121, _1914);
    float _1918 = fma(_748, _1133, _1848);
    float _1920 = _1401 * _1471;
    float _1922 = _1761;
    if (_1830)
    {
        float _1924 = _1906 * _1904;
        float _1926 = precise::clamp(_1924, 0.0, 1.0);
        _1886 = _1926;
    }
    float _1928 = _1886;
    float _1930 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1908);
    out.m_85.x = _1854;
    out.m_85.y = _1916;
    out.m_85.z = _1918;
    float _1932 = _1836 * _1928;
    float _1934 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1930);
    float _1936 = -_1912;
    float _1938 = _1936 + 1.0;
    float _1940 = _1934 + _1729;
    float _1942 = _1932 * _1920;
    out.gl_Position.x = _1761;
    out.gl_Position.y = _1773;
    out.gl_Position.z = _1934;
    out.gl_Position.w = _1729;
    float _1944 = _1938 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1946 = _1940 * 0.5;
    float _1948 = -_1944;
    float _1950 = _1948 + 1.0;
    out.m_87.z = _1946;
    out.m_87.w = _1729;
    float _1952 = _1934;
    float _1954 = _1942;
    if (!_1884)
    {
        _1832 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1956 = _1832;
    float _1958 = _1956;
    float _1960 = _1956;
    if (!_1884)
    {
        _1952 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1962 = _1952;
    float _1964 = _1962;
    float _1966 = _1962;
    if (!_1884)
    {
        _1834 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1968 = _1834;
    float _1970 = _1968;
    float _1972 = _1968;
    if (!_1884)
    {
        _1922 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1974 = _1922;
    float _1976 = _1944 * _1789;
    float _1978 = _1800 * _1950;
    float _1980 = _1800 * _1976;
    float _1982 = _1814 * _1976;
    float _1984 = fma(_1810, _1980, _1794);
    float _1986 = fma(_1812, _1980, _1796);
    float _1988 = _1794;
    float _1990 = _1974;
    float _1992 = _1974;
    if (!_1884)
    {
        _1988 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1994 = _1988;
    float _1996 = fma(_1800, _1982, _1798);
    float _1998 = _1942 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2000 = _1994;
    float _2002 = _1994;
    if (!_1884)
    {
        _1954 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2004 = _1954;
    out.m_89.x = _1984;
    out.m_89.y = _1986;
    out.m_89.z = _1996;
    out.m_89.w = _1978;
    bool _2006 = !_1884;
    float _2008 = _2004;
    float _2010 = _2004;
    if (!_2006)
    {
        bool _2012 = _1495 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2014 = isnan(_1495);
        bool _2016 = _2012 || _2014;
        bool _2018 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2020 = _2016 || _2018;
        if (!_2020)
        {
            float _2022 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2024 = _1495 + _2022;
            float _2026 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2028 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2026;
            float _2030 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2032 = _2030 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2034 = 1.0 / _2028;
            float _2036 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2038 = _2036 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2040 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2042 = _2040 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2044 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2046 = _2044 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2048 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2050 = _2048 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2052 = _2024 * _2034;
            float _2054 = precise::clamp(_2052, 0.0, 1.0);
            float _2056 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2058 = _2056 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2060 = fma(_2054, _2032, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2062 = fma(_2054, _2058, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2064 = fma(_2054, _2038, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2066 = fma(_2054, _2042, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2068 = fma(_2054, _2046, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2070 = fma(_2054, _2050, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1960 = _2064;
            _1992 = _2068;
            _2002 = _2060;
            _1972 = _2066;
            _1966 = _2062;
            _2010 = _2070;
            _2072 = true;
        }
        else
        {
            bool _2074 = _1495 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2076 = isnan(_1495);
            bool _2078 = _2074 || _2076;
            bool _2080 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2082 = _2078 || _2080;
            if (!_2082)
            {
                _2000 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2084 = _2000;
            _2002 = _2084;
            if (!_2082)
            {
                _1958 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2086 = _1958;
            _1960 = _2086;
            if (!_2082)
            {
                _1964 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2088 = _1964;
            _1966 = _2088;
            if (!_2082)
            {
                _1970 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2090 = _1970;
            _1972 = _2090;
            if (!_2082)
            {
                _1990 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2092 = _1990;
            _1992 = _2092;
            if (!_2082)
            {
                _2008 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2094 = _2008;
            bool _2096 = !_2082;
            _2010 = _2094;
            if (!_2096)
            {
                bool _2098 = _1495 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2100 = isnan(_1495);
                bool _2102 = _2098 || _2100;
                bool _2104 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2106 = _2102 || _2104;
                if (!_2106)
                {
                    float _2108 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2110 = _1495 + _2108;
                    float _2112 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2114 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2112;
                    float _2116 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2118 = _2116 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2120 = 1.0 / _2114;
                    float _2122 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2124 = _2122 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2126 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2128 = _2126 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2130 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2132 = _2130 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2134 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2136 = _2134 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2138 = _2110 * _2120;
                    float _2140 = precise::clamp(_2138, 0.0, 1.0);
                    float _2142 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2144 = _2142 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2146 = fma(_2140, _2118, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2148 = fma(_2140, _2144, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2150 = fma(_2140, _2124, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2152 = fma(_2140, _2128, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2154 = fma(_2140, _2132, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2156 = fma(_2140, _2136, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1960 = _2150;
                    _1992 = _2154;
                    _2002 = _2146;
                    _1972 = _2152;
                    _1966 = _2148;
                    _2010 = _2156;
                    _2072 = true;
                }
                else
                {
                    _1960 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1992 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2002 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1972 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1966 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2010 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2072 = false;
    float _2158 = _1960;
    float _2160 = _1992;
    float _2162 = _2002;
    float _2164 = _1972;
    float _2166 = _1966;
    float _2168 = _2010;
    float _2170 = _1998 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2172 = fma(_1916, -0.5, 0.5);
    float _2174 = precise::clamp(_2172, 0.0, 1.0);
    float _2176 = -_2158;
    float _2178 = _2176 + _2160;
    float _2180 = -_2162;
    float _2182 = _2180 + _2164;
    out.m_58.x = _2170;
    float _2184 = fma(_2174, _2178, _2158);
    float _2186 = -_2166;
    float _2188 = _2186 + _2168;
    float _2190 = fma(_2174, _2182, _2162);
    float _2192 = _2184 * 0.586610972881317138671875;
    bool _2194 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2196 = fma(_2174, _2188, _2166);
    out.m_91.x = 0.0;
    float _2198 = fma(_2190, 0.298911988735198974609375, _2192);
    bool _2200 = _1401 > 0.0;
    bool _2202 = isnan(_1401);
    bool _2204 = _2200 || _2202;
    bool _2206 = isnan(0.0);
    bool _2208 = _2204 || _2206;
    out.m_93.x = 0.0;
    float _2210 = fma(_2196, 0.114477999508380889892578125, _2198);
    bool _2212 = _1471 <= 0.0;
    bool _2214 = !_2208;
    bool _2216 = _2212 || _2214;
    float _2218 = -_2210;
    float _2220 = _2190 + _2218;
    float _2222 = -_2210;
    float _2224 = _2184 + _2222;
    float _2226 = -_2210;
    float _2228 = _2196 + _2226;
    float _2230 = fma(_2220, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2210);
    float _2232 = fma(_2224, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2210);
    float _2234 = fma(_2228, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2210);
    bool _2236 = !_2194;
    if (!_2236)
    {
        float _2238 = -_1329;
        float _2240 = _2238 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2242 = -_1331;
        float _2244 = _2242 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2246 = -_1333;
        float _2248 = _2246 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2250 = _2240 * _2240;
        float _2252 = fma(_2244, _2244, _2250);
        float _2254 = fma(_2248, _2248, _2252);
        float _2256 = rsqrt(_2254);
        float _2258 = _2240 * _2256;
        float _2260 = _2244 * _2256;
        float _2262 = _2248 * _2256;
        float _2264 = sqrt(_2254);
        float _2266 = -_1501;
        float _2268 = _2266 + _2258;
        float _2270 = -_1497;
        float _2272 = _2270 + _2260;
        float _2274 = -_1499;
        float _2276 = _2274 + _2262;
        float _2278 = _2268 * _2268;
        float _2280 = fma(_2272, _2272, _2278);
        float _2282 = fma(_2276, _2276, _2280);
        float _2284 = -_2264;
        float _2286 = _2284 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2288 = rsqrt(_2282);
        float _2290 = _2286 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2292 = precise::clamp(_2290, 0.0, 1.0);
        float _2294 = abs(_2292);
        float _2296 = log2(_2294);
        float _2298 = _2268 * _2288;
        float _2300 = _2272 * _2288;
        float _2302 = _2276 * _2288;
        float _2304 = _1916 * _2298;
        float _2306 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _2308 = precise::clamp(_2306, 0.0, 1.0);
        float _2310 = _1916 * _2258;
        float _2312 = fma(_1854, _2300, _2304);
        float _2314 = _2308 * _2308;
        float _2316 = _2296 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2318 = fma(_1854, _2260, _2310);
        float _2320 = fma(_1918, _2302, _2312);
        float _2322 = precise::clamp(_2320, 0.0, 1.0);
        float _2324 = _2314 + (-1.0);
        float _2326 = fma(_1918, _2262, _2318);
        float _2328 = precise::clamp(_2326, 0.0, 1.0);
        float _2330 = _2322 * _2322;
        float _2332 = _2260 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2334 = exp2(_2316);
        float _2336 = fma(_2330, _2324, 1.0);
        float _2338 = -_2258;
        float _2340 = -_2332;
        float _2342 = fma(_2338, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2340);
        float _2344 = _2336 * _2336;
        float _2346 = -_2262;
        float _2348 = fma(_2346, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2342);
        float _2350 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2352 = _2348 + _2350;
        float _2354 = 1.0 / _2344;
        float _2356 = _2352 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2358 = precise::clamp(_2356, 0.0, 1.0);
        float _2360 = _2334 * _2358;
        float _2362 = _2328 * _2360;
        float _2364 = _2362 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2366 = _2314 * _2354;
        float _2368 = _2362 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2370 = _2362 * _2366;
        float _2372 = _2362 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2374 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2376 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2378 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _2364;
        out.m_91.y = _2368;
        out.m_91.z = _2372;
        out.m_93.x = _2374;
        out.m_93.y = _2376;
        out.m_93.z = _2378;
    }
    out.m_95.x = _2230;
    out.m_95.y = _2232;
    out.m_95.z = _2234;
    if (!_2216)
    {
        return out;
    }
    out.m_58.x = 0.0;
    float _2380 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2380;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2072 = false;
    bool _842 = false;
    bool _830 = false;
    bool _348 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_55.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _122 = _120;
    float _124 = _122;
    if (!_118)
    {
        out.m_58.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _122 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2437 = as_type<float>(_130);
        out.gl_Position.z = _2437;
    }
    if (!_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_60.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_144)
    {
        float _150 = float(_114);
        _124 = _150;
    }
    float _152 = _124;
    bool _154 = _148 >= _152;
    bool _156 = !_144;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_58.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _132 = as_type<int>(_164);
    }
    int _166 = _132;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2506 = as_type<float>(_166);
        out.gl_Position.z = _2506;
    }
    if (_158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _168 = in.m_62.x;
    float _170 = in.m_62.y;
    float _172 = in.m_62.z;
    float _174 = in.m_64.x;
    float _176 = in.m_64.y;
    float _178 = in.m_64.z;
    float _180 = in.m_66.x;
    float _182 = in.m_66.y;
    float _184 = in.m_66.z;
    float _186 = _168 * _168;
    float _188 = _170 * _170;
    float _190 = fma(_174, _174, _186);
    float _192 = fma(_176, _176, _188);
    float _194 = fma(_180, _180, _190);
    float _196 = _172 * _172;
    float _198 = fma(_182, _182, _192);
    float _200 = sqrt(_194);
    float _202 = fma(_178, _178, _196);
    float _204 = fma(_184, _184, _202);
    float _206 = sqrt(_198);
    float _208 = sqrt(_204);
    bool _210 = _200 > 0.0;
    bool _212 = _206 > 0.0;
    float _214 = 0.0;
    float _216 = _206;
    float _218 = _200;
    if (_210)
    {
        float _220 = rsqrt(_194);
        _214 = _220;
    }
    float _222 = _214;
    if (!_210)
    {
        _216 = 0.0;
    }
    float _224 = _216;
    bool _226 = _208 > 0.0;
    float _228 = _208;
    float _230 = _224;
    if (!_210)
    {
        _228 = 0.0;
    }
    float _232 = _228;
    float _234 = _232;
    if (!_210)
    {
        _218 = 0.0;
    }
    float _236 = _218;
    float _238 = 0.0;
    float _240 = _236;
    if (_212)
    {
        float _242 = rsqrt(_198);
        _238 = _242;
    }
    float _244 = _238;
    float _246 = 0.0;
    float _248 = 0.0;
    if (!_212)
    {
        _246 = 0.0;
        _248 = 0.0;
    }
    float _250 = _246;
    float _252 = _248;
    float _254 = 0.0;
    float _256 = _250;
    float _258 = _252;
    if (!_212)
    {
        _254 = 0.0;
    }
    float _260 = _254;
    float _262 = 0.0;
    float _264 = _260;
    if (_226)
    {
        float _266 = rsqrt(_204);
        _262 = _266;
    }
    float _268 = _262;
    if (_210)
    {
        float _270 = _222 * _174;
        _230 = _270;
    }
    float _272 = _230;
    if (_210)
    {
        float _274 = _222 * _168;
        _234 = _274;
    }
    float _276 = _234;
    if (_210)
    {
        float _278 = _222 * _180;
        _240 = _278;
    }
    float _280 = _240;
    bool _282 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _284 = 0.0;
    float _286 = 0.0;
    if (!_226)
    {
        _284 = 0.0;
        _286 = 0.0;
    }
    float _288 = _284;
    float _290 = _286;
    float _292 = 0.0;
    float _294 = _288;
    float _296 = _290;
    if (!_226)
    {
        _292 = 0.0;
    }
    float _298 = _292;
    float _300 = _298;
    if (_212)
    {
        float _302 = _244 * _176;
        _264 = _302;
    }
    float _304 = _264;
    if (_212)
    {
        float _306 = _244 * _170;
        _256 = _306;
    }
    float _308 = _256;
    if (_212)
    {
        float _310 = _244 * _182;
        _258 = _310;
    }
    float _312 = _258;
    if (_226)
    {
        float _314 = _268 * _178;
        _294 = _314;
    }
    float _316 = _294;
    float _318 = _316;
    if (_226)
    {
        float _320 = _268 * _172;
        _296 = _320;
    }
    float _322 = _296;
    if (_226)
    {
        float _324 = _268 * _184;
        _300 = _324;
    }
    float _326 = _300;
    bool _328 = !_282;
    float _346;
    if (!_328)
    {
        float _330 = in.m_68.x;
        float _332 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _334 = _330 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _336 = fma(_334, (*spvDescriptorSet0.vp_c9)._m0[11].y, _148);
        float _338 = _336 * _332;
        float _340 = floor(_338);
        float _342 = -_340;
        float _344 = _338 + _342;
        _346 = _344;
        _348 = true;
    }
    else
    {
        float _350 = float(_114);
        float _352 = 1.0 / _350;
        float _354 = _148 * _352;
        _346 = _354;
    }
    _348 = false;
    float _356 = _346;
    float _358 = in.m_55.x;
    float _360 = in.m_55.y;
    float _362 = in.m_55.z;
    float _364 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _366 = in.m_68.x;
    float _368 = in.m_68.y;
    float _370 = as_type<float>(int(gl_VertexIndex));
    float _372 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _374 = in.m_62.w;
    float _376 = in.m_66.w;
    float _378 = _176 * _360;
    float _380 = _170 * _360;
    float _382 = _182 * _360;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _388 = _366 > 0.5;
    float _390 = fma(_180, _358, _382);
    bool _392 = _368 > 0.5;
    float _394 = fma(_168, _358, _380);
    float _396 = 1.0 / _386;
    int _398 = as_type<int>(_370) & 1;
    bool _400 = _398 != 0;
    int _402 = as_type<int>(_370) & 2;
    bool _404 = _402 != 0;
    float _406 = in.m_64.w;
    int _408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _410 = _408 != 0;
    float _412 = fma(_172, _362, _394);
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _416 = _414 != 0;
    float _418 = fma(_174, _358, _378);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _424 = in.m_73.x;
    float _426 = in.m_73.y;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _432 = 1.0 / _422;
    float _434 = fma(_184, _362, _390);
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _438 = _356 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _440 = isnan(_356);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _446 = _442 || _444;
    float _448 = float(_446);
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _452 = _434 + _376;
    float _454 = 1.0 / _430;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _456;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _462 = _436 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _464 = _450 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _466 = _458 * _396;
    float _468 = fma(_178, _362, _418);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _472 = _356 + _470;
    float _474 = _460 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _480;
    float _484 = -_448;
    float _486 = _484 + 1.0;
    float _488 = _468 + _406;
    float _490 = _478 * _432;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _494 = _356 + _492;
    out.m_75.x = _462;
    out.m_75.y = _464;
    out.m_75.z = _474;
    float _496 = _482 * _454;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _500 = _356 + _498;
    float _502 = fma(_466, _494, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _504 = _424 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _506 = fma(_496, _472, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _508 = _356 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _510 = isnan(_356);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _516 = _512 || _514;
    float _518 = float(_516);
    float _520 = fma(_490, _500, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _522 = _356 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _524 = isnan(_356);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = _504 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _536 = _518 * _486;
    float _538 = -_518;
    float _540 = _538 + 1.0;
    float _542 = _412 + _374;
    bool _544 = _356 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _546 = isnan(_356);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = -_532;
    float _558 = _556 + 1.0;
    float _560 = _532 * _540;
    float _562 = _426 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _564 = _542 + (*spvDescriptorSet0.vp_c12)._m0[0].y;
    bool _566 = !_400;
    float _568 = _566 ? (-0.5) : 0.5;
    float _570 = _554 * _558;
    float _572 = _562 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _574 = _488 + (*spvDescriptorSet0.vp_c12)._m0[0].x;
    float _576 = _564 * (*spvDescriptorSet0.vp_c12)._m0[7].x;
    float _578 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _568);
    float _580 = _564 * (*spvDescriptorSet0.vp_c12)._m0[7].y;
    float _582 = _452 + (*spvDescriptorSet0.vp_c12)._m0[0].z;
    float _584 = fma(_574, (*spvDescriptorSet0.vp_c12)._m0[6].x, _576);
    float _586 = _534 * _578;
    bool _588 = !_404;
    float _590 = _588 ? (-0.5) : 0.5;
    float _592 = fma(_574, (*spvDescriptorSet0.vp_c12)._m0[6].y, _580);
    float _594 = fma(_582, (*spvDescriptorSet0.vp_c12)._m0[8].x, _584);
    float _596 = -_554;
    float _598 = _596 + 1.0;
    float _600 = fma(_582, (*spvDescriptorSet0.vp_c12)._m0[8].y, _592);
    float _602 = _594 + (*spvDescriptorSet0.vp_c12)._m0[9].x;
    float _604 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _590);
    float _606 = _600 + (*spvDescriptorSet0.vp_c12)._m0[9].y;
    float _608 = _602 * _364;
    float _610 = _572 * _604;
    float _612 = _502 * _570;
    float _614 = _606 * _372;
    float _616 = fma(_608, 0.5, 0.5);
    float _618 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _620 = _564 * (*spvDescriptorSet0.vp_c12)._m0[7].z;
    float _622 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[115].x, _612);
    float _624 = -_568;
    int _626 = _388 ? as_type<int>(_624) : as_type<int>(_568);
    float _628 = _590 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _630 = fma(_574, (*spvDescriptorSet0.vp_c12)._m0[6].z, _620);
    float _632 = fma(_520, _560, _622);
    float _634 = _610 * _304;
    float _636 = _610 * _308;
    float _638 = _610 * _312;
    bool _640 = !_410;
    float _642 = _640 ? _568 : as_type<float>(_626);
    float _644 = _568 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _646 = fma(_582, (*spvDescriptorSet0.vp_c12)._m0[8].z, _630);
    float _648 = -_590;
    int _650 = _392 ? as_type<int>(_648) : as_type<int>(_590);
    float _652 = _628 * _304;
    float _654 = _628 * _308;
    float _656 = _628 * _312;
    float _658 = fma(_586, _272, _634);
    float _660 = fma(_614, 0.5, 0.5);
    float _662 = fma(_586, _276, _636);
    float _664 = fma(_586, _280, _638);
    float _666 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _668 = _646 + (*spvDescriptorSet0.vp_c12)._m0[9].z;
    bool _670 = !_416;
    float _672 = _670 ? _590 : as_type<float>(_650);
    float _674 = fma(_644, _272, _652);
    float _676 = fma(_644, _276, _654);
    float _678 = fma(_644, _280, _656);
    float _680 = fma(_506, _536, _632);
    float _682 = floor(_660);
    float _684 = fma(_666, _316, _658);
    float _686 = fma(_666, _322, _662);
    float _688 = fma(_666, _326, _664);
    float _690 = _668 * _618;
    float _692 = _642 + 0.5;
    float _694 = -_672;
    float _696 = _694 + 0.5;
    float _698 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[118].x, _680);
    float _700 = fma(_690, 0.5, 0.5);
    float _702 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _704 = _692 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _706 = _696 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _708 = _698 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _710 = -_682;
    float _712 = _660 + _710;
    float _714 = floor(_616);
    float _716 = fma(_712, 2.0, -1.0);
    float _718 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _720 = _704 * _702;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _726 = _716 * (*spvDescriptorSet0.vp_c12)._m0[11].y;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _730 = _722 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _732 = _724 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _734 = floor(_700);
    float _736 = -_714;
    float _738 = _616 + _736;
    float _740 = _726 * (*spvDescriptorSet0.vp_c12)._m0[3].z;
    float _742 = _728 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _744 = fma(_738, 2.0, -1.0);
    float _746 = _706 * _718;
    out.m_77.x = _742;
    out.m_77.y = _730;
    out.m_77.z = _732;
    out.m_77.w = _708;
    float _748 = _678 + _326;
    out.m_79.x = _720;
    out.m_79.y = _746;
    float _750 = -_734;
    float _752 = _700 + _750;
    float _754 = _726 * (*spvDescriptorSet0.vp_c12)._m0[3].x;
    float _756 = fma(_752, 2.0, -1.0);
    float _758 = _744 * (*spvDescriptorSet0.vp_c12)._m0[11].x;
    float _760 = _726 * (*spvDescriptorSet0.vp_c12)._m0[3].y;
    float _762 = _756 * (*spvDescriptorSet0.vp_c12)._m0[11].z;
    float _764 = fma(_758, (*spvDescriptorSet0.vp_c12)._m0[2].x, _754);
    float _766 = fma(_758, (*spvDescriptorSet0.vp_c12)._m0[2].y, _760);
    bool _768 = (*spvDescriptorSet0.vp_c12)._m0[10].x != 1.0;
    bool _770 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].x);
    bool _772 = _768 || _770;
    bool _774 = isnan(1.0);
    bool _776 = _772 || _774;
    float _778 = fma(_758, (*spvDescriptorSet0.vp_c12)._m0[2].z, _740);
    float _780 = fma(_762, (*spvDescriptorSet0.vp_c12)._m0[4].x, _764);
    float _782 = fma(_762, (*spvDescriptorSet0.vp_c12)._m0[4].y, _766);
    float _784 = _674 + _316;
    float _786 = fma(_762, (*spvDescriptorSet0.vp_c12)._m0[4].z, _778);
    float _788 = _676 + _322;
    float _790 = _780 + (*spvDescriptorSet0.vp_c12)._m0[5].x;
    float _792 = _782 + (*spvDescriptorSet0.vp_c12)._m0[5].y;
    float _794 = _786 + (*spvDescriptorSet0.vp_c12)._m0[5].z;
    float _796 = _684 + _790;
    float _798 = _686 + _792;
    float _800 = _688 + _794;
    float _802 = _684;
    float _804 = _678;
    float _806 = _688;
    float _808 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _810 = _678;
    float _812 = (*spvDescriptorSet0.vp_c12)._m0[10].x;
    float _814 = _744;
    float _816 = _716;
    float _818 = _730;
    float _820 = _756;
    float _822 = _742;
    float _824 = _790;
    float _834;
    float _836;
    float _838;
    float _840;
    if (!_776)
    {
        bool _826 = _792 > (*spvDescriptorSet0.vp_c12)._m0[10].y;
        bool _828 = !_826;
        _830 = _828;
        if (!_830)
        {
            float _832 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
            _834 = _832;
            _836 = 0.0;
            _838 = 0.0;
            _840 = 0.0;
            _842 = true;
        }
    }
    if ((!_842) || _830)
    {
        bool _878;
        if (!_830)
        {
            bool _844 = _792 >= (*spvDescriptorSet0.vp_c12)._m0[10].y;
            bool _846 = isnan(_792);
            bool _848 = _844 || _846;
            bool _850 = isnan((*spvDescriptorSet0.vp_c12)._m0[10].y);
            bool _852 = _848 || _850;
            bool _854 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _856 = (*spvDescriptorSet0.vp_c12)._m0[10].x == 2.0;
            bool _858 = !_852;
            bool _860 = _856 && _858;
            if (_860)
            {
                _802 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
            }
            float _862 = _802;
            float _864 = _862;
            if (_860)
            {
                _804 = 0.0;
            }
            float _866 = _804;
            _810 = _866;
            _836 = _866;
            if (_860)
            {
                _806 = 0.0;
            }
            float _868 = _806;
            _838 = _868;
            if (_860)
            {
                float _870 = _862 * 5.0;
                _864 = _870;
            }
            float _872 = _864;
            _834 = _872;
            if (_860)
            {
                _808 = 0.0;
            }
            float _874 = _808;
            bool _876 = !_852;
            _878 = _876 && _854;
            _812 = _874;
            _840 = _874;
        }
        if ((!_878) || _830)
        {
            _830 = false;
            float _880 = _810;
            float _882 = _812;
            bool _884 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].x;
            bool _886 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].y;
            bool _888 = 0.0 < (*spvDescriptorSet0.vp_c12)._m0[1].z;
            float _890 = _708;
            float _892 = _882;
            _834 = _800;
            _838 = _798;
            if (_884)
            {
                float _894 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].x;
                _890 = _894;
            }
            float _896 = _890;
            if (_884)
            {
                float _898 = abs(_744);
                float _900 = -_898;
                float _902 = _900 + 1.0;
                _814 = _902;
            }
            float _904 = _814;
            if (_886)
            {
                float _906 = abs(_716);
                float _908 = -_906;
                float _910 = _908 + 1.0;
                _816 = _910;
            }
            float _912 = _816;
            if (!_884)
            {
                _818 = 1.0;
            }
            float _914 = _818;
            float _916 = _914;
            if (_888)
            {
                float _918 = abs(_756);
                float _920 = -_918;
                float _922 = _920 + 1.0;
                _820 = _922;
            }
            float _924 = _820;
            if (!_886)
            {
                _822 = 1.0;
            }
            float _926 = _822;
            float _928 = _926;
            if (!_888)
            {
                _892 = 1.0;
            }
            float _930 = _892;
            float _932 = _686;
            float _934 = _930;
            if (_886)
            {
                float _936 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].y;
                _932 = _936;
            }
            float _938 = _932;
            float _940 = _880;
            if (_888)
            {
                float _942 = 1.0 / (*spvDescriptorSet0.vp_c12)._m0[1].z;
                _940 = _942;
            }
            float _944 = _940;
            if (_884)
            {
                float _946 = _904 * _896;
                float _948 = precise::clamp(_946, 0.0, 1.0);
                _916 = _948;
            }
            float _950 = _916;
            if (_886)
            {
                float _952 = _912 * _938;
                float _954 = precise::clamp(_952, 0.0, 1.0);
                _928 = _954;
            }
            float _956 = _928;
            float _958 = _950 * _956;
            if (_888)
            {
                float _960 = _924 * _944;
                float _962 = precise::clamp(_960, 0.0, 1.0);
                _934 = _962;
            }
            float _964 = _934;
            float _966 = _958 * _964;
            _836 = _796;
            _840 = _966;
        }
    }
    _842 = false;
    float _968 = _834;
    float _970 = _836;
    float _972 = _838;
    float _974 = _840;
    float _976 = fma(_790, 6.2500002968590706586837768554688e-05, 0.5);
    float _978 = fma(_794, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3784 = float2(_976, _978);
    float _980 = dm_bs(spvDescriptorSet0.vp_t_tcb_2A.sample(spvDescriptorSet0.vp_t_tcb_2ASmplr, select(_3784, float2(0.0), isnan(_3784)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_2A, spvDescriptorSet0.vp_t_tcb_2ASmplr_w, select(_3784, float2(0.0), isnan(_3784)), level(0.0)).x;
    float _982 = in.m_81.w;
    float _984 = trunc(_982);
    int _986 = int(_984);
    int _988 = _986 << 5;
    uint _991 = uint(int(uint(_988) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_991)];
    float _993 = as_type<float>(_dmw0.x);
    int _995 = _988 + 4;
    uint _997 = uint(int(uint(_995) >> uint(2)));
    float _999 = as_type<float>(_dmw0.y);
    int _1001 = _988 + 8;
    uint _1003 = uint(int(uint(_1001) >> uint(2)));
    float _1005 = as_type<float>(_dmw0.z);
    int _1007 = _988 + 12;
    uint _1009 = uint(int(uint(_1007) >> uint(2)));
    float _1011 = as_type<float>(_dmw0.w);
    float _1013 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1015 = _968 + _1013;
    float _1017 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1019 = _970 + _1017;
    float _1021 = _1015 * _1015;
    float _1023 = fma(_1019, _1019, _1021);
    float _1025 = sqrt(_1023);
    bool _1027 = _1025 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1029 = _1021;
    float _1031 = _970;
    float _1033 = _968;
    float _1035 = _974;
    if (!_1027)
    {
        _1029 = _972;
    }
    float _1037 = _1029;
    float _1039 = _1011 * 2.0;
    bool _1041 = !_1027;
    float _1043 = _1037;
    if (!_1041)
    {
        float _1045 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1047 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1049 = _1025 + _1047;
        float _1051 = _972 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1053 = _1049 * _1045;
        float _1055 = rsqrt(_1023);
        float _1057 = _1053 * 0.15915493667125701904296875;
        float _1059 = _1057 * 6.283185482025146484375;
        float _1061 = cos(_1059);
        float _1063 = _1057 * 6.283185482025146484375;
        float _1065 = sin(_1063);
        float _1067 = _1061 + (-1.0);
        float _1069 = _1067 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1071 = fma(_1065, _1051, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1073 = fma(_1061, _972, _1069);
        float _1075 = _1055 * _1071;
        float _1077 = fma(_1019, _1075, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1079 = fma(_1015, _1075, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1043 = _1073;
        _1031 = _1077;
        _1033 = _1079;
    }
    float _1081 = _1043;
    float _1083 = _1031;
    float _1085 = _1033;
    float _1087 = _993 * 2.0;
    float _1089 = _999 * _1039;
    float _1091 = _993 * _993;
    float _1093 = _1005 * _1039;
    float _1095 = _999 * _999;
    float _1097 = _993 * _1039;
    float _1099 = _999 * 2.0;
    float _1101 = fma(_1005, _1087, _1089);
    float _1103 = -_1093;
    float _1105 = fma(_999, _1087, _1103);
    float _1107 = fma(_999, _1087, _1093);
    float _1109 = fma(_1091, -2.0, 1.0);
    float _1111 = -_1089;
    float _1113 = fma(_1005, _1087, _1111);
    float _1115 = _1005 * _1005;
    float _1117 = fma(_1095, -2.0, 1.0);
    float _1119 = -_1097;
    float _1121 = fma(_1005, _1099, _1119);
    float _1123 = fma(_1005, _1099, _1097);
    float _1125 = _792 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1127 = _792 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1129 = fma(_1115, -2.0, _1117);
    float _1131 = fma(_1115, -2.0, _1109);
    float _1133 = fma(_1095, -2.0, _1109);
    float _1135 = _980 * 2000.0;
    float _1137 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1125);
    float _1139 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1127);
    float _1141 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1137);
    bool _1143 = _792 >= _1135;
    bool _1145 = isnan(_792);
    bool _1147 = _1143 || _1145;
    bool _1149 = isnan(_1135);
    bool _1151 = _1147 || _1149;
    float _1153 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1139);
    float _1155 = _1141 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1157 = _1153 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1159 = _1157 + _1155;
    float _1161 = 1.0 / _1155;
    float _1163 = _1157;
    float _1165 = _1083;
    float _1167 = _1141;
    float _1169 = _1085;
    if (_1151)
    {
        _1163 = _1081;
    }
    float _1171 = _1163;
    float _1173 = _1171;
    if (!_1151)
    {
        _1173 = 0.0;
    }
    float _1175 = _1173;
    if (!_1151)
    {
        _1165 = 0.0;
    }
    float _1177 = _1165;
    if (!_1151)
    {
        _1167 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1179 = _1167;
    float _1181 = -_792;
    float _1183 = _1181 + _1175;
    float _1185 = -_790;
    float _1187 = _1185 + _1177;
    float _1189 = _1183 * _308;
    bool _1191 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1193 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1195 = _1191 || _1193;
    bool _1197 = isnan(0.5);
    bool _1199 = _1195 || _1197;
    if (!_1151)
    {
        float _1201 = _1179 * 5.0;
        _1169 = _1201;
    }
    float _1203 = _1169;
    float _1205 = _1183 * _276;
    float _1207 = _1159 * _1161;
    float _1209 = _1207 * 0.5;
    float _1211 = fma(_1187, _304, _1189);
    float _1213 = -_794;
    float _1215 = _1213 + _1203;
    float _1217 = _1183 * _322;
    float _1219 = fma(_1187, _272, _1205);
    float _1221 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1223 = fma(_1209, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1221);
    float _1225 = fma(_1215, _312, _1211);
    bool _1227 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1229 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1231 = _1227 || _1229;
    bool _1233 = isnan(0.5);
    bool _1235 = _1231 || _1233;
    float _1237 = fma(_1187, _316, _1217);
    float _1239 = fma(_1215, _280, _1219);
    float _1241 = _1225 * _1105;
    float _1243 = _1225 * _1131;
    float _1245 = _1225 * _1123;
    float _1247 = 1.0 / _1223;
    float _1249 = fma(_1215, _326, _1237);
    float _1251 = fma(_1239, _1129, _1241);
    float _1253 = fma(_1239, _1107, _1243);
    float _1255 = fma(_1239, _1113, _1245);
    float _1257 = fma(_1249, _1101, _1251);
    float _1259 = fma(_1249, _1121, _1253);
    float _1261 = fma(_1249, _1133, _1255);
    float _1263 = _1249;
    float _1265 = _1237;
    float _1267 = _1255;
    float _1269 = _1261;
    if (_1235)
    {
        _318 = 1.0;
    }
    float _1271 = _318;
    float _1273 = _790 + _1257;
    float _1275 = _792 + _1259;
    float _1277 = _794 + _1261;
    float _1279 = _1275;
    float _1281 = _1273;
    float _1283 = _1277;
    float _1285 = _1247;
    float _1287 = _1271;
    if (!_1199)
    {
        float _1289 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1291 = _792 + _1289;
        float _1293 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1295 = _790 + _1293;
        float _1297 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1299 = _1291 * _1291;
        float _1301 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1303 = _794 + _1301;
        float _1305 = fma(_1295, _1295, _1299);
        float _1307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1309 = fma(_1303, _1303, _1305);
        float _1311 = sqrt(_1309);
        float _1313 = _1297 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1315 = precise::min(_1311, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1317 = _1315 * _1307;
        float _1319 = _1313 * _1317;
        float _1321 = fma(_1259, _1319, _792);
        float _1323 = fma(_1257, _1319, _790);
        float _1325 = fma(_1261, _1319, _794);
        _1263 = _1307;
        _1279 = _1321;
        _1281 = _1323;
        _1283 = _1325;
    }
    float _1327 = _1263;
    float _1329 = _1279;
    float _1331 = _1281;
    float _1333 = _1283;
    float _1335 = _1327;
    if (_1235)
    {
        _1265 = 1.0;
    }
    float _1337 = _1265;
    float _1339 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1341 = _1247 * _1339;
    float _1343 = _1337;
    if (!_1235)
    {
        float _1345 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1347 = _1345 * 0.15915493667125701904296875;
        float _1349 = _1347 * 6.283185482025146484375;
        float _1351 = cos(_1349);
        float _1353 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1355 = _1353 * 0.15915493667125701904296875;
        float _1357 = _1347 * 6.283185482025146484375;
        float _1359 = sin(_1357);
        float _1361 = 1.0 / _1351;
        float _1363 = _1355 * 6.283185482025146484375;
        float _1365 = cos(_1363);
        float _1367 = _1359 * _1361;
        float _1369 = _1355 * 6.283185482025146484375;
        float _1371 = sin(_1369);
        float _1373 = _1365 * _1367;
        float _1375 = 1.0 / _1373;
        float _1377 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1379 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1377;
        float _1381 = 1.0 / _1379;
        float _1383 = _1371 * _1375;
        float _1385 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1387 = fma(_1341, _1383, _1385);
        float _1389 = _1387 * _1381;
        float _1391 = precise::clamp(_1389, 0.0, 1.0);
        _1267 = _1387;
        _1335 = _1361;
        _1285 = _1371;
        _1269 = _1355;
        _1287 = _1391;
    }
    float _1393 = _1267;
    float _1395 = _1335;
    float _1397 = _1285;
    float _1399 = _1269;
    float _1401 = _1287;
    float _1403 = _1395;
    float _1405 = _1397;
    float _1407 = _1393;
    float _1409 = _1399;
    if (!_1235)
    {
        float _1411 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1413 = _1411 * 0.15915493667125701904296875;
        float _1415 = _1413 * 6.283185482025146484375;
        float _1417 = cos(_1415);
        float _1419 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1421 = _1419 * 0.15915493667125701904296875;
        float _1423 = _1413 * 6.283185482025146484375;
        float _1425 = sin(_1423);
        float _1427 = 1.0 / _1417;
        float _1429 = _1421 * 6.283185482025146484375;
        float _1431 = cos(_1429);
        float _1433 = _1425 * _1427;
        float _1435 = _1421 * 6.283185482025146484375;
        float _1437 = sin(_1435);
        float _1439 = _1431 * _1433;
        float _1441 = 1.0 / _1439;
        float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1445 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1443;
        float _1447 = 1.0 / _1445;
        float _1449 = _1437 * _1441;
        float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1453 = fma(_1341, _1449, _1451);
        float _1455 = _1453 * _1447;
        float _1457 = precise::clamp(_1455, 0.0, 1.0);
        float _1459 = -_1457;
        float _1461 = _1459 + 1.0;
        _1403 = _1449;
        _1405 = _1445;
        _1407 = _1439;
        _1409 = _1441;
        _1343 = _1461;
    }
    float _1463 = _1403;
    float _1465 = _1405;
    float _1467 = _1407;
    float _1469 = _1409;
    float _1471 = _1343;
    float _1473 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1475 = _1329 + _1473;
    float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1479 = _1331 + _1477;
    float _1481 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1483 = _1333 + _1481;
    float _1485 = _1475 * _1475;
    float _1487 = fma(_1479, _1479, _1485);
    float _1489 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1491 = fma(_1483, _1483, _1487);
    float _1493 = rsqrt(_1491);
    float _1495 = sqrt(_1491);
    float _1497 = _1479 * _1493;
    float _1499 = _1483 * _1493;
    float _1501 = _1475 * _1493;
    float _1503 = _1497 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1505 = _1499 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1507 = _1503 * _1503;
    float _1509 = _1505 * _1505;
    float _1511 = _1507 + _1509;
    float _1513 = sqrt(_1511);
    bool _1515 = _1513 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1517 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1519 = _1513 + _1517;
    float _1521 = _1463;
    float _1523 = _1469;
    float _1525 = _1519;
    float _1527 = _1467;
    float _1529 = _1503;
    float _1531 = 0.0187292993068695068359375;
    if (_1515)
    {
        float _1533 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1521 = _1533;
    }
    float _1535 = _1521;
    if (_1515)
    {
        float _1537 = rsqrt(_1511);
        _1523 = _1537;
    }
    float _1539 = _1523;
    float _1541 = _1539;
    if (_1515)
    {
        float _1543 = _1519 * _1535;
        _1525 = _1543;
    }
    float _1545 = _1525;
    if (_1515)
    {
        float _1547 = _1545 * 0.15915493667125701904296875;
        _1527 = _1547;
    }
    float _1549 = _1527;
    float _1551 = _1465;
    if (_1515)
    {
        float _1553 = _1549 * 6.283185482025146484375;
        float _1555 = sin(_1553);
        _1551 = _1555;
    }
    float _1557 = _1551;
    float _1559 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1561 = precise::max(0.0, _1559);
    float _1563 = _1535;
    float _1565 = _1561;
    float _1567 = _1559;
    if (_1515)
    {
        float _1569 = _1549 * 6.283185482025146484375;
        float _1571 = cos(_1569);
        _1563 = _1571;
    }
    float _1573 = _1563;
    float _1575 = -_1501;
    float _1577 = -_1561;
    float _1579 = fma(_1575, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1577);
    if (_1515)
    {
        float _1581 = _1579 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1565 = _1581;
    }
    float _1583 = _1565;
    float _1585 = _1583;
    float _1587 = _1557;
    if (_1515)
    {
        float _1589 = fma(_1557, _1583, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1585 = _1589;
    }
    float _1591 = _1585;
    float _1593 = _1591;
    if (!_1515)
    {
        _1587 = _1579;
    }
    float _1595 = _1587;
    float _1597 = _1595;
    float _1599 = _1573;
    if (_1515)
    {
        float _1601 = _1573 + (-1.0);
        _1567 = _1601;
    }
    float _1603 = _1567;
    float _1605 = 0.0;
    float _1607 = _1603;
    if (_1515)
    {
        float _1609 = _1539 * _1591;
        _1605 = _1609;
    }
    float _1611 = _1605;
    if (!_1515)
    {
        _1593 = _1507;
    }
    float _1613 = _1593;
    float _1615 = _1613;
    if (_1515)
    {
        float _1617 = _1603 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1541 = _1617;
    }
    float _1619 = _1541;
    if (_1515)
    {
        float _1621 = _1503 * _1611;
        _1529 = _1621;
    }
    float _1623 = _1529;
    if (!_1515)
    {
        _1607 = _1505;
    }
    float _1625 = _1607;
    float _1627 = _1625;
    if (_1515)
    {
        float _1629 = _1505 * _1611;
        _1627 = _1629;
    }
    float _1631 = _1627;
    if (_1515)
    {
        float _1633 = fma(_1579, _1573, _1619);
        _1597 = _1633;
    }
    float _1635 = _1597;
    if (_1515)
    {
        float _1637 = _1623 * _1623;
        _1615 = _1637;
    }
    float _1639 = _1615;
    if (!_1515)
    {
        _1599 = _1509;
    }
    float _1641 = _1599;
    float _1643 = _1641;
    if (_1515)
    {
        float _1645 = _1631 * _1631;
        _1643 = _1645;
    }
    float _1647 = _1643;
    float _1649 = _1329 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1651 = fma(_1635, _1635, _1639);
    float _1653 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1649);
    float _1655 = _1651 + _1647;
    float _1657 = _1329 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1659 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1661 = fma(_1495, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1659);
    float _1663 = precise::clamp(_1661, 0.0, 1.0);
    float _1665 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1653);
    float _1667 = rsqrt(_1655);
    float _1669 = _1329 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1671 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1657);
    float _1673 = -_1663;
    float _1675 = _1673 + 1.0;
    float _1677 = _1329 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1679 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1669);
    float _1681 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1671);
    float _1683 = _1665 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1685 = fma(_1331, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1677);
    float _1687 = abs(_1675);
    float _1689 = log2(_1687);
    float _1691 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1679);
    float _1693 = _1681 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1695 = _1683 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1697 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1685);
    float _1699 = _1691 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1701 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1703 = _1667 * _1623;
    float _1705 = -_1695;
    float _1707 = fma(_1705, _1489, 1.0);
    float _1709 = _1667 * _1631;
    float _1711 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1701);
    float _1713 = _1667 * _1635;
    float _1715 = _1703 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1717 = _1697 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1719 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1711);
    float _1721 = log2(_1707);
    float _1723 = -_1715;
    float _1725 = fma(_1713, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1723);
    float _1727 = _1689 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1729 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1719);
    float _1731 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1733 = -_1709;
    float _1735 = fma(_1733, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1725);
    float _1737 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1739 = exp2(_1727);
    float _1741 = fma(_1735, -0.5, 0.5);
    float _1743 = fma(_1735, 0.5, 0.5);
    float _1745 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1737);
    float _1747 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1731);
    float _1749 = _1713 + 1.0;
    float _1751 = fma(_1743, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1753 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1745);
    float _1755 = 1.0 / _1729;
    float _1757 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1747);
    float _1759 = fma(_1743, _1751, -0.212114393711090087890625);
    float _1761 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1753);
    float _1763 = _1721 * 0.693147182464599609375;
    float _1765 = fma(_1743, _1759, 1.570728778839111328125);
    float _1767 = sqrt(_1741);
    float _1769 = -_1713;
    float _1771 = fma(_1739, _1749, _1769);
    float _1773 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1757);
    float _1775 = _1763 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1777 = fma(_1771, 0.5, 0.5);
    float _1779 = _1761 * _1755;
    float _1781 = _1773 * _1755;
    float _1783 = fma(_1779, 0.5, 0.5);
    float _1785 = fma(_1781, -0.5, 0.5);
    float _1787 = _1767 * 0.636619746685028076171875;
    float3 _5021 = float3(_1783, _1785, _1775);
    float _1789 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5021, float3(0.0), isnan(_5021)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5021, float3(0.0), isnan(_5021)), level(0.0)).x;
    float3 _5032 = float3(_1783, _1785, _1775);
    float4 _1792 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5032, float3(0.0), isnan(_5032)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5032, float3(0.0), isnan(_5032)), level(0.0)).xyzw;
    float _1794 = _1792.x;
    float _1796 = _1792.y;
    float _1798 = _1792.z;
    float _1800 = _1792.w;
    float _1802 = -_1765;
    float _1804 = fma(_1787, _1802, 1.0);
    float2 _5053 = float2(_1804, _1777);
    float3 _1808 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5053, float2(0.0), isnan(_5053)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5053, float2(0.0), isnan(_5053)), level(0.0)).xyz;
    float _1810 = _1808.x;
    float _1812 = _1808.y;
    float _1814 = _1808.z;
    float _1816 = _788 * _1105;
    float _1818 = _788 * _1123;
    float _1820 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    bool _1822 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1824 = isnan(0.0);
    bool _1826 = _1822 || _1824;
    bool _1828 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1830 = _1826 || _1828;
    float _1832 = _1729;
    float _1834 = _1773;
    if (!_1151)
    {
        _1035 = 0.0;
    }
    float _1836 = _1035;
    float _1838 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1840 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1838);
    float _1842 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1844 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1842);
    float _1846 = fma(_784, _1129, _1816);
    float _1848 = fma(_784, _1113, _1818);
    float _1850 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1840);
    float _1852 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1844);
    float _1854 = fma(_748, _1101, _1846);
    out.m_83.x = _1331;
    out.m_83.y = _1329;
    out.m_83.z = _1333;
    float _1856 = _790 + _1850;
    float _1858 = _794 + _1852;
    if (_1830)
    {
        float _1860 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _1531 = _1860;
    }
    float _1862 = _1531;
    float _1864 = _1862;
    if (!_1830)
    {
        _824 = 1.0;
    }
    float _1866 = _824;
    float _1868 = -_1856;
    float _1870 = _1868 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1872 = -_1858;
    float _1874 = _1872 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1876 = _1495 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1878 = isnan(_1495);
    bool _1880 = _1876 || _1878;
    bool _1882 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1884 = _1880 || _1882;
    float _1886 = _1866;
    if (_1830)
    {
        float _1888 = precise::min(_1862, 20.0);
        _1864 = _1888;
    }
    float _1890 = _1864;
    float _1892 = precise::min(_1858, _1874);
    float _1894 = _1689 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1896 = precise::min(_1856, _1870);
    float _1898 = _1693 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1900 = _1890;
    if (_1830)
    {
        float _1902 = 1.0 / _1890;
        _1900 = _1902;
    }
    float _1904 = _1900;
    float _1906 = precise::min(_1896, _1892);
    float _1908 = fma(_1699, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1898);
    float _1910 = _788 * _1131;
    float _1912 = exp2(_1894);
    float _1914 = fma(_784, _1107, _1910);
    float _1916 = fma(_748, _1121, _1914);
    float _1918 = fma(_748, _1133, _1848);
    float _1920 = _1401 * _1471;
    float _1922 = _1761;
    if (_1830)
    {
        float _1924 = _1906 * _1904;
        float _1926 = precise::clamp(_1924, 0.0, 1.0);
        _1886 = _1926;
    }
    float _1928 = _1886;
    float _1930 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1908);
    out.m_85.x = _1854;
    out.m_85.y = _1916;
    out.m_85.z = _1918;
    float _1932 = _1836 * _1928;
    float _1934 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1930);
    float _1936 = -_1912;
    float _1938 = _1936 + 1.0;
    float _1940 = _1934 + _1729;
    float _1942 = _1932 * _1920;
    out.gl_Position.x = _1761;
    out.gl_Position.y = _1773;
    out.gl_Position.z = _1934;
    out.gl_Position.w = _1729;
    float _1944 = _1938 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1946 = _1940 * 0.5;
    float _1948 = -_1944;
    float _1950 = _1948 + 1.0;
    out.m_87.z = _1946;
    out.m_87.w = _1729;
    float _1952 = _1934;
    float _1954 = _1942;
    if (!_1884)
    {
        _1832 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1956 = _1832;
    float _1958 = _1956;
    float _1960 = _1956;
    if (!_1884)
    {
        _1952 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1962 = _1952;
    float _1964 = _1962;
    float _1966 = _1962;
    if (!_1884)
    {
        _1834 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1968 = _1834;
    float _1970 = _1968;
    float _1972 = _1968;
    if (!_1884)
    {
        _1922 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1974 = _1922;
    float _1976 = _1944 * _1789;
    float _1978 = _1800 * _1950;
    float _1980 = _1800 * _1976;
    float _1982 = _1814 * _1976;
    float _1984 = fma(_1810, _1980, _1794);
    float _1986 = fma(_1812, _1980, _1796);
    float _1988 = _1794;
    float _1990 = _1974;
    float _1992 = _1974;
    if (!_1884)
    {
        _1988 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1994 = _1988;
    float _1996 = fma(_1800, _1982, _1798);
    float _1998 = _1942 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2000 = _1994;
    float _2002 = _1994;
    if (!_1884)
    {
        _1954 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2004 = _1954;
    out.m_89.x = _1984;
    out.m_89.y = _1986;
    out.m_89.z = _1996;
    out.m_89.w = _1978;
    bool _2006 = !_1884;
    float _2008 = _2004;
    float _2010 = _2004;
    if (!_2006)
    {
        bool _2012 = _1495 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2014 = isnan(_1495);
        bool _2016 = _2012 || _2014;
        bool _2018 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2020 = _2016 || _2018;
        if (!_2020)
        {
            float _2022 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2024 = _1495 + _2022;
            float _2026 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2028 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2026;
            float _2030 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2032 = _2030 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2034 = 1.0 / _2028;
            float _2036 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2038 = _2036 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2040 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2042 = _2040 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2044 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2046 = _2044 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2048 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2050 = _2048 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2052 = _2024 * _2034;
            float _2054 = precise::clamp(_2052, 0.0, 1.0);
            float _2056 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2058 = _2056 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2060 = fma(_2054, _2032, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2062 = fma(_2054, _2058, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2064 = fma(_2054, _2038, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2066 = fma(_2054, _2042, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2068 = fma(_2054, _2046, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2070 = fma(_2054, _2050, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1960 = _2064;
            _1992 = _2068;
            _2002 = _2060;
            _1972 = _2066;
            _1966 = _2062;
            _2010 = _2070;
            _2072 = true;
        }
        else
        {
            bool _2074 = _1495 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2076 = isnan(_1495);
            bool _2078 = _2074 || _2076;
            bool _2080 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2082 = _2078 || _2080;
            if (!_2082)
            {
                _2000 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2084 = _2000;
            _2002 = _2084;
            if (!_2082)
            {
                _1958 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2086 = _1958;
            _1960 = _2086;
            if (!_2082)
            {
                _1964 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2088 = _1964;
            _1966 = _2088;
            if (!_2082)
            {
                _1970 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2090 = _1970;
            _1972 = _2090;
            if (!_2082)
            {
                _1990 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2092 = _1990;
            _1992 = _2092;
            if (!_2082)
            {
                _2008 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2094 = _2008;
            bool _2096 = !_2082;
            _2010 = _2094;
            if (!_2096)
            {
                bool _2098 = _1495 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2100 = isnan(_1495);
                bool _2102 = _2098 || _2100;
                bool _2104 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2106 = _2102 || _2104;
                if (!_2106)
                {
                    float _2108 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2110 = _1495 + _2108;
                    float _2112 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2114 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2112;
                    float _2116 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2118 = _2116 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2120 = 1.0 / _2114;
                    float _2122 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2124 = _2122 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2126 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2128 = _2126 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2130 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2132 = _2130 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2134 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2136 = _2134 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2138 = _2110 * _2120;
                    float _2140 = precise::clamp(_2138, 0.0, 1.0);
                    float _2142 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2144 = _2142 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2146 = fma(_2140, _2118, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2148 = fma(_2140, _2144, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2150 = fma(_2140, _2124, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2152 = fma(_2140, _2128, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2154 = fma(_2140, _2132, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2156 = fma(_2140, _2136, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1960 = _2150;
                    _1992 = _2154;
                    _2002 = _2146;
                    _1972 = _2152;
                    _1966 = _2148;
                    _2010 = _2156;
                    _2072 = true;
                }
                else
                {
                    _1960 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1992 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2002 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1972 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1966 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2010 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2072 = false;
    float _2158 = _1960;
    float _2160 = _1992;
    float _2162 = _2002;
    float _2164 = _1972;
    float _2166 = _1966;
    float _2168 = _2010;
    float _2170 = _1998 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2172 = fma(_1916, -0.5, 0.5);
    float _2174 = precise::clamp(_2172, 0.0, 1.0);
    float _2176 = -_2158;
    float _2178 = _2176 + _2160;
    float _2180 = -_2162;
    float _2182 = _2180 + _2164;
    out.m_58.x = _2170;
    float _2184 = fma(_2174, _2178, _2158);
    float _2186 = -_2166;
    float _2188 = _2186 + _2168;
    float _2190 = fma(_2174, _2182, _2162);
    float _2192 = _2184 * 0.586610972881317138671875;
    bool _2194 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2196 = fma(_2174, _2188, _2166);
    out.m_91.x = 0.0;
    float _2198 = fma(_2190, 0.298911988735198974609375, _2192);
    bool _2200 = _1401 > 0.0;
    bool _2202 = isnan(_1401);
    bool _2204 = _2200 || _2202;
    bool _2206 = isnan(0.0);
    bool _2208 = _2204 || _2206;
    out.m_93.x = 0.0;
    float _2210 = fma(_2196, 0.114477999508380889892578125, _2198);
    bool _2212 = _1471 <= 0.0;
    bool _2214 = !_2208;
    bool _2216 = _2212 || _2214;
    float _2218 = -_2210;
    float _2220 = _2190 + _2218;
    float _2222 = -_2210;
    float _2224 = _2184 + _2222;
    float _2226 = -_2210;
    float _2228 = _2196 + _2226;
    float _2230 = fma(_2220, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2210);
    float _2232 = fma(_2224, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2210);
    float _2234 = fma(_2228, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2210);
    bool _2236 = !_2194;
    if (!_2236)
    {
        float _2238 = -_1329;
        float _2240 = _2238 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2242 = -_1331;
        float _2244 = _2242 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2246 = -_1333;
        float _2248 = _2246 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2250 = _2240 * _2240;
        float _2252 = fma(_2244, _2244, _2250);
        float _2254 = fma(_2248, _2248, _2252);
        float _2256 = rsqrt(_2254);
        float _2258 = _2240 * _2256;
        float _2260 = _2244 * _2256;
        float _2262 = _2248 * _2256;
        float _2264 = sqrt(_2254);
        float _2266 = -_1501;
        float _2268 = _2266 + _2258;
        float _2270 = -_1497;
        float _2272 = _2270 + _2260;
        float _2274 = -_1499;
        float _2276 = _2274 + _2262;
        float _2278 = _2268 * _2268;
        float _2280 = fma(_2272, _2272, _2278);
        float _2282 = fma(_2276, _2276, _2280);
        float _2284 = -_2264;
        float _2286 = _2284 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2288 = rsqrt(_2282);
        float _2290 = _2286 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2292 = precise::clamp(_2290, 0.0, 1.0);
        float _2294 = abs(_2292);
        float _2296 = log2(_2294);
        float _2298 = _2268 * _2288;
        float _2300 = _2272 * _2288;
        float _2302 = _2276 * _2288;
        float _2304 = _1916 * _2298;
        float _2306 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _2308 = precise::clamp(_2306, 0.0, 1.0);
        float _2310 = _1916 * _2258;
        float _2312 = fma(_1854, _2300, _2304);
        float _2314 = _2308 * _2308;
        float _2316 = _2296 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2318 = fma(_1854, _2260, _2310);
        float _2320 = fma(_1918, _2302, _2312);
        float _2322 = precise::clamp(_2320, 0.0, 1.0);
        float _2324 = _2314 + (-1.0);
        float _2326 = fma(_1918, _2262, _2318);
        float _2328 = precise::clamp(_2326, 0.0, 1.0);
        float _2330 = _2322 * _2322;
        float _2332 = _2260 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2334 = exp2(_2316);
        float _2336 = fma(_2330, _2324, 1.0);
        float _2338 = -_2258;
        float _2340 = -_2332;
        float _2342 = fma(_2338, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2340);
        float _2344 = _2336 * _2336;
        float _2346 = -_2262;
        float _2348 = fma(_2346, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2342);
        float _2350 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2352 = _2348 + _2350;
        float _2354 = 1.0 / _2344;
        float _2356 = _2352 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2358 = precise::clamp(_2356, 0.0, 1.0);
        float _2360 = _2334 * _2358;
        float _2362 = _2328 * _2360;
        float _2364 = _2362 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2366 = _2314 * _2354;
        float _2368 = _2362 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2370 = _2362 * _2366;
        float _2372 = _2362 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _2374 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2376 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2378 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _2364;
        out.m_91.y = _2368;
        out.m_91.z = _2372;
        out.m_93.x = _2374;
        out.m_93.y = _2376;
        out.m_93.z = _2378;
    }
    out.m_95.x = _2230;
    out.m_95.y = _2232;
    out.m_95.z = _2234;
    if (!_2216)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_58.x = 0.0;
    float _2380 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2380;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

