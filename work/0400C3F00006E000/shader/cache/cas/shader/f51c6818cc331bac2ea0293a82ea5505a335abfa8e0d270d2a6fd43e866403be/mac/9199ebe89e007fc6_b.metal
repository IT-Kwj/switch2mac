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
    float4 m_77 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_71 [[user(locn2)]];
    float4 m_83 [[user(locn3)]];
    float4 m_79 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_51 [[user(locn6)]];
    float4 m_67 [[user(locn7)]];
    float4 m_89 [[user(locn8)]];
    float4 m_57 [[user(locn9)]];
    float4 m_81 [[user(locn10)]];
    float4 m_69 [[user(locn11)]];
    float4 m_87 [[user(locn12)]];
    float4 m_85 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_61 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_75 [[attribute(4)]];
    float4 m_63 [[attribute(5)]];
    float4 m_59 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_53 [[attribute(8)]];
    float4 m_65 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1987 = false;
    bool _312 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    if (!_112)
    {
        out.m_47.x = 0.0;
    }
    int _118 = 0;
    if (!_112)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2285 = as_type<float>(_122);
        out.gl_Position.z = _2285;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_49.w;
    float _128 = float(_108);
    float _130 = 1.0 / _128;
    float _132 = -_126;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_126);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = _134 * _130;
    bool _148 = _134 >= _128;
    bool _150 = !_144;
    bool _152 = _148 || _150;
    out.m_51.x = _146;
    float _154 = _126;
    float _156 = _146;
    float _158 = _134;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _154;
    if (_152)
    {
        out.m_47.x = 0.0;
    }
    if (_152)
    {
        float _162 = _160 * 5.0;
        _124 = as_type<int>(_162);
    }
    int _164 = _124;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2358 = as_type<float>(_164);
        out.gl_Position.z = _2358;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _166 = in.m_53.y;
    float _168 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _170 = in.m_55.w;
    bool _172 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _174 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _176 = _172 || _174;
    bool _178 = isnan(1.0);
    bool _180 = _176 || _178;
    float _182 = in.m_49.x;
    float _184 = in.m_49.y;
    float _186 = in.m_49.z;
    float _188 = in.m_44.x;
    float _190 = in.m_44.y;
    float _192 = in.m_44.z;
    float _194 = 0.0;
    float _196 = _168;
    if (!_180)
    {
        float _198 = _168 * _168;
        float _200 = _198 * 0.5;
        _194 = _200;
    }
    float _202 = _194;
    float _204 = _202;
    if (!_180)
    {
        float _206 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _206;
    }
    float _208 = _204;
    out.m_57.y = _166;
    bool _210 = !_180;
    float _212 = _208;
    float _214 = _166;
    if (!_210)
    {
        float _216 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = log2(_216);
        float _220 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _222 = _220 + 1.0;
        float _224 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = _168 * _218;
        float _228 = 1.0 / _222;
        float _230 = _224 * 0.693147182464599609375;
        float _232 = exp2(_226);
        float _234 = 1.0 / _230;
        float _236 = _232 + (-1.0);
        float _238 = -_236;
        float _240 = fma(_238, _234, _168);
        float _242 = _240 * _228;
        float _244 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _244;
    }
    float _246 = _212;
    bool _248 = !_180;
    if (!_248)
    {
        float _250 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _252 = log2(_250);
        float _254 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _256 = _254 + 1.0;
        float _258 = 1.0 / _256;
        float _260 = _168 * _252;
        float _262 = exp2(_260);
        float _264 = -_262;
        float _266 = _264 + 1.0;
        float _268 = _266 * _258;
        _196 = _268;
    }
    float _270 = _196;
    bool _272 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _274 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _276 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _278 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _280 = fma(_270, _182, _274);
    float _282 = fma(_270, _184, _276);
    float _284 = fma(_270, _186, _278);
    float _286 = fma(_280, _170, _188);
    float _288 = fma(_282, _170, _190);
    float _290 = fma(_284, _170, _192);
    bool _292 = !_272;
    float _310;
    if (!_292)
    {
        float _294 = in.m_59.x;
        float _296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _298 = _294 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _302 = _300 * _296;
        float _304 = floor(_302);
        float _306 = -_304;
        float _308 = _302 + _306;
        _310 = _308;
        _312 = true;
    }
    else
    {
        _310 = _146;
    }
    _312 = false;
    float _314 = _310;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _318 = _314 + _316;
    bool _320 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _322 = isnan(_314);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _334 = _314 + _332;
    bool _336 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _338 = isnan(_314);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _348;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _356 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _358 = isnan(_314);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -_330;
    float _370 = _368 + 1.0;
    float _372 = 1.0 / _354;
    float _374 = _366 * _370;
    float _376 = -_366;
    float _378 = _376 + 1.0;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _380;
    bool _384 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _386 = 1.0 / _350;
    float _388 = _346 * _378;
    float _390 = -_346;
    float _392 = _390 + 1.0;
    float _394 = _334 * _372;
    float _396 = _318 * _386;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _398;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _402;
    float _406 = fma(_382, _396, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _408 = fma(_400, _396, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _410 = fma(_404, _396, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _412 = in.m_55.x;
    float _414 = in.m_55.y;
    float _416 = in.m_55.z;
    float _418 = _406 * _388;
    float _420 = _408 * _388;
    float _422 = _410 * _388;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _436 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].y, _420);
    float _438 = fma(_426, _394, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _440 = fma(_430, _394, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _442 = fma(_434, _394, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _444 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].x, _418);
    float _446 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].z, _422);
    float _448 = fma(_438, _374, _436);
    float _450 = fma(_440, _374, _444);
    float _452 = fma(_442, _374, _446);
    float _454 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[145].y, _448);
    float _456 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[145].x, _450);
    float _458 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[145].z, _452);
    float _460 = _456 * _412;
    float _462 = _454 * _414;
    float _464 = _458 * _416;
    bool _466 = !_384;
    if (!_466)
    {
        float _468 = in.m_59.x;
        float _470 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _472 = _468 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _474 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _476 = _474 * _470;
        float _478 = floor(_476);
        float _480 = -_478;
        float _482 = _476 + _480;
        _156 = _482;
    }
    float _484 = _156;
    float _486 = in.m_59.y;
    float _488 = _462 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _490 = in.m_59.z;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _496 = _494 != 0;
    float _498 = in.m_59.x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _502 = _460 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _506 = _504 != 0;
    int _508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _510 = _508 != 0;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _514 = _512 != 0;
    float _516 = _464 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _518 = !_510;
    int _520 = _518 ? 0 : 1;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _524 = !_514;
    int _526 = _524 ? 0 : 1;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _530 = _486 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _532 = _490 * 2.0;
    float _534 = fma(_530, -2.0, _492);
    float _536 = _486 * 2.0;
    float _538 = _498 * 2.0;
    float _540 = floor(_532);
    float _542 = _498 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _544 = -_500;
    float _546 = fma(_542, 2.0, _544);
    float _548 = floor(_538);
    float _550 = _498 + _486;
    float _552 = -_134;
    float _554 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[76].x, _546);
    float _556 = _550 + (-1.0);
    float _558 = floor(_536);
    bool _560 = _540 > 0.0;
    float _562 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _564 = _540 >= 0.0;
    bool _566 = isnan(_540);
    bool _568 = _564 || _566;
    bool _570 = isnan(0.0);
    bool _572 = _568 || _570;
    float _574 = _540;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    float _578 = _556;
    bool _580 = _510;
    if (!_496)
    {
        _574 = _486;
    }
    float _582 = _574;
    float _584 = _582;
    if (!_496)
    {
        _576 = _490;
    }
    float _586 = _576;
    float _588 = _586;
    if (!_496)
    {
        _578 = _490;
    }
    float _590 = _578;
    float _592 = _590;
    if (_496)
    {
        _584 = _498;
    }
    float _594 = _584;
    if (_496)
    {
        _588 = _486;
    }
    float _596 = _588;
    if (_496)
    {
        _592 = _486;
    }
    float _598 = _592;
    bool _600 = _548 > 0.0;
    float _602 = _596 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _604 = _548 >= 0.0;
    bool _606 = isnan(_548);
    bool _608 = _604 || _606;
    bool _610 = isnan(0.0);
    bool _612 = _608 || _610;
    float _614 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[83].w, _522);
    bool _616 = !_506;
    int _618 = _616 ? 0 : 1;
    int _620 = _572 ? 0 : 1;
    float _622 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _614);
    bool _624 = _558 > 0.0;
    bool _626 = _558 >= 0.0;
    bool _628 = isnan(_558);
    bool _630 = _626 || _628;
    bool _632 = isnan(0.0);
    bool _634 = _630 || _632;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _638 = _634 ? 0 : 1;
    float _640 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[83].z, _636);
    float _642 = _594 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _644 = ~_620;
    int _646 = _644 + 1;
    int _648 = _646 + 1;
    float _650 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _652 = log2(_650);
    int _654 = abs(_618);
    float _656 = -_528;
    float _658 = fma(_642, 2.0, _656);
    int _660 = _648;
    if (!_560)
    {
        int _662 = ~_620;
        int _664 = _662 + 1;
        _660 = _664;
    }
    int _666 = _660;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _670 = ~_638;
    int _672 = _670 + 1;
    int _674 = _672 + 1;
    float _676 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _640);
    int _678 = _674;
    if (!_624)
    {
        int _680 = ~_638;
        int _682 = _680 + 1;
        _678 = _682;
    }
    int _684 = _678;
    float _686 = fma(_602, -2.0, _668);
    float _688 = float(_654);
    float _690 = float(_666);
    int _692 = _612 ? 0 : 1;
    float _694 = _652 * _134;
    float _696 = _688 * _690;
    float _698 = in.m_61.x;
    float _700 = in.m_61.y;
    float _702 = in.m_61.z;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _706 = ~_692;
    int _708 = _706 + 1;
    int _710 = _708 + 1;
    float _712 = exp2(_694);
    int _714 = _710;
    if (!_600)
    {
        int _716 = ~_692;
        int _718 = _716 + 1;
        _714 = _718;
    }
    int _720 = _714;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _724 = 1.0 + _722;
    float _726 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[78].z, _704);
    bool _728 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _730 = isnan(1.0);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _736 = _732 || _734;
    float _738 = _696 * (-2.0);
    bool _740 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _742 = isnan(0.0);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _748 = _744 || _746;
    float _750 = 1.0 / _724;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _754 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _726);
    int _756 = abs(_520);
    float _758 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _534);
    float _760 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[78].w, _752);
    float _762 = _498 + (-0.5);
    float _764 = float(_756);
    float _766 = -_712;
    float _768 = _766 + 1.0;
    float _770 = float(_720);
    float _772 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _760);
    float _774 = -_134;
    float _776 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[81].x, _658);
    float _778 = fma(_738, _698, _698);
    float _780 = _748 ? _768 : 0.0;
    float _782 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _686);
    float _784 = fma(_562, _738, _562);
    float _786 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[196].x, _778);
    int _788 = abs(_526);
    if (_736)
    {
        float _790 = _780 * _750;
        _158 = _790;
    }
    float _792 = _158;
    float _794 = _486 + _490;
    float _796 = _764 * _770;
    float _798 = fma(_784, _792, _786);
    float _800 = float(_788);
    float _802 = _794 + (-1.0);
    float _804 = float(_684);
    float _806 = _796 * (-2.0);
    float _808 = _798 * 0.15915493667125701904296875;
    float _810 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _812 = _498 + _490;
    float _814 = _800 * _804;
    float _816 = _486 + (-0.5);
    float _818 = fma(_806, _700, _700);
    float _820 = fma(_810, _806, _810);
    float _822 = _812 + (-1.0);
    float _824 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[196].y, _818);
    float _826 = _814 * (-2.0);
    float _828 = _808 * 6.283185482025146484375;
    float _830 = sin(_828);
    float _832 = fma(_820, _792, _824);
    float _834 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _836 = fma(_826, _702, _702);
    float _838 = _490 + (-0.5);
    float _840 = _832 * 0.15915493667125701904296875;
    float _842 = fma(_834, _826, _834);
    float _844 = _808 * 6.283185482025146484375;
    float _846 = cos(_844);
    float _848 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[196].z, _836);
    float _850 = fma(_842, _792, _848);
    float _852 = _840 * 6.283185482025146484375;
    float _854 = sin(_852);
    float _856 = in.m_63.x;
    float _858 = in.m_63.y;
    float _860 = in.m_63.z;
    float _862 = _850 * 0.15915493667125701904296875;
    bool _864 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _866 = isnan(0.5);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _872 = _868 || _870;
    float _874 = _840 * 6.283185482025146484375;
    float _876 = cos(_874);
    float _878 = _862 * 6.283185482025146484375;
    float _880 = cos(_878);
    float _882 = _830 * _854;
    float _884 = _846 * _854;
    float _886 = _288 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _888 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[6].x, _886);
    float _890 = _862 * 6.283185482025146484375;
    float _892 = sin(_890);
    float _894 = _830 * _876;
    float _896 = _846 * _876;
    float _898 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _860);
    float _900 = _288 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _902 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[6].z, _888);
    float _904 = _516 * _898;
    float _906 = _830 * _880;
    float _908 = _876 * _880;
    float _910 = _846 * _880;
    float _912 = _854 * _880;
    float _914 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _858);
    float _916 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _856);
    float _918 = _902 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _920 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[5].x, _900);
    float _922 = _488 * _914;
    float _924 = -_884;
    float _926 = fma(_892, _894, _924);
    float _928 = -_894;
    float _930 = fma(_892, _884, _928);
    float _932 = fma(_892, _896, _882);
    float _934 = _502 * _916;
    float _936 = _910 * _922;
    float _938 = fma(_892, _882, _896);
    float _940 = -_922;
    float _942 = _892 * _940;
    float _944 = _906 * _922;
    float _946 = fma(_932, _934, _936);
    float _948 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[5].z, _920);
    float _950 = fma(_908, _934, _942);
    float _952 = fma(_926, _934, _944);
    float _954 = fma(_930, _904, _946);
    float _956 = _948 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _958 = fma(_912, _904, _950);
    float _960 = fma(_938, _904, _952);
    float _962 = _288 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _964 = _954 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _966 = _954 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _968 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[4].x, _962);
    float _970 = fma(_958, (*spvDescriptorSet0.vp_c10)._m0[10].x, _964);
    float _972 = fma(_958, (*spvDescriptorSet0.vp_c10)._m0[8].x, _966);
    float _974 = _956 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _976 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[4].z, _968);
    float _978 = fma(_960, (*spvDescriptorSet0.vp_c10)._m0[10].z, _970);
    float _980 = fma(_960, (*spvDescriptorSet0.vp_c10)._m0[8].z, _972);
    float _982 = _976 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _984 = _918 + _978;
    float _986 = _982 + _980;
    float _988 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _990 = _984 + _988;
    float _992 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[11].x, _974);
    float _994 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _996 = _986 + _994;
    float _998 = _990 * _990;
    float _1000 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[11].z, _992);
    float _1002 = _956 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1004 = fma(_996, _996, _998);
    float _1006 = _1000 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1008 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1002);
    float _1010 = sqrt(_1004);
    float _1012 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1008);
    float _1014 = _954 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1016 = _1012 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1018 = fma(_958, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1014);
    float _1020 = 1.0 / _1006;
    float _1022 = _1014;
    float _1024 = _954;
    float _1026 = _960;
    float _1028 = _986;
    if (_872)
    {
        _1022 = 1.0;
    }
    float _1030 = _1022;
    float _1032 = _1016 + _1006;
    float _1034 = fma(_960, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1018);
    float _1036 = _956 + _1034;
    bool _1038 = _1010 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1040 = _1032 * _1020;
    float _1042 = _1040 * 0.5;
    float _1044 = _1034;
    float _1046 = _1030;
    float _1048 = _1036;
    if (!_1038)
    {
        _1044 = _986;
    }
    float _1050 = _1044;
    float _1052 = _1050;
    if (!_1038)
    {
        _1024 = _984;
    }
    float _1054 = _1024;
    float _1056 = _1054;
    if (!_1038)
    {
        _1026 = _1036;
    }
    float _1058 = _1026;
    bool _1060 = !_1038;
    float _1062 = _1058;
    if (!_1060)
    {
        float _1064 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1066 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1068 = _1010 + _1066;
        float _1070 = _1036 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1072 = rsqrt(_1004);
        float _1074 = _1068 * _1064;
        float _1076 = _1074 * 0.15915493667125701904296875;
        float _1078 = _1076 * 6.283185482025146484375;
        float _1080 = cos(_1078);
        float _1082 = _1076 * 6.283185482025146484375;
        float _1084 = sin(_1082);
        float _1086 = _1080 + (-1.0);
        float _1088 = _1086 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1090 = fma(_1084, _1070, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1092 = fma(_1036, _1080, _1088);
        float _1094 = _1072 * _1090;
        float _1096 = fma(_996, _1094, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1098 = fma(_990, _1094, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1062 = _1092;
        _1052 = _1096;
        _1056 = _1098;
        _1028 = _1094;
    }
    float _1100 = _1062;
    float _1102 = _1052;
    float _1104 = _1056;
    float _1106 = _1028;
    float _1108 = _1106;
    if (!_872)
    {
        float _1110 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1112 = _1110 * 0.15915493667125701904296875;
        float _1114 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1116 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1118 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1116);
        float _1120 = _1112 * 6.283185482025146484375;
        float _1122 = cos(_1120);
        float _1124 = _1114 * 0.15915493667125701904296875;
        float _1126 = _1112 * 6.283185482025146484375;
        float _1128 = sin(_1126);
        float _1130 = 1.0 / _1122;
        float _1132 = _1124 * 6.283185482025146484375;
        float _1134 = cos(_1132);
        float _1136 = _1128 * _1130;
        float _1138 = _1124 * 6.283185482025146484375;
        float _1140 = sin(_1138);
        float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1144 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1142;
        float _1146 = _1134 * _1136;
        float _1148 = 1.0 / _1118;
        float _1150 = 1.0 / _1146;
        float _1152 = 1.0 / _1144;
        float _1154 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1156 = _1148 * _1154;
        float _1158 = _1140 * _1150;
        float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1162 = fma(_1158, _1156, _1160);
        float _1164 = _1162 * _1152;
        float _1166 = precise::clamp(_1164, 0.0, 1.0);
        _1108 = _1152;
        _1046 = _1166;
    }
    float _1168 = _1108;
    float _1170 = _1046;
    float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1174 = _1100 + _1172;
    float _1176 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1178 = _1102 + _1176;
    float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1182 = _1104 + _1180;
    float _1184 = _1174 * _1174;
    float _1186 = fma(_1178, _1178, _1184);
    float _1188 = fma(_1182, _1182, _1186);
    float _1190 = rsqrt(_1188);
    float _1192 = sqrt(_1188);
    float _1194 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1196 = _1178 * _1194;
    float _1198 = _1182 * _1194;
    float _1200 = _1196 * _1196;
    float _1202 = _1198 * _1198;
    float _1204 = _1200 + _1202;
    float _1206 = sqrt(_1204);
    bool _1208 = _1206 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1212 = _1206 + _1210;
    float _1214 = _1168;
    float _1216 = _1204;
    float _1218 = _1212;
    float _1220 = _1174;
    float _1222 = _1196;
    float _1224 = _1198;
    float _1226 = _1200;
    float _1228 = _1202;
    if (_1208)
    {
        float _1230 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1214 = _1230;
    }
    float _1232 = _1214;
    if (_1208)
    {
        float _1234 = rsqrt(_1204);
        _1216 = _1234;
    }
    float _1236 = _1216;
    if (_1208)
    {
        float _1238 = _1212 * _1232;
        _1218 = _1238;
    }
    float _1240 = _1218;
    if (_1208)
    {
        float _1242 = _1240 * 0.15915493667125701904296875;
        _1048 = _1242;
    }
    float _1244 = _1048;
    float _1246 = _982;
    if (_1208)
    {
        float _1248 = _1244 * 6.283185482025146484375;
        float _1250 = sin(_1248);
        _1246 = _1250;
    }
    float _1252 = _1246;
    float _1254 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1256 = precise::max(0.0, _1254);
    float _1258 = _1006;
    float _1260 = _1254;
    float _1262 = _1256;
    if (_1208)
    {
        float _1264 = _1244 * 6.283185482025146484375;
        float _1266 = cos(_1264);
        _1258 = _1266;
    }
    float _1268 = _1258;
    float _1270 = -_1194;
    float _1272 = -_1256;
    float _1274 = fma(_1174, _1270, _1272);
    if (_1208)
    {
        float _1276 = _1274 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1220 = _1276;
    }
    float _1278 = _1220;
    float _1280 = _1252;
    float _1282 = _1278;
    if (_1208)
    {
        float _1284 = fma(_1252, _1278, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1280 = _1284;
    }
    float _1286 = _1280;
    float _1288 = _1286;
    if (!_1208)
    {
        _1282 = _1274;
    }
    float _1290 = _1282;
    float _1292 = _1290;
    if (_1208)
    {
        float _1294 = _1268 + (-1.0);
        _1260 = _1294;
    }
    float _1296 = _1260;
    if (_1208)
    {
        float _1298 = _1236 * _1286;
        _1288 = _1298;
    }
    float _1300 = _1288;
    float _1302 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    if (_1208)
    {
        float _1304 = _1296 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1262 = _1304;
    }
    float _1306 = _1262;
    if (_1208)
    {
        float _1308 = _1196 * _1300;
        _1222 = _1308;
    }
    float _1310 = _1222;
    if (_1208)
    {
        float _1312 = _1198 * _1300;
        _1224 = _1312;
    }
    float _1314 = _1224;
    float _1316 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1208)
    {
        float _1318 = fma(_1274, _1268, _1306);
        _1292 = _1318;
    }
    float _1320 = _1292;
    if (_1208)
    {
        float _1322 = _1310 * _1310;
        _1226 = _1322;
    }
    float _1324 = _1226;
    if (_1208)
    {
        float _1326 = _1314 * _1314;
        _1228 = _1326;
    }
    float _1328 = _1228;
    float _1330 = fma(_1320, _1320, _1324);
    float _1332 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1334 = fma(_1192, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1332);
    float _1336 = precise::clamp(_1334, 0.0, 1.0);
    float _1338 = _1330 + _1328;
    float _1340 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1316);
    float _1342 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1344 = -_1336;
    float _1346 = _1344 + 1.0;
    float _1348 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1350 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1340);
    float _1352 = rsqrt(_1338);
    float _1354 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1356 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1342);
    float _1358 = _1350 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1360 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1348);
    float _1362 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1354);
    float _1364 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1356);
    float _1366 = _1358 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1368 = abs(_1346);
    float _1370 = log2(_1368);
    float _1372 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1362);
    float _1374 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1376 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1360);
    float _1378 = -_1366;
    float _1380 = fma(_1378, _1302, 1.0);
    float _1382 = _1372 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1384 = _1374 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1386 = _1376 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1388 = _1352 * _1310;
    float _1390 = _1352 * _1320;
    float _1392 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1384);
    float _1394 = _1352 * _1314;
    float _1396 = _1388 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1398 = log2(_1380);
    float _1400 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1392);
    float _1402 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1404 = -_1396;
    float _1406 = fma(_1390, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1404);
    float _1408 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1400);
    float _1410 = _1374 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1412 = exp2(_1402);
    float _1414 = -_1394;
    float _1416 = fma(_1414, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1406);
    float _1418 = _1374 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1420 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1410);
    float _1422 = fma(_1416, -0.5, 0.5);
    float _1424 = fma(_1416, 0.5, 0.5);
    float _1426 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1418);
    float _1428 = 1.0 / _1408;
    float _1430 = _1390 + 1.0;
    float _1432 = fma(_1424, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1434 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1426);
    float _1436 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1420);
    float _1438 = _1398 * 0.693147182464599609375;
    float _1440 = fma(_1424, _1432, -0.212114393711090087890625);
    float _1442 = sqrt(_1422);
    float _1444 = -_1390;
    float _1446 = fma(_1412, _1430, _1444);
    float _1448 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1434);
    float _1450 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1436);
    float _1452 = fma(_1424, _1440, 1.570728778839111328125);
    float _1454 = _1438 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1456 = _1448 * _1428;
    float _1458 = _1450 * _1428;
    float _1460 = fma(_1456, 0.5, 0.5);
    float _1462 = fma(_1458, -0.5, 0.5);
    float _1464 = fma(_1446, 0.5, 0.5);
    float _1466 = _1442 * 0.636619746685028076171875;
    float _1468 = -_1452;
    float _1470 = fma(_1466, _1468, 1.0);
    float3 _4430 = float3(_1460, _1462, _1454);
    float _1472 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4430, float3(0.0), isnan(_4430)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4430, float3(0.0), isnan(_4430)), level(0.0)).x;
    float3 _4441 = float3(_1460, _1462, _1454);
    float4 _1475 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4441, float3(0.0), isnan(_4441)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4441, float3(0.0), isnan(_4441)), level(0.0)).xyzw;
    float _1477 = _1475.x;
    float _1479 = _1475.y;
    float _1481 = _1475.z;
    float _1483 = _1475.w;
    float2 _4458 = float2(_1470, _1464);
    float3 _1487 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4458, float2(0.0), isnan(_4458)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4458, float2(0.0), isnan(_4458)), level(0.0)).xyz;
    float _1489 = _1487.x;
    float _1491 = _1487.y;
    float _1493 = _1487.z;
    float _1495 = in.m_59.w;
    float _1497 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1499 = _484 + _1497;
    float _1501 = in.m_65.w;
    bool _1503 = _486 > 0.5;
    float _1505 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1507 = _1505 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1511 = _1509 != 0;
    out.m_67.x = _502;
    out.m_67.y = _488;
    out.m_67.z = _516;
    int _1513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1515 = _1513 != 0;
    float _1517 = -_166;
    float _1519 = _1517 + 1.0;
    int _1521 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1523 = _1521 != 0;
    float _1525 = 1.0 / _1507;
    int _1527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1529 = _1527 != 0;
    float _1531 = in.m_53.x;
    float _1533 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_69.x = _1102;
    out.m_69.y = _1100;
    out.m_69.z = _1104;
    float _1535 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1537 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1535;
    float _1539 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1541 = _1495 > 0.5;
    float _1543 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1545 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_71.w = _1501;
    bool _1547 = _1541;
    float _1549 = _1539;
    float _1551 = _1408;
    float _1553 = _1450;
    float _1555 = _1448;
    if (_1511)
    {
        bool _1557 = _498 > 0.5;
        _580 = _1557;
    }
    bool _1559 = _580;
    float _1561 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1563 = _1561 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1565 = _1537 * _1525;
    float _1567 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1569 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1571 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1573 = _1571 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _1575 = _1541 ? as_type<int>(_1519) : as_type<int>(_166);
    float _1577 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1579 = as_type<int>(_1569);
    if (_1515)
    {
        bool _1581 = _490 > 0.5;
        _1547 = _1581;
    }
    bool _1583 = _1547;
    float _1585 = _1543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1587 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1589 = isnan(_484);
    bool _1591 = _1587 || _1589;
    bool _1593 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1595 = _1591 || _1593;
    float _1597 = float(_1595);
    float _1599 = _1545 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1601 = 1.0 / _1563;
    float _1603 = _1567 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1605 = fma(_1565, _1499, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1607 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1609 = isnan(_484);
    bool _1611 = _1607 || _1609;
    bool _1613 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1615 = _1611 || _1613;
    float _1617 = float(_1615);
    float _1619 = -_1597;
    float _1621 = _1619 + 1.0;
    bool _1623 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1625 = isnan(_484);
    bool _1627 = _1623 || _1625;
    bool _1629 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1631 = _1627 || _1629;
    float _1633 = float(_1631);
    out.m_73.x = _1585;
    out.m_73.y = _1599;
    out.m_73.z = _1603;
    out.m_73.w = _1577;
    float _1635 = _1523 ? as_type<float>(_1575) : _166;
    float _1637 = exp2(_1533);
    if (_1529)
    {
        float _1639 = _1503 ? _1519 : _166;
        _214 = _1639;
    }
    float _1641 = _214;
    bool _1643 = _858 != 0.0;
    bool _1645 = isnan(_858);
    bool _1647 = _1643 || _1645;
    bool _1649 = isnan(0.0);
    bool _1651 = _1647 || _1649;
    bool _1653 = _856 == 0.0;
    bool _1655 = !_1651;
    bool _1657 = _1653 && _1655;
    float _1659 = _1573 * _1601;
    float _1661 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1663 = _484 + _1661;
    float _1665 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1667 = _1539 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1669 = fma(_1659, _1663, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1671 = _1617 * _1621;
    float _1673 = -_1617;
    float _1675 = _1673 + 1.0;
    float _1677 = _1569 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1679 = fma(_1635, _1667, -0.5);
    bool _1681 = _860 == 0.0;
    bool _1683 = _1681 && _1657;
    float _1685 = _1633 * _1675;
    float _1687 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1689 = as_type<int>(_1663);
    float _1691 = _1531;
    if (_1511)
    {
        float _1693 = -_1531;
        float _1695 = _1693 + 1.0;
        _1579 = as_type<int>(_1695);
    }
    int _1697 = _1579;
    if (_1515)
    {
        float _1699 = -_1531;
        float _1701 = _1699 + 1.0;
        _1689 = as_type<int>(_1701);
    }
    int _1703 = _1689;
    float _1705 = _1605 * _1685;
    float _1707 = fma(_1677, _1641, -0.5);
    if (!_1511)
    {
        _1549 = _1531;
    }
    float _1709 = _1549;
    float _1711 = in.m_75.x;
    float _1713 = in.m_75.y;
    float _1715 = in.m_75.z;
    float _1717 = _1709;
    if (_1511)
    {
        float _1719 = _1559 ? as_type<float>(_1697) : _1531;
        _1717 = _1719;
    }
    float _1721 = _1717;
    float _1723 = _1665 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1515)
    {
        float _1725 = _1583 ? as_type<float>(_1703) : _1531;
        _1691 = _1725;
    }
    float _1727 = _1691;
    float _1729 = -_1633;
    float _1731 = _1729 + 1.0;
    float _1733 = -_782;
    float _1735 = fma(_622, _1679, _1733);
    float _1737 = fma(_1723, _1721, -0.5);
    float _1739 = -_758;
    float _1741 = fma(_772, _1707, _1739);
    float _1743 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1705);
    float _1745 = _1687 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1747 = fma(_754, _1737, _554);
    float _1749 = fma(_1669, _1671, _1743);
    float _1751 = fma(_1745, _1727, -0.5);
    float _1753 = -_1637;
    float _1755 = _1753 + 1.0;
    float _1757 = fma(_1597, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1749);
    float _1759 = fma(_676, _1751, _776);
    float _1761 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1763 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1765 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1767 = _1741 + 0.5;
    float _1769 = _1755 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1771 = _1713;
    float _1773 = _1711;
    float _1775 = _1715;
    if (!_1683)
    {
        float _1777 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1713);
        _1771 = _1777;
    }
    float _1779 = _1771;
    float _1781 = _1374 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    if (!_1683)
    {
        float _1783 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1711);
        _1773 = _1783;
    }
    float _1785 = _1773;
    if (!_1683)
    {
        float _1787 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1715);
        _1775 = _1787;
    }
    float _1789 = _1775;
    float _1791 = -_1779;
    float _1793 = _892 * _1791;
    float _1795 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1781);
    float _1797 = _910 * _1779;
    float _1799 = _906 * _1779;
    float _1801 = fma(_908, _1785, _1793);
    float _1803 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1795);
    float _1805 = fma(_932, _1785, _1797);
    float _1807 = fma(_926, _1785, _1799);
    float _1809 = fma(_912, _1789, _1801);
    float _1811 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1803);
    float _1813 = fma(_930, _1789, _1805);
    float _1815 = _1735 + 0.5;
    float _1817 = _1761 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1819 = _1811 + _1408;
    float _1821 = _1763 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1823 = _1765 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1825 = _1757 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1827 = fma(_938, _1789, _1807);
    float _1829 = _1819 * 0.5;
    float _1831 = _1813 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1833 = _1813 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1835 = _1813 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_77.x = _1817;
    out.m_77.y = _1821;
    out.m_77.z = _1823;
    out.m_77.w = _1825;
    float _1837 = fma(_1809, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1831);
    float _1839 = fma(_1809, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1833);
    float _1841 = fma(_1809, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1835);
    float _1843 = fma(_1827, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1837);
    float _1845 = fma(_1827, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1839);
    float _1847 = fma(_1827, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1841);
    bool _1849 = _1192 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1851 = isnan(_1192);
    bool _1853 = _1849 || _1851;
    bool _1855 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1857 = _1853 || _1855;
    out.m_79.z = _1829;
    out.m_79.w = _1408;
    float _1859 = _1747 + 0.5;
    float _1861 = _1759 + 0.5;
    out.m_81.x = _1843;
    out.m_81.y = _1845;
    out.m_81.z = _1847;
    out.m_83.x = _1859;
    out.m_83.y = _1767;
    out.m_83.z = _1861;
    out.m_83.w = _1815;
    out.gl_Position.x = _1448;
    out.gl_Position.y = _1450;
    out.gl_Position.z = _1811;
    out.gl_Position.w = _1408;
    float _1863 = _1839;
    float _1865 = _1811;
    if (!_1857)
    {
        _1863 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1867 = _1863;
    float _1869 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1871 = _1867;
    float _1873 = _1867;
    if (!_1857)
    {
        _1551 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1875 = _1551;
    float _1877 = _1875;
    float _1879 = _1875;
    if (!_1857)
    {
        _1865 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1881 = _1865;
    float _1883 = _1881;
    float _1885 = _1881;
    if (!_1857)
    {
        _1553 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1887 = _1553;
    float _1889 = _1887;
    float _1891 = _1887;
    if (!_1857)
    {
        _1555 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1893 = _1555;
    float _1895 = _1769 * _1472;
    float _1897 = -_1769;
    float _1899 = _1897 + 1.0;
    float _1901 = _1483 * _1895;
    float _1903 = _1493 * _1895;
    float _1905 = _1483 * _1899;
    float _1907 = _1895;
    float _1909 = _1893;
    float _1911 = _1893;
    if (!_1857)
    {
        _1907 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1913 = _1907;
    float _1915 = fma(_1489, _1901, _1477);
    float _1917 = fma(_1491, _1901, _1479);
    float _1919 = fma(_1483, _1903, _1481);
    out.m_85.x = _1915;
    out.m_85.y = _1917;
    out.m_85.z = _1919;
    out.m_85.w = _1905;
    bool _1921 = !_1857;
    float _1923 = _1913;
    float _1925 = _1913;
    if (!_1921)
    {
        bool _1927 = _1192 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1929 = isnan(_1192);
        bool _1931 = _1927 || _1929;
        bool _1933 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1935 = _1931 || _1933;
        if (!_1935)
        {
            float _1937 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1939 = _1192 + _1937;
            float _1941 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1943 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1941;
            float _1945 = 1.0 / _1943;
            float _1947 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1949 = _1947 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1951 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1953 = _1951 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1955 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1957 = _1955 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1959 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1961 = _1959 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1963 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1965 = _1963 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1967 = _1939 * _1945;
            float _1969 = precise::clamp(_1967, 0.0, 1.0);
            float _1971 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1973 = _1971 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1975 = fma(_1969, _1949, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1977 = fma(_1969, _1973, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1979 = fma(_1969, _1953, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1981 = fma(_1969, _1957, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1983 = fma(_1969, _1961, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1985 = fma(_1969, _1965, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1925 = _1977;
            _1891 = _1983;
            _1873 = _1975;
            _1885 = _1981;
            _1879 = _1979;
            _1911 = _1985;
            _1987 = true;
        }
        else
        {
            bool _1989 = _1192 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1991 = isnan(_1192);
            bool _1993 = _1989 || _1991;
            bool _1995 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1997 = _1993 || _1995;
            if (!_1997)
            {
                _1871 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1999 = _1871;
            _1873 = _1999;
            if (!_1997)
            {
                _1923 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2001 = _1923;
            _1925 = _2001;
            if (!_1997)
            {
                _1877 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2003 = _1877;
            _1879 = _2003;
            if (!_1997)
            {
                _1883 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2005 = _1883;
            _1885 = _2005;
            if (!_1997)
            {
                _1889 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2007 = _1889;
            _1891 = _2007;
            if (!_1997)
            {
                _1909 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2009 = _1909;
            bool _2011 = !_1997;
            _1911 = _2009;
            if (!_2011)
            {
                bool _2013 = _1192 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2015 = isnan(_1192);
                bool _2017 = _2013 || _2015;
                bool _2019 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2021 = _2017 || _2019;
                if (!_2021)
                {
                    float _2023 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2025 = _1192 + _2023;
                    float _2027 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2029 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2027;
                    float _2031 = 1.0 / _2029;
                    float _2033 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2035 = _2033 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2037 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2039 = _2037 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2041 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2043 = _2041 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2045 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2047 = _2045 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2051 = _2049 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2053 = _2025 * _2031;
                    float _2055 = precise::clamp(_2053, 0.0, 1.0);
                    float _2057 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2059 = _2057 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2061 = fma(_2055, _2035, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2063 = fma(_2055, _2059, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2065 = fma(_2055, _2039, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2067 = fma(_2055, _2043, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2069 = fma(_2055, _2047, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2071 = fma(_2055, _2051, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1925 = _2063;
                    _1891 = _2069;
                    _1873 = _2061;
                    _1885 = _2067;
                    _1879 = _2065;
                    _1911 = _2071;
                    _1987 = true;
                }
                else
                {
                    _1925 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1891 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1873 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1885 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1879 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1911 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1987 = false;
    float _2073 = _1925;
    float _2075 = _1891;
    float _2077 = _1873;
    float _2079 = _1885;
    float _2081 = _1879;
    float _2083 = _1911;
    float _2085 = fma(_1845, -0.5, 0.5);
    float _2087 = precise::clamp(_2085, 0.0, 1.0);
    float _2089 = -_2073;
    float _2091 = _2089 + _2075;
    float _2093 = _1869 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2095 = -_2077;
    float _2097 = _2095 + _2079;
    float _2099 = fma(_2087, _2091, _2073);
    out.m_87.x = 0.0;
    float _2101 = -_2081;
    float _2103 = _2101 + _2083;
    float _2105 = fma(_2087, _2097, _2077);
    float _2107 = _2099 * 0.586610972881317138671875;
    out.m_47.x = _2093;
    bool _2109 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2111 = fma(_2087, _2103, _2081);
    float _2113 = fma(_2105, 0.298911988735198974609375, _2107);
    bool _2115 = _1170 > 0.0;
    bool _2117 = isnan(_1170);
    bool _2119 = _2115 || _2117;
    bool _2121 = isnan(0.0);
    bool _2123 = _2119 || _2121;
    float _2125 = fma(_2111, 0.114477999508380889892578125, _2113);
    float _2127 = -_2125;
    float _2129 = _2105 + _2127;
    float _2131 = -_2125;
    float _2133 = _2099 + _2131;
    float _2135 = -_2125;
    float _2137 = _2111 + _2135;
    float _2139 = fma(_2129, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2125);
    float _2141 = fma(_2133, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2125);
    float _2143 = fma(_2137, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2125);
    bool _2145 = !_2109;
    if (!_2145)
    {
        float _2147 = -_1100;
        float _2149 = _2147 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2151 = -_1102;
        float _2153 = _2151 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2155 = -_1104;
        float _2157 = _2155 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2159 = _2149 * _2149;
        float _2161 = fma(_2153, _2153, _2159);
        float _2163 = fma(_2157, _2157, _2161);
        float _2165 = sqrt(_2163);
        float _2167 = rsqrt(_2163);
        float _2169 = -_2165;
        float _2171 = _2169 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2173 = _2171 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2175 = precise::clamp(_2173, 0.0, 1.0);
        float _2177 = _2153 * _2167;
        float _2179 = _2149 * _2167;
        float _2181 = abs(_2175);
        float _2183 = log2(_2181);
        float _2185 = _2157 * _2167;
        float _2187 = _2177 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2189 = _1845 * _2179;
        float _2191 = -_2179;
        float _2193 = -_2187;
        float _2195 = fma(_2191, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2193);
        float _2197 = fma(_1843, _2177, _2189);
        float _2199 = -_2185;
        float _2201 = fma(_2199, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2195);
        float _2203 = fma(_1847, _2185, _2197);
        float _2205 = precise::clamp(_2203, 0.0, 1.0);
        float _2207 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2209 = _2201 + _2207;
        float _2211 = _2183 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2213 = _2209 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2215 = precise::clamp(_2213, 0.0, 1.0);
        float _2217 = exp2(_2211);
        float _2219 = _2217 * _2215;
        float _2221 = _2205 * _2219;
        float _2223 = _2221 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2225 = _2221 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2227 = _2221 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2223;
        out.m_87.y = _2225;
        out.m_87.z = _2227;
    }
    out.m_89.x = _2139;
    out.m_89.y = _2141;
    out.m_89.z = _2143;
    if (_2123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2229 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2229;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1987 = false;
    bool _312 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    if (!_112)
    {
        out.m_47.x = 0.0;
    }
    int _118 = 0;
    if (!_112)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2285 = as_type<float>(_122);
        out.gl_Position.z = _2285;
    }
    if (!_112)
    {
        return out;
    }
    float _126 = in.m_49.w;
    float _128 = float(_108);
    float _130 = 1.0 / _128;
    float _132 = -_126;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_126);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = _134 * _130;
    bool _148 = _134 >= _128;
    bool _150 = !_144;
    bool _152 = _148 || _150;
    out.m_51.x = _146;
    float _154 = _126;
    float _156 = _146;
    float _158 = _134;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _154;
    if (_152)
    {
        out.m_47.x = 0.0;
    }
    if (_152)
    {
        float _162 = _160 * 5.0;
        _124 = as_type<int>(_162);
    }
    int _164 = _124;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2358 = as_type<float>(_164);
        out.gl_Position.z = _2358;
    }
    if (_152)
    {
        return out;
    }
    float _166 = in.m_53.y;
    float _168 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _170 = in.m_55.w;
    bool _172 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _174 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _176 = _172 || _174;
    bool _178 = isnan(1.0);
    bool _180 = _176 || _178;
    float _182 = in.m_49.x;
    float _184 = in.m_49.y;
    float _186 = in.m_49.z;
    float _188 = in.m_44.x;
    float _190 = in.m_44.y;
    float _192 = in.m_44.z;
    float _194 = 0.0;
    float _196 = _168;
    if (!_180)
    {
        float _198 = _168 * _168;
        float _200 = _198 * 0.5;
        _194 = _200;
    }
    float _202 = _194;
    float _204 = _202;
    if (!_180)
    {
        float _206 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _206;
    }
    float _208 = _204;
    out.m_57.y = _166;
    bool _210 = !_180;
    float _212 = _208;
    float _214 = _166;
    if (!_210)
    {
        float _216 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = log2(_216);
        float _220 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _222 = _220 + 1.0;
        float _224 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = _168 * _218;
        float _228 = 1.0 / _222;
        float _230 = _224 * 0.693147182464599609375;
        float _232 = exp2(_226);
        float _234 = 1.0 / _230;
        float _236 = _232 + (-1.0);
        float _238 = -_236;
        float _240 = fma(_238, _234, _168);
        float _242 = _240 * _228;
        float _244 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _244;
    }
    float _246 = _212;
    bool _248 = !_180;
    if (!_248)
    {
        float _250 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _252 = log2(_250);
        float _254 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _256 = _254 + 1.0;
        float _258 = 1.0 / _256;
        float _260 = _168 * _252;
        float _262 = exp2(_260);
        float _264 = -_262;
        float _266 = _264 + 1.0;
        float _268 = _266 * _258;
        _196 = _268;
    }
    float _270 = _196;
    bool _272 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _274 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _276 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _278 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _280 = fma(_270, _182, _274);
    float _282 = fma(_270, _184, _276);
    float _284 = fma(_270, _186, _278);
    float _286 = fma(_280, _170, _188);
    float _288 = fma(_282, _170, _190);
    float _290 = fma(_284, _170, _192);
    bool _292 = !_272;
    float _310;
    if (!_292)
    {
        float _294 = in.m_59.x;
        float _296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _298 = _294 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _302 = _300 * _296;
        float _304 = floor(_302);
        float _306 = -_304;
        float _308 = _302 + _306;
        _310 = _308;
        _312 = true;
    }
    else
    {
        _310 = _146;
    }
    _312 = false;
    float _314 = _310;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _318 = _314 + _316;
    bool _320 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _322 = isnan(_314);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _334 = _314 + _332;
    bool _336 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _338 = isnan(_314);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _348;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _356 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _358 = isnan(_314);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -_330;
    float _370 = _368 + 1.0;
    float _372 = 1.0 / _354;
    float _374 = _366 * _370;
    float _376 = -_366;
    float _378 = _376 + 1.0;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _380;
    bool _384 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _386 = 1.0 / _350;
    float _388 = _346 * _378;
    float _390 = -_346;
    float _392 = _390 + 1.0;
    float _394 = _334 * _372;
    float _396 = _318 * _386;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _398;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _402;
    float _406 = fma(_382, _396, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _408 = fma(_400, _396, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _410 = fma(_404, _396, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _412 = in.m_55.x;
    float _414 = in.m_55.y;
    float _416 = in.m_55.z;
    float _418 = _406 * _388;
    float _420 = _408 * _388;
    float _422 = _410 * _388;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _436 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].y, _420);
    float _438 = fma(_426, _394, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _440 = fma(_430, _394, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _442 = fma(_434, _394, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _444 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].x, _418);
    float _446 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].z, _422);
    float _448 = fma(_438, _374, _436);
    float _450 = fma(_440, _374, _444);
    float _452 = fma(_442, _374, _446);
    float _454 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[145].y, _448);
    float _456 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[145].x, _450);
    float _458 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[145].z, _452);
    float _460 = _456 * _412;
    float _462 = _454 * _414;
    float _464 = _458 * _416;
    bool _466 = !_384;
    if (!_466)
    {
        float _468 = in.m_59.x;
        float _470 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _472 = _468 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _474 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _476 = _474 * _470;
        float _478 = floor(_476);
        float _480 = -_478;
        float _482 = _476 + _480;
        _156 = _482;
    }
    float _484 = _156;
    float _486 = in.m_59.y;
    float _488 = _462 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _490 = in.m_59.z;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _496 = _494 != 0;
    float _498 = in.m_59.x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _502 = _460 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _506 = _504 != 0;
    int _508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _510 = _508 != 0;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _514 = _512 != 0;
    float _516 = _464 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _518 = !_510;
    int _520 = _518 ? 0 : 1;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _524 = !_514;
    int _526 = _524 ? 0 : 1;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _530 = _486 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _532 = _490 * 2.0;
    float _534 = fma(_530, -2.0, _492);
    float _536 = _486 * 2.0;
    float _538 = _498 * 2.0;
    float _540 = floor(_532);
    float _542 = _498 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _544 = -_500;
    float _546 = fma(_542, 2.0, _544);
    float _548 = floor(_538);
    float _550 = _498 + _486;
    float _552 = -_134;
    float _554 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[76].x, _546);
    float _556 = _550 + (-1.0);
    float _558 = floor(_536);
    bool _560 = _540 > 0.0;
    float _562 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _564 = _540 >= 0.0;
    bool _566 = isnan(_540);
    bool _568 = _564 || _566;
    bool _570 = isnan(0.0);
    bool _572 = _568 || _570;
    float _574 = _540;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    float _578 = _556;
    bool _580 = _510;
    if (!_496)
    {
        _574 = _486;
    }
    float _582 = _574;
    float _584 = _582;
    if (!_496)
    {
        _576 = _490;
    }
    float _586 = _576;
    float _588 = _586;
    if (!_496)
    {
        _578 = _490;
    }
    float _590 = _578;
    float _592 = _590;
    if (_496)
    {
        _584 = _498;
    }
    float _594 = _584;
    if (_496)
    {
        _588 = _486;
    }
    float _596 = _588;
    if (_496)
    {
        _592 = _486;
    }
    float _598 = _592;
    bool _600 = _548 > 0.0;
    float _602 = _596 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _604 = _548 >= 0.0;
    bool _606 = isnan(_548);
    bool _608 = _604 || _606;
    bool _610 = isnan(0.0);
    bool _612 = _608 || _610;
    float _614 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[83].w, _522);
    bool _616 = !_506;
    int _618 = _616 ? 0 : 1;
    int _620 = _572 ? 0 : 1;
    float _622 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _614);
    bool _624 = _558 > 0.0;
    bool _626 = _558 >= 0.0;
    bool _628 = isnan(_558);
    bool _630 = _626 || _628;
    bool _632 = isnan(0.0);
    bool _634 = _630 || _632;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _638 = _634 ? 0 : 1;
    float _640 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[83].z, _636);
    float _642 = _594 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _644 = ~_620;
    int _646 = _644 + 1;
    int _648 = _646 + 1;
    float _650 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _652 = log2(_650);
    int _654 = abs(_618);
    float _656 = -_528;
    float _658 = fma(_642, 2.0, _656);
    int _660 = _648;
    if (!_560)
    {
        int _662 = ~_620;
        int _664 = _662 + 1;
        _660 = _664;
    }
    int _666 = _660;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _670 = ~_638;
    int _672 = _670 + 1;
    int _674 = _672 + 1;
    float _676 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _640);
    int _678 = _674;
    if (!_624)
    {
        int _680 = ~_638;
        int _682 = _680 + 1;
        _678 = _682;
    }
    int _684 = _678;
    float _686 = fma(_602, -2.0, _668);
    float _688 = float(_654);
    float _690 = float(_666);
    int _692 = _612 ? 0 : 1;
    float _694 = _652 * _134;
    float _696 = _688 * _690;
    float _698 = in.m_61.x;
    float _700 = in.m_61.y;
    float _702 = in.m_61.z;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _706 = ~_692;
    int _708 = _706 + 1;
    int _710 = _708 + 1;
    float _712 = exp2(_694);
    int _714 = _710;
    if (!_600)
    {
        int _716 = ~_692;
        int _718 = _716 + 1;
        _714 = _718;
    }
    int _720 = _714;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _724 = 1.0 + _722;
    float _726 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[78].z, _704);
    bool _728 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _730 = isnan(1.0);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _736 = _732 || _734;
    float _738 = _696 * (-2.0);
    bool _740 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _742 = isnan(0.0);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _748 = _744 || _746;
    float _750 = 1.0 / _724;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _754 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _726);
    int _756 = abs(_520);
    float _758 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _534);
    float _760 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[78].w, _752);
    float _762 = _498 + (-0.5);
    float _764 = float(_756);
    float _766 = -_712;
    float _768 = _766 + 1.0;
    float _770 = float(_720);
    float _772 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _760);
    float _774 = -_134;
    float _776 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[81].x, _658);
    float _778 = fma(_738, _698, _698);
    float _780 = _748 ? _768 : 0.0;
    float _782 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _686);
    float _784 = fma(_562, _738, _562);
    float _786 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[196].x, _778);
    int _788 = abs(_526);
    if (_736)
    {
        float _790 = _780 * _750;
        _158 = _790;
    }
    float _792 = _158;
    float _794 = _486 + _490;
    float _796 = _764 * _770;
    float _798 = fma(_784, _792, _786);
    float _800 = float(_788);
    float _802 = _794 + (-1.0);
    float _804 = float(_684);
    float _806 = _796 * (-2.0);
    float _808 = _798 * 0.15915493667125701904296875;
    float _810 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _812 = _498 + _490;
    float _814 = _800 * _804;
    float _816 = _486 + (-0.5);
    float _818 = fma(_806, _700, _700);
    float _820 = fma(_810, _806, _810);
    float _822 = _812 + (-1.0);
    float _824 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[196].y, _818);
    float _826 = _814 * (-2.0);
    float _828 = _808 * 6.283185482025146484375;
    float _830 = sin(_828);
    float _832 = fma(_820, _792, _824);
    float _834 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _836 = fma(_826, _702, _702);
    float _838 = _490 + (-0.5);
    float _840 = _832 * 0.15915493667125701904296875;
    float _842 = fma(_834, _826, _834);
    float _844 = _808 * 6.283185482025146484375;
    float _846 = cos(_844);
    float _848 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[196].z, _836);
    float _850 = fma(_842, _792, _848);
    float _852 = _840 * 6.283185482025146484375;
    float _854 = sin(_852);
    float _856 = in.m_63.x;
    float _858 = in.m_63.y;
    float _860 = in.m_63.z;
    float _862 = _850 * 0.15915493667125701904296875;
    bool _864 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _866 = isnan(0.5);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _872 = _868 || _870;
    float _874 = _840 * 6.283185482025146484375;
    float _876 = cos(_874);
    float _878 = _862 * 6.283185482025146484375;
    float _880 = cos(_878);
    float _882 = _830 * _854;
    float _884 = _846 * _854;
    float _886 = _288 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _888 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[6].x, _886);
    float _890 = _862 * 6.283185482025146484375;
    float _892 = sin(_890);
    float _894 = _830 * _876;
    float _896 = _846 * _876;
    float _898 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _860);
    float _900 = _288 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _902 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[6].z, _888);
    float _904 = _516 * _898;
    float _906 = _830 * _880;
    float _908 = _876 * _880;
    float _910 = _846 * _880;
    float _912 = _854 * _880;
    float _914 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _858);
    float _916 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _856);
    float _918 = _902 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _920 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[5].x, _900);
    float _922 = _488 * _914;
    float _924 = -_884;
    float _926 = fma(_892, _894, _924);
    float _928 = -_894;
    float _930 = fma(_892, _884, _928);
    float _932 = fma(_892, _896, _882);
    float _934 = _502 * _916;
    float _936 = _910 * _922;
    float _938 = fma(_892, _882, _896);
    float _940 = -_922;
    float _942 = _892 * _940;
    float _944 = _906 * _922;
    float _946 = fma(_932, _934, _936);
    float _948 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[5].z, _920);
    float _950 = fma(_908, _934, _942);
    float _952 = fma(_926, _934, _944);
    float _954 = fma(_930, _904, _946);
    float _956 = _948 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _958 = fma(_912, _904, _950);
    float _960 = fma(_938, _904, _952);
    float _962 = _288 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _964 = _954 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _966 = _954 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _968 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[4].x, _962);
    float _970 = fma(_958, (*spvDescriptorSet0.vp_c10)._m0[10].x, _964);
    float _972 = fma(_958, (*spvDescriptorSet0.vp_c10)._m0[8].x, _966);
    float _974 = _956 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _976 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[4].z, _968);
    float _978 = fma(_960, (*spvDescriptorSet0.vp_c10)._m0[10].z, _970);
    float _980 = fma(_960, (*spvDescriptorSet0.vp_c10)._m0[8].z, _972);
    float _982 = _976 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _984 = _918 + _978;
    float _986 = _982 + _980;
    float _988 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _990 = _984 + _988;
    float _992 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[11].x, _974);
    float _994 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _996 = _986 + _994;
    float _998 = _990 * _990;
    float _1000 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[11].z, _992);
    float _1002 = _956 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1004 = fma(_996, _996, _998);
    float _1006 = _1000 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1008 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1002);
    float _1010 = sqrt(_1004);
    float _1012 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1008);
    float _1014 = _954 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1016 = _1012 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1018 = fma(_958, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1014);
    float _1020 = 1.0 / _1006;
    float _1022 = _1014;
    float _1024 = _954;
    float _1026 = _960;
    float _1028 = _986;
    if (_872)
    {
        _1022 = 1.0;
    }
    float _1030 = _1022;
    float _1032 = _1016 + _1006;
    float _1034 = fma(_960, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1018);
    float _1036 = _956 + _1034;
    bool _1038 = _1010 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1040 = _1032 * _1020;
    float _1042 = _1040 * 0.5;
    float _1044 = _1034;
    float _1046 = _1030;
    float _1048 = _1036;
    if (!_1038)
    {
        _1044 = _986;
    }
    float _1050 = _1044;
    float _1052 = _1050;
    if (!_1038)
    {
        _1024 = _984;
    }
    float _1054 = _1024;
    float _1056 = _1054;
    if (!_1038)
    {
        _1026 = _1036;
    }
    float _1058 = _1026;
    bool _1060 = !_1038;
    float _1062 = _1058;
    if (!_1060)
    {
        float _1064 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1066 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1068 = _1010 + _1066;
        float _1070 = _1036 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1072 = rsqrt(_1004);
        float _1074 = _1068 * _1064;
        float _1076 = _1074 * 0.15915493667125701904296875;
        float _1078 = _1076 * 6.283185482025146484375;
        float _1080 = cos(_1078);
        float _1082 = _1076 * 6.283185482025146484375;
        float _1084 = sin(_1082);
        float _1086 = _1080 + (-1.0);
        float _1088 = _1086 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1090 = fma(_1084, _1070, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1092 = fma(_1036, _1080, _1088);
        float _1094 = _1072 * _1090;
        float _1096 = fma(_996, _1094, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1098 = fma(_990, _1094, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1062 = _1092;
        _1052 = _1096;
        _1056 = _1098;
        _1028 = _1094;
    }
    float _1100 = _1062;
    float _1102 = _1052;
    float _1104 = _1056;
    float _1106 = _1028;
    float _1108 = _1106;
    if (!_872)
    {
        float _1110 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1112 = _1110 * 0.15915493667125701904296875;
        float _1114 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1116 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1118 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1116);
        float _1120 = _1112 * 6.283185482025146484375;
        float _1122 = cos(_1120);
        float _1124 = _1114 * 0.15915493667125701904296875;
        float _1126 = _1112 * 6.283185482025146484375;
        float _1128 = sin(_1126);
        float _1130 = 1.0 / _1122;
        float _1132 = _1124 * 6.283185482025146484375;
        float _1134 = cos(_1132);
        float _1136 = _1128 * _1130;
        float _1138 = _1124 * 6.283185482025146484375;
        float _1140 = sin(_1138);
        float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1144 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1142;
        float _1146 = _1134 * _1136;
        float _1148 = 1.0 / _1118;
        float _1150 = 1.0 / _1146;
        float _1152 = 1.0 / _1144;
        float _1154 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1156 = _1148 * _1154;
        float _1158 = _1140 * _1150;
        float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1162 = fma(_1158, _1156, _1160);
        float _1164 = _1162 * _1152;
        float _1166 = precise::clamp(_1164, 0.0, 1.0);
        _1108 = _1152;
        _1046 = _1166;
    }
    float _1168 = _1108;
    float _1170 = _1046;
    float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1174 = _1100 + _1172;
    float _1176 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1178 = _1102 + _1176;
    float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1182 = _1104 + _1180;
    float _1184 = _1174 * _1174;
    float _1186 = fma(_1178, _1178, _1184);
    float _1188 = fma(_1182, _1182, _1186);
    float _1190 = rsqrt(_1188);
    float _1192 = sqrt(_1188);
    float _1194 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1196 = _1178 * _1194;
    float _1198 = _1182 * _1194;
    float _1200 = _1196 * _1196;
    float _1202 = _1198 * _1198;
    float _1204 = _1200 + _1202;
    float _1206 = sqrt(_1204);
    bool _1208 = _1206 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1212 = _1206 + _1210;
    float _1214 = _1168;
    float _1216 = _1204;
    float _1218 = _1212;
    float _1220 = _1174;
    float _1222 = _1196;
    float _1224 = _1198;
    float _1226 = _1200;
    float _1228 = _1202;
    if (_1208)
    {
        float _1230 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1214 = _1230;
    }
    float _1232 = _1214;
    if (_1208)
    {
        float _1234 = rsqrt(_1204);
        _1216 = _1234;
    }
    float _1236 = _1216;
    if (_1208)
    {
        float _1238 = _1212 * _1232;
        _1218 = _1238;
    }
    float _1240 = _1218;
    if (_1208)
    {
        float _1242 = _1240 * 0.15915493667125701904296875;
        _1048 = _1242;
    }
    float _1244 = _1048;
    float _1246 = _982;
    if (_1208)
    {
        float _1248 = _1244 * 6.283185482025146484375;
        float _1250 = sin(_1248);
        _1246 = _1250;
    }
    float _1252 = _1246;
    float _1254 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1256 = precise::max(0.0, _1254);
    float _1258 = _1006;
    float _1260 = _1254;
    float _1262 = _1256;
    if (_1208)
    {
        float _1264 = _1244 * 6.283185482025146484375;
        float _1266 = cos(_1264);
        _1258 = _1266;
    }
    float _1268 = _1258;
    float _1270 = -_1194;
    float _1272 = -_1256;
    float _1274 = fma(_1174, _1270, _1272);
    if (_1208)
    {
        float _1276 = _1274 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1220 = _1276;
    }
    float _1278 = _1220;
    float _1280 = _1252;
    float _1282 = _1278;
    if (_1208)
    {
        float _1284 = fma(_1252, _1278, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1280 = _1284;
    }
    float _1286 = _1280;
    float _1288 = _1286;
    if (!_1208)
    {
        _1282 = _1274;
    }
    float _1290 = _1282;
    float _1292 = _1290;
    if (_1208)
    {
        float _1294 = _1268 + (-1.0);
        _1260 = _1294;
    }
    float _1296 = _1260;
    if (_1208)
    {
        float _1298 = _1236 * _1286;
        _1288 = _1298;
    }
    float _1300 = _1288;
    float _1302 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    if (_1208)
    {
        float _1304 = _1296 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1262 = _1304;
    }
    float _1306 = _1262;
    if (_1208)
    {
        float _1308 = _1196 * _1300;
        _1222 = _1308;
    }
    float _1310 = _1222;
    if (_1208)
    {
        float _1312 = _1198 * _1300;
        _1224 = _1312;
    }
    float _1314 = _1224;
    float _1316 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1208)
    {
        float _1318 = fma(_1274, _1268, _1306);
        _1292 = _1318;
    }
    float _1320 = _1292;
    if (_1208)
    {
        float _1322 = _1310 * _1310;
        _1226 = _1322;
    }
    float _1324 = _1226;
    if (_1208)
    {
        float _1326 = _1314 * _1314;
        _1228 = _1326;
    }
    float _1328 = _1228;
    float _1330 = fma(_1320, _1320, _1324);
    float _1332 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1334 = fma(_1192, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1332);
    float _1336 = precise::clamp(_1334, 0.0, 1.0);
    float _1338 = _1330 + _1328;
    float _1340 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1316);
    float _1342 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1344 = -_1336;
    float _1346 = _1344 + 1.0;
    float _1348 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1350 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1340);
    float _1352 = rsqrt(_1338);
    float _1354 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1356 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1342);
    float _1358 = _1350 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1360 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1348);
    float _1362 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1354);
    float _1364 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1356);
    float _1366 = _1358 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1368 = abs(_1346);
    float _1370 = log2(_1368);
    float _1372 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1362);
    float _1374 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1376 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1360);
    float _1378 = -_1366;
    float _1380 = fma(_1378, _1302, 1.0);
    float _1382 = _1372 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1384 = _1374 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1386 = _1376 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1388 = _1352 * _1310;
    float _1390 = _1352 * _1320;
    float _1392 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1384);
    float _1394 = _1352 * _1314;
    float _1396 = _1388 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1398 = log2(_1380);
    float _1400 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1392);
    float _1402 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1404 = -_1396;
    float _1406 = fma(_1390, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1404);
    float _1408 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1400);
    float _1410 = _1374 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1412 = exp2(_1402);
    float _1414 = -_1394;
    float _1416 = fma(_1414, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1406);
    float _1418 = _1374 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1420 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1410);
    float _1422 = fma(_1416, -0.5, 0.5);
    float _1424 = fma(_1416, 0.5, 0.5);
    float _1426 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1418);
    float _1428 = 1.0 / _1408;
    float _1430 = _1390 + 1.0;
    float _1432 = fma(_1424, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1434 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1426);
    float _1436 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1420);
    float _1438 = _1398 * 0.693147182464599609375;
    float _1440 = fma(_1424, _1432, -0.212114393711090087890625);
    float _1442 = sqrt(_1422);
    float _1444 = -_1390;
    float _1446 = fma(_1412, _1430, _1444);
    float _1448 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1434);
    float _1450 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1436);
    float _1452 = fma(_1424, _1440, 1.570728778839111328125);
    float _1454 = _1438 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1456 = _1448 * _1428;
    float _1458 = _1450 * _1428;
    float _1460 = fma(_1456, 0.5, 0.5);
    float _1462 = fma(_1458, -0.5, 0.5);
    float _1464 = fma(_1446, 0.5, 0.5);
    float _1466 = _1442 * 0.636619746685028076171875;
    float _1468 = -_1452;
    float _1470 = fma(_1466, _1468, 1.0);
    float3 _4430 = float3(_1460, _1462, _1454);
    float _1472 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4430, float3(0.0), isnan(_4430)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4430, float3(0.0), isnan(_4430)), level(0.0)).x;
    float3 _4441 = float3(_1460, _1462, _1454);
    float4 _1475 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4441, float3(0.0), isnan(_4441)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4441, float3(0.0), isnan(_4441)), level(0.0)).xyzw;
    float _1477 = _1475.x;
    float _1479 = _1475.y;
    float _1481 = _1475.z;
    float _1483 = _1475.w;
    float2 _4458 = float2(_1470, _1464);
    float3 _1487 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4458, float2(0.0), isnan(_4458)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4458, float2(0.0), isnan(_4458)), level(0.0)).xyz;
    float _1489 = _1487.x;
    float _1491 = _1487.y;
    float _1493 = _1487.z;
    float _1495 = in.m_59.w;
    float _1497 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1499 = _484 + _1497;
    float _1501 = in.m_65.w;
    bool _1503 = _486 > 0.5;
    float _1505 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1507 = _1505 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1511 = _1509 != 0;
    out.m_67.x = _502;
    out.m_67.y = _488;
    out.m_67.z = _516;
    int _1513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1515 = _1513 != 0;
    float _1517 = -_166;
    float _1519 = _1517 + 1.0;
    int _1521 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1523 = _1521 != 0;
    float _1525 = 1.0 / _1507;
    int _1527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1529 = _1527 != 0;
    float _1531 = in.m_53.x;
    float _1533 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_69.x = _1102;
    out.m_69.y = _1100;
    out.m_69.z = _1104;
    float _1535 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1537 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1535;
    float _1539 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1541 = _1495 > 0.5;
    float _1543 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1545 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_71.w = _1501;
    bool _1547 = _1541;
    float _1549 = _1539;
    float _1551 = _1408;
    float _1553 = _1450;
    float _1555 = _1448;
    if (_1511)
    {
        bool _1557 = _498 > 0.5;
        _580 = _1557;
    }
    bool _1559 = _580;
    float _1561 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1563 = _1561 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1565 = _1537 * _1525;
    float _1567 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1569 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1571 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1573 = _1571 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _1575 = _1541 ? as_type<int>(_1519) : as_type<int>(_166);
    float _1577 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1579 = as_type<int>(_1569);
    if (_1515)
    {
        bool _1581 = _490 > 0.5;
        _1547 = _1581;
    }
    bool _1583 = _1547;
    float _1585 = _1543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1587 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1589 = isnan(_484);
    bool _1591 = _1587 || _1589;
    bool _1593 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1595 = _1591 || _1593;
    float _1597 = float(_1595);
    float _1599 = _1545 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1601 = 1.0 / _1563;
    float _1603 = _1567 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1605 = fma(_1565, _1499, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1607 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1609 = isnan(_484);
    bool _1611 = _1607 || _1609;
    bool _1613 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1615 = _1611 || _1613;
    float _1617 = float(_1615);
    float _1619 = -_1597;
    float _1621 = _1619 + 1.0;
    bool _1623 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1625 = isnan(_484);
    bool _1627 = _1623 || _1625;
    bool _1629 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1631 = _1627 || _1629;
    float _1633 = float(_1631);
    out.m_73.x = _1585;
    out.m_73.y = _1599;
    out.m_73.z = _1603;
    out.m_73.w = _1577;
    float _1635 = _1523 ? as_type<float>(_1575) : _166;
    float _1637 = exp2(_1533);
    if (_1529)
    {
        float _1639 = _1503 ? _1519 : _166;
        _214 = _1639;
    }
    float _1641 = _214;
    bool _1643 = _858 != 0.0;
    bool _1645 = isnan(_858);
    bool _1647 = _1643 || _1645;
    bool _1649 = isnan(0.0);
    bool _1651 = _1647 || _1649;
    bool _1653 = _856 == 0.0;
    bool _1655 = !_1651;
    bool _1657 = _1653 && _1655;
    float _1659 = _1573 * _1601;
    float _1661 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1663 = _484 + _1661;
    float _1665 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1667 = _1539 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1669 = fma(_1659, _1663, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1671 = _1617 * _1621;
    float _1673 = -_1617;
    float _1675 = _1673 + 1.0;
    float _1677 = _1569 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1679 = fma(_1635, _1667, -0.5);
    bool _1681 = _860 == 0.0;
    bool _1683 = _1681 && _1657;
    float _1685 = _1633 * _1675;
    float _1687 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1689 = as_type<int>(_1663);
    float _1691 = _1531;
    if (_1511)
    {
        float _1693 = -_1531;
        float _1695 = _1693 + 1.0;
        _1579 = as_type<int>(_1695);
    }
    int _1697 = _1579;
    if (_1515)
    {
        float _1699 = -_1531;
        float _1701 = _1699 + 1.0;
        _1689 = as_type<int>(_1701);
    }
    int _1703 = _1689;
    float _1705 = _1605 * _1685;
    float _1707 = fma(_1677, _1641, -0.5);
    if (!_1511)
    {
        _1549 = _1531;
    }
    float _1709 = _1549;
    float _1711 = in.m_75.x;
    float _1713 = in.m_75.y;
    float _1715 = in.m_75.z;
    float _1717 = _1709;
    if (_1511)
    {
        float _1719 = _1559 ? as_type<float>(_1697) : _1531;
        _1717 = _1719;
    }
    float _1721 = _1717;
    float _1723 = _1665 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1515)
    {
        float _1725 = _1583 ? as_type<float>(_1703) : _1531;
        _1691 = _1725;
    }
    float _1727 = _1691;
    float _1729 = -_1633;
    float _1731 = _1729 + 1.0;
    float _1733 = -_782;
    float _1735 = fma(_622, _1679, _1733);
    float _1737 = fma(_1723, _1721, -0.5);
    float _1739 = -_758;
    float _1741 = fma(_772, _1707, _1739);
    float _1743 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1705);
    float _1745 = _1687 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1747 = fma(_754, _1737, _554);
    float _1749 = fma(_1669, _1671, _1743);
    float _1751 = fma(_1745, _1727, -0.5);
    float _1753 = -_1637;
    float _1755 = _1753 + 1.0;
    float _1757 = fma(_1597, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1749);
    float _1759 = fma(_676, _1751, _776);
    float _1761 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1763 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1765 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1767 = _1741 + 0.5;
    float _1769 = _1755 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1771 = _1713;
    float _1773 = _1711;
    float _1775 = _1715;
    if (!_1683)
    {
        float _1777 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1713);
        _1771 = _1777;
    }
    float _1779 = _1771;
    float _1781 = _1374 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    if (!_1683)
    {
        float _1783 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1711);
        _1773 = _1783;
    }
    float _1785 = _1773;
    if (!_1683)
    {
        float _1787 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1715);
        _1775 = _1787;
    }
    float _1789 = _1775;
    float _1791 = -_1779;
    float _1793 = _892 * _1791;
    float _1795 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1781);
    float _1797 = _910 * _1779;
    float _1799 = _906 * _1779;
    float _1801 = fma(_908, _1785, _1793);
    float _1803 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1795);
    float _1805 = fma(_932, _1785, _1797);
    float _1807 = fma(_926, _1785, _1799);
    float _1809 = fma(_912, _1789, _1801);
    float _1811 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1803);
    float _1813 = fma(_930, _1789, _1805);
    float _1815 = _1735 + 0.5;
    float _1817 = _1761 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1819 = _1811 + _1408;
    float _1821 = _1763 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1823 = _1765 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1825 = _1757 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1827 = fma(_938, _1789, _1807);
    float _1829 = _1819 * 0.5;
    float _1831 = _1813 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1833 = _1813 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1835 = _1813 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_77.x = _1817;
    out.m_77.y = _1821;
    out.m_77.z = _1823;
    out.m_77.w = _1825;
    float _1837 = fma(_1809, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1831);
    float _1839 = fma(_1809, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1833);
    float _1841 = fma(_1809, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1835);
    float _1843 = fma(_1827, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1837);
    float _1845 = fma(_1827, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1839);
    float _1847 = fma(_1827, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1841);
    bool _1849 = _1192 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1851 = isnan(_1192);
    bool _1853 = _1849 || _1851;
    bool _1855 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1857 = _1853 || _1855;
    out.m_79.z = _1829;
    out.m_79.w = _1408;
    float _1859 = _1747 + 0.5;
    float _1861 = _1759 + 0.5;
    out.m_81.x = _1843;
    out.m_81.y = _1845;
    out.m_81.z = _1847;
    out.m_83.x = _1859;
    out.m_83.y = _1767;
    out.m_83.z = _1861;
    out.m_83.w = _1815;
    out.gl_Position.x = _1448;
    out.gl_Position.y = _1450;
    out.gl_Position.z = _1811;
    out.gl_Position.w = _1408;
    float _1863 = _1839;
    float _1865 = _1811;
    if (!_1857)
    {
        _1863 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1867 = _1863;
    float _1869 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1871 = _1867;
    float _1873 = _1867;
    if (!_1857)
    {
        _1551 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1875 = _1551;
    float _1877 = _1875;
    float _1879 = _1875;
    if (!_1857)
    {
        _1865 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1881 = _1865;
    float _1883 = _1881;
    float _1885 = _1881;
    if (!_1857)
    {
        _1553 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1887 = _1553;
    float _1889 = _1887;
    float _1891 = _1887;
    if (!_1857)
    {
        _1555 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1893 = _1555;
    float _1895 = _1769 * _1472;
    float _1897 = -_1769;
    float _1899 = _1897 + 1.0;
    float _1901 = _1483 * _1895;
    float _1903 = _1493 * _1895;
    float _1905 = _1483 * _1899;
    float _1907 = _1895;
    float _1909 = _1893;
    float _1911 = _1893;
    if (!_1857)
    {
        _1907 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1913 = _1907;
    float _1915 = fma(_1489, _1901, _1477);
    float _1917 = fma(_1491, _1901, _1479);
    float _1919 = fma(_1483, _1903, _1481);
    out.m_85.x = _1915;
    out.m_85.y = _1917;
    out.m_85.z = _1919;
    out.m_85.w = _1905;
    bool _1921 = !_1857;
    float _1923 = _1913;
    float _1925 = _1913;
    if (!_1921)
    {
        bool _1927 = _1192 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1929 = isnan(_1192);
        bool _1931 = _1927 || _1929;
        bool _1933 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1935 = _1931 || _1933;
        if (!_1935)
        {
            float _1937 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1939 = _1192 + _1937;
            float _1941 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1943 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1941;
            float _1945 = 1.0 / _1943;
            float _1947 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1949 = _1947 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1951 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1953 = _1951 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1955 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1957 = _1955 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1959 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1961 = _1959 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1963 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1965 = _1963 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1967 = _1939 * _1945;
            float _1969 = precise::clamp(_1967, 0.0, 1.0);
            float _1971 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1973 = _1971 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1975 = fma(_1969, _1949, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1977 = fma(_1969, _1973, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1979 = fma(_1969, _1953, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1981 = fma(_1969, _1957, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1983 = fma(_1969, _1961, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1985 = fma(_1969, _1965, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1925 = _1977;
            _1891 = _1983;
            _1873 = _1975;
            _1885 = _1981;
            _1879 = _1979;
            _1911 = _1985;
            _1987 = true;
        }
        else
        {
            bool _1989 = _1192 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1991 = isnan(_1192);
            bool _1993 = _1989 || _1991;
            bool _1995 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1997 = _1993 || _1995;
            if (!_1997)
            {
                _1871 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1999 = _1871;
            _1873 = _1999;
            if (!_1997)
            {
                _1923 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2001 = _1923;
            _1925 = _2001;
            if (!_1997)
            {
                _1877 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2003 = _1877;
            _1879 = _2003;
            if (!_1997)
            {
                _1883 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2005 = _1883;
            _1885 = _2005;
            if (!_1997)
            {
                _1889 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2007 = _1889;
            _1891 = _2007;
            if (!_1997)
            {
                _1909 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2009 = _1909;
            bool _2011 = !_1997;
            _1911 = _2009;
            if (!_2011)
            {
                bool _2013 = _1192 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2015 = isnan(_1192);
                bool _2017 = _2013 || _2015;
                bool _2019 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2021 = _2017 || _2019;
                if (!_2021)
                {
                    float _2023 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2025 = _1192 + _2023;
                    float _2027 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2029 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2027;
                    float _2031 = 1.0 / _2029;
                    float _2033 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2035 = _2033 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2037 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2039 = _2037 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2041 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2043 = _2041 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2045 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2047 = _2045 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2051 = _2049 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2053 = _2025 * _2031;
                    float _2055 = precise::clamp(_2053, 0.0, 1.0);
                    float _2057 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2059 = _2057 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2061 = fma(_2055, _2035, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2063 = fma(_2055, _2059, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2065 = fma(_2055, _2039, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2067 = fma(_2055, _2043, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2069 = fma(_2055, _2047, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2071 = fma(_2055, _2051, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1925 = _2063;
                    _1891 = _2069;
                    _1873 = _2061;
                    _1885 = _2067;
                    _1879 = _2065;
                    _1911 = _2071;
                    _1987 = true;
                }
                else
                {
                    _1925 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1891 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1873 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1885 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1879 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1911 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1987 = false;
    float _2073 = _1925;
    float _2075 = _1891;
    float _2077 = _1873;
    float _2079 = _1885;
    float _2081 = _1879;
    float _2083 = _1911;
    float _2085 = fma(_1845, -0.5, 0.5);
    float _2087 = precise::clamp(_2085, 0.0, 1.0);
    float _2089 = -_2073;
    float _2091 = _2089 + _2075;
    float _2093 = _1869 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2095 = -_2077;
    float _2097 = _2095 + _2079;
    float _2099 = fma(_2087, _2091, _2073);
    out.m_87.x = 0.0;
    float _2101 = -_2081;
    float _2103 = _2101 + _2083;
    float _2105 = fma(_2087, _2097, _2077);
    float _2107 = _2099 * 0.586610972881317138671875;
    out.m_47.x = _2093;
    bool _2109 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2111 = fma(_2087, _2103, _2081);
    float _2113 = fma(_2105, 0.298911988735198974609375, _2107);
    bool _2115 = _1170 > 0.0;
    bool _2117 = isnan(_1170);
    bool _2119 = _2115 || _2117;
    bool _2121 = isnan(0.0);
    bool _2123 = _2119 || _2121;
    float _2125 = fma(_2111, 0.114477999508380889892578125, _2113);
    float _2127 = -_2125;
    float _2129 = _2105 + _2127;
    float _2131 = -_2125;
    float _2133 = _2099 + _2131;
    float _2135 = -_2125;
    float _2137 = _2111 + _2135;
    float _2139 = fma(_2129, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2125);
    float _2141 = fma(_2133, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2125);
    float _2143 = fma(_2137, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2125);
    bool _2145 = !_2109;
    if (!_2145)
    {
        float _2147 = -_1100;
        float _2149 = _2147 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2151 = -_1102;
        float _2153 = _2151 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2155 = -_1104;
        float _2157 = _2155 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2159 = _2149 * _2149;
        float _2161 = fma(_2153, _2153, _2159);
        float _2163 = fma(_2157, _2157, _2161);
        float _2165 = sqrt(_2163);
        float _2167 = rsqrt(_2163);
        float _2169 = -_2165;
        float _2171 = _2169 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2173 = _2171 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2175 = precise::clamp(_2173, 0.0, 1.0);
        float _2177 = _2153 * _2167;
        float _2179 = _2149 * _2167;
        float _2181 = abs(_2175);
        float _2183 = log2(_2181);
        float _2185 = _2157 * _2167;
        float _2187 = _2177 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2189 = _1845 * _2179;
        float _2191 = -_2179;
        float _2193 = -_2187;
        float _2195 = fma(_2191, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2193);
        float _2197 = fma(_1843, _2177, _2189);
        float _2199 = -_2185;
        float _2201 = fma(_2199, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2195);
        float _2203 = fma(_1847, _2185, _2197);
        float _2205 = precise::clamp(_2203, 0.0, 1.0);
        float _2207 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2209 = _2201 + _2207;
        float _2211 = _2183 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2213 = _2209 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2215 = precise::clamp(_2213, 0.0, 1.0);
        float _2217 = exp2(_2211);
        float _2219 = _2217 * _2215;
        float _2221 = _2205 * _2219;
        float _2223 = _2221 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2225 = _2221 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2227 = _2221 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2223;
        out.m_87.y = _2225;
        out.m_87.z = _2227;
    }
    out.m_89.x = _2139;
    out.m_89.y = _2141;
    out.m_89.z = _2143;
    if (_2123)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2229 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2229;
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
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1987 = false;
    bool _312 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    if (!_112)
    {
        out.m_47.x = 0.0;
    }
    int _118 = 0;
    if (!_112)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2285 = as_type<float>(_122);
        out.gl_Position.z = _2285;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_49.w;
    float _128 = float(_108);
    float _130 = 1.0 / _128;
    float _132 = -_126;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_126);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = _134 * _130;
    bool _148 = _134 >= _128;
    bool _150 = !_144;
    bool _152 = _148 || _150;
    out.m_51.x = _146;
    float _154 = _126;
    float _156 = _146;
    float _158 = _134;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _154;
    if (_152)
    {
        out.m_47.x = 0.0;
    }
    if (_152)
    {
        float _162 = _160 * 5.0;
        _124 = as_type<int>(_162);
    }
    int _164 = _124;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2358 = as_type<float>(_164);
        out.gl_Position.z = _2358;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _166 = in.m_53.y;
    float _168 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _170 = in.m_55.w;
    bool _172 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _174 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _176 = _172 || _174;
    bool _178 = isnan(1.0);
    bool _180 = _176 || _178;
    float _182 = in.m_49.x;
    float _184 = in.m_49.y;
    float _186 = in.m_49.z;
    float _188 = in.m_44.x;
    float _190 = in.m_44.y;
    float _192 = in.m_44.z;
    float _194 = 0.0;
    float _196 = _168;
    if (!_180)
    {
        float _198 = _168 * _168;
        float _200 = _198 * 0.5;
        _194 = _200;
    }
    float _202 = _194;
    float _204 = _202;
    if (!_180)
    {
        float _206 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _206;
    }
    float _208 = _204;
    out.m_57.y = _166;
    bool _210 = !_180;
    float _212 = _208;
    float _214 = _166;
    if (!_210)
    {
        float _216 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = log2(_216);
        float _220 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _222 = _220 + 1.0;
        float _224 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = _168 * _218;
        float _228 = 1.0 / _222;
        float _230 = _224 * 0.693147182464599609375;
        float _232 = exp2(_226);
        float _234 = 1.0 / _230;
        float _236 = _232 + (-1.0);
        float _238 = -_236;
        float _240 = fma(_238, _234, _168);
        float _242 = _240 * _228;
        float _244 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _244;
    }
    float _246 = _212;
    bool _248 = !_180;
    if (!_248)
    {
        float _250 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _252 = log2(_250);
        float _254 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _256 = _254 + 1.0;
        float _258 = 1.0 / _256;
        float _260 = _168 * _252;
        float _262 = exp2(_260);
        float _264 = -_262;
        float _266 = _264 + 1.0;
        float _268 = _266 * _258;
        _196 = _268;
    }
    float _270 = _196;
    bool _272 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _274 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _276 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _278 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _280 = fma(_270, _182, _274);
    float _282 = fma(_270, _184, _276);
    float _284 = fma(_270, _186, _278);
    float _286 = fma(_280, _170, _188);
    float _288 = fma(_282, _170, _190);
    float _290 = fma(_284, _170, _192);
    bool _292 = !_272;
    float _310;
    if (!_292)
    {
        float _294 = in.m_59.x;
        float _296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _298 = _294 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _302 = _300 * _296;
        float _304 = floor(_302);
        float _306 = -_304;
        float _308 = _302 + _306;
        _310 = _308;
        _312 = true;
    }
    else
    {
        _310 = _146;
    }
    _312 = false;
    float _314 = _310;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _318 = _314 + _316;
    bool _320 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _322 = isnan(_314);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _334 = _314 + _332;
    bool _336 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _338 = isnan(_314);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _348;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _356 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _358 = isnan(_314);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -_330;
    float _370 = _368 + 1.0;
    float _372 = 1.0 / _354;
    float _374 = _366 * _370;
    float _376 = -_366;
    float _378 = _376 + 1.0;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _380;
    bool _384 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _386 = 1.0 / _350;
    float _388 = _346 * _378;
    float _390 = -_346;
    float _392 = _390 + 1.0;
    float _394 = _334 * _372;
    float _396 = _318 * _386;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _398;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _402;
    float _406 = fma(_382, _396, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _408 = fma(_400, _396, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _410 = fma(_404, _396, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _412 = in.m_55.x;
    float _414 = in.m_55.y;
    float _416 = in.m_55.z;
    float _418 = _406 * _388;
    float _420 = _408 * _388;
    float _422 = _410 * _388;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _436 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].y, _420);
    float _438 = fma(_426, _394, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _440 = fma(_430, _394, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _442 = fma(_434, _394, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _444 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].x, _418);
    float _446 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].z, _422);
    float _448 = fma(_438, _374, _436);
    float _450 = fma(_440, _374, _444);
    float _452 = fma(_442, _374, _446);
    float _454 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[145].y, _448);
    float _456 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[145].x, _450);
    float _458 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[145].z, _452);
    float _460 = _456 * _412;
    float _462 = _454 * _414;
    float _464 = _458 * _416;
    bool _466 = !_384;
    if (!_466)
    {
        float _468 = in.m_59.x;
        float _470 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _472 = _468 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _474 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _476 = _474 * _470;
        float _478 = floor(_476);
        float _480 = -_478;
        float _482 = _476 + _480;
        _156 = _482;
    }
    float _484 = _156;
    float _486 = in.m_59.y;
    float _488 = _462 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _490 = in.m_59.z;
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _496 = _494 != 0;
    float _498 = in.m_59.x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _502 = _460 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _506 = _504 != 0;
    int _508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _510 = _508 != 0;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _514 = _512 != 0;
    float _516 = _464 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _518 = !_510;
    int _520 = _518 ? 0 : 1;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _524 = !_514;
    int _526 = _524 ? 0 : 1;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _530 = _486 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _532 = _490 * 2.0;
    float _534 = fma(_530, -2.0, _492);
    float _536 = _486 * 2.0;
    float _538 = _498 * 2.0;
    float _540 = floor(_532);
    float _542 = _498 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _544 = -_500;
    float _546 = fma(_542, 2.0, _544);
    float _548 = floor(_538);
    float _550 = _498 + _486;
    float _552 = -_134;
    float _554 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[76].x, _546);
    float _556 = _550 + (-1.0);
    float _558 = floor(_536);
    bool _560 = _540 > 0.0;
    float _562 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _564 = _540 >= 0.0;
    bool _566 = isnan(_540);
    bool _568 = _564 || _566;
    bool _570 = isnan(0.0);
    bool _572 = _568 || _570;
    float _574 = _540;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    float _578 = _556;
    bool _580 = _510;
    if (!_496)
    {
        _574 = _486;
    }
    float _582 = _574;
    float _584 = _582;
    if (!_496)
    {
        _576 = _490;
    }
    float _586 = _576;
    float _588 = _586;
    if (!_496)
    {
        _578 = _490;
    }
    float _590 = _578;
    float _592 = _590;
    if (_496)
    {
        _584 = _498;
    }
    float _594 = _584;
    if (_496)
    {
        _588 = _486;
    }
    float _596 = _588;
    if (_496)
    {
        _592 = _486;
    }
    float _598 = _592;
    bool _600 = _548 > 0.0;
    float _602 = _596 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _604 = _548 >= 0.0;
    bool _606 = isnan(_548);
    bool _608 = _604 || _606;
    bool _610 = isnan(0.0);
    bool _612 = _608 || _610;
    float _614 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[83].w, _522);
    bool _616 = !_506;
    int _618 = _616 ? 0 : 1;
    int _620 = _572 ? 0 : 1;
    float _622 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _614);
    bool _624 = _558 > 0.0;
    bool _626 = _558 >= 0.0;
    bool _628 = isnan(_558);
    bool _630 = _626 || _628;
    bool _632 = isnan(0.0);
    bool _634 = _630 || _632;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _638 = _634 ? 0 : 1;
    float _640 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[83].z, _636);
    float _642 = _594 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _644 = ~_620;
    int _646 = _644 + 1;
    int _648 = _646 + 1;
    float _650 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _652 = log2(_650);
    int _654 = abs(_618);
    float _656 = -_528;
    float _658 = fma(_642, 2.0, _656);
    int _660 = _648;
    if (!_560)
    {
        int _662 = ~_620;
        int _664 = _662 + 1;
        _660 = _664;
    }
    int _666 = _660;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _670 = ~_638;
    int _672 = _670 + 1;
    int _674 = _672 + 1;
    float _676 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _640);
    int _678 = _674;
    if (!_624)
    {
        int _680 = ~_638;
        int _682 = _680 + 1;
        _678 = _682;
    }
    int _684 = _678;
    float _686 = fma(_602, -2.0, _668);
    float _688 = float(_654);
    float _690 = float(_666);
    int _692 = _612 ? 0 : 1;
    float _694 = _652 * _134;
    float _696 = _688 * _690;
    float _698 = in.m_61.x;
    float _700 = in.m_61.y;
    float _702 = in.m_61.z;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _706 = ~_692;
    int _708 = _706 + 1;
    int _710 = _708 + 1;
    float _712 = exp2(_694);
    int _714 = _710;
    if (!_600)
    {
        int _716 = ~_692;
        int _718 = _716 + 1;
        _714 = _718;
    }
    int _720 = _714;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _724 = 1.0 + _722;
    float _726 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[78].z, _704);
    bool _728 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _730 = isnan(1.0);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _736 = _732 || _734;
    float _738 = _696 * (-2.0);
    bool _740 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _742 = isnan(0.0);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _748 = _744 || _746;
    float _750 = 1.0 / _724;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _754 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _726);
    int _756 = abs(_520);
    float _758 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _534);
    float _760 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[78].w, _752);
    float _762 = _498 + (-0.5);
    float _764 = float(_756);
    float _766 = -_712;
    float _768 = _766 + 1.0;
    float _770 = float(_720);
    float _772 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _760);
    float _774 = -_134;
    float _776 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[81].x, _658);
    float _778 = fma(_738, _698, _698);
    float _780 = _748 ? _768 : 0.0;
    float _782 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _686);
    float _784 = fma(_562, _738, _562);
    float _786 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[196].x, _778);
    int _788 = abs(_526);
    if (_736)
    {
        float _790 = _780 * _750;
        _158 = _790;
    }
    float _792 = _158;
    float _794 = _486 + _490;
    float _796 = _764 * _770;
    float _798 = fma(_784, _792, _786);
    float _800 = float(_788);
    float _802 = _794 + (-1.0);
    float _804 = float(_684);
    float _806 = _796 * (-2.0);
    float _808 = _798 * 0.15915493667125701904296875;
    float _810 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _812 = _498 + _490;
    float _814 = _800 * _804;
    float _816 = _486 + (-0.5);
    float _818 = fma(_806, _700, _700);
    float _820 = fma(_810, _806, _810);
    float _822 = _812 + (-1.0);
    float _824 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[196].y, _818);
    float _826 = _814 * (-2.0);
    float _828 = _808 * 6.283185482025146484375;
    float _830 = sin(_828);
    float _832 = fma(_820, _792, _824);
    float _834 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _836 = fma(_826, _702, _702);
    float _838 = _490 + (-0.5);
    float _840 = _832 * 0.15915493667125701904296875;
    float _842 = fma(_834, _826, _834);
    float _844 = _808 * 6.283185482025146484375;
    float _846 = cos(_844);
    float _848 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[196].z, _836);
    float _850 = fma(_842, _792, _848);
    float _852 = _840 * 6.283185482025146484375;
    float _854 = sin(_852);
    float _856 = in.m_63.x;
    float _858 = in.m_63.y;
    float _860 = in.m_63.z;
    float _862 = _850 * 0.15915493667125701904296875;
    bool _864 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _866 = isnan(0.5);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _872 = _868 || _870;
    float _874 = _840 * 6.283185482025146484375;
    float _876 = cos(_874);
    float _878 = _862 * 6.283185482025146484375;
    float _880 = cos(_878);
    float _882 = _830 * _854;
    float _884 = _846 * _854;
    float _886 = _288 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _888 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[6].x, _886);
    float _890 = _862 * 6.283185482025146484375;
    float _892 = sin(_890);
    float _894 = _830 * _876;
    float _896 = _846 * _876;
    float _898 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _860);
    float _900 = _288 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _902 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[6].z, _888);
    float _904 = _516 * _898;
    float _906 = _830 * _880;
    float _908 = _876 * _880;
    float _910 = _846 * _880;
    float _912 = _854 * _880;
    float _914 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _858);
    float _916 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _856);
    float _918 = _902 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _920 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[5].x, _900);
    float _922 = _488 * _914;
    float _924 = -_884;
    float _926 = fma(_892, _894, _924);
    float _928 = -_894;
    float _930 = fma(_892, _884, _928);
    float _932 = fma(_892, _896, _882);
    float _934 = _502 * _916;
    float _936 = _910 * _922;
    float _938 = fma(_892, _882, _896);
    float _940 = -_922;
    float _942 = _892 * _940;
    float _944 = _906 * _922;
    float _946 = fma(_932, _934, _936);
    float _948 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[5].z, _920);
    float _950 = fma(_908, _934, _942);
    float _952 = fma(_926, _934, _944);
    float _954 = fma(_930, _904, _946);
    float _956 = _948 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _958 = fma(_912, _904, _950);
    float _960 = fma(_938, _904, _952);
    float _962 = _288 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _964 = _954 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _966 = _954 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _968 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[4].x, _962);
    float _970 = fma(_958, (*spvDescriptorSet0.vp_c10)._m0[10].x, _964);
    float _972 = fma(_958, (*spvDescriptorSet0.vp_c10)._m0[8].x, _966);
    float _974 = _956 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _976 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[4].z, _968);
    float _978 = fma(_960, (*spvDescriptorSet0.vp_c10)._m0[10].z, _970);
    float _980 = fma(_960, (*spvDescriptorSet0.vp_c10)._m0[8].z, _972);
    float _982 = _976 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _984 = _918 + _978;
    float _986 = _982 + _980;
    float _988 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _990 = _984 + _988;
    float _992 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[11].x, _974);
    float _994 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _996 = _986 + _994;
    float _998 = _990 * _990;
    float _1000 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[11].z, _992);
    float _1002 = _956 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1004 = fma(_996, _996, _998);
    float _1006 = _1000 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1008 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1002);
    float _1010 = sqrt(_1004);
    float _1012 = fma(_918, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1008);
    float _1014 = _954 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1016 = _1012 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1018 = fma(_958, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1014);
    float _1020 = 1.0 / _1006;
    float _1022 = _1014;
    float _1024 = _954;
    float _1026 = _960;
    float _1028 = _986;
    if (_872)
    {
        _1022 = 1.0;
    }
    float _1030 = _1022;
    float _1032 = _1016 + _1006;
    float _1034 = fma(_960, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1018);
    float _1036 = _956 + _1034;
    bool _1038 = _1010 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1040 = _1032 * _1020;
    float _1042 = _1040 * 0.5;
    float _1044 = _1034;
    float _1046 = _1030;
    float _1048 = _1036;
    if (!_1038)
    {
        _1044 = _986;
    }
    float _1050 = _1044;
    float _1052 = _1050;
    if (!_1038)
    {
        _1024 = _984;
    }
    float _1054 = _1024;
    float _1056 = _1054;
    if (!_1038)
    {
        _1026 = _1036;
    }
    float _1058 = _1026;
    bool _1060 = !_1038;
    float _1062 = _1058;
    if (!_1060)
    {
        float _1064 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1066 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1068 = _1010 + _1066;
        float _1070 = _1036 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1072 = rsqrt(_1004);
        float _1074 = _1068 * _1064;
        float _1076 = _1074 * 0.15915493667125701904296875;
        float _1078 = _1076 * 6.283185482025146484375;
        float _1080 = cos(_1078);
        float _1082 = _1076 * 6.283185482025146484375;
        float _1084 = sin(_1082);
        float _1086 = _1080 + (-1.0);
        float _1088 = _1086 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1090 = fma(_1084, _1070, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1092 = fma(_1036, _1080, _1088);
        float _1094 = _1072 * _1090;
        float _1096 = fma(_996, _1094, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1098 = fma(_990, _1094, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1062 = _1092;
        _1052 = _1096;
        _1056 = _1098;
        _1028 = _1094;
    }
    float _1100 = _1062;
    float _1102 = _1052;
    float _1104 = _1056;
    float _1106 = _1028;
    float _1108 = _1106;
    if (!_872)
    {
        float _1110 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1112 = _1110 * 0.15915493667125701904296875;
        float _1114 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1116 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1118 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1116);
        float _1120 = _1112 * 6.283185482025146484375;
        float _1122 = cos(_1120);
        float _1124 = _1114 * 0.15915493667125701904296875;
        float _1126 = _1112 * 6.283185482025146484375;
        float _1128 = sin(_1126);
        float _1130 = 1.0 / _1122;
        float _1132 = _1124 * 6.283185482025146484375;
        float _1134 = cos(_1132);
        float _1136 = _1128 * _1130;
        float _1138 = _1124 * 6.283185482025146484375;
        float _1140 = sin(_1138);
        float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1144 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1142;
        float _1146 = _1134 * _1136;
        float _1148 = 1.0 / _1118;
        float _1150 = 1.0 / _1146;
        float _1152 = 1.0 / _1144;
        float _1154 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1156 = _1148 * _1154;
        float _1158 = _1140 * _1150;
        float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1162 = fma(_1158, _1156, _1160);
        float _1164 = _1162 * _1152;
        float _1166 = precise::clamp(_1164, 0.0, 1.0);
        _1108 = _1152;
        _1046 = _1166;
    }
    float _1168 = _1108;
    float _1170 = _1046;
    float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1174 = _1100 + _1172;
    float _1176 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1178 = _1102 + _1176;
    float _1180 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1182 = _1104 + _1180;
    float _1184 = _1174 * _1174;
    float _1186 = fma(_1178, _1178, _1184);
    float _1188 = fma(_1182, _1182, _1186);
    float _1190 = rsqrt(_1188);
    float _1192 = sqrt(_1188);
    float _1194 = _1190 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1196 = _1178 * _1194;
    float _1198 = _1182 * _1194;
    float _1200 = _1196 * _1196;
    float _1202 = _1198 * _1198;
    float _1204 = _1200 + _1202;
    float _1206 = sqrt(_1204);
    bool _1208 = _1206 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1212 = _1206 + _1210;
    float _1214 = _1168;
    float _1216 = _1204;
    float _1218 = _1212;
    float _1220 = _1174;
    float _1222 = _1196;
    float _1224 = _1198;
    float _1226 = _1200;
    float _1228 = _1202;
    if (_1208)
    {
        float _1230 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1214 = _1230;
    }
    float _1232 = _1214;
    if (_1208)
    {
        float _1234 = rsqrt(_1204);
        _1216 = _1234;
    }
    float _1236 = _1216;
    if (_1208)
    {
        float _1238 = _1212 * _1232;
        _1218 = _1238;
    }
    float _1240 = _1218;
    if (_1208)
    {
        float _1242 = _1240 * 0.15915493667125701904296875;
        _1048 = _1242;
    }
    float _1244 = _1048;
    float _1246 = _982;
    if (_1208)
    {
        float _1248 = _1244 * 6.283185482025146484375;
        float _1250 = sin(_1248);
        _1246 = _1250;
    }
    float _1252 = _1246;
    float _1254 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1256 = precise::max(0.0, _1254);
    float _1258 = _1006;
    float _1260 = _1254;
    float _1262 = _1256;
    if (_1208)
    {
        float _1264 = _1244 * 6.283185482025146484375;
        float _1266 = cos(_1264);
        _1258 = _1266;
    }
    float _1268 = _1258;
    float _1270 = -_1194;
    float _1272 = -_1256;
    float _1274 = fma(_1174, _1270, _1272);
    if (_1208)
    {
        float _1276 = _1274 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1220 = _1276;
    }
    float _1278 = _1220;
    float _1280 = _1252;
    float _1282 = _1278;
    if (_1208)
    {
        float _1284 = fma(_1252, _1278, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1280 = _1284;
    }
    float _1286 = _1280;
    float _1288 = _1286;
    if (!_1208)
    {
        _1282 = _1274;
    }
    float _1290 = _1282;
    float _1292 = _1290;
    if (_1208)
    {
        float _1294 = _1268 + (-1.0);
        _1260 = _1294;
    }
    float _1296 = _1260;
    if (_1208)
    {
        float _1298 = _1236 * _1286;
        _1288 = _1298;
    }
    float _1300 = _1288;
    float _1302 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    if (_1208)
    {
        float _1304 = _1296 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1262 = _1304;
    }
    float _1306 = _1262;
    if (_1208)
    {
        float _1308 = _1196 * _1300;
        _1222 = _1308;
    }
    float _1310 = _1222;
    if (_1208)
    {
        float _1312 = _1198 * _1300;
        _1224 = _1312;
    }
    float _1314 = _1224;
    float _1316 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1208)
    {
        float _1318 = fma(_1274, _1268, _1306);
        _1292 = _1318;
    }
    float _1320 = _1292;
    if (_1208)
    {
        float _1322 = _1310 * _1310;
        _1226 = _1322;
    }
    float _1324 = _1226;
    if (_1208)
    {
        float _1326 = _1314 * _1314;
        _1228 = _1326;
    }
    float _1328 = _1228;
    float _1330 = fma(_1320, _1320, _1324);
    float _1332 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1334 = fma(_1192, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1332);
    float _1336 = precise::clamp(_1334, 0.0, 1.0);
    float _1338 = _1330 + _1328;
    float _1340 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1316);
    float _1342 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1344 = -_1336;
    float _1346 = _1344 + 1.0;
    float _1348 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1350 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1340);
    float _1352 = rsqrt(_1338);
    float _1354 = _1100 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1356 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1342);
    float _1358 = _1350 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1360 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1348);
    float _1362 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1354);
    float _1364 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1356);
    float _1366 = _1358 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1368 = abs(_1346);
    float _1370 = log2(_1368);
    float _1372 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1362);
    float _1374 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1376 = fma(_1104, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1360);
    float _1378 = -_1366;
    float _1380 = fma(_1378, _1302, 1.0);
    float _1382 = _1372 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1384 = _1374 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1386 = _1376 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1388 = _1352 * _1310;
    float _1390 = _1352 * _1320;
    float _1392 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1384);
    float _1394 = _1352 * _1314;
    float _1396 = _1388 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1398 = log2(_1380);
    float _1400 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1392);
    float _1402 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1404 = -_1396;
    float _1406 = fma(_1390, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1404);
    float _1408 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1400);
    float _1410 = _1374 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1412 = exp2(_1402);
    float _1414 = -_1394;
    float _1416 = fma(_1414, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1406);
    float _1418 = _1374 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1420 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1410);
    float _1422 = fma(_1416, -0.5, 0.5);
    float _1424 = fma(_1416, 0.5, 0.5);
    float _1426 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1418);
    float _1428 = 1.0 / _1408;
    float _1430 = _1390 + 1.0;
    float _1432 = fma(_1424, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1434 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1426);
    float _1436 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1420);
    float _1438 = _1398 * 0.693147182464599609375;
    float _1440 = fma(_1424, _1432, -0.212114393711090087890625);
    float _1442 = sqrt(_1422);
    float _1444 = -_1390;
    float _1446 = fma(_1412, _1430, _1444);
    float _1448 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1434);
    float _1450 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1436);
    float _1452 = fma(_1424, _1440, 1.570728778839111328125);
    float _1454 = _1438 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1456 = _1448 * _1428;
    float _1458 = _1450 * _1428;
    float _1460 = fma(_1456, 0.5, 0.5);
    float _1462 = fma(_1458, -0.5, 0.5);
    float _1464 = fma(_1446, 0.5, 0.5);
    float _1466 = _1442 * 0.636619746685028076171875;
    float _1468 = -_1452;
    float _1470 = fma(_1466, _1468, 1.0);
    float3 _4430 = float3(_1460, _1462, _1454);
    float _1472 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4430, float3(0.0), isnan(_4430)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4430, float3(0.0), isnan(_4430)), level(0.0)).x;
    float3 _4441 = float3(_1460, _1462, _1454);
    float4 _1475 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4441, float3(0.0), isnan(_4441)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4441, float3(0.0), isnan(_4441)), level(0.0)).xyzw;
    float _1477 = _1475.x;
    float _1479 = _1475.y;
    float _1481 = _1475.z;
    float _1483 = _1475.w;
    float2 _4458 = float2(_1470, _1464);
    float3 _1487 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4458, float2(0.0), isnan(_4458)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4458, float2(0.0), isnan(_4458)), level(0.0)).xyz;
    float _1489 = _1487.x;
    float _1491 = _1487.y;
    float _1493 = _1487.z;
    float _1495 = in.m_59.w;
    float _1497 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1499 = _484 + _1497;
    float _1501 = in.m_65.w;
    bool _1503 = _486 > 0.5;
    float _1505 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1507 = _1505 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _1509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1511 = _1509 != 0;
    out.m_67.x = _502;
    out.m_67.y = _488;
    out.m_67.z = _516;
    int _1513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1515 = _1513 != 0;
    float _1517 = -_166;
    float _1519 = _1517 + 1.0;
    int _1521 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1523 = _1521 != 0;
    float _1525 = 1.0 / _1507;
    int _1527 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1529 = _1527 != 0;
    float _1531 = in.m_53.x;
    float _1533 = _1370 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_69.x = _1102;
    out.m_69.y = _1100;
    out.m_69.z = _1104;
    float _1535 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1537 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1535;
    float _1539 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1541 = _1495 > 0.5;
    float _1543 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1545 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_71.w = _1501;
    bool _1547 = _1541;
    float _1549 = _1539;
    float _1551 = _1408;
    float _1553 = _1450;
    float _1555 = _1448;
    if (_1511)
    {
        bool _1557 = _498 > 0.5;
        _580 = _1557;
    }
    bool _1559 = _580;
    float _1561 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1563 = _1561 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1565 = _1537 * _1525;
    float _1567 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1569 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1571 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1573 = _1571 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _1575 = _1541 ? as_type<int>(_1519) : as_type<int>(_166);
    float _1577 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1579 = as_type<int>(_1569);
    if (_1515)
    {
        bool _1581 = _490 > 0.5;
        _1547 = _1581;
    }
    bool _1583 = _1547;
    float _1585 = _1543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1587 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1589 = isnan(_484);
    bool _1591 = _1587 || _1589;
    bool _1593 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1595 = _1591 || _1593;
    float _1597 = float(_1595);
    float _1599 = _1545 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1601 = 1.0 / _1563;
    float _1603 = _1567 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1605 = fma(_1565, _1499, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1607 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1609 = isnan(_484);
    bool _1611 = _1607 || _1609;
    bool _1613 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1615 = _1611 || _1613;
    float _1617 = float(_1615);
    float _1619 = -_1597;
    float _1621 = _1619 + 1.0;
    bool _1623 = _484 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1625 = isnan(_484);
    bool _1627 = _1623 || _1625;
    bool _1629 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1631 = _1627 || _1629;
    float _1633 = float(_1631);
    out.m_73.x = _1585;
    out.m_73.y = _1599;
    out.m_73.z = _1603;
    out.m_73.w = _1577;
    float _1635 = _1523 ? as_type<float>(_1575) : _166;
    float _1637 = exp2(_1533);
    if (_1529)
    {
        float _1639 = _1503 ? _1519 : _166;
        _214 = _1639;
    }
    float _1641 = _214;
    bool _1643 = _858 != 0.0;
    bool _1645 = isnan(_858);
    bool _1647 = _1643 || _1645;
    bool _1649 = isnan(0.0);
    bool _1651 = _1647 || _1649;
    bool _1653 = _856 == 0.0;
    bool _1655 = !_1651;
    bool _1657 = _1653 && _1655;
    float _1659 = _1573 * _1601;
    float _1661 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1663 = _484 + _1661;
    float _1665 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1667 = _1539 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1669 = fma(_1659, _1663, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1671 = _1617 * _1621;
    float _1673 = -_1617;
    float _1675 = _1673 + 1.0;
    float _1677 = _1569 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1679 = fma(_1635, _1667, -0.5);
    bool _1681 = _860 == 0.0;
    bool _1683 = _1681 && _1657;
    float _1685 = _1633 * _1675;
    float _1687 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1689 = as_type<int>(_1663);
    float _1691 = _1531;
    if (_1511)
    {
        float _1693 = -_1531;
        float _1695 = _1693 + 1.0;
        _1579 = as_type<int>(_1695);
    }
    int _1697 = _1579;
    if (_1515)
    {
        float _1699 = -_1531;
        float _1701 = _1699 + 1.0;
        _1689 = as_type<int>(_1701);
    }
    int _1703 = _1689;
    float _1705 = _1605 * _1685;
    float _1707 = fma(_1677, _1641, -0.5);
    if (!_1511)
    {
        _1549 = _1531;
    }
    float _1709 = _1549;
    float _1711 = in.m_75.x;
    float _1713 = in.m_75.y;
    float _1715 = in.m_75.z;
    float _1717 = _1709;
    if (_1511)
    {
        float _1719 = _1559 ? as_type<float>(_1697) : _1531;
        _1717 = _1719;
    }
    float _1721 = _1717;
    float _1723 = _1665 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1515)
    {
        float _1725 = _1583 ? as_type<float>(_1703) : _1531;
        _1691 = _1725;
    }
    float _1727 = _1691;
    float _1729 = -_1633;
    float _1731 = _1729 + 1.0;
    float _1733 = -_782;
    float _1735 = fma(_622, _1679, _1733);
    float _1737 = fma(_1723, _1721, -0.5);
    float _1739 = -_758;
    float _1741 = fma(_772, _1707, _1739);
    float _1743 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1705);
    float _1745 = _1687 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1747 = fma(_754, _1737, _554);
    float _1749 = fma(_1669, _1671, _1743);
    float _1751 = fma(_1745, _1727, -0.5);
    float _1753 = -_1637;
    float _1755 = _1753 + 1.0;
    float _1757 = fma(_1597, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1749);
    float _1759 = fma(_676, _1751, _776);
    float _1761 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1763 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1765 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1767 = _1741 + 0.5;
    float _1769 = _1755 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1771 = _1713;
    float _1773 = _1711;
    float _1775 = _1715;
    if (!_1683)
    {
        float _1777 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1713);
        _1771 = _1777;
    }
    float _1779 = _1771;
    float _1781 = _1374 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    if (!_1683)
    {
        float _1783 = fma(_856, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1711);
        _1773 = _1783;
    }
    float _1785 = _1773;
    if (!_1683)
    {
        float _1787 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1715);
        _1775 = _1787;
    }
    float _1789 = _1775;
    float _1791 = -_1779;
    float _1793 = _892 * _1791;
    float _1795 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1781);
    float _1797 = _910 * _1779;
    float _1799 = _906 * _1779;
    float _1801 = fma(_908, _1785, _1793);
    float _1803 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1795);
    float _1805 = fma(_932, _1785, _1797);
    float _1807 = fma(_926, _1785, _1799);
    float _1809 = fma(_912, _1789, _1801);
    float _1811 = fma(_1386, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1803);
    float _1813 = fma(_930, _1789, _1805);
    float _1815 = _1735 + 0.5;
    float _1817 = _1761 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1819 = _1811 + _1408;
    float _1821 = _1763 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1823 = _1765 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1825 = _1757 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1827 = fma(_938, _1789, _1807);
    float _1829 = _1819 * 0.5;
    float _1831 = _1813 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1833 = _1813 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1835 = _1813 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_77.x = _1817;
    out.m_77.y = _1821;
    out.m_77.z = _1823;
    out.m_77.w = _1825;
    float _1837 = fma(_1809, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1831);
    float _1839 = fma(_1809, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1833);
    float _1841 = fma(_1809, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1835);
    float _1843 = fma(_1827, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1837);
    float _1845 = fma(_1827, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1839);
    float _1847 = fma(_1827, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1841);
    bool _1849 = _1192 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1851 = isnan(_1192);
    bool _1853 = _1849 || _1851;
    bool _1855 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1857 = _1853 || _1855;
    out.m_79.z = _1829;
    out.m_79.w = _1408;
    float _1859 = _1747 + 0.5;
    float _1861 = _1759 + 0.5;
    out.m_81.x = _1843;
    out.m_81.y = _1845;
    out.m_81.z = _1847;
    out.m_83.x = _1859;
    out.m_83.y = _1767;
    out.m_83.z = _1861;
    out.m_83.w = _1815;
    out.gl_Position.x = _1448;
    out.gl_Position.y = _1450;
    out.gl_Position.z = _1811;
    out.gl_Position.w = _1408;
    float _1863 = _1839;
    float _1865 = _1811;
    if (!_1857)
    {
        _1863 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1867 = _1863;
    float _1869 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1871 = _1867;
    float _1873 = _1867;
    if (!_1857)
    {
        _1551 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1875 = _1551;
    float _1877 = _1875;
    float _1879 = _1875;
    if (!_1857)
    {
        _1865 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1881 = _1865;
    float _1883 = _1881;
    float _1885 = _1881;
    if (!_1857)
    {
        _1553 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1887 = _1553;
    float _1889 = _1887;
    float _1891 = _1887;
    if (!_1857)
    {
        _1555 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1893 = _1555;
    float _1895 = _1769 * _1472;
    float _1897 = -_1769;
    float _1899 = _1897 + 1.0;
    float _1901 = _1483 * _1895;
    float _1903 = _1493 * _1895;
    float _1905 = _1483 * _1899;
    float _1907 = _1895;
    float _1909 = _1893;
    float _1911 = _1893;
    if (!_1857)
    {
        _1907 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1913 = _1907;
    float _1915 = fma(_1489, _1901, _1477);
    float _1917 = fma(_1491, _1901, _1479);
    float _1919 = fma(_1483, _1903, _1481);
    out.m_85.x = _1915;
    out.m_85.y = _1917;
    out.m_85.z = _1919;
    out.m_85.w = _1905;
    bool _1921 = !_1857;
    float _1923 = _1913;
    float _1925 = _1913;
    if (!_1921)
    {
        bool _1927 = _1192 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1929 = isnan(_1192);
        bool _1931 = _1927 || _1929;
        bool _1933 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1935 = _1931 || _1933;
        if (!_1935)
        {
            float _1937 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1939 = _1192 + _1937;
            float _1941 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1943 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1941;
            float _1945 = 1.0 / _1943;
            float _1947 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1949 = _1947 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1951 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1953 = _1951 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1955 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1957 = _1955 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1959 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1961 = _1959 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1963 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1965 = _1963 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1967 = _1939 * _1945;
            float _1969 = precise::clamp(_1967, 0.0, 1.0);
            float _1971 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1973 = _1971 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1975 = fma(_1969, _1949, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1977 = fma(_1969, _1973, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1979 = fma(_1969, _1953, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1981 = fma(_1969, _1957, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1983 = fma(_1969, _1961, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1985 = fma(_1969, _1965, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1925 = _1977;
            _1891 = _1983;
            _1873 = _1975;
            _1885 = _1981;
            _1879 = _1979;
            _1911 = _1985;
            _1987 = true;
        }
        else
        {
            bool _1989 = _1192 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1991 = isnan(_1192);
            bool _1993 = _1989 || _1991;
            bool _1995 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1997 = _1993 || _1995;
            if (!_1997)
            {
                _1871 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1999 = _1871;
            _1873 = _1999;
            if (!_1997)
            {
                _1923 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2001 = _1923;
            _1925 = _2001;
            if (!_1997)
            {
                _1877 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2003 = _1877;
            _1879 = _2003;
            if (!_1997)
            {
                _1883 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2005 = _1883;
            _1885 = _2005;
            if (!_1997)
            {
                _1889 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2007 = _1889;
            _1891 = _2007;
            if (!_1997)
            {
                _1909 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2009 = _1909;
            bool _2011 = !_1997;
            _1911 = _2009;
            if (!_2011)
            {
                bool _2013 = _1192 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2015 = isnan(_1192);
                bool _2017 = _2013 || _2015;
                bool _2019 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2021 = _2017 || _2019;
                if (!_2021)
                {
                    float _2023 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2025 = _1192 + _2023;
                    float _2027 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2029 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2027;
                    float _2031 = 1.0 / _2029;
                    float _2033 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2035 = _2033 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2037 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2039 = _2037 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2041 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2043 = _2041 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2045 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2047 = _2045 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2051 = _2049 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2053 = _2025 * _2031;
                    float _2055 = precise::clamp(_2053, 0.0, 1.0);
                    float _2057 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2059 = _2057 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2061 = fma(_2055, _2035, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2063 = fma(_2055, _2059, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2065 = fma(_2055, _2039, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2067 = fma(_2055, _2043, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2069 = fma(_2055, _2047, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2071 = fma(_2055, _2051, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1925 = _2063;
                    _1891 = _2069;
                    _1873 = _2061;
                    _1885 = _2067;
                    _1879 = _2065;
                    _1911 = _2071;
                    _1987 = true;
                }
                else
                {
                    _1925 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1891 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1873 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1885 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1879 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1911 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1987 = false;
    float _2073 = _1925;
    float _2075 = _1891;
    float _2077 = _1873;
    float _2079 = _1885;
    float _2081 = _1879;
    float _2083 = _1911;
    float _2085 = fma(_1845, -0.5, 0.5);
    float _2087 = precise::clamp(_2085, 0.0, 1.0);
    float _2089 = -_2073;
    float _2091 = _2089 + _2075;
    float _2093 = _1869 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2095 = -_2077;
    float _2097 = _2095 + _2079;
    float _2099 = fma(_2087, _2091, _2073);
    out.m_87.x = 0.0;
    float _2101 = -_2081;
    float _2103 = _2101 + _2083;
    float _2105 = fma(_2087, _2097, _2077);
    float _2107 = _2099 * 0.586610972881317138671875;
    out.m_47.x = _2093;
    bool _2109 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2111 = fma(_2087, _2103, _2081);
    float _2113 = fma(_2105, 0.298911988735198974609375, _2107);
    bool _2115 = _1170 > 0.0;
    bool _2117 = isnan(_1170);
    bool _2119 = _2115 || _2117;
    bool _2121 = isnan(0.0);
    bool _2123 = _2119 || _2121;
    float _2125 = fma(_2111, 0.114477999508380889892578125, _2113);
    float _2127 = -_2125;
    float _2129 = _2105 + _2127;
    float _2131 = -_2125;
    float _2133 = _2099 + _2131;
    float _2135 = -_2125;
    float _2137 = _2111 + _2135;
    float _2139 = fma(_2129, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2125);
    float _2141 = fma(_2133, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2125);
    float _2143 = fma(_2137, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2125);
    bool _2145 = !_2109;
    if (!_2145)
    {
        float _2147 = -_1100;
        float _2149 = _2147 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2151 = -_1102;
        float _2153 = _2151 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2155 = -_1104;
        float _2157 = _2155 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2159 = _2149 * _2149;
        float _2161 = fma(_2153, _2153, _2159);
        float _2163 = fma(_2157, _2157, _2161);
        float _2165 = sqrt(_2163);
        float _2167 = rsqrt(_2163);
        float _2169 = -_2165;
        float _2171 = _2169 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2173 = _2171 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2175 = precise::clamp(_2173, 0.0, 1.0);
        float _2177 = _2153 * _2167;
        float _2179 = _2149 * _2167;
        float _2181 = abs(_2175);
        float _2183 = log2(_2181);
        float _2185 = _2157 * _2167;
        float _2187 = _2177 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2189 = _1845 * _2179;
        float _2191 = -_2179;
        float _2193 = -_2187;
        float _2195 = fma(_2191, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2193);
        float _2197 = fma(_1843, _2177, _2189);
        float _2199 = -_2185;
        float _2201 = fma(_2199, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2195);
        float _2203 = fma(_1847, _2185, _2197);
        float _2205 = precise::clamp(_2203, 0.0, 1.0);
        float _2207 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2209 = _2201 + _2207;
        float _2211 = _2183 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2213 = _2209 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2215 = precise::clamp(_2213, 0.0, 1.0);
        float _2217 = exp2(_2211);
        float _2219 = _2217 * _2215;
        float _2221 = _2205 * _2219;
        float _2223 = _2221 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2225 = _2221 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2227 = _2221 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2223;
        out.m_87.y = _2225;
        out.m_87.z = _2227;
    }
    out.m_89.x = _2139;
    out.m_89.y = _2141;
    out.m_89.z = _2143;
    if (_2123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2229 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2229;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

