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
    float4 m_73 [[user(locn0)]];
    float4 m_45 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_75 [[user(locn4)]];
    float4 m_71 [[user(locn5)]];
    float4 m_77 [[user(locn6)]];
    float4 m_79 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_51 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_55 [[attribute(3)]];
    float4 m_59 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
    float4 m_42 [[attribute(6)]];
    float4 m_47 [[attribute(7)]];
    float4 m_63 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
    float4 m_61 [[attribute(11)]];
    float4 m_67 [[attribute(12)]];
    float4 m_65 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _342 = false;
    bool _220 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_42.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_45.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2396 = as_type<float>(_114);
        out.gl_Position.z = _2396;
    }
    if (!_102)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _118 = in.m_47.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _134 = _132;
    if (_128)
    {
        float _136 = float(_98);
        _108 = _136;
    }
    float _138 = _108;
    bool _140 = _132 >= _138;
    bool _142 = !_128;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_45.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _116 = as_type<int>(_150);
    }
    int _152 = _116;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2466 = as_type<float>(_152);
        out.gl_Position.z = _2466;
    }
    if (_144)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _154 = in.m_49.x;
    float _156 = in.m_49.y;
    float _158 = in.m_49.z;
    bool _160 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _162 = in.m_51.x;
    float _164 = in.m_51.y;
    float _166 = in.m_51.z;
    float _168 = in.m_53.x;
    float _170 = in.m_53.y;
    float _172 = in.m_53.z;
    float _174 = in.m_55.x;
    float _176 = in.m_55.y;
    float _178 = in.m_55.z;
    float _180 = _156 * _164;
    float _182 = _156 * _170;
    float _184 = fma(_154, _162, _180);
    float _186 = _156 * _176;
    float _188 = fma(_154, _168, _182);
    float _190 = fma(_158, _166, _184);
    float _192 = fma(_154, _174, _186);
    float _194 = fma(_158, _172, _188);
    float _196 = fma(_158, _178, _192);
    bool _198 = !_160;
    float _200 = _190;
    float _218;
    if (!_198)
    {
        float _202 = in.m_57.x;
        float _204 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _206 = _202 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _208 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _210 = _208 * _204;
        float _212 = floor(_210);
        float _214 = -_212;
        float _216 = _210 + _214;
        _218 = _216;
        _220 = true;
    }
    else
    {
        float _222 = float(_98);
        float _224 = 1.0 / _222;
        float _226 = _132 * _224;
        _218 = _226;
    }
    _220 = false;
    float _228 = _218;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = _228 + _230;
    bool _234 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _236 = isnan(_228);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _246;
    bool _250 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _252 = isnan(_228);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = -_244;
    float _264 = _262 + 1.0;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _266;
    float _270 = 1.0 / _248;
    bool _272 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _274 = _260 * _264;
    float _276 = -_260;
    float _278 = _276 + 1.0;
    float _280 = _232 * _270;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _282;
    float _286 = fma(_268, _280, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _288;
    float _292 = fma(_284, _280, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _294 = _286 * _274;
    float _296 = fma(_290, _280, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _298 = _292 * _274;
    float _300 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].x, _294);
    float _302 = _296 * _274;
    float _304 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].z, _298);
    float _306 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[144].x, _300);
    float _308 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].y, _302);
    float _310 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[144].y, _308);
    float _312 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[144].z, _304);
    bool _314 = !_272;
    float _338;
    float _340;
    if (!_314)
    {
        float _316 = in.m_57.x;
        float _318 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _320 = float(_98);
        float _322 = 1.0 / _320;
        float _324 = _316 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _326 = _132 * _322;
        float _328 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _330 = _328 * _318;
        float _332 = floor(_330);
        float _334 = -_332;
        float _336 = _330 + _334;
        _338 = _336;
        _340 = _326;
        _342 = true;
    }
    else
    {
        float _344 = float(_98);
        float _346 = 1.0 / _344;
        float _348 = _132 * _346;
        _338 = _348;
        _340 = _348;
    }
    _342 = false;
    float _350 = _338;
    float _352 = _340;
    float _354 = in.m_42.x;
    float _356 = in.m_42.y;
    float _358 = in.m_42.z;
    float _360 = in.m_57.z;
    int _362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _364 = _362 != 0;
    float _366 = in.m_57.y;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _370 = in.m_57.x;
    int _372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _374 = _372 != 0;
    int _376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _378 = _376 != 0;
    int _380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _382 = _380 != 0;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _386 = in.m_55.w;
    float _388 = in.m_51.w;
    float _390 = _170 * _356;
    float _392 = _164 * _356;
    float _394 = _176 * _356;
    float _396 = fma(_168, _354, _390);
    float _398 = _360 * 2.0;
    float _400 = fma(_162, _354, _392);
    float _402 = fma(_174, _354, _394);
    float _404 = fma(_172, _358, _396);
    float _406 = _366 * 2.0;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _410 = floor(_398);
    float _412 = _370 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _414 = _366 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _416 = _366 + _360;
    float _418 = fma(_178, _358, _402);
    float _420 = -_368;
    float _422 = fma(_412, 2.0, _420);
    float _424 = fma(_414, -2.0, _408);
    float _426 = floor(_406);
    float _428 = _370 * 2.0;
    float _430 = _416 + (-1.0);
    float _432 = fma(_166, _358, _400);
    float _434 = in.m_53.w;
    float _436 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _438 = _370 + _366;
    float _440 = floor(_428);
    bool _442 = _410 >= 0.0;
    bool _444 = isnan(_410);
    bool _446 = _442 || _444;
    bool _448 = isnan(0.0);
    bool _450 = _446 || _448;
    float _452 = _418 + _386;
    bool _454 = !_374;
    int _456 = _454 ? 0 : 1;
    float _458 = _438 + (-1.0);
    int _460 = _450 ? 0 : 1;
    float _462 = _432 + _388;
    float _464 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _466 = _426 > 0.0;
    bool _468 = _426 >= 0.0;
    bool _470 = isnan(_426);
    bool _472 = _468 || _470;
    bool _474 = isnan(0.0);
    bool _476 = _472 || _474;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _480 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _482 = log2(_480);
    bool _484 = _410 > 0.0;
    float _486 = _428;
    float _488 = _458;
    float _490 = _410;
    if (!_364)
    {
        _486 = _366;
    }
    float _492 = _486;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _496 = _492;
    if (!_364)
    {
        _488 = _360;
    }
    float _498 = _488;
    float _500 = _404 + _434;
    float _502 = _498;
    if (_364)
    {
        _496 = _370;
    }
    float _504 = _496;
    if (_364)
    {
        _502 = _366;
    }
    float _506 = _502;
    if (!_364)
    {
        _490 = _360;
    }
    float _508 = _490;
    float _510 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[83].z, _494);
    float _512 = _508;
    if (_364)
    {
        _512 = _366;
    }
    float _514 = _512;
    float _516 = _504 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _518 = _440 > 0.0;
    float _520 = _482 * _132;
    bool _522 = _440 >= 0.0;
    bool _524 = isnan(_440);
    bool _526 = _522 || _524;
    bool _528 = isnan(0.0);
    bool _530 = _526 || _528;
    float _532 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[83].w, _478);
    float _534 = -_384;
    float _536 = fma(_516, 2.0, _534);
    int _538 = ~_460;
    int _540 = _538 + 1;
    int _542 = _540 + 1;
    float _544 = _514 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _546 = abs(_456);
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _550 = _542;
    if (!_484)
    {
        int _552 = ~_460;
        int _554 = _552 + 1;
        _550 = _554;
    }
    int _556 = _550;
    float _558 = exp2(_520);
    float _560 = float(_546);
    float _562 = fma(_544, -2.0, _548);
    float _564 = float(_556);
    float _566 = _560 * _564;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _570 = 1.0 + _568;
    float _572 = in.m_59.x;
    float _574 = in.m_59.y;
    float _576 = in.m_59.z;
    int _578 = _530 ? 0 : 1;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _584 = _476 ? 0 : 1;
    float _586 = 1.0 / _570;
    int _588 = ~_578;
    int _590 = _588 + 1;
    int _592 = _590 + 1;
    float _594 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[78].w, _580);
    int _596 = _592;
    if (!_518)
    {
        int _598 = ~_578;
        int _600 = _598 + 1;
        _596 = _600;
    }
    int _602 = _596;
    float _604 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[78].z, _582);
    bool _606 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _608 = isnan(1.0);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _614 = _610 || _612;
    float _616 = -_558;
    float _618 = _616 + 1.0;
    bool _620 = !_378;
    int _622 = _620 ? 0 : 1;
    float _624 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _594);
    int _626 = ~_584;
    int _628 = _626 + 1;
    int _630 = _628 + 1;
    float _632 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _424);
    int _634 = _630;
    if (!_466)
    {
        int _636 = ~_584;
        int _638 = _636 + 1;
        _634 = _638;
    }
    int _640 = _634;
    float _642 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _604);
    bool _644 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _646 = isnan(0.0);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _652 = _648 || _650;
    float _654 = _566 * (-2.0);
    int _656 = abs(_622);
    float _658 = -_132;
    float _660 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[76].x, _422);
    float _662 = _652 ? _618 : 0.0;
    float _664 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _510);
    float _666 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _532);
    float _668 = -_132;
    float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[81].x, _536);
    float _672 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _562);
    float _674 = float(_656);
    float _676 = _660;
    if (_614)
    {
        float _678 = _662 * _586;
        _134 = _678;
    }
    float _680 = _134;
    float _682 = float(_602);
    float _684 = -_500;
    float _686 = _684 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _688 = fma(_464, _654, _464);
    float _690 = fma(_654, _572, _572);
    float _692 = _370 + (-0.5);
    float _694 = _674 * _682;
    float _696 = -_462;
    float _698 = _696 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _700 = _686 * _686;
    bool _702 = !_382;
    int _704 = _702 ? 0 : 1;
    float _706 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[196].x, _690);
    float _708 = -_452;
    float _710 = _708 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _712 = fma(_698, _698, _700);
    int _714 = abs(_704);
    float _716 = _694 * (-2.0);
    float _718 = float(_640);
    float _720 = fma(_710, _710, _712);
    float _722 = _366 + (-0.5);
    float _724 = fma(_716, _574, _574);
    float _726 = fma(_688, _680, _706);
    float _728 = float(_714);
    float _730 = in.m_61.x;
    float _732 = in.m_61.y;
    float _734 = in.m_61.z;
    float _736 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[196].y, _724);
    float _738 = fma(_436, _716, _436);
    float _740 = rsqrt(_720);
    float _742 = _726 * 0.15915493667125701904296875;
    float _744 = _728 * _718;
    float _746 = fma(_738, _680, _736);
    float _748 = _370 + _360;
    float _750 = in.m_63.x;
    float _752 = in.m_63.y;
    float _754 = in.m_63.z;
    float _756 = _746 * 0.15915493667125701904296875;
    float _758 = _748 + (-1.0);
    float _760 = _744 * (-2.0);
    float _762 = _742 * 6.283185482025146484375;
    float _764 = sin(_762);
    float _766 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _768 = fma(_760, _576, _576);
    float _770 = _360 + (-0.5);
    float _772 = _698 * _740;
    float _774 = fma(_766, _760, _766);
    float _776 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[196].z, _768);
    float _778 = _710 * _740;
    float _780 = _686 * _740;
    float _782 = _310 * _732;
    float _784 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _786 = _772 * _784;
    float _788 = _306 * _730;
    float _790 = fma(_774, _680, _776);
    float _792 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _794 = _778 * _792;
    float _796 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _798 = -_786;
    float _800 = fma(_778, _796, _798);
    float _802 = _742 * 6.283185482025146484375;
    float _804 = cos(_802);
    float _806 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _750);
    float _808 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _810 = _780 * _808;
    float _812 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _814 = -_794;
    float _816 = fma(_780, _812, _814);
    float _818 = _800 * _800;
    float _820 = _312 * _734;
    float _822 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _824 = -_810;
    float _826 = fma(_772, _822, _824);
    float _828 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _752);
    float _830 = _756 * 6.283185482025146484375;
    float _832 = sin(_830);
    float _834 = _790 * 0.15915493667125701904296875;
    float _836 = fma(_816, _816, _818);
    float _838 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _754);
    float _840 = _782 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _842 = _788 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _844 = fma(_826, _826, _836);
    float _846 = _820 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _848 = _756 * 6.283185482025146484375;
    float _850 = cos(_848);
    float _852 = _842 * _806;
    float _854 = _834 * 6.283185482025146484375;
    float _856 = sin(_854);
    float _858 = _804 * _832;
    float _860 = _834 * 6.283185482025146484375;
    float _862 = cos(_860);
    float _864 = _764 * _850;
    float _866 = rsqrt(_844);
    float _868 = _840 * _828;
    float _870 = _846 * _838;
    float _872 = -_858;
    float _874 = fma(_856, _864, _872);
    float _876 = -_864;
    float _878 = fma(_856, _858, _876);
    float _880 = _764 * _832;
    float _882 = _832 * _862;
    float _884 = _804 * _850;
    float _886 = _862 * _868;
    float _888 = _850 * _862;
    float _890 = -_868;
    float _892 = _856 * _890;
    float _894 = fma(_856, _884, _880);
    float _896 = _804 * _886;
    float _898 = fma(_856, _880, _884);
    float _900 = _816 * _866;
    float _902 = _800 * _866;
    float _904 = fma(_894, _852, _896);
    float _906 = fma(_888, _852, _892);
    float _908 = _780 * _900;
    float _910 = _764 * _886;
    float _912 = _826 * _866;
    float _914 = fma(_878, _870, _904);
    float _916 = _778 * _902;
    float _918 = -_908;
    float _920 = fma(_772, _902, _918);
    float _922 = fma(_874, _852, _910);
    float _924 = fma(_882, _870, _906);
    float _926 = -_916;
    float _928 = fma(_780, _912, _926);
    float _930 = _920 * _914;
    float _932 = fma(_898, _870, _922);
    float _934 = _928 * _914;
    float _936 = fma(_912, _924, _930);
    float _938 = fma(_900, _924, _934);
    float _940 = fma(_778, _932, _936);
    float _942 = fma(_772, _932, _938);
    float _944 = _452 + _940;
    float _946 = _772 * _912;
    float _948 = _462 + _942;
    float _950 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _952 = _944 + _950;
    float _954 = -_946;
    float _956 = fma(_778, _900, _954);
    float _958 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _960 = _948 + _958;
    float _962 = _952 * _952;
    float _964 = _956 * _914;
    float _966 = fma(_960, _960, _962);
    float _968 = fma(_902, _924, _964);
    float _970 = sqrt(_966);
    float _972 = fma(_780, _932, _968);
    float _974 = _500 + _972;
    bool _976 = _970 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _978 = _778;
    float _980 = _962;
    float _982 = _948;
    float _984 = _968;
    if (!_976)
    {
        _978 = _948;
    }
    float _986 = _978;
    float _988 = _986;
    if (!_976)
    {
        _980 = _944;
    }
    float _990 = _980;
    float _992 = _990;
    if (!_976)
    {
        _982 = _974;
    }
    float _994 = _982;
    bool _996 = !_976;
    float _998 = _994;
    if (!_996)
    {
        float _1000 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1002 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1004 = _970 + _1002;
        float _1006 = _974 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1008 = rsqrt(_966);
        float _1010 = _1004 * _1000;
        float _1012 = _1010 * 0.15915493667125701904296875;
        float _1014 = _1012 * 6.283185482025146484375;
        float _1016 = sin(_1014);
        float _1018 = _1012 * 6.283185482025146484375;
        float _1020 = cos(_1018);
        float _1022 = fma(_1016, _1006, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1024 = _1008 * _1022;
        float _1026 = _1020 + (-1.0);
        float _1028 = fma(_960, _1024, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1030 = fma(_952, _1024, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1032 = _1026 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1034 = fma(_974, _1020, _1032);
        _998 = _1034;
        _988 = _1028;
        _992 = _1030;
        _984 = _1012;
    }
    float _1036 = _998;
    float _1038 = _988;
    float _1040 = _992;
    float _1042 = _984;
    float _1044 = -_500;
    float _1046 = _1044 + _1036;
    float _1048 = -_462;
    float _1050 = _1048 + _1038;
    float _1052 = -_452;
    float _1054 = _1052 + _1040;
    float _1056 = _1046 * _1046;
    bool _1058 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1060 = isnan(0.5);
    bool _1062 = _1058 || _1060;
    bool _1064 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1066 = _1062 || _1064;
    float _1068 = fma(_1050, _1050, _1056);
    float _1070 = fma(_1054, _1054, _1068);
    float _1072 = sqrt(_1070);
    bool _1074 = _1072 > 0.0;
    bool _1076 = !_1074;
    float _1078 = _1038;
    float _1080 = _1040;
    float _1082 = _1036;
    float _1084 = _1042;
    if (!_1076)
    {
        float _1086 = _194 * _194;
        float _1088 = fma(_190, _190, _1086);
        float _1090 = rsqrt(_1070);
        float _1092 = fma(_196, _196, _1088);
        float _1094 = sqrt(_1092);
        float _1096 = _1050 * _1090;
        float _1098 = _1046 * _1090;
        float _1100 = _1054 * _1090;
        bool _1102 = _1094 > 0.0;
        bool _1104 = !_1102;
        _1084 = _1092;
        if (!_1104)
        {
            float _1106 = rsqrt(_1092);
            float _1108 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1110 = _194 * _1106;
            float _1112 = _190 * _1106;
            float _1114 = _196 * _1106;
            float _1116 = _1098 * _1110;
            float _1118 = fma(_1096, _1112, _1116);
            float _1120 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1122 = fma(_1100, _1114, _1118);
            float _1124 = _1122 * _1120;
            float _1126 = fma(_190, _1124, _1038);
            float _1128 = fma(_194, _1124, _1036);
            float _1130 = fma(_196, _1124, _1040);
            _1078 = _1126;
            _1080 = _1130;
            _1082 = _1128;
        }
    }
    float _1132 = _1078;
    float _1134 = _1080;
    float _1136 = _1082;
    float _1138 = _1084;
    float _1140 = _1136;
    float _1142 = _1134;
    float _1144 = _1138;
    if (_1066)
    {
        _200 = _1132;
    }
    float _1146 = _200;
    float _1148 = _1146;
    if (!_1066)
    {
        float _1150 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1152 = _500 + _1150;
        float _1154 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1156 = _462 + _1154;
        float _1158 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1160 = -_452;
        float _1162 = _1160 + _1134;
        float _1164 = _1152 * _1152;
        float _1166 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1168 = _452 + _1166;
        float _1170 = fma(_1156, _1156, _1164);
        float _1172 = fma(_1168, _1168, _1170);
        float _1174 = -_462;
        float _1176 = _1174 + _1132;
        float _1178 = sqrt(_1172);
        float _1180 = precise::min(_1178, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1182 = _1180 * _1158;
        float _1184 = -_500;
        float _1186 = _1184 + _1136;
        float _1188 = fma(_1176, _1182, _462);
        float _1190 = fma(_1186, _1182, _500);
        float _1192 = fma(_1162, _1182, _452);
        _1140 = _1190;
        _1148 = _1188;
        _1142 = _1192;
    }
    float _1194 = _1140;
    float _1196 = _1148;
    float _1198 = _1142;
    float _1200 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1202 = _1194 + _1200;
    float _1204 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1206 = _1196 + _1204;
    float _1208 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1210 = _1198 + _1208;
    float _1212 = _1202 * _1202;
    float _1214 = fma(_1206, _1206, _1212);
    float _1216 = fma(_1210, _1210, _1214);
    float _1218 = rsqrt(_1216);
    float _1220 = sqrt(_1216);
    float _1222 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1224 = _1206 * _1222;
    float _1226 = _1210 * _1222;
    float _1228 = _1224 * _1224;
    float _1230 = _1226 * _1226;
    float _1232 = _1228 + _1230;
    float _1234 = sqrt(_1232);
    bool _1236 = _1234 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1238 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1240 = _1234 + _1238;
    float _1242 = _1210;
    float _1244 = _1232;
    float _1246 = _1240;
    float _1248 = _1222;
    if (_1236)
    {
        float _1250 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1242 = _1250;
    }
    float _1252 = _1242;
    if (_1236)
    {
        float _1254 = rsqrt(_1232);
        _1244 = _1254;
    }
    float _1256 = _1244;
    if (_1236)
    {
        float _1258 = _1240 * _1252;
        _1246 = _1258;
    }
    float _1260 = _1246;
    if (_1236)
    {
        float _1262 = _1260 * 0.15915493667125701904296875;
        _1144 = _1262;
    }
    float _1264 = _1144;
    float _1266 = _1212;
    float _1268 = _1264;
    if (_1236)
    {
        float _1270 = _1264 * 6.283185482025146484375;
        float _1272 = sin(_1270);
        _1266 = _1272;
    }
    float _1274 = _1266;
    float _1276 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1278 = precise::max(0.0, _1276);
    float _1280 = _1218;
    float _1282 = _1278;
    float _1284 = _1276;
    if (_1236)
    {
        float _1286 = _1264 * 6.283185482025146484375;
        float _1288 = cos(_1286);
        _1280 = _1288;
    }
    float _1290 = _1280;
    float _1292 = -_1222;
    float _1294 = -_1278;
    float _1296 = fma(_1202, _1292, _1294);
    float _1298 = _1296;
    if (!_1236)
    {
        _1282 = _1224;
    }
    float _1300 = _1282;
    float _1302 = _1300;
    if (_1236)
    {
        float _1304 = _1296 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1284 = _1304;
    }
    float _1306 = _1284;
    float _1308 = _1274;
    float _1310 = _1306;
    if (_1236)
    {
        float _1312 = fma(_1274, _1306, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1308 = _1312;
    }
    float _1314 = _1308;
    float _1316 = _1314;
    float _1318 = _1290;
    if (_1236)
    {
        float _1320 = _1290 + (-1.0);
        _1310 = _1320;
    }
    float _1322 = _1310;
    float _1324 = _1322;
    if (_1236)
    {
        float _1326 = _1256 * _1314;
        _1248 = _1326;
    }
    float _1328 = _1248;
    if (!_1236)
    {
        _1316 = _1228;
    }
    float _1330 = _1316;
    float _1332 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1334 = _1330;
    if (_1236)
    {
        float _1336 = _1322 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1268 = _1336;
    }
    float _1338 = _1268;
    if (_1236)
    {
        float _1340 = _1224 * _1328;
        _1302 = _1340;
    }
    float _1342 = _1302;
    if (!_1236)
    {
        _1324 = _1226;
    }
    float _1344 = _1324;
    float _1346 = _1344;
    if (_1236)
    {
        float _1348 = _1226 * _1328;
        _1346 = _1348;
    }
    float _1350 = _1346;
    if (_1236)
    {
        float _1352 = fma(_1296, _1290, _1338);
        _1298 = _1352;
    }
    float _1354 = _1298;
    if (_1236)
    {
        float _1356 = _1342 * _1342;
        _1334 = _1356;
    }
    float _1358 = _1334;
    if (!_1236)
    {
        _1318 = _1230;
    }
    float _1360 = _1318;
    float _1362 = _1360;
    if (_1236)
    {
        float _1364 = _1350 * _1350;
        _1362 = _1364;
    }
    float _1366 = _1362;
    float _1368 = fma(_1354, _1354, _1358);
    float _1370 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1332);
    float _1372 = _1368 + _1366;
    float _1374 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1376 = fma(_1220, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1374);
    float _1378 = precise::clamp(_1376, 0.0, 1.0);
    float _1380 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1382 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1384 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1386 = -_1378;
    float _1388 = _1386 + 1.0;
    float _1390 = rsqrt(_1372);
    float _1392 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1380);
    float _1394 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1370);
    float _1396 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1384);
    float _1398 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1392);
    float _1400 = _1394 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1402 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1404 = abs(_1388);
    float _1406 = log2(_1404);
    float _1408 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1396);
    float _1410 = _1398 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1412 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1402);
    float _1414 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1416 = _1408 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1418 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1420 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1412);
    float _1422 = _1390 * _1342;
    float _1424 = _1390 * _1354;
    float _1426 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1418);
    float _1428 = _1390 * _1350;
    float _1430 = _1422 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1432 = _1420 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1434 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1426);
    float _1436 = -_1414;
    float _1438 = fma(_1436, _1382, 1.0);
    float _1440 = _1406 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1442 = -_1430;
    float _1444 = fma(_1424, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1442);
    float _1446 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1434);
    float _1448 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1450 = log2(_1438);
    float _1452 = -_1428;
    float _1454 = fma(_1452, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1444);
    float _1456 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1458 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1448);
    float _1460 = fma(_1454, -0.5, 0.5);
    float _1462 = _1424 + 1.0;
    float _1464 = fma(_1454, 0.5, 0.5);
    float _1466 = exp2(_1440);
    float _1468 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1456);
    float _1470 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1458);
    float _1472 = fma(_1464, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1474 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1468);
    float _1476 = fma(_1464, _1472, -0.212114393711090087890625);
    float _1478 = 1.0 / _1446;
    float _1480 = _1450 * 0.693147182464599609375;
    float _1482 = fma(_1464, _1476, 1.570728778839111328125);
    float _1484 = _1480 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1486 = sqrt(_1460);
    float _1488 = -_1424;
    float _1490 = fma(_1466, _1462, _1488);
    float _1492 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1470);
    float _1494 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1474);
    float _1496 = fma(_1490, 0.5, 0.5);
    float _1498 = _1492 * _1478;
    float _1500 = _1494 * _1478;
    float _1502 = fma(_1498, 0.5, 0.5);
    float _1504 = fma(_1500, -0.5, 0.5);
    float _1506 = _1486 * 0.636619746685028076171875;
    float3 _4560 = float3(_1502, _1504, _1484);
    float _1508 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4560, float3(0.0), isnan(_4560)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4560, float3(0.0), isnan(_4560)), level(0.0)).x;
    float _1510 = -_1482;
    float _1512 = fma(_1506, _1510, 1.0);
    float3 _4576 = float3(_1502, _1504, _1484);
    float4 _1515 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4576, float3(0.0), isnan(_4576)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4576, float3(0.0), isnan(_4576)), level(0.0)).xyzw;
    float _1517 = _1515.x;
    float _1519 = _1515.y;
    float _1521 = _1515.z;
    float _1523 = _1515.w;
    float2 _4593 = float2(_1512, _1496);
    float3 _1527 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4593, float2(0.0), isnan(_4593)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4593, float2(0.0), isnan(_4593)), level(0.0)).xyz;
    float _1529 = _1527.x;
    float _1531 = _1527.y;
    float _1533 = _1527.z;
    float _1535 = in.m_65.z;
    float _1537 = _500 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1541 = _1539 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1543 = in.m_65.x;
    float _1545 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1547 = _1545 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1549 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1551 = in.m_67.y;
    float _1553 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1555 = _1553 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1557 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1559 = _1557 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1561 = in.m_57.w;
    bool _1563 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1565 = isnan(0.5);
    bool _1567 = _1563 || _1565;
    bool _1569 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1571 = _1567 || _1569;
    float _1573 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1537);
    float _1575 = 1.0 / _1541;
    float _1577 = in.m_65.y;
    float _1579 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1581 = _1579 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1583 = _366 > 0.5;
    float _1585 = in.m_65.w;
    float _1587 = fma(_452, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1573);
    float _1589 = 1.0 / _1547;
    out.m_69.z = _1535;
    float _1591 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1593 = _1591 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1595 = _1406 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1599 = _1597 != 0;
    out.m_69.x = _1543;
    float _1601 = 1.0 / _1555;
    float _1603 = -_1551;
    float _1605 = _1603 + 1.0;
    int _1607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1609 = _1607 != 0;
    float _1611 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1613 = _1611 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    int _1615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1617 = _1615 != 0;
    bool _1619 = _1561 > 0.5;
    float _1621 = 1.0 / _1559;
    int _1623 = _1619 ? as_type<int>(_1605) : as_type<int>(_1551);
    out.m_69.y = _1577;
    bool _1625 = _1619;
    bool _1627 = _1617;
    float _1629 = _1551;
    if (_1599)
    {
        bool _1631 = _370 > 0.5;
        _1625 = _1631;
    }
    bool _1633 = _1625;
    float _1635 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1637 = _1635 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1639 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1641 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1639;
    float _1643 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1645 = _1643 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _1647 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1649 = _1647 != 0;
    float _1651 = 1.0 / _1581;
    float _1653 = _1617 ? as_type<float>(_1623) : _1551;
    float _1655 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1657 = _1655 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1659 = _1645 * _1589;
    float _1661 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1663 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1661;
    float _1665 = _1641 * _1601;
    float _1667 = 1.0 / _1593;
    float _1669 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1671 = _1669 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    if (_1609)
    {
        bool _1673 = _360 > 0.5;
        _1627 = _1673;
    }
    bool _1675 = _1627;
    float _1677 = _1663 * _1575;
    float _1679 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1681 = _1679 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1683 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1685 = _1683 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    out.m_69.w = _1585;
    float _1687 = 1.0 / _1657;
    float _1689 = _1685 * _1621;
    float _1691 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1693 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1691;
    float _1695 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1697 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1695;
    float _1699 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1701 = _1699 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1703 = 1.0 / _1637;
    float _1705 = _1693 * _1651;
    float _1707 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1709 = _1707 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1711 = _1701 * _1667;
    float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1715 = _1713 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1717 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1719 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1717;
    float _1721 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1723 = _350 + _1721;
    float _1725 = 1.0 / _1613;
    float _1727 = _1709 * _1687;
    float _1729 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1731 = _350 + _1729;
    float _1733 = fma(_1689, _1723, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    if (_1649)
    {
        float _1735 = _1583 ? _1605 : _1551;
        _1629 = _1735;
    }
    float _1737 = _1629;
    float _1739 = fma(_1659, _1731, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1741 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1743 = _352 + _1741;
    float _1745 = 1.0 / _1681;
    float _1747 = _1719 * _1703;
    bool _1749 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1751 = isnan(_352);
    bool _1753 = _1749 || _1751;
    bool _1755 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1757 = _1753 || _1755;
    float _1759 = float(_1757);
    bool _1761 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1763 = isnan(_350);
    bool _1765 = _1761 || _1763;
    bool _1767 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1769 = _1765 || _1767;
    float _1771 = float(_1769);
    bool _1773 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1775 = isnan(_350);
    bool _1777 = _1773 || _1775;
    bool _1779 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1781 = _1777 || _1779;
    float _1783 = float(_1781);
    float _1785 = -_1759;
    float _1787 = _1785 + 1.0;
    float _1789 = 1.0 / _1671;
    float _1791 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1793 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1791;
    float _1795 = _1697 * _1725;
    bool _1797 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1799 = isnan(_350);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1805 = _1801 || _1803;
    float _1807 = float(_1805);
    float _1809 = -_1783;
    float _1811 = _1809 + 1.0;
    bool _1813 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1815 = isnan(_350);
    bool _1817 = _1813 || _1815;
    bool _1819 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1821 = _1817 || _1819;
    float _1823 = float(_1821);
    float _1825 = fma(_1795, _1743, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1827 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1829 = isnan(_352);
    bool _1831 = _1827 || _1829;
    bool _1833 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1835 = _1831 || _1833;
    float _1837 = float(_1835);
    float _1839 = _1793 * _1745;
    float _1841 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1843 = _352 + _1841;
    float _1845 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1847 = _350 + _1845;
    bool _1849 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1851 = isnan(_352);
    bool _1853 = _1849 || _1851;
    bool _1855 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1857 = _1853 || _1855;
    float _1859 = float(_1857);
    float _1861 = in.m_67.x;
    bool _1863 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1865 = isnan(_352);
    bool _1867 = _1863 || _1865;
    bool _1869 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1871 = _1867 || _1869;
    float _1873 = float(_1871);
    float _1875 = fma(_1677, _1847, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1877 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1879 = _352 + _1877;
    float _1881 = _1715 * _1789;
    float _1883 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1885 = _350 + _1883;
    float _1887 = -_1873;
    float _1889 = _1887 + 1.0;
    float _1891 = fma(_1705, _1879, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1893 = fma(_1881, _1843, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1895 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1897 = _352 + _1895;
    float _1899 = _500 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1901 = fma(_1665, _1885, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1903 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1905 = _352 + _1903;
    float _1907 = fma(_1727, _1897, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    bool _1909 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1911 = isnan(_352);
    bool _1913 = _1909 || _1911;
    bool _1915 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1917 = _1913 || _1915;
    float _1919 = float(_1917);
    float _1921 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1899);
    bool _1923 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1925 = isnan(_352);
    bool _1927 = _1923 || _1925;
    bool _1929 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1931 = _1927 || _1929;
    float _1933 = float(_1931);
    float _1935 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1937 = _352 + _1935;
    bool _1939 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1941 = isnan(_350);
    bool _1943 = _1939 || _1941;
    bool _1945 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1947 = _1943 || _1945;
    float _1949 = float(_1947);
    float _1951 = -_1919;
    float _1953 = _1951 + 1.0;
    float _1955 = fma(_1711, _1905, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1957 = -_1933;
    float _1959 = _1957 + 1.0;
    float _1961 = fma(_1839, _1937, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1963 = _1933 * _1953;
    bool _1965 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1967 = isnan(_352);
    bool _1969 = _1965 || _1967;
    bool _1971 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1973 = _1969 || _1971;
    float _1975 = float(_1973);
    float _1977 = _1759 * _1959;
    float _1979 = -_1823;
    float _1981 = _1979 + 1.0;
    float _1983 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1985 = _352 + _1983;
    bool _1987 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1989 = isnan(_352);
    bool _1991 = _1987 || _1989;
    bool _1993 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1995 = _1991 || _1993;
    float _1997 = float(_1995);
    float _1999 = -_1975;
    float _2001 = _1999 + 1.0;
    float _2003 = _1975 * _1787;
    float _2005 = -_1807;
    float _2007 = _2005 + 1.0;
    float _2009 = _1807 * _1981;
    float _2011 = _1837 * _2001;
    float _2013 = -_1837;
    float _2015 = _2013 + 1.0;
    float _2017 = _1783 * _2007;
    float _2019 = _1587 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2021 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2023 = _1873 * _2015;
    float _2025 = _1549 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2027 = _1771 * _1811;
    float _2029 = -_1771;
    float _2031 = _2029 + 1.0;
    float _2033 = fma(_452, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1921);
    float _2035 = _1859 * _1889;
    float _2037 = -_1859;
    float _2039 = _2037 + 1.0;
    float _2041 = 1.0 / _2019;
    float _2043 = _1949 * _2031;
    float _2045 = _2033 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2047 = _1997 * _2039;
    float _2049 = -_1949;
    float _2051 = _2049 + 1.0;
    float _2053 = _1901 * _2043;
    float _2055 = _2045 + _2019;
    float _2057 = _1825 * _2047;
    float _2059 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2061 = _2021 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2063 = as_type<int>(_2043);
    float _2065 = _1825;
    int _2067 = as_type<int>(_2019);
    float _2069 = _2053;
    float _2071 = _1739;
    float _2073 = _1985;
    float _2075 = _1737;
    float _2077 = _1861;
    float _2079 = _1893;
    if (_1599)
    {
        float _2081 = -_1861;
        float _2083 = _2081 + 1.0;
        _2063 = as_type<int>(_2083);
    }
    int _2085 = _2063;
    if (!_1571)
    {
        _2065 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2087 = _2065;
    float _2089 = _2087;
    if (_1609)
    {
        float _2091 = -_1861;
        float _2093 = _2091 + 1.0;
        _2067 = as_type<int>(_2093);
    }
    int _2095 = _2067;
    float _2097 = fma(_1653, _2025, -0.5);
    float _2099 = fma(_2061, _1737, -0.5);
    float _2101 = _2055 * _2041;
    float _2103 = _2101 * 0.5;
    float _2105 = -_1997;
    float _2107 = _2105 + 1.0;
    float _2109 = fma(_2051, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2053);
    if (!_1571)
    {
        _2069 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2111 = _2069;
    float _2113 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2115 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2113);
    float _2117 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2119 = fma(_1739, _2027, _2109);
    float _2121 = fma(_1747, _1985, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    if (!_1571)
    {
        float _2123 = -_2111;
        float _2125 = _2123 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2071 = _2125;
    }
    float _2127 = _2071;
    if (!_1599)
    {
        _2073 = _1861;
    }
    float _2129 = _2073;
    float _2131 = _2129;
    if (!_1571)
    {
        float _2133 = -_2087;
        float _2135 = _2133 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2075 = _2135;
    }
    float _2137 = _2075;
    if (_1599)
    {
        float _2139 = _1633 ? as_type<float>(_2085) : _1861;
        _2131 = _2139;
    }
    float _2141 = _2131;
    float _2143 = -_632;
    float _2145 = fma(_624, _2099, _2143);
    float _2147 = 1.0 / _2115;
    if (_1609)
    {
        float _2149 = _1675 ? as_type<float>(_2095) : _1861;
        _2077 = _2149;
    }
    float _2151 = _2077;
    float _2153 = -_672;
    float _2155 = fma(_666, _2097, _2153);
    float _2157 = _2059 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2159 = fma(_2107, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2057);
    float _2161 = fma(_1875, _2017, _2119);
    float _2163 = fma(_2157, _2151, -0.5);
    float _2165 = _666;
    if (!_1571)
    {
        float _2167 = 1.0 / _2127;
        _2165 = _2167;
    }
    float _2169 = _2165;
    float _2171 = fma(_1955, _2035, _2159);
    float _2173 = _2117 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2175 = fma(_664, _2163, _670);
    float _2177 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2179 = fma(_1891, _2023, _2171);
    float _2181 = fma(_2173, _2141, -0.5);
    float _2183 = fma(_1733, _2009, _2161);
    float _2185 = _2137;
    if (!_1571)
    {
        float _2187 = 1.0 / _2137;
        _2185 = _2187;
    }
    float _2189 = _2185;
    float _2191 = _2147;
    if (!_1571)
    {
        float _2193 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2195 = -_2087;
        float _2197 = fma(_2147, _2193, _2195);
        _2089 = _2197;
    }
    float _2199 = _2089;
    if (!_1571)
    {
        float _2201 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2203 = -_2111;
        float _2205 = fma(_2147, _2201, _2203);
        _2191 = _2205;
    }
    float _2207 = _2191;
    float _2209 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2177);
    float _2211 = fma(_1893, _2011, _2179);
    float _2213 = fma(_642, _2181, _660);
    if (_1571)
    {
        _676 = 1.0;
    }
    float _2215 = _676;
    float _2217 = exp2(_1595);
    float _2219 = _2169;
    float _2221 = _2215;
    if (!_1571)
    {
        float _2223 = _2207 * _2169;
        float _2225 = precise::clamp(_2223, 0.0, 1.0);
        _2219 = _2225;
    }
    float _2227 = _2219;
    if (_1571)
    {
        _2079 = 1.0;
    }
    float _2229 = _2079;
    float _2231 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2233 = fma(_2121, _2003, _2211);
    float _2235 = _2229;
    if (!_1571)
    {
        float _2237 = -_2227;
        float _2239 = _2237 + 1.0;
        _2235 = _2239;
    }
    float _2241 = _2235;
    float _2243 = _2155 + 0.5;
    float _2245 = _2231 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_1571)
    {
        float _2247 = _2199 * _2189;
        float _2249 = precise::clamp(_2247, 0.0, 1.0);
        _2221 = _2249;
    }
    float _2251 = _2221;
    float _2253 = fma(_1907, _1977, _2233);
    float _2255 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2209);
    float _2257 = _2145 + 0.5;
    float _2259 = _2251 * _2241;
    bool _2261 = _2251 > 0.0;
    bool _2263 = isnan(_2251);
    bool _2265 = _2261 || _2263;
    bool _2267 = isnan(0.0);
    bool _2269 = _2265 || _2267;
    float _2271 = _2213 + 0.5;
    float _2273 = _1446 * 0.5;
    float _2275 = -_2217;
    float _2277 = _2275 + 1.0;
    float _2279 = fma(_1961, _1963, _2253);
    float _2281 = _2277 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2283 = _2259 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2285 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2255);
    bool _2287 = _2241 <= 0.0;
    bool _2289 = !_2269;
    bool _2291 = _2287 || _2289;
    float _2293 = fma(_1494, -0.5, _2273);
    float _2295 = fma(_1919, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2279);
    float _2297 = fma(_1823, (*spvDescriptorSet0.vp_c9)._m0[119].x, _2183);
    float _2299 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2301 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2303 = _2285 + _1446;
    float _2305 = _1492 + _1446;
    float _2307 = _2299 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2309 = _2301 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2311 = _2175 + 0.5;
    float _2313 = _2297 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2315 = _2283 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2317 = _2303 * 0.5;
    float _2319 = _2305 * 0.5;
    out.m_71.x = _2271;
    out.m_71.y = _2257;
    out.m_71.z = _2311;
    out.m_71.w = _2243;
    out.m_73.x = _2307;
    out.m_73.y = _2309;
    out.m_73.z = _2245;
    out.m_73.w = _2313;
    out.m_75.x = _2295;
    out.m_45.x = _2315;
    out.gl_Position.x = _1492;
    out.gl_Position.y = _1494;
    out.gl_Position.z = _2285;
    out.gl_Position.w = _1446;
    out.m_77.x = _2319;
    out.m_77.y = _2293;
    out.m_77.z = _2317;
    out.m_77.w = _1446;
    float _2321 = _2281 * _1508;
    float _2323 = -_2281;
    float _2325 = _2323 + 1.0;
    float _2327 = _1523 * _2321;
    float _2329 = _1523 * _2325;
    float _2331 = _1533 * _2321;
    float _2333 = fma(_1529, _2327, _1517);
    float _2335 = fma(_1531, _2327, _1519);
    float _2337 = fma(_1523, _2331, _1521);
    out.m_79.x = _2333;
    out.m_79.y = _2335;
    out.m_79.z = _2337;
    out.m_79.w = _2329;
    if (!_2291)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2339 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2339;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _342 = false;
    bool _220 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_42.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_45.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2396 = as_type<float>(_114);
        out.gl_Position.z = _2396;
    }
    if (!_102)
    {
        return out;
    }
    float _118 = in.m_47.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _134 = _132;
    if (_128)
    {
        float _136 = float(_98);
        _108 = _136;
    }
    float _138 = _108;
    bool _140 = _132 >= _138;
    bool _142 = !_128;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_45.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _116 = as_type<int>(_150);
    }
    int _152 = _116;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2466 = as_type<float>(_152);
        out.gl_Position.z = _2466;
    }
    if (_144)
    {
        return out;
    }
    float _154 = in.m_49.x;
    float _156 = in.m_49.y;
    float _158 = in.m_49.z;
    bool _160 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _162 = in.m_51.x;
    float _164 = in.m_51.y;
    float _166 = in.m_51.z;
    float _168 = in.m_53.x;
    float _170 = in.m_53.y;
    float _172 = in.m_53.z;
    float _174 = in.m_55.x;
    float _176 = in.m_55.y;
    float _178 = in.m_55.z;
    float _180 = _156 * _164;
    float _182 = _156 * _170;
    float _184 = fma(_154, _162, _180);
    float _186 = _156 * _176;
    float _188 = fma(_154, _168, _182);
    float _190 = fma(_158, _166, _184);
    float _192 = fma(_154, _174, _186);
    float _194 = fma(_158, _172, _188);
    float _196 = fma(_158, _178, _192);
    bool _198 = !_160;
    float _200 = _190;
    float _218;
    if (!_198)
    {
        float _202 = in.m_57.x;
        float _204 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _206 = _202 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _208 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _210 = _208 * _204;
        float _212 = floor(_210);
        float _214 = -_212;
        float _216 = _210 + _214;
        _218 = _216;
        _220 = true;
    }
    else
    {
        float _222 = float(_98);
        float _224 = 1.0 / _222;
        float _226 = _132 * _224;
        _218 = _226;
    }
    _220 = false;
    float _228 = _218;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = _228 + _230;
    bool _234 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _236 = isnan(_228);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _246;
    bool _250 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _252 = isnan(_228);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = -_244;
    float _264 = _262 + 1.0;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _266;
    float _270 = 1.0 / _248;
    bool _272 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _274 = _260 * _264;
    float _276 = -_260;
    float _278 = _276 + 1.0;
    float _280 = _232 * _270;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _282;
    float _286 = fma(_268, _280, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _288;
    float _292 = fma(_284, _280, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _294 = _286 * _274;
    float _296 = fma(_290, _280, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _298 = _292 * _274;
    float _300 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].x, _294);
    float _302 = _296 * _274;
    float _304 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].z, _298);
    float _306 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[144].x, _300);
    float _308 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].y, _302);
    float _310 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[144].y, _308);
    float _312 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[144].z, _304);
    bool _314 = !_272;
    float _338;
    float _340;
    if (!_314)
    {
        float _316 = in.m_57.x;
        float _318 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _320 = float(_98);
        float _322 = 1.0 / _320;
        float _324 = _316 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _326 = _132 * _322;
        float _328 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _330 = _328 * _318;
        float _332 = floor(_330);
        float _334 = -_332;
        float _336 = _330 + _334;
        _338 = _336;
        _340 = _326;
        _342 = true;
    }
    else
    {
        float _344 = float(_98);
        float _346 = 1.0 / _344;
        float _348 = _132 * _346;
        _338 = _348;
        _340 = _348;
    }
    _342 = false;
    float _350 = _338;
    float _352 = _340;
    float _354 = in.m_42.x;
    float _356 = in.m_42.y;
    float _358 = in.m_42.z;
    float _360 = in.m_57.z;
    int _362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _364 = _362 != 0;
    float _366 = in.m_57.y;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _370 = in.m_57.x;
    int _372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _374 = _372 != 0;
    int _376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _378 = _376 != 0;
    int _380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _382 = _380 != 0;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _386 = in.m_55.w;
    float _388 = in.m_51.w;
    float _390 = _170 * _356;
    float _392 = _164 * _356;
    float _394 = _176 * _356;
    float _396 = fma(_168, _354, _390);
    float _398 = _360 * 2.0;
    float _400 = fma(_162, _354, _392);
    float _402 = fma(_174, _354, _394);
    float _404 = fma(_172, _358, _396);
    float _406 = _366 * 2.0;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _410 = floor(_398);
    float _412 = _370 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _414 = _366 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _416 = _366 + _360;
    float _418 = fma(_178, _358, _402);
    float _420 = -_368;
    float _422 = fma(_412, 2.0, _420);
    float _424 = fma(_414, -2.0, _408);
    float _426 = floor(_406);
    float _428 = _370 * 2.0;
    float _430 = _416 + (-1.0);
    float _432 = fma(_166, _358, _400);
    float _434 = in.m_53.w;
    float _436 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _438 = _370 + _366;
    float _440 = floor(_428);
    bool _442 = _410 >= 0.0;
    bool _444 = isnan(_410);
    bool _446 = _442 || _444;
    bool _448 = isnan(0.0);
    bool _450 = _446 || _448;
    float _452 = _418 + _386;
    bool _454 = !_374;
    int _456 = _454 ? 0 : 1;
    float _458 = _438 + (-1.0);
    int _460 = _450 ? 0 : 1;
    float _462 = _432 + _388;
    float _464 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _466 = _426 > 0.0;
    bool _468 = _426 >= 0.0;
    bool _470 = isnan(_426);
    bool _472 = _468 || _470;
    bool _474 = isnan(0.0);
    bool _476 = _472 || _474;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _480 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _482 = log2(_480);
    bool _484 = _410 > 0.0;
    float _486 = _428;
    float _488 = _458;
    float _490 = _410;
    if (!_364)
    {
        _486 = _366;
    }
    float _492 = _486;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _496 = _492;
    if (!_364)
    {
        _488 = _360;
    }
    float _498 = _488;
    float _500 = _404 + _434;
    float _502 = _498;
    if (_364)
    {
        _496 = _370;
    }
    float _504 = _496;
    if (_364)
    {
        _502 = _366;
    }
    float _506 = _502;
    if (!_364)
    {
        _490 = _360;
    }
    float _508 = _490;
    float _510 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[83].z, _494);
    float _512 = _508;
    if (_364)
    {
        _512 = _366;
    }
    float _514 = _512;
    float _516 = _504 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _518 = _440 > 0.0;
    float _520 = _482 * _132;
    bool _522 = _440 >= 0.0;
    bool _524 = isnan(_440);
    bool _526 = _522 || _524;
    bool _528 = isnan(0.0);
    bool _530 = _526 || _528;
    float _532 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[83].w, _478);
    float _534 = -_384;
    float _536 = fma(_516, 2.0, _534);
    int _538 = ~_460;
    int _540 = _538 + 1;
    int _542 = _540 + 1;
    float _544 = _514 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _546 = abs(_456);
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _550 = _542;
    if (!_484)
    {
        int _552 = ~_460;
        int _554 = _552 + 1;
        _550 = _554;
    }
    int _556 = _550;
    float _558 = exp2(_520);
    float _560 = float(_546);
    float _562 = fma(_544, -2.0, _548);
    float _564 = float(_556);
    float _566 = _560 * _564;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _570 = 1.0 + _568;
    float _572 = in.m_59.x;
    float _574 = in.m_59.y;
    float _576 = in.m_59.z;
    int _578 = _530 ? 0 : 1;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _584 = _476 ? 0 : 1;
    float _586 = 1.0 / _570;
    int _588 = ~_578;
    int _590 = _588 + 1;
    int _592 = _590 + 1;
    float _594 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[78].w, _580);
    int _596 = _592;
    if (!_518)
    {
        int _598 = ~_578;
        int _600 = _598 + 1;
        _596 = _600;
    }
    int _602 = _596;
    float _604 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[78].z, _582);
    bool _606 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _608 = isnan(1.0);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _614 = _610 || _612;
    float _616 = -_558;
    float _618 = _616 + 1.0;
    bool _620 = !_378;
    int _622 = _620 ? 0 : 1;
    float _624 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _594);
    int _626 = ~_584;
    int _628 = _626 + 1;
    int _630 = _628 + 1;
    float _632 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _424);
    int _634 = _630;
    if (!_466)
    {
        int _636 = ~_584;
        int _638 = _636 + 1;
        _634 = _638;
    }
    int _640 = _634;
    float _642 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _604);
    bool _644 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _646 = isnan(0.0);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _652 = _648 || _650;
    float _654 = _566 * (-2.0);
    int _656 = abs(_622);
    float _658 = -_132;
    float _660 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[76].x, _422);
    float _662 = _652 ? _618 : 0.0;
    float _664 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _510);
    float _666 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _532);
    float _668 = -_132;
    float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[81].x, _536);
    float _672 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _562);
    float _674 = float(_656);
    float _676 = _660;
    if (_614)
    {
        float _678 = _662 * _586;
        _134 = _678;
    }
    float _680 = _134;
    float _682 = float(_602);
    float _684 = -_500;
    float _686 = _684 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _688 = fma(_464, _654, _464);
    float _690 = fma(_654, _572, _572);
    float _692 = _370 + (-0.5);
    float _694 = _674 * _682;
    float _696 = -_462;
    float _698 = _696 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _700 = _686 * _686;
    bool _702 = !_382;
    int _704 = _702 ? 0 : 1;
    float _706 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[196].x, _690);
    float _708 = -_452;
    float _710 = _708 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _712 = fma(_698, _698, _700);
    int _714 = abs(_704);
    float _716 = _694 * (-2.0);
    float _718 = float(_640);
    float _720 = fma(_710, _710, _712);
    float _722 = _366 + (-0.5);
    float _724 = fma(_716, _574, _574);
    float _726 = fma(_688, _680, _706);
    float _728 = float(_714);
    float _730 = in.m_61.x;
    float _732 = in.m_61.y;
    float _734 = in.m_61.z;
    float _736 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[196].y, _724);
    float _738 = fma(_436, _716, _436);
    float _740 = rsqrt(_720);
    float _742 = _726 * 0.15915493667125701904296875;
    float _744 = _728 * _718;
    float _746 = fma(_738, _680, _736);
    float _748 = _370 + _360;
    float _750 = in.m_63.x;
    float _752 = in.m_63.y;
    float _754 = in.m_63.z;
    float _756 = _746 * 0.15915493667125701904296875;
    float _758 = _748 + (-1.0);
    float _760 = _744 * (-2.0);
    float _762 = _742 * 6.283185482025146484375;
    float _764 = sin(_762);
    float _766 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _768 = fma(_760, _576, _576);
    float _770 = _360 + (-0.5);
    float _772 = _698 * _740;
    float _774 = fma(_766, _760, _766);
    float _776 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[196].z, _768);
    float _778 = _710 * _740;
    float _780 = _686 * _740;
    float _782 = _310 * _732;
    float _784 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _786 = _772 * _784;
    float _788 = _306 * _730;
    float _790 = fma(_774, _680, _776);
    float _792 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _794 = _778 * _792;
    float _796 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _798 = -_786;
    float _800 = fma(_778, _796, _798);
    float _802 = _742 * 6.283185482025146484375;
    float _804 = cos(_802);
    float _806 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _750);
    float _808 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _810 = _780 * _808;
    float _812 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _814 = -_794;
    float _816 = fma(_780, _812, _814);
    float _818 = _800 * _800;
    float _820 = _312 * _734;
    float _822 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _824 = -_810;
    float _826 = fma(_772, _822, _824);
    float _828 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _752);
    float _830 = _756 * 6.283185482025146484375;
    float _832 = sin(_830);
    float _834 = _790 * 0.15915493667125701904296875;
    float _836 = fma(_816, _816, _818);
    float _838 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _754);
    float _840 = _782 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _842 = _788 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _844 = fma(_826, _826, _836);
    float _846 = _820 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _848 = _756 * 6.283185482025146484375;
    float _850 = cos(_848);
    float _852 = _842 * _806;
    float _854 = _834 * 6.283185482025146484375;
    float _856 = sin(_854);
    float _858 = _804 * _832;
    float _860 = _834 * 6.283185482025146484375;
    float _862 = cos(_860);
    float _864 = _764 * _850;
    float _866 = rsqrt(_844);
    float _868 = _840 * _828;
    float _870 = _846 * _838;
    float _872 = -_858;
    float _874 = fma(_856, _864, _872);
    float _876 = -_864;
    float _878 = fma(_856, _858, _876);
    float _880 = _764 * _832;
    float _882 = _832 * _862;
    float _884 = _804 * _850;
    float _886 = _862 * _868;
    float _888 = _850 * _862;
    float _890 = -_868;
    float _892 = _856 * _890;
    float _894 = fma(_856, _884, _880);
    float _896 = _804 * _886;
    float _898 = fma(_856, _880, _884);
    float _900 = _816 * _866;
    float _902 = _800 * _866;
    float _904 = fma(_894, _852, _896);
    float _906 = fma(_888, _852, _892);
    float _908 = _780 * _900;
    float _910 = _764 * _886;
    float _912 = _826 * _866;
    float _914 = fma(_878, _870, _904);
    float _916 = _778 * _902;
    float _918 = -_908;
    float _920 = fma(_772, _902, _918);
    float _922 = fma(_874, _852, _910);
    float _924 = fma(_882, _870, _906);
    float _926 = -_916;
    float _928 = fma(_780, _912, _926);
    float _930 = _920 * _914;
    float _932 = fma(_898, _870, _922);
    float _934 = _928 * _914;
    float _936 = fma(_912, _924, _930);
    float _938 = fma(_900, _924, _934);
    float _940 = fma(_778, _932, _936);
    float _942 = fma(_772, _932, _938);
    float _944 = _452 + _940;
    float _946 = _772 * _912;
    float _948 = _462 + _942;
    float _950 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _952 = _944 + _950;
    float _954 = -_946;
    float _956 = fma(_778, _900, _954);
    float _958 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _960 = _948 + _958;
    float _962 = _952 * _952;
    float _964 = _956 * _914;
    float _966 = fma(_960, _960, _962);
    float _968 = fma(_902, _924, _964);
    float _970 = sqrt(_966);
    float _972 = fma(_780, _932, _968);
    float _974 = _500 + _972;
    bool _976 = _970 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _978 = _778;
    float _980 = _962;
    float _982 = _948;
    float _984 = _968;
    if (!_976)
    {
        _978 = _948;
    }
    float _986 = _978;
    float _988 = _986;
    if (!_976)
    {
        _980 = _944;
    }
    float _990 = _980;
    float _992 = _990;
    if (!_976)
    {
        _982 = _974;
    }
    float _994 = _982;
    bool _996 = !_976;
    float _998 = _994;
    if (!_996)
    {
        float _1000 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1002 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1004 = _970 + _1002;
        float _1006 = _974 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1008 = rsqrt(_966);
        float _1010 = _1004 * _1000;
        float _1012 = _1010 * 0.15915493667125701904296875;
        float _1014 = _1012 * 6.283185482025146484375;
        float _1016 = sin(_1014);
        float _1018 = _1012 * 6.283185482025146484375;
        float _1020 = cos(_1018);
        float _1022 = fma(_1016, _1006, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1024 = _1008 * _1022;
        float _1026 = _1020 + (-1.0);
        float _1028 = fma(_960, _1024, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1030 = fma(_952, _1024, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1032 = _1026 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1034 = fma(_974, _1020, _1032);
        _998 = _1034;
        _988 = _1028;
        _992 = _1030;
        _984 = _1012;
    }
    float _1036 = _998;
    float _1038 = _988;
    float _1040 = _992;
    float _1042 = _984;
    float _1044 = -_500;
    float _1046 = _1044 + _1036;
    float _1048 = -_462;
    float _1050 = _1048 + _1038;
    float _1052 = -_452;
    float _1054 = _1052 + _1040;
    float _1056 = _1046 * _1046;
    bool _1058 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1060 = isnan(0.5);
    bool _1062 = _1058 || _1060;
    bool _1064 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1066 = _1062 || _1064;
    float _1068 = fma(_1050, _1050, _1056);
    float _1070 = fma(_1054, _1054, _1068);
    float _1072 = sqrt(_1070);
    bool _1074 = _1072 > 0.0;
    bool _1076 = !_1074;
    float _1078 = _1038;
    float _1080 = _1040;
    float _1082 = _1036;
    float _1084 = _1042;
    if (!_1076)
    {
        float _1086 = _194 * _194;
        float _1088 = fma(_190, _190, _1086);
        float _1090 = rsqrt(_1070);
        float _1092 = fma(_196, _196, _1088);
        float _1094 = sqrt(_1092);
        float _1096 = _1050 * _1090;
        float _1098 = _1046 * _1090;
        float _1100 = _1054 * _1090;
        bool _1102 = _1094 > 0.0;
        bool _1104 = !_1102;
        _1084 = _1092;
        if (!_1104)
        {
            float _1106 = rsqrt(_1092);
            float _1108 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1110 = _194 * _1106;
            float _1112 = _190 * _1106;
            float _1114 = _196 * _1106;
            float _1116 = _1098 * _1110;
            float _1118 = fma(_1096, _1112, _1116);
            float _1120 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1122 = fma(_1100, _1114, _1118);
            float _1124 = _1122 * _1120;
            float _1126 = fma(_190, _1124, _1038);
            float _1128 = fma(_194, _1124, _1036);
            float _1130 = fma(_196, _1124, _1040);
            _1078 = _1126;
            _1080 = _1130;
            _1082 = _1128;
        }
    }
    float _1132 = _1078;
    float _1134 = _1080;
    float _1136 = _1082;
    float _1138 = _1084;
    float _1140 = _1136;
    float _1142 = _1134;
    float _1144 = _1138;
    if (_1066)
    {
        _200 = _1132;
    }
    float _1146 = _200;
    float _1148 = _1146;
    if (!_1066)
    {
        float _1150 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1152 = _500 + _1150;
        float _1154 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1156 = _462 + _1154;
        float _1158 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1160 = -_452;
        float _1162 = _1160 + _1134;
        float _1164 = _1152 * _1152;
        float _1166 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1168 = _452 + _1166;
        float _1170 = fma(_1156, _1156, _1164);
        float _1172 = fma(_1168, _1168, _1170);
        float _1174 = -_462;
        float _1176 = _1174 + _1132;
        float _1178 = sqrt(_1172);
        float _1180 = precise::min(_1178, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1182 = _1180 * _1158;
        float _1184 = -_500;
        float _1186 = _1184 + _1136;
        float _1188 = fma(_1176, _1182, _462);
        float _1190 = fma(_1186, _1182, _500);
        float _1192 = fma(_1162, _1182, _452);
        _1140 = _1190;
        _1148 = _1188;
        _1142 = _1192;
    }
    float _1194 = _1140;
    float _1196 = _1148;
    float _1198 = _1142;
    float _1200 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1202 = _1194 + _1200;
    float _1204 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1206 = _1196 + _1204;
    float _1208 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1210 = _1198 + _1208;
    float _1212 = _1202 * _1202;
    float _1214 = fma(_1206, _1206, _1212);
    float _1216 = fma(_1210, _1210, _1214);
    float _1218 = rsqrt(_1216);
    float _1220 = sqrt(_1216);
    float _1222 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1224 = _1206 * _1222;
    float _1226 = _1210 * _1222;
    float _1228 = _1224 * _1224;
    float _1230 = _1226 * _1226;
    float _1232 = _1228 + _1230;
    float _1234 = sqrt(_1232);
    bool _1236 = _1234 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1238 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1240 = _1234 + _1238;
    float _1242 = _1210;
    float _1244 = _1232;
    float _1246 = _1240;
    float _1248 = _1222;
    if (_1236)
    {
        float _1250 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1242 = _1250;
    }
    float _1252 = _1242;
    if (_1236)
    {
        float _1254 = rsqrt(_1232);
        _1244 = _1254;
    }
    float _1256 = _1244;
    if (_1236)
    {
        float _1258 = _1240 * _1252;
        _1246 = _1258;
    }
    float _1260 = _1246;
    if (_1236)
    {
        float _1262 = _1260 * 0.15915493667125701904296875;
        _1144 = _1262;
    }
    float _1264 = _1144;
    float _1266 = _1212;
    float _1268 = _1264;
    if (_1236)
    {
        float _1270 = _1264 * 6.283185482025146484375;
        float _1272 = sin(_1270);
        _1266 = _1272;
    }
    float _1274 = _1266;
    float _1276 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1278 = precise::max(0.0, _1276);
    float _1280 = _1218;
    float _1282 = _1278;
    float _1284 = _1276;
    if (_1236)
    {
        float _1286 = _1264 * 6.283185482025146484375;
        float _1288 = cos(_1286);
        _1280 = _1288;
    }
    float _1290 = _1280;
    float _1292 = -_1222;
    float _1294 = -_1278;
    float _1296 = fma(_1202, _1292, _1294);
    float _1298 = _1296;
    if (!_1236)
    {
        _1282 = _1224;
    }
    float _1300 = _1282;
    float _1302 = _1300;
    if (_1236)
    {
        float _1304 = _1296 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1284 = _1304;
    }
    float _1306 = _1284;
    float _1308 = _1274;
    float _1310 = _1306;
    if (_1236)
    {
        float _1312 = fma(_1274, _1306, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1308 = _1312;
    }
    float _1314 = _1308;
    float _1316 = _1314;
    float _1318 = _1290;
    if (_1236)
    {
        float _1320 = _1290 + (-1.0);
        _1310 = _1320;
    }
    float _1322 = _1310;
    float _1324 = _1322;
    if (_1236)
    {
        float _1326 = _1256 * _1314;
        _1248 = _1326;
    }
    float _1328 = _1248;
    if (!_1236)
    {
        _1316 = _1228;
    }
    float _1330 = _1316;
    float _1332 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1334 = _1330;
    if (_1236)
    {
        float _1336 = _1322 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1268 = _1336;
    }
    float _1338 = _1268;
    if (_1236)
    {
        float _1340 = _1224 * _1328;
        _1302 = _1340;
    }
    float _1342 = _1302;
    if (!_1236)
    {
        _1324 = _1226;
    }
    float _1344 = _1324;
    float _1346 = _1344;
    if (_1236)
    {
        float _1348 = _1226 * _1328;
        _1346 = _1348;
    }
    float _1350 = _1346;
    if (_1236)
    {
        float _1352 = fma(_1296, _1290, _1338);
        _1298 = _1352;
    }
    float _1354 = _1298;
    if (_1236)
    {
        float _1356 = _1342 * _1342;
        _1334 = _1356;
    }
    float _1358 = _1334;
    if (!_1236)
    {
        _1318 = _1230;
    }
    float _1360 = _1318;
    float _1362 = _1360;
    if (_1236)
    {
        float _1364 = _1350 * _1350;
        _1362 = _1364;
    }
    float _1366 = _1362;
    float _1368 = fma(_1354, _1354, _1358);
    float _1370 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1332);
    float _1372 = _1368 + _1366;
    float _1374 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1376 = fma(_1220, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1374);
    float _1378 = precise::clamp(_1376, 0.0, 1.0);
    float _1380 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1382 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1384 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1386 = -_1378;
    float _1388 = _1386 + 1.0;
    float _1390 = rsqrt(_1372);
    float _1392 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1380);
    float _1394 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1370);
    float _1396 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1384);
    float _1398 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1392);
    float _1400 = _1394 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1402 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1404 = abs(_1388);
    float _1406 = log2(_1404);
    float _1408 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1396);
    float _1410 = _1398 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1412 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1402);
    float _1414 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1416 = _1408 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1418 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1420 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1412);
    float _1422 = _1390 * _1342;
    float _1424 = _1390 * _1354;
    float _1426 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1418);
    float _1428 = _1390 * _1350;
    float _1430 = _1422 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1432 = _1420 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1434 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1426);
    float _1436 = -_1414;
    float _1438 = fma(_1436, _1382, 1.0);
    float _1440 = _1406 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1442 = -_1430;
    float _1444 = fma(_1424, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1442);
    float _1446 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1434);
    float _1448 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1450 = log2(_1438);
    float _1452 = -_1428;
    float _1454 = fma(_1452, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1444);
    float _1456 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1458 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1448);
    float _1460 = fma(_1454, -0.5, 0.5);
    float _1462 = _1424 + 1.0;
    float _1464 = fma(_1454, 0.5, 0.5);
    float _1466 = exp2(_1440);
    float _1468 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1456);
    float _1470 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1458);
    float _1472 = fma(_1464, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1474 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1468);
    float _1476 = fma(_1464, _1472, -0.212114393711090087890625);
    float _1478 = 1.0 / _1446;
    float _1480 = _1450 * 0.693147182464599609375;
    float _1482 = fma(_1464, _1476, 1.570728778839111328125);
    float _1484 = _1480 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1486 = sqrt(_1460);
    float _1488 = -_1424;
    float _1490 = fma(_1466, _1462, _1488);
    float _1492 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1470);
    float _1494 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1474);
    float _1496 = fma(_1490, 0.5, 0.5);
    float _1498 = _1492 * _1478;
    float _1500 = _1494 * _1478;
    float _1502 = fma(_1498, 0.5, 0.5);
    float _1504 = fma(_1500, -0.5, 0.5);
    float _1506 = _1486 * 0.636619746685028076171875;
    float3 _4560 = float3(_1502, _1504, _1484);
    float _1508 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4560, float3(0.0), isnan(_4560)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4560, float3(0.0), isnan(_4560)), level(0.0)).x;
    float _1510 = -_1482;
    float _1512 = fma(_1506, _1510, 1.0);
    float3 _4576 = float3(_1502, _1504, _1484);
    float4 _1515 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4576, float3(0.0), isnan(_4576)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4576, float3(0.0), isnan(_4576)), level(0.0)).xyzw;
    float _1517 = _1515.x;
    float _1519 = _1515.y;
    float _1521 = _1515.z;
    float _1523 = _1515.w;
    float2 _4593 = float2(_1512, _1496);
    float3 _1527 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4593, float2(0.0), isnan(_4593)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4593, float2(0.0), isnan(_4593)), level(0.0)).xyz;
    float _1529 = _1527.x;
    float _1531 = _1527.y;
    float _1533 = _1527.z;
    float _1535 = in.m_65.z;
    float _1537 = _500 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1541 = _1539 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1543 = in.m_65.x;
    float _1545 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1547 = _1545 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1549 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1551 = in.m_67.y;
    float _1553 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1555 = _1553 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1557 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1559 = _1557 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1561 = in.m_57.w;
    bool _1563 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1565 = isnan(0.5);
    bool _1567 = _1563 || _1565;
    bool _1569 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1571 = _1567 || _1569;
    float _1573 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1537);
    float _1575 = 1.0 / _1541;
    float _1577 = in.m_65.y;
    float _1579 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1581 = _1579 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1583 = _366 > 0.5;
    float _1585 = in.m_65.w;
    float _1587 = fma(_452, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1573);
    float _1589 = 1.0 / _1547;
    out.m_69.z = _1535;
    float _1591 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1593 = _1591 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1595 = _1406 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1599 = _1597 != 0;
    out.m_69.x = _1543;
    float _1601 = 1.0 / _1555;
    float _1603 = -_1551;
    float _1605 = _1603 + 1.0;
    int _1607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1609 = _1607 != 0;
    float _1611 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1613 = _1611 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    int _1615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1617 = _1615 != 0;
    bool _1619 = _1561 > 0.5;
    float _1621 = 1.0 / _1559;
    int _1623 = _1619 ? as_type<int>(_1605) : as_type<int>(_1551);
    out.m_69.y = _1577;
    bool _1625 = _1619;
    bool _1627 = _1617;
    float _1629 = _1551;
    if (_1599)
    {
        bool _1631 = _370 > 0.5;
        _1625 = _1631;
    }
    bool _1633 = _1625;
    float _1635 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1637 = _1635 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1639 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1641 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1639;
    float _1643 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1645 = _1643 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _1647 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1649 = _1647 != 0;
    float _1651 = 1.0 / _1581;
    float _1653 = _1617 ? as_type<float>(_1623) : _1551;
    float _1655 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1657 = _1655 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1659 = _1645 * _1589;
    float _1661 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1663 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1661;
    float _1665 = _1641 * _1601;
    float _1667 = 1.0 / _1593;
    float _1669 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1671 = _1669 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    if (_1609)
    {
        bool _1673 = _360 > 0.5;
        _1627 = _1673;
    }
    bool _1675 = _1627;
    float _1677 = _1663 * _1575;
    float _1679 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1681 = _1679 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1683 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1685 = _1683 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    out.m_69.w = _1585;
    float _1687 = 1.0 / _1657;
    float _1689 = _1685 * _1621;
    float _1691 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1693 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1691;
    float _1695 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1697 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1695;
    float _1699 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1701 = _1699 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1703 = 1.0 / _1637;
    float _1705 = _1693 * _1651;
    float _1707 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1709 = _1707 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1711 = _1701 * _1667;
    float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1715 = _1713 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1717 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1719 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1717;
    float _1721 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1723 = _350 + _1721;
    float _1725 = 1.0 / _1613;
    float _1727 = _1709 * _1687;
    float _1729 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1731 = _350 + _1729;
    float _1733 = fma(_1689, _1723, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    if (_1649)
    {
        float _1735 = _1583 ? _1605 : _1551;
        _1629 = _1735;
    }
    float _1737 = _1629;
    float _1739 = fma(_1659, _1731, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1741 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1743 = _352 + _1741;
    float _1745 = 1.0 / _1681;
    float _1747 = _1719 * _1703;
    bool _1749 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1751 = isnan(_352);
    bool _1753 = _1749 || _1751;
    bool _1755 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1757 = _1753 || _1755;
    float _1759 = float(_1757);
    bool _1761 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1763 = isnan(_350);
    bool _1765 = _1761 || _1763;
    bool _1767 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1769 = _1765 || _1767;
    float _1771 = float(_1769);
    bool _1773 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1775 = isnan(_350);
    bool _1777 = _1773 || _1775;
    bool _1779 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1781 = _1777 || _1779;
    float _1783 = float(_1781);
    float _1785 = -_1759;
    float _1787 = _1785 + 1.0;
    float _1789 = 1.0 / _1671;
    float _1791 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1793 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1791;
    float _1795 = _1697 * _1725;
    bool _1797 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1799 = isnan(_350);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1805 = _1801 || _1803;
    float _1807 = float(_1805);
    float _1809 = -_1783;
    float _1811 = _1809 + 1.0;
    bool _1813 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1815 = isnan(_350);
    bool _1817 = _1813 || _1815;
    bool _1819 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1821 = _1817 || _1819;
    float _1823 = float(_1821);
    float _1825 = fma(_1795, _1743, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1827 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1829 = isnan(_352);
    bool _1831 = _1827 || _1829;
    bool _1833 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1835 = _1831 || _1833;
    float _1837 = float(_1835);
    float _1839 = _1793 * _1745;
    float _1841 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1843 = _352 + _1841;
    float _1845 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1847 = _350 + _1845;
    bool _1849 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1851 = isnan(_352);
    bool _1853 = _1849 || _1851;
    bool _1855 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1857 = _1853 || _1855;
    float _1859 = float(_1857);
    float _1861 = in.m_67.x;
    bool _1863 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1865 = isnan(_352);
    bool _1867 = _1863 || _1865;
    bool _1869 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1871 = _1867 || _1869;
    float _1873 = float(_1871);
    float _1875 = fma(_1677, _1847, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1877 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1879 = _352 + _1877;
    float _1881 = _1715 * _1789;
    float _1883 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1885 = _350 + _1883;
    float _1887 = -_1873;
    float _1889 = _1887 + 1.0;
    float _1891 = fma(_1705, _1879, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1893 = fma(_1881, _1843, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1895 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1897 = _352 + _1895;
    float _1899 = _500 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1901 = fma(_1665, _1885, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1903 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1905 = _352 + _1903;
    float _1907 = fma(_1727, _1897, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    bool _1909 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1911 = isnan(_352);
    bool _1913 = _1909 || _1911;
    bool _1915 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1917 = _1913 || _1915;
    float _1919 = float(_1917);
    float _1921 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1899);
    bool _1923 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1925 = isnan(_352);
    bool _1927 = _1923 || _1925;
    bool _1929 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1931 = _1927 || _1929;
    float _1933 = float(_1931);
    float _1935 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1937 = _352 + _1935;
    bool _1939 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1941 = isnan(_350);
    bool _1943 = _1939 || _1941;
    bool _1945 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1947 = _1943 || _1945;
    float _1949 = float(_1947);
    float _1951 = -_1919;
    float _1953 = _1951 + 1.0;
    float _1955 = fma(_1711, _1905, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1957 = -_1933;
    float _1959 = _1957 + 1.0;
    float _1961 = fma(_1839, _1937, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1963 = _1933 * _1953;
    bool _1965 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1967 = isnan(_352);
    bool _1969 = _1965 || _1967;
    bool _1971 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1973 = _1969 || _1971;
    float _1975 = float(_1973);
    float _1977 = _1759 * _1959;
    float _1979 = -_1823;
    float _1981 = _1979 + 1.0;
    float _1983 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1985 = _352 + _1983;
    bool _1987 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1989 = isnan(_352);
    bool _1991 = _1987 || _1989;
    bool _1993 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1995 = _1991 || _1993;
    float _1997 = float(_1995);
    float _1999 = -_1975;
    float _2001 = _1999 + 1.0;
    float _2003 = _1975 * _1787;
    float _2005 = -_1807;
    float _2007 = _2005 + 1.0;
    float _2009 = _1807 * _1981;
    float _2011 = _1837 * _2001;
    float _2013 = -_1837;
    float _2015 = _2013 + 1.0;
    float _2017 = _1783 * _2007;
    float _2019 = _1587 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2021 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2023 = _1873 * _2015;
    float _2025 = _1549 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2027 = _1771 * _1811;
    float _2029 = -_1771;
    float _2031 = _2029 + 1.0;
    float _2033 = fma(_452, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1921);
    float _2035 = _1859 * _1889;
    float _2037 = -_1859;
    float _2039 = _2037 + 1.0;
    float _2041 = 1.0 / _2019;
    float _2043 = _1949 * _2031;
    float _2045 = _2033 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2047 = _1997 * _2039;
    float _2049 = -_1949;
    float _2051 = _2049 + 1.0;
    float _2053 = _1901 * _2043;
    float _2055 = _2045 + _2019;
    float _2057 = _1825 * _2047;
    float _2059 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2061 = _2021 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2063 = as_type<int>(_2043);
    float _2065 = _1825;
    int _2067 = as_type<int>(_2019);
    float _2069 = _2053;
    float _2071 = _1739;
    float _2073 = _1985;
    float _2075 = _1737;
    float _2077 = _1861;
    float _2079 = _1893;
    if (_1599)
    {
        float _2081 = -_1861;
        float _2083 = _2081 + 1.0;
        _2063 = as_type<int>(_2083);
    }
    int _2085 = _2063;
    if (!_1571)
    {
        _2065 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2087 = _2065;
    float _2089 = _2087;
    if (_1609)
    {
        float _2091 = -_1861;
        float _2093 = _2091 + 1.0;
        _2067 = as_type<int>(_2093);
    }
    int _2095 = _2067;
    float _2097 = fma(_1653, _2025, -0.5);
    float _2099 = fma(_2061, _1737, -0.5);
    float _2101 = _2055 * _2041;
    float _2103 = _2101 * 0.5;
    float _2105 = -_1997;
    float _2107 = _2105 + 1.0;
    float _2109 = fma(_2051, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2053);
    if (!_1571)
    {
        _2069 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2111 = _2069;
    float _2113 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2115 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2113);
    float _2117 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2119 = fma(_1739, _2027, _2109);
    float _2121 = fma(_1747, _1985, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    if (!_1571)
    {
        float _2123 = -_2111;
        float _2125 = _2123 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2071 = _2125;
    }
    float _2127 = _2071;
    if (!_1599)
    {
        _2073 = _1861;
    }
    float _2129 = _2073;
    float _2131 = _2129;
    if (!_1571)
    {
        float _2133 = -_2087;
        float _2135 = _2133 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2075 = _2135;
    }
    float _2137 = _2075;
    if (_1599)
    {
        float _2139 = _1633 ? as_type<float>(_2085) : _1861;
        _2131 = _2139;
    }
    float _2141 = _2131;
    float _2143 = -_632;
    float _2145 = fma(_624, _2099, _2143);
    float _2147 = 1.0 / _2115;
    if (_1609)
    {
        float _2149 = _1675 ? as_type<float>(_2095) : _1861;
        _2077 = _2149;
    }
    float _2151 = _2077;
    float _2153 = -_672;
    float _2155 = fma(_666, _2097, _2153);
    float _2157 = _2059 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2159 = fma(_2107, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2057);
    float _2161 = fma(_1875, _2017, _2119);
    float _2163 = fma(_2157, _2151, -0.5);
    float _2165 = _666;
    if (!_1571)
    {
        float _2167 = 1.0 / _2127;
        _2165 = _2167;
    }
    float _2169 = _2165;
    float _2171 = fma(_1955, _2035, _2159);
    float _2173 = _2117 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2175 = fma(_664, _2163, _670);
    float _2177 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2179 = fma(_1891, _2023, _2171);
    float _2181 = fma(_2173, _2141, -0.5);
    float _2183 = fma(_1733, _2009, _2161);
    float _2185 = _2137;
    if (!_1571)
    {
        float _2187 = 1.0 / _2137;
        _2185 = _2187;
    }
    float _2189 = _2185;
    float _2191 = _2147;
    if (!_1571)
    {
        float _2193 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2195 = -_2087;
        float _2197 = fma(_2147, _2193, _2195);
        _2089 = _2197;
    }
    float _2199 = _2089;
    if (!_1571)
    {
        float _2201 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2203 = -_2111;
        float _2205 = fma(_2147, _2201, _2203);
        _2191 = _2205;
    }
    float _2207 = _2191;
    float _2209 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2177);
    float _2211 = fma(_1893, _2011, _2179);
    float _2213 = fma(_642, _2181, _660);
    if (_1571)
    {
        _676 = 1.0;
    }
    float _2215 = _676;
    float _2217 = exp2(_1595);
    float _2219 = _2169;
    float _2221 = _2215;
    if (!_1571)
    {
        float _2223 = _2207 * _2169;
        float _2225 = precise::clamp(_2223, 0.0, 1.0);
        _2219 = _2225;
    }
    float _2227 = _2219;
    if (_1571)
    {
        _2079 = 1.0;
    }
    float _2229 = _2079;
    float _2231 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2233 = fma(_2121, _2003, _2211);
    float _2235 = _2229;
    if (!_1571)
    {
        float _2237 = -_2227;
        float _2239 = _2237 + 1.0;
        _2235 = _2239;
    }
    float _2241 = _2235;
    float _2243 = _2155 + 0.5;
    float _2245 = _2231 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_1571)
    {
        float _2247 = _2199 * _2189;
        float _2249 = precise::clamp(_2247, 0.0, 1.0);
        _2221 = _2249;
    }
    float _2251 = _2221;
    float _2253 = fma(_1907, _1977, _2233);
    float _2255 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2209);
    float _2257 = _2145 + 0.5;
    float _2259 = _2251 * _2241;
    bool _2261 = _2251 > 0.0;
    bool _2263 = isnan(_2251);
    bool _2265 = _2261 || _2263;
    bool _2267 = isnan(0.0);
    bool _2269 = _2265 || _2267;
    float _2271 = _2213 + 0.5;
    float _2273 = _1446 * 0.5;
    float _2275 = -_2217;
    float _2277 = _2275 + 1.0;
    float _2279 = fma(_1961, _1963, _2253);
    float _2281 = _2277 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2283 = _2259 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2285 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2255);
    bool _2287 = _2241 <= 0.0;
    bool _2289 = !_2269;
    bool _2291 = _2287 || _2289;
    float _2293 = fma(_1494, -0.5, _2273);
    float _2295 = fma(_1919, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2279);
    float _2297 = fma(_1823, (*spvDescriptorSet0.vp_c9)._m0[119].x, _2183);
    float _2299 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2301 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2303 = _2285 + _1446;
    float _2305 = _1492 + _1446;
    float _2307 = _2299 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2309 = _2301 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2311 = _2175 + 0.5;
    float _2313 = _2297 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2315 = _2283 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2317 = _2303 * 0.5;
    float _2319 = _2305 * 0.5;
    out.m_71.x = _2271;
    out.m_71.y = _2257;
    out.m_71.z = _2311;
    out.m_71.w = _2243;
    out.m_73.x = _2307;
    out.m_73.y = _2309;
    out.m_73.z = _2245;
    out.m_73.w = _2313;
    out.m_75.x = _2295;
    out.m_45.x = _2315;
    out.gl_Position.x = _1492;
    out.gl_Position.y = _1494;
    out.gl_Position.z = _2285;
    out.gl_Position.w = _1446;
    out.m_77.x = _2319;
    out.m_77.y = _2293;
    out.m_77.z = _2317;
    out.m_77.w = _1446;
    float _2321 = _2281 * _1508;
    float _2323 = -_2281;
    float _2325 = _2323 + 1.0;
    float _2327 = _1523 * _2321;
    float _2329 = _1523 * _2325;
    float _2331 = _1533 * _2321;
    float _2333 = fma(_1529, _2327, _1517);
    float _2335 = fma(_1531, _2327, _1519);
    float _2337 = fma(_1523, _2331, _1521);
    out.m_79.x = _2333;
    out.m_79.y = _2335;
    out.m_79.z = _2337;
    out.m_79.w = _2329;
    if (!_2291)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2339 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2339;
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _342 = false;
    bool _220 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _93 = in.m_42.w;
    float _95 = trunc(_93);
    int _98 = int(_95);
    bool _102 = _98 >= 1;
    float _104 = 0.0;
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _104;
    float _108 = _106;
    if (!_102)
    {
        out.m_45.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _106 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2396 = as_type<float>(_114);
        out.gl_Position.z = _2396;
    }
    if (!_102)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _118 = in.m_47.w;
    bool _120 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_118);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = -_118;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _134 = _132;
    if (_128)
    {
        float _136 = float(_98);
        _108 = _136;
    }
    float _138 = _108;
    bool _140 = _132 >= _138;
    bool _142 = !_128;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_45.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _116 = as_type<int>(_150);
    }
    int _152 = _116;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2466 = as_type<float>(_152);
        out.gl_Position.z = _2466;
    }
    if (_144)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _154 = in.m_49.x;
    float _156 = in.m_49.y;
    float _158 = in.m_49.z;
    bool _160 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _162 = in.m_51.x;
    float _164 = in.m_51.y;
    float _166 = in.m_51.z;
    float _168 = in.m_53.x;
    float _170 = in.m_53.y;
    float _172 = in.m_53.z;
    float _174 = in.m_55.x;
    float _176 = in.m_55.y;
    float _178 = in.m_55.z;
    float _180 = _156 * _164;
    float _182 = _156 * _170;
    float _184 = fma(_154, _162, _180);
    float _186 = _156 * _176;
    float _188 = fma(_154, _168, _182);
    float _190 = fma(_158, _166, _184);
    float _192 = fma(_154, _174, _186);
    float _194 = fma(_158, _172, _188);
    float _196 = fma(_158, _178, _192);
    bool _198 = !_160;
    float _200 = _190;
    float _218;
    if (!_198)
    {
        float _202 = in.m_57.x;
        float _204 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _206 = _202 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _208 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _210 = _208 * _204;
        float _212 = floor(_210);
        float _214 = -_212;
        float _216 = _210 + _214;
        _218 = _216;
        _220 = true;
    }
    else
    {
        float _222 = float(_98);
        float _224 = 1.0 / _222;
        float _226 = _132 * _224;
        _218 = _226;
    }
    _220 = false;
    float _228 = _218;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = _228 + _230;
    bool _234 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _236 = isnan(_228);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _246;
    bool _250 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _252 = isnan(_228);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = -_244;
    float _264 = _262 + 1.0;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _266;
    float _270 = 1.0 / _248;
    bool _272 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _274 = _260 * _264;
    float _276 = -_260;
    float _278 = _276 + 1.0;
    float _280 = _232 * _270;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _282;
    float _286 = fma(_268, _280, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _288;
    float _292 = fma(_284, _280, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _294 = _286 * _274;
    float _296 = fma(_290, _280, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _298 = _292 * _274;
    float _300 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].x, _294);
    float _302 = _296 * _274;
    float _304 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].z, _298);
    float _306 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[144].x, _300);
    float _308 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].y, _302);
    float _310 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[144].y, _308);
    float _312 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[144].z, _304);
    bool _314 = !_272;
    float _338;
    float _340;
    if (!_314)
    {
        float _316 = in.m_57.x;
        float _318 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _320 = float(_98);
        float _322 = 1.0 / _320;
        float _324 = _316 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _326 = _132 * _322;
        float _328 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _330 = _328 * _318;
        float _332 = floor(_330);
        float _334 = -_332;
        float _336 = _330 + _334;
        _338 = _336;
        _340 = _326;
        _342 = true;
    }
    else
    {
        float _344 = float(_98);
        float _346 = 1.0 / _344;
        float _348 = _132 * _346;
        _338 = _348;
        _340 = _348;
    }
    _342 = false;
    float _350 = _338;
    float _352 = _340;
    float _354 = in.m_42.x;
    float _356 = in.m_42.y;
    float _358 = in.m_42.z;
    float _360 = in.m_57.z;
    int _362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _364 = _362 != 0;
    float _366 = in.m_57.y;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _370 = in.m_57.x;
    int _372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _374 = _372 != 0;
    int _376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _378 = _376 != 0;
    int _380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _382 = _380 != 0;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _386 = in.m_55.w;
    float _388 = in.m_51.w;
    float _390 = _170 * _356;
    float _392 = _164 * _356;
    float _394 = _176 * _356;
    float _396 = fma(_168, _354, _390);
    float _398 = _360 * 2.0;
    float _400 = fma(_162, _354, _392);
    float _402 = fma(_174, _354, _394);
    float _404 = fma(_172, _358, _396);
    float _406 = _366 * 2.0;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _410 = floor(_398);
    float _412 = _370 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _414 = _366 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _416 = _366 + _360;
    float _418 = fma(_178, _358, _402);
    float _420 = -_368;
    float _422 = fma(_412, 2.0, _420);
    float _424 = fma(_414, -2.0, _408);
    float _426 = floor(_406);
    float _428 = _370 * 2.0;
    float _430 = _416 + (-1.0);
    float _432 = fma(_166, _358, _400);
    float _434 = in.m_53.w;
    float _436 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _438 = _370 + _366;
    float _440 = floor(_428);
    bool _442 = _410 >= 0.0;
    bool _444 = isnan(_410);
    bool _446 = _442 || _444;
    bool _448 = isnan(0.0);
    bool _450 = _446 || _448;
    float _452 = _418 + _386;
    bool _454 = !_374;
    int _456 = _454 ? 0 : 1;
    float _458 = _438 + (-1.0);
    int _460 = _450 ? 0 : 1;
    float _462 = _432 + _388;
    float _464 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _466 = _426 > 0.0;
    bool _468 = _426 >= 0.0;
    bool _470 = isnan(_426);
    bool _472 = _468 || _470;
    bool _474 = isnan(0.0);
    bool _476 = _472 || _474;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _480 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _482 = log2(_480);
    bool _484 = _410 > 0.0;
    float _486 = _428;
    float _488 = _458;
    float _490 = _410;
    if (!_364)
    {
        _486 = _366;
    }
    float _492 = _486;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _496 = _492;
    if (!_364)
    {
        _488 = _360;
    }
    float _498 = _488;
    float _500 = _404 + _434;
    float _502 = _498;
    if (_364)
    {
        _496 = _370;
    }
    float _504 = _496;
    if (_364)
    {
        _502 = _366;
    }
    float _506 = _502;
    if (!_364)
    {
        _490 = _360;
    }
    float _508 = _490;
    float _510 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[83].z, _494);
    float _512 = _508;
    if (_364)
    {
        _512 = _366;
    }
    float _514 = _512;
    float _516 = _504 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _518 = _440 > 0.0;
    float _520 = _482 * _132;
    bool _522 = _440 >= 0.0;
    bool _524 = isnan(_440);
    bool _526 = _522 || _524;
    bool _528 = isnan(0.0);
    bool _530 = _526 || _528;
    float _532 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[83].w, _478);
    float _534 = -_384;
    float _536 = fma(_516, 2.0, _534);
    int _538 = ~_460;
    int _540 = _538 + 1;
    int _542 = _540 + 1;
    float _544 = _514 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _546 = abs(_456);
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _550 = _542;
    if (!_484)
    {
        int _552 = ~_460;
        int _554 = _552 + 1;
        _550 = _554;
    }
    int _556 = _550;
    float _558 = exp2(_520);
    float _560 = float(_546);
    float _562 = fma(_544, -2.0, _548);
    float _564 = float(_556);
    float _566 = _560 * _564;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _570 = 1.0 + _568;
    float _572 = in.m_59.x;
    float _574 = in.m_59.y;
    float _576 = in.m_59.z;
    int _578 = _530 ? 0 : 1;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _584 = _476 ? 0 : 1;
    float _586 = 1.0 / _570;
    int _588 = ~_578;
    int _590 = _588 + 1;
    int _592 = _590 + 1;
    float _594 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[78].w, _580);
    int _596 = _592;
    if (!_518)
    {
        int _598 = ~_578;
        int _600 = _598 + 1;
        _596 = _600;
    }
    int _602 = _596;
    float _604 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[78].z, _582);
    bool _606 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _608 = isnan(1.0);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _614 = _610 || _612;
    float _616 = -_558;
    float _618 = _616 + 1.0;
    bool _620 = !_378;
    int _622 = _620 ? 0 : 1;
    float _624 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _594);
    int _626 = ~_584;
    int _628 = _626 + 1;
    int _630 = _628 + 1;
    float _632 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _424);
    int _634 = _630;
    if (!_466)
    {
        int _636 = ~_584;
        int _638 = _636 + 1;
        _634 = _638;
    }
    int _640 = _634;
    float _642 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _604);
    bool _644 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _646 = isnan(0.0);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _652 = _648 || _650;
    float _654 = _566 * (-2.0);
    int _656 = abs(_622);
    float _658 = -_132;
    float _660 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[76].x, _422);
    float _662 = _652 ? _618 : 0.0;
    float _664 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _510);
    float _666 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _532);
    float _668 = -_132;
    float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[81].x, _536);
    float _672 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _562);
    float _674 = float(_656);
    float _676 = _660;
    if (_614)
    {
        float _678 = _662 * _586;
        _134 = _678;
    }
    float _680 = _134;
    float _682 = float(_602);
    float _684 = -_500;
    float _686 = _684 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _688 = fma(_464, _654, _464);
    float _690 = fma(_654, _572, _572);
    float _692 = _370 + (-0.5);
    float _694 = _674 * _682;
    float _696 = -_462;
    float _698 = _696 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _700 = _686 * _686;
    bool _702 = !_382;
    int _704 = _702 ? 0 : 1;
    float _706 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[196].x, _690);
    float _708 = -_452;
    float _710 = _708 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _712 = fma(_698, _698, _700);
    int _714 = abs(_704);
    float _716 = _694 * (-2.0);
    float _718 = float(_640);
    float _720 = fma(_710, _710, _712);
    float _722 = _366 + (-0.5);
    float _724 = fma(_716, _574, _574);
    float _726 = fma(_688, _680, _706);
    float _728 = float(_714);
    float _730 = in.m_61.x;
    float _732 = in.m_61.y;
    float _734 = in.m_61.z;
    float _736 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[196].y, _724);
    float _738 = fma(_436, _716, _436);
    float _740 = rsqrt(_720);
    float _742 = _726 * 0.15915493667125701904296875;
    float _744 = _728 * _718;
    float _746 = fma(_738, _680, _736);
    float _748 = _370 + _360;
    float _750 = in.m_63.x;
    float _752 = in.m_63.y;
    float _754 = in.m_63.z;
    float _756 = _746 * 0.15915493667125701904296875;
    float _758 = _748 + (-1.0);
    float _760 = _744 * (-2.0);
    float _762 = _742 * 6.283185482025146484375;
    float _764 = sin(_762);
    float _766 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _768 = fma(_760, _576, _576);
    float _770 = _360 + (-0.5);
    float _772 = _698 * _740;
    float _774 = fma(_766, _760, _766);
    float _776 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[196].z, _768);
    float _778 = _710 * _740;
    float _780 = _686 * _740;
    float _782 = _310 * _732;
    float _784 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _786 = _772 * _784;
    float _788 = _306 * _730;
    float _790 = fma(_774, _680, _776);
    float _792 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _794 = _778 * _792;
    float _796 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _798 = -_786;
    float _800 = fma(_778, _796, _798);
    float _802 = _742 * 6.283185482025146484375;
    float _804 = cos(_802);
    float _806 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _750);
    float _808 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _810 = _780 * _808;
    float _812 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _814 = -_794;
    float _816 = fma(_780, _812, _814);
    float _818 = _800 * _800;
    float _820 = _312 * _734;
    float _822 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _824 = -_810;
    float _826 = fma(_772, _822, _824);
    float _828 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _752);
    float _830 = _756 * 6.283185482025146484375;
    float _832 = sin(_830);
    float _834 = _790 * 0.15915493667125701904296875;
    float _836 = fma(_816, _816, _818);
    float _838 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _754);
    float _840 = _782 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _842 = _788 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _844 = fma(_826, _826, _836);
    float _846 = _820 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _848 = _756 * 6.283185482025146484375;
    float _850 = cos(_848);
    float _852 = _842 * _806;
    float _854 = _834 * 6.283185482025146484375;
    float _856 = sin(_854);
    float _858 = _804 * _832;
    float _860 = _834 * 6.283185482025146484375;
    float _862 = cos(_860);
    float _864 = _764 * _850;
    float _866 = rsqrt(_844);
    float _868 = _840 * _828;
    float _870 = _846 * _838;
    float _872 = -_858;
    float _874 = fma(_856, _864, _872);
    float _876 = -_864;
    float _878 = fma(_856, _858, _876);
    float _880 = _764 * _832;
    float _882 = _832 * _862;
    float _884 = _804 * _850;
    float _886 = _862 * _868;
    float _888 = _850 * _862;
    float _890 = -_868;
    float _892 = _856 * _890;
    float _894 = fma(_856, _884, _880);
    float _896 = _804 * _886;
    float _898 = fma(_856, _880, _884);
    float _900 = _816 * _866;
    float _902 = _800 * _866;
    float _904 = fma(_894, _852, _896);
    float _906 = fma(_888, _852, _892);
    float _908 = _780 * _900;
    float _910 = _764 * _886;
    float _912 = _826 * _866;
    float _914 = fma(_878, _870, _904);
    float _916 = _778 * _902;
    float _918 = -_908;
    float _920 = fma(_772, _902, _918);
    float _922 = fma(_874, _852, _910);
    float _924 = fma(_882, _870, _906);
    float _926 = -_916;
    float _928 = fma(_780, _912, _926);
    float _930 = _920 * _914;
    float _932 = fma(_898, _870, _922);
    float _934 = _928 * _914;
    float _936 = fma(_912, _924, _930);
    float _938 = fma(_900, _924, _934);
    float _940 = fma(_778, _932, _936);
    float _942 = fma(_772, _932, _938);
    float _944 = _452 + _940;
    float _946 = _772 * _912;
    float _948 = _462 + _942;
    float _950 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _952 = _944 + _950;
    float _954 = -_946;
    float _956 = fma(_778, _900, _954);
    float _958 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _960 = _948 + _958;
    float _962 = _952 * _952;
    float _964 = _956 * _914;
    float _966 = fma(_960, _960, _962);
    float _968 = fma(_902, _924, _964);
    float _970 = sqrt(_966);
    float _972 = fma(_780, _932, _968);
    float _974 = _500 + _972;
    bool _976 = _970 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _978 = _778;
    float _980 = _962;
    float _982 = _948;
    float _984 = _968;
    if (!_976)
    {
        _978 = _948;
    }
    float _986 = _978;
    float _988 = _986;
    if (!_976)
    {
        _980 = _944;
    }
    float _990 = _980;
    float _992 = _990;
    if (!_976)
    {
        _982 = _974;
    }
    float _994 = _982;
    bool _996 = !_976;
    float _998 = _994;
    if (!_996)
    {
        float _1000 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1002 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1004 = _970 + _1002;
        float _1006 = _974 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1008 = rsqrt(_966);
        float _1010 = _1004 * _1000;
        float _1012 = _1010 * 0.15915493667125701904296875;
        float _1014 = _1012 * 6.283185482025146484375;
        float _1016 = sin(_1014);
        float _1018 = _1012 * 6.283185482025146484375;
        float _1020 = cos(_1018);
        float _1022 = fma(_1016, _1006, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1024 = _1008 * _1022;
        float _1026 = _1020 + (-1.0);
        float _1028 = fma(_960, _1024, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1030 = fma(_952, _1024, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1032 = _1026 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1034 = fma(_974, _1020, _1032);
        _998 = _1034;
        _988 = _1028;
        _992 = _1030;
        _984 = _1012;
    }
    float _1036 = _998;
    float _1038 = _988;
    float _1040 = _992;
    float _1042 = _984;
    float _1044 = -_500;
    float _1046 = _1044 + _1036;
    float _1048 = -_462;
    float _1050 = _1048 + _1038;
    float _1052 = -_452;
    float _1054 = _1052 + _1040;
    float _1056 = _1046 * _1046;
    bool _1058 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1060 = isnan(0.5);
    bool _1062 = _1058 || _1060;
    bool _1064 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1066 = _1062 || _1064;
    float _1068 = fma(_1050, _1050, _1056);
    float _1070 = fma(_1054, _1054, _1068);
    float _1072 = sqrt(_1070);
    bool _1074 = _1072 > 0.0;
    bool _1076 = !_1074;
    float _1078 = _1038;
    float _1080 = _1040;
    float _1082 = _1036;
    float _1084 = _1042;
    if (!_1076)
    {
        float _1086 = _194 * _194;
        float _1088 = fma(_190, _190, _1086);
        float _1090 = rsqrt(_1070);
        float _1092 = fma(_196, _196, _1088);
        float _1094 = sqrt(_1092);
        float _1096 = _1050 * _1090;
        float _1098 = _1046 * _1090;
        float _1100 = _1054 * _1090;
        bool _1102 = _1094 > 0.0;
        bool _1104 = !_1102;
        _1084 = _1092;
        if (!_1104)
        {
            float _1106 = rsqrt(_1092);
            float _1108 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1110 = _194 * _1106;
            float _1112 = _190 * _1106;
            float _1114 = _196 * _1106;
            float _1116 = _1098 * _1110;
            float _1118 = fma(_1096, _1112, _1116);
            float _1120 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1122 = fma(_1100, _1114, _1118);
            float _1124 = _1122 * _1120;
            float _1126 = fma(_190, _1124, _1038);
            float _1128 = fma(_194, _1124, _1036);
            float _1130 = fma(_196, _1124, _1040);
            _1078 = _1126;
            _1080 = _1130;
            _1082 = _1128;
        }
    }
    float _1132 = _1078;
    float _1134 = _1080;
    float _1136 = _1082;
    float _1138 = _1084;
    float _1140 = _1136;
    float _1142 = _1134;
    float _1144 = _1138;
    if (_1066)
    {
        _200 = _1132;
    }
    float _1146 = _200;
    float _1148 = _1146;
    if (!_1066)
    {
        float _1150 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1152 = _500 + _1150;
        float _1154 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1156 = _462 + _1154;
        float _1158 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1160 = -_452;
        float _1162 = _1160 + _1134;
        float _1164 = _1152 * _1152;
        float _1166 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1168 = _452 + _1166;
        float _1170 = fma(_1156, _1156, _1164);
        float _1172 = fma(_1168, _1168, _1170);
        float _1174 = -_462;
        float _1176 = _1174 + _1132;
        float _1178 = sqrt(_1172);
        float _1180 = precise::min(_1178, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1182 = _1180 * _1158;
        float _1184 = -_500;
        float _1186 = _1184 + _1136;
        float _1188 = fma(_1176, _1182, _462);
        float _1190 = fma(_1186, _1182, _500);
        float _1192 = fma(_1162, _1182, _452);
        _1140 = _1190;
        _1148 = _1188;
        _1142 = _1192;
    }
    float _1194 = _1140;
    float _1196 = _1148;
    float _1198 = _1142;
    float _1200 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1202 = _1194 + _1200;
    float _1204 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1206 = _1196 + _1204;
    float _1208 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1210 = _1198 + _1208;
    float _1212 = _1202 * _1202;
    float _1214 = fma(_1206, _1206, _1212);
    float _1216 = fma(_1210, _1210, _1214);
    float _1218 = rsqrt(_1216);
    float _1220 = sqrt(_1216);
    float _1222 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1224 = _1206 * _1222;
    float _1226 = _1210 * _1222;
    float _1228 = _1224 * _1224;
    float _1230 = _1226 * _1226;
    float _1232 = _1228 + _1230;
    float _1234 = sqrt(_1232);
    bool _1236 = _1234 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1238 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1240 = _1234 + _1238;
    float _1242 = _1210;
    float _1244 = _1232;
    float _1246 = _1240;
    float _1248 = _1222;
    if (_1236)
    {
        float _1250 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1242 = _1250;
    }
    float _1252 = _1242;
    if (_1236)
    {
        float _1254 = rsqrt(_1232);
        _1244 = _1254;
    }
    float _1256 = _1244;
    if (_1236)
    {
        float _1258 = _1240 * _1252;
        _1246 = _1258;
    }
    float _1260 = _1246;
    if (_1236)
    {
        float _1262 = _1260 * 0.15915493667125701904296875;
        _1144 = _1262;
    }
    float _1264 = _1144;
    float _1266 = _1212;
    float _1268 = _1264;
    if (_1236)
    {
        float _1270 = _1264 * 6.283185482025146484375;
        float _1272 = sin(_1270);
        _1266 = _1272;
    }
    float _1274 = _1266;
    float _1276 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1278 = precise::max(0.0, _1276);
    float _1280 = _1218;
    float _1282 = _1278;
    float _1284 = _1276;
    if (_1236)
    {
        float _1286 = _1264 * 6.283185482025146484375;
        float _1288 = cos(_1286);
        _1280 = _1288;
    }
    float _1290 = _1280;
    float _1292 = -_1222;
    float _1294 = -_1278;
    float _1296 = fma(_1202, _1292, _1294);
    float _1298 = _1296;
    if (!_1236)
    {
        _1282 = _1224;
    }
    float _1300 = _1282;
    float _1302 = _1300;
    if (_1236)
    {
        float _1304 = _1296 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1284 = _1304;
    }
    float _1306 = _1284;
    float _1308 = _1274;
    float _1310 = _1306;
    if (_1236)
    {
        float _1312 = fma(_1274, _1306, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1308 = _1312;
    }
    float _1314 = _1308;
    float _1316 = _1314;
    float _1318 = _1290;
    if (_1236)
    {
        float _1320 = _1290 + (-1.0);
        _1310 = _1320;
    }
    float _1322 = _1310;
    float _1324 = _1322;
    if (_1236)
    {
        float _1326 = _1256 * _1314;
        _1248 = _1326;
    }
    float _1328 = _1248;
    if (!_1236)
    {
        _1316 = _1228;
    }
    float _1330 = _1316;
    float _1332 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1334 = _1330;
    if (_1236)
    {
        float _1336 = _1322 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1268 = _1336;
    }
    float _1338 = _1268;
    if (_1236)
    {
        float _1340 = _1224 * _1328;
        _1302 = _1340;
    }
    float _1342 = _1302;
    if (!_1236)
    {
        _1324 = _1226;
    }
    float _1344 = _1324;
    float _1346 = _1344;
    if (_1236)
    {
        float _1348 = _1226 * _1328;
        _1346 = _1348;
    }
    float _1350 = _1346;
    if (_1236)
    {
        float _1352 = fma(_1296, _1290, _1338);
        _1298 = _1352;
    }
    float _1354 = _1298;
    if (_1236)
    {
        float _1356 = _1342 * _1342;
        _1334 = _1356;
    }
    float _1358 = _1334;
    if (!_1236)
    {
        _1318 = _1230;
    }
    float _1360 = _1318;
    float _1362 = _1360;
    if (_1236)
    {
        float _1364 = _1350 * _1350;
        _1362 = _1364;
    }
    float _1366 = _1362;
    float _1368 = fma(_1354, _1354, _1358);
    float _1370 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1332);
    float _1372 = _1368 + _1366;
    float _1374 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1376 = fma(_1220, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1374);
    float _1378 = precise::clamp(_1376, 0.0, 1.0);
    float _1380 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1382 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1384 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1386 = -_1378;
    float _1388 = _1386 + 1.0;
    float _1390 = rsqrt(_1372);
    float _1392 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1380);
    float _1394 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1370);
    float _1396 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1384);
    float _1398 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1392);
    float _1400 = _1394 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1402 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1404 = abs(_1388);
    float _1406 = log2(_1404);
    float _1408 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1396);
    float _1410 = _1398 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1412 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1402);
    float _1414 = _1400 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1416 = _1408 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1418 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1420 = fma(_1198, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1412);
    float _1422 = _1390 * _1342;
    float _1424 = _1390 * _1354;
    float _1426 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1418);
    float _1428 = _1390 * _1350;
    float _1430 = _1422 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1432 = _1420 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1434 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1426);
    float _1436 = -_1414;
    float _1438 = fma(_1436, _1382, 1.0);
    float _1440 = _1406 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1442 = -_1430;
    float _1444 = fma(_1424, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1442);
    float _1446 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1434);
    float _1448 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1450 = log2(_1438);
    float _1452 = -_1428;
    float _1454 = fma(_1452, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1444);
    float _1456 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1458 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1448);
    float _1460 = fma(_1454, -0.5, 0.5);
    float _1462 = _1424 + 1.0;
    float _1464 = fma(_1454, 0.5, 0.5);
    float _1466 = exp2(_1440);
    float _1468 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1456);
    float _1470 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1458);
    float _1472 = fma(_1464, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1474 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1468);
    float _1476 = fma(_1464, _1472, -0.212114393711090087890625);
    float _1478 = 1.0 / _1446;
    float _1480 = _1450 * 0.693147182464599609375;
    float _1482 = fma(_1464, _1476, 1.570728778839111328125);
    float _1484 = _1480 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1486 = sqrt(_1460);
    float _1488 = -_1424;
    float _1490 = fma(_1466, _1462, _1488);
    float _1492 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1470);
    float _1494 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1474);
    float _1496 = fma(_1490, 0.5, 0.5);
    float _1498 = _1492 * _1478;
    float _1500 = _1494 * _1478;
    float _1502 = fma(_1498, 0.5, 0.5);
    float _1504 = fma(_1500, -0.5, 0.5);
    float _1506 = _1486 * 0.636619746685028076171875;
    float3 _4560 = float3(_1502, _1504, _1484);
    float _1508 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4560, float3(0.0), isnan(_4560)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4560, float3(0.0), isnan(_4560)), level(0.0)).x;
    float _1510 = -_1482;
    float _1512 = fma(_1506, _1510, 1.0);
    float3 _4576 = float3(_1502, _1504, _1484);
    float4 _1515 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4576, float3(0.0), isnan(_4576)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4576, float3(0.0), isnan(_4576)), level(0.0)).xyzw;
    float _1517 = _1515.x;
    float _1519 = _1515.y;
    float _1521 = _1515.z;
    float _1523 = _1515.w;
    float2 _4593 = float2(_1512, _1496);
    float3 _1527 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4593, float2(0.0), isnan(_4593)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4593, float2(0.0), isnan(_4593)), level(0.0)).xyz;
    float _1529 = _1527.x;
    float _1531 = _1527.y;
    float _1533 = _1527.z;
    float _1535 = in.m_65.z;
    float _1537 = _500 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1541 = _1539 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1543 = in.m_65.x;
    float _1545 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1547 = _1545 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1549 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1551 = in.m_67.y;
    float _1553 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1555 = _1553 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1557 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1559 = _1557 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1561 = in.m_57.w;
    bool _1563 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1565 = isnan(0.5);
    bool _1567 = _1563 || _1565;
    bool _1569 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1571 = _1567 || _1569;
    float _1573 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1537);
    float _1575 = 1.0 / _1541;
    float _1577 = in.m_65.y;
    float _1579 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1581 = _1579 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1583 = _366 > 0.5;
    float _1585 = in.m_65.w;
    float _1587 = fma(_452, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1573);
    float _1589 = 1.0 / _1547;
    out.m_69.z = _1535;
    float _1591 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1593 = _1591 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1595 = _1406 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1599 = _1597 != 0;
    out.m_69.x = _1543;
    float _1601 = 1.0 / _1555;
    float _1603 = -_1551;
    float _1605 = _1603 + 1.0;
    int _1607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1609 = _1607 != 0;
    float _1611 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1613 = _1611 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    int _1615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1617 = _1615 != 0;
    bool _1619 = _1561 > 0.5;
    float _1621 = 1.0 / _1559;
    int _1623 = _1619 ? as_type<int>(_1605) : as_type<int>(_1551);
    out.m_69.y = _1577;
    bool _1625 = _1619;
    bool _1627 = _1617;
    float _1629 = _1551;
    if (_1599)
    {
        bool _1631 = _370 > 0.5;
        _1625 = _1631;
    }
    bool _1633 = _1625;
    float _1635 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1637 = _1635 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1639 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1641 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1639;
    float _1643 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1645 = _1643 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _1647 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1649 = _1647 != 0;
    float _1651 = 1.0 / _1581;
    float _1653 = _1617 ? as_type<float>(_1623) : _1551;
    float _1655 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1657 = _1655 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1659 = _1645 * _1589;
    float _1661 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1663 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1661;
    float _1665 = _1641 * _1601;
    float _1667 = 1.0 / _1593;
    float _1669 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1671 = _1669 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    if (_1609)
    {
        bool _1673 = _360 > 0.5;
        _1627 = _1673;
    }
    bool _1675 = _1627;
    float _1677 = _1663 * _1575;
    float _1679 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1681 = _1679 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1683 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1685 = _1683 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    out.m_69.w = _1585;
    float _1687 = 1.0 / _1657;
    float _1689 = _1685 * _1621;
    float _1691 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1693 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1691;
    float _1695 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1697 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1695;
    float _1699 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1701 = _1699 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1703 = 1.0 / _1637;
    float _1705 = _1693 * _1651;
    float _1707 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1709 = _1707 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1711 = _1701 * _1667;
    float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1715 = _1713 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1717 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1719 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1717;
    float _1721 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1723 = _350 + _1721;
    float _1725 = 1.0 / _1613;
    float _1727 = _1709 * _1687;
    float _1729 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1731 = _350 + _1729;
    float _1733 = fma(_1689, _1723, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    if (_1649)
    {
        float _1735 = _1583 ? _1605 : _1551;
        _1629 = _1735;
    }
    float _1737 = _1629;
    float _1739 = fma(_1659, _1731, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1741 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1743 = _352 + _1741;
    float _1745 = 1.0 / _1681;
    float _1747 = _1719 * _1703;
    bool _1749 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1751 = isnan(_352);
    bool _1753 = _1749 || _1751;
    bool _1755 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1757 = _1753 || _1755;
    float _1759 = float(_1757);
    bool _1761 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1763 = isnan(_350);
    bool _1765 = _1761 || _1763;
    bool _1767 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1769 = _1765 || _1767;
    float _1771 = float(_1769);
    bool _1773 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1775 = isnan(_350);
    bool _1777 = _1773 || _1775;
    bool _1779 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1781 = _1777 || _1779;
    float _1783 = float(_1781);
    float _1785 = -_1759;
    float _1787 = _1785 + 1.0;
    float _1789 = 1.0 / _1671;
    float _1791 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1793 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1791;
    float _1795 = _1697 * _1725;
    bool _1797 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1799 = isnan(_350);
    bool _1801 = _1797 || _1799;
    bool _1803 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1805 = _1801 || _1803;
    float _1807 = float(_1805);
    float _1809 = -_1783;
    float _1811 = _1809 + 1.0;
    bool _1813 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1815 = isnan(_350);
    bool _1817 = _1813 || _1815;
    bool _1819 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1821 = _1817 || _1819;
    float _1823 = float(_1821);
    float _1825 = fma(_1795, _1743, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1827 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1829 = isnan(_352);
    bool _1831 = _1827 || _1829;
    bool _1833 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1835 = _1831 || _1833;
    float _1837 = float(_1835);
    float _1839 = _1793 * _1745;
    float _1841 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1843 = _352 + _1841;
    float _1845 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1847 = _350 + _1845;
    bool _1849 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1851 = isnan(_352);
    bool _1853 = _1849 || _1851;
    bool _1855 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1857 = _1853 || _1855;
    float _1859 = float(_1857);
    float _1861 = in.m_67.x;
    bool _1863 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1865 = isnan(_352);
    bool _1867 = _1863 || _1865;
    bool _1869 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1871 = _1867 || _1869;
    float _1873 = float(_1871);
    float _1875 = fma(_1677, _1847, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1877 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1879 = _352 + _1877;
    float _1881 = _1715 * _1789;
    float _1883 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1885 = _350 + _1883;
    float _1887 = -_1873;
    float _1889 = _1887 + 1.0;
    float _1891 = fma(_1705, _1879, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1893 = fma(_1881, _1843, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1895 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1897 = _352 + _1895;
    float _1899 = _500 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1901 = fma(_1665, _1885, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1903 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1905 = _352 + _1903;
    float _1907 = fma(_1727, _1897, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    bool _1909 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1911 = isnan(_352);
    bool _1913 = _1909 || _1911;
    bool _1915 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1917 = _1913 || _1915;
    float _1919 = float(_1917);
    float _1921 = fma(_462, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1899);
    bool _1923 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1925 = isnan(_352);
    bool _1927 = _1923 || _1925;
    bool _1929 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1931 = _1927 || _1929;
    float _1933 = float(_1931);
    float _1935 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1937 = _352 + _1935;
    bool _1939 = _350 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1941 = isnan(_350);
    bool _1943 = _1939 || _1941;
    bool _1945 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1947 = _1943 || _1945;
    float _1949 = float(_1947);
    float _1951 = -_1919;
    float _1953 = _1951 + 1.0;
    float _1955 = fma(_1711, _1905, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1957 = -_1933;
    float _1959 = _1957 + 1.0;
    float _1961 = fma(_1839, _1937, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1963 = _1933 * _1953;
    bool _1965 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1967 = isnan(_352);
    bool _1969 = _1965 || _1967;
    bool _1971 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1973 = _1969 || _1971;
    float _1975 = float(_1973);
    float _1977 = _1759 * _1959;
    float _1979 = -_1823;
    float _1981 = _1979 + 1.0;
    float _1983 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1985 = _352 + _1983;
    bool _1987 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1989 = isnan(_352);
    bool _1991 = _1987 || _1989;
    bool _1993 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1995 = _1991 || _1993;
    float _1997 = float(_1995);
    float _1999 = -_1975;
    float _2001 = _1999 + 1.0;
    float _2003 = _1975 * _1787;
    float _2005 = -_1807;
    float _2007 = _2005 + 1.0;
    float _2009 = _1807 * _1981;
    float _2011 = _1837 * _2001;
    float _2013 = -_1837;
    float _2015 = _2013 + 1.0;
    float _2017 = _1783 * _2007;
    float _2019 = _1587 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2021 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2023 = _1873 * _2015;
    float _2025 = _1549 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2027 = _1771 * _1811;
    float _2029 = -_1771;
    float _2031 = _2029 + 1.0;
    float _2033 = fma(_452, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1921);
    float _2035 = _1859 * _1889;
    float _2037 = -_1859;
    float _2039 = _2037 + 1.0;
    float _2041 = 1.0 / _2019;
    float _2043 = _1949 * _2031;
    float _2045 = _2033 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2047 = _1997 * _2039;
    float _2049 = -_1949;
    float _2051 = _2049 + 1.0;
    float _2053 = _1901 * _2043;
    float _2055 = _2045 + _2019;
    float _2057 = _1825 * _2047;
    float _2059 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2061 = _2021 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2063 = as_type<int>(_2043);
    float _2065 = _1825;
    int _2067 = as_type<int>(_2019);
    float _2069 = _2053;
    float _2071 = _1739;
    float _2073 = _1985;
    float _2075 = _1737;
    float _2077 = _1861;
    float _2079 = _1893;
    if (_1599)
    {
        float _2081 = -_1861;
        float _2083 = _2081 + 1.0;
        _2063 = as_type<int>(_2083);
    }
    int _2085 = _2063;
    if (!_1571)
    {
        _2065 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2087 = _2065;
    float _2089 = _2087;
    if (_1609)
    {
        float _2091 = -_1861;
        float _2093 = _2091 + 1.0;
        _2067 = as_type<int>(_2093);
    }
    int _2095 = _2067;
    float _2097 = fma(_1653, _2025, -0.5);
    float _2099 = fma(_2061, _1737, -0.5);
    float _2101 = _2055 * _2041;
    float _2103 = _2101 * 0.5;
    float _2105 = -_1997;
    float _2107 = _2105 + 1.0;
    float _2109 = fma(_2051, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2053);
    if (!_1571)
    {
        _2069 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2111 = _2069;
    float _2113 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2115 = fma(_2103, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2113);
    float _2117 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2119 = fma(_1739, _2027, _2109);
    float _2121 = fma(_1747, _1985, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    if (!_1571)
    {
        float _2123 = -_2111;
        float _2125 = _2123 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2071 = _2125;
    }
    float _2127 = _2071;
    if (!_1599)
    {
        _2073 = _1861;
    }
    float _2129 = _2073;
    float _2131 = _2129;
    if (!_1571)
    {
        float _2133 = -_2087;
        float _2135 = _2133 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2075 = _2135;
    }
    float _2137 = _2075;
    if (_1599)
    {
        float _2139 = _1633 ? as_type<float>(_2085) : _1861;
        _2131 = _2139;
    }
    float _2141 = _2131;
    float _2143 = -_632;
    float _2145 = fma(_624, _2099, _2143);
    float _2147 = 1.0 / _2115;
    if (_1609)
    {
        float _2149 = _1675 ? as_type<float>(_2095) : _1861;
        _2077 = _2149;
    }
    float _2151 = _2077;
    float _2153 = -_672;
    float _2155 = fma(_666, _2097, _2153);
    float _2157 = _2059 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2159 = fma(_2107, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2057);
    float _2161 = fma(_1875, _2017, _2119);
    float _2163 = fma(_2157, _2151, -0.5);
    float _2165 = _666;
    if (!_1571)
    {
        float _2167 = 1.0 / _2127;
        _2165 = _2167;
    }
    float _2169 = _2165;
    float _2171 = fma(_1955, _2035, _2159);
    float _2173 = _2117 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2175 = fma(_664, _2163, _670);
    float _2177 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2179 = fma(_1891, _2023, _2171);
    float _2181 = fma(_2173, _2141, -0.5);
    float _2183 = fma(_1733, _2009, _2161);
    float _2185 = _2137;
    if (!_1571)
    {
        float _2187 = 1.0 / _2137;
        _2185 = _2187;
    }
    float _2189 = _2185;
    float _2191 = _2147;
    if (!_1571)
    {
        float _2193 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2195 = -_2087;
        float _2197 = fma(_2147, _2193, _2195);
        _2089 = _2197;
    }
    float _2199 = _2089;
    if (!_1571)
    {
        float _2201 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2203 = -_2111;
        float _2205 = fma(_2147, _2201, _2203);
        _2191 = _2205;
    }
    float _2207 = _2191;
    float _2209 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2177);
    float _2211 = fma(_1893, _2011, _2179);
    float _2213 = fma(_642, _2181, _660);
    if (_1571)
    {
        _676 = 1.0;
    }
    float _2215 = _676;
    float _2217 = exp2(_1595);
    float _2219 = _2169;
    float _2221 = _2215;
    if (!_1571)
    {
        float _2223 = _2207 * _2169;
        float _2225 = precise::clamp(_2223, 0.0, 1.0);
        _2219 = _2225;
    }
    float _2227 = _2219;
    if (_1571)
    {
        _2079 = 1.0;
    }
    float _2229 = _2079;
    float _2231 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2233 = fma(_2121, _2003, _2211);
    float _2235 = _2229;
    if (!_1571)
    {
        float _2237 = -_2227;
        float _2239 = _2237 + 1.0;
        _2235 = _2239;
    }
    float _2241 = _2235;
    float _2243 = _2155 + 0.5;
    float _2245 = _2231 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_1571)
    {
        float _2247 = _2199 * _2189;
        float _2249 = precise::clamp(_2247, 0.0, 1.0);
        _2221 = _2249;
    }
    float _2251 = _2221;
    float _2253 = fma(_1907, _1977, _2233);
    float _2255 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2209);
    float _2257 = _2145 + 0.5;
    float _2259 = _2251 * _2241;
    bool _2261 = _2251 > 0.0;
    bool _2263 = isnan(_2251);
    bool _2265 = _2261 || _2263;
    bool _2267 = isnan(0.0);
    bool _2269 = _2265 || _2267;
    float _2271 = _2213 + 0.5;
    float _2273 = _1446 * 0.5;
    float _2275 = -_2217;
    float _2277 = _2275 + 1.0;
    float _2279 = fma(_1961, _1963, _2253);
    float _2281 = _2277 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2283 = _2259 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2285 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2255);
    bool _2287 = _2241 <= 0.0;
    bool _2289 = !_2269;
    bool _2291 = _2287 || _2289;
    float _2293 = fma(_1494, -0.5, _2273);
    float _2295 = fma(_1919, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2279);
    float _2297 = fma(_1823, (*spvDescriptorSet0.vp_c9)._m0[119].x, _2183);
    float _2299 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2301 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2303 = _2285 + _1446;
    float _2305 = _1492 + _1446;
    float _2307 = _2299 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2309 = _2301 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2311 = _2175 + 0.5;
    float _2313 = _2297 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2315 = _2283 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2317 = _2303 * 0.5;
    float _2319 = _2305 * 0.5;
    out.m_71.x = _2271;
    out.m_71.y = _2257;
    out.m_71.z = _2311;
    out.m_71.w = _2243;
    out.m_73.x = _2307;
    out.m_73.y = _2309;
    out.m_73.z = _2245;
    out.m_73.w = _2313;
    out.m_75.x = _2295;
    out.m_45.x = _2315;
    out.gl_Position.x = _1492;
    out.gl_Position.y = _1494;
    out.gl_Position.z = _2285;
    out.gl_Position.w = _1446;
    out.m_77.x = _2319;
    out.m_77.y = _2293;
    out.m_77.z = _2317;
    out.m_77.w = _1446;
    float _2321 = _2281 * _1508;
    float _2323 = -_2281;
    float _2325 = _2323 + 1.0;
    float _2327 = _1523 * _2321;
    float _2329 = _1523 * _2325;
    float _2331 = _1533 * _2321;
    float _2333 = fma(_1529, _2327, _1517);
    float _2335 = fma(_1531, _2327, _1519);
    float _2337 = fma(_1523, _2331, _1521);
    out.m_79.x = _2333;
    out.m_79.y = _2335;
    out.m_79.z = _2337;
    out.m_79.w = _2329;
    if (!_2291)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2339 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2339;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

