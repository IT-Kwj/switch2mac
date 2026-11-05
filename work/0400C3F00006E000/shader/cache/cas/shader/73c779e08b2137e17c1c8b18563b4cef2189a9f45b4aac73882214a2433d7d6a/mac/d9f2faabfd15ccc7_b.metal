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
    constant _16* vp_c7 [[id(5)]];
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
    float4 m_55 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_71 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_59 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1618 = false;
    bool _764 = false;
    bool _650 = false;
    bool _456 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2238 = as_type<float>(_106);
        out.gl_Position.z = _2238;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _110 = in.m_49.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = _124;
    if (_120)
    {
        float _128 = float(_90);
        _100 = _128;
    }
    float _130 = _100;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2308 = as_type<float>(_144);
        out.gl_Position.z = _2308;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_51.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_49.x;
    float _162 = in.m_49.y;
    float _164 = in.m_49.z;
    float _166 = in.m_44.x;
    float _168 = in.m_44.y;
    float _170 = in.m_44.z;
    float _172 = 0.0;
    float _174 = _148;
    if (!_158)
    {
        float _176 = _148 * _148;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = _180;
    if (!_158)
    {
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    bool _188 = !_158;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _148 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _148);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    bool _224 = !_158;
    if (!_224)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _148 * _228;
        float _238 = exp2(_236);
        float _240 = -_238;
        float _242 = _240 + 1.0;
        float _244 = _242 * _234;
        _174 = _244;
    }
    float _246 = _174;
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _250 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _254 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _256 = fma(_246, _160, _250);
    float _258 = fma(_246, _162, _252);
    float _260 = fma(_246, _164, _254);
    float _262 = fma(_256, _146, _166);
    float _264 = fma(_258, _146, _168);
    float _266 = fma(_260, _146, _170);
    bool _268 = !_248;
    float _286;
    if (!_268)
    {
        float _270 = in.m_53.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        float _290 = float(_90);
        float _292 = 1.0 / _290;
        float _294 = _124 * _292;
        _286 = _294;
    }
    _288 = false;
    float _296 = _286;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = _296 + _298;
    bool _302 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _304 = isnan(_296);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    bool _314 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _316 = isnan(_296);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _334 = 1.0 / _328;
    bool _336 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _338 = 1.0 / _332;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _340;
    float _344 = _300 * _334;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _348 = _296 + _346;
    bool _350 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _352 = isnan(_296);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = -_312;
    float _364 = _362 + 1.0;
    float _366 = fma(_342, _344, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _368 = _360 * _364;
    float _370 = -_360;
    float _372 = _370 + 1.0;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _378;
    float _382 = _348 * _338;
    float _384 = _324 * _372;
    float _386 = fma(_376, _344, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _388 = fma(_380, _344, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _390 = -_324;
    float _392 = _390 + 1.0;
    float _394 = _366 * _384;
    float _396 = _386 * _384;
    float _398 = _388 * _384;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _412 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].x, _396);
    float _414 = fma(_402, _382, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _416 = fma(_406, _382, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _418 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].y, _394);
    float _420 = fma(_410, _382, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _422 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].z, _398);
    float _424 = fma(_414, _368, _412);
    float _426 = fma(_416, _368, _418);
    float _428 = fma(_420, _368, _422);
    float _430 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[145].x, _424);
    float _432 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[145].y, _426);
    float _434 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[145].z, _428);
    bool _436 = !_336;
    float _454;
    if (!_436)
    {
        float _438 = in.m_53.x;
        float _440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _442 = _438 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _444 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _446 = _444 * _440;
        float _448 = floor(_446);
        float _450 = -_448;
        float _452 = _446 + _450;
        _454 = _452;
        _456 = true;
    }
    else
    {
        float _458 = float(_90);
        float _460 = 1.0 / _458;
        float _462 = _124 * _460;
        _454 = _462;
    }
    _456 = false;
    float _464 = _454;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _468 = _464 + _466;
    bool _470 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _472 = isnan(_464);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _484 = _464 + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _486;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _494 = -_480;
    float _496 = _494 + 1.0;
    float _498 = 1.0 / _488;
    bool _500 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _502 = 1.0 / _492;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _504;
    float _508 = _468 * _498;
    bool _510 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _512 = isnan(_464);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _522;
    bool _526 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _528 = isnan(_464);
    bool _530 = _526 || _528;
    bool _532 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _534 = _530 || _532;
    float _536 = float(_534);
    float _538 = fma(_506, _508, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _540 = fma(_524, _508, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _542 = _536 * _496;
    float _544 = -_536;
    float _546 = _544 + 1.0;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _548;
    float _552 = _484 * _502;
    float _554 = _520 * _546;
    float _556 = fma(_550, _508, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _558 = -_520;
    float _560 = _558 + 1.0;
    float _562 = _538 * _554;
    float _564 = _556 * _554;
    float _566 = _540 * _554;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _570 = _568 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _580 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[107].x, _564);
    float _582 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[107].y, _562);
    float _584 = fma(_570, _552, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _586 = fma(_574, _552, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _588 = fma(_578, _552, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _590 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[107].z, _566);
    float _592 = fma(_584, _542, _580);
    float _594 = fma(_586, _542, _582);
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _598 = fma(_588, _542, _590);
    float _600 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[109].x, _592);
    float _602 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[109].y, _594);
    float _604 = in.m_51.x;
    float _606 = in.m_51.y;
    float _608 = in.m_51.z;
    float _610 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[109].z, _598);
    float _612 = _600 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _614 = _602 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _616 = _610 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _618 = _612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _620 = _614 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _622 = _616 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _618;
    out.m_55.y = _620;
    out.m_55.z = _622;
    out.m_55.w = _596;
    float _624 = _434 * _608;
    float _626 = _432 * _606;
    float _628 = _430 * _604;
    bool _630 = !_500;
    float _648;
    if (!_630)
    {
        float _632 = in.m_53.x;
        float _634 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _636 = _632 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _638 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _640 = _638 * _634;
        float _642 = floor(_640);
        float _644 = -_642;
        float _646 = _640 + _644;
        _648 = _646;
        _650 = true;
    }
    else
    {
        float _652 = float(_90);
        float _654 = 1.0 / _652;
        float _656 = _124 * _654;
        _648 = _656;
    }
    _650 = false;
    float _658 = _648;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _662 = _658 + _660;
    bool _664 = _658 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _666 = isnan(_658);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _672 = _668 || _670;
    float _674 = float(_672);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _676;
    bool _680 = _658 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _682 = isnan(_658);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = 1.0 / _678;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _694;
    bool _698 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _700;
    float _704 = _662 * _692;
    float _706 = -_674;
    float _708 = _706 + 1.0;
    float _710 = fma(_696, _704, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _712 = fma(_702, _704, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _714;
    float _718 = _690 * _708;
    float _720 = -_690;
    float _722 = _720 + 1.0;
    float _724 = fma(_716, _704, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _726 = _710 * _718;
    float _728 = _724 * _718;
    float _730 = _712 * _718;
    float _732 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[123].x, _726);
    float _734 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[123].y, _728);
    float _736 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[123].z, _730);
    float _738 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[124].x, _732);
    float _740 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[124].y, _734);
    float _742 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[124].z, _736);
    bool _744 = !_698;
    float _762;
    if (!_744)
    {
        float _746 = in.m_53.x;
        float _748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _750 = _746 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _752 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _754 = _752 * _748;
        float _756 = floor(_754);
        float _758 = -_756;
        float _760 = _754 + _758;
        _762 = _760;
        _764 = true;
    }
    else
    {
        float _766 = float(_90);
        float _768 = 1.0 / _766;
        float _770 = _124 * _768;
        _762 = _770;
    }
    _764 = false;
    float _772 = _762;
    float _774 = in.m_53.z;
    float _776 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _778 = in.m_53.x;
    int _780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _782 = _780 != 0;
    int _784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _786 = _784 != 0;
    int _788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _790 = _788 != 0;
    float _792 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _794 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _796 = in.m_53.y;
    float _798 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _776);
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _802 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _792);
    float _804 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _794);
    float _806 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _798);
    float _808 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _802);
    float _810 = _626 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _814 = _628 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _816 = _624 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _818 = _774 * 2.0;
    float _820 = _778 * 2.0;
    float _822 = _778 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _824 = floor(_818);
    float _826 = _796 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _828 = -_800;
    float _830 = fma(_822, 2.0, _828);
    float _832 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _804);
    bool _834 = !_782;
    int _836 = _834 ? 0 : 1;
    float _838 = fma(_826, -2.0, _812);
    float _840 = _796 * 2.0;
    float _842 = floor(_820);
    int _844 = abs(_836);
    float _846 = _832 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _848 = _778 + _796;
    bool _850 = _796 > 0.5;
    float _852 = float(_844);
    float _854 = _848 + (-1.0);
    bool _856 = _824 > 0.0;
    float _858 = floor(_840);
    bool _860 = _824 >= 0.0;
    bool _862 = isnan(_824);
    bool _864 = _860 || _862;
    bool _866 = isnan(0.0);
    bool _868 = _864 || _866;
    float _870 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _872 = _868 ? 0 : 1;
    bool _874 = _842 > 0.0;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _878 = 1.0 + _876;
    int _880 = ~_872;
    int _882 = _880 + 1;
    int _884 = _882 + 1;
    bool _886 = _842 >= 0.0;
    bool _888 = isnan(_842);
    bool _890 = _886 || _888;
    bool _892 = isnan(0.0);
    bool _894 = _890 || _892;
    float _896 = 1.0 / _878;
    int _898 = _884;
    bool _900 = _786;
    if (!_856)
    {
        int _902 = ~_872;
        int _904 = _902 + 1;
        _898 = _904;
    }
    int _906 = _898;
    int _908 = _894 ? 0 : 1;
    float _910 = float(_906);
    float _912 = _806 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _914 = ~_908;
    int _916 = _914 + 1;
    int _918 = _916 + 1;
    float _920 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _922 = log2(_920);
    int _924 = _918;
    if (!_874)
    {
        int _926 = ~_908;
        int _928 = _926 + 1;
        _924 = _928;
    }
    int _930 = _924;
    float _932 = _852 * _910;
    float _934 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _936 = _912 + _934;
    float _938 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _940 = _846 + _938;
    bool _942 = _858 > 0.0;
    float _944 = _932 * (-2.0);
    bool _946 = _858 >= 0.0;
    bool _948 = isnan(_858);
    bool _950 = _946 || _948;
    bool _952 = isnan(0.0);
    bool _954 = _950 || _952;
    bool _956 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _958 = isnan(0.0);
    bool _960 = _956 || _958;
    bool _962 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _964 = _960 || _962;
    bool _966 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _968 = isnan(1.0);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _974 = _970 || _972;
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _978 = _954 ? 0 : 1;
    float _980 = _922 * _124;
    float _982 = _808 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _984 = in.m_57.x;
    float _986 = in.m_57.y;
    float _988 = in.m_57.z;
    float _990 = exp2(_980);
    float _992 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _994 = _982 + _992;
    float _996 = _994 * _994;
    float _998 = fma(_936, _936, _996);
    float _1000 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[78].z, _976);
    bool _1002 = !_786;
    int _1004 = _1002 ? 0 : 1;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1008 = fma(_940, _940, _998);
    int _1010 = ~_978;
    int _1012 = _1010 + 1;
    int _1014 = _1012 + 1;
    float _1016 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1000);
    float _1018 = -_990;
    float _1020 = _1018 + 1.0;
    int _1022 = abs(_1004);
    float _1024 = -_124;
    float _1026 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[76].x, _830);
    float _1028 = rsqrt(_1008);
    int _1030 = _1014;
    if (!_942)
    {
        int _1032 = ~_978;
        int _1034 = _1032 + 1;
        _1030 = _1034;
    }
    int _1036 = _1030;
    float _1038 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1006);
    float _1040 = _964 ? _1020 : 0.0;
    float _1042 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _838);
    float _1044 = float(_1022);
    float _1046 = fma(_870, _944, _870);
    float _1048 = float(_930);
    float _1050 = fma(_944, _984, _984);
    float _1052 = _778 + (-0.5);
    bool _1054 = !_790;
    int _1056 = _1054 ? 0 : 1;
    float _1058 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1038);
    float _1060 = _1044 * _1048;
    if (_974)
    {
        float _1062 = _1040 * _896;
        _126 = _1062;
    }
    float _1064 = _126;
    float _1066 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1050);
    float _1068 = _796 + _774;
    float _1070 = _994 * _1028;
    float _1072 = _936 * _1028;
    float _1074 = _940 * _1028;
    float _1076 = _1068 + (-1.0);
    float _1078 = -_1070;
    float _1080 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[18].w, _994);
    float _1082 = -_1072;
    float _1084 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[18].w, _936);
    float _1086 = -_1074;
    float _1088 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[18].w, _940);
    float _1090 = float(_1036);
    float _1092 = _1080 * _1080;
    float _1094 = fma(_1084, _1084, _1092);
    int _1096 = abs(_1056);
    float _1098 = fma(_1046, _1064, _1066);
    float _1100 = fma(_1088, _1088, _1094);
    float _1102 = _1060 * (-2.0);
    float _1104 = float(_1096);
    float _1106 = fma(_1102, _986, _986);
    float _1108 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1110 = _778 + _774;
    float _1112 = _1104 * _1090;
    float _1114 = _796 + (-0.5);
    float _1116 = fma(_1108, _1102, _1108);
    float _1118 = _1110 + (-1.0);
    float _1120 = _1112 * (-2.0);
    float _1122 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1106);
    float _1124 = sqrt(_1100);
    float _1126 = fma(_1118, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1128 = fma(_1120, _988, _988);
    float _1130 = fma(_1116, _1064, _1122);
    float _1132 = in.m_59.x;
    float _1134 = in.m_59.y;
    float _1136 = in.m_59.z;
    float _1138 = fma(_1126, _1120, _1126);
    float _1140 = _1098 * 0.15915493667125701904296875;
    float _1142 = _1130 * 0.15915493667125701904296875;
    float _1144 = _774 + (-0.5);
    float _1146 = _1140 * 6.283185482025146484375;
    float _1148 = sin(_1146);
    float _1150 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1128);
    float _1152 = fma(_1138, _1064, _1150);
    float _1154 = _1028 * _1124;
    float _1156 = _1140 * 6.283185482025146484375;
    float _1158 = cos(_1156);
    float _1160 = _1152 * 0.15915493667125701904296875;
    float _1162 = _810 * _1154;
    float _1164 = _814 * _1154;
    float _1166 = _1142 * 6.283185482025146484375;
    float _1168 = sin(_1166);
    float _1170 = _816 * _1154;
    float _1172 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1132);
    float _1174 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1134);
    float _1176 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1136);
    float _1178 = _1164 * _1172;
    float _1180 = _1162 * _1174;
    float _1182 = _1142 * 6.283185482025146484375;
    float _1184 = cos(_1182);
    float _1186 = _1170 * _1176;
    float _1188 = in.m_53.w;
    float _1190 = _1160 * 6.283185482025146484375;
    float _1192 = sin(_1190);
    float _1194 = _1158 * _1168;
    float _1196 = in.m_61.x;
    float _1198 = _1160 * 6.283185482025146484375;
    float _1200 = cos(_1198);
    float _1202 = _1148 * _1184;
    float _1204 = -_1194;
    float _1206 = fma(_1192, _1202, _1204);
    float _1208 = -_1202;
    float _1210 = fma(_1192, _1194, _1208);
    float _1212 = _1148 * _1168;
    float _1214 = _1158 * _1184;
    bool _1216 = _1188 > 0.5;
    float _1218 = fma(_1192, _1214, _1212);
    float _1220 = _1184 * _1200;
    float _1222 = _1168 * _1200;
    float _1224 = _1200 * _1180;
    float _1226 = fma(_1192, _1212, _1214);
    float _1228 = -_1180;
    float _1230 = _1192 * _1228;
    float _1232 = _1158 * _1224;
    float _1234 = _1148 * _1224;
    float _1236 = fma(_1220, _1178, _1230);
    float _1238 = fma(_1218, _1178, _1232);
    float _1240 = fma(_1206, _1178, _1234);
    float _1242 = fma(_1222, _1186, _1236);
    float _1244 = in.m_61.y;
    float _1246 = fma(_1210, _1186, _1238);
    float _1248 = fma(_1226, _1186, _1240);
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1252 = _1250 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1254 = _1246 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1256 = _1246 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1258 = 1.0 / _1252;
    int _1260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1262 = _1260 != 0;
    float _1264 = fma(_1242, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1254);
    float _1266 = fma(_1242, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1256);
    int _1268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1270 = _1268 != 0;
    float _1272 = fma(_1248, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1264);
    float _1274 = fma(_1248, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1266);
    float _1276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1280 = _1278 != 0;
    float _1282 = _912 + _1272;
    float _1284 = _846 + _1274;
    float _1286 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1288 = _1282 + _1286;
    float _1290 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1292 = _1284 + _1290;
    bool _1294 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1296 = isnan(_772);
    bool _1298 = _1294 || _1296;
    bool _1300 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1302 = _1298 || _1300;
    float _1304 = float(_1302);
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1308 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1306;
    float _1310 = _1288 * _1288;
    float _1312 = _1292 * _1292;
    float _1314 = -_1244;
    float _1316 = _1314 + 1.0;
    float _1318 = _1308 * _1258;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1322 = _772 + _1320;
    float _1324 = _1310 + _1312;
    bool _1326 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1328 = isnan(_772);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1334 = _1330 || _1332;
    float _1336 = float(_1334);
    float _1338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1340 = _1216 ? as_type<int>(_1316) : as_type<int>(_1244);
    bool _1342 = _1216;
    float _1344 = _1244;
    float _1346 = _1242;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1350 = _1248;
    float _1352 = _1310;
    if (_1262)
    {
        bool _1354 = _774 > 0.5;
        _1342 = _1354;
    }
    bool _1356 = _1342;
    float _1358 = fma(_1318, _1322, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1360 = -_1304;
    float _1362 = _1360 + 1.0;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1366 = _1364 != 0;
    float _1368 = sqrt(_1324);
    if (_1270)
    {
        bool _1370 = _778 > 0.5;
        _900 = _1370;
    }
    bool _1372 = _900;
    float _1374 = _1336 * _1362;
    float _1376 = _1366 ? as_type<float>(_1340) : _1244;
    float _1378 = -_1336;
    float _1380 = _1378 + 1.0;
    int _1382 = as_type<int>(_1374);
    float _1384 = _1380;
    if (_1280)
    {
        float _1386 = _850 ? _1316 : _1244;
        _1344 = _1386;
    }
    float _1388 = _1344;
    float _1390 = _1276 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1392 = _1246 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1396 = _1358 * _1374;
    float _1398 = fma(_1390, _1388, -0.5);
    float _1400 = fma(_1242, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1392);
    int _1402 = as_type<int>(_1388);
    float _1404 = _1396;
    if (_1262)
    {
        float _1406 = -_1196;
        float _1408 = _1406 + 1.0;
        _1402 = as_type<int>(_1408);
    }
    int _1410 = _1402;
    if (_1270)
    {
        float _1412 = -_1196;
        float _1414 = _1412 + 1.0;
        _1382 = as_type<int>(_1414);
    }
    int _1416 = _1382;
    float _1418 = as_type<float>(_1416);
    if (!_1262)
    {
        _1346 = _1196;
    }
    float _1420 = _1346;
    float _1422 = fma(_1248, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1400);
    bool _1424 = _1368 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1428 = _1420;
    if (!_1270)
    {
        _1348 = _1196;
    }
    float _1430 = _1348;
    float _1432 = _982 + _1422;
    float _1434 = _1430;
    if (_1262)
    {
        float _1436 = _1356 ? as_type<float>(_1410) : _1196;
        _1428 = _1436;
    }
    float _1438 = _1428;
    float _1440 = fma(_1380, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1396);
    if (_1270)
    {
        float _1442 = _1372 ? as_type<float>(_1416) : _1196;
        _1434 = _1442;
    }
    float _1444 = _1434;
    if (!_1424)
    {
        _1350 = _1312;
    }
    float _1446 = _1350;
    float _1448 = _1446;
    if (!_1424)
    {
        _1384 = _1282;
    }
    float _1450 = _1384;
    float _1452 = _1450;
    if (!_1424)
    {
        _1404 = _1284;
    }
    float _1454 = _1404;
    float _1456 = _1454;
    if (!_1424)
    {
        _1418 = _1432;
    }
    float _1458 = _1418;
    bool _1460 = !_1424;
    float _1462 = _1458;
    if (!_1460)
    {
        float _1464 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1466 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1468 = _1368 + _1466;
        float _1470 = rsqrt(_1324);
        float _1472 = _1468 * _1464;
        float _1474 = _1432 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1476 = _1472 * 0.15915493667125701904296875;
        float _1478 = _1476 * 6.283185482025146484375;
        float _1480 = sin(_1478);
        float _1482 = _1476 * 6.283185482025146484375;
        float _1484 = cos(_1482);
        float _1486 = fma(_1480, _1474, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1488 = _1470 * _1486;
        float _1490 = _1484 + (-1.0);
        float _1492 = fma(_1288, _1488, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1494 = fma(_1292, _1488, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1496 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1498 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1500 = _1492 + _1498;
        float _1502 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1504 = _1494 + _1502;
        float _1506 = fma(_1432, _1484, _1496);
        float _1508 = _1500 * _1500;
        float _1510 = _1504 * _1504;
        _1462 = _1506;
        _1352 = _1508;
        _1448 = _1510;
        _1452 = _1492;
        _1456 = _1494;
    }
    float _1512 = _1462;
    float _1514 = _1352;
    float _1516 = _1448;
    float _1518 = _1452;
    float _1520 = _1456;
    float _1522 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1524 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1526 = _1512 + _1524;
    float _1528 = -_1042;
    float _1530 = fma(_1058, _1398, _1528);
    float _1532 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1440);
    float _1534 = fma(_1522, _1444, -0.5);
    float _1536 = fma(_1526, _1526, _1514);
    float _1538 = _1376 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1540 = _1438 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1542 = fma(_1016, _1534, _1026);
    float _1544 = _1536 + _1516;
    float _1546 = _1538 * _1426;
    float _1548 = _738 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1550 = _740 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1552 = _742 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1554 = _1540 * _1394;
    float _1556 = sqrt(_1544);
    float _1558 = _1548 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1560 = _1550 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1562 = _1552 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1564 = _1530 + 0.5;
    float _1566 = _1532 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1568 = _1542 + 0.5;
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    out.m_65.x = _1558;
    out.m_65.y = _1560;
    out.m_65.z = _1562;
    out.m_65.w = _1566;
    bool _1570 = _1556 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1572 = isnan(_1556);
    bool _1574 = _1570 || _1572;
    bool _1576 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1578 = _1574 || _1576;
    out.m_67.x = _1568;
    out.m_67.y = _1564;
    out.m_67.z = _1554;
    out.m_67.w = _1546;
    float _1580 = _1552;
    float _1582 = _1560;
    if (!_1578)
    {
        _1580 = 1.0;
    }
    float _1584 = _1580;
    bool _1586 = !_1578;
    float _1588 = _1584;
    if (!_1586)
    {
        bool _1590 = _1556 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1592 = isnan(_1556);
        bool _1594 = _1590 || _1592;
        bool _1596 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1598 = _1594 || _1596;
        if (!_1598)
        {
            float _1600 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1602 = _1556 + _1600;
            float _1604 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1606 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1604;
            float _1608 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1610 = _1608 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1612 = 1.0 / _1606;
            float _1614 = _1602 * _1612;
            float _1616 = fma(_1614, _1610, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1588 = _1616;
            _1618 = true;
        }
        else
        {
            bool _1620 = _1556 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1622 = isnan(_1556);
            bool _1624 = _1620 || _1622;
            bool _1626 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1628 = _1624 || _1626;
            if (!_1628)
            {
                float _1630 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1632 = _1556 + _1630;
                float _1634 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1636 = _1634 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1638 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1640 = _1638 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1642 = 1.0 / _1636;
                float _1644 = _1632 * _1642;
                float _1646 = fma(_1644, _1640, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1588 = _1646;
                _1618 = true;
            }
            else
            {
                _1588 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1618 = false;
    float _1648 = _1588;
    float _1650 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1652 = _1512 + _1650;
    float _1654 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1656 = _1518 + _1654;
    float _1658 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1660 = _1520 + _1658;
    float _1662 = fma(_1652, _1648, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1664 = fma(_1656, _1648, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1666 = fma(_1660, _1648, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1668 = -_1070;
    float _1670 = fma(_1668, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1662);
    float _1672 = -_1072;
    float _1674 = fma(_1672, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1664);
    float _1676 = -_1074;
    float _1678 = fma(_1676, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1666);
    float _1680 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1682 = _1670 + _1680;
    float _1684 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1686 = _1674 + _1684;
    float _1688 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1690 = _1678 + _1688;
    float _1692 = _1682 * _1682;
    float _1694 = fma(_1686, _1686, _1692);
    float _1696 = fma(_1690, _1690, _1694);
    float _1698 = rsqrt(_1696);
    float _1700 = _1698 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1702 = _1686 * _1700;
    float _1704 = _1690 * _1700;
    float _1706 = _1702 * _1702;
    float _1708 = _1704 * _1704;
    float _1710 = _1706 + _1708;
    float _1712 = sqrt(_1710);
    bool _1714 = _1712 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1716 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1718 = _1712 + _1716;
    float _1720 = _1698;
    float _1722 = _1710;
    float _1724 = _1718;
    float _1726 = _1666;
    float _1728 = _1700;
    float _1730 = _1702;
    if (_1714)
    {
        float _1732 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1720 = _1732;
    }
    float _1734 = _1720;
    if (_1714)
    {
        float _1736 = rsqrt(_1710);
        _1722 = _1736;
    }
    float _1738 = _1722;
    if (_1714)
    {
        float _1740 = _1718 * _1734;
        _1724 = _1740;
    }
    float _1742 = _1724;
    if (_1714)
    {
        float _1744 = _1742 * 0.15915493667125701904296875;
        _1582 = _1744;
    }
    float _1746 = _1582;
    float _1748 = _1648;
    float _1750 = _1746;
    if (_1714)
    {
        float _1752 = _1746 * 6.283185482025146484375;
        float _1754 = sin(_1752);
        _1748 = _1754;
    }
    float _1756 = _1748;
    float _1758 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1760 = precise::max(0.0, _1758);
    float _1762 = _1690;
    float _1764 = _1760;
    float _1766 = _1758;
    if (_1714)
    {
        float _1768 = _1746 * 6.283185482025146484375;
        float _1770 = cos(_1768);
        _1762 = _1770;
    }
    float _1772 = _1762;
    float _1774 = -_1700;
    float _1776 = -_1760;
    float _1778 = fma(_1682, _1774, _1776);
    if (_1714)
    {
        float _1780 = _1778 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1764 = _1780;
    }
    float _1782 = _1764;
    float _1784 = _1782;
    if (!_1714)
    {
        _1750 = _1706;
    }
    float _1786 = _1750;
    float _1788 = sqrt(_1696);
    float _1790 = _1756;
    float _1792 = _1786;
    if (_1714)
    {
        float _1794 = fma(_1756, _1782, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1784 = _1794;
    }
    float _1796 = _1784;
    float _1798 = _1796;
    if (!_1714)
    {
        _1790 = _1778;
    }
    float _1800 = _1790;
    float _1802 = _1800;
    if (_1714)
    {
        float _1804 = _1772 + (-1.0);
        _1766 = _1804;
    }
    float _1806 = _1766;
    float _1808 = _1806;
    if (_1714)
    {
        float _1810 = _1738 * _1796;
        _1726 = _1810;
    }
    float _1812 = _1726;
    if (!_1714)
    {
        _1798 = _1704;
    }
    float _1814 = _1798;
    float _1816 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1818 = _1814;
    if (_1714)
    {
        float _1820 = _1806 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1728 = _1820;
    }
    float _1822 = _1728;
    if (_1714)
    {
        float _1824 = _1702 * _1812;
        _1730 = _1824;
    }
    float _1826 = _1730;
    if (_1714)
    {
        float _1828 = _1704 * _1812;
        _1818 = _1828;
    }
    float _1830 = _1818;
    if (!_1714)
    {
        _1808 = _1708;
    }
    float _1832 = _1808;
    float _1834 = _1832;
    if (_1714)
    {
        float _1836 = fma(_1778, _1772, _1822);
        _1802 = _1836;
    }
    float _1838 = _1802;
    if (_1714)
    {
        float _1840 = _1826 * _1826;
        _1792 = _1840;
    }
    float _1842 = _1792;
    if (_1714)
    {
        float _1844 = _1830 * _1830;
        _1834 = _1844;
    }
    float _1846 = _1834;
    float _1848 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1850 = fma(_1788, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1848);
    float _1852 = precise::clamp(_1850, 0.0, 1.0);
    float _1854 = fma(_1838, _1838, _1842);
    float _1856 = -_1852;
    float _1858 = _1856 + 1.0;
    float _1860 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1862 = _1854 + _1846;
    float _1864 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1866 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1868 = rsqrt(_1862);
    float _1870 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1864);
    float _1872 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1874 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1860);
    float _1876 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1870);
    float _1878 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1872);
    float _1880 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1816);
    float _1882 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1874);
    float _1884 = _1876 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1886 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1878);
    float _1888 = abs(_1858);
    float _1890 = log2(_1888);
    float _1892 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1880);
    float _1894 = _1884 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1896 = _1886 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1898 = _1882 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1900 = _1868 * _1826;
    float _1902 = _1868 * _1838;
    float _1904 = _1896 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1906 = -_1894;
    float _1908 = fma(_1906, _1866, 1.0);
    float _1910 = _1900 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1912 = _1868 * _1830;
    float _1914 = _1892 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1916 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1904);
    float _1918 = -_1910;
    float _1920 = fma(_1902, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1918);
    float _1922 = log2(_1908);
    float _1924 = _1896 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1926 = fma(_1884, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1916);
    float _1928 = -_1912;
    float _1930 = fma(_1928, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1920);
    float _1932 = _1890 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1934 = _1896 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1936 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1926);
    float _1938 = fma(_1930, -0.5, 0.5);
    float _1940 = exp2(_1932);
    float _1942 = fma(_1930, 0.5, 0.5);
    float _1944 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1924);
    float _1946 = _1902 + 1.0;
    float _1948 = fma(_1884, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1944);
    float _1950 = 1.0 / _1936;
    float _1952 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1934);
    float _1954 = fma(_1942, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1956 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1948);
    float _1958 = _1922 * 0.693147182464599609375;
    float _1960 = fma(_1884, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1952);
    float _1962 = fma(_1942, _1954, -0.212114393711090087890625);
    float _1964 = sqrt(_1938);
    float _1966 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1960);
    float _1968 = -_1902;
    float _1970 = fma(_1940, _1946, _1968);
    float _1972 = fma(_1942, _1962, 1.570728778839111328125);
    float _1974 = fma(_1970, 0.5, 0.5);
    float _1976 = _1956 * _1950;
    float _1978 = _1966 * _1950;
    float _1980 = _1958 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1982 = fma(_1976, 0.5, 0.5);
    float _1984 = fma(_1978, -0.5, 0.5);
    float _1986 = _1964 * 0.636619746685028076171875;
    float _1988 = -_1972;
    float _1990 = fma(_1986, _1988, 1.0);
    float3 _5284 = float3(_1982, _1984, _1980);
    float _1992 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5284, float3(0.0), isnan(_5284)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5284, float3(0.0), isnan(_5284)), level(0.0)).x;
    float3 _5295 = float3(_1982, _1984, _1980);
    float4 _1995 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5295, float3(0.0), isnan(_5295)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5295, float3(0.0), isnan(_5295)), level(0.0)).xyzw;
    float _1997 = _1995.x;
    float _1999 = _1995.y;
    float _2001 = _1995.z;
    float _2003 = _1995.w;
    float2 _5312 = float2(_1990, _1974);
    float3 _2007 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5312, float2(0.0), isnan(_5312)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5312, float2(0.0), isnan(_5312)), level(0.0)).xyz;
    float _2009 = _2007.x;
    float _2011 = _2007.y;
    float _2013 = _2007.z;
    float _2015 = -_1070;
    float _2017 = fma(_2015, (*spvDescriptorSet0.vp_c9)._m0[18].w, _982);
    float _2019 = -_1072;
    float _2021 = fma(_2019, (*spvDescriptorSet0.vp_c9)._m0[18].w, _912);
    float _2023 = -_1074;
    float _2025 = fma(_2023, (*spvDescriptorSet0.vp_c9)._m0[18].w, _846);
    float _2027 = _1890 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2029 = _2017 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2031 = _1896 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2033 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2029);
    float _2035 = _2017 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2037 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2031);
    float _2039 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2033);
    float _2041 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2035);
    bool _2043 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2045 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2047 = _2043 || _2045;
    bool _2049 = isnan(0.5);
    bool _2051 = _2047 || _2049;
    float _2053 = fma(_1884, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2037);
    float _2055 = _2039 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2057 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2041);
    float _2059 = exp2(_2027);
    float _2061 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2053);
    float _2063 = _2057 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2065 = _2063 + _2055;
    float _2067 = 1.0 / _2055;
    float _2069 = _1884;
    if (_2051)
    {
        _2069 = 1.0;
    }
    float _2071 = _2069;
    float _2073 = _2065 * _2067;
    float _2075 = _2073 * 0.5;
    float _2077 = _2071;
    if (!_2051)
    {
        float _2079 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2081 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2083 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2081);
        float _2085 = _2079 * 0.15915493667125701904296875;
        float _2087 = _2085 * 6.283185482025146484375;
        float _2089 = cos(_2087);
        float _2091 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2093 = _2091 * 0.15915493667125701904296875;
        float _2095 = _2085 * 6.283185482025146484375;
        float _2097 = sin(_2095);
        float _2099 = 1.0 / _2089;
        float _2101 = _2093 * 6.283185482025146484375;
        float _2103 = cos(_2101);
        float _2105 = _2097 * _2099;
        float _2107 = 1.0 / _2083;
        float _2109 = _2103 * _2105;
        float _2111 = _2093 * 6.283185482025146484375;
        float _2113 = sin(_2111);
        float _2115 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2117 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2115;
        float _2119 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2121 = _2107 * _2119;
        float _2123 = 1.0 / _2109;
        float _2125 = 1.0 / _2117;
        float _2127 = _2113 * _2123;
        float _2129 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2131 = fma(_2127, _2121, _2129);
        float _2133 = _2131 * _2125;
        float _2135 = precise::clamp(_2133, 0.0, 1.0);
        _2077 = _2135;
    }
    float _2137 = _2077;
    float _2139 = -_2059;
    float _2141 = _2139 + 1.0;
    float _2143 = _2061 + _1936;
    bool _2145 = _2137 > 0.0;
    bool _2147 = isnan(_2137);
    bool _2149 = _2145 || _2147;
    bool _2151 = isnan(0.0);
    bool _2153 = _2149 || _2151;
    float _2155 = _2137 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2157 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2159 = _2143 * 0.5;
    float _2161 = _2157 * _1992;
    float _2163 = -_2157;
    float _2165 = _2163 + 1.0;
    out.gl_Position.x = _1956;
    out.gl_Position.y = _1966;
    out.gl_Position.z = _2061;
    out.gl_Position.w = _1936;
    float _2167 = _2155 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2169 = _2003 * _2161;
    float _2171 = _2013 * _2161;
    out.m_69.z = _2159;
    out.m_69.w = _1936;
    float _2173 = fma(_2009, _2169, _1997);
    float _2175 = fma(_2011, _2169, _1999);
    float _2177 = _2003 * _2165;
    float _2179 = fma(_2003, _2171, _2001);
    out.m_47.x = _2167;
    out.m_71.x = _2173;
    out.m_71.y = _2175;
    out.m_71.z = _2179;
    out.m_71.w = _2177;
    if (_2153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2181 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2181;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1618 = false;
    bool _764 = false;
    bool _650 = false;
    bool _456 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2238 = as_type<float>(_106);
        out.gl_Position.z = _2238;
    }
    if (!_94)
    {
        return out;
    }
    float _110 = in.m_49.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = _124;
    if (_120)
    {
        float _128 = float(_90);
        _100 = _128;
    }
    float _130 = _100;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2308 = as_type<float>(_144);
        out.gl_Position.z = _2308;
    }
    if (_136)
    {
        return out;
    }
    float _146 = in.m_51.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_49.x;
    float _162 = in.m_49.y;
    float _164 = in.m_49.z;
    float _166 = in.m_44.x;
    float _168 = in.m_44.y;
    float _170 = in.m_44.z;
    float _172 = 0.0;
    float _174 = _148;
    if (!_158)
    {
        float _176 = _148 * _148;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = _180;
    if (!_158)
    {
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    bool _188 = !_158;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _148 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _148);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    bool _224 = !_158;
    if (!_224)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _148 * _228;
        float _238 = exp2(_236);
        float _240 = -_238;
        float _242 = _240 + 1.0;
        float _244 = _242 * _234;
        _174 = _244;
    }
    float _246 = _174;
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _250 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _254 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _256 = fma(_246, _160, _250);
    float _258 = fma(_246, _162, _252);
    float _260 = fma(_246, _164, _254);
    float _262 = fma(_256, _146, _166);
    float _264 = fma(_258, _146, _168);
    float _266 = fma(_260, _146, _170);
    bool _268 = !_248;
    float _286;
    if (!_268)
    {
        float _270 = in.m_53.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        float _290 = float(_90);
        float _292 = 1.0 / _290;
        float _294 = _124 * _292;
        _286 = _294;
    }
    _288 = false;
    float _296 = _286;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = _296 + _298;
    bool _302 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _304 = isnan(_296);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    bool _314 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _316 = isnan(_296);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _334 = 1.0 / _328;
    bool _336 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _338 = 1.0 / _332;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _340;
    float _344 = _300 * _334;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _348 = _296 + _346;
    bool _350 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _352 = isnan(_296);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = -_312;
    float _364 = _362 + 1.0;
    float _366 = fma(_342, _344, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _368 = _360 * _364;
    float _370 = -_360;
    float _372 = _370 + 1.0;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _378;
    float _382 = _348 * _338;
    float _384 = _324 * _372;
    float _386 = fma(_376, _344, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _388 = fma(_380, _344, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _390 = -_324;
    float _392 = _390 + 1.0;
    float _394 = _366 * _384;
    float _396 = _386 * _384;
    float _398 = _388 * _384;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _412 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].x, _396);
    float _414 = fma(_402, _382, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _416 = fma(_406, _382, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _418 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].y, _394);
    float _420 = fma(_410, _382, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _422 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].z, _398);
    float _424 = fma(_414, _368, _412);
    float _426 = fma(_416, _368, _418);
    float _428 = fma(_420, _368, _422);
    float _430 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[145].x, _424);
    float _432 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[145].y, _426);
    float _434 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[145].z, _428);
    bool _436 = !_336;
    float _454;
    if (!_436)
    {
        float _438 = in.m_53.x;
        float _440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _442 = _438 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _444 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _446 = _444 * _440;
        float _448 = floor(_446);
        float _450 = -_448;
        float _452 = _446 + _450;
        _454 = _452;
        _456 = true;
    }
    else
    {
        float _458 = float(_90);
        float _460 = 1.0 / _458;
        float _462 = _124 * _460;
        _454 = _462;
    }
    _456 = false;
    float _464 = _454;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _468 = _464 + _466;
    bool _470 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _472 = isnan(_464);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _484 = _464 + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _486;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _494 = -_480;
    float _496 = _494 + 1.0;
    float _498 = 1.0 / _488;
    bool _500 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _502 = 1.0 / _492;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _504;
    float _508 = _468 * _498;
    bool _510 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _512 = isnan(_464);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _522;
    bool _526 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _528 = isnan(_464);
    bool _530 = _526 || _528;
    bool _532 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _534 = _530 || _532;
    float _536 = float(_534);
    float _538 = fma(_506, _508, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _540 = fma(_524, _508, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _542 = _536 * _496;
    float _544 = -_536;
    float _546 = _544 + 1.0;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _548;
    float _552 = _484 * _502;
    float _554 = _520 * _546;
    float _556 = fma(_550, _508, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _558 = -_520;
    float _560 = _558 + 1.0;
    float _562 = _538 * _554;
    float _564 = _556 * _554;
    float _566 = _540 * _554;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _570 = _568 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _580 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[107].x, _564);
    float _582 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[107].y, _562);
    float _584 = fma(_570, _552, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _586 = fma(_574, _552, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _588 = fma(_578, _552, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _590 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[107].z, _566);
    float _592 = fma(_584, _542, _580);
    float _594 = fma(_586, _542, _582);
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _598 = fma(_588, _542, _590);
    float _600 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[109].x, _592);
    float _602 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[109].y, _594);
    float _604 = in.m_51.x;
    float _606 = in.m_51.y;
    float _608 = in.m_51.z;
    float _610 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[109].z, _598);
    float _612 = _600 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _614 = _602 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _616 = _610 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _618 = _612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _620 = _614 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _622 = _616 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _618;
    out.m_55.y = _620;
    out.m_55.z = _622;
    out.m_55.w = _596;
    float _624 = _434 * _608;
    float _626 = _432 * _606;
    float _628 = _430 * _604;
    bool _630 = !_500;
    float _648;
    if (!_630)
    {
        float _632 = in.m_53.x;
        float _634 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _636 = _632 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _638 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _640 = _638 * _634;
        float _642 = floor(_640);
        float _644 = -_642;
        float _646 = _640 + _644;
        _648 = _646;
        _650 = true;
    }
    else
    {
        float _652 = float(_90);
        float _654 = 1.0 / _652;
        float _656 = _124 * _654;
        _648 = _656;
    }
    _650 = false;
    float _658 = _648;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _662 = _658 + _660;
    bool _664 = _658 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _666 = isnan(_658);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _672 = _668 || _670;
    float _674 = float(_672);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _676;
    bool _680 = _658 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _682 = isnan(_658);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = 1.0 / _678;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _694;
    bool _698 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _700;
    float _704 = _662 * _692;
    float _706 = -_674;
    float _708 = _706 + 1.0;
    float _710 = fma(_696, _704, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _712 = fma(_702, _704, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _714;
    float _718 = _690 * _708;
    float _720 = -_690;
    float _722 = _720 + 1.0;
    float _724 = fma(_716, _704, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _726 = _710 * _718;
    float _728 = _724 * _718;
    float _730 = _712 * _718;
    float _732 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[123].x, _726);
    float _734 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[123].y, _728);
    float _736 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[123].z, _730);
    float _738 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[124].x, _732);
    float _740 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[124].y, _734);
    float _742 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[124].z, _736);
    bool _744 = !_698;
    float _762;
    if (!_744)
    {
        float _746 = in.m_53.x;
        float _748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _750 = _746 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _752 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _754 = _752 * _748;
        float _756 = floor(_754);
        float _758 = -_756;
        float _760 = _754 + _758;
        _762 = _760;
        _764 = true;
    }
    else
    {
        float _766 = float(_90);
        float _768 = 1.0 / _766;
        float _770 = _124 * _768;
        _762 = _770;
    }
    _764 = false;
    float _772 = _762;
    float _774 = in.m_53.z;
    float _776 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _778 = in.m_53.x;
    int _780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _782 = _780 != 0;
    int _784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _786 = _784 != 0;
    int _788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _790 = _788 != 0;
    float _792 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _794 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _796 = in.m_53.y;
    float _798 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _776);
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _802 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _792);
    float _804 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _794);
    float _806 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _798);
    float _808 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _802);
    float _810 = _626 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _814 = _628 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _816 = _624 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _818 = _774 * 2.0;
    float _820 = _778 * 2.0;
    float _822 = _778 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _824 = floor(_818);
    float _826 = _796 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _828 = -_800;
    float _830 = fma(_822, 2.0, _828);
    float _832 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _804);
    bool _834 = !_782;
    int _836 = _834 ? 0 : 1;
    float _838 = fma(_826, -2.0, _812);
    float _840 = _796 * 2.0;
    float _842 = floor(_820);
    int _844 = abs(_836);
    float _846 = _832 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _848 = _778 + _796;
    bool _850 = _796 > 0.5;
    float _852 = float(_844);
    float _854 = _848 + (-1.0);
    bool _856 = _824 > 0.0;
    float _858 = floor(_840);
    bool _860 = _824 >= 0.0;
    bool _862 = isnan(_824);
    bool _864 = _860 || _862;
    bool _866 = isnan(0.0);
    bool _868 = _864 || _866;
    float _870 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _872 = _868 ? 0 : 1;
    bool _874 = _842 > 0.0;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _878 = 1.0 + _876;
    int _880 = ~_872;
    int _882 = _880 + 1;
    int _884 = _882 + 1;
    bool _886 = _842 >= 0.0;
    bool _888 = isnan(_842);
    bool _890 = _886 || _888;
    bool _892 = isnan(0.0);
    bool _894 = _890 || _892;
    float _896 = 1.0 / _878;
    int _898 = _884;
    bool _900 = _786;
    if (!_856)
    {
        int _902 = ~_872;
        int _904 = _902 + 1;
        _898 = _904;
    }
    int _906 = _898;
    int _908 = _894 ? 0 : 1;
    float _910 = float(_906);
    float _912 = _806 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _914 = ~_908;
    int _916 = _914 + 1;
    int _918 = _916 + 1;
    float _920 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _922 = log2(_920);
    int _924 = _918;
    if (!_874)
    {
        int _926 = ~_908;
        int _928 = _926 + 1;
        _924 = _928;
    }
    int _930 = _924;
    float _932 = _852 * _910;
    float _934 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _936 = _912 + _934;
    float _938 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _940 = _846 + _938;
    bool _942 = _858 > 0.0;
    float _944 = _932 * (-2.0);
    bool _946 = _858 >= 0.0;
    bool _948 = isnan(_858);
    bool _950 = _946 || _948;
    bool _952 = isnan(0.0);
    bool _954 = _950 || _952;
    bool _956 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _958 = isnan(0.0);
    bool _960 = _956 || _958;
    bool _962 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _964 = _960 || _962;
    bool _966 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _968 = isnan(1.0);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _974 = _970 || _972;
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _978 = _954 ? 0 : 1;
    float _980 = _922 * _124;
    float _982 = _808 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _984 = in.m_57.x;
    float _986 = in.m_57.y;
    float _988 = in.m_57.z;
    float _990 = exp2(_980);
    float _992 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _994 = _982 + _992;
    float _996 = _994 * _994;
    float _998 = fma(_936, _936, _996);
    float _1000 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[78].z, _976);
    bool _1002 = !_786;
    int _1004 = _1002 ? 0 : 1;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1008 = fma(_940, _940, _998);
    int _1010 = ~_978;
    int _1012 = _1010 + 1;
    int _1014 = _1012 + 1;
    float _1016 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1000);
    float _1018 = -_990;
    float _1020 = _1018 + 1.0;
    int _1022 = abs(_1004);
    float _1024 = -_124;
    float _1026 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[76].x, _830);
    float _1028 = rsqrt(_1008);
    int _1030 = _1014;
    if (!_942)
    {
        int _1032 = ~_978;
        int _1034 = _1032 + 1;
        _1030 = _1034;
    }
    int _1036 = _1030;
    float _1038 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1006);
    float _1040 = _964 ? _1020 : 0.0;
    float _1042 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _838);
    float _1044 = float(_1022);
    float _1046 = fma(_870, _944, _870);
    float _1048 = float(_930);
    float _1050 = fma(_944, _984, _984);
    float _1052 = _778 + (-0.5);
    bool _1054 = !_790;
    int _1056 = _1054 ? 0 : 1;
    float _1058 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1038);
    float _1060 = _1044 * _1048;
    if (_974)
    {
        float _1062 = _1040 * _896;
        _126 = _1062;
    }
    float _1064 = _126;
    float _1066 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1050);
    float _1068 = _796 + _774;
    float _1070 = _994 * _1028;
    float _1072 = _936 * _1028;
    float _1074 = _940 * _1028;
    float _1076 = _1068 + (-1.0);
    float _1078 = -_1070;
    float _1080 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[18].w, _994);
    float _1082 = -_1072;
    float _1084 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[18].w, _936);
    float _1086 = -_1074;
    float _1088 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[18].w, _940);
    float _1090 = float(_1036);
    float _1092 = _1080 * _1080;
    float _1094 = fma(_1084, _1084, _1092);
    int _1096 = abs(_1056);
    float _1098 = fma(_1046, _1064, _1066);
    float _1100 = fma(_1088, _1088, _1094);
    float _1102 = _1060 * (-2.0);
    float _1104 = float(_1096);
    float _1106 = fma(_1102, _986, _986);
    float _1108 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1110 = _778 + _774;
    float _1112 = _1104 * _1090;
    float _1114 = _796 + (-0.5);
    float _1116 = fma(_1108, _1102, _1108);
    float _1118 = _1110 + (-1.0);
    float _1120 = _1112 * (-2.0);
    float _1122 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1106);
    float _1124 = sqrt(_1100);
    float _1126 = fma(_1118, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1128 = fma(_1120, _988, _988);
    float _1130 = fma(_1116, _1064, _1122);
    float _1132 = in.m_59.x;
    float _1134 = in.m_59.y;
    float _1136 = in.m_59.z;
    float _1138 = fma(_1126, _1120, _1126);
    float _1140 = _1098 * 0.15915493667125701904296875;
    float _1142 = _1130 * 0.15915493667125701904296875;
    float _1144 = _774 + (-0.5);
    float _1146 = _1140 * 6.283185482025146484375;
    float _1148 = sin(_1146);
    float _1150 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1128);
    float _1152 = fma(_1138, _1064, _1150);
    float _1154 = _1028 * _1124;
    float _1156 = _1140 * 6.283185482025146484375;
    float _1158 = cos(_1156);
    float _1160 = _1152 * 0.15915493667125701904296875;
    float _1162 = _810 * _1154;
    float _1164 = _814 * _1154;
    float _1166 = _1142 * 6.283185482025146484375;
    float _1168 = sin(_1166);
    float _1170 = _816 * _1154;
    float _1172 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1132);
    float _1174 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1134);
    float _1176 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1136);
    float _1178 = _1164 * _1172;
    float _1180 = _1162 * _1174;
    float _1182 = _1142 * 6.283185482025146484375;
    float _1184 = cos(_1182);
    float _1186 = _1170 * _1176;
    float _1188 = in.m_53.w;
    float _1190 = _1160 * 6.283185482025146484375;
    float _1192 = sin(_1190);
    float _1194 = _1158 * _1168;
    float _1196 = in.m_61.x;
    float _1198 = _1160 * 6.283185482025146484375;
    float _1200 = cos(_1198);
    float _1202 = _1148 * _1184;
    float _1204 = -_1194;
    float _1206 = fma(_1192, _1202, _1204);
    float _1208 = -_1202;
    float _1210 = fma(_1192, _1194, _1208);
    float _1212 = _1148 * _1168;
    float _1214 = _1158 * _1184;
    bool _1216 = _1188 > 0.5;
    float _1218 = fma(_1192, _1214, _1212);
    float _1220 = _1184 * _1200;
    float _1222 = _1168 * _1200;
    float _1224 = _1200 * _1180;
    float _1226 = fma(_1192, _1212, _1214);
    float _1228 = -_1180;
    float _1230 = _1192 * _1228;
    float _1232 = _1158 * _1224;
    float _1234 = _1148 * _1224;
    float _1236 = fma(_1220, _1178, _1230);
    float _1238 = fma(_1218, _1178, _1232);
    float _1240 = fma(_1206, _1178, _1234);
    float _1242 = fma(_1222, _1186, _1236);
    float _1244 = in.m_61.y;
    float _1246 = fma(_1210, _1186, _1238);
    float _1248 = fma(_1226, _1186, _1240);
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1252 = _1250 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1254 = _1246 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1256 = _1246 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1258 = 1.0 / _1252;
    int _1260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1262 = _1260 != 0;
    float _1264 = fma(_1242, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1254);
    float _1266 = fma(_1242, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1256);
    int _1268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1270 = _1268 != 0;
    float _1272 = fma(_1248, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1264);
    float _1274 = fma(_1248, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1266);
    float _1276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1280 = _1278 != 0;
    float _1282 = _912 + _1272;
    float _1284 = _846 + _1274;
    float _1286 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1288 = _1282 + _1286;
    float _1290 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1292 = _1284 + _1290;
    bool _1294 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1296 = isnan(_772);
    bool _1298 = _1294 || _1296;
    bool _1300 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1302 = _1298 || _1300;
    float _1304 = float(_1302);
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1308 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1306;
    float _1310 = _1288 * _1288;
    float _1312 = _1292 * _1292;
    float _1314 = -_1244;
    float _1316 = _1314 + 1.0;
    float _1318 = _1308 * _1258;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1322 = _772 + _1320;
    float _1324 = _1310 + _1312;
    bool _1326 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1328 = isnan(_772);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1334 = _1330 || _1332;
    float _1336 = float(_1334);
    float _1338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1340 = _1216 ? as_type<int>(_1316) : as_type<int>(_1244);
    bool _1342 = _1216;
    float _1344 = _1244;
    float _1346 = _1242;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1350 = _1248;
    float _1352 = _1310;
    if (_1262)
    {
        bool _1354 = _774 > 0.5;
        _1342 = _1354;
    }
    bool _1356 = _1342;
    float _1358 = fma(_1318, _1322, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1360 = -_1304;
    float _1362 = _1360 + 1.0;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1366 = _1364 != 0;
    float _1368 = sqrt(_1324);
    if (_1270)
    {
        bool _1370 = _778 > 0.5;
        _900 = _1370;
    }
    bool _1372 = _900;
    float _1374 = _1336 * _1362;
    float _1376 = _1366 ? as_type<float>(_1340) : _1244;
    float _1378 = -_1336;
    float _1380 = _1378 + 1.0;
    int _1382 = as_type<int>(_1374);
    float _1384 = _1380;
    if (_1280)
    {
        float _1386 = _850 ? _1316 : _1244;
        _1344 = _1386;
    }
    float _1388 = _1344;
    float _1390 = _1276 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1392 = _1246 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1396 = _1358 * _1374;
    float _1398 = fma(_1390, _1388, -0.5);
    float _1400 = fma(_1242, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1392);
    int _1402 = as_type<int>(_1388);
    float _1404 = _1396;
    if (_1262)
    {
        float _1406 = -_1196;
        float _1408 = _1406 + 1.0;
        _1402 = as_type<int>(_1408);
    }
    int _1410 = _1402;
    if (_1270)
    {
        float _1412 = -_1196;
        float _1414 = _1412 + 1.0;
        _1382 = as_type<int>(_1414);
    }
    int _1416 = _1382;
    float _1418 = as_type<float>(_1416);
    if (!_1262)
    {
        _1346 = _1196;
    }
    float _1420 = _1346;
    float _1422 = fma(_1248, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1400);
    bool _1424 = _1368 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1428 = _1420;
    if (!_1270)
    {
        _1348 = _1196;
    }
    float _1430 = _1348;
    float _1432 = _982 + _1422;
    float _1434 = _1430;
    if (_1262)
    {
        float _1436 = _1356 ? as_type<float>(_1410) : _1196;
        _1428 = _1436;
    }
    float _1438 = _1428;
    float _1440 = fma(_1380, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1396);
    if (_1270)
    {
        float _1442 = _1372 ? as_type<float>(_1416) : _1196;
        _1434 = _1442;
    }
    float _1444 = _1434;
    if (!_1424)
    {
        _1350 = _1312;
    }
    float _1446 = _1350;
    float _1448 = _1446;
    if (!_1424)
    {
        _1384 = _1282;
    }
    float _1450 = _1384;
    float _1452 = _1450;
    if (!_1424)
    {
        _1404 = _1284;
    }
    float _1454 = _1404;
    float _1456 = _1454;
    if (!_1424)
    {
        _1418 = _1432;
    }
    float _1458 = _1418;
    bool _1460 = !_1424;
    float _1462 = _1458;
    if (!_1460)
    {
        float _1464 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1466 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1468 = _1368 + _1466;
        float _1470 = rsqrt(_1324);
        float _1472 = _1468 * _1464;
        float _1474 = _1432 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1476 = _1472 * 0.15915493667125701904296875;
        float _1478 = _1476 * 6.283185482025146484375;
        float _1480 = sin(_1478);
        float _1482 = _1476 * 6.283185482025146484375;
        float _1484 = cos(_1482);
        float _1486 = fma(_1480, _1474, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1488 = _1470 * _1486;
        float _1490 = _1484 + (-1.0);
        float _1492 = fma(_1288, _1488, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1494 = fma(_1292, _1488, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1496 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1498 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1500 = _1492 + _1498;
        float _1502 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1504 = _1494 + _1502;
        float _1506 = fma(_1432, _1484, _1496);
        float _1508 = _1500 * _1500;
        float _1510 = _1504 * _1504;
        _1462 = _1506;
        _1352 = _1508;
        _1448 = _1510;
        _1452 = _1492;
        _1456 = _1494;
    }
    float _1512 = _1462;
    float _1514 = _1352;
    float _1516 = _1448;
    float _1518 = _1452;
    float _1520 = _1456;
    float _1522 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1524 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1526 = _1512 + _1524;
    float _1528 = -_1042;
    float _1530 = fma(_1058, _1398, _1528);
    float _1532 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1440);
    float _1534 = fma(_1522, _1444, -0.5);
    float _1536 = fma(_1526, _1526, _1514);
    float _1538 = _1376 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1540 = _1438 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1542 = fma(_1016, _1534, _1026);
    float _1544 = _1536 + _1516;
    float _1546 = _1538 * _1426;
    float _1548 = _738 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1550 = _740 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1552 = _742 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1554 = _1540 * _1394;
    float _1556 = sqrt(_1544);
    float _1558 = _1548 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1560 = _1550 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1562 = _1552 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1564 = _1530 + 0.5;
    float _1566 = _1532 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1568 = _1542 + 0.5;
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    out.m_65.x = _1558;
    out.m_65.y = _1560;
    out.m_65.z = _1562;
    out.m_65.w = _1566;
    bool _1570 = _1556 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1572 = isnan(_1556);
    bool _1574 = _1570 || _1572;
    bool _1576 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1578 = _1574 || _1576;
    out.m_67.x = _1568;
    out.m_67.y = _1564;
    out.m_67.z = _1554;
    out.m_67.w = _1546;
    float _1580 = _1552;
    float _1582 = _1560;
    if (!_1578)
    {
        _1580 = 1.0;
    }
    float _1584 = _1580;
    bool _1586 = !_1578;
    float _1588 = _1584;
    if (!_1586)
    {
        bool _1590 = _1556 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1592 = isnan(_1556);
        bool _1594 = _1590 || _1592;
        bool _1596 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1598 = _1594 || _1596;
        if (!_1598)
        {
            float _1600 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1602 = _1556 + _1600;
            float _1604 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1606 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1604;
            float _1608 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1610 = _1608 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1612 = 1.0 / _1606;
            float _1614 = _1602 * _1612;
            float _1616 = fma(_1614, _1610, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1588 = _1616;
            _1618 = true;
        }
        else
        {
            bool _1620 = _1556 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1622 = isnan(_1556);
            bool _1624 = _1620 || _1622;
            bool _1626 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1628 = _1624 || _1626;
            if (!_1628)
            {
                float _1630 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1632 = _1556 + _1630;
                float _1634 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1636 = _1634 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1638 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1640 = _1638 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1642 = 1.0 / _1636;
                float _1644 = _1632 * _1642;
                float _1646 = fma(_1644, _1640, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1588 = _1646;
                _1618 = true;
            }
            else
            {
                _1588 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1618 = false;
    float _1648 = _1588;
    float _1650 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1652 = _1512 + _1650;
    float _1654 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1656 = _1518 + _1654;
    float _1658 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1660 = _1520 + _1658;
    float _1662 = fma(_1652, _1648, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1664 = fma(_1656, _1648, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1666 = fma(_1660, _1648, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1668 = -_1070;
    float _1670 = fma(_1668, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1662);
    float _1672 = -_1072;
    float _1674 = fma(_1672, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1664);
    float _1676 = -_1074;
    float _1678 = fma(_1676, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1666);
    float _1680 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1682 = _1670 + _1680;
    float _1684 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1686 = _1674 + _1684;
    float _1688 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1690 = _1678 + _1688;
    float _1692 = _1682 * _1682;
    float _1694 = fma(_1686, _1686, _1692);
    float _1696 = fma(_1690, _1690, _1694);
    float _1698 = rsqrt(_1696);
    float _1700 = _1698 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1702 = _1686 * _1700;
    float _1704 = _1690 * _1700;
    float _1706 = _1702 * _1702;
    float _1708 = _1704 * _1704;
    float _1710 = _1706 + _1708;
    float _1712 = sqrt(_1710);
    bool _1714 = _1712 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1716 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1718 = _1712 + _1716;
    float _1720 = _1698;
    float _1722 = _1710;
    float _1724 = _1718;
    float _1726 = _1666;
    float _1728 = _1700;
    float _1730 = _1702;
    if (_1714)
    {
        float _1732 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1720 = _1732;
    }
    float _1734 = _1720;
    if (_1714)
    {
        float _1736 = rsqrt(_1710);
        _1722 = _1736;
    }
    float _1738 = _1722;
    if (_1714)
    {
        float _1740 = _1718 * _1734;
        _1724 = _1740;
    }
    float _1742 = _1724;
    if (_1714)
    {
        float _1744 = _1742 * 0.15915493667125701904296875;
        _1582 = _1744;
    }
    float _1746 = _1582;
    float _1748 = _1648;
    float _1750 = _1746;
    if (_1714)
    {
        float _1752 = _1746 * 6.283185482025146484375;
        float _1754 = sin(_1752);
        _1748 = _1754;
    }
    float _1756 = _1748;
    float _1758 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1760 = precise::max(0.0, _1758);
    float _1762 = _1690;
    float _1764 = _1760;
    float _1766 = _1758;
    if (_1714)
    {
        float _1768 = _1746 * 6.283185482025146484375;
        float _1770 = cos(_1768);
        _1762 = _1770;
    }
    float _1772 = _1762;
    float _1774 = -_1700;
    float _1776 = -_1760;
    float _1778 = fma(_1682, _1774, _1776);
    if (_1714)
    {
        float _1780 = _1778 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1764 = _1780;
    }
    float _1782 = _1764;
    float _1784 = _1782;
    if (!_1714)
    {
        _1750 = _1706;
    }
    float _1786 = _1750;
    float _1788 = sqrt(_1696);
    float _1790 = _1756;
    float _1792 = _1786;
    if (_1714)
    {
        float _1794 = fma(_1756, _1782, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1784 = _1794;
    }
    float _1796 = _1784;
    float _1798 = _1796;
    if (!_1714)
    {
        _1790 = _1778;
    }
    float _1800 = _1790;
    float _1802 = _1800;
    if (_1714)
    {
        float _1804 = _1772 + (-1.0);
        _1766 = _1804;
    }
    float _1806 = _1766;
    float _1808 = _1806;
    if (_1714)
    {
        float _1810 = _1738 * _1796;
        _1726 = _1810;
    }
    float _1812 = _1726;
    if (!_1714)
    {
        _1798 = _1704;
    }
    float _1814 = _1798;
    float _1816 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1818 = _1814;
    if (_1714)
    {
        float _1820 = _1806 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1728 = _1820;
    }
    float _1822 = _1728;
    if (_1714)
    {
        float _1824 = _1702 * _1812;
        _1730 = _1824;
    }
    float _1826 = _1730;
    if (_1714)
    {
        float _1828 = _1704 * _1812;
        _1818 = _1828;
    }
    float _1830 = _1818;
    if (!_1714)
    {
        _1808 = _1708;
    }
    float _1832 = _1808;
    float _1834 = _1832;
    if (_1714)
    {
        float _1836 = fma(_1778, _1772, _1822);
        _1802 = _1836;
    }
    float _1838 = _1802;
    if (_1714)
    {
        float _1840 = _1826 * _1826;
        _1792 = _1840;
    }
    float _1842 = _1792;
    if (_1714)
    {
        float _1844 = _1830 * _1830;
        _1834 = _1844;
    }
    float _1846 = _1834;
    float _1848 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1850 = fma(_1788, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1848);
    float _1852 = precise::clamp(_1850, 0.0, 1.0);
    float _1854 = fma(_1838, _1838, _1842);
    float _1856 = -_1852;
    float _1858 = _1856 + 1.0;
    float _1860 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1862 = _1854 + _1846;
    float _1864 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1866 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1868 = rsqrt(_1862);
    float _1870 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1864);
    float _1872 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1874 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1860);
    float _1876 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1870);
    float _1878 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1872);
    float _1880 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1816);
    float _1882 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1874);
    float _1884 = _1876 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1886 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1878);
    float _1888 = abs(_1858);
    float _1890 = log2(_1888);
    float _1892 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1880);
    float _1894 = _1884 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1896 = _1886 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1898 = _1882 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1900 = _1868 * _1826;
    float _1902 = _1868 * _1838;
    float _1904 = _1896 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1906 = -_1894;
    float _1908 = fma(_1906, _1866, 1.0);
    float _1910 = _1900 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1912 = _1868 * _1830;
    float _1914 = _1892 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1916 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1904);
    float _1918 = -_1910;
    float _1920 = fma(_1902, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1918);
    float _1922 = log2(_1908);
    float _1924 = _1896 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1926 = fma(_1884, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1916);
    float _1928 = -_1912;
    float _1930 = fma(_1928, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1920);
    float _1932 = _1890 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1934 = _1896 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1936 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1926);
    float _1938 = fma(_1930, -0.5, 0.5);
    float _1940 = exp2(_1932);
    float _1942 = fma(_1930, 0.5, 0.5);
    float _1944 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1924);
    float _1946 = _1902 + 1.0;
    float _1948 = fma(_1884, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1944);
    float _1950 = 1.0 / _1936;
    float _1952 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1934);
    float _1954 = fma(_1942, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1956 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1948);
    float _1958 = _1922 * 0.693147182464599609375;
    float _1960 = fma(_1884, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1952);
    float _1962 = fma(_1942, _1954, -0.212114393711090087890625);
    float _1964 = sqrt(_1938);
    float _1966 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1960);
    float _1968 = -_1902;
    float _1970 = fma(_1940, _1946, _1968);
    float _1972 = fma(_1942, _1962, 1.570728778839111328125);
    float _1974 = fma(_1970, 0.5, 0.5);
    float _1976 = _1956 * _1950;
    float _1978 = _1966 * _1950;
    float _1980 = _1958 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1982 = fma(_1976, 0.5, 0.5);
    float _1984 = fma(_1978, -0.5, 0.5);
    float _1986 = _1964 * 0.636619746685028076171875;
    float _1988 = -_1972;
    float _1990 = fma(_1986, _1988, 1.0);
    float3 _5284 = float3(_1982, _1984, _1980);
    float _1992 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5284, float3(0.0), isnan(_5284)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5284, float3(0.0), isnan(_5284)), level(0.0)).x;
    float3 _5295 = float3(_1982, _1984, _1980);
    float4 _1995 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5295, float3(0.0), isnan(_5295)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5295, float3(0.0), isnan(_5295)), level(0.0)).xyzw;
    float _1997 = _1995.x;
    float _1999 = _1995.y;
    float _2001 = _1995.z;
    float _2003 = _1995.w;
    float2 _5312 = float2(_1990, _1974);
    float3 _2007 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5312, float2(0.0), isnan(_5312)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5312, float2(0.0), isnan(_5312)), level(0.0)).xyz;
    float _2009 = _2007.x;
    float _2011 = _2007.y;
    float _2013 = _2007.z;
    float _2015 = -_1070;
    float _2017 = fma(_2015, (*spvDescriptorSet0.vp_c9)._m0[18].w, _982);
    float _2019 = -_1072;
    float _2021 = fma(_2019, (*spvDescriptorSet0.vp_c9)._m0[18].w, _912);
    float _2023 = -_1074;
    float _2025 = fma(_2023, (*spvDescriptorSet0.vp_c9)._m0[18].w, _846);
    float _2027 = _1890 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2029 = _2017 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2031 = _1896 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2033 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2029);
    float _2035 = _2017 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2037 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2031);
    float _2039 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2033);
    float _2041 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2035);
    bool _2043 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2045 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2047 = _2043 || _2045;
    bool _2049 = isnan(0.5);
    bool _2051 = _2047 || _2049;
    float _2053 = fma(_1884, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2037);
    float _2055 = _2039 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2057 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2041);
    float _2059 = exp2(_2027);
    float _2061 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2053);
    float _2063 = _2057 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2065 = _2063 + _2055;
    float _2067 = 1.0 / _2055;
    float _2069 = _1884;
    if (_2051)
    {
        _2069 = 1.0;
    }
    float _2071 = _2069;
    float _2073 = _2065 * _2067;
    float _2075 = _2073 * 0.5;
    float _2077 = _2071;
    if (!_2051)
    {
        float _2079 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2081 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2083 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2081);
        float _2085 = _2079 * 0.15915493667125701904296875;
        float _2087 = _2085 * 6.283185482025146484375;
        float _2089 = cos(_2087);
        float _2091 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2093 = _2091 * 0.15915493667125701904296875;
        float _2095 = _2085 * 6.283185482025146484375;
        float _2097 = sin(_2095);
        float _2099 = 1.0 / _2089;
        float _2101 = _2093 * 6.283185482025146484375;
        float _2103 = cos(_2101);
        float _2105 = _2097 * _2099;
        float _2107 = 1.0 / _2083;
        float _2109 = _2103 * _2105;
        float _2111 = _2093 * 6.283185482025146484375;
        float _2113 = sin(_2111);
        float _2115 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2117 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2115;
        float _2119 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2121 = _2107 * _2119;
        float _2123 = 1.0 / _2109;
        float _2125 = 1.0 / _2117;
        float _2127 = _2113 * _2123;
        float _2129 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2131 = fma(_2127, _2121, _2129);
        float _2133 = _2131 * _2125;
        float _2135 = precise::clamp(_2133, 0.0, 1.0);
        _2077 = _2135;
    }
    float _2137 = _2077;
    float _2139 = -_2059;
    float _2141 = _2139 + 1.0;
    float _2143 = _2061 + _1936;
    bool _2145 = _2137 > 0.0;
    bool _2147 = isnan(_2137);
    bool _2149 = _2145 || _2147;
    bool _2151 = isnan(0.0);
    bool _2153 = _2149 || _2151;
    float _2155 = _2137 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2157 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2159 = _2143 * 0.5;
    float _2161 = _2157 * _1992;
    float _2163 = -_2157;
    float _2165 = _2163 + 1.0;
    out.gl_Position.x = _1956;
    out.gl_Position.y = _1966;
    out.gl_Position.z = _2061;
    out.gl_Position.w = _1936;
    float _2167 = _2155 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2169 = _2003 * _2161;
    float _2171 = _2013 * _2161;
    out.m_69.z = _2159;
    out.m_69.w = _1936;
    float _2173 = fma(_2009, _2169, _1997);
    float _2175 = fma(_2011, _2169, _1999);
    float _2177 = _2003 * _2165;
    float _2179 = fma(_2003, _2171, _2001);
    out.m_47.x = _2167;
    out.m_71.x = _2173;
    out.m_71.y = _2175;
    out.m_71.z = _2179;
    out.m_71.w = _2177;
    if (_2153)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2181 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2181;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1618 = false;
    bool _764 = false;
    bool _650 = false;
    bool _456 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2238 = as_type<float>(_106);
        out.gl_Position.z = _2238;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_49.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = _124;
    if (_120)
    {
        float _128 = float(_90);
        _100 = _128;
    }
    float _130 = _100;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_47.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2308 = as_type<float>(_144);
        out.gl_Position.z = _2308;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_51.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_49.x;
    float _162 = in.m_49.y;
    float _164 = in.m_49.z;
    float _166 = in.m_44.x;
    float _168 = in.m_44.y;
    float _170 = in.m_44.z;
    float _172 = 0.0;
    float _174 = _148;
    if (!_158)
    {
        float _176 = _148 * _148;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = _180;
    if (!_158)
    {
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    bool _188 = !_158;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _148 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _148);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    bool _224 = !_158;
    if (!_224)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _148 * _228;
        float _238 = exp2(_236);
        float _240 = -_238;
        float _242 = _240 + 1.0;
        float _244 = _242 * _234;
        _174 = _244;
    }
    float _246 = _174;
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _250 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _254 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _256 = fma(_246, _160, _250);
    float _258 = fma(_246, _162, _252);
    float _260 = fma(_246, _164, _254);
    float _262 = fma(_256, _146, _166);
    float _264 = fma(_258, _146, _168);
    float _266 = fma(_260, _146, _170);
    bool _268 = !_248;
    float _286;
    if (!_268)
    {
        float _270 = in.m_53.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        float _290 = float(_90);
        float _292 = 1.0 / _290;
        float _294 = _124 * _292;
        _286 = _294;
    }
    _288 = false;
    float _296 = _286;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = _296 + _298;
    bool _302 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _304 = isnan(_296);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    bool _314 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _316 = isnan(_296);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _334 = 1.0 / _328;
    bool _336 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _338 = 1.0 / _332;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _340;
    float _344 = _300 * _334;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _348 = _296 + _346;
    bool _350 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _352 = isnan(_296);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = -_312;
    float _364 = _362 + 1.0;
    float _366 = fma(_342, _344, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _368 = _360 * _364;
    float _370 = -_360;
    float _372 = _370 + 1.0;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _378;
    float _382 = _348 * _338;
    float _384 = _324 * _372;
    float _386 = fma(_376, _344, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _388 = fma(_380, _344, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _390 = -_324;
    float _392 = _390 + 1.0;
    float _394 = _366 * _384;
    float _396 = _386 * _384;
    float _398 = _388 * _384;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _412 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].x, _396);
    float _414 = fma(_402, _382, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _416 = fma(_406, _382, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _418 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].y, _394);
    float _420 = fma(_410, _382, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _422 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].z, _398);
    float _424 = fma(_414, _368, _412);
    float _426 = fma(_416, _368, _418);
    float _428 = fma(_420, _368, _422);
    float _430 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[145].x, _424);
    float _432 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[145].y, _426);
    float _434 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[145].z, _428);
    bool _436 = !_336;
    float _454;
    if (!_436)
    {
        float _438 = in.m_53.x;
        float _440 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _442 = _438 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _444 = fma(_442, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _446 = _444 * _440;
        float _448 = floor(_446);
        float _450 = -_448;
        float _452 = _446 + _450;
        _454 = _452;
        _456 = true;
    }
    else
    {
        float _458 = float(_90);
        float _460 = 1.0 / _458;
        float _462 = _124 * _460;
        _454 = _462;
    }
    _456 = false;
    float _464 = _454;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _468 = _464 + _466;
    bool _470 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _472 = isnan(_464);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _484 = _464 + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _486;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _494 = -_480;
    float _496 = _494 + 1.0;
    float _498 = 1.0 / _488;
    bool _500 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _502 = 1.0 / _492;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _504;
    float _508 = _468 * _498;
    bool _510 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _512 = isnan(_464);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _522;
    bool _526 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _528 = isnan(_464);
    bool _530 = _526 || _528;
    bool _532 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _534 = _530 || _532;
    float _536 = float(_534);
    float _538 = fma(_506, _508, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _540 = fma(_524, _508, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _542 = _536 * _496;
    float _544 = -_536;
    float _546 = _544 + 1.0;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _548;
    float _552 = _484 * _502;
    float _554 = _520 * _546;
    float _556 = fma(_550, _508, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _558 = -_520;
    float _560 = _558 + 1.0;
    float _562 = _538 * _554;
    float _564 = _556 * _554;
    float _566 = _540 * _554;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _570 = _568 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _580 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[107].x, _564);
    float _582 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[107].y, _562);
    float _584 = fma(_570, _552, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _586 = fma(_574, _552, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _588 = fma(_578, _552, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _590 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[107].z, _566);
    float _592 = fma(_584, _542, _580);
    float _594 = fma(_586, _542, _582);
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _598 = fma(_588, _542, _590);
    float _600 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[109].x, _592);
    float _602 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[109].y, _594);
    float _604 = in.m_51.x;
    float _606 = in.m_51.y;
    float _608 = in.m_51.z;
    float _610 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[109].z, _598);
    float _612 = _600 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _614 = _602 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _616 = _610 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _618 = _612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _620 = _614 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _622 = _616 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _618;
    out.m_55.y = _620;
    out.m_55.z = _622;
    out.m_55.w = _596;
    float _624 = _434 * _608;
    float _626 = _432 * _606;
    float _628 = _430 * _604;
    bool _630 = !_500;
    float _648;
    if (!_630)
    {
        float _632 = in.m_53.x;
        float _634 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _636 = _632 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _638 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _640 = _638 * _634;
        float _642 = floor(_640);
        float _644 = -_642;
        float _646 = _640 + _644;
        _648 = _646;
        _650 = true;
    }
    else
    {
        float _652 = float(_90);
        float _654 = 1.0 / _652;
        float _656 = _124 * _654;
        _648 = _656;
    }
    _650 = false;
    float _658 = _648;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _662 = _658 + _660;
    bool _664 = _658 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _666 = isnan(_658);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _672 = _668 || _670;
    float _674 = float(_672);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _676;
    bool _680 = _658 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _682 = isnan(_658);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = 1.0 / _678;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _694;
    bool _698 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _700;
    float _704 = _662 * _692;
    float _706 = -_674;
    float _708 = _706 + 1.0;
    float _710 = fma(_696, _704, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _712 = fma(_702, _704, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _714;
    float _718 = _690 * _708;
    float _720 = -_690;
    float _722 = _720 + 1.0;
    float _724 = fma(_716, _704, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _726 = _710 * _718;
    float _728 = _724 * _718;
    float _730 = _712 * _718;
    float _732 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[123].x, _726);
    float _734 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[123].y, _728);
    float _736 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[123].z, _730);
    float _738 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[124].x, _732);
    float _740 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[124].y, _734);
    float _742 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[124].z, _736);
    bool _744 = !_698;
    float _762;
    if (!_744)
    {
        float _746 = in.m_53.x;
        float _748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _750 = _746 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _752 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _754 = _752 * _748;
        float _756 = floor(_754);
        float _758 = -_756;
        float _760 = _754 + _758;
        _762 = _760;
        _764 = true;
    }
    else
    {
        float _766 = float(_90);
        float _768 = 1.0 / _766;
        float _770 = _124 * _768;
        _762 = _770;
    }
    _764 = false;
    float _772 = _762;
    float _774 = in.m_53.z;
    float _776 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _778 = in.m_53.x;
    int _780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _782 = _780 != 0;
    int _784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _786 = _784 != 0;
    int _788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _790 = _788 != 0;
    float _792 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _794 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _796 = in.m_53.y;
    float _798 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _776);
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _802 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _792);
    float _804 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _794);
    float _806 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _798);
    float _808 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _802);
    float _810 = _626 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _814 = _628 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _816 = _624 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _818 = _774 * 2.0;
    float _820 = _778 * 2.0;
    float _822 = _778 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _824 = floor(_818);
    float _826 = _796 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _828 = -_800;
    float _830 = fma(_822, 2.0, _828);
    float _832 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _804);
    bool _834 = !_782;
    int _836 = _834 ? 0 : 1;
    float _838 = fma(_826, -2.0, _812);
    float _840 = _796 * 2.0;
    float _842 = floor(_820);
    int _844 = abs(_836);
    float _846 = _832 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _848 = _778 + _796;
    bool _850 = _796 > 0.5;
    float _852 = float(_844);
    float _854 = _848 + (-1.0);
    bool _856 = _824 > 0.0;
    float _858 = floor(_840);
    bool _860 = _824 >= 0.0;
    bool _862 = isnan(_824);
    bool _864 = _860 || _862;
    bool _866 = isnan(0.0);
    bool _868 = _864 || _866;
    float _870 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _872 = _868 ? 0 : 1;
    bool _874 = _842 > 0.0;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _878 = 1.0 + _876;
    int _880 = ~_872;
    int _882 = _880 + 1;
    int _884 = _882 + 1;
    bool _886 = _842 >= 0.0;
    bool _888 = isnan(_842);
    bool _890 = _886 || _888;
    bool _892 = isnan(0.0);
    bool _894 = _890 || _892;
    float _896 = 1.0 / _878;
    int _898 = _884;
    bool _900 = _786;
    if (!_856)
    {
        int _902 = ~_872;
        int _904 = _902 + 1;
        _898 = _904;
    }
    int _906 = _898;
    int _908 = _894 ? 0 : 1;
    float _910 = float(_906);
    float _912 = _806 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _914 = ~_908;
    int _916 = _914 + 1;
    int _918 = _916 + 1;
    float _920 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _922 = log2(_920);
    int _924 = _918;
    if (!_874)
    {
        int _926 = ~_908;
        int _928 = _926 + 1;
        _924 = _928;
    }
    int _930 = _924;
    float _932 = _852 * _910;
    float _934 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _936 = _912 + _934;
    float _938 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _940 = _846 + _938;
    bool _942 = _858 > 0.0;
    float _944 = _932 * (-2.0);
    bool _946 = _858 >= 0.0;
    bool _948 = isnan(_858);
    bool _950 = _946 || _948;
    bool _952 = isnan(0.0);
    bool _954 = _950 || _952;
    bool _956 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _958 = isnan(0.0);
    bool _960 = _956 || _958;
    bool _962 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _964 = _960 || _962;
    bool _966 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _968 = isnan(1.0);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _974 = _970 || _972;
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _978 = _954 ? 0 : 1;
    float _980 = _922 * _124;
    float _982 = _808 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _984 = in.m_57.x;
    float _986 = in.m_57.y;
    float _988 = in.m_57.z;
    float _990 = exp2(_980);
    float _992 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _994 = _982 + _992;
    float _996 = _994 * _994;
    float _998 = fma(_936, _936, _996);
    float _1000 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[78].z, _976);
    bool _1002 = !_786;
    int _1004 = _1002 ? 0 : 1;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1008 = fma(_940, _940, _998);
    int _1010 = ~_978;
    int _1012 = _1010 + 1;
    int _1014 = _1012 + 1;
    float _1016 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1000);
    float _1018 = -_990;
    float _1020 = _1018 + 1.0;
    int _1022 = abs(_1004);
    float _1024 = -_124;
    float _1026 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[76].x, _830);
    float _1028 = rsqrt(_1008);
    int _1030 = _1014;
    if (!_942)
    {
        int _1032 = ~_978;
        int _1034 = _1032 + 1;
        _1030 = _1034;
    }
    int _1036 = _1030;
    float _1038 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1006);
    float _1040 = _964 ? _1020 : 0.0;
    float _1042 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _838);
    float _1044 = float(_1022);
    float _1046 = fma(_870, _944, _870);
    float _1048 = float(_930);
    float _1050 = fma(_944, _984, _984);
    float _1052 = _778 + (-0.5);
    bool _1054 = !_790;
    int _1056 = _1054 ? 0 : 1;
    float _1058 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1038);
    float _1060 = _1044 * _1048;
    if (_974)
    {
        float _1062 = _1040 * _896;
        _126 = _1062;
    }
    float _1064 = _126;
    float _1066 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1050);
    float _1068 = _796 + _774;
    float _1070 = _994 * _1028;
    float _1072 = _936 * _1028;
    float _1074 = _940 * _1028;
    float _1076 = _1068 + (-1.0);
    float _1078 = -_1070;
    float _1080 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[18].w, _994);
    float _1082 = -_1072;
    float _1084 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[18].w, _936);
    float _1086 = -_1074;
    float _1088 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[18].w, _940);
    float _1090 = float(_1036);
    float _1092 = _1080 * _1080;
    float _1094 = fma(_1084, _1084, _1092);
    int _1096 = abs(_1056);
    float _1098 = fma(_1046, _1064, _1066);
    float _1100 = fma(_1088, _1088, _1094);
    float _1102 = _1060 * (-2.0);
    float _1104 = float(_1096);
    float _1106 = fma(_1102, _986, _986);
    float _1108 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1110 = _778 + _774;
    float _1112 = _1104 * _1090;
    float _1114 = _796 + (-0.5);
    float _1116 = fma(_1108, _1102, _1108);
    float _1118 = _1110 + (-1.0);
    float _1120 = _1112 * (-2.0);
    float _1122 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1106);
    float _1124 = sqrt(_1100);
    float _1126 = fma(_1118, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1128 = fma(_1120, _988, _988);
    float _1130 = fma(_1116, _1064, _1122);
    float _1132 = in.m_59.x;
    float _1134 = in.m_59.y;
    float _1136 = in.m_59.z;
    float _1138 = fma(_1126, _1120, _1126);
    float _1140 = _1098 * 0.15915493667125701904296875;
    float _1142 = _1130 * 0.15915493667125701904296875;
    float _1144 = _774 + (-0.5);
    float _1146 = _1140 * 6.283185482025146484375;
    float _1148 = sin(_1146);
    float _1150 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1128);
    float _1152 = fma(_1138, _1064, _1150);
    float _1154 = _1028 * _1124;
    float _1156 = _1140 * 6.283185482025146484375;
    float _1158 = cos(_1156);
    float _1160 = _1152 * 0.15915493667125701904296875;
    float _1162 = _810 * _1154;
    float _1164 = _814 * _1154;
    float _1166 = _1142 * 6.283185482025146484375;
    float _1168 = sin(_1166);
    float _1170 = _816 * _1154;
    float _1172 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1132);
    float _1174 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1134);
    float _1176 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1136);
    float _1178 = _1164 * _1172;
    float _1180 = _1162 * _1174;
    float _1182 = _1142 * 6.283185482025146484375;
    float _1184 = cos(_1182);
    float _1186 = _1170 * _1176;
    float _1188 = in.m_53.w;
    float _1190 = _1160 * 6.283185482025146484375;
    float _1192 = sin(_1190);
    float _1194 = _1158 * _1168;
    float _1196 = in.m_61.x;
    float _1198 = _1160 * 6.283185482025146484375;
    float _1200 = cos(_1198);
    float _1202 = _1148 * _1184;
    float _1204 = -_1194;
    float _1206 = fma(_1192, _1202, _1204);
    float _1208 = -_1202;
    float _1210 = fma(_1192, _1194, _1208);
    float _1212 = _1148 * _1168;
    float _1214 = _1158 * _1184;
    bool _1216 = _1188 > 0.5;
    float _1218 = fma(_1192, _1214, _1212);
    float _1220 = _1184 * _1200;
    float _1222 = _1168 * _1200;
    float _1224 = _1200 * _1180;
    float _1226 = fma(_1192, _1212, _1214);
    float _1228 = -_1180;
    float _1230 = _1192 * _1228;
    float _1232 = _1158 * _1224;
    float _1234 = _1148 * _1224;
    float _1236 = fma(_1220, _1178, _1230);
    float _1238 = fma(_1218, _1178, _1232);
    float _1240 = fma(_1206, _1178, _1234);
    float _1242 = fma(_1222, _1186, _1236);
    float _1244 = in.m_61.y;
    float _1246 = fma(_1210, _1186, _1238);
    float _1248 = fma(_1226, _1186, _1240);
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1252 = _1250 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1254 = _1246 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1256 = _1246 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1258 = 1.0 / _1252;
    int _1260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1262 = _1260 != 0;
    float _1264 = fma(_1242, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1254);
    float _1266 = fma(_1242, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1256);
    int _1268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1270 = _1268 != 0;
    float _1272 = fma(_1248, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1264);
    float _1274 = fma(_1248, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1266);
    float _1276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1280 = _1278 != 0;
    float _1282 = _912 + _1272;
    float _1284 = _846 + _1274;
    float _1286 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1288 = _1282 + _1286;
    float _1290 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1292 = _1284 + _1290;
    bool _1294 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1296 = isnan(_772);
    bool _1298 = _1294 || _1296;
    bool _1300 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1302 = _1298 || _1300;
    float _1304 = float(_1302);
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1308 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1306;
    float _1310 = _1288 * _1288;
    float _1312 = _1292 * _1292;
    float _1314 = -_1244;
    float _1316 = _1314 + 1.0;
    float _1318 = _1308 * _1258;
    float _1320 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1322 = _772 + _1320;
    float _1324 = _1310 + _1312;
    bool _1326 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1328 = isnan(_772);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1334 = _1330 || _1332;
    float _1336 = float(_1334);
    float _1338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1340 = _1216 ? as_type<int>(_1316) : as_type<int>(_1244);
    bool _1342 = _1216;
    float _1344 = _1244;
    float _1346 = _1242;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _1350 = _1248;
    float _1352 = _1310;
    if (_1262)
    {
        bool _1354 = _774 > 0.5;
        _1342 = _1354;
    }
    bool _1356 = _1342;
    float _1358 = fma(_1318, _1322, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1360 = -_1304;
    float _1362 = _1360 + 1.0;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1366 = _1364 != 0;
    float _1368 = sqrt(_1324);
    if (_1270)
    {
        bool _1370 = _778 > 0.5;
        _900 = _1370;
    }
    bool _1372 = _900;
    float _1374 = _1336 * _1362;
    float _1376 = _1366 ? as_type<float>(_1340) : _1244;
    float _1378 = -_1336;
    float _1380 = _1378 + 1.0;
    int _1382 = as_type<int>(_1374);
    float _1384 = _1380;
    if (_1280)
    {
        float _1386 = _850 ? _1316 : _1244;
        _1344 = _1386;
    }
    float _1388 = _1344;
    float _1390 = _1276 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1392 = _1246 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1396 = _1358 * _1374;
    float _1398 = fma(_1390, _1388, -0.5);
    float _1400 = fma(_1242, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1392);
    int _1402 = as_type<int>(_1388);
    float _1404 = _1396;
    if (_1262)
    {
        float _1406 = -_1196;
        float _1408 = _1406 + 1.0;
        _1402 = as_type<int>(_1408);
    }
    int _1410 = _1402;
    if (_1270)
    {
        float _1412 = -_1196;
        float _1414 = _1412 + 1.0;
        _1382 = as_type<int>(_1414);
    }
    int _1416 = _1382;
    float _1418 = as_type<float>(_1416);
    if (!_1262)
    {
        _1346 = _1196;
    }
    float _1420 = _1346;
    float _1422 = fma(_1248, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1400);
    bool _1424 = _1368 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1428 = _1420;
    if (!_1270)
    {
        _1348 = _1196;
    }
    float _1430 = _1348;
    float _1432 = _982 + _1422;
    float _1434 = _1430;
    if (_1262)
    {
        float _1436 = _1356 ? as_type<float>(_1410) : _1196;
        _1428 = _1436;
    }
    float _1438 = _1428;
    float _1440 = fma(_1380, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1396);
    if (_1270)
    {
        float _1442 = _1372 ? as_type<float>(_1416) : _1196;
        _1434 = _1442;
    }
    float _1444 = _1434;
    if (!_1424)
    {
        _1350 = _1312;
    }
    float _1446 = _1350;
    float _1448 = _1446;
    if (!_1424)
    {
        _1384 = _1282;
    }
    float _1450 = _1384;
    float _1452 = _1450;
    if (!_1424)
    {
        _1404 = _1284;
    }
    float _1454 = _1404;
    float _1456 = _1454;
    if (!_1424)
    {
        _1418 = _1432;
    }
    float _1458 = _1418;
    bool _1460 = !_1424;
    float _1462 = _1458;
    if (!_1460)
    {
        float _1464 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1466 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1468 = _1368 + _1466;
        float _1470 = rsqrt(_1324);
        float _1472 = _1468 * _1464;
        float _1474 = _1432 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1476 = _1472 * 0.15915493667125701904296875;
        float _1478 = _1476 * 6.283185482025146484375;
        float _1480 = sin(_1478);
        float _1482 = _1476 * 6.283185482025146484375;
        float _1484 = cos(_1482);
        float _1486 = fma(_1480, _1474, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1488 = _1470 * _1486;
        float _1490 = _1484 + (-1.0);
        float _1492 = fma(_1288, _1488, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1494 = fma(_1292, _1488, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1496 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1498 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1500 = _1492 + _1498;
        float _1502 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1504 = _1494 + _1502;
        float _1506 = fma(_1432, _1484, _1496);
        float _1508 = _1500 * _1500;
        float _1510 = _1504 * _1504;
        _1462 = _1506;
        _1352 = _1508;
        _1448 = _1510;
        _1452 = _1492;
        _1456 = _1494;
    }
    float _1512 = _1462;
    float _1514 = _1352;
    float _1516 = _1448;
    float _1518 = _1452;
    float _1520 = _1456;
    float _1522 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1524 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1526 = _1512 + _1524;
    float _1528 = -_1042;
    float _1530 = fma(_1058, _1398, _1528);
    float _1532 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1440);
    float _1534 = fma(_1522, _1444, -0.5);
    float _1536 = fma(_1526, _1526, _1514);
    float _1538 = _1376 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1540 = _1438 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1542 = fma(_1016, _1534, _1026);
    float _1544 = _1536 + _1516;
    float _1546 = _1538 * _1426;
    float _1548 = _738 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1550 = _740 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1552 = _742 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1554 = _1540 * _1394;
    float _1556 = sqrt(_1544);
    float _1558 = _1548 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1560 = _1550 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1562 = _1552 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1564 = _1530 + 0.5;
    float _1566 = _1532 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1568 = _1542 + 0.5;
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    out.m_65.x = _1558;
    out.m_65.y = _1560;
    out.m_65.z = _1562;
    out.m_65.w = _1566;
    bool _1570 = _1556 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1572 = isnan(_1556);
    bool _1574 = _1570 || _1572;
    bool _1576 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1578 = _1574 || _1576;
    out.m_67.x = _1568;
    out.m_67.y = _1564;
    out.m_67.z = _1554;
    out.m_67.w = _1546;
    float _1580 = _1552;
    float _1582 = _1560;
    if (!_1578)
    {
        _1580 = 1.0;
    }
    float _1584 = _1580;
    bool _1586 = !_1578;
    float _1588 = _1584;
    if (!_1586)
    {
        bool _1590 = _1556 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1592 = isnan(_1556);
        bool _1594 = _1590 || _1592;
        bool _1596 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1598 = _1594 || _1596;
        if (!_1598)
        {
            float _1600 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1602 = _1556 + _1600;
            float _1604 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1606 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1604;
            float _1608 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1610 = _1608 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1612 = 1.0 / _1606;
            float _1614 = _1602 * _1612;
            float _1616 = fma(_1614, _1610, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1588 = _1616;
            _1618 = true;
        }
        else
        {
            bool _1620 = _1556 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1622 = isnan(_1556);
            bool _1624 = _1620 || _1622;
            bool _1626 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1628 = _1624 || _1626;
            if (!_1628)
            {
                float _1630 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1632 = _1556 + _1630;
                float _1634 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1636 = _1634 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1638 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1640 = _1638 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1642 = 1.0 / _1636;
                float _1644 = _1632 * _1642;
                float _1646 = fma(_1644, _1640, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1588 = _1646;
                _1618 = true;
            }
            else
            {
                _1588 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1618 = false;
    float _1648 = _1588;
    float _1650 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1652 = _1512 + _1650;
    float _1654 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1656 = _1518 + _1654;
    float _1658 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1660 = _1520 + _1658;
    float _1662 = fma(_1652, _1648, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1664 = fma(_1656, _1648, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1666 = fma(_1660, _1648, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1668 = -_1070;
    float _1670 = fma(_1668, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1662);
    float _1672 = -_1072;
    float _1674 = fma(_1672, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1664);
    float _1676 = -_1074;
    float _1678 = fma(_1676, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1666);
    float _1680 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1682 = _1670 + _1680;
    float _1684 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1686 = _1674 + _1684;
    float _1688 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1690 = _1678 + _1688;
    float _1692 = _1682 * _1682;
    float _1694 = fma(_1686, _1686, _1692);
    float _1696 = fma(_1690, _1690, _1694);
    float _1698 = rsqrt(_1696);
    float _1700 = _1698 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1702 = _1686 * _1700;
    float _1704 = _1690 * _1700;
    float _1706 = _1702 * _1702;
    float _1708 = _1704 * _1704;
    float _1710 = _1706 + _1708;
    float _1712 = sqrt(_1710);
    bool _1714 = _1712 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1716 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1718 = _1712 + _1716;
    float _1720 = _1698;
    float _1722 = _1710;
    float _1724 = _1718;
    float _1726 = _1666;
    float _1728 = _1700;
    float _1730 = _1702;
    if (_1714)
    {
        float _1732 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1720 = _1732;
    }
    float _1734 = _1720;
    if (_1714)
    {
        float _1736 = rsqrt(_1710);
        _1722 = _1736;
    }
    float _1738 = _1722;
    if (_1714)
    {
        float _1740 = _1718 * _1734;
        _1724 = _1740;
    }
    float _1742 = _1724;
    if (_1714)
    {
        float _1744 = _1742 * 0.15915493667125701904296875;
        _1582 = _1744;
    }
    float _1746 = _1582;
    float _1748 = _1648;
    float _1750 = _1746;
    if (_1714)
    {
        float _1752 = _1746 * 6.283185482025146484375;
        float _1754 = sin(_1752);
        _1748 = _1754;
    }
    float _1756 = _1748;
    float _1758 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1760 = precise::max(0.0, _1758);
    float _1762 = _1690;
    float _1764 = _1760;
    float _1766 = _1758;
    if (_1714)
    {
        float _1768 = _1746 * 6.283185482025146484375;
        float _1770 = cos(_1768);
        _1762 = _1770;
    }
    float _1772 = _1762;
    float _1774 = -_1700;
    float _1776 = -_1760;
    float _1778 = fma(_1682, _1774, _1776);
    if (_1714)
    {
        float _1780 = _1778 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1764 = _1780;
    }
    float _1782 = _1764;
    float _1784 = _1782;
    if (!_1714)
    {
        _1750 = _1706;
    }
    float _1786 = _1750;
    float _1788 = sqrt(_1696);
    float _1790 = _1756;
    float _1792 = _1786;
    if (_1714)
    {
        float _1794 = fma(_1756, _1782, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1784 = _1794;
    }
    float _1796 = _1784;
    float _1798 = _1796;
    if (!_1714)
    {
        _1790 = _1778;
    }
    float _1800 = _1790;
    float _1802 = _1800;
    if (_1714)
    {
        float _1804 = _1772 + (-1.0);
        _1766 = _1804;
    }
    float _1806 = _1766;
    float _1808 = _1806;
    if (_1714)
    {
        float _1810 = _1738 * _1796;
        _1726 = _1810;
    }
    float _1812 = _1726;
    if (!_1714)
    {
        _1798 = _1704;
    }
    float _1814 = _1798;
    float _1816 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1818 = _1814;
    if (_1714)
    {
        float _1820 = _1806 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1728 = _1820;
    }
    float _1822 = _1728;
    if (_1714)
    {
        float _1824 = _1702 * _1812;
        _1730 = _1824;
    }
    float _1826 = _1730;
    if (_1714)
    {
        float _1828 = _1704 * _1812;
        _1818 = _1828;
    }
    float _1830 = _1818;
    if (!_1714)
    {
        _1808 = _1708;
    }
    float _1832 = _1808;
    float _1834 = _1832;
    if (_1714)
    {
        float _1836 = fma(_1778, _1772, _1822);
        _1802 = _1836;
    }
    float _1838 = _1802;
    if (_1714)
    {
        float _1840 = _1826 * _1826;
        _1792 = _1840;
    }
    float _1842 = _1792;
    if (_1714)
    {
        float _1844 = _1830 * _1830;
        _1834 = _1844;
    }
    float _1846 = _1834;
    float _1848 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1850 = fma(_1788, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1848);
    float _1852 = precise::clamp(_1850, 0.0, 1.0);
    float _1854 = fma(_1838, _1838, _1842);
    float _1856 = -_1852;
    float _1858 = _1856 + 1.0;
    float _1860 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1862 = _1854 + _1846;
    float _1864 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1866 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1868 = rsqrt(_1862);
    float _1870 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1864);
    float _1872 = _1670 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1874 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1860);
    float _1876 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1870);
    float _1878 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1872);
    float _1880 = fma(_1674, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1816);
    float _1882 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1874);
    float _1884 = _1876 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1886 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1878);
    float _1888 = abs(_1858);
    float _1890 = log2(_1888);
    float _1892 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1880);
    float _1894 = _1884 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1896 = _1886 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1898 = _1882 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1900 = _1868 * _1826;
    float _1902 = _1868 * _1838;
    float _1904 = _1896 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1906 = -_1894;
    float _1908 = fma(_1906, _1866, 1.0);
    float _1910 = _1900 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1912 = _1868 * _1830;
    float _1914 = _1892 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1916 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1904);
    float _1918 = -_1910;
    float _1920 = fma(_1902, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1918);
    float _1922 = log2(_1908);
    float _1924 = _1896 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1926 = fma(_1884, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1916);
    float _1928 = -_1912;
    float _1930 = fma(_1928, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1920);
    float _1932 = _1890 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1934 = _1896 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1936 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1926);
    float _1938 = fma(_1930, -0.5, 0.5);
    float _1940 = exp2(_1932);
    float _1942 = fma(_1930, 0.5, 0.5);
    float _1944 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1924);
    float _1946 = _1902 + 1.0;
    float _1948 = fma(_1884, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1944);
    float _1950 = 1.0 / _1936;
    float _1952 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1934);
    float _1954 = fma(_1942, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1956 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1948);
    float _1958 = _1922 * 0.693147182464599609375;
    float _1960 = fma(_1884, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1952);
    float _1962 = fma(_1942, _1954, -0.212114393711090087890625);
    float _1964 = sqrt(_1938);
    float _1966 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1960);
    float _1968 = -_1902;
    float _1970 = fma(_1940, _1946, _1968);
    float _1972 = fma(_1942, _1962, 1.570728778839111328125);
    float _1974 = fma(_1970, 0.5, 0.5);
    float _1976 = _1956 * _1950;
    float _1978 = _1966 * _1950;
    float _1980 = _1958 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1982 = fma(_1976, 0.5, 0.5);
    float _1984 = fma(_1978, -0.5, 0.5);
    float _1986 = _1964 * 0.636619746685028076171875;
    float _1988 = -_1972;
    float _1990 = fma(_1986, _1988, 1.0);
    float3 _5284 = float3(_1982, _1984, _1980);
    float _1992 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5284, float3(0.0), isnan(_5284)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5284, float3(0.0), isnan(_5284)), level(0.0)).x;
    float3 _5295 = float3(_1982, _1984, _1980);
    float4 _1995 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5295, float3(0.0), isnan(_5295)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5295, float3(0.0), isnan(_5295)), level(0.0)).xyzw;
    float _1997 = _1995.x;
    float _1999 = _1995.y;
    float _2001 = _1995.z;
    float _2003 = _1995.w;
    float2 _5312 = float2(_1990, _1974);
    float3 _2007 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5312, float2(0.0), isnan(_5312)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5312, float2(0.0), isnan(_5312)), level(0.0)).xyz;
    float _2009 = _2007.x;
    float _2011 = _2007.y;
    float _2013 = _2007.z;
    float _2015 = -_1070;
    float _2017 = fma(_2015, (*spvDescriptorSet0.vp_c9)._m0[18].w, _982);
    float _2019 = -_1072;
    float _2021 = fma(_2019, (*spvDescriptorSet0.vp_c9)._m0[18].w, _912);
    float _2023 = -_1074;
    float _2025 = fma(_2023, (*spvDescriptorSet0.vp_c9)._m0[18].w, _846);
    float _2027 = _1890 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2029 = _2017 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2031 = _1896 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2033 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2029);
    float _2035 = _2017 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2037 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2031);
    float _2039 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2033);
    float _2041 = fma(_2021, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2035);
    bool _2043 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2045 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2047 = _2043 || _2045;
    bool _2049 = isnan(0.5);
    bool _2051 = _2047 || _2049;
    float _2053 = fma(_1884, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2037);
    float _2055 = _2039 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2057 = fma(_2025, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2041);
    float _2059 = exp2(_2027);
    float _2061 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2053);
    float _2063 = _2057 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2065 = _2063 + _2055;
    float _2067 = 1.0 / _2055;
    float _2069 = _1884;
    if (_2051)
    {
        _2069 = 1.0;
    }
    float _2071 = _2069;
    float _2073 = _2065 * _2067;
    float _2075 = _2073 * 0.5;
    float _2077 = _2071;
    if (!_2051)
    {
        float _2079 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2081 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2083 = fma(_2075, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2081);
        float _2085 = _2079 * 0.15915493667125701904296875;
        float _2087 = _2085 * 6.283185482025146484375;
        float _2089 = cos(_2087);
        float _2091 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2093 = _2091 * 0.15915493667125701904296875;
        float _2095 = _2085 * 6.283185482025146484375;
        float _2097 = sin(_2095);
        float _2099 = 1.0 / _2089;
        float _2101 = _2093 * 6.283185482025146484375;
        float _2103 = cos(_2101);
        float _2105 = _2097 * _2099;
        float _2107 = 1.0 / _2083;
        float _2109 = _2103 * _2105;
        float _2111 = _2093 * 6.283185482025146484375;
        float _2113 = sin(_2111);
        float _2115 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2117 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2115;
        float _2119 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2121 = _2107 * _2119;
        float _2123 = 1.0 / _2109;
        float _2125 = 1.0 / _2117;
        float _2127 = _2113 * _2123;
        float _2129 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2131 = fma(_2127, _2121, _2129);
        float _2133 = _2131 * _2125;
        float _2135 = precise::clamp(_2133, 0.0, 1.0);
        _2077 = _2135;
    }
    float _2137 = _2077;
    float _2139 = -_2059;
    float _2141 = _2139 + 1.0;
    float _2143 = _2061 + _1936;
    bool _2145 = _2137 > 0.0;
    bool _2147 = isnan(_2137);
    bool _2149 = _2145 || _2147;
    bool _2151 = isnan(0.0);
    bool _2153 = _2149 || _2151;
    float _2155 = _2137 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2157 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2159 = _2143 * 0.5;
    float _2161 = _2157 * _1992;
    float _2163 = -_2157;
    float _2165 = _2163 + 1.0;
    out.gl_Position.x = _1956;
    out.gl_Position.y = _1966;
    out.gl_Position.z = _2061;
    out.gl_Position.w = _1936;
    float _2167 = _2155 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2169 = _2003 * _2161;
    float _2171 = _2013 * _2161;
    out.m_69.z = _2159;
    out.m_69.w = _1936;
    float _2173 = fma(_2009, _2169, _1997);
    float _2175 = fma(_2011, _2169, _1999);
    float _2177 = _2003 * _2165;
    float _2179 = fma(_2003, _2171, _2001);
    out.m_47.x = _2167;
    out.m_71.x = _2173;
    out.m_71.y = _2175;
    out.m_71.z = _2179;
    out.m_71.w = _2177;
    if (_2153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2181 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2181;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

