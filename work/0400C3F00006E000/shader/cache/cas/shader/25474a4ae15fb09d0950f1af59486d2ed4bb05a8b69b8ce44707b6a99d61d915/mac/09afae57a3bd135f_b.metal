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
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_77 [[user(locn0)]];
    float4 m_79 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_95 [[user(locn3)]];
    float4 m_71 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_87 [[user(locn6)]];
    float4 m_83 [[user(locn7)]];
    float4 m_93 [[user(locn8)]];
    float4 m_89 [[user(locn9)]];
    float4 m_91 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_85 [[attribute(0)]];
    float4 m_57 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_59 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_48 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_75 [[attribute(7)]];
    float4 m_67 [[attribute(8)]];
    float4 m_61 [[attribute(9)]];
    float4 m_65 [[attribute(10)]];
    float4 m_73 [[attribute(12)]];
    float4 m_69 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2095 = false;
    bool _1362 = false;
    bool _350 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_48.w;
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
        out.m_51.x = 0.0;
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
        float _2380 = as_type<float>(_130);
        out.gl_Position.z = _2380;
    }
    if (!_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _134 = in.m_53.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = 0.0;
    float _152 = _148;
    if (_144)
    {
        float _154 = float(_114);
        _150 = _154;
    }
    float _156 = _150;
    bool _158 = _148 >= _156;
    bool _160 = !_144;
    bool _162 = _158 || _160;
    if (_162)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _124;
    if (_162)
    {
        out.m_51.x = 0.0;
    }
    if (_162)
    {
        float _166 = _164 * 5.0;
        _132 = as_type<int>(_166);
    }
    int _168 = _132;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2449 = as_type<float>(_168);
        out.gl_Position.z = _2449;
    }
    if (_162)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _170 = in.m_55.x;
    float _172 = in.m_55.y;
    float _174 = in.m_55.z;
    float _176 = in.m_57.x;
    float _178 = in.m_57.y;
    float _180 = in.m_57.z;
    float _182 = in.m_59.x;
    float _184 = in.m_59.y;
    float _186 = in.m_59.z;
    float _188 = _170 * _170;
    float _190 = _174 * _174;
    float _192 = _172 * _172;
    float _194 = fma(_176, _176, _188);
    float _196 = fma(_180, _180, _190);
    float _198 = fma(_178, _178, _192);
    float _200 = fma(_182, _182, _194);
    float _202 = fma(_186, _186, _196);
    float _204 = fma(_184, _184, _198);
    float _206 = sqrt(_200);
    float _208 = sqrt(_202);
    float _210 = sqrt(_204);
    bool _212 = _206 > 0.0;
    bool _214 = _208 > 0.0;
    float _216 = _208;
    float _218 = _206;
    float _220 = _202;
    float _222 = _170;
    if (_212)
    {
        float _224 = rsqrt(_200);
        _216 = _224;
    }
    float _226 = _216;
    if (!_212)
    {
        _218 = 0.0;
    }
    float _228 = _218;
    bool _230 = _210 > 0.0;
    float _232 = 0.0;
    float _234 = _228;
    if (!_212)
    {
        _232 = 0.0;
    }
    float _236 = _232;
    float _238 = 0.0;
    float _240 = _236;
    if (!_212)
    {
        _238 = 0.0;
    }
    float _242 = _238;
    float _244 = 0.0;
    float _246 = _242;
    if (_214)
    {
        float _248 = rsqrt(_202);
        _244 = _248;
    }
    float _250 = _244;
    float _252 = 0.0;
    if (!_214)
    {
        _252 = 0.0;
    }
    float _254 = _252;
    float _256 = _210;
    float _258 = _254;
    if (_230)
    {
        float _260 = rsqrt(_204);
        _256 = _260;
    }
    float _262 = _256;
    float _264 = _226;
    if (_212)
    {
        float _266 = _226 * _176;
        _234 = _266;
    }
    float _268 = _234;
    if (_212)
    {
        float _270 = _226 * _170;
        _240 = _270;
    }
    float _272 = _240;
    if (_212)
    {
        float _274 = _226 * _182;
        _246 = _274;
    }
    float _276 = _246;
    bool _278 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _280 = 0.0;
    float _282 = 0.0;
    if (!_230)
    {
        _280 = 0.0;
        _282 = 0.0;
    }
    float _284 = _280;
    float _286 = _282;
    float _288 = 0.0;
    float _290 = _284;
    float _292 = _286;
    if (!_230)
    {
        _288 = 0.0;
    }
    float _294 = _288;
    float _296 = _294;
    if (!_214)
    {
        _264 = 0.0;
    }
    float _298 = _264;
    float _300 = _298;
    if (_214)
    {
        float _302 = _250 * _180;
        _258 = _302;
    }
    float _304 = _258;
    if (!_214)
    {
        _220 = 0.0;
    }
    float _306 = _220;
    float _308 = _306;
    if (_214)
    {
        float _310 = _250 * _174;
        _300 = _310;
    }
    float _312 = _300;
    if (_214)
    {
        float _314 = _250 * _186;
        _308 = _314;
    }
    float _316 = _308;
    if (_230)
    {
        float _318 = _262 * _178;
        _290 = _318;
    }
    float _320 = _290;
    if (_230)
    {
        float _322 = _262 * _172;
        _292 = _322;
    }
    float _324 = _292;
    if (_230)
    {
        float _326 = _262 * _184;
        _296 = _326;
    }
    float _328 = _296;
    bool _330 = !_278;
    float _348;
    if (!_330)
    {
        float _332 = in.m_61.x;
        float _334 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _336 = _332 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _338 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[12].x, _148);
        float _340 = _338 * _334;
        float _342 = floor(_340);
        float _344 = -_342;
        float _346 = _340 + _344;
        _348 = _346;
        _350 = true;
    }
    else
    {
        float _352 = float(_114);
        float _354 = 1.0 / _352;
        float _356 = _148 * _354;
        _348 = _356;
    }
    _350 = false;
    float _358 = _348;
    float _360 = in.m_61.z;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _364 = _358 + _362;
    float _366 = in.m_48.x;
    float _368 = in.m_48.y;
    float _370 = in.m_48.z;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _378 = _376 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _380 = in.m_61.x;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _390 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _392 = log2(_390);
    float _394 = in.m_61.y;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _398 = _358 + _396;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _402 = _358 + _400;
    int _404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _406 = _404 != 0;
    int _408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _410 = _408 != 0;
    float _412 = 1.0 / _374;
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _416 = _414 != 0;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _420 = _418 != 0;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _424 = _422 != 0;
    float _426 = _360 * 2.0;
    float _428 = 1.0 / _384;
    float _430 = _178 * _368;
    float _432 = _184 * _368;
    float _434 = _392 * _148;
    float _436 = fma(_176, _366, _430);
    float _438 = fma(_182, _366, _432);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _442 = _358 + _440;
    float _444 = floor(_426);
    float _446 = _364 * _412;
    float _448 = _380 * 2.0;
    float _450 = fma(_180, _370, _436);
    float _452 = _380 + _360;
    float _454 = _394 * 2.0;
    float _456 = _394 + _360;
    float _458 = 1.0 / _378;
    float _460 = _398 * _428;
    float _462 = _380 + _394;
    float _464 = _452 + (-1.0);
    float _466 = _456 + (-1.0);
    float _468 = _462 + (-1.0);
    float _470 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _472 = 1.0 / _388;
    bool _474 = _444 > 0.0;
    float _476 = fma(_186, _370, _438);
    bool _478 = _444 >= 0.0;
    bool _480 = isnan(_444);
    bool _482 = _478 || _480;
    bool _484 = isnan(0.0);
    bool _486 = _482 || _484;
    float _488 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _490 = floor(_448);
    float _492 = _402 * _458;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _494;
    bool _498 = !_416;
    int _500 = _498 ? 0 : 1;
    float _502 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _504 = floor(_454);
    float _506 = _442 * _472;
    int _508 = _486 ? 0 : 1;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _510;
    float _514 = fma(_496, _460, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _520 = ~_508;
    int _522 = _520 + 1;
    int _524 = _522 + 1;
    float _526 = fma(_512, _460, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _528 = _524;
    if (!_474)
    {
        int _530 = ~_508;
        int _532 = _530 + 1;
        _528 = _532;
    }
    int _534 = _528;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _536;
    float _540 = exp2(_434);
    bool _542 = _490 >= 0.0;
    bool _544 = isnan(_490);
    bool _546 = _542 || _544;
    bool _548 = isnan(0.0);
    bool _550 = _546 || _548;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _556 = fma(_538, _460, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    int _562 = _550 ? 0 : 1;
    float _564 = fma(_554, _506, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _566 = _504 > 0.0;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _568;
    bool _572 = _504 >= 0.0;
    bool _574 = isnan(_504);
    bool _576 = _572 || _574;
    bool _578 = isnan(0.0);
    bool _580 = _576 || _578;
    float _582 = fma(_518, _506, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _584 = _490 > 0.0;
    float _586 = fma(_560, _506, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _588;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _592;
    bool _596 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _598 = isnan(_358);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = fma(_570, _446, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _610 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _612 = isnan(_358);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = fma(_590, _446, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _624 = fma(_594, _446, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _628 = 1.0 + _626;
    bool _630 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _632 = isnan(_358);
    bool _634 = _630 || _632;
    bool _636 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _638 = _634 || _636;
    float _640 = float(_638);
    float _642 = -_606;
    float _644 = _642 + 1.0;
    float _646 = -_620;
    float _648 = _646 + 1.0;
    bool _650 = !_420;
    int _652 = _650 ? 0 : 1;
    float _654 = -_540;
    float _656 = _654 + 1.0;
    bool _658 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _660 = isnan(0.0);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _666 = _662 || _664;
    float _668 = _606 * _648;
    bool _670 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _672 = isnan(_358);
    bool _674 = _670 || _672;
    bool _676 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _678 = _674 || _676;
    float _680 = float(_678);
    float _682 = _640 * _644;
    float _684 = 1.0 / _628;
    bool _686 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _688 = isnan(_358);
    bool _690 = _686 || _688;
    bool _692 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _694 = _690 || _692;
    float _696 = float(_694);
    float _698 = -_640;
    float _700 = _698 + 1.0;
    float _702 = in.m_63.x;
    float _704 = in.m_63.y;
    float _706 = in.m_63.z;
    float _708 = _666 ? _656 : 0.0;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _712 = _710 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _714 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _716 = isnan(1.0);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _722 = _718 || _720;
    float _724 = _680 * _700;
    int _726 = abs(_500);
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _732 = fma(_712, _492, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _734 = -_680;
    float _736 = _734 + 1.0;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _742 = float(_534);
    float _744 = _696 * _736;
    float _746 = float(_726);
    float _748 = fma(_740, _492, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _750 = _380 + (-0.5);
    float _752 = _708;
    if (_722)
    {
        float _754 = _708 * _684;
        _152 = _754;
    }
    float _756 = _152;
    float _758 = _526 * _744;
    float _760 = -_696;
    float _762 = _760 + 1.0;
    float _764 = _746 * _742;
    float _766 = _514 * _744;
    float _768 = _556 * _744;
    int _770 = ~_562;
    int _772 = _770 + 1;
    int _774 = _772 + 1;
    float _776 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[143].y, _758);
    float _778 = _764 * (-2.0);
    int _780 = abs(_652);
    float _782 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[143].x, _766);
    int _784 = _774;
    if (!_584)
    {
        int _786 = ~_562;
        int _788 = _786 + 1;
        _784 = _788;
    }
    int _790 = _784;
    float _792 = fma(_778, _702, _702);
    float _794 = float(_780);
    float _796 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[143].z, _768);
    float _798 = float(_790);
    float _800 = fma(_488, _778, _488);
    float _802 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[196].x, _792);
    int _804 = _580 ? 0 : 1;
    float _806 = fma(_582, _724, _782);
    bool _808 = !_424;
    int _810 = _808 ? 0 : 1;
    float _812 = _794 * _798;
    float _814 = fma(_800, _756, _802);
    int _816 = ~_804;
    int _818 = _816 + 1;
    int _820 = _818 + 1;
    float _822 = _394 + (-0.5);
    int _824 = abs(_810);
    float _826 = _812 * (-2.0);
    int _828 = _820;
    if (!_566)
    {
        int _830 = ~_804;
        int _832 = _830 + 1;
        _828 = _832;
    }
    int _834 = _828;
    float _836 = _814 * 0.15915493667125701904296875;
    float _838 = float(_824);
    float _840 = fma(_826, _704, _704);
    float _842 = float(_834);
    float _844 = fma(_502, _826, _502);
    float _846 = fma(_564, _724, _776);
    float _848 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[196].y, _840);
    float _850 = fma(_608, _682, _806);
    float _852 = _838 * _842;
    float _854 = in.m_65.x;
    float _856 = in.m_65.y;
    float _858 = in.m_65.z;
    float _860 = fma(_844, _756, _848);
    float _862 = fma(_586, _724, _796);
    float _864 = _852 * (-2.0);
    float _866 = in.m_67.x;
    float _868 = in.m_67.y;
    float _870 = in.m_67.z;
    float _872 = _860 * 0.15915493667125701904296875;
    float _874 = _360 + (-0.5);
    float _876 = fma(_864, _706, _706);
    float _878 = fma(_470, _864, _470);
    float _880 = fma(_730, _492, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _882 = fma(_622, _682, _846);
    float _884 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[196].z, _876);
    float _886 = fma(_624, _682, _862);
    float _888 = fma(_732, _668, _850);
    float _890 = fma(_748, _668, _882);
    float _892 = fma(_878, _756, _884);
    float _894 = fma(_880, _668, _886);
    float _896 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[147].x, _888);
    float _898 = _836 * 6.283185482025146484375;
    float _900 = sin(_898);
    float _902 = _892 * 0.15915493667125701904296875;
    float _904 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[147].y, _890);
    float _906 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[147].z, _894);
    float _908 = in.m_69.x;
    bool _910 = _380 > 0.5;
    bool _912 = _910 && _406;
    float _914 = _896 * _854;
    float _916 = _906 * _858;
    float _918 = _872 * 6.283185482025146484375;
    float _920 = sin(_918);
    float _922 = _904 * _856;
    float _924 = _914 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _926 = in.m_57.w;
    float _928 = _916 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _866);
    float _932 = _922 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _934 = _872 * 6.283185482025146484375;
    float _936 = cos(_934);
    float _938 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _868);
    float _940 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _870);
    float _942 = in.m_69.y;
    bool _944 = _868 != 0.0;
    bool _946 = isnan(_868);
    bool _948 = _944 || _946;
    bool _950 = isnan(0.0);
    bool _952 = _948 || _950;
    float _954 = _932 * _938;
    float _956 = _172 * _368;
    float _958 = in.m_59.w;
    float _960 = _902 * 6.283185482025146484375;
    float _962 = cos(_960);
    float _964 = _924 * _930;
    float _966 = _900 * _920;
    float _968 = in.m_69.z;
    bool _970 = _866 == 0.0;
    bool _972 = !_952;
    bool _974 = _970 && _972;
    float _976 = fma(_170, _366, _956);
    bool _978 = _394 > 0.5;
    float _980 = in.m_55.w;
    float _982 = _836 * 6.283185482025146484375;
    float _984 = cos(_982);
    float _986 = _900 * _936;
    bool _988 = _870 == 0.0;
    bool _990 = _988 && _974;
    out.m_71.x = _908;
    float _992 = fma(_174, _370, _976);
    float _994 = _902 * 6.283185482025146484375;
    float _996 = sin(_994);
    float _998 = _900 * _962;
    float _1000 = _928 * _940;
    out.m_71.y = _942;
    float _1002 = _998 * _954;
    float _1004 = _476 + _958;
    float _1006 = _984 * _936;
    float _1008 = _984 * _920;
    float _1010 = _984 * _962;
    float _1012 = _936 * _962;
    float _1014 = _920 * _962;
    out.m_71.z = _968;
    float _1016 = _1010 * _954;
    float _1018 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1020 = fma(_996, _1006, _966);
    float _1022 = fma(_996, _966, _1006);
    float _1024 = -_1008;
    float _1026 = fma(_996, _986, _1024);
    float _1028 = -_954;
    float _1030 = _996 * _1028;
    float _1032 = -_986;
    float _1034 = fma(_996, _1008, _1032);
    float _1036 = fma(_1020, _964, _1016);
    float _1038 = fma(_1026, _964, _1002);
    float _1040 = fma(_1012, _964, _1030);
    float _1042 = _450 + _926;
    float _1044 = fma(_1034, _1000, _1036);
    float _1046 = fma(_1022, _1000, _1038);
    float _1048 = fma(_1014, _1000, _1040);
    float _1050 = in.m_73.y;
    float _1052 = _1044 * _320;
    float _1054 = _1044 * _328;
    float _1056 = _1044 * _324;
    float _1058 = in.m_73.x;
    float _1060 = fma(_1048, _268, _1052);
    float _1062 = fma(_1048, _276, _1054);
    float _1064 = fma(_1048, _272, _1056);
    float _1066 = _992 + _980;
    float _1068 = fma(_1046, _304, _1060);
    float _1070 = fma(_1046, _316, _1062);
    float _1072 = fma(_1046, _312, _1064);
    float _1074 = _1042 + _1068;
    float _1076 = _1004 + _1070;
    float _1078 = in.m_75.x;
    float _1080 = in.m_75.y;
    float _1082 = in.m_75.z;
    float _1084 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1086 = _1074 + _1084;
    float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1090 = _1076 + _1088;
    float _1092 = _1086 * _1086;
    float _1094 = _1090 * _1090;
    float _1096 = -_1050;
    float _1098 = _1096 + 1.0;
    float _1100 = _1092 + _1094;
    float _1102 = _1050;
    float _1104 = _1092;
    float _1106 = _1094;
    float _1108 = _1074;
    float _1110 = _1076;
    if (_406)
    {
        _752 = _1058;
    }
    float _1112 = _752;
    float _1114 = sqrt(_1100);
    float _1116 = _1112;
    if (!_406)
    {
        _222 = _1058;
    }
    float _1118 = _222;
    float _1120 = _1118;
    if (_912)
    {
        float _1122 = -_1112;
        float _1124 = _1122 + 1.0;
        _1116 = _1124;
    }
    float _1126 = _1116;
    if (_410)
    {
        float _1128 = _978 ? _1098 : _1050;
        _1102 = _1128;
    }
    float _1130 = _1102;
    if (_406)
    {
        _1120 = _1126;
    }
    float _1132 = _1120;
    float _1134 = _1080;
    float _1136 = _1078;
    float _1138 = _1082;
    if (!_990)
    {
        float _1140 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1080);
        _1134 = _1140;
    }
    float _1142 = _1134;
    if (!_990)
    {
        float _1144 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1078);
        _1136 = _1144;
    }
    float _1146 = _1136;
    if (!_990)
    {
        float _1148 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1082);
        _1138 = _1148;
    }
    float _1150 = _1138;
    float _1152 = _1066 + _1072;
    float _1154 = -_1142;
    float _1156 = _996 * _1154;
    float _1158 = _1010 * _1142;
    float _1160 = _998 * _1142;
    bool _1162 = _1114 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1164 = fma(_1012, _1146, _1156);
    float _1166 = fma(_1020, _1146, _1158);
    float _1168 = fma(_1026, _1146, _1160);
    float _1170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1172 = fma(_1014, _1150, _1164);
    float _1174 = fma(_1034, _1150, _1166);
    float _1176 = fma(_1022, _1150, _1168);
    float _1178 = _1156;
    if (!_1162)
    {
        _1178 = _1152;
    }
    float _1180 = _1178;
    bool _1182 = !_1162;
    float _1184 = _1180;
    if (!_1182)
    {
        float _1186 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1188 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1190 = _1114 + _1188;
        float _1192 = rsqrt(_1100);
        float _1194 = _1190 * _1186;
        float _1196 = _1152 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1198 = _1194 * 0.15915493667125701904296875;
        float _1200 = _1198 * 6.283185482025146484375;
        float _1202 = sin(_1200);
        float _1204 = _1198 * 6.283185482025146484375;
        float _1206 = cos(_1204);
        float _1208 = fma(_1202, _1196, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1210 = _1192 * _1208;
        float _1212 = _1206 + (-1.0);
        float _1214 = fma(_1086, _1210, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1216 = fma(_1090, _1210, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1218 = _1212 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1220 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1222 = _1214 + _1220;
        float _1224 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1226 = _1216 + _1224;
        float _1228 = fma(_1152, _1206, _1218);
        float _1230 = _1222 * _1222;
        float _1232 = _1226 * _1226;
        _1184 = _1228;
        _1104 = _1230;
        _1106 = _1232;
        _1108 = _1214;
        _1110 = _1216;
    }
    float _1234 = _1184;
    float _1236 = _1104;
    float _1238 = _1106;
    float _1240 = _1108;
    float _1242 = _1110;
    float _1244 = _1174 * _320;
    float _1246 = _1174 * _324;
    float _1248 = _1174 * _328;
    float _1250 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1252 = _1234 + _1250;
    float _1254 = _1130 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1256 = fma(_1172, _268, _1244);
    float _1258 = fma(_1172, _276, _1248);
    float _1260 = fma(_1252, _1252, _1236);
    float _1262 = in.m_69.w;
    float _1264 = fma(_1172, _272, _1246);
    float _1266 = _1254 * _1170;
    float _1268 = _1260 + _1238;
    float _1270 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1272 = fma(_1176, _304, _1256);
    float _1274 = sqrt(_1268);
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1286 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1288 = _1270 * _1018;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1292 = _1276 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1294 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1296 = _1280 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1298 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1300 = _1284 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1302 = _1286 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1304 = fma(_1176, _312, _1264);
    float _1306 = fma(_1176, _316, _1258);
    out.m_71.w = _1262;
    bool _1308 = _1274 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1310 = isnan(_1274);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1316 = _1312 || _1314;
    out.m_77.x = _1292;
    out.m_77.y = _1294;
    out.m_77.z = _1296;
    out.m_77.w = _1290;
    out.m_79.x = _1298;
    out.m_79.y = _1300;
    out.m_79.z = _1302;
    out.m_81.x = _1288;
    out.m_81.y = _1266;
    float _1318 = _1252;
    float _1320 = _1298;
    float _1322 = _1300;
    float _1324 = _1296;
    float _1326 = _1290;
    if (!_1316)
    {
        _1318 = 1.0;
    }
    float _1328 = _1318;
    out.m_83.x = _1272;
    out.m_83.y = _1304;
    out.m_83.z = _1306;
    bool _1330 = !_1316;
    float _1332 = _1328;
    if (!_1330)
    {
        bool _1334 = _1274 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1336 = isnan(_1274);
        bool _1338 = _1334 || _1336;
        bool _1340 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1342 = _1338 || _1340;
        if (!_1342)
        {
            float _1344 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1346 = _1274 + _1344;
            float _1348 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1350 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1348;
            float _1352 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1354 = _1352 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1356 = 1.0 / _1350;
            float _1358 = _1346 * _1356;
            float _1360 = fma(_1358, _1354, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1332 = _1360;
            _1320 = _1354;
            _1362 = true;
        }
        else
        {
            bool _1364 = _1274 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1366 = isnan(_1274);
            bool _1368 = _1364 || _1366;
            bool _1370 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1372 = _1368 || _1370;
            if (!_1372)
            {
                float _1374 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1376 = _1274 + _1374;
                float _1378 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1380 = _1378 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1382 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1384 = _1382 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1386 = 1.0 / _1380;
                float _1388 = _1376 * _1386;
                float _1390 = fma(_1388, _1384, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1332 = _1390;
                _1320 = _1384;
                _1362 = true;
            }
            else
            {
                _1332 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1362 = false;
    float _1392 = _1332;
    float _1394 = _1320;
    float _1396 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1398 = _1240 + _1396;
    float _1400 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1402 = _1234 + _1400;
    float _1404 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1406 = _1242 + _1404;
    bool _1408 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1410 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1412 = _1408 || _1410;
    bool _1414 = isnan(0.5);
    bool _1416 = _1412 || _1414;
    float _1418 = fma(_1398, _1392, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1420 = fma(_1402, _1392, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1422 = fma(_1406, _1392, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1424 = _1394;
    float _1426 = _1422;
    if (_1416)
    {
        _1424 = _1418;
    }
    float _1428 = _1424;
    float _1430 = _1428;
    if (_1416)
    {
        _1322 = _1420;
    }
    float _1432 = _1322;
    float _1434 = _1432;
    if (!_1416)
    {
        float _1436 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1438 = _1066 + _1436;
        float _1440 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1442 = _1042 + _1440;
        float _1444 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1446 = _1438 * _1438;
        float _1448 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1450 = _1004 + _1448;
        float _1452 = fma(_1442, _1442, _1446);
        float _1454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1456 = fma(_1450, _1450, _1452);
        float _1458 = sqrt(_1456);
        float _1460 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1462 = precise::min(_1458, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1464 = _1462 * _1454;
        float _1466 = -_1042;
        float _1468 = _1466 + _1418;
        float _1470 = -_1004;
        float _1472 = _1470 + _1422;
        float _1474 = _1460 * _1464;
        float _1476 = -_1066;
        float _1478 = _1476 + _1420;
        float _1480 = fma(_1468, _1474, _1042);
        float _1482 = fma(_1478, _1474, _1066);
        float _1484 = fma(_1472, _1474, _1004);
        _1434 = _1482;
        _1430 = _1480;
        _1426 = _1484;
    }
    float _1486 = _1434;
    float _1488 = _1430;
    float _1490 = _1426;
    float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1494 = _1486 + _1492;
    float _1496 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1498 = _1488 + _1496;
    float _1500 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1502 = _1490 + _1500;
    float _1504 = _1494 * _1494;
    float _1506 = fma(_1498, _1498, _1504);
    float _1508 = fma(_1502, _1502, _1506);
    float _1510 = rsqrt(_1508);
    float _1512 = sqrt(_1508);
    float _1514 = _1510 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1516 = _1498 * _1514;
    float _1518 = _1502 * _1514;
    float _1520 = _1516 * _1516;
    float _1522 = _1518 * _1518;
    float _1524 = _1520 + _1522;
    float _1526 = sqrt(_1524);
    bool _1528 = _1526 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1530 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1532 = _1526 + _1530;
    float _1534 = _1510;
    float _1536 = _1532;
    float _1538 = _1494;
    if (_1528)
    {
        float _1540 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1534 = _1540;
    }
    float _1542 = _1534;
    if (_1528)
    {
        float _1544 = rsqrt(_1524);
        _1324 = _1544;
    }
    float _1546 = _1324;
    float _1548 = _1546;
    if (_1528)
    {
        float _1550 = _1532 * _1542;
        _1536 = _1550;
    }
    float _1552 = _1536;
    if (_1528)
    {
        float _1554 = _1552 * 0.15915493667125701904296875;
        _1326 = _1554;
    }
    float _1556 = _1326;
    float _1558 = _1542;
    float _1560 = _1556;
    if (_1528)
    {
        float _1562 = _1556 * 6.283185482025146484375;
        float _1564 = sin(_1562);
        _1558 = _1564;
    }
    float _1566 = _1558;
    float _1568 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1570 = precise::max(0.0, _1568);
    float _1572 = _1502;
    float _1574 = _1570;
    if (_1528)
    {
        float _1576 = _1556 * 6.283185482025146484375;
        float _1578 = cos(_1576);
        _1572 = _1578;
    }
    float _1580 = _1572;
    float _1582 = -_1514;
    float _1584 = -_1570;
    float _1586 = fma(_1494, _1582, _1584);
    float _1588 = _1586;
    if (_1528)
    {
        float _1590 = _1586 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1574 = _1590;
    }
    float _1592 = _1574;
    float _1594 = _1592;
    if (!_1528)
    {
        _1560 = _1522;
    }
    float _1596 = _1560;
    float _1598 = _1566;
    float _1600 = _1596;
    if (_1528)
    {
        float _1602 = fma(_1566, _1592, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1594 = _1602;
    }
    float _1604 = _1594;
    float _1606 = _1580;
    if (_1528)
    {
        float _1608 = _1580 + (-1.0);
        _1538 = _1608;
    }
    float _1610 = _1538;
    float _1612 = _1610;
    if (_1528)
    {
        float _1614 = _1546 * _1604;
        _1598 = _1614;
    }
    float _1616 = _1598;
    if (!_1528)
    {
        _1548 = _1516;
    }
    float _1618 = _1548;
    float _1620 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1622 = _1618;
    if (_1528)
    {
        float _1624 = _1610 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1612 = _1624;
    }
    float _1626 = _1612;
    float _1628 = _1626;
    if (_1528)
    {
        float _1630 = _1516 * _1616;
        _1622 = _1630;
    }
    float _1632 = _1622;
    float _1634 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1528)
    {
        float _1636 = fma(_1586, _1580, _1626);
        _1588 = _1636;
    }
    float _1638 = _1588;
    if (!_1528)
    {
        _1606 = _1518;
    }
    float _1640 = _1606;
    float _1642 = _1640;
    if (_1528)
    {
        float _1644 = _1518 * _1616;
        _1642 = _1644;
    }
    float _1646 = _1642;
    if (!_1528)
    {
        _1628 = _1520;
    }
    float _1648 = _1628;
    float _1650 = _1648;
    if (_1528)
    {
        float _1652 = _1632 * _1632;
        _1650 = _1652;
    }
    float _1654 = _1650;
    float _1656 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1634);
    if (_1528)
    {
        float _1658 = _1646 * _1646;
        _1600 = _1658;
    }
    float _1660 = _1600;
    float _1662 = fma(_1638, _1638, _1654);
    float _1664 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1656);
    float _1666 = fma(_1042, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1668 = _1662 + _1660;
    float _1670 = _1664 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1672 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1674 = fma(_1512, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1672);
    float _1676 = precise::clamp(_1674, 0.0, 1.0);
    float _1678 = fma(_1004, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1680 = rsqrt(_1668);
    float _1682 = _1670 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1684 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1686 = -_1676;
    float _1688 = _1686 + 1.0;
    float _1690 = -_1682;
    float _1692 = fma(_1690, _1620, 1.0);
    float _1694 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1696 = floor(_1666);
    float _1698 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1700 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1694);
    float _1702 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1698);
    float _1704 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1700);
    float _1706 = _1680 * _1632;
    float _1708 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1702);
    float _1710 = _1680 * _1646;
    float _1712 = _1680 * _1638;
    float _1714 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1684);
    float _1716 = _1706 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1718 = _1708 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1720 = abs(_1688);
    float _1722 = log2(_1720);
    float _1724 = _1704 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1726 = -_1716;
    float _1728 = fma(_1712, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1726);
    float _1730 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1732 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1714);
    float _1734 = -_1696;
    float _1736 = _1666 + _1734;
    float _1738 = -_1710;
    float _1740 = fma(_1738, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1728);
    float _1742 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1730);
    float _1744 = log2(_1692);
    float _1746 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1748 = fma(_1740, -0.5, 0.5);
    float _1750 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1752 = fma(_1740, 0.5, 0.5);
    float _1754 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1746);
    float _1756 = floor(_1678);
    float _1758 = _1732 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1760 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1742);
    float _1762 = _1722 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1764 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1750);
    float _1766 = _1712 + 1.0;
    float _1768 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1760);
    float _1770 = exp2(_1762);
    float _1772 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1764);
    float _1774 = _1744 * 0.693147182464599609375;
    float _1776 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1772);
    float _1778 = _1774 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1780 = 1.0 / _1768;
    float _1782 = fma(_1752, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1784 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1754);
    float _1786 = -_1756;
    float _1788 = _1678 + _1786;
    float _1790 = fma(_1752, _1782, -0.212114393711090087890625);
    float _1792 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1784);
    float _1794 = sqrt(_1748);
    float2 _5008 = float2(_1736, _1788);
    float _1796 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5008, float2(0.0), isnan(_5008)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5008, float2(0.0), isnan(_5008)), level(0.0)).x;
    float _1798 = -_1712;
    float _1800 = fma(_1770, _1766, _1798);
    float _1802 = fma(_1752, _1790, 1.570728778839111328125);
    float _1804 = fma(_1800, 0.5, 0.5);
    float _1806 = _1792 * _1780;
    float _1808 = _1776 * _1780;
    float _1810 = fma(_1806, 0.5, 0.5);
    float _1812 = fma(_1808, -0.5, 0.5);
    float _1814 = _1794 * 0.636619746685028076171875;
    float3 _5044 = float3(_1810, _1812, _1778);
    float _1816 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5044, float3(0.0), isnan(_5044)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5044, float3(0.0), isnan(_5044)), level(0.0)).x;
    float _1818 = -_1802;
    float _1820 = fma(_1814, _1818, 1.0);
    float3 _5060 = float3(_1810, _1812, _1778);
    float4 _1823 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5060, float3(0.0), isnan(_5060)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5060, float3(0.0), isnan(_5060)), level(0.0)).xyzw;
    float _1825 = _1823.x;
    float _1827 = _1823.y;
    float _1829 = _1823.z;
    float _1831 = _1823.w;
    float2 _5076 = float2(_1820, _1804);
    float3 _1835 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5076, float2(0.0), isnan(_5076)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5076, float2(0.0), isnan(_5076)), level(0.0)).xyz;
    float _1837 = _1835.x;
    float _1839 = _1835.y;
    float _1841 = _1835.z;
    float _1843 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1845 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1847 = _1512 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1849 = isnan(_1512);
    bool _1851 = _1847 || _1849;
    bool _1853 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1855 = _1851 || _1853;
    float _1857 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1843);
    float _1859 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1845);
    float _1861 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1857);
    float _1863 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1865 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1859);
    float _1867 = _1861 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1869 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1863);
    float _1871 = 1.0 / _1867;
    float _1873 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1869);
    float _1875 = _1873 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1877 = _1875 + _1867;
    float _1879 = _1877 * _1871;
    float _1881 = _1879 * 0.5;
    float _1883 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1885 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1883);
    float _1887 = 1.0 / _1885;
    float _1889 = _1722 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1891 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1865);
    float _1893 = in.m_85.x;
    float _1895 = exp2(_1889);
    float _1897 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1899 = _1887 * _1897;
    bool _1901 = _1899 <= 8000.0;
    bool _1903 = isnan(_1899);
    bool _1905 = _1901 || _1903;
    bool _1907 = isnan(8000.0);
    bool _1909 = _1905 || _1907;
    float _1911 = float(_1909);
    float _1913 = abs(_1899);
    float _1915 = log2(_1913);
    float _1917 = -_1895;
    float _1919 = _1917 + 1.0;
    float _1921 = _1919 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1792;
    out.gl_Position.y = _1776;
    out.gl_Position.z = _1891;
    out.gl_Position.w = _1768;
    float _1923 = _1915 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1925 = exp2(_1923);
    float _1927 = -_1921;
    float _1929 = _1927 + 1.0;
    float _1931 = _1776;
    float _1933 = _1768;
    float _1935 = _1891;
    float _1937 = _1929;
    if (!_1855)
    {
        _1931 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1939 = _1931;
    float _1941 = fma(_1925, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1943 = precise::clamp(_1941, 0.0, 1.0);
    float _1945 = _1891 + _1768;
    float _1947 = _1939;
    float _1949 = _1939;
    if (!_1855)
    {
        _1933 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1951 = _1933;
    float _1953 = fma(_1943, -2.0, 3.0);
    float _1955 = _1943 * _1943;
    float _1957 = _1951;
    float _1959 = _1951;
    if (!_1855)
    {
        _1935 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1961 = _1935;
    float _1963 = _1955 * _1953;
    float _1965 = -_1963;
    float _1967 = _1965 + 1.0;
    float _1969 = fma(_1967, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1963);
    float _1971 = _1945 * 0.5;
    float _1973 = _1911 * _1969;
    out.m_87.z = _1971;
    out.m_87.w = _1768;
    float _1975 = _1973 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1977 = -_1796;
    float _1979 = _1977 + 1.0;
    float _1981 = _1979 * _1975;
    float _1983 = precise::clamp(_1981, 0.0, 1.0);
    float _1985 = -_1983;
    float _1987 = fma(_1985, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1989 = _1987 * _1893;
    float _1991 = _1921 * _1816;
    float _1993 = _1989 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1995 = _1831 * _1991;
    float _1997 = _1831 * _1929;
    out.m_89.x = _1993;
    float _1999 = _1827;
    float _2001 = _1825;
    float _2003 = _1961;
    float _2005 = _1961;
    if (!_1855)
    {
        _1937 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2007 = _1937;
    float _2009 = _1841 * _1991;
    float _2011 = fma(_1837, _1995, _1825);
    float _2013 = fma(_1839, _1995, _1827);
    float _2015 = _2007;
    float _2017 = _2007;
    if (!_1855)
    {
        _1999 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2019 = _1999;
    float _2021 = fma(_1831, _2009, _1829);
    float _2023 = _2019;
    float _2025 = _2019;
    if (!_1855)
    {
        _2001 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2027 = _2001;
    out.m_91.x = _2011;
    out.m_91.y = _2013;
    out.m_91.z = _2021;
    out.m_91.w = _1997;
    bool _2029 = !_1855;
    float _2031 = _2027;
    float _2033 = _2027;
    if (!_2029)
    {
        bool _2035 = _1512 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2037 = isnan(_1512);
        bool _2039 = _2035 || _2037;
        bool _2041 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2043 = _2039 || _2041;
        if (!_2043)
        {
            float _2045 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2047 = _1512 + _2045;
            float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2051 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2049;
            float _2053 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2055 = _2053 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2057 = 1.0 / _2051;
            float _2059 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2061 = _2059 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2063 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2065 = _2063 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2069 = _2067 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2071 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2073 = _2071 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2075 = _2047 * _2057;
            float _2077 = precise::clamp(_2075, 0.0, 1.0);
            float _2079 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2081 = _2079 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2083 = fma(_2077, _2055, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2085 = fma(_2077, _2081, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2087 = fma(_2077, _2061, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2089 = fma(_2077, _2065, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2091 = fma(_2077, _2069, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2093 = fma(_2077, _2073, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2033 = _2087;
            _1949 = _2091;
            _2025 = _2083;
            _2005 = _2089;
            _1959 = _2085;
            _2017 = _2093;
            _2095 = true;
        }
        else
        {
            bool _2097 = _1512 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2099 = isnan(_1512);
            bool _2101 = _2097 || _2099;
            bool _2103 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2105 = _2101 || _2103;
            if (!_2105)
            {
                _2023 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2107 = _2023;
            _2025 = _2107;
            if (!_2105)
            {
                _2031 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2109 = _2031;
            _2033 = _2109;
            if (!_2105)
            {
                _1957 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2111 = _1957;
            _1959 = _2111;
            if (!_2105)
            {
                _2003 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2113 = _2003;
            _2005 = _2113;
            if (!_2105)
            {
                _1947 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2115 = _1947;
            _1949 = _2115;
            if (!_2105)
            {
                _2015 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2117 = _2015;
            bool _2119 = !_2105;
            _2017 = _2117;
            if (!_2119)
            {
                bool _2121 = _1512 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2123 = isnan(_1512);
                bool _2125 = _2121 || _2123;
                bool _2127 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2129 = _2125 || _2127;
                if (!_2129)
                {
                    float _2131 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2133 = _1512 + _2131;
                    float _2135 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2137 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2135;
                    float _2139 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2141 = _2139 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2143 = 1.0 / _2137;
                    float _2145 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2147 = _2145 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2149 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2151 = _2149 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2153 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2155 = _2153 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2157 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2159 = _2157 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2161 = _2133 * _2143;
                    float _2163 = precise::clamp(_2161, 0.0, 1.0);
                    float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2167 = _2165 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2169 = fma(_2163, _2141, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2171 = fma(_2163, _2167, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2173 = fma(_2163, _2147, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2175 = fma(_2163, _2151, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2177 = fma(_2163, _2155, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2179 = fma(_2163, _2159, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2033 = _2173;
                    _1949 = _2177;
                    _2025 = _2169;
                    _2005 = _2175;
                    _1959 = _2171;
                    _2017 = _2179;
                    _2095 = true;
                }
                else
                {
                    _2033 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1949 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2025 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2005 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1959 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2017 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2095 = false;
    float _2181 = _2033;
    float _2183 = _1949;
    float _2185 = _2025;
    float _2187 = _2005;
    float _2189 = _1959;
    float _2191 = _2017;
    float _2193 = fma(_1304, -0.5, 0.5);
    float _2195 = precise::clamp(_2193, 0.0, 1.0);
    float _2197 = -_2181;
    float _2199 = _2197 + _2183;
    float _2201 = -_2185;
    float _2203 = _2201 + _2187;
    float _2205 = -_2189;
    float _2207 = _2205 + _2191;
    bool _2209 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2211 = fma(_2195, _2199, _2181);
    float _2213 = fma(_2195, _2203, _2185);
    float _2215 = fma(_2195, _2207, _2189);
    float _2217 = _2211 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2219 = fma(_2213, 0.298911988735198974609375, _2217);
    float _2221 = fma(_2215, 0.114477999508380889892578125, _2219);
    out.m_93.x = 0.0;
    float _2223 = -_2221;
    float _2225 = _2213 + _2223;
    float _2227 = -_2221;
    float _2229 = _2211 + _2227;
    float _2231 = -_2221;
    float _2233 = _2215 + _2231;
    float _2235 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2237 = fma(_2225, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2221);
    float _2239 = fma(_2229, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2221);
    float _2241 = fma(_2233, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2221);
    out.m_89.w = _2235;
    out.m_95.x = _2237;
    out.m_95.y = _2239;
    out.m_95.z = _2241;
    if (!_2209)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2243 = -_1486;
    float _2245 = _2243 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2247 = -_1488;
    float _2249 = _2247 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2251 = -_1490;
    float _2253 = _2251 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2255 = _2245 * _2245;
    float _2257 = fma(_2249, _2249, _2255);
    float _2259 = fma(_2253, _2253, _2257);
    float _2261 = sqrt(_2259);
    float _2263 = rsqrt(_2259);
    float _2265 = -_2261;
    float _2267 = _2265 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2269 = _2267 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2271 = precise::clamp(_2269, 0.0, 1.0);
    float _2273 = _2249 * _2263;
    float _2275 = _2245 * _2263;
    float _2277 = abs(_2271);
    float _2279 = log2(_2277);
    float _2281 = _2253 * _2263;
    float _2283 = _2273 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2285 = _1304 * _2275;
    float _2287 = -_2275;
    float _2289 = -_2283;
    float _2291 = fma(_2287, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2289);
    float _2293 = fma(_1272, _2273, _2285);
    float _2295 = -_2281;
    float _2297 = fma(_2295, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2291);
    float _2299 = fma(_1306, _2281, _2293);
    float _2301 = precise::clamp(_2299, 0.0, 1.0);
    float _2303 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2305 = _2297 + _2303;
    float _2307 = _2279 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2309 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2311 = precise::clamp(_2309, 0.0, 1.0);
    float _2313 = exp2(_2307);
    float _2315 = _2313 * _2311;
    float _2317 = _2301 * _2315;
    float _2319 = _2317 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2321 = _2317 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2323 = _2317 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2319;
    out.m_93.y = _2321;
    out.m_93.z = _2323;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2095 = false;
    bool _1362 = false;
    bool _350 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_48.w;
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
        out.m_51.x = 0.0;
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
        float _2380 = as_type<float>(_130);
        out.gl_Position.z = _2380;
    }
    if (!_118)
    {
        return out;
    }
    float _134 = in.m_53.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = 0.0;
    float _152 = _148;
    if (_144)
    {
        float _154 = float(_114);
        _150 = _154;
    }
    float _156 = _150;
    bool _158 = _148 >= _156;
    bool _160 = !_144;
    bool _162 = _158 || _160;
    if (_162)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _124;
    if (_162)
    {
        out.m_51.x = 0.0;
    }
    if (_162)
    {
        float _166 = _164 * 5.0;
        _132 = as_type<int>(_166);
    }
    int _168 = _132;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2449 = as_type<float>(_168);
        out.gl_Position.z = _2449;
    }
    if (_162)
    {
        return out;
    }
    float _170 = in.m_55.x;
    float _172 = in.m_55.y;
    float _174 = in.m_55.z;
    float _176 = in.m_57.x;
    float _178 = in.m_57.y;
    float _180 = in.m_57.z;
    float _182 = in.m_59.x;
    float _184 = in.m_59.y;
    float _186 = in.m_59.z;
    float _188 = _170 * _170;
    float _190 = _174 * _174;
    float _192 = _172 * _172;
    float _194 = fma(_176, _176, _188);
    float _196 = fma(_180, _180, _190);
    float _198 = fma(_178, _178, _192);
    float _200 = fma(_182, _182, _194);
    float _202 = fma(_186, _186, _196);
    float _204 = fma(_184, _184, _198);
    float _206 = sqrt(_200);
    float _208 = sqrt(_202);
    float _210 = sqrt(_204);
    bool _212 = _206 > 0.0;
    bool _214 = _208 > 0.0;
    float _216 = _208;
    float _218 = _206;
    float _220 = _202;
    float _222 = _170;
    if (_212)
    {
        float _224 = rsqrt(_200);
        _216 = _224;
    }
    float _226 = _216;
    if (!_212)
    {
        _218 = 0.0;
    }
    float _228 = _218;
    bool _230 = _210 > 0.0;
    float _232 = 0.0;
    float _234 = _228;
    if (!_212)
    {
        _232 = 0.0;
    }
    float _236 = _232;
    float _238 = 0.0;
    float _240 = _236;
    if (!_212)
    {
        _238 = 0.0;
    }
    float _242 = _238;
    float _244 = 0.0;
    float _246 = _242;
    if (_214)
    {
        float _248 = rsqrt(_202);
        _244 = _248;
    }
    float _250 = _244;
    float _252 = 0.0;
    if (!_214)
    {
        _252 = 0.0;
    }
    float _254 = _252;
    float _256 = _210;
    float _258 = _254;
    if (_230)
    {
        float _260 = rsqrt(_204);
        _256 = _260;
    }
    float _262 = _256;
    float _264 = _226;
    if (_212)
    {
        float _266 = _226 * _176;
        _234 = _266;
    }
    float _268 = _234;
    if (_212)
    {
        float _270 = _226 * _170;
        _240 = _270;
    }
    float _272 = _240;
    if (_212)
    {
        float _274 = _226 * _182;
        _246 = _274;
    }
    float _276 = _246;
    bool _278 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _280 = 0.0;
    float _282 = 0.0;
    if (!_230)
    {
        _280 = 0.0;
        _282 = 0.0;
    }
    float _284 = _280;
    float _286 = _282;
    float _288 = 0.0;
    float _290 = _284;
    float _292 = _286;
    if (!_230)
    {
        _288 = 0.0;
    }
    float _294 = _288;
    float _296 = _294;
    if (!_214)
    {
        _264 = 0.0;
    }
    float _298 = _264;
    float _300 = _298;
    if (_214)
    {
        float _302 = _250 * _180;
        _258 = _302;
    }
    float _304 = _258;
    if (!_214)
    {
        _220 = 0.0;
    }
    float _306 = _220;
    float _308 = _306;
    if (_214)
    {
        float _310 = _250 * _174;
        _300 = _310;
    }
    float _312 = _300;
    if (_214)
    {
        float _314 = _250 * _186;
        _308 = _314;
    }
    float _316 = _308;
    if (_230)
    {
        float _318 = _262 * _178;
        _290 = _318;
    }
    float _320 = _290;
    if (_230)
    {
        float _322 = _262 * _172;
        _292 = _322;
    }
    float _324 = _292;
    if (_230)
    {
        float _326 = _262 * _184;
        _296 = _326;
    }
    float _328 = _296;
    bool _330 = !_278;
    float _348;
    if (!_330)
    {
        float _332 = in.m_61.x;
        float _334 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _336 = _332 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _338 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[12].x, _148);
        float _340 = _338 * _334;
        float _342 = floor(_340);
        float _344 = -_342;
        float _346 = _340 + _344;
        _348 = _346;
        _350 = true;
    }
    else
    {
        float _352 = float(_114);
        float _354 = 1.0 / _352;
        float _356 = _148 * _354;
        _348 = _356;
    }
    _350 = false;
    float _358 = _348;
    float _360 = in.m_61.z;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _364 = _358 + _362;
    float _366 = in.m_48.x;
    float _368 = in.m_48.y;
    float _370 = in.m_48.z;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _378 = _376 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _380 = in.m_61.x;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _390 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _392 = log2(_390);
    float _394 = in.m_61.y;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _398 = _358 + _396;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _402 = _358 + _400;
    int _404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _406 = _404 != 0;
    int _408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _410 = _408 != 0;
    float _412 = 1.0 / _374;
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _416 = _414 != 0;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _420 = _418 != 0;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _424 = _422 != 0;
    float _426 = _360 * 2.0;
    float _428 = 1.0 / _384;
    float _430 = _178 * _368;
    float _432 = _184 * _368;
    float _434 = _392 * _148;
    float _436 = fma(_176, _366, _430);
    float _438 = fma(_182, _366, _432);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _442 = _358 + _440;
    float _444 = floor(_426);
    float _446 = _364 * _412;
    float _448 = _380 * 2.0;
    float _450 = fma(_180, _370, _436);
    float _452 = _380 + _360;
    float _454 = _394 * 2.0;
    float _456 = _394 + _360;
    float _458 = 1.0 / _378;
    float _460 = _398 * _428;
    float _462 = _380 + _394;
    float _464 = _452 + (-1.0);
    float _466 = _456 + (-1.0);
    float _468 = _462 + (-1.0);
    float _470 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _472 = 1.0 / _388;
    bool _474 = _444 > 0.0;
    float _476 = fma(_186, _370, _438);
    bool _478 = _444 >= 0.0;
    bool _480 = isnan(_444);
    bool _482 = _478 || _480;
    bool _484 = isnan(0.0);
    bool _486 = _482 || _484;
    float _488 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _490 = floor(_448);
    float _492 = _402 * _458;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _494;
    bool _498 = !_416;
    int _500 = _498 ? 0 : 1;
    float _502 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _504 = floor(_454);
    float _506 = _442 * _472;
    int _508 = _486 ? 0 : 1;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _510;
    float _514 = fma(_496, _460, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _520 = ~_508;
    int _522 = _520 + 1;
    int _524 = _522 + 1;
    float _526 = fma(_512, _460, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _528 = _524;
    if (!_474)
    {
        int _530 = ~_508;
        int _532 = _530 + 1;
        _528 = _532;
    }
    int _534 = _528;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _536;
    float _540 = exp2(_434);
    bool _542 = _490 >= 0.0;
    bool _544 = isnan(_490);
    bool _546 = _542 || _544;
    bool _548 = isnan(0.0);
    bool _550 = _546 || _548;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _556 = fma(_538, _460, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    int _562 = _550 ? 0 : 1;
    float _564 = fma(_554, _506, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _566 = _504 > 0.0;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _568;
    bool _572 = _504 >= 0.0;
    bool _574 = isnan(_504);
    bool _576 = _572 || _574;
    bool _578 = isnan(0.0);
    bool _580 = _576 || _578;
    float _582 = fma(_518, _506, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _584 = _490 > 0.0;
    float _586 = fma(_560, _506, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _588;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _592;
    bool _596 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _598 = isnan(_358);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = fma(_570, _446, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _610 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _612 = isnan(_358);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = fma(_590, _446, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _624 = fma(_594, _446, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _628 = 1.0 + _626;
    bool _630 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _632 = isnan(_358);
    bool _634 = _630 || _632;
    bool _636 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _638 = _634 || _636;
    float _640 = float(_638);
    float _642 = -_606;
    float _644 = _642 + 1.0;
    float _646 = -_620;
    float _648 = _646 + 1.0;
    bool _650 = !_420;
    int _652 = _650 ? 0 : 1;
    float _654 = -_540;
    float _656 = _654 + 1.0;
    bool _658 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _660 = isnan(0.0);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _666 = _662 || _664;
    float _668 = _606 * _648;
    bool _670 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _672 = isnan(_358);
    bool _674 = _670 || _672;
    bool _676 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _678 = _674 || _676;
    float _680 = float(_678);
    float _682 = _640 * _644;
    float _684 = 1.0 / _628;
    bool _686 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _688 = isnan(_358);
    bool _690 = _686 || _688;
    bool _692 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _694 = _690 || _692;
    float _696 = float(_694);
    float _698 = -_640;
    float _700 = _698 + 1.0;
    float _702 = in.m_63.x;
    float _704 = in.m_63.y;
    float _706 = in.m_63.z;
    float _708 = _666 ? _656 : 0.0;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _712 = _710 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _714 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _716 = isnan(1.0);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _722 = _718 || _720;
    float _724 = _680 * _700;
    int _726 = abs(_500);
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _732 = fma(_712, _492, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _734 = -_680;
    float _736 = _734 + 1.0;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _742 = float(_534);
    float _744 = _696 * _736;
    float _746 = float(_726);
    float _748 = fma(_740, _492, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _750 = _380 + (-0.5);
    float _752 = _708;
    if (_722)
    {
        float _754 = _708 * _684;
        _152 = _754;
    }
    float _756 = _152;
    float _758 = _526 * _744;
    float _760 = -_696;
    float _762 = _760 + 1.0;
    float _764 = _746 * _742;
    float _766 = _514 * _744;
    float _768 = _556 * _744;
    int _770 = ~_562;
    int _772 = _770 + 1;
    int _774 = _772 + 1;
    float _776 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[143].y, _758);
    float _778 = _764 * (-2.0);
    int _780 = abs(_652);
    float _782 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[143].x, _766);
    int _784 = _774;
    if (!_584)
    {
        int _786 = ~_562;
        int _788 = _786 + 1;
        _784 = _788;
    }
    int _790 = _784;
    float _792 = fma(_778, _702, _702);
    float _794 = float(_780);
    float _796 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[143].z, _768);
    float _798 = float(_790);
    float _800 = fma(_488, _778, _488);
    float _802 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[196].x, _792);
    int _804 = _580 ? 0 : 1;
    float _806 = fma(_582, _724, _782);
    bool _808 = !_424;
    int _810 = _808 ? 0 : 1;
    float _812 = _794 * _798;
    float _814 = fma(_800, _756, _802);
    int _816 = ~_804;
    int _818 = _816 + 1;
    int _820 = _818 + 1;
    float _822 = _394 + (-0.5);
    int _824 = abs(_810);
    float _826 = _812 * (-2.0);
    int _828 = _820;
    if (!_566)
    {
        int _830 = ~_804;
        int _832 = _830 + 1;
        _828 = _832;
    }
    int _834 = _828;
    float _836 = _814 * 0.15915493667125701904296875;
    float _838 = float(_824);
    float _840 = fma(_826, _704, _704);
    float _842 = float(_834);
    float _844 = fma(_502, _826, _502);
    float _846 = fma(_564, _724, _776);
    float _848 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[196].y, _840);
    float _850 = fma(_608, _682, _806);
    float _852 = _838 * _842;
    float _854 = in.m_65.x;
    float _856 = in.m_65.y;
    float _858 = in.m_65.z;
    float _860 = fma(_844, _756, _848);
    float _862 = fma(_586, _724, _796);
    float _864 = _852 * (-2.0);
    float _866 = in.m_67.x;
    float _868 = in.m_67.y;
    float _870 = in.m_67.z;
    float _872 = _860 * 0.15915493667125701904296875;
    float _874 = _360 + (-0.5);
    float _876 = fma(_864, _706, _706);
    float _878 = fma(_470, _864, _470);
    float _880 = fma(_730, _492, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _882 = fma(_622, _682, _846);
    float _884 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[196].z, _876);
    float _886 = fma(_624, _682, _862);
    float _888 = fma(_732, _668, _850);
    float _890 = fma(_748, _668, _882);
    float _892 = fma(_878, _756, _884);
    float _894 = fma(_880, _668, _886);
    float _896 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[147].x, _888);
    float _898 = _836 * 6.283185482025146484375;
    float _900 = sin(_898);
    float _902 = _892 * 0.15915493667125701904296875;
    float _904 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[147].y, _890);
    float _906 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[147].z, _894);
    float _908 = in.m_69.x;
    bool _910 = _380 > 0.5;
    bool _912 = _910 && _406;
    float _914 = _896 * _854;
    float _916 = _906 * _858;
    float _918 = _872 * 6.283185482025146484375;
    float _920 = sin(_918);
    float _922 = _904 * _856;
    float _924 = _914 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _926 = in.m_57.w;
    float _928 = _916 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _866);
    float _932 = _922 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _934 = _872 * 6.283185482025146484375;
    float _936 = cos(_934);
    float _938 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _868);
    float _940 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _870);
    float _942 = in.m_69.y;
    bool _944 = _868 != 0.0;
    bool _946 = isnan(_868);
    bool _948 = _944 || _946;
    bool _950 = isnan(0.0);
    bool _952 = _948 || _950;
    float _954 = _932 * _938;
    float _956 = _172 * _368;
    float _958 = in.m_59.w;
    float _960 = _902 * 6.283185482025146484375;
    float _962 = cos(_960);
    float _964 = _924 * _930;
    float _966 = _900 * _920;
    float _968 = in.m_69.z;
    bool _970 = _866 == 0.0;
    bool _972 = !_952;
    bool _974 = _970 && _972;
    float _976 = fma(_170, _366, _956);
    bool _978 = _394 > 0.5;
    float _980 = in.m_55.w;
    float _982 = _836 * 6.283185482025146484375;
    float _984 = cos(_982);
    float _986 = _900 * _936;
    bool _988 = _870 == 0.0;
    bool _990 = _988 && _974;
    out.m_71.x = _908;
    float _992 = fma(_174, _370, _976);
    float _994 = _902 * 6.283185482025146484375;
    float _996 = sin(_994);
    float _998 = _900 * _962;
    float _1000 = _928 * _940;
    out.m_71.y = _942;
    float _1002 = _998 * _954;
    float _1004 = _476 + _958;
    float _1006 = _984 * _936;
    float _1008 = _984 * _920;
    float _1010 = _984 * _962;
    float _1012 = _936 * _962;
    float _1014 = _920 * _962;
    out.m_71.z = _968;
    float _1016 = _1010 * _954;
    float _1018 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1020 = fma(_996, _1006, _966);
    float _1022 = fma(_996, _966, _1006);
    float _1024 = -_1008;
    float _1026 = fma(_996, _986, _1024);
    float _1028 = -_954;
    float _1030 = _996 * _1028;
    float _1032 = -_986;
    float _1034 = fma(_996, _1008, _1032);
    float _1036 = fma(_1020, _964, _1016);
    float _1038 = fma(_1026, _964, _1002);
    float _1040 = fma(_1012, _964, _1030);
    float _1042 = _450 + _926;
    float _1044 = fma(_1034, _1000, _1036);
    float _1046 = fma(_1022, _1000, _1038);
    float _1048 = fma(_1014, _1000, _1040);
    float _1050 = in.m_73.y;
    float _1052 = _1044 * _320;
    float _1054 = _1044 * _328;
    float _1056 = _1044 * _324;
    float _1058 = in.m_73.x;
    float _1060 = fma(_1048, _268, _1052);
    float _1062 = fma(_1048, _276, _1054);
    float _1064 = fma(_1048, _272, _1056);
    float _1066 = _992 + _980;
    float _1068 = fma(_1046, _304, _1060);
    float _1070 = fma(_1046, _316, _1062);
    float _1072 = fma(_1046, _312, _1064);
    float _1074 = _1042 + _1068;
    float _1076 = _1004 + _1070;
    float _1078 = in.m_75.x;
    float _1080 = in.m_75.y;
    float _1082 = in.m_75.z;
    float _1084 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1086 = _1074 + _1084;
    float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1090 = _1076 + _1088;
    float _1092 = _1086 * _1086;
    float _1094 = _1090 * _1090;
    float _1096 = -_1050;
    float _1098 = _1096 + 1.0;
    float _1100 = _1092 + _1094;
    float _1102 = _1050;
    float _1104 = _1092;
    float _1106 = _1094;
    float _1108 = _1074;
    float _1110 = _1076;
    if (_406)
    {
        _752 = _1058;
    }
    float _1112 = _752;
    float _1114 = sqrt(_1100);
    float _1116 = _1112;
    if (!_406)
    {
        _222 = _1058;
    }
    float _1118 = _222;
    float _1120 = _1118;
    if (_912)
    {
        float _1122 = -_1112;
        float _1124 = _1122 + 1.0;
        _1116 = _1124;
    }
    float _1126 = _1116;
    if (_410)
    {
        float _1128 = _978 ? _1098 : _1050;
        _1102 = _1128;
    }
    float _1130 = _1102;
    if (_406)
    {
        _1120 = _1126;
    }
    float _1132 = _1120;
    float _1134 = _1080;
    float _1136 = _1078;
    float _1138 = _1082;
    if (!_990)
    {
        float _1140 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1080);
        _1134 = _1140;
    }
    float _1142 = _1134;
    if (!_990)
    {
        float _1144 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1078);
        _1136 = _1144;
    }
    float _1146 = _1136;
    if (!_990)
    {
        float _1148 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1082);
        _1138 = _1148;
    }
    float _1150 = _1138;
    float _1152 = _1066 + _1072;
    float _1154 = -_1142;
    float _1156 = _996 * _1154;
    float _1158 = _1010 * _1142;
    float _1160 = _998 * _1142;
    bool _1162 = _1114 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1164 = fma(_1012, _1146, _1156);
    float _1166 = fma(_1020, _1146, _1158);
    float _1168 = fma(_1026, _1146, _1160);
    float _1170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1172 = fma(_1014, _1150, _1164);
    float _1174 = fma(_1034, _1150, _1166);
    float _1176 = fma(_1022, _1150, _1168);
    float _1178 = _1156;
    if (!_1162)
    {
        _1178 = _1152;
    }
    float _1180 = _1178;
    bool _1182 = !_1162;
    float _1184 = _1180;
    if (!_1182)
    {
        float _1186 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1188 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1190 = _1114 + _1188;
        float _1192 = rsqrt(_1100);
        float _1194 = _1190 * _1186;
        float _1196 = _1152 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1198 = _1194 * 0.15915493667125701904296875;
        float _1200 = _1198 * 6.283185482025146484375;
        float _1202 = sin(_1200);
        float _1204 = _1198 * 6.283185482025146484375;
        float _1206 = cos(_1204);
        float _1208 = fma(_1202, _1196, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1210 = _1192 * _1208;
        float _1212 = _1206 + (-1.0);
        float _1214 = fma(_1086, _1210, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1216 = fma(_1090, _1210, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1218 = _1212 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1220 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1222 = _1214 + _1220;
        float _1224 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1226 = _1216 + _1224;
        float _1228 = fma(_1152, _1206, _1218);
        float _1230 = _1222 * _1222;
        float _1232 = _1226 * _1226;
        _1184 = _1228;
        _1104 = _1230;
        _1106 = _1232;
        _1108 = _1214;
        _1110 = _1216;
    }
    float _1234 = _1184;
    float _1236 = _1104;
    float _1238 = _1106;
    float _1240 = _1108;
    float _1242 = _1110;
    float _1244 = _1174 * _320;
    float _1246 = _1174 * _324;
    float _1248 = _1174 * _328;
    float _1250 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1252 = _1234 + _1250;
    float _1254 = _1130 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1256 = fma(_1172, _268, _1244);
    float _1258 = fma(_1172, _276, _1248);
    float _1260 = fma(_1252, _1252, _1236);
    float _1262 = in.m_69.w;
    float _1264 = fma(_1172, _272, _1246);
    float _1266 = _1254 * _1170;
    float _1268 = _1260 + _1238;
    float _1270 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1272 = fma(_1176, _304, _1256);
    float _1274 = sqrt(_1268);
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1286 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1288 = _1270 * _1018;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1292 = _1276 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1294 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1296 = _1280 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1298 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1300 = _1284 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1302 = _1286 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1304 = fma(_1176, _312, _1264);
    float _1306 = fma(_1176, _316, _1258);
    out.m_71.w = _1262;
    bool _1308 = _1274 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1310 = isnan(_1274);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1316 = _1312 || _1314;
    out.m_77.x = _1292;
    out.m_77.y = _1294;
    out.m_77.z = _1296;
    out.m_77.w = _1290;
    out.m_79.x = _1298;
    out.m_79.y = _1300;
    out.m_79.z = _1302;
    out.m_81.x = _1288;
    out.m_81.y = _1266;
    float _1318 = _1252;
    float _1320 = _1298;
    float _1322 = _1300;
    float _1324 = _1296;
    float _1326 = _1290;
    if (!_1316)
    {
        _1318 = 1.0;
    }
    float _1328 = _1318;
    out.m_83.x = _1272;
    out.m_83.y = _1304;
    out.m_83.z = _1306;
    bool _1330 = !_1316;
    float _1332 = _1328;
    if (!_1330)
    {
        bool _1334 = _1274 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1336 = isnan(_1274);
        bool _1338 = _1334 || _1336;
        bool _1340 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1342 = _1338 || _1340;
        if (!_1342)
        {
            float _1344 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1346 = _1274 + _1344;
            float _1348 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1350 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1348;
            float _1352 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1354 = _1352 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1356 = 1.0 / _1350;
            float _1358 = _1346 * _1356;
            float _1360 = fma(_1358, _1354, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1332 = _1360;
            _1320 = _1354;
            _1362 = true;
        }
        else
        {
            bool _1364 = _1274 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1366 = isnan(_1274);
            bool _1368 = _1364 || _1366;
            bool _1370 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1372 = _1368 || _1370;
            if (!_1372)
            {
                float _1374 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1376 = _1274 + _1374;
                float _1378 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1380 = _1378 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1382 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1384 = _1382 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1386 = 1.0 / _1380;
                float _1388 = _1376 * _1386;
                float _1390 = fma(_1388, _1384, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1332 = _1390;
                _1320 = _1384;
                _1362 = true;
            }
            else
            {
                _1332 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1362 = false;
    float _1392 = _1332;
    float _1394 = _1320;
    float _1396 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1398 = _1240 + _1396;
    float _1400 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1402 = _1234 + _1400;
    float _1404 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1406 = _1242 + _1404;
    bool _1408 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1410 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1412 = _1408 || _1410;
    bool _1414 = isnan(0.5);
    bool _1416 = _1412 || _1414;
    float _1418 = fma(_1398, _1392, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1420 = fma(_1402, _1392, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1422 = fma(_1406, _1392, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1424 = _1394;
    float _1426 = _1422;
    if (_1416)
    {
        _1424 = _1418;
    }
    float _1428 = _1424;
    float _1430 = _1428;
    if (_1416)
    {
        _1322 = _1420;
    }
    float _1432 = _1322;
    float _1434 = _1432;
    if (!_1416)
    {
        float _1436 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1438 = _1066 + _1436;
        float _1440 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1442 = _1042 + _1440;
        float _1444 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1446 = _1438 * _1438;
        float _1448 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1450 = _1004 + _1448;
        float _1452 = fma(_1442, _1442, _1446);
        float _1454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1456 = fma(_1450, _1450, _1452);
        float _1458 = sqrt(_1456);
        float _1460 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1462 = precise::min(_1458, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1464 = _1462 * _1454;
        float _1466 = -_1042;
        float _1468 = _1466 + _1418;
        float _1470 = -_1004;
        float _1472 = _1470 + _1422;
        float _1474 = _1460 * _1464;
        float _1476 = -_1066;
        float _1478 = _1476 + _1420;
        float _1480 = fma(_1468, _1474, _1042);
        float _1482 = fma(_1478, _1474, _1066);
        float _1484 = fma(_1472, _1474, _1004);
        _1434 = _1482;
        _1430 = _1480;
        _1426 = _1484;
    }
    float _1486 = _1434;
    float _1488 = _1430;
    float _1490 = _1426;
    float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1494 = _1486 + _1492;
    float _1496 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1498 = _1488 + _1496;
    float _1500 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1502 = _1490 + _1500;
    float _1504 = _1494 * _1494;
    float _1506 = fma(_1498, _1498, _1504);
    float _1508 = fma(_1502, _1502, _1506);
    float _1510 = rsqrt(_1508);
    float _1512 = sqrt(_1508);
    float _1514 = _1510 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1516 = _1498 * _1514;
    float _1518 = _1502 * _1514;
    float _1520 = _1516 * _1516;
    float _1522 = _1518 * _1518;
    float _1524 = _1520 + _1522;
    float _1526 = sqrt(_1524);
    bool _1528 = _1526 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1530 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1532 = _1526 + _1530;
    float _1534 = _1510;
    float _1536 = _1532;
    float _1538 = _1494;
    if (_1528)
    {
        float _1540 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1534 = _1540;
    }
    float _1542 = _1534;
    if (_1528)
    {
        float _1544 = rsqrt(_1524);
        _1324 = _1544;
    }
    float _1546 = _1324;
    float _1548 = _1546;
    if (_1528)
    {
        float _1550 = _1532 * _1542;
        _1536 = _1550;
    }
    float _1552 = _1536;
    if (_1528)
    {
        float _1554 = _1552 * 0.15915493667125701904296875;
        _1326 = _1554;
    }
    float _1556 = _1326;
    float _1558 = _1542;
    float _1560 = _1556;
    if (_1528)
    {
        float _1562 = _1556 * 6.283185482025146484375;
        float _1564 = sin(_1562);
        _1558 = _1564;
    }
    float _1566 = _1558;
    float _1568 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1570 = precise::max(0.0, _1568);
    float _1572 = _1502;
    float _1574 = _1570;
    if (_1528)
    {
        float _1576 = _1556 * 6.283185482025146484375;
        float _1578 = cos(_1576);
        _1572 = _1578;
    }
    float _1580 = _1572;
    float _1582 = -_1514;
    float _1584 = -_1570;
    float _1586 = fma(_1494, _1582, _1584);
    float _1588 = _1586;
    if (_1528)
    {
        float _1590 = _1586 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1574 = _1590;
    }
    float _1592 = _1574;
    float _1594 = _1592;
    if (!_1528)
    {
        _1560 = _1522;
    }
    float _1596 = _1560;
    float _1598 = _1566;
    float _1600 = _1596;
    if (_1528)
    {
        float _1602 = fma(_1566, _1592, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1594 = _1602;
    }
    float _1604 = _1594;
    float _1606 = _1580;
    if (_1528)
    {
        float _1608 = _1580 + (-1.0);
        _1538 = _1608;
    }
    float _1610 = _1538;
    float _1612 = _1610;
    if (_1528)
    {
        float _1614 = _1546 * _1604;
        _1598 = _1614;
    }
    float _1616 = _1598;
    if (!_1528)
    {
        _1548 = _1516;
    }
    float _1618 = _1548;
    float _1620 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1622 = _1618;
    if (_1528)
    {
        float _1624 = _1610 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1612 = _1624;
    }
    float _1626 = _1612;
    float _1628 = _1626;
    if (_1528)
    {
        float _1630 = _1516 * _1616;
        _1622 = _1630;
    }
    float _1632 = _1622;
    float _1634 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1528)
    {
        float _1636 = fma(_1586, _1580, _1626);
        _1588 = _1636;
    }
    float _1638 = _1588;
    if (!_1528)
    {
        _1606 = _1518;
    }
    float _1640 = _1606;
    float _1642 = _1640;
    if (_1528)
    {
        float _1644 = _1518 * _1616;
        _1642 = _1644;
    }
    float _1646 = _1642;
    if (!_1528)
    {
        _1628 = _1520;
    }
    float _1648 = _1628;
    float _1650 = _1648;
    if (_1528)
    {
        float _1652 = _1632 * _1632;
        _1650 = _1652;
    }
    float _1654 = _1650;
    float _1656 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1634);
    if (_1528)
    {
        float _1658 = _1646 * _1646;
        _1600 = _1658;
    }
    float _1660 = _1600;
    float _1662 = fma(_1638, _1638, _1654);
    float _1664 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1656);
    float _1666 = fma(_1042, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1668 = _1662 + _1660;
    float _1670 = _1664 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1672 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1674 = fma(_1512, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1672);
    float _1676 = precise::clamp(_1674, 0.0, 1.0);
    float _1678 = fma(_1004, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1680 = rsqrt(_1668);
    float _1682 = _1670 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1684 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1686 = -_1676;
    float _1688 = _1686 + 1.0;
    float _1690 = -_1682;
    float _1692 = fma(_1690, _1620, 1.0);
    float _1694 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1696 = floor(_1666);
    float _1698 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1700 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1694);
    float _1702 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1698);
    float _1704 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1700);
    float _1706 = _1680 * _1632;
    float _1708 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1702);
    float _1710 = _1680 * _1646;
    float _1712 = _1680 * _1638;
    float _1714 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1684);
    float _1716 = _1706 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1718 = _1708 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1720 = abs(_1688);
    float _1722 = log2(_1720);
    float _1724 = _1704 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1726 = -_1716;
    float _1728 = fma(_1712, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1726);
    float _1730 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1732 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1714);
    float _1734 = -_1696;
    float _1736 = _1666 + _1734;
    float _1738 = -_1710;
    float _1740 = fma(_1738, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1728);
    float _1742 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1730);
    float _1744 = log2(_1692);
    float _1746 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1748 = fma(_1740, -0.5, 0.5);
    float _1750 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1752 = fma(_1740, 0.5, 0.5);
    float _1754 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1746);
    float _1756 = floor(_1678);
    float _1758 = _1732 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1760 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1742);
    float _1762 = _1722 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1764 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1750);
    float _1766 = _1712 + 1.0;
    float _1768 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1760);
    float _1770 = exp2(_1762);
    float _1772 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1764);
    float _1774 = _1744 * 0.693147182464599609375;
    float _1776 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1772);
    float _1778 = _1774 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1780 = 1.0 / _1768;
    float _1782 = fma(_1752, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1784 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1754);
    float _1786 = -_1756;
    float _1788 = _1678 + _1786;
    float _1790 = fma(_1752, _1782, -0.212114393711090087890625);
    float _1792 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1784);
    float _1794 = sqrt(_1748);
    float2 _5008 = float2(_1736, _1788);
    float _1796 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5008, float2(0.0), isnan(_5008)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5008, float2(0.0), isnan(_5008)), level(0.0)).x;
    float _1798 = -_1712;
    float _1800 = fma(_1770, _1766, _1798);
    float _1802 = fma(_1752, _1790, 1.570728778839111328125);
    float _1804 = fma(_1800, 0.5, 0.5);
    float _1806 = _1792 * _1780;
    float _1808 = _1776 * _1780;
    float _1810 = fma(_1806, 0.5, 0.5);
    float _1812 = fma(_1808, -0.5, 0.5);
    float _1814 = _1794 * 0.636619746685028076171875;
    float3 _5044 = float3(_1810, _1812, _1778);
    float _1816 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5044, float3(0.0), isnan(_5044)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5044, float3(0.0), isnan(_5044)), level(0.0)).x;
    float _1818 = -_1802;
    float _1820 = fma(_1814, _1818, 1.0);
    float3 _5060 = float3(_1810, _1812, _1778);
    float4 _1823 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5060, float3(0.0), isnan(_5060)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5060, float3(0.0), isnan(_5060)), level(0.0)).xyzw;
    float _1825 = _1823.x;
    float _1827 = _1823.y;
    float _1829 = _1823.z;
    float _1831 = _1823.w;
    float2 _5076 = float2(_1820, _1804);
    float3 _1835 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5076, float2(0.0), isnan(_5076)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5076, float2(0.0), isnan(_5076)), level(0.0)).xyz;
    float _1837 = _1835.x;
    float _1839 = _1835.y;
    float _1841 = _1835.z;
    float _1843 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1845 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1847 = _1512 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1849 = isnan(_1512);
    bool _1851 = _1847 || _1849;
    bool _1853 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1855 = _1851 || _1853;
    float _1857 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1843);
    float _1859 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1845);
    float _1861 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1857);
    float _1863 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1865 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1859);
    float _1867 = _1861 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1869 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1863);
    float _1871 = 1.0 / _1867;
    float _1873 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1869);
    float _1875 = _1873 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1877 = _1875 + _1867;
    float _1879 = _1877 * _1871;
    float _1881 = _1879 * 0.5;
    float _1883 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1885 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1883);
    float _1887 = 1.0 / _1885;
    float _1889 = _1722 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1891 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1865);
    float _1893 = in.m_85.x;
    float _1895 = exp2(_1889);
    float _1897 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1899 = _1887 * _1897;
    bool _1901 = _1899 <= 8000.0;
    bool _1903 = isnan(_1899);
    bool _1905 = _1901 || _1903;
    bool _1907 = isnan(8000.0);
    bool _1909 = _1905 || _1907;
    float _1911 = float(_1909);
    float _1913 = abs(_1899);
    float _1915 = log2(_1913);
    float _1917 = -_1895;
    float _1919 = _1917 + 1.0;
    float _1921 = _1919 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1792;
    out.gl_Position.y = _1776;
    out.gl_Position.z = _1891;
    out.gl_Position.w = _1768;
    float _1923 = _1915 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1925 = exp2(_1923);
    float _1927 = -_1921;
    float _1929 = _1927 + 1.0;
    float _1931 = _1776;
    float _1933 = _1768;
    float _1935 = _1891;
    float _1937 = _1929;
    if (!_1855)
    {
        _1931 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1939 = _1931;
    float _1941 = fma(_1925, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1943 = precise::clamp(_1941, 0.0, 1.0);
    float _1945 = _1891 + _1768;
    float _1947 = _1939;
    float _1949 = _1939;
    if (!_1855)
    {
        _1933 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1951 = _1933;
    float _1953 = fma(_1943, -2.0, 3.0);
    float _1955 = _1943 * _1943;
    float _1957 = _1951;
    float _1959 = _1951;
    if (!_1855)
    {
        _1935 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1961 = _1935;
    float _1963 = _1955 * _1953;
    float _1965 = -_1963;
    float _1967 = _1965 + 1.0;
    float _1969 = fma(_1967, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1963);
    float _1971 = _1945 * 0.5;
    float _1973 = _1911 * _1969;
    out.m_87.z = _1971;
    out.m_87.w = _1768;
    float _1975 = _1973 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1977 = -_1796;
    float _1979 = _1977 + 1.0;
    float _1981 = _1979 * _1975;
    float _1983 = precise::clamp(_1981, 0.0, 1.0);
    float _1985 = -_1983;
    float _1987 = fma(_1985, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1989 = _1987 * _1893;
    float _1991 = _1921 * _1816;
    float _1993 = _1989 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1995 = _1831 * _1991;
    float _1997 = _1831 * _1929;
    out.m_89.x = _1993;
    float _1999 = _1827;
    float _2001 = _1825;
    float _2003 = _1961;
    float _2005 = _1961;
    if (!_1855)
    {
        _1937 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2007 = _1937;
    float _2009 = _1841 * _1991;
    float _2011 = fma(_1837, _1995, _1825);
    float _2013 = fma(_1839, _1995, _1827);
    float _2015 = _2007;
    float _2017 = _2007;
    if (!_1855)
    {
        _1999 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2019 = _1999;
    float _2021 = fma(_1831, _2009, _1829);
    float _2023 = _2019;
    float _2025 = _2019;
    if (!_1855)
    {
        _2001 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2027 = _2001;
    out.m_91.x = _2011;
    out.m_91.y = _2013;
    out.m_91.z = _2021;
    out.m_91.w = _1997;
    bool _2029 = !_1855;
    float _2031 = _2027;
    float _2033 = _2027;
    if (!_2029)
    {
        bool _2035 = _1512 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2037 = isnan(_1512);
        bool _2039 = _2035 || _2037;
        bool _2041 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2043 = _2039 || _2041;
        if (!_2043)
        {
            float _2045 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2047 = _1512 + _2045;
            float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2051 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2049;
            float _2053 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2055 = _2053 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2057 = 1.0 / _2051;
            float _2059 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2061 = _2059 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2063 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2065 = _2063 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2069 = _2067 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2071 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2073 = _2071 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2075 = _2047 * _2057;
            float _2077 = precise::clamp(_2075, 0.0, 1.0);
            float _2079 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2081 = _2079 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2083 = fma(_2077, _2055, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2085 = fma(_2077, _2081, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2087 = fma(_2077, _2061, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2089 = fma(_2077, _2065, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2091 = fma(_2077, _2069, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2093 = fma(_2077, _2073, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2033 = _2087;
            _1949 = _2091;
            _2025 = _2083;
            _2005 = _2089;
            _1959 = _2085;
            _2017 = _2093;
            _2095 = true;
        }
        else
        {
            bool _2097 = _1512 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2099 = isnan(_1512);
            bool _2101 = _2097 || _2099;
            bool _2103 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2105 = _2101 || _2103;
            if (!_2105)
            {
                _2023 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2107 = _2023;
            _2025 = _2107;
            if (!_2105)
            {
                _2031 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2109 = _2031;
            _2033 = _2109;
            if (!_2105)
            {
                _1957 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2111 = _1957;
            _1959 = _2111;
            if (!_2105)
            {
                _2003 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2113 = _2003;
            _2005 = _2113;
            if (!_2105)
            {
                _1947 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2115 = _1947;
            _1949 = _2115;
            if (!_2105)
            {
                _2015 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2117 = _2015;
            bool _2119 = !_2105;
            _2017 = _2117;
            if (!_2119)
            {
                bool _2121 = _1512 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2123 = isnan(_1512);
                bool _2125 = _2121 || _2123;
                bool _2127 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2129 = _2125 || _2127;
                if (!_2129)
                {
                    float _2131 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2133 = _1512 + _2131;
                    float _2135 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2137 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2135;
                    float _2139 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2141 = _2139 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2143 = 1.0 / _2137;
                    float _2145 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2147 = _2145 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2149 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2151 = _2149 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2153 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2155 = _2153 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2157 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2159 = _2157 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2161 = _2133 * _2143;
                    float _2163 = precise::clamp(_2161, 0.0, 1.0);
                    float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2167 = _2165 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2169 = fma(_2163, _2141, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2171 = fma(_2163, _2167, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2173 = fma(_2163, _2147, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2175 = fma(_2163, _2151, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2177 = fma(_2163, _2155, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2179 = fma(_2163, _2159, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2033 = _2173;
                    _1949 = _2177;
                    _2025 = _2169;
                    _2005 = _2175;
                    _1959 = _2171;
                    _2017 = _2179;
                    _2095 = true;
                }
                else
                {
                    _2033 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1949 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2025 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2005 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1959 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2017 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2095 = false;
    float _2181 = _2033;
    float _2183 = _1949;
    float _2185 = _2025;
    float _2187 = _2005;
    float _2189 = _1959;
    float _2191 = _2017;
    float _2193 = fma(_1304, -0.5, 0.5);
    float _2195 = precise::clamp(_2193, 0.0, 1.0);
    float _2197 = -_2181;
    float _2199 = _2197 + _2183;
    float _2201 = -_2185;
    float _2203 = _2201 + _2187;
    float _2205 = -_2189;
    float _2207 = _2205 + _2191;
    bool _2209 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2211 = fma(_2195, _2199, _2181);
    float _2213 = fma(_2195, _2203, _2185);
    float _2215 = fma(_2195, _2207, _2189);
    float _2217 = _2211 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2219 = fma(_2213, 0.298911988735198974609375, _2217);
    float _2221 = fma(_2215, 0.114477999508380889892578125, _2219);
    out.m_93.x = 0.0;
    float _2223 = -_2221;
    float _2225 = _2213 + _2223;
    float _2227 = -_2221;
    float _2229 = _2211 + _2227;
    float _2231 = -_2221;
    float _2233 = _2215 + _2231;
    float _2235 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2237 = fma(_2225, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2221);
    float _2239 = fma(_2229, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2221);
    float _2241 = fma(_2233, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2221);
    out.m_89.w = _2235;
    out.m_95.x = _2237;
    out.m_95.y = _2239;
    out.m_95.z = _2241;
    if (!_2209)
    {
        return out;
    }
    float _2243 = -_1486;
    float _2245 = _2243 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2247 = -_1488;
    float _2249 = _2247 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2251 = -_1490;
    float _2253 = _2251 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2255 = _2245 * _2245;
    float _2257 = fma(_2249, _2249, _2255);
    float _2259 = fma(_2253, _2253, _2257);
    float _2261 = sqrt(_2259);
    float _2263 = rsqrt(_2259);
    float _2265 = -_2261;
    float _2267 = _2265 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2269 = _2267 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2271 = precise::clamp(_2269, 0.0, 1.0);
    float _2273 = _2249 * _2263;
    float _2275 = _2245 * _2263;
    float _2277 = abs(_2271);
    float _2279 = log2(_2277);
    float _2281 = _2253 * _2263;
    float _2283 = _2273 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2285 = _1304 * _2275;
    float _2287 = -_2275;
    float _2289 = -_2283;
    float _2291 = fma(_2287, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2289);
    float _2293 = fma(_1272, _2273, _2285);
    float _2295 = -_2281;
    float _2297 = fma(_2295, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2291);
    float _2299 = fma(_1306, _2281, _2293);
    float _2301 = precise::clamp(_2299, 0.0, 1.0);
    float _2303 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2305 = _2297 + _2303;
    float _2307 = _2279 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2309 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2311 = precise::clamp(_2309, 0.0, 1.0);
    float _2313 = exp2(_2307);
    float _2315 = _2313 * _2311;
    float _2317 = _2301 * _2315;
    float _2319 = _2317 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2321 = _2317 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2323 = _2317 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2319;
    out.m_93.y = _2321;
    out.m_93.z = _2323;
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2095 = false;
    bool _1362 = false;
    bool _350 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_48.w;
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
        out.m_51.x = 0.0;
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
        float _2380 = as_type<float>(_130);
        out.gl_Position.z = _2380;
    }
    if (!_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _134 = in.m_53.w;
    bool _136 = _134 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_134);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = -_134;
    float _148 = _146 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _150 = 0.0;
    float _152 = _148;
    if (_144)
    {
        float _154 = float(_114);
        _150 = _154;
    }
    float _156 = _150;
    bool _158 = _148 >= _156;
    bool _160 = !_144;
    bool _162 = _158 || _160;
    if (_162)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _164 = _124;
    if (_162)
    {
        out.m_51.x = 0.0;
    }
    if (_162)
    {
        float _166 = _164 * 5.0;
        _132 = as_type<int>(_166);
    }
    int _168 = _132;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2449 = as_type<float>(_168);
        out.gl_Position.z = _2449;
    }
    if (_162)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _170 = in.m_55.x;
    float _172 = in.m_55.y;
    float _174 = in.m_55.z;
    float _176 = in.m_57.x;
    float _178 = in.m_57.y;
    float _180 = in.m_57.z;
    float _182 = in.m_59.x;
    float _184 = in.m_59.y;
    float _186 = in.m_59.z;
    float _188 = _170 * _170;
    float _190 = _174 * _174;
    float _192 = _172 * _172;
    float _194 = fma(_176, _176, _188);
    float _196 = fma(_180, _180, _190);
    float _198 = fma(_178, _178, _192);
    float _200 = fma(_182, _182, _194);
    float _202 = fma(_186, _186, _196);
    float _204 = fma(_184, _184, _198);
    float _206 = sqrt(_200);
    float _208 = sqrt(_202);
    float _210 = sqrt(_204);
    bool _212 = _206 > 0.0;
    bool _214 = _208 > 0.0;
    float _216 = _208;
    float _218 = _206;
    float _220 = _202;
    float _222 = _170;
    if (_212)
    {
        float _224 = rsqrt(_200);
        _216 = _224;
    }
    float _226 = _216;
    if (!_212)
    {
        _218 = 0.0;
    }
    float _228 = _218;
    bool _230 = _210 > 0.0;
    float _232 = 0.0;
    float _234 = _228;
    if (!_212)
    {
        _232 = 0.0;
    }
    float _236 = _232;
    float _238 = 0.0;
    float _240 = _236;
    if (!_212)
    {
        _238 = 0.0;
    }
    float _242 = _238;
    float _244 = 0.0;
    float _246 = _242;
    if (_214)
    {
        float _248 = rsqrt(_202);
        _244 = _248;
    }
    float _250 = _244;
    float _252 = 0.0;
    if (!_214)
    {
        _252 = 0.0;
    }
    float _254 = _252;
    float _256 = _210;
    float _258 = _254;
    if (_230)
    {
        float _260 = rsqrt(_204);
        _256 = _260;
    }
    float _262 = _256;
    float _264 = _226;
    if (_212)
    {
        float _266 = _226 * _176;
        _234 = _266;
    }
    float _268 = _234;
    if (_212)
    {
        float _270 = _226 * _170;
        _240 = _270;
    }
    float _272 = _240;
    if (_212)
    {
        float _274 = _226 * _182;
        _246 = _274;
    }
    float _276 = _246;
    bool _278 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _280 = 0.0;
    float _282 = 0.0;
    if (!_230)
    {
        _280 = 0.0;
        _282 = 0.0;
    }
    float _284 = _280;
    float _286 = _282;
    float _288 = 0.0;
    float _290 = _284;
    float _292 = _286;
    if (!_230)
    {
        _288 = 0.0;
    }
    float _294 = _288;
    float _296 = _294;
    if (!_214)
    {
        _264 = 0.0;
    }
    float _298 = _264;
    float _300 = _298;
    if (_214)
    {
        float _302 = _250 * _180;
        _258 = _302;
    }
    float _304 = _258;
    if (!_214)
    {
        _220 = 0.0;
    }
    float _306 = _220;
    float _308 = _306;
    if (_214)
    {
        float _310 = _250 * _174;
        _300 = _310;
    }
    float _312 = _300;
    if (_214)
    {
        float _314 = _250 * _186;
        _308 = _314;
    }
    float _316 = _308;
    if (_230)
    {
        float _318 = _262 * _178;
        _290 = _318;
    }
    float _320 = _290;
    if (_230)
    {
        float _322 = _262 * _172;
        _292 = _322;
    }
    float _324 = _292;
    if (_230)
    {
        float _326 = _262 * _184;
        _296 = _326;
    }
    float _328 = _296;
    bool _330 = !_278;
    float _348;
    if (!_330)
    {
        float _332 = in.m_61.x;
        float _334 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _336 = _332 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _338 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[12].x, _148);
        float _340 = _338 * _334;
        float _342 = floor(_340);
        float _344 = -_342;
        float _346 = _340 + _344;
        _348 = _346;
        _350 = true;
    }
    else
    {
        float _352 = float(_114);
        float _354 = 1.0 / _352;
        float _356 = _148 * _354;
        _348 = _356;
    }
    _350 = false;
    float _358 = _348;
    float _360 = in.m_61.z;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _364 = _358 + _362;
    float _366 = in.m_48.x;
    float _368 = in.m_48.y;
    float _370 = in.m_48.z;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _378 = _376 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _380 = in.m_61.x;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _390 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _392 = log2(_390);
    float _394 = in.m_61.y;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _398 = _358 + _396;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _402 = _358 + _400;
    int _404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _406 = _404 != 0;
    int _408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _410 = _408 != 0;
    float _412 = 1.0 / _374;
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _416 = _414 != 0;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _420 = _418 != 0;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _424 = _422 != 0;
    float _426 = _360 * 2.0;
    float _428 = 1.0 / _384;
    float _430 = _178 * _368;
    float _432 = _184 * _368;
    float _434 = _392 * _148;
    float _436 = fma(_176, _366, _430);
    float _438 = fma(_182, _366, _432);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _442 = _358 + _440;
    float _444 = floor(_426);
    float _446 = _364 * _412;
    float _448 = _380 * 2.0;
    float _450 = fma(_180, _370, _436);
    float _452 = _380 + _360;
    float _454 = _394 * 2.0;
    float _456 = _394 + _360;
    float _458 = 1.0 / _378;
    float _460 = _398 * _428;
    float _462 = _380 + _394;
    float _464 = _452 + (-1.0);
    float _466 = _456 + (-1.0);
    float _468 = _462 + (-1.0);
    float _470 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _472 = 1.0 / _388;
    bool _474 = _444 > 0.0;
    float _476 = fma(_186, _370, _438);
    bool _478 = _444 >= 0.0;
    bool _480 = isnan(_444);
    bool _482 = _478 || _480;
    bool _484 = isnan(0.0);
    bool _486 = _482 || _484;
    float _488 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _490 = floor(_448);
    float _492 = _402 * _458;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _494;
    bool _498 = !_416;
    int _500 = _498 ? 0 : 1;
    float _502 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _504 = floor(_454);
    float _506 = _442 * _472;
    int _508 = _486 ? 0 : 1;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _510;
    float _514 = fma(_496, _460, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _520 = ~_508;
    int _522 = _520 + 1;
    int _524 = _522 + 1;
    float _526 = fma(_512, _460, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _528 = _524;
    if (!_474)
    {
        int _530 = ~_508;
        int _532 = _530 + 1;
        _528 = _532;
    }
    int _534 = _528;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _536;
    float _540 = exp2(_434);
    bool _542 = _490 >= 0.0;
    bool _544 = isnan(_490);
    bool _546 = _542 || _544;
    bool _548 = isnan(0.0);
    bool _550 = _546 || _548;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _556 = fma(_538, _460, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    int _562 = _550 ? 0 : 1;
    float _564 = fma(_554, _506, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _566 = _504 > 0.0;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _568;
    bool _572 = _504 >= 0.0;
    bool _574 = isnan(_504);
    bool _576 = _572 || _574;
    bool _578 = isnan(0.0);
    bool _580 = _576 || _578;
    float _582 = fma(_518, _506, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _584 = _490 > 0.0;
    float _586 = fma(_560, _506, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _588;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _592;
    bool _596 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _598 = isnan(_358);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = fma(_570, _446, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _610 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _612 = isnan(_358);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = fma(_590, _446, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _624 = fma(_594, _446, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _628 = 1.0 + _626;
    bool _630 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _632 = isnan(_358);
    bool _634 = _630 || _632;
    bool _636 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _638 = _634 || _636;
    float _640 = float(_638);
    float _642 = -_606;
    float _644 = _642 + 1.0;
    float _646 = -_620;
    float _648 = _646 + 1.0;
    bool _650 = !_420;
    int _652 = _650 ? 0 : 1;
    float _654 = -_540;
    float _656 = _654 + 1.0;
    bool _658 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _660 = isnan(0.0);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _666 = _662 || _664;
    float _668 = _606 * _648;
    bool _670 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _672 = isnan(_358);
    bool _674 = _670 || _672;
    bool _676 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _678 = _674 || _676;
    float _680 = float(_678);
    float _682 = _640 * _644;
    float _684 = 1.0 / _628;
    bool _686 = _358 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _688 = isnan(_358);
    bool _690 = _686 || _688;
    bool _692 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _694 = _690 || _692;
    float _696 = float(_694);
    float _698 = -_640;
    float _700 = _698 + 1.0;
    float _702 = in.m_63.x;
    float _704 = in.m_63.y;
    float _706 = in.m_63.z;
    float _708 = _666 ? _656 : 0.0;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _712 = _710 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _714 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _716 = isnan(1.0);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _722 = _718 || _720;
    float _724 = _680 * _700;
    int _726 = abs(_500);
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _730 = _728 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _732 = fma(_712, _492, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _734 = -_680;
    float _736 = _734 + 1.0;
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _742 = float(_534);
    float _744 = _696 * _736;
    float _746 = float(_726);
    float _748 = fma(_740, _492, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _750 = _380 + (-0.5);
    float _752 = _708;
    if (_722)
    {
        float _754 = _708 * _684;
        _152 = _754;
    }
    float _756 = _152;
    float _758 = _526 * _744;
    float _760 = -_696;
    float _762 = _760 + 1.0;
    float _764 = _746 * _742;
    float _766 = _514 * _744;
    float _768 = _556 * _744;
    int _770 = ~_562;
    int _772 = _770 + 1;
    int _774 = _772 + 1;
    float _776 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[143].y, _758);
    float _778 = _764 * (-2.0);
    int _780 = abs(_652);
    float _782 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[143].x, _766);
    int _784 = _774;
    if (!_584)
    {
        int _786 = ~_562;
        int _788 = _786 + 1;
        _784 = _788;
    }
    int _790 = _784;
    float _792 = fma(_778, _702, _702);
    float _794 = float(_780);
    float _796 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[143].z, _768);
    float _798 = float(_790);
    float _800 = fma(_488, _778, _488);
    float _802 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[196].x, _792);
    int _804 = _580 ? 0 : 1;
    float _806 = fma(_582, _724, _782);
    bool _808 = !_424;
    int _810 = _808 ? 0 : 1;
    float _812 = _794 * _798;
    float _814 = fma(_800, _756, _802);
    int _816 = ~_804;
    int _818 = _816 + 1;
    int _820 = _818 + 1;
    float _822 = _394 + (-0.5);
    int _824 = abs(_810);
    float _826 = _812 * (-2.0);
    int _828 = _820;
    if (!_566)
    {
        int _830 = ~_804;
        int _832 = _830 + 1;
        _828 = _832;
    }
    int _834 = _828;
    float _836 = _814 * 0.15915493667125701904296875;
    float _838 = float(_824);
    float _840 = fma(_826, _704, _704);
    float _842 = float(_834);
    float _844 = fma(_502, _826, _502);
    float _846 = fma(_564, _724, _776);
    float _848 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[196].y, _840);
    float _850 = fma(_608, _682, _806);
    float _852 = _838 * _842;
    float _854 = in.m_65.x;
    float _856 = in.m_65.y;
    float _858 = in.m_65.z;
    float _860 = fma(_844, _756, _848);
    float _862 = fma(_586, _724, _796);
    float _864 = _852 * (-2.0);
    float _866 = in.m_67.x;
    float _868 = in.m_67.y;
    float _870 = in.m_67.z;
    float _872 = _860 * 0.15915493667125701904296875;
    float _874 = _360 + (-0.5);
    float _876 = fma(_864, _706, _706);
    float _878 = fma(_470, _864, _470);
    float _880 = fma(_730, _492, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _882 = fma(_622, _682, _846);
    float _884 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[196].z, _876);
    float _886 = fma(_624, _682, _862);
    float _888 = fma(_732, _668, _850);
    float _890 = fma(_748, _668, _882);
    float _892 = fma(_878, _756, _884);
    float _894 = fma(_880, _668, _886);
    float _896 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[147].x, _888);
    float _898 = _836 * 6.283185482025146484375;
    float _900 = sin(_898);
    float _902 = _892 * 0.15915493667125701904296875;
    float _904 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[147].y, _890);
    float _906 = fma(_620, (*spvDescriptorSet0.vp_c9)._m0[147].z, _894);
    float _908 = in.m_69.x;
    bool _910 = _380 > 0.5;
    bool _912 = _910 && _406;
    float _914 = _896 * _854;
    float _916 = _906 * _858;
    float _918 = _872 * 6.283185482025146484375;
    float _920 = sin(_918);
    float _922 = _904 * _856;
    float _924 = _914 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _926 = in.m_57.w;
    float _928 = _916 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _866);
    float _932 = _922 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _934 = _872 * 6.283185482025146484375;
    float _936 = cos(_934);
    float _938 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _868);
    float _940 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _870);
    float _942 = in.m_69.y;
    bool _944 = _868 != 0.0;
    bool _946 = isnan(_868);
    bool _948 = _944 || _946;
    bool _950 = isnan(0.0);
    bool _952 = _948 || _950;
    float _954 = _932 * _938;
    float _956 = _172 * _368;
    float _958 = in.m_59.w;
    float _960 = _902 * 6.283185482025146484375;
    float _962 = cos(_960);
    float _964 = _924 * _930;
    float _966 = _900 * _920;
    float _968 = in.m_69.z;
    bool _970 = _866 == 0.0;
    bool _972 = !_952;
    bool _974 = _970 && _972;
    float _976 = fma(_170, _366, _956);
    bool _978 = _394 > 0.5;
    float _980 = in.m_55.w;
    float _982 = _836 * 6.283185482025146484375;
    float _984 = cos(_982);
    float _986 = _900 * _936;
    bool _988 = _870 == 0.0;
    bool _990 = _988 && _974;
    out.m_71.x = _908;
    float _992 = fma(_174, _370, _976);
    float _994 = _902 * 6.283185482025146484375;
    float _996 = sin(_994);
    float _998 = _900 * _962;
    float _1000 = _928 * _940;
    out.m_71.y = _942;
    float _1002 = _998 * _954;
    float _1004 = _476 + _958;
    float _1006 = _984 * _936;
    float _1008 = _984 * _920;
    float _1010 = _984 * _962;
    float _1012 = _936 * _962;
    float _1014 = _920 * _962;
    out.m_71.z = _968;
    float _1016 = _1010 * _954;
    float _1018 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1020 = fma(_996, _1006, _966);
    float _1022 = fma(_996, _966, _1006);
    float _1024 = -_1008;
    float _1026 = fma(_996, _986, _1024);
    float _1028 = -_954;
    float _1030 = _996 * _1028;
    float _1032 = -_986;
    float _1034 = fma(_996, _1008, _1032);
    float _1036 = fma(_1020, _964, _1016);
    float _1038 = fma(_1026, _964, _1002);
    float _1040 = fma(_1012, _964, _1030);
    float _1042 = _450 + _926;
    float _1044 = fma(_1034, _1000, _1036);
    float _1046 = fma(_1022, _1000, _1038);
    float _1048 = fma(_1014, _1000, _1040);
    float _1050 = in.m_73.y;
    float _1052 = _1044 * _320;
    float _1054 = _1044 * _328;
    float _1056 = _1044 * _324;
    float _1058 = in.m_73.x;
    float _1060 = fma(_1048, _268, _1052);
    float _1062 = fma(_1048, _276, _1054);
    float _1064 = fma(_1048, _272, _1056);
    float _1066 = _992 + _980;
    float _1068 = fma(_1046, _304, _1060);
    float _1070 = fma(_1046, _316, _1062);
    float _1072 = fma(_1046, _312, _1064);
    float _1074 = _1042 + _1068;
    float _1076 = _1004 + _1070;
    float _1078 = in.m_75.x;
    float _1080 = in.m_75.y;
    float _1082 = in.m_75.z;
    float _1084 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1086 = _1074 + _1084;
    float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1090 = _1076 + _1088;
    float _1092 = _1086 * _1086;
    float _1094 = _1090 * _1090;
    float _1096 = -_1050;
    float _1098 = _1096 + 1.0;
    float _1100 = _1092 + _1094;
    float _1102 = _1050;
    float _1104 = _1092;
    float _1106 = _1094;
    float _1108 = _1074;
    float _1110 = _1076;
    if (_406)
    {
        _752 = _1058;
    }
    float _1112 = _752;
    float _1114 = sqrt(_1100);
    float _1116 = _1112;
    if (!_406)
    {
        _222 = _1058;
    }
    float _1118 = _222;
    float _1120 = _1118;
    if (_912)
    {
        float _1122 = -_1112;
        float _1124 = _1122 + 1.0;
        _1116 = _1124;
    }
    float _1126 = _1116;
    if (_410)
    {
        float _1128 = _978 ? _1098 : _1050;
        _1102 = _1128;
    }
    float _1130 = _1102;
    if (_406)
    {
        _1120 = _1126;
    }
    float _1132 = _1120;
    float _1134 = _1080;
    float _1136 = _1078;
    float _1138 = _1082;
    if (!_990)
    {
        float _1140 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1080);
        _1134 = _1140;
    }
    float _1142 = _1134;
    if (!_990)
    {
        float _1144 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1078);
        _1136 = _1144;
    }
    float _1146 = _1136;
    if (!_990)
    {
        float _1148 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1082);
        _1138 = _1148;
    }
    float _1150 = _1138;
    float _1152 = _1066 + _1072;
    float _1154 = -_1142;
    float _1156 = _996 * _1154;
    float _1158 = _1010 * _1142;
    float _1160 = _998 * _1142;
    bool _1162 = _1114 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1164 = fma(_1012, _1146, _1156);
    float _1166 = fma(_1020, _1146, _1158);
    float _1168 = fma(_1026, _1146, _1160);
    float _1170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1172 = fma(_1014, _1150, _1164);
    float _1174 = fma(_1034, _1150, _1166);
    float _1176 = fma(_1022, _1150, _1168);
    float _1178 = _1156;
    if (!_1162)
    {
        _1178 = _1152;
    }
    float _1180 = _1178;
    bool _1182 = !_1162;
    float _1184 = _1180;
    if (!_1182)
    {
        float _1186 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1188 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1190 = _1114 + _1188;
        float _1192 = rsqrt(_1100);
        float _1194 = _1190 * _1186;
        float _1196 = _1152 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1198 = _1194 * 0.15915493667125701904296875;
        float _1200 = _1198 * 6.283185482025146484375;
        float _1202 = sin(_1200);
        float _1204 = _1198 * 6.283185482025146484375;
        float _1206 = cos(_1204);
        float _1208 = fma(_1202, _1196, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1210 = _1192 * _1208;
        float _1212 = _1206 + (-1.0);
        float _1214 = fma(_1086, _1210, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1216 = fma(_1090, _1210, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1218 = _1212 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1220 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1222 = _1214 + _1220;
        float _1224 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1226 = _1216 + _1224;
        float _1228 = fma(_1152, _1206, _1218);
        float _1230 = _1222 * _1222;
        float _1232 = _1226 * _1226;
        _1184 = _1228;
        _1104 = _1230;
        _1106 = _1232;
        _1108 = _1214;
        _1110 = _1216;
    }
    float _1234 = _1184;
    float _1236 = _1104;
    float _1238 = _1106;
    float _1240 = _1108;
    float _1242 = _1110;
    float _1244 = _1174 * _320;
    float _1246 = _1174 * _324;
    float _1248 = _1174 * _328;
    float _1250 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1252 = _1234 + _1250;
    float _1254 = _1130 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1256 = fma(_1172, _268, _1244);
    float _1258 = fma(_1172, _276, _1248);
    float _1260 = fma(_1252, _1252, _1236);
    float _1262 = in.m_69.w;
    float _1264 = fma(_1172, _272, _1246);
    float _1266 = _1254 * _1170;
    float _1268 = _1260 + _1238;
    float _1270 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1272 = fma(_1176, _304, _1256);
    float _1274 = sqrt(_1268);
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1286 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1288 = _1270 * _1018;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1292 = _1276 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1294 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1296 = _1280 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1298 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1300 = _1284 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1302 = _1286 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1304 = fma(_1176, _312, _1264);
    float _1306 = fma(_1176, _316, _1258);
    out.m_71.w = _1262;
    bool _1308 = _1274 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1310 = isnan(_1274);
    bool _1312 = _1308 || _1310;
    bool _1314 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1316 = _1312 || _1314;
    out.m_77.x = _1292;
    out.m_77.y = _1294;
    out.m_77.z = _1296;
    out.m_77.w = _1290;
    out.m_79.x = _1298;
    out.m_79.y = _1300;
    out.m_79.z = _1302;
    out.m_81.x = _1288;
    out.m_81.y = _1266;
    float _1318 = _1252;
    float _1320 = _1298;
    float _1322 = _1300;
    float _1324 = _1296;
    float _1326 = _1290;
    if (!_1316)
    {
        _1318 = 1.0;
    }
    float _1328 = _1318;
    out.m_83.x = _1272;
    out.m_83.y = _1304;
    out.m_83.z = _1306;
    bool _1330 = !_1316;
    float _1332 = _1328;
    if (!_1330)
    {
        bool _1334 = _1274 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1336 = isnan(_1274);
        bool _1338 = _1334 || _1336;
        bool _1340 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1342 = _1338 || _1340;
        if (!_1342)
        {
            float _1344 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1346 = _1274 + _1344;
            float _1348 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1350 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1348;
            float _1352 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1354 = _1352 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1356 = 1.0 / _1350;
            float _1358 = _1346 * _1356;
            float _1360 = fma(_1358, _1354, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1332 = _1360;
            _1320 = _1354;
            _1362 = true;
        }
        else
        {
            bool _1364 = _1274 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1366 = isnan(_1274);
            bool _1368 = _1364 || _1366;
            bool _1370 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1372 = _1368 || _1370;
            if (!_1372)
            {
                float _1374 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1376 = _1274 + _1374;
                float _1378 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1380 = _1378 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1382 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1384 = _1382 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1386 = 1.0 / _1380;
                float _1388 = _1376 * _1386;
                float _1390 = fma(_1388, _1384, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1332 = _1390;
                _1320 = _1384;
                _1362 = true;
            }
            else
            {
                _1332 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1362 = false;
    float _1392 = _1332;
    float _1394 = _1320;
    float _1396 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1398 = _1240 + _1396;
    float _1400 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1402 = _1234 + _1400;
    float _1404 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1406 = _1242 + _1404;
    bool _1408 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1410 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1412 = _1408 || _1410;
    bool _1414 = isnan(0.5);
    bool _1416 = _1412 || _1414;
    float _1418 = fma(_1398, _1392, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1420 = fma(_1402, _1392, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1422 = fma(_1406, _1392, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1424 = _1394;
    float _1426 = _1422;
    if (_1416)
    {
        _1424 = _1418;
    }
    float _1428 = _1424;
    float _1430 = _1428;
    if (_1416)
    {
        _1322 = _1420;
    }
    float _1432 = _1322;
    float _1434 = _1432;
    if (!_1416)
    {
        float _1436 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1438 = _1066 + _1436;
        float _1440 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1442 = _1042 + _1440;
        float _1444 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1446 = _1438 * _1438;
        float _1448 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1450 = _1004 + _1448;
        float _1452 = fma(_1442, _1442, _1446);
        float _1454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1456 = fma(_1450, _1450, _1452);
        float _1458 = sqrt(_1456);
        float _1460 = _1444 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1462 = precise::min(_1458, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1464 = _1462 * _1454;
        float _1466 = -_1042;
        float _1468 = _1466 + _1418;
        float _1470 = -_1004;
        float _1472 = _1470 + _1422;
        float _1474 = _1460 * _1464;
        float _1476 = -_1066;
        float _1478 = _1476 + _1420;
        float _1480 = fma(_1468, _1474, _1042);
        float _1482 = fma(_1478, _1474, _1066);
        float _1484 = fma(_1472, _1474, _1004);
        _1434 = _1482;
        _1430 = _1480;
        _1426 = _1484;
    }
    float _1486 = _1434;
    float _1488 = _1430;
    float _1490 = _1426;
    float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1494 = _1486 + _1492;
    float _1496 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1498 = _1488 + _1496;
    float _1500 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1502 = _1490 + _1500;
    float _1504 = _1494 * _1494;
    float _1506 = fma(_1498, _1498, _1504);
    float _1508 = fma(_1502, _1502, _1506);
    float _1510 = rsqrt(_1508);
    float _1512 = sqrt(_1508);
    float _1514 = _1510 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1516 = _1498 * _1514;
    float _1518 = _1502 * _1514;
    float _1520 = _1516 * _1516;
    float _1522 = _1518 * _1518;
    float _1524 = _1520 + _1522;
    float _1526 = sqrt(_1524);
    bool _1528 = _1526 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1530 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1532 = _1526 + _1530;
    float _1534 = _1510;
    float _1536 = _1532;
    float _1538 = _1494;
    if (_1528)
    {
        float _1540 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1534 = _1540;
    }
    float _1542 = _1534;
    if (_1528)
    {
        float _1544 = rsqrt(_1524);
        _1324 = _1544;
    }
    float _1546 = _1324;
    float _1548 = _1546;
    if (_1528)
    {
        float _1550 = _1532 * _1542;
        _1536 = _1550;
    }
    float _1552 = _1536;
    if (_1528)
    {
        float _1554 = _1552 * 0.15915493667125701904296875;
        _1326 = _1554;
    }
    float _1556 = _1326;
    float _1558 = _1542;
    float _1560 = _1556;
    if (_1528)
    {
        float _1562 = _1556 * 6.283185482025146484375;
        float _1564 = sin(_1562);
        _1558 = _1564;
    }
    float _1566 = _1558;
    float _1568 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1570 = precise::max(0.0, _1568);
    float _1572 = _1502;
    float _1574 = _1570;
    if (_1528)
    {
        float _1576 = _1556 * 6.283185482025146484375;
        float _1578 = cos(_1576);
        _1572 = _1578;
    }
    float _1580 = _1572;
    float _1582 = -_1514;
    float _1584 = -_1570;
    float _1586 = fma(_1494, _1582, _1584);
    float _1588 = _1586;
    if (_1528)
    {
        float _1590 = _1586 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1574 = _1590;
    }
    float _1592 = _1574;
    float _1594 = _1592;
    if (!_1528)
    {
        _1560 = _1522;
    }
    float _1596 = _1560;
    float _1598 = _1566;
    float _1600 = _1596;
    if (_1528)
    {
        float _1602 = fma(_1566, _1592, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1594 = _1602;
    }
    float _1604 = _1594;
    float _1606 = _1580;
    if (_1528)
    {
        float _1608 = _1580 + (-1.0);
        _1538 = _1608;
    }
    float _1610 = _1538;
    float _1612 = _1610;
    if (_1528)
    {
        float _1614 = _1546 * _1604;
        _1598 = _1614;
    }
    float _1616 = _1598;
    if (!_1528)
    {
        _1548 = _1516;
    }
    float _1618 = _1548;
    float _1620 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1622 = _1618;
    if (_1528)
    {
        float _1624 = _1610 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1612 = _1624;
    }
    float _1626 = _1612;
    float _1628 = _1626;
    if (_1528)
    {
        float _1630 = _1516 * _1616;
        _1622 = _1630;
    }
    float _1632 = _1622;
    float _1634 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1528)
    {
        float _1636 = fma(_1586, _1580, _1626);
        _1588 = _1636;
    }
    float _1638 = _1588;
    if (!_1528)
    {
        _1606 = _1518;
    }
    float _1640 = _1606;
    float _1642 = _1640;
    if (_1528)
    {
        float _1644 = _1518 * _1616;
        _1642 = _1644;
    }
    float _1646 = _1642;
    if (!_1528)
    {
        _1628 = _1520;
    }
    float _1648 = _1628;
    float _1650 = _1648;
    if (_1528)
    {
        float _1652 = _1632 * _1632;
        _1650 = _1652;
    }
    float _1654 = _1650;
    float _1656 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1634);
    if (_1528)
    {
        float _1658 = _1646 * _1646;
        _1600 = _1658;
    }
    float _1660 = _1600;
    float _1662 = fma(_1638, _1638, _1654);
    float _1664 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1656);
    float _1666 = fma(_1042, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1668 = _1662 + _1660;
    float _1670 = _1664 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1672 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1674 = fma(_1512, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1672);
    float _1676 = precise::clamp(_1674, 0.0, 1.0);
    float _1678 = fma(_1004, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1680 = rsqrt(_1668);
    float _1682 = _1670 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1684 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1686 = -_1676;
    float _1688 = _1686 + 1.0;
    float _1690 = -_1682;
    float _1692 = fma(_1690, _1620, 1.0);
    float _1694 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1696 = floor(_1666);
    float _1698 = _1486 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1700 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1694);
    float _1702 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1698);
    float _1704 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1700);
    float _1706 = _1680 * _1632;
    float _1708 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1702);
    float _1710 = _1680 * _1646;
    float _1712 = _1680 * _1638;
    float _1714 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1684);
    float _1716 = _1706 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1718 = _1708 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1720 = abs(_1688);
    float _1722 = log2(_1720);
    float _1724 = _1704 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1726 = -_1716;
    float _1728 = fma(_1712, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1726);
    float _1730 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1732 = fma(_1490, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1714);
    float _1734 = -_1696;
    float _1736 = _1666 + _1734;
    float _1738 = -_1710;
    float _1740 = fma(_1738, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1728);
    float _1742 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1730);
    float _1744 = log2(_1692);
    float _1746 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1748 = fma(_1740, -0.5, 0.5);
    float _1750 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1752 = fma(_1740, 0.5, 0.5);
    float _1754 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1746);
    float _1756 = floor(_1678);
    float _1758 = _1732 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1760 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1742);
    float _1762 = _1722 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1764 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1750);
    float _1766 = _1712 + 1.0;
    float _1768 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1760);
    float _1770 = exp2(_1762);
    float _1772 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1764);
    float _1774 = _1744 * 0.693147182464599609375;
    float _1776 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1772);
    float _1778 = _1774 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1780 = 1.0 / _1768;
    float _1782 = fma(_1752, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1784 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1754);
    float _1786 = -_1756;
    float _1788 = _1678 + _1786;
    float _1790 = fma(_1752, _1782, -0.212114393711090087890625);
    float _1792 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1784);
    float _1794 = sqrt(_1748);
    float2 _5008 = float2(_1736, _1788);
    float _1796 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5008, float2(0.0), isnan(_5008)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5008, float2(0.0), isnan(_5008)), level(0.0)).x;
    float _1798 = -_1712;
    float _1800 = fma(_1770, _1766, _1798);
    float _1802 = fma(_1752, _1790, 1.570728778839111328125);
    float _1804 = fma(_1800, 0.5, 0.5);
    float _1806 = _1792 * _1780;
    float _1808 = _1776 * _1780;
    float _1810 = fma(_1806, 0.5, 0.5);
    float _1812 = fma(_1808, -0.5, 0.5);
    float _1814 = _1794 * 0.636619746685028076171875;
    float3 _5044 = float3(_1810, _1812, _1778);
    float _1816 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5044, float3(0.0), isnan(_5044)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5044, float3(0.0), isnan(_5044)), level(0.0)).x;
    float _1818 = -_1802;
    float _1820 = fma(_1814, _1818, 1.0);
    float3 _5060 = float3(_1810, _1812, _1778);
    float4 _1823 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5060, float3(0.0), isnan(_5060)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5060, float3(0.0), isnan(_5060)), level(0.0)).xyzw;
    float _1825 = _1823.x;
    float _1827 = _1823.y;
    float _1829 = _1823.z;
    float _1831 = _1823.w;
    float2 _5076 = float2(_1820, _1804);
    float3 _1835 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5076, float2(0.0), isnan(_5076)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5076, float2(0.0), isnan(_5076)), level(0.0)).xyz;
    float _1837 = _1835.x;
    float _1839 = _1835.y;
    float _1841 = _1835.z;
    float _1843 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1845 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1847 = _1512 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1849 = isnan(_1512);
    bool _1851 = _1847 || _1849;
    bool _1853 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1855 = _1851 || _1853;
    float _1857 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1843);
    float _1859 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1845);
    float _1861 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1857);
    float _1863 = _1066 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1865 = fma(_1670, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1859);
    float _1867 = _1861 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1869 = fma(_1042, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1863);
    float _1871 = 1.0 / _1867;
    float _1873 = fma(_1004, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1869);
    float _1875 = _1873 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1877 = _1875 + _1867;
    float _1879 = _1877 * _1871;
    float _1881 = _1879 * 0.5;
    float _1883 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1885 = fma(_1881, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1883);
    float _1887 = 1.0 / _1885;
    float _1889 = _1722 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1891 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1865);
    float _1893 = in.m_85.x;
    float _1895 = exp2(_1889);
    float _1897 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1899 = _1887 * _1897;
    bool _1901 = _1899 <= 8000.0;
    bool _1903 = isnan(_1899);
    bool _1905 = _1901 || _1903;
    bool _1907 = isnan(8000.0);
    bool _1909 = _1905 || _1907;
    float _1911 = float(_1909);
    float _1913 = abs(_1899);
    float _1915 = log2(_1913);
    float _1917 = -_1895;
    float _1919 = _1917 + 1.0;
    float _1921 = _1919 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1792;
    out.gl_Position.y = _1776;
    out.gl_Position.z = _1891;
    out.gl_Position.w = _1768;
    float _1923 = _1915 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1925 = exp2(_1923);
    float _1927 = -_1921;
    float _1929 = _1927 + 1.0;
    float _1931 = _1776;
    float _1933 = _1768;
    float _1935 = _1891;
    float _1937 = _1929;
    if (!_1855)
    {
        _1931 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1939 = _1931;
    float _1941 = fma(_1925, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1943 = precise::clamp(_1941, 0.0, 1.0);
    float _1945 = _1891 + _1768;
    float _1947 = _1939;
    float _1949 = _1939;
    if (!_1855)
    {
        _1933 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1951 = _1933;
    float _1953 = fma(_1943, -2.0, 3.0);
    float _1955 = _1943 * _1943;
    float _1957 = _1951;
    float _1959 = _1951;
    if (!_1855)
    {
        _1935 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1961 = _1935;
    float _1963 = _1955 * _1953;
    float _1965 = -_1963;
    float _1967 = _1965 + 1.0;
    float _1969 = fma(_1967, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1963);
    float _1971 = _1945 * 0.5;
    float _1973 = _1911 * _1969;
    out.m_87.z = _1971;
    out.m_87.w = _1768;
    float _1975 = _1973 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1977 = -_1796;
    float _1979 = _1977 + 1.0;
    float _1981 = _1979 * _1975;
    float _1983 = precise::clamp(_1981, 0.0, 1.0);
    float _1985 = -_1983;
    float _1987 = fma(_1985, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1989 = _1987 * _1893;
    float _1991 = _1921 * _1816;
    float _1993 = _1989 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1995 = _1831 * _1991;
    float _1997 = _1831 * _1929;
    out.m_89.x = _1993;
    float _1999 = _1827;
    float _2001 = _1825;
    float _2003 = _1961;
    float _2005 = _1961;
    if (!_1855)
    {
        _1937 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2007 = _1937;
    float _2009 = _1841 * _1991;
    float _2011 = fma(_1837, _1995, _1825);
    float _2013 = fma(_1839, _1995, _1827);
    float _2015 = _2007;
    float _2017 = _2007;
    if (!_1855)
    {
        _1999 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2019 = _1999;
    float _2021 = fma(_1831, _2009, _1829);
    float _2023 = _2019;
    float _2025 = _2019;
    if (!_1855)
    {
        _2001 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2027 = _2001;
    out.m_91.x = _2011;
    out.m_91.y = _2013;
    out.m_91.z = _2021;
    out.m_91.w = _1997;
    bool _2029 = !_1855;
    float _2031 = _2027;
    float _2033 = _2027;
    if (!_2029)
    {
        bool _2035 = _1512 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2037 = isnan(_1512);
        bool _2039 = _2035 || _2037;
        bool _2041 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2043 = _2039 || _2041;
        if (!_2043)
        {
            float _2045 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2047 = _1512 + _2045;
            float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2051 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2049;
            float _2053 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2055 = _2053 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2057 = 1.0 / _2051;
            float _2059 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2061 = _2059 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2063 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2065 = _2063 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2069 = _2067 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2071 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2073 = _2071 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2075 = _2047 * _2057;
            float _2077 = precise::clamp(_2075, 0.0, 1.0);
            float _2079 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2081 = _2079 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2083 = fma(_2077, _2055, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2085 = fma(_2077, _2081, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2087 = fma(_2077, _2061, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2089 = fma(_2077, _2065, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2091 = fma(_2077, _2069, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2093 = fma(_2077, _2073, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2033 = _2087;
            _1949 = _2091;
            _2025 = _2083;
            _2005 = _2089;
            _1959 = _2085;
            _2017 = _2093;
            _2095 = true;
        }
        else
        {
            bool _2097 = _1512 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2099 = isnan(_1512);
            bool _2101 = _2097 || _2099;
            bool _2103 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2105 = _2101 || _2103;
            if (!_2105)
            {
                _2023 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2107 = _2023;
            _2025 = _2107;
            if (!_2105)
            {
                _2031 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2109 = _2031;
            _2033 = _2109;
            if (!_2105)
            {
                _1957 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2111 = _1957;
            _1959 = _2111;
            if (!_2105)
            {
                _2003 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2113 = _2003;
            _2005 = _2113;
            if (!_2105)
            {
                _1947 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2115 = _1947;
            _1949 = _2115;
            if (!_2105)
            {
                _2015 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2117 = _2015;
            bool _2119 = !_2105;
            _2017 = _2117;
            if (!_2119)
            {
                bool _2121 = _1512 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2123 = isnan(_1512);
                bool _2125 = _2121 || _2123;
                bool _2127 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2129 = _2125 || _2127;
                if (!_2129)
                {
                    float _2131 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2133 = _1512 + _2131;
                    float _2135 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2137 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2135;
                    float _2139 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2141 = _2139 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2143 = 1.0 / _2137;
                    float _2145 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2147 = _2145 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2149 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2151 = _2149 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2153 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2155 = _2153 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2157 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2159 = _2157 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2161 = _2133 * _2143;
                    float _2163 = precise::clamp(_2161, 0.0, 1.0);
                    float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2167 = _2165 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2169 = fma(_2163, _2141, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2171 = fma(_2163, _2167, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2173 = fma(_2163, _2147, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2175 = fma(_2163, _2151, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2177 = fma(_2163, _2155, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2179 = fma(_2163, _2159, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2033 = _2173;
                    _1949 = _2177;
                    _2025 = _2169;
                    _2005 = _2175;
                    _1959 = _2171;
                    _2017 = _2179;
                    _2095 = true;
                }
                else
                {
                    _2033 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1949 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2025 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2005 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1959 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2017 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2095 = false;
    float _2181 = _2033;
    float _2183 = _1949;
    float _2185 = _2025;
    float _2187 = _2005;
    float _2189 = _1959;
    float _2191 = _2017;
    float _2193 = fma(_1304, -0.5, 0.5);
    float _2195 = precise::clamp(_2193, 0.0, 1.0);
    float _2197 = -_2181;
    float _2199 = _2197 + _2183;
    float _2201 = -_2185;
    float _2203 = _2201 + _2187;
    float _2205 = -_2189;
    float _2207 = _2205 + _2191;
    bool _2209 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2211 = fma(_2195, _2199, _2181);
    float _2213 = fma(_2195, _2203, _2185);
    float _2215 = fma(_2195, _2207, _2189);
    float _2217 = _2211 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2219 = fma(_2213, 0.298911988735198974609375, _2217);
    float _2221 = fma(_2215, 0.114477999508380889892578125, _2219);
    out.m_93.x = 0.0;
    float _2223 = -_2221;
    float _2225 = _2213 + _2223;
    float _2227 = -_2221;
    float _2229 = _2211 + _2227;
    float _2231 = -_2221;
    float _2233 = _2215 + _2231;
    float _2235 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2237 = fma(_2225, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2221);
    float _2239 = fma(_2229, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2221);
    float _2241 = fma(_2233, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2221);
    out.m_89.w = _2235;
    out.m_95.x = _2237;
    out.m_95.y = _2239;
    out.m_95.z = _2241;
    if (!_2209)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2243 = -_1486;
    float _2245 = _2243 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2247 = -_1488;
    float _2249 = _2247 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2251 = -_1490;
    float _2253 = _2251 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2255 = _2245 * _2245;
    float _2257 = fma(_2249, _2249, _2255);
    float _2259 = fma(_2253, _2253, _2257);
    float _2261 = sqrt(_2259);
    float _2263 = rsqrt(_2259);
    float _2265 = -_2261;
    float _2267 = _2265 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2269 = _2267 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2271 = precise::clamp(_2269, 0.0, 1.0);
    float _2273 = _2249 * _2263;
    float _2275 = _2245 * _2263;
    float _2277 = abs(_2271);
    float _2279 = log2(_2277);
    float _2281 = _2253 * _2263;
    float _2283 = _2273 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2285 = _1304 * _2275;
    float _2287 = -_2275;
    float _2289 = -_2283;
    float _2291 = fma(_2287, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2289);
    float _2293 = fma(_1272, _2273, _2285);
    float _2295 = -_2281;
    float _2297 = fma(_2295, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2291);
    float _2299 = fma(_1306, _2281, _2293);
    float _2301 = precise::clamp(_2299, 0.0, 1.0);
    float _2303 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2305 = _2297 + _2303;
    float _2307 = _2279 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2309 = _2305 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2311 = precise::clamp(_2309, 0.0, 1.0);
    float _2313 = exp2(_2307);
    float _2315 = _2313 * _2311;
    float _2317 = _2301 * _2315;
    float _2319 = _2317 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2321 = _2317 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2323 = _2317 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _2319;
    out.m_93.y = _2321;
    out.m_93.z = _2323;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

