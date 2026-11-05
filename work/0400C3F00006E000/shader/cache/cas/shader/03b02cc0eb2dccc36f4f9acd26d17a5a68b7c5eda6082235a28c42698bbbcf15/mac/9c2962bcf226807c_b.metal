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
    float4 m_61 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_89 [[user(locn3)]];
    float4 m_75 [[user(locn4)]];
    float4 m_77 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_81 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 m_85 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_51 [[attribute(2)]];
    float4 m_55 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_73 [[attribute(7)]];
    float4 m_69 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
    float4 m_65 [[attribute(11)]];
    float4 m_71 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2825 = false;
    bool _1160 = false;
    bool _1040 = false;
    bool _866 = false;
    bool _746 = false;
    bool _476 = false;
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
    float _116 = as_type<float>(_108);
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _114;
    if (!_112)
    {
        out.m_47.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3111 = as_type<float>(_124);
        out.gl_Position.z = _3111;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_49.w;
    float _130 = float(_108);
    float _132 = -_128;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_128);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    bool _146 = _134 >= _130;
    bool _148 = !_144;
    bool _150 = _146 || _148;
    float _152 = _134;
    if (_150)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _116;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _126 = as_type<int>(_156);
    }
    int _158 = _126;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3175 = as_type<float>(_158);
        out.gl_Position.z = _3175;
    }
    if (_150)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _160 = in.m_51.x;
    float _162 = in.m_51.y;
    float _164 = in.m_51.z;
    float _166 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _168 = in.m_53.x;
    float _170 = in.m_53.y;
    float _172 = in.m_53.z;
    bool _174 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _176 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _178 = _174 || _176;
    bool _180 = isnan(1.0);
    bool _182 = _178 || _180;
    float _184 = in.m_55.x;
    float _186 = in.m_55.y;
    float _188 = in.m_55.z;
    float _190 = in.m_49.x;
    float _192 = in.m_49.y;
    float _194 = in.m_49.z;
    float _196 = _160 * _160;
    float _198 = _162 * _162;
    float _200 = _164 * _164;
    float _202 = fma(_168, _168, _196);
    float _204 = fma(_170, _170, _198);
    float _206 = fma(_172, _172, _200);
    float _208 = fma(_184, _184, _202);
    float _210 = fma(_186, _186, _204);
    float _212 = fma(_188, _188, _206);
    float _214 = sqrt(_208);
    float _216 = sqrt(_210);
    bool _218 = _214 > 0.0;
    float _220 = sqrt(_212);
    float _222 = _214;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _226 = _212;
    float _228 = _164;
    float _230 = _162;
    if (!_182)
    {
        float _232 = _166 * _166;
        float _234 = _232 * 0.5;
        _222 = _234;
    }
    float _236 = _222;
    float _238 = _236;
    if (!_182)
    {
        float _240 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _238 = _240;
    }
    float _242 = _238;
    bool _244 = _216 > 0.0;
    float _246 = 0.0;
    float _248 = _242;
    if (_218)
    {
        float _250 = rsqrt(_208);
        _246 = _250;
    }
    float _252 = _246;
    bool _254 = _220 > 0.0;
    float _256 = _220;
    if (!_182)
    {
        _256 = _166;
    }
    float _258 = _256;
    float _260 = 0.0;
    float _262 = _258;
    if (_244)
    {
        float _264 = rsqrt(_210);
        _260 = _264;
    }
    float _266 = _260;
    bool _268 = !_182;
    float _270 = _252;
    if (!_268)
    {
        float _272 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _274 = log2(_272);
        float _276 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _278 = _276 + 1.0;
        float _280 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _282 = _166 * _274;
        float _284 = 1.0 / _278;
        float _286 = _280 * 0.693147182464599609375;
        float _288 = exp2(_282);
        float _290 = 1.0 / _286;
        float _292 = _288 + (-1.0);
        float _294 = -_292;
        float _296 = fma(_294, _290, _166);
        float _298 = _296 * _284;
        float _300 = _298 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _248 = _300;
    }
    float _302 = _248;
    bool _304 = !_182;
    if (!_304)
    {
        float _306 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _308 = log2(_306);
        float _310 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _312 = _310 + 1.0;
        float _314 = 1.0 / _312;
        float _316 = _166 * _308;
        float _318 = exp2(_316);
        float _320 = -_318;
        float _322 = _320 + 1.0;
        float _324 = _322 * _314;
        _262 = _324;
        _224 = _312;
    }
    float _326 = _262;
    float _328 = _224;
    float _330 = in.m_57.w;
    float _332 = 0.0;
    float _334 = _328;
    if (!_218)
    {
        _332 = 0.0;
    }
    float _336 = _332;
    float _338 = 0.0;
    float _340 = _336;
    if (_254)
    {
        float _342 = rsqrt(_212);
        _338 = _342;
    }
    float _344 = _338;
    float _346 = 0.0;
    if (!_218)
    {
        _346 = 0.0;
    }
    float _348 = _346;
    float _350 = in.m_44.x;
    float _352 = in.m_44.y;
    float _354 = in.m_44.z;
    float _356 = 0.0;
    float _358 = _348;
    if (!_218)
    {
        _356 = 0.0;
    }
    float _360 = _356;
    float _362 = _360;
    if (_218)
    {
        float _364 = _252 * _168;
        _340 = _364;
    }
    float _366 = _340;
    if (_218)
    {
        float _368 = _252 * _160;
        _358 = _368;
    }
    float _370 = _358;
    if (_218)
    {
        float _372 = _252 * _184;
        _362 = _372;
    }
    float _374 = _362;
    bool _376 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _378 = 1.0 / _130;
    float _380 = _302 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _382 = 0.0;
    float _384 = 0.0;
    if (!_244)
    {
        _382 = 0.0;
        _384 = 0.0;
    }
    float _386 = _382;
    float _388 = _384;
    float _390 = _388;
    float _392 = _386;
    if (!_254)
    {
        _334 = 0.0;
    }
    float _394 = _334;
    float _396 = _394;
    if (_244)
    {
        float _398 = _266 * _162;
        _390 = _398;
    }
    float _400 = _390;
    float _402 = fma(_326, _192, _380);
    if (!_254)
    {
        _270 = 0.0;
    }
    float _404 = _270;
    float _406 = _404;
    if (_244)
    {
        float _408 = _266 * _186;
        _392 = _408;
    }
    float _410 = _392;
    if (!_254)
    {
        _226 = 0.0;
    }
    float _412 = _226;
    float _414 = _302 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _416 = 0.0;
    float _418 = _412;
    if (!_244)
    {
        _416 = 0.0;
    }
    float _420 = _416;
    float _422 = _420;
    if (_254)
    {
        float _424 = _344 * _172;
        _396 = _424;
    }
    float _426 = _396;
    if (_254)
    {
        float _428 = _344 * _164;
        _406 = _428;
    }
    float _430 = _406;
    float _432 = fma(_326, _190, _414);
    float _434 = _302 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (_254)
    {
        float _436 = _344 * _188;
        _418 = _436;
    }
    float _438 = _418;
    if (_244)
    {
        float _440 = _266 * _170;
        _422 = _440;
    }
    float _442 = _422;
    float _444 = _134 * _378;
    float _446 = fma(_326, _194, _434);
    float _448 = fma(_432, _330, _350);
    float _450 = fma(_402, _330, _352);
    float _452 = fma(_446, _330, _354);
    bool _454 = !_376;
    float _456 = _448;
    float _474;
    if (!_454)
    {
        float _458 = in.m_59.x;
        float _460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _462 = _458 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _464 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _466 = _464 * _460;
        float _468 = floor(_466);
        float _470 = -_468;
        float _472 = _466 + _470;
        _474 = _472;
        _476 = true;
    }
    else
    {
        _474 = _444;
    }
    _476 = false;
    float _478 = _474;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _482 = _478 + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _486 = _478 + _484;
    bool _488 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _490 = isnan(_478);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _496 = _492 || _494;
    float _498 = float(_496);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _500;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _516 = 1.0 / _502;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _520 = _478 + _518;
    bool _522 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _524 = isnan(_478);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = 1.0 / _506;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _538 = _478 + _536;
    bool _540 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _542 = isnan(_478);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = 1.0 / _514;
    float _554 = _482 * _516;
    bool _556 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _558 = isnan(_478);
    bool _560 = _556 || _558;
    bool _562 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _564 = _560 || _562;
    float _566 = float(_564);
    bool _568 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _570 = 1.0 / _510;
    float _572 = _486 * _534;
    float _574 = -_498;
    float _576 = _574 + 1.0;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _578;
    float _582 = fma(_580, _554, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _584 = _538 * _552;
    bool _586 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _588 = isnan(_478);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = -_566;
    float _600 = _598 + 1.0;
    float _602 = _566 * _576;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _612 = -_596;
    float _614 = _612 + 1.0;
    float _616 = _520 * _570;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _618;
    float _622 = _532 * _600;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _624;
    float _628 = -_532;
    float _630 = _628 + 1.0;
    float _632 = _498 * _614;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _638 = fma(_620, _554, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _640 = fma(_626, _554, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _642 = _550 * _630;
    float _644 = fma(_606, _572, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _646 = fma(_636, _572, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _648 = fma(_610, _572, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _650 = _638 * _642;
    float _652 = _640 * _642;
    float _654 = -_550;
    float _656 = _654 + 1.0;
    float _658 = _582 * _642;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _660;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _664;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _668;
    float _672 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[143].x, _650);
    float _674 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[143].y, _652);
    float _676 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[143].z, _658);
    float _678 = fma(_662, _616, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _680 = fma(_666, _616, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _682 = fma(_670, _616, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _684 = fma(_644, _622, _672);
    float _686 = fma(_648, _622, _676);
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _690 = _688 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _696 = fma(_646, _622, _674);
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _702 = fma(_678, _602, _684);
    float _704 = fma(_690, _584, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _706 = fma(_694, _584, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _708 = fma(_700, _584, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _710 = fma(_680, _602, _696);
    float _712 = fma(_682, _602, _686);
    float _714 = fma(_704, _632, _702);
    float _716 = fma(_706, _632, _710);
    float _718 = fma(_708, _632, _712);
    float _720 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[147].x, _714);
    float _722 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[147].y, _716);
    float _724 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[147].z, _718);
    bool _726 = !_568;
    float _744;
    if (!_726)
    {
        float _728 = in.m_59.x;
        float _730 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _732 = _728 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _734 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[11].x, _134);
        float _736 = _734 * _730;
        float _738 = floor(_736);
        float _740 = -_738;
        float _742 = _736 + _740;
        _744 = _742;
        _746 = true;
    }
    else
    {
        _744 = _444;
    }
    _746 = false;
    float _748 = _744;
    float _750 = in.m_57.x;
    float _752 = in.m_57.y;
    float _754 = in.m_57.z;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _758 = _748 + _756;
    bool _760 = _748 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _762 = isnan(_748);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _768 = _764 || _766;
    float _770 = float(_768);
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _772;
    bool _776 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _778 = -_770;
    float _780 = _778 + 1.0;
    float _782 = 1.0 / _774;
    float _784 = _724 * _754;
    float _786 = _722 * _752;
    float _788 = _720 * _750;
    float _790 = _758 * _782;
    bool _792 = _748 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _794 = isnan(_748);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _804;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _808;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _814 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _812;
    float _816 = _802 * _780;
    float _818 = fma(_806, _790, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _820 = fma(_814, _790, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _822 = fma(_810, _790, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _824 = -_802;
    float _826 = _824 + 1.0;
    float _828 = _818 * _816;
    float _830 = _820 * _816;
    float _832 = _822 * _816;
    float _834 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[107].x, _828);
    float _836 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[107].y, _830);
    float _838 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[107].z, _832);
    float _840 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[108].x, _834);
    float _842 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[108].y, _836);
    float _844 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[108].z, _838);
    bool _846 = !_776;
    float _864;
    if (!_846)
    {
        float _848 = in.m_59.x;
        float _850 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _852 = _848 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _854 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _856 = _854 * _850;
        float _858 = floor(_856);
        float _860 = -_858;
        float _862 = _856 + _860;
        _864 = _862;
        _866 = true;
    }
    else
    {
        _864 = _444;
    }
    _866 = false;
    float _868 = _864;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _872 = _868 + _870;
    float _874 = _840 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _878 = _876 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _884 = _868 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _886 = isnan(_868);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _898 = _896 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _900 = _868 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _902 = isnan(_868);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    float _912 = 1.0 / _878;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _914;
    float _918 = -_894;
    float _920 = _918 + 1.0;
    bool _922 = _868 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _924 = isnan(_868);
    bool _926 = _922 || _924;
    bool _928 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _930 = _926 || _928;
    float _932 = float(_930);
    float _934 = _842 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _936 = _844 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _938 = _874 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _940 = 1.0 / _882;
    float _942 = _934 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _944 = _936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _946 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _948 = 1.0 / _898;
    float _950 = _916 * _912;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _954 = _952 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _956 = _910 * _920;
    float _958 = -_910;
    float _960 = _958 + 1.0;
    float _962 = fma(_950, _872, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _964 = _868 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _966 = isnan(_868);
    bool _968 = _964 || _966;
    bool _970 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _972 = _968 || _970;
    float _974 = float(_972);
    float _976 = _932 * _960;
    float _978 = _954 * _940;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _980;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _986 = _868 + _984;
    float _988 = _962 * _976;
    float _990 = -_932;
    float _992 = _990 + 1.0;
    float _994 = -_974;
    float _996 = _994 + 1.0;
    float _998 = fma(_978, _986, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1000 = _982 * _948;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1004 = _868 + _1002;
    float _1006 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[115].x, _988);
    float _1008 = _894 * _996;
    float _1010 = fma(_1000, _1004, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1012 = fma(_998, _956, _1006);
    float _1014 = fma(_1010, _1008, _1012);
    float _1016 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1014);
    float _1018 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _938;
    out.m_61.y = _942;
    out.m_61.z = _944;
    out.m_61.w = _1018;
    bool _1020 = !_946;
    float _1038;
    if (!_1020)
    {
        float _1022 = in.m_59.x;
        float _1024 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1026 = _1022 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1028 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[11].z, _134);
        float _1030 = _1028 * _1024;
        float _1032 = floor(_1030);
        float _1034 = -_1032;
        float _1036 = _1030 + _1034;
        _1038 = _1036;
        _1040 = true;
    }
    else
    {
        _1038 = _444;
    }
    _1040 = false;
    float _1042 = _1038;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1046 = _1042 + _1044;
    bool _1048 = _1042 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1050 = isnan(_1042);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1056 = _1052 || _1054;
    float _1058 = float(_1056);
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1060;
    bool _1064 = _1042 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1066 = isnan(_1042);
    bool _1068 = _1064 || _1066;
    bool _1070 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1072 = _1068 || _1070;
    float _1074 = float(_1072);
    float _1076 = -_1058;
    float _1078 = _1076 + 1.0;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1082 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1080;
    float _1084 = 1.0 / _1062;
    bool _1086 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1088 = _1074 * _1078;
    float _1090 = -_1074;
    float _1092 = _1090 + 1.0;
    float _1094 = _1046 * _1084;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1096;
    float _1100 = fma(_1082, _1094, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1102;
    float _1106 = fma(_1098, _1094, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1108 = _1100 * _1088;
    float _1110 = fma(_1104, _1094, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1112 = _1106 * _1088;
    float _1114 = _1110 * _1088;
    float _1116 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1108);
    float _1118 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1114);
    float _1120 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1112);
    float _1122 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1116);
    float _1124 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1118);
    float _1126 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1120);
    float _1128 = _1122 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1130 = _1124 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1132 = _1126 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1134 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1136 = _1130 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1138 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.x = _1134;
    out.m_63.y = _1136;
    out.m_63.z = _1138;
    bool _1140 = !_1086;
    float _1158;
    if (!_1140)
    {
        float _1142 = in.m_59.x;
        float _1144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1146 = _1142 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1148 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[14].x, _134);
        float _1150 = _1148 * _1144;
        float _1152 = floor(_1150);
        float _1154 = -_1152;
        float _1156 = _1150 + _1154;
        _1158 = _1156;
        _1160 = true;
    }
    else
    {
        _1158 = _444;
    }
    _1160 = false;
    float _1162 = _1158;
    float _1164 = in.m_59.x;
    float _1166 = in.m_59.y;
    float _1168 = in.m_59.z;
    float _1170 = in.m_59.w;
    float _1172 = _784 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1176 = _1174 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1180 = _1178 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1182 = 1.0 / _1176;
    int _1184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1186 = _1184 != 0;
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1190 = _1188 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1192 = 1.0 / _1180;
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1196 = _1194 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1200;
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1206 = _1204 != 0;
    int _1208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1210 = _1208 != 0;
    int _1212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1214 = _1212 != 0;
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1218 = _1216 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1220 = _1164 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1222 = 1.0 / _1190;
    float _1224 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1226 = _1224 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1228 = -_1198;
    float _1230 = fma(_1220, 2.0, _1228);
    float _1232 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1234 = _1202 * _1182;
    float _1236 = 1.0 / _1218;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1240;
    float _1244 = fma(_1232, -2.0, _1238);
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1246;
    float _1250 = 1.0 / _1196;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1254 = _1252 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1256 = _1168 * 2.0;
    float _1258 = _1226 * _1222;
    float _1260 = _1164 * 2.0;
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1264 = _1262 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1268 = _1266 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _1270 = _1162 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1272 = isnan(_1162);
    bool _1274 = _1270 || _1272;
    bool _1276 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1278 = _1274 || _1276;
    float _1280 = float(_1278);
    float _1282 = 1.0 / _1254;
    float _1284 = _1242 * _1236;
    float _1286 = -_1280;
    float _1288 = _1286 + 1.0;
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1290;
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1296 = _1294 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1298 = floor(_1256);
    float _1300 = _1166 + _1168;
    float _1302 = _1292 * _1250;
    float _1304 = _1166 * 2.0;
    float _1306 = _1296 * _1192;
    float _1308 = _1300 + (-1.0);
    float _1310 = floor(_1260);
    float _1312 = _1248 * _1282;
    float _1314 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1316 = _1166 + _1164;
    float _1318 = _1316 + (-1.0);
    float _1320 = floor(_1304);
    bool _1322 = _1298 > 0.0;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1326 = _1298 >= 0.0;
    bool _1328 = isnan(_1298);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan(0.0);
    bool _1334 = _1330 || _1332;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1338 = _1316;
    float _1340 = _1260;
    if (!_1186)
    {
        _1338 = _1166;
    }
    float _1342 = _1338;
    float _1344 = 1.0 / _1264;
    bool _1346 = _1310 >= 0.0;
    bool _1348 = isnan(_1310);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan(0.0);
    bool _1354 = _1350 || _1352;
    float _1356 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1360 = _1162 + _1358;
    int _1362 = _1334 ? 0 : 1;
    float _1364 = _1342;
    if (!_1186)
    {
        _1340 = _1168;
    }
    float _1366 = _1340;
    float _1368 = fma(_1302, _1360, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _1370 = _1320 > 0.0;
    float _1372 = _1168 + _1164;
    float _1374 = _1366;
    if (_1186)
    {
        _1364 = _1164;
    }
    float _1376 = _1364;
    if (_1186)
    {
        _1374 = _1166;
    }
    float _1378 = _1374;
    float _1380 = _1372 + (-1.0);
    bool _1382 = _1162 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1384 = isnan(_1162);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1390 = _1386 || _1388;
    float _1392 = float(_1390);
    float _1394 = _1268 * _1344;
    float _1396 = fma(_1380, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1398 = _1354 ? 0 : 1;
    float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1402 = _1162 + _1400;
    float _1404 = _1380;
    if (!_1186)
    {
        _1404 = _1168;
    }
    float _1406 = _1404;
    float _1408 = _1392 * _1288;
    bool _1410 = _1320 >= 0.0;
    bool _1412 = isnan(_1320);
    bool _1414 = _1410 || _1412;
    bool _1416 = isnan(0.0);
    bool _1418 = _1414 || _1416;
    float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1422 = _1162 + _1420;
    float _1424 = _1406;
    if (_1186)
    {
        _1424 = _1166;
    }
    float _1426 = _1424;
    float _1428 = fma(_1306, _1402, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _1430 = _1310 > 0.0;
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1434 = _1162 + _1432;
    float _1436 = fma(_1258, _1422, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1438 = _1162 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1440 = isnan(_1162);
    bool _1442 = _1438 || _1440;
    bool _1444 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1446 = _1442 || _1444;
    float _1448 = float(_1446);
    float _1450 = -_1392;
    float _1452 = _1450 + 1.0;
    float _1454 = fma(_1234, _1434, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1456 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1458 = _1162 + _1456;
    float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1462 = _1162 + _1460;
    bool _1464 = _1162 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1466 = isnan(_1162);
    bool _1468 = _1464 || _1466;
    bool _1470 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1472 = _1468 || _1470;
    float _1474 = float(_1472);
    float _1476 = _1448 * _1452;
    float _1478 = -_1448;
    float _1480 = _1478 + 1.0;
    float _1482 = fma(_1284, _1458, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1484 = fma(_1394, _1462, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _1486 = _1162 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1488 = isnan(_1162);
    bool _1490 = _1486 || _1488;
    bool _1492 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1494 = _1490 || _1492;
    float _1496 = float(_1494);
    float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1500 = _1162 + _1498;
    float _1502 = -_1474;
    float _1504 = _1502 + 1.0;
    float _1506 = _1474 * _1480;
    bool _1508 = _1162 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1510 = isnan(_1162);
    bool _1512 = _1508 || _1510;
    bool _1514 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1516 = _1512 || _1514;
    float _1518 = float(_1516);
    float _1520 = fma(_1312, _1500, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1522 = _1496 * _1504;
    float _1524 = -_1496;
    float _1526 = _1524 + 1.0;
    bool _1528 = _1162 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1530 = isnan(_1162);
    bool _1532 = _1528 || _1530;
    bool _1534 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1536 = _1532 || _1534;
    float _1538 = float(_1536);
    bool _1540 = _1162 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1542 = isnan(_1162);
    bool _1544 = _1540 || _1542;
    bool _1546 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1548 = _1544 || _1546;
    float _1550 = float(_1548);
    float _1552 = _1518 * _1526;
    float _1554 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1556 = log2(_1554);
    float _1558 = -_1518;
    float _1560 = _1558 + 1.0;
    int _1562 = ~_1362;
    int _1564 = _1562 + 1;
    int _1566 = _1564 + 1;
    int _1568 = _1566;
    if (!_1322)
    {
        int _1570 = ~_1362;
        int _1572 = _1570 + 1;
        _1568 = _1572;
    }
    int _1574 = _1568;
    float _1576 = _1550 * _1560;
    float _1578 = -_1550;
    float _1580 = _1578 + 1.0;
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1584 = ~_1398;
    int _1586 = _1584 + 1;
    int _1588 = _1586 + 1;
    float _1590 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1592 = _1588;
    if (!_1430)
    {
        int _1594 = ~_1398;
        int _1596 = _1594 + 1;
        _1592 = _1596;
    }
    int _1598 = _1592;
    float _1600 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1582);
    float _1602 = _1538 * _1580;
    float _1604 = _1376 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1606 = -_1538;
    float _1608 = _1606 + 1.0;
    float _1610 = _1556 * _134;
    float _1612 = _1454 * _1602;
    float _1614 = -_1324;
    float _1616 = fma(_1604, 2.0, _1614);
    int _1618 = _1418 ? 0 : 1;
    float _1620 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1622 = fma(_1608, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1612);
    float _1624 = exp2(_1610);
    float _1626 = _1378 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1628 = ~_1618;
    int _1630 = _1628 + 1;
    int _1632 = _1630 + 1;
    float _1634 = fma(_1164, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1620);
    float _1636 = fma(_1426, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1590);
    int _1638 = _1632;
    if (!_1370)
    {
        int _1640 = ~_1618;
        int _1642 = _1640 + 1;
        _1638 = _1642;
    }
    int _1644 = _1638;
    float _1646 = in.m_65.x;
    float _1648 = in.m_65.y;
    bool _1650 = !_1210;
    int _1652 = _1650 ? 0 : 1;
    float _1654 = fma(_1436, _1576, _1622);
    float _1656 = in.m_67.x;
    float _1658 = in.m_67.y;
    float _1660 = in.m_67.z;
    int _1662 = abs(_1652);
    float _1664 = fma(_1626, -2.0, _1336);
    float _1666 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1244);
    float _1668 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1670 = 1.0 + _1668;
    float _1672 = -_1624;
    float _1674 = _1672 + 1.0;
    bool _1676 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1678 = isnan(0.0);
    bool _1680 = _1676 || _1678;
    bool _1682 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1684 = _1680 || _1682;
    float _1686 = fma(_1368, _1552, _1654);
    float _1688 = float(_1662);
    float _1690 = 1.0 / _1670;
    float _1692 = float(_1598);
    float _1694 = -_134;
    float _1696 = fma(_1694, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1230);
    float _1698 = _1684 ? _1674 : 0.0;
    float _1700 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1664);
    float _1702 = _1688 * _1692;
    bool _1704 = !_1206;
    int _1706 = _1704 ? 0 : 1;
    float _1708 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1636);
    bool _1710 = !_1214;
    int _1712 = _1710 ? 0 : 1;
    float _1714 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1716 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1718 = isnan(1.0);
    bool _1720 = _1716 || _1718;
    bool _1722 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1724 = _1720 || _1722;
    float _1726 = fma(_444, 0.300000011920928955078125, _1646);
    int _1728 = abs(_1706);
    float _1730 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1714);
    int _1732 = abs(_1712);
    float _1734 = _1702 * (-2.0);
    float _1736 = float(_1728);
    float _1738 = _1166 + (-0.5);
    float _1740 = float(_1574);
    float _1742 = fma(_1734, _1658, _1658);
    float _1744 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1600);
    float _1746 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1634);
    float _1748 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1730);
    float _1750 = -_134;
    float _1752 = fma(_1750, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1616);
    float _1754 = _1726 + _1164;
    float _1756 = float(_1732);
    float _1758 = fma(_1314, _1734, _1314);
    float _1760 = float(_1644);
    float _1762 = fma(_1738, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1742);
    float _1764 = _1736 * _1740;
    if (_1724)
    {
        float _1766 = _1698 * _1690;
        _152 = _1766;
    }
    float _1768 = _152;
    float _1770 = _1754 * 18.84955596923828125;
    float _1772 = _1756 * _1760;
    float _1774 = fma(_1428, _1522, _1686);
    float _1776 = fma(_1758, _1768, _1762);
    float _1778 = _1764 * (-2.0);
    float _1780 = in.m_69.x;
    float _1782 = in.m_69.y;
    float _1784 = in.m_69.z;
    float _1786 = _1770 * 0.15915493667125701904296875;
    float _1788 = _1164 + (-0.5);
    float _1790 = fma(_1778, _1656, _1656);
    float _1792 = in.m_71.x;
    float _1794 = in.m_71.y;
    float _1796 = in.m_71.z;
    float _1798 = _1772 * (-2.0);
    float _1800 = fma(_1356, _1778, _1356);
    float _1802 = fma(_1788, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1790);
    float _1804 = _1168 + (-0.5);
    float _1806 = fma(_1798, _1660, _1660);
    float _1808 = fma(_1482, _1506, _1774);
    float _1810 = fma(_1396, _1798, _1396);
    float _1812 = fma(_1800, _1768, _1802);
    float _1814 = fma(_1804, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1806);
    float _1816 = fma(_1484, _1476, _1808);
    float _1818 = in.m_73.x;
    float _1820 = in.m_73.y;
    float _1822 = in.m_73.z;
    float _1824 = _1786 * 6.283185482025146484375;
    float _1826 = sin(_1824);
    float _1828 = fma(_1810, _1768, _1814);
    float _1830 = fma(_1520, _1408, _1816);
    float _1832 = _1776 * 0.15915493667125701904296875;
    float _1834 = _1812 * 0.15915493667125701904296875;
    float _1836 = _1828 * 0.15915493667125701904296875;
    float _1838 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1830);
    float _1840 = _450 * _170;
    float _1842 = _1832 * 6.283185482025146484375;
    float _1844 = sin(_1842);
    float _1846 = _450 * _186;
    float _1848 = _788 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1850 = fma(_448, _168, _1840);
    float _1852 = -_1780;
    float _1854 = _1852 + _1792;
    float _1856 = _450 * _162;
    float _1858 = fma(_452, _172, _1850);
    float _1860 = _1832 * 6.283185482025146484375;
    float _1862 = cos(_1860);
    float _1864 = fma(_1838, _1854, _1780);
    float _1866 = -_1782;
    float _1868 = _1866 + _1794;
    float _1870 = -_1784;
    float _1872 = _1870 + _1796;
    float _1874 = _1826 * 0.0500000007450580596923828125;
    float _1876 = fma(_448, _160, _1856);
    float _1878 = fma(_1838, _1868, _1782);
    float _1880 = fma(_1838, _1872, _1784);
    float _1882 = _1836 * 6.283185482025146484375;
    float _1884 = cos(_1882);
    float _1886 = fma(_448, _184, _1846);
    float _1888 = fma(_1874, _1818, _1864);
    float _1890 = fma(_1874, _1820, _1878);
    float _1892 = fma(_1874, _1822, _1880);
    float _1894 = _786 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1896 = fma(_452, _188, _1886);
    float _1898 = _1834 * 6.283185482025146484375;
    float _1900 = cos(_1898);
    float _1902 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1890);
    float _1904 = fma(_452, _164, _1876);
    bool _1906 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1908 = isnan(0.5);
    bool _1910 = _1906 || _1908;
    bool _1912 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1914 = _1910 || _1912;
    float _1916 = _1834 * 6.283185482025146484375;
    float _1918 = sin(_1916);
    float _1920 = _1862 * _1884;
    float _1922 = _1836 * 6.283185482025146484375;
    float _1924 = sin(_1922);
    float _1926 = _1900 * _1862;
    float _1928 = _1900 * _1844;
    float _1930 = _1900 * _1884;
    float _1932 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1888);
    float _1934 = _1918 * _1862;
    float _1936 = _1918 * _1844;
    float _1938 = _1844 * _1884;
    float _1940 = _1848 * _1932;
    float _1942 = _1894 * _1902;
    float _1944 = in.m_55.w;
    float _1946 = _1918 * _1884;
    float _1948 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1892);
    float _1950 = fma(_1924, _1926, _1936);
    float _1952 = in.m_53.w;
    float _1954 = _1930 * _1942;
    float _1956 = _1172 * _1948;
    float _1958 = -_1942;
    float _1960 = _1924 * _1958;
    float _1962 = -_1934;
    float _1964 = fma(_1924, _1928, _1962);
    float _1966 = fma(_1950, _1940, _1954);
    float _1968 = -_1928;
    float _1970 = fma(_1924, _1934, _1968);
    float _1972 = _1946 * _1942;
    float _1974 = fma(_1920, _1940, _1960);
    float _1976 = fma(_1964, _1956, _1966);
    float _1978 = fma(_1924, _1936, _1926);
    float _1980 = fma(_1970, _1940, _1972);
    float _1982 = fma(_1938, _1956, _1974);
    float _1984 = _1976 * _410;
    float _1986 = fma(_1978, _1956, _1980);
    float _1988 = _1976 * _442;
    float _1990 = fma(_1982, _374, _1984);
    float _1992 = _1976 * _400;
    float _1994 = _1896 + _1944;
    float _1996 = fma(_1982, _366, _1988);
    float _1998 = fma(_1986, _438, _1990);
    float _2000 = fma(_1982, _370, _1992);
    float _2002 = _1858 + _1952;
    float _2004 = fma(_1986, _426, _1996);
    float _2006 = _1994 + _1998;
    float _2008 = fma(_1986, _430, _2000);
    float _2010 = _2002 + _2004;
    float _2012 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2014 = _2006 + _2012;
    float _2016 = in.m_51.w;
    float _2018 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2020 = _2010 + _2018;
    float _2022 = _2014 * _2014;
    float _2024 = fma(_2020, _2020, _2022);
    float _2026 = sqrt(_2024);
    float _2028 = _1904 + _2016;
    bool _2030 = _2026 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2032 = _2028 + _2008;
    float _2034 = _1876;
    float _2036 = _2024;
    float _2038 = _1982;
    float _2040 = _1820;
    float _2042 = _1818;
    float _2044 = _1822;
    if (!_2030)
    {
        _2034 = _2010;
    }
    float _2046 = _2034;
    float _2048 = _2046;
    if (!_2030)
    {
        _228 = _2006;
    }
    float _2050 = _228;
    float _2052 = _2050;
    if (!_2030)
    {
        _456 = _2032;
    }
    float _2054 = _456;
    bool _2056 = !_2030;
    float _2058 = _2054;
    if (!_2056)
    {
        float _2060 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2062 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2064 = _2026 + _2062;
        float _2066 = _2032 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2068 = rsqrt(_2024);
        float _2070 = _2064 * _2060;
        float _2072 = _2070 * 0.15915493667125701904296875;
        float _2074 = _2072 * 6.283185482025146484375;
        float _2076 = cos(_2074);
        float _2078 = _2072 * 6.283185482025146484375;
        float _2080 = sin(_2078);
        float _2082 = _2076 + (-1.0);
        float _2084 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2086 = fma(_2080, _2066, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2088 = fma(_2032, _2076, _2084);
        float _2090 = _2068 * _2086;
        float _2092 = fma(_2020, _2090, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2094 = fma(_2014, _2090, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2048 = _2092;
        _2052 = _2094;
        _2058 = _2088;
        _230 = _2090;
        _2036 = _2068;
    }
    float _2096 = _2048;
    float _2098 = _2052;
    float _2100 = _2058;
    float _2102 = _230;
    float _2104 = _2036;
    float _2106 = _2100;
    float _2108 = _2096;
    float _2110 = _2098;
    float _2112 = _2102;
    if (!_1914)
    {
        float _2114 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2116 = _2028 + _2114;
        float _2118 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2120 = _2002 + _2118;
        float _2122 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2124 = -_2002;
        float _2126 = _2124 + _2096;
        float _2128 = _2116 * _2116;
        float _2130 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2132 = _1994 + _2130;
        float _2134 = -_1994;
        float _2136 = _2134 + _2098;
        float _2138 = fma(_2120, _2120, _2128);
        float _2140 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2142 = fma(_2132, _2132, _2138);
        float _2144 = sqrt(_2142);
        float _2146 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2148 = precise::min(_2144, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2150 = _2148 * _2140;
        float _2152 = _2146 * _2150;
        float _2154 = -_2028;
        float _2156 = _2154 + _2100;
        float _2158 = fma(_2126, _2152, _2002);
        float _2160 = fma(_2156, _2152, _2028);
        float _2162 = fma(_2136, _2152, _1994);
        _2106 = _2160;
        _2108 = _2158;
        _2110 = _2162;
        _2112 = _2144;
    }
    float _2164 = _2106;
    float _2166 = _2108;
    float _2168 = _2110;
    float _2170 = _2112;
    float _2172 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2174 = _2164 + _2172;
    float _2176 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2178 = _2166 + _2176;
    float _2180 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2182 = _2168 + _2180;
    float _2184 = _2174 * _2174;
    float _2186 = fma(_2178, _2178, _2184);
    float _2188 = fma(_2182, _2182, _2186);
    float _2190 = rsqrt(_2188);
    float _2192 = sqrt(_2188);
    float _2194 = _2190 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2196 = _2178 * _2194;
    float _2198 = _2182 * _2194;
    float _2200 = _2196 * _2196;
    float _2202 = _2198 * _2198;
    float _2204 = _2200 + _2202;
    float _2206 = sqrt(_2204);
    bool _2208 = _2206 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2210 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2212 = _2206 + _2210;
    float _2214 = _2170;
    float _2216 = _2204;
    float _2218 = _2212;
    float _2220 = _2174;
    float _2222 = _2196;
    float _2224 = _2198;
    float _2226 = _2200;
    float _2228 = _2202;
    if (_2208)
    {
        float _2230 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2214 = _2230;
    }
    float _2232 = _2214;
    if (_2208)
    {
        float _2234 = rsqrt(_2204);
        _2216 = _2234;
    }
    float _2236 = _2216;
    if (_2208)
    {
        float _2238 = _2212 * _2232;
        _2218 = _2238;
    }
    float _2240 = _2218;
    if (_2208)
    {
        float _2242 = _2240 * 0.15915493667125701904296875;
        _2038 = _2242;
    }
    float _2244 = _2038;
    float _2246 = _2104;
    if (_2208)
    {
        float _2248 = _2244 * 6.283185482025146484375;
        float _2250 = sin(_2248);
        _2246 = _2250;
    }
    float _2252 = _2246;
    float _2254 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2256 = precise::max(0.0, _2254);
    float _2258 = _2232;
    float _2260 = _2256;
    if (_2208)
    {
        float _2262 = _2244 * 6.283185482025146484375;
        float _2264 = cos(_2262);
        _2258 = _2264;
    }
    float _2266 = _2258;
    float _2268 = -_2194;
    float _2270 = -_2256;
    float _2272 = fma(_2174, _2268, _2270);
    if (_2208)
    {
        float _2274 = _2272 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2220 = _2274;
    }
    float _2276 = _2220;
    float _2278 = _2252;
    float _2280 = _2276;
    if (_2208)
    {
        float _2282 = fma(_2252, _2276, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2278 = _2282;
    }
    float _2284 = _2278;
    float _2286 = _2284;
    if (!_2208)
    {
        _2280 = _2272;
    }
    float _2288 = _2280;
    float _2290 = _2288;
    if (_2208)
    {
        float _2292 = _2266 + (-1.0);
        _2260 = _2292;
    }
    float _2294 = _2260;
    float _2296 = _2294;
    if (_2208)
    {
        float _2298 = _2236 * _2284;
        _2286 = _2298;
    }
    float _2300 = _2286;
    if (_2208)
    {
        float _2302 = _2294 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2296 = _2302;
    }
    float _2304 = _2296;
    if (_2208)
    {
        float _2306 = _2196 * _2300;
        _2222 = _2306;
    }
    float _2308 = _2222;
    if (_2208)
    {
        float _2310 = _2198 * _2300;
        _2224 = _2310;
    }
    float _2312 = _2224;
    if (_2208)
    {
        float _2314 = fma(_2272, _2266, _2304);
        _2290 = _2314;
    }
    float _2316 = _2290;
    if (_2208)
    {
        float _2318 = _2308 * _2308;
        _2226 = _2318;
    }
    float _2320 = _2226;
    if (_2208)
    {
        float _2322 = _2312 * _2312;
        _2228 = _2322;
    }
    float _2324 = _2228;
    float _2326 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2328 = fma(_2316, _2316, _2320);
    float _2330 = _2164 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2332 = _2328 + _2324;
    float _2334 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2336 = fma(_2192, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2334);
    float _2338 = precise::clamp(_2336, 0.0, 1.0);
    float _2340 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2330);
    float _2342 = _2164 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2344 = _2164 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2346 = -_2338;
    float _2348 = _2346 + 1.0;
    float _2350 = rsqrt(_2332);
    float _2352 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2340);
    float _2354 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2342);
    float _2356 = _2164 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2358 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2344);
    float _2360 = _2352 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2362 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2354);
    float _2364 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2356);
    float _2366 = abs(_2348);
    float _2368 = log2(_2366);
    float _2370 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2358);
    float _2372 = _2362 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2374 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2364);
    float _2376 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2378 = _2370 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2380 = _2374 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2382 = _2350 * _2308;
    float _2384 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2386 = _2350 * _2316;
    float _2388 = -_2376;
    float _2390 = fma(_2388, _2326, 1.0);
    float _2392 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2394 = _2350 * _2312;
    float _2396 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2384);
    float _2398 = log2(_2390);
    float _2400 = -_2392;
    float _2402 = fma(_2386, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2400);
    float _2404 = _2368 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2406 = fma(_2360, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2396);
    float _2408 = _2386 + 1.0;
    float _2410 = -_2394;
    float _2412 = fma(_2410, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2402);
    float _2414 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2416 = fma(_2372, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2406);
    float _2418 = exp2(_2404);
    float _2420 = fma(_2412, -0.5, 0.5);
    float _2422 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2424 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2414);
    float _2426 = fma(_2412, 0.5, 0.5);
    float _2428 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2422);
    float _2430 = fma(_2360, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2424);
    float _2432 = 1.0 / _2416;
    float _2434 = fma(_2426, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2436 = fma(_2360, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2428);
    float _2438 = fma(_2372, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2430);
    float _2440 = fma(_2426, _2434, -0.212114393711090087890625);
    float _2442 = fma(_2372, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2436);
    float _2444 = sqrt(_2420);
    float _2446 = -_2386;
    float _2448 = fma(_2418, _2408, _2446);
    float _2450 = _2398 * 0.693147182464599609375;
    float _2452 = fma(_2426, _2440, 1.570728778839111328125);
    float _2454 = _2450 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2456 = _2438 * _2432;
    float _2458 = _2442 * _2432;
    float _2460 = fma(_2456, 0.5, 0.5);
    float _2462 = fma(_2458, -0.5, 0.5);
    float _2464 = _2444 * 0.636619746685028076171875;
    float3 _6775 = float3(_2460, _2462, _2454);
    float _2466 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6775, float3(0.0), isnan(_6775)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6775, float3(0.0), isnan(_6775)), level(0.0)).x;
    float _2468 = -_2452;
    float _2470 = fma(_2464, _2468, 1.0);
    float _2472 = fma(_2448, 0.5, 0.5);
    float3 _6793 = float3(_2460, _2462, _2454);
    float4 _2475 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6793, float3(0.0), isnan(_6793)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6793, float3(0.0), isnan(_6793)), level(0.0)).xyzw;
    float _2477 = _2475.x;
    float _2479 = _2475.y;
    float _2481 = _2475.z;
    float _2483 = _2475.w;
    float2 _6810 = float2(_2470, _2472);
    float3 _2487 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6810, float2(0.0), isnan(_6810)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6810, float2(0.0), isnan(_6810)), level(0.0)).xyz;
    float _2489 = _2487.x;
    float _2491 = _2487.y;
    float _2493 = _2487.z;
    float _2495 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2497 = _1164 > 0.5;
    float _2499 = _1894 * _1648;
    bool _2501 = _1168 > 0.5;
    float _2503 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2507 = _2505 != 0;
    float _2509 = -_2499;
    float _2511 = _2509 + 1.0;
    float _2513 = -_1646;
    float _2515 = _2513 + 1.0;
    float _2517 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2521 = _2519 != 0;
    float _2523 = in.m_71.w;
    int _2525 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2527 = _2525 != 0;
    float _2529 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2503);
    int _2531 = _2497 ? as_type<int>(_2515) : as_type<int>(_1646);
    int _2533 = _2501 ? as_type<int>(_2515) : as_type<int>(_1646);
    float _2535 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2537 = _1166 > 0.5;
    float _2539 = fma(_2360, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2529);
    float _2541 = _2521 ? as_type<float>(_2531) : _1646;
    float _2543 = _2527 ? as_type<float>(_2533) : _1646;
    bool _2545 = _1890 != 0.0;
    bool _2547 = isnan(_1890);
    bool _2549 = _2545 || _2547;
    bool _2551 = isnan(0.0);
    bool _2553 = _2549 || _2551;
    float _2555 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2559 = _2557 != 0;
    int _2561 = _2537 ? as_type<int>(_2511) : as_type<int>(_2499);
    bool _2563 = _1170 > 0.5;
    float _2565 = _2517 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2567 = _1888 == 0.0;
    bool _2569 = !_2553;
    bool _2571 = _2567 && _2569;
    float _2573 = _2535 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2575 = !_2559;
    float _2577 = _2575 ? _2499 : as_type<float>(_2561);
    float _2579 = fma(_2543, _2565, -0.5);
    float _2581 = _2499;
    float _2583 = _2416;
    float _2585 = _2442;
    if (_2507)
    {
        float _2587 = _2563 ? _2511 : _2499;
        _2581 = _2587;
    }
    float _2589 = _2581;
    float _2591 = _2495 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2593 = _1892 == 0.0;
    bool _2595 = _2593 && _2571;
    float _2597 = fma(_2577, _2573, -0.5);
    out.m_75.w = _2523;
    float _2599 = _2555 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2601 = fma(_2541, _2591, -0.5);
    float _2603 = fma(_1744, _2579, _1752);
    float _2605 = fma(_2589, _2599, -0.5);
    float _2607 = fma(_1746, _2601, _1696);
    float _2609 = -_1666;
    float _2611 = fma(_1748, _2597, _2609);
    float _2613 = _2603 + 0.5;
    float _2615 = -_1700;
    float _2617 = fma(_1708, _2605, _2615);
    float _2619 = _2607 + 0.5;
    float _2621 = _2611 + 0.5;
    if (!_2595)
    {
        float _2623 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1820);
        _2040 = _2623;
    }
    float _2625 = _2040;
    float _2627 = _2617 + 0.5;
    float _2629 = _2368 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_2595)
    {
        float _2631 = fma(_1888, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1818);
        _2042 = _2631;
    }
    float _2633 = _2042;
    float _2635 = -_2625;
    float _2637 = _1924 * _2635;
    float _2639 = _1930 * _2625;
    out.m_77.x = _2619;
    out.m_77.y = _2621;
    out.m_77.z = _2613;
    out.m_77.w = _2627;
    float _2641 = _1946 * _2625;
    if (!_2595)
    {
        float _2643 = fma(_1892, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1822);
        _2044 = _2643;
    }
    float _2645 = _2044;
    float _2647 = fma(_1920, _2633, _2637);
    float _2649 = fma(_1950, _2633, _2639);
    float _2651 = fma(_1970, _2633, _2641);
    float _2653 = fma(_2372, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2539);
    float _2655 = fma(_1938, _2645, _2647);
    float _2657 = fma(_1964, _2645, _2649);
    float _2659 = fma(_1978, _2645, _2651);
    float _2661 = _2657 * _400;
    float _2663 = _2657 * _410;
    float _2665 = exp2(_2629);
    float _2667 = _2657 * _442;
    float _2669 = _2653 + _2416;
    float _2671 = fma(_2655, _370, _2661);
    float _2673 = fma(_2655, _374, _2663);
    float _2675 = fma(_2655, _366, _2667);
    float _2677 = _2669 * 0.5;
    bool _2679 = _2192 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2681 = isnan(_2192);
    bool _2683 = _2679 || _2681;
    bool _2685 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2687 = _2683 || _2685;
    float _2689 = fma(_2659, _426, _2675);
    float _2691 = fma(_2659, _430, _2671);
    float _2693 = fma(_2659, _438, _2673);
    out.m_79.z = _2677;
    out.m_79.w = _2416;
    float _2695 = -_2665;
    float _2697 = _2695 + 1.0;
    out.m_81.x = _2689;
    out.m_81.y = _2691;
    out.m_81.z = _2693;
    float _2699 = _2697 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2438;
    out.gl_Position.y = _2442;
    out.gl_Position.z = _2653;
    out.gl_Position.w = _2416;
    float _2701 = _2697;
    float _2703 = _2653;
    float _2705 = _2438;
    if (!_2687)
    {
        _2701 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2707 = _2701;
    float _2709 = _2707;
    float _2711 = _2707;
    if (!_2687)
    {
        _2583 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2713 = _2583;
    float _2715 = _2713;
    float _2717 = _2713;
    if (!_2687)
    {
        _2703 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2719 = _2703;
    float _2721 = _2719;
    float _2723 = _2719;
    if (!_2687)
    {
        _2585 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2725 = _2585;
    float _2727 = _2725;
    float _2729 = _2725;
    if (!_2687)
    {
        _2705 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2731 = _2705;
    float _2733 = _2699 * _2466;
    float _2735 = -_2699;
    float _2737 = _2735 + 1.0;
    float _2739 = _2483 * _2733;
    float _2741 = _2483 * _2737;
    float _2743 = _2493 * _2733;
    float _2745 = fma(_2489, _2739, _2477);
    float _2747 = fma(_2491, _2739, _2479);
    float _2749 = _2477;
    float _2751 = _2731;
    float _2753 = _2731;
    if (!_2687)
    {
        _2749 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2755 = _2749;
    float _2757 = fma(_2483, _2743, _2481);
    out.m_83.x = _2745;
    out.m_83.y = _2747;
    out.m_83.z = _2757;
    out.m_83.w = _2741;
    bool _2759 = !_2687;
    float _2761 = _2755;
    float _2763 = _2755;
    if (!_2759)
    {
        bool _2765 = _2192 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2767 = isnan(_2192);
        bool _2769 = _2765 || _2767;
        bool _2771 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2773 = _2769 || _2771;
        if (!_2773)
        {
            float _2775 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2777 = _2192 + _2775;
            float _2779 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2781 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2779;
            float _2783 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2785 = _2783 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2787 = 1.0 / _2781;
            float _2789 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2791 = _2789 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2793 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2795 = _2793 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2797 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2799 = _2797 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2801 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2803 = _2801 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2805 = _2777 * _2787;
            float _2807 = precise::clamp(_2805, 0.0, 1.0);
            float _2809 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2811 = _2809 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2813 = fma(_2807, _2785, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2815 = fma(_2807, _2811, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2817 = fma(_2807, _2791, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2819 = fma(_2807, _2795, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2821 = fma(_2807, _2799, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2823 = fma(_2807, _2803, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2717 = _2817;
            _2753 = _2821;
            _2763 = _2813;
            _2729 = _2819;
            _2723 = _2815;
            _2711 = _2823;
            _2825 = true;
        }
        else
        {
            bool _2827 = _2192 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2829 = isnan(_2192);
            bool _2831 = _2827 || _2829;
            bool _2833 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2835 = _2831 || _2833;
            if (!_2835)
            {
                _2761 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2837 = _2761;
            _2763 = _2837;
            if (!_2835)
            {
                _2715 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2839 = _2715;
            _2717 = _2839;
            if (!_2835)
            {
                _2721 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2841 = _2721;
            _2723 = _2841;
            if (!_2835)
            {
                _2727 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2843 = _2727;
            _2729 = _2843;
            if (!_2835)
            {
                _2751 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2845 = _2751;
            _2753 = _2845;
            if (!_2835)
            {
                _2709 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2847 = _2709;
            bool _2849 = !_2835;
            _2711 = _2847;
            if (!_2849)
            {
                bool _2851 = _2192 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2853 = isnan(_2192);
                bool _2855 = _2851 || _2853;
                bool _2857 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2859 = _2855 || _2857;
                if (!_2859)
                {
                    float _2861 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2863 = _2192 + _2861;
                    float _2865 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2867 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2865;
                    float _2869 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2871 = _2869 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2873 = 1.0 / _2867;
                    float _2875 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2877 = _2875 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2879 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2881 = _2879 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2883 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2885 = _2883 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2887 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2889 = _2887 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2891 = _2863 * _2873;
                    float _2893 = precise::clamp(_2891, 0.0, 1.0);
                    float _2895 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2897 = _2895 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2899 = fma(_2893, _2871, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2901 = fma(_2893, _2897, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2903 = fma(_2893, _2877, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2905 = fma(_2893, _2881, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2907 = fma(_2893, _2885, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2909 = fma(_2893, _2889, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2717 = _2903;
                    _2753 = _2907;
                    _2763 = _2899;
                    _2729 = _2905;
                    _2723 = _2901;
                    _2711 = _2909;
                    _2825 = true;
                }
                else
                {
                    _2717 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2753 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2763 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2729 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2723 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2711 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2825 = false;
    float _2911 = _2717;
    float _2913 = _2753;
    float _2915 = _2763;
    float _2917 = _2729;
    float _2919 = _2723;
    float _2921 = _2711;
    float _2923 = fma(_2691, -0.5, 0.5);
    float _2925 = precise::clamp(_2923, 0.0, 1.0);
    float _2927 = -_2911;
    float _2929 = _2927 + _2913;
    float _2931 = -_2915;
    float _2933 = _2931 + _2917;
    float _2935 = -_2919;
    float _2937 = _2935 + _2921;
    bool _2939 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2941 = fma(_2925, _2929, _2911);
    float _2943 = fma(_2925, _2933, _2915);
    float _2945 = fma(_2925, _2937, _2919);
    float _2947 = _2941 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _2949 = fma(_2943, 0.298911988735198974609375, _2947);
    float _2951 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2953 = fma(_2945, 0.114477999508380889892578125, _2949);
    out.m_85.w = _2951;
    float _2955 = -_2953;
    float _2957 = _2943 + _2955;
    float _2959 = -_2953;
    float _2961 = _2941 + _2959;
    float _2963 = -_2953;
    float _2965 = _2945 + _2963;
    out.m_87.x = 0.0;
    float _2967 = fma(_2957, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2953);
    float _2969 = fma(_2961, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2953);
    float _2971 = fma(_2965, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2953);
    out.m_89.x = _2967;
    out.m_89.y = _2969;
    out.m_89.z = _2971;
    if (!_2939)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2973 = -_2164;
    float _2975 = _2973 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2977 = -_2166;
    float _2979 = _2977 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2981 = -_2168;
    float _2983 = _2981 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2985 = _2975 * _2975;
    float _2987 = fma(_2979, _2979, _2985);
    float _2989 = fma(_2983, _2983, _2987);
    float _2991 = sqrt(_2989);
    float _2993 = rsqrt(_2989);
    float _2995 = -_2991;
    float _2997 = _2995 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2999 = _2997 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3001 = precise::clamp(_2999, 0.0, 1.0);
    float _3003 = _2979 * _2993;
    float _3005 = _2975 * _2993;
    float _3007 = abs(_3001);
    float _3009 = log2(_3007);
    float _3011 = _2983 * _2993;
    float _3013 = _3003 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3015 = _2691 * _3005;
    float _3017 = -_3005;
    float _3019 = -_3013;
    float _3021 = fma(_3017, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3019);
    float _3023 = fma(_2689, _3003, _3015);
    float _3025 = -_3011;
    float _3027 = fma(_3025, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3021);
    float _3029 = fma(_2693, _3011, _3023);
    float _3031 = precise::clamp(_3029, 0.0, 1.0);
    float _3033 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3035 = _3027 + _3033;
    float _3037 = _3009 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3039 = _3035 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3041 = precise::clamp(_3039, 0.0, 1.0);
    float _3043 = exp2(_3037);
    float _3045 = _3043 * _3041;
    float _3047 = _3031 * _3045;
    float _3049 = _3047 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3051 = _3047 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3053 = _3047 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _3049;
    out.m_87.y = _3051;
    out.m_87.z = _3053;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2825 = false;
    bool _1160 = false;
    bool _1040 = false;
    bool _866 = false;
    bool _746 = false;
    bool _476 = false;
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
    float _116 = as_type<float>(_108);
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _114;
    if (!_112)
    {
        out.m_47.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3111 = as_type<float>(_124);
        out.gl_Position.z = _3111;
    }
    if (!_112)
    {
        return out;
    }
    float _128 = in.m_49.w;
    float _130 = float(_108);
    float _132 = -_128;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_128);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    bool _146 = _134 >= _130;
    bool _148 = !_144;
    bool _150 = _146 || _148;
    float _152 = _134;
    if (_150)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _116;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _126 = as_type<int>(_156);
    }
    int _158 = _126;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3175 = as_type<float>(_158);
        out.gl_Position.z = _3175;
    }
    if (_150)
    {
        return out;
    }
    float _160 = in.m_51.x;
    float _162 = in.m_51.y;
    float _164 = in.m_51.z;
    float _166 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _168 = in.m_53.x;
    float _170 = in.m_53.y;
    float _172 = in.m_53.z;
    bool _174 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _176 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _178 = _174 || _176;
    bool _180 = isnan(1.0);
    bool _182 = _178 || _180;
    float _184 = in.m_55.x;
    float _186 = in.m_55.y;
    float _188 = in.m_55.z;
    float _190 = in.m_49.x;
    float _192 = in.m_49.y;
    float _194 = in.m_49.z;
    float _196 = _160 * _160;
    float _198 = _162 * _162;
    float _200 = _164 * _164;
    float _202 = fma(_168, _168, _196);
    float _204 = fma(_170, _170, _198);
    float _206 = fma(_172, _172, _200);
    float _208 = fma(_184, _184, _202);
    float _210 = fma(_186, _186, _204);
    float _212 = fma(_188, _188, _206);
    float _214 = sqrt(_208);
    float _216 = sqrt(_210);
    bool _218 = _214 > 0.0;
    float _220 = sqrt(_212);
    float _222 = _214;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _226 = _212;
    float _228 = _164;
    float _230 = _162;
    if (!_182)
    {
        float _232 = _166 * _166;
        float _234 = _232 * 0.5;
        _222 = _234;
    }
    float _236 = _222;
    float _238 = _236;
    if (!_182)
    {
        float _240 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _238 = _240;
    }
    float _242 = _238;
    bool _244 = _216 > 0.0;
    float _246 = 0.0;
    float _248 = _242;
    if (_218)
    {
        float _250 = rsqrt(_208);
        _246 = _250;
    }
    float _252 = _246;
    bool _254 = _220 > 0.0;
    float _256 = _220;
    if (!_182)
    {
        _256 = _166;
    }
    float _258 = _256;
    float _260 = 0.0;
    float _262 = _258;
    if (_244)
    {
        float _264 = rsqrt(_210);
        _260 = _264;
    }
    float _266 = _260;
    bool _268 = !_182;
    float _270 = _252;
    if (!_268)
    {
        float _272 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _274 = log2(_272);
        float _276 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _278 = _276 + 1.0;
        float _280 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _282 = _166 * _274;
        float _284 = 1.0 / _278;
        float _286 = _280 * 0.693147182464599609375;
        float _288 = exp2(_282);
        float _290 = 1.0 / _286;
        float _292 = _288 + (-1.0);
        float _294 = -_292;
        float _296 = fma(_294, _290, _166);
        float _298 = _296 * _284;
        float _300 = _298 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _248 = _300;
    }
    float _302 = _248;
    bool _304 = !_182;
    if (!_304)
    {
        float _306 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _308 = log2(_306);
        float _310 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _312 = _310 + 1.0;
        float _314 = 1.0 / _312;
        float _316 = _166 * _308;
        float _318 = exp2(_316);
        float _320 = -_318;
        float _322 = _320 + 1.0;
        float _324 = _322 * _314;
        _262 = _324;
        _224 = _312;
    }
    float _326 = _262;
    float _328 = _224;
    float _330 = in.m_57.w;
    float _332 = 0.0;
    float _334 = _328;
    if (!_218)
    {
        _332 = 0.0;
    }
    float _336 = _332;
    float _338 = 0.0;
    float _340 = _336;
    if (_254)
    {
        float _342 = rsqrt(_212);
        _338 = _342;
    }
    float _344 = _338;
    float _346 = 0.0;
    if (!_218)
    {
        _346 = 0.0;
    }
    float _348 = _346;
    float _350 = in.m_44.x;
    float _352 = in.m_44.y;
    float _354 = in.m_44.z;
    float _356 = 0.0;
    float _358 = _348;
    if (!_218)
    {
        _356 = 0.0;
    }
    float _360 = _356;
    float _362 = _360;
    if (_218)
    {
        float _364 = _252 * _168;
        _340 = _364;
    }
    float _366 = _340;
    if (_218)
    {
        float _368 = _252 * _160;
        _358 = _368;
    }
    float _370 = _358;
    if (_218)
    {
        float _372 = _252 * _184;
        _362 = _372;
    }
    float _374 = _362;
    bool _376 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _378 = 1.0 / _130;
    float _380 = _302 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _382 = 0.0;
    float _384 = 0.0;
    if (!_244)
    {
        _382 = 0.0;
        _384 = 0.0;
    }
    float _386 = _382;
    float _388 = _384;
    float _390 = _388;
    float _392 = _386;
    if (!_254)
    {
        _334 = 0.0;
    }
    float _394 = _334;
    float _396 = _394;
    if (_244)
    {
        float _398 = _266 * _162;
        _390 = _398;
    }
    float _400 = _390;
    float _402 = fma(_326, _192, _380);
    if (!_254)
    {
        _270 = 0.0;
    }
    float _404 = _270;
    float _406 = _404;
    if (_244)
    {
        float _408 = _266 * _186;
        _392 = _408;
    }
    float _410 = _392;
    if (!_254)
    {
        _226 = 0.0;
    }
    float _412 = _226;
    float _414 = _302 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _416 = 0.0;
    float _418 = _412;
    if (!_244)
    {
        _416 = 0.0;
    }
    float _420 = _416;
    float _422 = _420;
    if (_254)
    {
        float _424 = _344 * _172;
        _396 = _424;
    }
    float _426 = _396;
    if (_254)
    {
        float _428 = _344 * _164;
        _406 = _428;
    }
    float _430 = _406;
    float _432 = fma(_326, _190, _414);
    float _434 = _302 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (_254)
    {
        float _436 = _344 * _188;
        _418 = _436;
    }
    float _438 = _418;
    if (_244)
    {
        float _440 = _266 * _170;
        _422 = _440;
    }
    float _442 = _422;
    float _444 = _134 * _378;
    float _446 = fma(_326, _194, _434);
    float _448 = fma(_432, _330, _350);
    float _450 = fma(_402, _330, _352);
    float _452 = fma(_446, _330, _354);
    bool _454 = !_376;
    float _456 = _448;
    float _474;
    if (!_454)
    {
        float _458 = in.m_59.x;
        float _460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _462 = _458 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _464 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _466 = _464 * _460;
        float _468 = floor(_466);
        float _470 = -_468;
        float _472 = _466 + _470;
        _474 = _472;
        _476 = true;
    }
    else
    {
        _474 = _444;
    }
    _476 = false;
    float _478 = _474;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _482 = _478 + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _486 = _478 + _484;
    bool _488 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _490 = isnan(_478);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _496 = _492 || _494;
    float _498 = float(_496);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _500;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _516 = 1.0 / _502;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _520 = _478 + _518;
    bool _522 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _524 = isnan(_478);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = 1.0 / _506;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _538 = _478 + _536;
    bool _540 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _542 = isnan(_478);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = 1.0 / _514;
    float _554 = _482 * _516;
    bool _556 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _558 = isnan(_478);
    bool _560 = _556 || _558;
    bool _562 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _564 = _560 || _562;
    float _566 = float(_564);
    bool _568 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _570 = 1.0 / _510;
    float _572 = _486 * _534;
    float _574 = -_498;
    float _576 = _574 + 1.0;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _578;
    float _582 = fma(_580, _554, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _584 = _538 * _552;
    bool _586 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _588 = isnan(_478);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = -_566;
    float _600 = _598 + 1.0;
    float _602 = _566 * _576;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _612 = -_596;
    float _614 = _612 + 1.0;
    float _616 = _520 * _570;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _618;
    float _622 = _532 * _600;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _624;
    float _628 = -_532;
    float _630 = _628 + 1.0;
    float _632 = _498 * _614;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _638 = fma(_620, _554, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _640 = fma(_626, _554, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _642 = _550 * _630;
    float _644 = fma(_606, _572, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _646 = fma(_636, _572, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _648 = fma(_610, _572, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _650 = _638 * _642;
    float _652 = _640 * _642;
    float _654 = -_550;
    float _656 = _654 + 1.0;
    float _658 = _582 * _642;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _660;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _664;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _668;
    float _672 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[143].x, _650);
    float _674 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[143].y, _652);
    float _676 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[143].z, _658);
    float _678 = fma(_662, _616, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _680 = fma(_666, _616, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _682 = fma(_670, _616, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _684 = fma(_644, _622, _672);
    float _686 = fma(_648, _622, _676);
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _690 = _688 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _696 = fma(_646, _622, _674);
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _702 = fma(_678, _602, _684);
    float _704 = fma(_690, _584, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _706 = fma(_694, _584, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _708 = fma(_700, _584, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _710 = fma(_680, _602, _696);
    float _712 = fma(_682, _602, _686);
    float _714 = fma(_704, _632, _702);
    float _716 = fma(_706, _632, _710);
    float _718 = fma(_708, _632, _712);
    float _720 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[147].x, _714);
    float _722 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[147].y, _716);
    float _724 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[147].z, _718);
    bool _726 = !_568;
    float _744;
    if (!_726)
    {
        float _728 = in.m_59.x;
        float _730 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _732 = _728 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _734 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[11].x, _134);
        float _736 = _734 * _730;
        float _738 = floor(_736);
        float _740 = -_738;
        float _742 = _736 + _740;
        _744 = _742;
        _746 = true;
    }
    else
    {
        _744 = _444;
    }
    _746 = false;
    float _748 = _744;
    float _750 = in.m_57.x;
    float _752 = in.m_57.y;
    float _754 = in.m_57.z;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _758 = _748 + _756;
    bool _760 = _748 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _762 = isnan(_748);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _768 = _764 || _766;
    float _770 = float(_768);
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _772;
    bool _776 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _778 = -_770;
    float _780 = _778 + 1.0;
    float _782 = 1.0 / _774;
    float _784 = _724 * _754;
    float _786 = _722 * _752;
    float _788 = _720 * _750;
    float _790 = _758 * _782;
    bool _792 = _748 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _794 = isnan(_748);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _804;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _808;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _814 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _812;
    float _816 = _802 * _780;
    float _818 = fma(_806, _790, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _820 = fma(_814, _790, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _822 = fma(_810, _790, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _824 = -_802;
    float _826 = _824 + 1.0;
    float _828 = _818 * _816;
    float _830 = _820 * _816;
    float _832 = _822 * _816;
    float _834 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[107].x, _828);
    float _836 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[107].y, _830);
    float _838 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[107].z, _832);
    float _840 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[108].x, _834);
    float _842 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[108].y, _836);
    float _844 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[108].z, _838);
    bool _846 = !_776;
    float _864;
    if (!_846)
    {
        float _848 = in.m_59.x;
        float _850 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _852 = _848 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _854 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _856 = _854 * _850;
        float _858 = floor(_856);
        float _860 = -_858;
        float _862 = _856 + _860;
        _864 = _862;
        _866 = true;
    }
    else
    {
        _864 = _444;
    }
    _866 = false;
    float _868 = _864;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _872 = _868 + _870;
    float _874 = _840 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _878 = _876 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _884 = _868 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _886 = isnan(_868);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _898 = _896 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _900 = _868 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _902 = isnan(_868);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    float _912 = 1.0 / _878;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _914;
    float _918 = -_894;
    float _920 = _918 + 1.0;
    bool _922 = _868 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _924 = isnan(_868);
    bool _926 = _922 || _924;
    bool _928 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _930 = _926 || _928;
    float _932 = float(_930);
    float _934 = _842 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _936 = _844 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _938 = _874 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _940 = 1.0 / _882;
    float _942 = _934 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _944 = _936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _946 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _948 = 1.0 / _898;
    float _950 = _916 * _912;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _954 = _952 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _956 = _910 * _920;
    float _958 = -_910;
    float _960 = _958 + 1.0;
    float _962 = fma(_950, _872, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _964 = _868 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _966 = isnan(_868);
    bool _968 = _964 || _966;
    bool _970 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _972 = _968 || _970;
    float _974 = float(_972);
    float _976 = _932 * _960;
    float _978 = _954 * _940;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _980;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _986 = _868 + _984;
    float _988 = _962 * _976;
    float _990 = -_932;
    float _992 = _990 + 1.0;
    float _994 = -_974;
    float _996 = _994 + 1.0;
    float _998 = fma(_978, _986, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1000 = _982 * _948;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1004 = _868 + _1002;
    float _1006 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[115].x, _988);
    float _1008 = _894 * _996;
    float _1010 = fma(_1000, _1004, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1012 = fma(_998, _956, _1006);
    float _1014 = fma(_1010, _1008, _1012);
    float _1016 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1014);
    float _1018 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _938;
    out.m_61.y = _942;
    out.m_61.z = _944;
    out.m_61.w = _1018;
    bool _1020 = !_946;
    float _1038;
    if (!_1020)
    {
        float _1022 = in.m_59.x;
        float _1024 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1026 = _1022 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1028 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[11].z, _134);
        float _1030 = _1028 * _1024;
        float _1032 = floor(_1030);
        float _1034 = -_1032;
        float _1036 = _1030 + _1034;
        _1038 = _1036;
        _1040 = true;
    }
    else
    {
        _1038 = _444;
    }
    _1040 = false;
    float _1042 = _1038;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1046 = _1042 + _1044;
    bool _1048 = _1042 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1050 = isnan(_1042);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1056 = _1052 || _1054;
    float _1058 = float(_1056);
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1060;
    bool _1064 = _1042 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1066 = isnan(_1042);
    bool _1068 = _1064 || _1066;
    bool _1070 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1072 = _1068 || _1070;
    float _1074 = float(_1072);
    float _1076 = -_1058;
    float _1078 = _1076 + 1.0;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1082 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1080;
    float _1084 = 1.0 / _1062;
    bool _1086 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1088 = _1074 * _1078;
    float _1090 = -_1074;
    float _1092 = _1090 + 1.0;
    float _1094 = _1046 * _1084;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1096;
    float _1100 = fma(_1082, _1094, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1102;
    float _1106 = fma(_1098, _1094, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1108 = _1100 * _1088;
    float _1110 = fma(_1104, _1094, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1112 = _1106 * _1088;
    float _1114 = _1110 * _1088;
    float _1116 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1108);
    float _1118 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1114);
    float _1120 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1112);
    float _1122 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1116);
    float _1124 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1118);
    float _1126 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1120);
    float _1128 = _1122 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1130 = _1124 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1132 = _1126 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1134 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1136 = _1130 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1138 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.x = _1134;
    out.m_63.y = _1136;
    out.m_63.z = _1138;
    bool _1140 = !_1086;
    float _1158;
    if (!_1140)
    {
        float _1142 = in.m_59.x;
        float _1144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1146 = _1142 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1148 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[14].x, _134);
        float _1150 = _1148 * _1144;
        float _1152 = floor(_1150);
        float _1154 = -_1152;
        float _1156 = _1150 + _1154;
        _1158 = _1156;
        _1160 = true;
    }
    else
    {
        _1158 = _444;
    }
    _1160 = false;
    float _1162 = _1158;
    float _1164 = in.m_59.x;
    float _1166 = in.m_59.y;
    float _1168 = in.m_59.z;
    float _1170 = in.m_59.w;
    float _1172 = _784 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1176 = _1174 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1180 = _1178 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1182 = 1.0 / _1176;
    int _1184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1186 = _1184 != 0;
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1190 = _1188 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1192 = 1.0 / _1180;
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1196 = _1194 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1200;
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1206 = _1204 != 0;
    int _1208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1210 = _1208 != 0;
    int _1212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1214 = _1212 != 0;
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1218 = _1216 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1220 = _1164 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1222 = 1.0 / _1190;
    float _1224 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1226 = _1224 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1228 = -_1198;
    float _1230 = fma(_1220, 2.0, _1228);
    float _1232 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1234 = _1202 * _1182;
    float _1236 = 1.0 / _1218;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1240;
    float _1244 = fma(_1232, -2.0, _1238);
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1246;
    float _1250 = 1.0 / _1196;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1254 = _1252 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1256 = _1168 * 2.0;
    float _1258 = _1226 * _1222;
    float _1260 = _1164 * 2.0;
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1264 = _1262 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1268 = _1266 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _1270 = _1162 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1272 = isnan(_1162);
    bool _1274 = _1270 || _1272;
    bool _1276 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1278 = _1274 || _1276;
    float _1280 = float(_1278);
    float _1282 = 1.0 / _1254;
    float _1284 = _1242 * _1236;
    float _1286 = -_1280;
    float _1288 = _1286 + 1.0;
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1290;
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1296 = _1294 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1298 = floor(_1256);
    float _1300 = _1166 + _1168;
    float _1302 = _1292 * _1250;
    float _1304 = _1166 * 2.0;
    float _1306 = _1296 * _1192;
    float _1308 = _1300 + (-1.0);
    float _1310 = floor(_1260);
    float _1312 = _1248 * _1282;
    float _1314 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1316 = _1166 + _1164;
    float _1318 = _1316 + (-1.0);
    float _1320 = floor(_1304);
    bool _1322 = _1298 > 0.0;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1326 = _1298 >= 0.0;
    bool _1328 = isnan(_1298);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan(0.0);
    bool _1334 = _1330 || _1332;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1338 = _1316;
    float _1340 = _1260;
    if (!_1186)
    {
        _1338 = _1166;
    }
    float _1342 = _1338;
    float _1344 = 1.0 / _1264;
    bool _1346 = _1310 >= 0.0;
    bool _1348 = isnan(_1310);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan(0.0);
    bool _1354 = _1350 || _1352;
    float _1356 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1360 = _1162 + _1358;
    int _1362 = _1334 ? 0 : 1;
    float _1364 = _1342;
    if (!_1186)
    {
        _1340 = _1168;
    }
    float _1366 = _1340;
    float _1368 = fma(_1302, _1360, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _1370 = _1320 > 0.0;
    float _1372 = _1168 + _1164;
    float _1374 = _1366;
    if (_1186)
    {
        _1364 = _1164;
    }
    float _1376 = _1364;
    if (_1186)
    {
        _1374 = _1166;
    }
    float _1378 = _1374;
    float _1380 = _1372 + (-1.0);
    bool _1382 = _1162 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1384 = isnan(_1162);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1390 = _1386 || _1388;
    float _1392 = float(_1390);
    float _1394 = _1268 * _1344;
    float _1396 = fma(_1380, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1398 = _1354 ? 0 : 1;
    float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1402 = _1162 + _1400;
    float _1404 = _1380;
    if (!_1186)
    {
        _1404 = _1168;
    }
    float _1406 = _1404;
    float _1408 = _1392 * _1288;
    bool _1410 = _1320 >= 0.0;
    bool _1412 = isnan(_1320);
    bool _1414 = _1410 || _1412;
    bool _1416 = isnan(0.0);
    bool _1418 = _1414 || _1416;
    float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1422 = _1162 + _1420;
    float _1424 = _1406;
    if (_1186)
    {
        _1424 = _1166;
    }
    float _1426 = _1424;
    float _1428 = fma(_1306, _1402, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _1430 = _1310 > 0.0;
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1434 = _1162 + _1432;
    float _1436 = fma(_1258, _1422, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1438 = _1162 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1440 = isnan(_1162);
    bool _1442 = _1438 || _1440;
    bool _1444 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1446 = _1442 || _1444;
    float _1448 = float(_1446);
    float _1450 = -_1392;
    float _1452 = _1450 + 1.0;
    float _1454 = fma(_1234, _1434, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1456 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1458 = _1162 + _1456;
    float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1462 = _1162 + _1460;
    bool _1464 = _1162 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1466 = isnan(_1162);
    bool _1468 = _1464 || _1466;
    bool _1470 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1472 = _1468 || _1470;
    float _1474 = float(_1472);
    float _1476 = _1448 * _1452;
    float _1478 = -_1448;
    float _1480 = _1478 + 1.0;
    float _1482 = fma(_1284, _1458, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1484 = fma(_1394, _1462, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _1486 = _1162 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1488 = isnan(_1162);
    bool _1490 = _1486 || _1488;
    bool _1492 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1494 = _1490 || _1492;
    float _1496 = float(_1494);
    float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1500 = _1162 + _1498;
    float _1502 = -_1474;
    float _1504 = _1502 + 1.0;
    float _1506 = _1474 * _1480;
    bool _1508 = _1162 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1510 = isnan(_1162);
    bool _1512 = _1508 || _1510;
    bool _1514 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1516 = _1512 || _1514;
    float _1518 = float(_1516);
    float _1520 = fma(_1312, _1500, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1522 = _1496 * _1504;
    float _1524 = -_1496;
    float _1526 = _1524 + 1.0;
    bool _1528 = _1162 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1530 = isnan(_1162);
    bool _1532 = _1528 || _1530;
    bool _1534 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1536 = _1532 || _1534;
    float _1538 = float(_1536);
    bool _1540 = _1162 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1542 = isnan(_1162);
    bool _1544 = _1540 || _1542;
    bool _1546 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1548 = _1544 || _1546;
    float _1550 = float(_1548);
    float _1552 = _1518 * _1526;
    float _1554 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1556 = log2(_1554);
    float _1558 = -_1518;
    float _1560 = _1558 + 1.0;
    int _1562 = ~_1362;
    int _1564 = _1562 + 1;
    int _1566 = _1564 + 1;
    int _1568 = _1566;
    if (!_1322)
    {
        int _1570 = ~_1362;
        int _1572 = _1570 + 1;
        _1568 = _1572;
    }
    int _1574 = _1568;
    float _1576 = _1550 * _1560;
    float _1578 = -_1550;
    float _1580 = _1578 + 1.0;
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1584 = ~_1398;
    int _1586 = _1584 + 1;
    int _1588 = _1586 + 1;
    float _1590 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1592 = _1588;
    if (!_1430)
    {
        int _1594 = ~_1398;
        int _1596 = _1594 + 1;
        _1592 = _1596;
    }
    int _1598 = _1592;
    float _1600 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1582);
    float _1602 = _1538 * _1580;
    float _1604 = _1376 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1606 = -_1538;
    float _1608 = _1606 + 1.0;
    float _1610 = _1556 * _134;
    float _1612 = _1454 * _1602;
    float _1614 = -_1324;
    float _1616 = fma(_1604, 2.0, _1614);
    int _1618 = _1418 ? 0 : 1;
    float _1620 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1622 = fma(_1608, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1612);
    float _1624 = exp2(_1610);
    float _1626 = _1378 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1628 = ~_1618;
    int _1630 = _1628 + 1;
    int _1632 = _1630 + 1;
    float _1634 = fma(_1164, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1620);
    float _1636 = fma(_1426, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1590);
    int _1638 = _1632;
    if (!_1370)
    {
        int _1640 = ~_1618;
        int _1642 = _1640 + 1;
        _1638 = _1642;
    }
    int _1644 = _1638;
    float _1646 = in.m_65.x;
    float _1648 = in.m_65.y;
    bool _1650 = !_1210;
    int _1652 = _1650 ? 0 : 1;
    float _1654 = fma(_1436, _1576, _1622);
    float _1656 = in.m_67.x;
    float _1658 = in.m_67.y;
    float _1660 = in.m_67.z;
    int _1662 = abs(_1652);
    float _1664 = fma(_1626, -2.0, _1336);
    float _1666 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1244);
    float _1668 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1670 = 1.0 + _1668;
    float _1672 = -_1624;
    float _1674 = _1672 + 1.0;
    bool _1676 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1678 = isnan(0.0);
    bool _1680 = _1676 || _1678;
    bool _1682 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1684 = _1680 || _1682;
    float _1686 = fma(_1368, _1552, _1654);
    float _1688 = float(_1662);
    float _1690 = 1.0 / _1670;
    float _1692 = float(_1598);
    float _1694 = -_134;
    float _1696 = fma(_1694, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1230);
    float _1698 = _1684 ? _1674 : 0.0;
    float _1700 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1664);
    float _1702 = _1688 * _1692;
    bool _1704 = !_1206;
    int _1706 = _1704 ? 0 : 1;
    float _1708 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1636);
    bool _1710 = !_1214;
    int _1712 = _1710 ? 0 : 1;
    float _1714 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1716 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1718 = isnan(1.0);
    bool _1720 = _1716 || _1718;
    bool _1722 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1724 = _1720 || _1722;
    float _1726 = fma(_444, 0.300000011920928955078125, _1646);
    int _1728 = abs(_1706);
    float _1730 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1714);
    int _1732 = abs(_1712);
    float _1734 = _1702 * (-2.0);
    float _1736 = float(_1728);
    float _1738 = _1166 + (-0.5);
    float _1740 = float(_1574);
    float _1742 = fma(_1734, _1658, _1658);
    float _1744 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1600);
    float _1746 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1634);
    float _1748 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1730);
    float _1750 = -_134;
    float _1752 = fma(_1750, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1616);
    float _1754 = _1726 + _1164;
    float _1756 = float(_1732);
    float _1758 = fma(_1314, _1734, _1314);
    float _1760 = float(_1644);
    float _1762 = fma(_1738, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1742);
    float _1764 = _1736 * _1740;
    if (_1724)
    {
        float _1766 = _1698 * _1690;
        _152 = _1766;
    }
    float _1768 = _152;
    float _1770 = _1754 * 18.84955596923828125;
    float _1772 = _1756 * _1760;
    float _1774 = fma(_1428, _1522, _1686);
    float _1776 = fma(_1758, _1768, _1762);
    float _1778 = _1764 * (-2.0);
    float _1780 = in.m_69.x;
    float _1782 = in.m_69.y;
    float _1784 = in.m_69.z;
    float _1786 = _1770 * 0.15915493667125701904296875;
    float _1788 = _1164 + (-0.5);
    float _1790 = fma(_1778, _1656, _1656);
    float _1792 = in.m_71.x;
    float _1794 = in.m_71.y;
    float _1796 = in.m_71.z;
    float _1798 = _1772 * (-2.0);
    float _1800 = fma(_1356, _1778, _1356);
    float _1802 = fma(_1788, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1790);
    float _1804 = _1168 + (-0.5);
    float _1806 = fma(_1798, _1660, _1660);
    float _1808 = fma(_1482, _1506, _1774);
    float _1810 = fma(_1396, _1798, _1396);
    float _1812 = fma(_1800, _1768, _1802);
    float _1814 = fma(_1804, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1806);
    float _1816 = fma(_1484, _1476, _1808);
    float _1818 = in.m_73.x;
    float _1820 = in.m_73.y;
    float _1822 = in.m_73.z;
    float _1824 = _1786 * 6.283185482025146484375;
    float _1826 = sin(_1824);
    float _1828 = fma(_1810, _1768, _1814);
    float _1830 = fma(_1520, _1408, _1816);
    float _1832 = _1776 * 0.15915493667125701904296875;
    float _1834 = _1812 * 0.15915493667125701904296875;
    float _1836 = _1828 * 0.15915493667125701904296875;
    float _1838 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1830);
    float _1840 = _450 * _170;
    float _1842 = _1832 * 6.283185482025146484375;
    float _1844 = sin(_1842);
    float _1846 = _450 * _186;
    float _1848 = _788 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1850 = fma(_448, _168, _1840);
    float _1852 = -_1780;
    float _1854 = _1852 + _1792;
    float _1856 = _450 * _162;
    float _1858 = fma(_452, _172, _1850);
    float _1860 = _1832 * 6.283185482025146484375;
    float _1862 = cos(_1860);
    float _1864 = fma(_1838, _1854, _1780);
    float _1866 = -_1782;
    float _1868 = _1866 + _1794;
    float _1870 = -_1784;
    float _1872 = _1870 + _1796;
    float _1874 = _1826 * 0.0500000007450580596923828125;
    float _1876 = fma(_448, _160, _1856);
    float _1878 = fma(_1838, _1868, _1782);
    float _1880 = fma(_1838, _1872, _1784);
    float _1882 = _1836 * 6.283185482025146484375;
    float _1884 = cos(_1882);
    float _1886 = fma(_448, _184, _1846);
    float _1888 = fma(_1874, _1818, _1864);
    float _1890 = fma(_1874, _1820, _1878);
    float _1892 = fma(_1874, _1822, _1880);
    float _1894 = _786 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1896 = fma(_452, _188, _1886);
    float _1898 = _1834 * 6.283185482025146484375;
    float _1900 = cos(_1898);
    float _1902 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1890);
    float _1904 = fma(_452, _164, _1876);
    bool _1906 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1908 = isnan(0.5);
    bool _1910 = _1906 || _1908;
    bool _1912 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1914 = _1910 || _1912;
    float _1916 = _1834 * 6.283185482025146484375;
    float _1918 = sin(_1916);
    float _1920 = _1862 * _1884;
    float _1922 = _1836 * 6.283185482025146484375;
    float _1924 = sin(_1922);
    float _1926 = _1900 * _1862;
    float _1928 = _1900 * _1844;
    float _1930 = _1900 * _1884;
    float _1932 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1888);
    float _1934 = _1918 * _1862;
    float _1936 = _1918 * _1844;
    float _1938 = _1844 * _1884;
    float _1940 = _1848 * _1932;
    float _1942 = _1894 * _1902;
    float _1944 = in.m_55.w;
    float _1946 = _1918 * _1884;
    float _1948 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1892);
    float _1950 = fma(_1924, _1926, _1936);
    float _1952 = in.m_53.w;
    float _1954 = _1930 * _1942;
    float _1956 = _1172 * _1948;
    float _1958 = -_1942;
    float _1960 = _1924 * _1958;
    float _1962 = -_1934;
    float _1964 = fma(_1924, _1928, _1962);
    float _1966 = fma(_1950, _1940, _1954);
    float _1968 = -_1928;
    float _1970 = fma(_1924, _1934, _1968);
    float _1972 = _1946 * _1942;
    float _1974 = fma(_1920, _1940, _1960);
    float _1976 = fma(_1964, _1956, _1966);
    float _1978 = fma(_1924, _1936, _1926);
    float _1980 = fma(_1970, _1940, _1972);
    float _1982 = fma(_1938, _1956, _1974);
    float _1984 = _1976 * _410;
    float _1986 = fma(_1978, _1956, _1980);
    float _1988 = _1976 * _442;
    float _1990 = fma(_1982, _374, _1984);
    float _1992 = _1976 * _400;
    float _1994 = _1896 + _1944;
    float _1996 = fma(_1982, _366, _1988);
    float _1998 = fma(_1986, _438, _1990);
    float _2000 = fma(_1982, _370, _1992);
    float _2002 = _1858 + _1952;
    float _2004 = fma(_1986, _426, _1996);
    float _2006 = _1994 + _1998;
    float _2008 = fma(_1986, _430, _2000);
    float _2010 = _2002 + _2004;
    float _2012 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2014 = _2006 + _2012;
    float _2016 = in.m_51.w;
    float _2018 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2020 = _2010 + _2018;
    float _2022 = _2014 * _2014;
    float _2024 = fma(_2020, _2020, _2022);
    float _2026 = sqrt(_2024);
    float _2028 = _1904 + _2016;
    bool _2030 = _2026 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2032 = _2028 + _2008;
    float _2034 = _1876;
    float _2036 = _2024;
    float _2038 = _1982;
    float _2040 = _1820;
    float _2042 = _1818;
    float _2044 = _1822;
    if (!_2030)
    {
        _2034 = _2010;
    }
    float _2046 = _2034;
    float _2048 = _2046;
    if (!_2030)
    {
        _228 = _2006;
    }
    float _2050 = _228;
    float _2052 = _2050;
    if (!_2030)
    {
        _456 = _2032;
    }
    float _2054 = _456;
    bool _2056 = !_2030;
    float _2058 = _2054;
    if (!_2056)
    {
        float _2060 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2062 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2064 = _2026 + _2062;
        float _2066 = _2032 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2068 = rsqrt(_2024);
        float _2070 = _2064 * _2060;
        float _2072 = _2070 * 0.15915493667125701904296875;
        float _2074 = _2072 * 6.283185482025146484375;
        float _2076 = cos(_2074);
        float _2078 = _2072 * 6.283185482025146484375;
        float _2080 = sin(_2078);
        float _2082 = _2076 + (-1.0);
        float _2084 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2086 = fma(_2080, _2066, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2088 = fma(_2032, _2076, _2084);
        float _2090 = _2068 * _2086;
        float _2092 = fma(_2020, _2090, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2094 = fma(_2014, _2090, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2048 = _2092;
        _2052 = _2094;
        _2058 = _2088;
        _230 = _2090;
        _2036 = _2068;
    }
    float _2096 = _2048;
    float _2098 = _2052;
    float _2100 = _2058;
    float _2102 = _230;
    float _2104 = _2036;
    float _2106 = _2100;
    float _2108 = _2096;
    float _2110 = _2098;
    float _2112 = _2102;
    if (!_1914)
    {
        float _2114 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2116 = _2028 + _2114;
        float _2118 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2120 = _2002 + _2118;
        float _2122 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2124 = -_2002;
        float _2126 = _2124 + _2096;
        float _2128 = _2116 * _2116;
        float _2130 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2132 = _1994 + _2130;
        float _2134 = -_1994;
        float _2136 = _2134 + _2098;
        float _2138 = fma(_2120, _2120, _2128);
        float _2140 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2142 = fma(_2132, _2132, _2138);
        float _2144 = sqrt(_2142);
        float _2146 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2148 = precise::min(_2144, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2150 = _2148 * _2140;
        float _2152 = _2146 * _2150;
        float _2154 = -_2028;
        float _2156 = _2154 + _2100;
        float _2158 = fma(_2126, _2152, _2002);
        float _2160 = fma(_2156, _2152, _2028);
        float _2162 = fma(_2136, _2152, _1994);
        _2106 = _2160;
        _2108 = _2158;
        _2110 = _2162;
        _2112 = _2144;
    }
    float _2164 = _2106;
    float _2166 = _2108;
    float _2168 = _2110;
    float _2170 = _2112;
    float _2172 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2174 = _2164 + _2172;
    float _2176 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2178 = _2166 + _2176;
    float _2180 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2182 = _2168 + _2180;
    float _2184 = _2174 * _2174;
    float _2186 = fma(_2178, _2178, _2184);
    float _2188 = fma(_2182, _2182, _2186);
    float _2190 = rsqrt(_2188);
    float _2192 = sqrt(_2188);
    float _2194 = _2190 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2196 = _2178 * _2194;
    float _2198 = _2182 * _2194;
    float _2200 = _2196 * _2196;
    float _2202 = _2198 * _2198;
    float _2204 = _2200 + _2202;
    float _2206 = sqrt(_2204);
    bool _2208 = _2206 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2210 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2212 = _2206 + _2210;
    float _2214 = _2170;
    float _2216 = _2204;
    float _2218 = _2212;
    float _2220 = _2174;
    float _2222 = _2196;
    float _2224 = _2198;
    float _2226 = _2200;
    float _2228 = _2202;
    if (_2208)
    {
        float _2230 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2214 = _2230;
    }
    float _2232 = _2214;
    if (_2208)
    {
        float _2234 = rsqrt(_2204);
        _2216 = _2234;
    }
    float _2236 = _2216;
    if (_2208)
    {
        float _2238 = _2212 * _2232;
        _2218 = _2238;
    }
    float _2240 = _2218;
    if (_2208)
    {
        float _2242 = _2240 * 0.15915493667125701904296875;
        _2038 = _2242;
    }
    float _2244 = _2038;
    float _2246 = _2104;
    if (_2208)
    {
        float _2248 = _2244 * 6.283185482025146484375;
        float _2250 = sin(_2248);
        _2246 = _2250;
    }
    float _2252 = _2246;
    float _2254 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2256 = precise::max(0.0, _2254);
    float _2258 = _2232;
    float _2260 = _2256;
    if (_2208)
    {
        float _2262 = _2244 * 6.283185482025146484375;
        float _2264 = cos(_2262);
        _2258 = _2264;
    }
    float _2266 = _2258;
    float _2268 = -_2194;
    float _2270 = -_2256;
    float _2272 = fma(_2174, _2268, _2270);
    if (_2208)
    {
        float _2274 = _2272 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2220 = _2274;
    }
    float _2276 = _2220;
    float _2278 = _2252;
    float _2280 = _2276;
    if (_2208)
    {
        float _2282 = fma(_2252, _2276, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2278 = _2282;
    }
    float _2284 = _2278;
    float _2286 = _2284;
    if (!_2208)
    {
        _2280 = _2272;
    }
    float _2288 = _2280;
    float _2290 = _2288;
    if (_2208)
    {
        float _2292 = _2266 + (-1.0);
        _2260 = _2292;
    }
    float _2294 = _2260;
    float _2296 = _2294;
    if (_2208)
    {
        float _2298 = _2236 * _2284;
        _2286 = _2298;
    }
    float _2300 = _2286;
    if (_2208)
    {
        float _2302 = _2294 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2296 = _2302;
    }
    float _2304 = _2296;
    if (_2208)
    {
        float _2306 = _2196 * _2300;
        _2222 = _2306;
    }
    float _2308 = _2222;
    if (_2208)
    {
        float _2310 = _2198 * _2300;
        _2224 = _2310;
    }
    float _2312 = _2224;
    if (_2208)
    {
        float _2314 = fma(_2272, _2266, _2304);
        _2290 = _2314;
    }
    float _2316 = _2290;
    if (_2208)
    {
        float _2318 = _2308 * _2308;
        _2226 = _2318;
    }
    float _2320 = _2226;
    if (_2208)
    {
        float _2322 = _2312 * _2312;
        _2228 = _2322;
    }
    float _2324 = _2228;
    float _2326 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2328 = fma(_2316, _2316, _2320);
    float _2330 = _2164 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2332 = _2328 + _2324;
    float _2334 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2336 = fma(_2192, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2334);
    float _2338 = precise::clamp(_2336, 0.0, 1.0);
    float _2340 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2330);
    float _2342 = _2164 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2344 = _2164 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2346 = -_2338;
    float _2348 = _2346 + 1.0;
    float _2350 = rsqrt(_2332);
    float _2352 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2340);
    float _2354 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2342);
    float _2356 = _2164 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2358 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2344);
    float _2360 = _2352 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2362 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2354);
    float _2364 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2356);
    float _2366 = abs(_2348);
    float _2368 = log2(_2366);
    float _2370 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2358);
    float _2372 = _2362 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2374 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2364);
    float _2376 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2378 = _2370 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2380 = _2374 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2382 = _2350 * _2308;
    float _2384 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2386 = _2350 * _2316;
    float _2388 = -_2376;
    float _2390 = fma(_2388, _2326, 1.0);
    float _2392 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2394 = _2350 * _2312;
    float _2396 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2384);
    float _2398 = log2(_2390);
    float _2400 = -_2392;
    float _2402 = fma(_2386, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2400);
    float _2404 = _2368 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2406 = fma(_2360, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2396);
    float _2408 = _2386 + 1.0;
    float _2410 = -_2394;
    float _2412 = fma(_2410, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2402);
    float _2414 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2416 = fma(_2372, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2406);
    float _2418 = exp2(_2404);
    float _2420 = fma(_2412, -0.5, 0.5);
    float _2422 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2424 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2414);
    float _2426 = fma(_2412, 0.5, 0.5);
    float _2428 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2422);
    float _2430 = fma(_2360, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2424);
    float _2432 = 1.0 / _2416;
    float _2434 = fma(_2426, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2436 = fma(_2360, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2428);
    float _2438 = fma(_2372, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2430);
    float _2440 = fma(_2426, _2434, -0.212114393711090087890625);
    float _2442 = fma(_2372, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2436);
    float _2444 = sqrt(_2420);
    float _2446 = -_2386;
    float _2448 = fma(_2418, _2408, _2446);
    float _2450 = _2398 * 0.693147182464599609375;
    float _2452 = fma(_2426, _2440, 1.570728778839111328125);
    float _2454 = _2450 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2456 = _2438 * _2432;
    float _2458 = _2442 * _2432;
    float _2460 = fma(_2456, 0.5, 0.5);
    float _2462 = fma(_2458, -0.5, 0.5);
    float _2464 = _2444 * 0.636619746685028076171875;
    float3 _6775 = float3(_2460, _2462, _2454);
    float _2466 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6775, float3(0.0), isnan(_6775)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6775, float3(0.0), isnan(_6775)), level(0.0)).x;
    float _2468 = -_2452;
    float _2470 = fma(_2464, _2468, 1.0);
    float _2472 = fma(_2448, 0.5, 0.5);
    float3 _6793 = float3(_2460, _2462, _2454);
    float4 _2475 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6793, float3(0.0), isnan(_6793)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6793, float3(0.0), isnan(_6793)), level(0.0)).xyzw;
    float _2477 = _2475.x;
    float _2479 = _2475.y;
    float _2481 = _2475.z;
    float _2483 = _2475.w;
    float2 _6810 = float2(_2470, _2472);
    float3 _2487 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6810, float2(0.0), isnan(_6810)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6810, float2(0.0), isnan(_6810)), level(0.0)).xyz;
    float _2489 = _2487.x;
    float _2491 = _2487.y;
    float _2493 = _2487.z;
    float _2495 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2497 = _1164 > 0.5;
    float _2499 = _1894 * _1648;
    bool _2501 = _1168 > 0.5;
    float _2503 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2507 = _2505 != 0;
    float _2509 = -_2499;
    float _2511 = _2509 + 1.0;
    float _2513 = -_1646;
    float _2515 = _2513 + 1.0;
    float _2517 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2521 = _2519 != 0;
    float _2523 = in.m_71.w;
    int _2525 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2527 = _2525 != 0;
    float _2529 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2503);
    int _2531 = _2497 ? as_type<int>(_2515) : as_type<int>(_1646);
    int _2533 = _2501 ? as_type<int>(_2515) : as_type<int>(_1646);
    float _2535 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2537 = _1166 > 0.5;
    float _2539 = fma(_2360, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2529);
    float _2541 = _2521 ? as_type<float>(_2531) : _1646;
    float _2543 = _2527 ? as_type<float>(_2533) : _1646;
    bool _2545 = _1890 != 0.0;
    bool _2547 = isnan(_1890);
    bool _2549 = _2545 || _2547;
    bool _2551 = isnan(0.0);
    bool _2553 = _2549 || _2551;
    float _2555 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2559 = _2557 != 0;
    int _2561 = _2537 ? as_type<int>(_2511) : as_type<int>(_2499);
    bool _2563 = _1170 > 0.5;
    float _2565 = _2517 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2567 = _1888 == 0.0;
    bool _2569 = !_2553;
    bool _2571 = _2567 && _2569;
    float _2573 = _2535 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2575 = !_2559;
    float _2577 = _2575 ? _2499 : as_type<float>(_2561);
    float _2579 = fma(_2543, _2565, -0.5);
    float _2581 = _2499;
    float _2583 = _2416;
    float _2585 = _2442;
    if (_2507)
    {
        float _2587 = _2563 ? _2511 : _2499;
        _2581 = _2587;
    }
    float _2589 = _2581;
    float _2591 = _2495 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2593 = _1892 == 0.0;
    bool _2595 = _2593 && _2571;
    float _2597 = fma(_2577, _2573, -0.5);
    out.m_75.w = _2523;
    float _2599 = _2555 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2601 = fma(_2541, _2591, -0.5);
    float _2603 = fma(_1744, _2579, _1752);
    float _2605 = fma(_2589, _2599, -0.5);
    float _2607 = fma(_1746, _2601, _1696);
    float _2609 = -_1666;
    float _2611 = fma(_1748, _2597, _2609);
    float _2613 = _2603 + 0.5;
    float _2615 = -_1700;
    float _2617 = fma(_1708, _2605, _2615);
    float _2619 = _2607 + 0.5;
    float _2621 = _2611 + 0.5;
    if (!_2595)
    {
        float _2623 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1820);
        _2040 = _2623;
    }
    float _2625 = _2040;
    float _2627 = _2617 + 0.5;
    float _2629 = _2368 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_2595)
    {
        float _2631 = fma(_1888, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1818);
        _2042 = _2631;
    }
    float _2633 = _2042;
    float _2635 = -_2625;
    float _2637 = _1924 * _2635;
    float _2639 = _1930 * _2625;
    out.m_77.x = _2619;
    out.m_77.y = _2621;
    out.m_77.z = _2613;
    out.m_77.w = _2627;
    float _2641 = _1946 * _2625;
    if (!_2595)
    {
        float _2643 = fma(_1892, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1822);
        _2044 = _2643;
    }
    float _2645 = _2044;
    float _2647 = fma(_1920, _2633, _2637);
    float _2649 = fma(_1950, _2633, _2639);
    float _2651 = fma(_1970, _2633, _2641);
    float _2653 = fma(_2372, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2539);
    float _2655 = fma(_1938, _2645, _2647);
    float _2657 = fma(_1964, _2645, _2649);
    float _2659 = fma(_1978, _2645, _2651);
    float _2661 = _2657 * _400;
    float _2663 = _2657 * _410;
    float _2665 = exp2(_2629);
    float _2667 = _2657 * _442;
    float _2669 = _2653 + _2416;
    float _2671 = fma(_2655, _370, _2661);
    float _2673 = fma(_2655, _374, _2663);
    float _2675 = fma(_2655, _366, _2667);
    float _2677 = _2669 * 0.5;
    bool _2679 = _2192 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2681 = isnan(_2192);
    bool _2683 = _2679 || _2681;
    bool _2685 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2687 = _2683 || _2685;
    float _2689 = fma(_2659, _426, _2675);
    float _2691 = fma(_2659, _430, _2671);
    float _2693 = fma(_2659, _438, _2673);
    out.m_79.z = _2677;
    out.m_79.w = _2416;
    float _2695 = -_2665;
    float _2697 = _2695 + 1.0;
    out.m_81.x = _2689;
    out.m_81.y = _2691;
    out.m_81.z = _2693;
    float _2699 = _2697 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2438;
    out.gl_Position.y = _2442;
    out.gl_Position.z = _2653;
    out.gl_Position.w = _2416;
    float _2701 = _2697;
    float _2703 = _2653;
    float _2705 = _2438;
    if (!_2687)
    {
        _2701 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2707 = _2701;
    float _2709 = _2707;
    float _2711 = _2707;
    if (!_2687)
    {
        _2583 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2713 = _2583;
    float _2715 = _2713;
    float _2717 = _2713;
    if (!_2687)
    {
        _2703 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2719 = _2703;
    float _2721 = _2719;
    float _2723 = _2719;
    if (!_2687)
    {
        _2585 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2725 = _2585;
    float _2727 = _2725;
    float _2729 = _2725;
    if (!_2687)
    {
        _2705 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2731 = _2705;
    float _2733 = _2699 * _2466;
    float _2735 = -_2699;
    float _2737 = _2735 + 1.0;
    float _2739 = _2483 * _2733;
    float _2741 = _2483 * _2737;
    float _2743 = _2493 * _2733;
    float _2745 = fma(_2489, _2739, _2477);
    float _2747 = fma(_2491, _2739, _2479);
    float _2749 = _2477;
    float _2751 = _2731;
    float _2753 = _2731;
    if (!_2687)
    {
        _2749 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2755 = _2749;
    float _2757 = fma(_2483, _2743, _2481);
    out.m_83.x = _2745;
    out.m_83.y = _2747;
    out.m_83.z = _2757;
    out.m_83.w = _2741;
    bool _2759 = !_2687;
    float _2761 = _2755;
    float _2763 = _2755;
    if (!_2759)
    {
        bool _2765 = _2192 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2767 = isnan(_2192);
        bool _2769 = _2765 || _2767;
        bool _2771 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2773 = _2769 || _2771;
        if (!_2773)
        {
            float _2775 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2777 = _2192 + _2775;
            float _2779 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2781 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2779;
            float _2783 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2785 = _2783 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2787 = 1.0 / _2781;
            float _2789 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2791 = _2789 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2793 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2795 = _2793 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2797 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2799 = _2797 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2801 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2803 = _2801 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2805 = _2777 * _2787;
            float _2807 = precise::clamp(_2805, 0.0, 1.0);
            float _2809 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2811 = _2809 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2813 = fma(_2807, _2785, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2815 = fma(_2807, _2811, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2817 = fma(_2807, _2791, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2819 = fma(_2807, _2795, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2821 = fma(_2807, _2799, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2823 = fma(_2807, _2803, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2717 = _2817;
            _2753 = _2821;
            _2763 = _2813;
            _2729 = _2819;
            _2723 = _2815;
            _2711 = _2823;
            _2825 = true;
        }
        else
        {
            bool _2827 = _2192 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2829 = isnan(_2192);
            bool _2831 = _2827 || _2829;
            bool _2833 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2835 = _2831 || _2833;
            if (!_2835)
            {
                _2761 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2837 = _2761;
            _2763 = _2837;
            if (!_2835)
            {
                _2715 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2839 = _2715;
            _2717 = _2839;
            if (!_2835)
            {
                _2721 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2841 = _2721;
            _2723 = _2841;
            if (!_2835)
            {
                _2727 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2843 = _2727;
            _2729 = _2843;
            if (!_2835)
            {
                _2751 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2845 = _2751;
            _2753 = _2845;
            if (!_2835)
            {
                _2709 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2847 = _2709;
            bool _2849 = !_2835;
            _2711 = _2847;
            if (!_2849)
            {
                bool _2851 = _2192 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2853 = isnan(_2192);
                bool _2855 = _2851 || _2853;
                bool _2857 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2859 = _2855 || _2857;
                if (!_2859)
                {
                    float _2861 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2863 = _2192 + _2861;
                    float _2865 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2867 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2865;
                    float _2869 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2871 = _2869 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2873 = 1.0 / _2867;
                    float _2875 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2877 = _2875 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2879 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2881 = _2879 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2883 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2885 = _2883 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2887 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2889 = _2887 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2891 = _2863 * _2873;
                    float _2893 = precise::clamp(_2891, 0.0, 1.0);
                    float _2895 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2897 = _2895 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2899 = fma(_2893, _2871, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2901 = fma(_2893, _2897, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2903 = fma(_2893, _2877, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2905 = fma(_2893, _2881, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2907 = fma(_2893, _2885, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2909 = fma(_2893, _2889, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2717 = _2903;
                    _2753 = _2907;
                    _2763 = _2899;
                    _2729 = _2905;
                    _2723 = _2901;
                    _2711 = _2909;
                    _2825 = true;
                }
                else
                {
                    _2717 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2753 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2763 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2729 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2723 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2711 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2825 = false;
    float _2911 = _2717;
    float _2913 = _2753;
    float _2915 = _2763;
    float _2917 = _2729;
    float _2919 = _2723;
    float _2921 = _2711;
    float _2923 = fma(_2691, -0.5, 0.5);
    float _2925 = precise::clamp(_2923, 0.0, 1.0);
    float _2927 = -_2911;
    float _2929 = _2927 + _2913;
    float _2931 = -_2915;
    float _2933 = _2931 + _2917;
    float _2935 = -_2919;
    float _2937 = _2935 + _2921;
    bool _2939 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2941 = fma(_2925, _2929, _2911);
    float _2943 = fma(_2925, _2933, _2915);
    float _2945 = fma(_2925, _2937, _2919);
    float _2947 = _2941 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _2949 = fma(_2943, 0.298911988735198974609375, _2947);
    float _2951 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2953 = fma(_2945, 0.114477999508380889892578125, _2949);
    out.m_85.w = _2951;
    float _2955 = -_2953;
    float _2957 = _2943 + _2955;
    float _2959 = -_2953;
    float _2961 = _2941 + _2959;
    float _2963 = -_2953;
    float _2965 = _2945 + _2963;
    out.m_87.x = 0.0;
    float _2967 = fma(_2957, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2953);
    float _2969 = fma(_2961, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2953);
    float _2971 = fma(_2965, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2953);
    out.m_89.x = _2967;
    out.m_89.y = _2969;
    out.m_89.z = _2971;
    if (!_2939)
    {
        return out;
    }
    float _2973 = -_2164;
    float _2975 = _2973 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2977 = -_2166;
    float _2979 = _2977 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2981 = -_2168;
    float _2983 = _2981 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2985 = _2975 * _2975;
    float _2987 = fma(_2979, _2979, _2985);
    float _2989 = fma(_2983, _2983, _2987);
    float _2991 = sqrt(_2989);
    float _2993 = rsqrt(_2989);
    float _2995 = -_2991;
    float _2997 = _2995 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2999 = _2997 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3001 = precise::clamp(_2999, 0.0, 1.0);
    float _3003 = _2979 * _2993;
    float _3005 = _2975 * _2993;
    float _3007 = abs(_3001);
    float _3009 = log2(_3007);
    float _3011 = _2983 * _2993;
    float _3013 = _3003 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3015 = _2691 * _3005;
    float _3017 = -_3005;
    float _3019 = -_3013;
    float _3021 = fma(_3017, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3019);
    float _3023 = fma(_2689, _3003, _3015);
    float _3025 = -_3011;
    float _3027 = fma(_3025, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3021);
    float _3029 = fma(_2693, _3011, _3023);
    float _3031 = precise::clamp(_3029, 0.0, 1.0);
    float _3033 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3035 = _3027 + _3033;
    float _3037 = _3009 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3039 = _3035 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3041 = precise::clamp(_3039, 0.0, 1.0);
    float _3043 = exp2(_3037);
    float _3045 = _3043 * _3041;
    float _3047 = _3031 * _3045;
    float _3049 = _3047 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3051 = _3047 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3053 = _3047 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _3049;
    out.m_87.y = _3051;
    out.m_87.z = _3053;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2825 = false;
    bool _1160 = false;
    bool _1040 = false;
    bool _866 = false;
    bool _746 = false;
    bool _476 = false;
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
    float _116 = as_type<float>(_108);
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _114;
    if (!_112)
    {
        out.m_47.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3111 = as_type<float>(_124);
        out.gl_Position.z = _3111;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_49.w;
    float _130 = float(_108);
    float _132 = -_128;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_128);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    bool _146 = _134 >= _130;
    bool _148 = !_144;
    bool _150 = _146 || _148;
    float _152 = _134;
    if (_150)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _116;
    if (_150)
    {
        out.m_47.x = 0.0;
    }
    if (_150)
    {
        float _156 = _154 * 5.0;
        _126 = as_type<int>(_156);
    }
    int _158 = _126;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3175 = as_type<float>(_158);
        out.gl_Position.z = _3175;
    }
    if (_150)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _160 = in.m_51.x;
    float _162 = in.m_51.y;
    float _164 = in.m_51.z;
    float _166 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _168 = in.m_53.x;
    float _170 = in.m_53.y;
    float _172 = in.m_53.z;
    bool _174 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _176 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _178 = _174 || _176;
    bool _180 = isnan(1.0);
    bool _182 = _178 || _180;
    float _184 = in.m_55.x;
    float _186 = in.m_55.y;
    float _188 = in.m_55.z;
    float _190 = in.m_49.x;
    float _192 = in.m_49.y;
    float _194 = in.m_49.z;
    float _196 = _160 * _160;
    float _198 = _162 * _162;
    float _200 = _164 * _164;
    float _202 = fma(_168, _168, _196);
    float _204 = fma(_170, _170, _198);
    float _206 = fma(_172, _172, _200);
    float _208 = fma(_184, _184, _202);
    float _210 = fma(_186, _186, _204);
    float _212 = fma(_188, _188, _206);
    float _214 = sqrt(_208);
    float _216 = sqrt(_210);
    bool _218 = _214 > 0.0;
    float _220 = sqrt(_212);
    float _222 = _214;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _226 = _212;
    float _228 = _164;
    float _230 = _162;
    if (!_182)
    {
        float _232 = _166 * _166;
        float _234 = _232 * 0.5;
        _222 = _234;
    }
    float _236 = _222;
    float _238 = _236;
    if (!_182)
    {
        float _240 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _238 = _240;
    }
    float _242 = _238;
    bool _244 = _216 > 0.0;
    float _246 = 0.0;
    float _248 = _242;
    if (_218)
    {
        float _250 = rsqrt(_208);
        _246 = _250;
    }
    float _252 = _246;
    bool _254 = _220 > 0.0;
    float _256 = _220;
    if (!_182)
    {
        _256 = _166;
    }
    float _258 = _256;
    float _260 = 0.0;
    float _262 = _258;
    if (_244)
    {
        float _264 = rsqrt(_210);
        _260 = _264;
    }
    float _266 = _260;
    bool _268 = !_182;
    float _270 = _252;
    if (!_268)
    {
        float _272 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _274 = log2(_272);
        float _276 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _278 = _276 + 1.0;
        float _280 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _282 = _166 * _274;
        float _284 = 1.0 / _278;
        float _286 = _280 * 0.693147182464599609375;
        float _288 = exp2(_282);
        float _290 = 1.0 / _286;
        float _292 = _288 + (-1.0);
        float _294 = -_292;
        float _296 = fma(_294, _290, _166);
        float _298 = _296 * _284;
        float _300 = _298 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _248 = _300;
    }
    float _302 = _248;
    bool _304 = !_182;
    if (!_304)
    {
        float _306 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _308 = log2(_306);
        float _310 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _312 = _310 + 1.0;
        float _314 = 1.0 / _312;
        float _316 = _166 * _308;
        float _318 = exp2(_316);
        float _320 = -_318;
        float _322 = _320 + 1.0;
        float _324 = _322 * _314;
        _262 = _324;
        _224 = _312;
    }
    float _326 = _262;
    float _328 = _224;
    float _330 = in.m_57.w;
    float _332 = 0.0;
    float _334 = _328;
    if (!_218)
    {
        _332 = 0.0;
    }
    float _336 = _332;
    float _338 = 0.0;
    float _340 = _336;
    if (_254)
    {
        float _342 = rsqrt(_212);
        _338 = _342;
    }
    float _344 = _338;
    float _346 = 0.0;
    if (!_218)
    {
        _346 = 0.0;
    }
    float _348 = _346;
    float _350 = in.m_44.x;
    float _352 = in.m_44.y;
    float _354 = in.m_44.z;
    float _356 = 0.0;
    float _358 = _348;
    if (!_218)
    {
        _356 = 0.0;
    }
    float _360 = _356;
    float _362 = _360;
    if (_218)
    {
        float _364 = _252 * _168;
        _340 = _364;
    }
    float _366 = _340;
    if (_218)
    {
        float _368 = _252 * _160;
        _358 = _368;
    }
    float _370 = _358;
    if (_218)
    {
        float _372 = _252 * _184;
        _362 = _372;
    }
    float _374 = _362;
    bool _376 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _378 = 1.0 / _130;
    float _380 = _302 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _382 = 0.0;
    float _384 = 0.0;
    if (!_244)
    {
        _382 = 0.0;
        _384 = 0.0;
    }
    float _386 = _382;
    float _388 = _384;
    float _390 = _388;
    float _392 = _386;
    if (!_254)
    {
        _334 = 0.0;
    }
    float _394 = _334;
    float _396 = _394;
    if (_244)
    {
        float _398 = _266 * _162;
        _390 = _398;
    }
    float _400 = _390;
    float _402 = fma(_326, _192, _380);
    if (!_254)
    {
        _270 = 0.0;
    }
    float _404 = _270;
    float _406 = _404;
    if (_244)
    {
        float _408 = _266 * _186;
        _392 = _408;
    }
    float _410 = _392;
    if (!_254)
    {
        _226 = 0.0;
    }
    float _412 = _226;
    float _414 = _302 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _416 = 0.0;
    float _418 = _412;
    if (!_244)
    {
        _416 = 0.0;
    }
    float _420 = _416;
    float _422 = _420;
    if (_254)
    {
        float _424 = _344 * _172;
        _396 = _424;
    }
    float _426 = _396;
    if (_254)
    {
        float _428 = _344 * _164;
        _406 = _428;
    }
    float _430 = _406;
    float _432 = fma(_326, _190, _414);
    float _434 = _302 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (_254)
    {
        float _436 = _344 * _188;
        _418 = _436;
    }
    float _438 = _418;
    if (_244)
    {
        float _440 = _266 * _170;
        _422 = _440;
    }
    float _442 = _422;
    float _444 = _134 * _378;
    float _446 = fma(_326, _194, _434);
    float _448 = fma(_432, _330, _350);
    float _450 = fma(_402, _330, _352);
    float _452 = fma(_446, _330, _354);
    bool _454 = !_376;
    float _456 = _448;
    float _474;
    if (!_454)
    {
        float _458 = in.m_59.x;
        float _460 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _462 = _458 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _464 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _466 = _464 * _460;
        float _468 = floor(_466);
        float _470 = -_468;
        float _472 = _466 + _470;
        _474 = _472;
        _476 = true;
    }
    else
    {
        _474 = _444;
    }
    _476 = false;
    float _478 = _474;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _482 = _478 + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _486 = _478 + _484;
    bool _488 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _490 = isnan(_478);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _496 = _492 || _494;
    float _498 = float(_496);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _500;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _516 = 1.0 / _502;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _520 = _478 + _518;
    bool _522 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _524 = isnan(_478);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = 1.0 / _506;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _538 = _478 + _536;
    bool _540 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _542 = isnan(_478);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = 1.0 / _514;
    float _554 = _482 * _516;
    bool _556 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _558 = isnan(_478);
    bool _560 = _556 || _558;
    bool _562 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _564 = _560 || _562;
    float _566 = float(_564);
    bool _568 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _570 = 1.0 / _510;
    float _572 = _486 * _534;
    float _574 = -_498;
    float _576 = _574 + 1.0;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _578;
    float _582 = fma(_580, _554, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _584 = _538 * _552;
    bool _586 = _478 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _588 = isnan(_478);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = -_566;
    float _600 = _598 + 1.0;
    float _602 = _566 * _576;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _612 = -_596;
    float _614 = _612 + 1.0;
    float _616 = _520 * _570;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _618;
    float _622 = _532 * _600;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _624;
    float _628 = -_532;
    float _630 = _628 + 1.0;
    float _632 = _498 * _614;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _638 = fma(_620, _554, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _640 = fma(_626, _554, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _642 = _550 * _630;
    float _644 = fma(_606, _572, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _646 = fma(_636, _572, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _648 = fma(_610, _572, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _650 = _638 * _642;
    float _652 = _640 * _642;
    float _654 = -_550;
    float _656 = _654 + 1.0;
    float _658 = _582 * _642;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _662 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _660;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _664;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _668;
    float _672 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[143].x, _650);
    float _674 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[143].y, _652);
    float _676 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[143].z, _658);
    float _678 = fma(_662, _616, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _680 = fma(_666, _616, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _682 = fma(_670, _616, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _684 = fma(_644, _622, _672);
    float _686 = fma(_648, _622, _676);
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _690 = _688 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _696 = fma(_646, _622, _674);
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _702 = fma(_678, _602, _684);
    float _704 = fma(_690, _584, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _706 = fma(_694, _584, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _708 = fma(_700, _584, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _710 = fma(_680, _602, _696);
    float _712 = fma(_682, _602, _686);
    float _714 = fma(_704, _632, _702);
    float _716 = fma(_706, _632, _710);
    float _718 = fma(_708, _632, _712);
    float _720 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[147].x, _714);
    float _722 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[147].y, _716);
    float _724 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[147].z, _718);
    bool _726 = !_568;
    float _744;
    if (!_726)
    {
        float _728 = in.m_59.x;
        float _730 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _732 = _728 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _734 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[11].x, _134);
        float _736 = _734 * _730;
        float _738 = floor(_736);
        float _740 = -_738;
        float _742 = _736 + _740;
        _744 = _742;
        _746 = true;
    }
    else
    {
        _744 = _444;
    }
    _746 = false;
    float _748 = _744;
    float _750 = in.m_57.x;
    float _752 = in.m_57.y;
    float _754 = in.m_57.z;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _758 = _748 + _756;
    bool _760 = _748 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _762 = isnan(_748);
    bool _764 = _760 || _762;
    bool _766 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _768 = _764 || _766;
    float _770 = float(_768);
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _772;
    bool _776 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _778 = -_770;
    float _780 = _778 + 1.0;
    float _782 = 1.0 / _774;
    float _784 = _724 * _754;
    float _786 = _722 * _752;
    float _788 = _720 * _750;
    float _790 = _758 * _782;
    bool _792 = _748 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _794 = isnan(_748);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _804;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _808;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _814 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _812;
    float _816 = _802 * _780;
    float _818 = fma(_806, _790, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _820 = fma(_814, _790, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _822 = fma(_810, _790, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _824 = -_802;
    float _826 = _824 + 1.0;
    float _828 = _818 * _816;
    float _830 = _820 * _816;
    float _832 = _822 * _816;
    float _834 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[107].x, _828);
    float _836 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[107].y, _830);
    float _838 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[107].z, _832);
    float _840 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[108].x, _834);
    float _842 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[108].y, _836);
    float _844 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[108].z, _838);
    bool _846 = !_776;
    float _864;
    if (!_846)
    {
        float _848 = in.m_59.x;
        float _850 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _852 = _848 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _854 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _856 = _854 * _850;
        float _858 = floor(_856);
        float _860 = -_858;
        float _862 = _856 + _860;
        _864 = _862;
        _866 = true;
    }
    else
    {
        _864 = _444;
    }
    _866 = false;
    float _868 = _864;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _872 = _868 + _870;
    float _874 = _840 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _878 = _876 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _884 = _868 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _886 = isnan(_868);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _898 = _896 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _900 = _868 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _902 = isnan(_868);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    float _912 = 1.0 / _878;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _914;
    float _918 = -_894;
    float _920 = _918 + 1.0;
    bool _922 = _868 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _924 = isnan(_868);
    bool _926 = _922 || _924;
    bool _928 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _930 = _926 || _928;
    float _932 = float(_930);
    float _934 = _842 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _936 = _844 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _938 = _874 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _940 = 1.0 / _882;
    float _942 = _934 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _944 = _936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _946 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _948 = 1.0 / _898;
    float _950 = _916 * _912;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _954 = _952 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _956 = _910 * _920;
    float _958 = -_910;
    float _960 = _958 + 1.0;
    float _962 = fma(_950, _872, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _964 = _868 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _966 = isnan(_868);
    bool _968 = _964 || _966;
    bool _970 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _972 = _968 || _970;
    float _974 = float(_972);
    float _976 = _932 * _960;
    float _978 = _954 * _940;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _980;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _986 = _868 + _984;
    float _988 = _962 * _976;
    float _990 = -_932;
    float _992 = _990 + 1.0;
    float _994 = -_974;
    float _996 = _994 + 1.0;
    float _998 = fma(_978, _986, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1000 = _982 * _948;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1004 = _868 + _1002;
    float _1006 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[115].x, _988);
    float _1008 = _894 * _996;
    float _1010 = fma(_1000, _1004, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1012 = fma(_998, _956, _1006);
    float _1014 = fma(_1010, _1008, _1012);
    float _1016 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1014);
    float _1018 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _938;
    out.m_61.y = _942;
    out.m_61.z = _944;
    out.m_61.w = _1018;
    bool _1020 = !_946;
    float _1038;
    if (!_1020)
    {
        float _1022 = in.m_59.x;
        float _1024 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1026 = _1022 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1028 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[11].z, _134);
        float _1030 = _1028 * _1024;
        float _1032 = floor(_1030);
        float _1034 = -_1032;
        float _1036 = _1030 + _1034;
        _1038 = _1036;
        _1040 = true;
    }
    else
    {
        _1038 = _444;
    }
    _1040 = false;
    float _1042 = _1038;
    float _1044 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1046 = _1042 + _1044;
    bool _1048 = _1042 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1050 = isnan(_1042);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1056 = _1052 || _1054;
    float _1058 = float(_1056);
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1060;
    bool _1064 = _1042 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1066 = isnan(_1042);
    bool _1068 = _1064 || _1066;
    bool _1070 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1072 = _1068 || _1070;
    float _1074 = float(_1072);
    float _1076 = -_1058;
    float _1078 = _1076 + 1.0;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1082 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1080;
    float _1084 = 1.0 / _1062;
    bool _1086 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1088 = _1074 * _1078;
    float _1090 = -_1074;
    float _1092 = _1090 + 1.0;
    float _1094 = _1046 * _1084;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1096;
    float _1100 = fma(_1082, _1094, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1102;
    float _1106 = fma(_1098, _1094, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1108 = _1100 * _1088;
    float _1110 = fma(_1104, _1094, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1112 = _1106 * _1088;
    float _1114 = _1110 * _1088;
    float _1116 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1108);
    float _1118 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1114);
    float _1120 = fma(_1092, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1112);
    float _1122 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1116);
    float _1124 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1118);
    float _1126 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1120);
    float _1128 = _1122 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1130 = _1124 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1132 = _1126 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1134 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1136 = _1130 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1138 = _1132 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.x = _1134;
    out.m_63.y = _1136;
    out.m_63.z = _1138;
    bool _1140 = !_1086;
    float _1158;
    if (!_1140)
    {
        float _1142 = in.m_59.x;
        float _1144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1146 = _1142 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1148 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[14].x, _134);
        float _1150 = _1148 * _1144;
        float _1152 = floor(_1150);
        float _1154 = -_1152;
        float _1156 = _1150 + _1154;
        _1158 = _1156;
        _1160 = true;
    }
    else
    {
        _1158 = _444;
    }
    _1160 = false;
    float _1162 = _1158;
    float _1164 = in.m_59.x;
    float _1166 = in.m_59.y;
    float _1168 = in.m_59.z;
    float _1170 = in.m_59.w;
    float _1172 = _784 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1176 = _1174 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1180 = _1178 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1182 = 1.0 / _1176;
    int _1184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1186 = _1184 != 0;
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1190 = _1188 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1192 = 1.0 / _1180;
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1196 = _1194 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1200;
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1206 = _1204 != 0;
    int _1208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1210 = _1208 != 0;
    int _1212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1214 = _1212 != 0;
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1218 = _1216 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1220 = _1164 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1222 = 1.0 / _1190;
    float _1224 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1226 = _1224 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1228 = -_1198;
    float _1230 = fma(_1220, 2.0, _1228);
    float _1232 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1234 = _1202 * _1182;
    float _1236 = 1.0 / _1218;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1240;
    float _1244 = fma(_1232, -2.0, _1238);
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1246;
    float _1250 = 1.0 / _1196;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1254 = _1252 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1256 = _1168 * 2.0;
    float _1258 = _1226 * _1222;
    float _1260 = _1164 * 2.0;
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1264 = _1262 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1268 = _1266 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _1270 = _1162 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1272 = isnan(_1162);
    bool _1274 = _1270 || _1272;
    bool _1276 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1278 = _1274 || _1276;
    float _1280 = float(_1278);
    float _1282 = 1.0 / _1254;
    float _1284 = _1242 * _1236;
    float _1286 = -_1280;
    float _1288 = _1286 + 1.0;
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1290;
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1296 = _1294 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1298 = floor(_1256);
    float _1300 = _1166 + _1168;
    float _1302 = _1292 * _1250;
    float _1304 = _1166 * 2.0;
    float _1306 = _1296 * _1192;
    float _1308 = _1300 + (-1.0);
    float _1310 = floor(_1260);
    float _1312 = _1248 * _1282;
    float _1314 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1316 = _1166 + _1164;
    float _1318 = _1316 + (-1.0);
    float _1320 = floor(_1304);
    bool _1322 = _1298 > 0.0;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1326 = _1298 >= 0.0;
    bool _1328 = isnan(_1298);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan(0.0);
    bool _1334 = _1330 || _1332;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1338 = _1316;
    float _1340 = _1260;
    if (!_1186)
    {
        _1338 = _1166;
    }
    float _1342 = _1338;
    float _1344 = 1.0 / _1264;
    bool _1346 = _1310 >= 0.0;
    bool _1348 = isnan(_1310);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan(0.0);
    bool _1354 = _1350 || _1352;
    float _1356 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1360 = _1162 + _1358;
    int _1362 = _1334 ? 0 : 1;
    float _1364 = _1342;
    if (!_1186)
    {
        _1340 = _1168;
    }
    float _1366 = _1340;
    float _1368 = fma(_1302, _1360, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _1370 = _1320 > 0.0;
    float _1372 = _1168 + _1164;
    float _1374 = _1366;
    if (_1186)
    {
        _1364 = _1164;
    }
    float _1376 = _1364;
    if (_1186)
    {
        _1374 = _1166;
    }
    float _1378 = _1374;
    float _1380 = _1372 + (-1.0);
    bool _1382 = _1162 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1384 = isnan(_1162);
    bool _1386 = _1382 || _1384;
    bool _1388 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1390 = _1386 || _1388;
    float _1392 = float(_1390);
    float _1394 = _1268 * _1344;
    float _1396 = fma(_1380, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1398 = _1354 ? 0 : 1;
    float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1402 = _1162 + _1400;
    float _1404 = _1380;
    if (!_1186)
    {
        _1404 = _1168;
    }
    float _1406 = _1404;
    float _1408 = _1392 * _1288;
    bool _1410 = _1320 >= 0.0;
    bool _1412 = isnan(_1320);
    bool _1414 = _1410 || _1412;
    bool _1416 = isnan(0.0);
    bool _1418 = _1414 || _1416;
    float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1422 = _1162 + _1420;
    float _1424 = _1406;
    if (_1186)
    {
        _1424 = _1166;
    }
    float _1426 = _1424;
    float _1428 = fma(_1306, _1402, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _1430 = _1310 > 0.0;
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1434 = _1162 + _1432;
    float _1436 = fma(_1258, _1422, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1438 = _1162 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1440 = isnan(_1162);
    bool _1442 = _1438 || _1440;
    bool _1444 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1446 = _1442 || _1444;
    float _1448 = float(_1446);
    float _1450 = -_1392;
    float _1452 = _1450 + 1.0;
    float _1454 = fma(_1234, _1434, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1456 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1458 = _1162 + _1456;
    float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1462 = _1162 + _1460;
    bool _1464 = _1162 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1466 = isnan(_1162);
    bool _1468 = _1464 || _1466;
    bool _1470 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1472 = _1468 || _1470;
    float _1474 = float(_1472);
    float _1476 = _1448 * _1452;
    float _1478 = -_1448;
    float _1480 = _1478 + 1.0;
    float _1482 = fma(_1284, _1458, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1484 = fma(_1394, _1462, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _1486 = _1162 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1488 = isnan(_1162);
    bool _1490 = _1486 || _1488;
    bool _1492 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1494 = _1490 || _1492;
    float _1496 = float(_1494);
    float _1498 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1500 = _1162 + _1498;
    float _1502 = -_1474;
    float _1504 = _1502 + 1.0;
    float _1506 = _1474 * _1480;
    bool _1508 = _1162 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1510 = isnan(_1162);
    bool _1512 = _1508 || _1510;
    bool _1514 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1516 = _1512 || _1514;
    float _1518 = float(_1516);
    float _1520 = fma(_1312, _1500, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1522 = _1496 * _1504;
    float _1524 = -_1496;
    float _1526 = _1524 + 1.0;
    bool _1528 = _1162 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1530 = isnan(_1162);
    bool _1532 = _1528 || _1530;
    bool _1534 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1536 = _1532 || _1534;
    float _1538 = float(_1536);
    bool _1540 = _1162 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1542 = isnan(_1162);
    bool _1544 = _1540 || _1542;
    bool _1546 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1548 = _1544 || _1546;
    float _1550 = float(_1548);
    float _1552 = _1518 * _1526;
    float _1554 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1556 = log2(_1554);
    float _1558 = -_1518;
    float _1560 = _1558 + 1.0;
    int _1562 = ~_1362;
    int _1564 = _1562 + 1;
    int _1566 = _1564 + 1;
    int _1568 = _1566;
    if (!_1322)
    {
        int _1570 = ~_1362;
        int _1572 = _1570 + 1;
        _1568 = _1572;
    }
    int _1574 = _1568;
    float _1576 = _1550 * _1560;
    float _1578 = -_1550;
    float _1580 = _1578 + 1.0;
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1584 = ~_1398;
    int _1586 = _1584 + 1;
    int _1588 = _1586 + 1;
    float _1590 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1592 = _1588;
    if (!_1430)
    {
        int _1594 = ~_1398;
        int _1596 = _1594 + 1;
        _1592 = _1596;
    }
    int _1598 = _1592;
    float _1600 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1582);
    float _1602 = _1538 * _1580;
    float _1604 = _1376 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1606 = -_1538;
    float _1608 = _1606 + 1.0;
    float _1610 = _1556 * _134;
    float _1612 = _1454 * _1602;
    float _1614 = -_1324;
    float _1616 = fma(_1604, 2.0, _1614);
    int _1618 = _1418 ? 0 : 1;
    float _1620 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1622 = fma(_1608, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1612);
    float _1624 = exp2(_1610);
    float _1626 = _1378 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1628 = ~_1618;
    int _1630 = _1628 + 1;
    int _1632 = _1630 + 1;
    float _1634 = fma(_1164, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1620);
    float _1636 = fma(_1426, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1590);
    int _1638 = _1632;
    if (!_1370)
    {
        int _1640 = ~_1618;
        int _1642 = _1640 + 1;
        _1638 = _1642;
    }
    int _1644 = _1638;
    float _1646 = in.m_65.x;
    float _1648 = in.m_65.y;
    bool _1650 = !_1210;
    int _1652 = _1650 ? 0 : 1;
    float _1654 = fma(_1436, _1576, _1622);
    float _1656 = in.m_67.x;
    float _1658 = in.m_67.y;
    float _1660 = in.m_67.z;
    int _1662 = abs(_1652);
    float _1664 = fma(_1626, -2.0, _1336);
    float _1666 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1244);
    float _1668 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1670 = 1.0 + _1668;
    float _1672 = -_1624;
    float _1674 = _1672 + 1.0;
    bool _1676 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1678 = isnan(0.0);
    bool _1680 = _1676 || _1678;
    bool _1682 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1684 = _1680 || _1682;
    float _1686 = fma(_1368, _1552, _1654);
    float _1688 = float(_1662);
    float _1690 = 1.0 / _1670;
    float _1692 = float(_1598);
    float _1694 = -_134;
    float _1696 = fma(_1694, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1230);
    float _1698 = _1684 ? _1674 : 0.0;
    float _1700 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1664);
    float _1702 = _1688 * _1692;
    bool _1704 = !_1206;
    int _1706 = _1704 ? 0 : 1;
    float _1708 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1636);
    bool _1710 = !_1214;
    int _1712 = _1710 ? 0 : 1;
    float _1714 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1716 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1718 = isnan(1.0);
    bool _1720 = _1716 || _1718;
    bool _1722 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1724 = _1720 || _1722;
    float _1726 = fma(_444, 0.300000011920928955078125, _1646);
    int _1728 = abs(_1706);
    float _1730 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1714);
    int _1732 = abs(_1712);
    float _1734 = _1702 * (-2.0);
    float _1736 = float(_1728);
    float _1738 = _1166 + (-0.5);
    float _1740 = float(_1574);
    float _1742 = fma(_1734, _1658, _1658);
    float _1744 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1600);
    float _1746 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1634);
    float _1748 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1730);
    float _1750 = -_134;
    float _1752 = fma(_1750, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1616);
    float _1754 = _1726 + _1164;
    float _1756 = float(_1732);
    float _1758 = fma(_1314, _1734, _1314);
    float _1760 = float(_1644);
    float _1762 = fma(_1738, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1742);
    float _1764 = _1736 * _1740;
    if (_1724)
    {
        float _1766 = _1698 * _1690;
        _152 = _1766;
    }
    float _1768 = _152;
    float _1770 = _1754 * 18.84955596923828125;
    float _1772 = _1756 * _1760;
    float _1774 = fma(_1428, _1522, _1686);
    float _1776 = fma(_1758, _1768, _1762);
    float _1778 = _1764 * (-2.0);
    float _1780 = in.m_69.x;
    float _1782 = in.m_69.y;
    float _1784 = in.m_69.z;
    float _1786 = _1770 * 0.15915493667125701904296875;
    float _1788 = _1164 + (-0.5);
    float _1790 = fma(_1778, _1656, _1656);
    float _1792 = in.m_71.x;
    float _1794 = in.m_71.y;
    float _1796 = in.m_71.z;
    float _1798 = _1772 * (-2.0);
    float _1800 = fma(_1356, _1778, _1356);
    float _1802 = fma(_1788, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1790);
    float _1804 = _1168 + (-0.5);
    float _1806 = fma(_1798, _1660, _1660);
    float _1808 = fma(_1482, _1506, _1774);
    float _1810 = fma(_1396, _1798, _1396);
    float _1812 = fma(_1800, _1768, _1802);
    float _1814 = fma(_1804, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1806);
    float _1816 = fma(_1484, _1476, _1808);
    float _1818 = in.m_73.x;
    float _1820 = in.m_73.y;
    float _1822 = in.m_73.z;
    float _1824 = _1786 * 6.283185482025146484375;
    float _1826 = sin(_1824);
    float _1828 = fma(_1810, _1768, _1814);
    float _1830 = fma(_1520, _1408, _1816);
    float _1832 = _1776 * 0.15915493667125701904296875;
    float _1834 = _1812 * 0.15915493667125701904296875;
    float _1836 = _1828 * 0.15915493667125701904296875;
    float _1838 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1830);
    float _1840 = _450 * _170;
    float _1842 = _1832 * 6.283185482025146484375;
    float _1844 = sin(_1842);
    float _1846 = _450 * _186;
    float _1848 = _788 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1850 = fma(_448, _168, _1840);
    float _1852 = -_1780;
    float _1854 = _1852 + _1792;
    float _1856 = _450 * _162;
    float _1858 = fma(_452, _172, _1850);
    float _1860 = _1832 * 6.283185482025146484375;
    float _1862 = cos(_1860);
    float _1864 = fma(_1838, _1854, _1780);
    float _1866 = -_1782;
    float _1868 = _1866 + _1794;
    float _1870 = -_1784;
    float _1872 = _1870 + _1796;
    float _1874 = _1826 * 0.0500000007450580596923828125;
    float _1876 = fma(_448, _160, _1856);
    float _1878 = fma(_1838, _1868, _1782);
    float _1880 = fma(_1838, _1872, _1784);
    float _1882 = _1836 * 6.283185482025146484375;
    float _1884 = cos(_1882);
    float _1886 = fma(_448, _184, _1846);
    float _1888 = fma(_1874, _1818, _1864);
    float _1890 = fma(_1874, _1820, _1878);
    float _1892 = fma(_1874, _1822, _1880);
    float _1894 = _786 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1896 = fma(_452, _188, _1886);
    float _1898 = _1834 * 6.283185482025146484375;
    float _1900 = cos(_1898);
    float _1902 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1890);
    float _1904 = fma(_452, _164, _1876);
    bool _1906 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1908 = isnan(0.5);
    bool _1910 = _1906 || _1908;
    bool _1912 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1914 = _1910 || _1912;
    float _1916 = _1834 * 6.283185482025146484375;
    float _1918 = sin(_1916);
    float _1920 = _1862 * _1884;
    float _1922 = _1836 * 6.283185482025146484375;
    float _1924 = sin(_1922);
    float _1926 = _1900 * _1862;
    float _1928 = _1900 * _1844;
    float _1930 = _1900 * _1884;
    float _1932 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1888);
    float _1934 = _1918 * _1862;
    float _1936 = _1918 * _1844;
    float _1938 = _1844 * _1884;
    float _1940 = _1848 * _1932;
    float _1942 = _1894 * _1902;
    float _1944 = in.m_55.w;
    float _1946 = _1918 * _1884;
    float _1948 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1892);
    float _1950 = fma(_1924, _1926, _1936);
    float _1952 = in.m_53.w;
    float _1954 = _1930 * _1942;
    float _1956 = _1172 * _1948;
    float _1958 = -_1942;
    float _1960 = _1924 * _1958;
    float _1962 = -_1934;
    float _1964 = fma(_1924, _1928, _1962);
    float _1966 = fma(_1950, _1940, _1954);
    float _1968 = -_1928;
    float _1970 = fma(_1924, _1934, _1968);
    float _1972 = _1946 * _1942;
    float _1974 = fma(_1920, _1940, _1960);
    float _1976 = fma(_1964, _1956, _1966);
    float _1978 = fma(_1924, _1936, _1926);
    float _1980 = fma(_1970, _1940, _1972);
    float _1982 = fma(_1938, _1956, _1974);
    float _1984 = _1976 * _410;
    float _1986 = fma(_1978, _1956, _1980);
    float _1988 = _1976 * _442;
    float _1990 = fma(_1982, _374, _1984);
    float _1992 = _1976 * _400;
    float _1994 = _1896 + _1944;
    float _1996 = fma(_1982, _366, _1988);
    float _1998 = fma(_1986, _438, _1990);
    float _2000 = fma(_1982, _370, _1992);
    float _2002 = _1858 + _1952;
    float _2004 = fma(_1986, _426, _1996);
    float _2006 = _1994 + _1998;
    float _2008 = fma(_1986, _430, _2000);
    float _2010 = _2002 + _2004;
    float _2012 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2014 = _2006 + _2012;
    float _2016 = in.m_51.w;
    float _2018 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2020 = _2010 + _2018;
    float _2022 = _2014 * _2014;
    float _2024 = fma(_2020, _2020, _2022);
    float _2026 = sqrt(_2024);
    float _2028 = _1904 + _2016;
    bool _2030 = _2026 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2032 = _2028 + _2008;
    float _2034 = _1876;
    float _2036 = _2024;
    float _2038 = _1982;
    float _2040 = _1820;
    float _2042 = _1818;
    float _2044 = _1822;
    if (!_2030)
    {
        _2034 = _2010;
    }
    float _2046 = _2034;
    float _2048 = _2046;
    if (!_2030)
    {
        _228 = _2006;
    }
    float _2050 = _228;
    float _2052 = _2050;
    if (!_2030)
    {
        _456 = _2032;
    }
    float _2054 = _456;
    bool _2056 = !_2030;
    float _2058 = _2054;
    if (!_2056)
    {
        float _2060 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2062 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2064 = _2026 + _2062;
        float _2066 = _2032 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2068 = rsqrt(_2024);
        float _2070 = _2064 * _2060;
        float _2072 = _2070 * 0.15915493667125701904296875;
        float _2074 = _2072 * 6.283185482025146484375;
        float _2076 = cos(_2074);
        float _2078 = _2072 * 6.283185482025146484375;
        float _2080 = sin(_2078);
        float _2082 = _2076 + (-1.0);
        float _2084 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2086 = fma(_2080, _2066, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2088 = fma(_2032, _2076, _2084);
        float _2090 = _2068 * _2086;
        float _2092 = fma(_2020, _2090, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2094 = fma(_2014, _2090, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2048 = _2092;
        _2052 = _2094;
        _2058 = _2088;
        _230 = _2090;
        _2036 = _2068;
    }
    float _2096 = _2048;
    float _2098 = _2052;
    float _2100 = _2058;
    float _2102 = _230;
    float _2104 = _2036;
    float _2106 = _2100;
    float _2108 = _2096;
    float _2110 = _2098;
    float _2112 = _2102;
    if (!_1914)
    {
        float _2114 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2116 = _2028 + _2114;
        float _2118 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2120 = _2002 + _2118;
        float _2122 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2124 = -_2002;
        float _2126 = _2124 + _2096;
        float _2128 = _2116 * _2116;
        float _2130 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2132 = _1994 + _2130;
        float _2134 = -_1994;
        float _2136 = _2134 + _2098;
        float _2138 = fma(_2120, _2120, _2128);
        float _2140 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2142 = fma(_2132, _2132, _2138);
        float _2144 = sqrt(_2142);
        float _2146 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2148 = precise::min(_2144, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2150 = _2148 * _2140;
        float _2152 = _2146 * _2150;
        float _2154 = -_2028;
        float _2156 = _2154 + _2100;
        float _2158 = fma(_2126, _2152, _2002);
        float _2160 = fma(_2156, _2152, _2028);
        float _2162 = fma(_2136, _2152, _1994);
        _2106 = _2160;
        _2108 = _2158;
        _2110 = _2162;
        _2112 = _2144;
    }
    float _2164 = _2106;
    float _2166 = _2108;
    float _2168 = _2110;
    float _2170 = _2112;
    float _2172 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2174 = _2164 + _2172;
    float _2176 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2178 = _2166 + _2176;
    float _2180 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2182 = _2168 + _2180;
    float _2184 = _2174 * _2174;
    float _2186 = fma(_2178, _2178, _2184);
    float _2188 = fma(_2182, _2182, _2186);
    float _2190 = rsqrt(_2188);
    float _2192 = sqrt(_2188);
    float _2194 = _2190 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2196 = _2178 * _2194;
    float _2198 = _2182 * _2194;
    float _2200 = _2196 * _2196;
    float _2202 = _2198 * _2198;
    float _2204 = _2200 + _2202;
    float _2206 = sqrt(_2204);
    bool _2208 = _2206 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2210 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2212 = _2206 + _2210;
    float _2214 = _2170;
    float _2216 = _2204;
    float _2218 = _2212;
    float _2220 = _2174;
    float _2222 = _2196;
    float _2224 = _2198;
    float _2226 = _2200;
    float _2228 = _2202;
    if (_2208)
    {
        float _2230 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2214 = _2230;
    }
    float _2232 = _2214;
    if (_2208)
    {
        float _2234 = rsqrt(_2204);
        _2216 = _2234;
    }
    float _2236 = _2216;
    if (_2208)
    {
        float _2238 = _2212 * _2232;
        _2218 = _2238;
    }
    float _2240 = _2218;
    if (_2208)
    {
        float _2242 = _2240 * 0.15915493667125701904296875;
        _2038 = _2242;
    }
    float _2244 = _2038;
    float _2246 = _2104;
    if (_2208)
    {
        float _2248 = _2244 * 6.283185482025146484375;
        float _2250 = sin(_2248);
        _2246 = _2250;
    }
    float _2252 = _2246;
    float _2254 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2256 = precise::max(0.0, _2254);
    float _2258 = _2232;
    float _2260 = _2256;
    if (_2208)
    {
        float _2262 = _2244 * 6.283185482025146484375;
        float _2264 = cos(_2262);
        _2258 = _2264;
    }
    float _2266 = _2258;
    float _2268 = -_2194;
    float _2270 = -_2256;
    float _2272 = fma(_2174, _2268, _2270);
    if (_2208)
    {
        float _2274 = _2272 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2220 = _2274;
    }
    float _2276 = _2220;
    float _2278 = _2252;
    float _2280 = _2276;
    if (_2208)
    {
        float _2282 = fma(_2252, _2276, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2278 = _2282;
    }
    float _2284 = _2278;
    float _2286 = _2284;
    if (!_2208)
    {
        _2280 = _2272;
    }
    float _2288 = _2280;
    float _2290 = _2288;
    if (_2208)
    {
        float _2292 = _2266 + (-1.0);
        _2260 = _2292;
    }
    float _2294 = _2260;
    float _2296 = _2294;
    if (_2208)
    {
        float _2298 = _2236 * _2284;
        _2286 = _2298;
    }
    float _2300 = _2286;
    if (_2208)
    {
        float _2302 = _2294 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2296 = _2302;
    }
    float _2304 = _2296;
    if (_2208)
    {
        float _2306 = _2196 * _2300;
        _2222 = _2306;
    }
    float _2308 = _2222;
    if (_2208)
    {
        float _2310 = _2198 * _2300;
        _2224 = _2310;
    }
    float _2312 = _2224;
    if (_2208)
    {
        float _2314 = fma(_2272, _2266, _2304);
        _2290 = _2314;
    }
    float _2316 = _2290;
    if (_2208)
    {
        float _2318 = _2308 * _2308;
        _2226 = _2318;
    }
    float _2320 = _2226;
    if (_2208)
    {
        float _2322 = _2312 * _2312;
        _2228 = _2322;
    }
    float _2324 = _2228;
    float _2326 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2328 = fma(_2316, _2316, _2320);
    float _2330 = _2164 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2332 = _2328 + _2324;
    float _2334 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2336 = fma(_2192, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2334);
    float _2338 = precise::clamp(_2336, 0.0, 1.0);
    float _2340 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2330);
    float _2342 = _2164 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2344 = _2164 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2346 = -_2338;
    float _2348 = _2346 + 1.0;
    float _2350 = rsqrt(_2332);
    float _2352 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2340);
    float _2354 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2342);
    float _2356 = _2164 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2358 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2344);
    float _2360 = _2352 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2362 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2354);
    float _2364 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2356);
    float _2366 = abs(_2348);
    float _2368 = log2(_2366);
    float _2370 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2358);
    float _2372 = _2362 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2374 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2364);
    float _2376 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2378 = _2370 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2380 = _2374 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2382 = _2350 * _2308;
    float _2384 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2386 = _2350 * _2316;
    float _2388 = -_2376;
    float _2390 = fma(_2388, _2326, 1.0);
    float _2392 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2394 = _2350 * _2312;
    float _2396 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2384);
    float _2398 = log2(_2390);
    float _2400 = -_2392;
    float _2402 = fma(_2386, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2400);
    float _2404 = _2368 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2406 = fma(_2360, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2396);
    float _2408 = _2386 + 1.0;
    float _2410 = -_2394;
    float _2412 = fma(_2410, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2402);
    float _2414 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2416 = fma(_2372, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2406);
    float _2418 = exp2(_2404);
    float _2420 = fma(_2412, -0.5, 0.5);
    float _2422 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2424 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2414);
    float _2426 = fma(_2412, 0.5, 0.5);
    float _2428 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2422);
    float _2430 = fma(_2360, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2424);
    float _2432 = 1.0 / _2416;
    float _2434 = fma(_2426, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2436 = fma(_2360, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2428);
    float _2438 = fma(_2372, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2430);
    float _2440 = fma(_2426, _2434, -0.212114393711090087890625);
    float _2442 = fma(_2372, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2436);
    float _2444 = sqrt(_2420);
    float _2446 = -_2386;
    float _2448 = fma(_2418, _2408, _2446);
    float _2450 = _2398 * 0.693147182464599609375;
    float _2452 = fma(_2426, _2440, 1.570728778839111328125);
    float _2454 = _2450 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2456 = _2438 * _2432;
    float _2458 = _2442 * _2432;
    float _2460 = fma(_2456, 0.5, 0.5);
    float _2462 = fma(_2458, -0.5, 0.5);
    float _2464 = _2444 * 0.636619746685028076171875;
    float3 _6775 = float3(_2460, _2462, _2454);
    float _2466 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6775, float3(0.0), isnan(_6775)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6775, float3(0.0), isnan(_6775)), level(0.0)).x;
    float _2468 = -_2452;
    float _2470 = fma(_2464, _2468, 1.0);
    float _2472 = fma(_2448, 0.5, 0.5);
    float3 _6793 = float3(_2460, _2462, _2454);
    float4 _2475 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6793, float3(0.0), isnan(_6793)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6793, float3(0.0), isnan(_6793)), level(0.0)).xyzw;
    float _2477 = _2475.x;
    float _2479 = _2475.y;
    float _2481 = _2475.z;
    float _2483 = _2475.w;
    float2 _6810 = float2(_2470, _2472);
    float3 _2487 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6810, float2(0.0), isnan(_6810)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6810, float2(0.0), isnan(_6810)), level(0.0)).xyz;
    float _2489 = _2487.x;
    float _2491 = _2487.y;
    float _2493 = _2487.z;
    float _2495 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2497 = _1164 > 0.5;
    float _2499 = _1894 * _1648;
    bool _2501 = _1168 > 0.5;
    float _2503 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2507 = _2505 != 0;
    float _2509 = -_2499;
    float _2511 = _2509 + 1.0;
    float _2513 = -_1646;
    float _2515 = _2513 + 1.0;
    float _2517 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2521 = _2519 != 0;
    float _2523 = in.m_71.w;
    int _2525 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2527 = _2525 != 0;
    float _2529 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2503);
    int _2531 = _2497 ? as_type<int>(_2515) : as_type<int>(_1646);
    int _2533 = _2501 ? as_type<int>(_2515) : as_type<int>(_1646);
    float _2535 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2537 = _1166 > 0.5;
    float _2539 = fma(_2360, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2529);
    float _2541 = _2521 ? as_type<float>(_2531) : _1646;
    float _2543 = _2527 ? as_type<float>(_2533) : _1646;
    bool _2545 = _1890 != 0.0;
    bool _2547 = isnan(_1890);
    bool _2549 = _2545 || _2547;
    bool _2551 = isnan(0.0);
    bool _2553 = _2549 || _2551;
    float _2555 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2559 = _2557 != 0;
    int _2561 = _2537 ? as_type<int>(_2511) : as_type<int>(_2499);
    bool _2563 = _1170 > 0.5;
    float _2565 = _2517 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2567 = _1888 == 0.0;
    bool _2569 = !_2553;
    bool _2571 = _2567 && _2569;
    float _2573 = _2535 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2575 = !_2559;
    float _2577 = _2575 ? _2499 : as_type<float>(_2561);
    float _2579 = fma(_2543, _2565, -0.5);
    float _2581 = _2499;
    float _2583 = _2416;
    float _2585 = _2442;
    if (_2507)
    {
        float _2587 = _2563 ? _2511 : _2499;
        _2581 = _2587;
    }
    float _2589 = _2581;
    float _2591 = _2495 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2593 = _1892 == 0.0;
    bool _2595 = _2593 && _2571;
    float _2597 = fma(_2577, _2573, -0.5);
    out.m_75.w = _2523;
    float _2599 = _2555 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2601 = fma(_2541, _2591, -0.5);
    float _2603 = fma(_1744, _2579, _1752);
    float _2605 = fma(_2589, _2599, -0.5);
    float _2607 = fma(_1746, _2601, _1696);
    float _2609 = -_1666;
    float _2611 = fma(_1748, _2597, _2609);
    float _2613 = _2603 + 0.5;
    float _2615 = -_1700;
    float _2617 = fma(_1708, _2605, _2615);
    float _2619 = _2607 + 0.5;
    float _2621 = _2611 + 0.5;
    if (!_2595)
    {
        float _2623 = fma(_1890, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1820);
        _2040 = _2623;
    }
    float _2625 = _2040;
    float _2627 = _2617 + 0.5;
    float _2629 = _2368 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_2595)
    {
        float _2631 = fma(_1888, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1818);
        _2042 = _2631;
    }
    float _2633 = _2042;
    float _2635 = -_2625;
    float _2637 = _1924 * _2635;
    float _2639 = _1930 * _2625;
    out.m_77.x = _2619;
    out.m_77.y = _2621;
    out.m_77.z = _2613;
    out.m_77.w = _2627;
    float _2641 = _1946 * _2625;
    if (!_2595)
    {
        float _2643 = fma(_1892, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1822);
        _2044 = _2643;
    }
    float _2645 = _2044;
    float _2647 = fma(_1920, _2633, _2637);
    float _2649 = fma(_1950, _2633, _2639);
    float _2651 = fma(_1970, _2633, _2641);
    float _2653 = fma(_2372, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2539);
    float _2655 = fma(_1938, _2645, _2647);
    float _2657 = fma(_1964, _2645, _2649);
    float _2659 = fma(_1978, _2645, _2651);
    float _2661 = _2657 * _400;
    float _2663 = _2657 * _410;
    float _2665 = exp2(_2629);
    float _2667 = _2657 * _442;
    float _2669 = _2653 + _2416;
    float _2671 = fma(_2655, _370, _2661);
    float _2673 = fma(_2655, _374, _2663);
    float _2675 = fma(_2655, _366, _2667);
    float _2677 = _2669 * 0.5;
    bool _2679 = _2192 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2681 = isnan(_2192);
    bool _2683 = _2679 || _2681;
    bool _2685 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2687 = _2683 || _2685;
    float _2689 = fma(_2659, _426, _2675);
    float _2691 = fma(_2659, _430, _2671);
    float _2693 = fma(_2659, _438, _2673);
    out.m_79.z = _2677;
    out.m_79.w = _2416;
    float _2695 = -_2665;
    float _2697 = _2695 + 1.0;
    out.m_81.x = _2689;
    out.m_81.y = _2691;
    out.m_81.z = _2693;
    float _2699 = _2697 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2438;
    out.gl_Position.y = _2442;
    out.gl_Position.z = _2653;
    out.gl_Position.w = _2416;
    float _2701 = _2697;
    float _2703 = _2653;
    float _2705 = _2438;
    if (!_2687)
    {
        _2701 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2707 = _2701;
    float _2709 = _2707;
    float _2711 = _2707;
    if (!_2687)
    {
        _2583 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2713 = _2583;
    float _2715 = _2713;
    float _2717 = _2713;
    if (!_2687)
    {
        _2703 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2719 = _2703;
    float _2721 = _2719;
    float _2723 = _2719;
    if (!_2687)
    {
        _2585 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2725 = _2585;
    float _2727 = _2725;
    float _2729 = _2725;
    if (!_2687)
    {
        _2705 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2731 = _2705;
    float _2733 = _2699 * _2466;
    float _2735 = -_2699;
    float _2737 = _2735 + 1.0;
    float _2739 = _2483 * _2733;
    float _2741 = _2483 * _2737;
    float _2743 = _2493 * _2733;
    float _2745 = fma(_2489, _2739, _2477);
    float _2747 = fma(_2491, _2739, _2479);
    float _2749 = _2477;
    float _2751 = _2731;
    float _2753 = _2731;
    if (!_2687)
    {
        _2749 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2755 = _2749;
    float _2757 = fma(_2483, _2743, _2481);
    out.m_83.x = _2745;
    out.m_83.y = _2747;
    out.m_83.z = _2757;
    out.m_83.w = _2741;
    bool _2759 = !_2687;
    float _2761 = _2755;
    float _2763 = _2755;
    if (!_2759)
    {
        bool _2765 = _2192 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2767 = isnan(_2192);
        bool _2769 = _2765 || _2767;
        bool _2771 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2773 = _2769 || _2771;
        if (!_2773)
        {
            float _2775 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2777 = _2192 + _2775;
            float _2779 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2781 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2779;
            float _2783 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2785 = _2783 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2787 = 1.0 / _2781;
            float _2789 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2791 = _2789 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2793 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2795 = _2793 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2797 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2799 = _2797 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2801 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2803 = _2801 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2805 = _2777 * _2787;
            float _2807 = precise::clamp(_2805, 0.0, 1.0);
            float _2809 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2811 = _2809 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2813 = fma(_2807, _2785, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2815 = fma(_2807, _2811, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2817 = fma(_2807, _2791, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2819 = fma(_2807, _2795, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2821 = fma(_2807, _2799, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2823 = fma(_2807, _2803, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2717 = _2817;
            _2753 = _2821;
            _2763 = _2813;
            _2729 = _2819;
            _2723 = _2815;
            _2711 = _2823;
            _2825 = true;
        }
        else
        {
            bool _2827 = _2192 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2829 = isnan(_2192);
            bool _2831 = _2827 || _2829;
            bool _2833 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2835 = _2831 || _2833;
            if (!_2835)
            {
                _2761 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2837 = _2761;
            _2763 = _2837;
            if (!_2835)
            {
                _2715 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2839 = _2715;
            _2717 = _2839;
            if (!_2835)
            {
                _2721 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2841 = _2721;
            _2723 = _2841;
            if (!_2835)
            {
                _2727 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2843 = _2727;
            _2729 = _2843;
            if (!_2835)
            {
                _2751 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2845 = _2751;
            _2753 = _2845;
            if (!_2835)
            {
                _2709 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2847 = _2709;
            bool _2849 = !_2835;
            _2711 = _2847;
            if (!_2849)
            {
                bool _2851 = _2192 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2853 = isnan(_2192);
                bool _2855 = _2851 || _2853;
                bool _2857 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2859 = _2855 || _2857;
                if (!_2859)
                {
                    float _2861 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2863 = _2192 + _2861;
                    float _2865 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2867 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2865;
                    float _2869 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2871 = _2869 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2873 = 1.0 / _2867;
                    float _2875 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2877 = _2875 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2879 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2881 = _2879 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2883 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2885 = _2883 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2887 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2889 = _2887 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2891 = _2863 * _2873;
                    float _2893 = precise::clamp(_2891, 0.0, 1.0);
                    float _2895 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2897 = _2895 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2899 = fma(_2893, _2871, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2901 = fma(_2893, _2897, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2903 = fma(_2893, _2877, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2905 = fma(_2893, _2881, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2907 = fma(_2893, _2885, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2909 = fma(_2893, _2889, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2717 = _2903;
                    _2753 = _2907;
                    _2763 = _2899;
                    _2729 = _2905;
                    _2723 = _2901;
                    _2711 = _2909;
                    _2825 = true;
                }
                else
                {
                    _2717 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2753 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2763 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2729 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2723 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2711 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2825 = false;
    float _2911 = _2717;
    float _2913 = _2753;
    float _2915 = _2763;
    float _2917 = _2729;
    float _2919 = _2723;
    float _2921 = _2711;
    float _2923 = fma(_2691, -0.5, 0.5);
    float _2925 = precise::clamp(_2923, 0.0, 1.0);
    float _2927 = -_2911;
    float _2929 = _2927 + _2913;
    float _2931 = -_2915;
    float _2933 = _2931 + _2917;
    float _2935 = -_2919;
    float _2937 = _2935 + _2921;
    bool _2939 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2941 = fma(_2925, _2929, _2911);
    float _2943 = fma(_2925, _2933, _2915);
    float _2945 = fma(_2925, _2937, _2919);
    float _2947 = _2941 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _2949 = fma(_2943, 0.298911988735198974609375, _2947);
    float _2951 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2953 = fma(_2945, 0.114477999508380889892578125, _2949);
    out.m_85.w = _2951;
    float _2955 = -_2953;
    float _2957 = _2943 + _2955;
    float _2959 = -_2953;
    float _2961 = _2941 + _2959;
    float _2963 = -_2953;
    float _2965 = _2945 + _2963;
    out.m_87.x = 0.0;
    float _2967 = fma(_2957, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2953);
    float _2969 = fma(_2961, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2953);
    float _2971 = fma(_2965, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2953);
    out.m_89.x = _2967;
    out.m_89.y = _2969;
    out.m_89.z = _2971;
    if (!_2939)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2973 = -_2164;
    float _2975 = _2973 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2977 = -_2166;
    float _2979 = _2977 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2981 = -_2168;
    float _2983 = _2981 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2985 = _2975 * _2975;
    float _2987 = fma(_2979, _2979, _2985);
    float _2989 = fma(_2983, _2983, _2987);
    float _2991 = sqrt(_2989);
    float _2993 = rsqrt(_2989);
    float _2995 = -_2991;
    float _2997 = _2995 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2999 = _2997 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3001 = precise::clamp(_2999, 0.0, 1.0);
    float _3003 = _2979 * _2993;
    float _3005 = _2975 * _2993;
    float _3007 = abs(_3001);
    float _3009 = log2(_3007);
    float _3011 = _2983 * _2993;
    float _3013 = _3003 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3015 = _2691 * _3005;
    float _3017 = -_3005;
    float _3019 = -_3013;
    float _3021 = fma(_3017, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3019);
    float _3023 = fma(_2689, _3003, _3015);
    float _3025 = -_3011;
    float _3027 = fma(_3025, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3021);
    float _3029 = fma(_2693, _3011, _3023);
    float _3031 = precise::clamp(_3029, 0.0, 1.0);
    float _3033 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3035 = _3027 + _3033;
    float _3037 = _3009 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3039 = _3035 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3041 = precise::clamp(_3039, 0.0, 1.0);
    float _3043 = exp2(_3037);
    float _3045 = _3043 * _3041;
    float _3047 = _3031 * _3045;
    float _3049 = _3047 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3051 = _3047 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3053 = _3047 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _3049;
    out.m_87.y = _3051;
    out.m_87.z = _3053;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

