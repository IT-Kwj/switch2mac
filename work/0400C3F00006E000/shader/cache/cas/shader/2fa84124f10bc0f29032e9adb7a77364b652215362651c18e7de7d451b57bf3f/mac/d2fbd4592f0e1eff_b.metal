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
    constant _16* vp_c13 [[id(5)]];
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
    float4 m_87 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_95 [[user(locn3)]];
    float4 m_77 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_83 [[user(locn7)]];
    float4 m_89 [[user(locn8)]];
    float4 m_85 [[user(locn9)]];
    float4 m_73 [[user(locn10)]];
    float4 m_71 [[user(locn11)]];
    float4 m_93 [[user(locn12)]];
    float4 m_91 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_51 [[attribute(2)]];
    float4 m_55 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_75 [[attribute(7)]];
    float4 m_63 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
    float4 m_65 [[attribute(11)]];
    float4 m_69 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3155 = false;
    bool _992 = false;
    bool _780 = false;
    bool _498 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_44.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    float _122 = as_type<float>(_114);
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _120;
    if (!_118)
    {
        out.m_47.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _124 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3461 = as_type<float>(_130);
        out.gl_Position.z = _3461;
    }
    if (!_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_49.w;
    float _136 = float(_114);
    float _138 = -_134;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_134);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    bool _152 = _140 >= _136;
    bool _154 = !_150;
    bool _156 = _152 || _154;
    float _158 = _140;
    if (_156)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _122;
    if (_156)
    {
        out.m_47.x = 0.0;
    }
    if (_156)
    {
        float _162 = _160 * 5.0;
        _132 = as_type<int>(_162);
    }
    int _164 = _132;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3525 = as_type<float>(_164);
        out.gl_Position.z = _3525;
    }
    if (_156)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _166 = in.m_51.x;
    float _168 = in.m_51.y;
    float _170 = in.m_51.z;
    float _172 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _174 = in.m_53.x;
    float _176 = in.m_53.y;
    float _178 = in.m_53.z;
    bool _180 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _182 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _184 = _180 || _182;
    bool _186 = isnan(1.0);
    bool _188 = _184 || _186;
    float _190 = in.m_55.x;
    float _192 = in.m_55.y;
    float _194 = in.m_55.z;
    float _196 = in.m_57.w;
    float _198 = in.m_49.x;
    float _200 = in.m_49.y;
    float _202 = in.m_49.z;
    float _204 = _166 * _166;
    float _206 = _168 * _168;
    float _208 = _170 * _170;
    float _210 = fma(_174, _174, _204);
    float _212 = fma(_176, _176, _206);
    float _214 = fma(_178, _178, _208);
    float _216 = fma(_190, _190, _210);
    float _218 = fma(_192, _192, _212);
    float _220 = fma(_194, _194, _214);
    float _222 = sqrt(_216);
    float _224 = sqrt(_218);
    float _226 = sqrt(_220);
    bool _228 = _222 > 0.0;
    bool _230 = _224 > 0.0;
    float _232 = 0.0;
    float _234 = _216;
    float _236 = _218;
    float _238 = _220;
    float _240 = _178;
    float _242 = _174;
    if (_228)
    {
        float _244 = rsqrt(_216);
        _232 = _244;
    }
    float _246 = _232;
    float _248 = 0.0;
    float _250 = 0.0;
    if (!_228)
    {
        _248 = 0.0;
        _250 = 0.0;
    }
    float _252 = _248;
    float _254 = _250;
    bool _256 = _226 > 0.0;
    float _258 = in.m_44.x;
    float _260 = in.m_44.y;
    float _262 = in.m_44.z;
    float _264 = 0.0;
    float _266 = _252;
    float _268 = _254;
    if (!_228)
    {
        _264 = 0.0;
    }
    float _270 = _264;
    float _272 = 0.0;
    float _274 = 0.0;
    float _276 = _270;
    if (!_230)
    {
        _272 = 0.0;
        _274 = 0.0;
    }
    float _278 = _272;
    float _280 = _274;
    float _282 = 0.0;
    float _284 = _280;
    float _286 = _278;
    if (_230)
    {
        float _288 = rsqrt(_218);
        _282 = _288;
    }
    float _290 = _282;
    if (!_188)
    {
        float _292 = _172 * _172;
        float _294 = _292 * 0.5;
        _234 = _294;
    }
    float _296 = _234;
    float _298 = 0.0;
    float _300 = _296;
    if (!_230)
    {
        _298 = 0.0;
    }
    float _302 = _298;
    float _304 = _302;
    if (!_188)
    {
        float _306 = _296 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _300 = _306;
    }
    float _308 = _300;
    float _310 = 0.0;
    float _312 = _308;
    if (_256)
    {
        float _314 = rsqrt(_220);
        _310 = _314;
    }
    float _316 = _310;
    if (_228)
    {
        float _318 = _246 * _174;
        _276 = _318;
    }
    float _320 = _276;
    if (_228)
    {
        float _322 = _246 * _166;
        _266 = _322;
    }
    float _324 = _266;
    if (_228)
    {
        float _326 = _246 * _190;
        _268 = _326;
    }
    float _328 = _268;
    if (!_256)
    {
        _236 = 0.0;
    }
    float _330 = _236;
    float _332 = _330;
    if (_230)
    {
        float _334 = _290 * _176;
        _284 = _334;
    }
    float _336 = _284;
    if (_230)
    {
        float _338 = _290 * _168;
        _286 = _338;
    }
    float _340 = _286;
    if (_230)
    {
        float _342 = _290 * _192;
        _304 = _342;
    }
    float _344 = _304;
    bool _346 = !_188;
    if (!_346)
    {
        float _348 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _350 = log2(_348);
        float _352 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _354 = _352 + 1.0;
        float _356 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _358 = _172 * _350;
        float _360 = 1.0 / _354;
        float _362 = _356 * 0.693147182464599609375;
        float _364 = exp2(_358);
        float _366 = 1.0 / _362;
        float _368 = _364 + (-1.0);
        float _370 = -_368;
        float _372 = fma(_370, _366, _172);
        float _374 = _372 * _360;
        float _376 = _374 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _312 = _376;
        _238 = _362;
    }
    float _378 = _312;
    float _380 = _238;
    float _382 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _384 = 1.0 / _136;
    float _386 = _380;
    float _388 = _378;
    if (_256)
    {
        float _390 = _316 * _170;
        _332 = _390;
    }
    float _392 = _332;
    float _394 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _396 = _382 * _324;
    float _398 = _382 * _340;
    float _400 = _392;
    if (!_256)
    {
        _386 = 0.0;
    }
    float _402 = _386;
    float _404 = _382 * _392;
    float _406 = fma(_394, _320, _396);
    float _408 = _402;
    if (_256)
    {
        float _410 = _316 * _178;
        _408 = _410;
    }
    float _412 = _408;
    float _414 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _416 = fma(_394, _336, _398);
    if (!_256)
    {
        _400 = 0.0;
    }
    float _418 = _400;
    float _420 = _418;
    if (_256)
    {
        float _422 = _316 * _194;
        _420 = _422;
    }
    float _424 = _420;
    float _426 = fma(_394, _412, _404);
    float _428 = fma(_414, _328, _406);
    float _430 = fma(_414, _344, _416);
    if (!_188)
    {
        _388 = _172;
    }
    float _432 = _388;
    bool _434 = !_188;
    float _436 = _432;
    if (!_434)
    {
        float _438 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _440 = log2(_438);
        float _442 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _444 = _442 + 1.0;
        float _446 = 1.0 / _444;
        float _448 = _172 * _440;
        float _450 = exp2(_448);
        float _452 = -_450;
        float _454 = _452 + 1.0;
        float _456 = _454 * _446;
        _436 = _456;
    }
    float _458 = _436;
    bool _460 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _462 = fma(_414, _424, _426);
    float _464 = fma(_458, _198, _428);
    float _466 = fma(_458, _200, _430);
    float _468 = fma(_458, _202, _462);
    float _470 = fma(_464, _196, _258);
    float _472 = fma(_466, _196, _260);
    float _474 = _140 * _384;
    float _476 = fma(_468, _196, _262);
    bool _478 = !_460;
    float _496;
    if (!_478)
    {
        float _480 = in.m_59.x;
        float _482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _484 = _480 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _486 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _488 = _486 * _482;
        float _490 = floor(_488);
        float _492 = -_490;
        float _494 = _488 + _492;
        _496 = _494;
        _498 = true;
    }
    else
    {
        _496 = _474;
    }
    _498 = false;
    float _500 = _496;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _504 = _500 + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _508 = _500 + _506;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _512 = _500 + _510;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _514;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _522;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _530 = 1.0 / _516;
    bool _532 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _534 = isnan(_500);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = 1.0 / _528;
    bool _546 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _548 = isnan(_500);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    bool _558 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _560 = 1.0 / _520;
    float _562 = _504 * _530;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _566 = _500 + _564;
    float _568 = 1.0 / _524;
    float _570 = _566 * _544;
    bool _572 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _574 = isnan(_500);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    bool _584 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _586 = isnan(_500);
    bool _588 = _584 || _586;
    bool _590 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _592 = _588 || _590;
    float _594 = float(_592);
    float _596 = -_582;
    float _598 = _596 + 1.0;
    float _600 = _508 * _560;
    float _602 = -_556;
    float _604 = _602 + 1.0;
    float _606 = _594 * _598;
    float _608 = -_594;
    float _610 = _608 + 1.0;
    float _612 = _582 * _604;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _614;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _618;
    float _622 = _512 * _568;
    bool _624 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _626 = isnan(_500);
    bool _628 = _624 || _626;
    bool _630 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _632 = _628 || _630;
    float _634 = float(_632);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _636;
    float _640 = fma(_616, _562, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _642 = fma(_620, _562, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _648 = -_634;
    float _650 = _648 + 1.0;
    float _652 = _634 * _610;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _658 = fma(_638, _562, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _660 = _542 * _650;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _666 = fma(_646, _600, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _668;
    float _672 = _640 * _660;
    float _674 = _642 * _660;
    float _676 = _658 * _660;
    float _678 = -_542;
    float _680 = _678 + 1.0;
    float _682 = in.m_57.x;
    float _684 = in.m_57.y;
    float _686 = in.m_57.z;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _692;
    float _696 = fma(_656, _600, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _698 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[143].x, _672);
    float _700 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[143].y, _674);
    float _702 = fma(_664, _600, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _704 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[143].z, _676);
    float _706 = fma(_690, _622, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _708 = fma(_670, _622, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _710 = fma(_694, _622, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _712 = fma(_666, _652, _698);
    float _714 = fma(_696, _652, _700);
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _718 = _716 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _722 = _720 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _728 = fma(_702, _652, _704);
    float _730 = fma(_718, _570, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _732 = fma(_722, _570, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _734 = fma(_706, _606, _712);
    float _736 = fma(_708, _606, _714);
    float _738 = fma(_726, _570, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _740 = fma(_710, _606, _728);
    float _742 = fma(_730, _612, _734);
    float _744 = fma(_732, _612, _736);
    float _746 = fma(_738, _612, _740);
    float _748 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[147].x, _742);
    float _750 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[147].y, _744);
    float _752 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[147].z, _746);
    float _754 = _748 * _682;
    float _756 = _750 * _684;
    float _758 = _752 * _686;
    bool _760 = !_558;
    float _778;
    if (!_760)
    {
        float _762 = in.m_59.x;
        float _764 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _766 = _762 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _768 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _770 = _768 * _764;
        float _772 = floor(_770);
        float _774 = -_772;
        float _776 = _770 + _774;
        _778 = _776;
        _780 = true;
    }
    else
    {
        _778 = _474;
    }
    _780 = false;
    float _782 = _778;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _786 = _782 + _784;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _792;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _798 = _796 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _800 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _802 = isnan(_782);
    bool _804 = _800 || _802;
    bool _806 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _808 = _804 || _806;
    float _810 = float(_808);
    float _812 = 1.0 / _790;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _816 = _814 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _818 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _820 = isnan(_782);
    bool _822 = _818 || _820;
    bool _824 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _826 = _822 || _824;
    float _828 = float(_826);
    bool _830 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _832 = 1.0 / _798;
    float _834 = _794 * _812;
    bool _836 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _838 = isnan(_782);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = 1.0 / _816;
    float _850 = -_810;
    float _852 = _850 + 1.0;
    float _854 = fma(_834, _786, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _858 = _856 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _860 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _862 = isnan(_782);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _868 = _864 || _866;
    float _870 = float(_868);
    float _872 = -_846;
    float _874 = _872 + 1.0;
    float _876 = _846 * _852;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _882 = 1.0 / _858;
    float _884 = -_870;
    float _886 = _884 + 1.0;
    float _888 = _828 * _874;
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _890;
    float _894 = _880 * _832;
    float _896 = _810 * _886;
    float _898 = _854 * _888;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _902 = _782 + _900;
    float _904 = -_828;
    float _906 = _904 + 1.0;
    bool _908 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _910 = isnan(_782);
    bool _912 = _908 || _910;
    bool _914 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _916 = _912 || _914;
    float _918 = float(_916);
    float _920 = _892 * _848;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _924 = _922 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _928 = _782 + _926;
    float _930 = fma(_894, _902, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _932 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[115].x, _898);
    float _934 = -_918;
    float _936 = _934 + 1.0;
    float _938 = _924 * _882;
    float _940 = fma(_920, _928, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _944 = _782 + _942;
    float _946 = fma(_930, _876, _932);
    float _948 = _870 * _936;
    float _950 = fma(_938, _944, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _952 = fma(_940, _896, _946);
    float _954 = fma(_950, _948, _952);
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _962 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[119].x, _954);
    float _964 = _958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _966 = _956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _968 = _960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _970 = _962 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _972 = !_830;
    float _990;
    if (!_972)
    {
        float _974 = in.m_59.x;
        float _976 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _978 = _974 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _980 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[14].x, _140);
        float _982 = _980 * _976;
        float _984 = floor(_982);
        float _986 = -_984;
        float _988 = _982 + _986;
        _990 = _988;
        _992 = true;
    }
    else
    {
        _990 = _474;
    }
    _992 = false;
    float _994 = _990;
    float _996 = in.m_59.y;
    float _998 = _472 * _176;
    float _1000 = _472 * _192;
    float _1002 = in.m_59.z;
    float _1004 = in.m_59.w;
    float _1006 = fma(_470, _174, _998);
    int _1008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1010 = _1008 != 0;
    float _1012 = in.m_59.x;
    float _1014 = fma(_470, _190, _1000);
    float _1016 = fma(_476, _178, _1006);
    int _1018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1020 = _1018 != 0;
    int _1022 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1024 = _1022 != 0;
    int _1026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1028 = _1026 != 0;
    float _1030 = in.m_55.w;
    float _1032 = fma(_476, _194, _1014);
    float _1034 = in.m_53.w;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1040 = _996 * 2.0;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    int _1044 = as_type<int>(_994);
    if (!_1010)
    {
        _240 = _996;
    }
    float _1046 = _240;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1050 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1052 = _1002 * 2.0;
    float _1054 = _1046;
    if (!_1010)
    {
        _1042 = _1002;
    }
    float _1056 = _1042;
    float _1058 = floor(_1040);
    float _1060 = _1056;
    if (_1010)
    {
        _1060 = _996;
    }
    float _1062 = _1060;
    if (_1010)
    {
        _1054 = _1012;
    }
    float _1064 = _1054;
    if (_1010)
    {
        _242 = _1012;
    }
    float _1066 = _242;
    float _1068 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1036);
    float _1070 = _1066;
    if (!_1010)
    {
        _1070 = _1002;
    }
    float _1072 = _1070;
    float _1074 = floor(_1052);
    float _1076 = _1016 + _1034;
    float _1078 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1080 = _1072;
    if (!_1010)
    {
        _1080 = _1002;
    }
    float _1082 = _1080;
    float _1084 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1068);
    float _1086 = _1082;
    if (_1010)
    {
        _1086 = _996;
    }
    float _1088 = _1086;
    float _1090 = -_1048;
    float _1092 = fma(_1078, 2.0, _1090);
    bool _1094 = _1058 >= 0.0;
    bool _1096 = isnan(_1058);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan(0.0);
    bool _1102 = _1098 || _1100;
    float _1104 = _1012 * 2.0;
    bool _1106 = _1058 > 0.0;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1110 = floor(_1104);
    int _1112 = _1102 ? 0 : 1;
    float _1114 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1108);
    bool _1116 = _1074 > 0.0;
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1120 = _1074 >= 0.0;
    bool _1122 = isnan(_1074);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    float _1130 = _1032 + _1030;
    float _1132 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1134 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1118);
    int _1136 = _1128 ? 0 : 1;
    float _1138 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1140 = log2(_1138);
    float _1142 = -_1038;
    float _1144 = fma(_1132, 2.0, _1142);
    float _1146 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1148 = _1076 + _1146;
    float _1150 = -_1130;
    float _1152 = _1150 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _1154 = ~_1136;
    int _1156 = _1154 + 1;
    int _1158 = _1156 + 1;
    float _1160 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1114);
    int _1162 = ~_1112;
    int _1164 = _1162 + 1;
    int _1166 = _1164 + 1;
    float _1168 = -_140;
    float _1170 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1144);
    int _1172 = _1158;
    int _1174 = _1166;
    float _1176 = _1152;
    if (!_1116)
    {
        int _1178 = ~_1136;
        int _1180 = _1178 + 1;
        _1172 = _1180;
    }
    int _1182 = _1172;
    float _1184 = _1088 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_1106)
    {
        int _1186 = ~_1112;
        int _1188 = _1186 + 1;
        _1174 = _1188;
    }
    int _1190 = _1174;
    float _1192 = _996 + _1012;
    float _1194 = abs(_1148);
    float _1196 = abs(_1152);
    float _1198 = precise::max(_1194, _1196);
    float _1200 = fma(_1184, -2.0, _1050);
    float _1202 = _1002 + _1012;
    float _1204 = _1140 * _140;
    bool _1206 = _1198 >= 16.0;
    float _1208 = _1192 + (-1.0);
    bool _1210 = !_1020;
    int _1212 = _1210 ? 0 : 1;
    float _1214 = _1202 + (-1.0);
    float _1216 = _1192;
    if (_1010)
    {
        _1216 = _996;
    }
    float _1218 = _1216;
    float _1220 = exp2(_1204);
    float _1222 = _1218;
    if (!_1010)
    {
        _1222 = _1012;
    }
    float _1224 = _1222;
    float _1226 = fma(_1208, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1228 = abs(_1212);
    float _1230 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1234 = _1224 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1236 = float(_1228);
    float _1238 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1134);
    float _1240 = float(_1182);
    float _1242 = fma(_1234, -2.0, _1232);
    float _1244 = -_140;
    float _1246 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1092);
    float _1248 = _1236 * _1240;
    bool _1250 = _1110 > 0.0;
    float _1252 = in.m_61.x;
    float _1254 = in.m_61.y;
    float _1256 = in.m_61.z;
    bool _1258 = _1110 >= 0.0;
    bool _1260 = isnan(_1110);
    bool _1262 = _1258 || _1260;
    bool _1264 = isnan(0.0);
    bool _1266 = _1262 || _1264;
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1270 = 1.0 + _1268;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1274 = !_1028;
    int _1276 = _1274 ? 0 : 1;
    float _1278 = -_1220;
    float _1280 = _1278 + 1.0;
    bool _1282 = !_1024;
    int _1284 = _1282 ? 0 : 1;
    float _1286 = 1.0 / _1270;
    bool _1288 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1290 = isnan(0.0);
    bool _1292 = _1288 || _1290;
    bool _1294 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1296 = _1292 || _1294;
    float _1298 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1272);
    int _1300 = abs(_1276);
    float _1302 = _1248 * (-2.0);
    bool _1304 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1306 = isnan(1.0);
    bool _1308 = _1304 || _1306;
    bool _1310 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1312 = _1308 || _1310;
    float _1314 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1298);
    int _1316 = abs(_1284);
    float _1318 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1242);
    float _1320 = _1296 ? _1280 : 0.0;
    float _1322 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1200);
    int _1324 = _1266 ? 0 : 1;
    float _1326 = _1012 + (-0.5);
    bool _1328 = _1296;
    if (_1206)
    {
        float _1330 = _1152 * 0.0625;
        _1176 = _1330;
    }
    float _1332 = _1176;
    int _1334 = ~_1324;
    int _1336 = _1334 + 1;
    int _1338 = _1336 + 1;
    float _1340 = fma(_1226, _1302, _1226);
    int _1342 = _1338;
    if (!_1250)
    {
        int _1344 = ~_1324;
        int _1346 = _1344 + 1;
        _1342 = _1346;
    }
    int _1348 = _1342;
    float _1350 = _1148 * 0.0625;
    float _1352 = float(_1300);
    if (_1312)
    {
        float _1354 = _1320 * _1286;
        _158 = _1354;
    }
    float _1356 = _158;
    float _1358 = float(_1190);
    float _1360 = fma(_1302, _1252, _1252);
    float _1362 = float(_1348);
    float _1364 = _1352 * _1358;
    float _1366 = _1206 ? _1350 : _1148;
    float _1368 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1360);
    float _1370 = float(_1316);
    float _1372 = _1364 * (-2.0);
    float _1374 = abs(_1366);
    bool _1376 = _1374 != 0.0;
    bool _1378 = isnan(_1374);
    bool _1380 = _1376 || _1378;
    bool _1382 = isnan(0.0);
    bool _1384 = _1380 || _1382;
    float _1386 = fma(_1340, _1356, _1368);
    float _1388 = abs(_1332);
    bool _1390 = _1388 == 0.0;
    float _1392 = _1370 * _1362;
    float _1394 = abs(_1332);
    bool _1396 = _1394 == 0.0;
    bool _1398 = !_1384;
    bool _1400 = _1396 && _1398;
    float _1402 = _996 + _1002;
    float _1404 = _1386 * 0.15915493667125701904296875;
    float _1406 = _1392 * (-2.0);
    float _1408 = _1402 + (-1.0);
    float _1410 = _1404 * 6.283185482025146484375;
    float _1412 = cos(_1410);
    float _1414 = fma(_1230, _1372, _1230);
    float _1416 = fma(_1372, _1256, _1256);
    float _1418 = fma(_1406, _1254, _1254);
    float _1420 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1422 = _996 + (-0.5);
    float _1424 = _1002 + (-0.5);
    int _1426 = as_type<int>(_1424);
    float _1428 = _1356;
    if (_1400)
    {
        bool _1430 = as_type<int>(_1332) >= 0;
        _1328 = _1430;
    }
    bool _1432 = _1328;
    float _1434 = _1404 * 6.283185482025146484375;
    float _1436 = sin(_1434);
    float _1438 = fma(_1420, _1406, _1420);
    float _1440 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1416);
    float _1442 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1418);
    int _1444 = _1432 ? (-1) : 0;
    if (_1400)
    {
        int _1446 = _1432 ? 0 : 1078530011;
        _1426 = _1446;
    }
    int _1448 = _1426;
    float _1450 = fma(_1414, _1356, _1440);
    float _1452 = fma(_1438, _1356, _1442);
    int _1454 = _1448;
    if (_1400)
    {
        int _1456 = int(0x80000000) & as_type<int>(_1366);
        int _1458 = _1448 | _1456;
        _1428 = as_type<float>(_1458);
    }
    float _1460 = _1428;
    bool _1462 = !_1384;
    bool _1464 = _1462 && _1390;
    float _1466 = _1460;
    float _1468 = _1460;
    if (!_1464)
    {
        float _1470 = abs(_1366);
        bool _1472 = _1470 != as_type<float>(0x7f800000u /* inf */);
        bool _1474 = isnan(_1470);
        bool _1476 = _1472 || _1474;
        bool _1478 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1480 = _1476 || _1478;
        float _1482 = abs(_1332);
        bool _1484 = _1482 == as_type<float>(0x7f800000u /* inf */);
        float _1486 = abs(_1332);
        bool _1488 = _1486 == as_type<float>(0x7f800000u /* inf */);
        bool _1490 = !_1480;
        bool _1492 = _1488 && _1490;
        if (_1492)
        {
            bool _1494 = as_type<int>(_1332) >= 0;
            _1444 = _1494 ? (-1) : 0;
        }
        int _1496 = _1444;
        if (_1492)
        {
            _1454 = 1075235812;
        }
        int _1498 = _1454;
        int _1500 = _1498;
        if (_1492)
        {
            int _1502 = ~_1496;
            int _1504 = (_1502 != 0) ? _1498 : 1061752795;
            _1500 = _1504;
        }
        int _1506 = _1500;
        if (_1492)
        {
            int _1508 = int(0x80000000) & as_type<int>(_1366);
            int _1510 = _1506 | _1508;
            _1466 = as_type<float>(_1510);
        }
        float _1512 = _1466;
        bool _1514 = !_1480;
        bool _1516 = _1514 && _1484;
        _1468 = _1512;
        if (!_1516)
        {
            float _1518 = abs(_1366);
            float _1520 = abs(_1332);
            float _1522 = precise::max(_1518, _1520);
            float _1524 = abs(_1366);
            float _1526 = abs(_1332);
            float _1528 = precise::min(_1524, _1526);
            float _1530 = 1.0 / _1522;
            float _1532 = abs(_1366);
            float _1534 = abs(_1332);
            bool _1536 = _1532 > _1534;
            bool _1538 = as_type<int>(_1332) >= 0;
            float _1540 = abs(_1366);
            float _1542 = abs(_1332);
            float _1544 = _1540 + _1542;
            bool _1546 = _1544 > as_type<float>(0x7f800000u /* inf */);
            bool _1548 = isnan(_1544);
            bool _1550 = _1546 || _1548;
            bool _1552 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1554 = _1550 || _1552;
            float _1556 = _1528 * _1530;
            float _1558 = _1556 * _1556;
            float _1560 = _1558 + 11.33538818359375;
            float _1562 = fma(_1558, _1560, 28.84246826171875);
            float _1564 = fma(_1558, _1562, 19.6966705322265625);
            float _1566 = fma(_1558, -0.82336294651031494140625, -5.674867153167724609375);
            float _1568 = fma(_1558, _1566, -6.565555095672607421875);
            float _1570 = 1.0 / _1564;
            float _1572 = _1558 * _1568;
            float _1574 = _1556 * _1572;
            float _1576 = fma(_1574, _1570, _1556);
            int _1578 = as_type<int>(_1366) & int(0x80000000);
            float _1580 = _1576;
            _1468 = _1544;
            if (_1536)
            {
                float _1582 = -_1576;
                float _1584 = _1582 + 1.57079637050628662109375;
                _1580 = _1584;
            }
            float _1586 = _1580;
            int _1588 = as_type<int>(_1586);
            if (!_1538)
            {
                float _1590 = -_1586;
                float _1592 = _1590 + 3.1415927410125732421875;
                _1588 = as_type<int>(_1592);
            }
            int _1594 = _1588;
            if (!_1554)
            {
                int _1596 = _1578 | _1594;
                _1468 = as_type<float>(_1596);
            }
        }
    }
    float _1598 = _1468;
    float _1600 = in.m_63.x;
    float _1602 = in.m_63.y;
    float _1604 = in.m_63.z;
    float _1606 = -_1598;
    float _1608 = _1452 + _1606;
    float _1610 = _1450 * 0.15915493667125701904296875;
    float _1612 = _472 * _168;
    float _1614 = in.m_51.w;
    float _1616 = _1608 * 0.15915493667125701904296875;
    float _1618 = _1610 * 6.283185482025146484375;
    float _1620 = cos(_1618);
    float _1622 = in.m_65.y;
    float _1624 = fma(_470, _166, _1612);
    float _1626 = _756 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1628 = _758 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1630 = _754 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1632 = fma(_476, _170, _1624);
    float _1634 = _1616 * 6.283185482025146484375;
    float _1636 = sin(_1634);
    bool _1638 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1640 = isnan(0.5);
    bool _1642 = _1638 || _1640;
    bool _1644 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1646 = _1642 || _1644;
    bool _1648 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1650 = isnan(0.5);
    bool _1652 = _1648 || _1650;
    bool _1654 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1656 = _1652 || _1654;
    float _1658 = _1616 * 6.283185482025146484375;
    float _1660 = cos(_1658);
    float _1662 = _1436 * _1620;
    float _1664 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1602);
    float _1666 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1600);
    float _1668 = _1664 * _1626;
    float _1670 = _1666 * _1630;
    float _1672 = _1610 * 6.283185482025146484375;
    float _1674 = sin(_1672);
    float _1676 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1604);
    float _1678 = _1412 * _1636;
    float _1680 = _1662 * _1668;
    float _1682 = _1632 + _1614;
    float _1684 = _1676 * _1628;
    float _1686 = -_1622;
    float _1688 = _1686 + 1.0;
    float _1690 = _1436 * _1660;
    float _1692 = _1436 * _1636;
    float _1694 = _1412 * _1660;
    float _1696 = _1660 * _1620;
    float _1698 = _1636 * _1620;
    float _1700 = fma((*spvDescriptorSet0.vp_c9)._m0[193].x, 0.25, _474);
    float _1702 = _1412 * _1620;
    float _1704 = -_1678;
    float _1706 = fma(_1674, _1690, _1704);
    float _1708 = -_1668;
    float _1710 = _1674 * _1708;
    float _1712 = fma(_1674, _1692, _1694);
    float _1714 = fma(_1674, _1694, _1692);
    float _1716 = fma(_1706, _1670, _1680);
    float _1718 = fma(_1696, _1670, _1710);
    float _1720 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1722 = _1688 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _1724 = fma(_1712, _1684, _1716);
    float _1726 = fma(_1698, _1684, _1718);
    float _1728 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1720);
    float _1730 = _1702 * _1668;
    float _1732 = _1130 + _1724;
    float _1734 = _1076 + _1726;
    float _1736 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1728);
    float _1738 = -_1690;
    float _1740 = fma(_1674, _1678, _1738);
    float _1742 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1744 = _1732 + _1742;
    float _1746 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1748 = _1734 + _1746;
    float _1750 = fma(_1714, _1670, _1730);
    float _1752 = _1744 * _1722;
    float _1754 = _1748 * _1722;
    float _1756 = fma(_1740, _1684, _1750);
    float _1758 = fma(_1752, _1700, _1732);
    float _1760 = _1736 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1762 = fma(_1754, _1700, _1734);
    float _1764 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1766 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1768 = _1758 + _1766;
    float _1770 = 1.0 / _1760;
    float _1772 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1774 = _1762 + _1772;
    float _1776 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1764);
    float _1778 = _1768 * _1768;
    float _1780 = _1682 + _1756;
    float _1782 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1776);
    float _1784 = fma(_1774, _1774, _1778);
    float _1786 = _1782 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1788 = sqrt(_1784);
    float _1790 = _1786 + _1760;
    float _1792 = _1790 * _1770;
    float _1794 = _1792 * 0.5;
    float _1796 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1798 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1796);
    float _1800 = 1.0 / _1798;
    bool _1802 = _1788 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1804 = _1730;
    float _1806 = _1756;
    float _1808 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1810 = _1774;
    float _1812 = _1768;
    float _1814 = _1798;
    float _1816 = _1622;
    if (!_1802)
    {
        _1804 = _1762;
    }
    float _1818 = _1804;
    float _1820 = _1818;
    if (!_1802)
    {
        _1806 = _1758;
    }
    float _1822 = _1806;
    float _1824 = _1822;
    if (!_1802)
    {
        _1808 = _1780;
    }
    float _1826 = _1808;
    bool _1828 = !_1802;
    float _1830 = _1826;
    if (!_1828)
    {
        float _1832 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1834 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1836 = _1788 + _1834;
        float _1838 = _1780 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1840 = rsqrt(_1784);
        float _1842 = _1836 * _1832;
        float _1844 = _1842 * 0.15915493667125701904296875;
        float _1846 = _1844 * 6.283185482025146484375;
        float _1848 = cos(_1846);
        float _1850 = _1844 * 6.283185482025146484375;
        float _1852 = sin(_1850);
        float _1854 = _1848 + (-1.0);
        float _1856 = _1854 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1858 = fma(_1852, _1838, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1860 = fma(_1780, _1848, _1856);
        float _1862 = _1840 * _1858;
        float _1864 = fma(_1774, _1862, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1866 = fma(_1768, _1862, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1824 = _1866;
        _1820 = _1864;
        _1830 = _1860;
    }
    float _1868 = _1824;
    float _1870 = _1820;
    float _1872 = _1830;
    float _1874 = _1872;
    float _1876 = _1870;
    float _1878 = _1868;
    if (_1656)
    {
        _1810 = 1.0;
    }
    float _1880 = _1810;
    float _1882 = _1880;
    if (!_1646)
    {
        float _1884 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1886 = _1682 + _1884;
        float _1888 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1890 = -_1130;
        float _1892 = _1890 + _1868;
        float _1894 = _1886 * _1886;
        float _1896 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1898 = _1130 + _1896;
        float _1900 = fma(_1148, _1148, _1894);
        float _1902 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1904 = fma(_1898, _1898, _1900);
        float _1906 = _1888 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1908 = sqrt(_1904);
        float _1910 = precise::min(_1908, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1912 = _1910 * _1902;
        float _1914 = -_1076;
        float _1916 = _1914 + _1870;
        float _1918 = _1906 * _1912;
        float _1920 = -_1682;
        float _1922 = _1920 + _1872;
        float _1924 = fma(_1916, _1918, _1076);
        float _1926 = fma(_1922, _1918, _1682);
        float _1928 = fma(_1892, _1918, _1130);
        _1874 = _1926;
        _1876 = _1924;
        _1878 = _1928;
        _1812 = _1908;
    }
    float _1930 = _1874;
    float _1932 = _1876;
    float _1934 = _1878;
    float _1936 = _1812;
    float _1938 = _1936;
    if (_1656)
    {
        _1814 = 1.0;
    }
    float _1940 = _1814;
    float _1942 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1944 = _1800 * _1942;
    float _1946 = _1940;
    if (!_1656)
    {
        float _1948 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1950 = _1948 * 0.15915493667125701904296875;
        float _1952 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1954 = _1950 * 6.283185482025146484375;
        float _1956 = cos(_1954);
        float _1958 = _1952 * 0.15915493667125701904296875;
        float _1960 = _1950 * 6.283185482025146484375;
        float _1962 = sin(_1960);
        float _1964 = 1.0 / _1956;
        float _1966 = _1958 * 6.283185482025146484375;
        float _1968 = cos(_1966);
        float _1970 = _1962 * _1964;
        float _1972 = _1958 * 6.283185482025146484375;
        float _1974 = sin(_1972);
        float _1976 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1978 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1976;
        float _1980 = _1968 * _1970;
        float _1982 = 1.0 / _1978;
        float _1984 = 1.0 / _1980;
        float _1986 = _1974 * _1984;
        float _1988 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1990 = fma(_1944, _1986, _1988);
        float _1992 = _1990 * _1982;
        float _1994 = precise::clamp(_1992, 0.0, 1.0);
        _1938 = _1982;
        _1882 = _1994;
    }
    float _1996 = _1938;
    float _1998 = _1882;
    float _2000 = _1996;
    if (!_1656)
    {
        float _2002 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2004 = _2002 * 0.15915493667125701904296875;
        float _2006 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2008 = _2004 * 6.283185482025146484375;
        float _2010 = cos(_2008);
        float _2012 = _2006 * 0.15915493667125701904296875;
        float _2014 = _2004 * 6.283185482025146484375;
        float _2016 = sin(_2014);
        float _2018 = 1.0 / _2010;
        float _2020 = _2012 * 6.283185482025146484375;
        float _2022 = cos(_2020);
        float _2024 = _2016 * _2018;
        float _2026 = _2012 * 6.283185482025146484375;
        float _2028 = sin(_2026);
        float _2030 = _2022 * _2024;
        float _2032 = 1.0 / _2030;
        float _2034 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2036 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2034;
        float _2038 = 1.0 / _2036;
        float _2040 = _2028 * _2032;
        float _2042 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2044 = fma(_1944, _2040, _2042);
        float _2046 = _2044 * _2038;
        float _2048 = precise::clamp(_2046, 0.0, 1.0);
        float _2050 = -_2048;
        float _2052 = _2050 + 1.0;
        _1946 = _2052;
    }
    float _2054 = _1946;
    float _2056 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2058 = _1930 + _2056;
    float _2060 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2062 = _1932 + _2060;
    float _2064 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2066 = _1934 + _2064;
    float _2068 = _2058 * _2058;
    float _2070 = fma(_2062, _2062, _2068);
    float _2072 = fma(_2066, _2066, _2070);
    float _2074 = rsqrt(_2072);
    float _2076 = sqrt(_2072);
    float _2078 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2080 = _2062 * _2078;
    float _2082 = _2066 * _2078;
    float _2084 = _2080 * _2080;
    float _2086 = _2082 * _2082;
    float _2088 = _2084 + _2086;
    float _2090 = sqrt(_2088);
    bool _2092 = _2090 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2094 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2096 = _2090 + _2094;
    float _2098 = _2066;
    float _2100 = _2088;
    float _2102 = _2096;
    float _2104 = _2078;
    if (_2092)
    {
        float _2106 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2098 = _2106;
    }
    float _2108 = _2098;
    if (_2092)
    {
        float _2110 = rsqrt(_2088);
        _2100 = _2110;
    }
    float _2112 = _2100;
    if (_2092)
    {
        float _2114 = _2096 * _2108;
        _2102 = _2114;
    }
    float _2116 = _2102;
    if (_2092)
    {
        float _2118 = _2116 * 0.15915493667125701904296875;
        _2000 = _2118;
    }
    float _2120 = _2000;
    float _2122 = _2068;
    float _2124 = _2120;
    if (_2092)
    {
        float _2126 = _2120 * 6.283185482025146484375;
        float _2128 = sin(_2126);
        _2122 = _2128;
    }
    float _2130 = _2122;
    float _2132 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2134 = precise::max(0.0, _2132);
    float _2136 = _2074;
    float _2138 = _2134;
    float _2140 = _2132;
    if (_2092)
    {
        float _2142 = _2120 * 6.283185482025146484375;
        float _2144 = cos(_2142);
        _2136 = _2144;
    }
    float _2146 = _2136;
    float _2148 = -_2078;
    float _2150 = -_2134;
    float _2152 = fma(_2058, _2148, _2150);
    float _2154 = _2152;
    if (!_2092)
    {
        _2138 = _2080;
    }
    float _2156 = _2138;
    float _2158 = _2156;
    if (_2092)
    {
        float _2160 = _2152 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2140 = _2160;
    }
    float _2162 = _2140;
    float _2164 = _2130;
    float _2166 = _2162;
    if (_2092)
    {
        float _2168 = fma(_2130, _2162, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2164 = _2168;
    }
    float _2170 = _2164;
    float _2172 = _2170;
    float _2174 = _2146;
    if (_2092)
    {
        float _2176 = _2146 + (-1.0);
        _2166 = _2176;
    }
    float _2178 = _2166;
    float _2180 = _2178;
    if (_2092)
    {
        float _2182 = _2112 * _2170;
        _2104 = _2182;
    }
    float _2184 = _2104;
    if (!_2092)
    {
        _2172 = _2084;
    }
    float _2186 = _2172;
    float _2188 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2190 = _2186;
    if (_2092)
    {
        float _2192 = _2178 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2124 = _2192;
    }
    float _2194 = _2124;
    if (_2092)
    {
        float _2196 = _2080 * _2184;
        _2158 = _2196;
    }
    float _2198 = _2158;
    if (!_2092)
    {
        _2180 = _2082;
    }
    float _2200 = _2180;
    float _2202 = _2200;
    if (_2092)
    {
        float _2204 = _2082 * _2184;
        _2202 = _2204;
    }
    float _2206 = _2202;
    if (_2092)
    {
        float _2208 = fma(_2152, _2146, _2194);
        _2154 = _2208;
    }
    float _2210 = _2154;
    if (_2092)
    {
        float _2212 = _2198 * _2198;
        _2190 = _2212;
    }
    float _2214 = _2190;
    if (!_2092)
    {
        _2174 = _2086;
    }
    float _2216 = _2174;
    float _2218 = _2216;
    if (_2092)
    {
        float _2220 = _2206 * _2206;
        _2218 = _2220;
    }
    float _2222 = _2218;
    float _2224 = fma(_2210, _2210, _2214);
    float _2226 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2228 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2230 = _2224 + _2222;
    float _2232 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2188);
    float _2234 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2236 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2238 = fma(_2076, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2236);
    float _2240 = precise::clamp(_2238, 0.0, 1.0);
    float _2242 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2226);
    float _2244 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2232);
    float _2246 = rsqrt(_2230);
    float _2248 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2250 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2234);
    float _2252 = -_2240;
    float _2254 = _2252 + 1.0;
    float _2256 = _2244 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2258 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2248);
    float _2260 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2250);
    float _2262 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2242);
    float _2264 = abs(_2254);
    float _2266 = log2(_2264);
    float _2268 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2258);
    float _2270 = _2260 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2272 = _2256 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2274 = _2262 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2276 = _2268 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2278 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2280 = -_2272;
    float _2282 = fma(_2280, _2228, 1.0);
    float _2284 = _2246 * _2198;
    float _2286 = _2246 * _2210;
    float _2288 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2278);
    float _2290 = _2246 * _2206;
    float _2292 = _2284 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2294 = log2(_2282);
    float _2296 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2288);
    float _2298 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2300 = -_2292;
    float _2302 = fma(_2286, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2300);
    float _2304 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2306 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2296);
    float _2308 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2298);
    float _2310 = -_2290;
    float _2312 = fma(_2310, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2302);
    float _2314 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2316 = 1.0 / _2306;
    float _2318 = _2286 + 1.0;
    float _2320 = fma(_2312, -0.5, 0.5);
    float _2322 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2314);
    float _2324 = fma(_2312, 0.5, 0.5);
    float _2326 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2308);
    float _2328 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2322);
    float _2330 = exp2(_2304);
    float _2332 = fma(_2324, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2334 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2326);
    float _2336 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2328);
    float _2338 = _2294 * 0.693147182464599609375;
    float _2340 = fma(_2324, _2332, -0.212114393711090087890625);
    float _2342 = sqrt(_2320);
    float _2344 = _2334 * _2316;
    float _2346 = fma(_2324, _2340, 1.570728778839111328125);
    float _2348 = _2338 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2350 = fma(_2344, -0.5, 0.5);
    float _2352 = -_2286;
    float _2354 = fma(_2330, _2318, _2352);
    float _2356 = _2336 * _2316;
    float _2358 = fma(_2354, 0.5, 0.5);
    float _2360 = fma(_2356, 0.5, 0.5);
    float _2362 = _2342 * 0.636619746685028076171875;
    float _2364 = -_2346;
    float _2366 = fma(_2362, _2364, 1.0);
    float3 _6901 = float3(_2360, _2350, _2348);
    float _2368 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6901, float3(0.0), isnan(_6901)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6901, float3(0.0), isnan(_6901)), level(0.0)).x;
    float3 _6912 = float3(_2360, _2350, _2348);
    float4 _2371 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6912, float3(0.0), isnan(_6912)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6912, float3(0.0), isnan(_6912)), level(0.0)).xyzw;
    float _2373 = _2371.x;
    float _2375 = _2371.y;
    float _2377 = _2371.z;
    float _2379 = _2371.w;
    float2 _6929 = float2(_2366, _2358);
    float3 _2383 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6929, float2(0.0), isnan(_6929)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6929, float2(0.0), isnan(_6929)), level(0.0)).xyz;
    float _2385 = _2383.x;
    float _2387 = _2383.y;
    float _2389 = _2383.z;
    out.m_67.x = _964;
    out.m_67.y = _966;
    out.m_67.z = _968;
    out.m_67.w = _970;
    float _2391 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2393 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2395 = _2393 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2397 = _996 > 0.5;
    float _2399 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2401 = _2399 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2403 = in.m_65.x;
    bool _2405 = _1002 > 0.5;
    float _2407 = 1.0 / _2395;
    int _2409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2411 = _2409 != 0;
    float _2413 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2415 = _2413 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2417 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2419 = _994 + _2417;
    int _2421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2423 = _2421 != 0;
    float _2425 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2427 = 1.0 / _2401;
    int _2429 = _2405 ? as_type<int>(_1688) : as_type<int>(_1622);
    float _2431 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2433 = _2431 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _2435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2437 = _2435 != 0;
    float _2439 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2441 = _2439 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2443 = _2397 ? as_type<int>(_1688) : as_type<int>(_1622);
    float _2445 = in.m_69.w;
    bool _2447 = _1004 > 0.5;
    float _2449 = 1.0 / _2415;
    int _2451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2453 = _2451 != 0;
    out.m_71.x = _1696;
    out.m_71.y = _1714;
    out.m_71.z = _1706;
    out.m_73.x = _1932;
    out.m_73.y = _1930;
    out.m_73.z = _1934;
    float _2455 = _2437 ? as_type<float>(_2443) : _1622;
    float _2457 = 1.0 / _2441;
    int _2459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2461 = _2459 != 0;
    float _2463 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2465 = _2463 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2469 = _2467 != 0;
    float _2471 = as_type<float>(_2443);
    bool _2473 = _2453;
    bool _2475 = _2447;
    float _2477 = _2419;
    float _2479 = _2391;
    float _2481 = _2403;
    float _2483 = _2306;
    float _2485 = _2334;
    if (_2423)
    {
        float _2487 = in.m_59.z;
        _2471 = _2487;
    }
    float _2489 = _2471;
    float _2491 = _2453 ? as_type<float>(_2429) : _1622;
    float _2493 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2495 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2493;
    float _2497 = 1.0 / _2433;
    if (_2411)
    {
        bool _2499 = _1012 > 0.5;
        _2473 = _2499;
    }
    bool _2501 = _2473;
    float _2503 = _2495 * _2407;
    float _2505 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2507 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2505;
    float _2509 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2511 = _2509 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _2513 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2515 = isnan(_994);
    bool _2517 = _2513 || _2515;
    bool _2519 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2521 = _2517 || _2519;
    float _2523 = float(_2521);
    float _2525 = 1.0 / _2465;
    float _2527 = _2507 * _2427;
    float _2529 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2531 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2529;
    float _2533 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2535 = _2533 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2537 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2539 = _2537 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2541 = _2511 * _2457;
    float _2543 = _2531 * _2449;
    float _2545 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2547 = _994 + _2545;
    float _2549 = 1.0 / _2539;
    float _2551 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2553 = _2551 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    if (_2469)
    {
        float _2555 = _2447 ? _1688 : _1622;
        _1816 = _2555;
    }
    float _2557 = _1816;
    float _2559 = fma(_2503, _2547, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2561 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2563 = _994 + _2561;
    bool _2565 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2567 = isnan(_994);
    bool _2569 = _2565 || _2567;
    bool _2571 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2573 = _2569 || _2571;
    float _2575 = float(_2573);
    float _2577 = _2553 * _2497;
    float _2579 = _2535 * _2525;
    float _2581 = fma(_2541, _2563, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2583 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2585 = _994 + _2583;
    bool _2587 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2589 = isnan(_994);
    bool _2591 = _2587 || _2589;
    bool _2593 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2595 = _2591 || _2593;
    float _2597 = float(_2595);
    float _2599 = -_2575;
    float _2601 = _2599 + 1.0;
    bool _2603 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2605 = isnan(_994);
    bool _2607 = _2603 || _2605;
    bool _2609 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2611 = _2607 || _2609;
    float _2613 = float(_2611);
    float _2615 = fma(_2527, _2585, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2617 = _2613;
    int _2619 = as_type<int>(_2559);
    float _2621 = _2557;
    if (_2423)
    {
        bool _2623 = _2489 > 0.5;
        _2475 = _2623;
    }
    bool _2625 = _2475;
    float _2627 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2629 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2627;
    bool _2631 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2633 = isnan(_994);
    bool _2635 = _2631 || _2633;
    bool _2637 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2639 = _2635 || _2637;
    float _2641 = float(_2639);
    float _2643 = _2597 * _2601;
    float _2645 = -_2597;
    float _2647 = _2645 + 1.0;
    float _2649 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2651 = _994 + _2649;
    float _2653 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2655 = _994 + _2653;
    float _2657 = -_2613;
    float _2659 = _2657 + 1.0;
    float _2661 = _2629 * _2549;
    float _2663 = fma(_2577, _2651, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2665 = fma(_2543, _2655, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2667 = _2641 * _2659;
    float _2669 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2671 = _994 + _2669;
    bool _2673 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2675 = isnan(_994);
    bool _2677 = _2673 || _2675;
    bool _2679 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2681 = _2677 || _2679;
    float _2683 = float(_2681);
    float _2685 = -_2641;
    float _2687 = _2685 + 1.0;
    bool _2689 = _1602 != 0.0;
    bool _2691 = isnan(_1602);
    bool _2693 = _2689 || _2691;
    bool _2695 = isnan(0.0);
    bool _2697 = _2693 || _2695;
    float _2699 = fma(_2579, _2671, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _2701 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2703 = isnan(_994);
    bool _2705 = _2701 || _2703;
    bool _2707 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2709 = _2705 || _2707;
    float _2711 = float(_2709);
    float _2713 = _2683 * _2687;
    float _2715 = -_2683;
    float _2717 = _2715 + 1.0;
    bool _2719 = _1600 == 0.0;
    bool _2721 = !_2697;
    bool _2723 = _2719 && _2721;
    float _2725 = in.m_75.x;
    float _2727 = in.m_75.y;
    float _2729 = in.m_75.z;
    float _2731 = -_2711;
    float _2733 = _2731 + 1.0;
    float _2735 = _2613 * _2647;
    bool _2737 = _1604 == 0.0;
    bool _2739 = _2737 && _2723;
    out.m_77.w = _2445;
    if (!_2411)
    {
        _2617 = _2403;
    }
    float _2741 = _2617;
    float _2743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2745 = fma(_2661, _2419, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2747 = _2455 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2749 = _2523 * _2717;
    bool _2751 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2753 = isnan(_994);
    bool _2755 = _2751 || _2753;
    bool _2757 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2759 = _2755 || _2757;
    float _2761 = float(_2759);
    float _2763 = _2741;
    if (_2411)
    {
        float _2765 = -_2403;
        float _2767 = _2765 + 1.0;
        _1044 = as_type<int>(_2767);
    }
    int _2769 = _1044;
    float _2771 = -_2523;
    float _2773 = _2771 + 1.0;
    float _2775 = exp2(_2425);
    float _2777 = _2761 * _2733;
    int _2779 = _2769;
    if (_2411)
    {
        float _2781 = _2501 ? as_type<float>(_2769) : _2403;
        _2763 = _2781;
    }
    float _2783 = _2763;
    if (_2423)
    {
        float _2785 = -_2403;
        float _2787 = _2785 + 1.0;
        _2779 = as_type<int>(_2787);
    }
    int _2789 = _2779;
    float _2791 = _2711 * _2773;
    float _2793 = _2559 * _2777;
    float _2795 = as_type<float>(_2789);
    if (_2461)
    {
        float _2797 = -_2403;
        float _2799 = _2797 + 1.0;
        _2619 = as_type<int>(_2799);
    }
    int _2801 = _2619;
    int _2803 = _2801;
    int _2805 = as_type<int>(_2727);
    float _2807 = _2725;
    if (_2739)
    {
        _2477 = _2727;
    }
    float _2809 = _2477;
    float _2811 = _2391 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2813 = _2809;
    if (!_2423)
    {
        _2479 = _2403;
    }
    float _2815 = _2479;
    float _2817 = -_2761;
    float _2819 = _2817 + 1.0;
    float _2821 = _2815;
    if (_2423)
    {
        float _2823 = _2625 ? as_type<float>(_2789) : _2403;
        _2821 = _2823;
    }
    float _2825 = _2821;
    float _2827 = _2743 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_2461)
    {
        float _2829 = _2397 ? as_type<float>(_2801) : _2403;
        _2481 = _2829;
    }
    float _2831 = _2481;
    if (_2739)
    {
        float _2833 = fma(_1602, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2809);
        _2803 = as_type<int>(_2833);
    }
    int _2835 = _2803;
    int _2837 = _2835;
    if (_2739)
    {
        _2795 = _2809;
    }
    float _2839 = _2795;
    float _2841 = fma(_2819, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2793);
    float _2843 = _2839;
    if (!_2739)
    {
        _2813 = _2727;
    }
    float _2845 = _2813;
    if (_2739)
    {
        float _2847 = fma(_1604, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2729);
        _2805 = as_type<int>(_2847);
    }
    int _2849 = _2805;
    int _2851 = _2849;
    if (!_2739)
    {
        float _2853 = fma(_1604, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2729);
        _2851 = as_type<int>(_2853);
    }
    int _2855 = _2851;
    float _2857 = fma(_2581, _2791, _2841);
    float _2859 = fma(_2491, _2811, -0.5);
    if (!_2739)
    {
        float _2861 = fma(_1602, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2845);
        _2837 = as_type<int>(_2861);
    }
    int _2863 = _2837;
    float _2865 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2867 = fma(_2615, _2749, _2857);
    float _2869 = fma(_2827, _2557, -0.5);
    if (_2739)
    {
        _2621 = _2729;
    }
    float _2871 = _2621;
    float _2873 = _2871;
    if (!_2739)
    {
        float _2875 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2725);
        _2807 = _2875;
    }
    float _2877 = _2807;
    bool _2879 = !_2739;
    float _2881 = _2879 ? as_type<float>(_2863) : _2845;
    float _2883 = fma(_2663, _2713, _2867);
    bool _2885 = !_2739;
    float _2887 = _2885 ? as_type<float>(_2855) : _2729;
    float _2889 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2891 = -_1322;
    float _2893 = fma(_1084, _2869, _2891);
    float _2895 = _2881 * _2881;
    float _2897 = fma(_2665, _2667, _2883);
    float _2899 = _2783 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_2739)
    {
        _2843 = as_type<float>(_2863);
    }
    float _2901 = _2843;
    float _2903 = fma(_2887, _2887, _2895);
    float _2905 = fma(_2699, _2735, _2897);
    float _2907 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2909 = _2865 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2911 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2913 = fma(_2745, _2643, _2905);
    float _2915 = -_2775;
    float _2917 = _2915 + 1.0;
    float _2919 = fma(_2909, _2825, -0.5);
    float _2921 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2911);
    float _2923 = _2893 + 0.5;
    float _2925 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2927 = _2889 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2929 = fma(_1238, _2919, _1170);
    float _2931 = fma(_2575, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2913);
    float _2933 = -_1318;
    float _2935 = fma(_1160, _2859, _2933);
    float _2937 = fma(_2927, _2831, -0.5);
    float _2939 = _2929 + 0.5;
    float _2941 = -_2901;
    float _2943 = _1674 * _2941;
    float _2945 = rsqrt(_2903);
    float _2947 = fma(_1314, _2937, _1246);
    float _2949 = _2747 * _2907;
    float _2951 = _1702 * _2901;
    if (!_2739)
    {
        _2873 = as_type<float>(_2855);
    }
    float _2953 = _2873;
    float _2955 = _2947 + 0.5;
    float _2957 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2921);
    float _2959 = _2917 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2961 = _2899 * _2925;
    float _2963 = _1662 * _2901;
    float _2965 = _2935 + 0.5;
    out.m_79.x = _2931;
    float _2967 = fma(_1706, _2877, _2963);
    bool _2969 = _2076 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2971 = isnan(_2076);
    bool _2973 = _2969 || _2971;
    bool _2975 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2977 = _2973 || _2975;
    float _2979 = _2881 * _2945;
    float _2981 = _2887 * _2945;
    out.m_81.x = _2961;
    out.m_81.y = _2949;
    out.m_81.z = _2939;
    out.m_81.w = _2923;
    float _2983 = fma(_1696, _2877, _2943);
    float _2985 = -_2979;
    float _2987 = _1712 * _2985;
    float _2989 = _2306 * 0.5;
    out.m_83.x = _2955;
    out.m_83.y = _2965;
    float _2991 = fma(_1712, _2953, _2967);
    float _2993 = fma(_2334, -0.5, _2989);
    float _2995 = fma(_1698, _2953, _2983);
    float _2997 = fma(_1714, _2877, _2951);
    float _2999 = -_2979;
    float _3001 = _1698 * _2999;
    float _3003 = -_2979;
    float _3005 = _1740 * _3003;
    float _3007 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2957);
    float _3009 = fma(_1740, _2953, _2997);
    float _3011 = _2336 + _2306;
    float _3013 = -_2959;
    float _3015 = _3013 + 1.0;
    float _3017 = _3007 + _2306;
    float _3019 = -_1674;
    float _3021 = fma(_3019, _2981, _3001);
    float _3023 = _3011 * 0.5;
    out.m_85.x = _2995;
    out.m_85.y = _3009;
    out.m_85.z = _2991;
    float _3025 = _3017 * 0.5;
    float _3027 = fma(_1702, _2981, _3005);
    float _3029 = fma(_1662, _2981, _2987);
    out.gl_Position.x = _2336;
    out.gl_Position.y = _2334;
    out.gl_Position.z = _3007;
    out.gl_Position.w = _2306;
    out.m_87.x = _3023;
    out.m_87.y = _2993;
    out.m_87.z = _3025;
    out.m_87.w = _2306;
    out.m_89.x = _3021;
    out.m_89.y = _3027;
    out.m_89.z = _3029;
    float _3031 = _1998 * _2054;
    float _3033 = _3007;
    float _3035 = _3027;
    float _3037 = _3021;
    float _3039 = _3031;
    if (!_2977)
    {
        _2483 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3041 = _2483;
    float _3043 = _3041;
    float _3045 = _3041;
    if (!_2977)
    {
        _3033 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3047 = _3033;
    float _3049 = _3047;
    float _3051 = _3047;
    if (!_2977)
    {
        _2485 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3053 = _2485;
    float _3055 = _3053;
    float _3057 = _3053;
    if (!_2977)
    {
        _3035 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3059 = _3035;
    float _3061 = _3059;
    float _3063 = _3059;
    if (!_2977)
    {
        _3037 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3065 = _3037;
    float _3067 = _2959 * _2368;
    float _3069 = _2379 * _3015;
    float _3071 = _2379 * _3067;
    float _3073 = _2389 * _3067;
    float _3075 = fma(_2385, _3071, _2373);
    float _3077 = fma(_2387, _3071, _2375);
    float _3079 = fma(_2379, _3073, _2377);
    float _3081 = _3031 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3083 = _3065;
    float _3085 = _3065;
    if (!_2977)
    {
        _3039 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3087 = _3039;
    out.m_91.x = _3075;
    out.m_91.y = _3077;
    out.m_91.z = _3079;
    out.m_91.w = _3069;
    bool _3089 = !_2977;
    float _3091 = _3087;
    float _3093 = _3087;
    if (!_3089)
    {
        bool _3095 = _2076 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3097 = isnan(_2076);
        bool _3099 = _3095 || _3097;
        bool _3101 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3103 = _3099 || _3101;
        if (!_3103)
        {
            float _3105 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3107 = _2076 + _3105;
            float _3109 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3111 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3109;
            float _3113 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3115 = _3113 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3117 = 1.0 / _3111;
            float _3119 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3121 = _3119 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3123 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3125 = _3123 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3127 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3129 = _3127 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3131 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3133 = _3131 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3135 = _3107 * _3117;
            float _3137 = precise::clamp(_3135, 0.0, 1.0);
            float _3139 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3141 = _3139 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3143 = fma(_3137, _3115, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3145 = fma(_3137, _3141, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3147 = fma(_3137, _3121, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3149 = fma(_3137, _3125, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3151 = fma(_3137, _3129, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3153 = fma(_3137, _3133, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3085 = _3147;
            _3057 = _3151;
            _3063 = _3143;
            _3051 = _3149;
            _3045 = _3145;
            _3093 = _3153;
            _3155 = true;
        }
        else
        {
            bool _3157 = _2076 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3159 = isnan(_2076);
            bool _3161 = _3157 || _3159;
            bool _3163 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3165 = _3161 || _3163;
            if (!_3165)
            {
                _3061 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3167 = _3061;
            _3063 = _3167;
            if (!_3165)
            {
                _3083 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3169 = _3083;
            _3085 = _3169;
            if (!_3165)
            {
                _3043 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3171 = _3043;
            _3045 = _3171;
            if (!_3165)
            {
                _3049 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3173 = _3049;
            _3051 = _3173;
            if (!_3165)
            {
                _3055 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3175 = _3055;
            _3057 = _3175;
            if (!_3165)
            {
                _3091 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3177 = _3091;
            bool _3179 = !_3165;
            _3093 = _3177;
            if (!_3179)
            {
                bool _3181 = _2076 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3183 = isnan(_2076);
                bool _3185 = _3181 || _3183;
                bool _3187 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3189 = _3185 || _3187;
                if (!_3189)
                {
                    float _3191 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3193 = _2076 + _3191;
                    float _3195 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3197 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3195;
                    float _3199 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3201 = _3199 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3203 = 1.0 / _3197;
                    float _3205 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3207 = _3205 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3209 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3211 = _3209 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3213 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3215 = _3213 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3217 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3219 = _3217 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3221 = _3193 * _3203;
                    float _3223 = precise::clamp(_3221, 0.0, 1.0);
                    float _3225 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3227 = _3225 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3229 = fma(_3223, _3201, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3231 = fma(_3223, _3227, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3233 = fma(_3223, _3207, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3235 = fma(_3223, _3211, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3237 = fma(_3223, _3215, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3239 = fma(_3223, _3219, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3085 = _3233;
                    _3057 = _3237;
                    _3063 = _3229;
                    _3051 = _3235;
                    _3045 = _3231;
                    _3093 = _3239;
                    _3155 = true;
                }
                else
                {
                    _3085 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3057 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3063 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3051 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3045 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3093 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3155 = false;
    float _3241 = _3085;
    float _3243 = _3057;
    float _3245 = _3063;
    float _3247 = _3051;
    float _3249 = _3045;
    float _3251 = _3093;
    float _3253 = fma(_3009, -0.5, 0.5);
    float _3255 = precise::clamp(_3253, 0.0, 1.0);
    float _3257 = -_3241;
    float _3259 = _3257 + _3243;
    float _3261 = _3081 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3263 = -_3245;
    float _3265 = _3263 + _3247;
    float _3267 = fma(_3255, _3259, _3241);
    out.m_93.x = 0.0;
    float _3269 = -_3249;
    float _3271 = _3269 + _3251;
    float _3273 = fma(_3255, _3265, _3245);
    float _3275 = _3267 * 0.586610972881317138671875;
    out.m_47.x = _3261;
    bool _3277 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3279 = fma(_3255, _3271, _3249);
    float _3281 = fma(_3273, 0.298911988735198974609375, _3275);
    bool _3283 = _1998 > 0.0;
    bool _3285 = isnan(_1998);
    bool _3287 = _3283 || _3285;
    bool _3289 = isnan(0.0);
    bool _3291 = _3287 || _3289;
    float _3293 = fma(_3279, 0.114477999508380889892578125, _3281);
    bool _3295 = _2054 <= 0.0;
    bool _3297 = !_3291;
    bool _3299 = _3295 || _3297;
    float _3301 = -_3293;
    float _3303 = _3273 + _3301;
    float _3305 = -_3293;
    float _3307 = _3267 + _3305;
    float _3309 = -_3293;
    float _3311 = _3279 + _3309;
    float _3313 = fma(_3303, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3293);
    float _3315 = fma(_3307, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3293);
    float _3317 = fma(_3311, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3293);
    bool _3319 = !_3277;
    if (!_3319)
    {
        float _3321 = -_1930;
        float _3323 = _3321 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3325 = -_1932;
        float _3327 = _3325 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3329 = -_1934;
        float _3331 = _3329 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3333 = _3323 * _3323;
        float _3335 = fma(_3327, _3327, _3333);
        float _3337 = fma(_3331, _3331, _3335);
        float _3339 = sqrt(_3337);
        float _3341 = rsqrt(_3337);
        float _3343 = -_3339;
        float _3345 = _3343 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3347 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3349 = precise::clamp(_3347, 0.0, 1.0);
        float _3351 = _3327 * _3341;
        float _3353 = _3323 * _3341;
        float _3355 = abs(_3349);
        float _3357 = log2(_3355);
        float _3359 = _3331 * _3341;
        float _3361 = _3351 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3363 = _3009 * _3353;
        float _3365 = -_3353;
        float _3367 = -_3361;
        float _3369 = fma(_3365, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3367);
        float _3371 = fma(_2995, _3351, _3363);
        float _3373 = -_3359;
        float _3375 = fma(_3373, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3369);
        float _3377 = fma(_2991, _3359, _3371);
        float _3379 = precise::clamp(_3377, 0.0, 1.0);
        float _3381 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3383 = _3375 + _3381;
        float _3385 = _3357 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3387 = _3383 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3389 = precise::clamp(_3387, 0.0, 1.0);
        float _3391 = exp2(_3385);
        float _3393 = _3391 * _3389;
        float _3395 = _3379 * _3393;
        float _3397 = _3395 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3399 = _3395 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3401 = _3395 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _3397;
        out.m_93.y = _3399;
        out.m_93.z = _3401;
    }
    out.m_95.x = _3313;
    out.m_95.y = _3315;
    out.m_95.z = _3317;
    if (!_3299)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _3403 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3403;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3155 = false;
    bool _992 = false;
    bool _780 = false;
    bool _498 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_44.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    float _122 = as_type<float>(_114);
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _120;
    if (!_118)
    {
        out.m_47.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _124 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3461 = as_type<float>(_130);
        out.gl_Position.z = _3461;
    }
    if (!_118)
    {
        return out;
    }
    float _134 = in.m_49.w;
    float _136 = float(_114);
    float _138 = -_134;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_134);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    bool _152 = _140 >= _136;
    bool _154 = !_150;
    bool _156 = _152 || _154;
    float _158 = _140;
    if (_156)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _122;
    if (_156)
    {
        out.m_47.x = 0.0;
    }
    if (_156)
    {
        float _162 = _160 * 5.0;
        _132 = as_type<int>(_162);
    }
    int _164 = _132;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3525 = as_type<float>(_164);
        out.gl_Position.z = _3525;
    }
    if (_156)
    {
        return out;
    }
    float _166 = in.m_51.x;
    float _168 = in.m_51.y;
    float _170 = in.m_51.z;
    float _172 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _174 = in.m_53.x;
    float _176 = in.m_53.y;
    float _178 = in.m_53.z;
    bool _180 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _182 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _184 = _180 || _182;
    bool _186 = isnan(1.0);
    bool _188 = _184 || _186;
    float _190 = in.m_55.x;
    float _192 = in.m_55.y;
    float _194 = in.m_55.z;
    float _196 = in.m_57.w;
    float _198 = in.m_49.x;
    float _200 = in.m_49.y;
    float _202 = in.m_49.z;
    float _204 = _166 * _166;
    float _206 = _168 * _168;
    float _208 = _170 * _170;
    float _210 = fma(_174, _174, _204);
    float _212 = fma(_176, _176, _206);
    float _214 = fma(_178, _178, _208);
    float _216 = fma(_190, _190, _210);
    float _218 = fma(_192, _192, _212);
    float _220 = fma(_194, _194, _214);
    float _222 = sqrt(_216);
    float _224 = sqrt(_218);
    float _226 = sqrt(_220);
    bool _228 = _222 > 0.0;
    bool _230 = _224 > 0.0;
    float _232 = 0.0;
    float _234 = _216;
    float _236 = _218;
    float _238 = _220;
    float _240 = _178;
    float _242 = _174;
    if (_228)
    {
        float _244 = rsqrt(_216);
        _232 = _244;
    }
    float _246 = _232;
    float _248 = 0.0;
    float _250 = 0.0;
    if (!_228)
    {
        _248 = 0.0;
        _250 = 0.0;
    }
    float _252 = _248;
    float _254 = _250;
    bool _256 = _226 > 0.0;
    float _258 = in.m_44.x;
    float _260 = in.m_44.y;
    float _262 = in.m_44.z;
    float _264 = 0.0;
    float _266 = _252;
    float _268 = _254;
    if (!_228)
    {
        _264 = 0.0;
    }
    float _270 = _264;
    float _272 = 0.0;
    float _274 = 0.0;
    float _276 = _270;
    if (!_230)
    {
        _272 = 0.0;
        _274 = 0.0;
    }
    float _278 = _272;
    float _280 = _274;
    float _282 = 0.0;
    float _284 = _280;
    float _286 = _278;
    if (_230)
    {
        float _288 = rsqrt(_218);
        _282 = _288;
    }
    float _290 = _282;
    if (!_188)
    {
        float _292 = _172 * _172;
        float _294 = _292 * 0.5;
        _234 = _294;
    }
    float _296 = _234;
    float _298 = 0.0;
    float _300 = _296;
    if (!_230)
    {
        _298 = 0.0;
    }
    float _302 = _298;
    float _304 = _302;
    if (!_188)
    {
        float _306 = _296 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _300 = _306;
    }
    float _308 = _300;
    float _310 = 0.0;
    float _312 = _308;
    if (_256)
    {
        float _314 = rsqrt(_220);
        _310 = _314;
    }
    float _316 = _310;
    if (_228)
    {
        float _318 = _246 * _174;
        _276 = _318;
    }
    float _320 = _276;
    if (_228)
    {
        float _322 = _246 * _166;
        _266 = _322;
    }
    float _324 = _266;
    if (_228)
    {
        float _326 = _246 * _190;
        _268 = _326;
    }
    float _328 = _268;
    if (!_256)
    {
        _236 = 0.0;
    }
    float _330 = _236;
    float _332 = _330;
    if (_230)
    {
        float _334 = _290 * _176;
        _284 = _334;
    }
    float _336 = _284;
    if (_230)
    {
        float _338 = _290 * _168;
        _286 = _338;
    }
    float _340 = _286;
    if (_230)
    {
        float _342 = _290 * _192;
        _304 = _342;
    }
    float _344 = _304;
    bool _346 = !_188;
    if (!_346)
    {
        float _348 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _350 = log2(_348);
        float _352 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _354 = _352 + 1.0;
        float _356 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _358 = _172 * _350;
        float _360 = 1.0 / _354;
        float _362 = _356 * 0.693147182464599609375;
        float _364 = exp2(_358);
        float _366 = 1.0 / _362;
        float _368 = _364 + (-1.0);
        float _370 = -_368;
        float _372 = fma(_370, _366, _172);
        float _374 = _372 * _360;
        float _376 = _374 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _312 = _376;
        _238 = _362;
    }
    float _378 = _312;
    float _380 = _238;
    float _382 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _384 = 1.0 / _136;
    float _386 = _380;
    float _388 = _378;
    if (_256)
    {
        float _390 = _316 * _170;
        _332 = _390;
    }
    float _392 = _332;
    float _394 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _396 = _382 * _324;
    float _398 = _382 * _340;
    float _400 = _392;
    if (!_256)
    {
        _386 = 0.0;
    }
    float _402 = _386;
    float _404 = _382 * _392;
    float _406 = fma(_394, _320, _396);
    float _408 = _402;
    if (_256)
    {
        float _410 = _316 * _178;
        _408 = _410;
    }
    float _412 = _408;
    float _414 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _416 = fma(_394, _336, _398);
    if (!_256)
    {
        _400 = 0.0;
    }
    float _418 = _400;
    float _420 = _418;
    if (_256)
    {
        float _422 = _316 * _194;
        _420 = _422;
    }
    float _424 = _420;
    float _426 = fma(_394, _412, _404);
    float _428 = fma(_414, _328, _406);
    float _430 = fma(_414, _344, _416);
    if (!_188)
    {
        _388 = _172;
    }
    float _432 = _388;
    bool _434 = !_188;
    float _436 = _432;
    if (!_434)
    {
        float _438 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _440 = log2(_438);
        float _442 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _444 = _442 + 1.0;
        float _446 = 1.0 / _444;
        float _448 = _172 * _440;
        float _450 = exp2(_448);
        float _452 = -_450;
        float _454 = _452 + 1.0;
        float _456 = _454 * _446;
        _436 = _456;
    }
    float _458 = _436;
    bool _460 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _462 = fma(_414, _424, _426);
    float _464 = fma(_458, _198, _428);
    float _466 = fma(_458, _200, _430);
    float _468 = fma(_458, _202, _462);
    float _470 = fma(_464, _196, _258);
    float _472 = fma(_466, _196, _260);
    float _474 = _140 * _384;
    float _476 = fma(_468, _196, _262);
    bool _478 = !_460;
    float _496;
    if (!_478)
    {
        float _480 = in.m_59.x;
        float _482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _484 = _480 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _486 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _488 = _486 * _482;
        float _490 = floor(_488);
        float _492 = -_490;
        float _494 = _488 + _492;
        _496 = _494;
        _498 = true;
    }
    else
    {
        _496 = _474;
    }
    _498 = false;
    float _500 = _496;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _504 = _500 + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _508 = _500 + _506;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _512 = _500 + _510;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _514;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _522;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _530 = 1.0 / _516;
    bool _532 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _534 = isnan(_500);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = 1.0 / _528;
    bool _546 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _548 = isnan(_500);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    bool _558 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _560 = 1.0 / _520;
    float _562 = _504 * _530;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _566 = _500 + _564;
    float _568 = 1.0 / _524;
    float _570 = _566 * _544;
    bool _572 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _574 = isnan(_500);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    bool _584 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _586 = isnan(_500);
    bool _588 = _584 || _586;
    bool _590 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _592 = _588 || _590;
    float _594 = float(_592);
    float _596 = -_582;
    float _598 = _596 + 1.0;
    float _600 = _508 * _560;
    float _602 = -_556;
    float _604 = _602 + 1.0;
    float _606 = _594 * _598;
    float _608 = -_594;
    float _610 = _608 + 1.0;
    float _612 = _582 * _604;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _614;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _618;
    float _622 = _512 * _568;
    bool _624 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _626 = isnan(_500);
    bool _628 = _624 || _626;
    bool _630 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _632 = _628 || _630;
    float _634 = float(_632);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _636;
    float _640 = fma(_616, _562, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _642 = fma(_620, _562, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _648 = -_634;
    float _650 = _648 + 1.0;
    float _652 = _634 * _610;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _658 = fma(_638, _562, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _660 = _542 * _650;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _666 = fma(_646, _600, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _668;
    float _672 = _640 * _660;
    float _674 = _642 * _660;
    float _676 = _658 * _660;
    float _678 = -_542;
    float _680 = _678 + 1.0;
    float _682 = in.m_57.x;
    float _684 = in.m_57.y;
    float _686 = in.m_57.z;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _692;
    float _696 = fma(_656, _600, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _698 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[143].x, _672);
    float _700 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[143].y, _674);
    float _702 = fma(_664, _600, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _704 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[143].z, _676);
    float _706 = fma(_690, _622, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _708 = fma(_670, _622, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _710 = fma(_694, _622, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _712 = fma(_666, _652, _698);
    float _714 = fma(_696, _652, _700);
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _718 = _716 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _722 = _720 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _728 = fma(_702, _652, _704);
    float _730 = fma(_718, _570, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _732 = fma(_722, _570, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _734 = fma(_706, _606, _712);
    float _736 = fma(_708, _606, _714);
    float _738 = fma(_726, _570, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _740 = fma(_710, _606, _728);
    float _742 = fma(_730, _612, _734);
    float _744 = fma(_732, _612, _736);
    float _746 = fma(_738, _612, _740);
    float _748 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[147].x, _742);
    float _750 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[147].y, _744);
    float _752 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[147].z, _746);
    float _754 = _748 * _682;
    float _756 = _750 * _684;
    float _758 = _752 * _686;
    bool _760 = !_558;
    float _778;
    if (!_760)
    {
        float _762 = in.m_59.x;
        float _764 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _766 = _762 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _768 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _770 = _768 * _764;
        float _772 = floor(_770);
        float _774 = -_772;
        float _776 = _770 + _774;
        _778 = _776;
        _780 = true;
    }
    else
    {
        _778 = _474;
    }
    _780 = false;
    float _782 = _778;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _786 = _782 + _784;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _792;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _798 = _796 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _800 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _802 = isnan(_782);
    bool _804 = _800 || _802;
    bool _806 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _808 = _804 || _806;
    float _810 = float(_808);
    float _812 = 1.0 / _790;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _816 = _814 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _818 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _820 = isnan(_782);
    bool _822 = _818 || _820;
    bool _824 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _826 = _822 || _824;
    float _828 = float(_826);
    bool _830 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _832 = 1.0 / _798;
    float _834 = _794 * _812;
    bool _836 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _838 = isnan(_782);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = 1.0 / _816;
    float _850 = -_810;
    float _852 = _850 + 1.0;
    float _854 = fma(_834, _786, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _858 = _856 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _860 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _862 = isnan(_782);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _868 = _864 || _866;
    float _870 = float(_868);
    float _872 = -_846;
    float _874 = _872 + 1.0;
    float _876 = _846 * _852;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _882 = 1.0 / _858;
    float _884 = -_870;
    float _886 = _884 + 1.0;
    float _888 = _828 * _874;
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _890;
    float _894 = _880 * _832;
    float _896 = _810 * _886;
    float _898 = _854 * _888;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _902 = _782 + _900;
    float _904 = -_828;
    float _906 = _904 + 1.0;
    bool _908 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _910 = isnan(_782);
    bool _912 = _908 || _910;
    bool _914 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _916 = _912 || _914;
    float _918 = float(_916);
    float _920 = _892 * _848;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _924 = _922 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _928 = _782 + _926;
    float _930 = fma(_894, _902, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _932 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[115].x, _898);
    float _934 = -_918;
    float _936 = _934 + 1.0;
    float _938 = _924 * _882;
    float _940 = fma(_920, _928, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _944 = _782 + _942;
    float _946 = fma(_930, _876, _932);
    float _948 = _870 * _936;
    float _950 = fma(_938, _944, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _952 = fma(_940, _896, _946);
    float _954 = fma(_950, _948, _952);
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _962 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[119].x, _954);
    float _964 = _958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _966 = _956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _968 = _960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _970 = _962 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _972 = !_830;
    float _990;
    if (!_972)
    {
        float _974 = in.m_59.x;
        float _976 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _978 = _974 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _980 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[14].x, _140);
        float _982 = _980 * _976;
        float _984 = floor(_982);
        float _986 = -_984;
        float _988 = _982 + _986;
        _990 = _988;
        _992 = true;
    }
    else
    {
        _990 = _474;
    }
    _992 = false;
    float _994 = _990;
    float _996 = in.m_59.y;
    float _998 = _472 * _176;
    float _1000 = _472 * _192;
    float _1002 = in.m_59.z;
    float _1004 = in.m_59.w;
    float _1006 = fma(_470, _174, _998);
    int _1008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1010 = _1008 != 0;
    float _1012 = in.m_59.x;
    float _1014 = fma(_470, _190, _1000);
    float _1016 = fma(_476, _178, _1006);
    int _1018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1020 = _1018 != 0;
    int _1022 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1024 = _1022 != 0;
    int _1026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1028 = _1026 != 0;
    float _1030 = in.m_55.w;
    float _1032 = fma(_476, _194, _1014);
    float _1034 = in.m_53.w;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1040 = _996 * 2.0;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    int _1044 = as_type<int>(_994);
    if (!_1010)
    {
        _240 = _996;
    }
    float _1046 = _240;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1050 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1052 = _1002 * 2.0;
    float _1054 = _1046;
    if (!_1010)
    {
        _1042 = _1002;
    }
    float _1056 = _1042;
    float _1058 = floor(_1040);
    float _1060 = _1056;
    if (_1010)
    {
        _1060 = _996;
    }
    float _1062 = _1060;
    if (_1010)
    {
        _1054 = _1012;
    }
    float _1064 = _1054;
    if (_1010)
    {
        _242 = _1012;
    }
    float _1066 = _242;
    float _1068 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1036);
    float _1070 = _1066;
    if (!_1010)
    {
        _1070 = _1002;
    }
    float _1072 = _1070;
    float _1074 = floor(_1052);
    float _1076 = _1016 + _1034;
    float _1078 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1080 = _1072;
    if (!_1010)
    {
        _1080 = _1002;
    }
    float _1082 = _1080;
    float _1084 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1068);
    float _1086 = _1082;
    if (_1010)
    {
        _1086 = _996;
    }
    float _1088 = _1086;
    float _1090 = -_1048;
    float _1092 = fma(_1078, 2.0, _1090);
    bool _1094 = _1058 >= 0.0;
    bool _1096 = isnan(_1058);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan(0.0);
    bool _1102 = _1098 || _1100;
    float _1104 = _1012 * 2.0;
    bool _1106 = _1058 > 0.0;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1110 = floor(_1104);
    int _1112 = _1102 ? 0 : 1;
    float _1114 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1108);
    bool _1116 = _1074 > 0.0;
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1120 = _1074 >= 0.0;
    bool _1122 = isnan(_1074);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    float _1130 = _1032 + _1030;
    float _1132 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1134 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1118);
    int _1136 = _1128 ? 0 : 1;
    float _1138 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1140 = log2(_1138);
    float _1142 = -_1038;
    float _1144 = fma(_1132, 2.0, _1142);
    float _1146 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1148 = _1076 + _1146;
    float _1150 = -_1130;
    float _1152 = _1150 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _1154 = ~_1136;
    int _1156 = _1154 + 1;
    int _1158 = _1156 + 1;
    float _1160 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1114);
    int _1162 = ~_1112;
    int _1164 = _1162 + 1;
    int _1166 = _1164 + 1;
    float _1168 = -_140;
    float _1170 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1144);
    int _1172 = _1158;
    int _1174 = _1166;
    float _1176 = _1152;
    if (!_1116)
    {
        int _1178 = ~_1136;
        int _1180 = _1178 + 1;
        _1172 = _1180;
    }
    int _1182 = _1172;
    float _1184 = _1088 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_1106)
    {
        int _1186 = ~_1112;
        int _1188 = _1186 + 1;
        _1174 = _1188;
    }
    int _1190 = _1174;
    float _1192 = _996 + _1012;
    float _1194 = abs(_1148);
    float _1196 = abs(_1152);
    float _1198 = precise::max(_1194, _1196);
    float _1200 = fma(_1184, -2.0, _1050);
    float _1202 = _1002 + _1012;
    float _1204 = _1140 * _140;
    bool _1206 = _1198 >= 16.0;
    float _1208 = _1192 + (-1.0);
    bool _1210 = !_1020;
    int _1212 = _1210 ? 0 : 1;
    float _1214 = _1202 + (-1.0);
    float _1216 = _1192;
    if (_1010)
    {
        _1216 = _996;
    }
    float _1218 = _1216;
    float _1220 = exp2(_1204);
    float _1222 = _1218;
    if (!_1010)
    {
        _1222 = _1012;
    }
    float _1224 = _1222;
    float _1226 = fma(_1208, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1228 = abs(_1212);
    float _1230 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1234 = _1224 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1236 = float(_1228);
    float _1238 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1134);
    float _1240 = float(_1182);
    float _1242 = fma(_1234, -2.0, _1232);
    float _1244 = -_140;
    float _1246 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1092);
    float _1248 = _1236 * _1240;
    bool _1250 = _1110 > 0.0;
    float _1252 = in.m_61.x;
    float _1254 = in.m_61.y;
    float _1256 = in.m_61.z;
    bool _1258 = _1110 >= 0.0;
    bool _1260 = isnan(_1110);
    bool _1262 = _1258 || _1260;
    bool _1264 = isnan(0.0);
    bool _1266 = _1262 || _1264;
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1270 = 1.0 + _1268;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1274 = !_1028;
    int _1276 = _1274 ? 0 : 1;
    float _1278 = -_1220;
    float _1280 = _1278 + 1.0;
    bool _1282 = !_1024;
    int _1284 = _1282 ? 0 : 1;
    float _1286 = 1.0 / _1270;
    bool _1288 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1290 = isnan(0.0);
    bool _1292 = _1288 || _1290;
    bool _1294 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1296 = _1292 || _1294;
    float _1298 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1272);
    int _1300 = abs(_1276);
    float _1302 = _1248 * (-2.0);
    bool _1304 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1306 = isnan(1.0);
    bool _1308 = _1304 || _1306;
    bool _1310 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1312 = _1308 || _1310;
    float _1314 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1298);
    int _1316 = abs(_1284);
    float _1318 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1242);
    float _1320 = _1296 ? _1280 : 0.0;
    float _1322 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1200);
    int _1324 = _1266 ? 0 : 1;
    float _1326 = _1012 + (-0.5);
    bool _1328 = _1296;
    if (_1206)
    {
        float _1330 = _1152 * 0.0625;
        _1176 = _1330;
    }
    float _1332 = _1176;
    int _1334 = ~_1324;
    int _1336 = _1334 + 1;
    int _1338 = _1336 + 1;
    float _1340 = fma(_1226, _1302, _1226);
    int _1342 = _1338;
    if (!_1250)
    {
        int _1344 = ~_1324;
        int _1346 = _1344 + 1;
        _1342 = _1346;
    }
    int _1348 = _1342;
    float _1350 = _1148 * 0.0625;
    float _1352 = float(_1300);
    if (_1312)
    {
        float _1354 = _1320 * _1286;
        _158 = _1354;
    }
    float _1356 = _158;
    float _1358 = float(_1190);
    float _1360 = fma(_1302, _1252, _1252);
    float _1362 = float(_1348);
    float _1364 = _1352 * _1358;
    float _1366 = _1206 ? _1350 : _1148;
    float _1368 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1360);
    float _1370 = float(_1316);
    float _1372 = _1364 * (-2.0);
    float _1374 = abs(_1366);
    bool _1376 = _1374 != 0.0;
    bool _1378 = isnan(_1374);
    bool _1380 = _1376 || _1378;
    bool _1382 = isnan(0.0);
    bool _1384 = _1380 || _1382;
    float _1386 = fma(_1340, _1356, _1368);
    float _1388 = abs(_1332);
    bool _1390 = _1388 == 0.0;
    float _1392 = _1370 * _1362;
    float _1394 = abs(_1332);
    bool _1396 = _1394 == 0.0;
    bool _1398 = !_1384;
    bool _1400 = _1396 && _1398;
    float _1402 = _996 + _1002;
    float _1404 = _1386 * 0.15915493667125701904296875;
    float _1406 = _1392 * (-2.0);
    float _1408 = _1402 + (-1.0);
    float _1410 = _1404 * 6.283185482025146484375;
    float _1412 = cos(_1410);
    float _1414 = fma(_1230, _1372, _1230);
    float _1416 = fma(_1372, _1256, _1256);
    float _1418 = fma(_1406, _1254, _1254);
    float _1420 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1422 = _996 + (-0.5);
    float _1424 = _1002 + (-0.5);
    int _1426 = as_type<int>(_1424);
    float _1428 = _1356;
    if (_1400)
    {
        bool _1430 = as_type<int>(_1332) >= 0;
        _1328 = _1430;
    }
    bool _1432 = _1328;
    float _1434 = _1404 * 6.283185482025146484375;
    float _1436 = sin(_1434);
    float _1438 = fma(_1420, _1406, _1420);
    float _1440 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1416);
    float _1442 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1418);
    int _1444 = _1432 ? (-1) : 0;
    if (_1400)
    {
        int _1446 = _1432 ? 0 : 1078530011;
        _1426 = _1446;
    }
    int _1448 = _1426;
    float _1450 = fma(_1414, _1356, _1440);
    float _1452 = fma(_1438, _1356, _1442);
    int _1454 = _1448;
    if (_1400)
    {
        int _1456 = int(0x80000000) & as_type<int>(_1366);
        int _1458 = _1448 | _1456;
        _1428 = as_type<float>(_1458);
    }
    float _1460 = _1428;
    bool _1462 = !_1384;
    bool _1464 = _1462 && _1390;
    float _1466 = _1460;
    float _1468 = _1460;
    if (!_1464)
    {
        float _1470 = abs(_1366);
        bool _1472 = _1470 != as_type<float>(0x7f800000u /* inf */);
        bool _1474 = isnan(_1470);
        bool _1476 = _1472 || _1474;
        bool _1478 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1480 = _1476 || _1478;
        float _1482 = abs(_1332);
        bool _1484 = _1482 == as_type<float>(0x7f800000u /* inf */);
        float _1486 = abs(_1332);
        bool _1488 = _1486 == as_type<float>(0x7f800000u /* inf */);
        bool _1490 = !_1480;
        bool _1492 = _1488 && _1490;
        if (_1492)
        {
            bool _1494 = as_type<int>(_1332) >= 0;
            _1444 = _1494 ? (-1) : 0;
        }
        int _1496 = _1444;
        if (_1492)
        {
            _1454 = 1075235812;
        }
        int _1498 = _1454;
        int _1500 = _1498;
        if (_1492)
        {
            int _1502 = ~_1496;
            int _1504 = (_1502 != 0) ? _1498 : 1061752795;
            _1500 = _1504;
        }
        int _1506 = _1500;
        if (_1492)
        {
            int _1508 = int(0x80000000) & as_type<int>(_1366);
            int _1510 = _1506 | _1508;
            _1466 = as_type<float>(_1510);
        }
        float _1512 = _1466;
        bool _1514 = !_1480;
        bool _1516 = _1514 && _1484;
        _1468 = _1512;
        if (!_1516)
        {
            float _1518 = abs(_1366);
            float _1520 = abs(_1332);
            float _1522 = precise::max(_1518, _1520);
            float _1524 = abs(_1366);
            float _1526 = abs(_1332);
            float _1528 = precise::min(_1524, _1526);
            float _1530 = 1.0 / _1522;
            float _1532 = abs(_1366);
            float _1534 = abs(_1332);
            bool _1536 = _1532 > _1534;
            bool _1538 = as_type<int>(_1332) >= 0;
            float _1540 = abs(_1366);
            float _1542 = abs(_1332);
            float _1544 = _1540 + _1542;
            bool _1546 = _1544 > as_type<float>(0x7f800000u /* inf */);
            bool _1548 = isnan(_1544);
            bool _1550 = _1546 || _1548;
            bool _1552 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1554 = _1550 || _1552;
            float _1556 = _1528 * _1530;
            float _1558 = _1556 * _1556;
            float _1560 = _1558 + 11.33538818359375;
            float _1562 = fma(_1558, _1560, 28.84246826171875);
            float _1564 = fma(_1558, _1562, 19.6966705322265625);
            float _1566 = fma(_1558, -0.82336294651031494140625, -5.674867153167724609375);
            float _1568 = fma(_1558, _1566, -6.565555095672607421875);
            float _1570 = 1.0 / _1564;
            float _1572 = _1558 * _1568;
            float _1574 = _1556 * _1572;
            float _1576 = fma(_1574, _1570, _1556);
            int _1578 = as_type<int>(_1366) & int(0x80000000);
            float _1580 = _1576;
            _1468 = _1544;
            if (_1536)
            {
                float _1582 = -_1576;
                float _1584 = _1582 + 1.57079637050628662109375;
                _1580 = _1584;
            }
            float _1586 = _1580;
            int _1588 = as_type<int>(_1586);
            if (!_1538)
            {
                float _1590 = -_1586;
                float _1592 = _1590 + 3.1415927410125732421875;
                _1588 = as_type<int>(_1592);
            }
            int _1594 = _1588;
            if (!_1554)
            {
                int _1596 = _1578 | _1594;
                _1468 = as_type<float>(_1596);
            }
        }
    }
    float _1598 = _1468;
    float _1600 = in.m_63.x;
    float _1602 = in.m_63.y;
    float _1604 = in.m_63.z;
    float _1606 = -_1598;
    float _1608 = _1452 + _1606;
    float _1610 = _1450 * 0.15915493667125701904296875;
    float _1612 = _472 * _168;
    float _1614 = in.m_51.w;
    float _1616 = _1608 * 0.15915493667125701904296875;
    float _1618 = _1610 * 6.283185482025146484375;
    float _1620 = cos(_1618);
    float _1622 = in.m_65.y;
    float _1624 = fma(_470, _166, _1612);
    float _1626 = _756 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1628 = _758 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1630 = _754 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1632 = fma(_476, _170, _1624);
    float _1634 = _1616 * 6.283185482025146484375;
    float _1636 = sin(_1634);
    bool _1638 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1640 = isnan(0.5);
    bool _1642 = _1638 || _1640;
    bool _1644 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1646 = _1642 || _1644;
    bool _1648 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1650 = isnan(0.5);
    bool _1652 = _1648 || _1650;
    bool _1654 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1656 = _1652 || _1654;
    float _1658 = _1616 * 6.283185482025146484375;
    float _1660 = cos(_1658);
    float _1662 = _1436 * _1620;
    float _1664 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1602);
    float _1666 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1600);
    float _1668 = _1664 * _1626;
    float _1670 = _1666 * _1630;
    float _1672 = _1610 * 6.283185482025146484375;
    float _1674 = sin(_1672);
    float _1676 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1604);
    float _1678 = _1412 * _1636;
    float _1680 = _1662 * _1668;
    float _1682 = _1632 + _1614;
    float _1684 = _1676 * _1628;
    float _1686 = -_1622;
    float _1688 = _1686 + 1.0;
    float _1690 = _1436 * _1660;
    float _1692 = _1436 * _1636;
    float _1694 = _1412 * _1660;
    float _1696 = _1660 * _1620;
    float _1698 = _1636 * _1620;
    float _1700 = fma((*spvDescriptorSet0.vp_c9)._m0[193].x, 0.25, _474);
    float _1702 = _1412 * _1620;
    float _1704 = -_1678;
    float _1706 = fma(_1674, _1690, _1704);
    float _1708 = -_1668;
    float _1710 = _1674 * _1708;
    float _1712 = fma(_1674, _1692, _1694);
    float _1714 = fma(_1674, _1694, _1692);
    float _1716 = fma(_1706, _1670, _1680);
    float _1718 = fma(_1696, _1670, _1710);
    float _1720 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1722 = _1688 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _1724 = fma(_1712, _1684, _1716);
    float _1726 = fma(_1698, _1684, _1718);
    float _1728 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1720);
    float _1730 = _1702 * _1668;
    float _1732 = _1130 + _1724;
    float _1734 = _1076 + _1726;
    float _1736 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1728);
    float _1738 = -_1690;
    float _1740 = fma(_1674, _1678, _1738);
    float _1742 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1744 = _1732 + _1742;
    float _1746 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1748 = _1734 + _1746;
    float _1750 = fma(_1714, _1670, _1730);
    float _1752 = _1744 * _1722;
    float _1754 = _1748 * _1722;
    float _1756 = fma(_1740, _1684, _1750);
    float _1758 = fma(_1752, _1700, _1732);
    float _1760 = _1736 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1762 = fma(_1754, _1700, _1734);
    float _1764 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1766 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1768 = _1758 + _1766;
    float _1770 = 1.0 / _1760;
    float _1772 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1774 = _1762 + _1772;
    float _1776 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1764);
    float _1778 = _1768 * _1768;
    float _1780 = _1682 + _1756;
    float _1782 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1776);
    float _1784 = fma(_1774, _1774, _1778);
    float _1786 = _1782 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1788 = sqrt(_1784);
    float _1790 = _1786 + _1760;
    float _1792 = _1790 * _1770;
    float _1794 = _1792 * 0.5;
    float _1796 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1798 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1796);
    float _1800 = 1.0 / _1798;
    bool _1802 = _1788 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1804 = _1730;
    float _1806 = _1756;
    float _1808 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1810 = _1774;
    float _1812 = _1768;
    float _1814 = _1798;
    float _1816 = _1622;
    if (!_1802)
    {
        _1804 = _1762;
    }
    float _1818 = _1804;
    float _1820 = _1818;
    if (!_1802)
    {
        _1806 = _1758;
    }
    float _1822 = _1806;
    float _1824 = _1822;
    if (!_1802)
    {
        _1808 = _1780;
    }
    float _1826 = _1808;
    bool _1828 = !_1802;
    float _1830 = _1826;
    if (!_1828)
    {
        float _1832 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1834 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1836 = _1788 + _1834;
        float _1838 = _1780 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1840 = rsqrt(_1784);
        float _1842 = _1836 * _1832;
        float _1844 = _1842 * 0.15915493667125701904296875;
        float _1846 = _1844 * 6.283185482025146484375;
        float _1848 = cos(_1846);
        float _1850 = _1844 * 6.283185482025146484375;
        float _1852 = sin(_1850);
        float _1854 = _1848 + (-1.0);
        float _1856 = _1854 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1858 = fma(_1852, _1838, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1860 = fma(_1780, _1848, _1856);
        float _1862 = _1840 * _1858;
        float _1864 = fma(_1774, _1862, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1866 = fma(_1768, _1862, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1824 = _1866;
        _1820 = _1864;
        _1830 = _1860;
    }
    float _1868 = _1824;
    float _1870 = _1820;
    float _1872 = _1830;
    float _1874 = _1872;
    float _1876 = _1870;
    float _1878 = _1868;
    if (_1656)
    {
        _1810 = 1.0;
    }
    float _1880 = _1810;
    float _1882 = _1880;
    if (!_1646)
    {
        float _1884 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1886 = _1682 + _1884;
        float _1888 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1890 = -_1130;
        float _1892 = _1890 + _1868;
        float _1894 = _1886 * _1886;
        float _1896 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1898 = _1130 + _1896;
        float _1900 = fma(_1148, _1148, _1894);
        float _1902 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1904 = fma(_1898, _1898, _1900);
        float _1906 = _1888 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1908 = sqrt(_1904);
        float _1910 = precise::min(_1908, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1912 = _1910 * _1902;
        float _1914 = -_1076;
        float _1916 = _1914 + _1870;
        float _1918 = _1906 * _1912;
        float _1920 = -_1682;
        float _1922 = _1920 + _1872;
        float _1924 = fma(_1916, _1918, _1076);
        float _1926 = fma(_1922, _1918, _1682);
        float _1928 = fma(_1892, _1918, _1130);
        _1874 = _1926;
        _1876 = _1924;
        _1878 = _1928;
        _1812 = _1908;
    }
    float _1930 = _1874;
    float _1932 = _1876;
    float _1934 = _1878;
    float _1936 = _1812;
    float _1938 = _1936;
    if (_1656)
    {
        _1814 = 1.0;
    }
    float _1940 = _1814;
    float _1942 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1944 = _1800 * _1942;
    float _1946 = _1940;
    if (!_1656)
    {
        float _1948 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1950 = _1948 * 0.15915493667125701904296875;
        float _1952 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1954 = _1950 * 6.283185482025146484375;
        float _1956 = cos(_1954);
        float _1958 = _1952 * 0.15915493667125701904296875;
        float _1960 = _1950 * 6.283185482025146484375;
        float _1962 = sin(_1960);
        float _1964 = 1.0 / _1956;
        float _1966 = _1958 * 6.283185482025146484375;
        float _1968 = cos(_1966);
        float _1970 = _1962 * _1964;
        float _1972 = _1958 * 6.283185482025146484375;
        float _1974 = sin(_1972);
        float _1976 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1978 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1976;
        float _1980 = _1968 * _1970;
        float _1982 = 1.0 / _1978;
        float _1984 = 1.0 / _1980;
        float _1986 = _1974 * _1984;
        float _1988 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1990 = fma(_1944, _1986, _1988);
        float _1992 = _1990 * _1982;
        float _1994 = precise::clamp(_1992, 0.0, 1.0);
        _1938 = _1982;
        _1882 = _1994;
    }
    float _1996 = _1938;
    float _1998 = _1882;
    float _2000 = _1996;
    if (!_1656)
    {
        float _2002 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2004 = _2002 * 0.15915493667125701904296875;
        float _2006 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2008 = _2004 * 6.283185482025146484375;
        float _2010 = cos(_2008);
        float _2012 = _2006 * 0.15915493667125701904296875;
        float _2014 = _2004 * 6.283185482025146484375;
        float _2016 = sin(_2014);
        float _2018 = 1.0 / _2010;
        float _2020 = _2012 * 6.283185482025146484375;
        float _2022 = cos(_2020);
        float _2024 = _2016 * _2018;
        float _2026 = _2012 * 6.283185482025146484375;
        float _2028 = sin(_2026);
        float _2030 = _2022 * _2024;
        float _2032 = 1.0 / _2030;
        float _2034 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2036 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2034;
        float _2038 = 1.0 / _2036;
        float _2040 = _2028 * _2032;
        float _2042 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2044 = fma(_1944, _2040, _2042);
        float _2046 = _2044 * _2038;
        float _2048 = precise::clamp(_2046, 0.0, 1.0);
        float _2050 = -_2048;
        float _2052 = _2050 + 1.0;
        _1946 = _2052;
    }
    float _2054 = _1946;
    float _2056 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2058 = _1930 + _2056;
    float _2060 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2062 = _1932 + _2060;
    float _2064 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2066 = _1934 + _2064;
    float _2068 = _2058 * _2058;
    float _2070 = fma(_2062, _2062, _2068);
    float _2072 = fma(_2066, _2066, _2070);
    float _2074 = rsqrt(_2072);
    float _2076 = sqrt(_2072);
    float _2078 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2080 = _2062 * _2078;
    float _2082 = _2066 * _2078;
    float _2084 = _2080 * _2080;
    float _2086 = _2082 * _2082;
    float _2088 = _2084 + _2086;
    float _2090 = sqrt(_2088);
    bool _2092 = _2090 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2094 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2096 = _2090 + _2094;
    float _2098 = _2066;
    float _2100 = _2088;
    float _2102 = _2096;
    float _2104 = _2078;
    if (_2092)
    {
        float _2106 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2098 = _2106;
    }
    float _2108 = _2098;
    if (_2092)
    {
        float _2110 = rsqrt(_2088);
        _2100 = _2110;
    }
    float _2112 = _2100;
    if (_2092)
    {
        float _2114 = _2096 * _2108;
        _2102 = _2114;
    }
    float _2116 = _2102;
    if (_2092)
    {
        float _2118 = _2116 * 0.15915493667125701904296875;
        _2000 = _2118;
    }
    float _2120 = _2000;
    float _2122 = _2068;
    float _2124 = _2120;
    if (_2092)
    {
        float _2126 = _2120 * 6.283185482025146484375;
        float _2128 = sin(_2126);
        _2122 = _2128;
    }
    float _2130 = _2122;
    float _2132 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2134 = precise::max(0.0, _2132);
    float _2136 = _2074;
    float _2138 = _2134;
    float _2140 = _2132;
    if (_2092)
    {
        float _2142 = _2120 * 6.283185482025146484375;
        float _2144 = cos(_2142);
        _2136 = _2144;
    }
    float _2146 = _2136;
    float _2148 = -_2078;
    float _2150 = -_2134;
    float _2152 = fma(_2058, _2148, _2150);
    float _2154 = _2152;
    if (!_2092)
    {
        _2138 = _2080;
    }
    float _2156 = _2138;
    float _2158 = _2156;
    if (_2092)
    {
        float _2160 = _2152 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2140 = _2160;
    }
    float _2162 = _2140;
    float _2164 = _2130;
    float _2166 = _2162;
    if (_2092)
    {
        float _2168 = fma(_2130, _2162, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2164 = _2168;
    }
    float _2170 = _2164;
    float _2172 = _2170;
    float _2174 = _2146;
    if (_2092)
    {
        float _2176 = _2146 + (-1.0);
        _2166 = _2176;
    }
    float _2178 = _2166;
    float _2180 = _2178;
    if (_2092)
    {
        float _2182 = _2112 * _2170;
        _2104 = _2182;
    }
    float _2184 = _2104;
    if (!_2092)
    {
        _2172 = _2084;
    }
    float _2186 = _2172;
    float _2188 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2190 = _2186;
    if (_2092)
    {
        float _2192 = _2178 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2124 = _2192;
    }
    float _2194 = _2124;
    if (_2092)
    {
        float _2196 = _2080 * _2184;
        _2158 = _2196;
    }
    float _2198 = _2158;
    if (!_2092)
    {
        _2180 = _2082;
    }
    float _2200 = _2180;
    float _2202 = _2200;
    if (_2092)
    {
        float _2204 = _2082 * _2184;
        _2202 = _2204;
    }
    float _2206 = _2202;
    if (_2092)
    {
        float _2208 = fma(_2152, _2146, _2194);
        _2154 = _2208;
    }
    float _2210 = _2154;
    if (_2092)
    {
        float _2212 = _2198 * _2198;
        _2190 = _2212;
    }
    float _2214 = _2190;
    if (!_2092)
    {
        _2174 = _2086;
    }
    float _2216 = _2174;
    float _2218 = _2216;
    if (_2092)
    {
        float _2220 = _2206 * _2206;
        _2218 = _2220;
    }
    float _2222 = _2218;
    float _2224 = fma(_2210, _2210, _2214);
    float _2226 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2228 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2230 = _2224 + _2222;
    float _2232 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2188);
    float _2234 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2236 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2238 = fma(_2076, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2236);
    float _2240 = precise::clamp(_2238, 0.0, 1.0);
    float _2242 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2226);
    float _2244 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2232);
    float _2246 = rsqrt(_2230);
    float _2248 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2250 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2234);
    float _2252 = -_2240;
    float _2254 = _2252 + 1.0;
    float _2256 = _2244 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2258 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2248);
    float _2260 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2250);
    float _2262 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2242);
    float _2264 = abs(_2254);
    float _2266 = log2(_2264);
    float _2268 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2258);
    float _2270 = _2260 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2272 = _2256 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2274 = _2262 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2276 = _2268 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2278 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2280 = -_2272;
    float _2282 = fma(_2280, _2228, 1.0);
    float _2284 = _2246 * _2198;
    float _2286 = _2246 * _2210;
    float _2288 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2278);
    float _2290 = _2246 * _2206;
    float _2292 = _2284 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2294 = log2(_2282);
    float _2296 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2288);
    float _2298 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2300 = -_2292;
    float _2302 = fma(_2286, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2300);
    float _2304 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2306 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2296);
    float _2308 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2298);
    float _2310 = -_2290;
    float _2312 = fma(_2310, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2302);
    float _2314 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2316 = 1.0 / _2306;
    float _2318 = _2286 + 1.0;
    float _2320 = fma(_2312, -0.5, 0.5);
    float _2322 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2314);
    float _2324 = fma(_2312, 0.5, 0.5);
    float _2326 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2308);
    float _2328 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2322);
    float _2330 = exp2(_2304);
    float _2332 = fma(_2324, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2334 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2326);
    float _2336 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2328);
    float _2338 = _2294 * 0.693147182464599609375;
    float _2340 = fma(_2324, _2332, -0.212114393711090087890625);
    float _2342 = sqrt(_2320);
    float _2344 = _2334 * _2316;
    float _2346 = fma(_2324, _2340, 1.570728778839111328125);
    float _2348 = _2338 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2350 = fma(_2344, -0.5, 0.5);
    float _2352 = -_2286;
    float _2354 = fma(_2330, _2318, _2352);
    float _2356 = _2336 * _2316;
    float _2358 = fma(_2354, 0.5, 0.5);
    float _2360 = fma(_2356, 0.5, 0.5);
    float _2362 = _2342 * 0.636619746685028076171875;
    float _2364 = -_2346;
    float _2366 = fma(_2362, _2364, 1.0);
    float3 _6901 = float3(_2360, _2350, _2348);
    float _2368 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6901, float3(0.0), isnan(_6901)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6901, float3(0.0), isnan(_6901)), level(0.0)).x;
    float3 _6912 = float3(_2360, _2350, _2348);
    float4 _2371 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6912, float3(0.0), isnan(_6912)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6912, float3(0.0), isnan(_6912)), level(0.0)).xyzw;
    float _2373 = _2371.x;
    float _2375 = _2371.y;
    float _2377 = _2371.z;
    float _2379 = _2371.w;
    float2 _6929 = float2(_2366, _2358);
    float3 _2383 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6929, float2(0.0), isnan(_6929)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6929, float2(0.0), isnan(_6929)), level(0.0)).xyz;
    float _2385 = _2383.x;
    float _2387 = _2383.y;
    float _2389 = _2383.z;
    out.m_67.x = _964;
    out.m_67.y = _966;
    out.m_67.z = _968;
    out.m_67.w = _970;
    float _2391 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2393 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2395 = _2393 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2397 = _996 > 0.5;
    float _2399 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2401 = _2399 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2403 = in.m_65.x;
    bool _2405 = _1002 > 0.5;
    float _2407 = 1.0 / _2395;
    int _2409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2411 = _2409 != 0;
    float _2413 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2415 = _2413 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2417 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2419 = _994 + _2417;
    int _2421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2423 = _2421 != 0;
    float _2425 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2427 = 1.0 / _2401;
    int _2429 = _2405 ? as_type<int>(_1688) : as_type<int>(_1622);
    float _2431 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2433 = _2431 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _2435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2437 = _2435 != 0;
    float _2439 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2441 = _2439 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2443 = _2397 ? as_type<int>(_1688) : as_type<int>(_1622);
    float _2445 = in.m_69.w;
    bool _2447 = _1004 > 0.5;
    float _2449 = 1.0 / _2415;
    int _2451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2453 = _2451 != 0;
    out.m_71.x = _1696;
    out.m_71.y = _1714;
    out.m_71.z = _1706;
    out.m_73.x = _1932;
    out.m_73.y = _1930;
    out.m_73.z = _1934;
    float _2455 = _2437 ? as_type<float>(_2443) : _1622;
    float _2457 = 1.0 / _2441;
    int _2459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2461 = _2459 != 0;
    float _2463 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2465 = _2463 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2469 = _2467 != 0;
    float _2471 = as_type<float>(_2443);
    bool _2473 = _2453;
    bool _2475 = _2447;
    float _2477 = _2419;
    float _2479 = _2391;
    float _2481 = _2403;
    float _2483 = _2306;
    float _2485 = _2334;
    if (_2423)
    {
        float _2487 = in.m_59.z;
        _2471 = _2487;
    }
    float _2489 = _2471;
    float _2491 = _2453 ? as_type<float>(_2429) : _1622;
    float _2493 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2495 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2493;
    float _2497 = 1.0 / _2433;
    if (_2411)
    {
        bool _2499 = _1012 > 0.5;
        _2473 = _2499;
    }
    bool _2501 = _2473;
    float _2503 = _2495 * _2407;
    float _2505 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2507 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2505;
    float _2509 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2511 = _2509 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _2513 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2515 = isnan(_994);
    bool _2517 = _2513 || _2515;
    bool _2519 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2521 = _2517 || _2519;
    float _2523 = float(_2521);
    float _2525 = 1.0 / _2465;
    float _2527 = _2507 * _2427;
    float _2529 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2531 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2529;
    float _2533 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2535 = _2533 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2537 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2539 = _2537 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2541 = _2511 * _2457;
    float _2543 = _2531 * _2449;
    float _2545 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2547 = _994 + _2545;
    float _2549 = 1.0 / _2539;
    float _2551 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2553 = _2551 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    if (_2469)
    {
        float _2555 = _2447 ? _1688 : _1622;
        _1816 = _2555;
    }
    float _2557 = _1816;
    float _2559 = fma(_2503, _2547, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2561 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2563 = _994 + _2561;
    bool _2565 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2567 = isnan(_994);
    bool _2569 = _2565 || _2567;
    bool _2571 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2573 = _2569 || _2571;
    float _2575 = float(_2573);
    float _2577 = _2553 * _2497;
    float _2579 = _2535 * _2525;
    float _2581 = fma(_2541, _2563, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2583 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2585 = _994 + _2583;
    bool _2587 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2589 = isnan(_994);
    bool _2591 = _2587 || _2589;
    bool _2593 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2595 = _2591 || _2593;
    float _2597 = float(_2595);
    float _2599 = -_2575;
    float _2601 = _2599 + 1.0;
    bool _2603 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2605 = isnan(_994);
    bool _2607 = _2603 || _2605;
    bool _2609 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2611 = _2607 || _2609;
    float _2613 = float(_2611);
    float _2615 = fma(_2527, _2585, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2617 = _2613;
    int _2619 = as_type<int>(_2559);
    float _2621 = _2557;
    if (_2423)
    {
        bool _2623 = _2489 > 0.5;
        _2475 = _2623;
    }
    bool _2625 = _2475;
    float _2627 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2629 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2627;
    bool _2631 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2633 = isnan(_994);
    bool _2635 = _2631 || _2633;
    bool _2637 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2639 = _2635 || _2637;
    float _2641 = float(_2639);
    float _2643 = _2597 * _2601;
    float _2645 = -_2597;
    float _2647 = _2645 + 1.0;
    float _2649 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2651 = _994 + _2649;
    float _2653 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2655 = _994 + _2653;
    float _2657 = -_2613;
    float _2659 = _2657 + 1.0;
    float _2661 = _2629 * _2549;
    float _2663 = fma(_2577, _2651, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2665 = fma(_2543, _2655, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2667 = _2641 * _2659;
    float _2669 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2671 = _994 + _2669;
    bool _2673 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2675 = isnan(_994);
    bool _2677 = _2673 || _2675;
    bool _2679 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2681 = _2677 || _2679;
    float _2683 = float(_2681);
    float _2685 = -_2641;
    float _2687 = _2685 + 1.0;
    bool _2689 = _1602 != 0.0;
    bool _2691 = isnan(_1602);
    bool _2693 = _2689 || _2691;
    bool _2695 = isnan(0.0);
    bool _2697 = _2693 || _2695;
    float _2699 = fma(_2579, _2671, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _2701 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2703 = isnan(_994);
    bool _2705 = _2701 || _2703;
    bool _2707 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2709 = _2705 || _2707;
    float _2711 = float(_2709);
    float _2713 = _2683 * _2687;
    float _2715 = -_2683;
    float _2717 = _2715 + 1.0;
    bool _2719 = _1600 == 0.0;
    bool _2721 = !_2697;
    bool _2723 = _2719 && _2721;
    float _2725 = in.m_75.x;
    float _2727 = in.m_75.y;
    float _2729 = in.m_75.z;
    float _2731 = -_2711;
    float _2733 = _2731 + 1.0;
    float _2735 = _2613 * _2647;
    bool _2737 = _1604 == 0.0;
    bool _2739 = _2737 && _2723;
    out.m_77.w = _2445;
    if (!_2411)
    {
        _2617 = _2403;
    }
    float _2741 = _2617;
    float _2743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2745 = fma(_2661, _2419, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2747 = _2455 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2749 = _2523 * _2717;
    bool _2751 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2753 = isnan(_994);
    bool _2755 = _2751 || _2753;
    bool _2757 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2759 = _2755 || _2757;
    float _2761 = float(_2759);
    float _2763 = _2741;
    if (_2411)
    {
        float _2765 = -_2403;
        float _2767 = _2765 + 1.0;
        _1044 = as_type<int>(_2767);
    }
    int _2769 = _1044;
    float _2771 = -_2523;
    float _2773 = _2771 + 1.0;
    float _2775 = exp2(_2425);
    float _2777 = _2761 * _2733;
    int _2779 = _2769;
    if (_2411)
    {
        float _2781 = _2501 ? as_type<float>(_2769) : _2403;
        _2763 = _2781;
    }
    float _2783 = _2763;
    if (_2423)
    {
        float _2785 = -_2403;
        float _2787 = _2785 + 1.0;
        _2779 = as_type<int>(_2787);
    }
    int _2789 = _2779;
    float _2791 = _2711 * _2773;
    float _2793 = _2559 * _2777;
    float _2795 = as_type<float>(_2789);
    if (_2461)
    {
        float _2797 = -_2403;
        float _2799 = _2797 + 1.0;
        _2619 = as_type<int>(_2799);
    }
    int _2801 = _2619;
    int _2803 = _2801;
    int _2805 = as_type<int>(_2727);
    float _2807 = _2725;
    if (_2739)
    {
        _2477 = _2727;
    }
    float _2809 = _2477;
    float _2811 = _2391 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2813 = _2809;
    if (!_2423)
    {
        _2479 = _2403;
    }
    float _2815 = _2479;
    float _2817 = -_2761;
    float _2819 = _2817 + 1.0;
    float _2821 = _2815;
    if (_2423)
    {
        float _2823 = _2625 ? as_type<float>(_2789) : _2403;
        _2821 = _2823;
    }
    float _2825 = _2821;
    float _2827 = _2743 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_2461)
    {
        float _2829 = _2397 ? as_type<float>(_2801) : _2403;
        _2481 = _2829;
    }
    float _2831 = _2481;
    if (_2739)
    {
        float _2833 = fma(_1602, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2809);
        _2803 = as_type<int>(_2833);
    }
    int _2835 = _2803;
    int _2837 = _2835;
    if (_2739)
    {
        _2795 = _2809;
    }
    float _2839 = _2795;
    float _2841 = fma(_2819, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2793);
    float _2843 = _2839;
    if (!_2739)
    {
        _2813 = _2727;
    }
    float _2845 = _2813;
    if (_2739)
    {
        float _2847 = fma(_1604, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2729);
        _2805 = as_type<int>(_2847);
    }
    int _2849 = _2805;
    int _2851 = _2849;
    if (!_2739)
    {
        float _2853 = fma(_1604, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2729);
        _2851 = as_type<int>(_2853);
    }
    int _2855 = _2851;
    float _2857 = fma(_2581, _2791, _2841);
    float _2859 = fma(_2491, _2811, -0.5);
    if (!_2739)
    {
        float _2861 = fma(_1602, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2845);
        _2837 = as_type<int>(_2861);
    }
    int _2863 = _2837;
    float _2865 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2867 = fma(_2615, _2749, _2857);
    float _2869 = fma(_2827, _2557, -0.5);
    if (_2739)
    {
        _2621 = _2729;
    }
    float _2871 = _2621;
    float _2873 = _2871;
    if (!_2739)
    {
        float _2875 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2725);
        _2807 = _2875;
    }
    float _2877 = _2807;
    bool _2879 = !_2739;
    float _2881 = _2879 ? as_type<float>(_2863) : _2845;
    float _2883 = fma(_2663, _2713, _2867);
    bool _2885 = !_2739;
    float _2887 = _2885 ? as_type<float>(_2855) : _2729;
    float _2889 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2891 = -_1322;
    float _2893 = fma(_1084, _2869, _2891);
    float _2895 = _2881 * _2881;
    float _2897 = fma(_2665, _2667, _2883);
    float _2899 = _2783 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_2739)
    {
        _2843 = as_type<float>(_2863);
    }
    float _2901 = _2843;
    float _2903 = fma(_2887, _2887, _2895);
    float _2905 = fma(_2699, _2735, _2897);
    float _2907 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2909 = _2865 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2911 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2913 = fma(_2745, _2643, _2905);
    float _2915 = -_2775;
    float _2917 = _2915 + 1.0;
    float _2919 = fma(_2909, _2825, -0.5);
    float _2921 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2911);
    float _2923 = _2893 + 0.5;
    float _2925 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2927 = _2889 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2929 = fma(_1238, _2919, _1170);
    float _2931 = fma(_2575, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2913);
    float _2933 = -_1318;
    float _2935 = fma(_1160, _2859, _2933);
    float _2937 = fma(_2927, _2831, -0.5);
    float _2939 = _2929 + 0.5;
    float _2941 = -_2901;
    float _2943 = _1674 * _2941;
    float _2945 = rsqrt(_2903);
    float _2947 = fma(_1314, _2937, _1246);
    float _2949 = _2747 * _2907;
    float _2951 = _1702 * _2901;
    if (!_2739)
    {
        _2873 = as_type<float>(_2855);
    }
    float _2953 = _2873;
    float _2955 = _2947 + 0.5;
    float _2957 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2921);
    float _2959 = _2917 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2961 = _2899 * _2925;
    float _2963 = _1662 * _2901;
    float _2965 = _2935 + 0.5;
    out.m_79.x = _2931;
    float _2967 = fma(_1706, _2877, _2963);
    bool _2969 = _2076 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2971 = isnan(_2076);
    bool _2973 = _2969 || _2971;
    bool _2975 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2977 = _2973 || _2975;
    float _2979 = _2881 * _2945;
    float _2981 = _2887 * _2945;
    out.m_81.x = _2961;
    out.m_81.y = _2949;
    out.m_81.z = _2939;
    out.m_81.w = _2923;
    float _2983 = fma(_1696, _2877, _2943);
    float _2985 = -_2979;
    float _2987 = _1712 * _2985;
    float _2989 = _2306 * 0.5;
    out.m_83.x = _2955;
    out.m_83.y = _2965;
    float _2991 = fma(_1712, _2953, _2967);
    float _2993 = fma(_2334, -0.5, _2989);
    float _2995 = fma(_1698, _2953, _2983);
    float _2997 = fma(_1714, _2877, _2951);
    float _2999 = -_2979;
    float _3001 = _1698 * _2999;
    float _3003 = -_2979;
    float _3005 = _1740 * _3003;
    float _3007 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2957);
    float _3009 = fma(_1740, _2953, _2997);
    float _3011 = _2336 + _2306;
    float _3013 = -_2959;
    float _3015 = _3013 + 1.0;
    float _3017 = _3007 + _2306;
    float _3019 = -_1674;
    float _3021 = fma(_3019, _2981, _3001);
    float _3023 = _3011 * 0.5;
    out.m_85.x = _2995;
    out.m_85.y = _3009;
    out.m_85.z = _2991;
    float _3025 = _3017 * 0.5;
    float _3027 = fma(_1702, _2981, _3005);
    float _3029 = fma(_1662, _2981, _2987);
    out.gl_Position.x = _2336;
    out.gl_Position.y = _2334;
    out.gl_Position.z = _3007;
    out.gl_Position.w = _2306;
    out.m_87.x = _3023;
    out.m_87.y = _2993;
    out.m_87.z = _3025;
    out.m_87.w = _2306;
    out.m_89.x = _3021;
    out.m_89.y = _3027;
    out.m_89.z = _3029;
    float _3031 = _1998 * _2054;
    float _3033 = _3007;
    float _3035 = _3027;
    float _3037 = _3021;
    float _3039 = _3031;
    if (!_2977)
    {
        _2483 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3041 = _2483;
    float _3043 = _3041;
    float _3045 = _3041;
    if (!_2977)
    {
        _3033 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3047 = _3033;
    float _3049 = _3047;
    float _3051 = _3047;
    if (!_2977)
    {
        _2485 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3053 = _2485;
    float _3055 = _3053;
    float _3057 = _3053;
    if (!_2977)
    {
        _3035 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3059 = _3035;
    float _3061 = _3059;
    float _3063 = _3059;
    if (!_2977)
    {
        _3037 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3065 = _3037;
    float _3067 = _2959 * _2368;
    float _3069 = _2379 * _3015;
    float _3071 = _2379 * _3067;
    float _3073 = _2389 * _3067;
    float _3075 = fma(_2385, _3071, _2373);
    float _3077 = fma(_2387, _3071, _2375);
    float _3079 = fma(_2379, _3073, _2377);
    float _3081 = _3031 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3083 = _3065;
    float _3085 = _3065;
    if (!_2977)
    {
        _3039 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3087 = _3039;
    out.m_91.x = _3075;
    out.m_91.y = _3077;
    out.m_91.z = _3079;
    out.m_91.w = _3069;
    bool _3089 = !_2977;
    float _3091 = _3087;
    float _3093 = _3087;
    if (!_3089)
    {
        bool _3095 = _2076 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3097 = isnan(_2076);
        bool _3099 = _3095 || _3097;
        bool _3101 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3103 = _3099 || _3101;
        if (!_3103)
        {
            float _3105 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3107 = _2076 + _3105;
            float _3109 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3111 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3109;
            float _3113 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3115 = _3113 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3117 = 1.0 / _3111;
            float _3119 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3121 = _3119 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3123 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3125 = _3123 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3127 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3129 = _3127 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3131 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3133 = _3131 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3135 = _3107 * _3117;
            float _3137 = precise::clamp(_3135, 0.0, 1.0);
            float _3139 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3141 = _3139 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3143 = fma(_3137, _3115, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3145 = fma(_3137, _3141, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3147 = fma(_3137, _3121, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3149 = fma(_3137, _3125, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3151 = fma(_3137, _3129, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3153 = fma(_3137, _3133, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3085 = _3147;
            _3057 = _3151;
            _3063 = _3143;
            _3051 = _3149;
            _3045 = _3145;
            _3093 = _3153;
            _3155 = true;
        }
        else
        {
            bool _3157 = _2076 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3159 = isnan(_2076);
            bool _3161 = _3157 || _3159;
            bool _3163 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3165 = _3161 || _3163;
            if (!_3165)
            {
                _3061 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3167 = _3061;
            _3063 = _3167;
            if (!_3165)
            {
                _3083 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3169 = _3083;
            _3085 = _3169;
            if (!_3165)
            {
                _3043 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3171 = _3043;
            _3045 = _3171;
            if (!_3165)
            {
                _3049 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3173 = _3049;
            _3051 = _3173;
            if (!_3165)
            {
                _3055 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3175 = _3055;
            _3057 = _3175;
            if (!_3165)
            {
                _3091 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3177 = _3091;
            bool _3179 = !_3165;
            _3093 = _3177;
            if (!_3179)
            {
                bool _3181 = _2076 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3183 = isnan(_2076);
                bool _3185 = _3181 || _3183;
                bool _3187 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3189 = _3185 || _3187;
                if (!_3189)
                {
                    float _3191 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3193 = _2076 + _3191;
                    float _3195 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3197 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3195;
                    float _3199 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3201 = _3199 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3203 = 1.0 / _3197;
                    float _3205 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3207 = _3205 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3209 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3211 = _3209 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3213 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3215 = _3213 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3217 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3219 = _3217 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3221 = _3193 * _3203;
                    float _3223 = precise::clamp(_3221, 0.0, 1.0);
                    float _3225 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3227 = _3225 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3229 = fma(_3223, _3201, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3231 = fma(_3223, _3227, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3233 = fma(_3223, _3207, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3235 = fma(_3223, _3211, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3237 = fma(_3223, _3215, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3239 = fma(_3223, _3219, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3085 = _3233;
                    _3057 = _3237;
                    _3063 = _3229;
                    _3051 = _3235;
                    _3045 = _3231;
                    _3093 = _3239;
                    _3155 = true;
                }
                else
                {
                    _3085 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3057 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3063 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3051 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3045 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3093 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3155 = false;
    float _3241 = _3085;
    float _3243 = _3057;
    float _3245 = _3063;
    float _3247 = _3051;
    float _3249 = _3045;
    float _3251 = _3093;
    float _3253 = fma(_3009, -0.5, 0.5);
    float _3255 = precise::clamp(_3253, 0.0, 1.0);
    float _3257 = -_3241;
    float _3259 = _3257 + _3243;
    float _3261 = _3081 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3263 = -_3245;
    float _3265 = _3263 + _3247;
    float _3267 = fma(_3255, _3259, _3241);
    out.m_93.x = 0.0;
    float _3269 = -_3249;
    float _3271 = _3269 + _3251;
    float _3273 = fma(_3255, _3265, _3245);
    float _3275 = _3267 * 0.586610972881317138671875;
    out.m_47.x = _3261;
    bool _3277 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3279 = fma(_3255, _3271, _3249);
    float _3281 = fma(_3273, 0.298911988735198974609375, _3275);
    bool _3283 = _1998 > 0.0;
    bool _3285 = isnan(_1998);
    bool _3287 = _3283 || _3285;
    bool _3289 = isnan(0.0);
    bool _3291 = _3287 || _3289;
    float _3293 = fma(_3279, 0.114477999508380889892578125, _3281);
    bool _3295 = _2054 <= 0.0;
    bool _3297 = !_3291;
    bool _3299 = _3295 || _3297;
    float _3301 = -_3293;
    float _3303 = _3273 + _3301;
    float _3305 = -_3293;
    float _3307 = _3267 + _3305;
    float _3309 = -_3293;
    float _3311 = _3279 + _3309;
    float _3313 = fma(_3303, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3293);
    float _3315 = fma(_3307, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3293);
    float _3317 = fma(_3311, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3293);
    bool _3319 = !_3277;
    if (!_3319)
    {
        float _3321 = -_1930;
        float _3323 = _3321 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3325 = -_1932;
        float _3327 = _3325 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3329 = -_1934;
        float _3331 = _3329 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3333 = _3323 * _3323;
        float _3335 = fma(_3327, _3327, _3333);
        float _3337 = fma(_3331, _3331, _3335);
        float _3339 = sqrt(_3337);
        float _3341 = rsqrt(_3337);
        float _3343 = -_3339;
        float _3345 = _3343 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3347 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3349 = precise::clamp(_3347, 0.0, 1.0);
        float _3351 = _3327 * _3341;
        float _3353 = _3323 * _3341;
        float _3355 = abs(_3349);
        float _3357 = log2(_3355);
        float _3359 = _3331 * _3341;
        float _3361 = _3351 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3363 = _3009 * _3353;
        float _3365 = -_3353;
        float _3367 = -_3361;
        float _3369 = fma(_3365, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3367);
        float _3371 = fma(_2995, _3351, _3363);
        float _3373 = -_3359;
        float _3375 = fma(_3373, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3369);
        float _3377 = fma(_2991, _3359, _3371);
        float _3379 = precise::clamp(_3377, 0.0, 1.0);
        float _3381 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3383 = _3375 + _3381;
        float _3385 = _3357 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3387 = _3383 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3389 = precise::clamp(_3387, 0.0, 1.0);
        float _3391 = exp2(_3385);
        float _3393 = _3391 * _3389;
        float _3395 = _3379 * _3393;
        float _3397 = _3395 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3399 = _3395 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3401 = _3395 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _3397;
        out.m_93.y = _3399;
        out.m_93.z = _3401;
    }
    out.m_95.x = _3313;
    out.m_95.y = _3315;
    out.m_95.z = _3317;
    if (!_3299)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _3403 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3403;
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
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3155 = false;
    bool _992 = false;
    bool _780 = false;
    bool _498 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_44.w;
    float _111 = trunc(_109);
    int _114 = int(_111);
    bool _118 = _114 >= 1;
    float _120 = 0.0;
    float _122 = as_type<float>(_114);
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _124 = _120;
    if (!_118)
    {
        out.m_47.x = 0.0;
    }
    int _126 = 0;
    if (!_118)
    {
        float _128 = _124 * 5.0;
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    int _132 = _130;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3461 = as_type<float>(_130);
        out.gl_Position.z = _3461;
    }
    if (!_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_49.w;
    float _136 = float(_114);
    float _138 = -_134;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_134);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    bool _152 = _140 >= _136;
    bool _154 = !_150;
    bool _156 = _152 || _154;
    float _158 = _140;
    if (_156)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _122;
    if (_156)
    {
        out.m_47.x = 0.0;
    }
    if (_156)
    {
        float _162 = _160 * 5.0;
        _132 = as_type<int>(_162);
    }
    int _164 = _132;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3525 = as_type<float>(_164);
        out.gl_Position.z = _3525;
    }
    if (_156)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _166 = in.m_51.x;
    float _168 = in.m_51.y;
    float _170 = in.m_51.z;
    float _172 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _174 = in.m_53.x;
    float _176 = in.m_53.y;
    float _178 = in.m_53.z;
    bool _180 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _182 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _184 = _180 || _182;
    bool _186 = isnan(1.0);
    bool _188 = _184 || _186;
    float _190 = in.m_55.x;
    float _192 = in.m_55.y;
    float _194 = in.m_55.z;
    float _196 = in.m_57.w;
    float _198 = in.m_49.x;
    float _200 = in.m_49.y;
    float _202 = in.m_49.z;
    float _204 = _166 * _166;
    float _206 = _168 * _168;
    float _208 = _170 * _170;
    float _210 = fma(_174, _174, _204);
    float _212 = fma(_176, _176, _206);
    float _214 = fma(_178, _178, _208);
    float _216 = fma(_190, _190, _210);
    float _218 = fma(_192, _192, _212);
    float _220 = fma(_194, _194, _214);
    float _222 = sqrt(_216);
    float _224 = sqrt(_218);
    float _226 = sqrt(_220);
    bool _228 = _222 > 0.0;
    bool _230 = _224 > 0.0;
    float _232 = 0.0;
    float _234 = _216;
    float _236 = _218;
    float _238 = _220;
    float _240 = _178;
    float _242 = _174;
    if (_228)
    {
        float _244 = rsqrt(_216);
        _232 = _244;
    }
    float _246 = _232;
    float _248 = 0.0;
    float _250 = 0.0;
    if (!_228)
    {
        _248 = 0.0;
        _250 = 0.0;
    }
    float _252 = _248;
    float _254 = _250;
    bool _256 = _226 > 0.0;
    float _258 = in.m_44.x;
    float _260 = in.m_44.y;
    float _262 = in.m_44.z;
    float _264 = 0.0;
    float _266 = _252;
    float _268 = _254;
    if (!_228)
    {
        _264 = 0.0;
    }
    float _270 = _264;
    float _272 = 0.0;
    float _274 = 0.0;
    float _276 = _270;
    if (!_230)
    {
        _272 = 0.0;
        _274 = 0.0;
    }
    float _278 = _272;
    float _280 = _274;
    float _282 = 0.0;
    float _284 = _280;
    float _286 = _278;
    if (_230)
    {
        float _288 = rsqrt(_218);
        _282 = _288;
    }
    float _290 = _282;
    if (!_188)
    {
        float _292 = _172 * _172;
        float _294 = _292 * 0.5;
        _234 = _294;
    }
    float _296 = _234;
    float _298 = 0.0;
    float _300 = _296;
    if (!_230)
    {
        _298 = 0.0;
    }
    float _302 = _298;
    float _304 = _302;
    if (!_188)
    {
        float _306 = _296 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _300 = _306;
    }
    float _308 = _300;
    float _310 = 0.0;
    float _312 = _308;
    if (_256)
    {
        float _314 = rsqrt(_220);
        _310 = _314;
    }
    float _316 = _310;
    if (_228)
    {
        float _318 = _246 * _174;
        _276 = _318;
    }
    float _320 = _276;
    if (_228)
    {
        float _322 = _246 * _166;
        _266 = _322;
    }
    float _324 = _266;
    if (_228)
    {
        float _326 = _246 * _190;
        _268 = _326;
    }
    float _328 = _268;
    if (!_256)
    {
        _236 = 0.0;
    }
    float _330 = _236;
    float _332 = _330;
    if (_230)
    {
        float _334 = _290 * _176;
        _284 = _334;
    }
    float _336 = _284;
    if (_230)
    {
        float _338 = _290 * _168;
        _286 = _338;
    }
    float _340 = _286;
    if (_230)
    {
        float _342 = _290 * _192;
        _304 = _342;
    }
    float _344 = _304;
    bool _346 = !_188;
    if (!_346)
    {
        float _348 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _350 = log2(_348);
        float _352 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _354 = _352 + 1.0;
        float _356 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _358 = _172 * _350;
        float _360 = 1.0 / _354;
        float _362 = _356 * 0.693147182464599609375;
        float _364 = exp2(_358);
        float _366 = 1.0 / _362;
        float _368 = _364 + (-1.0);
        float _370 = -_368;
        float _372 = fma(_370, _366, _172);
        float _374 = _372 * _360;
        float _376 = _374 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _312 = _376;
        _238 = _362;
    }
    float _378 = _312;
    float _380 = _238;
    float _382 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _384 = 1.0 / _136;
    float _386 = _380;
    float _388 = _378;
    if (_256)
    {
        float _390 = _316 * _170;
        _332 = _390;
    }
    float _392 = _332;
    float _394 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _396 = _382 * _324;
    float _398 = _382 * _340;
    float _400 = _392;
    if (!_256)
    {
        _386 = 0.0;
    }
    float _402 = _386;
    float _404 = _382 * _392;
    float _406 = fma(_394, _320, _396);
    float _408 = _402;
    if (_256)
    {
        float _410 = _316 * _178;
        _408 = _410;
    }
    float _412 = _408;
    float _414 = _378 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _416 = fma(_394, _336, _398);
    if (!_256)
    {
        _400 = 0.0;
    }
    float _418 = _400;
    float _420 = _418;
    if (_256)
    {
        float _422 = _316 * _194;
        _420 = _422;
    }
    float _424 = _420;
    float _426 = fma(_394, _412, _404);
    float _428 = fma(_414, _328, _406);
    float _430 = fma(_414, _344, _416);
    if (!_188)
    {
        _388 = _172;
    }
    float _432 = _388;
    bool _434 = !_188;
    float _436 = _432;
    if (!_434)
    {
        float _438 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _440 = log2(_438);
        float _442 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _444 = _442 + 1.0;
        float _446 = 1.0 / _444;
        float _448 = _172 * _440;
        float _450 = exp2(_448);
        float _452 = -_450;
        float _454 = _452 + 1.0;
        float _456 = _454 * _446;
        _436 = _456;
    }
    float _458 = _436;
    bool _460 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _462 = fma(_414, _424, _426);
    float _464 = fma(_458, _198, _428);
    float _466 = fma(_458, _200, _430);
    float _468 = fma(_458, _202, _462);
    float _470 = fma(_464, _196, _258);
    float _472 = fma(_466, _196, _260);
    float _474 = _140 * _384;
    float _476 = fma(_468, _196, _262);
    bool _478 = !_460;
    float _496;
    if (!_478)
    {
        float _480 = in.m_59.x;
        float _482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _484 = _480 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _486 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _488 = _486 * _482;
        float _490 = floor(_488);
        float _492 = -_490;
        float _494 = _488 + _492;
        _496 = _494;
        _498 = true;
    }
    else
    {
        _496 = _474;
    }
    _498 = false;
    float _500 = _496;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _504 = _500 + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _508 = _500 + _506;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _512 = _500 + _510;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _514;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _522;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _530 = 1.0 / _516;
    bool _532 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _534 = isnan(_500);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = 1.0 / _528;
    bool _546 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _548 = isnan(_500);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    bool _558 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _560 = 1.0 / _520;
    float _562 = _504 * _530;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _566 = _500 + _564;
    float _568 = 1.0 / _524;
    float _570 = _566 * _544;
    bool _572 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _574 = isnan(_500);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    bool _584 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _586 = isnan(_500);
    bool _588 = _584 || _586;
    bool _590 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _592 = _588 || _590;
    float _594 = float(_592);
    float _596 = -_582;
    float _598 = _596 + 1.0;
    float _600 = _508 * _560;
    float _602 = -_556;
    float _604 = _602 + 1.0;
    float _606 = _594 * _598;
    float _608 = -_594;
    float _610 = _608 + 1.0;
    float _612 = _582 * _604;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _614;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _618;
    float _622 = _512 * _568;
    bool _624 = _500 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _626 = isnan(_500);
    bool _628 = _624 || _626;
    bool _630 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _632 = _628 || _630;
    float _634 = float(_632);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _636;
    float _640 = fma(_616, _562, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _642 = fma(_620, _562, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _648 = -_634;
    float _650 = _648 + 1.0;
    float _652 = _634 * _610;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _656 = _654 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _658 = fma(_638, _562, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _660 = _542 * _650;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _666 = fma(_646, _600, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _668;
    float _672 = _640 * _660;
    float _674 = _642 * _660;
    float _676 = _658 * _660;
    float _678 = -_542;
    float _680 = _678 + 1.0;
    float _682 = in.m_57.x;
    float _684 = in.m_57.y;
    float _686 = in.m_57.z;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _692;
    float _696 = fma(_656, _600, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _698 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[143].x, _672);
    float _700 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[143].y, _674);
    float _702 = fma(_664, _600, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _704 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[143].z, _676);
    float _706 = fma(_690, _622, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _708 = fma(_670, _622, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _710 = fma(_694, _622, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _712 = fma(_666, _652, _698);
    float _714 = fma(_696, _652, _700);
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _718 = _716 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _722 = _720 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _728 = fma(_702, _652, _704);
    float _730 = fma(_718, _570, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _732 = fma(_722, _570, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _734 = fma(_706, _606, _712);
    float _736 = fma(_708, _606, _714);
    float _738 = fma(_726, _570, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _740 = fma(_710, _606, _728);
    float _742 = fma(_730, _612, _734);
    float _744 = fma(_732, _612, _736);
    float _746 = fma(_738, _612, _740);
    float _748 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[147].x, _742);
    float _750 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[147].y, _744);
    float _752 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[147].z, _746);
    float _754 = _748 * _682;
    float _756 = _750 * _684;
    float _758 = _752 * _686;
    bool _760 = !_558;
    float _778;
    if (!_760)
    {
        float _762 = in.m_59.x;
        float _764 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _766 = _762 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _768 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[11].y, _140);
        float _770 = _768 * _764;
        float _772 = floor(_770);
        float _774 = -_772;
        float _776 = _770 + _774;
        _778 = _776;
        _780 = true;
    }
    else
    {
        _778 = _474;
    }
    _780 = false;
    float _782 = _778;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _786 = _782 + _784;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _792;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _798 = _796 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _800 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _802 = isnan(_782);
    bool _804 = _800 || _802;
    bool _806 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _808 = _804 || _806;
    float _810 = float(_808);
    float _812 = 1.0 / _790;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _816 = _814 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _818 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _820 = isnan(_782);
    bool _822 = _818 || _820;
    bool _824 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _826 = _822 || _824;
    float _828 = float(_826);
    bool _830 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _832 = 1.0 / _798;
    float _834 = _794 * _812;
    bool _836 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _838 = isnan(_782);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = 1.0 / _816;
    float _850 = -_810;
    float _852 = _850 + 1.0;
    float _854 = fma(_834, _786, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _858 = _856 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _860 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _862 = isnan(_782);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _868 = _864 || _866;
    float _870 = float(_868);
    float _872 = -_846;
    float _874 = _872 + 1.0;
    float _876 = _846 * _852;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _882 = 1.0 / _858;
    float _884 = -_870;
    float _886 = _884 + 1.0;
    float _888 = _828 * _874;
    float _890 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _890;
    float _894 = _880 * _832;
    float _896 = _810 * _886;
    float _898 = _854 * _888;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _902 = _782 + _900;
    float _904 = -_828;
    float _906 = _904 + 1.0;
    bool _908 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _910 = isnan(_782);
    bool _912 = _908 || _910;
    bool _914 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _916 = _912 || _914;
    float _918 = float(_916);
    float _920 = _892 * _848;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _924 = _922 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _928 = _782 + _926;
    float _930 = fma(_894, _902, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _932 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[115].x, _898);
    float _934 = -_918;
    float _936 = _934 + 1.0;
    float _938 = _924 * _882;
    float _940 = fma(_920, _928, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _944 = _782 + _942;
    float _946 = fma(_930, _876, _932);
    float _948 = _870 * _936;
    float _950 = fma(_938, _944, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _952 = fma(_940, _896, _946);
    float _954 = fma(_950, _948, _952);
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _962 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[119].x, _954);
    float _964 = _958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _966 = _956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _968 = _960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _970 = _962 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _972 = !_830;
    float _990;
    if (!_972)
    {
        float _974 = in.m_59.x;
        float _976 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _978 = _974 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _980 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[14].x, _140);
        float _982 = _980 * _976;
        float _984 = floor(_982);
        float _986 = -_984;
        float _988 = _982 + _986;
        _990 = _988;
        _992 = true;
    }
    else
    {
        _990 = _474;
    }
    _992 = false;
    float _994 = _990;
    float _996 = in.m_59.y;
    float _998 = _472 * _176;
    float _1000 = _472 * _192;
    float _1002 = in.m_59.z;
    float _1004 = in.m_59.w;
    float _1006 = fma(_470, _174, _998);
    int _1008 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1010 = _1008 != 0;
    float _1012 = in.m_59.x;
    float _1014 = fma(_470, _190, _1000);
    float _1016 = fma(_476, _178, _1006);
    int _1018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1020 = _1018 != 0;
    int _1022 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1024 = _1022 != 0;
    int _1026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1028 = _1026 != 0;
    float _1030 = in.m_55.w;
    float _1032 = fma(_476, _194, _1014);
    float _1034 = in.m_53.w;
    float _1036 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1040 = _996 * 2.0;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    int _1044 = as_type<int>(_994);
    if (!_1010)
    {
        _240 = _996;
    }
    float _1046 = _240;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1050 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1052 = _1002 * 2.0;
    float _1054 = _1046;
    if (!_1010)
    {
        _1042 = _1002;
    }
    float _1056 = _1042;
    float _1058 = floor(_1040);
    float _1060 = _1056;
    if (_1010)
    {
        _1060 = _996;
    }
    float _1062 = _1060;
    if (_1010)
    {
        _1054 = _1012;
    }
    float _1064 = _1054;
    if (_1010)
    {
        _242 = _1012;
    }
    float _1066 = _242;
    float _1068 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1036);
    float _1070 = _1066;
    if (!_1010)
    {
        _1070 = _1002;
    }
    float _1072 = _1070;
    float _1074 = floor(_1052);
    float _1076 = _1016 + _1034;
    float _1078 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1080 = _1072;
    if (!_1010)
    {
        _1080 = _1002;
    }
    float _1082 = _1080;
    float _1084 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1068);
    float _1086 = _1082;
    if (_1010)
    {
        _1086 = _996;
    }
    float _1088 = _1086;
    float _1090 = -_1048;
    float _1092 = fma(_1078, 2.0, _1090);
    bool _1094 = _1058 >= 0.0;
    bool _1096 = isnan(_1058);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan(0.0);
    bool _1102 = _1098 || _1100;
    float _1104 = _1012 * 2.0;
    bool _1106 = _1058 > 0.0;
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1110 = floor(_1104);
    int _1112 = _1102 ? 0 : 1;
    float _1114 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1108);
    bool _1116 = _1074 > 0.0;
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1120 = _1074 >= 0.0;
    bool _1122 = isnan(_1074);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    float _1130 = _1032 + _1030;
    float _1132 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1134 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1118);
    int _1136 = _1128 ? 0 : 1;
    float _1138 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1140 = log2(_1138);
    float _1142 = -_1038;
    float _1144 = fma(_1132, 2.0, _1142);
    float _1146 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1148 = _1076 + _1146;
    float _1150 = -_1130;
    float _1152 = _1150 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _1154 = ~_1136;
    int _1156 = _1154 + 1;
    int _1158 = _1156 + 1;
    float _1160 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1114);
    int _1162 = ~_1112;
    int _1164 = _1162 + 1;
    int _1166 = _1164 + 1;
    float _1168 = -_140;
    float _1170 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1144);
    int _1172 = _1158;
    int _1174 = _1166;
    float _1176 = _1152;
    if (!_1116)
    {
        int _1178 = ~_1136;
        int _1180 = _1178 + 1;
        _1172 = _1180;
    }
    int _1182 = _1172;
    float _1184 = _1088 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_1106)
    {
        int _1186 = ~_1112;
        int _1188 = _1186 + 1;
        _1174 = _1188;
    }
    int _1190 = _1174;
    float _1192 = _996 + _1012;
    float _1194 = abs(_1148);
    float _1196 = abs(_1152);
    float _1198 = precise::max(_1194, _1196);
    float _1200 = fma(_1184, -2.0, _1050);
    float _1202 = _1002 + _1012;
    float _1204 = _1140 * _140;
    bool _1206 = _1198 >= 16.0;
    float _1208 = _1192 + (-1.0);
    bool _1210 = !_1020;
    int _1212 = _1210 ? 0 : 1;
    float _1214 = _1202 + (-1.0);
    float _1216 = _1192;
    if (_1010)
    {
        _1216 = _996;
    }
    float _1218 = _1216;
    float _1220 = exp2(_1204);
    float _1222 = _1218;
    if (!_1010)
    {
        _1222 = _1012;
    }
    float _1224 = _1222;
    float _1226 = fma(_1208, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1228 = abs(_1212);
    float _1230 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1234 = _1224 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1236 = float(_1228);
    float _1238 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1134);
    float _1240 = float(_1182);
    float _1242 = fma(_1234, -2.0, _1232);
    float _1244 = -_140;
    float _1246 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1092);
    float _1248 = _1236 * _1240;
    bool _1250 = _1110 > 0.0;
    float _1252 = in.m_61.x;
    float _1254 = in.m_61.y;
    float _1256 = in.m_61.z;
    bool _1258 = _1110 >= 0.0;
    bool _1260 = isnan(_1110);
    bool _1262 = _1258 || _1260;
    bool _1264 = isnan(0.0);
    bool _1266 = _1262 || _1264;
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1270 = 1.0 + _1268;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1274 = !_1028;
    int _1276 = _1274 ? 0 : 1;
    float _1278 = -_1220;
    float _1280 = _1278 + 1.0;
    bool _1282 = !_1024;
    int _1284 = _1282 ? 0 : 1;
    float _1286 = 1.0 / _1270;
    bool _1288 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1290 = isnan(0.0);
    bool _1292 = _1288 || _1290;
    bool _1294 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1296 = _1292 || _1294;
    float _1298 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1272);
    int _1300 = abs(_1276);
    float _1302 = _1248 * (-2.0);
    bool _1304 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1306 = isnan(1.0);
    bool _1308 = _1304 || _1306;
    bool _1310 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1312 = _1308 || _1310;
    float _1314 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1298);
    int _1316 = abs(_1284);
    float _1318 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1242);
    float _1320 = _1296 ? _1280 : 0.0;
    float _1322 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1200);
    int _1324 = _1266 ? 0 : 1;
    float _1326 = _1012 + (-0.5);
    bool _1328 = _1296;
    if (_1206)
    {
        float _1330 = _1152 * 0.0625;
        _1176 = _1330;
    }
    float _1332 = _1176;
    int _1334 = ~_1324;
    int _1336 = _1334 + 1;
    int _1338 = _1336 + 1;
    float _1340 = fma(_1226, _1302, _1226);
    int _1342 = _1338;
    if (!_1250)
    {
        int _1344 = ~_1324;
        int _1346 = _1344 + 1;
        _1342 = _1346;
    }
    int _1348 = _1342;
    float _1350 = _1148 * 0.0625;
    float _1352 = float(_1300);
    if (_1312)
    {
        float _1354 = _1320 * _1286;
        _158 = _1354;
    }
    float _1356 = _158;
    float _1358 = float(_1190);
    float _1360 = fma(_1302, _1252, _1252);
    float _1362 = float(_1348);
    float _1364 = _1352 * _1358;
    float _1366 = _1206 ? _1350 : _1148;
    float _1368 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1360);
    float _1370 = float(_1316);
    float _1372 = _1364 * (-2.0);
    float _1374 = abs(_1366);
    bool _1376 = _1374 != 0.0;
    bool _1378 = isnan(_1374);
    bool _1380 = _1376 || _1378;
    bool _1382 = isnan(0.0);
    bool _1384 = _1380 || _1382;
    float _1386 = fma(_1340, _1356, _1368);
    float _1388 = abs(_1332);
    bool _1390 = _1388 == 0.0;
    float _1392 = _1370 * _1362;
    float _1394 = abs(_1332);
    bool _1396 = _1394 == 0.0;
    bool _1398 = !_1384;
    bool _1400 = _1396 && _1398;
    float _1402 = _996 + _1002;
    float _1404 = _1386 * 0.15915493667125701904296875;
    float _1406 = _1392 * (-2.0);
    float _1408 = _1402 + (-1.0);
    float _1410 = _1404 * 6.283185482025146484375;
    float _1412 = cos(_1410);
    float _1414 = fma(_1230, _1372, _1230);
    float _1416 = fma(_1372, _1256, _1256);
    float _1418 = fma(_1406, _1254, _1254);
    float _1420 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1422 = _996 + (-0.5);
    float _1424 = _1002 + (-0.5);
    int _1426 = as_type<int>(_1424);
    float _1428 = _1356;
    if (_1400)
    {
        bool _1430 = as_type<int>(_1332) >= 0;
        _1328 = _1430;
    }
    bool _1432 = _1328;
    float _1434 = _1404 * 6.283185482025146484375;
    float _1436 = sin(_1434);
    float _1438 = fma(_1420, _1406, _1420);
    float _1440 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1416);
    float _1442 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1418);
    int _1444 = _1432 ? (-1) : 0;
    if (_1400)
    {
        int _1446 = _1432 ? 0 : 1078530011;
        _1426 = _1446;
    }
    int _1448 = _1426;
    float _1450 = fma(_1414, _1356, _1440);
    float _1452 = fma(_1438, _1356, _1442);
    int _1454 = _1448;
    if (_1400)
    {
        int _1456 = int(0x80000000) & as_type<int>(_1366);
        int _1458 = _1448 | _1456;
        _1428 = as_type<float>(_1458);
    }
    float _1460 = _1428;
    bool _1462 = !_1384;
    bool _1464 = _1462 && _1390;
    float _1466 = _1460;
    float _1468 = _1460;
    if (!_1464)
    {
        float _1470 = abs(_1366);
        bool _1472 = _1470 != as_type<float>(0x7f800000u /* inf */);
        bool _1474 = isnan(_1470);
        bool _1476 = _1472 || _1474;
        bool _1478 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1480 = _1476 || _1478;
        float _1482 = abs(_1332);
        bool _1484 = _1482 == as_type<float>(0x7f800000u /* inf */);
        float _1486 = abs(_1332);
        bool _1488 = _1486 == as_type<float>(0x7f800000u /* inf */);
        bool _1490 = !_1480;
        bool _1492 = _1488 && _1490;
        if (_1492)
        {
            bool _1494 = as_type<int>(_1332) >= 0;
            _1444 = _1494 ? (-1) : 0;
        }
        int _1496 = _1444;
        if (_1492)
        {
            _1454 = 1075235812;
        }
        int _1498 = _1454;
        int _1500 = _1498;
        if (_1492)
        {
            int _1502 = ~_1496;
            int _1504 = (_1502 != 0) ? _1498 : 1061752795;
            _1500 = _1504;
        }
        int _1506 = _1500;
        if (_1492)
        {
            int _1508 = int(0x80000000) & as_type<int>(_1366);
            int _1510 = _1506 | _1508;
            _1466 = as_type<float>(_1510);
        }
        float _1512 = _1466;
        bool _1514 = !_1480;
        bool _1516 = _1514 && _1484;
        _1468 = _1512;
        if (!_1516)
        {
            float _1518 = abs(_1366);
            float _1520 = abs(_1332);
            float _1522 = precise::max(_1518, _1520);
            float _1524 = abs(_1366);
            float _1526 = abs(_1332);
            float _1528 = precise::min(_1524, _1526);
            float _1530 = 1.0 / _1522;
            float _1532 = abs(_1366);
            float _1534 = abs(_1332);
            bool _1536 = _1532 > _1534;
            bool _1538 = as_type<int>(_1332) >= 0;
            float _1540 = abs(_1366);
            float _1542 = abs(_1332);
            float _1544 = _1540 + _1542;
            bool _1546 = _1544 > as_type<float>(0x7f800000u /* inf */);
            bool _1548 = isnan(_1544);
            bool _1550 = _1546 || _1548;
            bool _1552 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1554 = _1550 || _1552;
            float _1556 = _1528 * _1530;
            float _1558 = _1556 * _1556;
            float _1560 = _1558 + 11.33538818359375;
            float _1562 = fma(_1558, _1560, 28.84246826171875);
            float _1564 = fma(_1558, _1562, 19.6966705322265625);
            float _1566 = fma(_1558, -0.82336294651031494140625, -5.674867153167724609375);
            float _1568 = fma(_1558, _1566, -6.565555095672607421875);
            float _1570 = 1.0 / _1564;
            float _1572 = _1558 * _1568;
            float _1574 = _1556 * _1572;
            float _1576 = fma(_1574, _1570, _1556);
            int _1578 = as_type<int>(_1366) & int(0x80000000);
            float _1580 = _1576;
            _1468 = _1544;
            if (_1536)
            {
                float _1582 = -_1576;
                float _1584 = _1582 + 1.57079637050628662109375;
                _1580 = _1584;
            }
            float _1586 = _1580;
            int _1588 = as_type<int>(_1586);
            if (!_1538)
            {
                float _1590 = -_1586;
                float _1592 = _1590 + 3.1415927410125732421875;
                _1588 = as_type<int>(_1592);
            }
            int _1594 = _1588;
            if (!_1554)
            {
                int _1596 = _1578 | _1594;
                _1468 = as_type<float>(_1596);
            }
        }
    }
    float _1598 = _1468;
    float _1600 = in.m_63.x;
    float _1602 = in.m_63.y;
    float _1604 = in.m_63.z;
    float _1606 = -_1598;
    float _1608 = _1452 + _1606;
    float _1610 = _1450 * 0.15915493667125701904296875;
    float _1612 = _472 * _168;
    float _1614 = in.m_51.w;
    float _1616 = _1608 * 0.15915493667125701904296875;
    float _1618 = _1610 * 6.283185482025146484375;
    float _1620 = cos(_1618);
    float _1622 = in.m_65.y;
    float _1624 = fma(_470, _166, _1612);
    float _1626 = _756 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1628 = _758 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1630 = _754 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1632 = fma(_476, _170, _1624);
    float _1634 = _1616 * 6.283185482025146484375;
    float _1636 = sin(_1634);
    bool _1638 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1640 = isnan(0.5);
    bool _1642 = _1638 || _1640;
    bool _1644 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1646 = _1642 || _1644;
    bool _1648 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1650 = isnan(0.5);
    bool _1652 = _1648 || _1650;
    bool _1654 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1656 = _1652 || _1654;
    float _1658 = _1616 * 6.283185482025146484375;
    float _1660 = cos(_1658);
    float _1662 = _1436 * _1620;
    float _1664 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1602);
    float _1666 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1600);
    float _1668 = _1664 * _1626;
    float _1670 = _1666 * _1630;
    float _1672 = _1610 * 6.283185482025146484375;
    float _1674 = sin(_1672);
    float _1676 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1604);
    float _1678 = _1412 * _1636;
    float _1680 = _1662 * _1668;
    float _1682 = _1632 + _1614;
    float _1684 = _1676 * _1628;
    float _1686 = -_1622;
    float _1688 = _1686 + 1.0;
    float _1690 = _1436 * _1660;
    float _1692 = _1436 * _1636;
    float _1694 = _1412 * _1660;
    float _1696 = _1660 * _1620;
    float _1698 = _1636 * _1620;
    float _1700 = fma((*spvDescriptorSet0.vp_c9)._m0[193].x, 0.25, _474);
    float _1702 = _1412 * _1620;
    float _1704 = -_1678;
    float _1706 = fma(_1674, _1690, _1704);
    float _1708 = -_1668;
    float _1710 = _1674 * _1708;
    float _1712 = fma(_1674, _1692, _1694);
    float _1714 = fma(_1674, _1694, _1692);
    float _1716 = fma(_1706, _1670, _1680);
    float _1718 = fma(_1696, _1670, _1710);
    float _1720 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1722 = _1688 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _1724 = fma(_1712, _1684, _1716);
    float _1726 = fma(_1698, _1684, _1718);
    float _1728 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1720);
    float _1730 = _1702 * _1668;
    float _1732 = _1130 + _1724;
    float _1734 = _1076 + _1726;
    float _1736 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1728);
    float _1738 = -_1690;
    float _1740 = fma(_1674, _1678, _1738);
    float _1742 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1744 = _1732 + _1742;
    float _1746 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1748 = _1734 + _1746;
    float _1750 = fma(_1714, _1670, _1730);
    float _1752 = _1744 * _1722;
    float _1754 = _1748 * _1722;
    float _1756 = fma(_1740, _1684, _1750);
    float _1758 = fma(_1752, _1700, _1732);
    float _1760 = _1736 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1762 = fma(_1754, _1700, _1734);
    float _1764 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1766 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1768 = _1758 + _1766;
    float _1770 = 1.0 / _1760;
    float _1772 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1774 = _1762 + _1772;
    float _1776 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1764);
    float _1778 = _1768 * _1768;
    float _1780 = _1682 + _1756;
    float _1782 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1776);
    float _1784 = fma(_1774, _1774, _1778);
    float _1786 = _1782 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1788 = sqrt(_1784);
    float _1790 = _1786 + _1760;
    float _1792 = _1790 * _1770;
    float _1794 = _1792 * 0.5;
    float _1796 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1798 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1796);
    float _1800 = 1.0 / _1798;
    bool _1802 = _1788 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1804 = _1730;
    float _1806 = _1756;
    float _1808 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1810 = _1774;
    float _1812 = _1768;
    float _1814 = _1798;
    float _1816 = _1622;
    if (!_1802)
    {
        _1804 = _1762;
    }
    float _1818 = _1804;
    float _1820 = _1818;
    if (!_1802)
    {
        _1806 = _1758;
    }
    float _1822 = _1806;
    float _1824 = _1822;
    if (!_1802)
    {
        _1808 = _1780;
    }
    float _1826 = _1808;
    bool _1828 = !_1802;
    float _1830 = _1826;
    if (!_1828)
    {
        float _1832 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1834 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1836 = _1788 + _1834;
        float _1838 = _1780 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1840 = rsqrt(_1784);
        float _1842 = _1836 * _1832;
        float _1844 = _1842 * 0.15915493667125701904296875;
        float _1846 = _1844 * 6.283185482025146484375;
        float _1848 = cos(_1846);
        float _1850 = _1844 * 6.283185482025146484375;
        float _1852 = sin(_1850);
        float _1854 = _1848 + (-1.0);
        float _1856 = _1854 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1858 = fma(_1852, _1838, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1860 = fma(_1780, _1848, _1856);
        float _1862 = _1840 * _1858;
        float _1864 = fma(_1774, _1862, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1866 = fma(_1768, _1862, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1824 = _1866;
        _1820 = _1864;
        _1830 = _1860;
    }
    float _1868 = _1824;
    float _1870 = _1820;
    float _1872 = _1830;
    float _1874 = _1872;
    float _1876 = _1870;
    float _1878 = _1868;
    if (_1656)
    {
        _1810 = 1.0;
    }
    float _1880 = _1810;
    float _1882 = _1880;
    if (!_1646)
    {
        float _1884 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1886 = _1682 + _1884;
        float _1888 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1890 = -_1130;
        float _1892 = _1890 + _1868;
        float _1894 = _1886 * _1886;
        float _1896 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1898 = _1130 + _1896;
        float _1900 = fma(_1148, _1148, _1894);
        float _1902 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1904 = fma(_1898, _1898, _1900);
        float _1906 = _1888 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1908 = sqrt(_1904);
        float _1910 = precise::min(_1908, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1912 = _1910 * _1902;
        float _1914 = -_1076;
        float _1916 = _1914 + _1870;
        float _1918 = _1906 * _1912;
        float _1920 = -_1682;
        float _1922 = _1920 + _1872;
        float _1924 = fma(_1916, _1918, _1076);
        float _1926 = fma(_1922, _1918, _1682);
        float _1928 = fma(_1892, _1918, _1130);
        _1874 = _1926;
        _1876 = _1924;
        _1878 = _1928;
        _1812 = _1908;
    }
    float _1930 = _1874;
    float _1932 = _1876;
    float _1934 = _1878;
    float _1936 = _1812;
    float _1938 = _1936;
    if (_1656)
    {
        _1814 = 1.0;
    }
    float _1940 = _1814;
    float _1942 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1944 = _1800 * _1942;
    float _1946 = _1940;
    if (!_1656)
    {
        float _1948 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1950 = _1948 * 0.15915493667125701904296875;
        float _1952 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1954 = _1950 * 6.283185482025146484375;
        float _1956 = cos(_1954);
        float _1958 = _1952 * 0.15915493667125701904296875;
        float _1960 = _1950 * 6.283185482025146484375;
        float _1962 = sin(_1960);
        float _1964 = 1.0 / _1956;
        float _1966 = _1958 * 6.283185482025146484375;
        float _1968 = cos(_1966);
        float _1970 = _1962 * _1964;
        float _1972 = _1958 * 6.283185482025146484375;
        float _1974 = sin(_1972);
        float _1976 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1978 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1976;
        float _1980 = _1968 * _1970;
        float _1982 = 1.0 / _1978;
        float _1984 = 1.0 / _1980;
        float _1986 = _1974 * _1984;
        float _1988 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1990 = fma(_1944, _1986, _1988);
        float _1992 = _1990 * _1982;
        float _1994 = precise::clamp(_1992, 0.0, 1.0);
        _1938 = _1982;
        _1882 = _1994;
    }
    float _1996 = _1938;
    float _1998 = _1882;
    float _2000 = _1996;
    if (!_1656)
    {
        float _2002 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2004 = _2002 * 0.15915493667125701904296875;
        float _2006 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2008 = _2004 * 6.283185482025146484375;
        float _2010 = cos(_2008);
        float _2012 = _2006 * 0.15915493667125701904296875;
        float _2014 = _2004 * 6.283185482025146484375;
        float _2016 = sin(_2014);
        float _2018 = 1.0 / _2010;
        float _2020 = _2012 * 6.283185482025146484375;
        float _2022 = cos(_2020);
        float _2024 = _2016 * _2018;
        float _2026 = _2012 * 6.283185482025146484375;
        float _2028 = sin(_2026);
        float _2030 = _2022 * _2024;
        float _2032 = 1.0 / _2030;
        float _2034 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2036 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2034;
        float _2038 = 1.0 / _2036;
        float _2040 = _2028 * _2032;
        float _2042 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2044 = fma(_1944, _2040, _2042);
        float _2046 = _2044 * _2038;
        float _2048 = precise::clamp(_2046, 0.0, 1.0);
        float _2050 = -_2048;
        float _2052 = _2050 + 1.0;
        _1946 = _2052;
    }
    float _2054 = _1946;
    float _2056 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2058 = _1930 + _2056;
    float _2060 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2062 = _1932 + _2060;
    float _2064 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2066 = _1934 + _2064;
    float _2068 = _2058 * _2058;
    float _2070 = fma(_2062, _2062, _2068);
    float _2072 = fma(_2066, _2066, _2070);
    float _2074 = rsqrt(_2072);
    float _2076 = sqrt(_2072);
    float _2078 = _2074 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2080 = _2062 * _2078;
    float _2082 = _2066 * _2078;
    float _2084 = _2080 * _2080;
    float _2086 = _2082 * _2082;
    float _2088 = _2084 + _2086;
    float _2090 = sqrt(_2088);
    bool _2092 = _2090 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2094 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2096 = _2090 + _2094;
    float _2098 = _2066;
    float _2100 = _2088;
    float _2102 = _2096;
    float _2104 = _2078;
    if (_2092)
    {
        float _2106 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2098 = _2106;
    }
    float _2108 = _2098;
    if (_2092)
    {
        float _2110 = rsqrt(_2088);
        _2100 = _2110;
    }
    float _2112 = _2100;
    if (_2092)
    {
        float _2114 = _2096 * _2108;
        _2102 = _2114;
    }
    float _2116 = _2102;
    if (_2092)
    {
        float _2118 = _2116 * 0.15915493667125701904296875;
        _2000 = _2118;
    }
    float _2120 = _2000;
    float _2122 = _2068;
    float _2124 = _2120;
    if (_2092)
    {
        float _2126 = _2120 * 6.283185482025146484375;
        float _2128 = sin(_2126);
        _2122 = _2128;
    }
    float _2130 = _2122;
    float _2132 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2134 = precise::max(0.0, _2132);
    float _2136 = _2074;
    float _2138 = _2134;
    float _2140 = _2132;
    if (_2092)
    {
        float _2142 = _2120 * 6.283185482025146484375;
        float _2144 = cos(_2142);
        _2136 = _2144;
    }
    float _2146 = _2136;
    float _2148 = -_2078;
    float _2150 = -_2134;
    float _2152 = fma(_2058, _2148, _2150);
    float _2154 = _2152;
    if (!_2092)
    {
        _2138 = _2080;
    }
    float _2156 = _2138;
    float _2158 = _2156;
    if (_2092)
    {
        float _2160 = _2152 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2140 = _2160;
    }
    float _2162 = _2140;
    float _2164 = _2130;
    float _2166 = _2162;
    if (_2092)
    {
        float _2168 = fma(_2130, _2162, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2164 = _2168;
    }
    float _2170 = _2164;
    float _2172 = _2170;
    float _2174 = _2146;
    if (_2092)
    {
        float _2176 = _2146 + (-1.0);
        _2166 = _2176;
    }
    float _2178 = _2166;
    float _2180 = _2178;
    if (_2092)
    {
        float _2182 = _2112 * _2170;
        _2104 = _2182;
    }
    float _2184 = _2104;
    if (!_2092)
    {
        _2172 = _2084;
    }
    float _2186 = _2172;
    float _2188 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2190 = _2186;
    if (_2092)
    {
        float _2192 = _2178 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2124 = _2192;
    }
    float _2194 = _2124;
    if (_2092)
    {
        float _2196 = _2080 * _2184;
        _2158 = _2196;
    }
    float _2198 = _2158;
    if (!_2092)
    {
        _2180 = _2082;
    }
    float _2200 = _2180;
    float _2202 = _2200;
    if (_2092)
    {
        float _2204 = _2082 * _2184;
        _2202 = _2204;
    }
    float _2206 = _2202;
    if (_2092)
    {
        float _2208 = fma(_2152, _2146, _2194);
        _2154 = _2208;
    }
    float _2210 = _2154;
    if (_2092)
    {
        float _2212 = _2198 * _2198;
        _2190 = _2212;
    }
    float _2214 = _2190;
    if (!_2092)
    {
        _2174 = _2086;
    }
    float _2216 = _2174;
    float _2218 = _2216;
    if (_2092)
    {
        float _2220 = _2206 * _2206;
        _2218 = _2220;
    }
    float _2222 = _2218;
    float _2224 = fma(_2210, _2210, _2214);
    float _2226 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2228 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2230 = _2224 + _2222;
    float _2232 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2188);
    float _2234 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2236 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2238 = fma(_2076, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2236);
    float _2240 = precise::clamp(_2238, 0.0, 1.0);
    float _2242 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2226);
    float _2244 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2232);
    float _2246 = rsqrt(_2230);
    float _2248 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2250 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2234);
    float _2252 = -_2240;
    float _2254 = _2252 + 1.0;
    float _2256 = _2244 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2258 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2248);
    float _2260 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2250);
    float _2262 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2242);
    float _2264 = abs(_2254);
    float _2266 = log2(_2264);
    float _2268 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2258);
    float _2270 = _2260 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2272 = _2256 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2274 = _2262 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2276 = _2268 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2278 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2280 = -_2272;
    float _2282 = fma(_2280, _2228, 1.0);
    float _2284 = _2246 * _2198;
    float _2286 = _2246 * _2210;
    float _2288 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2278);
    float _2290 = _2246 * _2206;
    float _2292 = _2284 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2294 = log2(_2282);
    float _2296 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2288);
    float _2298 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2300 = -_2292;
    float _2302 = fma(_2286, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2300);
    float _2304 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2306 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2296);
    float _2308 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2298);
    float _2310 = -_2290;
    float _2312 = fma(_2310, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2302);
    float _2314 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2316 = 1.0 / _2306;
    float _2318 = _2286 + 1.0;
    float _2320 = fma(_2312, -0.5, 0.5);
    float _2322 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2314);
    float _2324 = fma(_2312, 0.5, 0.5);
    float _2326 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2308);
    float _2328 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2322);
    float _2330 = exp2(_2304);
    float _2332 = fma(_2324, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2334 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2326);
    float _2336 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2328);
    float _2338 = _2294 * 0.693147182464599609375;
    float _2340 = fma(_2324, _2332, -0.212114393711090087890625);
    float _2342 = sqrt(_2320);
    float _2344 = _2334 * _2316;
    float _2346 = fma(_2324, _2340, 1.570728778839111328125);
    float _2348 = _2338 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2350 = fma(_2344, -0.5, 0.5);
    float _2352 = -_2286;
    float _2354 = fma(_2330, _2318, _2352);
    float _2356 = _2336 * _2316;
    float _2358 = fma(_2354, 0.5, 0.5);
    float _2360 = fma(_2356, 0.5, 0.5);
    float _2362 = _2342 * 0.636619746685028076171875;
    float _2364 = -_2346;
    float _2366 = fma(_2362, _2364, 1.0);
    float3 _6901 = float3(_2360, _2350, _2348);
    float _2368 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6901, float3(0.0), isnan(_6901)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6901, float3(0.0), isnan(_6901)), level(0.0)).x;
    float3 _6912 = float3(_2360, _2350, _2348);
    float4 _2371 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6912, float3(0.0), isnan(_6912)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6912, float3(0.0), isnan(_6912)), level(0.0)).xyzw;
    float _2373 = _2371.x;
    float _2375 = _2371.y;
    float _2377 = _2371.z;
    float _2379 = _2371.w;
    float2 _6929 = float2(_2366, _2358);
    float3 _2383 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6929, float2(0.0), isnan(_6929)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6929, float2(0.0), isnan(_6929)), level(0.0)).xyz;
    float _2385 = _2383.x;
    float _2387 = _2383.y;
    float _2389 = _2383.z;
    out.m_67.x = _964;
    out.m_67.y = _966;
    out.m_67.z = _968;
    out.m_67.w = _970;
    float _2391 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2393 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2395 = _2393 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2397 = _996 > 0.5;
    float _2399 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2401 = _2399 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2403 = in.m_65.x;
    bool _2405 = _1002 > 0.5;
    float _2407 = 1.0 / _2395;
    int _2409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2411 = _2409 != 0;
    float _2413 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2415 = _2413 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2417 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2419 = _994 + _2417;
    int _2421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2423 = _2421 != 0;
    float _2425 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2427 = 1.0 / _2401;
    int _2429 = _2405 ? as_type<int>(_1688) : as_type<int>(_1622);
    float _2431 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2433 = _2431 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _2435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2437 = _2435 != 0;
    float _2439 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2441 = _2439 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2443 = _2397 ? as_type<int>(_1688) : as_type<int>(_1622);
    float _2445 = in.m_69.w;
    bool _2447 = _1004 > 0.5;
    float _2449 = 1.0 / _2415;
    int _2451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2453 = _2451 != 0;
    out.m_71.x = _1696;
    out.m_71.y = _1714;
    out.m_71.z = _1706;
    out.m_73.x = _1932;
    out.m_73.y = _1930;
    out.m_73.z = _1934;
    float _2455 = _2437 ? as_type<float>(_2443) : _1622;
    float _2457 = 1.0 / _2441;
    int _2459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2461 = _2459 != 0;
    float _2463 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2465 = _2463 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2469 = _2467 != 0;
    float _2471 = as_type<float>(_2443);
    bool _2473 = _2453;
    bool _2475 = _2447;
    float _2477 = _2419;
    float _2479 = _2391;
    float _2481 = _2403;
    float _2483 = _2306;
    float _2485 = _2334;
    if (_2423)
    {
        float _2487 = in.m_59.z;
        _2471 = _2487;
    }
    float _2489 = _2471;
    float _2491 = _2453 ? as_type<float>(_2429) : _1622;
    float _2493 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2495 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2493;
    float _2497 = 1.0 / _2433;
    if (_2411)
    {
        bool _2499 = _1012 > 0.5;
        _2473 = _2499;
    }
    bool _2501 = _2473;
    float _2503 = _2495 * _2407;
    float _2505 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2507 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2505;
    float _2509 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2511 = _2509 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _2513 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2515 = isnan(_994);
    bool _2517 = _2513 || _2515;
    bool _2519 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2521 = _2517 || _2519;
    float _2523 = float(_2521);
    float _2525 = 1.0 / _2465;
    float _2527 = _2507 * _2427;
    float _2529 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2531 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2529;
    float _2533 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2535 = _2533 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2537 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2539 = _2537 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2541 = _2511 * _2457;
    float _2543 = _2531 * _2449;
    float _2545 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2547 = _994 + _2545;
    float _2549 = 1.0 / _2539;
    float _2551 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2553 = _2551 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    if (_2469)
    {
        float _2555 = _2447 ? _1688 : _1622;
        _1816 = _2555;
    }
    float _2557 = _1816;
    float _2559 = fma(_2503, _2547, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2561 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2563 = _994 + _2561;
    bool _2565 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2567 = isnan(_994);
    bool _2569 = _2565 || _2567;
    bool _2571 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2573 = _2569 || _2571;
    float _2575 = float(_2573);
    float _2577 = _2553 * _2497;
    float _2579 = _2535 * _2525;
    float _2581 = fma(_2541, _2563, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2583 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2585 = _994 + _2583;
    bool _2587 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2589 = isnan(_994);
    bool _2591 = _2587 || _2589;
    bool _2593 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2595 = _2591 || _2593;
    float _2597 = float(_2595);
    float _2599 = -_2575;
    float _2601 = _2599 + 1.0;
    bool _2603 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2605 = isnan(_994);
    bool _2607 = _2603 || _2605;
    bool _2609 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2611 = _2607 || _2609;
    float _2613 = float(_2611);
    float _2615 = fma(_2527, _2585, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2617 = _2613;
    int _2619 = as_type<int>(_2559);
    float _2621 = _2557;
    if (_2423)
    {
        bool _2623 = _2489 > 0.5;
        _2475 = _2623;
    }
    bool _2625 = _2475;
    float _2627 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2629 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2627;
    bool _2631 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2633 = isnan(_994);
    bool _2635 = _2631 || _2633;
    bool _2637 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2639 = _2635 || _2637;
    float _2641 = float(_2639);
    float _2643 = _2597 * _2601;
    float _2645 = -_2597;
    float _2647 = _2645 + 1.0;
    float _2649 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2651 = _994 + _2649;
    float _2653 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2655 = _994 + _2653;
    float _2657 = -_2613;
    float _2659 = _2657 + 1.0;
    float _2661 = _2629 * _2549;
    float _2663 = fma(_2577, _2651, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2665 = fma(_2543, _2655, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2667 = _2641 * _2659;
    float _2669 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2671 = _994 + _2669;
    bool _2673 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2675 = isnan(_994);
    bool _2677 = _2673 || _2675;
    bool _2679 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2681 = _2677 || _2679;
    float _2683 = float(_2681);
    float _2685 = -_2641;
    float _2687 = _2685 + 1.0;
    bool _2689 = _1602 != 0.0;
    bool _2691 = isnan(_1602);
    bool _2693 = _2689 || _2691;
    bool _2695 = isnan(0.0);
    bool _2697 = _2693 || _2695;
    float _2699 = fma(_2579, _2671, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _2701 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2703 = isnan(_994);
    bool _2705 = _2701 || _2703;
    bool _2707 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2709 = _2705 || _2707;
    float _2711 = float(_2709);
    float _2713 = _2683 * _2687;
    float _2715 = -_2683;
    float _2717 = _2715 + 1.0;
    bool _2719 = _1600 == 0.0;
    bool _2721 = !_2697;
    bool _2723 = _2719 && _2721;
    float _2725 = in.m_75.x;
    float _2727 = in.m_75.y;
    float _2729 = in.m_75.z;
    float _2731 = -_2711;
    float _2733 = _2731 + 1.0;
    float _2735 = _2613 * _2647;
    bool _2737 = _1604 == 0.0;
    bool _2739 = _2737 && _2723;
    out.m_77.w = _2445;
    if (!_2411)
    {
        _2617 = _2403;
    }
    float _2741 = _2617;
    float _2743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2745 = fma(_2661, _2419, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2747 = _2455 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2749 = _2523 * _2717;
    bool _2751 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2753 = isnan(_994);
    bool _2755 = _2751 || _2753;
    bool _2757 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2759 = _2755 || _2757;
    float _2761 = float(_2759);
    float _2763 = _2741;
    if (_2411)
    {
        float _2765 = -_2403;
        float _2767 = _2765 + 1.0;
        _1044 = as_type<int>(_2767);
    }
    int _2769 = _1044;
    float _2771 = -_2523;
    float _2773 = _2771 + 1.0;
    float _2775 = exp2(_2425);
    float _2777 = _2761 * _2733;
    int _2779 = _2769;
    if (_2411)
    {
        float _2781 = _2501 ? as_type<float>(_2769) : _2403;
        _2763 = _2781;
    }
    float _2783 = _2763;
    if (_2423)
    {
        float _2785 = -_2403;
        float _2787 = _2785 + 1.0;
        _2779 = as_type<int>(_2787);
    }
    int _2789 = _2779;
    float _2791 = _2711 * _2773;
    float _2793 = _2559 * _2777;
    float _2795 = as_type<float>(_2789);
    if (_2461)
    {
        float _2797 = -_2403;
        float _2799 = _2797 + 1.0;
        _2619 = as_type<int>(_2799);
    }
    int _2801 = _2619;
    int _2803 = _2801;
    int _2805 = as_type<int>(_2727);
    float _2807 = _2725;
    if (_2739)
    {
        _2477 = _2727;
    }
    float _2809 = _2477;
    float _2811 = _2391 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2813 = _2809;
    if (!_2423)
    {
        _2479 = _2403;
    }
    float _2815 = _2479;
    float _2817 = -_2761;
    float _2819 = _2817 + 1.0;
    float _2821 = _2815;
    if (_2423)
    {
        float _2823 = _2625 ? as_type<float>(_2789) : _2403;
        _2821 = _2823;
    }
    float _2825 = _2821;
    float _2827 = _2743 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_2461)
    {
        float _2829 = _2397 ? as_type<float>(_2801) : _2403;
        _2481 = _2829;
    }
    float _2831 = _2481;
    if (_2739)
    {
        float _2833 = fma(_1602, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2809);
        _2803 = as_type<int>(_2833);
    }
    int _2835 = _2803;
    int _2837 = _2835;
    if (_2739)
    {
        _2795 = _2809;
    }
    float _2839 = _2795;
    float _2841 = fma(_2819, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2793);
    float _2843 = _2839;
    if (!_2739)
    {
        _2813 = _2727;
    }
    float _2845 = _2813;
    if (_2739)
    {
        float _2847 = fma(_1604, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2729);
        _2805 = as_type<int>(_2847);
    }
    int _2849 = _2805;
    int _2851 = _2849;
    if (!_2739)
    {
        float _2853 = fma(_1604, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2729);
        _2851 = as_type<int>(_2853);
    }
    int _2855 = _2851;
    float _2857 = fma(_2581, _2791, _2841);
    float _2859 = fma(_2491, _2811, -0.5);
    if (!_2739)
    {
        float _2861 = fma(_1602, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2845);
        _2837 = as_type<int>(_2861);
    }
    int _2863 = _2837;
    float _2865 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2867 = fma(_2615, _2749, _2857);
    float _2869 = fma(_2827, _2557, -0.5);
    if (_2739)
    {
        _2621 = _2729;
    }
    float _2871 = _2621;
    float _2873 = _2871;
    if (!_2739)
    {
        float _2875 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2725);
        _2807 = _2875;
    }
    float _2877 = _2807;
    bool _2879 = !_2739;
    float _2881 = _2879 ? as_type<float>(_2863) : _2845;
    float _2883 = fma(_2663, _2713, _2867);
    bool _2885 = !_2739;
    float _2887 = _2885 ? as_type<float>(_2855) : _2729;
    float _2889 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2891 = -_1322;
    float _2893 = fma(_1084, _2869, _2891);
    float _2895 = _2881 * _2881;
    float _2897 = fma(_2665, _2667, _2883);
    float _2899 = _2783 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (!_2739)
    {
        _2843 = as_type<float>(_2863);
    }
    float _2901 = _2843;
    float _2903 = fma(_2887, _2887, _2895);
    float _2905 = fma(_2699, _2735, _2897);
    float _2907 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2909 = _2865 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2911 = _2270 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2913 = fma(_2745, _2643, _2905);
    float _2915 = -_2775;
    float _2917 = _2915 + 1.0;
    float _2919 = fma(_2909, _2825, -0.5);
    float _2921 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2911);
    float _2923 = _2893 + 0.5;
    float _2925 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2927 = _2889 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2929 = fma(_1238, _2919, _1170);
    float _2931 = fma(_2575, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2913);
    float _2933 = -_1318;
    float _2935 = fma(_1160, _2859, _2933);
    float _2937 = fma(_2927, _2831, -0.5);
    float _2939 = _2929 + 0.5;
    float _2941 = -_2901;
    float _2943 = _1674 * _2941;
    float _2945 = rsqrt(_2903);
    float _2947 = fma(_1314, _2937, _1246);
    float _2949 = _2747 * _2907;
    float _2951 = _1702 * _2901;
    if (!_2739)
    {
        _2873 = as_type<float>(_2855);
    }
    float _2953 = _2873;
    float _2955 = _2947 + 0.5;
    float _2957 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2921);
    float _2959 = _2917 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2961 = _2899 * _2925;
    float _2963 = _1662 * _2901;
    float _2965 = _2935 + 0.5;
    out.m_79.x = _2931;
    float _2967 = fma(_1706, _2877, _2963);
    bool _2969 = _2076 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2971 = isnan(_2076);
    bool _2973 = _2969 || _2971;
    bool _2975 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2977 = _2973 || _2975;
    float _2979 = _2881 * _2945;
    float _2981 = _2887 * _2945;
    out.m_81.x = _2961;
    out.m_81.y = _2949;
    out.m_81.z = _2939;
    out.m_81.w = _2923;
    float _2983 = fma(_1696, _2877, _2943);
    float _2985 = -_2979;
    float _2987 = _1712 * _2985;
    float _2989 = _2306 * 0.5;
    out.m_83.x = _2955;
    out.m_83.y = _2965;
    float _2991 = fma(_1712, _2953, _2967);
    float _2993 = fma(_2334, -0.5, _2989);
    float _2995 = fma(_1698, _2953, _2983);
    float _2997 = fma(_1714, _2877, _2951);
    float _2999 = -_2979;
    float _3001 = _1698 * _2999;
    float _3003 = -_2979;
    float _3005 = _1740 * _3003;
    float _3007 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2957);
    float _3009 = fma(_1740, _2953, _2997);
    float _3011 = _2336 + _2306;
    float _3013 = -_2959;
    float _3015 = _3013 + 1.0;
    float _3017 = _3007 + _2306;
    float _3019 = -_1674;
    float _3021 = fma(_3019, _2981, _3001);
    float _3023 = _3011 * 0.5;
    out.m_85.x = _2995;
    out.m_85.y = _3009;
    out.m_85.z = _2991;
    float _3025 = _3017 * 0.5;
    float _3027 = fma(_1702, _2981, _3005);
    float _3029 = fma(_1662, _2981, _2987);
    out.gl_Position.x = _2336;
    out.gl_Position.y = _2334;
    out.gl_Position.z = _3007;
    out.gl_Position.w = _2306;
    out.m_87.x = _3023;
    out.m_87.y = _2993;
    out.m_87.z = _3025;
    out.m_87.w = _2306;
    out.m_89.x = _3021;
    out.m_89.y = _3027;
    out.m_89.z = _3029;
    float _3031 = _1998 * _2054;
    float _3033 = _3007;
    float _3035 = _3027;
    float _3037 = _3021;
    float _3039 = _3031;
    if (!_2977)
    {
        _2483 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3041 = _2483;
    float _3043 = _3041;
    float _3045 = _3041;
    if (!_2977)
    {
        _3033 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3047 = _3033;
    float _3049 = _3047;
    float _3051 = _3047;
    if (!_2977)
    {
        _2485 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3053 = _2485;
    float _3055 = _3053;
    float _3057 = _3053;
    if (!_2977)
    {
        _3035 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3059 = _3035;
    float _3061 = _3059;
    float _3063 = _3059;
    if (!_2977)
    {
        _3037 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3065 = _3037;
    float _3067 = _2959 * _2368;
    float _3069 = _2379 * _3015;
    float _3071 = _2379 * _3067;
    float _3073 = _2389 * _3067;
    float _3075 = fma(_2385, _3071, _2373);
    float _3077 = fma(_2387, _3071, _2375);
    float _3079 = fma(_2379, _3073, _2377);
    float _3081 = _3031 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3083 = _3065;
    float _3085 = _3065;
    if (!_2977)
    {
        _3039 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3087 = _3039;
    out.m_91.x = _3075;
    out.m_91.y = _3077;
    out.m_91.z = _3079;
    out.m_91.w = _3069;
    bool _3089 = !_2977;
    float _3091 = _3087;
    float _3093 = _3087;
    if (!_3089)
    {
        bool _3095 = _2076 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3097 = isnan(_2076);
        bool _3099 = _3095 || _3097;
        bool _3101 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3103 = _3099 || _3101;
        if (!_3103)
        {
            float _3105 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3107 = _2076 + _3105;
            float _3109 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3111 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3109;
            float _3113 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3115 = _3113 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3117 = 1.0 / _3111;
            float _3119 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3121 = _3119 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3123 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3125 = _3123 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3127 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3129 = _3127 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3131 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3133 = _3131 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3135 = _3107 * _3117;
            float _3137 = precise::clamp(_3135, 0.0, 1.0);
            float _3139 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3141 = _3139 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3143 = fma(_3137, _3115, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3145 = fma(_3137, _3141, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3147 = fma(_3137, _3121, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3149 = fma(_3137, _3125, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3151 = fma(_3137, _3129, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3153 = fma(_3137, _3133, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3085 = _3147;
            _3057 = _3151;
            _3063 = _3143;
            _3051 = _3149;
            _3045 = _3145;
            _3093 = _3153;
            _3155 = true;
        }
        else
        {
            bool _3157 = _2076 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3159 = isnan(_2076);
            bool _3161 = _3157 || _3159;
            bool _3163 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3165 = _3161 || _3163;
            if (!_3165)
            {
                _3061 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3167 = _3061;
            _3063 = _3167;
            if (!_3165)
            {
                _3083 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3169 = _3083;
            _3085 = _3169;
            if (!_3165)
            {
                _3043 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3171 = _3043;
            _3045 = _3171;
            if (!_3165)
            {
                _3049 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3173 = _3049;
            _3051 = _3173;
            if (!_3165)
            {
                _3055 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3175 = _3055;
            _3057 = _3175;
            if (!_3165)
            {
                _3091 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3177 = _3091;
            bool _3179 = !_3165;
            _3093 = _3177;
            if (!_3179)
            {
                bool _3181 = _2076 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3183 = isnan(_2076);
                bool _3185 = _3181 || _3183;
                bool _3187 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3189 = _3185 || _3187;
                if (!_3189)
                {
                    float _3191 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3193 = _2076 + _3191;
                    float _3195 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3197 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3195;
                    float _3199 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3201 = _3199 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3203 = 1.0 / _3197;
                    float _3205 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3207 = _3205 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3209 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3211 = _3209 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3213 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3215 = _3213 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3217 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3219 = _3217 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3221 = _3193 * _3203;
                    float _3223 = precise::clamp(_3221, 0.0, 1.0);
                    float _3225 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3227 = _3225 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3229 = fma(_3223, _3201, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3231 = fma(_3223, _3227, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3233 = fma(_3223, _3207, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3235 = fma(_3223, _3211, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3237 = fma(_3223, _3215, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3239 = fma(_3223, _3219, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3085 = _3233;
                    _3057 = _3237;
                    _3063 = _3229;
                    _3051 = _3235;
                    _3045 = _3231;
                    _3093 = _3239;
                    _3155 = true;
                }
                else
                {
                    _3085 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3057 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3063 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3051 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3045 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3093 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3155 = false;
    float _3241 = _3085;
    float _3243 = _3057;
    float _3245 = _3063;
    float _3247 = _3051;
    float _3249 = _3045;
    float _3251 = _3093;
    float _3253 = fma(_3009, -0.5, 0.5);
    float _3255 = precise::clamp(_3253, 0.0, 1.0);
    float _3257 = -_3241;
    float _3259 = _3257 + _3243;
    float _3261 = _3081 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3263 = -_3245;
    float _3265 = _3263 + _3247;
    float _3267 = fma(_3255, _3259, _3241);
    out.m_93.x = 0.0;
    float _3269 = -_3249;
    float _3271 = _3269 + _3251;
    float _3273 = fma(_3255, _3265, _3245);
    float _3275 = _3267 * 0.586610972881317138671875;
    out.m_47.x = _3261;
    bool _3277 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3279 = fma(_3255, _3271, _3249);
    float _3281 = fma(_3273, 0.298911988735198974609375, _3275);
    bool _3283 = _1998 > 0.0;
    bool _3285 = isnan(_1998);
    bool _3287 = _3283 || _3285;
    bool _3289 = isnan(0.0);
    bool _3291 = _3287 || _3289;
    float _3293 = fma(_3279, 0.114477999508380889892578125, _3281);
    bool _3295 = _2054 <= 0.0;
    bool _3297 = !_3291;
    bool _3299 = _3295 || _3297;
    float _3301 = -_3293;
    float _3303 = _3273 + _3301;
    float _3305 = -_3293;
    float _3307 = _3267 + _3305;
    float _3309 = -_3293;
    float _3311 = _3279 + _3309;
    float _3313 = fma(_3303, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3293);
    float _3315 = fma(_3307, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3293);
    float _3317 = fma(_3311, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3293);
    bool _3319 = !_3277;
    if (!_3319)
    {
        float _3321 = -_1930;
        float _3323 = _3321 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3325 = -_1932;
        float _3327 = _3325 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3329 = -_1934;
        float _3331 = _3329 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3333 = _3323 * _3323;
        float _3335 = fma(_3327, _3327, _3333);
        float _3337 = fma(_3331, _3331, _3335);
        float _3339 = sqrt(_3337);
        float _3341 = rsqrt(_3337);
        float _3343 = -_3339;
        float _3345 = _3343 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3347 = _3345 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3349 = precise::clamp(_3347, 0.0, 1.0);
        float _3351 = _3327 * _3341;
        float _3353 = _3323 * _3341;
        float _3355 = abs(_3349);
        float _3357 = log2(_3355);
        float _3359 = _3331 * _3341;
        float _3361 = _3351 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3363 = _3009 * _3353;
        float _3365 = -_3353;
        float _3367 = -_3361;
        float _3369 = fma(_3365, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3367);
        float _3371 = fma(_2995, _3351, _3363);
        float _3373 = -_3359;
        float _3375 = fma(_3373, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3369);
        float _3377 = fma(_2991, _3359, _3371);
        float _3379 = precise::clamp(_3377, 0.0, 1.0);
        float _3381 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3383 = _3375 + _3381;
        float _3385 = _3357 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3387 = _3383 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3389 = precise::clamp(_3387, 0.0, 1.0);
        float _3391 = exp2(_3385);
        float _3393 = _3391 * _3389;
        float _3395 = _3379 * _3393;
        float _3397 = _3395 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3399 = _3395 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3401 = _3395 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _3397;
        out.m_93.y = _3399;
        out.m_93.z = _3401;
    }
    out.m_95.x = _3313;
    out.m_95.y = _3315;
    out.m_95.z = _3317;
    if (!_3299)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _3403 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3403;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

