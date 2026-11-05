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
    float4 m_69 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_67 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_73 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_51 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_47 [[attribute(4)]];
    float4 m_59 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
    float4 m_49 [[attribute(9)]];
    float4 m_61 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _438 = false;
    bool _312 = false;
    bool _198 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_42.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2297 = as_type<float>(_108);
        out.gl_Position.z = _2297;
    }
    if (!_96)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    if (_120)
    {
        float _128 = float(_92);
        _126 = _128;
    }
    float _130 = _126;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    if (_136)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _102;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    int _140 = 0;
    if (_136)
    {
        float _142 = _138 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2365 = as_type<float>(_144);
        out.gl_Position.z = _2365;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_49.y;
    bool _148 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _150 = in.m_51.x;
    float _152 = in.m_51.y;
    float _154 = in.m_51.z;
    out.m_53.y = _146;
    float _156 = _152 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _158 = _152 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _160 = _152 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _162 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].x, _156);
    float _164 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].x, _158);
    float _166 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].x, _160);
    float _168 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[4].z, _162);
    float _170 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[5].z, _164);
    float _172 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[6].z, _166);
    bool _174 = !_148;
    float _176 = _168;
    float _178 = _146;
    float _196;
    if (!_174)
    {
        float _180 = in.m_55.x;
        float _182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _186 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _188 = _186 * _182;
        float _190 = floor(_188);
        float _192 = -_190;
        float _194 = _188 + _192;
        _196 = _194;
        _198 = true;
    }
    else
    {
        float _200 = float(_92);
        float _202 = 1.0 / _200;
        float _204 = _124 * _202;
        _196 = _204;
    }
    _198 = false;
    float _206 = _196;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _210 = _206 + _208;
    bool _212 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _214 = isnan(_206);
    bool _216 = _212 || _214;
    bool _218 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _220 = _216 || _218;
    float _222 = float(_220);
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _224;
    bool _228 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _230 = isnan(_206);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    float _240 = -_222;
    float _242 = _240 + 1.0;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _244;
    float _248 = 1.0 / _226;
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _252 = _238 * _242;
    float _254 = -_238;
    float _256 = _254 + 1.0;
    float _258 = _210 * _248;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _260;
    float _264 = fma(_246, _258, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _266;
    float _270 = fma(_262, _258, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _272 = _264 * _252;
    float _274 = fma(_268, _258, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _276 = _270 * _252;
    float _278 = _274 * _252;
    float _280 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[143].x, _272);
    float _282 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[143].y, _278);
    float _284 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[143].z, _276);
    float _286 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[144].x, _280);
    float _288 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[144].y, _282);
    float _290 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[144].z, _284);
    bool _292 = !_250;
    float _310;
    if (!_292)
    {
        float _294 = in.m_55.x;
        float _296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _298 = _294 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _302 = _300 * _296;
        float _304 = floor(_302);
        float _306 = -_304;
        float _308 = _302 + _306;
        _310 = _308;
        _312 = true;
    }
    else
    {
        float _314 = float(_92);
        float _316 = 1.0 / _314;
        float _318 = _124 * _316;
        _310 = _318;
    }
    _312 = false;
    float _320 = _310;
    float _322 = in.m_57.x;
    float _324 = in.m_57.y;
    float _326 = in.m_57.z;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _330 = _320 + _328;
    bool _332 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _334 = isnan(_320);
    bool _336 = _332 || _334;
    bool _338 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _340 = _336 || _338;
    float _342 = float(_340);
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _346;
    float _350 = 1.0 / _348;
    float _352 = _290 * _326;
    float _354 = _288 * _324;
    float _356 = -_342;
    float _358 = _356 + 1.0;
    float _360 = _330 * _350;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _362;
    bool _366 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _368 = isnan(_320);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _378;
    float _382 = _286 * _322;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _384;
    float _388 = fma(_364, _360, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _390 = _376 * _358;
    float _392 = fma(_380, _360, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _394 = fma(_386, _360, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _396 = -_376;
    float _398 = _396 + 1.0;
    float _400 = _388 * _390;
    float _402 = _392 * _390;
    float _404 = _394 * _390;
    float _406 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[107].x, _400);
    float _408 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[107].y, _402);
    float _410 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[107].z, _404);
    float _412 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[108].x, _406);
    float _414 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[108].y, _408);
    float _416 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[108].z, _410);
    bool _418 = !_344;
    float _436;
    if (!_418)
    {
        float _420 = in.m_55.x;
        float _422 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _424 = _420 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _426 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _428 = _426 * _422;
        float _430 = floor(_428);
        float _432 = -_430;
        float _434 = _428 + _432;
        _436 = _434;
        _438 = true;
    }
    else
    {
        float _440 = float(_92);
        float _442 = 1.0 / _440;
        float _444 = _124 * _442;
        _436 = _444;
    }
    _438 = false;
    float _446 = _436;
    float _448 = in.m_55.z;
    float _450 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _452 = log2(_450);
    float _454 = in.m_55.x;
    float _456 = in.m_55.y;
    float _458 = _448 * 2.0;
    float _460 = _454 * 2.0;
    float _462 = floor(_458);
    float _464 = _456 * 2.0;
    float _466 = floor(_460);
    float _468 = floor(_464);
    bool _470 = _462 > 0.0;
    bool _472 = _462 >= 0.0;
    bool _474 = isnan(_462);
    bool _476 = _472 || _474;
    bool _478 = isnan(0.0);
    bool _480 = _476 || _478;
    int _482 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _484 = _482 != 0;
    int _486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _488 = _486 != 0;
    int _490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _492 = _490 != 0;
    float _494 = in.m_42.x;
    float _496 = in.m_42.y;
    float _498 = in.m_42.z;
    int _500 = _480 ? 0 : 1;
    bool _502 = _466 > 0.0;
    int _504 = ~_500;
    int _506 = _504 + 1;
    int _508 = _506 + 1;
    bool _510 = _466 >= 0.0;
    bool _512 = isnan(_466);
    bool _514 = _510 || _512;
    bool _516 = isnan(0.0);
    bool _518 = _514 || _516;
    bool _520 = !_484;
    int _522 = _520 ? 0 : 1;
    int _524 = _508;
    if (!_470)
    {
        int _526 = ~_500;
        int _528 = _526 + 1;
        _524 = _528;
    }
    int _530 = _524;
    bool _532 = _468 > 0.0;
    int _534 = abs(_522);
    float _536 = _454 + _456;
    bool _538 = _468 >= 0.0;
    bool _540 = isnan(_468);
    bool _542 = _538 || _540;
    bool _544 = isnan(0.0);
    bool _546 = _542 || _544;
    float _548 = _124 * _452;
    float _550 = float(_534);
    float _552 = _536 + (-1.0);
    int _554 = _546 ? 0 : 1;
    float _556 = float(_530);
    float _558 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _560 = ~_554;
    int _562 = _560 + 1;
    int _564 = _562 + 1;
    float _566 = exp2(_548);
    int _568 = _564;
    if (!_532)
    {
        int _570 = ~_554;
        int _572 = _570 + 1;
        _568 = _572;
    }
    int _574 = _568;
    float _576 = _550 * _556;
    float _578 = _496 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _580 = _496 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _582 = !_492;
    int _584 = _582 ? 0 : 1;
    float _586 = _454 + _448;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _590 = 1.0 + _588;
    float _592 = fma(_494, (*spvDescriptorSet0.vp_c10)._m0[4].x, _578);
    float _594 = fma(_494, (*spvDescriptorSet0.vp_c10)._m0[6].x, _580);
    bool _596 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _598 = isnan(0.0);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _604 = _600 || _602;
    float _606 = 1.0 / _590;
    float _608 = fma(_498, (*spvDescriptorSet0.vp_c10)._m0[4].z, _592);
    float _610 = fma(_498, (*spvDescriptorSet0.vp_c10)._m0[6].z, _594);
    int _612 = abs(_584);
    float _614 = _586 + (-1.0);
    float _616 = _608 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _618 = -_566;
    float _620 = _618 + 1.0;
    float _622 = _610 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _624 = float(_612);
    float _626 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _628 = _616 + _626;
    float _630 = float(_574);
    float _632 = -_622;
    float _634 = _632 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _636 = _604 ? _620 : 0.0;
    float _638 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _640 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _642 = isnan(1.0);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _648 = _644 || _646;
    float _650 = _576 * (-2.0);
    float _652 = abs(_628);
    float _654 = abs(_634);
    float _656 = precise::max(_652, _654);
    float _658 = _636 * _606;
    float _660 = _454 + (-0.5);
    float _662 = _624 * _630;
    bool _664 = _656 >= 16.0;
    float _666 = fma(_558, _650, _558);
    bool _668 = !_648;
    float _670 = _668 ? _124 : _658;
    float _672 = _660 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _674 = _448 + (-0.5);
    float _676 = _662 * (-2.0);
    int _678 = _518 ? 0 : 1;
    float _680 = fma(_670, _666, _672);
    float _682 = _674 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _684 = _628 * 0.0625;
    float _686 = fma(_638, _676, _638);
    float _688 = _680 * 0.15915493667125701904296875;
    int _690 = ~_678;
    int _692 = _690 + 1;
    int _694 = _692 + 1;
    float _696 = _634;
    int _698 = _694;
    bool _700 = _664;
    if (_664)
    {
        float _702 = _634 * 0.0625;
        _696 = _702;
    }
    float _704 = _696;
    float _706 = _664 ? _684 : _628;
    float _708 = fma(_670, _686, _682);
    bool _710 = !_488;
    int _712 = _710 ? 0 : 1;
    float _714 = _456 + _448;
    if (!_502)
    {
        int _716 = ~_678;
        int _718 = _716 + 1;
        _698 = _718;
    }
    int _720 = _698;
    float _722 = _708 * 0.15915493667125701904296875;
    float _724 = abs(_706);
    bool _726 = _724 != 0.0;
    bool _728 = isnan(_724);
    bool _730 = _726 || _728;
    bool _732 = isnan(0.0);
    bool _734 = _730 || _732;
    float _736 = _714 + (-1.0);
    int _738 = abs(_712);
    float _740 = _688 * 6.283185482025146484375;
    float _742 = sin(_740);
    float _744 = abs(_704);
    bool _746 = _744 == 0.0;
    bool _748 = !_734;
    bool _750 = _746 && _748;
    float _752 = float(_720);
    float _754 = in.m_59.x;
    float _756 = in.m_59.y;
    float _758 = in.m_59.z;
    float _760 = float(_738);
    float _762 = _688 * 6.283185482025146484375;
    float _764 = cos(_762);
    float _766 = abs(_704);
    bool _768 = _766 == 0.0;
    float _770 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _772 = _760 * _752;
    float _774 = _456 + (-0.5);
    int _776 = as_type<int>(_774);
    if (_750)
    {
        bool _778 = as_type<int>(_704) >= 0;
        _700 = _778;
    }
    bool _780 = _700;
    float _782 = _722 * 6.283185482025146484375;
    float _784 = sin(_782);
    float _786 = _772 * (-2.0);
    float _788 = _774 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    int _790 = _780 ? (-1) : 0;
    if (_750)
    {
        int _792 = _780 ? 0 : 1078530011;
        _776 = _792;
    }
    int _794 = _776;
    float _796 = fma(_770, _786, _770);
    int _798 = _794;
    if (_750)
    {
        int _800 = int(0x80000000) & as_type<int>(_706);
        int _802 = _794 | _800;
        _798 = _802;
    }
    int _804 = _798;
    float _806 = fma(_670, _796, _788);
    bool _808 = !_734;
    bool _810 = _808 && _768;
    int _812 = _804;
    float _814 = as_type<float>(_804);
    if (!_810)
    {
        float _816 = abs(_706);
        bool _818 = _816 != as_type<float>(0x7f800000u /* inf */);
        bool _820 = isnan(_816);
        bool _822 = _818 || _820;
        bool _824 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _826 = _822 || _824;
        float _828 = abs(_704);
        bool _830 = _828 == as_type<float>(0x7f800000u /* inf */);
        float _832 = abs(_704);
        bool _834 = _832 == as_type<float>(0x7f800000u /* inf */);
        bool _836 = !_826;
        bool _838 = _834 && _836;
        if (_838)
        {
            bool _840 = as_type<int>(_704) >= 0;
            _790 = _840 ? (-1) : 0;
        }
        int _842 = _790;
        if (_838)
        {
            _812 = 1075235812;
        }
        int _844 = _812;
        int _846 = _844;
        if (_838)
        {
            int _848 = ~_842;
            int _850 = (_848 != 0) ? _844 : 1061752795;
            _846 = _850;
        }
        int _852 = _846;
        float _854 = as_type<float>(_852);
        if (_838)
        {
            int _856 = int(0x80000000) & as_type<int>(_706);
            int _858 = _852 | _856;
            _854 = as_type<float>(_858);
        }
        float _860 = _854;
        bool _862 = !_826;
        bool _864 = _862 && _830;
        _814 = _860;
        if (!_864)
        {
            float _866 = abs(_704);
            float _868 = abs(_706);
            float _870 = precise::max(_866, _868);
            float _872 = abs(_704);
            float _874 = abs(_706);
            float _876 = precise::min(_872, _874);
            float _878 = 1.0 / _870;
            float _880 = abs(_706);
            float _882 = abs(_704);
            bool _884 = _880 > _882;
            bool _886 = as_type<int>(_704) >= 0;
            float _888 = abs(_704);
            float _890 = abs(_706);
            float _892 = _888 + _890;
            int _894 = as_type<int>(_706) & int(0x80000000);
            bool _896 = _892 > as_type<float>(0x7f800000u /* inf */);
            bool _898 = isnan(_892);
            bool _900 = _896 || _898;
            bool _902 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _904 = _900 || _902;
            float _906 = _876 * _878;
            float _908 = _906 * _906;
            float _910 = _908 + 11.33538818359375;
            float _912 = fma(_908, _910, 28.84246826171875);
            float _914 = fma(_908, _912, 19.6966705322265625);
            float _916 = fma(_908, -0.82336294651031494140625, -5.674867153167724609375);
            float _918 = fma(_908, _916, -6.565555095672607421875);
            float _920 = 1.0 / _914;
            float _922 = _908 * _918;
            float _924 = _906 * _922;
            float _926 = fma(_924, _920, _906);
            float _928 = _926;
            _814 = _892;
            if (_884)
            {
                float _930 = -_926;
                float _932 = _930 + 1.57079637050628662109375;
                _928 = _932;
            }
            float _934 = _928;
            int _936 = as_type<int>(_934);
            if (!_886)
            {
                float _938 = -_934;
                float _940 = _938 + 3.1415927410125732421875;
                _936 = as_type<int>(_940);
            }
            int _942 = _936;
            if (!_904)
            {
                int _944 = _894 | _942;
                _814 = as_type<float>(_944);
            }
        }
    }
    float _946 = _814;
    float _948 = -_946;
    float _950 = _806 + _948;
    float _952 = _496 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _954 = _448 * 6.283185482025146484375;
    float _956 = _950 * 0.15915493667125701904296875;
    float _958 = _722 * 6.283185482025146484375;
    float _960 = cos(_958);
    float _962 = fma(_494, (*spvDescriptorSet0.vp_c10)._m0[5].x, _952);
    float _964 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _754);
    float _966 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _758);
    float _968 = fma(_124, 0.310000002384185791015625, _954);
    float _970 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _756);
    float _972 = _382 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _974 = _956 * 6.283185482025146484375;
    float _976 = sin(_974);
    float _978 = _968 * 0.15915493667125701904296875;
    float _980 = _354 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _982 = _454 * 6.283185482025146484375;
    float _984 = _964 * _972;
    float _986 = _980 * _970;
    float _988 = _352 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _990 = _956 * 6.283185482025146484375;
    float _992 = cos(_990);
    float _994 = fma(_124, 0.10999999940395355224609375, _982);
    float _996 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _998 = _960 * _986;
    float _1000 = _966 * _988;
    float _1002 = _994 * 0.15915493667125701904296875;
    float _1004 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _996);
    float _1006 = _742 * _976;
    float _1008 = _764 * _998;
    float _1010 = 1.0 / _980;
    float _1012 = fma(_498, (*spvDescriptorSet0.vp_c10)._m0[5].z, _962);
    float _1014 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1004);
    float _1016 = _742 * _998;
    float _1018 = _1012 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1020 = _764 * _992;
    float _1022 = _764 * _976;
    float _1024 = _742 * _992;
    float _1026 = _978 * 6.283185482025146484375;
    float _1028 = sin(_1026);
    float _1030 = fma(_784, _1020, _1006);
    float _1032 = -_986;
    float _1034 = _784 * _1032;
    float _1036 = fma(_784, _1006, _1020);
    float _1038 = _992 * _960;
    float _1040 = fma(_1030, _984, _1008);
    float _1042 = -_1024;
    float _1044 = fma(_784, _1022, _1042);
    float _1046 = _976 * _960;
    float _1048 = sqrt(_1014);
    float _1050 = fma(_1038, _984, _1034);
    float _1052 = fma(_1044, _1000, _1040);
    float _1054 = fma(_1046, _1000, _1050);
    float _1056 = _1018 + _1052;
    float _1058 = -_1022;
    float _1060 = fma(_784, _1024, _1058);
    float _1062 = _1002 * 6.283185482025146484375;
    float _1064 = sin(_1062);
    float _1066 = fma(_1028, 0.12999999523162841796875, 1.0);
    float _1068 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1070 = _1056 + _1068;
    float _1072 = fma(_1060, _984, _1016);
    float _1074 = _616 + _1054;
    float _1076 = _1070 * _1010;
    float _1078 = fma(_1036, _1000, _1072);
    float _1080 = _1048 * 0.64999997615814208984375;
    float _1082 = fma(_1076, _1076, _1076);
    float _1084 = _622 + _1078;
    float _1086 = _1082 * _1080;
    float _1088 = fma(_1064, 0.300000011920928955078125, _1066);
    float _1090 = _1088 * _1086;
    float _1092 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[32].z, _1084);
    float _1094 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[32].x, _1074);
    float _1096 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[32].y, _1056);
    float _1098 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1100 = _1092 + _1098;
    float _1102 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1104 = _1094 + _1102;
    float _1106 = _1100 * _1100;
    float _1108 = fma(_1104, _1104, _1106);
    float _1110 = sqrt(_1108);
    bool _1112 = _1110 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1114 = _1106;
    float _1116 = _1000;
    float _1118 = _1094;
    float _1120 = _1034;
    if (!_1112)
    {
        _1114 = _1092;
    }
    float _1122 = _1114;
    float _1124 = _1122;
    if (!_1112)
    {
        _1116 = _1096;
    }
    float _1126 = _1116;
    bool _1128 = !_1112;
    float _1130 = _1126;
    if (!_1128)
    {
        float _1132 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1134 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1136 = _1110 + _1134;
        float _1138 = rsqrt(_1108);
        float _1140 = _1136 * _1132;
        float _1142 = _1096 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1144 = _1140 * 0.15915493667125701904296875;
        float _1146 = _1144 * 6.283185482025146484375;
        float _1148 = cos(_1146);
        float _1150 = _1144 * 6.283185482025146484375;
        float _1152 = sin(_1150);
        float _1154 = _1148 + (-1.0);
        float _1156 = _1154 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1158 = fma(_1152, _1142, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1160 = fma(_1096, _1148, _1156);
        float _1162 = _1138 * _1158;
        float _1164 = fma(_1104, _1162, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1166 = fma(_1100, _1162, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1130 = _1160;
        _1118 = _1164;
        _1124 = _1166;
    }
    float _1168 = _1130;
    float _1170 = _1118;
    float _1172 = _1124;
    float _1174 = -_1018;
    float _1176 = _1174 + _1168;
    float _1178 = -_616;
    float _1180 = _1178 + _1170;
    float _1182 = -_622;
    float _1184 = _1182 + _1172;
    float _1186 = _1176 * _1176;
    float _1188 = fma(_1180, _1180, _1186);
    float _1190 = fma(_1184, _1184, _1188);
    float _1192 = sqrt(_1190);
    bool _1194 = _1192 > 0.0;
    bool _1196 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1198 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1200 = _1196 || _1198;
    bool _1202 = isnan(0.5);
    bool _1204 = _1200 || _1202;
    bool _1206 = !_1194;
    float _1208 = _1168;
    float _1210 = _1170;
    float _1212 = _1172;
    float _1214 = _1190;
    if (!_1206)
    {
        float _1216 = _170 * _170;
        float _1218 = fma(_168, _168, _1216);
        float _1220 = fma(_172, _172, _1218);
        float _1222 = rsqrt(_1190);
        float _1224 = sqrt(_1220);
        float _1226 = _1184 * _1222;
        bool _1228 = _1224 > 0.0;
        float _1230 = _1180 * _1222;
        float _1232 = _1176 * _1222;
        bool _1234 = !_1228;
        if (!_1234)
        {
            float _1236 = rsqrt(_1220);
            float _1238 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1240 = _170 * _1236;
            float _1242 = _168 * _1236;
            float _1244 = _1232 * _1240;
            float _1246 = _172 * _1236;
            float _1248 = fma(_1230, _1242, _1244);
            float _1250 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1252 = fma(_1226, _1246, _1248);
            float _1254 = _1252 * _1250;
            float _1256 = fma(_168, _1254, _1170);
            float _1258 = fma(_170, _1254, _1168);
            float _1260 = fma(_172, _1254, _1172);
            _1208 = _1258;
            _1210 = _1256;
            _1212 = _1260;
            _1214 = _1254;
        }
    }
    float _1262 = _1208;
    float _1264 = _1210;
    float _1266 = _1212;
    float _1268 = _1214;
    float _1270 = _1264;
    float _1272 = _1266;
    if (_1204)
    {
        _176 = _1262;
    }
    float _1274 = _176;
    float _1276 = _1274;
    if (!_1204)
    {
        float _1278 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1280 = _1018 + _1278;
        float _1282 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1284 = -_616;
        float _1286 = _1284 + _1264;
        float _1288 = -_622;
        float _1290 = _1288 + _1266;
        float _1292 = _1280 * _1280;
        float _1294 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1296 = _622 + _1294;
        float _1298 = fma(_628, _628, _1292);
        float _1300 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1302 = fma(_1296, _1296, _1298);
        float _1304 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1306 = sqrt(_1302);
        float _1308 = precise::min(_1306, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1310 = _1308 * _1300;
        float _1312 = _1304 * _1310;
        float _1314 = -_1018;
        float _1316 = _1314 + _1262;
        float _1318 = fma(_1286, _1312, _616);
        float _1320 = fma(_1316, _1312, _1018);
        float _1322 = fma(_1290, _1312, _622);
        _1276 = _1320;
        _1270 = _1318;
        _1272 = _1322;
    }
    float _1324 = _1276;
    float _1326 = _1270;
    float _1328 = _1272;
    float _1330 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1332 = _1324 + _1330;
    float _1334 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1336 = _1326 + _1334;
    float _1338 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1340 = _1328 + _1338;
    float _1342 = _1332 * _1332;
    float _1344 = fma(_1336, _1336, _1342);
    float _1346 = fma(_1340, _1340, _1344);
    float _1348 = rsqrt(_1346);
    float _1350 = sqrt(_1346);
    float _1352 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1354 = _1336 * _1352;
    float _1356 = _1340 * _1352;
    float _1358 = _1354 * _1354;
    float _1360 = _1356 * _1356;
    float _1362 = _1358 + _1360;
    float _1364 = sqrt(_1362);
    bool _1366 = _1364 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1368 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1370 = _1364 + _1368;
    float _1372 = _1344;
    float _1374 = _1348;
    float _1376 = _1370;
    float _1378 = _1332;
    float _1380 = _1352;
    if (_1366)
    {
        float _1382 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1372 = _1382;
    }
    float _1384 = _1372;
    if (_1366)
    {
        float _1386 = rsqrt(_1362);
        _1374 = _1386;
    }
    float _1388 = _1374;
    float _1390 = _1384;
    float _1392 = _1388;
    if (_1366)
    {
        float _1394 = _1370 * _1384;
        _1376 = _1394;
    }
    float _1396 = _1376;
    if (_1366)
    {
        float _1398 = _1396 * 0.15915493667125701904296875;
        _1390 = _1398;
    }
    float _1400 = _1390;
    float _1402 = _1340;
    float _1404 = _1400;
    if (_1366)
    {
        float _1406 = _1400 * 6.283185482025146484375;
        float _1408 = sin(_1406);
        _1402 = _1408;
    }
    float _1410 = _1402;
    float _1412 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1414 = precise::max(0.0, _1412);
    float _1416 = _1268;
    float _1418 = _1414;
    if (_1366)
    {
        float _1420 = _1400 * 6.283185482025146484375;
        float _1422 = cos(_1420);
        _1416 = _1422;
    }
    float _1424 = _1416;
    float _1426 = -_1352;
    float _1428 = -_1414;
    float _1430 = fma(_1332, _1426, _1428);
    if (_1366)
    {
        float _1432 = _1430 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1378 = _1432;
    }
    float _1434 = _1378;
    float _1436 = _1434;
    if (!_1366)
    {
        _1404 = _1358;
    }
    float _1438 = _1404;
    float _1440 = _1410;
    float _1442 = _1438;
    if (_1366)
    {
        float _1444 = fma(_1410, _1434, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1436 = _1444;
    }
    float _1446 = _1436;
    float _1448 = _1446;
    if (!_1366)
    {
        _1440 = _1430;
    }
    float _1450 = _1440;
    float _1452 = _1450;
    if (_1366)
    {
        float _1454 = _1424 + (-1.0);
        _1418 = _1454;
    }
    float _1456 = _1418;
    float _1458 = _1456;
    if (_1366)
    {
        float _1460 = _1388 * _1446;
        _1120 = _1460;
    }
    float _1462 = _1120;
    if (!_1366)
    {
        _1392 = _1354;
    }
    float _1464 = _1392;
    float _1466 = _1464;
    if (_1366)
    {
        float _1468 = _1456 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1380 = _1468;
    }
    float _1470 = _1380;
    if (_1366)
    {
        float _1472 = _1354 * _1462;
        _1466 = _1472;
    }
    float _1474 = _1466;
    if (!_1366)
    {
        _1448 = _1356;
    }
    float _1476 = _1448;
    float _1478 = _1476;
    if (_1366)
    {
        float _1480 = _1356 * _1462;
        _1478 = _1480;
    }
    float _1482 = _1478;
    if (_1366)
    {
        float _1484 = fma(_1430, _1424, _1470);
        _1452 = _1484;
    }
    float _1486 = _1452;
    if (_1366)
    {
        float _1488 = _1474 * _1474;
        _1442 = _1488;
    }
    float _1490 = _1442;
    if (!_1366)
    {
        _1458 = _1360;
    }
    float _1492 = _1458;
    float _1494 = _1492;
    if (_1366)
    {
        float _1496 = _1482 * _1482;
        _1494 = _1496;
    }
    float _1498 = _1494;
    float _1500 = fma(_1486, _1486, _1490);
    float _1502 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1504 = _1500 + _1498;
    float _1506 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1502);
    float _1508 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1510 = fma(_1350, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1508);
    float _1512 = precise::clamp(_1510, 0.0, 1.0);
    float _1514 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1516 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1518 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1506);
    float _1520 = rsqrt(_1504);
    float _1522 = -_1512;
    float _1524 = _1522 + 1.0;
    float _1526 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1528 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1514);
    float _1530 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1532 = _1518 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1534 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1526);
    float _1536 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1528);
    float _1538 = abs(_1524);
    float _1540 = log2(_1538);
    float _1542 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1530);
    float _1544 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1534);
    float _1546 = _1536 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1548 = _1532 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1550 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1542);
    float _1552 = _1544 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1554 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1556 = _1520 * _1474;
    float _1558 = _1520 * _1486;
    float _1560 = _1550 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1562 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1554);
    float _1564 = _1556 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1566 = _1520 * _1482;
    float _1568 = -_1548;
    float _1570 = fma(_1568, _1516, 1.0);
    float _1572 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1562);
    float _1574 = -_1564;
    float _1576 = fma(_1558, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1574);
    float _1578 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1580 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1582 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1572);
    float _1584 = -_1566;
    float _1586 = fma(_1584, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1576);
    float _1588 = exp2(_1578);
    float _1590 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1592 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1580);
    float _1594 = fma(_1586, -0.5, 0.5);
    float _1596 = fma(_1586, 0.5, 0.5);
    float _1598 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1590);
    float _1600 = _1558 + 1.0;
    float _1602 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1592);
    float _1604 = log2(_1570);
    float _1606 = fma(_1596, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1608 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1598);
    float _1610 = fma(_1596, _1606, -0.212114393711090087890625);
    float _1612 = 1.0 / _1582;
    float _1614 = -_1558;
    float _1616 = fma(_1588, _1600, _1614);
    float _1618 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1602);
    float _1620 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1608);
    float _1622 = fma(_1596, _1610, 1.570728778839111328125);
    float _1624 = fma(_1616, 0.5, 0.5);
    float _1626 = sqrt(_1594);
    float _1628 = _1604 * 0.693147182464599609375;
    float _1630 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1632 = _1618 * _1612;
    float _1634 = _1620 * _1612;
    float _1636 = fma(_1632, 0.5, 0.5);
    float _1638 = fma(_1634, -0.5, 0.5);
    float _1640 = _1626 * 0.636619746685028076171875;
    float _1642 = -_1622;
    float _1644 = fma(_1640, _1642, 1.0);
    float3 _4672 = float3(_1636, _1638, _1630);
    float _1646 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4672, float3(0.0), isnan(_4672)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4672, float3(0.0), isnan(_4672)), level(0.0)).x;
    float3 _4683 = float3(_1636, _1638, _1630);
    float4 _1649 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4683, float3(0.0), isnan(_4683)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4683, float3(0.0), isnan(_4683)), level(0.0)).xyzw;
    float _1651 = _1649.x;
    float _1653 = _1649.y;
    float _1655 = _1649.z;
    float _1657 = _1649.w;
    float2 _4700 = float2(_1644, _1624);
    float3 _1661 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4700, float2(0.0), isnan(_4700)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4700, float2(0.0), isnan(_4700)), level(0.0)).xyz;
    float _1663 = _1661.x;
    float _1665 = _1661.y;
    float _1667 = _1661.z;
    float _1669 = in.m_55.w;
    float _1671 = -_146;
    float _1673 = _1671 + 1.0;
    float _1675 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1677 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1679 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1681 = _1679 != 0;
    float _1683 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1687 = _1685 != 0;
    float _1689 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1693 = _1691 != 0;
    float _1695 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1699 = _1697 != 0;
    int _1701 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1703 = _1701 != 0;
    float _1705 = _1675 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1707 = exp2(_1683);
    bool _1709 = _1669 > 0.5;
    float _1711 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1713 = _1711 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1715 = _454 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1717 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1719 = _1717 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1721 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1723 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1725 = _1721 || _1723;
    bool _1727 = isnan(0.5);
    bool _1729 = _1725 || _1727;
    float _1731 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1733 = _456 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1735 = -_1695;
    float _1737 = fma(_1715, 2.0, _1735);
    float _1739 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1741 = _1739 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1743 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1745 = fma(_1733, -2.0, _1731);
    float _1747 = 1.0 / _1713;
    float _1749 = _1733;
    bool _1751 = _1709;
    float _1753 = _1741;
    bool _1755 = _1699;
    float _1757 = _1546;
    if (!_1681)
    {
        _1749 = _456;
    }
    float _1759 = _1749;
    float _1761 = in.m_49.x;
    int _1763 = _1709 ? as_type<int>(_1673) : as_type<int>(_146);
    float _1765 = -_124;
    float _1767 = fma(_1765, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1737);
    float _1769 = _1759;
    float _1771 = _1767;
    if (_1687)
    {
        bool _1773 = _454 > 0.5;
        _1751 = _1773;
    }
    bool _1775 = _1751;
    float _1777 = -_1707;
    float _1779 = _1777 + 1.0;
    if (_1681)
    {
        _1769 = _454;
    }
    float _1781 = _1769;
    float _1783 = 1.0 / _1719;
    float _1785 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1743);
    float _1787 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1789 = _1787 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1791 = _1779 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1793 = 0.0;
    if (!_1681)
    {
        _1793 = _448;
    }
    float _1795 = _1793;
    float _1797 = 1.0 / _1741;
    float _1799 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1801 = _1795;
    if (_1681)
    {
        _1801 = _456;
    }
    float _1803 = _1801;
    float _1805 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1799);
    float _1807 = _1699 ? as_type<float>(_1763) : _146;
    float _1809 = 1.0 / _1789;
    if (!_1681)
    {
        _1753 = _448;
    }
    float _1811 = _1753;
    float _1813 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1815 = _1813 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1817 = _1811;
    if (_1681)
    {
        _1817 = _456;
    }
    float _1819 = _1817;
    int _1821 = 0;
    float _1823 = _1761;
    if (_1687)
    {
        float _1825 = -_1761;
        float _1827 = _1825 + 1.0;
        _1821 = as_type<int>(_1827);
    }
    int _1829 = _1821;
    bool _1831 = _456 > 0.5;
    float _1833 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1835 = _1833 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    if (_1693)
    {
        bool _1837 = _448 > 0.5;
        _1755 = _1837;
    }
    bool _1839 = _1755;
    float _1841 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1843 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1841;
    float _1845 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1847 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1845;
    float _1849 = _1835 * _1783;
    float _1851 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1853 = _446 + _1851;
    float _1855 = _1843 * _1747;
    float _1857 = _1847 * _1797;
    float _1859 = fma(_1849, _1853, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1861 = _1815 * _1809;
    float _1863 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1865 = _446 + _1863;
    bool _1867 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1869 = isnan(_446);
    bool _1871 = _1867 || _1869;
    bool _1873 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1875 = _1871 || _1873;
    float _1877 = float(_1875);
    float _1879 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1881 = _1861;
    if (_1703)
    {
        float _1883 = _1831 ? _1673 : _146;
        _178 = _1883;
    }
    float _1885 = _178;
    float _1887 = fma(_1857, _1865, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1889 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1891 = isnan(_446);
    bool _1893 = _1889 || _1891;
    bool _1895 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1897 = _1893 || _1895;
    float _1899 = float(_1897);
    float _1901 = -_1877;
    float _1903 = _1901 + 1.0;
    bool _1905 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1907 = isnan(_446);
    bool _1909 = _1905 || _1907;
    bool _1911 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1913 = _1909 || _1911;
    float _1915 = float(_1913);
    float _1917 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1919 = _446 + _1917;
    float _1921 = fma(_1803, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1879);
    float _1923 = _1899 * _1903;
    float _1925 = -_1899;
    float _1927 = _1925 + 1.0;
    float _1929 = fma(_1807, _1705, -0.5);
    bool _1931 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1933 = isnan(_446);
    bool _1935 = _1931 || _1933;
    bool _1937 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1939 = _1935 || _1937;
    float _1941 = float(_1939);
    float _1943 = -_1915;
    float _1945 = _1943 + 1.0;
    float _1947 = fma(_1855, _1919, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1949 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1951 = _446 + _1949;
    bool _1953 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1955 = isnan(_446);
    bool _1957 = _1953 || _1955;
    bool _1959 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1961 = _1957 || _1959;
    float _1963 = float(_1961);
    float _1965 = _1941 * _1945;
    float _1967 = -_1941;
    float _1969 = _1967 + 1.0;
    float _1971 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1973 = _1915 * _1927;
    float _1975 = _1963 * _1969;
    float _1977 = _1689 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1979 = fma(_1781, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1971);
    float _1981 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1983 = _1781 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1985 = _1947 * _1975;
    float _1987 = fma(_1861, _1951, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1989 = _1887;
    float _1991 = _1923;
    if (!_1687)
    {
        _1881 = _1761;
    }
    float _1993 = _1881;
    float _1995 = -_1981;
    float _1997 = fma(_1983, 2.0, _1995);
    float _1999 = fma(_616, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1677);
    float _2001 = _1819 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2003 = _1993;
    if (_1687)
    {
        float _2005 = _1775 ? as_type<float>(_1829) : _1761;
        _2003 = _2005;
    }
    float _2007 = _2003;
    float _2009 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2011 = fma(_622, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1999);
    float _2013 = fma(_1977, _1885, -0.5);
    float _2015 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2017 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2019 = fma(_616, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2009);
    float _2021 = _2011 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2023 = fma(_2001, -2.0, _2015);
    float _2025 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1805);
    float _2027 = fma(_622, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2019);
    float _2029 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1745);
    float _2031 = -_1963;
    float _2033 = _2031 + 1.0;
    float _2035 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2037 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1979);
    float _2039 = -_2029;
    float _2041 = fma(_2025, _2013, _2039);
    float _2043 = fma(_2033, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1985);
    float _2045 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1785);
    float _2047 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1921);
    float _2049 = -_124;
    float _2051 = fma(_2049, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1997);
    float _2053 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2023);
    float _2055 = 1.0 / _2021;
    float _2057 = _2027 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2059 = _2017 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2061 = 0;
    float _2063 = _2017;
    float _2065 = _2007;
    float _2067 = _2045;
    if (_1693)
    {
        float _2069 = -_1761;
        float _2071 = _2069 + 1.0;
        _2061 = as_type<int>(_2071);
    }
    int _2073 = _2061;
    if (!_1729)
    {
        _2063 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2075 = _2063;
    float _2077 = _2057 + _2021;
    float _2079 = fma(_2059, _2007, -0.5);
    if (!_1729)
    {
        _2065 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2081 = _2065;
    float _2083 = _2035 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_1693)
    {
        float _2085 = _1839 ? as_type<float>(_2073) : _1761;
        _1823 = _2085;
    }
    float _2087 = _1823;
    float _2089 = fma(_1859, _1965, _2043);
    float _2091 = in.m_61.w;
    float _2093 = -_2053;
    float _2095 = fma(_2047, _1929, _2093);
    float _2097 = fma(_2083, _2087, -0.5);
    float _2099 = fma(_1887, _1973, _2089);
    float _2101 = _2077 * _2055;
    float _2103 = _2101 * 0.5;
    float _2105 = fma(_2045, _2079, _1767);
    if (!_1729)
    {
        float _2107 = -_2081;
        float _2109 = _2107 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1771 = _2109;
    }
    float _2111 = _1771;
    float _2113 = fma(_2037, _2097, _2051);
    if (!_1729)
    {
        float _2115 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2117 = fma(_2103, _2075, _2115);
        _2067 = _2117;
    }
    float _2119 = _2067;
    if (!_1729)
    {
        float _2121 = 1.0 / _2111;
        _1989 = _2121;
    }
    float _2123 = _1989;
    float _2125 = fma(_1987, _1923, _2099);
    float _2127 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2129 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2131 = _2041 + 0.5;
    float _2133 = _1859;
    if (!_1729)
    {
        float _2135 = 1.0 / _2119;
        _2133 = _2135;
    }
    float _2137 = _2133;
    float _2139 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2141 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2143 = _2127 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2145 = _2129 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2147 = _2139 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2149 = _2095 + 0.5;
    float _2151 = _2105 + 0.5;
    float _2153 = _2113 + 0.5;
    float _2155 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    if (_1729)
    {
        _1757 = 1.0;
    }
    float _2157 = _1757;
    out.m_63.x = _2143;
    out.m_63.y = _2145;
    out.m_63.z = _2147;
    out.m_63.w = _2141;
    float _2159 = fma(_1877, (*spvDescriptorSet0.vp_c9)._m0[119].x, _2125);
    float _2161 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2155);
    out.m_65.x = _2151;
    out.m_65.y = _2131;
    out.m_65.z = _2153;
    out.m_65.w = _2149;
    float _2163 = _2157;
    if (!_1729)
    {
        float _2165 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2167 = -_2081;
        float _2169 = fma(_2137, _2165, _2167);
        _1991 = _2169;
    }
    float _2171 = _1991;
    float _2173 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2161);
    out.m_67.w = _2091;
    if (!_1729)
    {
        float _2175 = _2171 * _2123;
        float _2177 = precise::clamp(_2175, 0.0, 1.0);
        _2163 = _2177;
    }
    float _2179 = _2163;
    float _2181 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2173);
    float _2183 = _416 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2185 = _1582 * 0.5;
    float _2187 = _414 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _2189 = _2179 > 0.0;
    bool _2191 = isnan(_2179);
    bool _2193 = _2189 || _2191;
    bool _2195 = isnan(0.0);
    bool _2197 = _2193 || _2195;
    float _2199 = _412 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2201 = fma(_1620, -0.5, _2185);
    float _2203 = -_1791;
    float _2205 = _2203 + 1.0;
    float _2207 = _2179 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2209 = _2181 + _1582;
    float _2211 = _1618 + _1582;
    out.gl_Position.x = _1618;
    out.gl_Position.y = _1620;
    out.gl_Position.z = _2181;
    out.gl_Position.w = _1582;
    float _2213 = _2199 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2215 = _2187 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2217 = _2183 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2219 = _2159 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2221 = _2209 * 0.5;
    float _2223 = _2211 * 0.5;
    float _2225 = _2207 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _2213;
    out.m_69.y = _2215;
    out.m_69.z = _2217;
    out.m_69.w = _2219;
    out.m_71.x = _2223;
    out.m_71.y = _2201;
    out.m_71.z = _2221;
    out.m_71.w = _1582;
    out.m_45.x = _2225;
    float _2227 = _1791 * _1646;
    float _2229 = _1657 * _2227;
    float _2231 = _1667 * _2227;
    float _2233 = fma(_1663, _2229, _1651);
    float _2235 = fma(_1665, _2229, _1653);
    float _2237 = _1657 * _2205;
    float _2239 = fma(_1657, _2231, _1655);
    out.m_73.x = _2233;
    out.m_73.y = _2235;
    out.m_73.z = _2239;
    out.m_73.w = _2237;
    if (_2197)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2241 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2241;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _438 = false;
    bool _312 = false;
    bool _198 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_42.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2297 = as_type<float>(_108);
        out.gl_Position.z = _2297;
    }
    if (!_96)
    {
        return out;
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    if (_120)
    {
        float _128 = float(_92);
        _126 = _128;
    }
    float _130 = _126;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    if (_136)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _102;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    int _140 = 0;
    if (_136)
    {
        float _142 = _138 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2365 = as_type<float>(_144);
        out.gl_Position.z = _2365;
    }
    if (_136)
    {
        return out;
    }
    float _146 = in.m_49.y;
    bool _148 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _150 = in.m_51.x;
    float _152 = in.m_51.y;
    float _154 = in.m_51.z;
    out.m_53.y = _146;
    float _156 = _152 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _158 = _152 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _160 = _152 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _162 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].x, _156);
    float _164 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].x, _158);
    float _166 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].x, _160);
    float _168 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[4].z, _162);
    float _170 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[5].z, _164);
    float _172 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[6].z, _166);
    bool _174 = !_148;
    float _176 = _168;
    float _178 = _146;
    float _196;
    if (!_174)
    {
        float _180 = in.m_55.x;
        float _182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _186 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _188 = _186 * _182;
        float _190 = floor(_188);
        float _192 = -_190;
        float _194 = _188 + _192;
        _196 = _194;
        _198 = true;
    }
    else
    {
        float _200 = float(_92);
        float _202 = 1.0 / _200;
        float _204 = _124 * _202;
        _196 = _204;
    }
    _198 = false;
    float _206 = _196;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _210 = _206 + _208;
    bool _212 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _214 = isnan(_206);
    bool _216 = _212 || _214;
    bool _218 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _220 = _216 || _218;
    float _222 = float(_220);
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _224;
    bool _228 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _230 = isnan(_206);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    float _240 = -_222;
    float _242 = _240 + 1.0;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _244;
    float _248 = 1.0 / _226;
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _252 = _238 * _242;
    float _254 = -_238;
    float _256 = _254 + 1.0;
    float _258 = _210 * _248;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _260;
    float _264 = fma(_246, _258, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _266;
    float _270 = fma(_262, _258, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _272 = _264 * _252;
    float _274 = fma(_268, _258, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _276 = _270 * _252;
    float _278 = _274 * _252;
    float _280 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[143].x, _272);
    float _282 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[143].y, _278);
    float _284 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[143].z, _276);
    float _286 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[144].x, _280);
    float _288 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[144].y, _282);
    float _290 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[144].z, _284);
    bool _292 = !_250;
    float _310;
    if (!_292)
    {
        float _294 = in.m_55.x;
        float _296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _298 = _294 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _302 = _300 * _296;
        float _304 = floor(_302);
        float _306 = -_304;
        float _308 = _302 + _306;
        _310 = _308;
        _312 = true;
    }
    else
    {
        float _314 = float(_92);
        float _316 = 1.0 / _314;
        float _318 = _124 * _316;
        _310 = _318;
    }
    _312 = false;
    float _320 = _310;
    float _322 = in.m_57.x;
    float _324 = in.m_57.y;
    float _326 = in.m_57.z;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _330 = _320 + _328;
    bool _332 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _334 = isnan(_320);
    bool _336 = _332 || _334;
    bool _338 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _340 = _336 || _338;
    float _342 = float(_340);
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _346;
    float _350 = 1.0 / _348;
    float _352 = _290 * _326;
    float _354 = _288 * _324;
    float _356 = -_342;
    float _358 = _356 + 1.0;
    float _360 = _330 * _350;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _362;
    bool _366 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _368 = isnan(_320);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _378;
    float _382 = _286 * _322;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _384;
    float _388 = fma(_364, _360, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _390 = _376 * _358;
    float _392 = fma(_380, _360, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _394 = fma(_386, _360, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _396 = -_376;
    float _398 = _396 + 1.0;
    float _400 = _388 * _390;
    float _402 = _392 * _390;
    float _404 = _394 * _390;
    float _406 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[107].x, _400);
    float _408 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[107].y, _402);
    float _410 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[107].z, _404);
    float _412 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[108].x, _406);
    float _414 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[108].y, _408);
    float _416 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[108].z, _410);
    bool _418 = !_344;
    float _436;
    if (!_418)
    {
        float _420 = in.m_55.x;
        float _422 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _424 = _420 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _426 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _428 = _426 * _422;
        float _430 = floor(_428);
        float _432 = -_430;
        float _434 = _428 + _432;
        _436 = _434;
        _438 = true;
    }
    else
    {
        float _440 = float(_92);
        float _442 = 1.0 / _440;
        float _444 = _124 * _442;
        _436 = _444;
    }
    _438 = false;
    float _446 = _436;
    float _448 = in.m_55.z;
    float _450 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _452 = log2(_450);
    float _454 = in.m_55.x;
    float _456 = in.m_55.y;
    float _458 = _448 * 2.0;
    float _460 = _454 * 2.0;
    float _462 = floor(_458);
    float _464 = _456 * 2.0;
    float _466 = floor(_460);
    float _468 = floor(_464);
    bool _470 = _462 > 0.0;
    bool _472 = _462 >= 0.0;
    bool _474 = isnan(_462);
    bool _476 = _472 || _474;
    bool _478 = isnan(0.0);
    bool _480 = _476 || _478;
    int _482 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _484 = _482 != 0;
    int _486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _488 = _486 != 0;
    int _490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _492 = _490 != 0;
    float _494 = in.m_42.x;
    float _496 = in.m_42.y;
    float _498 = in.m_42.z;
    int _500 = _480 ? 0 : 1;
    bool _502 = _466 > 0.0;
    int _504 = ~_500;
    int _506 = _504 + 1;
    int _508 = _506 + 1;
    bool _510 = _466 >= 0.0;
    bool _512 = isnan(_466);
    bool _514 = _510 || _512;
    bool _516 = isnan(0.0);
    bool _518 = _514 || _516;
    bool _520 = !_484;
    int _522 = _520 ? 0 : 1;
    int _524 = _508;
    if (!_470)
    {
        int _526 = ~_500;
        int _528 = _526 + 1;
        _524 = _528;
    }
    int _530 = _524;
    bool _532 = _468 > 0.0;
    int _534 = abs(_522);
    float _536 = _454 + _456;
    bool _538 = _468 >= 0.0;
    bool _540 = isnan(_468);
    bool _542 = _538 || _540;
    bool _544 = isnan(0.0);
    bool _546 = _542 || _544;
    float _548 = _124 * _452;
    float _550 = float(_534);
    float _552 = _536 + (-1.0);
    int _554 = _546 ? 0 : 1;
    float _556 = float(_530);
    float _558 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _560 = ~_554;
    int _562 = _560 + 1;
    int _564 = _562 + 1;
    float _566 = exp2(_548);
    int _568 = _564;
    if (!_532)
    {
        int _570 = ~_554;
        int _572 = _570 + 1;
        _568 = _572;
    }
    int _574 = _568;
    float _576 = _550 * _556;
    float _578 = _496 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _580 = _496 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _582 = !_492;
    int _584 = _582 ? 0 : 1;
    float _586 = _454 + _448;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _590 = 1.0 + _588;
    float _592 = fma(_494, (*spvDescriptorSet0.vp_c10)._m0[4].x, _578);
    float _594 = fma(_494, (*spvDescriptorSet0.vp_c10)._m0[6].x, _580);
    bool _596 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _598 = isnan(0.0);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _604 = _600 || _602;
    float _606 = 1.0 / _590;
    float _608 = fma(_498, (*spvDescriptorSet0.vp_c10)._m0[4].z, _592);
    float _610 = fma(_498, (*spvDescriptorSet0.vp_c10)._m0[6].z, _594);
    int _612 = abs(_584);
    float _614 = _586 + (-1.0);
    float _616 = _608 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _618 = -_566;
    float _620 = _618 + 1.0;
    float _622 = _610 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _624 = float(_612);
    float _626 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _628 = _616 + _626;
    float _630 = float(_574);
    float _632 = -_622;
    float _634 = _632 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _636 = _604 ? _620 : 0.0;
    float _638 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _640 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _642 = isnan(1.0);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _648 = _644 || _646;
    float _650 = _576 * (-2.0);
    float _652 = abs(_628);
    float _654 = abs(_634);
    float _656 = precise::max(_652, _654);
    float _658 = _636 * _606;
    float _660 = _454 + (-0.5);
    float _662 = _624 * _630;
    bool _664 = _656 >= 16.0;
    float _666 = fma(_558, _650, _558);
    bool _668 = !_648;
    float _670 = _668 ? _124 : _658;
    float _672 = _660 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _674 = _448 + (-0.5);
    float _676 = _662 * (-2.0);
    int _678 = _518 ? 0 : 1;
    float _680 = fma(_670, _666, _672);
    float _682 = _674 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _684 = _628 * 0.0625;
    float _686 = fma(_638, _676, _638);
    float _688 = _680 * 0.15915493667125701904296875;
    int _690 = ~_678;
    int _692 = _690 + 1;
    int _694 = _692 + 1;
    float _696 = _634;
    int _698 = _694;
    bool _700 = _664;
    if (_664)
    {
        float _702 = _634 * 0.0625;
        _696 = _702;
    }
    float _704 = _696;
    float _706 = _664 ? _684 : _628;
    float _708 = fma(_670, _686, _682);
    bool _710 = !_488;
    int _712 = _710 ? 0 : 1;
    float _714 = _456 + _448;
    if (!_502)
    {
        int _716 = ~_678;
        int _718 = _716 + 1;
        _698 = _718;
    }
    int _720 = _698;
    float _722 = _708 * 0.15915493667125701904296875;
    float _724 = abs(_706);
    bool _726 = _724 != 0.0;
    bool _728 = isnan(_724);
    bool _730 = _726 || _728;
    bool _732 = isnan(0.0);
    bool _734 = _730 || _732;
    float _736 = _714 + (-1.0);
    int _738 = abs(_712);
    float _740 = _688 * 6.283185482025146484375;
    float _742 = sin(_740);
    float _744 = abs(_704);
    bool _746 = _744 == 0.0;
    bool _748 = !_734;
    bool _750 = _746 && _748;
    float _752 = float(_720);
    float _754 = in.m_59.x;
    float _756 = in.m_59.y;
    float _758 = in.m_59.z;
    float _760 = float(_738);
    float _762 = _688 * 6.283185482025146484375;
    float _764 = cos(_762);
    float _766 = abs(_704);
    bool _768 = _766 == 0.0;
    float _770 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _772 = _760 * _752;
    float _774 = _456 + (-0.5);
    int _776 = as_type<int>(_774);
    if (_750)
    {
        bool _778 = as_type<int>(_704) >= 0;
        _700 = _778;
    }
    bool _780 = _700;
    float _782 = _722 * 6.283185482025146484375;
    float _784 = sin(_782);
    float _786 = _772 * (-2.0);
    float _788 = _774 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    int _790 = _780 ? (-1) : 0;
    if (_750)
    {
        int _792 = _780 ? 0 : 1078530011;
        _776 = _792;
    }
    int _794 = _776;
    float _796 = fma(_770, _786, _770);
    int _798 = _794;
    if (_750)
    {
        int _800 = int(0x80000000) & as_type<int>(_706);
        int _802 = _794 | _800;
        _798 = _802;
    }
    int _804 = _798;
    float _806 = fma(_670, _796, _788);
    bool _808 = !_734;
    bool _810 = _808 && _768;
    int _812 = _804;
    float _814 = as_type<float>(_804);
    if (!_810)
    {
        float _816 = abs(_706);
        bool _818 = _816 != as_type<float>(0x7f800000u /* inf */);
        bool _820 = isnan(_816);
        bool _822 = _818 || _820;
        bool _824 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _826 = _822 || _824;
        float _828 = abs(_704);
        bool _830 = _828 == as_type<float>(0x7f800000u /* inf */);
        float _832 = abs(_704);
        bool _834 = _832 == as_type<float>(0x7f800000u /* inf */);
        bool _836 = !_826;
        bool _838 = _834 && _836;
        if (_838)
        {
            bool _840 = as_type<int>(_704) >= 0;
            _790 = _840 ? (-1) : 0;
        }
        int _842 = _790;
        if (_838)
        {
            _812 = 1075235812;
        }
        int _844 = _812;
        int _846 = _844;
        if (_838)
        {
            int _848 = ~_842;
            int _850 = (_848 != 0) ? _844 : 1061752795;
            _846 = _850;
        }
        int _852 = _846;
        float _854 = as_type<float>(_852);
        if (_838)
        {
            int _856 = int(0x80000000) & as_type<int>(_706);
            int _858 = _852 | _856;
            _854 = as_type<float>(_858);
        }
        float _860 = _854;
        bool _862 = !_826;
        bool _864 = _862 && _830;
        _814 = _860;
        if (!_864)
        {
            float _866 = abs(_704);
            float _868 = abs(_706);
            float _870 = precise::max(_866, _868);
            float _872 = abs(_704);
            float _874 = abs(_706);
            float _876 = precise::min(_872, _874);
            float _878 = 1.0 / _870;
            float _880 = abs(_706);
            float _882 = abs(_704);
            bool _884 = _880 > _882;
            bool _886 = as_type<int>(_704) >= 0;
            float _888 = abs(_704);
            float _890 = abs(_706);
            float _892 = _888 + _890;
            int _894 = as_type<int>(_706) & int(0x80000000);
            bool _896 = _892 > as_type<float>(0x7f800000u /* inf */);
            bool _898 = isnan(_892);
            bool _900 = _896 || _898;
            bool _902 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _904 = _900 || _902;
            float _906 = _876 * _878;
            float _908 = _906 * _906;
            float _910 = _908 + 11.33538818359375;
            float _912 = fma(_908, _910, 28.84246826171875);
            float _914 = fma(_908, _912, 19.6966705322265625);
            float _916 = fma(_908, -0.82336294651031494140625, -5.674867153167724609375);
            float _918 = fma(_908, _916, -6.565555095672607421875);
            float _920 = 1.0 / _914;
            float _922 = _908 * _918;
            float _924 = _906 * _922;
            float _926 = fma(_924, _920, _906);
            float _928 = _926;
            _814 = _892;
            if (_884)
            {
                float _930 = -_926;
                float _932 = _930 + 1.57079637050628662109375;
                _928 = _932;
            }
            float _934 = _928;
            int _936 = as_type<int>(_934);
            if (!_886)
            {
                float _938 = -_934;
                float _940 = _938 + 3.1415927410125732421875;
                _936 = as_type<int>(_940);
            }
            int _942 = _936;
            if (!_904)
            {
                int _944 = _894 | _942;
                _814 = as_type<float>(_944);
            }
        }
    }
    float _946 = _814;
    float _948 = -_946;
    float _950 = _806 + _948;
    float _952 = _496 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _954 = _448 * 6.283185482025146484375;
    float _956 = _950 * 0.15915493667125701904296875;
    float _958 = _722 * 6.283185482025146484375;
    float _960 = cos(_958);
    float _962 = fma(_494, (*spvDescriptorSet0.vp_c10)._m0[5].x, _952);
    float _964 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _754);
    float _966 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _758);
    float _968 = fma(_124, 0.310000002384185791015625, _954);
    float _970 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _756);
    float _972 = _382 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _974 = _956 * 6.283185482025146484375;
    float _976 = sin(_974);
    float _978 = _968 * 0.15915493667125701904296875;
    float _980 = _354 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _982 = _454 * 6.283185482025146484375;
    float _984 = _964 * _972;
    float _986 = _980 * _970;
    float _988 = _352 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _990 = _956 * 6.283185482025146484375;
    float _992 = cos(_990);
    float _994 = fma(_124, 0.10999999940395355224609375, _982);
    float _996 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _998 = _960 * _986;
    float _1000 = _966 * _988;
    float _1002 = _994 * 0.15915493667125701904296875;
    float _1004 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _996);
    float _1006 = _742 * _976;
    float _1008 = _764 * _998;
    float _1010 = 1.0 / _980;
    float _1012 = fma(_498, (*spvDescriptorSet0.vp_c10)._m0[5].z, _962);
    float _1014 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1004);
    float _1016 = _742 * _998;
    float _1018 = _1012 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1020 = _764 * _992;
    float _1022 = _764 * _976;
    float _1024 = _742 * _992;
    float _1026 = _978 * 6.283185482025146484375;
    float _1028 = sin(_1026);
    float _1030 = fma(_784, _1020, _1006);
    float _1032 = -_986;
    float _1034 = _784 * _1032;
    float _1036 = fma(_784, _1006, _1020);
    float _1038 = _992 * _960;
    float _1040 = fma(_1030, _984, _1008);
    float _1042 = -_1024;
    float _1044 = fma(_784, _1022, _1042);
    float _1046 = _976 * _960;
    float _1048 = sqrt(_1014);
    float _1050 = fma(_1038, _984, _1034);
    float _1052 = fma(_1044, _1000, _1040);
    float _1054 = fma(_1046, _1000, _1050);
    float _1056 = _1018 + _1052;
    float _1058 = -_1022;
    float _1060 = fma(_784, _1024, _1058);
    float _1062 = _1002 * 6.283185482025146484375;
    float _1064 = sin(_1062);
    float _1066 = fma(_1028, 0.12999999523162841796875, 1.0);
    float _1068 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1070 = _1056 + _1068;
    float _1072 = fma(_1060, _984, _1016);
    float _1074 = _616 + _1054;
    float _1076 = _1070 * _1010;
    float _1078 = fma(_1036, _1000, _1072);
    float _1080 = _1048 * 0.64999997615814208984375;
    float _1082 = fma(_1076, _1076, _1076);
    float _1084 = _622 + _1078;
    float _1086 = _1082 * _1080;
    float _1088 = fma(_1064, 0.300000011920928955078125, _1066);
    float _1090 = _1088 * _1086;
    float _1092 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[32].z, _1084);
    float _1094 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[32].x, _1074);
    float _1096 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[32].y, _1056);
    float _1098 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1100 = _1092 + _1098;
    float _1102 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1104 = _1094 + _1102;
    float _1106 = _1100 * _1100;
    float _1108 = fma(_1104, _1104, _1106);
    float _1110 = sqrt(_1108);
    bool _1112 = _1110 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1114 = _1106;
    float _1116 = _1000;
    float _1118 = _1094;
    float _1120 = _1034;
    if (!_1112)
    {
        _1114 = _1092;
    }
    float _1122 = _1114;
    float _1124 = _1122;
    if (!_1112)
    {
        _1116 = _1096;
    }
    float _1126 = _1116;
    bool _1128 = !_1112;
    float _1130 = _1126;
    if (!_1128)
    {
        float _1132 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1134 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1136 = _1110 + _1134;
        float _1138 = rsqrt(_1108);
        float _1140 = _1136 * _1132;
        float _1142 = _1096 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1144 = _1140 * 0.15915493667125701904296875;
        float _1146 = _1144 * 6.283185482025146484375;
        float _1148 = cos(_1146);
        float _1150 = _1144 * 6.283185482025146484375;
        float _1152 = sin(_1150);
        float _1154 = _1148 + (-1.0);
        float _1156 = _1154 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1158 = fma(_1152, _1142, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1160 = fma(_1096, _1148, _1156);
        float _1162 = _1138 * _1158;
        float _1164 = fma(_1104, _1162, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1166 = fma(_1100, _1162, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1130 = _1160;
        _1118 = _1164;
        _1124 = _1166;
    }
    float _1168 = _1130;
    float _1170 = _1118;
    float _1172 = _1124;
    float _1174 = -_1018;
    float _1176 = _1174 + _1168;
    float _1178 = -_616;
    float _1180 = _1178 + _1170;
    float _1182 = -_622;
    float _1184 = _1182 + _1172;
    float _1186 = _1176 * _1176;
    float _1188 = fma(_1180, _1180, _1186);
    float _1190 = fma(_1184, _1184, _1188);
    float _1192 = sqrt(_1190);
    bool _1194 = _1192 > 0.0;
    bool _1196 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1198 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1200 = _1196 || _1198;
    bool _1202 = isnan(0.5);
    bool _1204 = _1200 || _1202;
    bool _1206 = !_1194;
    float _1208 = _1168;
    float _1210 = _1170;
    float _1212 = _1172;
    float _1214 = _1190;
    if (!_1206)
    {
        float _1216 = _170 * _170;
        float _1218 = fma(_168, _168, _1216);
        float _1220 = fma(_172, _172, _1218);
        float _1222 = rsqrt(_1190);
        float _1224 = sqrt(_1220);
        float _1226 = _1184 * _1222;
        bool _1228 = _1224 > 0.0;
        float _1230 = _1180 * _1222;
        float _1232 = _1176 * _1222;
        bool _1234 = !_1228;
        if (!_1234)
        {
            float _1236 = rsqrt(_1220);
            float _1238 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1240 = _170 * _1236;
            float _1242 = _168 * _1236;
            float _1244 = _1232 * _1240;
            float _1246 = _172 * _1236;
            float _1248 = fma(_1230, _1242, _1244);
            float _1250 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1252 = fma(_1226, _1246, _1248);
            float _1254 = _1252 * _1250;
            float _1256 = fma(_168, _1254, _1170);
            float _1258 = fma(_170, _1254, _1168);
            float _1260 = fma(_172, _1254, _1172);
            _1208 = _1258;
            _1210 = _1256;
            _1212 = _1260;
            _1214 = _1254;
        }
    }
    float _1262 = _1208;
    float _1264 = _1210;
    float _1266 = _1212;
    float _1268 = _1214;
    float _1270 = _1264;
    float _1272 = _1266;
    if (_1204)
    {
        _176 = _1262;
    }
    float _1274 = _176;
    float _1276 = _1274;
    if (!_1204)
    {
        float _1278 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1280 = _1018 + _1278;
        float _1282 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1284 = -_616;
        float _1286 = _1284 + _1264;
        float _1288 = -_622;
        float _1290 = _1288 + _1266;
        float _1292 = _1280 * _1280;
        float _1294 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1296 = _622 + _1294;
        float _1298 = fma(_628, _628, _1292);
        float _1300 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1302 = fma(_1296, _1296, _1298);
        float _1304 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1306 = sqrt(_1302);
        float _1308 = precise::min(_1306, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1310 = _1308 * _1300;
        float _1312 = _1304 * _1310;
        float _1314 = -_1018;
        float _1316 = _1314 + _1262;
        float _1318 = fma(_1286, _1312, _616);
        float _1320 = fma(_1316, _1312, _1018);
        float _1322 = fma(_1290, _1312, _622);
        _1276 = _1320;
        _1270 = _1318;
        _1272 = _1322;
    }
    float _1324 = _1276;
    float _1326 = _1270;
    float _1328 = _1272;
    float _1330 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1332 = _1324 + _1330;
    float _1334 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1336 = _1326 + _1334;
    float _1338 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1340 = _1328 + _1338;
    float _1342 = _1332 * _1332;
    float _1344 = fma(_1336, _1336, _1342);
    float _1346 = fma(_1340, _1340, _1344);
    float _1348 = rsqrt(_1346);
    float _1350 = sqrt(_1346);
    float _1352 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1354 = _1336 * _1352;
    float _1356 = _1340 * _1352;
    float _1358 = _1354 * _1354;
    float _1360 = _1356 * _1356;
    float _1362 = _1358 + _1360;
    float _1364 = sqrt(_1362);
    bool _1366 = _1364 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1368 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1370 = _1364 + _1368;
    float _1372 = _1344;
    float _1374 = _1348;
    float _1376 = _1370;
    float _1378 = _1332;
    float _1380 = _1352;
    if (_1366)
    {
        float _1382 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1372 = _1382;
    }
    float _1384 = _1372;
    if (_1366)
    {
        float _1386 = rsqrt(_1362);
        _1374 = _1386;
    }
    float _1388 = _1374;
    float _1390 = _1384;
    float _1392 = _1388;
    if (_1366)
    {
        float _1394 = _1370 * _1384;
        _1376 = _1394;
    }
    float _1396 = _1376;
    if (_1366)
    {
        float _1398 = _1396 * 0.15915493667125701904296875;
        _1390 = _1398;
    }
    float _1400 = _1390;
    float _1402 = _1340;
    float _1404 = _1400;
    if (_1366)
    {
        float _1406 = _1400 * 6.283185482025146484375;
        float _1408 = sin(_1406);
        _1402 = _1408;
    }
    float _1410 = _1402;
    float _1412 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1414 = precise::max(0.0, _1412);
    float _1416 = _1268;
    float _1418 = _1414;
    if (_1366)
    {
        float _1420 = _1400 * 6.283185482025146484375;
        float _1422 = cos(_1420);
        _1416 = _1422;
    }
    float _1424 = _1416;
    float _1426 = -_1352;
    float _1428 = -_1414;
    float _1430 = fma(_1332, _1426, _1428);
    if (_1366)
    {
        float _1432 = _1430 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1378 = _1432;
    }
    float _1434 = _1378;
    float _1436 = _1434;
    if (!_1366)
    {
        _1404 = _1358;
    }
    float _1438 = _1404;
    float _1440 = _1410;
    float _1442 = _1438;
    if (_1366)
    {
        float _1444 = fma(_1410, _1434, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1436 = _1444;
    }
    float _1446 = _1436;
    float _1448 = _1446;
    if (!_1366)
    {
        _1440 = _1430;
    }
    float _1450 = _1440;
    float _1452 = _1450;
    if (_1366)
    {
        float _1454 = _1424 + (-1.0);
        _1418 = _1454;
    }
    float _1456 = _1418;
    float _1458 = _1456;
    if (_1366)
    {
        float _1460 = _1388 * _1446;
        _1120 = _1460;
    }
    float _1462 = _1120;
    if (!_1366)
    {
        _1392 = _1354;
    }
    float _1464 = _1392;
    float _1466 = _1464;
    if (_1366)
    {
        float _1468 = _1456 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1380 = _1468;
    }
    float _1470 = _1380;
    if (_1366)
    {
        float _1472 = _1354 * _1462;
        _1466 = _1472;
    }
    float _1474 = _1466;
    if (!_1366)
    {
        _1448 = _1356;
    }
    float _1476 = _1448;
    float _1478 = _1476;
    if (_1366)
    {
        float _1480 = _1356 * _1462;
        _1478 = _1480;
    }
    float _1482 = _1478;
    if (_1366)
    {
        float _1484 = fma(_1430, _1424, _1470);
        _1452 = _1484;
    }
    float _1486 = _1452;
    if (_1366)
    {
        float _1488 = _1474 * _1474;
        _1442 = _1488;
    }
    float _1490 = _1442;
    if (!_1366)
    {
        _1458 = _1360;
    }
    float _1492 = _1458;
    float _1494 = _1492;
    if (_1366)
    {
        float _1496 = _1482 * _1482;
        _1494 = _1496;
    }
    float _1498 = _1494;
    float _1500 = fma(_1486, _1486, _1490);
    float _1502 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1504 = _1500 + _1498;
    float _1506 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1502);
    float _1508 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1510 = fma(_1350, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1508);
    float _1512 = precise::clamp(_1510, 0.0, 1.0);
    float _1514 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1516 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1518 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1506);
    float _1520 = rsqrt(_1504);
    float _1522 = -_1512;
    float _1524 = _1522 + 1.0;
    float _1526 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1528 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1514);
    float _1530 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1532 = _1518 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1534 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1526);
    float _1536 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1528);
    float _1538 = abs(_1524);
    float _1540 = log2(_1538);
    float _1542 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1530);
    float _1544 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1534);
    float _1546 = _1536 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1548 = _1532 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1550 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1542);
    float _1552 = _1544 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1554 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1556 = _1520 * _1474;
    float _1558 = _1520 * _1486;
    float _1560 = _1550 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1562 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1554);
    float _1564 = _1556 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1566 = _1520 * _1482;
    float _1568 = -_1548;
    float _1570 = fma(_1568, _1516, 1.0);
    float _1572 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1562);
    float _1574 = -_1564;
    float _1576 = fma(_1558, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1574);
    float _1578 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1580 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1582 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1572);
    float _1584 = -_1566;
    float _1586 = fma(_1584, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1576);
    float _1588 = exp2(_1578);
    float _1590 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1592 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1580);
    float _1594 = fma(_1586, -0.5, 0.5);
    float _1596 = fma(_1586, 0.5, 0.5);
    float _1598 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1590);
    float _1600 = _1558 + 1.0;
    float _1602 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1592);
    float _1604 = log2(_1570);
    float _1606 = fma(_1596, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1608 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1598);
    float _1610 = fma(_1596, _1606, -0.212114393711090087890625);
    float _1612 = 1.0 / _1582;
    float _1614 = -_1558;
    float _1616 = fma(_1588, _1600, _1614);
    float _1618 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1602);
    float _1620 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1608);
    float _1622 = fma(_1596, _1610, 1.570728778839111328125);
    float _1624 = fma(_1616, 0.5, 0.5);
    float _1626 = sqrt(_1594);
    float _1628 = _1604 * 0.693147182464599609375;
    float _1630 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1632 = _1618 * _1612;
    float _1634 = _1620 * _1612;
    float _1636 = fma(_1632, 0.5, 0.5);
    float _1638 = fma(_1634, -0.5, 0.5);
    float _1640 = _1626 * 0.636619746685028076171875;
    float _1642 = -_1622;
    float _1644 = fma(_1640, _1642, 1.0);
    float3 _4672 = float3(_1636, _1638, _1630);
    float _1646 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4672, float3(0.0), isnan(_4672)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4672, float3(0.0), isnan(_4672)), level(0.0)).x;
    float3 _4683 = float3(_1636, _1638, _1630);
    float4 _1649 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4683, float3(0.0), isnan(_4683)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4683, float3(0.0), isnan(_4683)), level(0.0)).xyzw;
    float _1651 = _1649.x;
    float _1653 = _1649.y;
    float _1655 = _1649.z;
    float _1657 = _1649.w;
    float2 _4700 = float2(_1644, _1624);
    float3 _1661 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4700, float2(0.0), isnan(_4700)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4700, float2(0.0), isnan(_4700)), level(0.0)).xyz;
    float _1663 = _1661.x;
    float _1665 = _1661.y;
    float _1667 = _1661.z;
    float _1669 = in.m_55.w;
    float _1671 = -_146;
    float _1673 = _1671 + 1.0;
    float _1675 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1677 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1679 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1681 = _1679 != 0;
    float _1683 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1687 = _1685 != 0;
    float _1689 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1693 = _1691 != 0;
    float _1695 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1699 = _1697 != 0;
    int _1701 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1703 = _1701 != 0;
    float _1705 = _1675 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1707 = exp2(_1683);
    bool _1709 = _1669 > 0.5;
    float _1711 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1713 = _1711 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1715 = _454 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1717 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1719 = _1717 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1721 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1723 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1725 = _1721 || _1723;
    bool _1727 = isnan(0.5);
    bool _1729 = _1725 || _1727;
    float _1731 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1733 = _456 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1735 = -_1695;
    float _1737 = fma(_1715, 2.0, _1735);
    float _1739 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1741 = _1739 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1743 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1745 = fma(_1733, -2.0, _1731);
    float _1747 = 1.0 / _1713;
    float _1749 = _1733;
    bool _1751 = _1709;
    float _1753 = _1741;
    bool _1755 = _1699;
    float _1757 = _1546;
    if (!_1681)
    {
        _1749 = _456;
    }
    float _1759 = _1749;
    float _1761 = in.m_49.x;
    int _1763 = _1709 ? as_type<int>(_1673) : as_type<int>(_146);
    float _1765 = -_124;
    float _1767 = fma(_1765, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1737);
    float _1769 = _1759;
    float _1771 = _1767;
    if (_1687)
    {
        bool _1773 = _454 > 0.5;
        _1751 = _1773;
    }
    bool _1775 = _1751;
    float _1777 = -_1707;
    float _1779 = _1777 + 1.0;
    if (_1681)
    {
        _1769 = _454;
    }
    float _1781 = _1769;
    float _1783 = 1.0 / _1719;
    float _1785 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1743);
    float _1787 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1789 = _1787 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1791 = _1779 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1793 = 0.0;
    if (!_1681)
    {
        _1793 = _448;
    }
    float _1795 = _1793;
    float _1797 = 1.0 / _1741;
    float _1799 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1801 = _1795;
    if (_1681)
    {
        _1801 = _456;
    }
    float _1803 = _1801;
    float _1805 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1799);
    float _1807 = _1699 ? as_type<float>(_1763) : _146;
    float _1809 = 1.0 / _1789;
    if (!_1681)
    {
        _1753 = _448;
    }
    float _1811 = _1753;
    float _1813 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1815 = _1813 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1817 = _1811;
    if (_1681)
    {
        _1817 = _456;
    }
    float _1819 = _1817;
    int _1821 = 0;
    float _1823 = _1761;
    if (_1687)
    {
        float _1825 = -_1761;
        float _1827 = _1825 + 1.0;
        _1821 = as_type<int>(_1827);
    }
    int _1829 = _1821;
    bool _1831 = _456 > 0.5;
    float _1833 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1835 = _1833 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    if (_1693)
    {
        bool _1837 = _448 > 0.5;
        _1755 = _1837;
    }
    bool _1839 = _1755;
    float _1841 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1843 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1841;
    float _1845 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1847 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1845;
    float _1849 = _1835 * _1783;
    float _1851 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1853 = _446 + _1851;
    float _1855 = _1843 * _1747;
    float _1857 = _1847 * _1797;
    float _1859 = fma(_1849, _1853, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1861 = _1815 * _1809;
    float _1863 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1865 = _446 + _1863;
    bool _1867 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1869 = isnan(_446);
    bool _1871 = _1867 || _1869;
    bool _1873 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1875 = _1871 || _1873;
    float _1877 = float(_1875);
    float _1879 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1881 = _1861;
    if (_1703)
    {
        float _1883 = _1831 ? _1673 : _146;
        _178 = _1883;
    }
    float _1885 = _178;
    float _1887 = fma(_1857, _1865, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1889 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1891 = isnan(_446);
    bool _1893 = _1889 || _1891;
    bool _1895 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1897 = _1893 || _1895;
    float _1899 = float(_1897);
    float _1901 = -_1877;
    float _1903 = _1901 + 1.0;
    bool _1905 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1907 = isnan(_446);
    bool _1909 = _1905 || _1907;
    bool _1911 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1913 = _1909 || _1911;
    float _1915 = float(_1913);
    float _1917 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1919 = _446 + _1917;
    float _1921 = fma(_1803, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1879);
    float _1923 = _1899 * _1903;
    float _1925 = -_1899;
    float _1927 = _1925 + 1.0;
    float _1929 = fma(_1807, _1705, -0.5);
    bool _1931 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1933 = isnan(_446);
    bool _1935 = _1931 || _1933;
    bool _1937 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1939 = _1935 || _1937;
    float _1941 = float(_1939);
    float _1943 = -_1915;
    float _1945 = _1943 + 1.0;
    float _1947 = fma(_1855, _1919, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1949 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1951 = _446 + _1949;
    bool _1953 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1955 = isnan(_446);
    bool _1957 = _1953 || _1955;
    bool _1959 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1961 = _1957 || _1959;
    float _1963 = float(_1961);
    float _1965 = _1941 * _1945;
    float _1967 = -_1941;
    float _1969 = _1967 + 1.0;
    float _1971 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1973 = _1915 * _1927;
    float _1975 = _1963 * _1969;
    float _1977 = _1689 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1979 = fma(_1781, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1971);
    float _1981 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1983 = _1781 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1985 = _1947 * _1975;
    float _1987 = fma(_1861, _1951, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1989 = _1887;
    float _1991 = _1923;
    if (!_1687)
    {
        _1881 = _1761;
    }
    float _1993 = _1881;
    float _1995 = -_1981;
    float _1997 = fma(_1983, 2.0, _1995);
    float _1999 = fma(_616, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1677);
    float _2001 = _1819 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2003 = _1993;
    if (_1687)
    {
        float _2005 = _1775 ? as_type<float>(_1829) : _1761;
        _2003 = _2005;
    }
    float _2007 = _2003;
    float _2009 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2011 = fma(_622, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1999);
    float _2013 = fma(_1977, _1885, -0.5);
    float _2015 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2017 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2019 = fma(_616, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2009);
    float _2021 = _2011 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2023 = fma(_2001, -2.0, _2015);
    float _2025 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1805);
    float _2027 = fma(_622, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2019);
    float _2029 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1745);
    float _2031 = -_1963;
    float _2033 = _2031 + 1.0;
    float _2035 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2037 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1979);
    float _2039 = -_2029;
    float _2041 = fma(_2025, _2013, _2039);
    float _2043 = fma(_2033, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1985);
    float _2045 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1785);
    float _2047 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1921);
    float _2049 = -_124;
    float _2051 = fma(_2049, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1997);
    float _2053 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2023);
    float _2055 = 1.0 / _2021;
    float _2057 = _2027 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2059 = _2017 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2061 = 0;
    float _2063 = _2017;
    float _2065 = _2007;
    float _2067 = _2045;
    if (_1693)
    {
        float _2069 = -_1761;
        float _2071 = _2069 + 1.0;
        _2061 = as_type<int>(_2071);
    }
    int _2073 = _2061;
    if (!_1729)
    {
        _2063 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2075 = _2063;
    float _2077 = _2057 + _2021;
    float _2079 = fma(_2059, _2007, -0.5);
    if (!_1729)
    {
        _2065 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2081 = _2065;
    float _2083 = _2035 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_1693)
    {
        float _2085 = _1839 ? as_type<float>(_2073) : _1761;
        _1823 = _2085;
    }
    float _2087 = _1823;
    float _2089 = fma(_1859, _1965, _2043);
    float _2091 = in.m_61.w;
    float _2093 = -_2053;
    float _2095 = fma(_2047, _1929, _2093);
    float _2097 = fma(_2083, _2087, -0.5);
    float _2099 = fma(_1887, _1973, _2089);
    float _2101 = _2077 * _2055;
    float _2103 = _2101 * 0.5;
    float _2105 = fma(_2045, _2079, _1767);
    if (!_1729)
    {
        float _2107 = -_2081;
        float _2109 = _2107 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1771 = _2109;
    }
    float _2111 = _1771;
    float _2113 = fma(_2037, _2097, _2051);
    if (!_1729)
    {
        float _2115 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2117 = fma(_2103, _2075, _2115);
        _2067 = _2117;
    }
    float _2119 = _2067;
    if (!_1729)
    {
        float _2121 = 1.0 / _2111;
        _1989 = _2121;
    }
    float _2123 = _1989;
    float _2125 = fma(_1987, _1923, _2099);
    float _2127 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2129 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2131 = _2041 + 0.5;
    float _2133 = _1859;
    if (!_1729)
    {
        float _2135 = 1.0 / _2119;
        _2133 = _2135;
    }
    float _2137 = _2133;
    float _2139 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2141 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2143 = _2127 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2145 = _2129 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2147 = _2139 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2149 = _2095 + 0.5;
    float _2151 = _2105 + 0.5;
    float _2153 = _2113 + 0.5;
    float _2155 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    if (_1729)
    {
        _1757 = 1.0;
    }
    float _2157 = _1757;
    out.m_63.x = _2143;
    out.m_63.y = _2145;
    out.m_63.z = _2147;
    out.m_63.w = _2141;
    float _2159 = fma(_1877, (*spvDescriptorSet0.vp_c9)._m0[119].x, _2125);
    float _2161 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2155);
    out.m_65.x = _2151;
    out.m_65.y = _2131;
    out.m_65.z = _2153;
    out.m_65.w = _2149;
    float _2163 = _2157;
    if (!_1729)
    {
        float _2165 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2167 = -_2081;
        float _2169 = fma(_2137, _2165, _2167);
        _1991 = _2169;
    }
    float _2171 = _1991;
    float _2173 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2161);
    out.m_67.w = _2091;
    if (!_1729)
    {
        float _2175 = _2171 * _2123;
        float _2177 = precise::clamp(_2175, 0.0, 1.0);
        _2163 = _2177;
    }
    float _2179 = _2163;
    float _2181 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2173);
    float _2183 = _416 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2185 = _1582 * 0.5;
    float _2187 = _414 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _2189 = _2179 > 0.0;
    bool _2191 = isnan(_2179);
    bool _2193 = _2189 || _2191;
    bool _2195 = isnan(0.0);
    bool _2197 = _2193 || _2195;
    float _2199 = _412 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2201 = fma(_1620, -0.5, _2185);
    float _2203 = -_1791;
    float _2205 = _2203 + 1.0;
    float _2207 = _2179 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2209 = _2181 + _1582;
    float _2211 = _1618 + _1582;
    out.gl_Position.x = _1618;
    out.gl_Position.y = _1620;
    out.gl_Position.z = _2181;
    out.gl_Position.w = _1582;
    float _2213 = _2199 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2215 = _2187 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2217 = _2183 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2219 = _2159 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2221 = _2209 * 0.5;
    float _2223 = _2211 * 0.5;
    float _2225 = _2207 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _2213;
    out.m_69.y = _2215;
    out.m_69.z = _2217;
    out.m_69.w = _2219;
    out.m_71.x = _2223;
    out.m_71.y = _2201;
    out.m_71.z = _2221;
    out.m_71.w = _1582;
    out.m_45.x = _2225;
    float _2227 = _1791 * _1646;
    float _2229 = _1657 * _2227;
    float _2231 = _1667 * _2227;
    float _2233 = fma(_1663, _2229, _1651);
    float _2235 = fma(_1665, _2229, _1653);
    float _2237 = _1657 * _2205;
    float _2239 = fma(_1657, _2231, _1655);
    out.m_73.x = _2233;
    out.m_73.y = _2235;
    out.m_73.z = _2239;
    out.m_73.w = _2237;
    if (_2197)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2241 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2241;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _438 = false;
    bool _312 = false;
    bool _198 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_42.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2297 = as_type<float>(_108);
        out.gl_Position.z = _2297;
    }
    if (!_96)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    if (_120)
    {
        float _128 = float(_92);
        _126 = _128;
    }
    float _130 = _126;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    if (_136)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _102;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    int _140 = 0;
    if (_136)
    {
        float _142 = _138 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2365 = as_type<float>(_144);
        out.gl_Position.z = _2365;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_49.y;
    bool _148 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _150 = in.m_51.x;
    float _152 = in.m_51.y;
    float _154 = in.m_51.z;
    out.m_53.y = _146;
    float _156 = _152 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _158 = _152 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _160 = _152 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _162 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].x, _156);
    float _164 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].x, _158);
    float _166 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].x, _160);
    float _168 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[4].z, _162);
    float _170 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[5].z, _164);
    float _172 = fma(_154, (*spvDescriptorSet0.vp_c10)._m0[6].z, _166);
    bool _174 = !_148;
    float _176 = _168;
    float _178 = _146;
    float _196;
    if (!_174)
    {
        float _180 = in.m_55.x;
        float _182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _186 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _188 = _186 * _182;
        float _190 = floor(_188);
        float _192 = -_190;
        float _194 = _188 + _192;
        _196 = _194;
        _198 = true;
    }
    else
    {
        float _200 = float(_92);
        float _202 = 1.0 / _200;
        float _204 = _124 * _202;
        _196 = _204;
    }
    _198 = false;
    float _206 = _196;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _210 = _206 + _208;
    bool _212 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _214 = isnan(_206);
    bool _216 = _212 || _214;
    bool _218 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _220 = _216 || _218;
    float _222 = float(_220);
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _224;
    bool _228 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _230 = isnan(_206);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    float _240 = -_222;
    float _242 = _240 + 1.0;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _244;
    float _248 = 1.0 / _226;
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _252 = _238 * _242;
    float _254 = -_238;
    float _256 = _254 + 1.0;
    float _258 = _210 * _248;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _260;
    float _264 = fma(_246, _258, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _266;
    float _270 = fma(_262, _258, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _272 = _264 * _252;
    float _274 = fma(_268, _258, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _276 = _270 * _252;
    float _278 = _274 * _252;
    float _280 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[143].x, _272);
    float _282 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[143].y, _278);
    float _284 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[143].z, _276);
    float _286 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[144].x, _280);
    float _288 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[144].y, _282);
    float _290 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[144].z, _284);
    bool _292 = !_250;
    float _310;
    if (!_292)
    {
        float _294 = in.m_55.x;
        float _296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _298 = _294 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _302 = _300 * _296;
        float _304 = floor(_302);
        float _306 = -_304;
        float _308 = _302 + _306;
        _310 = _308;
        _312 = true;
    }
    else
    {
        float _314 = float(_92);
        float _316 = 1.0 / _314;
        float _318 = _124 * _316;
        _310 = _318;
    }
    _312 = false;
    float _320 = _310;
    float _322 = in.m_57.x;
    float _324 = in.m_57.y;
    float _326 = in.m_57.z;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _330 = _320 + _328;
    bool _332 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _334 = isnan(_320);
    bool _336 = _332 || _334;
    bool _338 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _340 = _336 || _338;
    float _342 = float(_340);
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _346;
    float _350 = 1.0 / _348;
    float _352 = _290 * _326;
    float _354 = _288 * _324;
    float _356 = -_342;
    float _358 = _356 + 1.0;
    float _360 = _330 * _350;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _362;
    bool _366 = _320 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _368 = isnan(_320);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _378;
    float _382 = _286 * _322;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _384;
    float _388 = fma(_364, _360, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _390 = _376 * _358;
    float _392 = fma(_380, _360, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _394 = fma(_386, _360, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _396 = -_376;
    float _398 = _396 + 1.0;
    float _400 = _388 * _390;
    float _402 = _392 * _390;
    float _404 = _394 * _390;
    float _406 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[107].x, _400);
    float _408 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[107].y, _402);
    float _410 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[107].z, _404);
    float _412 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[108].x, _406);
    float _414 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[108].y, _408);
    float _416 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[108].z, _410);
    bool _418 = !_344;
    float _436;
    if (!_418)
    {
        float _420 = in.m_55.x;
        float _422 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _424 = _420 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _426 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _428 = _426 * _422;
        float _430 = floor(_428);
        float _432 = -_430;
        float _434 = _428 + _432;
        _436 = _434;
        _438 = true;
    }
    else
    {
        float _440 = float(_92);
        float _442 = 1.0 / _440;
        float _444 = _124 * _442;
        _436 = _444;
    }
    _438 = false;
    float _446 = _436;
    float _448 = in.m_55.z;
    float _450 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _452 = log2(_450);
    float _454 = in.m_55.x;
    float _456 = in.m_55.y;
    float _458 = _448 * 2.0;
    float _460 = _454 * 2.0;
    float _462 = floor(_458);
    float _464 = _456 * 2.0;
    float _466 = floor(_460);
    float _468 = floor(_464);
    bool _470 = _462 > 0.0;
    bool _472 = _462 >= 0.0;
    bool _474 = isnan(_462);
    bool _476 = _472 || _474;
    bool _478 = isnan(0.0);
    bool _480 = _476 || _478;
    int _482 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _484 = _482 != 0;
    int _486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _488 = _486 != 0;
    int _490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _492 = _490 != 0;
    float _494 = in.m_42.x;
    float _496 = in.m_42.y;
    float _498 = in.m_42.z;
    int _500 = _480 ? 0 : 1;
    bool _502 = _466 > 0.0;
    int _504 = ~_500;
    int _506 = _504 + 1;
    int _508 = _506 + 1;
    bool _510 = _466 >= 0.0;
    bool _512 = isnan(_466);
    bool _514 = _510 || _512;
    bool _516 = isnan(0.0);
    bool _518 = _514 || _516;
    bool _520 = !_484;
    int _522 = _520 ? 0 : 1;
    int _524 = _508;
    if (!_470)
    {
        int _526 = ~_500;
        int _528 = _526 + 1;
        _524 = _528;
    }
    int _530 = _524;
    bool _532 = _468 > 0.0;
    int _534 = abs(_522);
    float _536 = _454 + _456;
    bool _538 = _468 >= 0.0;
    bool _540 = isnan(_468);
    bool _542 = _538 || _540;
    bool _544 = isnan(0.0);
    bool _546 = _542 || _544;
    float _548 = _124 * _452;
    float _550 = float(_534);
    float _552 = _536 + (-1.0);
    int _554 = _546 ? 0 : 1;
    float _556 = float(_530);
    float _558 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _560 = ~_554;
    int _562 = _560 + 1;
    int _564 = _562 + 1;
    float _566 = exp2(_548);
    int _568 = _564;
    if (!_532)
    {
        int _570 = ~_554;
        int _572 = _570 + 1;
        _568 = _572;
    }
    int _574 = _568;
    float _576 = _550 * _556;
    float _578 = _496 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _580 = _496 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _582 = !_492;
    int _584 = _582 ? 0 : 1;
    float _586 = _454 + _448;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _590 = 1.0 + _588;
    float _592 = fma(_494, (*spvDescriptorSet0.vp_c10)._m0[4].x, _578);
    float _594 = fma(_494, (*spvDescriptorSet0.vp_c10)._m0[6].x, _580);
    bool _596 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _598 = isnan(0.0);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _604 = _600 || _602;
    float _606 = 1.0 / _590;
    float _608 = fma(_498, (*spvDescriptorSet0.vp_c10)._m0[4].z, _592);
    float _610 = fma(_498, (*spvDescriptorSet0.vp_c10)._m0[6].z, _594);
    int _612 = abs(_584);
    float _614 = _586 + (-1.0);
    float _616 = _608 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _618 = -_566;
    float _620 = _618 + 1.0;
    float _622 = _610 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _624 = float(_612);
    float _626 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _628 = _616 + _626;
    float _630 = float(_574);
    float _632 = -_622;
    float _634 = _632 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _636 = _604 ? _620 : 0.0;
    float _638 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _640 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _642 = isnan(1.0);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _648 = _644 || _646;
    float _650 = _576 * (-2.0);
    float _652 = abs(_628);
    float _654 = abs(_634);
    float _656 = precise::max(_652, _654);
    float _658 = _636 * _606;
    float _660 = _454 + (-0.5);
    float _662 = _624 * _630;
    bool _664 = _656 >= 16.0;
    float _666 = fma(_558, _650, _558);
    bool _668 = !_648;
    float _670 = _668 ? _124 : _658;
    float _672 = _660 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _674 = _448 + (-0.5);
    float _676 = _662 * (-2.0);
    int _678 = _518 ? 0 : 1;
    float _680 = fma(_670, _666, _672);
    float _682 = _674 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _684 = _628 * 0.0625;
    float _686 = fma(_638, _676, _638);
    float _688 = _680 * 0.15915493667125701904296875;
    int _690 = ~_678;
    int _692 = _690 + 1;
    int _694 = _692 + 1;
    float _696 = _634;
    int _698 = _694;
    bool _700 = _664;
    if (_664)
    {
        float _702 = _634 * 0.0625;
        _696 = _702;
    }
    float _704 = _696;
    float _706 = _664 ? _684 : _628;
    float _708 = fma(_670, _686, _682);
    bool _710 = !_488;
    int _712 = _710 ? 0 : 1;
    float _714 = _456 + _448;
    if (!_502)
    {
        int _716 = ~_678;
        int _718 = _716 + 1;
        _698 = _718;
    }
    int _720 = _698;
    float _722 = _708 * 0.15915493667125701904296875;
    float _724 = abs(_706);
    bool _726 = _724 != 0.0;
    bool _728 = isnan(_724);
    bool _730 = _726 || _728;
    bool _732 = isnan(0.0);
    bool _734 = _730 || _732;
    float _736 = _714 + (-1.0);
    int _738 = abs(_712);
    float _740 = _688 * 6.283185482025146484375;
    float _742 = sin(_740);
    float _744 = abs(_704);
    bool _746 = _744 == 0.0;
    bool _748 = !_734;
    bool _750 = _746 && _748;
    float _752 = float(_720);
    float _754 = in.m_59.x;
    float _756 = in.m_59.y;
    float _758 = in.m_59.z;
    float _760 = float(_738);
    float _762 = _688 * 6.283185482025146484375;
    float _764 = cos(_762);
    float _766 = abs(_704);
    bool _768 = _766 == 0.0;
    float _770 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _772 = _760 * _752;
    float _774 = _456 + (-0.5);
    int _776 = as_type<int>(_774);
    if (_750)
    {
        bool _778 = as_type<int>(_704) >= 0;
        _700 = _778;
    }
    bool _780 = _700;
    float _782 = _722 * 6.283185482025146484375;
    float _784 = sin(_782);
    float _786 = _772 * (-2.0);
    float _788 = _774 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    int _790 = _780 ? (-1) : 0;
    if (_750)
    {
        int _792 = _780 ? 0 : 1078530011;
        _776 = _792;
    }
    int _794 = _776;
    float _796 = fma(_770, _786, _770);
    int _798 = _794;
    if (_750)
    {
        int _800 = int(0x80000000) & as_type<int>(_706);
        int _802 = _794 | _800;
        _798 = _802;
    }
    int _804 = _798;
    float _806 = fma(_670, _796, _788);
    bool _808 = !_734;
    bool _810 = _808 && _768;
    int _812 = _804;
    float _814 = as_type<float>(_804);
    if (!_810)
    {
        float _816 = abs(_706);
        bool _818 = _816 != as_type<float>(0x7f800000u /* inf */);
        bool _820 = isnan(_816);
        bool _822 = _818 || _820;
        bool _824 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _826 = _822 || _824;
        float _828 = abs(_704);
        bool _830 = _828 == as_type<float>(0x7f800000u /* inf */);
        float _832 = abs(_704);
        bool _834 = _832 == as_type<float>(0x7f800000u /* inf */);
        bool _836 = !_826;
        bool _838 = _834 && _836;
        if (_838)
        {
            bool _840 = as_type<int>(_704) >= 0;
            _790 = _840 ? (-1) : 0;
        }
        int _842 = _790;
        if (_838)
        {
            _812 = 1075235812;
        }
        int _844 = _812;
        int _846 = _844;
        if (_838)
        {
            int _848 = ~_842;
            int _850 = (_848 != 0) ? _844 : 1061752795;
            _846 = _850;
        }
        int _852 = _846;
        float _854 = as_type<float>(_852);
        if (_838)
        {
            int _856 = int(0x80000000) & as_type<int>(_706);
            int _858 = _852 | _856;
            _854 = as_type<float>(_858);
        }
        float _860 = _854;
        bool _862 = !_826;
        bool _864 = _862 && _830;
        _814 = _860;
        if (!_864)
        {
            float _866 = abs(_704);
            float _868 = abs(_706);
            float _870 = precise::max(_866, _868);
            float _872 = abs(_704);
            float _874 = abs(_706);
            float _876 = precise::min(_872, _874);
            float _878 = 1.0 / _870;
            float _880 = abs(_706);
            float _882 = abs(_704);
            bool _884 = _880 > _882;
            bool _886 = as_type<int>(_704) >= 0;
            float _888 = abs(_704);
            float _890 = abs(_706);
            float _892 = _888 + _890;
            int _894 = as_type<int>(_706) & int(0x80000000);
            bool _896 = _892 > as_type<float>(0x7f800000u /* inf */);
            bool _898 = isnan(_892);
            bool _900 = _896 || _898;
            bool _902 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _904 = _900 || _902;
            float _906 = _876 * _878;
            float _908 = _906 * _906;
            float _910 = _908 + 11.33538818359375;
            float _912 = fma(_908, _910, 28.84246826171875);
            float _914 = fma(_908, _912, 19.6966705322265625);
            float _916 = fma(_908, -0.82336294651031494140625, -5.674867153167724609375);
            float _918 = fma(_908, _916, -6.565555095672607421875);
            float _920 = 1.0 / _914;
            float _922 = _908 * _918;
            float _924 = _906 * _922;
            float _926 = fma(_924, _920, _906);
            float _928 = _926;
            _814 = _892;
            if (_884)
            {
                float _930 = -_926;
                float _932 = _930 + 1.57079637050628662109375;
                _928 = _932;
            }
            float _934 = _928;
            int _936 = as_type<int>(_934);
            if (!_886)
            {
                float _938 = -_934;
                float _940 = _938 + 3.1415927410125732421875;
                _936 = as_type<int>(_940);
            }
            int _942 = _936;
            if (!_904)
            {
                int _944 = _894 | _942;
                _814 = as_type<float>(_944);
            }
        }
    }
    float _946 = _814;
    float _948 = -_946;
    float _950 = _806 + _948;
    float _952 = _496 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _954 = _448 * 6.283185482025146484375;
    float _956 = _950 * 0.15915493667125701904296875;
    float _958 = _722 * 6.283185482025146484375;
    float _960 = cos(_958);
    float _962 = fma(_494, (*spvDescriptorSet0.vp_c10)._m0[5].x, _952);
    float _964 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _754);
    float _966 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _758);
    float _968 = fma(_124, 0.310000002384185791015625, _954);
    float _970 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _756);
    float _972 = _382 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _974 = _956 * 6.283185482025146484375;
    float _976 = sin(_974);
    float _978 = _968 * 0.15915493667125701904296875;
    float _980 = _354 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _982 = _454 * 6.283185482025146484375;
    float _984 = _964 * _972;
    float _986 = _980 * _970;
    float _988 = _352 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _990 = _956 * 6.283185482025146484375;
    float _992 = cos(_990);
    float _994 = fma(_124, 0.10999999940395355224609375, _982);
    float _996 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _998 = _960 * _986;
    float _1000 = _966 * _988;
    float _1002 = _994 * 0.15915493667125701904296875;
    float _1004 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _996);
    float _1006 = _742 * _976;
    float _1008 = _764 * _998;
    float _1010 = 1.0 / _980;
    float _1012 = fma(_498, (*spvDescriptorSet0.vp_c10)._m0[5].z, _962);
    float _1014 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1004);
    float _1016 = _742 * _998;
    float _1018 = _1012 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1020 = _764 * _992;
    float _1022 = _764 * _976;
    float _1024 = _742 * _992;
    float _1026 = _978 * 6.283185482025146484375;
    float _1028 = sin(_1026);
    float _1030 = fma(_784, _1020, _1006);
    float _1032 = -_986;
    float _1034 = _784 * _1032;
    float _1036 = fma(_784, _1006, _1020);
    float _1038 = _992 * _960;
    float _1040 = fma(_1030, _984, _1008);
    float _1042 = -_1024;
    float _1044 = fma(_784, _1022, _1042);
    float _1046 = _976 * _960;
    float _1048 = sqrt(_1014);
    float _1050 = fma(_1038, _984, _1034);
    float _1052 = fma(_1044, _1000, _1040);
    float _1054 = fma(_1046, _1000, _1050);
    float _1056 = _1018 + _1052;
    float _1058 = -_1022;
    float _1060 = fma(_784, _1024, _1058);
    float _1062 = _1002 * 6.283185482025146484375;
    float _1064 = sin(_1062);
    float _1066 = fma(_1028, 0.12999999523162841796875, 1.0);
    float _1068 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1070 = _1056 + _1068;
    float _1072 = fma(_1060, _984, _1016);
    float _1074 = _616 + _1054;
    float _1076 = _1070 * _1010;
    float _1078 = fma(_1036, _1000, _1072);
    float _1080 = _1048 * 0.64999997615814208984375;
    float _1082 = fma(_1076, _1076, _1076);
    float _1084 = _622 + _1078;
    float _1086 = _1082 * _1080;
    float _1088 = fma(_1064, 0.300000011920928955078125, _1066);
    float _1090 = _1088 * _1086;
    float _1092 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[32].z, _1084);
    float _1094 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[32].x, _1074);
    float _1096 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[32].y, _1056);
    float _1098 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1100 = _1092 + _1098;
    float _1102 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1104 = _1094 + _1102;
    float _1106 = _1100 * _1100;
    float _1108 = fma(_1104, _1104, _1106);
    float _1110 = sqrt(_1108);
    bool _1112 = _1110 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1114 = _1106;
    float _1116 = _1000;
    float _1118 = _1094;
    float _1120 = _1034;
    if (!_1112)
    {
        _1114 = _1092;
    }
    float _1122 = _1114;
    float _1124 = _1122;
    if (!_1112)
    {
        _1116 = _1096;
    }
    float _1126 = _1116;
    bool _1128 = !_1112;
    float _1130 = _1126;
    if (!_1128)
    {
        float _1132 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1134 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1136 = _1110 + _1134;
        float _1138 = rsqrt(_1108);
        float _1140 = _1136 * _1132;
        float _1142 = _1096 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1144 = _1140 * 0.15915493667125701904296875;
        float _1146 = _1144 * 6.283185482025146484375;
        float _1148 = cos(_1146);
        float _1150 = _1144 * 6.283185482025146484375;
        float _1152 = sin(_1150);
        float _1154 = _1148 + (-1.0);
        float _1156 = _1154 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1158 = fma(_1152, _1142, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1160 = fma(_1096, _1148, _1156);
        float _1162 = _1138 * _1158;
        float _1164 = fma(_1104, _1162, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1166 = fma(_1100, _1162, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1130 = _1160;
        _1118 = _1164;
        _1124 = _1166;
    }
    float _1168 = _1130;
    float _1170 = _1118;
    float _1172 = _1124;
    float _1174 = -_1018;
    float _1176 = _1174 + _1168;
    float _1178 = -_616;
    float _1180 = _1178 + _1170;
    float _1182 = -_622;
    float _1184 = _1182 + _1172;
    float _1186 = _1176 * _1176;
    float _1188 = fma(_1180, _1180, _1186);
    float _1190 = fma(_1184, _1184, _1188);
    float _1192 = sqrt(_1190);
    bool _1194 = _1192 > 0.0;
    bool _1196 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1198 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1200 = _1196 || _1198;
    bool _1202 = isnan(0.5);
    bool _1204 = _1200 || _1202;
    bool _1206 = !_1194;
    float _1208 = _1168;
    float _1210 = _1170;
    float _1212 = _1172;
    float _1214 = _1190;
    if (!_1206)
    {
        float _1216 = _170 * _170;
        float _1218 = fma(_168, _168, _1216);
        float _1220 = fma(_172, _172, _1218);
        float _1222 = rsqrt(_1190);
        float _1224 = sqrt(_1220);
        float _1226 = _1184 * _1222;
        bool _1228 = _1224 > 0.0;
        float _1230 = _1180 * _1222;
        float _1232 = _1176 * _1222;
        bool _1234 = !_1228;
        if (!_1234)
        {
            float _1236 = rsqrt(_1220);
            float _1238 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1240 = _170 * _1236;
            float _1242 = _168 * _1236;
            float _1244 = _1232 * _1240;
            float _1246 = _172 * _1236;
            float _1248 = fma(_1230, _1242, _1244);
            float _1250 = _1238 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1252 = fma(_1226, _1246, _1248);
            float _1254 = _1252 * _1250;
            float _1256 = fma(_168, _1254, _1170);
            float _1258 = fma(_170, _1254, _1168);
            float _1260 = fma(_172, _1254, _1172);
            _1208 = _1258;
            _1210 = _1256;
            _1212 = _1260;
            _1214 = _1254;
        }
    }
    float _1262 = _1208;
    float _1264 = _1210;
    float _1266 = _1212;
    float _1268 = _1214;
    float _1270 = _1264;
    float _1272 = _1266;
    if (_1204)
    {
        _176 = _1262;
    }
    float _1274 = _176;
    float _1276 = _1274;
    if (!_1204)
    {
        float _1278 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1280 = _1018 + _1278;
        float _1282 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1284 = -_616;
        float _1286 = _1284 + _1264;
        float _1288 = -_622;
        float _1290 = _1288 + _1266;
        float _1292 = _1280 * _1280;
        float _1294 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1296 = _622 + _1294;
        float _1298 = fma(_628, _628, _1292);
        float _1300 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1302 = fma(_1296, _1296, _1298);
        float _1304 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1306 = sqrt(_1302);
        float _1308 = precise::min(_1306, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1310 = _1308 * _1300;
        float _1312 = _1304 * _1310;
        float _1314 = -_1018;
        float _1316 = _1314 + _1262;
        float _1318 = fma(_1286, _1312, _616);
        float _1320 = fma(_1316, _1312, _1018);
        float _1322 = fma(_1290, _1312, _622);
        _1276 = _1320;
        _1270 = _1318;
        _1272 = _1322;
    }
    float _1324 = _1276;
    float _1326 = _1270;
    float _1328 = _1272;
    float _1330 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1332 = _1324 + _1330;
    float _1334 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1336 = _1326 + _1334;
    float _1338 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1340 = _1328 + _1338;
    float _1342 = _1332 * _1332;
    float _1344 = fma(_1336, _1336, _1342);
    float _1346 = fma(_1340, _1340, _1344);
    float _1348 = rsqrt(_1346);
    float _1350 = sqrt(_1346);
    float _1352 = _1348 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1354 = _1336 * _1352;
    float _1356 = _1340 * _1352;
    float _1358 = _1354 * _1354;
    float _1360 = _1356 * _1356;
    float _1362 = _1358 + _1360;
    float _1364 = sqrt(_1362);
    bool _1366 = _1364 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1368 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1370 = _1364 + _1368;
    float _1372 = _1344;
    float _1374 = _1348;
    float _1376 = _1370;
    float _1378 = _1332;
    float _1380 = _1352;
    if (_1366)
    {
        float _1382 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1372 = _1382;
    }
    float _1384 = _1372;
    if (_1366)
    {
        float _1386 = rsqrt(_1362);
        _1374 = _1386;
    }
    float _1388 = _1374;
    float _1390 = _1384;
    float _1392 = _1388;
    if (_1366)
    {
        float _1394 = _1370 * _1384;
        _1376 = _1394;
    }
    float _1396 = _1376;
    if (_1366)
    {
        float _1398 = _1396 * 0.15915493667125701904296875;
        _1390 = _1398;
    }
    float _1400 = _1390;
    float _1402 = _1340;
    float _1404 = _1400;
    if (_1366)
    {
        float _1406 = _1400 * 6.283185482025146484375;
        float _1408 = sin(_1406);
        _1402 = _1408;
    }
    float _1410 = _1402;
    float _1412 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1414 = precise::max(0.0, _1412);
    float _1416 = _1268;
    float _1418 = _1414;
    if (_1366)
    {
        float _1420 = _1400 * 6.283185482025146484375;
        float _1422 = cos(_1420);
        _1416 = _1422;
    }
    float _1424 = _1416;
    float _1426 = -_1352;
    float _1428 = -_1414;
    float _1430 = fma(_1332, _1426, _1428);
    if (_1366)
    {
        float _1432 = _1430 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1378 = _1432;
    }
    float _1434 = _1378;
    float _1436 = _1434;
    if (!_1366)
    {
        _1404 = _1358;
    }
    float _1438 = _1404;
    float _1440 = _1410;
    float _1442 = _1438;
    if (_1366)
    {
        float _1444 = fma(_1410, _1434, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1436 = _1444;
    }
    float _1446 = _1436;
    float _1448 = _1446;
    if (!_1366)
    {
        _1440 = _1430;
    }
    float _1450 = _1440;
    float _1452 = _1450;
    if (_1366)
    {
        float _1454 = _1424 + (-1.0);
        _1418 = _1454;
    }
    float _1456 = _1418;
    float _1458 = _1456;
    if (_1366)
    {
        float _1460 = _1388 * _1446;
        _1120 = _1460;
    }
    float _1462 = _1120;
    if (!_1366)
    {
        _1392 = _1354;
    }
    float _1464 = _1392;
    float _1466 = _1464;
    if (_1366)
    {
        float _1468 = _1456 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1380 = _1468;
    }
    float _1470 = _1380;
    if (_1366)
    {
        float _1472 = _1354 * _1462;
        _1466 = _1472;
    }
    float _1474 = _1466;
    if (!_1366)
    {
        _1448 = _1356;
    }
    float _1476 = _1448;
    float _1478 = _1476;
    if (_1366)
    {
        float _1480 = _1356 * _1462;
        _1478 = _1480;
    }
    float _1482 = _1478;
    if (_1366)
    {
        float _1484 = fma(_1430, _1424, _1470);
        _1452 = _1484;
    }
    float _1486 = _1452;
    if (_1366)
    {
        float _1488 = _1474 * _1474;
        _1442 = _1488;
    }
    float _1490 = _1442;
    if (!_1366)
    {
        _1458 = _1360;
    }
    float _1492 = _1458;
    float _1494 = _1492;
    if (_1366)
    {
        float _1496 = _1482 * _1482;
        _1494 = _1496;
    }
    float _1498 = _1494;
    float _1500 = fma(_1486, _1486, _1490);
    float _1502 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1504 = _1500 + _1498;
    float _1506 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1502);
    float _1508 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1510 = fma(_1350, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1508);
    float _1512 = precise::clamp(_1510, 0.0, 1.0);
    float _1514 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1516 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1518 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1506);
    float _1520 = rsqrt(_1504);
    float _1522 = -_1512;
    float _1524 = _1522 + 1.0;
    float _1526 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1528 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1514);
    float _1530 = _1324 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1532 = _1518 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1534 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1526);
    float _1536 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1528);
    float _1538 = abs(_1524);
    float _1540 = log2(_1538);
    float _1542 = fma(_1326, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1530);
    float _1544 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1534);
    float _1546 = _1536 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1548 = _1532 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1550 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1542);
    float _1552 = _1544 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1554 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1556 = _1520 * _1474;
    float _1558 = _1520 * _1486;
    float _1560 = _1550 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1562 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1554);
    float _1564 = _1556 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1566 = _1520 * _1482;
    float _1568 = -_1548;
    float _1570 = fma(_1568, _1516, 1.0);
    float _1572 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1562);
    float _1574 = -_1564;
    float _1576 = fma(_1558, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1574);
    float _1578 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1580 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1582 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1572);
    float _1584 = -_1566;
    float _1586 = fma(_1584, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1576);
    float _1588 = exp2(_1578);
    float _1590 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1592 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1580);
    float _1594 = fma(_1586, -0.5, 0.5);
    float _1596 = fma(_1586, 0.5, 0.5);
    float _1598 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1590);
    float _1600 = _1558 + 1.0;
    float _1602 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1592);
    float _1604 = log2(_1570);
    float _1606 = fma(_1596, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1608 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1598);
    float _1610 = fma(_1596, _1606, -0.212114393711090087890625);
    float _1612 = 1.0 / _1582;
    float _1614 = -_1558;
    float _1616 = fma(_1588, _1600, _1614);
    float _1618 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1602);
    float _1620 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1608);
    float _1622 = fma(_1596, _1610, 1.570728778839111328125);
    float _1624 = fma(_1616, 0.5, 0.5);
    float _1626 = sqrt(_1594);
    float _1628 = _1604 * 0.693147182464599609375;
    float _1630 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1632 = _1618 * _1612;
    float _1634 = _1620 * _1612;
    float _1636 = fma(_1632, 0.5, 0.5);
    float _1638 = fma(_1634, -0.5, 0.5);
    float _1640 = _1626 * 0.636619746685028076171875;
    float _1642 = -_1622;
    float _1644 = fma(_1640, _1642, 1.0);
    float3 _4672 = float3(_1636, _1638, _1630);
    float _1646 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4672, float3(0.0), isnan(_4672)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4672, float3(0.0), isnan(_4672)), level(0.0)).x;
    float3 _4683 = float3(_1636, _1638, _1630);
    float4 _1649 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4683, float3(0.0), isnan(_4683)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4683, float3(0.0), isnan(_4683)), level(0.0)).xyzw;
    float _1651 = _1649.x;
    float _1653 = _1649.y;
    float _1655 = _1649.z;
    float _1657 = _1649.w;
    float2 _4700 = float2(_1644, _1624);
    float3 _1661 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4700, float2(0.0), isnan(_4700)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4700, float2(0.0), isnan(_4700)), level(0.0)).xyz;
    float _1663 = _1661.x;
    float _1665 = _1661.y;
    float _1667 = _1661.z;
    float _1669 = in.m_55.w;
    float _1671 = -_146;
    float _1673 = _1671 + 1.0;
    float _1675 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1677 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _1679 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1681 = _1679 != 0;
    float _1683 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1687 = _1685 != 0;
    float _1689 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1693 = _1691 != 0;
    float _1695 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1699 = _1697 != 0;
    int _1701 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1703 = _1701 != 0;
    float _1705 = _1675 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1707 = exp2(_1683);
    bool _1709 = _1669 > 0.5;
    float _1711 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1713 = _1711 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1715 = _454 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1717 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1719 = _1717 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1721 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1723 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1725 = _1721 || _1723;
    bool _1727 = isnan(0.5);
    bool _1729 = _1725 || _1727;
    float _1731 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1733 = _456 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1735 = -_1695;
    float _1737 = fma(_1715, 2.0, _1735);
    float _1739 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1741 = _1739 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1743 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1745 = fma(_1733, -2.0, _1731);
    float _1747 = 1.0 / _1713;
    float _1749 = _1733;
    bool _1751 = _1709;
    float _1753 = _1741;
    bool _1755 = _1699;
    float _1757 = _1546;
    if (!_1681)
    {
        _1749 = _456;
    }
    float _1759 = _1749;
    float _1761 = in.m_49.x;
    int _1763 = _1709 ? as_type<int>(_1673) : as_type<int>(_146);
    float _1765 = -_124;
    float _1767 = fma(_1765, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1737);
    float _1769 = _1759;
    float _1771 = _1767;
    if (_1687)
    {
        bool _1773 = _454 > 0.5;
        _1751 = _1773;
    }
    bool _1775 = _1751;
    float _1777 = -_1707;
    float _1779 = _1777 + 1.0;
    if (_1681)
    {
        _1769 = _454;
    }
    float _1781 = _1769;
    float _1783 = 1.0 / _1719;
    float _1785 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1743);
    float _1787 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1789 = _1787 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1791 = _1779 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1793 = 0.0;
    if (!_1681)
    {
        _1793 = _448;
    }
    float _1795 = _1793;
    float _1797 = 1.0 / _1741;
    float _1799 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1801 = _1795;
    if (_1681)
    {
        _1801 = _456;
    }
    float _1803 = _1801;
    float _1805 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1799);
    float _1807 = _1699 ? as_type<float>(_1763) : _146;
    float _1809 = 1.0 / _1789;
    if (!_1681)
    {
        _1753 = _448;
    }
    float _1811 = _1753;
    float _1813 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1815 = _1813 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1817 = _1811;
    if (_1681)
    {
        _1817 = _456;
    }
    float _1819 = _1817;
    int _1821 = 0;
    float _1823 = _1761;
    if (_1687)
    {
        float _1825 = -_1761;
        float _1827 = _1825 + 1.0;
        _1821 = as_type<int>(_1827);
    }
    int _1829 = _1821;
    bool _1831 = _456 > 0.5;
    float _1833 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1835 = _1833 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    if (_1693)
    {
        bool _1837 = _448 > 0.5;
        _1755 = _1837;
    }
    bool _1839 = _1755;
    float _1841 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1843 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1841;
    float _1845 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1847 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1845;
    float _1849 = _1835 * _1783;
    float _1851 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1853 = _446 + _1851;
    float _1855 = _1843 * _1747;
    float _1857 = _1847 * _1797;
    float _1859 = fma(_1849, _1853, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1861 = _1815 * _1809;
    float _1863 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1865 = _446 + _1863;
    bool _1867 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1869 = isnan(_446);
    bool _1871 = _1867 || _1869;
    bool _1873 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1875 = _1871 || _1873;
    float _1877 = float(_1875);
    float _1879 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1881 = _1861;
    if (_1703)
    {
        float _1883 = _1831 ? _1673 : _146;
        _178 = _1883;
    }
    float _1885 = _178;
    float _1887 = fma(_1857, _1865, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1889 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1891 = isnan(_446);
    bool _1893 = _1889 || _1891;
    bool _1895 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1897 = _1893 || _1895;
    float _1899 = float(_1897);
    float _1901 = -_1877;
    float _1903 = _1901 + 1.0;
    bool _1905 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1907 = isnan(_446);
    bool _1909 = _1905 || _1907;
    bool _1911 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1913 = _1909 || _1911;
    float _1915 = float(_1913);
    float _1917 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1919 = _446 + _1917;
    float _1921 = fma(_1803, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1879);
    float _1923 = _1899 * _1903;
    float _1925 = -_1899;
    float _1927 = _1925 + 1.0;
    float _1929 = fma(_1807, _1705, -0.5);
    bool _1931 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1933 = isnan(_446);
    bool _1935 = _1931 || _1933;
    bool _1937 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1939 = _1935 || _1937;
    float _1941 = float(_1939);
    float _1943 = -_1915;
    float _1945 = _1943 + 1.0;
    float _1947 = fma(_1855, _1919, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1949 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1951 = _446 + _1949;
    bool _1953 = _446 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1955 = isnan(_446);
    bool _1957 = _1953 || _1955;
    bool _1959 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1961 = _1957 || _1959;
    float _1963 = float(_1961);
    float _1965 = _1941 * _1945;
    float _1967 = -_1941;
    float _1969 = _1967 + 1.0;
    float _1971 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1973 = _1915 * _1927;
    float _1975 = _1963 * _1969;
    float _1977 = _1689 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1979 = fma(_1781, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1971);
    float _1981 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1983 = _1781 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1985 = _1947 * _1975;
    float _1987 = fma(_1861, _1951, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1989 = _1887;
    float _1991 = _1923;
    if (!_1687)
    {
        _1881 = _1761;
    }
    float _1993 = _1881;
    float _1995 = -_1981;
    float _1997 = fma(_1983, 2.0, _1995);
    float _1999 = fma(_616, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1677);
    float _2001 = _1819 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2003 = _1993;
    if (_1687)
    {
        float _2005 = _1775 ? as_type<float>(_1829) : _1761;
        _2003 = _2005;
    }
    float _2007 = _2003;
    float _2009 = _1018 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2011 = fma(_622, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1999);
    float _2013 = fma(_1977, _1885, -0.5);
    float _2015 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2017 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2019 = fma(_616, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2009);
    float _2021 = _2011 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2023 = fma(_2001, -2.0, _2015);
    float _2025 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1805);
    float _2027 = fma(_622, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2019);
    float _2029 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1745);
    float _2031 = -_1963;
    float _2033 = _2031 + 1.0;
    float _2035 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2037 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1979);
    float _2039 = -_2029;
    float _2041 = fma(_2025, _2013, _2039);
    float _2043 = fma(_2033, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1985);
    float _2045 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1785);
    float _2047 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1921);
    float _2049 = -_124;
    float _2051 = fma(_2049, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1997);
    float _2053 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2023);
    float _2055 = 1.0 / _2021;
    float _2057 = _2027 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2059 = _2017 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2061 = 0;
    float _2063 = _2017;
    float _2065 = _2007;
    float _2067 = _2045;
    if (_1693)
    {
        float _2069 = -_1761;
        float _2071 = _2069 + 1.0;
        _2061 = as_type<int>(_2071);
    }
    int _2073 = _2061;
    if (!_1729)
    {
        _2063 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2075 = _2063;
    float _2077 = _2057 + _2021;
    float _2079 = fma(_2059, _2007, -0.5);
    if (!_1729)
    {
        _2065 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2081 = _2065;
    float _2083 = _2035 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_1693)
    {
        float _2085 = _1839 ? as_type<float>(_2073) : _1761;
        _1823 = _2085;
    }
    float _2087 = _1823;
    float _2089 = fma(_1859, _1965, _2043);
    float _2091 = in.m_61.w;
    float _2093 = -_2053;
    float _2095 = fma(_2047, _1929, _2093);
    float _2097 = fma(_2083, _2087, -0.5);
    float _2099 = fma(_1887, _1973, _2089);
    float _2101 = _2077 * _2055;
    float _2103 = _2101 * 0.5;
    float _2105 = fma(_2045, _2079, _1767);
    if (!_1729)
    {
        float _2107 = -_2081;
        float _2109 = _2107 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1771 = _2109;
    }
    float _2111 = _1771;
    float _2113 = fma(_2037, _2097, _2051);
    if (!_1729)
    {
        float _2115 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2117 = fma(_2103, _2075, _2115);
        _2067 = _2117;
    }
    float _2119 = _2067;
    if (!_1729)
    {
        float _2121 = 1.0 / _2111;
        _1989 = _2121;
    }
    float _2123 = _1989;
    float _2125 = fma(_1987, _1923, _2099);
    float _2127 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2129 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2131 = _2041 + 0.5;
    float _2133 = _1859;
    if (!_1729)
    {
        float _2135 = 1.0 / _2119;
        _2133 = _2135;
    }
    float _2137 = _2133;
    float _2139 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2141 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2143 = _2127 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2145 = _2129 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2147 = _2139 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2149 = _2095 + 0.5;
    float _2151 = _2105 + 0.5;
    float _2153 = _2113 + 0.5;
    float _2155 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    if (_1729)
    {
        _1757 = 1.0;
    }
    float _2157 = _1757;
    out.m_63.x = _2143;
    out.m_63.y = _2145;
    out.m_63.z = _2147;
    out.m_63.w = _2141;
    float _2159 = fma(_1877, (*spvDescriptorSet0.vp_c9)._m0[119].x, _2125);
    float _2161 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2155);
    out.m_65.x = _2151;
    out.m_65.y = _2131;
    out.m_65.z = _2153;
    out.m_65.w = _2149;
    float _2163 = _2157;
    if (!_1729)
    {
        float _2165 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2167 = -_2081;
        float _2169 = fma(_2137, _2165, _2167);
        _1991 = _2169;
    }
    float _2171 = _1991;
    float _2173 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2161);
    out.m_67.w = _2091;
    if (!_1729)
    {
        float _2175 = _2171 * _2123;
        float _2177 = precise::clamp(_2175, 0.0, 1.0);
        _2163 = _2177;
    }
    float _2179 = _2163;
    float _2181 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2173);
    float _2183 = _416 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2185 = _1582 * 0.5;
    float _2187 = _414 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _2189 = _2179 > 0.0;
    bool _2191 = isnan(_2179);
    bool _2193 = _2189 || _2191;
    bool _2195 = isnan(0.0);
    bool _2197 = _2193 || _2195;
    float _2199 = _412 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2201 = fma(_1620, -0.5, _2185);
    float _2203 = -_1791;
    float _2205 = _2203 + 1.0;
    float _2207 = _2179 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2209 = _2181 + _1582;
    float _2211 = _1618 + _1582;
    out.gl_Position.x = _1618;
    out.gl_Position.y = _1620;
    out.gl_Position.z = _2181;
    out.gl_Position.w = _1582;
    float _2213 = _2199 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2215 = _2187 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2217 = _2183 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2219 = _2159 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2221 = _2209 * 0.5;
    float _2223 = _2211 * 0.5;
    float _2225 = _2207 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _2213;
    out.m_69.y = _2215;
    out.m_69.z = _2217;
    out.m_69.w = _2219;
    out.m_71.x = _2223;
    out.m_71.y = _2201;
    out.m_71.z = _2221;
    out.m_71.w = _1582;
    out.m_45.x = _2225;
    float _2227 = _1791 * _1646;
    float _2229 = _1657 * _2227;
    float _2231 = _1667 * _2227;
    float _2233 = fma(_1663, _2229, _1651);
    float _2235 = fma(_1665, _2229, _1653);
    float _2237 = _1657 * _2205;
    float _2239 = fma(_1657, _2231, _1655);
    out.m_73.x = _2233;
    out.m_73.y = _2235;
    out.m_73.z = _2239;
    out.m_73.w = _2237;
    if (_2197)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2241 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2241;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

