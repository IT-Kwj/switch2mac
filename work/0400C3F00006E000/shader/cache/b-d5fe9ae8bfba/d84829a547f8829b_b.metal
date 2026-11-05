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
    texture2d<float> vp_t_tcb_1C [[id(8)]];
    sampler vp_t_tcb_1CSmplr [[id(9)]];
    sampler vp_t_tcb_32Smplr_w [[id(10)]];
    sampler vp_t_tcb_1CSmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_67 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_89 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_73 [[user(locn5)]];
    float4 m_63 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_77 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 m_61 [[user(locn10)]];
    float4 m_81 [[user(locn11)]];
    float4 m_87 [[user(locn12)]];
    float4 m_85 [[user(locn13)]];
    float4 m_83 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_69 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1902 = false;
    bool _306 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2184 = as_type<float>(_122);
        out.gl_Position.z = _2184;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_47.w;
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
    out.m_49.x = _146;
    float _154 = _126;
    float _156 = _134;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _154;
    if (_152)
    {
        out.m_45.x = 0.0;
    }
    if (_152)
    {
        float _160 = _158 * 5.0;
        _124 = as_type<int>(_160);
    }
    int _162 = _124;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2256 = as_type<float>(_162);
        out.gl_Position.z = _2256;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _164 = in.m_51.w;
    float _166 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    float _178 = in.m_47.x;
    float _180 = in.m_47.y;
    float _182 = in.m_47.z;
    float _184 = in.m_42.x;
    float _186 = in.m_42.y;
    float _188 = in.m_42.z;
    float _190 = 0.0;
    float _192 = _166;
    if (!_176)
    {
        float _194 = _166 * _166;
        float _196 = _194 * 0.5;
        _190 = _196;
    }
    float _198 = _190;
    float _200 = _198;
    if (!_176)
    {
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _202;
    }
    float _204 = _200;
    bool _206 = !_176;
    float _208 = _204;
    if (!_206)
    {
        float _210 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = log2(_210);
        float _214 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _216 = _214 + 1.0;
        float _218 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = _166 * _212;
        float _222 = 1.0 / _216;
        float _224 = _218 * 0.693147182464599609375;
        float _226 = exp2(_220);
        float _228 = 1.0 / _224;
        float _230 = _226 + (-1.0);
        float _232 = -_230;
        float _234 = fma(_232, _228, _166);
        float _236 = _234 * _222;
        float _238 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _208 = _238;
    }
    float _240 = _208;
    bool _242 = !_176;
    if (!_242)
    {
        float _244 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _246 = log2(_244);
        float _248 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _250 = _248 + 1.0;
        float _252 = 1.0 / _250;
        float _254 = _166 * _246;
        float _256 = exp2(_254);
        float _258 = -_256;
        float _260 = _258 + 1.0;
        float _262 = _260 * _252;
        _192 = _262;
    }
    float _264 = _192;
    bool _266 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _268 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _270 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _272 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _274 = fma(_264, _178, _268);
    float _276 = fma(_264, _180, _270);
    float _278 = fma(_264, _182, _272);
    float _280 = fma(_274, _164, _184);
    float _282 = fma(_276, _164, _186);
    float _284 = fma(_278, _164, _188);
    bool _286 = !_266;
    float _304;
    if (!_286)
    {
        float _288 = in.m_53.x;
        float _290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _292 = _288 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _294 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _296 = _294 * _290;
        float _298 = floor(_296);
        float _300 = -_298;
        float _302 = _296 + _300;
        _304 = _302;
        _306 = true;
    }
    else
    {
        _304 = _146;
    }
    _306 = false;
    float _308 = _304;
    float _310 = in.m_53.x;
    float _312 = _282 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _314 = in.m_53.z;
    float _316 = in.m_53.w;
    float _318 = _282 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _328 = in.m_53.y;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _330;
    float _334 = 1.0 / _322;
    float _336 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[4].x, _312);
    float _338 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[5].x, _318);
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _342 = _308 + _340;
    float _344 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[4].z, _336);
    float _346 = 1.0 / _326;
    float _348 = _282 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _350 = _344 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _352;
    float _356 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[6].x, _348);
    float _358 = _310 * 2.0;
    int _360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _362 = _360 != 0;
    int _364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _366 = _364 != 0;
    int _368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _370 = _368 != 0;
    float _372 = 1.0 / _332;
    float _374 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[6].z, _356);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _378 = _308 + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _382 = _308 + _380;
    float _384 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[5].z, _338);
    float _386 = _378 * _334;
    float _388 = _328 + _314;
    float _390 = floor(_358);
    float _392 = _382 * _346;
    float _394 = _310 + _314;
    float _396 = _388 + (-1.0);
    float _398 = _314 * 2.0;
    float _400 = _384 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _402 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _404 = _342 * _372;
    float _406 = _394 + (-1.0);
    float _408 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _410 = log2(_408);
    float _412 = _310 + _328;
    float _414 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _416 = _400 + _414;
    float _418 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _420 = !_366;
    int _422 = _420 ? 0 : 1;
    float _424 = _412 + (-1.0);
    bool _426 = _390 > 0.0;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _432 = _390 >= 0.0;
    bool _434 = isnan(_390);
    bool _436 = _432 || _434;
    bool _438 = isnan(0.0);
    bool _440 = _436 || _438;
    float _442 = _328 * 2.0;
    float _444 = floor(_398);
    int _446 = abs(_422);
    float _448 = _374 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _450 = _440 ? 0 : 1;
    float _452 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _454 = _350 + _452;
    float _456 = float(_446);
    float _458 = _416 * _416;
    int _460 = ~_450;
    int _462 = _460 + 1;
    int _464 = _462 + 1;
    float _466 = floor(_442);
    int _468 = _464;
    float _470 = _400;
    int _472 = as_type<int>(_310);
    if (!_426)
    {
        int _474 = ~_450;
        int _476 = _474 + 1;
        _468 = _476;
    }
    int _478 = _468;
    float _480 = fma(_354, _386, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _482 = fma(_430, _392, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _484 = float(_478);
    float _486 = fma(_454, _454, _458);
    bool _488 = _444 > 0.0;
    float _490 = _456 * _484;
    float _492 = _410 * _134;
    bool _494 = _444 >= 0.0;
    bool _496 = isnan(_444);
    bool _498 = _494 || _496;
    bool _500 = isnan(0.0);
    bool _502 = _498 || _500;
    float _504 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _506;
    bool _510 = _466 > 0.0;
    float _512 = exp2(_492);
    bool _514 = _466 >= 0.0;
    bool _516 = isnan(_466);
    bool _518 = _514 || _516;
    bool _520 = isnan(0.0);
    bool _522 = _518 || _520;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _536 = _502 ? 0 : 1;
    float _538 = fma(_526, _386, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _540 = _522 ? 0 : 1;
    float _542 = fma(_508, _386, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _544 = fma(_530, _392, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _546 = fma(_534, _392, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _548 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _550 = _448 + _548;
    int _552 = ~_536;
    int _554 = _552 + 1;
    int _556 = _554 + 1;
    int _558 = ~_540;
    int _560 = _558 + 1;
    int _562 = _560 + 1;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _564;
    int _568 = _556;
    int _570 = _562;
    bool _572 = _510;
    if (!_488)
    {
        int _574 = ~_536;
        int _576 = _574 + 1;
        _568 = _576;
    }
    int _578 = _568;
    float _580 = fma(_550, _550, _486);
    if (!_510)
    {
        int _582 = ~_540;
        int _584 = _582 + 1;
        _570 = _584;
    }
    int _586 = _570;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _590 = 1.0 + _588;
    float _592 = in.m_55.x;
    float _594 = in.m_55.y;
    float _596 = in.m_55.z;
    bool _598 = !_362;
    int _600 = _598 ? 0 : 1;
    float _602 = 1.0 / _590;
    int _604 = abs(_600);
    float _606 = -_512;
    float _608 = _606 + 1.0;
    bool _610 = !_370;
    int _612 = _610 ? 0 : 1;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _614;
    bool _618 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _620 = isnan(1.0);
    bool _622 = _618 || _620;
    bool _624 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _626 = _622 || _624;
    int _628 = abs(_612);
    float _630 = rsqrt(_580);
    float _632 = fma(_566, _404, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _634 = fma(_616, _404, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _636 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _638 = isnan(0.0);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _644 = _640 || _642;
    float _646 = float(_604);
    float _648 = float(_578);
    float _650 = _644 ? _608 : 0.0;
    float _652 = _646 * _648;
    float _654 = _490 * (-2.0);
    float _656 = float(_586);
    float _658 = _416 * _630;
    if (_626)
    {
        float _660 = _650 * _602;
        _156 = _660;
    }
    float _662 = _156;
    float _664 = fma(_654, _594, _594);
    float _666 = fma(_402, _654, _402);
    float _668 = -_658;
    float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[18].w, _416);
    float _672 = _454 * _630;
    float _674 = float(_628);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _676;
    float _680 = _670 * _670;
    float _682 = -_672;
    float _684 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[18].w, _454);
    float _686 = _550 * _630;
    float _688 = _328 + (-0.5);
    bool _690 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _692 = isnan(_308);
    bool _694 = _690 || _692;
    bool _696 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _698 = _694 || _696;
    float _700 = float(_698);
    float _702 = fma(_678, _404, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _704 = fma(_684, _684, _680);
    float _706 = -_686;
    float _708 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[18].w, _550);
    float _710 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[196].y, _664);
    float _712 = _674 * _656;
    bool _714 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _716 = isnan(_308);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _722 = _718 || _720;
    float _724 = float(_722);
    float _726 = -_700;
    float _728 = _726 + 1.0;
    float _730 = fma(_708, _708, _704);
    float _732 = fma(_666, _662, _710);
    float _734 = _712 * (-2.0);
    bool _736 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _738 = isnan(_308);
    bool _740 = _736 || _738;
    bool _742 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _744 = _740 || _742;
    float _746 = float(_744);
    float _748 = _724 * _728;
    float _750 = -_724;
    float _752 = _750 + 1.0;
    bool _754 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _756 = isnan(_308);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    float _766 = _314 + (-0.5);
    float _768 = fma(_734, _596, _596);
    float _770 = _746 * _752;
    float _772 = -_746;
    float _774 = _772 + 1.0;
    float _776 = fma(_418, _734, _418);
    float _778 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[196].z, _768);
    float _780 = sqrt(_730);
    float _782 = _764 * _774;
    float _784 = -_764;
    float _786 = _784 + 1.0;
    float _788 = fma(_776, _662, _778);
    float _790 = _652 * (-2.0);
    float _792 = _538 * _782;
    float _794 = _542 * _782;
    float _796 = _480 * _782;
    float _798 = fma(_790, _592, _592);
    float _800 = _310 + (-0.5);
    float _802 = in.m_51.x;
    float _804 = in.m_51.y;
    float _806 = in.m_51.z;
    float _808 = _788 * 0.15915493667125701904296875;
    float _810 = fma(_504, _790, _504);
    float _812 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[143].x, _792);
    float _814 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[143].y, _794);
    float _816 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[196].x, _798);
    float _818 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[143].z, _796);
    float _820 = fma(_544, _770, _812);
    float _822 = fma(_546, _770, _814);
    float _824 = fma(_810, _662, _816);
    float _826 = fma(_482, _770, _818);
    float _828 = in.m_57.x;
    float _830 = in.m_57.y;
    float _832 = in.m_57.z;
    float _834 = fma(_632, _748, _820);
    float _836 = _732 * 0.15915493667125701904296875;
    float _838 = fma(_702, _748, _826);
    float _840 = fma(_634, _748, _822);
    float _842 = _824 * 0.15915493667125701904296875;
    float _844 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[146].x, _834);
    float _846 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[146].z, _838);
    float _848 = _836 * 6.283185482025146484375;
    float _850 = sin(_848);
    float _852 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[146].y, _840);
    float _854 = _630 * _780;
    float _856 = _852 * _804;
    float _858 = _846 * _806;
    float _860 = _844 * _802;
    float _862 = _836 * 6.283185482025146484375;
    float _864 = cos(_862);
    float _866 = _856 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _868 = _858 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _870 = _860 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _872 = _854 * _866;
    float _874 = _854 * _868;
    float _876 = _854 * _870;
    float _878 = _808 * 6.283185482025146484375;
    float _880 = cos(_878);
    float _882 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _830);
    float _884 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _828);
    float _886 = _882 * _872;
    float _888 = _884 * _876;
    float _890 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _832);
    float _892 = _808 * 6.283185482025146484375;
    float _894 = sin(_892);
    float _896 = _890 * _874;
    float _898 = _842 * 6.283185482025146484375;
    float _900 = cos(_898);
    float _902 = _864 * _880;
    float _904 = _850 * _880;
    float _906 = _842 * 6.283185482025146484375;
    float _908 = sin(_906);
    float _910 = _864 * _894;
    float _912 = _850 * _894;
    float _914 = _880 * _900;
    float _916 = _894 * _900;
    float _918 = _850 * _900;
    float _920 = _864 * _900;
    float _922 = _914 * _886;
    float _924 = -_910;
    float _926 = fma(_908, _904, _924);
    float _928 = fma(_908, _912, _902);
    float _930 = -_904;
    float _932 = fma(_908, _910, _930);
    float _934 = fma(_908, _902, _912);
    float _936 = _926 * _886;
    float _938 = fma(_916, _888, _922);
    float _940 = _934 * _886;
    float _942 = fma(_928, _888, _936);
    float _944 = -_908;
    float _946 = fma(_944, _896, _938);
    float _948 = fma(_932, _888, _940);
    float _950 = fma(_918, _896, _942);
    float _952 = _946 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _954 = _946 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _956 = fma(_920, _896, _948);
    float _958 = fma(_950, (*spvDescriptorSet0.vp_c10)._m0[10].x, _952);
    float _960 = fma(_950, (*spvDescriptorSet0.vp_c10)._m0[8].x, _954);
    float _962 = fma(_956, (*spvDescriptorSet0.vp_c10)._m0[10].z, _958);
    float _964 = fma(_956, (*spvDescriptorSet0.vp_c10)._m0[8].z, _960);
    float _966 = _946 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _968 = _448 + _962;
    float _970 = _350 + _964;
    float _972 = fma(_950, (*spvDescriptorSet0.vp_c10)._m0[9].x, _966);
    float _974 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _976 = _968 + _974;
    float _978 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _980 = _970 + _978;
    float _982 = fma(_956, (*spvDescriptorSet0.vp_c10)._m0[9].z, _972);
    float _984 = _976 * _976;
    float _986 = _400 + _982;
    float _988 = fma(_980, _980, _984);
    float _990 = sqrt(_988);
    bool _992 = _990 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _994 = _950;
    float _996 = _984;
    if (!_992)
    {
        _994 = _970;
    }
    float _998 = _994;
    float _1000 = _998;
    if (!_992)
    {
        _470 = _968;
    }
    float _1002 = _470;
    float _1004 = _1002;
    if (!_992)
    {
        _996 = _986;
    }
    float _1006 = _996;
    bool _1008 = !_992;
    float _1010 = _1006;
    if (!_1008)
    {
        float _1012 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1014 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1016 = _990 + _1014;
        float _1018 = _986 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1020 = rsqrt(_988);
        float _1022 = _1016 * _1012;
        float _1024 = _1022 * 0.15915493667125701904296875;
        float _1026 = _1024 * 6.283185482025146484375;
        float _1028 = sin(_1026);
        float _1030 = _1024 * 6.283185482025146484375;
        float _1032 = cos(_1030);
        float _1034 = fma(_1028, _1018, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1036 = _1020 * _1034;
        float _1038 = _1032 + (-1.0);
        float _1040 = fma(_980, _1036, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1042 = fma(_976, _1036, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1044 = _1038 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1046 = fma(_986, _1032, _1044);
        _1010 = _1046;
        _1000 = _1040;
        _1004 = _1042;
    }
    float _1048 = _1010;
    float _1050 = _1000;
    float _1052 = _1004;
    float _1054 = -_658;
    float _1056 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1048);
    float _1058 = -_672;
    float _1060 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1050);
    float _1062 = -_686;
    float _1064 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1052);
    float _1066 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1068 = _1056 + _1066;
    float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1072 = _1060 + _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1076 = _1064 + _1074;
    float _1078 = _1068 * _1068;
    float _1080 = fma(_1072, _1072, _1078);
    float _1082 = fma(_1076, _1076, _1080);
    float _1084 = rsqrt(_1082);
    float _1086 = sqrt(_1082);
    float _1088 = _1084 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1090 = _1072 * _1088;
    float _1092 = _1076 * _1088;
    float _1094 = _1090 * _1090;
    float _1096 = _1092 * _1092;
    float _1098 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1100 = _1094 + _1096;
    float _1102 = precise::max(0.0, _1098);
    float _1104 = sqrt(_1100);
    float _1106 = -_1088;
    float _1108 = -_1102;
    float _1110 = fma(_1068, _1106, _1108);
    bool _1112 = _1104 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1114 = _1076;
    float _1116 = _1068;
    float _1118 = _1102;
    float _1120 = _1094;
    float _1122 = _1096;
    if (!_1112)
    {
        _1114 = _1090;
    }
    float _1124 = _1114;
    float _1126 = _1124;
    if (!_1112)
    {
        _1116 = _1110;
    }
    float _1128 = _1116;
    float _1130 = _1128;
    if (!_1112)
    {
        _1118 = _1092;
    }
    float _1132 = _1118;
    bool _1134 = !_1112;
    float _1136 = _1132;
    if (!_1134)
    {
        float _1138 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1140 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1142 = _1104 + _1140;
        float _1144 = _1110 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1146 = rsqrt(_1100);
        float _1148 = _1142 * _1138;
        float _1150 = _1148 * 0.15915493667125701904296875;
        float _1152 = _1150 * 6.283185482025146484375;
        float _1154 = sin(_1152);
        float _1156 = _1150 * 6.283185482025146484375;
        float _1158 = cos(_1156);
        float _1160 = fma(_1154, _1144, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1162 = _1146 * _1160;
        float _1164 = _1158 + (-1.0);
        float _1166 = _1090 * _1162;
        float _1168 = _1164 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1170 = _1092 * _1162;
        float _1172 = fma(_1110, _1158, _1168);
        float _1174 = _1166 * _1166;
        float _1176 = _1170 * _1170;
        _1130 = _1172;
        _1120 = _1174;
        _1122 = _1176;
        _1126 = _1166;
        _1136 = _1170;
    }
    float _1178 = _1130;
    float _1180 = _1120;
    float _1182 = _1122;
    float _1184 = _1126;
    float _1186 = _1136;
    float _1188 = fma(_1178, _1178, _1180);
    float _1190 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1192 = _1188 + _1182;
    float _1194 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1196 = fma(_1086, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1194);
    float _1198 = precise::clamp(_1196, 0.0, 1.0);
    float _1200 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1190);
    float _1202 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1204 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1206 = rsqrt(_1192);
    float _1208 = -_1198;
    float _1210 = _1208 + 1.0;
    float _1212 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1200);
    float _1214 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1216 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1202);
    float _1218 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1220 = _1212 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1222 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1214);
    float _1224 = abs(_1210);
    float _1226 = log2(_1224);
    float _1228 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1216);
    float _1230 = _1220 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1232 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1222);
    float _1234 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1204);
    float _1236 = _1228 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1238 = -_1230;
    float _1240 = fma(_1218, _1238, 1.0);
    float _1242 = _1232 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1244 = _1206 * _1184;
    float _1246 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1248 = _1206 * _1178;
    float _1250 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1234);
    float _1252 = _1244 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1254 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1246);
    float _1256 = _1206 * _1186;
    float _1258 = _1250 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1260 = _1226 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1262 = -_1252;
    float _1264 = fma(_1248, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1262);
    float _1266 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1254);
    float _1268 = log2(_1240);
    float _1270 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1272 = -_1256;
    float _1274 = fma(_1272, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1264);
    float _1276 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1266);
    float _1278 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1280 = fma(_1274, -0.5, 0.5);
    float _1282 = fma(_1274, 0.5, 0.5);
    float _1284 = exp2(_1260);
    float _1286 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1278);
    float _1288 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1270);
    float _1290 = _1248 + 1.0;
    float _1292 = fma(_1282, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1294 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1286);
    float _1296 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1288);
    float _1298 = 1.0 / _1276;
    float _1300 = fma(_1282, _1292, -0.212114393711090087890625);
    float _1302 = _1268 * 0.693147182464599609375;
    float _1304 = fma(_1282, _1300, 1.570728778839111328125);
    float _1306 = _1302 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1308 = sqrt(_1280);
    float _1310 = -_1248;
    float _1312 = fma(_1284, _1290, _1310);
    float _1314 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1294);
    float _1316 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1296);
    float _1318 = fma(_1312, 0.5, 0.5);
    float _1320 = _1314 * _1298;
    float _1322 = _1316 * _1298;
    float _1324 = fma(_1320, 0.5, 0.5);
    float _1326 = fma(_1322, -0.5, 0.5);
    float _1328 = _1308 * 0.636619746685028076171875;
    float3 _4079 = float3(_1324, _1326, _1306);
    float _1330 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4079, float3(0.0), isnan(_4079)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4079, float3(0.0), isnan(_4079)), level(0.0)).x;
    float _1332 = -_1304;
    float _1334 = fma(_1328, _1332, 1.0);
    float2 _4095 = float2(_1334, _1318);
    float3 _1338 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4095, float2(0.0), isnan(_4095)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4095, float2(0.0), isnan(_4095)), level(0.0)).xyz;
    float _1340 = _1338.x;
    float _1342 = _1338.y;
    float _1344 = _1338.z;
    float _1346 = in.m_59.x;
    bool _1348 = _314 > 0.5;
    float _1350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1354 = _1352 != 0;
    float _1356 = in.m_59.y;
    int _1358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1360 = _1358 != 0;
    float _1362 = _1226 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1364 = _328 > 0.5;
    out.m_61.x = _1060;
    out.m_61.y = _1056;
    out.m_61.z = _1064;
    bool _1366 = _316 > 0.5;
    float _1368 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1370 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1372 = _1326;
    float _1374 = _1296;
    float _1376 = _1276;
    float _1378 = _1316;
    float _1380 = _1314;
    if (_1354)
    {
        float _1382 = in.m_53.z;
        _1372 = _1382;
    }
    float _1384 = _1372;
    float _1386 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    if (_1360)
    {
        bool _1388 = _310 > 0.5;
        _572 = _1388;
    }
    bool _1390 = _572;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1398 = _1396 != 0;
    float _1400 = _1386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1402 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1404 = as_type<int>(_1402);
    float _1406 = _1346;
    if (_1360)
    {
        float _1408 = -_1346;
        float _1410 = _1408 + 1.0;
        _472 = as_type<int>(_1410);
    }
    int _1412 = _472;
    if (!_1360)
    {
        _1374 = _1346;
    }
    float _1414 = _1374;
    float _1416 = _1394 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1418 = 0.0;
    float _1420 = _1414;
    if (!_1354)
    {
        _1418 = _1346;
    }
    float _1422 = _1418;
    float _1424 = -_1356;
    float _1426 = _1424 + 1.0;
    float _1428 = _1356;
    float _1430 = _1422;
    float _1432 = _1426;
    if (_1360)
    {
        float _1434 = _1390 ? as_type<float>(_1412) : _1346;
        _1420 = _1434;
    }
    float _1436 = _1420;
    float _1438 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1442 = _1440 != 0;
    float _1444 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1370);
    int _1446 = _1348 ? as_type<int>(_1426) : as_type<int>(_1356);
    out.m_63.w = _1276;
    int _1448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1450 = _1448 != 0;
    float _1452 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1444);
    float _1454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1458 = _1456 != 0;
    float _1460 = _1442 ? as_type<float>(_1446) : _1356;
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1464 = _1364 ? as_type<int>(_1426) : as_type<int>(_1356);
    bool _1466 = _1442;
    int _1468 = as_type<int>(_1462);
    if (_1354)
    {
        bool _1470 = _1384 > 0.5;
        _1466 = _1470;
    }
    bool _1472 = _1466;
    float _1474 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1476 = in.m_65.x;
    float _1478 = in.m_65.y;
    float _1480 = in.m_65.z;
    float _1482 = _1458 ? as_type<float>(_1464) : _1356;
    bool _1484 = _830 != 0.0;
    bool _1486 = isnan(_830);
    bool _1488 = _1484 || _1486;
    bool _1490 = isnan(0.0);
    bool _1492 = _1488 || _1490;
    out.m_67.x = _1400;
    out.m_67.y = _1402;
    out.m_67.z = _1416;
    out.m_67.w = _1462;
    bool _1494 = _828 == 0.0;
    bool _1496 = !_1492;
    bool _1498 = _1494 && _1496;
    float _1500 = exp2(_1362);
    float _1502 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1504 = _832 == 0.0;
    bool _1506 = _1504 && _1498;
    float _1508 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1510 = _1502 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1512 = _1510;
    if (_1398)
    {
        float _1514 = _1366 ? _1426 : _1356;
        _1428 = _1514;
    }
    float _1516 = _1428;
    if (_1354)
    {
        float _1518 = -_1346;
        float _1520 = _1518 + 1.0;
        _1404 = as_type<int>(_1520);
    }
    int _1522 = _1404;
    if (_1450)
    {
        float _1524 = -_1346;
        float _1526 = _1524 + 1.0;
        _1468 = as_type<int>(_1526);
    }
    int _1528 = _1468;
    float _1530 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1532 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1534 = _1508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1536 = _1534;
    if (_1354)
    {
        float _1538 = _1472 ? as_type<float>(_1522) : _1346;
        _1430 = _1538;
    }
    float _1540 = _1430;
    float _1542 = _1530 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1450)
    {
        float _1544 = _1364 ? as_type<float>(_1528) : _1346;
        _1406 = _1544;
    }
    float _1546 = _1406;
    float _1548 = -_1500;
    float _1550 = _1548 + 1.0;
    float _1552 = in.m_69.x;
    float _1554 = in.m_69.y;
    float _1556 = in.m_69.z;
    float _1558 = in.m_69.w;
    float _1560 = 0.0;
    if (_1506)
    {
        _1560 = _1476;
    }
    float _1562 = _1560;
    float _1564 = 0.0;
    float _1566 = _1562;
    if (_1506)
    {
        _1564 = _1478;
    }
    float _1568 = _1564;
    out.m_71.x = _1510;
    out.m_71.y = _1534;
    out.m_71.z = _1542;
    out.m_71.w = _1532;
    float _1570 = _1568;
    if (_1506)
    {
        _1432 = _1562;
    }
    float _1572 = _1432;
    float _1574 = _1550 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1576 = _1572;
    if (!_1506)
    {
        _1566 = _1476;
    }
    float _1578 = _1566;
    float _1580 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    if (!_1506)
    {
        float _1582 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1578);
        _1576 = _1582;
    }
    float _1584 = _1576;
    float _1586 = _1436 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1588 = _1586 * _1350;
    if (_1506)
    {
        _1536 = _1568;
    }
    float _1590 = _1536;
    float _1592 = _1516 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1594 = _1590;
    if (!_1506)
    {
        _1570 = _1478;
    }
    float _1596 = _1570;
    float _1598 = _1546 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    if (_1506)
    {
        _1512 = _1480;
    }
    float _1600 = _1512;
    float _1602 = _1600;
    if (!_1506)
    {
        float _1604 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1480);
        _1602 = _1604;
    }
    float _1606 = _1602;
    float _1608 = _1556 * _1578;
    if (!_1506)
    {
        float _1610 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1596);
        _1594 = _1610;
    }
    float _1612 = _1594;
    float _1614 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1616 = _1540 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1618 = _1554 * _1480;
    float _1620 = _1592 * _1454;
    float _1622 = _1614 * _1368;
    float _1624 = -_1608;
    float _1626 = fma(_1552, _1480, _1624);
    float _1628 = _1616 * _1438;
    float _1630 = _1552 * _1596;
    float _1632 = _1598 * _1580;
    float _1634 = -_1618;
    float _1636 = fma(_1556, _1596, _1634);
    float _1638 = _1626 * _1558;
    float _1640 = _914 * _1612;
    out.m_73.x = _1588;
    out.m_73.y = _1622;
    out.m_73.z = _1628;
    out.m_73.w = _1620;
    float _1642 = _1460 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1644 = -_1630;
    float _1646 = fma(_1554, _1578, _1644);
    float _1648 = _914 * _1554;
    float _1650 = _1636 * _1558;
    float _1652 = _914 * _1638;
    float _1654 = fma(_916, _1584, _1640);
    float _1656 = _1642 * _1474;
    float _1658 = fma(_916, _1552, _1648);
    float _1660 = _1646 * _1558;
    float _1662 = fma(_916, _1650, _1652);
    float _1664 = -_908;
    float _1666 = fma(_1664, _1606, _1654);
    float _1668 = -_908;
    float _1670 = fma(_1668, _1556, _1658);
    out.m_75.x = _1632;
    out.m_75.y = _1656;
    float _1672 = _926 * _1554;
    float _1674 = _934 * _1554;
    float _1676 = _926 * _1612;
    float _1678 = -_908;
    float _1680 = fma(_1678, _1660, _1662);
    float _1682 = fma(_928, _1552, _1672);
    float _1684 = fma(_932, _1552, _1674);
    float _1686 = fma(_928, _1584, _1676);
    float _1688 = _1666 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1690 = fma(_918, _1556, _1682);
    float _1692 = fma(_920, _1556, _1684);
    float _1694 = fma(_918, _1606, _1686);
    float _1696 = _1666 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1698 = _1666 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1700 = _926 * _1638;
    float _1702 = _934 * _1612;
    float _1704 = fma(_1694, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1688);
    float _1706 = fma(_1694, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1696);
    float _1708 = fma(_1694, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1698);
    float _1710 = _934 * _1638;
    float _1712 = _1670 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1714 = _1670 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1716 = fma(_928, _1650, _1700);
    float _1718 = _1670 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1720 = fma(_932, _1584, _1702);
    float _1722 = fma(_932, _1650, _1710);
    float _1724 = fma(_1690, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1712);
    float _1726 = fma(_1690, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1714);
    float _1728 = fma(_918, _1660, _1716);
    float _1730 = fma(_1690, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1718);
    float _1732 = _1680 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1734 = _1680 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1736 = _1680 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1738 = fma(_920, _1606, _1720);
    float _1740 = fma(_920, _1660, _1722);
    float _1742 = fma(_1728, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1732);
    float _1744 = fma(_1728, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1734);
    float _1746 = fma(_1728, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1736);
    float _1748 = fma(_1692, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1724);
    float _1750 = _1314 + _1276;
    float _1752 = fma(_1692, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1726);
    float _1754 = fma(_1740, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1742);
    float _1756 = fma(_1740, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1744);
    float _1758 = fma(_1740, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1746);
    float _1760 = _1750 * 0.5;
    float _1762 = fma(_1738, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1704);
    float _1764 = _1276 * 0.5;
    float _1766 = fma(_1692, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1730);
    float _1768 = fma(_1738, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1706);
    float _1770 = fma(_1738, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1708);
    float _1772 = fma(_1316, -0.5, _1764);
    float _1774 = -_1574;
    float _1776 = _1774 + 1.0;
    out.m_77.x = _1754;
    out.m_77.y = _1756;
    out.m_77.z = _1758;
    bool _1778 = _1086 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1780 = isnan(_1086);
    bool _1782 = _1778 || _1780;
    bool _1784 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1786 = _1782 || _1784;
    float _1788 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1452);
    out.m_63.x = _1760;
    out.m_63.y = _1772;
    out.m_79.x = _1762;
    out.m_79.y = _1768;
    out.m_79.z = _1770;
    out.m_81.x = _1748;
    out.m_81.y = _1752;
    out.m_81.z = _1766;
    out.gl_Position.x = _1314;
    out.gl_Position.y = _1316;
    out.gl_Position.z = _1788;
    out.gl_Position.w = _1276;
    float _1790 = _1748;
    float _1792 = _1788;
    if (!_1786)
    {
        _1790 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1794 = _1790;
    float _1796 = _1794;
    float _1798 = _1794;
    if (!_1786)
    {
        _1376 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1800 = _1376;
    float _1802 = _1800;
    float _1804 = _1800;
    if (!_1786)
    {
        _1792 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1806 = _1792;
    float _1808 = _1806;
    float _1810 = _1806;
    if (!_1786)
    {
        _1378 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1812 = _1378;
    float _1814 = _1812;
    float _1816 = _1812;
    if (!_1786)
    {
        _1380 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1818 = _1380;
    float _1820 = _1574 * _1330;
    float _1822 = _1340 * _1820;
    float _1824 = _1342 * _1820;
    float _1826 = _1344 * _1820;
    float _1828 = _1820;
    float _1830 = _1818;
    float _1832 = _1818;
    if (!_1786)
    {
        _1828 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1834 = _1828;
    out.m_83.x = _1822;
    out.m_83.y = _1824;
    out.m_83.z = _1826;
    out.m_83.w = _1776;
    bool _1836 = !_1786;
    float _1838 = _1834;
    float _1840 = _1834;
    if (!_1836)
    {
        bool _1842 = _1086 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1844 = isnan(_1086);
        bool _1846 = _1842 || _1844;
        bool _1848 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1850 = _1846 || _1848;
        if (!_1850)
        {
            float _1852 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1854 = _1086 + _1852;
            float _1856 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1858 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1856;
            float _1860 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1862 = _1860 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1864 = 1.0 / _1858;
            float _1866 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1868 = _1866 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1870 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1872 = _1870 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1874 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1876 = _1874 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1878 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1880 = _1878 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1882 = _1854 * _1864;
            float _1884 = precise::clamp(_1882, 0.0, 1.0);
            float _1886 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1888 = _1886 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1890 = fma(_1884, _1862, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1892 = fma(_1884, _1888, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1894 = fma(_1884, _1868, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1896 = fma(_1884, _1872, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1898 = fma(_1884, _1876, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1900 = fma(_1884, _1880, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1804 = _1894;
            _1832 = _1898;
            _1798 = _1890;
            _1816 = _1896;
            _1810 = _1892;
            _1840 = _1900;
            _1902 = true;
        }
        else
        {
            bool _1904 = _1086 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1906 = isnan(_1086);
            bool _1908 = _1904 || _1906;
            bool _1910 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1912 = _1908 || _1910;
            if (!_1912)
            {
                _1796 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1914 = _1796;
            _1798 = _1914;
            if (!_1912)
            {
                _1802 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1916 = _1802;
            _1804 = _1916;
            if (!_1912)
            {
                _1808 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1918 = _1808;
            _1810 = _1918;
            if (!_1912)
            {
                _1814 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1920 = _1814;
            _1816 = _1920;
            if (!_1912)
            {
                _1830 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1922 = _1830;
            _1832 = _1922;
            if (!_1912)
            {
                _1838 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1924 = _1838;
            bool _1926 = !_1912;
            _1840 = _1924;
            if (!_1926)
            {
                bool _1928 = _1086 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1930 = isnan(_1086);
                bool _1932 = _1928 || _1930;
                bool _1934 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1936 = _1932 || _1934;
                if (!_1936)
                {
                    float _1938 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1940 = _1086 + _1938;
                    float _1942 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1944 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1942;
                    float _1946 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1948 = _1946 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1950 = 1.0 / _1944;
                    float _1952 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1954 = _1952 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1956 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1958 = _1956 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1960 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1962 = _1960 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1964 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1966 = _1964 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1968 = _1940 * _1950;
                    float _1970 = precise::clamp(_1968, 0.0, 1.0);
                    float _1972 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1974 = _1972 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1976 = fma(_1970, _1948, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1978 = fma(_1970, _1974, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1980 = fma(_1970, _1954, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1982 = fma(_1970, _1958, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1984 = fma(_1970, _1962, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1986 = fma(_1970, _1966, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1804 = _1980;
                    _1832 = _1984;
                    _1798 = _1976;
                    _1816 = _1982;
                    _1810 = _1978;
                    _1840 = _1986;
                    _1902 = true;
                }
                else
                {
                    _1804 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1832 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1798 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1816 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1810 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1840 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1902 = false;
    float _1988 = _1804;
    float _1990 = _1832;
    float _1992 = _1798;
    float _1994 = _1816;
    float _1996 = _1810;
    float _1998 = _1840;
    float _2000 = fma(_1768, -0.5, 0.5);
    float _2002 = precise::clamp(_2000, 0.0, 1.0);
    float _2004 = -_1988;
    float _2006 = _2004 + _1990;
    float _2008 = -_1992;
    float _2010 = _2008 + _1994;
    float _2012 = -_1996;
    float _2014 = _2012 + _1998;
    bool _2016 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2018 = fma(_2002, _2006, _1988);
    float _2020 = fma(_2002, _2010, _1992);
    float _2022 = fma(_2002, _2014, _1996);
    float _2024 = _2018 * 0.586610972881317138671875;
    out.m_45.x = 1.0;
    float _2026 = fma(_2020, 0.298911988735198974609375, _2024);
    out.m_85.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2028 = fma(_2022, 0.114477999508380889892578125, _2026);
    float _2030 = -_2028;
    float _2032 = _2020 + _2030;
    float _2034 = -_2028;
    float _2036 = _2018 + _2034;
    float _2038 = -_2028;
    float _2040 = _2022 + _2038;
    out.m_87.x = 0.0;
    float _2042 = fma(_2032, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2028);
    float _2044 = fma(_2036, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2028);
    float _2046 = fma(_2040, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2028);
    out.m_89.x = _2042;
    out.m_89.y = _2044;
    out.m_89.z = _2046;
    if (!_2016)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2048 = -_1056;
    float _2050 = _2048 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2052 = -_1060;
    float _2054 = _2052 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2056 = -_1064;
    float _2058 = _2056 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2060 = _2050 * _2050;
    float _2062 = fma(_2054, _2054, _2060);
    float _2064 = fma(_2058, _2058, _2062);
    float _2066 = sqrt(_2064);
    float _2068 = rsqrt(_2064);
    float _2070 = -_2066;
    float _2072 = _2070 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2074 = _2072 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2076 = precise::clamp(_2074, 0.0, 1.0);
    float _2078 = _2054 * _2068;
    float _2080 = _2050 * _2068;
    float _2082 = abs(_2076);
    float _2084 = log2(_2082);
    float _2086 = _2058 * _2068;
    float _2088 = _2078 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2090 = _1768 * _2080;
    float _2092 = -_2080;
    float _2094 = -_2088;
    float _2096 = fma(_2092, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2094);
    float _2098 = fma(_1762, _2078, _2090);
    float _2100 = -_2086;
    float _2102 = fma(_2100, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2096);
    float _2104 = fma(_1770, _2086, _2098);
    float _2106 = precise::clamp(_2104, 0.0, 1.0);
    float _2108 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2110 = _2102 + _2108;
    float _2112 = _2084 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2114 = _2110 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2116 = precise::clamp(_2114, 0.0, 1.0);
    float _2118 = exp2(_2112);
    float _2120 = _2118 * _2116;
    float _2122 = _2106 * _2120;
    float _2124 = _2122 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2126 = _2122 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2128 = _2122 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _2124;
    out.m_87.y = _2126;
    out.m_87.z = _2128;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1902 = false;
    bool _306 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2184 = as_type<float>(_122);
        out.gl_Position.z = _2184;
    }
    if (!_112)
    {
        return out;
    }
    float _126 = in.m_47.w;
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
    out.m_49.x = _146;
    float _154 = _126;
    float _156 = _134;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _154;
    if (_152)
    {
        out.m_45.x = 0.0;
    }
    if (_152)
    {
        float _160 = _158 * 5.0;
        _124 = as_type<int>(_160);
    }
    int _162 = _124;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2256 = as_type<float>(_162);
        out.gl_Position.z = _2256;
    }
    if (_152)
    {
        return out;
    }
    float _164 = in.m_51.w;
    float _166 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    float _178 = in.m_47.x;
    float _180 = in.m_47.y;
    float _182 = in.m_47.z;
    float _184 = in.m_42.x;
    float _186 = in.m_42.y;
    float _188 = in.m_42.z;
    float _190 = 0.0;
    float _192 = _166;
    if (!_176)
    {
        float _194 = _166 * _166;
        float _196 = _194 * 0.5;
        _190 = _196;
    }
    float _198 = _190;
    float _200 = _198;
    if (!_176)
    {
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _202;
    }
    float _204 = _200;
    bool _206 = !_176;
    float _208 = _204;
    if (!_206)
    {
        float _210 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = log2(_210);
        float _214 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _216 = _214 + 1.0;
        float _218 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = _166 * _212;
        float _222 = 1.0 / _216;
        float _224 = _218 * 0.693147182464599609375;
        float _226 = exp2(_220);
        float _228 = 1.0 / _224;
        float _230 = _226 + (-1.0);
        float _232 = -_230;
        float _234 = fma(_232, _228, _166);
        float _236 = _234 * _222;
        float _238 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _208 = _238;
    }
    float _240 = _208;
    bool _242 = !_176;
    if (!_242)
    {
        float _244 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _246 = log2(_244);
        float _248 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _250 = _248 + 1.0;
        float _252 = 1.0 / _250;
        float _254 = _166 * _246;
        float _256 = exp2(_254);
        float _258 = -_256;
        float _260 = _258 + 1.0;
        float _262 = _260 * _252;
        _192 = _262;
    }
    float _264 = _192;
    bool _266 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _268 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _270 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _272 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _274 = fma(_264, _178, _268);
    float _276 = fma(_264, _180, _270);
    float _278 = fma(_264, _182, _272);
    float _280 = fma(_274, _164, _184);
    float _282 = fma(_276, _164, _186);
    float _284 = fma(_278, _164, _188);
    bool _286 = !_266;
    float _304;
    if (!_286)
    {
        float _288 = in.m_53.x;
        float _290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _292 = _288 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _294 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _296 = _294 * _290;
        float _298 = floor(_296);
        float _300 = -_298;
        float _302 = _296 + _300;
        _304 = _302;
        _306 = true;
    }
    else
    {
        _304 = _146;
    }
    _306 = false;
    float _308 = _304;
    float _310 = in.m_53.x;
    float _312 = _282 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _314 = in.m_53.z;
    float _316 = in.m_53.w;
    float _318 = _282 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _328 = in.m_53.y;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _330;
    float _334 = 1.0 / _322;
    float _336 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[4].x, _312);
    float _338 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[5].x, _318);
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _342 = _308 + _340;
    float _344 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[4].z, _336);
    float _346 = 1.0 / _326;
    float _348 = _282 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _350 = _344 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _352;
    float _356 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[6].x, _348);
    float _358 = _310 * 2.0;
    int _360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _362 = _360 != 0;
    int _364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _366 = _364 != 0;
    int _368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _370 = _368 != 0;
    float _372 = 1.0 / _332;
    float _374 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[6].z, _356);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _378 = _308 + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _382 = _308 + _380;
    float _384 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[5].z, _338);
    float _386 = _378 * _334;
    float _388 = _328 + _314;
    float _390 = floor(_358);
    float _392 = _382 * _346;
    float _394 = _310 + _314;
    float _396 = _388 + (-1.0);
    float _398 = _314 * 2.0;
    float _400 = _384 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _402 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _404 = _342 * _372;
    float _406 = _394 + (-1.0);
    float _408 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _410 = log2(_408);
    float _412 = _310 + _328;
    float _414 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _416 = _400 + _414;
    float _418 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _420 = !_366;
    int _422 = _420 ? 0 : 1;
    float _424 = _412 + (-1.0);
    bool _426 = _390 > 0.0;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _432 = _390 >= 0.0;
    bool _434 = isnan(_390);
    bool _436 = _432 || _434;
    bool _438 = isnan(0.0);
    bool _440 = _436 || _438;
    float _442 = _328 * 2.0;
    float _444 = floor(_398);
    int _446 = abs(_422);
    float _448 = _374 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _450 = _440 ? 0 : 1;
    float _452 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _454 = _350 + _452;
    float _456 = float(_446);
    float _458 = _416 * _416;
    int _460 = ~_450;
    int _462 = _460 + 1;
    int _464 = _462 + 1;
    float _466 = floor(_442);
    int _468 = _464;
    float _470 = _400;
    int _472 = as_type<int>(_310);
    if (!_426)
    {
        int _474 = ~_450;
        int _476 = _474 + 1;
        _468 = _476;
    }
    int _478 = _468;
    float _480 = fma(_354, _386, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _482 = fma(_430, _392, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _484 = float(_478);
    float _486 = fma(_454, _454, _458);
    bool _488 = _444 > 0.0;
    float _490 = _456 * _484;
    float _492 = _410 * _134;
    bool _494 = _444 >= 0.0;
    bool _496 = isnan(_444);
    bool _498 = _494 || _496;
    bool _500 = isnan(0.0);
    bool _502 = _498 || _500;
    float _504 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _506;
    bool _510 = _466 > 0.0;
    float _512 = exp2(_492);
    bool _514 = _466 >= 0.0;
    bool _516 = isnan(_466);
    bool _518 = _514 || _516;
    bool _520 = isnan(0.0);
    bool _522 = _518 || _520;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _536 = _502 ? 0 : 1;
    float _538 = fma(_526, _386, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _540 = _522 ? 0 : 1;
    float _542 = fma(_508, _386, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _544 = fma(_530, _392, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _546 = fma(_534, _392, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _548 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _550 = _448 + _548;
    int _552 = ~_536;
    int _554 = _552 + 1;
    int _556 = _554 + 1;
    int _558 = ~_540;
    int _560 = _558 + 1;
    int _562 = _560 + 1;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _564;
    int _568 = _556;
    int _570 = _562;
    bool _572 = _510;
    if (!_488)
    {
        int _574 = ~_536;
        int _576 = _574 + 1;
        _568 = _576;
    }
    int _578 = _568;
    float _580 = fma(_550, _550, _486);
    if (!_510)
    {
        int _582 = ~_540;
        int _584 = _582 + 1;
        _570 = _584;
    }
    int _586 = _570;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _590 = 1.0 + _588;
    float _592 = in.m_55.x;
    float _594 = in.m_55.y;
    float _596 = in.m_55.z;
    bool _598 = !_362;
    int _600 = _598 ? 0 : 1;
    float _602 = 1.0 / _590;
    int _604 = abs(_600);
    float _606 = -_512;
    float _608 = _606 + 1.0;
    bool _610 = !_370;
    int _612 = _610 ? 0 : 1;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _614;
    bool _618 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _620 = isnan(1.0);
    bool _622 = _618 || _620;
    bool _624 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _626 = _622 || _624;
    int _628 = abs(_612);
    float _630 = rsqrt(_580);
    float _632 = fma(_566, _404, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _634 = fma(_616, _404, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _636 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _638 = isnan(0.0);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _644 = _640 || _642;
    float _646 = float(_604);
    float _648 = float(_578);
    float _650 = _644 ? _608 : 0.0;
    float _652 = _646 * _648;
    float _654 = _490 * (-2.0);
    float _656 = float(_586);
    float _658 = _416 * _630;
    if (_626)
    {
        float _660 = _650 * _602;
        _156 = _660;
    }
    float _662 = _156;
    float _664 = fma(_654, _594, _594);
    float _666 = fma(_402, _654, _402);
    float _668 = -_658;
    float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[18].w, _416);
    float _672 = _454 * _630;
    float _674 = float(_628);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _676;
    float _680 = _670 * _670;
    float _682 = -_672;
    float _684 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[18].w, _454);
    float _686 = _550 * _630;
    float _688 = _328 + (-0.5);
    bool _690 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _692 = isnan(_308);
    bool _694 = _690 || _692;
    bool _696 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _698 = _694 || _696;
    float _700 = float(_698);
    float _702 = fma(_678, _404, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _704 = fma(_684, _684, _680);
    float _706 = -_686;
    float _708 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[18].w, _550);
    float _710 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[196].y, _664);
    float _712 = _674 * _656;
    bool _714 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _716 = isnan(_308);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _722 = _718 || _720;
    float _724 = float(_722);
    float _726 = -_700;
    float _728 = _726 + 1.0;
    float _730 = fma(_708, _708, _704);
    float _732 = fma(_666, _662, _710);
    float _734 = _712 * (-2.0);
    bool _736 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _738 = isnan(_308);
    bool _740 = _736 || _738;
    bool _742 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _744 = _740 || _742;
    float _746 = float(_744);
    float _748 = _724 * _728;
    float _750 = -_724;
    float _752 = _750 + 1.0;
    bool _754 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _756 = isnan(_308);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    float _766 = _314 + (-0.5);
    float _768 = fma(_734, _596, _596);
    float _770 = _746 * _752;
    float _772 = -_746;
    float _774 = _772 + 1.0;
    float _776 = fma(_418, _734, _418);
    float _778 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[196].z, _768);
    float _780 = sqrt(_730);
    float _782 = _764 * _774;
    float _784 = -_764;
    float _786 = _784 + 1.0;
    float _788 = fma(_776, _662, _778);
    float _790 = _652 * (-2.0);
    float _792 = _538 * _782;
    float _794 = _542 * _782;
    float _796 = _480 * _782;
    float _798 = fma(_790, _592, _592);
    float _800 = _310 + (-0.5);
    float _802 = in.m_51.x;
    float _804 = in.m_51.y;
    float _806 = in.m_51.z;
    float _808 = _788 * 0.15915493667125701904296875;
    float _810 = fma(_504, _790, _504);
    float _812 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[143].x, _792);
    float _814 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[143].y, _794);
    float _816 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[196].x, _798);
    float _818 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[143].z, _796);
    float _820 = fma(_544, _770, _812);
    float _822 = fma(_546, _770, _814);
    float _824 = fma(_810, _662, _816);
    float _826 = fma(_482, _770, _818);
    float _828 = in.m_57.x;
    float _830 = in.m_57.y;
    float _832 = in.m_57.z;
    float _834 = fma(_632, _748, _820);
    float _836 = _732 * 0.15915493667125701904296875;
    float _838 = fma(_702, _748, _826);
    float _840 = fma(_634, _748, _822);
    float _842 = _824 * 0.15915493667125701904296875;
    float _844 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[146].x, _834);
    float _846 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[146].z, _838);
    float _848 = _836 * 6.283185482025146484375;
    float _850 = sin(_848);
    float _852 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[146].y, _840);
    float _854 = _630 * _780;
    float _856 = _852 * _804;
    float _858 = _846 * _806;
    float _860 = _844 * _802;
    float _862 = _836 * 6.283185482025146484375;
    float _864 = cos(_862);
    float _866 = _856 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _868 = _858 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _870 = _860 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _872 = _854 * _866;
    float _874 = _854 * _868;
    float _876 = _854 * _870;
    float _878 = _808 * 6.283185482025146484375;
    float _880 = cos(_878);
    float _882 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _830);
    float _884 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _828);
    float _886 = _882 * _872;
    float _888 = _884 * _876;
    float _890 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _832);
    float _892 = _808 * 6.283185482025146484375;
    float _894 = sin(_892);
    float _896 = _890 * _874;
    float _898 = _842 * 6.283185482025146484375;
    float _900 = cos(_898);
    float _902 = _864 * _880;
    float _904 = _850 * _880;
    float _906 = _842 * 6.283185482025146484375;
    float _908 = sin(_906);
    float _910 = _864 * _894;
    float _912 = _850 * _894;
    float _914 = _880 * _900;
    float _916 = _894 * _900;
    float _918 = _850 * _900;
    float _920 = _864 * _900;
    float _922 = _914 * _886;
    float _924 = -_910;
    float _926 = fma(_908, _904, _924);
    float _928 = fma(_908, _912, _902);
    float _930 = -_904;
    float _932 = fma(_908, _910, _930);
    float _934 = fma(_908, _902, _912);
    float _936 = _926 * _886;
    float _938 = fma(_916, _888, _922);
    float _940 = _934 * _886;
    float _942 = fma(_928, _888, _936);
    float _944 = -_908;
    float _946 = fma(_944, _896, _938);
    float _948 = fma(_932, _888, _940);
    float _950 = fma(_918, _896, _942);
    float _952 = _946 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _954 = _946 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _956 = fma(_920, _896, _948);
    float _958 = fma(_950, (*spvDescriptorSet0.vp_c10)._m0[10].x, _952);
    float _960 = fma(_950, (*spvDescriptorSet0.vp_c10)._m0[8].x, _954);
    float _962 = fma(_956, (*spvDescriptorSet0.vp_c10)._m0[10].z, _958);
    float _964 = fma(_956, (*spvDescriptorSet0.vp_c10)._m0[8].z, _960);
    float _966 = _946 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _968 = _448 + _962;
    float _970 = _350 + _964;
    float _972 = fma(_950, (*spvDescriptorSet0.vp_c10)._m0[9].x, _966);
    float _974 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _976 = _968 + _974;
    float _978 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _980 = _970 + _978;
    float _982 = fma(_956, (*spvDescriptorSet0.vp_c10)._m0[9].z, _972);
    float _984 = _976 * _976;
    float _986 = _400 + _982;
    float _988 = fma(_980, _980, _984);
    float _990 = sqrt(_988);
    bool _992 = _990 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _994 = _950;
    float _996 = _984;
    if (!_992)
    {
        _994 = _970;
    }
    float _998 = _994;
    float _1000 = _998;
    if (!_992)
    {
        _470 = _968;
    }
    float _1002 = _470;
    float _1004 = _1002;
    if (!_992)
    {
        _996 = _986;
    }
    float _1006 = _996;
    bool _1008 = !_992;
    float _1010 = _1006;
    if (!_1008)
    {
        float _1012 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1014 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1016 = _990 + _1014;
        float _1018 = _986 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1020 = rsqrt(_988);
        float _1022 = _1016 * _1012;
        float _1024 = _1022 * 0.15915493667125701904296875;
        float _1026 = _1024 * 6.283185482025146484375;
        float _1028 = sin(_1026);
        float _1030 = _1024 * 6.283185482025146484375;
        float _1032 = cos(_1030);
        float _1034 = fma(_1028, _1018, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1036 = _1020 * _1034;
        float _1038 = _1032 + (-1.0);
        float _1040 = fma(_980, _1036, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1042 = fma(_976, _1036, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1044 = _1038 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1046 = fma(_986, _1032, _1044);
        _1010 = _1046;
        _1000 = _1040;
        _1004 = _1042;
    }
    float _1048 = _1010;
    float _1050 = _1000;
    float _1052 = _1004;
    float _1054 = -_658;
    float _1056 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1048);
    float _1058 = -_672;
    float _1060 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1050);
    float _1062 = -_686;
    float _1064 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1052);
    float _1066 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1068 = _1056 + _1066;
    float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1072 = _1060 + _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1076 = _1064 + _1074;
    float _1078 = _1068 * _1068;
    float _1080 = fma(_1072, _1072, _1078);
    float _1082 = fma(_1076, _1076, _1080);
    float _1084 = rsqrt(_1082);
    float _1086 = sqrt(_1082);
    float _1088 = _1084 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1090 = _1072 * _1088;
    float _1092 = _1076 * _1088;
    float _1094 = _1090 * _1090;
    float _1096 = _1092 * _1092;
    float _1098 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1100 = _1094 + _1096;
    float _1102 = precise::max(0.0, _1098);
    float _1104 = sqrt(_1100);
    float _1106 = -_1088;
    float _1108 = -_1102;
    float _1110 = fma(_1068, _1106, _1108);
    bool _1112 = _1104 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1114 = _1076;
    float _1116 = _1068;
    float _1118 = _1102;
    float _1120 = _1094;
    float _1122 = _1096;
    if (!_1112)
    {
        _1114 = _1090;
    }
    float _1124 = _1114;
    float _1126 = _1124;
    if (!_1112)
    {
        _1116 = _1110;
    }
    float _1128 = _1116;
    float _1130 = _1128;
    if (!_1112)
    {
        _1118 = _1092;
    }
    float _1132 = _1118;
    bool _1134 = !_1112;
    float _1136 = _1132;
    if (!_1134)
    {
        float _1138 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1140 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1142 = _1104 + _1140;
        float _1144 = _1110 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1146 = rsqrt(_1100);
        float _1148 = _1142 * _1138;
        float _1150 = _1148 * 0.15915493667125701904296875;
        float _1152 = _1150 * 6.283185482025146484375;
        float _1154 = sin(_1152);
        float _1156 = _1150 * 6.283185482025146484375;
        float _1158 = cos(_1156);
        float _1160 = fma(_1154, _1144, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1162 = _1146 * _1160;
        float _1164 = _1158 + (-1.0);
        float _1166 = _1090 * _1162;
        float _1168 = _1164 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1170 = _1092 * _1162;
        float _1172 = fma(_1110, _1158, _1168);
        float _1174 = _1166 * _1166;
        float _1176 = _1170 * _1170;
        _1130 = _1172;
        _1120 = _1174;
        _1122 = _1176;
        _1126 = _1166;
        _1136 = _1170;
    }
    float _1178 = _1130;
    float _1180 = _1120;
    float _1182 = _1122;
    float _1184 = _1126;
    float _1186 = _1136;
    float _1188 = fma(_1178, _1178, _1180);
    float _1190 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1192 = _1188 + _1182;
    float _1194 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1196 = fma(_1086, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1194);
    float _1198 = precise::clamp(_1196, 0.0, 1.0);
    float _1200 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1190);
    float _1202 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1204 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1206 = rsqrt(_1192);
    float _1208 = -_1198;
    float _1210 = _1208 + 1.0;
    float _1212 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1200);
    float _1214 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1216 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1202);
    float _1218 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1220 = _1212 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1222 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1214);
    float _1224 = abs(_1210);
    float _1226 = log2(_1224);
    float _1228 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1216);
    float _1230 = _1220 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1232 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1222);
    float _1234 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1204);
    float _1236 = _1228 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1238 = -_1230;
    float _1240 = fma(_1218, _1238, 1.0);
    float _1242 = _1232 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1244 = _1206 * _1184;
    float _1246 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1248 = _1206 * _1178;
    float _1250 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1234);
    float _1252 = _1244 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1254 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1246);
    float _1256 = _1206 * _1186;
    float _1258 = _1250 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1260 = _1226 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1262 = -_1252;
    float _1264 = fma(_1248, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1262);
    float _1266 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1254);
    float _1268 = log2(_1240);
    float _1270 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1272 = -_1256;
    float _1274 = fma(_1272, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1264);
    float _1276 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1266);
    float _1278 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1280 = fma(_1274, -0.5, 0.5);
    float _1282 = fma(_1274, 0.5, 0.5);
    float _1284 = exp2(_1260);
    float _1286 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1278);
    float _1288 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1270);
    float _1290 = _1248 + 1.0;
    float _1292 = fma(_1282, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1294 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1286);
    float _1296 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1288);
    float _1298 = 1.0 / _1276;
    float _1300 = fma(_1282, _1292, -0.212114393711090087890625);
    float _1302 = _1268 * 0.693147182464599609375;
    float _1304 = fma(_1282, _1300, 1.570728778839111328125);
    float _1306 = _1302 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1308 = sqrt(_1280);
    float _1310 = -_1248;
    float _1312 = fma(_1284, _1290, _1310);
    float _1314 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1294);
    float _1316 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1296);
    float _1318 = fma(_1312, 0.5, 0.5);
    float _1320 = _1314 * _1298;
    float _1322 = _1316 * _1298;
    float _1324 = fma(_1320, 0.5, 0.5);
    float _1326 = fma(_1322, -0.5, 0.5);
    float _1328 = _1308 * 0.636619746685028076171875;
    float3 _4079 = float3(_1324, _1326, _1306);
    float _1330 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4079, float3(0.0), isnan(_4079)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4079, float3(0.0), isnan(_4079)), level(0.0)).x;
    float _1332 = -_1304;
    float _1334 = fma(_1328, _1332, 1.0);
    float2 _4095 = float2(_1334, _1318);
    float3 _1338 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4095, float2(0.0), isnan(_4095)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4095, float2(0.0), isnan(_4095)), level(0.0)).xyz;
    float _1340 = _1338.x;
    float _1342 = _1338.y;
    float _1344 = _1338.z;
    float _1346 = in.m_59.x;
    bool _1348 = _314 > 0.5;
    float _1350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1354 = _1352 != 0;
    float _1356 = in.m_59.y;
    int _1358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1360 = _1358 != 0;
    float _1362 = _1226 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1364 = _328 > 0.5;
    out.m_61.x = _1060;
    out.m_61.y = _1056;
    out.m_61.z = _1064;
    bool _1366 = _316 > 0.5;
    float _1368 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1370 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1372 = _1326;
    float _1374 = _1296;
    float _1376 = _1276;
    float _1378 = _1316;
    float _1380 = _1314;
    if (_1354)
    {
        float _1382 = in.m_53.z;
        _1372 = _1382;
    }
    float _1384 = _1372;
    float _1386 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    if (_1360)
    {
        bool _1388 = _310 > 0.5;
        _572 = _1388;
    }
    bool _1390 = _572;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1398 = _1396 != 0;
    float _1400 = _1386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1402 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1404 = as_type<int>(_1402);
    float _1406 = _1346;
    if (_1360)
    {
        float _1408 = -_1346;
        float _1410 = _1408 + 1.0;
        _472 = as_type<int>(_1410);
    }
    int _1412 = _472;
    if (!_1360)
    {
        _1374 = _1346;
    }
    float _1414 = _1374;
    float _1416 = _1394 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1418 = 0.0;
    float _1420 = _1414;
    if (!_1354)
    {
        _1418 = _1346;
    }
    float _1422 = _1418;
    float _1424 = -_1356;
    float _1426 = _1424 + 1.0;
    float _1428 = _1356;
    float _1430 = _1422;
    float _1432 = _1426;
    if (_1360)
    {
        float _1434 = _1390 ? as_type<float>(_1412) : _1346;
        _1420 = _1434;
    }
    float _1436 = _1420;
    float _1438 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1442 = _1440 != 0;
    float _1444 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1370);
    int _1446 = _1348 ? as_type<int>(_1426) : as_type<int>(_1356);
    out.m_63.w = _1276;
    int _1448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1450 = _1448 != 0;
    float _1452 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1444);
    float _1454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1458 = _1456 != 0;
    float _1460 = _1442 ? as_type<float>(_1446) : _1356;
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1464 = _1364 ? as_type<int>(_1426) : as_type<int>(_1356);
    bool _1466 = _1442;
    int _1468 = as_type<int>(_1462);
    if (_1354)
    {
        bool _1470 = _1384 > 0.5;
        _1466 = _1470;
    }
    bool _1472 = _1466;
    float _1474 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1476 = in.m_65.x;
    float _1478 = in.m_65.y;
    float _1480 = in.m_65.z;
    float _1482 = _1458 ? as_type<float>(_1464) : _1356;
    bool _1484 = _830 != 0.0;
    bool _1486 = isnan(_830);
    bool _1488 = _1484 || _1486;
    bool _1490 = isnan(0.0);
    bool _1492 = _1488 || _1490;
    out.m_67.x = _1400;
    out.m_67.y = _1402;
    out.m_67.z = _1416;
    out.m_67.w = _1462;
    bool _1494 = _828 == 0.0;
    bool _1496 = !_1492;
    bool _1498 = _1494 && _1496;
    float _1500 = exp2(_1362);
    float _1502 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1504 = _832 == 0.0;
    bool _1506 = _1504 && _1498;
    float _1508 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1510 = _1502 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1512 = _1510;
    if (_1398)
    {
        float _1514 = _1366 ? _1426 : _1356;
        _1428 = _1514;
    }
    float _1516 = _1428;
    if (_1354)
    {
        float _1518 = -_1346;
        float _1520 = _1518 + 1.0;
        _1404 = as_type<int>(_1520);
    }
    int _1522 = _1404;
    if (_1450)
    {
        float _1524 = -_1346;
        float _1526 = _1524 + 1.0;
        _1468 = as_type<int>(_1526);
    }
    int _1528 = _1468;
    float _1530 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1532 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1534 = _1508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1536 = _1534;
    if (_1354)
    {
        float _1538 = _1472 ? as_type<float>(_1522) : _1346;
        _1430 = _1538;
    }
    float _1540 = _1430;
    float _1542 = _1530 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1450)
    {
        float _1544 = _1364 ? as_type<float>(_1528) : _1346;
        _1406 = _1544;
    }
    float _1546 = _1406;
    float _1548 = -_1500;
    float _1550 = _1548 + 1.0;
    float _1552 = in.m_69.x;
    float _1554 = in.m_69.y;
    float _1556 = in.m_69.z;
    float _1558 = in.m_69.w;
    float _1560 = 0.0;
    if (_1506)
    {
        _1560 = _1476;
    }
    float _1562 = _1560;
    float _1564 = 0.0;
    float _1566 = _1562;
    if (_1506)
    {
        _1564 = _1478;
    }
    float _1568 = _1564;
    out.m_71.x = _1510;
    out.m_71.y = _1534;
    out.m_71.z = _1542;
    out.m_71.w = _1532;
    float _1570 = _1568;
    if (_1506)
    {
        _1432 = _1562;
    }
    float _1572 = _1432;
    float _1574 = _1550 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1576 = _1572;
    if (!_1506)
    {
        _1566 = _1476;
    }
    float _1578 = _1566;
    float _1580 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    if (!_1506)
    {
        float _1582 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1578);
        _1576 = _1582;
    }
    float _1584 = _1576;
    float _1586 = _1436 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1588 = _1586 * _1350;
    if (_1506)
    {
        _1536 = _1568;
    }
    float _1590 = _1536;
    float _1592 = _1516 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1594 = _1590;
    if (!_1506)
    {
        _1570 = _1478;
    }
    float _1596 = _1570;
    float _1598 = _1546 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    if (_1506)
    {
        _1512 = _1480;
    }
    float _1600 = _1512;
    float _1602 = _1600;
    if (!_1506)
    {
        float _1604 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1480);
        _1602 = _1604;
    }
    float _1606 = _1602;
    float _1608 = _1556 * _1578;
    if (!_1506)
    {
        float _1610 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1596);
        _1594 = _1610;
    }
    float _1612 = _1594;
    float _1614 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1616 = _1540 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1618 = _1554 * _1480;
    float _1620 = _1592 * _1454;
    float _1622 = _1614 * _1368;
    float _1624 = -_1608;
    float _1626 = fma(_1552, _1480, _1624);
    float _1628 = _1616 * _1438;
    float _1630 = _1552 * _1596;
    float _1632 = _1598 * _1580;
    float _1634 = -_1618;
    float _1636 = fma(_1556, _1596, _1634);
    float _1638 = _1626 * _1558;
    float _1640 = _914 * _1612;
    out.m_73.x = _1588;
    out.m_73.y = _1622;
    out.m_73.z = _1628;
    out.m_73.w = _1620;
    float _1642 = _1460 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1644 = -_1630;
    float _1646 = fma(_1554, _1578, _1644);
    float _1648 = _914 * _1554;
    float _1650 = _1636 * _1558;
    float _1652 = _914 * _1638;
    float _1654 = fma(_916, _1584, _1640);
    float _1656 = _1642 * _1474;
    float _1658 = fma(_916, _1552, _1648);
    float _1660 = _1646 * _1558;
    float _1662 = fma(_916, _1650, _1652);
    float _1664 = -_908;
    float _1666 = fma(_1664, _1606, _1654);
    float _1668 = -_908;
    float _1670 = fma(_1668, _1556, _1658);
    out.m_75.x = _1632;
    out.m_75.y = _1656;
    float _1672 = _926 * _1554;
    float _1674 = _934 * _1554;
    float _1676 = _926 * _1612;
    float _1678 = -_908;
    float _1680 = fma(_1678, _1660, _1662);
    float _1682 = fma(_928, _1552, _1672);
    float _1684 = fma(_932, _1552, _1674);
    float _1686 = fma(_928, _1584, _1676);
    float _1688 = _1666 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1690 = fma(_918, _1556, _1682);
    float _1692 = fma(_920, _1556, _1684);
    float _1694 = fma(_918, _1606, _1686);
    float _1696 = _1666 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1698 = _1666 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1700 = _926 * _1638;
    float _1702 = _934 * _1612;
    float _1704 = fma(_1694, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1688);
    float _1706 = fma(_1694, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1696);
    float _1708 = fma(_1694, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1698);
    float _1710 = _934 * _1638;
    float _1712 = _1670 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1714 = _1670 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1716 = fma(_928, _1650, _1700);
    float _1718 = _1670 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1720 = fma(_932, _1584, _1702);
    float _1722 = fma(_932, _1650, _1710);
    float _1724 = fma(_1690, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1712);
    float _1726 = fma(_1690, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1714);
    float _1728 = fma(_918, _1660, _1716);
    float _1730 = fma(_1690, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1718);
    float _1732 = _1680 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1734 = _1680 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1736 = _1680 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1738 = fma(_920, _1606, _1720);
    float _1740 = fma(_920, _1660, _1722);
    float _1742 = fma(_1728, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1732);
    float _1744 = fma(_1728, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1734);
    float _1746 = fma(_1728, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1736);
    float _1748 = fma(_1692, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1724);
    float _1750 = _1314 + _1276;
    float _1752 = fma(_1692, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1726);
    float _1754 = fma(_1740, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1742);
    float _1756 = fma(_1740, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1744);
    float _1758 = fma(_1740, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1746);
    float _1760 = _1750 * 0.5;
    float _1762 = fma(_1738, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1704);
    float _1764 = _1276 * 0.5;
    float _1766 = fma(_1692, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1730);
    float _1768 = fma(_1738, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1706);
    float _1770 = fma(_1738, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1708);
    float _1772 = fma(_1316, -0.5, _1764);
    float _1774 = -_1574;
    float _1776 = _1774 + 1.0;
    out.m_77.x = _1754;
    out.m_77.y = _1756;
    out.m_77.z = _1758;
    bool _1778 = _1086 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1780 = isnan(_1086);
    bool _1782 = _1778 || _1780;
    bool _1784 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1786 = _1782 || _1784;
    float _1788 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1452);
    out.m_63.x = _1760;
    out.m_63.y = _1772;
    out.m_79.x = _1762;
    out.m_79.y = _1768;
    out.m_79.z = _1770;
    out.m_81.x = _1748;
    out.m_81.y = _1752;
    out.m_81.z = _1766;
    out.gl_Position.x = _1314;
    out.gl_Position.y = _1316;
    out.gl_Position.z = _1788;
    out.gl_Position.w = _1276;
    float _1790 = _1748;
    float _1792 = _1788;
    if (!_1786)
    {
        _1790 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1794 = _1790;
    float _1796 = _1794;
    float _1798 = _1794;
    if (!_1786)
    {
        _1376 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1800 = _1376;
    float _1802 = _1800;
    float _1804 = _1800;
    if (!_1786)
    {
        _1792 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1806 = _1792;
    float _1808 = _1806;
    float _1810 = _1806;
    if (!_1786)
    {
        _1378 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1812 = _1378;
    float _1814 = _1812;
    float _1816 = _1812;
    if (!_1786)
    {
        _1380 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1818 = _1380;
    float _1820 = _1574 * _1330;
    float _1822 = _1340 * _1820;
    float _1824 = _1342 * _1820;
    float _1826 = _1344 * _1820;
    float _1828 = _1820;
    float _1830 = _1818;
    float _1832 = _1818;
    if (!_1786)
    {
        _1828 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1834 = _1828;
    out.m_83.x = _1822;
    out.m_83.y = _1824;
    out.m_83.z = _1826;
    out.m_83.w = _1776;
    bool _1836 = !_1786;
    float _1838 = _1834;
    float _1840 = _1834;
    if (!_1836)
    {
        bool _1842 = _1086 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1844 = isnan(_1086);
        bool _1846 = _1842 || _1844;
        bool _1848 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1850 = _1846 || _1848;
        if (!_1850)
        {
            float _1852 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1854 = _1086 + _1852;
            float _1856 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1858 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1856;
            float _1860 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1862 = _1860 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1864 = 1.0 / _1858;
            float _1866 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1868 = _1866 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1870 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1872 = _1870 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1874 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1876 = _1874 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1878 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1880 = _1878 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1882 = _1854 * _1864;
            float _1884 = precise::clamp(_1882, 0.0, 1.0);
            float _1886 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1888 = _1886 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1890 = fma(_1884, _1862, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1892 = fma(_1884, _1888, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1894 = fma(_1884, _1868, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1896 = fma(_1884, _1872, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1898 = fma(_1884, _1876, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1900 = fma(_1884, _1880, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1804 = _1894;
            _1832 = _1898;
            _1798 = _1890;
            _1816 = _1896;
            _1810 = _1892;
            _1840 = _1900;
            _1902 = true;
        }
        else
        {
            bool _1904 = _1086 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1906 = isnan(_1086);
            bool _1908 = _1904 || _1906;
            bool _1910 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1912 = _1908 || _1910;
            if (!_1912)
            {
                _1796 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1914 = _1796;
            _1798 = _1914;
            if (!_1912)
            {
                _1802 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1916 = _1802;
            _1804 = _1916;
            if (!_1912)
            {
                _1808 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1918 = _1808;
            _1810 = _1918;
            if (!_1912)
            {
                _1814 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1920 = _1814;
            _1816 = _1920;
            if (!_1912)
            {
                _1830 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1922 = _1830;
            _1832 = _1922;
            if (!_1912)
            {
                _1838 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1924 = _1838;
            bool _1926 = !_1912;
            _1840 = _1924;
            if (!_1926)
            {
                bool _1928 = _1086 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1930 = isnan(_1086);
                bool _1932 = _1928 || _1930;
                bool _1934 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1936 = _1932 || _1934;
                if (!_1936)
                {
                    float _1938 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1940 = _1086 + _1938;
                    float _1942 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1944 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1942;
                    float _1946 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1948 = _1946 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1950 = 1.0 / _1944;
                    float _1952 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1954 = _1952 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1956 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1958 = _1956 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1960 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1962 = _1960 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1964 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1966 = _1964 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1968 = _1940 * _1950;
                    float _1970 = precise::clamp(_1968, 0.0, 1.0);
                    float _1972 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1974 = _1972 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1976 = fma(_1970, _1948, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1978 = fma(_1970, _1974, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1980 = fma(_1970, _1954, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1982 = fma(_1970, _1958, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1984 = fma(_1970, _1962, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1986 = fma(_1970, _1966, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1804 = _1980;
                    _1832 = _1984;
                    _1798 = _1976;
                    _1816 = _1982;
                    _1810 = _1978;
                    _1840 = _1986;
                    _1902 = true;
                }
                else
                {
                    _1804 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1832 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1798 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1816 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1810 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1840 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1902 = false;
    float _1988 = _1804;
    float _1990 = _1832;
    float _1992 = _1798;
    float _1994 = _1816;
    float _1996 = _1810;
    float _1998 = _1840;
    float _2000 = fma(_1768, -0.5, 0.5);
    float _2002 = precise::clamp(_2000, 0.0, 1.0);
    float _2004 = -_1988;
    float _2006 = _2004 + _1990;
    float _2008 = -_1992;
    float _2010 = _2008 + _1994;
    float _2012 = -_1996;
    float _2014 = _2012 + _1998;
    bool _2016 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2018 = fma(_2002, _2006, _1988);
    float _2020 = fma(_2002, _2010, _1992);
    float _2022 = fma(_2002, _2014, _1996);
    float _2024 = _2018 * 0.586610972881317138671875;
    out.m_45.x = 1.0;
    float _2026 = fma(_2020, 0.298911988735198974609375, _2024);
    out.m_85.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2028 = fma(_2022, 0.114477999508380889892578125, _2026);
    float _2030 = -_2028;
    float _2032 = _2020 + _2030;
    float _2034 = -_2028;
    float _2036 = _2018 + _2034;
    float _2038 = -_2028;
    float _2040 = _2022 + _2038;
    out.m_87.x = 0.0;
    float _2042 = fma(_2032, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2028);
    float _2044 = fma(_2036, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2028);
    float _2046 = fma(_2040, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2028);
    out.m_89.x = _2042;
    out.m_89.y = _2044;
    out.m_89.z = _2046;
    if (!_2016)
    {
        return out;
    }
    float _2048 = -_1056;
    float _2050 = _2048 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2052 = -_1060;
    float _2054 = _2052 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2056 = -_1064;
    float _2058 = _2056 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2060 = _2050 * _2050;
    float _2062 = fma(_2054, _2054, _2060);
    float _2064 = fma(_2058, _2058, _2062);
    float _2066 = sqrt(_2064);
    float _2068 = rsqrt(_2064);
    float _2070 = -_2066;
    float _2072 = _2070 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2074 = _2072 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2076 = precise::clamp(_2074, 0.0, 1.0);
    float _2078 = _2054 * _2068;
    float _2080 = _2050 * _2068;
    float _2082 = abs(_2076);
    float _2084 = log2(_2082);
    float _2086 = _2058 * _2068;
    float _2088 = _2078 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2090 = _1768 * _2080;
    float _2092 = -_2080;
    float _2094 = -_2088;
    float _2096 = fma(_2092, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2094);
    float _2098 = fma(_1762, _2078, _2090);
    float _2100 = -_2086;
    float _2102 = fma(_2100, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2096);
    float _2104 = fma(_1770, _2086, _2098);
    float _2106 = precise::clamp(_2104, 0.0, 1.0);
    float _2108 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2110 = _2102 + _2108;
    float _2112 = _2084 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2114 = _2110 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2116 = precise::clamp(_2114, 0.0, 1.0);
    float _2118 = exp2(_2112);
    float _2120 = _2118 * _2116;
    float _2122 = _2106 * _2120;
    float _2124 = _2122 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2126 = _2122 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2128 = _2122 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _2124;
    out.m_87.y = _2126;
    out.m_87.z = _2128;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1902 = false;
    bool _306 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2184 = as_type<float>(_122);
        out.gl_Position.z = _2184;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_47.w;
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
    out.m_49.x = _146;
    float _154 = _126;
    float _156 = _134;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _154;
    if (_152)
    {
        out.m_45.x = 0.0;
    }
    if (_152)
    {
        float _160 = _158 * 5.0;
        _124 = as_type<int>(_160);
    }
    int _162 = _124;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2256 = as_type<float>(_162);
        out.gl_Position.z = _2256;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _164 = in.m_51.w;
    float _166 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    float _178 = in.m_47.x;
    float _180 = in.m_47.y;
    float _182 = in.m_47.z;
    float _184 = in.m_42.x;
    float _186 = in.m_42.y;
    float _188 = in.m_42.z;
    float _190 = 0.0;
    float _192 = _166;
    if (!_176)
    {
        float _194 = _166 * _166;
        float _196 = _194 * 0.5;
        _190 = _196;
    }
    float _198 = _190;
    float _200 = _198;
    if (!_176)
    {
        float _202 = _198 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _202;
    }
    float _204 = _200;
    bool _206 = !_176;
    float _208 = _204;
    if (!_206)
    {
        float _210 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = log2(_210);
        float _214 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _216 = _214 + 1.0;
        float _218 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _220 = _166 * _212;
        float _222 = 1.0 / _216;
        float _224 = _218 * 0.693147182464599609375;
        float _226 = exp2(_220);
        float _228 = 1.0 / _224;
        float _230 = _226 + (-1.0);
        float _232 = -_230;
        float _234 = fma(_232, _228, _166);
        float _236 = _234 * _222;
        float _238 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _208 = _238;
    }
    float _240 = _208;
    bool _242 = !_176;
    if (!_242)
    {
        float _244 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _246 = log2(_244);
        float _248 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _250 = _248 + 1.0;
        float _252 = 1.0 / _250;
        float _254 = _166 * _246;
        float _256 = exp2(_254);
        float _258 = -_256;
        float _260 = _258 + 1.0;
        float _262 = _260 * _252;
        _192 = _262;
    }
    float _264 = _192;
    bool _266 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _268 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _270 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _272 = _240 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _274 = fma(_264, _178, _268);
    float _276 = fma(_264, _180, _270);
    float _278 = fma(_264, _182, _272);
    float _280 = fma(_274, _164, _184);
    float _282 = fma(_276, _164, _186);
    float _284 = fma(_278, _164, _188);
    bool _286 = !_266;
    float _304;
    if (!_286)
    {
        float _288 = in.m_53.x;
        float _290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _292 = _288 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _294 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _296 = _294 * _290;
        float _298 = floor(_296);
        float _300 = -_298;
        float _302 = _296 + _300;
        _304 = _302;
        _306 = true;
    }
    else
    {
        _304 = _146;
    }
    _306 = false;
    float _308 = _304;
    float _310 = in.m_53.x;
    float _312 = _282 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _314 = in.m_53.z;
    float _316 = in.m_53.w;
    float _318 = _282 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _328 = in.m_53.y;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _330;
    float _334 = 1.0 / _322;
    float _336 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[4].x, _312);
    float _338 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[5].x, _318);
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _342 = _308 + _340;
    float _344 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[4].z, _336);
    float _346 = 1.0 / _326;
    float _348 = _282 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _350 = _344 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _352;
    float _356 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[6].x, _348);
    float _358 = _310 * 2.0;
    int _360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _362 = _360 != 0;
    int _364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _366 = _364 != 0;
    int _368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _370 = _368 != 0;
    float _372 = 1.0 / _332;
    float _374 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[6].z, _356);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _378 = _308 + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _382 = _308 + _380;
    float _384 = fma(_284, (*spvDescriptorSet0.vp_c10)._m0[5].z, _338);
    float _386 = _378 * _334;
    float _388 = _328 + _314;
    float _390 = floor(_358);
    float _392 = _382 * _346;
    float _394 = _310 + _314;
    float _396 = _388 + (-1.0);
    float _398 = _314 * 2.0;
    float _400 = _384 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _402 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _404 = _342 * _372;
    float _406 = _394 + (-1.0);
    float _408 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _410 = log2(_408);
    float _412 = _310 + _328;
    float _414 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _416 = _400 + _414;
    float _418 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _420 = !_366;
    int _422 = _420 ? 0 : 1;
    float _424 = _412 + (-1.0);
    bool _426 = _390 > 0.0;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _432 = _390 >= 0.0;
    bool _434 = isnan(_390);
    bool _436 = _432 || _434;
    bool _438 = isnan(0.0);
    bool _440 = _436 || _438;
    float _442 = _328 * 2.0;
    float _444 = floor(_398);
    int _446 = abs(_422);
    float _448 = _374 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _450 = _440 ? 0 : 1;
    float _452 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _454 = _350 + _452;
    float _456 = float(_446);
    float _458 = _416 * _416;
    int _460 = ~_450;
    int _462 = _460 + 1;
    int _464 = _462 + 1;
    float _466 = floor(_442);
    int _468 = _464;
    float _470 = _400;
    int _472 = as_type<int>(_310);
    if (!_426)
    {
        int _474 = ~_450;
        int _476 = _474 + 1;
        _468 = _476;
    }
    int _478 = _468;
    float _480 = fma(_354, _386, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _482 = fma(_430, _392, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _484 = float(_478);
    float _486 = fma(_454, _454, _458);
    bool _488 = _444 > 0.0;
    float _490 = _456 * _484;
    float _492 = _410 * _134;
    bool _494 = _444 >= 0.0;
    bool _496 = isnan(_444);
    bool _498 = _494 || _496;
    bool _500 = isnan(0.0);
    bool _502 = _498 || _500;
    float _504 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _506;
    bool _510 = _466 > 0.0;
    float _512 = exp2(_492);
    bool _514 = _466 >= 0.0;
    bool _516 = isnan(_466);
    bool _518 = _514 || _516;
    bool _520 = isnan(0.0);
    bool _522 = _518 || _520;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _536 = _502 ? 0 : 1;
    float _538 = fma(_526, _386, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _540 = _522 ? 0 : 1;
    float _542 = fma(_508, _386, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _544 = fma(_530, _392, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _546 = fma(_534, _392, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _548 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _550 = _448 + _548;
    int _552 = ~_536;
    int _554 = _552 + 1;
    int _556 = _554 + 1;
    int _558 = ~_540;
    int _560 = _558 + 1;
    int _562 = _560 + 1;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _564;
    int _568 = _556;
    int _570 = _562;
    bool _572 = _510;
    if (!_488)
    {
        int _574 = ~_536;
        int _576 = _574 + 1;
        _568 = _576;
    }
    int _578 = _568;
    float _580 = fma(_550, _550, _486);
    if (!_510)
    {
        int _582 = ~_540;
        int _584 = _582 + 1;
        _570 = _584;
    }
    int _586 = _570;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _590 = 1.0 + _588;
    float _592 = in.m_55.x;
    float _594 = in.m_55.y;
    float _596 = in.m_55.z;
    bool _598 = !_362;
    int _600 = _598 ? 0 : 1;
    float _602 = 1.0 / _590;
    int _604 = abs(_600);
    float _606 = -_512;
    float _608 = _606 + 1.0;
    bool _610 = !_370;
    int _612 = _610 ? 0 : 1;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _614;
    bool _618 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _620 = isnan(1.0);
    bool _622 = _618 || _620;
    bool _624 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _626 = _622 || _624;
    int _628 = abs(_612);
    float _630 = rsqrt(_580);
    float _632 = fma(_566, _404, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _634 = fma(_616, _404, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _636 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _638 = isnan(0.0);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _644 = _640 || _642;
    float _646 = float(_604);
    float _648 = float(_578);
    float _650 = _644 ? _608 : 0.0;
    float _652 = _646 * _648;
    float _654 = _490 * (-2.0);
    float _656 = float(_586);
    float _658 = _416 * _630;
    if (_626)
    {
        float _660 = _650 * _602;
        _156 = _660;
    }
    float _662 = _156;
    float _664 = fma(_654, _594, _594);
    float _666 = fma(_402, _654, _402);
    float _668 = -_658;
    float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[18].w, _416);
    float _672 = _454 * _630;
    float _674 = float(_628);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _676;
    float _680 = _670 * _670;
    float _682 = -_672;
    float _684 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[18].w, _454);
    float _686 = _550 * _630;
    float _688 = _328 + (-0.5);
    bool _690 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _692 = isnan(_308);
    bool _694 = _690 || _692;
    bool _696 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _698 = _694 || _696;
    float _700 = float(_698);
    float _702 = fma(_678, _404, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _704 = fma(_684, _684, _680);
    float _706 = -_686;
    float _708 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[18].w, _550);
    float _710 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[196].y, _664);
    float _712 = _674 * _656;
    bool _714 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _716 = isnan(_308);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _722 = _718 || _720;
    float _724 = float(_722);
    float _726 = -_700;
    float _728 = _726 + 1.0;
    float _730 = fma(_708, _708, _704);
    float _732 = fma(_666, _662, _710);
    float _734 = _712 * (-2.0);
    bool _736 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _738 = isnan(_308);
    bool _740 = _736 || _738;
    bool _742 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _744 = _740 || _742;
    float _746 = float(_744);
    float _748 = _724 * _728;
    float _750 = -_724;
    float _752 = _750 + 1.0;
    bool _754 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _756 = isnan(_308);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    float _766 = _314 + (-0.5);
    float _768 = fma(_734, _596, _596);
    float _770 = _746 * _752;
    float _772 = -_746;
    float _774 = _772 + 1.0;
    float _776 = fma(_418, _734, _418);
    float _778 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[196].z, _768);
    float _780 = sqrt(_730);
    float _782 = _764 * _774;
    float _784 = -_764;
    float _786 = _784 + 1.0;
    float _788 = fma(_776, _662, _778);
    float _790 = _652 * (-2.0);
    float _792 = _538 * _782;
    float _794 = _542 * _782;
    float _796 = _480 * _782;
    float _798 = fma(_790, _592, _592);
    float _800 = _310 + (-0.5);
    float _802 = in.m_51.x;
    float _804 = in.m_51.y;
    float _806 = in.m_51.z;
    float _808 = _788 * 0.15915493667125701904296875;
    float _810 = fma(_504, _790, _504);
    float _812 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[143].x, _792);
    float _814 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[143].y, _794);
    float _816 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[196].x, _798);
    float _818 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[143].z, _796);
    float _820 = fma(_544, _770, _812);
    float _822 = fma(_546, _770, _814);
    float _824 = fma(_810, _662, _816);
    float _826 = fma(_482, _770, _818);
    float _828 = in.m_57.x;
    float _830 = in.m_57.y;
    float _832 = in.m_57.z;
    float _834 = fma(_632, _748, _820);
    float _836 = _732 * 0.15915493667125701904296875;
    float _838 = fma(_702, _748, _826);
    float _840 = fma(_634, _748, _822);
    float _842 = _824 * 0.15915493667125701904296875;
    float _844 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[146].x, _834);
    float _846 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[146].z, _838);
    float _848 = _836 * 6.283185482025146484375;
    float _850 = sin(_848);
    float _852 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[146].y, _840);
    float _854 = _630 * _780;
    float _856 = _852 * _804;
    float _858 = _846 * _806;
    float _860 = _844 * _802;
    float _862 = _836 * 6.283185482025146484375;
    float _864 = cos(_862);
    float _866 = _856 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _868 = _858 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _870 = _860 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _872 = _854 * _866;
    float _874 = _854 * _868;
    float _876 = _854 * _870;
    float _878 = _808 * 6.283185482025146484375;
    float _880 = cos(_878);
    float _882 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _830);
    float _884 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _828);
    float _886 = _882 * _872;
    float _888 = _884 * _876;
    float _890 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _832);
    float _892 = _808 * 6.283185482025146484375;
    float _894 = sin(_892);
    float _896 = _890 * _874;
    float _898 = _842 * 6.283185482025146484375;
    float _900 = cos(_898);
    float _902 = _864 * _880;
    float _904 = _850 * _880;
    float _906 = _842 * 6.283185482025146484375;
    float _908 = sin(_906);
    float _910 = _864 * _894;
    float _912 = _850 * _894;
    float _914 = _880 * _900;
    float _916 = _894 * _900;
    float _918 = _850 * _900;
    float _920 = _864 * _900;
    float _922 = _914 * _886;
    float _924 = -_910;
    float _926 = fma(_908, _904, _924);
    float _928 = fma(_908, _912, _902);
    float _930 = -_904;
    float _932 = fma(_908, _910, _930);
    float _934 = fma(_908, _902, _912);
    float _936 = _926 * _886;
    float _938 = fma(_916, _888, _922);
    float _940 = _934 * _886;
    float _942 = fma(_928, _888, _936);
    float _944 = -_908;
    float _946 = fma(_944, _896, _938);
    float _948 = fma(_932, _888, _940);
    float _950 = fma(_918, _896, _942);
    float _952 = _946 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _954 = _946 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _956 = fma(_920, _896, _948);
    float _958 = fma(_950, (*spvDescriptorSet0.vp_c10)._m0[10].x, _952);
    float _960 = fma(_950, (*spvDescriptorSet0.vp_c10)._m0[8].x, _954);
    float _962 = fma(_956, (*spvDescriptorSet0.vp_c10)._m0[10].z, _958);
    float _964 = fma(_956, (*spvDescriptorSet0.vp_c10)._m0[8].z, _960);
    float _966 = _946 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _968 = _448 + _962;
    float _970 = _350 + _964;
    float _972 = fma(_950, (*spvDescriptorSet0.vp_c10)._m0[9].x, _966);
    float _974 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _976 = _968 + _974;
    float _978 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _980 = _970 + _978;
    float _982 = fma(_956, (*spvDescriptorSet0.vp_c10)._m0[9].z, _972);
    float _984 = _976 * _976;
    float _986 = _400 + _982;
    float _988 = fma(_980, _980, _984);
    float _990 = sqrt(_988);
    bool _992 = _990 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _994 = _950;
    float _996 = _984;
    if (!_992)
    {
        _994 = _970;
    }
    float _998 = _994;
    float _1000 = _998;
    if (!_992)
    {
        _470 = _968;
    }
    float _1002 = _470;
    float _1004 = _1002;
    if (!_992)
    {
        _996 = _986;
    }
    float _1006 = _996;
    bool _1008 = !_992;
    float _1010 = _1006;
    if (!_1008)
    {
        float _1012 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1014 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1016 = _990 + _1014;
        float _1018 = _986 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1020 = rsqrt(_988);
        float _1022 = _1016 * _1012;
        float _1024 = _1022 * 0.15915493667125701904296875;
        float _1026 = _1024 * 6.283185482025146484375;
        float _1028 = sin(_1026);
        float _1030 = _1024 * 6.283185482025146484375;
        float _1032 = cos(_1030);
        float _1034 = fma(_1028, _1018, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1036 = _1020 * _1034;
        float _1038 = _1032 + (-1.0);
        float _1040 = fma(_980, _1036, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1042 = fma(_976, _1036, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1044 = _1038 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1046 = fma(_986, _1032, _1044);
        _1010 = _1046;
        _1000 = _1040;
        _1004 = _1042;
    }
    float _1048 = _1010;
    float _1050 = _1000;
    float _1052 = _1004;
    float _1054 = -_658;
    float _1056 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1048);
    float _1058 = -_672;
    float _1060 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1050);
    float _1062 = -_686;
    float _1064 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1052);
    float _1066 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1068 = _1056 + _1066;
    float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1072 = _1060 + _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1076 = _1064 + _1074;
    float _1078 = _1068 * _1068;
    float _1080 = fma(_1072, _1072, _1078);
    float _1082 = fma(_1076, _1076, _1080);
    float _1084 = rsqrt(_1082);
    float _1086 = sqrt(_1082);
    float _1088 = _1084 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1090 = _1072 * _1088;
    float _1092 = _1076 * _1088;
    float _1094 = _1090 * _1090;
    float _1096 = _1092 * _1092;
    float _1098 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1100 = _1094 + _1096;
    float _1102 = precise::max(0.0, _1098);
    float _1104 = sqrt(_1100);
    float _1106 = -_1088;
    float _1108 = -_1102;
    float _1110 = fma(_1068, _1106, _1108);
    bool _1112 = _1104 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1114 = _1076;
    float _1116 = _1068;
    float _1118 = _1102;
    float _1120 = _1094;
    float _1122 = _1096;
    if (!_1112)
    {
        _1114 = _1090;
    }
    float _1124 = _1114;
    float _1126 = _1124;
    if (!_1112)
    {
        _1116 = _1110;
    }
    float _1128 = _1116;
    float _1130 = _1128;
    if (!_1112)
    {
        _1118 = _1092;
    }
    float _1132 = _1118;
    bool _1134 = !_1112;
    float _1136 = _1132;
    if (!_1134)
    {
        float _1138 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1140 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1142 = _1104 + _1140;
        float _1144 = _1110 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1146 = rsqrt(_1100);
        float _1148 = _1142 * _1138;
        float _1150 = _1148 * 0.15915493667125701904296875;
        float _1152 = _1150 * 6.283185482025146484375;
        float _1154 = sin(_1152);
        float _1156 = _1150 * 6.283185482025146484375;
        float _1158 = cos(_1156);
        float _1160 = fma(_1154, _1144, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1162 = _1146 * _1160;
        float _1164 = _1158 + (-1.0);
        float _1166 = _1090 * _1162;
        float _1168 = _1164 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1170 = _1092 * _1162;
        float _1172 = fma(_1110, _1158, _1168);
        float _1174 = _1166 * _1166;
        float _1176 = _1170 * _1170;
        _1130 = _1172;
        _1120 = _1174;
        _1122 = _1176;
        _1126 = _1166;
        _1136 = _1170;
    }
    float _1178 = _1130;
    float _1180 = _1120;
    float _1182 = _1122;
    float _1184 = _1126;
    float _1186 = _1136;
    float _1188 = fma(_1178, _1178, _1180);
    float _1190 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1192 = _1188 + _1182;
    float _1194 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1196 = fma(_1086, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1194);
    float _1198 = precise::clamp(_1196, 0.0, 1.0);
    float _1200 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1190);
    float _1202 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1204 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1206 = rsqrt(_1192);
    float _1208 = -_1198;
    float _1210 = _1208 + 1.0;
    float _1212 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1200);
    float _1214 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1216 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1202);
    float _1218 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1220 = _1212 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1222 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1214);
    float _1224 = abs(_1210);
    float _1226 = log2(_1224);
    float _1228 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1216);
    float _1230 = _1220 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1232 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1222);
    float _1234 = fma(_1060, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1204);
    float _1236 = _1228 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1238 = -_1230;
    float _1240 = fma(_1218, _1238, 1.0);
    float _1242 = _1232 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1244 = _1206 * _1184;
    float _1246 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1248 = _1206 * _1178;
    float _1250 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1234);
    float _1252 = _1244 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1254 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1246);
    float _1256 = _1206 * _1186;
    float _1258 = _1250 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1260 = _1226 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1262 = -_1252;
    float _1264 = fma(_1248, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1262);
    float _1266 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1254);
    float _1268 = log2(_1240);
    float _1270 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1272 = -_1256;
    float _1274 = fma(_1272, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1264);
    float _1276 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1266);
    float _1278 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1280 = fma(_1274, -0.5, 0.5);
    float _1282 = fma(_1274, 0.5, 0.5);
    float _1284 = exp2(_1260);
    float _1286 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1278);
    float _1288 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1270);
    float _1290 = _1248 + 1.0;
    float _1292 = fma(_1282, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1294 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1286);
    float _1296 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1288);
    float _1298 = 1.0 / _1276;
    float _1300 = fma(_1282, _1292, -0.212114393711090087890625);
    float _1302 = _1268 * 0.693147182464599609375;
    float _1304 = fma(_1282, _1300, 1.570728778839111328125);
    float _1306 = _1302 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1308 = sqrt(_1280);
    float _1310 = -_1248;
    float _1312 = fma(_1284, _1290, _1310);
    float _1314 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1294);
    float _1316 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1296);
    float _1318 = fma(_1312, 0.5, 0.5);
    float _1320 = _1314 * _1298;
    float _1322 = _1316 * _1298;
    float _1324 = fma(_1320, 0.5, 0.5);
    float _1326 = fma(_1322, -0.5, 0.5);
    float _1328 = _1308 * 0.636619746685028076171875;
    float3 _4079 = float3(_1324, _1326, _1306);
    float _1330 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4079, float3(0.0), isnan(_4079)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4079, float3(0.0), isnan(_4079)), level(0.0)).x;
    float _1332 = -_1304;
    float _1334 = fma(_1328, _1332, 1.0);
    float2 _4095 = float2(_1334, _1318);
    float3 _1338 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4095, float2(0.0), isnan(_4095)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4095, float2(0.0), isnan(_4095)), level(0.0)).xyz;
    float _1340 = _1338.x;
    float _1342 = _1338.y;
    float _1344 = _1338.z;
    float _1346 = in.m_59.x;
    bool _1348 = _314 > 0.5;
    float _1350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1352 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1354 = _1352 != 0;
    float _1356 = in.m_59.y;
    int _1358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1360 = _1358 != 0;
    float _1362 = _1226 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1364 = _328 > 0.5;
    out.m_61.x = _1060;
    out.m_61.y = _1056;
    out.m_61.z = _1064;
    bool _1366 = _316 > 0.5;
    float _1368 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1370 = _1236 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1372 = _1326;
    float _1374 = _1296;
    float _1376 = _1276;
    float _1378 = _1316;
    float _1380 = _1314;
    if (_1354)
    {
        float _1382 = in.m_53.z;
        _1372 = _1382;
    }
    float _1384 = _1372;
    float _1386 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    if (_1360)
    {
        bool _1388 = _310 > 0.5;
        _572 = _1388;
    }
    bool _1390 = _572;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1398 = _1396 != 0;
    float _1400 = _1386 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1402 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1404 = as_type<int>(_1402);
    float _1406 = _1346;
    if (_1360)
    {
        float _1408 = -_1346;
        float _1410 = _1408 + 1.0;
        _472 = as_type<int>(_1410);
    }
    int _1412 = _472;
    if (!_1360)
    {
        _1374 = _1346;
    }
    float _1414 = _1374;
    float _1416 = _1394 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1418 = 0.0;
    float _1420 = _1414;
    if (!_1354)
    {
        _1418 = _1346;
    }
    float _1422 = _1418;
    float _1424 = -_1356;
    float _1426 = _1424 + 1.0;
    float _1428 = _1356;
    float _1430 = _1422;
    float _1432 = _1426;
    if (_1360)
    {
        float _1434 = _1390 ? as_type<float>(_1412) : _1346;
        _1420 = _1434;
    }
    float _1436 = _1420;
    float _1438 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1442 = _1440 != 0;
    float _1444 = fma(_1242, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1370);
    int _1446 = _1348 ? as_type<int>(_1426) : as_type<int>(_1356);
    out.m_63.w = _1276;
    int _1448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1450 = _1448 != 0;
    float _1452 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1444);
    float _1454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1458 = _1456 != 0;
    float _1460 = _1442 ? as_type<float>(_1446) : _1356;
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1464 = _1364 ? as_type<int>(_1426) : as_type<int>(_1356);
    bool _1466 = _1442;
    int _1468 = as_type<int>(_1462);
    if (_1354)
    {
        bool _1470 = _1384 > 0.5;
        _1466 = _1470;
    }
    bool _1472 = _1466;
    float _1474 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1476 = in.m_65.x;
    float _1478 = in.m_65.y;
    float _1480 = in.m_65.z;
    float _1482 = _1458 ? as_type<float>(_1464) : _1356;
    bool _1484 = _830 != 0.0;
    bool _1486 = isnan(_830);
    bool _1488 = _1484 || _1486;
    bool _1490 = isnan(0.0);
    bool _1492 = _1488 || _1490;
    out.m_67.x = _1400;
    out.m_67.y = _1402;
    out.m_67.z = _1416;
    out.m_67.w = _1462;
    bool _1494 = _828 == 0.0;
    bool _1496 = !_1492;
    bool _1498 = _1494 && _1496;
    float _1500 = exp2(_1362);
    float _1502 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1504 = _832 == 0.0;
    bool _1506 = _1504 && _1498;
    float _1508 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1510 = _1502 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1512 = _1510;
    if (_1398)
    {
        float _1514 = _1366 ? _1426 : _1356;
        _1428 = _1514;
    }
    float _1516 = _1428;
    if (_1354)
    {
        float _1518 = -_1346;
        float _1520 = _1518 + 1.0;
        _1404 = as_type<int>(_1520);
    }
    int _1522 = _1404;
    if (_1450)
    {
        float _1524 = -_1346;
        float _1526 = _1524 + 1.0;
        _1468 = as_type<int>(_1526);
    }
    int _1528 = _1468;
    float _1530 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1532 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1534 = _1508 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1536 = _1534;
    if (_1354)
    {
        float _1538 = _1472 ? as_type<float>(_1522) : _1346;
        _1430 = _1538;
    }
    float _1540 = _1430;
    float _1542 = _1530 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1450)
    {
        float _1544 = _1364 ? as_type<float>(_1528) : _1346;
        _1406 = _1544;
    }
    float _1546 = _1406;
    float _1548 = -_1500;
    float _1550 = _1548 + 1.0;
    float _1552 = in.m_69.x;
    float _1554 = in.m_69.y;
    float _1556 = in.m_69.z;
    float _1558 = in.m_69.w;
    float _1560 = 0.0;
    if (_1506)
    {
        _1560 = _1476;
    }
    float _1562 = _1560;
    float _1564 = 0.0;
    float _1566 = _1562;
    if (_1506)
    {
        _1564 = _1478;
    }
    float _1568 = _1564;
    out.m_71.x = _1510;
    out.m_71.y = _1534;
    out.m_71.z = _1542;
    out.m_71.w = _1532;
    float _1570 = _1568;
    if (_1506)
    {
        _1432 = _1562;
    }
    float _1572 = _1432;
    float _1574 = _1550 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1576 = _1572;
    if (!_1506)
    {
        _1566 = _1476;
    }
    float _1578 = _1566;
    float _1580 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    if (!_1506)
    {
        float _1582 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1578);
        _1576 = _1582;
    }
    float _1584 = _1576;
    float _1586 = _1436 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1588 = _1586 * _1350;
    if (_1506)
    {
        _1536 = _1568;
    }
    float _1590 = _1536;
    float _1592 = _1516 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1594 = _1590;
    if (!_1506)
    {
        _1570 = _1478;
    }
    float _1596 = _1570;
    float _1598 = _1546 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    if (_1506)
    {
        _1512 = _1480;
    }
    float _1600 = _1512;
    float _1602 = _1600;
    if (!_1506)
    {
        float _1604 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1480);
        _1602 = _1604;
    }
    float _1606 = _1602;
    float _1608 = _1556 * _1578;
    if (!_1506)
    {
        float _1610 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1596);
        _1594 = _1610;
    }
    float _1612 = _1594;
    float _1614 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1616 = _1540 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1618 = _1554 * _1480;
    float _1620 = _1592 * _1454;
    float _1622 = _1614 * _1368;
    float _1624 = -_1608;
    float _1626 = fma(_1552, _1480, _1624);
    float _1628 = _1616 * _1438;
    float _1630 = _1552 * _1596;
    float _1632 = _1598 * _1580;
    float _1634 = -_1618;
    float _1636 = fma(_1556, _1596, _1634);
    float _1638 = _1626 * _1558;
    float _1640 = _914 * _1612;
    out.m_73.x = _1588;
    out.m_73.y = _1622;
    out.m_73.z = _1628;
    out.m_73.w = _1620;
    float _1642 = _1460 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _1644 = -_1630;
    float _1646 = fma(_1554, _1578, _1644);
    float _1648 = _914 * _1554;
    float _1650 = _1636 * _1558;
    float _1652 = _914 * _1638;
    float _1654 = fma(_916, _1584, _1640);
    float _1656 = _1642 * _1474;
    float _1658 = fma(_916, _1552, _1648);
    float _1660 = _1646 * _1558;
    float _1662 = fma(_916, _1650, _1652);
    float _1664 = -_908;
    float _1666 = fma(_1664, _1606, _1654);
    float _1668 = -_908;
    float _1670 = fma(_1668, _1556, _1658);
    out.m_75.x = _1632;
    out.m_75.y = _1656;
    float _1672 = _926 * _1554;
    float _1674 = _934 * _1554;
    float _1676 = _926 * _1612;
    float _1678 = -_908;
    float _1680 = fma(_1678, _1660, _1662);
    float _1682 = fma(_928, _1552, _1672);
    float _1684 = fma(_932, _1552, _1674);
    float _1686 = fma(_928, _1584, _1676);
    float _1688 = _1666 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1690 = fma(_918, _1556, _1682);
    float _1692 = fma(_920, _1556, _1684);
    float _1694 = fma(_918, _1606, _1686);
    float _1696 = _1666 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1698 = _1666 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1700 = _926 * _1638;
    float _1702 = _934 * _1612;
    float _1704 = fma(_1694, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1688);
    float _1706 = fma(_1694, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1696);
    float _1708 = fma(_1694, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1698);
    float _1710 = _934 * _1638;
    float _1712 = _1670 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1714 = _1670 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1716 = fma(_928, _1650, _1700);
    float _1718 = _1670 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1720 = fma(_932, _1584, _1702);
    float _1722 = fma(_932, _1650, _1710);
    float _1724 = fma(_1690, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1712);
    float _1726 = fma(_1690, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1714);
    float _1728 = fma(_918, _1660, _1716);
    float _1730 = fma(_1690, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1718);
    float _1732 = _1680 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1734 = _1680 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1736 = _1680 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1738 = fma(_920, _1606, _1720);
    float _1740 = fma(_920, _1660, _1722);
    float _1742 = fma(_1728, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1732);
    float _1744 = fma(_1728, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1734);
    float _1746 = fma(_1728, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1736);
    float _1748 = fma(_1692, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1724);
    float _1750 = _1314 + _1276;
    float _1752 = fma(_1692, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1726);
    float _1754 = fma(_1740, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1742);
    float _1756 = fma(_1740, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1744);
    float _1758 = fma(_1740, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1746);
    float _1760 = _1750 * 0.5;
    float _1762 = fma(_1738, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1704);
    float _1764 = _1276 * 0.5;
    float _1766 = fma(_1692, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1730);
    float _1768 = fma(_1738, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1706);
    float _1770 = fma(_1738, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1708);
    float _1772 = fma(_1316, -0.5, _1764);
    float _1774 = -_1574;
    float _1776 = _1774 + 1.0;
    out.m_77.x = _1754;
    out.m_77.y = _1756;
    out.m_77.z = _1758;
    bool _1778 = _1086 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1780 = isnan(_1086);
    bool _1782 = _1778 || _1780;
    bool _1784 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1786 = _1782 || _1784;
    float _1788 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1452);
    out.m_63.x = _1760;
    out.m_63.y = _1772;
    out.m_79.x = _1762;
    out.m_79.y = _1768;
    out.m_79.z = _1770;
    out.m_81.x = _1748;
    out.m_81.y = _1752;
    out.m_81.z = _1766;
    out.gl_Position.x = _1314;
    out.gl_Position.y = _1316;
    out.gl_Position.z = _1788;
    out.gl_Position.w = _1276;
    float _1790 = _1748;
    float _1792 = _1788;
    if (!_1786)
    {
        _1790 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1794 = _1790;
    float _1796 = _1794;
    float _1798 = _1794;
    if (!_1786)
    {
        _1376 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1800 = _1376;
    float _1802 = _1800;
    float _1804 = _1800;
    if (!_1786)
    {
        _1792 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1806 = _1792;
    float _1808 = _1806;
    float _1810 = _1806;
    if (!_1786)
    {
        _1378 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1812 = _1378;
    float _1814 = _1812;
    float _1816 = _1812;
    if (!_1786)
    {
        _1380 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1818 = _1380;
    float _1820 = _1574 * _1330;
    float _1822 = _1340 * _1820;
    float _1824 = _1342 * _1820;
    float _1826 = _1344 * _1820;
    float _1828 = _1820;
    float _1830 = _1818;
    float _1832 = _1818;
    if (!_1786)
    {
        _1828 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1834 = _1828;
    out.m_83.x = _1822;
    out.m_83.y = _1824;
    out.m_83.z = _1826;
    out.m_83.w = _1776;
    bool _1836 = !_1786;
    float _1838 = _1834;
    float _1840 = _1834;
    if (!_1836)
    {
        bool _1842 = _1086 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1844 = isnan(_1086);
        bool _1846 = _1842 || _1844;
        bool _1848 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1850 = _1846 || _1848;
        if (!_1850)
        {
            float _1852 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1854 = _1086 + _1852;
            float _1856 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1858 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1856;
            float _1860 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1862 = _1860 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1864 = 1.0 / _1858;
            float _1866 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1868 = _1866 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1870 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1872 = _1870 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1874 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1876 = _1874 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1878 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1880 = _1878 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1882 = _1854 * _1864;
            float _1884 = precise::clamp(_1882, 0.0, 1.0);
            float _1886 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1888 = _1886 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1890 = fma(_1884, _1862, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1892 = fma(_1884, _1888, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1894 = fma(_1884, _1868, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1896 = fma(_1884, _1872, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1898 = fma(_1884, _1876, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1900 = fma(_1884, _1880, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1804 = _1894;
            _1832 = _1898;
            _1798 = _1890;
            _1816 = _1896;
            _1810 = _1892;
            _1840 = _1900;
            _1902 = true;
        }
        else
        {
            bool _1904 = _1086 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1906 = isnan(_1086);
            bool _1908 = _1904 || _1906;
            bool _1910 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1912 = _1908 || _1910;
            if (!_1912)
            {
                _1796 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1914 = _1796;
            _1798 = _1914;
            if (!_1912)
            {
                _1802 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1916 = _1802;
            _1804 = _1916;
            if (!_1912)
            {
                _1808 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1918 = _1808;
            _1810 = _1918;
            if (!_1912)
            {
                _1814 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1920 = _1814;
            _1816 = _1920;
            if (!_1912)
            {
                _1830 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1922 = _1830;
            _1832 = _1922;
            if (!_1912)
            {
                _1838 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1924 = _1838;
            bool _1926 = !_1912;
            _1840 = _1924;
            if (!_1926)
            {
                bool _1928 = _1086 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1930 = isnan(_1086);
                bool _1932 = _1928 || _1930;
                bool _1934 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1936 = _1932 || _1934;
                if (!_1936)
                {
                    float _1938 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1940 = _1086 + _1938;
                    float _1942 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1944 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1942;
                    float _1946 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1948 = _1946 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1950 = 1.0 / _1944;
                    float _1952 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1954 = _1952 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1956 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1958 = _1956 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1960 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1962 = _1960 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1964 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1966 = _1964 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1968 = _1940 * _1950;
                    float _1970 = precise::clamp(_1968, 0.0, 1.0);
                    float _1972 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1974 = _1972 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1976 = fma(_1970, _1948, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1978 = fma(_1970, _1974, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1980 = fma(_1970, _1954, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1982 = fma(_1970, _1958, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1984 = fma(_1970, _1962, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1986 = fma(_1970, _1966, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1804 = _1980;
                    _1832 = _1984;
                    _1798 = _1976;
                    _1816 = _1982;
                    _1810 = _1978;
                    _1840 = _1986;
                    _1902 = true;
                }
                else
                {
                    _1804 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1832 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1798 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1816 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1810 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1840 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1902 = false;
    float _1988 = _1804;
    float _1990 = _1832;
    float _1992 = _1798;
    float _1994 = _1816;
    float _1996 = _1810;
    float _1998 = _1840;
    float _2000 = fma(_1768, -0.5, 0.5);
    float _2002 = precise::clamp(_2000, 0.0, 1.0);
    float _2004 = -_1988;
    float _2006 = _2004 + _1990;
    float _2008 = -_1992;
    float _2010 = _2008 + _1994;
    float _2012 = -_1996;
    float _2014 = _2012 + _1998;
    bool _2016 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2018 = fma(_2002, _2006, _1988);
    float _2020 = fma(_2002, _2010, _1992);
    float _2022 = fma(_2002, _2014, _1996);
    float _2024 = _2018 * 0.586610972881317138671875;
    out.m_45.x = 1.0;
    float _2026 = fma(_2020, 0.298911988735198974609375, _2024);
    out.m_85.w = (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2028 = fma(_2022, 0.114477999508380889892578125, _2026);
    float _2030 = -_2028;
    float _2032 = _2020 + _2030;
    float _2034 = -_2028;
    float _2036 = _2018 + _2034;
    float _2038 = -_2028;
    float _2040 = _2022 + _2038;
    out.m_87.x = 0.0;
    float _2042 = fma(_2032, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2028);
    float _2044 = fma(_2036, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2028);
    float _2046 = fma(_2040, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2028);
    out.m_89.x = _2042;
    out.m_89.y = _2044;
    out.m_89.z = _2046;
    if (!_2016)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2048 = -_1056;
    float _2050 = _2048 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2052 = -_1060;
    float _2054 = _2052 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2056 = -_1064;
    float _2058 = _2056 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2060 = _2050 * _2050;
    float _2062 = fma(_2054, _2054, _2060);
    float _2064 = fma(_2058, _2058, _2062);
    float _2066 = sqrt(_2064);
    float _2068 = rsqrt(_2064);
    float _2070 = -_2066;
    float _2072 = _2070 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2074 = _2072 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2076 = precise::clamp(_2074, 0.0, 1.0);
    float _2078 = _2054 * _2068;
    float _2080 = _2050 * _2068;
    float _2082 = abs(_2076);
    float _2084 = log2(_2082);
    float _2086 = _2058 * _2068;
    float _2088 = _2078 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2090 = _1768 * _2080;
    float _2092 = -_2080;
    float _2094 = -_2088;
    float _2096 = fma(_2092, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2094);
    float _2098 = fma(_1762, _2078, _2090);
    float _2100 = -_2086;
    float _2102 = fma(_2100, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2096);
    float _2104 = fma(_1770, _2086, _2098);
    float _2106 = precise::clamp(_2104, 0.0, 1.0);
    float _2108 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2110 = _2102 + _2108;
    float _2112 = _2084 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2114 = _2110 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2116 = precise::clamp(_2114, 0.0, 1.0);
    float _2118 = exp2(_2112);
    float _2120 = _2118 * _2116;
    float _2122 = _2106 * _2120;
    float _2124 = _2122 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2126 = _2122 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2128 = _2122 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _2124;
    out.m_87.y = _2126;
    out.m_87.z = _2128;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

