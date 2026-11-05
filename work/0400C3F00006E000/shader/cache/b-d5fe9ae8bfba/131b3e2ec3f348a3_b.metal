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
    bool _1630 = false;
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
        float _2120 = as_type<float>(_106);
        out.gl_Position.z = _2120;
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
        float _2190 = as_type<float>(_144);
        out.gl_Position.z = _2190;
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
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _316 = _296 + _314;
    bool _318 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _320 = isnan(_296);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _338 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _340 = isnan(_296);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -_312;
    float _352 = _350 + 1.0;
    float _354 = 1.0 / _336;
    float _356 = _348 * _352;
    float _358 = -_348;
    float _360 = _358 + 1.0;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _362;
    bool _366 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _368 = 1.0 / _332;
    float _370 = _328 * _360;
    float _372 = -_328;
    float _374 = _372 + 1.0;
    float _376 = _316 * _354;
    float _378 = _300 * _368;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _384;
    float _388 = fma(_364, _378, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _390 = fma(_382, _378, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _392 = fma(_386, _378, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _394 = _388 * _370;
    float _396 = _390 * _370;
    float _398 = _392 * _370;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _412 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].x, _394);
    float _414 = fma(_402, _376, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _416 = fma(_406, _376, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _418 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].y, _396);
    float _420 = fma(_410, _376, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _422 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].z, _398);
    float _424 = fma(_414, _356, _412);
    float _426 = fma(_416, _356, _418);
    float _428 = fma(_420, _356, _422);
    float _430 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[145].x, _424);
    float _432 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[145].y, _426);
    float _434 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[145].z, _428);
    bool _436 = !_366;
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
    bool _486 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _488 = isnan(_464);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _506 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _508 = isnan(_464);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = -_480;
    float _520 = _518 + 1.0;
    float _522 = 1.0 / _504;
    float _524 = _516 * _520;
    float _526 = -_516;
    float _528 = _526 + 1.0;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _530;
    bool _534 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _536 = 1.0 / _500;
    float _538 = _496 * _528;
    float _540 = -_496;
    float _542 = _540 + 1.0;
    float _544 = _484 * _522;
    float _546 = _468 * _536;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _548;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _552;
    float _556 = fma(_532, _546, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _558 = fma(_550, _546, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _560 = fma(_554, _546, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _562 = _556 * _538;
    float _564 = _558 * _538;
    float _566 = _560 * _538;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _570 = _568 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _580 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[107].x, _562);
    float _582 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[107].y, _564);
    float _584 = fma(_570, _544, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _586 = fma(_574, _544, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _588 = fma(_578, _544, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _590 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[107].z, _566);
    float _592 = fma(_584, _524, _580);
    float _594 = fma(_586, _524, _582);
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _598 = fma(_588, _524, _590);
    float _600 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[109].x, _592);
    float _602 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[109].y, _594);
    float _604 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[109].z, _598);
    float _606 = _600 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _608 = _602 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _610 = in.m_51.x;
    float _612 = in.m_51.y;
    float _614 = in.m_51.z;
    float _616 = _604 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _618 = _606 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _620 = _608 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _622 = _616 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _618;
    out.m_55.y = _620;
    out.m_55.z = _622;
    out.m_55.w = _596;
    float _624 = _434 * _614;
    float _626 = _432 * _612;
    float _628 = _430 * _610;
    bool _630 = !_534;
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
    float _692 = -_674;
    float _694 = _692 + 1.0;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _696;
    float _700 = 1.0 / _678;
    bool _702 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _704 = _690 * _694;
    float _706 = -_690;
    float _708 = _706 + 1.0;
    float _710 = _662 * _700;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _712;
    float _716 = fma(_698, _710, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _718;
    float _722 = fma(_714, _710, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _724 = _716 * _704;
    float _726 = fma(_720, _710, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _728 = _722 * _704;
    float _730 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[123].x, _724);
    float _732 = _726 * _704;
    float _734 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[123].z, _728);
    float _736 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[124].x, _730);
    float _738 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[123].y, _732);
    float _740 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[124].z, _734);
    float _742 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[124].y, _738);
    bool _744 = !_702;
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
    float _776 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _778 = log2(_776);
    float _780 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _782 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _784 = in.m_53.x;
    float _786 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _788 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _780);
    float _790 = in.m_53.y;
    float _792 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _782);
    float _794 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _786);
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _800 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _794);
    float _802 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _788);
    float _804 = _778 * _124;
    int _806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _808 = _806 != 0;
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _812 = _810 != 0;
    int _814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _816 = _814 != 0;
    float _818 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _792);
    float _820 = _802 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _822 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _824 = isnan(0.0);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _830 = _826 || _828;
    float _832 = exp2(_804);
    float _834 = _774 * 2.0;
    float _836 = _818 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _838 = _800 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _840 = _626 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _842 = _784 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _844 = _784 * 2.0;
    float _846 = _624 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _848 = floor(_834);
    float _850 = -_796;
    float _852 = fma(_842, 2.0, _850);
    float _854 = _790 + _774;
    float _856 = _790 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _858 = _790 * 2.0;
    float _860 = _854 + (-1.0);
    float _862 = fma(_856, -2.0, _798);
    float _864 = _784 + _790;
    float _866 = floor(_844);
    float _868 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _872 = 1.0 + _870;
    float _874 = _864 + (-1.0);
    bool _876 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _878 = isnan(1.0);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _884 = _880 || _882;
    float _886 = -_832;
    float _888 = _886 + 1.0;
    bool _890 = _848 > 0.0;
    float _892 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _894 = floor(_858);
    bool _896 = _848 >= 0.0;
    bool _898 = isnan(_848);
    bool _900 = _896 || _898;
    bool _902 = isnan(0.0);
    bool _904 = _900 || _902;
    int _906 = _904 ? 0 : 1;
    float _908 = 1.0 / _872;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _914 = ~_906;
    int _916 = _914 + 1;
    int _918 = _916 + 1;
    float _920 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[78].z, _910);
    float _922 = _830 ? _888 : 0.0;
    float _924 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[78].w, _912);
    bool _926 = _866 > 0.0;
    float _928 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _920);
    int _930 = _918;
    bool _932 = _812;
    float _934 = _836;
    if (!_890)
    {
        int _936 = ~_906;
        int _938 = _936 + 1;
        _930 = _938;
    }
    int _940 = _930;
    float _942 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _924);
    bool _944 = _894 > 0.0;
    float _946 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _862);
    bool _948 = _866 >= 0.0;
    bool _950 = isnan(_866);
    bool _952 = _948 || _950;
    bool _954 = isnan(0.0);
    bool _956 = _952 || _954;
    float _958 = -_124;
    float _960 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[76].x, _852);
    if (_884)
    {
        float _962 = _922 * _908;
        _126 = _962;
    }
    float _964 = _126;
    bool _966 = _894 >= 0.0;
    bool _968 = isnan(_894);
    bool _970 = _966 || _968;
    bool _972 = isnan(0.0);
    bool _974 = _970 || _972;
    float _976 = in.m_57.x;
    float _978 = in.m_57.y;
    float _980 = in.m_57.z;
    bool _982 = !_808;
    int _984 = _982 ? 0 : 1;
    int _986 = _956 ? 0 : 1;
    int _988 = _974 ? 0 : 1;
    int _990 = abs(_984);
    int _992 = ~_986;
    int _994 = _992 + 1;
    int _996 = _994 + 1;
    int _998 = _996;
    if (!_926)
    {
        int _1000 = ~_986;
        int _1002 = _1000 + 1;
        _998 = _1002;
    }
    int _1004 = _998;
    int _1006 = ~_988;
    int _1008 = _1006 + 1;
    int _1010 = _1008 + 1;
    float _1012 = float(_990);
    float _1014 = float(_940);
    int _1016 = _1010;
    if (!_944)
    {
        int _1018 = ~_988;
        int _1020 = _1018 + 1;
        _1016 = _1020;
    }
    int _1022 = _1016;
    float _1024 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1026 = _836 + _1024;
    bool _1028 = !_812;
    int _1030 = _1028 ? 0 : 1;
    float _1032 = _1012 * _1014;
    float _1034 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1036 = _820 + _1034;
    float _1038 = _1026 * _1026;
    int _1040 = abs(_1030);
    float _1042 = _1032 * (-2.0);
    float _1044 = float(_1004);
    float _1046 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1048 = _838 + _1046;
    float _1050 = float(_1040);
    float _1052 = fma(_1036, _1036, _1038);
    float _1054 = fma(_892, _1042, _892);
    float _1056 = fma(_1042, _976, _976);
    bool _1058 = _790 > 0.5;
    float _1060 = fma(_1048, _1048, _1052);
    float _1062 = _1050 * _1044;
    float _1064 = _784 + (-0.5);
    float _1066 = _1062 * (-2.0);
    float _1068 = rsqrt(_1060);
    float _1070 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1056);
    float _1072 = _790 + (-0.5);
    float _1074 = fma(_1066, _978, _978);
    bool _1076 = !_816;
    int _1078 = _1076 ? 0 : 1;
    float _1080 = fma(_868, _1066, _868);
    float _1082 = float(_1022);
    float _1084 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1074);
    float _1086 = _628 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1088 = abs(_1078);
    float _1090 = _784 + _774;
    float _1092 = fma(_1054, _964, _1070);
    float _1094 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1096 = float(_1088);
    float _1098 = _1090 + (-1.0);
    float _1100 = _1094 * _1068;
    float _1102 = fma(_1080, _964, _1084);
    float _1104 = _1096 * _1082;
    float _1106 = _1092 * 0.15915493667125701904296875;
    float _1108 = _1026 * _1100;
    float _1110 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1112 = _1102 * 0.15915493667125701904296875;
    float _1114 = _1036 * _1100;
    float _1116 = -_1108;
    float _1118 = _1026 + _1116;
    float _1120 = _1104 * (-2.0);
    float _1122 = _1106 * 6.283185482025146484375;
    float _1124 = sin(_1122);
    float _1126 = -_1114;
    float _1128 = _1036 + _1126;
    float _1130 = _1118 * _1118;
    float _1132 = fma(_1120, _980, _980);
    float _1134 = _1048 * _1100;
    float _1136 = in.m_59.x;
    float _1138 = in.m_59.y;
    float _1140 = in.m_59.z;
    float _1142 = fma(_1128, _1128, _1130);
    float _1144 = _774 + (-0.5);
    float _1146 = -_1134;
    float _1148 = _1048 + _1146;
    float _1150 = _1106 * 6.283185482025146484375;
    float _1152 = cos(_1150);
    float _1154 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1132);
    float _1156 = fma(_1148, _1148, _1142);
    float _1158 = _1112 * 6.283185482025146484375;
    float _1160 = sin(_1158);
    float _1162 = fma(_1110, _1120, _1110);
    float _1164 = fma(_1162, _964, _1154);
    float _1166 = sqrt(_1156);
    float _1168 = _1164 * 0.15915493667125701904296875;
    float _1170 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1136);
    float _1172 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1140);
    float _1174 = _1112 * 6.283185482025146484375;
    float _1176 = cos(_1174);
    float _1178 = _1152 * _1160;
    float _1180 = _1168 * 6.283185482025146484375;
    float _1182 = sin(_1180);
    float _1184 = _1068 * _1166;
    float _1186 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1138);
    float _1188 = _1124 * _1160;
    float _1190 = _840 * _1184;
    float _1192 = _1086 * _1184;
    float _1194 = _846 * _1184;
    float _1196 = _1168 * 6.283185482025146484375;
    float _1198 = cos(_1196);
    float _1200 = _1124 * _1176;
    float _1202 = _1152 * _1176;
    float _1204 = _1190 * _1186;
    float _1206 = _1192 * _1170;
    float _1208 = _1194 * _1172;
    float _1210 = -_1178;
    float _1212 = fma(_1182, _1200, _1210);
    float _1214 = -_1200;
    float _1216 = fma(_1182, _1178, _1214);
    float _1218 = fma(_1182, _1202, _1188);
    float _1220 = fma(_1182, _1188, _1202);
    float _1222 = -_1204;
    float _1224 = _1182 * _1222;
    float _1226 = in.m_61.x;
    float _1228 = _1160 * _1198;
    float _1230 = _1198 * _1204;
    float _1232 = _1176 * _1198;
    float _1234 = _1152 * _1230;
    float _1236 = _1124 * _1230;
    float _1238 = fma(_1232, _1206, _1224);
    float _1240 = in.m_53.w;
    float _1242 = fma(_1218, _1206, _1234);
    float _1244 = fma(_1212, _1206, _1236);
    float _1246 = fma(_1228, _1208, _1238);
    float _1248 = fma(_1216, _1208, _1242);
    float _1250 = fma(_1220, _1208, _1244);
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1254 = _1252 != 0;
    float _1256 = in.m_61.y;
    float _1258 = _1248 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1260 = _1248 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1264 = _1262 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1268 = _1266 != 0;
    float _1270 = fma(_1246, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1258);
    float _1272 = fma(_1246, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1260);
    float _1274 = 1.0 / _1264;
    int _1276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1278 = _1276 != 0;
    float _1280 = fma(_1250, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1270);
    float _1282 = fma(_1250, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1272);
    int _1284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1286 = _1284 != 0;
    float _1288 = _820 + _1280;
    float _1290 = _838 + _1282;
    bool _1292 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1294 = isnan(_772);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1300 = _1296 || _1298;
    float _1302 = float(_1300);
    float _1304 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1306 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1308 = _1288 + _1306;
    float _1310 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1312 = _1290 + _1310;
    bool _1314 = _1240 > 0.5;
    float _1316 = _1308 * _1308;
    float _1318 = _1312 * _1312;
    float _1320 = -_1256;
    float _1322 = _1320 + 1.0;
    bool _1324 = _1314;
    float _1326 = _1256;
    int _1328 = as_type<int>(_1246);
    float _1330 = _1114;
    if (_1254)
    {
        bool _1332 = _784 > 0.5;
        _932 = _1332;
    }
    bool _1334 = _932;
    float _1336 = _1316 + _1318;
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1340 = _772 + _1338;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1342;
    int _1346 = _1314 ? as_type<int>(_1322) : as_type<int>(_1256);
    float _1348 = sqrt(_1336);
    float _1350 = _1340;
    if (_1268)
    {
        bool _1352 = _774 > 0.5;
        _1324 = _1352;
    }
    bool _1354 = _1324;
    float _1356 = -_1302;
    float _1358 = _1356 + 1.0;
    bool _1360 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1362 = isnan(_772);
    bool _1364 = _1360 || _1362;
    bool _1366 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1368 = _1364 || _1366;
    float _1370 = float(_1368);
    float _1372 = _1344 * _1274;
    float _1374 = _1370 * _1358;
    float _1376 = _1286 ? as_type<float>(_1346) : _1256;
    float _1378 = fma(_1372, _1340, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _1380 = as_type<int>(_1374);
    if (_1278)
    {
        float _1382 = _1058 ? _1322 : _1256;
        _1326 = _1382;
    }
    float _1384 = _1326;
    float _1386 = _1304 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1388 = _1248 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1390 = _1378 * _1374;
    float _1392 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1394 = _1348 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1396 = fma(_1386, _1384, -0.5);
    float _1398 = fma(_1246, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1388);
    float _1400 = _1388;
    float _1402 = _1398;
    if (_1268)
    {
        float _1404 = -_1226;
        float _1406 = _1404 + 1.0;
        _1380 = as_type<int>(_1406);
    }
    int _1408 = _1380;
    if (!_1268)
    {
        _1400 = _1226;
    }
    float _1410 = _1400;
    float _1412 = _1410;
    if (_1254)
    {
        float _1414 = -_1226;
        float _1416 = _1414 + 1.0;
        _1328 = as_type<int>(_1416);
    }
    int _1418 = _1328;
    float _1420 = fma(_1250, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1398);
    float _1422 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1424 = as_type<float>(_1418);
    float _1426 = _1420;
    if (_1268)
    {
        float _1428 = _1354 ? as_type<float>(_1408) : _1226;
        _1412 = _1428;
    }
    float _1430 = _1412;
    float _1432 = -_1370;
    float _1434 = _1432 + 1.0;
    float _1436 = _836 + _1420;
    float _1438 = _1434;
    if (!_1254)
    {
        _1350 = _1226;
    }
    float _1440 = _1350;
    float _1442 = _1440;
    if (_1254)
    {
        float _1444 = _1334 ? as_type<float>(_1418) : _1226;
        _1442 = _1444;
    }
    float _1446 = _1442;
    float _1448 = fma(_1434, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1390);
    float _1450 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (!_1394)
    {
        _1402 = _1318;
    }
    float _1452 = _1402;
    float _1454 = _1452;
    if (!_1394)
    {
        _1424 = _1316;
    }
    float _1456 = _1424;
    float _1458 = _1456;
    if (!_1394)
    {
        _1426 = _1288;
    }
    float _1460 = _1426;
    float _1462 = _1460;
    if (!_1394)
    {
        _934 = _1290;
    }
    float _1464 = _934;
    float _1466 = _1464;
    if (!_1394)
    {
        _1438 = _1436;
    }
    float _1468 = _1438;
    bool _1470 = !_1394;
    float _1472 = _1468;
    float _1474 = _1422;
    if (!_1470)
    {
        float _1476 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1478 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1480 = _1348 + _1478;
        float _1482 = _1436 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1484 = rsqrt(_1336);
        float _1486 = _1480 * _1476;
        float _1488 = _1486 * 0.15915493667125701904296875;
        float _1490 = _1488 * 6.283185482025146484375;
        float _1492 = sin(_1490);
        float _1494 = _1488 * 6.283185482025146484375;
        float _1496 = cos(_1494);
        float _1498 = fma(_1492, _1482, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1500 = _1484 * _1498;
        float _1502 = _1496 + (-1.0);
        float _1504 = fma(_1308, _1500, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1506 = fma(_1312, _1500, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1508 = _1502 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1510 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1512 = _1504 + _1510;
        float _1514 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1516 = _1506 + _1514;
        float _1518 = fma(_1436, _1496, _1508);
        float _1520 = _1512 * _1512;
        float _1522 = _1516 * _1516;
        _1472 = _1518;
        _1458 = _1520;
        _1454 = _1522;
        _1462 = _1504;
        _1466 = _1506;
    }
    float _1524 = _1472;
    float _1526 = _1458;
    float _1528 = _1454;
    float _1530 = _1462;
    float _1532 = _1466;
    float _1534 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1536 = _1524 + _1534;
    float _1538 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1540 = fma(_1302, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1448);
    float _1542 = _1376 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1544 = fma(_1536, _1536, _1526);
    float _1546 = fma(_1538, _1446, -0.5);
    float _1548 = -_946;
    float _1550 = fma(_942, _1396, _1548);
    float _1552 = _1430 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1554 = _1544 + _1528;
    float _1556 = fma(_928, _1546, _960);
    float _1558 = _1542 * _1450;
    float _1560 = _736 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1562 = _742 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1564 = _740 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1566 = sqrt(_1554);
    float _1568 = _1552 * _1422;
    float _1570 = _1560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1572 = _1562 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1574 = _1564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1576 = _1550 + 0.5;
    float _1578 = _1540 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1580 = _1556 + 0.5;
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    out.m_65.x = _1570;
    out.m_65.y = _1572;
    out.m_65.z = _1574;
    out.m_65.w = _1578;
    bool _1582 = _1566 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1584 = isnan(_1566);
    bool _1586 = _1582 || _1584;
    bool _1588 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1590 = _1586 || _1588;
    out.m_67.x = _1580;
    out.m_67.y = _1576;
    out.m_67.z = _1568;
    out.m_67.w = _1558;
    float _1592 = _1560;
    float _1594 = _1542;
    if (!_1590)
    {
        _1592 = 1.0;
    }
    float _1596 = _1592;
    bool _1598 = !_1590;
    float _1600 = _1596;
    if (!_1598)
    {
        bool _1602 = _1566 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1604 = isnan(_1566);
        bool _1606 = _1602 || _1604;
        bool _1608 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1610 = _1606 || _1608;
        if (!_1610)
        {
            float _1612 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1614 = _1566 + _1612;
            float _1616 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1618 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1616;
            float _1620 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1622 = _1620 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1624 = 1.0 / _1618;
            float _1626 = _1614 * _1624;
            float _1628 = fma(_1626, _1622, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1600 = _1628;
            _1630 = true;
        }
        else
        {
            bool _1632 = _1566 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1634 = isnan(_1566);
            bool _1636 = _1632 || _1634;
            bool _1638 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1640 = _1636 || _1638;
            if (!_1640)
            {
                float _1642 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1644 = _1566 + _1642;
                float _1646 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1648 = _1646 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1650 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1652 = _1650 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1654 = 1.0 / _1648;
                float _1656 = _1644 * _1654;
                float _1658 = fma(_1656, _1652, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1600 = _1658;
                _1630 = true;
            }
            else
            {
                _1600 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1630 = false;
    float _1660 = _1600;
    float _1662 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1664 = _1524 + _1662;
    float _1666 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1668 = _1530 + _1666;
    float _1670 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1672 = _1532 + _1670;
    float _1674 = fma(_1664, _1660, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1676 = fma(_1668, _1660, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1678 = fma(_1672, _1660, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1680 = -_1108;
    float _1682 = _1680 + _1674;
    float _1684 = -_1114;
    float _1686 = _1684 + _1676;
    float _1688 = -_1134;
    float _1690 = _1688 + _1678;
    float _1692 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1694 = _1682 + _1692;
    float _1696 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1698 = _1686 + _1696;
    float _1700 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1702 = _1690 + _1700;
    float _1704 = _1694 * _1694;
    float _1706 = fma(_1698, _1698, _1704);
    float _1708 = fma(_1702, _1702, _1706);
    float _1710 = rsqrt(_1708);
    float _1712 = _1710 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1714 = _1698 * _1712;
    float _1716 = _1702 * _1712;
    float _1718 = _1714 * _1714;
    float _1720 = _1716 * _1716;
    float _1722 = _1718 + _1720;
    float _1724 = sqrt(_1722);
    bool _1726 = _1724 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1728 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1730 = _1724 + _1728;
    float _1732 = _1710;
    float _1734 = _1730;
    float _1736 = _1694;
    float _1738 = _1712;
    float _1740 = _1714;
    if (_1726)
    {
        float _1742 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1732 = _1742;
    }
    float _1744 = _1732;
    if (_1726)
    {
        float _1746 = rsqrt(_1722);
        _1474 = _1746;
    }
    float _1748 = _1474;
    float _1750 = _1748;
    if (_1726)
    {
        float _1752 = _1730 * _1744;
        _1734 = _1752;
    }
    float _1754 = _1734;
    if (_1726)
    {
        float _1756 = _1754 * 0.15915493667125701904296875;
        _1330 = _1756;
    }
    float _1758 = _1330;
    float _1760 = _1744;
    if (_1726)
    {
        float _1762 = _1758 * 6.283185482025146484375;
        float _1764 = sin(_1762);
        _1760 = _1764;
    }
    float _1766 = _1760;
    float _1768 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1770 = precise::max(0.0, _1768);
    float _1772 = _1702;
    float _1774 = _1770;
    if (_1726)
    {
        float _1776 = _1758 * 6.283185482025146484375;
        float _1778 = cos(_1776);
        _1772 = _1778;
    }
    float _1780 = _1772;
    float _1782 = -_1712;
    float _1784 = -_1770;
    float _1786 = fma(_1694, _1782, _1784);
    if (!_1726)
    {
        _1736 = _1716;
    }
    float _1788 = _1736;
    float _1790 = _1788;
    if (_1726)
    {
        float _1792 = _1786 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1774 = _1792;
    }
    float _1794 = _1774;
    float _1796 = sqrt(_1708);
    float _1798 = _1766;
    float _1800 = _1794;
    if (_1726)
    {
        float _1802 = fma(_1766, _1794, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1594 = _1802;
    }
    float _1804 = _1594;
    if (!_1726)
    {
        _1798 = _1786;
    }
    float _1806 = _1798;
    float _1808 = _1806;
    float _1810 = _1780;
    if (_1726)
    {
        float _1812 = _1780 + (-1.0);
        _1800 = _1812;
    }
    float _1814 = _1800;
    float _1816 = _1814;
    if (_1726)
    {
        float _1818 = _1748 * _1804;
        _1738 = _1818;
    }
    float _1820 = _1738;
    float _1822 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1726)
    {
        float _1824 = _1814 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1750 = _1824;
    }
    float _1826 = _1750;
    if (_1726)
    {
        float _1828 = _1714 * _1820;
        _1740 = _1828;
    }
    float _1830 = _1740;
    if (!_1726)
    {
        _1816 = _1718;
    }
    float _1832 = _1816;
    float _1834 = _1832;
    if (_1726)
    {
        float _1836 = _1716 * _1820;
        _1790 = _1836;
    }
    float _1838 = _1790;
    if (_1726)
    {
        float _1840 = fma(_1786, _1780, _1826);
        _1808 = _1840;
    }
    float _1842 = _1808;
    if (_1726)
    {
        float _1844 = _1830 * _1830;
        _1834 = _1844;
    }
    float _1846 = _1834;
    if (!_1726)
    {
        _1810 = _1720;
    }
    float _1848 = _1810;
    float _1850 = _1848;
    if (_1726)
    {
        float _1852 = _1838 * _1838;
        _1850 = _1852;
    }
    float _1854 = _1850;
    float _1856 = fma(_1842, _1842, _1846);
    float _1858 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1822);
    float _1860 = _1856 + _1854;
    float _1862 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1864 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1866 = fma(_1796, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1864);
    float _1868 = precise::clamp(_1866, 0.0, 1.0);
    float _1870 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1872 = rsqrt(_1860);
    float _1874 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1862);
    float _1876 = -_1868;
    float _1878 = _1876 + 1.0;
    float _1880 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1870);
    float _1882 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1884 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1874);
    float _1886 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1888 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1880);
    float _1890 = abs(_1878);
    float _1892 = log2(_1890);
    float _1894 = _1884 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1896 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1886);
    float _1898 = _1888 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1900 = _1894 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1902 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1896);
    float _1904 = _1872 * _1830;
    float _1906 = -_1900;
    float _1908 = fma(_1906, _1882, 1.0);
    float _1910 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1858);
    float _1912 = _1902 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1914 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1916 = _1872 * _1842;
    float _1918 = _1904 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1920 = _1872 * _1838;
    float _1922 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1914);
    float _1924 = _1910 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1926 = -_1918;
    float _1928 = fma(_1916, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1926);
    float _1930 = _1892 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1932 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1922);
    float _1934 = log2(_1908);
    float _1936 = -_1920;
    float _1938 = fma(_1936, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1928);
    float _1940 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1942 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1932);
    float _1944 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1946 = fma(_1938, -0.5, 0.5);
    float _1948 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1940);
    float _1950 = fma(_1938, 0.5, 0.5);
    float _1952 = exp2(_1930);
    float _1954 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1944);
    float _1956 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1948);
    float _1958 = fma(_1950, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1960 = _1916 + 1.0;
    float _1962 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1954);
    float _1964 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1956);
    float _1966 = fma(_1950, _1958, -0.212114393711090087890625);
    float _1968 = 1.0 / _1942;
    float _1970 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1962);
    float _1972 = _1934 * 0.693147182464599609375;
    float _1974 = fma(_1950, _1966, 1.570728778839111328125);
    float _1976 = _1972 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1978 = sqrt(_1946);
    float _1980 = -_1916;
    float _1982 = fma(_1952, _1960, _1980);
    float _1984 = fma(_1982, 0.5, 0.5);
    float _1986 = _1964 * _1968;
    float _1988 = _1970 * _1968;
    float _1990 = fma(_1986, 0.5, 0.5);
    float _1992 = fma(_1988, -0.5, 0.5);
    float _1994 = _1978 * 0.636619746685028076171875;
    float3 _5162 = float3(_1990, _1992, _1976);
    float _1996 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5162, float3(0.0), isnan(_5162)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5162, float3(0.0), isnan(_5162)), level(0.0)).x;
    float3 _5173 = float3(_1990, _1992, _1976);
    float4 _1999 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5173, float3(0.0), isnan(_5173)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5173, float3(0.0), isnan(_5173)), level(0.0)).xyzw;
    float _2001 = _1999.x;
    float _2003 = _1999.y;
    float _2005 = _1999.z;
    float _2007 = _1999.w;
    float _2009 = -_1974;
    float _2011 = fma(_1994, _2009, 1.0);
    float2 _5195 = float2(_2011, _1984);
    float3 _2015 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5195, float2(0.0), isnan(_5195)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5195, float2(0.0), isnan(_5195)), level(0.0)).xyz;
    float _2017 = _2015.x;
    float _2019 = _2015.y;
    float _2021 = _2015.z;
    float _2023 = _1892 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2025 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2027 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2025);
    float _2029 = exp2(_2023);
    float _2031 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2027);
    float _2033 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2031);
    float _2035 = _2033 + _1942;
    float _2037 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1964;
    out.gl_Position.y = _1970;
    out.gl_Position.z = _2033;
    out.gl_Position.w = _1942;
    float _2039 = _2035 * 0.5;
    float _2041 = -_2029;
    float _2043 = _2041 + 1.0;
    out.m_47.x = _2037;
    float _2045 = _2043 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _2039;
    out.m_69.w = _1942;
    float _2047 = _2045 * _1996;
    float _2049 = -_2045;
    float _2051 = _2049 + 1.0;
    float _2053 = _2007 * _2047;
    float _2055 = _2021 * _2047;
    float _2057 = fma(_2017, _2053, _2001);
    float _2059 = fma(_2019, _2053, _2003);
    float _2061 = _2007 * _2051;
    float _2063 = fma(_2007, _2055, _2005);
    out.m_71.x = _2057;
    out.m_71.y = _2059;
    out.m_71.z = _2063;
    out.m_71.w = _2061;
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
    bool _1630 = false;
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
        float _2120 = as_type<float>(_106);
        out.gl_Position.z = _2120;
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
        float _2190 = as_type<float>(_144);
        out.gl_Position.z = _2190;
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
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _316 = _296 + _314;
    bool _318 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _320 = isnan(_296);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _338 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _340 = isnan(_296);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -_312;
    float _352 = _350 + 1.0;
    float _354 = 1.0 / _336;
    float _356 = _348 * _352;
    float _358 = -_348;
    float _360 = _358 + 1.0;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _362;
    bool _366 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _368 = 1.0 / _332;
    float _370 = _328 * _360;
    float _372 = -_328;
    float _374 = _372 + 1.0;
    float _376 = _316 * _354;
    float _378 = _300 * _368;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _384;
    float _388 = fma(_364, _378, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _390 = fma(_382, _378, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _392 = fma(_386, _378, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _394 = _388 * _370;
    float _396 = _390 * _370;
    float _398 = _392 * _370;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _412 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].x, _394);
    float _414 = fma(_402, _376, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _416 = fma(_406, _376, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _418 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].y, _396);
    float _420 = fma(_410, _376, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _422 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].z, _398);
    float _424 = fma(_414, _356, _412);
    float _426 = fma(_416, _356, _418);
    float _428 = fma(_420, _356, _422);
    float _430 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[145].x, _424);
    float _432 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[145].y, _426);
    float _434 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[145].z, _428);
    bool _436 = !_366;
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
    bool _486 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _488 = isnan(_464);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _506 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _508 = isnan(_464);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = -_480;
    float _520 = _518 + 1.0;
    float _522 = 1.0 / _504;
    float _524 = _516 * _520;
    float _526 = -_516;
    float _528 = _526 + 1.0;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _530;
    bool _534 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _536 = 1.0 / _500;
    float _538 = _496 * _528;
    float _540 = -_496;
    float _542 = _540 + 1.0;
    float _544 = _484 * _522;
    float _546 = _468 * _536;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _548;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _552;
    float _556 = fma(_532, _546, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _558 = fma(_550, _546, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _560 = fma(_554, _546, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _562 = _556 * _538;
    float _564 = _558 * _538;
    float _566 = _560 * _538;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _570 = _568 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _580 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[107].x, _562);
    float _582 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[107].y, _564);
    float _584 = fma(_570, _544, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _586 = fma(_574, _544, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _588 = fma(_578, _544, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _590 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[107].z, _566);
    float _592 = fma(_584, _524, _580);
    float _594 = fma(_586, _524, _582);
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _598 = fma(_588, _524, _590);
    float _600 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[109].x, _592);
    float _602 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[109].y, _594);
    float _604 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[109].z, _598);
    float _606 = _600 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _608 = _602 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _610 = in.m_51.x;
    float _612 = in.m_51.y;
    float _614 = in.m_51.z;
    float _616 = _604 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _618 = _606 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _620 = _608 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _622 = _616 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _618;
    out.m_55.y = _620;
    out.m_55.z = _622;
    out.m_55.w = _596;
    float _624 = _434 * _614;
    float _626 = _432 * _612;
    float _628 = _430 * _610;
    bool _630 = !_534;
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
    float _692 = -_674;
    float _694 = _692 + 1.0;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _696;
    float _700 = 1.0 / _678;
    bool _702 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _704 = _690 * _694;
    float _706 = -_690;
    float _708 = _706 + 1.0;
    float _710 = _662 * _700;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _712;
    float _716 = fma(_698, _710, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _718;
    float _722 = fma(_714, _710, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _724 = _716 * _704;
    float _726 = fma(_720, _710, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _728 = _722 * _704;
    float _730 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[123].x, _724);
    float _732 = _726 * _704;
    float _734 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[123].z, _728);
    float _736 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[124].x, _730);
    float _738 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[123].y, _732);
    float _740 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[124].z, _734);
    float _742 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[124].y, _738);
    bool _744 = !_702;
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
    float _776 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _778 = log2(_776);
    float _780 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _782 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _784 = in.m_53.x;
    float _786 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _788 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _780);
    float _790 = in.m_53.y;
    float _792 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _782);
    float _794 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _786);
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _800 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _794);
    float _802 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _788);
    float _804 = _778 * _124;
    int _806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _808 = _806 != 0;
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _812 = _810 != 0;
    int _814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _816 = _814 != 0;
    float _818 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _792);
    float _820 = _802 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _822 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _824 = isnan(0.0);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _830 = _826 || _828;
    float _832 = exp2(_804);
    float _834 = _774 * 2.0;
    float _836 = _818 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _838 = _800 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _840 = _626 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _842 = _784 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _844 = _784 * 2.0;
    float _846 = _624 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _848 = floor(_834);
    float _850 = -_796;
    float _852 = fma(_842, 2.0, _850);
    float _854 = _790 + _774;
    float _856 = _790 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _858 = _790 * 2.0;
    float _860 = _854 + (-1.0);
    float _862 = fma(_856, -2.0, _798);
    float _864 = _784 + _790;
    float _866 = floor(_844);
    float _868 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _872 = 1.0 + _870;
    float _874 = _864 + (-1.0);
    bool _876 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _878 = isnan(1.0);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _884 = _880 || _882;
    float _886 = -_832;
    float _888 = _886 + 1.0;
    bool _890 = _848 > 0.0;
    float _892 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _894 = floor(_858);
    bool _896 = _848 >= 0.0;
    bool _898 = isnan(_848);
    bool _900 = _896 || _898;
    bool _902 = isnan(0.0);
    bool _904 = _900 || _902;
    int _906 = _904 ? 0 : 1;
    float _908 = 1.0 / _872;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _914 = ~_906;
    int _916 = _914 + 1;
    int _918 = _916 + 1;
    float _920 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[78].z, _910);
    float _922 = _830 ? _888 : 0.0;
    float _924 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[78].w, _912);
    bool _926 = _866 > 0.0;
    float _928 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _920);
    int _930 = _918;
    bool _932 = _812;
    float _934 = _836;
    if (!_890)
    {
        int _936 = ~_906;
        int _938 = _936 + 1;
        _930 = _938;
    }
    int _940 = _930;
    float _942 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _924);
    bool _944 = _894 > 0.0;
    float _946 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _862);
    bool _948 = _866 >= 0.0;
    bool _950 = isnan(_866);
    bool _952 = _948 || _950;
    bool _954 = isnan(0.0);
    bool _956 = _952 || _954;
    float _958 = -_124;
    float _960 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[76].x, _852);
    if (_884)
    {
        float _962 = _922 * _908;
        _126 = _962;
    }
    float _964 = _126;
    bool _966 = _894 >= 0.0;
    bool _968 = isnan(_894);
    bool _970 = _966 || _968;
    bool _972 = isnan(0.0);
    bool _974 = _970 || _972;
    float _976 = in.m_57.x;
    float _978 = in.m_57.y;
    float _980 = in.m_57.z;
    bool _982 = !_808;
    int _984 = _982 ? 0 : 1;
    int _986 = _956 ? 0 : 1;
    int _988 = _974 ? 0 : 1;
    int _990 = abs(_984);
    int _992 = ~_986;
    int _994 = _992 + 1;
    int _996 = _994 + 1;
    int _998 = _996;
    if (!_926)
    {
        int _1000 = ~_986;
        int _1002 = _1000 + 1;
        _998 = _1002;
    }
    int _1004 = _998;
    int _1006 = ~_988;
    int _1008 = _1006 + 1;
    int _1010 = _1008 + 1;
    float _1012 = float(_990);
    float _1014 = float(_940);
    int _1016 = _1010;
    if (!_944)
    {
        int _1018 = ~_988;
        int _1020 = _1018 + 1;
        _1016 = _1020;
    }
    int _1022 = _1016;
    float _1024 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1026 = _836 + _1024;
    bool _1028 = !_812;
    int _1030 = _1028 ? 0 : 1;
    float _1032 = _1012 * _1014;
    float _1034 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1036 = _820 + _1034;
    float _1038 = _1026 * _1026;
    int _1040 = abs(_1030);
    float _1042 = _1032 * (-2.0);
    float _1044 = float(_1004);
    float _1046 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1048 = _838 + _1046;
    float _1050 = float(_1040);
    float _1052 = fma(_1036, _1036, _1038);
    float _1054 = fma(_892, _1042, _892);
    float _1056 = fma(_1042, _976, _976);
    bool _1058 = _790 > 0.5;
    float _1060 = fma(_1048, _1048, _1052);
    float _1062 = _1050 * _1044;
    float _1064 = _784 + (-0.5);
    float _1066 = _1062 * (-2.0);
    float _1068 = rsqrt(_1060);
    float _1070 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1056);
    float _1072 = _790 + (-0.5);
    float _1074 = fma(_1066, _978, _978);
    bool _1076 = !_816;
    int _1078 = _1076 ? 0 : 1;
    float _1080 = fma(_868, _1066, _868);
    float _1082 = float(_1022);
    float _1084 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1074);
    float _1086 = _628 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1088 = abs(_1078);
    float _1090 = _784 + _774;
    float _1092 = fma(_1054, _964, _1070);
    float _1094 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1096 = float(_1088);
    float _1098 = _1090 + (-1.0);
    float _1100 = _1094 * _1068;
    float _1102 = fma(_1080, _964, _1084);
    float _1104 = _1096 * _1082;
    float _1106 = _1092 * 0.15915493667125701904296875;
    float _1108 = _1026 * _1100;
    float _1110 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1112 = _1102 * 0.15915493667125701904296875;
    float _1114 = _1036 * _1100;
    float _1116 = -_1108;
    float _1118 = _1026 + _1116;
    float _1120 = _1104 * (-2.0);
    float _1122 = _1106 * 6.283185482025146484375;
    float _1124 = sin(_1122);
    float _1126 = -_1114;
    float _1128 = _1036 + _1126;
    float _1130 = _1118 * _1118;
    float _1132 = fma(_1120, _980, _980);
    float _1134 = _1048 * _1100;
    float _1136 = in.m_59.x;
    float _1138 = in.m_59.y;
    float _1140 = in.m_59.z;
    float _1142 = fma(_1128, _1128, _1130);
    float _1144 = _774 + (-0.5);
    float _1146 = -_1134;
    float _1148 = _1048 + _1146;
    float _1150 = _1106 * 6.283185482025146484375;
    float _1152 = cos(_1150);
    float _1154 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1132);
    float _1156 = fma(_1148, _1148, _1142);
    float _1158 = _1112 * 6.283185482025146484375;
    float _1160 = sin(_1158);
    float _1162 = fma(_1110, _1120, _1110);
    float _1164 = fma(_1162, _964, _1154);
    float _1166 = sqrt(_1156);
    float _1168 = _1164 * 0.15915493667125701904296875;
    float _1170 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1136);
    float _1172 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1140);
    float _1174 = _1112 * 6.283185482025146484375;
    float _1176 = cos(_1174);
    float _1178 = _1152 * _1160;
    float _1180 = _1168 * 6.283185482025146484375;
    float _1182 = sin(_1180);
    float _1184 = _1068 * _1166;
    float _1186 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1138);
    float _1188 = _1124 * _1160;
    float _1190 = _840 * _1184;
    float _1192 = _1086 * _1184;
    float _1194 = _846 * _1184;
    float _1196 = _1168 * 6.283185482025146484375;
    float _1198 = cos(_1196);
    float _1200 = _1124 * _1176;
    float _1202 = _1152 * _1176;
    float _1204 = _1190 * _1186;
    float _1206 = _1192 * _1170;
    float _1208 = _1194 * _1172;
    float _1210 = -_1178;
    float _1212 = fma(_1182, _1200, _1210);
    float _1214 = -_1200;
    float _1216 = fma(_1182, _1178, _1214);
    float _1218 = fma(_1182, _1202, _1188);
    float _1220 = fma(_1182, _1188, _1202);
    float _1222 = -_1204;
    float _1224 = _1182 * _1222;
    float _1226 = in.m_61.x;
    float _1228 = _1160 * _1198;
    float _1230 = _1198 * _1204;
    float _1232 = _1176 * _1198;
    float _1234 = _1152 * _1230;
    float _1236 = _1124 * _1230;
    float _1238 = fma(_1232, _1206, _1224);
    float _1240 = in.m_53.w;
    float _1242 = fma(_1218, _1206, _1234);
    float _1244 = fma(_1212, _1206, _1236);
    float _1246 = fma(_1228, _1208, _1238);
    float _1248 = fma(_1216, _1208, _1242);
    float _1250 = fma(_1220, _1208, _1244);
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1254 = _1252 != 0;
    float _1256 = in.m_61.y;
    float _1258 = _1248 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1260 = _1248 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1264 = _1262 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1268 = _1266 != 0;
    float _1270 = fma(_1246, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1258);
    float _1272 = fma(_1246, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1260);
    float _1274 = 1.0 / _1264;
    int _1276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1278 = _1276 != 0;
    float _1280 = fma(_1250, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1270);
    float _1282 = fma(_1250, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1272);
    int _1284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1286 = _1284 != 0;
    float _1288 = _820 + _1280;
    float _1290 = _838 + _1282;
    bool _1292 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1294 = isnan(_772);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1300 = _1296 || _1298;
    float _1302 = float(_1300);
    float _1304 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1306 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1308 = _1288 + _1306;
    float _1310 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1312 = _1290 + _1310;
    bool _1314 = _1240 > 0.5;
    float _1316 = _1308 * _1308;
    float _1318 = _1312 * _1312;
    float _1320 = -_1256;
    float _1322 = _1320 + 1.0;
    bool _1324 = _1314;
    float _1326 = _1256;
    int _1328 = as_type<int>(_1246);
    float _1330 = _1114;
    if (_1254)
    {
        bool _1332 = _784 > 0.5;
        _932 = _1332;
    }
    bool _1334 = _932;
    float _1336 = _1316 + _1318;
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1340 = _772 + _1338;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1342;
    int _1346 = _1314 ? as_type<int>(_1322) : as_type<int>(_1256);
    float _1348 = sqrt(_1336);
    float _1350 = _1340;
    if (_1268)
    {
        bool _1352 = _774 > 0.5;
        _1324 = _1352;
    }
    bool _1354 = _1324;
    float _1356 = -_1302;
    float _1358 = _1356 + 1.0;
    bool _1360 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1362 = isnan(_772);
    bool _1364 = _1360 || _1362;
    bool _1366 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1368 = _1364 || _1366;
    float _1370 = float(_1368);
    float _1372 = _1344 * _1274;
    float _1374 = _1370 * _1358;
    float _1376 = _1286 ? as_type<float>(_1346) : _1256;
    float _1378 = fma(_1372, _1340, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _1380 = as_type<int>(_1374);
    if (_1278)
    {
        float _1382 = _1058 ? _1322 : _1256;
        _1326 = _1382;
    }
    float _1384 = _1326;
    float _1386 = _1304 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1388 = _1248 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1390 = _1378 * _1374;
    float _1392 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1394 = _1348 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1396 = fma(_1386, _1384, -0.5);
    float _1398 = fma(_1246, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1388);
    float _1400 = _1388;
    float _1402 = _1398;
    if (_1268)
    {
        float _1404 = -_1226;
        float _1406 = _1404 + 1.0;
        _1380 = as_type<int>(_1406);
    }
    int _1408 = _1380;
    if (!_1268)
    {
        _1400 = _1226;
    }
    float _1410 = _1400;
    float _1412 = _1410;
    if (_1254)
    {
        float _1414 = -_1226;
        float _1416 = _1414 + 1.0;
        _1328 = as_type<int>(_1416);
    }
    int _1418 = _1328;
    float _1420 = fma(_1250, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1398);
    float _1422 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1424 = as_type<float>(_1418);
    float _1426 = _1420;
    if (_1268)
    {
        float _1428 = _1354 ? as_type<float>(_1408) : _1226;
        _1412 = _1428;
    }
    float _1430 = _1412;
    float _1432 = -_1370;
    float _1434 = _1432 + 1.0;
    float _1436 = _836 + _1420;
    float _1438 = _1434;
    if (!_1254)
    {
        _1350 = _1226;
    }
    float _1440 = _1350;
    float _1442 = _1440;
    if (_1254)
    {
        float _1444 = _1334 ? as_type<float>(_1418) : _1226;
        _1442 = _1444;
    }
    float _1446 = _1442;
    float _1448 = fma(_1434, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1390);
    float _1450 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (!_1394)
    {
        _1402 = _1318;
    }
    float _1452 = _1402;
    float _1454 = _1452;
    if (!_1394)
    {
        _1424 = _1316;
    }
    float _1456 = _1424;
    float _1458 = _1456;
    if (!_1394)
    {
        _1426 = _1288;
    }
    float _1460 = _1426;
    float _1462 = _1460;
    if (!_1394)
    {
        _934 = _1290;
    }
    float _1464 = _934;
    float _1466 = _1464;
    if (!_1394)
    {
        _1438 = _1436;
    }
    float _1468 = _1438;
    bool _1470 = !_1394;
    float _1472 = _1468;
    float _1474 = _1422;
    if (!_1470)
    {
        float _1476 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1478 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1480 = _1348 + _1478;
        float _1482 = _1436 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1484 = rsqrt(_1336);
        float _1486 = _1480 * _1476;
        float _1488 = _1486 * 0.15915493667125701904296875;
        float _1490 = _1488 * 6.283185482025146484375;
        float _1492 = sin(_1490);
        float _1494 = _1488 * 6.283185482025146484375;
        float _1496 = cos(_1494);
        float _1498 = fma(_1492, _1482, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1500 = _1484 * _1498;
        float _1502 = _1496 + (-1.0);
        float _1504 = fma(_1308, _1500, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1506 = fma(_1312, _1500, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1508 = _1502 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1510 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1512 = _1504 + _1510;
        float _1514 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1516 = _1506 + _1514;
        float _1518 = fma(_1436, _1496, _1508);
        float _1520 = _1512 * _1512;
        float _1522 = _1516 * _1516;
        _1472 = _1518;
        _1458 = _1520;
        _1454 = _1522;
        _1462 = _1504;
        _1466 = _1506;
    }
    float _1524 = _1472;
    float _1526 = _1458;
    float _1528 = _1454;
    float _1530 = _1462;
    float _1532 = _1466;
    float _1534 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1536 = _1524 + _1534;
    float _1538 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1540 = fma(_1302, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1448);
    float _1542 = _1376 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1544 = fma(_1536, _1536, _1526);
    float _1546 = fma(_1538, _1446, -0.5);
    float _1548 = -_946;
    float _1550 = fma(_942, _1396, _1548);
    float _1552 = _1430 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1554 = _1544 + _1528;
    float _1556 = fma(_928, _1546, _960);
    float _1558 = _1542 * _1450;
    float _1560 = _736 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1562 = _742 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1564 = _740 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1566 = sqrt(_1554);
    float _1568 = _1552 * _1422;
    float _1570 = _1560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1572 = _1562 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1574 = _1564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1576 = _1550 + 0.5;
    float _1578 = _1540 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1580 = _1556 + 0.5;
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    out.m_65.x = _1570;
    out.m_65.y = _1572;
    out.m_65.z = _1574;
    out.m_65.w = _1578;
    bool _1582 = _1566 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1584 = isnan(_1566);
    bool _1586 = _1582 || _1584;
    bool _1588 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1590 = _1586 || _1588;
    out.m_67.x = _1580;
    out.m_67.y = _1576;
    out.m_67.z = _1568;
    out.m_67.w = _1558;
    float _1592 = _1560;
    float _1594 = _1542;
    if (!_1590)
    {
        _1592 = 1.0;
    }
    float _1596 = _1592;
    bool _1598 = !_1590;
    float _1600 = _1596;
    if (!_1598)
    {
        bool _1602 = _1566 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1604 = isnan(_1566);
        bool _1606 = _1602 || _1604;
        bool _1608 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1610 = _1606 || _1608;
        if (!_1610)
        {
            float _1612 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1614 = _1566 + _1612;
            float _1616 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1618 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1616;
            float _1620 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1622 = _1620 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1624 = 1.0 / _1618;
            float _1626 = _1614 * _1624;
            float _1628 = fma(_1626, _1622, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1600 = _1628;
            _1630 = true;
        }
        else
        {
            bool _1632 = _1566 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1634 = isnan(_1566);
            bool _1636 = _1632 || _1634;
            bool _1638 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1640 = _1636 || _1638;
            if (!_1640)
            {
                float _1642 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1644 = _1566 + _1642;
                float _1646 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1648 = _1646 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1650 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1652 = _1650 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1654 = 1.0 / _1648;
                float _1656 = _1644 * _1654;
                float _1658 = fma(_1656, _1652, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1600 = _1658;
                _1630 = true;
            }
            else
            {
                _1600 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1630 = false;
    float _1660 = _1600;
    float _1662 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1664 = _1524 + _1662;
    float _1666 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1668 = _1530 + _1666;
    float _1670 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1672 = _1532 + _1670;
    float _1674 = fma(_1664, _1660, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1676 = fma(_1668, _1660, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1678 = fma(_1672, _1660, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1680 = -_1108;
    float _1682 = _1680 + _1674;
    float _1684 = -_1114;
    float _1686 = _1684 + _1676;
    float _1688 = -_1134;
    float _1690 = _1688 + _1678;
    float _1692 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1694 = _1682 + _1692;
    float _1696 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1698 = _1686 + _1696;
    float _1700 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1702 = _1690 + _1700;
    float _1704 = _1694 * _1694;
    float _1706 = fma(_1698, _1698, _1704);
    float _1708 = fma(_1702, _1702, _1706);
    float _1710 = rsqrt(_1708);
    float _1712 = _1710 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1714 = _1698 * _1712;
    float _1716 = _1702 * _1712;
    float _1718 = _1714 * _1714;
    float _1720 = _1716 * _1716;
    float _1722 = _1718 + _1720;
    float _1724 = sqrt(_1722);
    bool _1726 = _1724 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1728 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1730 = _1724 + _1728;
    float _1732 = _1710;
    float _1734 = _1730;
    float _1736 = _1694;
    float _1738 = _1712;
    float _1740 = _1714;
    if (_1726)
    {
        float _1742 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1732 = _1742;
    }
    float _1744 = _1732;
    if (_1726)
    {
        float _1746 = rsqrt(_1722);
        _1474 = _1746;
    }
    float _1748 = _1474;
    float _1750 = _1748;
    if (_1726)
    {
        float _1752 = _1730 * _1744;
        _1734 = _1752;
    }
    float _1754 = _1734;
    if (_1726)
    {
        float _1756 = _1754 * 0.15915493667125701904296875;
        _1330 = _1756;
    }
    float _1758 = _1330;
    float _1760 = _1744;
    if (_1726)
    {
        float _1762 = _1758 * 6.283185482025146484375;
        float _1764 = sin(_1762);
        _1760 = _1764;
    }
    float _1766 = _1760;
    float _1768 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1770 = precise::max(0.0, _1768);
    float _1772 = _1702;
    float _1774 = _1770;
    if (_1726)
    {
        float _1776 = _1758 * 6.283185482025146484375;
        float _1778 = cos(_1776);
        _1772 = _1778;
    }
    float _1780 = _1772;
    float _1782 = -_1712;
    float _1784 = -_1770;
    float _1786 = fma(_1694, _1782, _1784);
    if (!_1726)
    {
        _1736 = _1716;
    }
    float _1788 = _1736;
    float _1790 = _1788;
    if (_1726)
    {
        float _1792 = _1786 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1774 = _1792;
    }
    float _1794 = _1774;
    float _1796 = sqrt(_1708);
    float _1798 = _1766;
    float _1800 = _1794;
    if (_1726)
    {
        float _1802 = fma(_1766, _1794, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1594 = _1802;
    }
    float _1804 = _1594;
    if (!_1726)
    {
        _1798 = _1786;
    }
    float _1806 = _1798;
    float _1808 = _1806;
    float _1810 = _1780;
    if (_1726)
    {
        float _1812 = _1780 + (-1.0);
        _1800 = _1812;
    }
    float _1814 = _1800;
    float _1816 = _1814;
    if (_1726)
    {
        float _1818 = _1748 * _1804;
        _1738 = _1818;
    }
    float _1820 = _1738;
    float _1822 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1726)
    {
        float _1824 = _1814 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1750 = _1824;
    }
    float _1826 = _1750;
    if (_1726)
    {
        float _1828 = _1714 * _1820;
        _1740 = _1828;
    }
    float _1830 = _1740;
    if (!_1726)
    {
        _1816 = _1718;
    }
    float _1832 = _1816;
    float _1834 = _1832;
    if (_1726)
    {
        float _1836 = _1716 * _1820;
        _1790 = _1836;
    }
    float _1838 = _1790;
    if (_1726)
    {
        float _1840 = fma(_1786, _1780, _1826);
        _1808 = _1840;
    }
    float _1842 = _1808;
    if (_1726)
    {
        float _1844 = _1830 * _1830;
        _1834 = _1844;
    }
    float _1846 = _1834;
    if (!_1726)
    {
        _1810 = _1720;
    }
    float _1848 = _1810;
    float _1850 = _1848;
    if (_1726)
    {
        float _1852 = _1838 * _1838;
        _1850 = _1852;
    }
    float _1854 = _1850;
    float _1856 = fma(_1842, _1842, _1846);
    float _1858 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1822);
    float _1860 = _1856 + _1854;
    float _1862 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1864 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1866 = fma(_1796, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1864);
    float _1868 = precise::clamp(_1866, 0.0, 1.0);
    float _1870 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1872 = rsqrt(_1860);
    float _1874 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1862);
    float _1876 = -_1868;
    float _1878 = _1876 + 1.0;
    float _1880 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1870);
    float _1882 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1884 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1874);
    float _1886 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1888 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1880);
    float _1890 = abs(_1878);
    float _1892 = log2(_1890);
    float _1894 = _1884 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1896 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1886);
    float _1898 = _1888 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1900 = _1894 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1902 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1896);
    float _1904 = _1872 * _1830;
    float _1906 = -_1900;
    float _1908 = fma(_1906, _1882, 1.0);
    float _1910 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1858);
    float _1912 = _1902 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1914 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1916 = _1872 * _1842;
    float _1918 = _1904 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1920 = _1872 * _1838;
    float _1922 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1914);
    float _1924 = _1910 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1926 = -_1918;
    float _1928 = fma(_1916, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1926);
    float _1930 = _1892 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1932 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1922);
    float _1934 = log2(_1908);
    float _1936 = -_1920;
    float _1938 = fma(_1936, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1928);
    float _1940 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1942 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1932);
    float _1944 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1946 = fma(_1938, -0.5, 0.5);
    float _1948 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1940);
    float _1950 = fma(_1938, 0.5, 0.5);
    float _1952 = exp2(_1930);
    float _1954 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1944);
    float _1956 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1948);
    float _1958 = fma(_1950, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1960 = _1916 + 1.0;
    float _1962 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1954);
    float _1964 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1956);
    float _1966 = fma(_1950, _1958, -0.212114393711090087890625);
    float _1968 = 1.0 / _1942;
    float _1970 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1962);
    float _1972 = _1934 * 0.693147182464599609375;
    float _1974 = fma(_1950, _1966, 1.570728778839111328125);
    float _1976 = _1972 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1978 = sqrt(_1946);
    float _1980 = -_1916;
    float _1982 = fma(_1952, _1960, _1980);
    float _1984 = fma(_1982, 0.5, 0.5);
    float _1986 = _1964 * _1968;
    float _1988 = _1970 * _1968;
    float _1990 = fma(_1986, 0.5, 0.5);
    float _1992 = fma(_1988, -0.5, 0.5);
    float _1994 = _1978 * 0.636619746685028076171875;
    float3 _5162 = float3(_1990, _1992, _1976);
    float _1996 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5162, float3(0.0), isnan(_5162)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5162, float3(0.0), isnan(_5162)), level(0.0)).x;
    float3 _5173 = float3(_1990, _1992, _1976);
    float4 _1999 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5173, float3(0.0), isnan(_5173)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5173, float3(0.0), isnan(_5173)), level(0.0)).xyzw;
    float _2001 = _1999.x;
    float _2003 = _1999.y;
    float _2005 = _1999.z;
    float _2007 = _1999.w;
    float _2009 = -_1974;
    float _2011 = fma(_1994, _2009, 1.0);
    float2 _5195 = float2(_2011, _1984);
    float3 _2015 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5195, float2(0.0), isnan(_5195)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5195, float2(0.0), isnan(_5195)), level(0.0)).xyz;
    float _2017 = _2015.x;
    float _2019 = _2015.y;
    float _2021 = _2015.z;
    float _2023 = _1892 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2025 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2027 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2025);
    float _2029 = exp2(_2023);
    float _2031 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2027);
    float _2033 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2031);
    float _2035 = _2033 + _1942;
    float _2037 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1964;
    out.gl_Position.y = _1970;
    out.gl_Position.z = _2033;
    out.gl_Position.w = _1942;
    float _2039 = _2035 * 0.5;
    float _2041 = -_2029;
    float _2043 = _2041 + 1.0;
    out.m_47.x = _2037;
    float _2045 = _2043 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _2039;
    out.m_69.w = _1942;
    float _2047 = _2045 * _1996;
    float _2049 = -_2045;
    float _2051 = _2049 + 1.0;
    float _2053 = _2007 * _2047;
    float _2055 = _2021 * _2047;
    float _2057 = fma(_2017, _2053, _2001);
    float _2059 = fma(_2019, _2053, _2003);
    float _2061 = _2007 * _2051;
    float _2063 = fma(_2007, _2055, _2005);
    out.m_71.x = _2057;
    out.m_71.y = _2059;
    out.m_71.z = _2063;
    out.m_71.w = _2061;
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
    bool _1630 = false;
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
        float _2120 = as_type<float>(_106);
        out.gl_Position.z = _2120;
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
        float _2190 = as_type<float>(_144);
        out.gl_Position.z = _2190;
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
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _316 = _296 + _314;
    bool _318 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _320 = isnan(_296);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _338 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _340 = isnan(_296);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -_312;
    float _352 = _350 + 1.0;
    float _354 = 1.0 / _336;
    float _356 = _348 * _352;
    float _358 = -_348;
    float _360 = _358 + 1.0;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _362;
    bool _366 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _368 = 1.0 / _332;
    float _370 = _328 * _360;
    float _372 = -_328;
    float _374 = _372 + 1.0;
    float _376 = _316 * _354;
    float _378 = _300 * _368;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _384;
    float _388 = fma(_364, _378, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _390 = fma(_382, _378, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _392 = fma(_386, _378, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _394 = _388 * _370;
    float _396 = _390 * _370;
    float _398 = _392 * _370;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _412 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].x, _394);
    float _414 = fma(_402, _376, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _416 = fma(_406, _376, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _418 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].y, _396);
    float _420 = fma(_410, _376, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _422 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].z, _398);
    float _424 = fma(_414, _356, _412);
    float _426 = fma(_416, _356, _418);
    float _428 = fma(_420, _356, _422);
    float _430 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[145].x, _424);
    float _432 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[145].y, _426);
    float _434 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[145].z, _428);
    bool _436 = !_366;
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
    bool _486 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _488 = isnan(_464);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _506 = _464 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _508 = isnan(_464);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = -_480;
    float _520 = _518 + 1.0;
    float _522 = 1.0 / _504;
    float _524 = _516 * _520;
    float _526 = -_516;
    float _528 = _526 + 1.0;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _530;
    bool _534 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _536 = 1.0 / _500;
    float _538 = _496 * _528;
    float _540 = -_496;
    float _542 = _540 + 1.0;
    float _544 = _484 * _522;
    float _546 = _468 * _536;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _548;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _552;
    float _556 = fma(_532, _546, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _558 = fma(_550, _546, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _560 = fma(_554, _546, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _562 = _556 * _538;
    float _564 = _558 * _538;
    float _566 = _560 * _538;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _570 = _568 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _580 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[107].x, _562);
    float _582 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[107].y, _564);
    float _584 = fma(_570, _544, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _586 = fma(_574, _544, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _588 = fma(_578, _544, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _590 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[107].z, _566);
    float _592 = fma(_584, _524, _580);
    float _594 = fma(_586, _524, _582);
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _598 = fma(_588, _524, _590);
    float _600 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[109].x, _592);
    float _602 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[109].y, _594);
    float _604 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[109].z, _598);
    float _606 = _600 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _608 = _602 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _610 = in.m_51.x;
    float _612 = in.m_51.y;
    float _614 = in.m_51.z;
    float _616 = _604 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _618 = _606 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _620 = _608 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _622 = _616 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_55.x = _618;
    out.m_55.y = _620;
    out.m_55.z = _622;
    out.m_55.w = _596;
    float _624 = _434 * _614;
    float _626 = _432 * _612;
    float _628 = _430 * _610;
    bool _630 = !_534;
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
    float _692 = -_674;
    float _694 = _692 + 1.0;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _696;
    float _700 = 1.0 / _678;
    bool _702 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _704 = _690 * _694;
    float _706 = -_690;
    float _708 = _706 + 1.0;
    float _710 = _662 * _700;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _712;
    float _716 = fma(_698, _710, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _718;
    float _722 = fma(_714, _710, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _724 = _716 * _704;
    float _726 = fma(_720, _710, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _728 = _722 * _704;
    float _730 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[123].x, _724);
    float _732 = _726 * _704;
    float _734 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[123].z, _728);
    float _736 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[124].x, _730);
    float _738 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[123].y, _732);
    float _740 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[124].z, _734);
    float _742 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[124].y, _738);
    bool _744 = !_702;
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
    float _776 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _778 = log2(_776);
    float _780 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _782 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _784 = in.m_53.x;
    float _786 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _788 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _780);
    float _790 = in.m_53.y;
    float _792 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _782);
    float _794 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _786);
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _800 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _794);
    float _802 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _788);
    float _804 = _778 * _124;
    int _806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _808 = _806 != 0;
    int _810 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _812 = _810 != 0;
    int _814 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _816 = _814 != 0;
    float _818 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _792);
    float _820 = _802 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _822 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _824 = isnan(0.0);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _830 = _826 || _828;
    float _832 = exp2(_804);
    float _834 = _774 * 2.0;
    float _836 = _818 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _838 = _800 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _840 = _626 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _842 = _784 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _844 = _784 * 2.0;
    float _846 = _624 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _848 = floor(_834);
    float _850 = -_796;
    float _852 = fma(_842, 2.0, _850);
    float _854 = _790 + _774;
    float _856 = _790 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _858 = _790 * 2.0;
    float _860 = _854 + (-1.0);
    float _862 = fma(_856, -2.0, _798);
    float _864 = _784 + _790;
    float _866 = floor(_844);
    float _868 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _872 = 1.0 + _870;
    float _874 = _864 + (-1.0);
    bool _876 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _878 = isnan(1.0);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _884 = _880 || _882;
    float _886 = -_832;
    float _888 = _886 + 1.0;
    bool _890 = _848 > 0.0;
    float _892 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _894 = floor(_858);
    bool _896 = _848 >= 0.0;
    bool _898 = isnan(_848);
    bool _900 = _896 || _898;
    bool _902 = isnan(0.0);
    bool _904 = _900 || _902;
    int _906 = _904 ? 0 : 1;
    float _908 = 1.0 / _872;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _914 = ~_906;
    int _916 = _914 + 1;
    int _918 = _916 + 1;
    float _920 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[78].z, _910);
    float _922 = _830 ? _888 : 0.0;
    float _924 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[78].w, _912);
    bool _926 = _866 > 0.0;
    float _928 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _920);
    int _930 = _918;
    bool _932 = _812;
    float _934 = _836;
    if (!_890)
    {
        int _936 = ~_906;
        int _938 = _936 + 1;
        _930 = _938;
    }
    int _940 = _930;
    float _942 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _924);
    bool _944 = _894 > 0.0;
    float _946 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _862);
    bool _948 = _866 >= 0.0;
    bool _950 = isnan(_866);
    bool _952 = _948 || _950;
    bool _954 = isnan(0.0);
    bool _956 = _952 || _954;
    float _958 = -_124;
    float _960 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[76].x, _852);
    if (_884)
    {
        float _962 = _922 * _908;
        _126 = _962;
    }
    float _964 = _126;
    bool _966 = _894 >= 0.0;
    bool _968 = isnan(_894);
    bool _970 = _966 || _968;
    bool _972 = isnan(0.0);
    bool _974 = _970 || _972;
    float _976 = in.m_57.x;
    float _978 = in.m_57.y;
    float _980 = in.m_57.z;
    bool _982 = !_808;
    int _984 = _982 ? 0 : 1;
    int _986 = _956 ? 0 : 1;
    int _988 = _974 ? 0 : 1;
    int _990 = abs(_984);
    int _992 = ~_986;
    int _994 = _992 + 1;
    int _996 = _994 + 1;
    int _998 = _996;
    if (!_926)
    {
        int _1000 = ~_986;
        int _1002 = _1000 + 1;
        _998 = _1002;
    }
    int _1004 = _998;
    int _1006 = ~_988;
    int _1008 = _1006 + 1;
    int _1010 = _1008 + 1;
    float _1012 = float(_990);
    float _1014 = float(_940);
    int _1016 = _1010;
    if (!_944)
    {
        int _1018 = ~_988;
        int _1020 = _1018 + 1;
        _1016 = _1020;
    }
    int _1022 = _1016;
    float _1024 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1026 = _836 + _1024;
    bool _1028 = !_812;
    int _1030 = _1028 ? 0 : 1;
    float _1032 = _1012 * _1014;
    float _1034 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1036 = _820 + _1034;
    float _1038 = _1026 * _1026;
    int _1040 = abs(_1030);
    float _1042 = _1032 * (-2.0);
    float _1044 = float(_1004);
    float _1046 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1048 = _838 + _1046;
    float _1050 = float(_1040);
    float _1052 = fma(_1036, _1036, _1038);
    float _1054 = fma(_892, _1042, _892);
    float _1056 = fma(_1042, _976, _976);
    bool _1058 = _790 > 0.5;
    float _1060 = fma(_1048, _1048, _1052);
    float _1062 = _1050 * _1044;
    float _1064 = _784 + (-0.5);
    float _1066 = _1062 * (-2.0);
    float _1068 = rsqrt(_1060);
    float _1070 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1056);
    float _1072 = _790 + (-0.5);
    float _1074 = fma(_1066, _978, _978);
    bool _1076 = !_816;
    int _1078 = _1076 ? 0 : 1;
    float _1080 = fma(_868, _1066, _868);
    float _1082 = float(_1022);
    float _1084 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1074);
    float _1086 = _628 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1088 = abs(_1078);
    float _1090 = _784 + _774;
    float _1092 = fma(_1054, _964, _1070);
    float _1094 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1096 = float(_1088);
    float _1098 = _1090 + (-1.0);
    float _1100 = _1094 * _1068;
    float _1102 = fma(_1080, _964, _1084);
    float _1104 = _1096 * _1082;
    float _1106 = _1092 * 0.15915493667125701904296875;
    float _1108 = _1026 * _1100;
    float _1110 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1112 = _1102 * 0.15915493667125701904296875;
    float _1114 = _1036 * _1100;
    float _1116 = -_1108;
    float _1118 = _1026 + _1116;
    float _1120 = _1104 * (-2.0);
    float _1122 = _1106 * 6.283185482025146484375;
    float _1124 = sin(_1122);
    float _1126 = -_1114;
    float _1128 = _1036 + _1126;
    float _1130 = _1118 * _1118;
    float _1132 = fma(_1120, _980, _980);
    float _1134 = _1048 * _1100;
    float _1136 = in.m_59.x;
    float _1138 = in.m_59.y;
    float _1140 = in.m_59.z;
    float _1142 = fma(_1128, _1128, _1130);
    float _1144 = _774 + (-0.5);
    float _1146 = -_1134;
    float _1148 = _1048 + _1146;
    float _1150 = _1106 * 6.283185482025146484375;
    float _1152 = cos(_1150);
    float _1154 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1132);
    float _1156 = fma(_1148, _1148, _1142);
    float _1158 = _1112 * 6.283185482025146484375;
    float _1160 = sin(_1158);
    float _1162 = fma(_1110, _1120, _1110);
    float _1164 = fma(_1162, _964, _1154);
    float _1166 = sqrt(_1156);
    float _1168 = _1164 * 0.15915493667125701904296875;
    float _1170 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1136);
    float _1172 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1140);
    float _1174 = _1112 * 6.283185482025146484375;
    float _1176 = cos(_1174);
    float _1178 = _1152 * _1160;
    float _1180 = _1168 * 6.283185482025146484375;
    float _1182 = sin(_1180);
    float _1184 = _1068 * _1166;
    float _1186 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1138);
    float _1188 = _1124 * _1160;
    float _1190 = _840 * _1184;
    float _1192 = _1086 * _1184;
    float _1194 = _846 * _1184;
    float _1196 = _1168 * 6.283185482025146484375;
    float _1198 = cos(_1196);
    float _1200 = _1124 * _1176;
    float _1202 = _1152 * _1176;
    float _1204 = _1190 * _1186;
    float _1206 = _1192 * _1170;
    float _1208 = _1194 * _1172;
    float _1210 = -_1178;
    float _1212 = fma(_1182, _1200, _1210);
    float _1214 = -_1200;
    float _1216 = fma(_1182, _1178, _1214);
    float _1218 = fma(_1182, _1202, _1188);
    float _1220 = fma(_1182, _1188, _1202);
    float _1222 = -_1204;
    float _1224 = _1182 * _1222;
    float _1226 = in.m_61.x;
    float _1228 = _1160 * _1198;
    float _1230 = _1198 * _1204;
    float _1232 = _1176 * _1198;
    float _1234 = _1152 * _1230;
    float _1236 = _1124 * _1230;
    float _1238 = fma(_1232, _1206, _1224);
    float _1240 = in.m_53.w;
    float _1242 = fma(_1218, _1206, _1234);
    float _1244 = fma(_1212, _1206, _1236);
    float _1246 = fma(_1228, _1208, _1238);
    float _1248 = fma(_1216, _1208, _1242);
    float _1250 = fma(_1220, _1208, _1244);
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1254 = _1252 != 0;
    float _1256 = in.m_61.y;
    float _1258 = _1248 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1260 = _1248 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1264 = _1262 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1268 = _1266 != 0;
    float _1270 = fma(_1246, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1258);
    float _1272 = fma(_1246, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1260);
    float _1274 = 1.0 / _1264;
    int _1276 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1278 = _1276 != 0;
    float _1280 = fma(_1250, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1270);
    float _1282 = fma(_1250, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1272);
    int _1284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1286 = _1284 != 0;
    float _1288 = _820 + _1280;
    float _1290 = _838 + _1282;
    bool _1292 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1294 = isnan(_772);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1300 = _1296 || _1298;
    float _1302 = float(_1300);
    float _1304 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1306 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1308 = _1288 + _1306;
    float _1310 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1312 = _1290 + _1310;
    bool _1314 = _1240 > 0.5;
    float _1316 = _1308 * _1308;
    float _1318 = _1312 * _1312;
    float _1320 = -_1256;
    float _1322 = _1320 + 1.0;
    bool _1324 = _1314;
    float _1326 = _1256;
    int _1328 = as_type<int>(_1246);
    float _1330 = _1114;
    if (_1254)
    {
        bool _1332 = _784 > 0.5;
        _932 = _1332;
    }
    bool _1334 = _932;
    float _1336 = _1316 + _1318;
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1340 = _772 + _1338;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1342;
    int _1346 = _1314 ? as_type<int>(_1322) : as_type<int>(_1256);
    float _1348 = sqrt(_1336);
    float _1350 = _1340;
    if (_1268)
    {
        bool _1352 = _774 > 0.5;
        _1324 = _1352;
    }
    bool _1354 = _1324;
    float _1356 = -_1302;
    float _1358 = _1356 + 1.0;
    bool _1360 = _772 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1362 = isnan(_772);
    bool _1364 = _1360 || _1362;
    bool _1366 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1368 = _1364 || _1366;
    float _1370 = float(_1368);
    float _1372 = _1344 * _1274;
    float _1374 = _1370 * _1358;
    float _1376 = _1286 ? as_type<float>(_1346) : _1256;
    float _1378 = fma(_1372, _1340, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _1380 = as_type<int>(_1374);
    if (_1278)
    {
        float _1382 = _1058 ? _1322 : _1256;
        _1326 = _1382;
    }
    float _1384 = _1326;
    float _1386 = _1304 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1388 = _1248 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1390 = _1378 * _1374;
    float _1392 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1394 = _1348 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1396 = fma(_1386, _1384, -0.5);
    float _1398 = fma(_1246, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1388);
    float _1400 = _1388;
    float _1402 = _1398;
    if (_1268)
    {
        float _1404 = -_1226;
        float _1406 = _1404 + 1.0;
        _1380 = as_type<int>(_1406);
    }
    int _1408 = _1380;
    if (!_1268)
    {
        _1400 = _1226;
    }
    float _1410 = _1400;
    float _1412 = _1410;
    if (_1254)
    {
        float _1414 = -_1226;
        float _1416 = _1414 + 1.0;
        _1328 = as_type<int>(_1416);
    }
    int _1418 = _1328;
    float _1420 = fma(_1250, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1398);
    float _1422 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1424 = as_type<float>(_1418);
    float _1426 = _1420;
    if (_1268)
    {
        float _1428 = _1354 ? as_type<float>(_1408) : _1226;
        _1412 = _1428;
    }
    float _1430 = _1412;
    float _1432 = -_1370;
    float _1434 = _1432 + 1.0;
    float _1436 = _836 + _1420;
    float _1438 = _1434;
    if (!_1254)
    {
        _1350 = _1226;
    }
    float _1440 = _1350;
    float _1442 = _1440;
    if (_1254)
    {
        float _1444 = _1334 ? as_type<float>(_1418) : _1226;
        _1442 = _1444;
    }
    float _1446 = _1442;
    float _1448 = fma(_1434, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1390);
    float _1450 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (!_1394)
    {
        _1402 = _1318;
    }
    float _1452 = _1402;
    float _1454 = _1452;
    if (!_1394)
    {
        _1424 = _1316;
    }
    float _1456 = _1424;
    float _1458 = _1456;
    if (!_1394)
    {
        _1426 = _1288;
    }
    float _1460 = _1426;
    float _1462 = _1460;
    if (!_1394)
    {
        _934 = _1290;
    }
    float _1464 = _934;
    float _1466 = _1464;
    if (!_1394)
    {
        _1438 = _1436;
    }
    float _1468 = _1438;
    bool _1470 = !_1394;
    float _1472 = _1468;
    float _1474 = _1422;
    if (!_1470)
    {
        float _1476 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1478 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1480 = _1348 + _1478;
        float _1482 = _1436 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1484 = rsqrt(_1336);
        float _1486 = _1480 * _1476;
        float _1488 = _1486 * 0.15915493667125701904296875;
        float _1490 = _1488 * 6.283185482025146484375;
        float _1492 = sin(_1490);
        float _1494 = _1488 * 6.283185482025146484375;
        float _1496 = cos(_1494);
        float _1498 = fma(_1492, _1482, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1500 = _1484 * _1498;
        float _1502 = _1496 + (-1.0);
        float _1504 = fma(_1308, _1500, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1506 = fma(_1312, _1500, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1508 = _1502 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1510 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1512 = _1504 + _1510;
        float _1514 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1516 = _1506 + _1514;
        float _1518 = fma(_1436, _1496, _1508);
        float _1520 = _1512 * _1512;
        float _1522 = _1516 * _1516;
        _1472 = _1518;
        _1458 = _1520;
        _1454 = _1522;
        _1462 = _1504;
        _1466 = _1506;
    }
    float _1524 = _1472;
    float _1526 = _1458;
    float _1528 = _1454;
    float _1530 = _1462;
    float _1532 = _1466;
    float _1534 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1536 = _1524 + _1534;
    float _1538 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1540 = fma(_1302, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1448);
    float _1542 = _1376 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1544 = fma(_1536, _1536, _1526);
    float _1546 = fma(_1538, _1446, -0.5);
    float _1548 = -_946;
    float _1550 = fma(_942, _1396, _1548);
    float _1552 = _1430 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1554 = _1544 + _1528;
    float _1556 = fma(_928, _1546, _960);
    float _1558 = _1542 * _1450;
    float _1560 = _736 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1562 = _742 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1564 = _740 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1566 = sqrt(_1554);
    float _1568 = _1552 * _1422;
    float _1570 = _1560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1572 = _1562 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1574 = _1564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1576 = _1550 + 0.5;
    float _1578 = _1540 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1580 = _1556 + 0.5;
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    out.m_65.x = _1570;
    out.m_65.y = _1572;
    out.m_65.z = _1574;
    out.m_65.w = _1578;
    bool _1582 = _1566 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1584 = isnan(_1566);
    bool _1586 = _1582 || _1584;
    bool _1588 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1590 = _1586 || _1588;
    out.m_67.x = _1580;
    out.m_67.y = _1576;
    out.m_67.z = _1568;
    out.m_67.w = _1558;
    float _1592 = _1560;
    float _1594 = _1542;
    if (!_1590)
    {
        _1592 = 1.0;
    }
    float _1596 = _1592;
    bool _1598 = !_1590;
    float _1600 = _1596;
    if (!_1598)
    {
        bool _1602 = _1566 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1604 = isnan(_1566);
        bool _1606 = _1602 || _1604;
        bool _1608 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1610 = _1606 || _1608;
        if (!_1610)
        {
            float _1612 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1614 = _1566 + _1612;
            float _1616 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1618 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1616;
            float _1620 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1622 = _1620 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1624 = 1.0 / _1618;
            float _1626 = _1614 * _1624;
            float _1628 = fma(_1626, _1622, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1600 = _1628;
            _1630 = true;
        }
        else
        {
            bool _1632 = _1566 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1634 = isnan(_1566);
            bool _1636 = _1632 || _1634;
            bool _1638 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1640 = _1636 || _1638;
            if (!_1640)
            {
                float _1642 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1644 = _1566 + _1642;
                float _1646 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1648 = _1646 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1650 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1652 = _1650 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1654 = 1.0 / _1648;
                float _1656 = _1644 * _1654;
                float _1658 = fma(_1656, _1652, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1600 = _1658;
                _1630 = true;
            }
            else
            {
                _1600 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1630 = false;
    float _1660 = _1600;
    float _1662 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1664 = _1524 + _1662;
    float _1666 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1668 = _1530 + _1666;
    float _1670 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1672 = _1532 + _1670;
    float _1674 = fma(_1664, _1660, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1676 = fma(_1668, _1660, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1678 = fma(_1672, _1660, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1680 = -_1108;
    float _1682 = _1680 + _1674;
    float _1684 = -_1114;
    float _1686 = _1684 + _1676;
    float _1688 = -_1134;
    float _1690 = _1688 + _1678;
    float _1692 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1694 = _1682 + _1692;
    float _1696 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1698 = _1686 + _1696;
    float _1700 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1702 = _1690 + _1700;
    float _1704 = _1694 * _1694;
    float _1706 = fma(_1698, _1698, _1704);
    float _1708 = fma(_1702, _1702, _1706);
    float _1710 = rsqrt(_1708);
    float _1712 = _1710 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1714 = _1698 * _1712;
    float _1716 = _1702 * _1712;
    float _1718 = _1714 * _1714;
    float _1720 = _1716 * _1716;
    float _1722 = _1718 + _1720;
    float _1724 = sqrt(_1722);
    bool _1726 = _1724 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1728 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1730 = _1724 + _1728;
    float _1732 = _1710;
    float _1734 = _1730;
    float _1736 = _1694;
    float _1738 = _1712;
    float _1740 = _1714;
    if (_1726)
    {
        float _1742 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1732 = _1742;
    }
    float _1744 = _1732;
    if (_1726)
    {
        float _1746 = rsqrt(_1722);
        _1474 = _1746;
    }
    float _1748 = _1474;
    float _1750 = _1748;
    if (_1726)
    {
        float _1752 = _1730 * _1744;
        _1734 = _1752;
    }
    float _1754 = _1734;
    if (_1726)
    {
        float _1756 = _1754 * 0.15915493667125701904296875;
        _1330 = _1756;
    }
    float _1758 = _1330;
    float _1760 = _1744;
    if (_1726)
    {
        float _1762 = _1758 * 6.283185482025146484375;
        float _1764 = sin(_1762);
        _1760 = _1764;
    }
    float _1766 = _1760;
    float _1768 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1770 = precise::max(0.0, _1768);
    float _1772 = _1702;
    float _1774 = _1770;
    if (_1726)
    {
        float _1776 = _1758 * 6.283185482025146484375;
        float _1778 = cos(_1776);
        _1772 = _1778;
    }
    float _1780 = _1772;
    float _1782 = -_1712;
    float _1784 = -_1770;
    float _1786 = fma(_1694, _1782, _1784);
    if (!_1726)
    {
        _1736 = _1716;
    }
    float _1788 = _1736;
    float _1790 = _1788;
    if (_1726)
    {
        float _1792 = _1786 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1774 = _1792;
    }
    float _1794 = _1774;
    float _1796 = sqrt(_1708);
    float _1798 = _1766;
    float _1800 = _1794;
    if (_1726)
    {
        float _1802 = fma(_1766, _1794, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1594 = _1802;
    }
    float _1804 = _1594;
    if (!_1726)
    {
        _1798 = _1786;
    }
    float _1806 = _1798;
    float _1808 = _1806;
    float _1810 = _1780;
    if (_1726)
    {
        float _1812 = _1780 + (-1.0);
        _1800 = _1812;
    }
    float _1814 = _1800;
    float _1816 = _1814;
    if (_1726)
    {
        float _1818 = _1748 * _1804;
        _1738 = _1818;
    }
    float _1820 = _1738;
    float _1822 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1726)
    {
        float _1824 = _1814 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1750 = _1824;
    }
    float _1826 = _1750;
    if (_1726)
    {
        float _1828 = _1714 * _1820;
        _1740 = _1828;
    }
    float _1830 = _1740;
    if (!_1726)
    {
        _1816 = _1718;
    }
    float _1832 = _1816;
    float _1834 = _1832;
    if (_1726)
    {
        float _1836 = _1716 * _1820;
        _1790 = _1836;
    }
    float _1838 = _1790;
    if (_1726)
    {
        float _1840 = fma(_1786, _1780, _1826);
        _1808 = _1840;
    }
    float _1842 = _1808;
    if (_1726)
    {
        float _1844 = _1830 * _1830;
        _1834 = _1844;
    }
    float _1846 = _1834;
    if (!_1726)
    {
        _1810 = _1720;
    }
    float _1848 = _1810;
    float _1850 = _1848;
    if (_1726)
    {
        float _1852 = _1838 * _1838;
        _1850 = _1852;
    }
    float _1854 = _1850;
    float _1856 = fma(_1842, _1842, _1846);
    float _1858 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1822);
    float _1860 = _1856 + _1854;
    float _1862 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1864 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1866 = fma(_1796, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1864);
    float _1868 = precise::clamp(_1866, 0.0, 1.0);
    float _1870 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1872 = rsqrt(_1860);
    float _1874 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1862);
    float _1876 = -_1868;
    float _1878 = _1876 + 1.0;
    float _1880 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1870);
    float _1882 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1884 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1874);
    float _1886 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1888 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1880);
    float _1890 = abs(_1878);
    float _1892 = log2(_1890);
    float _1894 = _1884 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1896 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1886);
    float _1898 = _1888 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1900 = _1894 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1902 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1896);
    float _1904 = _1872 * _1830;
    float _1906 = -_1900;
    float _1908 = fma(_1906, _1882, 1.0);
    float _1910 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1858);
    float _1912 = _1902 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1914 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1916 = _1872 * _1842;
    float _1918 = _1904 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1920 = _1872 * _1838;
    float _1922 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1914);
    float _1924 = _1910 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1926 = -_1918;
    float _1928 = fma(_1916, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1926);
    float _1930 = _1892 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1932 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1922);
    float _1934 = log2(_1908);
    float _1936 = -_1920;
    float _1938 = fma(_1936, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1928);
    float _1940 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1942 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1932);
    float _1944 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1946 = fma(_1938, -0.5, 0.5);
    float _1948 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1940);
    float _1950 = fma(_1938, 0.5, 0.5);
    float _1952 = exp2(_1930);
    float _1954 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1944);
    float _1956 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1948);
    float _1958 = fma(_1950, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1960 = _1916 + 1.0;
    float _1962 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1954);
    float _1964 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1956);
    float _1966 = fma(_1950, _1958, -0.212114393711090087890625);
    float _1968 = 1.0 / _1942;
    float _1970 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1962);
    float _1972 = _1934 * 0.693147182464599609375;
    float _1974 = fma(_1950, _1966, 1.570728778839111328125);
    float _1976 = _1972 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1978 = sqrt(_1946);
    float _1980 = -_1916;
    float _1982 = fma(_1952, _1960, _1980);
    float _1984 = fma(_1982, 0.5, 0.5);
    float _1986 = _1964 * _1968;
    float _1988 = _1970 * _1968;
    float _1990 = fma(_1986, 0.5, 0.5);
    float _1992 = fma(_1988, -0.5, 0.5);
    float _1994 = _1978 * 0.636619746685028076171875;
    float3 _5162 = float3(_1990, _1992, _1976);
    float _1996 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5162, float3(0.0), isnan(_5162)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5162, float3(0.0), isnan(_5162)), level(0.0)).x;
    float3 _5173 = float3(_1990, _1992, _1976);
    float4 _1999 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5173, float3(0.0), isnan(_5173)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5173, float3(0.0), isnan(_5173)), level(0.0)).xyzw;
    float _2001 = _1999.x;
    float _2003 = _1999.y;
    float _2005 = _1999.z;
    float _2007 = _1999.w;
    float _2009 = -_1974;
    float _2011 = fma(_1994, _2009, 1.0);
    float2 _5195 = float2(_2011, _1984);
    float3 _2015 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5195, float2(0.0), isnan(_5195)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5195, float2(0.0), isnan(_5195)), level(0.0)).xyz;
    float _2017 = _2015.x;
    float _2019 = _2015.y;
    float _2021 = _2015.z;
    float _2023 = _1892 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2025 = _1898 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2027 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2025);
    float _2029 = exp2(_2023);
    float _2031 = fma(_1894, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2027);
    float _2033 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2031);
    float _2035 = _2033 + _1942;
    float _2037 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1964;
    out.gl_Position.y = _1970;
    out.gl_Position.z = _2033;
    out.gl_Position.w = _1942;
    float _2039 = _2035 * 0.5;
    float _2041 = -_2029;
    float _2043 = _2041 + 1.0;
    out.m_47.x = _2037;
    float _2045 = _2043 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _2039;
    out.m_69.w = _1942;
    float _2047 = _2045 * _1996;
    float _2049 = -_2045;
    float _2051 = _2049 + 1.0;
    float _2053 = _2007 * _2047;
    float _2055 = _2021 * _2047;
    float _2057 = fma(_2017, _2053, _2001);
    float _2059 = fma(_2019, _2053, _2003);
    float _2061 = _2007 * _2051;
    float _2063 = fma(_2007, _2055, _2005);
    out.m_71.x = _2057;
    out.m_71.y = _2059;
    out.m_71.z = _2063;
    out.m_71.w = _2061;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

