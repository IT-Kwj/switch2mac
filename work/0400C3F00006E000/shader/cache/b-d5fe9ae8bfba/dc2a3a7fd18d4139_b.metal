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
    float4 m_67 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
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
    float4 m_61 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1740 = false;
    bool _892 = false;
    bool _636 = false;
    bool _414 = false;
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
        float _2406 = as_type<float>(_106);
        out.gl_Position.z = _2406;
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
        float _2476 = as_type<float>(_144);
        out.gl_Position.z = _2476;
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
    bool _302 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _304 = isnan(_296);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _314;
    float _318 = 1.0 / _316;
    bool _320 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _322 = isnan(_296);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _332;
    float _336 = -_312;
    float _338 = _336 + 1.0;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _340;
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _346 = _330 * _338;
    float _348 = -_330;
    float _350 = _348 + 1.0;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _352;
    float _356 = _300 * _318;
    float _358 = in.m_51.x;
    float _360 = in.m_51.y;
    float _362 = in.m_51.z;
    float _364 = fma(_334, _356, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _366 = fma(_354, _356, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _368 = fma(_342, _356, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _370 = _364 * _346;
    float _372 = _366 * _346;
    float _374 = _368 * _346;
    float _376 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[143].x, _370);
    float _378 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[143].y, _372);
    float _380 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[143].z, _374);
    float _382 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].x, _376);
    float _384 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].y, _378);
    float _386 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].z, _380);
    float _388 = _382 * _358;
    float _390 = _384 * _360;
    float _392 = _386 * _362;
    bool _394 = !_344;
    float _412;
    if (!_394)
    {
        float _396 = in.m_53.x;
        float _398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _400 = _396 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _402 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _404 = _402 * _398;
        float _406 = floor(_404);
        float _408 = -_406;
        float _410 = _404 + _408;
        _412 = _410;
        _414 = true;
    }
    else
    {
        float _416 = float(_90);
        float _418 = 1.0 / _416;
        float _420 = _124 * _418;
        _412 = _420;
    }
    _414 = false;
    float _422 = _412;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _426 = _422 + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _430 = _422 + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _434 = _422 + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _436;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _444;
    float _448 = 1.0 / _438;
    bool _450 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _452 = 1.0 / _446;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _454;
    float _458 = 1.0 / _442;
    float _460 = _426 * _448;
    bool _462 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _464 = isnan(_422);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _474;
    float _478 = fma(_456, _460, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _480 = fma(_476, _460, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _482 = _430 * _452;
    bool _484 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _486 = isnan(_422);
    bool _488 = _484 || _486;
    bool _490 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _492 = _488 || _490;
    float _494 = float(_492);
    float _496 = -_472;
    float _498 = _496 + 1.0;
    float _500 = _494 * _498;
    bool _502 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _504 = isnan(_422);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = _434 * _458;
    bool _516 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _518 = isnan(_422);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _528;
    float _532 = -_494;
    float _534 = _532 + 1.0;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _540 = fma(_530, _460, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _542 = -_526;
    float _544 = _542 + 1.0;
    float _546 = _526 * _534;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _556 = _512 * _544;
    float _558 = -_512;
    float _560 = _558 + 1.0;
    float _562 = fma(_538, _514, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _564 = fma(_554, _514, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _566 = _478 * _556;
    float _568 = _480 * _556;
    float _570 = _540 * _556;
    float _572 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[107].x, _566);
    float _574 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[107].y, _568);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _576;
    float _580 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[107].z, _570);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _582;
    float _586 = fma(_550, _514, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _588;
    float _592 = fma(_562, _546, _572);
    float _594 = fma(_578, _482, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _596 = fma(_584, _482, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _598 = fma(_564, _546, _574);
    float _600 = fma(_590, _482, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _602 = fma(_586, _546, _580);
    float _604 = fma(_594, _500, _592);
    float _606 = fma(_596, _500, _598);
    float _608 = fma(_600, _500, _602);
    float _610 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[110].x, _604);
    float _612 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[110].y, _606);
    float _614 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[110].z, _608);
    bool _616 = !_450;
    float _634;
    if (!_616)
    {
        float _618 = in.m_53.x;
        float _620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _622 = _618 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _626 = _624 * _620;
        float _628 = floor(_626);
        float _630 = -_628;
        float _632 = _626 + _630;
        _634 = _632;
        _636 = true;
    }
    else
    {
        float _638 = float(_90);
        float _640 = 1.0 / _638;
        float _642 = _124 * _640;
        _634 = _642;
    }
    _636 = false;
    float _644 = _634;
    float _646 = _610 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _648 = _612 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _654 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _656 = isnan(_644);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _666;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _674 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _676 = isnan(_644);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = 1.0 / _652;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _690 = _688 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _692 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _694 = isnan(_644);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _700 = _696 || _698;
    float _702 = float(_700);
    float _704 = -_684;
    float _706 = _704 + 1.0;
    float _708 = _614 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _710 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _712 = 1.0 / _672;
    float _714 = _702 * _706;
    float _716 = _668 * _686;
    float _718 = -_664;
    float _720 = _718 + 1.0;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _726 = -_702;
    float _728 = _726 + 1.0;
    float _730 = 1.0 / _690;
    float _732 = _684 * _720;
    bool _734 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _736 = isnan(_644);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _748 = _644 + _746;
    bool _750 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _752 = isnan(_644);
    bool _754 = _750 || _752;
    bool _756 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _758 = _754 || _756;
    float _760 = float(_758);
    float _762 = -_744;
    float _764 = _762 + 1.0;
    float _766 = 1.0 / _724;
    float _768 = _744 * _728;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _772 = _770 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _774 = fma(_716, _748, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _776 = _760 * _764;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _780 = _778 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _782 = -_760;
    float _784 = _782 + 1.0;
    float _786 = 1.0 / _772;
    float _788 = _774 * _776;
    float _790 = _780 * _712;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _794 = _644 + _792;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _796;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _802 = _800 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _804 = fma(_790, _794, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _806 = _798 * _730;
    float _808 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[115].x, _788);
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _812 = _644 + _810;
    float _814 = _802 * _766;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _818 = _644 + _816;
    bool _820 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _822 = isnan(_644);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _832;
    float _836 = fma(_806, _812, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _838 = fma(_804, _768, _808);
    float _840 = fma(_814, _818, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _842 = _834 * _786;
    float _844 = -_830;
    float _846 = _844 + 1.0;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _850 = _644 + _848;
    float _852 = fma(_836, _714, _838);
    float _854 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _856 = _664 * _846;
    float _858 = fma(_842, _850, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _860 = fma(_840, _732, _852);
    float _862 = _708 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _864 = fma(_858, _856, _860);
    float _866 = _648 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _868 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[120].x, _864);
    float _870 = _868 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _854;
    out.m_55.y = _866;
    out.m_55.z = _862;
    out.m_55.w = _870;
    bool _872 = !_710;
    float _890;
    if (!_872)
    {
        float _874 = in.m_53.x;
        float _876 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _878 = _874 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _880 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _882 = _880 * _876;
        float _884 = floor(_882);
        float _886 = -_884;
        float _888 = _882 + _886;
        _890 = _888;
        _892 = true;
    }
    else
    {
        float _894 = float(_90);
        float _896 = 1.0 / _894;
        float _898 = _124 * _896;
        _890 = _898;
    }
    _892 = false;
    float _900 = _890;
    float _902 = in.m_53.z;
    float _904 = _390 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _906 = in.m_53.x;
    int _908 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _910 = _908 != 0;
    float _912 = _388 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _916 = _914 != 0;
    float _918 = in.m_53.y;
    float _920 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _922 = log2(_920);
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _926 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _924;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _928;
    float _932 = _902 * 2.0;
    float _934 = _922 * _124;
    float _936 = _906 * 2.0;
    float _938 = floor(_932);
    float _940 = _918 * 2.0;
    float _942 = floor(_936);
    float _944 = floor(_940);
    bool _946 = _938 >= 0.0;
    bool _948 = isnan(_938);
    bool _950 = _946 || _948;
    bool _952 = isnan(0.0);
    bool _954 = _950 || _952;
    int _956 = _954 ? 0 : 1;
    bool _958 = _942 >= 0.0;
    bool _960 = isnan(_942);
    bool _962 = _958 || _960;
    bool _964 = isnan(0.0);
    bool _966 = _962 || _964;
    float _968 = exp2(_934);
    int _970 = _966 ? 0 : 1;
    bool _972 = _944 >= 0.0;
    bool _974 = isnan(_944);
    bool _976 = _972 || _974;
    bool _978 = isnan(0.0);
    bool _980 = _976 || _978;
    int _982 = ~_970;
    int _984 = _982 + 1;
    int _986 = _984 + 1;
    int _988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _990 = _988 != 0;
    int _992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _994 = _992 != 0;
    int _996 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _998 = _996 != 0;
    bool _1000 = _938 > 0.0;
    float _1002 = _906 + _918;
    int _1004 = _980 ? 0 : 1;
    float _1006 = -_968;
    float _1008 = _1006 + 1.0;
    bool _1010 = !_990;
    int _1012 = _1010 ? 0 : 1;
    float _1014 = _1002 + (-1.0);
    bool _1016 = _944 > 0.0;
    float _1018 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1020 = _942 > 0.0;
    float _1022 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1024 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1026 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1018);
    int _1028 = ~_956;
    int _1030 = _1028 + 1;
    int _1032 = _1030 + 1;
    float _1034 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1022);
    int _1036 = _1032;
    int _1038 = _986;
    if (!_1000)
    {
        int _1040 = ~_956;
        int _1042 = _1040 + 1;
        _1036 = _1042;
    }
    int _1044 = _1036;
    float _1046 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1024);
    int _1048 = ~_1004;
    int _1050 = _1048 + 1;
    int _1052 = _1050 + 1;
    float _1054 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1056 = abs(_1012);
    float _1058 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1034);
    int _1060 = _1052;
    if (!_1016)
    {
        int _1062 = ~_1004;
        int _1064 = _1062 + 1;
        _1060 = _1064;
    }
    int _1066 = _1060;
    float _1068 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1046);
    float _1070 = float(_1044);
    float _1072 = in.m_57.x;
    float _1074 = in.m_57.y;
    float _1076 = in.m_57.z;
    bool _1078 = !_994;
    int _1080 = _1078 ? 0 : 1;
    float _1082 = float(_1056);
    float _1084 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1086 = 1.0 + _1084;
    if (!_1020)
    {
        int _1088 = ~_970;
        int _1090 = _1088 + 1;
        _1038 = _1090;
    }
    int _1092 = _1038;
    bool _1094 = !_998;
    int _1096 = _1094 ? 0 : 1;
    float _1098 = 1.0 / _1086;
    int _1100 = abs(_1080);
    float _1102 = _1082 * _1070;
    int _1104 = abs(_1096);
    bool _1106 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1108 = isnan(1.0);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1114 = _1110 || _1112;
    float _1116 = _1102 * (-2.0);
    bool _1118 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1120 = isnan(0.0);
    bool _1122 = _1118 || _1120;
    bool _1124 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1126 = _1122 || _1124;
    float _1128 = float(_1100);
    float _1130 = float(_1092);
    float _1132 = fma(_1116, _1072, _1072);
    float _1134 = _1126 ? _1008 : 0.0;
    float _1136 = in.m_59.x;
    float _1138 = in.m_59.y;
    float _1140 = in.m_59.z;
    float _1142 = _1128 * _1130;
    float _1144 = fma(_1054, _1116, _1054);
    float _1146 = _906 + (-0.5);
    if (_1114)
    {
        float _1148 = _1134 * _1098;
        _126 = _1148;
    }
    float _1150 = _126;
    float _1152 = _1142 * (-2.0);
    float _1154 = float(_1104);
    float _1156 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1132);
    float _1158 = float(_1066);
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1160;
    float _1164 = fma(_1144, _1150, _1156);
    float _1166 = _918 + _902;
    float _1168 = _1154 * _1158;
    bool _1170 = _906 > 0.5;
    bool _1172 = _1170 && _910;
    float _1174 = _906 + _902;
    float _1176 = _1166 + (-1.0);
    float _1178 = _1168 * (-2.0);
    float _1180 = fma(_1152, _1074, _1074);
    bool _1182 = _918 > 0.5;
    float _1184 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1186 = fma(_1178, _1076, _1076);
    float _1188 = 1.0 / _1162;
    float _1190 = fma(_1184, _1152, _1184);
    float _1192 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1140);
    float _1194 = _1174 + (-1.0);
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1196;
    float _1200 = in.m_61.y;
    float _1202 = _918 + (-0.5);
    float _1204 = fma(_1194, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1206 = _902 + (-0.5);
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1210 = _1208 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1212 = 1.0 / _1198;
    float _1214 = fma(_1202, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1180);
    float _1216 = fma(_1204, _1178, _1204);
    float _1218 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1186);
    float _1220 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1138);
    float _1222 = fma(_1190, _1150, _1214);
    float _1224 = _392 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1226 = fma(_1216, _1150, _1218);
    float _1228 = 1.0 / _1210;
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1232 = _900 + _1230;
    float _1234 = _1164 * 0.15915493667125701904296875;
    float _1236 = _1222 * 0.15915493667125701904296875;
    float _1238 = _1226 * 0.15915493667125701904296875;
    float _1240 = _904 * _1220;
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1244 = _900 + _1242;
    float _1246 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1136);
    float _1248 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1026);
    float _1250 = _1232 * _1188;
    float _1252 = _1234 * 6.283185482025146484375;
    float _1254 = sin(_1252);
    float _1256 = _1244 * _1212;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1260 = _900 + _1258;
    float _1262 = -_1200;
    float _1264 = _1262 + 1.0;
    float _1266 = _1224 * _1192;
    float _1268 = _1248 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1270 = _1234 * 6.283185482025146484375;
    float _1272 = cos(_1270);
    float _1274 = _1200;
    float _1276 = _1268;
    if (_916)
    {
        float _1278 = _1182 ? _1264 : _1200;
        _1274 = _1278;
    }
    float _1280 = _1274;
    float _1282 = _912 * _1246;
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1286 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1284;
    float _1288 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1288;
    float _1292 = fma(_1286, _1250, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1294 = _1236 * 6.283185482025146484375;
    float _1296 = sin(_1294);
    float _1298 = _1260 * _1228;
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1302 = _1300 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1304;
    float _1308 = _1236 * 6.283185482025146484375;
    float _1310 = cos(_1308);
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1314 = _1312 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1316 = fma(_1302, _1298, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1318 = fma(_1306, _1250, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1320 = fma(_1314, _1298, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1322 = _1238 * 6.283185482025146484375;
    float _1324 = cos(_1322);
    float _1326 = _1254 * _1296;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1330 = _1328 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1332;
    float _1336 = _1238 * 6.283185482025146484375;
    float _1338 = sin(_1336);
    float _1340 = _1272 * _1310;
    float _1342 = fma(_1330, _1298, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1344 = _1272 * _1296;
    float _1346 = fma(_1334, _1250, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1348 = _1296 * _1324;
    float _1350 = _1324 * _1240;
    float _1352 = _1272 * _1350;
    float _1354 = _1254 * _1310;
    float _1356 = _1310 * _1324;
    float _1358 = fma(_1338, _1340, _1326);
    float _1360 = -_1240;
    float _1362 = _1338 * _1360;
    float _1364 = fma(_1358, _1282, _1352);
    float _1366 = -_1354;
    float _1368 = fma(_1338, _1344, _1366);
    float _1370 = -_1344;
    float _1372 = fma(_1338, _1354, _1370);
    float _1374 = _1254 * _1350;
    float _1376 = fma(_1356, _1282, _1362);
    float _1378 = fma(_1368, _1266, _1364);
    float _1380 = fma(_1338, _1326, _1340);
    float _1382 = fma(_1372, _1282, _1374);
    float _1384 = fma(_1348, _1266, _1376);
    float _1386 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1388 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1390 = fma(_1380, _1266, _1382);
    float _1392 = _1058 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1394 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1386);
    float _1396 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1388);
    float _1398 = in.m_61.x;
    bool _1400 = _900 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1402 = isnan(_900);
    bool _1404 = _1400 || _1402;
    bool _1406 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1408 = _1404 || _1406;
    float _1410 = float(_1408);
    float _1412 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1394);
    float _1414 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1396);
    float _1416 = _1068 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1418 = _900 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1420 = isnan(_900);
    bool _1422 = _1418 || _1420;
    bool _1424 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1426 = _1422 || _1424;
    float _1428 = float(_1426);
    float _1430 = _1412 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1432 = _1414 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _1434 = _900 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1436 = isnan(_900);
    bool _1438 = _1434 || _1436;
    bool _1440 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1442 = _1438 || _1440;
    float _1444 = float(_1442);
    float _1446 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1448 = _1392 + _1430;
    float _1450 = _1416 + _1432;
    bool _1452 = _900 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1454 = isnan(_900);
    bool _1456 = _1452 || _1454;
    bool _1458 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1460 = _1456 || _1458;
    float _1462 = float(_1460);
    float _1464 = -_1410;
    float _1466 = _1464 + 1.0;
    float _1468 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1470 = _1448 + _1468;
    float _1472 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1474 = _1450 + _1472;
    float _1476 = -_1444;
    float _1478 = _1476 + 1.0;
    float _1480 = _1462 * _1466;
    float _1482 = _1470 * _1470;
    float _1484 = _1474 * _1474;
    float _1486 = -_1462;
    float _1488 = _1486 + 1.0;
    float _1490 = _1428 * _1478;
    float _1492 = fma(_926, _1256, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1494 = _1482 + _1484;
    float _1496 = 0.0;
    float _1498 = _1444;
    float _1500 = _1316;
    float _1502 = _1342;
    float _1504 = _1320;
    float _1506 = _1482;
    if (_910)
    {
        _1496 = _1398;
    }
    float _1508 = _1496;
    float _1510 = _1444 * _1488;
    float _1512 = fma(_1290, _1256, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1514 = sqrt(_1494);
    float _1516 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1446);
    float _1518 = _1508;
    if (_1172)
    {
        float _1520 = -_1508;
        float _1522 = _1520 + 1.0;
        _1518 = _1522;
    }
    float _1524 = _1518;
    float _1526 = -_1428;
    float _1528 = _1526 + 1.0;
    float _1530 = _1292 * _1490;
    float _1532 = _1318 * _1490;
    float _1534 = _1346 * _1490;
    if (!_910)
    {
        _1498 = _1398;
    }
    float _1536 = _1498;
    float _1538 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1530);
    float _1540 = _1536;
    if (_910)
    {
        _1540 = _1524;
    }
    float _1542 = _1540;
    float _1544 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1532);
    float _1546 = fma(_930, _1256, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1548 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1516);
    float _1550 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1534);
    float _1552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1554 = fma(_1316, _1510, _1538);
    bool _1556 = _1514 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1558 = _1548 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1560 = fma(_1320, _1510, _1544);
    float _1562 = fma(_1342, _1510, _1550);
    float _1564 = _1268 + _1558;
    float _1566 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1568 = _1544;
    if (!_1556)
    {
        _1500 = _1484;
    }
    float _1570 = _1500;
    float _1572 = _1570;
    if (!_1556)
    {
        _1502 = _1448;
    }
    float _1574 = _1502;
    float _1576 = _1574;
    if (!_1556)
    {
        _1504 = _1450;
    }
    float _1578 = _1504;
    float _1580 = _1578;
    if (!_1556)
    {
        _1568 = _1564;
    }
    float _1582 = _1568;
    bool _1584 = !_1556;
    float _1586 = _1582;
    float _1588 = _1566;
    if (!_1584)
    {
        float _1590 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1592 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1594 = _1514 + _1592;
        float _1596 = _1564 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1598 = rsqrt(_1494);
        float _1600 = _1594 * _1590;
        float _1602 = _1600 * 0.15915493667125701904296875;
        float _1604 = _1602 * 6.283185482025146484375;
        float _1606 = sin(_1604);
        float _1608 = _1602 * 6.283185482025146484375;
        float _1610 = cos(_1608);
        float _1612 = fma(_1606, _1596, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1614 = _1598 * _1612;
        float _1616 = _1610 + (-1.0);
        float _1618 = fma(_1470, _1614, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1620 = fma(_1474, _1614, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1622 = _1616 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1624 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1626 = _1618 + _1624;
        float _1628 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1630 = _1620 + _1628;
        float _1632 = fma(_1564, _1610, _1622);
        float _1634 = _1626 * _1626;
        float _1636 = _1630 * _1630;
        _1586 = _1632;
        _1506 = _1634;
        _1572 = _1636;
        _1576 = _1618;
        _1580 = _1620;
    }
    float _1638 = _1586;
    float _1640 = _1506;
    float _1642 = _1572;
    float _1644 = _1576;
    float _1646 = _1580;
    float _1648 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1650 = _1638 + _1648;
    float _1652 = fma(_1512, _1480, _1554);
    float _1654 = fma(_1492, _1480, _1560);
    float _1656 = fma(_1546, _1480, _1562);
    float _1658 = fma(_1650, _1650, _1640);
    float _1660 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1652);
    float _1662 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1654);
    float _1664 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[126].z, _1656);
    float _1666 = _1658 + _1642;
    float _1668 = _1542 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1670 = _1280 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1672 = _1660 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1674 = _1662 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1676 = _1664 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1678 = sqrt(_1666);
    float _1680 = _1668 * _1552;
    float _1682 = _1670 * _1566;
    float _1684 = _1672 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1686 = _1674 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1688 = _1676 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.x = _1680;
    out.m_63.y = _1682;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    out.m_67.x = _1684;
    out.m_67.y = _1686;
    out.m_67.z = _1688;
    bool _1690 = _1678 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1692 = isnan(_1678);
    bool _1694 = _1690 || _1692;
    bool _1696 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1698 = _1694 || _1696;
    float _1700 = _1684;
    float _1702 = _1686;
    float _1704 = _1674;
    if (!_1698)
    {
        _1588 = 1.0;
    }
    float _1706 = _1588;
    bool _1708 = !_1698;
    float _1710 = _1706;
    if (!_1708)
    {
        bool _1712 = _1678 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1714 = isnan(_1678);
        bool _1716 = _1712 || _1714;
        bool _1718 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1720 = _1716 || _1718;
        if (!_1720)
        {
            float _1722 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1724 = _1678 + _1722;
            float _1726 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1728 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1726;
            float _1730 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1732 = _1730 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1734 = 1.0 / _1728;
            float _1736 = _1724 * _1734;
            float _1738 = fma(_1736, _1732, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1710 = _1738;
            _1740 = true;
        }
        else
        {
            bool _1742 = _1678 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1744 = isnan(_1678);
            bool _1746 = _1742 || _1744;
            bool _1748 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1750 = _1746 || _1748;
            if (!_1750)
            {
                float _1752 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1754 = _1678 + _1752;
                float _1756 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1758 = _1756 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1760 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1762 = _1760 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1764 = 1.0 / _1758;
                float _1766 = _1754 * _1764;
                float _1768 = fma(_1766, _1762, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1710 = _1768;
                _1740 = true;
            }
            else
            {
                _1710 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1740 = false;
    float _1770 = _1710;
    float _1772 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1774 = _1638 + _1772;
    float _1776 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1778 = _1644 + _1776;
    float _1780 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1782 = _1646 + _1780;
    float _1784 = fma(_1774, _1770, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1786 = fma(_1778, _1770, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1788 = fma(_1782, _1770, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1790 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1792 = _1784 + _1790;
    float _1794 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1796 = _1786 + _1794;
    float _1798 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1800 = _1788 + _1798;
    float _1802 = _1792 * _1792;
    float _1804 = fma(_1796, _1796, _1802);
    float _1806 = fma(_1800, _1800, _1804);
    float _1808 = rsqrt(_1806);
    float _1810 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1812 = _1796 * _1810;
    float _1814 = _1800 * _1810;
    float _1816 = _1812 * _1812;
    float _1818 = _1814 * _1814;
    float _1820 = _1816 + _1818;
    float _1822 = sqrt(_1820);
    bool _1824 = _1822 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1826 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1828 = _1822 + _1826;
    float _1830 = _1800;
    float _1832 = _1828;
    float _1834 = _1792;
    float _1836 = _1812;
    if (_1824)
    {
        float _1838 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1830 = _1838;
    }
    float _1840 = _1830;
    if (_1824)
    {
        float _1842 = rsqrt(_1820);
        _1700 = _1842;
    }
    float _1844 = _1700;
    float _1846 = _1844;
    if (_1824)
    {
        float _1848 = _1828 * _1840;
        _1832 = _1848;
    }
    float _1850 = _1832;
    if (_1824)
    {
        float _1852 = _1850 * 0.15915493667125701904296875;
        _1702 = _1852;
    }
    float _1854 = _1702;
    float _1856 = _1840;
    if (_1824)
    {
        float _1858 = _1854 * 6.283185482025146484375;
        float _1860 = sin(_1858);
        _1856 = _1860;
    }
    float _1862 = _1856;
    float _1864 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1866 = precise::max(0.0, _1864);
    float _1868 = _1802;
    float _1870 = _1866;
    if (_1824)
    {
        float _1872 = _1854 * 6.283185482025146484375;
        float _1874 = cos(_1872);
        _1868 = _1874;
    }
    float _1876 = _1868;
    float _1878 = -_1810;
    float _1880 = -_1866;
    float _1882 = fma(_1792, _1878, _1880);
    if (!_1824)
    {
        _1834 = _1814;
    }
    float _1884 = _1834;
    float _1886 = _1884;
    if (_1824)
    {
        float _1888 = _1882 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1870 = _1888;
    }
    float _1890 = _1870;
    float _1892 = sqrt(_1806);
    float _1894 = _1862;
    float _1896 = _1890;
    if (_1824)
    {
        float _1898 = fma(_1862, _1890, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1894 = _1898;
    }
    float _1900 = _1894;
    float _1902 = _1900;
    float _1904 = _1876;
    if (_1824)
    {
        float _1906 = _1876 + (-1.0);
        _1896 = _1906;
    }
    float _1908 = _1896;
    float _1910 = _1908;
    if (_1824)
    {
        float _1912 = _1844 * _1900;
        _1704 = _1912;
    }
    float _1914 = _1704;
    if (!_1824)
    {
        _1902 = _1882;
    }
    float _1916 = _1902;
    float _1918 = _1916;
    if (_1824)
    {
        float _1920 = _1908 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1846 = _1920;
    }
    float _1922 = _1846;
    if (_1824)
    {
        float _1924 = _1812 * _1914;
        _1836 = _1924;
    }
    float _1926 = _1836;
    if (!_1824)
    {
        _1910 = _1816;
    }
    float _1928 = _1910;
    float _1930 = _1928;
    if (_1824)
    {
        float _1932 = _1814 * _1914;
        _1886 = _1932;
    }
    float _1934 = _1886;
    if (_1824)
    {
        float _1936 = fma(_1882, _1876, _1922);
        _1918 = _1936;
    }
    float _1938 = _1918;
    if (_1824)
    {
        float _1940 = _1926 * _1926;
        _1930 = _1940;
    }
    float _1942 = _1930;
    if (!_1824)
    {
        _1904 = _1818;
    }
    float _1944 = _1904;
    float _1946 = _1944;
    if (_1824)
    {
        float _1948 = _1934 * _1934;
        _1946 = _1948;
    }
    float _1950 = _1946;
    float _1952 = fma(_1938, _1938, _1942);
    float _1954 = _1952 + _1950;
    float _1956 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1958 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1960 = fma(_1892, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1958);
    float _1962 = precise::clamp(_1960, 0.0, 1.0);
    float _1964 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1966 = rsqrt(_1954);
    float _1968 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1956);
    float _1970 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1972 = -_1962;
    float _1974 = _1972 + 1.0;
    float _1976 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1978 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1968);
    float _1980 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1970);
    float _1982 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1984 = _1978 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1986 = abs(_1974);
    float _1988 = log2(_1986);
    float _1990 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1964);
    float _1992 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1980);
    float _1994 = _1984 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1996 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1976);
    float _1998 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1990);
    float _2000 = _1992 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2002 = _1966 * _1926;
    float _2004 = -_1994;
    float _2006 = fma(_2004, _1982, 1.0);
    float _2008 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1996);
    float _2010 = _1998 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2012 = _2000 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2014 = _1966 * _1938;
    float _2016 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2018 = _2008 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2020 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2012);
    float _2022 = _1966 * _1934;
    float _2024 = -_2016;
    float _2026 = fma(_2014, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2024);
    float _2028 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2030 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2020);
    float _2032 = _2000 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2034 = -_2022;
    float _2036 = fma(_2034, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2026);
    float _2038 = exp2(_2028);
    float _2040 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2030);
    float _2042 = _2000 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2044 = fma(_2036, -0.5, 0.5);
    float _2046 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2032);
    float _2048 = fma(_2036, 0.5, 0.5);
    float _2050 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2042);
    float _2052 = _2014 + 1.0;
    float _2054 = log2(_2006);
    float _2056 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2046);
    float _2058 = fma(_2048, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2060 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2050);
    float _2062 = fma(_2048, _2058, -0.212114393711090087890625);
    float _2064 = 1.0 / _2040;
    float _2066 = -_2014;
    float _2068 = fma(_2038, _2052, _2066);
    float _2070 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2056);
    float _2072 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2060);
    float _2074 = fma(_2048, _2062, 1.570728778839111328125);
    float _2076 = fma(_2068, 0.5, 0.5);
    float _2078 = sqrt(_2044);
    float _2080 = _2054 * 0.693147182464599609375;
    float _2082 = _2080 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2084 = _2070 * _2064;
    float _2086 = _2072 * _2064;
    float _2088 = fma(_2084, 0.5, 0.5);
    float _2090 = fma(_2086, -0.5, 0.5);
    float _2092 = _2078 * 0.636619746685028076171875;
    float _2094 = -_2074;
    float _2096 = fma(_2092, _2094, 1.0);
    float3 _5585 = float3(_2088, _2090, _2082);
    float _2098 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5585, float3(0.0), isnan(_5585)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5585, float3(0.0), isnan(_5585)), level(0.0)).x;
    float3 _5596 = float3(_2088, _2090, _2082);
    float4 _2101 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5596, float3(0.0), isnan(_5596)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5596, float3(0.0), isnan(_5596)), level(0.0)).xyzw;
    float _2103 = _2101.x;
    float _2105 = _2101.y;
    float _2107 = _2101.z;
    float _2109 = _2101.w;
    float2 _5613 = float2(_2096, _2076);
    float3 _2113 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5613, float2(0.0), isnan(_5613)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5613, float2(0.0), isnan(_5613)), level(0.0)).xyz;
    float _2115 = _2113.x;
    float _2117 = _2113.y;
    float _2119 = _2113.z;
    float _2121 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2123 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2125 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2121);
    float _2127 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2129 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2125);
    float _2131 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2127);
    float _2133 = _2129 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2135 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2131);
    float _2137 = 1.0 / _2133;
    float _2139 = _2135 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2141 = _2139 + _2133;
    float _2143 = _2141 * _2137;
    float _2145 = _2143 * 0.5;
    float _2147 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2149 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2147);
    bool _2151 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2153 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2155 = _2151 || _2153;
    bool _2157 = isnan(0.5);
    bool _2159 = _2155 || _2157;
    float _2161 = _2000 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2163 = 1.0 / _2149;
    float _2165 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2161);
    float _2167 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2165);
    float _2169 = exp2(_2123);
    float _2171 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2167);
    float _2173 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (_2159)
    {
        _1276 = 1.0;
    }
    float _2175 = _1276;
    float _2177 = _2175;
    if (_2159)
    {
        _2173 = 1.0;
    }
    float _2179 = _2173;
    float _2181 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2183 = _2163 * _2181;
    float _2185 = _2179;
    if (!_2159)
    {
        float _2187 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2189 = _2187 * 0.15915493667125701904296875;
        float _2191 = _2189 * 6.283185482025146484375;
        float _2193 = cos(_2191);
        float _2195 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2197 = _2195 * 0.15915493667125701904296875;
        float _2199 = _2189 * 6.283185482025146484375;
        float _2201 = sin(_2199);
        float _2203 = 1.0 / _2193;
        float _2205 = _2197 * 6.283185482025146484375;
        float _2207 = cos(_2205);
        float _2209 = _2201 * _2203;
        float _2211 = _2197 * 6.283185482025146484375;
        float _2213 = sin(_2211);
        float _2215 = _2207 * _2209;
        float _2217 = 1.0 / _2215;
        float _2219 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2221 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2219;
        float _2223 = 1.0 / _2221;
        float _2225 = _2213 * _2217;
        float _2227 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2229 = fma(_2183, _2225, _2227);
        float _2231 = _2229 * _2223;
        float _2233 = precise::clamp(_2231, 0.0, 1.0);
        _2177 = _2233;
    }
    float _2235 = _2177;
    if (!_2159)
    {
        float _2237 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2239 = _2237 * 0.15915493667125701904296875;
        float _2241 = _2239 * 6.283185482025146484375;
        float _2243 = cos(_2241);
        float _2245 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2247 = _2245 * 0.15915493667125701904296875;
        float _2249 = _2239 * 6.283185482025146484375;
        float _2251 = sin(_2249);
        float _2253 = 1.0 / _2243;
        float _2255 = _2247 * 6.283185482025146484375;
        float _2257 = cos(_2255);
        float _2259 = _2251 * _2253;
        float _2261 = _2247 * 6.283185482025146484375;
        float _2263 = sin(_2261);
        float _2265 = _2257 * _2259;
        float _2267 = 1.0 / _2265;
        float _2269 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2271 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2269;
        float _2273 = 1.0 / _2271;
        float _2275 = _2263 * _2267;
        float _2277 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2279 = fma(_2183, _2275, _2277);
        float _2281 = _2279 * _2273;
        float _2283 = precise::clamp(_2281, 0.0, 1.0);
        float _2285 = -_2283;
        float _2287 = _2285 + 1.0;
        _2185 = _2287;
    }
    float _2289 = _2185;
    float _2291 = -_2169;
    float _2293 = _2291 + 1.0;
    float _2295 = _2235 * _2289;
    float _2297 = _2040 * 0.5;
    bool _2299 = _2235 > 0.0;
    bool _2301 = isnan(_2235);
    bool _2303 = _2299 || _2301;
    bool _2305 = isnan(0.0);
    bool _2307 = _2303 || _2305;
    float _2309 = _2293 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2311 = _2295 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2313 = fma(_2072, -0.5, _2297);
    bool _2315 = _2289 <= 0.0;
    bool _2317 = !_2307;
    bool _2319 = _2315 || _2317;
    float _2321 = _2309 * _2098;
    float _2323 = _2311 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2325 = _2171 + _2040;
    float _2327 = _2070 + _2040;
    float _2329 = _2109 * _2321;
    float _2331 = _2119 * _2321;
    float _2333 = -_2309;
    float _2335 = _2333 + 1.0;
    out.gl_Position.x = _2070;
    out.gl_Position.y = _2072;
    out.gl_Position.z = _2171;
    out.gl_Position.w = _2040;
    float _2337 = _2325 * 0.5;
    float _2339 = _2327 * 0.5;
    out.m_47.x = _2323;
    float _2341 = fma(_2115, _2329, _2103);
    float _2343 = fma(_2117, _2329, _2105);
    float _2345 = _2109 * _2335;
    out.m_69.x = _2339;
    out.m_69.y = _2313;
    out.m_69.z = _2337;
    out.m_69.w = _2040;
    float _2347 = fma(_2109, _2331, _2107);
    out.m_71.x = _2341;
    out.m_71.y = _2343;
    out.m_71.z = _2347;
    out.m_71.w = _2345;
    if (!_2319)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2349 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2349;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1740 = false;
    bool _892 = false;
    bool _636 = false;
    bool _414 = false;
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
        float _2406 = as_type<float>(_106);
        out.gl_Position.z = _2406;
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
        float _2476 = as_type<float>(_144);
        out.gl_Position.z = _2476;
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
    bool _302 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _304 = isnan(_296);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _314;
    float _318 = 1.0 / _316;
    bool _320 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _322 = isnan(_296);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _332;
    float _336 = -_312;
    float _338 = _336 + 1.0;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _340;
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _346 = _330 * _338;
    float _348 = -_330;
    float _350 = _348 + 1.0;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _352;
    float _356 = _300 * _318;
    float _358 = in.m_51.x;
    float _360 = in.m_51.y;
    float _362 = in.m_51.z;
    float _364 = fma(_334, _356, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _366 = fma(_354, _356, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _368 = fma(_342, _356, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _370 = _364 * _346;
    float _372 = _366 * _346;
    float _374 = _368 * _346;
    float _376 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[143].x, _370);
    float _378 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[143].y, _372);
    float _380 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[143].z, _374);
    float _382 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].x, _376);
    float _384 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].y, _378);
    float _386 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].z, _380);
    float _388 = _382 * _358;
    float _390 = _384 * _360;
    float _392 = _386 * _362;
    bool _394 = !_344;
    float _412;
    if (!_394)
    {
        float _396 = in.m_53.x;
        float _398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _400 = _396 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _402 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _404 = _402 * _398;
        float _406 = floor(_404);
        float _408 = -_406;
        float _410 = _404 + _408;
        _412 = _410;
        _414 = true;
    }
    else
    {
        float _416 = float(_90);
        float _418 = 1.0 / _416;
        float _420 = _124 * _418;
        _412 = _420;
    }
    _414 = false;
    float _422 = _412;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _426 = _422 + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _430 = _422 + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _434 = _422 + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _436;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _444;
    float _448 = 1.0 / _438;
    bool _450 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _452 = 1.0 / _446;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _454;
    float _458 = 1.0 / _442;
    float _460 = _426 * _448;
    bool _462 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _464 = isnan(_422);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _474;
    float _478 = fma(_456, _460, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _480 = fma(_476, _460, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _482 = _430 * _452;
    bool _484 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _486 = isnan(_422);
    bool _488 = _484 || _486;
    bool _490 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _492 = _488 || _490;
    float _494 = float(_492);
    float _496 = -_472;
    float _498 = _496 + 1.0;
    float _500 = _494 * _498;
    bool _502 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _504 = isnan(_422);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = _434 * _458;
    bool _516 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _518 = isnan(_422);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _528;
    float _532 = -_494;
    float _534 = _532 + 1.0;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _540 = fma(_530, _460, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _542 = -_526;
    float _544 = _542 + 1.0;
    float _546 = _526 * _534;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _556 = _512 * _544;
    float _558 = -_512;
    float _560 = _558 + 1.0;
    float _562 = fma(_538, _514, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _564 = fma(_554, _514, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _566 = _478 * _556;
    float _568 = _480 * _556;
    float _570 = _540 * _556;
    float _572 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[107].x, _566);
    float _574 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[107].y, _568);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _576;
    float _580 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[107].z, _570);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _582;
    float _586 = fma(_550, _514, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _588;
    float _592 = fma(_562, _546, _572);
    float _594 = fma(_578, _482, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _596 = fma(_584, _482, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _598 = fma(_564, _546, _574);
    float _600 = fma(_590, _482, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _602 = fma(_586, _546, _580);
    float _604 = fma(_594, _500, _592);
    float _606 = fma(_596, _500, _598);
    float _608 = fma(_600, _500, _602);
    float _610 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[110].x, _604);
    float _612 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[110].y, _606);
    float _614 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[110].z, _608);
    bool _616 = !_450;
    float _634;
    if (!_616)
    {
        float _618 = in.m_53.x;
        float _620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _622 = _618 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _626 = _624 * _620;
        float _628 = floor(_626);
        float _630 = -_628;
        float _632 = _626 + _630;
        _634 = _632;
        _636 = true;
    }
    else
    {
        float _638 = float(_90);
        float _640 = 1.0 / _638;
        float _642 = _124 * _640;
        _634 = _642;
    }
    _636 = false;
    float _644 = _634;
    float _646 = _610 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _648 = _612 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _654 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _656 = isnan(_644);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _666;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _674 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _676 = isnan(_644);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = 1.0 / _652;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _690 = _688 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _692 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _694 = isnan(_644);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _700 = _696 || _698;
    float _702 = float(_700);
    float _704 = -_684;
    float _706 = _704 + 1.0;
    float _708 = _614 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _710 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _712 = 1.0 / _672;
    float _714 = _702 * _706;
    float _716 = _668 * _686;
    float _718 = -_664;
    float _720 = _718 + 1.0;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _726 = -_702;
    float _728 = _726 + 1.0;
    float _730 = 1.0 / _690;
    float _732 = _684 * _720;
    bool _734 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _736 = isnan(_644);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _748 = _644 + _746;
    bool _750 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _752 = isnan(_644);
    bool _754 = _750 || _752;
    bool _756 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _758 = _754 || _756;
    float _760 = float(_758);
    float _762 = -_744;
    float _764 = _762 + 1.0;
    float _766 = 1.0 / _724;
    float _768 = _744 * _728;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _772 = _770 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _774 = fma(_716, _748, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _776 = _760 * _764;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _780 = _778 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _782 = -_760;
    float _784 = _782 + 1.0;
    float _786 = 1.0 / _772;
    float _788 = _774 * _776;
    float _790 = _780 * _712;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _794 = _644 + _792;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _796;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _802 = _800 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _804 = fma(_790, _794, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _806 = _798 * _730;
    float _808 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[115].x, _788);
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _812 = _644 + _810;
    float _814 = _802 * _766;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _818 = _644 + _816;
    bool _820 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _822 = isnan(_644);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _832;
    float _836 = fma(_806, _812, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _838 = fma(_804, _768, _808);
    float _840 = fma(_814, _818, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _842 = _834 * _786;
    float _844 = -_830;
    float _846 = _844 + 1.0;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _850 = _644 + _848;
    float _852 = fma(_836, _714, _838);
    float _854 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _856 = _664 * _846;
    float _858 = fma(_842, _850, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _860 = fma(_840, _732, _852);
    float _862 = _708 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _864 = fma(_858, _856, _860);
    float _866 = _648 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _868 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[120].x, _864);
    float _870 = _868 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _854;
    out.m_55.y = _866;
    out.m_55.z = _862;
    out.m_55.w = _870;
    bool _872 = !_710;
    float _890;
    if (!_872)
    {
        float _874 = in.m_53.x;
        float _876 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _878 = _874 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _880 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _882 = _880 * _876;
        float _884 = floor(_882);
        float _886 = -_884;
        float _888 = _882 + _886;
        _890 = _888;
        _892 = true;
    }
    else
    {
        float _894 = float(_90);
        float _896 = 1.0 / _894;
        float _898 = _124 * _896;
        _890 = _898;
    }
    _892 = false;
    float _900 = _890;
    float _902 = in.m_53.z;
    float _904 = _390 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _906 = in.m_53.x;
    int _908 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _910 = _908 != 0;
    float _912 = _388 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _916 = _914 != 0;
    float _918 = in.m_53.y;
    float _920 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _922 = log2(_920);
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _926 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _924;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _928;
    float _932 = _902 * 2.0;
    float _934 = _922 * _124;
    float _936 = _906 * 2.0;
    float _938 = floor(_932);
    float _940 = _918 * 2.0;
    float _942 = floor(_936);
    float _944 = floor(_940);
    bool _946 = _938 >= 0.0;
    bool _948 = isnan(_938);
    bool _950 = _946 || _948;
    bool _952 = isnan(0.0);
    bool _954 = _950 || _952;
    int _956 = _954 ? 0 : 1;
    bool _958 = _942 >= 0.0;
    bool _960 = isnan(_942);
    bool _962 = _958 || _960;
    bool _964 = isnan(0.0);
    bool _966 = _962 || _964;
    float _968 = exp2(_934);
    int _970 = _966 ? 0 : 1;
    bool _972 = _944 >= 0.0;
    bool _974 = isnan(_944);
    bool _976 = _972 || _974;
    bool _978 = isnan(0.0);
    bool _980 = _976 || _978;
    int _982 = ~_970;
    int _984 = _982 + 1;
    int _986 = _984 + 1;
    int _988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _990 = _988 != 0;
    int _992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _994 = _992 != 0;
    int _996 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _998 = _996 != 0;
    bool _1000 = _938 > 0.0;
    float _1002 = _906 + _918;
    int _1004 = _980 ? 0 : 1;
    float _1006 = -_968;
    float _1008 = _1006 + 1.0;
    bool _1010 = !_990;
    int _1012 = _1010 ? 0 : 1;
    float _1014 = _1002 + (-1.0);
    bool _1016 = _944 > 0.0;
    float _1018 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1020 = _942 > 0.0;
    float _1022 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1024 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1026 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1018);
    int _1028 = ~_956;
    int _1030 = _1028 + 1;
    int _1032 = _1030 + 1;
    float _1034 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1022);
    int _1036 = _1032;
    int _1038 = _986;
    if (!_1000)
    {
        int _1040 = ~_956;
        int _1042 = _1040 + 1;
        _1036 = _1042;
    }
    int _1044 = _1036;
    float _1046 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1024);
    int _1048 = ~_1004;
    int _1050 = _1048 + 1;
    int _1052 = _1050 + 1;
    float _1054 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1056 = abs(_1012);
    float _1058 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1034);
    int _1060 = _1052;
    if (!_1016)
    {
        int _1062 = ~_1004;
        int _1064 = _1062 + 1;
        _1060 = _1064;
    }
    int _1066 = _1060;
    float _1068 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1046);
    float _1070 = float(_1044);
    float _1072 = in.m_57.x;
    float _1074 = in.m_57.y;
    float _1076 = in.m_57.z;
    bool _1078 = !_994;
    int _1080 = _1078 ? 0 : 1;
    float _1082 = float(_1056);
    float _1084 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1086 = 1.0 + _1084;
    if (!_1020)
    {
        int _1088 = ~_970;
        int _1090 = _1088 + 1;
        _1038 = _1090;
    }
    int _1092 = _1038;
    bool _1094 = !_998;
    int _1096 = _1094 ? 0 : 1;
    float _1098 = 1.0 / _1086;
    int _1100 = abs(_1080);
    float _1102 = _1082 * _1070;
    int _1104 = abs(_1096);
    bool _1106 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1108 = isnan(1.0);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1114 = _1110 || _1112;
    float _1116 = _1102 * (-2.0);
    bool _1118 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1120 = isnan(0.0);
    bool _1122 = _1118 || _1120;
    bool _1124 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1126 = _1122 || _1124;
    float _1128 = float(_1100);
    float _1130 = float(_1092);
    float _1132 = fma(_1116, _1072, _1072);
    float _1134 = _1126 ? _1008 : 0.0;
    float _1136 = in.m_59.x;
    float _1138 = in.m_59.y;
    float _1140 = in.m_59.z;
    float _1142 = _1128 * _1130;
    float _1144 = fma(_1054, _1116, _1054);
    float _1146 = _906 + (-0.5);
    if (_1114)
    {
        float _1148 = _1134 * _1098;
        _126 = _1148;
    }
    float _1150 = _126;
    float _1152 = _1142 * (-2.0);
    float _1154 = float(_1104);
    float _1156 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1132);
    float _1158 = float(_1066);
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1160;
    float _1164 = fma(_1144, _1150, _1156);
    float _1166 = _918 + _902;
    float _1168 = _1154 * _1158;
    bool _1170 = _906 > 0.5;
    bool _1172 = _1170 && _910;
    float _1174 = _906 + _902;
    float _1176 = _1166 + (-1.0);
    float _1178 = _1168 * (-2.0);
    float _1180 = fma(_1152, _1074, _1074);
    bool _1182 = _918 > 0.5;
    float _1184 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1186 = fma(_1178, _1076, _1076);
    float _1188 = 1.0 / _1162;
    float _1190 = fma(_1184, _1152, _1184);
    float _1192 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1140);
    float _1194 = _1174 + (-1.0);
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1196;
    float _1200 = in.m_61.y;
    float _1202 = _918 + (-0.5);
    float _1204 = fma(_1194, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1206 = _902 + (-0.5);
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1210 = _1208 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1212 = 1.0 / _1198;
    float _1214 = fma(_1202, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1180);
    float _1216 = fma(_1204, _1178, _1204);
    float _1218 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1186);
    float _1220 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1138);
    float _1222 = fma(_1190, _1150, _1214);
    float _1224 = _392 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1226 = fma(_1216, _1150, _1218);
    float _1228 = 1.0 / _1210;
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1232 = _900 + _1230;
    float _1234 = _1164 * 0.15915493667125701904296875;
    float _1236 = _1222 * 0.15915493667125701904296875;
    float _1238 = _1226 * 0.15915493667125701904296875;
    float _1240 = _904 * _1220;
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1244 = _900 + _1242;
    float _1246 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1136);
    float _1248 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1026);
    float _1250 = _1232 * _1188;
    float _1252 = _1234 * 6.283185482025146484375;
    float _1254 = sin(_1252);
    float _1256 = _1244 * _1212;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1260 = _900 + _1258;
    float _1262 = -_1200;
    float _1264 = _1262 + 1.0;
    float _1266 = _1224 * _1192;
    float _1268 = _1248 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1270 = _1234 * 6.283185482025146484375;
    float _1272 = cos(_1270);
    float _1274 = _1200;
    float _1276 = _1268;
    if (_916)
    {
        float _1278 = _1182 ? _1264 : _1200;
        _1274 = _1278;
    }
    float _1280 = _1274;
    float _1282 = _912 * _1246;
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1286 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1284;
    float _1288 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1288;
    float _1292 = fma(_1286, _1250, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1294 = _1236 * 6.283185482025146484375;
    float _1296 = sin(_1294);
    float _1298 = _1260 * _1228;
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1302 = _1300 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1304;
    float _1308 = _1236 * 6.283185482025146484375;
    float _1310 = cos(_1308);
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1314 = _1312 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1316 = fma(_1302, _1298, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1318 = fma(_1306, _1250, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1320 = fma(_1314, _1298, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1322 = _1238 * 6.283185482025146484375;
    float _1324 = cos(_1322);
    float _1326 = _1254 * _1296;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1330 = _1328 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1332;
    float _1336 = _1238 * 6.283185482025146484375;
    float _1338 = sin(_1336);
    float _1340 = _1272 * _1310;
    float _1342 = fma(_1330, _1298, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1344 = _1272 * _1296;
    float _1346 = fma(_1334, _1250, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1348 = _1296 * _1324;
    float _1350 = _1324 * _1240;
    float _1352 = _1272 * _1350;
    float _1354 = _1254 * _1310;
    float _1356 = _1310 * _1324;
    float _1358 = fma(_1338, _1340, _1326);
    float _1360 = -_1240;
    float _1362 = _1338 * _1360;
    float _1364 = fma(_1358, _1282, _1352);
    float _1366 = -_1354;
    float _1368 = fma(_1338, _1344, _1366);
    float _1370 = -_1344;
    float _1372 = fma(_1338, _1354, _1370);
    float _1374 = _1254 * _1350;
    float _1376 = fma(_1356, _1282, _1362);
    float _1378 = fma(_1368, _1266, _1364);
    float _1380 = fma(_1338, _1326, _1340);
    float _1382 = fma(_1372, _1282, _1374);
    float _1384 = fma(_1348, _1266, _1376);
    float _1386 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1388 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1390 = fma(_1380, _1266, _1382);
    float _1392 = _1058 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1394 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1386);
    float _1396 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1388);
    float _1398 = in.m_61.x;
    bool _1400 = _900 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1402 = isnan(_900);
    bool _1404 = _1400 || _1402;
    bool _1406 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1408 = _1404 || _1406;
    float _1410 = float(_1408);
    float _1412 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1394);
    float _1414 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1396);
    float _1416 = _1068 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1418 = _900 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1420 = isnan(_900);
    bool _1422 = _1418 || _1420;
    bool _1424 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1426 = _1422 || _1424;
    float _1428 = float(_1426);
    float _1430 = _1412 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1432 = _1414 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _1434 = _900 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1436 = isnan(_900);
    bool _1438 = _1434 || _1436;
    bool _1440 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1442 = _1438 || _1440;
    float _1444 = float(_1442);
    float _1446 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1448 = _1392 + _1430;
    float _1450 = _1416 + _1432;
    bool _1452 = _900 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1454 = isnan(_900);
    bool _1456 = _1452 || _1454;
    bool _1458 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1460 = _1456 || _1458;
    float _1462 = float(_1460);
    float _1464 = -_1410;
    float _1466 = _1464 + 1.0;
    float _1468 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1470 = _1448 + _1468;
    float _1472 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1474 = _1450 + _1472;
    float _1476 = -_1444;
    float _1478 = _1476 + 1.0;
    float _1480 = _1462 * _1466;
    float _1482 = _1470 * _1470;
    float _1484 = _1474 * _1474;
    float _1486 = -_1462;
    float _1488 = _1486 + 1.0;
    float _1490 = _1428 * _1478;
    float _1492 = fma(_926, _1256, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1494 = _1482 + _1484;
    float _1496 = 0.0;
    float _1498 = _1444;
    float _1500 = _1316;
    float _1502 = _1342;
    float _1504 = _1320;
    float _1506 = _1482;
    if (_910)
    {
        _1496 = _1398;
    }
    float _1508 = _1496;
    float _1510 = _1444 * _1488;
    float _1512 = fma(_1290, _1256, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1514 = sqrt(_1494);
    float _1516 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1446);
    float _1518 = _1508;
    if (_1172)
    {
        float _1520 = -_1508;
        float _1522 = _1520 + 1.0;
        _1518 = _1522;
    }
    float _1524 = _1518;
    float _1526 = -_1428;
    float _1528 = _1526 + 1.0;
    float _1530 = _1292 * _1490;
    float _1532 = _1318 * _1490;
    float _1534 = _1346 * _1490;
    if (!_910)
    {
        _1498 = _1398;
    }
    float _1536 = _1498;
    float _1538 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1530);
    float _1540 = _1536;
    if (_910)
    {
        _1540 = _1524;
    }
    float _1542 = _1540;
    float _1544 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1532);
    float _1546 = fma(_930, _1256, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1548 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1516);
    float _1550 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1534);
    float _1552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1554 = fma(_1316, _1510, _1538);
    bool _1556 = _1514 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1558 = _1548 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1560 = fma(_1320, _1510, _1544);
    float _1562 = fma(_1342, _1510, _1550);
    float _1564 = _1268 + _1558;
    float _1566 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1568 = _1544;
    if (!_1556)
    {
        _1500 = _1484;
    }
    float _1570 = _1500;
    float _1572 = _1570;
    if (!_1556)
    {
        _1502 = _1448;
    }
    float _1574 = _1502;
    float _1576 = _1574;
    if (!_1556)
    {
        _1504 = _1450;
    }
    float _1578 = _1504;
    float _1580 = _1578;
    if (!_1556)
    {
        _1568 = _1564;
    }
    float _1582 = _1568;
    bool _1584 = !_1556;
    float _1586 = _1582;
    float _1588 = _1566;
    if (!_1584)
    {
        float _1590 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1592 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1594 = _1514 + _1592;
        float _1596 = _1564 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1598 = rsqrt(_1494);
        float _1600 = _1594 * _1590;
        float _1602 = _1600 * 0.15915493667125701904296875;
        float _1604 = _1602 * 6.283185482025146484375;
        float _1606 = sin(_1604);
        float _1608 = _1602 * 6.283185482025146484375;
        float _1610 = cos(_1608);
        float _1612 = fma(_1606, _1596, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1614 = _1598 * _1612;
        float _1616 = _1610 + (-1.0);
        float _1618 = fma(_1470, _1614, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1620 = fma(_1474, _1614, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1622 = _1616 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1624 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1626 = _1618 + _1624;
        float _1628 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1630 = _1620 + _1628;
        float _1632 = fma(_1564, _1610, _1622);
        float _1634 = _1626 * _1626;
        float _1636 = _1630 * _1630;
        _1586 = _1632;
        _1506 = _1634;
        _1572 = _1636;
        _1576 = _1618;
        _1580 = _1620;
    }
    float _1638 = _1586;
    float _1640 = _1506;
    float _1642 = _1572;
    float _1644 = _1576;
    float _1646 = _1580;
    float _1648 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1650 = _1638 + _1648;
    float _1652 = fma(_1512, _1480, _1554);
    float _1654 = fma(_1492, _1480, _1560);
    float _1656 = fma(_1546, _1480, _1562);
    float _1658 = fma(_1650, _1650, _1640);
    float _1660 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1652);
    float _1662 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1654);
    float _1664 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[126].z, _1656);
    float _1666 = _1658 + _1642;
    float _1668 = _1542 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1670 = _1280 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1672 = _1660 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1674 = _1662 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1676 = _1664 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1678 = sqrt(_1666);
    float _1680 = _1668 * _1552;
    float _1682 = _1670 * _1566;
    float _1684 = _1672 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1686 = _1674 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1688 = _1676 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.x = _1680;
    out.m_63.y = _1682;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    out.m_67.x = _1684;
    out.m_67.y = _1686;
    out.m_67.z = _1688;
    bool _1690 = _1678 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1692 = isnan(_1678);
    bool _1694 = _1690 || _1692;
    bool _1696 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1698 = _1694 || _1696;
    float _1700 = _1684;
    float _1702 = _1686;
    float _1704 = _1674;
    if (!_1698)
    {
        _1588 = 1.0;
    }
    float _1706 = _1588;
    bool _1708 = !_1698;
    float _1710 = _1706;
    if (!_1708)
    {
        bool _1712 = _1678 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1714 = isnan(_1678);
        bool _1716 = _1712 || _1714;
        bool _1718 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1720 = _1716 || _1718;
        if (!_1720)
        {
            float _1722 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1724 = _1678 + _1722;
            float _1726 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1728 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1726;
            float _1730 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1732 = _1730 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1734 = 1.0 / _1728;
            float _1736 = _1724 * _1734;
            float _1738 = fma(_1736, _1732, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1710 = _1738;
            _1740 = true;
        }
        else
        {
            bool _1742 = _1678 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1744 = isnan(_1678);
            bool _1746 = _1742 || _1744;
            bool _1748 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1750 = _1746 || _1748;
            if (!_1750)
            {
                float _1752 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1754 = _1678 + _1752;
                float _1756 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1758 = _1756 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1760 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1762 = _1760 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1764 = 1.0 / _1758;
                float _1766 = _1754 * _1764;
                float _1768 = fma(_1766, _1762, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1710 = _1768;
                _1740 = true;
            }
            else
            {
                _1710 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1740 = false;
    float _1770 = _1710;
    float _1772 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1774 = _1638 + _1772;
    float _1776 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1778 = _1644 + _1776;
    float _1780 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1782 = _1646 + _1780;
    float _1784 = fma(_1774, _1770, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1786 = fma(_1778, _1770, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1788 = fma(_1782, _1770, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1790 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1792 = _1784 + _1790;
    float _1794 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1796 = _1786 + _1794;
    float _1798 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1800 = _1788 + _1798;
    float _1802 = _1792 * _1792;
    float _1804 = fma(_1796, _1796, _1802);
    float _1806 = fma(_1800, _1800, _1804);
    float _1808 = rsqrt(_1806);
    float _1810 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1812 = _1796 * _1810;
    float _1814 = _1800 * _1810;
    float _1816 = _1812 * _1812;
    float _1818 = _1814 * _1814;
    float _1820 = _1816 + _1818;
    float _1822 = sqrt(_1820);
    bool _1824 = _1822 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1826 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1828 = _1822 + _1826;
    float _1830 = _1800;
    float _1832 = _1828;
    float _1834 = _1792;
    float _1836 = _1812;
    if (_1824)
    {
        float _1838 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1830 = _1838;
    }
    float _1840 = _1830;
    if (_1824)
    {
        float _1842 = rsqrt(_1820);
        _1700 = _1842;
    }
    float _1844 = _1700;
    float _1846 = _1844;
    if (_1824)
    {
        float _1848 = _1828 * _1840;
        _1832 = _1848;
    }
    float _1850 = _1832;
    if (_1824)
    {
        float _1852 = _1850 * 0.15915493667125701904296875;
        _1702 = _1852;
    }
    float _1854 = _1702;
    float _1856 = _1840;
    if (_1824)
    {
        float _1858 = _1854 * 6.283185482025146484375;
        float _1860 = sin(_1858);
        _1856 = _1860;
    }
    float _1862 = _1856;
    float _1864 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1866 = precise::max(0.0, _1864);
    float _1868 = _1802;
    float _1870 = _1866;
    if (_1824)
    {
        float _1872 = _1854 * 6.283185482025146484375;
        float _1874 = cos(_1872);
        _1868 = _1874;
    }
    float _1876 = _1868;
    float _1878 = -_1810;
    float _1880 = -_1866;
    float _1882 = fma(_1792, _1878, _1880);
    if (!_1824)
    {
        _1834 = _1814;
    }
    float _1884 = _1834;
    float _1886 = _1884;
    if (_1824)
    {
        float _1888 = _1882 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1870 = _1888;
    }
    float _1890 = _1870;
    float _1892 = sqrt(_1806);
    float _1894 = _1862;
    float _1896 = _1890;
    if (_1824)
    {
        float _1898 = fma(_1862, _1890, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1894 = _1898;
    }
    float _1900 = _1894;
    float _1902 = _1900;
    float _1904 = _1876;
    if (_1824)
    {
        float _1906 = _1876 + (-1.0);
        _1896 = _1906;
    }
    float _1908 = _1896;
    float _1910 = _1908;
    if (_1824)
    {
        float _1912 = _1844 * _1900;
        _1704 = _1912;
    }
    float _1914 = _1704;
    if (!_1824)
    {
        _1902 = _1882;
    }
    float _1916 = _1902;
    float _1918 = _1916;
    if (_1824)
    {
        float _1920 = _1908 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1846 = _1920;
    }
    float _1922 = _1846;
    if (_1824)
    {
        float _1924 = _1812 * _1914;
        _1836 = _1924;
    }
    float _1926 = _1836;
    if (!_1824)
    {
        _1910 = _1816;
    }
    float _1928 = _1910;
    float _1930 = _1928;
    if (_1824)
    {
        float _1932 = _1814 * _1914;
        _1886 = _1932;
    }
    float _1934 = _1886;
    if (_1824)
    {
        float _1936 = fma(_1882, _1876, _1922);
        _1918 = _1936;
    }
    float _1938 = _1918;
    if (_1824)
    {
        float _1940 = _1926 * _1926;
        _1930 = _1940;
    }
    float _1942 = _1930;
    if (!_1824)
    {
        _1904 = _1818;
    }
    float _1944 = _1904;
    float _1946 = _1944;
    if (_1824)
    {
        float _1948 = _1934 * _1934;
        _1946 = _1948;
    }
    float _1950 = _1946;
    float _1952 = fma(_1938, _1938, _1942);
    float _1954 = _1952 + _1950;
    float _1956 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1958 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1960 = fma(_1892, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1958);
    float _1962 = precise::clamp(_1960, 0.0, 1.0);
    float _1964 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1966 = rsqrt(_1954);
    float _1968 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1956);
    float _1970 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1972 = -_1962;
    float _1974 = _1972 + 1.0;
    float _1976 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1978 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1968);
    float _1980 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1970);
    float _1982 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1984 = _1978 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1986 = abs(_1974);
    float _1988 = log2(_1986);
    float _1990 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1964);
    float _1992 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1980);
    float _1994 = _1984 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1996 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1976);
    float _1998 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1990);
    float _2000 = _1992 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2002 = _1966 * _1926;
    float _2004 = -_1994;
    float _2006 = fma(_2004, _1982, 1.0);
    float _2008 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1996);
    float _2010 = _1998 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2012 = _2000 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2014 = _1966 * _1938;
    float _2016 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2018 = _2008 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2020 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2012);
    float _2022 = _1966 * _1934;
    float _2024 = -_2016;
    float _2026 = fma(_2014, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2024);
    float _2028 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2030 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2020);
    float _2032 = _2000 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2034 = -_2022;
    float _2036 = fma(_2034, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2026);
    float _2038 = exp2(_2028);
    float _2040 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2030);
    float _2042 = _2000 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2044 = fma(_2036, -0.5, 0.5);
    float _2046 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2032);
    float _2048 = fma(_2036, 0.5, 0.5);
    float _2050 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2042);
    float _2052 = _2014 + 1.0;
    float _2054 = log2(_2006);
    float _2056 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2046);
    float _2058 = fma(_2048, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2060 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2050);
    float _2062 = fma(_2048, _2058, -0.212114393711090087890625);
    float _2064 = 1.0 / _2040;
    float _2066 = -_2014;
    float _2068 = fma(_2038, _2052, _2066);
    float _2070 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2056);
    float _2072 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2060);
    float _2074 = fma(_2048, _2062, 1.570728778839111328125);
    float _2076 = fma(_2068, 0.5, 0.5);
    float _2078 = sqrt(_2044);
    float _2080 = _2054 * 0.693147182464599609375;
    float _2082 = _2080 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2084 = _2070 * _2064;
    float _2086 = _2072 * _2064;
    float _2088 = fma(_2084, 0.5, 0.5);
    float _2090 = fma(_2086, -0.5, 0.5);
    float _2092 = _2078 * 0.636619746685028076171875;
    float _2094 = -_2074;
    float _2096 = fma(_2092, _2094, 1.0);
    float3 _5585 = float3(_2088, _2090, _2082);
    float _2098 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5585, float3(0.0), isnan(_5585)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5585, float3(0.0), isnan(_5585)), level(0.0)).x;
    float3 _5596 = float3(_2088, _2090, _2082);
    float4 _2101 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5596, float3(0.0), isnan(_5596)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5596, float3(0.0), isnan(_5596)), level(0.0)).xyzw;
    float _2103 = _2101.x;
    float _2105 = _2101.y;
    float _2107 = _2101.z;
    float _2109 = _2101.w;
    float2 _5613 = float2(_2096, _2076);
    float3 _2113 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5613, float2(0.0), isnan(_5613)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5613, float2(0.0), isnan(_5613)), level(0.0)).xyz;
    float _2115 = _2113.x;
    float _2117 = _2113.y;
    float _2119 = _2113.z;
    float _2121 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2123 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2125 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2121);
    float _2127 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2129 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2125);
    float _2131 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2127);
    float _2133 = _2129 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2135 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2131);
    float _2137 = 1.0 / _2133;
    float _2139 = _2135 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2141 = _2139 + _2133;
    float _2143 = _2141 * _2137;
    float _2145 = _2143 * 0.5;
    float _2147 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2149 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2147);
    bool _2151 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2153 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2155 = _2151 || _2153;
    bool _2157 = isnan(0.5);
    bool _2159 = _2155 || _2157;
    float _2161 = _2000 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2163 = 1.0 / _2149;
    float _2165 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2161);
    float _2167 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2165);
    float _2169 = exp2(_2123);
    float _2171 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2167);
    float _2173 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (_2159)
    {
        _1276 = 1.0;
    }
    float _2175 = _1276;
    float _2177 = _2175;
    if (_2159)
    {
        _2173 = 1.0;
    }
    float _2179 = _2173;
    float _2181 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2183 = _2163 * _2181;
    float _2185 = _2179;
    if (!_2159)
    {
        float _2187 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2189 = _2187 * 0.15915493667125701904296875;
        float _2191 = _2189 * 6.283185482025146484375;
        float _2193 = cos(_2191);
        float _2195 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2197 = _2195 * 0.15915493667125701904296875;
        float _2199 = _2189 * 6.283185482025146484375;
        float _2201 = sin(_2199);
        float _2203 = 1.0 / _2193;
        float _2205 = _2197 * 6.283185482025146484375;
        float _2207 = cos(_2205);
        float _2209 = _2201 * _2203;
        float _2211 = _2197 * 6.283185482025146484375;
        float _2213 = sin(_2211);
        float _2215 = _2207 * _2209;
        float _2217 = 1.0 / _2215;
        float _2219 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2221 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2219;
        float _2223 = 1.0 / _2221;
        float _2225 = _2213 * _2217;
        float _2227 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2229 = fma(_2183, _2225, _2227);
        float _2231 = _2229 * _2223;
        float _2233 = precise::clamp(_2231, 0.0, 1.0);
        _2177 = _2233;
    }
    float _2235 = _2177;
    if (!_2159)
    {
        float _2237 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2239 = _2237 * 0.15915493667125701904296875;
        float _2241 = _2239 * 6.283185482025146484375;
        float _2243 = cos(_2241);
        float _2245 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2247 = _2245 * 0.15915493667125701904296875;
        float _2249 = _2239 * 6.283185482025146484375;
        float _2251 = sin(_2249);
        float _2253 = 1.0 / _2243;
        float _2255 = _2247 * 6.283185482025146484375;
        float _2257 = cos(_2255);
        float _2259 = _2251 * _2253;
        float _2261 = _2247 * 6.283185482025146484375;
        float _2263 = sin(_2261);
        float _2265 = _2257 * _2259;
        float _2267 = 1.0 / _2265;
        float _2269 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2271 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2269;
        float _2273 = 1.0 / _2271;
        float _2275 = _2263 * _2267;
        float _2277 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2279 = fma(_2183, _2275, _2277);
        float _2281 = _2279 * _2273;
        float _2283 = precise::clamp(_2281, 0.0, 1.0);
        float _2285 = -_2283;
        float _2287 = _2285 + 1.0;
        _2185 = _2287;
    }
    float _2289 = _2185;
    float _2291 = -_2169;
    float _2293 = _2291 + 1.0;
    float _2295 = _2235 * _2289;
    float _2297 = _2040 * 0.5;
    bool _2299 = _2235 > 0.0;
    bool _2301 = isnan(_2235);
    bool _2303 = _2299 || _2301;
    bool _2305 = isnan(0.0);
    bool _2307 = _2303 || _2305;
    float _2309 = _2293 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2311 = _2295 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2313 = fma(_2072, -0.5, _2297);
    bool _2315 = _2289 <= 0.0;
    bool _2317 = !_2307;
    bool _2319 = _2315 || _2317;
    float _2321 = _2309 * _2098;
    float _2323 = _2311 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2325 = _2171 + _2040;
    float _2327 = _2070 + _2040;
    float _2329 = _2109 * _2321;
    float _2331 = _2119 * _2321;
    float _2333 = -_2309;
    float _2335 = _2333 + 1.0;
    out.gl_Position.x = _2070;
    out.gl_Position.y = _2072;
    out.gl_Position.z = _2171;
    out.gl_Position.w = _2040;
    float _2337 = _2325 * 0.5;
    float _2339 = _2327 * 0.5;
    out.m_47.x = _2323;
    float _2341 = fma(_2115, _2329, _2103);
    float _2343 = fma(_2117, _2329, _2105);
    float _2345 = _2109 * _2335;
    out.m_69.x = _2339;
    out.m_69.y = _2313;
    out.m_69.z = _2337;
    out.m_69.w = _2040;
    float _2347 = fma(_2109, _2331, _2107);
    out.m_71.x = _2341;
    out.m_71.y = _2343;
    out.m_71.z = _2347;
    out.m_71.w = _2345;
    if (!_2319)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2349 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2349;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1740 = false;
    bool _892 = false;
    bool _636 = false;
    bool _414 = false;
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
        float _2406 = as_type<float>(_106);
        out.gl_Position.z = _2406;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2476 = as_type<float>(_144);
        out.gl_Position.z = _2476;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    bool _302 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _304 = isnan(_296);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _314;
    float _318 = 1.0 / _316;
    bool _320 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _322 = isnan(_296);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _332;
    float _336 = -_312;
    float _338 = _336 + 1.0;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _340;
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _346 = _330 * _338;
    float _348 = -_330;
    float _350 = _348 + 1.0;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _352;
    float _356 = _300 * _318;
    float _358 = in.m_51.x;
    float _360 = in.m_51.y;
    float _362 = in.m_51.z;
    float _364 = fma(_334, _356, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _366 = fma(_354, _356, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _368 = fma(_342, _356, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _370 = _364 * _346;
    float _372 = _366 * _346;
    float _374 = _368 * _346;
    float _376 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[143].x, _370);
    float _378 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[143].y, _372);
    float _380 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[143].z, _374);
    float _382 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].x, _376);
    float _384 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].y, _378);
    float _386 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].z, _380);
    float _388 = _382 * _358;
    float _390 = _384 * _360;
    float _392 = _386 * _362;
    bool _394 = !_344;
    float _412;
    if (!_394)
    {
        float _396 = in.m_53.x;
        float _398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _400 = _396 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _402 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _404 = _402 * _398;
        float _406 = floor(_404);
        float _408 = -_406;
        float _410 = _404 + _408;
        _412 = _410;
        _414 = true;
    }
    else
    {
        float _416 = float(_90);
        float _418 = 1.0 / _416;
        float _420 = _124 * _418;
        _412 = _420;
    }
    _414 = false;
    float _422 = _412;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _426 = _422 + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _430 = _422 + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _434 = _422 + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _436;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _444;
    float _448 = 1.0 / _438;
    bool _450 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _452 = 1.0 / _446;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _454;
    float _458 = 1.0 / _442;
    float _460 = _426 * _448;
    bool _462 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _464 = isnan(_422);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _474;
    float _478 = fma(_456, _460, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _480 = fma(_476, _460, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _482 = _430 * _452;
    bool _484 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _486 = isnan(_422);
    bool _488 = _484 || _486;
    bool _490 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _492 = _488 || _490;
    float _494 = float(_492);
    float _496 = -_472;
    float _498 = _496 + 1.0;
    float _500 = _494 * _498;
    bool _502 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _504 = isnan(_422);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = _434 * _458;
    bool _516 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _518 = isnan(_422);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _528;
    float _532 = -_494;
    float _534 = _532 + 1.0;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _540 = fma(_530, _460, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _542 = -_526;
    float _544 = _542 + 1.0;
    float _546 = _526 * _534;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _556 = _512 * _544;
    float _558 = -_512;
    float _560 = _558 + 1.0;
    float _562 = fma(_538, _514, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _564 = fma(_554, _514, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _566 = _478 * _556;
    float _568 = _480 * _556;
    float _570 = _540 * _556;
    float _572 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[107].x, _566);
    float _574 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[107].y, _568);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _576;
    float _580 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[107].z, _570);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _582;
    float _586 = fma(_550, _514, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _588;
    float _592 = fma(_562, _546, _572);
    float _594 = fma(_578, _482, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _596 = fma(_584, _482, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _598 = fma(_564, _546, _574);
    float _600 = fma(_590, _482, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _602 = fma(_586, _546, _580);
    float _604 = fma(_594, _500, _592);
    float _606 = fma(_596, _500, _598);
    float _608 = fma(_600, _500, _602);
    float _610 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[110].x, _604);
    float _612 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[110].y, _606);
    float _614 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[110].z, _608);
    bool _616 = !_450;
    float _634;
    if (!_616)
    {
        float _618 = in.m_53.x;
        float _620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _622 = _618 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _626 = _624 * _620;
        float _628 = floor(_626);
        float _630 = -_628;
        float _632 = _626 + _630;
        _634 = _632;
        _636 = true;
    }
    else
    {
        float _638 = float(_90);
        float _640 = 1.0 / _638;
        float _642 = _124 * _640;
        _634 = _642;
    }
    _636 = false;
    float _644 = _634;
    float _646 = _610 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _648 = _612 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _654 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _656 = isnan(_644);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _666;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _674 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _676 = isnan(_644);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = 1.0 / _652;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _690 = _688 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _692 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _694 = isnan(_644);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _700 = _696 || _698;
    float _702 = float(_700);
    float _704 = -_684;
    float _706 = _704 + 1.0;
    float _708 = _614 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _710 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _712 = 1.0 / _672;
    float _714 = _702 * _706;
    float _716 = _668 * _686;
    float _718 = -_664;
    float _720 = _718 + 1.0;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _726 = -_702;
    float _728 = _726 + 1.0;
    float _730 = 1.0 / _690;
    float _732 = _684 * _720;
    bool _734 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _736 = isnan(_644);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _748 = _644 + _746;
    bool _750 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _752 = isnan(_644);
    bool _754 = _750 || _752;
    bool _756 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _758 = _754 || _756;
    float _760 = float(_758);
    float _762 = -_744;
    float _764 = _762 + 1.0;
    float _766 = 1.0 / _724;
    float _768 = _744 * _728;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _772 = _770 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _774 = fma(_716, _748, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _776 = _760 * _764;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _780 = _778 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _782 = -_760;
    float _784 = _782 + 1.0;
    float _786 = 1.0 / _772;
    float _788 = _774 * _776;
    float _790 = _780 * _712;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _794 = _644 + _792;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _796;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _802 = _800 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _804 = fma(_790, _794, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _806 = _798 * _730;
    float _808 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[115].x, _788);
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _812 = _644 + _810;
    float _814 = _802 * _766;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _818 = _644 + _816;
    bool _820 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _822 = isnan(_644);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _832;
    float _836 = fma(_806, _812, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _838 = fma(_804, _768, _808);
    float _840 = fma(_814, _818, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _842 = _834 * _786;
    float _844 = -_830;
    float _846 = _844 + 1.0;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _850 = _644 + _848;
    float _852 = fma(_836, _714, _838);
    float _854 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _856 = _664 * _846;
    float _858 = fma(_842, _850, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _860 = fma(_840, _732, _852);
    float _862 = _708 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _864 = fma(_858, _856, _860);
    float _866 = _648 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _868 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[120].x, _864);
    float _870 = _868 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _854;
    out.m_55.y = _866;
    out.m_55.z = _862;
    out.m_55.w = _870;
    bool _872 = !_710;
    float _890;
    if (!_872)
    {
        float _874 = in.m_53.x;
        float _876 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _878 = _874 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _880 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _882 = _880 * _876;
        float _884 = floor(_882);
        float _886 = -_884;
        float _888 = _882 + _886;
        _890 = _888;
        _892 = true;
    }
    else
    {
        float _894 = float(_90);
        float _896 = 1.0 / _894;
        float _898 = _124 * _896;
        _890 = _898;
    }
    _892 = false;
    float _900 = _890;
    float _902 = in.m_53.z;
    float _904 = _390 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _906 = in.m_53.x;
    int _908 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _910 = _908 != 0;
    float _912 = _388 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _916 = _914 != 0;
    float _918 = in.m_53.y;
    float _920 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _922 = log2(_920);
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _926 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _924;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _928;
    float _932 = _902 * 2.0;
    float _934 = _922 * _124;
    float _936 = _906 * 2.0;
    float _938 = floor(_932);
    float _940 = _918 * 2.0;
    float _942 = floor(_936);
    float _944 = floor(_940);
    bool _946 = _938 >= 0.0;
    bool _948 = isnan(_938);
    bool _950 = _946 || _948;
    bool _952 = isnan(0.0);
    bool _954 = _950 || _952;
    int _956 = _954 ? 0 : 1;
    bool _958 = _942 >= 0.0;
    bool _960 = isnan(_942);
    bool _962 = _958 || _960;
    bool _964 = isnan(0.0);
    bool _966 = _962 || _964;
    float _968 = exp2(_934);
    int _970 = _966 ? 0 : 1;
    bool _972 = _944 >= 0.0;
    bool _974 = isnan(_944);
    bool _976 = _972 || _974;
    bool _978 = isnan(0.0);
    bool _980 = _976 || _978;
    int _982 = ~_970;
    int _984 = _982 + 1;
    int _986 = _984 + 1;
    int _988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _990 = _988 != 0;
    int _992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _994 = _992 != 0;
    int _996 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _998 = _996 != 0;
    bool _1000 = _938 > 0.0;
    float _1002 = _906 + _918;
    int _1004 = _980 ? 0 : 1;
    float _1006 = -_968;
    float _1008 = _1006 + 1.0;
    bool _1010 = !_990;
    int _1012 = _1010 ? 0 : 1;
    float _1014 = _1002 + (-1.0);
    bool _1016 = _944 > 0.0;
    float _1018 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1020 = _942 > 0.0;
    float _1022 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1024 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1026 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1018);
    int _1028 = ~_956;
    int _1030 = _1028 + 1;
    int _1032 = _1030 + 1;
    float _1034 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1022);
    int _1036 = _1032;
    int _1038 = _986;
    if (!_1000)
    {
        int _1040 = ~_956;
        int _1042 = _1040 + 1;
        _1036 = _1042;
    }
    int _1044 = _1036;
    float _1046 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1024);
    int _1048 = ~_1004;
    int _1050 = _1048 + 1;
    int _1052 = _1050 + 1;
    float _1054 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1056 = abs(_1012);
    float _1058 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1034);
    int _1060 = _1052;
    if (!_1016)
    {
        int _1062 = ~_1004;
        int _1064 = _1062 + 1;
        _1060 = _1064;
    }
    int _1066 = _1060;
    float _1068 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1046);
    float _1070 = float(_1044);
    float _1072 = in.m_57.x;
    float _1074 = in.m_57.y;
    float _1076 = in.m_57.z;
    bool _1078 = !_994;
    int _1080 = _1078 ? 0 : 1;
    float _1082 = float(_1056);
    float _1084 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1086 = 1.0 + _1084;
    if (!_1020)
    {
        int _1088 = ~_970;
        int _1090 = _1088 + 1;
        _1038 = _1090;
    }
    int _1092 = _1038;
    bool _1094 = !_998;
    int _1096 = _1094 ? 0 : 1;
    float _1098 = 1.0 / _1086;
    int _1100 = abs(_1080);
    float _1102 = _1082 * _1070;
    int _1104 = abs(_1096);
    bool _1106 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1108 = isnan(1.0);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1114 = _1110 || _1112;
    float _1116 = _1102 * (-2.0);
    bool _1118 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1120 = isnan(0.0);
    bool _1122 = _1118 || _1120;
    bool _1124 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1126 = _1122 || _1124;
    float _1128 = float(_1100);
    float _1130 = float(_1092);
    float _1132 = fma(_1116, _1072, _1072);
    float _1134 = _1126 ? _1008 : 0.0;
    float _1136 = in.m_59.x;
    float _1138 = in.m_59.y;
    float _1140 = in.m_59.z;
    float _1142 = _1128 * _1130;
    float _1144 = fma(_1054, _1116, _1054);
    float _1146 = _906 + (-0.5);
    if (_1114)
    {
        float _1148 = _1134 * _1098;
        _126 = _1148;
    }
    float _1150 = _126;
    float _1152 = _1142 * (-2.0);
    float _1154 = float(_1104);
    float _1156 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1132);
    float _1158 = float(_1066);
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1160;
    float _1164 = fma(_1144, _1150, _1156);
    float _1166 = _918 + _902;
    float _1168 = _1154 * _1158;
    bool _1170 = _906 > 0.5;
    bool _1172 = _1170 && _910;
    float _1174 = _906 + _902;
    float _1176 = _1166 + (-1.0);
    float _1178 = _1168 * (-2.0);
    float _1180 = fma(_1152, _1074, _1074);
    bool _1182 = _918 > 0.5;
    float _1184 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1186 = fma(_1178, _1076, _1076);
    float _1188 = 1.0 / _1162;
    float _1190 = fma(_1184, _1152, _1184);
    float _1192 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1140);
    float _1194 = _1174 + (-1.0);
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1196;
    float _1200 = in.m_61.y;
    float _1202 = _918 + (-0.5);
    float _1204 = fma(_1194, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1206 = _902 + (-0.5);
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1210 = _1208 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1212 = 1.0 / _1198;
    float _1214 = fma(_1202, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1180);
    float _1216 = fma(_1204, _1178, _1204);
    float _1218 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1186);
    float _1220 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1138);
    float _1222 = fma(_1190, _1150, _1214);
    float _1224 = _392 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1226 = fma(_1216, _1150, _1218);
    float _1228 = 1.0 / _1210;
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1232 = _900 + _1230;
    float _1234 = _1164 * 0.15915493667125701904296875;
    float _1236 = _1222 * 0.15915493667125701904296875;
    float _1238 = _1226 * 0.15915493667125701904296875;
    float _1240 = _904 * _1220;
    float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1244 = _900 + _1242;
    float _1246 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1136);
    float _1248 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1026);
    float _1250 = _1232 * _1188;
    float _1252 = _1234 * 6.283185482025146484375;
    float _1254 = sin(_1252);
    float _1256 = _1244 * _1212;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1260 = _900 + _1258;
    float _1262 = -_1200;
    float _1264 = _1262 + 1.0;
    float _1266 = _1224 * _1192;
    float _1268 = _1248 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1270 = _1234 * 6.283185482025146484375;
    float _1272 = cos(_1270);
    float _1274 = _1200;
    float _1276 = _1268;
    if (_916)
    {
        float _1278 = _1182 ? _1264 : _1200;
        _1274 = _1278;
    }
    float _1280 = _1274;
    float _1282 = _912 * _1246;
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1286 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1284;
    float _1288 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1288;
    float _1292 = fma(_1286, _1250, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1294 = _1236 * 6.283185482025146484375;
    float _1296 = sin(_1294);
    float _1298 = _1260 * _1228;
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1302 = _1300 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1304;
    float _1308 = _1236 * 6.283185482025146484375;
    float _1310 = cos(_1308);
    float _1312 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1314 = _1312 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1316 = fma(_1302, _1298, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1318 = fma(_1306, _1250, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1320 = fma(_1314, _1298, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1322 = _1238 * 6.283185482025146484375;
    float _1324 = cos(_1322);
    float _1326 = _1254 * _1296;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1330 = _1328 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1332;
    float _1336 = _1238 * 6.283185482025146484375;
    float _1338 = sin(_1336);
    float _1340 = _1272 * _1310;
    float _1342 = fma(_1330, _1298, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1344 = _1272 * _1296;
    float _1346 = fma(_1334, _1250, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1348 = _1296 * _1324;
    float _1350 = _1324 * _1240;
    float _1352 = _1272 * _1350;
    float _1354 = _1254 * _1310;
    float _1356 = _1310 * _1324;
    float _1358 = fma(_1338, _1340, _1326);
    float _1360 = -_1240;
    float _1362 = _1338 * _1360;
    float _1364 = fma(_1358, _1282, _1352);
    float _1366 = -_1354;
    float _1368 = fma(_1338, _1344, _1366);
    float _1370 = -_1344;
    float _1372 = fma(_1338, _1354, _1370);
    float _1374 = _1254 * _1350;
    float _1376 = fma(_1356, _1282, _1362);
    float _1378 = fma(_1368, _1266, _1364);
    float _1380 = fma(_1338, _1326, _1340);
    float _1382 = fma(_1372, _1282, _1374);
    float _1384 = fma(_1348, _1266, _1376);
    float _1386 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1388 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1390 = fma(_1380, _1266, _1382);
    float _1392 = _1058 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1394 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1386);
    float _1396 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1388);
    float _1398 = in.m_61.x;
    bool _1400 = _900 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1402 = isnan(_900);
    bool _1404 = _1400 || _1402;
    bool _1406 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1408 = _1404 || _1406;
    float _1410 = float(_1408);
    float _1412 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1394);
    float _1414 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1396);
    float _1416 = _1068 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1418 = _900 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1420 = isnan(_900);
    bool _1422 = _1418 || _1420;
    bool _1424 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1426 = _1422 || _1424;
    float _1428 = float(_1426);
    float _1430 = _1412 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1432 = _1414 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _1434 = _900 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1436 = isnan(_900);
    bool _1438 = _1434 || _1436;
    bool _1440 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1442 = _1438 || _1440;
    float _1444 = float(_1442);
    float _1446 = _1378 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1448 = _1392 + _1430;
    float _1450 = _1416 + _1432;
    bool _1452 = _900 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1454 = isnan(_900);
    bool _1456 = _1452 || _1454;
    bool _1458 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1460 = _1456 || _1458;
    float _1462 = float(_1460);
    float _1464 = -_1410;
    float _1466 = _1464 + 1.0;
    float _1468 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1470 = _1448 + _1468;
    float _1472 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1474 = _1450 + _1472;
    float _1476 = -_1444;
    float _1478 = _1476 + 1.0;
    float _1480 = _1462 * _1466;
    float _1482 = _1470 * _1470;
    float _1484 = _1474 * _1474;
    float _1486 = -_1462;
    float _1488 = _1486 + 1.0;
    float _1490 = _1428 * _1478;
    float _1492 = fma(_926, _1256, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1494 = _1482 + _1484;
    float _1496 = 0.0;
    float _1498 = _1444;
    float _1500 = _1316;
    float _1502 = _1342;
    float _1504 = _1320;
    float _1506 = _1482;
    if (_910)
    {
        _1496 = _1398;
    }
    float _1508 = _1496;
    float _1510 = _1444 * _1488;
    float _1512 = fma(_1290, _1256, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1514 = sqrt(_1494);
    float _1516 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1446);
    float _1518 = _1508;
    if (_1172)
    {
        float _1520 = -_1508;
        float _1522 = _1520 + 1.0;
        _1518 = _1522;
    }
    float _1524 = _1518;
    float _1526 = -_1428;
    float _1528 = _1526 + 1.0;
    float _1530 = _1292 * _1490;
    float _1532 = _1318 * _1490;
    float _1534 = _1346 * _1490;
    if (!_910)
    {
        _1498 = _1398;
    }
    float _1536 = _1498;
    float _1538 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1530);
    float _1540 = _1536;
    if (_910)
    {
        _1540 = _1524;
    }
    float _1542 = _1540;
    float _1544 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1532);
    float _1546 = fma(_930, _1256, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1548 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1516);
    float _1550 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1534);
    float _1552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1554 = fma(_1316, _1510, _1538);
    bool _1556 = _1514 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1558 = _1548 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1560 = fma(_1320, _1510, _1544);
    float _1562 = fma(_1342, _1510, _1550);
    float _1564 = _1268 + _1558;
    float _1566 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1568 = _1544;
    if (!_1556)
    {
        _1500 = _1484;
    }
    float _1570 = _1500;
    float _1572 = _1570;
    if (!_1556)
    {
        _1502 = _1448;
    }
    float _1574 = _1502;
    float _1576 = _1574;
    if (!_1556)
    {
        _1504 = _1450;
    }
    float _1578 = _1504;
    float _1580 = _1578;
    if (!_1556)
    {
        _1568 = _1564;
    }
    float _1582 = _1568;
    bool _1584 = !_1556;
    float _1586 = _1582;
    float _1588 = _1566;
    if (!_1584)
    {
        float _1590 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1592 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1594 = _1514 + _1592;
        float _1596 = _1564 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1598 = rsqrt(_1494);
        float _1600 = _1594 * _1590;
        float _1602 = _1600 * 0.15915493667125701904296875;
        float _1604 = _1602 * 6.283185482025146484375;
        float _1606 = sin(_1604);
        float _1608 = _1602 * 6.283185482025146484375;
        float _1610 = cos(_1608);
        float _1612 = fma(_1606, _1596, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1614 = _1598 * _1612;
        float _1616 = _1610 + (-1.0);
        float _1618 = fma(_1470, _1614, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1620 = fma(_1474, _1614, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1622 = _1616 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1624 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1626 = _1618 + _1624;
        float _1628 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1630 = _1620 + _1628;
        float _1632 = fma(_1564, _1610, _1622);
        float _1634 = _1626 * _1626;
        float _1636 = _1630 * _1630;
        _1586 = _1632;
        _1506 = _1634;
        _1572 = _1636;
        _1576 = _1618;
        _1580 = _1620;
    }
    float _1638 = _1586;
    float _1640 = _1506;
    float _1642 = _1572;
    float _1644 = _1576;
    float _1646 = _1580;
    float _1648 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1650 = _1638 + _1648;
    float _1652 = fma(_1512, _1480, _1554);
    float _1654 = fma(_1492, _1480, _1560);
    float _1656 = fma(_1546, _1480, _1562);
    float _1658 = fma(_1650, _1650, _1640);
    float _1660 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1652);
    float _1662 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1654);
    float _1664 = fma(_1410, (*spvDescriptorSet0.vp_c9)._m0[126].z, _1656);
    float _1666 = _1658 + _1642;
    float _1668 = _1542 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1670 = _1280 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1672 = _1660 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1674 = _1662 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1676 = _1664 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1678 = sqrt(_1666);
    float _1680 = _1668 * _1552;
    float _1682 = _1670 * _1566;
    float _1684 = _1672 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1686 = _1674 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1688 = _1676 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.x = _1680;
    out.m_63.y = _1682;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    out.m_67.x = _1684;
    out.m_67.y = _1686;
    out.m_67.z = _1688;
    bool _1690 = _1678 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1692 = isnan(_1678);
    bool _1694 = _1690 || _1692;
    bool _1696 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1698 = _1694 || _1696;
    float _1700 = _1684;
    float _1702 = _1686;
    float _1704 = _1674;
    if (!_1698)
    {
        _1588 = 1.0;
    }
    float _1706 = _1588;
    bool _1708 = !_1698;
    float _1710 = _1706;
    if (!_1708)
    {
        bool _1712 = _1678 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1714 = isnan(_1678);
        bool _1716 = _1712 || _1714;
        bool _1718 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1720 = _1716 || _1718;
        if (!_1720)
        {
            float _1722 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1724 = _1678 + _1722;
            float _1726 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1728 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1726;
            float _1730 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1732 = _1730 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1734 = 1.0 / _1728;
            float _1736 = _1724 * _1734;
            float _1738 = fma(_1736, _1732, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1710 = _1738;
            _1740 = true;
        }
        else
        {
            bool _1742 = _1678 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1744 = isnan(_1678);
            bool _1746 = _1742 || _1744;
            bool _1748 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1750 = _1746 || _1748;
            if (!_1750)
            {
                float _1752 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1754 = _1678 + _1752;
                float _1756 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1758 = _1756 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1760 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1762 = _1760 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1764 = 1.0 / _1758;
                float _1766 = _1754 * _1764;
                float _1768 = fma(_1766, _1762, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1710 = _1768;
                _1740 = true;
            }
            else
            {
                _1710 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1740 = false;
    float _1770 = _1710;
    float _1772 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1774 = _1638 + _1772;
    float _1776 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1778 = _1644 + _1776;
    float _1780 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1782 = _1646 + _1780;
    float _1784 = fma(_1774, _1770, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1786 = fma(_1778, _1770, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1788 = fma(_1782, _1770, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1790 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1792 = _1784 + _1790;
    float _1794 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1796 = _1786 + _1794;
    float _1798 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1800 = _1788 + _1798;
    float _1802 = _1792 * _1792;
    float _1804 = fma(_1796, _1796, _1802);
    float _1806 = fma(_1800, _1800, _1804);
    float _1808 = rsqrt(_1806);
    float _1810 = _1808 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1812 = _1796 * _1810;
    float _1814 = _1800 * _1810;
    float _1816 = _1812 * _1812;
    float _1818 = _1814 * _1814;
    float _1820 = _1816 + _1818;
    float _1822 = sqrt(_1820);
    bool _1824 = _1822 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1826 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1828 = _1822 + _1826;
    float _1830 = _1800;
    float _1832 = _1828;
    float _1834 = _1792;
    float _1836 = _1812;
    if (_1824)
    {
        float _1838 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1830 = _1838;
    }
    float _1840 = _1830;
    if (_1824)
    {
        float _1842 = rsqrt(_1820);
        _1700 = _1842;
    }
    float _1844 = _1700;
    float _1846 = _1844;
    if (_1824)
    {
        float _1848 = _1828 * _1840;
        _1832 = _1848;
    }
    float _1850 = _1832;
    if (_1824)
    {
        float _1852 = _1850 * 0.15915493667125701904296875;
        _1702 = _1852;
    }
    float _1854 = _1702;
    float _1856 = _1840;
    if (_1824)
    {
        float _1858 = _1854 * 6.283185482025146484375;
        float _1860 = sin(_1858);
        _1856 = _1860;
    }
    float _1862 = _1856;
    float _1864 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1866 = precise::max(0.0, _1864);
    float _1868 = _1802;
    float _1870 = _1866;
    if (_1824)
    {
        float _1872 = _1854 * 6.283185482025146484375;
        float _1874 = cos(_1872);
        _1868 = _1874;
    }
    float _1876 = _1868;
    float _1878 = -_1810;
    float _1880 = -_1866;
    float _1882 = fma(_1792, _1878, _1880);
    if (!_1824)
    {
        _1834 = _1814;
    }
    float _1884 = _1834;
    float _1886 = _1884;
    if (_1824)
    {
        float _1888 = _1882 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1870 = _1888;
    }
    float _1890 = _1870;
    float _1892 = sqrt(_1806);
    float _1894 = _1862;
    float _1896 = _1890;
    if (_1824)
    {
        float _1898 = fma(_1862, _1890, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1894 = _1898;
    }
    float _1900 = _1894;
    float _1902 = _1900;
    float _1904 = _1876;
    if (_1824)
    {
        float _1906 = _1876 + (-1.0);
        _1896 = _1906;
    }
    float _1908 = _1896;
    float _1910 = _1908;
    if (_1824)
    {
        float _1912 = _1844 * _1900;
        _1704 = _1912;
    }
    float _1914 = _1704;
    if (!_1824)
    {
        _1902 = _1882;
    }
    float _1916 = _1902;
    float _1918 = _1916;
    if (_1824)
    {
        float _1920 = _1908 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1846 = _1920;
    }
    float _1922 = _1846;
    if (_1824)
    {
        float _1924 = _1812 * _1914;
        _1836 = _1924;
    }
    float _1926 = _1836;
    if (!_1824)
    {
        _1910 = _1816;
    }
    float _1928 = _1910;
    float _1930 = _1928;
    if (_1824)
    {
        float _1932 = _1814 * _1914;
        _1886 = _1932;
    }
    float _1934 = _1886;
    if (_1824)
    {
        float _1936 = fma(_1882, _1876, _1922);
        _1918 = _1936;
    }
    float _1938 = _1918;
    if (_1824)
    {
        float _1940 = _1926 * _1926;
        _1930 = _1940;
    }
    float _1942 = _1930;
    if (!_1824)
    {
        _1904 = _1818;
    }
    float _1944 = _1904;
    float _1946 = _1944;
    if (_1824)
    {
        float _1948 = _1934 * _1934;
        _1946 = _1948;
    }
    float _1950 = _1946;
    float _1952 = fma(_1938, _1938, _1942);
    float _1954 = _1952 + _1950;
    float _1956 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1958 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1960 = fma(_1892, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1958);
    float _1962 = precise::clamp(_1960, 0.0, 1.0);
    float _1964 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1966 = rsqrt(_1954);
    float _1968 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1956);
    float _1970 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1972 = -_1962;
    float _1974 = _1972 + 1.0;
    float _1976 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1978 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1968);
    float _1980 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1970);
    float _1982 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1984 = _1978 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1986 = abs(_1974);
    float _1988 = log2(_1986);
    float _1990 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1964);
    float _1992 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1980);
    float _1994 = _1984 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1996 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1976);
    float _1998 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1990);
    float _2000 = _1992 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2002 = _1966 * _1926;
    float _2004 = -_1994;
    float _2006 = fma(_2004, _1982, 1.0);
    float _2008 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1996);
    float _2010 = _1998 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2012 = _2000 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2014 = _1966 * _1938;
    float _2016 = _2002 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2018 = _2008 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2020 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2012);
    float _2022 = _1966 * _1934;
    float _2024 = -_2016;
    float _2026 = fma(_2014, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2024);
    float _2028 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2030 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2020);
    float _2032 = _2000 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2034 = -_2022;
    float _2036 = fma(_2034, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2026);
    float _2038 = exp2(_2028);
    float _2040 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2030);
    float _2042 = _2000 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2044 = fma(_2036, -0.5, 0.5);
    float _2046 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2032);
    float _2048 = fma(_2036, 0.5, 0.5);
    float _2050 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2042);
    float _2052 = _2014 + 1.0;
    float _2054 = log2(_2006);
    float _2056 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2046);
    float _2058 = fma(_2048, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2060 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2050);
    float _2062 = fma(_2048, _2058, -0.212114393711090087890625);
    float _2064 = 1.0 / _2040;
    float _2066 = -_2014;
    float _2068 = fma(_2038, _2052, _2066);
    float _2070 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2056);
    float _2072 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2060);
    float _2074 = fma(_2048, _2062, 1.570728778839111328125);
    float _2076 = fma(_2068, 0.5, 0.5);
    float _2078 = sqrt(_2044);
    float _2080 = _2054 * 0.693147182464599609375;
    float _2082 = _2080 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2084 = _2070 * _2064;
    float _2086 = _2072 * _2064;
    float _2088 = fma(_2084, 0.5, 0.5);
    float _2090 = fma(_2086, -0.5, 0.5);
    float _2092 = _2078 * 0.636619746685028076171875;
    float _2094 = -_2074;
    float _2096 = fma(_2092, _2094, 1.0);
    float3 _5585 = float3(_2088, _2090, _2082);
    float _2098 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5585, float3(0.0), isnan(_5585)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5585, float3(0.0), isnan(_5585)), level(0.0)).x;
    float3 _5596 = float3(_2088, _2090, _2082);
    float4 _2101 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5596, float3(0.0), isnan(_5596)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5596, float3(0.0), isnan(_5596)), level(0.0)).xyzw;
    float _2103 = _2101.x;
    float _2105 = _2101.y;
    float _2107 = _2101.z;
    float _2109 = _2101.w;
    float2 _5613 = float2(_2096, _2076);
    float3 _2113 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5613, float2(0.0), isnan(_5613)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5613, float2(0.0), isnan(_5613)), level(0.0)).xyz;
    float _2115 = _2113.x;
    float _2117 = _2113.y;
    float _2119 = _2113.z;
    float _2121 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2123 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2125 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2121);
    float _2127 = _1268 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2129 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2125);
    float _2131 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2127);
    float _2133 = _2129 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2135 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2131);
    float _2137 = 1.0 / _2133;
    float _2139 = _2135 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2141 = _2139 + _2133;
    float _2143 = _2141 * _2137;
    float _2145 = _2143 * 0.5;
    float _2147 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2149 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2147);
    bool _2151 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2153 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2155 = _2151 || _2153;
    bool _2157 = isnan(0.5);
    bool _2159 = _2155 || _2157;
    float _2161 = _2000 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2163 = 1.0 / _2149;
    float _2165 = fma(_2010, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2161);
    float _2167 = fma(_1984, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2165);
    float _2169 = exp2(_2123);
    float _2171 = fma(_2018, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2167);
    float _2173 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (_2159)
    {
        _1276 = 1.0;
    }
    float _2175 = _1276;
    float _2177 = _2175;
    if (_2159)
    {
        _2173 = 1.0;
    }
    float _2179 = _2173;
    float _2181 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2183 = _2163 * _2181;
    float _2185 = _2179;
    if (!_2159)
    {
        float _2187 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2189 = _2187 * 0.15915493667125701904296875;
        float _2191 = _2189 * 6.283185482025146484375;
        float _2193 = cos(_2191);
        float _2195 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2197 = _2195 * 0.15915493667125701904296875;
        float _2199 = _2189 * 6.283185482025146484375;
        float _2201 = sin(_2199);
        float _2203 = 1.0 / _2193;
        float _2205 = _2197 * 6.283185482025146484375;
        float _2207 = cos(_2205);
        float _2209 = _2201 * _2203;
        float _2211 = _2197 * 6.283185482025146484375;
        float _2213 = sin(_2211);
        float _2215 = _2207 * _2209;
        float _2217 = 1.0 / _2215;
        float _2219 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2221 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2219;
        float _2223 = 1.0 / _2221;
        float _2225 = _2213 * _2217;
        float _2227 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2229 = fma(_2183, _2225, _2227);
        float _2231 = _2229 * _2223;
        float _2233 = precise::clamp(_2231, 0.0, 1.0);
        _2177 = _2233;
    }
    float _2235 = _2177;
    if (!_2159)
    {
        float _2237 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2239 = _2237 * 0.15915493667125701904296875;
        float _2241 = _2239 * 6.283185482025146484375;
        float _2243 = cos(_2241);
        float _2245 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2247 = _2245 * 0.15915493667125701904296875;
        float _2249 = _2239 * 6.283185482025146484375;
        float _2251 = sin(_2249);
        float _2253 = 1.0 / _2243;
        float _2255 = _2247 * 6.283185482025146484375;
        float _2257 = cos(_2255);
        float _2259 = _2251 * _2253;
        float _2261 = _2247 * 6.283185482025146484375;
        float _2263 = sin(_2261);
        float _2265 = _2257 * _2259;
        float _2267 = 1.0 / _2265;
        float _2269 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2271 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2269;
        float _2273 = 1.0 / _2271;
        float _2275 = _2263 * _2267;
        float _2277 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2279 = fma(_2183, _2275, _2277);
        float _2281 = _2279 * _2273;
        float _2283 = precise::clamp(_2281, 0.0, 1.0);
        float _2285 = -_2283;
        float _2287 = _2285 + 1.0;
        _2185 = _2287;
    }
    float _2289 = _2185;
    float _2291 = -_2169;
    float _2293 = _2291 + 1.0;
    float _2295 = _2235 * _2289;
    float _2297 = _2040 * 0.5;
    bool _2299 = _2235 > 0.0;
    bool _2301 = isnan(_2235);
    bool _2303 = _2299 || _2301;
    bool _2305 = isnan(0.0);
    bool _2307 = _2303 || _2305;
    float _2309 = _2293 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2311 = _2295 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2313 = fma(_2072, -0.5, _2297);
    bool _2315 = _2289 <= 0.0;
    bool _2317 = !_2307;
    bool _2319 = _2315 || _2317;
    float _2321 = _2309 * _2098;
    float _2323 = _2311 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2325 = _2171 + _2040;
    float _2327 = _2070 + _2040;
    float _2329 = _2109 * _2321;
    float _2331 = _2119 * _2321;
    float _2333 = -_2309;
    float _2335 = _2333 + 1.0;
    out.gl_Position.x = _2070;
    out.gl_Position.y = _2072;
    out.gl_Position.z = _2171;
    out.gl_Position.w = _2040;
    float _2337 = _2325 * 0.5;
    float _2339 = _2327 * 0.5;
    out.m_47.x = _2323;
    float _2341 = fma(_2115, _2329, _2103);
    float _2343 = fma(_2117, _2329, _2105);
    float _2345 = _2109 * _2335;
    out.m_69.x = _2339;
    out.m_69.y = _2313;
    out.m_69.z = _2337;
    out.m_69.w = _2040;
    float _2347 = fma(_2109, _2331, _2107);
    out.m_71.x = _2341;
    out.m_71.y = _2343;
    out.m_71.z = _2347;
    out.m_71.w = _2345;
    if (!_2319)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2349 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2349;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

