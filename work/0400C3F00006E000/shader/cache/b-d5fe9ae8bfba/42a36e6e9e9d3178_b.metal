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
    bool _1624 = false;
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
        float _2124 = as_type<float>(_106);
        out.gl_Position.z = _2124;
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
        float _2194 = as_type<float>(_144);
        out.gl_Position.z = _2194;
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
    float _596 = fma(_588, _542, _590);
    float _598 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[109].x, _592);
    float _600 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[109].y, _594);
    float _602 = in.m_51.x;
    float _604 = in.m_51.y;
    float _606 = in.m_51.z;
    float _608 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[109].z, _596);
    float _610 = _598 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _612 = _600 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _616 = _608 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _618 = _610 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _620 = _612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _622 = _616 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _618;
    out.m_55.y = _620;
    out.m_55.z = _622;
    out.m_55.w = _614;
    float _624 = _434 * _606;
    float _626 = _432 * _604;
    float _628 = _430 * _602;
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
    float _776 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _778 = in.m_53.x;
    int _780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _782 = _780 != 0;
    int _784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _786 = _784 != 0;
    int _788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _790 = _788 != 0;
    float _792 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _794 = in.m_53.y;
    float _796 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _798 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _776);
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _802 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _792);
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _806 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _796);
    float _808 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _798);
    float _810 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _802);
    float _812 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _806);
    bool _814 = !_782;
    int _816 = _814 ? 0 : 1;
    float _818 = _810 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _820 = _812 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _822 = abs(_816);
    float _824 = _774 * 2.0;
    float _826 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _828 = _818 + _826;
    float _830 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _832 = _820 + _830;
    float _834 = float(_822);
    float _836 = _778 * 2.0;
    float _838 = _778 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _840 = floor(_824);
    float _842 = _626 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _844 = _794 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _846 = -_804;
    float _848 = fma(_838, 2.0, _846);
    float _850 = _794 * 2.0;
    float _852 = _778 + _794;
    float _854 = fma(_844, -2.0, _800);
    float _856 = _628 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _858 = floor(_836);
    float _860 = _852 + (-1.0);
    float _862 = _624 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _864 = _794 > 0.5;
    float _866 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _868 = _840 > 0.0;
    float _870 = floor(_850);
    bool _872 = _840 >= 0.0;
    bool _874 = isnan(_840);
    bool _876 = _872 || _874;
    bool _878 = isnan(0.0);
    bool _880 = _876 || _878;
    int _882 = _880 ? 0 : 1;
    bool _884 = _858 > 0.0;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _888 = 1.0 + _886;
    bool _890 = _858 >= 0.0;
    bool _892 = isnan(_858);
    bool _894 = _890 || _892;
    bool _896 = isnan(0.0);
    bool _898 = _894 || _896;
    int _900 = ~_882;
    int _902 = _900 + 1;
    int _904 = _902 + 1;
    float _906 = 1.0 / _888;
    int _908 = _904;
    bool _910 = _786;
    float _912 = _778;
    if (!_868)
    {
        int _914 = ~_882;
        int _916 = _914 + 1;
        _908 = _916;
    }
    int _918 = _908;
    int _920 = _898 ? 0 : 1;
    float _922 = float(_918);
    int _924 = ~_920;
    int _926 = _924 + 1;
    int _928 = _926 + 1;
    float _930 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _932 = log2(_930);
    int _934 = _928;
    if (!_884)
    {
        int _936 = ~_920;
        int _938 = _936 + 1;
        _934 = _938;
    }
    int _940 = _934;
    float _942 = _808 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _944 = _834 * _922;
    bool _946 = _870 > 0.0;
    float _948 = in.m_57.x;
    float _950 = in.m_57.y;
    float _952 = in.m_57.z;
    float _954 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _956 = _942 + _954;
    bool _958 = _870 >= 0.0;
    bool _960 = isnan(_870);
    bool _962 = _958 || _960;
    bool _964 = isnan(0.0);
    bool _966 = _962 || _964;
    float _968 = _944 * (-2.0);
    bool _970 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _972 = isnan(0.0);
    bool _974 = _970 || _972;
    bool _976 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _978 = _974 || _976;
    float _980 = _956 * _956;
    bool _982 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _984 = isnan(1.0);
    bool _986 = _982 || _984;
    bool _988 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _990 = _986 || _988;
    float _992 = float(_940);
    float _994 = fma(_828, _828, _980);
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _998 = _932 * _124;
    int _1000 = _966 ? 0 : 1;
    float _1002 = exp2(_998);
    int _1004 = ~_1000;
    int _1006 = _1004 + 1;
    int _1008 = _1006 + 1;
    int _1010 = _1008;
    float _1012 = _942;
    if (!_946)
    {
        int _1014 = ~_1000;
        int _1016 = _1014 + 1;
        _1010 = _1016;
    }
    int _1018 = _1010;
    float _1020 = float(_1018);
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1024 = fma(_832, _832, _994);
    float _1026 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[78].w, _996);
    bool _1028 = !_786;
    int _1030 = _1028 ? 0 : 1;
    float _1032 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1022);
    float _1034 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1026);
    float _1036 = rsqrt(_1024);
    float _1038 = -_1002;
    float _1040 = _1038 + 1.0;
    int _1042 = abs(_1030);
    float _1044 = -_124;
    float _1046 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[76].x, _848);
    float _1048 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1032);
    float _1050 = _978 ? _1040 : 0.0;
    float _1052 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _854);
    float _1054 = float(_1042);
    if (_990)
    {
        float _1056 = _1050 * _906;
        _126 = _1056;
    }
    float _1058 = _126;
    float _1060 = _1054 * _992;
    float _1062 = fma(_866, _968, _866);
    float _1064 = fma(_968, _948, _948);
    float _1066 = _956 * _1036;
    float _1068 = _828 * _1036;
    float _1070 = _778 + (-0.5);
    bool _1072 = !_790;
    int _1074 = _1072 ? 0 : 1;
    float _1076 = -_1066;
    float _1078 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[18].w, _956);
    float _1080 = -_1068;
    float _1082 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[18].w, _828);
    float _1084 = _832 * _1036;
    float _1086 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1064);
    float _1088 = _1078 * _1078;
    float _1090 = _794 + _774;
    float _1092 = _1060 * (-2.0);
    float _1094 = fma(_1082, _1082, _1088);
    int _1096 = abs(_1074);
    float _1098 = -_1084;
    float _1100 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[18].w, _832);
    float _1102 = fma(_1062, _1058, _1086);
    float _1104 = _1090 + (-1.0);
    float _1106 = fma(_1100, _1100, _1094);
    float _1108 = float(_1096);
    float _1110 = _1102 * 0.15915493667125701904296875;
    float _1112 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1114 = _794 + (-0.5);
    float _1116 = fma(_1092, _950, _950);
    float _1118 = _778 + _774;
    float _1120 = _1108 * _1020;
    float _1122 = fma(_1112, _1092, _1112);
    float _1124 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1116);
    float _1126 = _1118 + (-1.0);
    float _1128 = _1120 * (-2.0);
    float _1130 = fma(_1122, _1058, _1124);
    float _1132 = sqrt(_1106);
    float _1134 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1136 = fma(_1128, _952, _952);
    float _1138 = _1130 * 0.15915493667125701904296875;
    float _1140 = in.m_59.x;
    float _1142 = in.m_59.y;
    float _1144 = in.m_59.z;
    float _1146 = _774 + (-0.5);
    float _1148 = fma(_1134, _1128, _1134);
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1152 = _772 + _1150;
    float _1154 = _1110 * 6.283185482025146484375;
    float _1156 = sin(_1154);
    float _1158 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1136);
    float _1160 = fma(_1148, _1058, _1158);
    float _1162 = _1110 * 6.283185482025146484375;
    float _1164 = cos(_1162);
    float _1166 = _1160 * 0.15915493667125701904296875;
    float _1168 = _1036 * _1132;
    float _1170 = _842 * _1168;
    float _1172 = _856 * _1168;
    float _1174 = _1138 * 6.283185482025146484375;
    float _1176 = sin(_1174);
    float _1178 = _862 * _1168;
    float _1180 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1140);
    float _1182 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1142);
    float _1184 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1144);
    float _1186 = _1138 * 6.283185482025146484375;
    float _1188 = cos(_1186);
    float _1190 = _1170 * _1182;
    float _1192 = _1172 * _1180;
    float _1194 = _1178 * _1184;
    float _1196 = _1166 * 6.283185482025146484375;
    float _1198 = sin(_1196);
    float _1200 = _1164 * _1176;
    float _1202 = _1166 * 6.283185482025146484375;
    float _1204 = cos(_1202);
    float _1206 = _1156 * _1188;
    float _1208 = -_1200;
    float _1210 = fma(_1198, _1206, _1208);
    float _1212 = -_1206;
    float _1214 = fma(_1198, _1200, _1212);
    float _1216 = _1156 * _1176;
    float _1218 = _1164 * _1188;
    float _1220 = fma(_1198, _1218, _1216);
    float _1222 = _1176 * _1204;
    float _1224 = _1204 * _1190;
    float _1226 = _1188 * _1204;
    float _1228 = fma(_1198, _1216, _1218);
    float _1230 = -_1190;
    float _1232 = _1198 * _1230;
    float _1234 = _1164 * _1224;
    float _1236 = _1156 * _1224;
    float _1238 = in.m_61.x;
    float _1240 = fma(_1226, _1192, _1232);
    float _1242 = fma(_1220, _1192, _1234);
    float _1244 = fma(_1210, _1192, _1236);
    float _1246 = in.m_53.w;
    float _1248 = fma(_1214, _1194, _1242);
    float _1250 = fma(_1228, _1194, _1244);
    float _1252 = fma(_1222, _1194, _1240);
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1256 = _1254 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1258 = _1248 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1260 = _1248 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1262 = in.m_61.y;
    float _1264 = fma(_1252, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1258);
    float _1266 = fma(_1252, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1260);
    float _1268 = 1.0 / _1256;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1272 = _1270 != 0;
    float _1274 = fma(_1250, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1264);
    float _1276 = fma(_1250, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1266);
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1280 = _1278 != 0;
    float _1282 = _1248 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1284 = _818 + _1274;
    float _1286 = _820 + _1276;
    int _1288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1290 = _1288 != 0;
    float _1292 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1296 = _1294 != 0;
    float _1298 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1300 = _1284 + _1298;
    float _1302 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1304 = _1286 + _1302;
    bool _1306 = _1246 > 0.5;
    float _1308 = fma(_1252, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1282);
    float _1310 = _1300 * _1300;
    float _1312 = _1304 * _1304;
    float _1314 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1316 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1318 = isnan(_772);
    bool _1320 = _1316 || _1318;
    bool _1322 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1324 = _1320 || _1322;
    float _1326 = float(_1324);
    float _1328 = _1310 + _1312;
    float _1330 = -_1262;
    float _1332 = _1330 + 1.0;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1334;
    bool _1338 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1340 = isnan(_772);
    bool _1342 = _1338 || _1340;
    bool _1344 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1346 = _1342 || _1344;
    float _1348 = float(_1346);
    float _1350 = fma(_1250, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1308);
    int _1352 = as_type<int>(_1252);
    bool _1354 = _1306;
    float _1356 = _1262;
    float _1358 = _1350;
    if (_1272)
    {
        float _1360 = -_1238;
        float _1362 = _1360 + 1.0;
        _1352 = as_type<int>(_1362);
    }
    int _1364 = _1352;
    float _1366 = sqrt(_1328);
    float _1368 = _1336 * _1268;
    int _1370 = _1306 ? as_type<int>(_1332) : as_type<int>(_1262);
    float _1372 = _942 + _1350;
    float _1374 = as_type<float>(_1364);
    if (_1280)
    {
        bool _1376 = _774 > 0.5;
        _1354 = _1376;
    }
    bool _1378 = _1354;
    float _1380 = -_1326;
    float _1382 = _1380 + 1.0;
    float _1384 = fma(_1368, _1152, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (_1272)
    {
        bool _1386 = _778 > 0.5;
        _910 = _1386;
    }
    bool _1388 = _910;
    float _1390 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1392 = _1348 * _1382;
    float _1394 = _1290 ? as_type<float>(_1370) : _1262;
    float _1396 = _1292 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1398 = _1392;
    if (_1296)
    {
        float _1400 = _864 ? _1332 : _1262;
        _1356 = _1400;
    }
    float _1402 = _1356;
    float _1404 = _1384 * _1392;
    float _1406 = -_1348;
    float _1408 = _1406 + 1.0;
    int _1410 = as_type<int>(_1402);
    float _1412 = _1408;
    if (!_1272)
    {
        _912 = _1238;
    }
    float _1414 = _912;
    float _1416 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1418 = _1366 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1420 = fma(_1396, _1402, -0.5);
    float _1422 = _1414;
    if (_1280)
    {
        float _1424 = -_1238;
        float _1426 = _1424 + 1.0;
        _1410 = as_type<int>(_1426);
    }
    int _1428 = _1410;
    float _1430 = as_type<float>(_1428);
    if (!_1280)
    {
        _1398 = _1238;
    }
    float _1432 = _1398;
    float _1434 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1404);
    float _1436 = _1432;
    if (_1272)
    {
        float _1438 = _1388 ? as_type<float>(_1364) : _1238;
        _1422 = _1438;
    }
    float _1440 = _1422;
    if (_1280)
    {
        float _1442 = _1378 ? as_type<float>(_1428) : _1238;
        _1436 = _1442;
    }
    float _1444 = _1436;
    if (!_1418)
    {
        _1430 = _1312;
    }
    float _1446 = _1430;
    float _1448 = _1446;
    if (!_1418)
    {
        _1374 = _1310;
    }
    float _1450 = _1374;
    float _1452 = _1450;
    if (!_1418)
    {
        _1358 = _1284;
    }
    float _1454 = _1358;
    float _1456 = _1454;
    if (!_1418)
    {
        _1012 = _1286;
    }
    float _1458 = _1012;
    float _1460 = _1458;
    if (!_1418)
    {
        _1412 = _1372;
    }
    float _1462 = _1412;
    bool _1464 = !_1418;
    float _1466 = _1462;
    if (!_1464)
    {
        float _1468 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1470 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1472 = _1366 + _1470;
        float _1474 = rsqrt(_1328);
        float _1476 = _1472 * _1468;
        float _1478 = _1372 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1480 = _1476 * 0.15915493667125701904296875;
        float _1482 = _1480 * 6.283185482025146484375;
        float _1484 = sin(_1482);
        float _1486 = _1480 * 6.283185482025146484375;
        float _1488 = cos(_1486);
        float _1490 = fma(_1484, _1478, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1492 = _1474 * _1490;
        float _1494 = fma(_1300, _1492, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1496 = _1488 + (-1.0);
        float _1498 = fma(_1304, _1492, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1500 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1502 = _1494 + _1500;
        float _1504 = _1496 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1506 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1508 = _1498 + _1506;
        float _1510 = _1502 * _1502;
        float _1512 = fma(_1372, _1488, _1504);
        float _1514 = _1508 * _1508;
        _1466 = _1512;
        _1452 = _1510;
        _1448 = _1514;
        _1456 = _1494;
        _1460 = _1498;
    }
    float _1516 = _1466;
    float _1518 = _1452;
    float _1520 = _1448;
    float _1522 = _1456;
    float _1524 = _1460;
    float _1526 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1528 = _1516 + _1526;
    float _1530 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1532 = -_1052;
    float _1534 = fma(_1034, _1420, _1532);
    float _1536 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1434);
    float _1538 = fma(_1528, _1528, _1518);
    float _1540 = fma(_1530, _1440, -0.5);
    float _1542 = _1394 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1544 = _1444 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1546 = _1538 + _1520;
    float _1548 = fma(_1048, _1540, _1046);
    float _1550 = _738 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1552 = _740 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1554 = _742 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1556 = _1542 * _1416;
    float _1558 = sqrt(_1546);
    float _1560 = _1544 * _1390;
    float _1562 = _1550 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1564 = _1552 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1566 = _1554 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1568 = _1534 + 0.5;
    float _1570 = _1536 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1572 = _1548 + 0.5;
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    out.m_65.x = _1562;
    out.m_65.y = _1564;
    out.m_65.z = _1566;
    out.m_65.w = _1570;
    bool _1574 = _1558 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1576 = isnan(_1558);
    bool _1578 = _1574 || _1576;
    bool _1580 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1582 = _1578 || _1580;
    out.m_67.x = _1572;
    out.m_67.y = _1568;
    out.m_67.z = _1560;
    out.m_67.w = _1556;
    float _1584 = _1548;
    float _1586 = _1554;
    float _1588 = _1556;
    if (!_1582)
    {
        _1584 = 1.0;
    }
    float _1590 = _1584;
    bool _1592 = !_1582;
    float _1594 = _1590;
    if (!_1592)
    {
        bool _1596 = _1558 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1598 = isnan(_1558);
        bool _1600 = _1596 || _1598;
        bool _1602 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1604 = _1600 || _1602;
        if (!_1604)
        {
            float _1606 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1608 = _1558 + _1606;
            float _1610 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1612 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1610;
            float _1614 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1616 = _1614 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1618 = 1.0 / _1612;
            float _1620 = _1608 * _1618;
            float _1622 = fma(_1620, _1616, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1594 = _1622;
            _1624 = true;
        }
        else
        {
            bool _1626 = _1558 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1628 = isnan(_1558);
            bool _1630 = _1626 || _1628;
            bool _1632 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1634 = _1630 || _1632;
            if (!_1634)
            {
                float _1636 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1638 = _1558 + _1636;
                float _1640 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1642 = _1640 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1644 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1646 = _1644 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1648 = 1.0 / _1642;
                float _1650 = _1638 * _1648;
                float _1652 = fma(_1650, _1646, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1594 = _1652;
                _1624 = true;
            }
            else
            {
                _1594 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1624 = false;
    float _1654 = _1594;
    float _1656 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1658 = _1516 + _1656;
    float _1660 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1662 = _1522 + _1660;
    float _1664 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1666 = _1524 + _1664;
    float _1668 = fma(_1658, _1654, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1670 = fma(_1662, _1654, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1672 = fma(_1666, _1654, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1674 = -_1066;
    float _1676 = fma(_1674, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1668);
    float _1678 = -_1068;
    float _1680 = fma(_1678, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1670);
    float _1682 = -_1084;
    float _1684 = fma(_1682, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1672);
    float _1686 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1688 = _1676 + _1686;
    float _1690 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1692 = _1680 + _1690;
    float _1694 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1696 = _1684 + _1694;
    float _1698 = _1688 * _1688;
    float _1700 = fma(_1692, _1692, _1698);
    float _1702 = fma(_1696, _1696, _1700);
    float _1704 = rsqrt(_1702);
    float _1706 = _1704 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1708 = _1692 * _1706;
    float _1710 = _1696 * _1706;
    float _1712 = _1708 * _1708;
    float _1714 = _1710 * _1710;
    float _1716 = _1712 + _1714;
    float _1718 = sqrt(_1716);
    bool _1720 = _1718 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1722 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1724 = _1718 + _1722;
    float _1726 = _1696;
    float _1728 = _1716;
    float _1730 = _1724;
    float _1732 = _1688;
    float _1734 = _1708;
    if (_1720)
    {
        float _1736 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1726 = _1736;
    }
    float _1738 = _1726;
    if (_1720)
    {
        float _1740 = rsqrt(_1716);
        _1728 = _1740;
    }
    float _1742 = _1728;
    if (_1720)
    {
        float _1744 = _1724 * _1738;
        _1730 = _1744;
    }
    float _1746 = _1730;
    if (_1720)
    {
        float _1748 = _1746 * 0.15915493667125701904296875;
        _1586 = _1748;
    }
    float _1750 = _1586;
    float _1752 = _1704;
    float _1754 = _1750;
    if (_1720)
    {
        float _1756 = _1750 * 6.283185482025146484375;
        float _1758 = sin(_1756);
        _1752 = _1758;
    }
    float _1760 = _1752;
    float _1762 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1764 = precise::max(0.0, _1762);
    float _1766 = _1544;
    float _1768 = _1764;
    float _1770 = _1762;
    if (_1720)
    {
        float _1772 = _1750 * 6.283185482025146484375;
        float _1774 = cos(_1772);
        _1766 = _1774;
    }
    float _1776 = _1766;
    float _1778 = -_1706;
    float _1780 = -_1764;
    float _1782 = fma(_1688, _1778, _1780);
    if (!_1720)
    {
        _1732 = _1710;
    }
    float _1784 = _1732;
    float _1786 = _1784;
    if (_1720)
    {
        float _1788 = _1782 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1768 = _1788;
    }
    float _1790 = _1768;
    float _1792 = _1790;
    float _1794 = _1760;
    if (_1720)
    {
        float _1796 = fma(_1760, _1790, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1792 = _1796;
    }
    float _1798 = _1792;
    float _1800 = _1798;
    if (!_1720)
    {
        _1794 = _1782;
    }
    float _1802 = _1794;
    float _1804 = _1802;
    if (_1720)
    {
        float _1806 = _1776 + (-1.0);
        _1770 = _1806;
    }
    float _1808 = _1770;
    float _1810 = _1808;
    if (_1720)
    {
        float _1812 = _1742 * _1798;
        _1588 = _1812;
    }
    float _1814 = _1588;
    if (!_1720)
    {
        _1800 = _1712;
    }
    float _1816 = _1800;
    float _1818 = sqrt(_1702);
    float _1820 = _1816;
    if (_1720)
    {
        float _1822 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1754 = _1822;
    }
    float _1824 = _1754;
    if (_1720)
    {
        float _1826 = _1708 * _1814;
        _1734 = _1826;
    }
    float _1828 = _1734;
    if (_1720)
    {
        float _1830 = _1710 * _1814;
        _1786 = _1830;
    }
    float _1832 = _1786;
    if (!_1720)
    {
        _1810 = _1714;
    }
    float _1834 = _1810;
    float _1836 = _1834;
    if (_1720)
    {
        float _1838 = fma(_1782, _1776, _1824);
        _1804 = _1838;
    }
    float _1840 = _1804;
    if (_1720)
    {
        float _1842 = _1828 * _1828;
        _1820 = _1842;
    }
    float _1844 = _1820;
    if (_1720)
    {
        float _1846 = _1832 * _1832;
        _1836 = _1846;
    }
    float _1848 = _1836;
    float _1850 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1852 = fma(_1840, _1840, _1844);
    float _1854 = _1852 + _1848;
    float _1856 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1858 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1860 = fma(_1818, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1858);
    float _1862 = precise::clamp(_1860, 0.0, 1.0);
    float _1864 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1850);
    float _1866 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1868 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1856);
    float _1870 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1872 = rsqrt(_1854);
    float _1874 = -_1862;
    float _1876 = _1874 + 1.0;
    float _1878 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1880 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1870);
    float _1882 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1868);
    float _1884 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1864);
    float _1886 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1878);
    float _1888 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1880);
    float _1890 = _1882 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1892 = _1884 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1894 = abs(_1876);
    float _1896 = log2(_1894);
    float _1898 = _1888 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1900 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1886);
    float _1902 = _1890 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1904 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1906 = _1900 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1908 = _1872 * _1828;
    float _1910 = _1872 * _1832;
    float _1912 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1904);
    float _1914 = _1872 * _1840;
    float _1916 = _1908 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1918 = -_1902;
    float _1920 = fma(_1918, _1866, 1.0);
    float _1922 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1912);
    float _1924 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1926 = -_1916;
    float _1928 = fma(_1914, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1926);
    float _1930 = _1896 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1932 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1922);
    float _1934 = log2(_1920);
    float _1936 = -_1910;
    float _1938 = fma(_1936, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1928);
    float _1940 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1942 = fma(_1938, -0.5, 0.5);
    float _1944 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1940);
    float _1946 = fma(_1938, 0.5, 0.5);
    float _1948 = exp2(_1930);
    float _1950 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1924);
    float _1952 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1944);
    float _1954 = _1914 + 1.0;
    float _1956 = fma(_1946, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1958 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1950);
    float _1960 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1952);
    float _1962 = 1.0 / _1932;
    float _1964 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1958);
    float _1966 = _1934 * 0.693147182464599609375;
    float _1968 = fma(_1946, _1956, -0.212114393711090087890625);
    float _1970 = fma(_1946, _1968, 1.570728778839111328125);
    float _1972 = sqrt(_1942);
    float _1974 = -_1914;
    float _1976 = fma(_1948, _1954, _1974);
    float _1978 = _1966 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1980 = fma(_1976, 0.5, 0.5);
    float _1982 = _1960 * _1962;
    float _1984 = _1964 * _1962;
    float _1986 = fma(_1982, 0.5, 0.5);
    float _1988 = fma(_1984, -0.5, 0.5);
    float _1990 = _1972 * 0.636619746685028076171875;
    float3 _5172 = float3(_1986, _1988, _1978);
    float _1992 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5172, float3(0.0), isnan(_5172)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5172, float3(0.0), isnan(_5172)), level(0.0)).x;
    float3 _5183 = float3(_1986, _1988, _1978);
    float4 _1995 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5183, float3(0.0), isnan(_5183)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5183, float3(0.0), isnan(_5183)), level(0.0)).xyzw;
    float _1997 = _1995.x;
    float _1999 = _1995.y;
    float _2001 = _1995.z;
    float _2003 = _1995.w;
    float _2005 = -_1970;
    float _2007 = fma(_1990, _2005, 1.0);
    float2 _5205 = float2(_2007, _1980);
    float3 _2011 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5205, float2(0.0), isnan(_5205)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5205, float2(0.0), isnan(_5205)), level(0.0)).xyz;
    float _2013 = _2011.x;
    float _2015 = _2011.y;
    float _2017 = _2011.z;
    float _2019 = _1896 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2021 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2023 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2021);
    float _2025 = exp2(_2019);
    float _2027 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2023);
    float _2029 = _1960 + _1932;
    float _2031 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2027);
    float _2033 = _2029 * 0.5;
    float _2035 = _1932 * 0.5;
    float _2037 = _2031 + _1932;
    out.gl_Position.x = _1960;
    out.gl_Position.y = _1964;
    out.gl_Position.z = _2031;
    out.gl_Position.w = _1932;
    float _2039 = fma(_1964, -0.5, _2035);
    float _2041 = _2037 * 0.5;
    float _2043 = -_2025;
    float _2045 = _2043 + 1.0;
    float _2047 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.x = _2033;
    out.m_69.y = _2039;
    out.m_69.z = _2041;
    out.m_69.w = _1932;
    float _2049 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_47.x = _2049;
    float _2051 = _2047 * _1992;
    float _2053 = -_2047;
    float _2055 = _2053 + 1.0;
    float _2057 = _2003 * _2051;
    float _2059 = _2017 * _2051;
    float _2061 = fma(_2013, _2057, _1997);
    float _2063 = fma(_2015, _2057, _1999);
    float _2065 = _2003 * _2055;
    float _2067 = fma(_2003, _2059, _2001);
    out.m_71.x = _2061;
    out.m_71.y = _2063;
    out.m_71.z = _2067;
    out.m_71.w = _2065;
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
    bool _1624 = false;
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
        float _2124 = as_type<float>(_106);
        out.gl_Position.z = _2124;
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
        float _2194 = as_type<float>(_144);
        out.gl_Position.z = _2194;
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
    float _596 = fma(_588, _542, _590);
    float _598 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[109].x, _592);
    float _600 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[109].y, _594);
    float _602 = in.m_51.x;
    float _604 = in.m_51.y;
    float _606 = in.m_51.z;
    float _608 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[109].z, _596);
    float _610 = _598 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _612 = _600 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _616 = _608 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _618 = _610 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _620 = _612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _622 = _616 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _618;
    out.m_55.y = _620;
    out.m_55.z = _622;
    out.m_55.w = _614;
    float _624 = _434 * _606;
    float _626 = _432 * _604;
    float _628 = _430 * _602;
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
    float _776 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _778 = in.m_53.x;
    int _780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _782 = _780 != 0;
    int _784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _786 = _784 != 0;
    int _788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _790 = _788 != 0;
    float _792 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _794 = in.m_53.y;
    float _796 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _798 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _776);
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _802 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _792);
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _806 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _796);
    float _808 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _798);
    float _810 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _802);
    float _812 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _806);
    bool _814 = !_782;
    int _816 = _814 ? 0 : 1;
    float _818 = _810 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _820 = _812 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _822 = abs(_816);
    float _824 = _774 * 2.0;
    float _826 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _828 = _818 + _826;
    float _830 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _832 = _820 + _830;
    float _834 = float(_822);
    float _836 = _778 * 2.0;
    float _838 = _778 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _840 = floor(_824);
    float _842 = _626 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _844 = _794 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _846 = -_804;
    float _848 = fma(_838, 2.0, _846);
    float _850 = _794 * 2.0;
    float _852 = _778 + _794;
    float _854 = fma(_844, -2.0, _800);
    float _856 = _628 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _858 = floor(_836);
    float _860 = _852 + (-1.0);
    float _862 = _624 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _864 = _794 > 0.5;
    float _866 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _868 = _840 > 0.0;
    float _870 = floor(_850);
    bool _872 = _840 >= 0.0;
    bool _874 = isnan(_840);
    bool _876 = _872 || _874;
    bool _878 = isnan(0.0);
    bool _880 = _876 || _878;
    int _882 = _880 ? 0 : 1;
    bool _884 = _858 > 0.0;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _888 = 1.0 + _886;
    bool _890 = _858 >= 0.0;
    bool _892 = isnan(_858);
    bool _894 = _890 || _892;
    bool _896 = isnan(0.0);
    bool _898 = _894 || _896;
    int _900 = ~_882;
    int _902 = _900 + 1;
    int _904 = _902 + 1;
    float _906 = 1.0 / _888;
    int _908 = _904;
    bool _910 = _786;
    float _912 = _778;
    if (!_868)
    {
        int _914 = ~_882;
        int _916 = _914 + 1;
        _908 = _916;
    }
    int _918 = _908;
    int _920 = _898 ? 0 : 1;
    float _922 = float(_918);
    int _924 = ~_920;
    int _926 = _924 + 1;
    int _928 = _926 + 1;
    float _930 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _932 = log2(_930);
    int _934 = _928;
    if (!_884)
    {
        int _936 = ~_920;
        int _938 = _936 + 1;
        _934 = _938;
    }
    int _940 = _934;
    float _942 = _808 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _944 = _834 * _922;
    bool _946 = _870 > 0.0;
    float _948 = in.m_57.x;
    float _950 = in.m_57.y;
    float _952 = in.m_57.z;
    float _954 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _956 = _942 + _954;
    bool _958 = _870 >= 0.0;
    bool _960 = isnan(_870);
    bool _962 = _958 || _960;
    bool _964 = isnan(0.0);
    bool _966 = _962 || _964;
    float _968 = _944 * (-2.0);
    bool _970 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _972 = isnan(0.0);
    bool _974 = _970 || _972;
    bool _976 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _978 = _974 || _976;
    float _980 = _956 * _956;
    bool _982 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _984 = isnan(1.0);
    bool _986 = _982 || _984;
    bool _988 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _990 = _986 || _988;
    float _992 = float(_940);
    float _994 = fma(_828, _828, _980);
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _998 = _932 * _124;
    int _1000 = _966 ? 0 : 1;
    float _1002 = exp2(_998);
    int _1004 = ~_1000;
    int _1006 = _1004 + 1;
    int _1008 = _1006 + 1;
    int _1010 = _1008;
    float _1012 = _942;
    if (!_946)
    {
        int _1014 = ~_1000;
        int _1016 = _1014 + 1;
        _1010 = _1016;
    }
    int _1018 = _1010;
    float _1020 = float(_1018);
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1024 = fma(_832, _832, _994);
    float _1026 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[78].w, _996);
    bool _1028 = !_786;
    int _1030 = _1028 ? 0 : 1;
    float _1032 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1022);
    float _1034 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1026);
    float _1036 = rsqrt(_1024);
    float _1038 = -_1002;
    float _1040 = _1038 + 1.0;
    int _1042 = abs(_1030);
    float _1044 = -_124;
    float _1046 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[76].x, _848);
    float _1048 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1032);
    float _1050 = _978 ? _1040 : 0.0;
    float _1052 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _854);
    float _1054 = float(_1042);
    if (_990)
    {
        float _1056 = _1050 * _906;
        _126 = _1056;
    }
    float _1058 = _126;
    float _1060 = _1054 * _992;
    float _1062 = fma(_866, _968, _866);
    float _1064 = fma(_968, _948, _948);
    float _1066 = _956 * _1036;
    float _1068 = _828 * _1036;
    float _1070 = _778 + (-0.5);
    bool _1072 = !_790;
    int _1074 = _1072 ? 0 : 1;
    float _1076 = -_1066;
    float _1078 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[18].w, _956);
    float _1080 = -_1068;
    float _1082 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[18].w, _828);
    float _1084 = _832 * _1036;
    float _1086 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1064);
    float _1088 = _1078 * _1078;
    float _1090 = _794 + _774;
    float _1092 = _1060 * (-2.0);
    float _1094 = fma(_1082, _1082, _1088);
    int _1096 = abs(_1074);
    float _1098 = -_1084;
    float _1100 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[18].w, _832);
    float _1102 = fma(_1062, _1058, _1086);
    float _1104 = _1090 + (-1.0);
    float _1106 = fma(_1100, _1100, _1094);
    float _1108 = float(_1096);
    float _1110 = _1102 * 0.15915493667125701904296875;
    float _1112 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1114 = _794 + (-0.5);
    float _1116 = fma(_1092, _950, _950);
    float _1118 = _778 + _774;
    float _1120 = _1108 * _1020;
    float _1122 = fma(_1112, _1092, _1112);
    float _1124 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1116);
    float _1126 = _1118 + (-1.0);
    float _1128 = _1120 * (-2.0);
    float _1130 = fma(_1122, _1058, _1124);
    float _1132 = sqrt(_1106);
    float _1134 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1136 = fma(_1128, _952, _952);
    float _1138 = _1130 * 0.15915493667125701904296875;
    float _1140 = in.m_59.x;
    float _1142 = in.m_59.y;
    float _1144 = in.m_59.z;
    float _1146 = _774 + (-0.5);
    float _1148 = fma(_1134, _1128, _1134);
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1152 = _772 + _1150;
    float _1154 = _1110 * 6.283185482025146484375;
    float _1156 = sin(_1154);
    float _1158 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1136);
    float _1160 = fma(_1148, _1058, _1158);
    float _1162 = _1110 * 6.283185482025146484375;
    float _1164 = cos(_1162);
    float _1166 = _1160 * 0.15915493667125701904296875;
    float _1168 = _1036 * _1132;
    float _1170 = _842 * _1168;
    float _1172 = _856 * _1168;
    float _1174 = _1138 * 6.283185482025146484375;
    float _1176 = sin(_1174);
    float _1178 = _862 * _1168;
    float _1180 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1140);
    float _1182 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1142);
    float _1184 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1144);
    float _1186 = _1138 * 6.283185482025146484375;
    float _1188 = cos(_1186);
    float _1190 = _1170 * _1182;
    float _1192 = _1172 * _1180;
    float _1194 = _1178 * _1184;
    float _1196 = _1166 * 6.283185482025146484375;
    float _1198 = sin(_1196);
    float _1200 = _1164 * _1176;
    float _1202 = _1166 * 6.283185482025146484375;
    float _1204 = cos(_1202);
    float _1206 = _1156 * _1188;
    float _1208 = -_1200;
    float _1210 = fma(_1198, _1206, _1208);
    float _1212 = -_1206;
    float _1214 = fma(_1198, _1200, _1212);
    float _1216 = _1156 * _1176;
    float _1218 = _1164 * _1188;
    float _1220 = fma(_1198, _1218, _1216);
    float _1222 = _1176 * _1204;
    float _1224 = _1204 * _1190;
    float _1226 = _1188 * _1204;
    float _1228 = fma(_1198, _1216, _1218);
    float _1230 = -_1190;
    float _1232 = _1198 * _1230;
    float _1234 = _1164 * _1224;
    float _1236 = _1156 * _1224;
    float _1238 = in.m_61.x;
    float _1240 = fma(_1226, _1192, _1232);
    float _1242 = fma(_1220, _1192, _1234);
    float _1244 = fma(_1210, _1192, _1236);
    float _1246 = in.m_53.w;
    float _1248 = fma(_1214, _1194, _1242);
    float _1250 = fma(_1228, _1194, _1244);
    float _1252 = fma(_1222, _1194, _1240);
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1256 = _1254 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1258 = _1248 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1260 = _1248 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1262 = in.m_61.y;
    float _1264 = fma(_1252, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1258);
    float _1266 = fma(_1252, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1260);
    float _1268 = 1.0 / _1256;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1272 = _1270 != 0;
    float _1274 = fma(_1250, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1264);
    float _1276 = fma(_1250, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1266);
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1280 = _1278 != 0;
    float _1282 = _1248 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1284 = _818 + _1274;
    float _1286 = _820 + _1276;
    int _1288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1290 = _1288 != 0;
    float _1292 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1296 = _1294 != 0;
    float _1298 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1300 = _1284 + _1298;
    float _1302 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1304 = _1286 + _1302;
    bool _1306 = _1246 > 0.5;
    float _1308 = fma(_1252, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1282);
    float _1310 = _1300 * _1300;
    float _1312 = _1304 * _1304;
    float _1314 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1316 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1318 = isnan(_772);
    bool _1320 = _1316 || _1318;
    bool _1322 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1324 = _1320 || _1322;
    float _1326 = float(_1324);
    float _1328 = _1310 + _1312;
    float _1330 = -_1262;
    float _1332 = _1330 + 1.0;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1334;
    bool _1338 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1340 = isnan(_772);
    bool _1342 = _1338 || _1340;
    bool _1344 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1346 = _1342 || _1344;
    float _1348 = float(_1346);
    float _1350 = fma(_1250, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1308);
    int _1352 = as_type<int>(_1252);
    bool _1354 = _1306;
    float _1356 = _1262;
    float _1358 = _1350;
    if (_1272)
    {
        float _1360 = -_1238;
        float _1362 = _1360 + 1.0;
        _1352 = as_type<int>(_1362);
    }
    int _1364 = _1352;
    float _1366 = sqrt(_1328);
    float _1368 = _1336 * _1268;
    int _1370 = _1306 ? as_type<int>(_1332) : as_type<int>(_1262);
    float _1372 = _942 + _1350;
    float _1374 = as_type<float>(_1364);
    if (_1280)
    {
        bool _1376 = _774 > 0.5;
        _1354 = _1376;
    }
    bool _1378 = _1354;
    float _1380 = -_1326;
    float _1382 = _1380 + 1.0;
    float _1384 = fma(_1368, _1152, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (_1272)
    {
        bool _1386 = _778 > 0.5;
        _910 = _1386;
    }
    bool _1388 = _910;
    float _1390 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1392 = _1348 * _1382;
    float _1394 = _1290 ? as_type<float>(_1370) : _1262;
    float _1396 = _1292 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1398 = _1392;
    if (_1296)
    {
        float _1400 = _864 ? _1332 : _1262;
        _1356 = _1400;
    }
    float _1402 = _1356;
    float _1404 = _1384 * _1392;
    float _1406 = -_1348;
    float _1408 = _1406 + 1.0;
    int _1410 = as_type<int>(_1402);
    float _1412 = _1408;
    if (!_1272)
    {
        _912 = _1238;
    }
    float _1414 = _912;
    float _1416 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1418 = _1366 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1420 = fma(_1396, _1402, -0.5);
    float _1422 = _1414;
    if (_1280)
    {
        float _1424 = -_1238;
        float _1426 = _1424 + 1.0;
        _1410 = as_type<int>(_1426);
    }
    int _1428 = _1410;
    float _1430 = as_type<float>(_1428);
    if (!_1280)
    {
        _1398 = _1238;
    }
    float _1432 = _1398;
    float _1434 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1404);
    float _1436 = _1432;
    if (_1272)
    {
        float _1438 = _1388 ? as_type<float>(_1364) : _1238;
        _1422 = _1438;
    }
    float _1440 = _1422;
    if (_1280)
    {
        float _1442 = _1378 ? as_type<float>(_1428) : _1238;
        _1436 = _1442;
    }
    float _1444 = _1436;
    if (!_1418)
    {
        _1430 = _1312;
    }
    float _1446 = _1430;
    float _1448 = _1446;
    if (!_1418)
    {
        _1374 = _1310;
    }
    float _1450 = _1374;
    float _1452 = _1450;
    if (!_1418)
    {
        _1358 = _1284;
    }
    float _1454 = _1358;
    float _1456 = _1454;
    if (!_1418)
    {
        _1012 = _1286;
    }
    float _1458 = _1012;
    float _1460 = _1458;
    if (!_1418)
    {
        _1412 = _1372;
    }
    float _1462 = _1412;
    bool _1464 = !_1418;
    float _1466 = _1462;
    if (!_1464)
    {
        float _1468 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1470 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1472 = _1366 + _1470;
        float _1474 = rsqrt(_1328);
        float _1476 = _1472 * _1468;
        float _1478 = _1372 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1480 = _1476 * 0.15915493667125701904296875;
        float _1482 = _1480 * 6.283185482025146484375;
        float _1484 = sin(_1482);
        float _1486 = _1480 * 6.283185482025146484375;
        float _1488 = cos(_1486);
        float _1490 = fma(_1484, _1478, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1492 = _1474 * _1490;
        float _1494 = fma(_1300, _1492, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1496 = _1488 + (-1.0);
        float _1498 = fma(_1304, _1492, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1500 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1502 = _1494 + _1500;
        float _1504 = _1496 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1506 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1508 = _1498 + _1506;
        float _1510 = _1502 * _1502;
        float _1512 = fma(_1372, _1488, _1504);
        float _1514 = _1508 * _1508;
        _1466 = _1512;
        _1452 = _1510;
        _1448 = _1514;
        _1456 = _1494;
        _1460 = _1498;
    }
    float _1516 = _1466;
    float _1518 = _1452;
    float _1520 = _1448;
    float _1522 = _1456;
    float _1524 = _1460;
    float _1526 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1528 = _1516 + _1526;
    float _1530 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1532 = -_1052;
    float _1534 = fma(_1034, _1420, _1532);
    float _1536 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1434);
    float _1538 = fma(_1528, _1528, _1518);
    float _1540 = fma(_1530, _1440, -0.5);
    float _1542 = _1394 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1544 = _1444 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1546 = _1538 + _1520;
    float _1548 = fma(_1048, _1540, _1046);
    float _1550 = _738 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1552 = _740 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1554 = _742 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1556 = _1542 * _1416;
    float _1558 = sqrt(_1546);
    float _1560 = _1544 * _1390;
    float _1562 = _1550 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1564 = _1552 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1566 = _1554 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1568 = _1534 + 0.5;
    float _1570 = _1536 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1572 = _1548 + 0.5;
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    out.m_65.x = _1562;
    out.m_65.y = _1564;
    out.m_65.z = _1566;
    out.m_65.w = _1570;
    bool _1574 = _1558 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1576 = isnan(_1558);
    bool _1578 = _1574 || _1576;
    bool _1580 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1582 = _1578 || _1580;
    out.m_67.x = _1572;
    out.m_67.y = _1568;
    out.m_67.z = _1560;
    out.m_67.w = _1556;
    float _1584 = _1548;
    float _1586 = _1554;
    float _1588 = _1556;
    if (!_1582)
    {
        _1584 = 1.0;
    }
    float _1590 = _1584;
    bool _1592 = !_1582;
    float _1594 = _1590;
    if (!_1592)
    {
        bool _1596 = _1558 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1598 = isnan(_1558);
        bool _1600 = _1596 || _1598;
        bool _1602 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1604 = _1600 || _1602;
        if (!_1604)
        {
            float _1606 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1608 = _1558 + _1606;
            float _1610 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1612 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1610;
            float _1614 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1616 = _1614 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1618 = 1.0 / _1612;
            float _1620 = _1608 * _1618;
            float _1622 = fma(_1620, _1616, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1594 = _1622;
            _1624 = true;
        }
        else
        {
            bool _1626 = _1558 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1628 = isnan(_1558);
            bool _1630 = _1626 || _1628;
            bool _1632 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1634 = _1630 || _1632;
            if (!_1634)
            {
                float _1636 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1638 = _1558 + _1636;
                float _1640 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1642 = _1640 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1644 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1646 = _1644 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1648 = 1.0 / _1642;
                float _1650 = _1638 * _1648;
                float _1652 = fma(_1650, _1646, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1594 = _1652;
                _1624 = true;
            }
            else
            {
                _1594 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1624 = false;
    float _1654 = _1594;
    float _1656 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1658 = _1516 + _1656;
    float _1660 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1662 = _1522 + _1660;
    float _1664 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1666 = _1524 + _1664;
    float _1668 = fma(_1658, _1654, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1670 = fma(_1662, _1654, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1672 = fma(_1666, _1654, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1674 = -_1066;
    float _1676 = fma(_1674, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1668);
    float _1678 = -_1068;
    float _1680 = fma(_1678, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1670);
    float _1682 = -_1084;
    float _1684 = fma(_1682, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1672);
    float _1686 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1688 = _1676 + _1686;
    float _1690 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1692 = _1680 + _1690;
    float _1694 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1696 = _1684 + _1694;
    float _1698 = _1688 * _1688;
    float _1700 = fma(_1692, _1692, _1698);
    float _1702 = fma(_1696, _1696, _1700);
    float _1704 = rsqrt(_1702);
    float _1706 = _1704 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1708 = _1692 * _1706;
    float _1710 = _1696 * _1706;
    float _1712 = _1708 * _1708;
    float _1714 = _1710 * _1710;
    float _1716 = _1712 + _1714;
    float _1718 = sqrt(_1716);
    bool _1720 = _1718 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1722 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1724 = _1718 + _1722;
    float _1726 = _1696;
    float _1728 = _1716;
    float _1730 = _1724;
    float _1732 = _1688;
    float _1734 = _1708;
    if (_1720)
    {
        float _1736 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1726 = _1736;
    }
    float _1738 = _1726;
    if (_1720)
    {
        float _1740 = rsqrt(_1716);
        _1728 = _1740;
    }
    float _1742 = _1728;
    if (_1720)
    {
        float _1744 = _1724 * _1738;
        _1730 = _1744;
    }
    float _1746 = _1730;
    if (_1720)
    {
        float _1748 = _1746 * 0.15915493667125701904296875;
        _1586 = _1748;
    }
    float _1750 = _1586;
    float _1752 = _1704;
    float _1754 = _1750;
    if (_1720)
    {
        float _1756 = _1750 * 6.283185482025146484375;
        float _1758 = sin(_1756);
        _1752 = _1758;
    }
    float _1760 = _1752;
    float _1762 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1764 = precise::max(0.0, _1762);
    float _1766 = _1544;
    float _1768 = _1764;
    float _1770 = _1762;
    if (_1720)
    {
        float _1772 = _1750 * 6.283185482025146484375;
        float _1774 = cos(_1772);
        _1766 = _1774;
    }
    float _1776 = _1766;
    float _1778 = -_1706;
    float _1780 = -_1764;
    float _1782 = fma(_1688, _1778, _1780);
    if (!_1720)
    {
        _1732 = _1710;
    }
    float _1784 = _1732;
    float _1786 = _1784;
    if (_1720)
    {
        float _1788 = _1782 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1768 = _1788;
    }
    float _1790 = _1768;
    float _1792 = _1790;
    float _1794 = _1760;
    if (_1720)
    {
        float _1796 = fma(_1760, _1790, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1792 = _1796;
    }
    float _1798 = _1792;
    float _1800 = _1798;
    if (!_1720)
    {
        _1794 = _1782;
    }
    float _1802 = _1794;
    float _1804 = _1802;
    if (_1720)
    {
        float _1806 = _1776 + (-1.0);
        _1770 = _1806;
    }
    float _1808 = _1770;
    float _1810 = _1808;
    if (_1720)
    {
        float _1812 = _1742 * _1798;
        _1588 = _1812;
    }
    float _1814 = _1588;
    if (!_1720)
    {
        _1800 = _1712;
    }
    float _1816 = _1800;
    float _1818 = sqrt(_1702);
    float _1820 = _1816;
    if (_1720)
    {
        float _1822 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1754 = _1822;
    }
    float _1824 = _1754;
    if (_1720)
    {
        float _1826 = _1708 * _1814;
        _1734 = _1826;
    }
    float _1828 = _1734;
    if (_1720)
    {
        float _1830 = _1710 * _1814;
        _1786 = _1830;
    }
    float _1832 = _1786;
    if (!_1720)
    {
        _1810 = _1714;
    }
    float _1834 = _1810;
    float _1836 = _1834;
    if (_1720)
    {
        float _1838 = fma(_1782, _1776, _1824);
        _1804 = _1838;
    }
    float _1840 = _1804;
    if (_1720)
    {
        float _1842 = _1828 * _1828;
        _1820 = _1842;
    }
    float _1844 = _1820;
    if (_1720)
    {
        float _1846 = _1832 * _1832;
        _1836 = _1846;
    }
    float _1848 = _1836;
    float _1850 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1852 = fma(_1840, _1840, _1844);
    float _1854 = _1852 + _1848;
    float _1856 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1858 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1860 = fma(_1818, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1858);
    float _1862 = precise::clamp(_1860, 0.0, 1.0);
    float _1864 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1850);
    float _1866 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1868 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1856);
    float _1870 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1872 = rsqrt(_1854);
    float _1874 = -_1862;
    float _1876 = _1874 + 1.0;
    float _1878 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1880 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1870);
    float _1882 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1868);
    float _1884 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1864);
    float _1886 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1878);
    float _1888 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1880);
    float _1890 = _1882 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1892 = _1884 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1894 = abs(_1876);
    float _1896 = log2(_1894);
    float _1898 = _1888 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1900 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1886);
    float _1902 = _1890 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1904 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1906 = _1900 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1908 = _1872 * _1828;
    float _1910 = _1872 * _1832;
    float _1912 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1904);
    float _1914 = _1872 * _1840;
    float _1916 = _1908 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1918 = -_1902;
    float _1920 = fma(_1918, _1866, 1.0);
    float _1922 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1912);
    float _1924 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1926 = -_1916;
    float _1928 = fma(_1914, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1926);
    float _1930 = _1896 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1932 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1922);
    float _1934 = log2(_1920);
    float _1936 = -_1910;
    float _1938 = fma(_1936, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1928);
    float _1940 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1942 = fma(_1938, -0.5, 0.5);
    float _1944 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1940);
    float _1946 = fma(_1938, 0.5, 0.5);
    float _1948 = exp2(_1930);
    float _1950 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1924);
    float _1952 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1944);
    float _1954 = _1914 + 1.0;
    float _1956 = fma(_1946, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1958 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1950);
    float _1960 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1952);
    float _1962 = 1.0 / _1932;
    float _1964 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1958);
    float _1966 = _1934 * 0.693147182464599609375;
    float _1968 = fma(_1946, _1956, -0.212114393711090087890625);
    float _1970 = fma(_1946, _1968, 1.570728778839111328125);
    float _1972 = sqrt(_1942);
    float _1974 = -_1914;
    float _1976 = fma(_1948, _1954, _1974);
    float _1978 = _1966 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1980 = fma(_1976, 0.5, 0.5);
    float _1982 = _1960 * _1962;
    float _1984 = _1964 * _1962;
    float _1986 = fma(_1982, 0.5, 0.5);
    float _1988 = fma(_1984, -0.5, 0.5);
    float _1990 = _1972 * 0.636619746685028076171875;
    float3 _5172 = float3(_1986, _1988, _1978);
    float _1992 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5172, float3(0.0), isnan(_5172)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5172, float3(0.0), isnan(_5172)), level(0.0)).x;
    float3 _5183 = float3(_1986, _1988, _1978);
    float4 _1995 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5183, float3(0.0), isnan(_5183)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5183, float3(0.0), isnan(_5183)), level(0.0)).xyzw;
    float _1997 = _1995.x;
    float _1999 = _1995.y;
    float _2001 = _1995.z;
    float _2003 = _1995.w;
    float _2005 = -_1970;
    float _2007 = fma(_1990, _2005, 1.0);
    float2 _5205 = float2(_2007, _1980);
    float3 _2011 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5205, float2(0.0), isnan(_5205)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5205, float2(0.0), isnan(_5205)), level(0.0)).xyz;
    float _2013 = _2011.x;
    float _2015 = _2011.y;
    float _2017 = _2011.z;
    float _2019 = _1896 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2021 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2023 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2021);
    float _2025 = exp2(_2019);
    float _2027 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2023);
    float _2029 = _1960 + _1932;
    float _2031 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2027);
    float _2033 = _2029 * 0.5;
    float _2035 = _1932 * 0.5;
    float _2037 = _2031 + _1932;
    out.gl_Position.x = _1960;
    out.gl_Position.y = _1964;
    out.gl_Position.z = _2031;
    out.gl_Position.w = _1932;
    float _2039 = fma(_1964, -0.5, _2035);
    float _2041 = _2037 * 0.5;
    float _2043 = -_2025;
    float _2045 = _2043 + 1.0;
    float _2047 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.x = _2033;
    out.m_69.y = _2039;
    out.m_69.z = _2041;
    out.m_69.w = _1932;
    float _2049 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_47.x = _2049;
    float _2051 = _2047 * _1992;
    float _2053 = -_2047;
    float _2055 = _2053 + 1.0;
    float _2057 = _2003 * _2051;
    float _2059 = _2017 * _2051;
    float _2061 = fma(_2013, _2057, _1997);
    float _2063 = fma(_2015, _2057, _1999);
    float _2065 = _2003 * _2055;
    float _2067 = fma(_2003, _2059, _2001);
    out.m_71.x = _2061;
    out.m_71.y = _2063;
    out.m_71.z = _2067;
    out.m_71.w = _2065;
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
    bool _1624 = false;
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
        float _2124 = as_type<float>(_106);
        out.gl_Position.z = _2124;
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
        float _2194 = as_type<float>(_144);
        out.gl_Position.z = _2194;
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
    float _596 = fma(_588, _542, _590);
    float _598 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[109].x, _592);
    float _600 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[109].y, _594);
    float _602 = in.m_51.x;
    float _604 = in.m_51.y;
    float _606 = in.m_51.z;
    float _608 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[109].z, _596);
    float _610 = _598 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _612 = _600 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _616 = _608 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _618 = _610 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _620 = _612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _622 = _616 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _618;
    out.m_55.y = _620;
    out.m_55.z = _622;
    out.m_55.w = _614;
    float _624 = _434 * _606;
    float _626 = _432 * _604;
    float _628 = _430 * _602;
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
    float _776 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _778 = in.m_53.x;
    int _780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _782 = _780 != 0;
    int _784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _786 = _784 != 0;
    int _788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _790 = _788 != 0;
    float _792 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _794 = in.m_53.y;
    float _796 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _798 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _776);
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _802 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _792);
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _806 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _796);
    float _808 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _798);
    float _810 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _802);
    float _812 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _806);
    bool _814 = !_782;
    int _816 = _814 ? 0 : 1;
    float _818 = _810 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _820 = _812 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _822 = abs(_816);
    float _824 = _774 * 2.0;
    float _826 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _828 = _818 + _826;
    float _830 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _832 = _820 + _830;
    float _834 = float(_822);
    float _836 = _778 * 2.0;
    float _838 = _778 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _840 = floor(_824);
    float _842 = _626 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _844 = _794 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _846 = -_804;
    float _848 = fma(_838, 2.0, _846);
    float _850 = _794 * 2.0;
    float _852 = _778 + _794;
    float _854 = fma(_844, -2.0, _800);
    float _856 = _628 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _858 = floor(_836);
    float _860 = _852 + (-1.0);
    float _862 = _624 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _864 = _794 > 0.5;
    float _866 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _868 = _840 > 0.0;
    float _870 = floor(_850);
    bool _872 = _840 >= 0.0;
    bool _874 = isnan(_840);
    bool _876 = _872 || _874;
    bool _878 = isnan(0.0);
    bool _880 = _876 || _878;
    int _882 = _880 ? 0 : 1;
    bool _884 = _858 > 0.0;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _888 = 1.0 + _886;
    bool _890 = _858 >= 0.0;
    bool _892 = isnan(_858);
    bool _894 = _890 || _892;
    bool _896 = isnan(0.0);
    bool _898 = _894 || _896;
    int _900 = ~_882;
    int _902 = _900 + 1;
    int _904 = _902 + 1;
    float _906 = 1.0 / _888;
    int _908 = _904;
    bool _910 = _786;
    float _912 = _778;
    if (!_868)
    {
        int _914 = ~_882;
        int _916 = _914 + 1;
        _908 = _916;
    }
    int _918 = _908;
    int _920 = _898 ? 0 : 1;
    float _922 = float(_918);
    int _924 = ~_920;
    int _926 = _924 + 1;
    int _928 = _926 + 1;
    float _930 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _932 = log2(_930);
    int _934 = _928;
    if (!_884)
    {
        int _936 = ~_920;
        int _938 = _936 + 1;
        _934 = _938;
    }
    int _940 = _934;
    float _942 = _808 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _944 = _834 * _922;
    bool _946 = _870 > 0.0;
    float _948 = in.m_57.x;
    float _950 = in.m_57.y;
    float _952 = in.m_57.z;
    float _954 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _956 = _942 + _954;
    bool _958 = _870 >= 0.0;
    bool _960 = isnan(_870);
    bool _962 = _958 || _960;
    bool _964 = isnan(0.0);
    bool _966 = _962 || _964;
    float _968 = _944 * (-2.0);
    bool _970 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _972 = isnan(0.0);
    bool _974 = _970 || _972;
    bool _976 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _978 = _974 || _976;
    float _980 = _956 * _956;
    bool _982 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _984 = isnan(1.0);
    bool _986 = _982 || _984;
    bool _988 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _990 = _986 || _988;
    float _992 = float(_940);
    float _994 = fma(_828, _828, _980);
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _998 = _932 * _124;
    int _1000 = _966 ? 0 : 1;
    float _1002 = exp2(_998);
    int _1004 = ~_1000;
    int _1006 = _1004 + 1;
    int _1008 = _1006 + 1;
    int _1010 = _1008;
    float _1012 = _942;
    if (!_946)
    {
        int _1014 = ~_1000;
        int _1016 = _1014 + 1;
        _1010 = _1016;
    }
    int _1018 = _1010;
    float _1020 = float(_1018);
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1024 = fma(_832, _832, _994);
    float _1026 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[78].w, _996);
    bool _1028 = !_786;
    int _1030 = _1028 ? 0 : 1;
    float _1032 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1022);
    float _1034 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1026);
    float _1036 = rsqrt(_1024);
    float _1038 = -_1002;
    float _1040 = _1038 + 1.0;
    int _1042 = abs(_1030);
    float _1044 = -_124;
    float _1046 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[76].x, _848);
    float _1048 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1032);
    float _1050 = _978 ? _1040 : 0.0;
    float _1052 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _854);
    float _1054 = float(_1042);
    if (_990)
    {
        float _1056 = _1050 * _906;
        _126 = _1056;
    }
    float _1058 = _126;
    float _1060 = _1054 * _992;
    float _1062 = fma(_866, _968, _866);
    float _1064 = fma(_968, _948, _948);
    float _1066 = _956 * _1036;
    float _1068 = _828 * _1036;
    float _1070 = _778 + (-0.5);
    bool _1072 = !_790;
    int _1074 = _1072 ? 0 : 1;
    float _1076 = -_1066;
    float _1078 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[18].w, _956);
    float _1080 = -_1068;
    float _1082 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[18].w, _828);
    float _1084 = _832 * _1036;
    float _1086 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1064);
    float _1088 = _1078 * _1078;
    float _1090 = _794 + _774;
    float _1092 = _1060 * (-2.0);
    float _1094 = fma(_1082, _1082, _1088);
    int _1096 = abs(_1074);
    float _1098 = -_1084;
    float _1100 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[18].w, _832);
    float _1102 = fma(_1062, _1058, _1086);
    float _1104 = _1090 + (-1.0);
    float _1106 = fma(_1100, _1100, _1094);
    float _1108 = float(_1096);
    float _1110 = _1102 * 0.15915493667125701904296875;
    float _1112 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1114 = _794 + (-0.5);
    float _1116 = fma(_1092, _950, _950);
    float _1118 = _778 + _774;
    float _1120 = _1108 * _1020;
    float _1122 = fma(_1112, _1092, _1112);
    float _1124 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1116);
    float _1126 = _1118 + (-1.0);
    float _1128 = _1120 * (-2.0);
    float _1130 = fma(_1122, _1058, _1124);
    float _1132 = sqrt(_1106);
    float _1134 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1136 = fma(_1128, _952, _952);
    float _1138 = _1130 * 0.15915493667125701904296875;
    float _1140 = in.m_59.x;
    float _1142 = in.m_59.y;
    float _1144 = in.m_59.z;
    float _1146 = _774 + (-0.5);
    float _1148 = fma(_1134, _1128, _1134);
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1152 = _772 + _1150;
    float _1154 = _1110 * 6.283185482025146484375;
    float _1156 = sin(_1154);
    float _1158 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1136);
    float _1160 = fma(_1148, _1058, _1158);
    float _1162 = _1110 * 6.283185482025146484375;
    float _1164 = cos(_1162);
    float _1166 = _1160 * 0.15915493667125701904296875;
    float _1168 = _1036 * _1132;
    float _1170 = _842 * _1168;
    float _1172 = _856 * _1168;
    float _1174 = _1138 * 6.283185482025146484375;
    float _1176 = sin(_1174);
    float _1178 = _862 * _1168;
    float _1180 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1140);
    float _1182 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1142);
    float _1184 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1144);
    float _1186 = _1138 * 6.283185482025146484375;
    float _1188 = cos(_1186);
    float _1190 = _1170 * _1182;
    float _1192 = _1172 * _1180;
    float _1194 = _1178 * _1184;
    float _1196 = _1166 * 6.283185482025146484375;
    float _1198 = sin(_1196);
    float _1200 = _1164 * _1176;
    float _1202 = _1166 * 6.283185482025146484375;
    float _1204 = cos(_1202);
    float _1206 = _1156 * _1188;
    float _1208 = -_1200;
    float _1210 = fma(_1198, _1206, _1208);
    float _1212 = -_1206;
    float _1214 = fma(_1198, _1200, _1212);
    float _1216 = _1156 * _1176;
    float _1218 = _1164 * _1188;
    float _1220 = fma(_1198, _1218, _1216);
    float _1222 = _1176 * _1204;
    float _1224 = _1204 * _1190;
    float _1226 = _1188 * _1204;
    float _1228 = fma(_1198, _1216, _1218);
    float _1230 = -_1190;
    float _1232 = _1198 * _1230;
    float _1234 = _1164 * _1224;
    float _1236 = _1156 * _1224;
    float _1238 = in.m_61.x;
    float _1240 = fma(_1226, _1192, _1232);
    float _1242 = fma(_1220, _1192, _1234);
    float _1244 = fma(_1210, _1192, _1236);
    float _1246 = in.m_53.w;
    float _1248 = fma(_1214, _1194, _1242);
    float _1250 = fma(_1228, _1194, _1244);
    float _1252 = fma(_1222, _1194, _1240);
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1256 = _1254 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1258 = _1248 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1260 = _1248 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1262 = in.m_61.y;
    float _1264 = fma(_1252, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1258);
    float _1266 = fma(_1252, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1260);
    float _1268 = 1.0 / _1256;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1272 = _1270 != 0;
    float _1274 = fma(_1250, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1264);
    float _1276 = fma(_1250, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1266);
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1280 = _1278 != 0;
    float _1282 = _1248 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1284 = _818 + _1274;
    float _1286 = _820 + _1276;
    int _1288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1290 = _1288 != 0;
    float _1292 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1296 = _1294 != 0;
    float _1298 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1300 = _1284 + _1298;
    float _1302 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1304 = _1286 + _1302;
    bool _1306 = _1246 > 0.5;
    float _1308 = fma(_1252, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1282);
    float _1310 = _1300 * _1300;
    float _1312 = _1304 * _1304;
    float _1314 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1316 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1318 = isnan(_772);
    bool _1320 = _1316 || _1318;
    bool _1322 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1324 = _1320 || _1322;
    float _1326 = float(_1324);
    float _1328 = _1310 + _1312;
    float _1330 = -_1262;
    float _1332 = _1330 + 1.0;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1334;
    bool _1338 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1340 = isnan(_772);
    bool _1342 = _1338 || _1340;
    bool _1344 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1346 = _1342 || _1344;
    float _1348 = float(_1346);
    float _1350 = fma(_1250, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1308);
    int _1352 = as_type<int>(_1252);
    bool _1354 = _1306;
    float _1356 = _1262;
    float _1358 = _1350;
    if (_1272)
    {
        float _1360 = -_1238;
        float _1362 = _1360 + 1.0;
        _1352 = as_type<int>(_1362);
    }
    int _1364 = _1352;
    float _1366 = sqrt(_1328);
    float _1368 = _1336 * _1268;
    int _1370 = _1306 ? as_type<int>(_1332) : as_type<int>(_1262);
    float _1372 = _942 + _1350;
    float _1374 = as_type<float>(_1364);
    if (_1280)
    {
        bool _1376 = _774 > 0.5;
        _1354 = _1376;
    }
    bool _1378 = _1354;
    float _1380 = -_1326;
    float _1382 = _1380 + 1.0;
    float _1384 = fma(_1368, _1152, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (_1272)
    {
        bool _1386 = _778 > 0.5;
        _910 = _1386;
    }
    bool _1388 = _910;
    float _1390 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1392 = _1348 * _1382;
    float _1394 = _1290 ? as_type<float>(_1370) : _1262;
    float _1396 = _1292 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1398 = _1392;
    if (_1296)
    {
        float _1400 = _864 ? _1332 : _1262;
        _1356 = _1400;
    }
    float _1402 = _1356;
    float _1404 = _1384 * _1392;
    float _1406 = -_1348;
    float _1408 = _1406 + 1.0;
    int _1410 = as_type<int>(_1402);
    float _1412 = _1408;
    if (!_1272)
    {
        _912 = _1238;
    }
    float _1414 = _912;
    float _1416 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1418 = _1366 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1420 = fma(_1396, _1402, -0.5);
    float _1422 = _1414;
    if (_1280)
    {
        float _1424 = -_1238;
        float _1426 = _1424 + 1.0;
        _1410 = as_type<int>(_1426);
    }
    int _1428 = _1410;
    float _1430 = as_type<float>(_1428);
    if (!_1280)
    {
        _1398 = _1238;
    }
    float _1432 = _1398;
    float _1434 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1404);
    float _1436 = _1432;
    if (_1272)
    {
        float _1438 = _1388 ? as_type<float>(_1364) : _1238;
        _1422 = _1438;
    }
    float _1440 = _1422;
    if (_1280)
    {
        float _1442 = _1378 ? as_type<float>(_1428) : _1238;
        _1436 = _1442;
    }
    float _1444 = _1436;
    if (!_1418)
    {
        _1430 = _1312;
    }
    float _1446 = _1430;
    float _1448 = _1446;
    if (!_1418)
    {
        _1374 = _1310;
    }
    float _1450 = _1374;
    float _1452 = _1450;
    if (!_1418)
    {
        _1358 = _1284;
    }
    float _1454 = _1358;
    float _1456 = _1454;
    if (!_1418)
    {
        _1012 = _1286;
    }
    float _1458 = _1012;
    float _1460 = _1458;
    if (!_1418)
    {
        _1412 = _1372;
    }
    float _1462 = _1412;
    bool _1464 = !_1418;
    float _1466 = _1462;
    if (!_1464)
    {
        float _1468 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1470 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1472 = _1366 + _1470;
        float _1474 = rsqrt(_1328);
        float _1476 = _1472 * _1468;
        float _1478 = _1372 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1480 = _1476 * 0.15915493667125701904296875;
        float _1482 = _1480 * 6.283185482025146484375;
        float _1484 = sin(_1482);
        float _1486 = _1480 * 6.283185482025146484375;
        float _1488 = cos(_1486);
        float _1490 = fma(_1484, _1478, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1492 = _1474 * _1490;
        float _1494 = fma(_1300, _1492, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1496 = _1488 + (-1.0);
        float _1498 = fma(_1304, _1492, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1500 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1502 = _1494 + _1500;
        float _1504 = _1496 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1506 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1508 = _1498 + _1506;
        float _1510 = _1502 * _1502;
        float _1512 = fma(_1372, _1488, _1504);
        float _1514 = _1508 * _1508;
        _1466 = _1512;
        _1452 = _1510;
        _1448 = _1514;
        _1456 = _1494;
        _1460 = _1498;
    }
    float _1516 = _1466;
    float _1518 = _1452;
    float _1520 = _1448;
    float _1522 = _1456;
    float _1524 = _1460;
    float _1526 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1528 = _1516 + _1526;
    float _1530 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1532 = -_1052;
    float _1534 = fma(_1034, _1420, _1532);
    float _1536 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1434);
    float _1538 = fma(_1528, _1528, _1518);
    float _1540 = fma(_1530, _1440, -0.5);
    float _1542 = _1394 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1544 = _1444 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1546 = _1538 + _1520;
    float _1548 = fma(_1048, _1540, _1046);
    float _1550 = _738 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1552 = _740 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1554 = _742 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1556 = _1542 * _1416;
    float _1558 = sqrt(_1546);
    float _1560 = _1544 * _1390;
    float _1562 = _1550 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1564 = _1552 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1566 = _1554 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1568 = _1534 + 0.5;
    float _1570 = _1536 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1572 = _1548 + 0.5;
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    out.m_65.x = _1562;
    out.m_65.y = _1564;
    out.m_65.z = _1566;
    out.m_65.w = _1570;
    bool _1574 = _1558 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1576 = isnan(_1558);
    bool _1578 = _1574 || _1576;
    bool _1580 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1582 = _1578 || _1580;
    out.m_67.x = _1572;
    out.m_67.y = _1568;
    out.m_67.z = _1560;
    out.m_67.w = _1556;
    float _1584 = _1548;
    float _1586 = _1554;
    float _1588 = _1556;
    if (!_1582)
    {
        _1584 = 1.0;
    }
    float _1590 = _1584;
    bool _1592 = !_1582;
    float _1594 = _1590;
    if (!_1592)
    {
        bool _1596 = _1558 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1598 = isnan(_1558);
        bool _1600 = _1596 || _1598;
        bool _1602 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1604 = _1600 || _1602;
        if (!_1604)
        {
            float _1606 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1608 = _1558 + _1606;
            float _1610 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1612 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1610;
            float _1614 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1616 = _1614 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1618 = 1.0 / _1612;
            float _1620 = _1608 * _1618;
            float _1622 = fma(_1620, _1616, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1594 = _1622;
            _1624 = true;
        }
        else
        {
            bool _1626 = _1558 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1628 = isnan(_1558);
            bool _1630 = _1626 || _1628;
            bool _1632 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1634 = _1630 || _1632;
            if (!_1634)
            {
                float _1636 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1638 = _1558 + _1636;
                float _1640 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1642 = _1640 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1644 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1646 = _1644 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1648 = 1.0 / _1642;
                float _1650 = _1638 * _1648;
                float _1652 = fma(_1650, _1646, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1594 = _1652;
                _1624 = true;
            }
            else
            {
                _1594 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1624 = false;
    float _1654 = _1594;
    float _1656 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1658 = _1516 + _1656;
    float _1660 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1662 = _1522 + _1660;
    float _1664 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1666 = _1524 + _1664;
    float _1668 = fma(_1658, _1654, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1670 = fma(_1662, _1654, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1672 = fma(_1666, _1654, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1674 = -_1066;
    float _1676 = fma(_1674, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1668);
    float _1678 = -_1068;
    float _1680 = fma(_1678, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1670);
    float _1682 = -_1084;
    float _1684 = fma(_1682, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1672);
    float _1686 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1688 = _1676 + _1686;
    float _1690 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1692 = _1680 + _1690;
    float _1694 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1696 = _1684 + _1694;
    float _1698 = _1688 * _1688;
    float _1700 = fma(_1692, _1692, _1698);
    float _1702 = fma(_1696, _1696, _1700);
    float _1704 = rsqrt(_1702);
    float _1706 = _1704 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1708 = _1692 * _1706;
    float _1710 = _1696 * _1706;
    float _1712 = _1708 * _1708;
    float _1714 = _1710 * _1710;
    float _1716 = _1712 + _1714;
    float _1718 = sqrt(_1716);
    bool _1720 = _1718 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1722 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1724 = _1718 + _1722;
    float _1726 = _1696;
    float _1728 = _1716;
    float _1730 = _1724;
    float _1732 = _1688;
    float _1734 = _1708;
    if (_1720)
    {
        float _1736 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1726 = _1736;
    }
    float _1738 = _1726;
    if (_1720)
    {
        float _1740 = rsqrt(_1716);
        _1728 = _1740;
    }
    float _1742 = _1728;
    if (_1720)
    {
        float _1744 = _1724 * _1738;
        _1730 = _1744;
    }
    float _1746 = _1730;
    if (_1720)
    {
        float _1748 = _1746 * 0.15915493667125701904296875;
        _1586 = _1748;
    }
    float _1750 = _1586;
    float _1752 = _1704;
    float _1754 = _1750;
    if (_1720)
    {
        float _1756 = _1750 * 6.283185482025146484375;
        float _1758 = sin(_1756);
        _1752 = _1758;
    }
    float _1760 = _1752;
    float _1762 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1764 = precise::max(0.0, _1762);
    float _1766 = _1544;
    float _1768 = _1764;
    float _1770 = _1762;
    if (_1720)
    {
        float _1772 = _1750 * 6.283185482025146484375;
        float _1774 = cos(_1772);
        _1766 = _1774;
    }
    float _1776 = _1766;
    float _1778 = -_1706;
    float _1780 = -_1764;
    float _1782 = fma(_1688, _1778, _1780);
    if (!_1720)
    {
        _1732 = _1710;
    }
    float _1784 = _1732;
    float _1786 = _1784;
    if (_1720)
    {
        float _1788 = _1782 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1768 = _1788;
    }
    float _1790 = _1768;
    float _1792 = _1790;
    float _1794 = _1760;
    if (_1720)
    {
        float _1796 = fma(_1760, _1790, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1792 = _1796;
    }
    float _1798 = _1792;
    float _1800 = _1798;
    if (!_1720)
    {
        _1794 = _1782;
    }
    float _1802 = _1794;
    float _1804 = _1802;
    if (_1720)
    {
        float _1806 = _1776 + (-1.0);
        _1770 = _1806;
    }
    float _1808 = _1770;
    float _1810 = _1808;
    if (_1720)
    {
        float _1812 = _1742 * _1798;
        _1588 = _1812;
    }
    float _1814 = _1588;
    if (!_1720)
    {
        _1800 = _1712;
    }
    float _1816 = _1800;
    float _1818 = sqrt(_1702);
    float _1820 = _1816;
    if (_1720)
    {
        float _1822 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1754 = _1822;
    }
    float _1824 = _1754;
    if (_1720)
    {
        float _1826 = _1708 * _1814;
        _1734 = _1826;
    }
    float _1828 = _1734;
    if (_1720)
    {
        float _1830 = _1710 * _1814;
        _1786 = _1830;
    }
    float _1832 = _1786;
    if (!_1720)
    {
        _1810 = _1714;
    }
    float _1834 = _1810;
    float _1836 = _1834;
    if (_1720)
    {
        float _1838 = fma(_1782, _1776, _1824);
        _1804 = _1838;
    }
    float _1840 = _1804;
    if (_1720)
    {
        float _1842 = _1828 * _1828;
        _1820 = _1842;
    }
    float _1844 = _1820;
    if (_1720)
    {
        float _1846 = _1832 * _1832;
        _1836 = _1846;
    }
    float _1848 = _1836;
    float _1850 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1852 = fma(_1840, _1840, _1844);
    float _1854 = _1852 + _1848;
    float _1856 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1858 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1860 = fma(_1818, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1858);
    float _1862 = precise::clamp(_1860, 0.0, 1.0);
    float _1864 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1850);
    float _1866 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1868 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1856);
    float _1870 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1872 = rsqrt(_1854);
    float _1874 = -_1862;
    float _1876 = _1874 + 1.0;
    float _1878 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1880 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1870);
    float _1882 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1868);
    float _1884 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1864);
    float _1886 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1878);
    float _1888 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1880);
    float _1890 = _1882 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1892 = _1884 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1894 = abs(_1876);
    float _1896 = log2(_1894);
    float _1898 = _1888 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1900 = fma(_1684, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1886);
    float _1902 = _1890 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1904 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1906 = _1900 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1908 = _1872 * _1828;
    float _1910 = _1872 * _1832;
    float _1912 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1904);
    float _1914 = _1872 * _1840;
    float _1916 = _1908 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1918 = -_1902;
    float _1920 = fma(_1918, _1866, 1.0);
    float _1922 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1912);
    float _1924 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1926 = -_1916;
    float _1928 = fma(_1914, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1926);
    float _1930 = _1896 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1932 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1922);
    float _1934 = log2(_1920);
    float _1936 = -_1910;
    float _1938 = fma(_1936, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1928);
    float _1940 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1942 = fma(_1938, -0.5, 0.5);
    float _1944 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1940);
    float _1946 = fma(_1938, 0.5, 0.5);
    float _1948 = exp2(_1930);
    float _1950 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1924);
    float _1952 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1944);
    float _1954 = _1914 + 1.0;
    float _1956 = fma(_1946, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1958 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1950);
    float _1960 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1952);
    float _1962 = 1.0 / _1932;
    float _1964 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1958);
    float _1966 = _1934 * 0.693147182464599609375;
    float _1968 = fma(_1946, _1956, -0.212114393711090087890625);
    float _1970 = fma(_1946, _1968, 1.570728778839111328125);
    float _1972 = sqrt(_1942);
    float _1974 = -_1914;
    float _1976 = fma(_1948, _1954, _1974);
    float _1978 = _1966 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1980 = fma(_1976, 0.5, 0.5);
    float _1982 = _1960 * _1962;
    float _1984 = _1964 * _1962;
    float _1986 = fma(_1982, 0.5, 0.5);
    float _1988 = fma(_1984, -0.5, 0.5);
    float _1990 = _1972 * 0.636619746685028076171875;
    float3 _5172 = float3(_1986, _1988, _1978);
    float _1992 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5172, float3(0.0), isnan(_5172)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5172, float3(0.0), isnan(_5172)), level(0.0)).x;
    float3 _5183 = float3(_1986, _1988, _1978);
    float4 _1995 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5183, float3(0.0), isnan(_5183)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5183, float3(0.0), isnan(_5183)), level(0.0)).xyzw;
    float _1997 = _1995.x;
    float _1999 = _1995.y;
    float _2001 = _1995.z;
    float _2003 = _1995.w;
    float _2005 = -_1970;
    float _2007 = fma(_1990, _2005, 1.0);
    float2 _5205 = float2(_2007, _1980);
    float3 _2011 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5205, float2(0.0), isnan(_5205)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5205, float2(0.0), isnan(_5205)), level(0.0)).xyz;
    float _2013 = _2011.x;
    float _2015 = _2011.y;
    float _2017 = _2011.z;
    float _2019 = _1896 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2021 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2023 = fma(_1892, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2021);
    float _2025 = exp2(_2019);
    float _2027 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2023);
    float _2029 = _1960 + _1932;
    float _2031 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2027);
    float _2033 = _2029 * 0.5;
    float _2035 = _1932 * 0.5;
    float _2037 = _2031 + _1932;
    out.gl_Position.x = _1960;
    out.gl_Position.y = _1964;
    out.gl_Position.z = _2031;
    out.gl_Position.w = _1932;
    float _2039 = fma(_1964, -0.5, _2035);
    float _2041 = _2037 * 0.5;
    float _2043 = -_2025;
    float _2045 = _2043 + 1.0;
    float _2047 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.x = _2033;
    out.m_69.y = _2039;
    out.m_69.z = _2041;
    out.m_69.w = _1932;
    float _2049 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_47.x = _2049;
    float _2051 = _2047 * _1992;
    float _2053 = -_2047;
    float _2055 = _2053 + 1.0;
    float _2057 = _2003 * _2051;
    float _2059 = _2017 * _2051;
    float _2061 = fma(_2013, _2057, _1997);
    float _2063 = fma(_2015, _2057, _1999);
    float _2065 = _2003 * _2055;
    float _2067 = fma(_2003, _2059, _2001);
    out.m_71.x = _2061;
    out.m_71.y = _2063;
    out.m_71.z = _2067;
    out.m_71.w = _2065;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

