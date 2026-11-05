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
    float4 m_55 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_71 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_49 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_47 [[attribute(4)]];
    float4 m_59 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_53 [[attribute(8)]];
    float4 m_61 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _958 = false;
    bool _736 = false;
    bool _594 = false;
    bool _360 = false;
    bool _192 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2536 = as_type<float>(_106);
        out.gl_Position.z = _2536;
    }
    if (!_94)
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
    float _128 = _124;
    if (_120)
    {
        float _130 = float(_90);
        _126 = _130;
    }
    float _132 = _126;
    bool _134 = _124 >= _132;
    bool _136 = !_120;
    bool _138 = _134 || _136;
    if (_138)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _100;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2605 = as_type<float>(_144);
        out.gl_Position.z = _2605;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_49.x;
    float _148 = in.m_49.y;
    float _150 = in.m_49.z;
    bool _152 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _154 = _148 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _156 = _148 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _158 = _148 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _160 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[4].x, _154);
    float _162 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[5].x, _156);
    float _164 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[6].x, _158);
    float _166 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].z, _160);
    float _168 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].z, _162);
    float _170 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].z, _164);
    bool _172 = !_152;
    float _190;
    if (!_172)
    {
        float _174 = in.m_51.x;
        float _176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _180 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _182 = _180 * _176;
        float _184 = floor(_182);
        float _186 = -_184;
        float _188 = _182 + _186;
        _190 = _188;
        _192 = true;
    }
    else
    {
        float _194 = float(_90);
        float _196 = 1.0 / _194;
        float _198 = _124 * _196;
        _190 = _198;
    }
    _192 = false;
    float _200 = _190;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _204 = _200 + _202;
    bool _206 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _208 = isnan(_200);
    bool _210 = _206 || _208;
    bool _212 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _214 = _210 || _212;
    float _216 = float(_214);
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _220 = _200 + _218;
    bool _222 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _224 = isnan(_200);
    bool _226 = _222 || _224;
    bool _228 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _230 = _226 || _228;
    float _232 = float(_230);
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _240 = _238 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _242 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _244 = isnan(_200);
    bool _246 = _242 || _244;
    bool _248 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _250 = _246 || _248;
    float _252 = float(_250);
    float _254 = -_216;
    float _256 = _254 + 1.0;
    float _258 = 1.0 / _240;
    float _260 = _252 * _256;
    float _262 = -_252;
    float _264 = _262 + 1.0;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _266;
    bool _270 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _272 = 1.0 / _236;
    float _274 = _232 * _264;
    float _276 = -_232;
    float _278 = _276 + 1.0;
    float _280 = _220 * _258;
    float _282 = _204 * _272;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _284;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _288;
    float _292 = fma(_268, _282, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _294 = fma(_286, _282, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _296 = fma(_290, _282, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _298 = _292 * _274;
    float _300 = _294 * _274;
    float _302 = _296 * _274;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _316 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].x, _298);
    float _318 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].y, _300);
    float _320 = fma(_306, _280, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _322 = fma(_310, _280, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _324 = fma(_314, _280, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _326 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].z, _302);
    float _328 = fma(_320, _260, _316);
    float _330 = fma(_322, _260, _318);
    float _332 = fma(_324, _260, _326);
    float _334 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[145].x, _328);
    float _336 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[145].y, _330);
    float _338 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[145].z, _332);
    bool _340 = !_270;
    float _358;
    if (!_340)
    {
        float _342 = in.m_51.x;
        float _344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _346 = _342 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _348 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _350 = _348 * _344;
        float _352 = floor(_350);
        float _354 = -_352;
        float _356 = _350 + _354;
        _358 = _356;
        _360 = true;
    }
    else
    {
        float _362 = float(_90);
        float _364 = 1.0 / _362;
        float _366 = _124 * _364;
        _358 = _366;
    }
    _360 = false;
    float _368 = _358;
    float _370 = in.m_53.x;
    float _372 = in.m_53.y;
    float _374 = in.m_53.z;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _378 = _368 + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _392 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _394 = 1.0 / _382;
    float _396 = 1.0 / _386;
    float _398 = _338 * _374;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _402 = _368 + _400;
    float _404 = _336 * _372;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _408 = _368 + _406;
    float _410 = 1.0 / _390;
    bool _412 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _414 = isnan(_368);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = _378 * _394;
    bool _426 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _428 = isnan(_368);
    bool _430 = _426 || _428;
    bool _432 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _438;
    float _442 = _334 * _370;
    float _444 = -_422;
    float _446 = _444 + 1.0;
    float _448 = _402 * _396;
    float _450 = _436 * _446;
    bool _452 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _454 = isnan(_368);
    bool _456 = _452 || _454;
    bool _458 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _460 = _456 || _458;
    float _462 = float(_460);
    float _464 = -_436;
    float _466 = _464 + 1.0;
    bool _468 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _470 = isnan(_368);
    bool _472 = _468 || _470;
    bool _474 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _476 = _472 || _474;
    float _478 = float(_476);
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _480;
    float _484 = fma(_440, _448, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _486 = _408 * _410;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _488;
    float _492 = -_462;
    float _494 = _492 + 1.0;
    float _496 = fma(_482, _448, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _502 = fma(_490, _448, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _504 = _462 * _466;
    float _506 = _478 * _494;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _516 = fma(_500, _486, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _518 = _502 * _506;
    float _520 = fma(_510, _486, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _522 = fma(_514, _486, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _524 = _496 * _506;
    float _526 = _484 * _506;
    float _528 = -_478;
    float _530 = _528 + 1.0;
    float _532 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[107].x, _524);
    float _534 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[107].y, _526);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _536;
    float _540 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[107].z, _518);
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _542;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _546;
    float _550 = fma(_516, _504, _532);
    float _552 = fma(_538, _424, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _554 = fma(_544, _424, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _556 = fma(_548, _424, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _558 = fma(_520, _504, _534);
    float _560 = fma(_522, _504, _540);
    float _562 = fma(_552, _450, _550);
    float _564 = fma(_554, _450, _558);
    float _566 = fma(_556, _450, _560);
    float _568 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[110].x, _562);
    float _570 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[110].y, _564);
    float _572 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[110].z, _566);
    bool _574 = !_392;
    float _592;
    if (!_574)
    {
        float _576 = in.m_51.x;
        float _578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _580 = _576 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _582 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _584 = _582 * _578;
        float _586 = floor(_584);
        float _588 = -_586;
        float _590 = _584 + _588;
        _592 = _590;
        _594 = true;
    }
    else
    {
        float _596 = float(_90);
        float _598 = 1.0 / _596;
        float _600 = _124 * _598;
        _592 = _600;
    }
    _594 = false;
    float _602 = _592;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _606 = _602 + _604;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _612 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _614 = isnan(_602);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _628 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _630 = isnan(_602);
    bool _632 = _628 || _630;
    bool _634 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _636 = _632 || _634;
    float _638 = float(_636);
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _640;
    bool _644 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _646 = isnan(_602);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = 1.0 / _610;
    float _658 = -_622;
    float _660 = _658 + 1.0;
    bool _662 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _664 = _638 * _660;
    float _666 = -_638;
    float _668 = _666 + 1.0;
    float _670 = 1.0 / _626;
    float _672 = _642 * _656;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _676 = _674 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _678 = fma(_672, _606, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _680 = -_654;
    float _682 = _680 + 1.0;
    float _684 = _678 * _664;
    float _686 = _676 * _670;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _690 = _602 + _688;
    float _692 = _622 * _682;
    float _694 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[115].x, _684);
    float _696 = _568 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _698 = fma(_686, _690, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _700 = _570 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _702 = _572 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _704 = _696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _706 = fma(_698, _692, _694);
    float _708 = _700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = _702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _712 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[117].x, _706);
    float _714 = _712 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _704;
    out.m_55.y = _708;
    out.m_55.z = _710;
    out.m_55.w = _714;
    bool _716 = !_662;
    float _734;
    if (!_716)
    {
        float _718 = in.m_51.x;
        float _720 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _722 = _718 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _724 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _726 = _724 * _720;
        float _728 = floor(_726);
        float _730 = -_728;
        float _732 = _726 + _730;
        _734 = _732;
        _736 = true;
    }
    else
    {
        float _738 = float(_90);
        float _740 = 1.0 / _738;
        float _742 = _124 * _740;
        _734 = _742;
    }
    _736 = false;
    float _744 = _734;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _748 = _744 + _746;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _752 = _744 + _750;
    bool _754 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _756 = isnan(_744);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _766;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _772 = _770 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _774;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _780 = _744 + _778;
    float _782 = 1.0 / _776;
    bool _784 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _786 = 1.0 / _772;
    bool _788 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _790 = isnan(_744);
    bool _792 = _788 || _790;
    bool _794 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _796 = _792 || _794;
    float _798 = float(_796);
    float _800 = 1.0 / _768;
    float _802 = _752 * _782;
    float _804 = -_764;
    float _806 = _804 + 1.0;
    bool _808 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _810 = isnan(_744);
    bool _812 = _808 || _810;
    bool _814 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _816 = _812 || _814;
    float _818 = float(_816);
    float _820 = _798 * _806;
    float _822 = -_798;
    float _824 = _822 + 1.0;
    float _826 = _748 * _786;
    bool _828 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _830 = isnan(_744);
    bool _832 = _828 || _830;
    bool _834 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _836 = _832 || _834;
    float _838 = float(_836);
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _840;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _846 = _844 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _848 = -_838;
    float _850 = _848 + 1.0;
    float _852 = fma(_846, _826, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _854 = _780 * _800;
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _856;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _860;
    float _864 = _818 * _850;
    float _866 = fma(_842, _854, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _868 = fma(_858, _854, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _870 = fma(_862, _854, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _872 = _838 * _824;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _876 = _874 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _882 = _868 * _864;
    float _884 = _870 * _864;
    float _886 = _866 * _864;
    float _888 = fma(_876, _826, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _890 = fma(_880, _826, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _892 = -_818;
    float _894 = _892 + 1.0;
    float _896 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[123].y, _884);
    float _898 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[123].x, _882);
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _900;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _904;
    float _908 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[123].z, _886);
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _910;
    float _914 = fma(_852, _872, _898);
    float _916 = fma(_902, _802, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _918 = fma(_906, _802, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _920 = fma(_888, _872, _896);
    float _922 = fma(_912, _802, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _924 = fma(_890, _872, _908);
    float _926 = fma(_916, _820, _914);
    float _928 = fma(_918, _820, _920);
    float _930 = fma(_922, _820, _924);
    float _932 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[126].x, _926);
    float _934 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[126].y, _928);
    float _936 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[126].z, _930);
    bool _938 = !_784;
    float _956;
    if (!_938)
    {
        float _940 = in.m_51.x;
        float _942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _944 = _940 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _946 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _948 = _946 * _942;
        float _950 = floor(_948);
        float _952 = -_950;
        float _954 = _948 + _952;
        _956 = _954;
        _958 = true;
    }
    else
    {
        float _960 = float(_90);
        float _962 = 1.0 / _960;
        float _964 = _124 * _962;
        _956 = _964;
    }
    _958 = false;
    float _966 = _956;
    float _968 = in.m_51.z;
    float _970 = in.m_51.y;
    int _972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _974 = _972 != 0;
    float _976 = in.m_51.x;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _982 = _980 != 0;
    int _984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _986 = _984 != 0;
    int _988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _990 = _988 != 0;
    float _992 = in.m_42.x;
    float _994 = in.m_42.y;
    float _996 = in.m_42.z;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1000 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1002 = _968 * 2.0;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1006 = _970 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1008 = _970 * 2.0;
    float _1010 = floor(_1002);
    float _1012 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1004);
    float _1014 = _976 * 2.0;
    float _1016 = _976 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1018 = fma(_1006, -2.0, _978);
    float _1020 = _994 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1022 = -_998;
    float _1024 = fma(_1016, 2.0, _1022);
    float _1026 = _994 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1028 = floor(_1014);
    float _1030 = _994 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1032 = fma(_992, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1020);
    float _1034 = fma(_992, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1026);
    float _1036 = _1026;
    if (!_974)
    {
        _1036 = _968;
    }
    float _1038 = _1036;
    float _1040 = fma(_992, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1030);
    float _1042 = _976 + _970;
    bool _1044 = _1010 > 0.0;
    float _1046 = floor(_1008);
    bool _1048 = _1010 >= 0.0;
    bool _1050 = isnan(_1010);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan(0.0);
    bool _1056 = _1052 || _1054;
    float _1058 = _1042 + (-1.0);
    float _1060 = _1010;
    float _1062 = _1042;
    float _1064 = _1038;
    if (!_974)
    {
        _1060 = _970;
    }
    float _1066 = _1060;
    float _1068 = fma(_996, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1034);
    float _1070 = _1066;
    if (!_974)
    {
        _1062 = _968;
    }
    float _1072 = _1062;
    float _1074 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1076 = _1072;
    if (_974)
    {
        _1070 = _976;
    }
    float _1078 = _1070;
    float _1080 = fma(_996, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1032);
    if (_974)
    {
        _1064 = _970;
    }
    float _1082 = _1064;
    float _1084 = fma(_996, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1040);
    if (_974)
    {
        _1076 = _970;
    }
    float _1086 = _1076;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1090 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1092 = _1028 > 0.0;
    float _1094 = -_124;
    float _1096 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1024);
    bool _1098 = _1028 >= 0.0;
    bool _1100 = isnan(_1028);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan(0.0);
    bool _1106 = _1102 || _1104;
    float _1108 = _1068 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1110 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1112 = log2(_1110);
    bool _1114 = !_982;
    int _1116 = _1114 ? 0 : 1;
    float _1118 = _1084 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1120 = _1056 ? 0 : 1;
    bool _1122 = _1046 > 0.0;
    bool _1124 = _1046 >= 0.0;
    bool _1126 = isnan(_1046);
    bool _1128 = _1124 || _1126;
    bool _1130 = isnan(0.0);
    bool _1132 = _1128 || _1130;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1136 = abs(_1116);
    float _1138 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1088);
    int _1140 = ~_1120;
    int _1142 = _1140 + 1;
    int _1144 = _1142 + 1;
    float _1146 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1134);
    float _1148 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1150 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1138);
    int _1152 = _1144;
    if (!_1044)
    {
        int _1154 = ~_1120;
        int _1156 = _1154 + 1;
        _1152 = _1156;
    }
    int _1158 = _1152;
    float _1160 = _1112 * _124;
    float _1162 = -_1000;
    float _1164 = fma(_1148, 2.0, _1162);
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1168 = _1106 ? 0 : 1;
    float _1170 = fma(_1090, -2.0, _1166);
    int _1172 = _1132 ? 0 : 1;
    float _1174 = exp2(_1160);
    float _1176 = float(_1136);
    float _1178 = float(_1158);
    int _1180 = ~_1168;
    int _1182 = _1180 + 1;
    int _1184 = _1182 + 1;
    int _1186 = ~_1172;
    int _1188 = _1186 + 1;
    int _1190 = _1188 + 1;
    float _1192 = _1176 * _1178;
    int _1194 = _1184;
    int _1196 = _1190;
    if (!_1092)
    {
        int _1198 = ~_1168;
        int _1200 = _1198 + 1;
        _1194 = _1200;
    }
    int _1202 = _1194;
    float _1204 = _1192 * (-2.0);
    if (!_1122)
    {
        int _1206 = ~_1172;
        int _1208 = _1206 + 1;
        _1196 = _1208;
    }
    int _1210 = _1196;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1214 = 1.0 + _1212;
    float _1216 = in.m_57.x;
    float _1218 = in.m_57.y;
    float _1220 = in.m_57.z;
    float _1222 = -_1174;
    float _1224 = _1222 + 1.0;
    float _1226 = 1.0 / _1214;
    bool _1228 = !_986;
    int _1230 = _1228 ? 0 : 1;
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1234 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1236 = isnan(1.0);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1242 = _1238 || _1240;
    int _1244 = abs(_1230);
    float _1246 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1232);
    bool _1248 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1250 = isnan(0.0);
    bool _1252 = _1248 || _1250;
    bool _1254 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1256 = _1252 || _1254;
    float _1258 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1018);
    float _1260 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1146);
    float _1262 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1246);
    float _1264 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1012);
    float _1266 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1170);
    float _1268 = _1256 ? _1224 : 0.0;
    float _1270 = -_124;
    float _1272 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1164);
    float _1274 = float(_1244);
    float _1276 = _976 + (-0.5);
    float _1278 = float(_1202);
    if (_1242)
    {
        float _1280 = _1268 * _1226;
        _128 = _1280;
    }
    float _1282 = _128;
    float _1284 = fma(_1204, _1216, _1216);
    float _1286 = fma(_1074, _1204, _1074);
    bool _1288 = !_990;
    int _1290 = _1288 ? 0 : 1;
    float _1292 = _1274 * _1278;
    float _1294 = _1080 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1296 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1284);
    float _1298 = -_1108;
    float _1300 = _1298 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1302 = float(_1210);
    float _1304 = -_1294;
    float _1306 = _1304 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1308 = fma(_1286, _1282, _1296);
    int _1310 = abs(_1290);
    float _1312 = _970 + _968;
    float _1314 = _1306 * _1306;
    float _1316 = -_1118;
    float _1318 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1320 = float(_1310);
    float _1322 = _1312 + (-1.0);
    float _1324 = fma(_1300, _1300, _1314);
    float _1326 = _1292 * (-2.0);
    float _1328 = _1308 * 0.15915493667125701904296875;
    float _1330 = _1320 * _1302;
    float _1332 = fma(_1318, _1318, _1324);
    float _1334 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1336 = _970 + (-0.5);
    float _1338 = fma(_1326, _1218, _1218);
    float _1340 = _976 + _968;
    float _1342 = fma(_1334, _1326, _1334);
    float _1344 = rsqrt(_1332);
    float _1346 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1338);
    float _1348 = _1340 + (-1.0);
    float _1350 = _1330 * (-2.0);
    float _1352 = fma(_1342, _1282, _1346);
    float _1354 = _968 + (-0.5);
    float _1356 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1358 = fma(_1350, _1220, _1220);
    float _1360 = _1352 * 0.15915493667125701904296875;
    float _1362 = _1328 * 6.283185482025146484375;
    float _1364 = sin(_1362);
    float _1366 = in.m_59.x;
    float _1368 = in.m_59.y;
    float _1370 = in.m_59.z;
    float _1372 = fma(_1356, _1350, _1356);
    float _1374 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1358);
    float _1376 = _1306 * _1344;
    float _1378 = fma(_1372, _1282, _1374);
    float _1380 = _1300 * _1344;
    float _1382 = _1318 * _1344;
    float _1384 = _1328 * 6.283185482025146484375;
    float _1386 = cos(_1384);
    float _1388 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1390 = _1380 * _1388;
    float _1392 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1394 = _1382 * _1392;
    float _1396 = _398 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1398 = _1378 * 0.15915493667125701904296875;
    float _1400 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1402 = -_1390;
    float _1404 = fma(_1382, _1400, _1402);
    float _1406 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1408 = -_1394;
    float _1410 = fma(_1376, _1406, _1408);
    float _1412 = _1360 * 6.283185482025146484375;
    float _1414 = sin(_1412);
    float _1416 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1418 = _1376 * _1416;
    float _1420 = _1404 * _1404;
    float _1422 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1424 = -_1418;
    float _1426 = fma(_1380, _1422, _1424);
    float _1428 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1370);
    float _1430 = fma(_1410, _1410, _1420);
    float _1432 = _1360 * 6.283185482025146484375;
    float _1434 = cos(_1432);
    float _1436 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1366);
    float _1438 = _1396 * _1428;
    float _1440 = fma(_1426, _1426, _1430);
    float _1442 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1368);
    float _1444 = _404 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1446 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1448 = _1398 * 6.283185482025146484375;
    float _1450 = sin(_1448);
    float _1452 = _1386 * _1414;
    float _1454 = _1444 * _1442;
    float _1456 = _1364 * _1414;
    float _1458 = _1446 * _1436;
    float _1460 = _1398 * 6.283185482025146484375;
    float _1462 = cos(_1460);
    float _1464 = _1364 * _1434;
    float _1466 = rsqrt(_1440);
    float _1468 = -_1452;
    float _1470 = fma(_1450, _1464, _1468);
    float _1472 = -_1464;
    float _1474 = fma(_1450, _1452, _1472);
    float _1476 = _1386 * _1434;
    float _1478 = fma(_1450, _1456, _1476);
    float _1480 = _1462 * _1454;
    float _1482 = _1414 * _1462;
    float _1484 = fma(_1450, _1476, _1456);
    float _1486 = _1434 * _1462;
    float _1488 = _1386 * _1480;
    float _1490 = -_1454;
    float _1492 = _1450 * _1490;
    float _1494 = _1364 * _1480;
    float _1496 = _1410 * _1466;
    float _1498 = fma(_1484, _1458, _1488);
    float _1500 = _1404 * _1466;
    float _1502 = fma(_1486, _1458, _1492);
    float _1504 = _1376 * _1496;
    float _1506 = _1426 * _1466;
    float _1508 = fma(_1474, _1438, _1498);
    float _1510 = _1382 * _1500;
    float _1512 = -_1504;
    float _1514 = fma(_1380, _1500, _1512);
    float _1516 = fma(_1470, _1458, _1494);
    float _1518 = fma(_1482, _1438, _1502);
    float _1520 = -_1510;
    float _1522 = fma(_1376, _1506, _1520);
    float _1524 = _1514 * _1508;
    float _1526 = fma(_1478, _1438, _1516);
    float _1528 = _1522 * _1508;
    float _1530 = fma(_1506, _1518, _1524);
    float _1532 = fma(_1496, _1518, _1528);
    float _1534 = fma(_1382, _1526, _1530);
    float _1536 = fma(_1380, _1526, _1532);
    float _1538 = _1118 + _1534;
    float _1540 = _1380 * _1506;
    float _1542 = _1108 + _1536;
    float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1546 = _1538 + _1544;
    float _1548 = -_1540;
    float _1550 = fma(_1382, _1496, _1548);
    float _1552 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1554 = _1542 + _1552;
    float _1556 = _1546 * _1546;
    float _1558 = _1550 * _1508;
    float _1560 = fma(_1554, _1554, _1556);
    float _1562 = fma(_1500, _1518, _1558);
    float _1564 = sqrt(_1560);
    float _1566 = fma(_1376, _1526, _1562);
    float _1568 = _1294 + _1566;
    bool _1570 = _1564 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1572 = _1556;
    float _1574 = _1542;
    float _1576 = _1538;
    float _1578 = _1546;
    int _1580 = as_type<int>(_1446);
    if (!_1570)
    {
        _1572 = _1542;
    }
    float _1582 = _1572;
    float _1584 = _1582;
    if (!_1570)
    {
        _1574 = _1568;
    }
    float _1586 = _1574;
    bool _1588 = !_1570;
    float _1590 = _1586;
    if (!_1588)
    {
        float _1592 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1594 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1596 = _1564 + _1594;
        float _1598 = _1568 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1600 = rsqrt(_1560);
        float _1602 = _1596 * _1592;
        float _1604 = _1602 * 0.15915493667125701904296875;
        float _1606 = _1604 * 6.283185482025146484375;
        float _1608 = cos(_1606);
        float _1610 = _1604 * 6.283185482025146484375;
        float _1612 = sin(_1610);
        float _1614 = _1608 + (-1.0);
        float _1616 = _1614 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1618 = fma(_1612, _1598, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1620 = fma(_1568, _1608, _1616);
        float _1622 = _1600 * _1618;
        float _1624 = fma(_1554, _1622, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1626 = fma(_1546, _1622, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1590 = _1620;
        _1584 = _1624;
        _1576 = _1626;
    }
    float _1628 = _1590;
    float _1630 = _1584;
    float _1632 = _1576;
    float _1634 = -_1294;
    float _1636 = _1634 + _1628;
    float _1638 = -_1108;
    float _1640 = _1638 + _1630;
    float _1642 = -_1118;
    float _1644 = _1642 + _1632;
    float _1646 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1648 = _1636 * _1636;
    float _1650 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1652 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1654 = isnan(0.5);
    bool _1656 = _1652 || _1654;
    bool _1658 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1660 = _1656 || _1658;
    float _1662 = fma(_1640, _1640, _1648);
    float _1664 = fma(_1644, _1644, _1662);
    float _1666 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1646);
    float _1668 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1650);
    float _1670 = sqrt(_1664);
    float _1672 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1666);
    float _1674 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1668);
    float _1676 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1678 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1680 = 1.0 / _1676;
    float _1682 = _1678 + _1676;
    float _1684 = _1678;
    float _1686 = _1682;
    float _1688 = _1628;
    float _1690 = _1630;
    float _1692 = _1636;
    if (_1660)
    {
        _1684 = 1.0;
    }
    float _1694 = _1684;
    bool _1696 = _1670 > 0.0;
    float _1698 = _1682 * _1680;
    float _1700 = _1698 * 0.5;
    float _1702 = _1694;
    if (!_1696)
    {
        _1686 = _1632;
    }
    float _1704 = _1686;
    bool _1706 = !_1696;
    float _1708 = _1704;
    if (!_1706)
    {
        float _1710 = _168 * _168;
        float _1712 = fma(_166, _166, _1710);
        float _1714 = fma(_170, _170, _1712);
        float _1716 = rsqrt(_1664);
        float _1718 = sqrt(_1714);
        float _1720 = _1640 * _1716;
        float _1722 = _1636 * _1716;
        float _1724 = _1644 * _1716;
        bool _1726 = _1718 > 0.0;
        float _1728 = _1716;
        if (!_1726)
        {
            _1728 = _1632;
        }
        float _1730 = _1728;
        bool _1732 = !_1726;
        _1708 = _1730;
        if (!_1732)
        {
            float _1734 = rsqrt(_1714);
            float _1736 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1738 = _168 * _1734;
            float _1740 = _166 * _1734;
            float _1742 = _170 * _1734;
            float _1744 = _1722 * _1738;
            float _1746 = fma(_1720, _1740, _1744);
            float _1748 = _1736 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1750 = fma(_1724, _1742, _1746);
            float _1752 = _1750 * _1748;
            float _1754 = fma(_166, _1752, _1630);
            float _1756 = fma(_168, _1752, _1628);
            float _1758 = fma(_170, _1752, _1632);
            _1688 = _1756;
            _1690 = _1754;
            _1708 = _1758;
            _1692 = _1746;
        }
    }
    float _1760 = _1688;
    float _1762 = _1690;
    float _1764 = _1708;
    float _1766 = _1692;
    float _1768 = _1766;
    if (!_1660)
    {
        float _1770 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1772 = _1770 * 0.15915493667125701904296875;
        float _1774 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1776 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1778 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1776);
        float _1780 = _1772 * 6.283185482025146484375;
        float _1782 = cos(_1780);
        float _1784 = _1774 * 0.15915493667125701904296875;
        float _1786 = _1772 * 6.283185482025146484375;
        float _1788 = sin(_1786);
        float _1790 = 1.0 / _1782;
        float _1792 = _1784 * 6.283185482025146484375;
        float _1794 = cos(_1792);
        float _1796 = _1788 * _1790;
        float _1798 = _1784 * 6.283185482025146484375;
        float _1800 = sin(_1798);
        float _1802 = _1794 * _1796;
        float _1804 = 1.0 / _1778;
        float _1806 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1808 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1806;
        float _1810 = 1.0 / _1802;
        float _1812 = 1.0 / _1808;
        float _1814 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1816 = _1804 * _1814;
        float _1818 = _1800 * _1810;
        float _1820 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1822 = fma(_1818, _1816, _1820);
        float _1824 = _1822 * _1812;
        float _1826 = precise::clamp(_1824, 0.0, 1.0);
        _1768 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
        _1702 = _1826;
    }
    float _1828 = _1768;
    float _1830 = _1702;
    float _1832 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1834 = _1760 + _1832;
    float _1836 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1838 = _1762 + _1836;
    float _1840 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1842 = _1764 + _1840;
    float _1844 = _1834 * _1834;
    float _1846 = fma(_1838, _1838, _1844);
    float _1848 = fma(_1842, _1842, _1846);
    float _1850 = rsqrt(_1848);
    float _1852 = sqrt(_1848);
    float _1854 = _1850 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1856 = _1838 * _1854;
    float _1858 = _1842 * _1854;
    float _1860 = _1856 * _1856;
    float _1862 = _1858 * _1858;
    float _1864 = _1860 + _1862;
    float _1866 = sqrt(_1864);
    bool _1868 = _1866 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1870 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1872 = _1866 + _1870;
    float _1874 = _1850;
    float _1876 = _1864;
    float _1878 = _1872;
    float _1880 = _1828;
    float _1882 = _1834;
    if (_1868)
    {
        float _1884 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1874 = _1884;
    }
    float _1886 = _1874;
    if (_1868)
    {
        float _1888 = rsqrt(_1864);
        _1876 = _1888;
    }
    float _1890 = _1876;
    float _1892 = _1890;
    if (_1868)
    {
        float _1894 = _1872 * _1886;
        _1878 = _1894;
    }
    float _1896 = _1878;
    if (_1868)
    {
        float _1898 = _1896 * 0.15915493667125701904296875;
        _1880 = _1898;
    }
    float _1900 = _1880;
    float _1902 = _1842;
    float _1904 = _1900;
    if (_1868)
    {
        float _1906 = _1900 * 6.283185482025146484375;
        float _1908 = sin(_1906);
        _1902 = _1908;
    }
    float _1910 = _1902;
    float _1912 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1914 = precise::max(0.0, _1912);
    float _1916 = _1886;
    float _1918 = _1914;
    if (_1868)
    {
        float _1920 = _1900 * 6.283185482025146484375;
        float _1922 = cos(_1920);
        _1916 = _1922;
    }
    float _1924 = _1916;
    float _1926 = -_1854;
    float _1928 = -_1914;
    float _1930 = fma(_1834, _1926, _1928);
    if (_1868)
    {
        float _1932 = _1930 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1882 = _1932;
    }
    float _1934 = _1882;
    float _1936 = _1934;
    float _1938 = _1910;
    if (_1868)
    {
        float _1940 = fma(_1910, _1934, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1936 = _1940;
    }
    float _1942 = _1936;
    float _1944 = _1942;
    if (!_1868)
    {
        _1938 = _1856;
    }
    float _1946 = _1938;
    float _1948 = _1946;
    float _1950 = _1924;
    if (_1868)
    {
        float _1952 = _1924 + (-1.0);
        _1918 = _1952;
    }
    float _1954 = _1918;
    float _1956 = _1954;
    if (_1868)
    {
        float _1958 = _1890 * _1942;
        _1578 = _1958;
    }
    float _1960 = _1578;
    if (!_1868)
    {
        _1944 = _1930;
    }
    float _1962 = _1944;
    float _1964 = _1962;
    if (_1868)
    {
        float _1966 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1904 = _1966;
    }
    float _1968 = _1904;
    if (_1868)
    {
        float _1970 = _1856 * _1960;
        _1948 = _1970;
    }
    float _1972 = _1948;
    if (!_1868)
    {
        _1956 = _1858;
    }
    float _1974 = _1956;
    float _1976 = _1974;
    if (_1868)
    {
        float _1978 = _1858 * _1960;
        _1976 = _1978;
    }
    float _1980 = _1976;
    if (!_1868)
    {
        _1892 = _1860;
    }
    float _1982 = _1892;
    float _1984 = _1982;
    if (_1868)
    {
        float _1986 = fma(_1930, _1924, _1968);
        _1964 = _1986;
    }
    float _1988 = _1964;
    if (_1868)
    {
        float _1990 = _1972 * _1972;
        _1984 = _1990;
    }
    float _1992 = _1984;
    if (!_1868)
    {
        _1950 = _1862;
    }
    float _1994 = _1950;
    float _1996 = _1994;
    if (_1868)
    {
        float _1998 = _1980 * _1980;
        _1996 = _1998;
    }
    float _2000 = _1996;
    float _2002 = fma(_1988, _1988, _1992);
    float _2004 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2006 = _2002 + _2000;
    float _2008 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2010 = fma(_1852, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2008);
    float _2012 = precise::clamp(_2010, 0.0, 1.0);
    float _2014 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2004);
    float _2016 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2018 = rsqrt(_2006);
    float _2020 = -_2012;
    float _2022 = _2020 + 1.0;
    float _2024 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2014);
    float _2026 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2028 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2016);
    float _2030 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2032 = _2024 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2034 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2026);
    float _2036 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2028);
    float _2038 = abs(_2022);
    float _2040 = log2(_2038);
    float _2042 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2030);
    float _2044 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2034);
    float _2046 = _2036 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2048 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2050 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2042);
    float _2052 = _2044 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2054 = _2018 * _1972;
    float _2056 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2058 = _2018 * _1988;
    float _2060 = _2018 * _1980;
    float _2062 = _2054 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2064 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2056);
    float _2066 = _2032 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2068 = _2050 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2070 = -_2062;
    float _2072 = fma(_2058, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2070);
    float _2074 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2064);
    float _2076 = _2040 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2078 = -_2066;
    float _2080 = fma(_2078, _2048, 1.0);
    float _2082 = -_2060;
    float _2084 = fma(_2082, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2072);
    float _2086 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2074);
    float _2088 = exp2(_2076);
    float _2090 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2092 = fma(_2084, -0.5, 0.5);
    float _2094 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2096 = fma(_2084, 0.5, 0.5);
    float _2098 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2090);
    float _2100 = _2058 + 1.0;
    float _2102 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2094);
    float _2104 = log2(_2080);
    float _2106 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2098);
    float _2108 = fma(_2096, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2110 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2102);
    float _2112 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2106);
    float _2114 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2110);
    float _2116 = 1.0 / _2086;
    float _2118 = -_2058;
    float _2120 = fma(_2088, _2100, _2118);
    float _2122 = fma(_2096, _2108, -0.212114393711090087890625);
    float _2124 = fma(_2120, 0.5, 0.5);
    float _2126 = fma(_2096, _2122, 1.570728778839111328125);
    float _2128 = sqrt(_2092);
    float _2130 = _2104 * 0.693147182464599609375;
    float _2132 = _2130 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2134 = _2112 * _2116;
    float _2136 = _2114 * _2116;
    float _2138 = fma(_2134, 0.5, 0.5);
    float _2140 = fma(_2136, -0.5, 0.5);
    float _2142 = _2128 * 0.636619746685028076171875;
    float _2144 = -_2126;
    float _2146 = fma(_2142, _2144, 1.0);
    float3 _5811 = float3(_2138, _2140, _2132);
    float _2148 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5811, float3(0.0), isnan(_5811)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5811, float3(0.0), isnan(_5811)), level(0.0)).x;
    float3 _5822 = float3(_2138, _2140, _2132);
    float4 _2151 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5822, float3(0.0), isnan(_5822)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5822, float3(0.0), isnan(_5822)), level(0.0)).xyzw;
    float _2153 = _2151.x;
    float _2155 = _2151.y;
    float _2157 = _2151.z;
    float _2159 = _2151.w;
    float2 _5839 = float2(_2146, _2124);
    float3 _2163 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5839, float2(0.0), isnan(_5839)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5839, float2(0.0), isnan(_5839)), level(0.0)).xyz;
    float _2165 = _2163.x;
    float _2167 = _2163.y;
    float _2169 = _2163.z;
    float _2171 = in.m_61.y;
    float _2173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2175 = in.m_51.w;
    float _2177 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2179 = _2177 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2181 = _2040 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2183 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2185 = _976 > 0.5;
    float _2187 = 1.0 / _2179;
    float _2189 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2191 = _2189 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2193 = in.m_61.x;
    int _2195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2197 = _2195 != 0;
    float _2199 = _934 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2203 = _2201 != 0;
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    int _2205 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2207 = _2205 != 0;
    float _2209 = 1.0 / _2191;
    bool _2211 = _970 > 0.5;
    float _2213 = _2173 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2217 = _2215 != 0;
    float _2219 = _1444 * _2171;
    float _2221 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2183);
    float _2223 = _932 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2225 = _936 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _2227 = _2175 > 0.5;
    float _2229 = -_2219;
    float _2231 = _2229 + 1.0;
    float _2233 = -_2171;
    float _2235 = _2233 + 1.0;
    float _2237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2239 = _2219;
    float _2241 = _2171;
    bool _2243 = _2227;
    if (_2197)
    {
        float _2245 = _2211 ? _2231 : _2219;
        _2239 = _2245;
    }
    float _2247 = _2239;
    float _2249 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2251 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2249;
    if (_2203)
    {
        float _2253 = _2227 ? _2235 : _2171;
        _2241 = _2253;
    }
    float _2255 = _2241;
    float _2257 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2259 = _2257 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _2261 = _966 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2263 = isnan(_966);
    bool _2265 = _2261 || _2263;
    bool _2267 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2269 = _2265 || _2267;
    float _2271 = float(_2269);
    float _2273 = _2251 * _2187;
    bool _2275 = _966 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2277 = isnan(_966);
    bool _2279 = _2275 || _2277;
    bool _2281 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2283 = _2279 || _2281;
    float _2285 = float(_2283);
    float _2287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2289 = _2255;
    float _2291 = _2273;
    if (_2207)
    {
        bool _2293 = _968 > 0.5;
        _2243 = _2293;
    }
    bool _2295 = _2243;
    float _2297 = _2259 * _2209;
    float _2299 = fma(_2213, _2255, -0.5);
    float _2301 = -_2285;
    float _2303 = _2301 + 1.0;
    bool _2305 = _966 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2307 = isnan(_966);
    bool _2309 = _2305 || _2307;
    bool _2311 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2313 = _2309 || _2311;
    float _2315 = float(_2313);
    float _2317 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2319 = _966 + _2317;
    if (!_2207)
    {
        _2289 = _2193;
    }
    float _2321 = _2289;
    float _2323 = _2271 * _2303;
    float _2325 = -_2271;
    float _2327 = _2325 + 1.0;
    float _2329 = fma(_2273, _2319, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2331 = _2321;
    if (!_2207)
    {
        _2291 = _2321;
    }
    float _2333 = _2291;
    float _2335 = exp2(_2181);
    float _2337 = _2315 * _2327;
    float _2339 = _2333;
    if (_2207)
    {
        _2331 = _2193;
    }
    float _2341 = _2331;
    float _2343 = -_2315;
    float _2345 = _2343 + 1.0;
    float _2347 = _2287 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2349 = _2329 * _2337;
    float _2351 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2353 = _966 + _2351;
    float _2355 = _1446 * _2341;
    float _2357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2359 = fma(_2345, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2349);
    float _2361 = _2355;
    if (_2207)
    {
        float _2363 = -_2341;
        float _2365 = _2363 + 1.0;
        _1580 = as_type<int>(_2365);
    }
    int _2367 = _1580;
    float _2369 = -_2355;
    float _2371 = _2369 + 1.0;
    float _2373 = fma(_2297, _2353, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2375 = fma(_2347, _2247, -0.5);
    float _2377 = -_1266;
    float _2379 = fma(_1150, _2299, _2377);
    if (_2207)
    {
        float _2381 = _2295 ? as_type<float>(_2367) : _2341;
        _2339 = _2381;
    }
    float _2383 = _2339;
    float _2385 = fma(_2373, _2323, _2359);
    if (_2217)
    {
        float _2387 = _2185 ? _2371 : _2355;
        _2361 = _2387;
    }
    float _2389 = _2361;
    float _2391 = _2237 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2393 = -_2335;
    float _2395 = _2393 + 1.0;
    float _2397 = -_1258;
    float _2399 = fma(_1264, _2375, _2397);
    float _2401 = _2199 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2403 = fma(_2391, _2383, -0.5);
    float _2405 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2221);
    float _2407 = _2357 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2409 = _2395 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2411 = fma(_2285, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2385);
    float _2413 = _2223 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2415 = fma(_2407, _2389, -0.5);
    float _2417 = fma(_1260, _2403, _1272);
    float _2419 = _2086 * 0.5;
    float _2421 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2405);
    float _2423 = fma(_1262, _2415, _1096);
    bool _2425 = _1830 > 0.0;
    bool _2427 = isnan(_1830);
    bool _2429 = _2425 || _2427;
    bool _2431 = isnan(0.0);
    bool _2433 = _2429 || _2431;
    float _2435 = _2399 + 0.5;
    float _2437 = _2379 + 0.5;
    float _2439 = _2417 + 0.5;
    float _2441 = _2423 + 0.5;
    float _2443 = fma(_2114, -0.5, _2419);
    float _2445 = _2225 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2447 = -_2409;
    float _2449 = _2447 + 1.0;
    float _2451 = _1830 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2453 = _2421 + _2086;
    float _2455 = _2112 + _2086;
    out.m_65.x = _2441;
    out.m_65.y = _2435;
    out.m_65.z = _2439;
    out.m_65.w = _2437;
    float _2457 = _2411 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2459 = _2453 * 0.5;
    float _2461 = _2455 * 0.5;
    float _2463 = _2451 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.x = _2413;
    out.m_67.y = _2401;
    out.m_67.z = _2445;
    out.m_67.w = _2457;
    out.gl_Position.x = _2112;
    out.gl_Position.y = _2114;
    out.gl_Position.z = _2421;
    out.gl_Position.w = _2086;
    out.m_69.x = _2461;
    out.m_69.y = _2443;
    out.m_69.z = _2459;
    out.m_69.w = _2086;
    out.m_45.x = _2463;
    float _2465 = _2409 * _2148;
    float _2467 = _2159 * _2449;
    float _2469 = _2159 * _2465;
    float _2471 = _2169 * _2465;
    float _2473 = fma(_2165, _2469, _2153);
    float _2475 = fma(_2167, _2469, _2155);
    float _2477 = fma(_2159, _2471, _2157);
    out.m_71.x = _2473;
    out.m_71.y = _2475;
    out.m_71.z = _2477;
    out.m_71.w = _2467;
    if (_2433)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2479 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2479;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _958 = false;
    bool _736 = false;
    bool _594 = false;
    bool _360 = false;
    bool _192 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2536 = as_type<float>(_106);
        out.gl_Position.z = _2536;
    }
    if (!_94)
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
    float _128 = _124;
    if (_120)
    {
        float _130 = float(_90);
        _126 = _130;
    }
    float _132 = _126;
    bool _134 = _124 >= _132;
    bool _136 = !_120;
    bool _138 = _134 || _136;
    if (_138)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _100;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2605 = as_type<float>(_144);
        out.gl_Position.z = _2605;
    }
    if (_138)
    {
        return out;
    }
    float _146 = in.m_49.x;
    float _148 = in.m_49.y;
    float _150 = in.m_49.z;
    bool _152 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _154 = _148 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _156 = _148 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _158 = _148 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _160 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[4].x, _154);
    float _162 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[5].x, _156);
    float _164 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[6].x, _158);
    float _166 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].z, _160);
    float _168 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].z, _162);
    float _170 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].z, _164);
    bool _172 = !_152;
    float _190;
    if (!_172)
    {
        float _174 = in.m_51.x;
        float _176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _180 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _182 = _180 * _176;
        float _184 = floor(_182);
        float _186 = -_184;
        float _188 = _182 + _186;
        _190 = _188;
        _192 = true;
    }
    else
    {
        float _194 = float(_90);
        float _196 = 1.0 / _194;
        float _198 = _124 * _196;
        _190 = _198;
    }
    _192 = false;
    float _200 = _190;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _204 = _200 + _202;
    bool _206 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _208 = isnan(_200);
    bool _210 = _206 || _208;
    bool _212 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _214 = _210 || _212;
    float _216 = float(_214);
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _220 = _200 + _218;
    bool _222 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _224 = isnan(_200);
    bool _226 = _222 || _224;
    bool _228 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _230 = _226 || _228;
    float _232 = float(_230);
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _240 = _238 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _242 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _244 = isnan(_200);
    bool _246 = _242 || _244;
    bool _248 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _250 = _246 || _248;
    float _252 = float(_250);
    float _254 = -_216;
    float _256 = _254 + 1.0;
    float _258 = 1.0 / _240;
    float _260 = _252 * _256;
    float _262 = -_252;
    float _264 = _262 + 1.0;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _266;
    bool _270 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _272 = 1.0 / _236;
    float _274 = _232 * _264;
    float _276 = -_232;
    float _278 = _276 + 1.0;
    float _280 = _220 * _258;
    float _282 = _204 * _272;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _284;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _288;
    float _292 = fma(_268, _282, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _294 = fma(_286, _282, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _296 = fma(_290, _282, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _298 = _292 * _274;
    float _300 = _294 * _274;
    float _302 = _296 * _274;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _316 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].x, _298);
    float _318 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].y, _300);
    float _320 = fma(_306, _280, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _322 = fma(_310, _280, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _324 = fma(_314, _280, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _326 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].z, _302);
    float _328 = fma(_320, _260, _316);
    float _330 = fma(_322, _260, _318);
    float _332 = fma(_324, _260, _326);
    float _334 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[145].x, _328);
    float _336 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[145].y, _330);
    float _338 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[145].z, _332);
    bool _340 = !_270;
    float _358;
    if (!_340)
    {
        float _342 = in.m_51.x;
        float _344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _346 = _342 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _348 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _350 = _348 * _344;
        float _352 = floor(_350);
        float _354 = -_352;
        float _356 = _350 + _354;
        _358 = _356;
        _360 = true;
    }
    else
    {
        float _362 = float(_90);
        float _364 = 1.0 / _362;
        float _366 = _124 * _364;
        _358 = _366;
    }
    _360 = false;
    float _368 = _358;
    float _370 = in.m_53.x;
    float _372 = in.m_53.y;
    float _374 = in.m_53.z;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _378 = _368 + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _392 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _394 = 1.0 / _382;
    float _396 = 1.0 / _386;
    float _398 = _338 * _374;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _402 = _368 + _400;
    float _404 = _336 * _372;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _408 = _368 + _406;
    float _410 = 1.0 / _390;
    bool _412 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _414 = isnan(_368);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = _378 * _394;
    bool _426 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _428 = isnan(_368);
    bool _430 = _426 || _428;
    bool _432 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _438;
    float _442 = _334 * _370;
    float _444 = -_422;
    float _446 = _444 + 1.0;
    float _448 = _402 * _396;
    float _450 = _436 * _446;
    bool _452 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _454 = isnan(_368);
    bool _456 = _452 || _454;
    bool _458 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _460 = _456 || _458;
    float _462 = float(_460);
    float _464 = -_436;
    float _466 = _464 + 1.0;
    bool _468 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _470 = isnan(_368);
    bool _472 = _468 || _470;
    bool _474 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _476 = _472 || _474;
    float _478 = float(_476);
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _480;
    float _484 = fma(_440, _448, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _486 = _408 * _410;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _488;
    float _492 = -_462;
    float _494 = _492 + 1.0;
    float _496 = fma(_482, _448, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _502 = fma(_490, _448, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _504 = _462 * _466;
    float _506 = _478 * _494;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _516 = fma(_500, _486, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _518 = _502 * _506;
    float _520 = fma(_510, _486, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _522 = fma(_514, _486, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _524 = _496 * _506;
    float _526 = _484 * _506;
    float _528 = -_478;
    float _530 = _528 + 1.0;
    float _532 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[107].x, _524);
    float _534 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[107].y, _526);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _536;
    float _540 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[107].z, _518);
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _542;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _546;
    float _550 = fma(_516, _504, _532);
    float _552 = fma(_538, _424, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _554 = fma(_544, _424, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _556 = fma(_548, _424, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _558 = fma(_520, _504, _534);
    float _560 = fma(_522, _504, _540);
    float _562 = fma(_552, _450, _550);
    float _564 = fma(_554, _450, _558);
    float _566 = fma(_556, _450, _560);
    float _568 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[110].x, _562);
    float _570 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[110].y, _564);
    float _572 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[110].z, _566);
    bool _574 = !_392;
    float _592;
    if (!_574)
    {
        float _576 = in.m_51.x;
        float _578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _580 = _576 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _582 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _584 = _582 * _578;
        float _586 = floor(_584);
        float _588 = -_586;
        float _590 = _584 + _588;
        _592 = _590;
        _594 = true;
    }
    else
    {
        float _596 = float(_90);
        float _598 = 1.0 / _596;
        float _600 = _124 * _598;
        _592 = _600;
    }
    _594 = false;
    float _602 = _592;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _606 = _602 + _604;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _612 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _614 = isnan(_602);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _628 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _630 = isnan(_602);
    bool _632 = _628 || _630;
    bool _634 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _636 = _632 || _634;
    float _638 = float(_636);
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _640;
    bool _644 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _646 = isnan(_602);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = 1.0 / _610;
    float _658 = -_622;
    float _660 = _658 + 1.0;
    bool _662 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _664 = _638 * _660;
    float _666 = -_638;
    float _668 = _666 + 1.0;
    float _670 = 1.0 / _626;
    float _672 = _642 * _656;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _676 = _674 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _678 = fma(_672, _606, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _680 = -_654;
    float _682 = _680 + 1.0;
    float _684 = _678 * _664;
    float _686 = _676 * _670;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _690 = _602 + _688;
    float _692 = _622 * _682;
    float _694 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[115].x, _684);
    float _696 = _568 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _698 = fma(_686, _690, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _700 = _570 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _702 = _572 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _704 = _696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _706 = fma(_698, _692, _694);
    float _708 = _700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = _702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _712 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[117].x, _706);
    float _714 = _712 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _704;
    out.m_55.y = _708;
    out.m_55.z = _710;
    out.m_55.w = _714;
    bool _716 = !_662;
    float _734;
    if (!_716)
    {
        float _718 = in.m_51.x;
        float _720 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _722 = _718 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _724 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _726 = _724 * _720;
        float _728 = floor(_726);
        float _730 = -_728;
        float _732 = _726 + _730;
        _734 = _732;
        _736 = true;
    }
    else
    {
        float _738 = float(_90);
        float _740 = 1.0 / _738;
        float _742 = _124 * _740;
        _734 = _742;
    }
    _736 = false;
    float _744 = _734;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _748 = _744 + _746;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _752 = _744 + _750;
    bool _754 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _756 = isnan(_744);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _766;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _772 = _770 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _774;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _780 = _744 + _778;
    float _782 = 1.0 / _776;
    bool _784 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _786 = 1.0 / _772;
    bool _788 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _790 = isnan(_744);
    bool _792 = _788 || _790;
    bool _794 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _796 = _792 || _794;
    float _798 = float(_796);
    float _800 = 1.0 / _768;
    float _802 = _752 * _782;
    float _804 = -_764;
    float _806 = _804 + 1.0;
    bool _808 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _810 = isnan(_744);
    bool _812 = _808 || _810;
    bool _814 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _816 = _812 || _814;
    float _818 = float(_816);
    float _820 = _798 * _806;
    float _822 = -_798;
    float _824 = _822 + 1.0;
    float _826 = _748 * _786;
    bool _828 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _830 = isnan(_744);
    bool _832 = _828 || _830;
    bool _834 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _836 = _832 || _834;
    float _838 = float(_836);
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _840;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _846 = _844 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _848 = -_838;
    float _850 = _848 + 1.0;
    float _852 = fma(_846, _826, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _854 = _780 * _800;
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _856;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _860;
    float _864 = _818 * _850;
    float _866 = fma(_842, _854, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _868 = fma(_858, _854, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _870 = fma(_862, _854, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _872 = _838 * _824;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _876 = _874 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _882 = _868 * _864;
    float _884 = _870 * _864;
    float _886 = _866 * _864;
    float _888 = fma(_876, _826, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _890 = fma(_880, _826, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _892 = -_818;
    float _894 = _892 + 1.0;
    float _896 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[123].y, _884);
    float _898 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[123].x, _882);
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _900;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _904;
    float _908 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[123].z, _886);
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _910;
    float _914 = fma(_852, _872, _898);
    float _916 = fma(_902, _802, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _918 = fma(_906, _802, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _920 = fma(_888, _872, _896);
    float _922 = fma(_912, _802, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _924 = fma(_890, _872, _908);
    float _926 = fma(_916, _820, _914);
    float _928 = fma(_918, _820, _920);
    float _930 = fma(_922, _820, _924);
    float _932 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[126].x, _926);
    float _934 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[126].y, _928);
    float _936 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[126].z, _930);
    bool _938 = !_784;
    float _956;
    if (!_938)
    {
        float _940 = in.m_51.x;
        float _942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _944 = _940 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _946 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _948 = _946 * _942;
        float _950 = floor(_948);
        float _952 = -_950;
        float _954 = _948 + _952;
        _956 = _954;
        _958 = true;
    }
    else
    {
        float _960 = float(_90);
        float _962 = 1.0 / _960;
        float _964 = _124 * _962;
        _956 = _964;
    }
    _958 = false;
    float _966 = _956;
    float _968 = in.m_51.z;
    float _970 = in.m_51.y;
    int _972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _974 = _972 != 0;
    float _976 = in.m_51.x;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _982 = _980 != 0;
    int _984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _986 = _984 != 0;
    int _988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _990 = _988 != 0;
    float _992 = in.m_42.x;
    float _994 = in.m_42.y;
    float _996 = in.m_42.z;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1000 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1002 = _968 * 2.0;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1006 = _970 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1008 = _970 * 2.0;
    float _1010 = floor(_1002);
    float _1012 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1004);
    float _1014 = _976 * 2.0;
    float _1016 = _976 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1018 = fma(_1006, -2.0, _978);
    float _1020 = _994 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1022 = -_998;
    float _1024 = fma(_1016, 2.0, _1022);
    float _1026 = _994 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1028 = floor(_1014);
    float _1030 = _994 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1032 = fma(_992, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1020);
    float _1034 = fma(_992, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1026);
    float _1036 = _1026;
    if (!_974)
    {
        _1036 = _968;
    }
    float _1038 = _1036;
    float _1040 = fma(_992, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1030);
    float _1042 = _976 + _970;
    bool _1044 = _1010 > 0.0;
    float _1046 = floor(_1008);
    bool _1048 = _1010 >= 0.0;
    bool _1050 = isnan(_1010);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan(0.0);
    bool _1056 = _1052 || _1054;
    float _1058 = _1042 + (-1.0);
    float _1060 = _1010;
    float _1062 = _1042;
    float _1064 = _1038;
    if (!_974)
    {
        _1060 = _970;
    }
    float _1066 = _1060;
    float _1068 = fma(_996, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1034);
    float _1070 = _1066;
    if (!_974)
    {
        _1062 = _968;
    }
    float _1072 = _1062;
    float _1074 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1076 = _1072;
    if (_974)
    {
        _1070 = _976;
    }
    float _1078 = _1070;
    float _1080 = fma(_996, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1032);
    if (_974)
    {
        _1064 = _970;
    }
    float _1082 = _1064;
    float _1084 = fma(_996, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1040);
    if (_974)
    {
        _1076 = _970;
    }
    float _1086 = _1076;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1090 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1092 = _1028 > 0.0;
    float _1094 = -_124;
    float _1096 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1024);
    bool _1098 = _1028 >= 0.0;
    bool _1100 = isnan(_1028);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan(0.0);
    bool _1106 = _1102 || _1104;
    float _1108 = _1068 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1110 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1112 = log2(_1110);
    bool _1114 = !_982;
    int _1116 = _1114 ? 0 : 1;
    float _1118 = _1084 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1120 = _1056 ? 0 : 1;
    bool _1122 = _1046 > 0.0;
    bool _1124 = _1046 >= 0.0;
    bool _1126 = isnan(_1046);
    bool _1128 = _1124 || _1126;
    bool _1130 = isnan(0.0);
    bool _1132 = _1128 || _1130;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1136 = abs(_1116);
    float _1138 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1088);
    int _1140 = ~_1120;
    int _1142 = _1140 + 1;
    int _1144 = _1142 + 1;
    float _1146 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1134);
    float _1148 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1150 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1138);
    int _1152 = _1144;
    if (!_1044)
    {
        int _1154 = ~_1120;
        int _1156 = _1154 + 1;
        _1152 = _1156;
    }
    int _1158 = _1152;
    float _1160 = _1112 * _124;
    float _1162 = -_1000;
    float _1164 = fma(_1148, 2.0, _1162);
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1168 = _1106 ? 0 : 1;
    float _1170 = fma(_1090, -2.0, _1166);
    int _1172 = _1132 ? 0 : 1;
    float _1174 = exp2(_1160);
    float _1176 = float(_1136);
    float _1178 = float(_1158);
    int _1180 = ~_1168;
    int _1182 = _1180 + 1;
    int _1184 = _1182 + 1;
    int _1186 = ~_1172;
    int _1188 = _1186 + 1;
    int _1190 = _1188 + 1;
    float _1192 = _1176 * _1178;
    int _1194 = _1184;
    int _1196 = _1190;
    if (!_1092)
    {
        int _1198 = ~_1168;
        int _1200 = _1198 + 1;
        _1194 = _1200;
    }
    int _1202 = _1194;
    float _1204 = _1192 * (-2.0);
    if (!_1122)
    {
        int _1206 = ~_1172;
        int _1208 = _1206 + 1;
        _1196 = _1208;
    }
    int _1210 = _1196;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1214 = 1.0 + _1212;
    float _1216 = in.m_57.x;
    float _1218 = in.m_57.y;
    float _1220 = in.m_57.z;
    float _1222 = -_1174;
    float _1224 = _1222 + 1.0;
    float _1226 = 1.0 / _1214;
    bool _1228 = !_986;
    int _1230 = _1228 ? 0 : 1;
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1234 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1236 = isnan(1.0);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1242 = _1238 || _1240;
    int _1244 = abs(_1230);
    float _1246 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1232);
    bool _1248 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1250 = isnan(0.0);
    bool _1252 = _1248 || _1250;
    bool _1254 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1256 = _1252 || _1254;
    float _1258 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1018);
    float _1260 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1146);
    float _1262 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1246);
    float _1264 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1012);
    float _1266 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1170);
    float _1268 = _1256 ? _1224 : 0.0;
    float _1270 = -_124;
    float _1272 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1164);
    float _1274 = float(_1244);
    float _1276 = _976 + (-0.5);
    float _1278 = float(_1202);
    if (_1242)
    {
        float _1280 = _1268 * _1226;
        _128 = _1280;
    }
    float _1282 = _128;
    float _1284 = fma(_1204, _1216, _1216);
    float _1286 = fma(_1074, _1204, _1074);
    bool _1288 = !_990;
    int _1290 = _1288 ? 0 : 1;
    float _1292 = _1274 * _1278;
    float _1294 = _1080 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1296 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1284);
    float _1298 = -_1108;
    float _1300 = _1298 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1302 = float(_1210);
    float _1304 = -_1294;
    float _1306 = _1304 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1308 = fma(_1286, _1282, _1296);
    int _1310 = abs(_1290);
    float _1312 = _970 + _968;
    float _1314 = _1306 * _1306;
    float _1316 = -_1118;
    float _1318 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1320 = float(_1310);
    float _1322 = _1312 + (-1.0);
    float _1324 = fma(_1300, _1300, _1314);
    float _1326 = _1292 * (-2.0);
    float _1328 = _1308 * 0.15915493667125701904296875;
    float _1330 = _1320 * _1302;
    float _1332 = fma(_1318, _1318, _1324);
    float _1334 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1336 = _970 + (-0.5);
    float _1338 = fma(_1326, _1218, _1218);
    float _1340 = _976 + _968;
    float _1342 = fma(_1334, _1326, _1334);
    float _1344 = rsqrt(_1332);
    float _1346 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1338);
    float _1348 = _1340 + (-1.0);
    float _1350 = _1330 * (-2.0);
    float _1352 = fma(_1342, _1282, _1346);
    float _1354 = _968 + (-0.5);
    float _1356 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1358 = fma(_1350, _1220, _1220);
    float _1360 = _1352 * 0.15915493667125701904296875;
    float _1362 = _1328 * 6.283185482025146484375;
    float _1364 = sin(_1362);
    float _1366 = in.m_59.x;
    float _1368 = in.m_59.y;
    float _1370 = in.m_59.z;
    float _1372 = fma(_1356, _1350, _1356);
    float _1374 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1358);
    float _1376 = _1306 * _1344;
    float _1378 = fma(_1372, _1282, _1374);
    float _1380 = _1300 * _1344;
    float _1382 = _1318 * _1344;
    float _1384 = _1328 * 6.283185482025146484375;
    float _1386 = cos(_1384);
    float _1388 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1390 = _1380 * _1388;
    float _1392 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1394 = _1382 * _1392;
    float _1396 = _398 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1398 = _1378 * 0.15915493667125701904296875;
    float _1400 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1402 = -_1390;
    float _1404 = fma(_1382, _1400, _1402);
    float _1406 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1408 = -_1394;
    float _1410 = fma(_1376, _1406, _1408);
    float _1412 = _1360 * 6.283185482025146484375;
    float _1414 = sin(_1412);
    float _1416 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1418 = _1376 * _1416;
    float _1420 = _1404 * _1404;
    float _1422 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1424 = -_1418;
    float _1426 = fma(_1380, _1422, _1424);
    float _1428 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1370);
    float _1430 = fma(_1410, _1410, _1420);
    float _1432 = _1360 * 6.283185482025146484375;
    float _1434 = cos(_1432);
    float _1436 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1366);
    float _1438 = _1396 * _1428;
    float _1440 = fma(_1426, _1426, _1430);
    float _1442 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1368);
    float _1444 = _404 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1446 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1448 = _1398 * 6.283185482025146484375;
    float _1450 = sin(_1448);
    float _1452 = _1386 * _1414;
    float _1454 = _1444 * _1442;
    float _1456 = _1364 * _1414;
    float _1458 = _1446 * _1436;
    float _1460 = _1398 * 6.283185482025146484375;
    float _1462 = cos(_1460);
    float _1464 = _1364 * _1434;
    float _1466 = rsqrt(_1440);
    float _1468 = -_1452;
    float _1470 = fma(_1450, _1464, _1468);
    float _1472 = -_1464;
    float _1474 = fma(_1450, _1452, _1472);
    float _1476 = _1386 * _1434;
    float _1478 = fma(_1450, _1456, _1476);
    float _1480 = _1462 * _1454;
    float _1482 = _1414 * _1462;
    float _1484 = fma(_1450, _1476, _1456);
    float _1486 = _1434 * _1462;
    float _1488 = _1386 * _1480;
    float _1490 = -_1454;
    float _1492 = _1450 * _1490;
    float _1494 = _1364 * _1480;
    float _1496 = _1410 * _1466;
    float _1498 = fma(_1484, _1458, _1488);
    float _1500 = _1404 * _1466;
    float _1502 = fma(_1486, _1458, _1492);
    float _1504 = _1376 * _1496;
    float _1506 = _1426 * _1466;
    float _1508 = fma(_1474, _1438, _1498);
    float _1510 = _1382 * _1500;
    float _1512 = -_1504;
    float _1514 = fma(_1380, _1500, _1512);
    float _1516 = fma(_1470, _1458, _1494);
    float _1518 = fma(_1482, _1438, _1502);
    float _1520 = -_1510;
    float _1522 = fma(_1376, _1506, _1520);
    float _1524 = _1514 * _1508;
    float _1526 = fma(_1478, _1438, _1516);
    float _1528 = _1522 * _1508;
    float _1530 = fma(_1506, _1518, _1524);
    float _1532 = fma(_1496, _1518, _1528);
    float _1534 = fma(_1382, _1526, _1530);
    float _1536 = fma(_1380, _1526, _1532);
    float _1538 = _1118 + _1534;
    float _1540 = _1380 * _1506;
    float _1542 = _1108 + _1536;
    float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1546 = _1538 + _1544;
    float _1548 = -_1540;
    float _1550 = fma(_1382, _1496, _1548);
    float _1552 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1554 = _1542 + _1552;
    float _1556 = _1546 * _1546;
    float _1558 = _1550 * _1508;
    float _1560 = fma(_1554, _1554, _1556);
    float _1562 = fma(_1500, _1518, _1558);
    float _1564 = sqrt(_1560);
    float _1566 = fma(_1376, _1526, _1562);
    float _1568 = _1294 + _1566;
    bool _1570 = _1564 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1572 = _1556;
    float _1574 = _1542;
    float _1576 = _1538;
    float _1578 = _1546;
    int _1580 = as_type<int>(_1446);
    if (!_1570)
    {
        _1572 = _1542;
    }
    float _1582 = _1572;
    float _1584 = _1582;
    if (!_1570)
    {
        _1574 = _1568;
    }
    float _1586 = _1574;
    bool _1588 = !_1570;
    float _1590 = _1586;
    if (!_1588)
    {
        float _1592 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1594 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1596 = _1564 + _1594;
        float _1598 = _1568 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1600 = rsqrt(_1560);
        float _1602 = _1596 * _1592;
        float _1604 = _1602 * 0.15915493667125701904296875;
        float _1606 = _1604 * 6.283185482025146484375;
        float _1608 = cos(_1606);
        float _1610 = _1604 * 6.283185482025146484375;
        float _1612 = sin(_1610);
        float _1614 = _1608 + (-1.0);
        float _1616 = _1614 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1618 = fma(_1612, _1598, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1620 = fma(_1568, _1608, _1616);
        float _1622 = _1600 * _1618;
        float _1624 = fma(_1554, _1622, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1626 = fma(_1546, _1622, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1590 = _1620;
        _1584 = _1624;
        _1576 = _1626;
    }
    float _1628 = _1590;
    float _1630 = _1584;
    float _1632 = _1576;
    float _1634 = -_1294;
    float _1636 = _1634 + _1628;
    float _1638 = -_1108;
    float _1640 = _1638 + _1630;
    float _1642 = -_1118;
    float _1644 = _1642 + _1632;
    float _1646 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1648 = _1636 * _1636;
    float _1650 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1652 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1654 = isnan(0.5);
    bool _1656 = _1652 || _1654;
    bool _1658 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1660 = _1656 || _1658;
    float _1662 = fma(_1640, _1640, _1648);
    float _1664 = fma(_1644, _1644, _1662);
    float _1666 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1646);
    float _1668 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1650);
    float _1670 = sqrt(_1664);
    float _1672 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1666);
    float _1674 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1668);
    float _1676 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1678 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1680 = 1.0 / _1676;
    float _1682 = _1678 + _1676;
    float _1684 = _1678;
    float _1686 = _1682;
    float _1688 = _1628;
    float _1690 = _1630;
    float _1692 = _1636;
    if (_1660)
    {
        _1684 = 1.0;
    }
    float _1694 = _1684;
    bool _1696 = _1670 > 0.0;
    float _1698 = _1682 * _1680;
    float _1700 = _1698 * 0.5;
    float _1702 = _1694;
    if (!_1696)
    {
        _1686 = _1632;
    }
    float _1704 = _1686;
    bool _1706 = !_1696;
    float _1708 = _1704;
    if (!_1706)
    {
        float _1710 = _168 * _168;
        float _1712 = fma(_166, _166, _1710);
        float _1714 = fma(_170, _170, _1712);
        float _1716 = rsqrt(_1664);
        float _1718 = sqrt(_1714);
        float _1720 = _1640 * _1716;
        float _1722 = _1636 * _1716;
        float _1724 = _1644 * _1716;
        bool _1726 = _1718 > 0.0;
        float _1728 = _1716;
        if (!_1726)
        {
            _1728 = _1632;
        }
        float _1730 = _1728;
        bool _1732 = !_1726;
        _1708 = _1730;
        if (!_1732)
        {
            float _1734 = rsqrt(_1714);
            float _1736 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1738 = _168 * _1734;
            float _1740 = _166 * _1734;
            float _1742 = _170 * _1734;
            float _1744 = _1722 * _1738;
            float _1746 = fma(_1720, _1740, _1744);
            float _1748 = _1736 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1750 = fma(_1724, _1742, _1746);
            float _1752 = _1750 * _1748;
            float _1754 = fma(_166, _1752, _1630);
            float _1756 = fma(_168, _1752, _1628);
            float _1758 = fma(_170, _1752, _1632);
            _1688 = _1756;
            _1690 = _1754;
            _1708 = _1758;
            _1692 = _1746;
        }
    }
    float _1760 = _1688;
    float _1762 = _1690;
    float _1764 = _1708;
    float _1766 = _1692;
    float _1768 = _1766;
    if (!_1660)
    {
        float _1770 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1772 = _1770 * 0.15915493667125701904296875;
        float _1774 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1776 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1778 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1776);
        float _1780 = _1772 * 6.283185482025146484375;
        float _1782 = cos(_1780);
        float _1784 = _1774 * 0.15915493667125701904296875;
        float _1786 = _1772 * 6.283185482025146484375;
        float _1788 = sin(_1786);
        float _1790 = 1.0 / _1782;
        float _1792 = _1784 * 6.283185482025146484375;
        float _1794 = cos(_1792);
        float _1796 = _1788 * _1790;
        float _1798 = _1784 * 6.283185482025146484375;
        float _1800 = sin(_1798);
        float _1802 = _1794 * _1796;
        float _1804 = 1.0 / _1778;
        float _1806 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1808 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1806;
        float _1810 = 1.0 / _1802;
        float _1812 = 1.0 / _1808;
        float _1814 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1816 = _1804 * _1814;
        float _1818 = _1800 * _1810;
        float _1820 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1822 = fma(_1818, _1816, _1820);
        float _1824 = _1822 * _1812;
        float _1826 = precise::clamp(_1824, 0.0, 1.0);
        _1768 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
        _1702 = _1826;
    }
    float _1828 = _1768;
    float _1830 = _1702;
    float _1832 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1834 = _1760 + _1832;
    float _1836 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1838 = _1762 + _1836;
    float _1840 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1842 = _1764 + _1840;
    float _1844 = _1834 * _1834;
    float _1846 = fma(_1838, _1838, _1844);
    float _1848 = fma(_1842, _1842, _1846);
    float _1850 = rsqrt(_1848);
    float _1852 = sqrt(_1848);
    float _1854 = _1850 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1856 = _1838 * _1854;
    float _1858 = _1842 * _1854;
    float _1860 = _1856 * _1856;
    float _1862 = _1858 * _1858;
    float _1864 = _1860 + _1862;
    float _1866 = sqrt(_1864);
    bool _1868 = _1866 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1870 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1872 = _1866 + _1870;
    float _1874 = _1850;
    float _1876 = _1864;
    float _1878 = _1872;
    float _1880 = _1828;
    float _1882 = _1834;
    if (_1868)
    {
        float _1884 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1874 = _1884;
    }
    float _1886 = _1874;
    if (_1868)
    {
        float _1888 = rsqrt(_1864);
        _1876 = _1888;
    }
    float _1890 = _1876;
    float _1892 = _1890;
    if (_1868)
    {
        float _1894 = _1872 * _1886;
        _1878 = _1894;
    }
    float _1896 = _1878;
    if (_1868)
    {
        float _1898 = _1896 * 0.15915493667125701904296875;
        _1880 = _1898;
    }
    float _1900 = _1880;
    float _1902 = _1842;
    float _1904 = _1900;
    if (_1868)
    {
        float _1906 = _1900 * 6.283185482025146484375;
        float _1908 = sin(_1906);
        _1902 = _1908;
    }
    float _1910 = _1902;
    float _1912 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1914 = precise::max(0.0, _1912);
    float _1916 = _1886;
    float _1918 = _1914;
    if (_1868)
    {
        float _1920 = _1900 * 6.283185482025146484375;
        float _1922 = cos(_1920);
        _1916 = _1922;
    }
    float _1924 = _1916;
    float _1926 = -_1854;
    float _1928 = -_1914;
    float _1930 = fma(_1834, _1926, _1928);
    if (_1868)
    {
        float _1932 = _1930 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1882 = _1932;
    }
    float _1934 = _1882;
    float _1936 = _1934;
    float _1938 = _1910;
    if (_1868)
    {
        float _1940 = fma(_1910, _1934, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1936 = _1940;
    }
    float _1942 = _1936;
    float _1944 = _1942;
    if (!_1868)
    {
        _1938 = _1856;
    }
    float _1946 = _1938;
    float _1948 = _1946;
    float _1950 = _1924;
    if (_1868)
    {
        float _1952 = _1924 + (-1.0);
        _1918 = _1952;
    }
    float _1954 = _1918;
    float _1956 = _1954;
    if (_1868)
    {
        float _1958 = _1890 * _1942;
        _1578 = _1958;
    }
    float _1960 = _1578;
    if (!_1868)
    {
        _1944 = _1930;
    }
    float _1962 = _1944;
    float _1964 = _1962;
    if (_1868)
    {
        float _1966 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1904 = _1966;
    }
    float _1968 = _1904;
    if (_1868)
    {
        float _1970 = _1856 * _1960;
        _1948 = _1970;
    }
    float _1972 = _1948;
    if (!_1868)
    {
        _1956 = _1858;
    }
    float _1974 = _1956;
    float _1976 = _1974;
    if (_1868)
    {
        float _1978 = _1858 * _1960;
        _1976 = _1978;
    }
    float _1980 = _1976;
    if (!_1868)
    {
        _1892 = _1860;
    }
    float _1982 = _1892;
    float _1984 = _1982;
    if (_1868)
    {
        float _1986 = fma(_1930, _1924, _1968);
        _1964 = _1986;
    }
    float _1988 = _1964;
    if (_1868)
    {
        float _1990 = _1972 * _1972;
        _1984 = _1990;
    }
    float _1992 = _1984;
    if (!_1868)
    {
        _1950 = _1862;
    }
    float _1994 = _1950;
    float _1996 = _1994;
    if (_1868)
    {
        float _1998 = _1980 * _1980;
        _1996 = _1998;
    }
    float _2000 = _1996;
    float _2002 = fma(_1988, _1988, _1992);
    float _2004 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2006 = _2002 + _2000;
    float _2008 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2010 = fma(_1852, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2008);
    float _2012 = precise::clamp(_2010, 0.0, 1.0);
    float _2014 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2004);
    float _2016 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2018 = rsqrt(_2006);
    float _2020 = -_2012;
    float _2022 = _2020 + 1.0;
    float _2024 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2014);
    float _2026 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2028 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2016);
    float _2030 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2032 = _2024 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2034 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2026);
    float _2036 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2028);
    float _2038 = abs(_2022);
    float _2040 = log2(_2038);
    float _2042 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2030);
    float _2044 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2034);
    float _2046 = _2036 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2048 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2050 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2042);
    float _2052 = _2044 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2054 = _2018 * _1972;
    float _2056 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2058 = _2018 * _1988;
    float _2060 = _2018 * _1980;
    float _2062 = _2054 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2064 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2056);
    float _2066 = _2032 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2068 = _2050 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2070 = -_2062;
    float _2072 = fma(_2058, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2070);
    float _2074 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2064);
    float _2076 = _2040 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2078 = -_2066;
    float _2080 = fma(_2078, _2048, 1.0);
    float _2082 = -_2060;
    float _2084 = fma(_2082, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2072);
    float _2086 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2074);
    float _2088 = exp2(_2076);
    float _2090 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2092 = fma(_2084, -0.5, 0.5);
    float _2094 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2096 = fma(_2084, 0.5, 0.5);
    float _2098 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2090);
    float _2100 = _2058 + 1.0;
    float _2102 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2094);
    float _2104 = log2(_2080);
    float _2106 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2098);
    float _2108 = fma(_2096, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2110 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2102);
    float _2112 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2106);
    float _2114 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2110);
    float _2116 = 1.0 / _2086;
    float _2118 = -_2058;
    float _2120 = fma(_2088, _2100, _2118);
    float _2122 = fma(_2096, _2108, -0.212114393711090087890625);
    float _2124 = fma(_2120, 0.5, 0.5);
    float _2126 = fma(_2096, _2122, 1.570728778839111328125);
    float _2128 = sqrt(_2092);
    float _2130 = _2104 * 0.693147182464599609375;
    float _2132 = _2130 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2134 = _2112 * _2116;
    float _2136 = _2114 * _2116;
    float _2138 = fma(_2134, 0.5, 0.5);
    float _2140 = fma(_2136, -0.5, 0.5);
    float _2142 = _2128 * 0.636619746685028076171875;
    float _2144 = -_2126;
    float _2146 = fma(_2142, _2144, 1.0);
    float3 _5811 = float3(_2138, _2140, _2132);
    float _2148 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5811, float3(0.0), isnan(_5811)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5811, float3(0.0), isnan(_5811)), level(0.0)).x;
    float3 _5822 = float3(_2138, _2140, _2132);
    float4 _2151 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5822, float3(0.0), isnan(_5822)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5822, float3(0.0), isnan(_5822)), level(0.0)).xyzw;
    float _2153 = _2151.x;
    float _2155 = _2151.y;
    float _2157 = _2151.z;
    float _2159 = _2151.w;
    float2 _5839 = float2(_2146, _2124);
    float3 _2163 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5839, float2(0.0), isnan(_5839)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5839, float2(0.0), isnan(_5839)), level(0.0)).xyz;
    float _2165 = _2163.x;
    float _2167 = _2163.y;
    float _2169 = _2163.z;
    float _2171 = in.m_61.y;
    float _2173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2175 = in.m_51.w;
    float _2177 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2179 = _2177 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2181 = _2040 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2183 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2185 = _976 > 0.5;
    float _2187 = 1.0 / _2179;
    float _2189 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2191 = _2189 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2193 = in.m_61.x;
    int _2195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2197 = _2195 != 0;
    float _2199 = _934 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2203 = _2201 != 0;
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    int _2205 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2207 = _2205 != 0;
    float _2209 = 1.0 / _2191;
    bool _2211 = _970 > 0.5;
    float _2213 = _2173 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2217 = _2215 != 0;
    float _2219 = _1444 * _2171;
    float _2221 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2183);
    float _2223 = _932 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2225 = _936 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _2227 = _2175 > 0.5;
    float _2229 = -_2219;
    float _2231 = _2229 + 1.0;
    float _2233 = -_2171;
    float _2235 = _2233 + 1.0;
    float _2237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2239 = _2219;
    float _2241 = _2171;
    bool _2243 = _2227;
    if (_2197)
    {
        float _2245 = _2211 ? _2231 : _2219;
        _2239 = _2245;
    }
    float _2247 = _2239;
    float _2249 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2251 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2249;
    if (_2203)
    {
        float _2253 = _2227 ? _2235 : _2171;
        _2241 = _2253;
    }
    float _2255 = _2241;
    float _2257 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2259 = _2257 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _2261 = _966 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2263 = isnan(_966);
    bool _2265 = _2261 || _2263;
    bool _2267 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2269 = _2265 || _2267;
    float _2271 = float(_2269);
    float _2273 = _2251 * _2187;
    bool _2275 = _966 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2277 = isnan(_966);
    bool _2279 = _2275 || _2277;
    bool _2281 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2283 = _2279 || _2281;
    float _2285 = float(_2283);
    float _2287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2289 = _2255;
    float _2291 = _2273;
    if (_2207)
    {
        bool _2293 = _968 > 0.5;
        _2243 = _2293;
    }
    bool _2295 = _2243;
    float _2297 = _2259 * _2209;
    float _2299 = fma(_2213, _2255, -0.5);
    float _2301 = -_2285;
    float _2303 = _2301 + 1.0;
    bool _2305 = _966 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2307 = isnan(_966);
    bool _2309 = _2305 || _2307;
    bool _2311 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2313 = _2309 || _2311;
    float _2315 = float(_2313);
    float _2317 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2319 = _966 + _2317;
    if (!_2207)
    {
        _2289 = _2193;
    }
    float _2321 = _2289;
    float _2323 = _2271 * _2303;
    float _2325 = -_2271;
    float _2327 = _2325 + 1.0;
    float _2329 = fma(_2273, _2319, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2331 = _2321;
    if (!_2207)
    {
        _2291 = _2321;
    }
    float _2333 = _2291;
    float _2335 = exp2(_2181);
    float _2337 = _2315 * _2327;
    float _2339 = _2333;
    if (_2207)
    {
        _2331 = _2193;
    }
    float _2341 = _2331;
    float _2343 = -_2315;
    float _2345 = _2343 + 1.0;
    float _2347 = _2287 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2349 = _2329 * _2337;
    float _2351 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2353 = _966 + _2351;
    float _2355 = _1446 * _2341;
    float _2357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2359 = fma(_2345, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2349);
    float _2361 = _2355;
    if (_2207)
    {
        float _2363 = -_2341;
        float _2365 = _2363 + 1.0;
        _1580 = as_type<int>(_2365);
    }
    int _2367 = _1580;
    float _2369 = -_2355;
    float _2371 = _2369 + 1.0;
    float _2373 = fma(_2297, _2353, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2375 = fma(_2347, _2247, -0.5);
    float _2377 = -_1266;
    float _2379 = fma(_1150, _2299, _2377);
    if (_2207)
    {
        float _2381 = _2295 ? as_type<float>(_2367) : _2341;
        _2339 = _2381;
    }
    float _2383 = _2339;
    float _2385 = fma(_2373, _2323, _2359);
    if (_2217)
    {
        float _2387 = _2185 ? _2371 : _2355;
        _2361 = _2387;
    }
    float _2389 = _2361;
    float _2391 = _2237 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2393 = -_2335;
    float _2395 = _2393 + 1.0;
    float _2397 = -_1258;
    float _2399 = fma(_1264, _2375, _2397);
    float _2401 = _2199 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2403 = fma(_2391, _2383, -0.5);
    float _2405 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2221);
    float _2407 = _2357 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2409 = _2395 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2411 = fma(_2285, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2385);
    float _2413 = _2223 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2415 = fma(_2407, _2389, -0.5);
    float _2417 = fma(_1260, _2403, _1272);
    float _2419 = _2086 * 0.5;
    float _2421 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2405);
    float _2423 = fma(_1262, _2415, _1096);
    bool _2425 = _1830 > 0.0;
    bool _2427 = isnan(_1830);
    bool _2429 = _2425 || _2427;
    bool _2431 = isnan(0.0);
    bool _2433 = _2429 || _2431;
    float _2435 = _2399 + 0.5;
    float _2437 = _2379 + 0.5;
    float _2439 = _2417 + 0.5;
    float _2441 = _2423 + 0.5;
    float _2443 = fma(_2114, -0.5, _2419);
    float _2445 = _2225 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2447 = -_2409;
    float _2449 = _2447 + 1.0;
    float _2451 = _1830 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2453 = _2421 + _2086;
    float _2455 = _2112 + _2086;
    out.m_65.x = _2441;
    out.m_65.y = _2435;
    out.m_65.z = _2439;
    out.m_65.w = _2437;
    float _2457 = _2411 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2459 = _2453 * 0.5;
    float _2461 = _2455 * 0.5;
    float _2463 = _2451 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.x = _2413;
    out.m_67.y = _2401;
    out.m_67.z = _2445;
    out.m_67.w = _2457;
    out.gl_Position.x = _2112;
    out.gl_Position.y = _2114;
    out.gl_Position.z = _2421;
    out.gl_Position.w = _2086;
    out.m_69.x = _2461;
    out.m_69.y = _2443;
    out.m_69.z = _2459;
    out.m_69.w = _2086;
    out.m_45.x = _2463;
    float _2465 = _2409 * _2148;
    float _2467 = _2159 * _2449;
    float _2469 = _2159 * _2465;
    float _2471 = _2169 * _2465;
    float _2473 = fma(_2165, _2469, _2153);
    float _2475 = fma(_2167, _2469, _2155);
    float _2477 = fma(_2159, _2471, _2157);
    out.m_71.x = _2473;
    out.m_71.y = _2475;
    out.m_71.z = _2477;
    out.m_71.w = _2467;
    if (_2433)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2479 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2479;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _958 = false;
    bool _736 = false;
    bool _594 = false;
    bool _360 = false;
    bool _192 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2536 = as_type<float>(_106);
        out.gl_Position.z = _2536;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _128 = _124;
    if (_120)
    {
        float _130 = float(_90);
        _126 = _130;
    }
    float _132 = _126;
    bool _134 = _124 >= _132;
    bool _136 = !_120;
    bool _138 = _134 || _136;
    if (_138)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _100;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2605 = as_type<float>(_144);
        out.gl_Position.z = _2605;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_49.x;
    float _148 = in.m_49.y;
    float _150 = in.m_49.z;
    bool _152 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _154 = _148 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _156 = _148 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _158 = _148 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _160 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[4].x, _154);
    float _162 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[5].x, _156);
    float _164 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[6].x, _158);
    float _166 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].z, _160);
    float _168 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].z, _162);
    float _170 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].z, _164);
    bool _172 = !_152;
    float _190;
    if (!_172)
    {
        float _174 = in.m_51.x;
        float _176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _180 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _182 = _180 * _176;
        float _184 = floor(_182);
        float _186 = -_184;
        float _188 = _182 + _186;
        _190 = _188;
        _192 = true;
    }
    else
    {
        float _194 = float(_90);
        float _196 = 1.0 / _194;
        float _198 = _124 * _196;
        _190 = _198;
    }
    _192 = false;
    float _200 = _190;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _204 = _200 + _202;
    bool _206 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _208 = isnan(_200);
    bool _210 = _206 || _208;
    bool _212 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _214 = _210 || _212;
    float _216 = float(_214);
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _220 = _200 + _218;
    bool _222 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _224 = isnan(_200);
    bool _226 = _222 || _224;
    bool _228 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _230 = _226 || _228;
    float _232 = float(_230);
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _240 = _238 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _242 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _244 = isnan(_200);
    bool _246 = _242 || _244;
    bool _248 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _250 = _246 || _248;
    float _252 = float(_250);
    float _254 = -_216;
    float _256 = _254 + 1.0;
    float _258 = 1.0 / _240;
    float _260 = _252 * _256;
    float _262 = -_252;
    float _264 = _262 + 1.0;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _266;
    bool _270 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _272 = 1.0 / _236;
    float _274 = _232 * _264;
    float _276 = -_232;
    float _278 = _276 + 1.0;
    float _280 = _220 * _258;
    float _282 = _204 * _272;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _284;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _288;
    float _292 = fma(_268, _282, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _294 = fma(_286, _282, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _296 = fma(_290, _282, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _298 = _292 * _274;
    float _300 = _294 * _274;
    float _302 = _296 * _274;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _316 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].x, _298);
    float _318 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].y, _300);
    float _320 = fma(_306, _280, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _322 = fma(_310, _280, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _324 = fma(_314, _280, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _326 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].z, _302);
    float _328 = fma(_320, _260, _316);
    float _330 = fma(_322, _260, _318);
    float _332 = fma(_324, _260, _326);
    float _334 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[145].x, _328);
    float _336 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[145].y, _330);
    float _338 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[145].z, _332);
    bool _340 = !_270;
    float _358;
    if (!_340)
    {
        float _342 = in.m_51.x;
        float _344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _346 = _342 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _348 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _350 = _348 * _344;
        float _352 = floor(_350);
        float _354 = -_352;
        float _356 = _350 + _354;
        _358 = _356;
        _360 = true;
    }
    else
    {
        float _362 = float(_90);
        float _364 = 1.0 / _362;
        float _366 = _124 * _364;
        _358 = _366;
    }
    _360 = false;
    float _368 = _358;
    float _370 = in.m_53.x;
    float _372 = in.m_53.y;
    float _374 = in.m_53.z;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _378 = _368 + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _392 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _394 = 1.0 / _382;
    float _396 = 1.0 / _386;
    float _398 = _338 * _374;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _402 = _368 + _400;
    float _404 = _336 * _372;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _408 = _368 + _406;
    float _410 = 1.0 / _390;
    bool _412 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _414 = isnan(_368);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = _378 * _394;
    bool _426 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _428 = isnan(_368);
    bool _430 = _426 || _428;
    bool _432 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _434 = _430 || _432;
    float _436 = float(_434);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _438;
    float _442 = _334 * _370;
    float _444 = -_422;
    float _446 = _444 + 1.0;
    float _448 = _402 * _396;
    float _450 = _436 * _446;
    bool _452 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _454 = isnan(_368);
    bool _456 = _452 || _454;
    bool _458 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _460 = _456 || _458;
    float _462 = float(_460);
    float _464 = -_436;
    float _466 = _464 + 1.0;
    bool _468 = _368 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _470 = isnan(_368);
    bool _472 = _468 || _470;
    bool _474 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _476 = _472 || _474;
    float _478 = float(_476);
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _480;
    float _484 = fma(_440, _448, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _486 = _408 * _410;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _488;
    float _492 = -_462;
    float _494 = _492 + 1.0;
    float _496 = fma(_482, _448, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _502 = fma(_490, _448, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _504 = _462 * _466;
    float _506 = _478 * _494;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _516 = fma(_500, _486, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _518 = _502 * _506;
    float _520 = fma(_510, _486, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _522 = fma(_514, _486, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _524 = _496 * _506;
    float _526 = _484 * _506;
    float _528 = -_478;
    float _530 = _528 + 1.0;
    float _532 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[107].x, _524);
    float _534 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[107].y, _526);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _536;
    float _540 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[107].z, _518);
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _542;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _546;
    float _550 = fma(_516, _504, _532);
    float _552 = fma(_538, _424, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _554 = fma(_544, _424, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _556 = fma(_548, _424, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _558 = fma(_520, _504, _534);
    float _560 = fma(_522, _504, _540);
    float _562 = fma(_552, _450, _550);
    float _564 = fma(_554, _450, _558);
    float _566 = fma(_556, _450, _560);
    float _568 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[110].x, _562);
    float _570 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[110].y, _564);
    float _572 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[110].z, _566);
    bool _574 = !_392;
    float _592;
    if (!_574)
    {
        float _576 = in.m_51.x;
        float _578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _580 = _576 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _582 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _584 = _582 * _578;
        float _586 = floor(_584);
        float _588 = -_586;
        float _590 = _584 + _588;
        _592 = _590;
        _594 = true;
    }
    else
    {
        float _596 = float(_90);
        float _598 = 1.0 / _596;
        float _600 = _124 * _598;
        _592 = _600;
    }
    _594 = false;
    float _602 = _592;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _606 = _602 + _604;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _612 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _614 = isnan(_602);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _628 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _630 = isnan(_602);
    bool _632 = _628 || _630;
    bool _634 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _636 = _632 || _634;
    float _638 = float(_636);
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _640;
    bool _644 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _646 = isnan(_602);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = 1.0 / _610;
    float _658 = -_622;
    float _660 = _658 + 1.0;
    bool _662 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _664 = _638 * _660;
    float _666 = -_638;
    float _668 = _666 + 1.0;
    float _670 = 1.0 / _626;
    float _672 = _642 * _656;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _676 = _674 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _678 = fma(_672, _606, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _680 = -_654;
    float _682 = _680 + 1.0;
    float _684 = _678 * _664;
    float _686 = _676 * _670;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _690 = _602 + _688;
    float _692 = _622 * _682;
    float _694 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[115].x, _684);
    float _696 = _568 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _698 = fma(_686, _690, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _700 = _570 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _702 = _572 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _704 = _696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _706 = fma(_698, _692, _694);
    float _708 = _700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = _702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _712 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[117].x, _706);
    float _714 = _712 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _704;
    out.m_55.y = _708;
    out.m_55.z = _710;
    out.m_55.w = _714;
    bool _716 = !_662;
    float _734;
    if (!_716)
    {
        float _718 = in.m_51.x;
        float _720 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _722 = _718 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _724 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _726 = _724 * _720;
        float _728 = floor(_726);
        float _730 = -_728;
        float _732 = _726 + _730;
        _734 = _732;
        _736 = true;
    }
    else
    {
        float _738 = float(_90);
        float _740 = 1.0 / _738;
        float _742 = _124 * _740;
        _734 = _742;
    }
    _736 = false;
    float _744 = _734;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _748 = _744 + _746;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _752 = _744 + _750;
    bool _754 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _756 = isnan(_744);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _766;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _772 = _770 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _774;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _780 = _744 + _778;
    float _782 = 1.0 / _776;
    bool _784 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _786 = 1.0 / _772;
    bool _788 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _790 = isnan(_744);
    bool _792 = _788 || _790;
    bool _794 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _796 = _792 || _794;
    float _798 = float(_796);
    float _800 = 1.0 / _768;
    float _802 = _752 * _782;
    float _804 = -_764;
    float _806 = _804 + 1.0;
    bool _808 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _810 = isnan(_744);
    bool _812 = _808 || _810;
    bool _814 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _816 = _812 || _814;
    float _818 = float(_816);
    float _820 = _798 * _806;
    float _822 = -_798;
    float _824 = _822 + 1.0;
    float _826 = _748 * _786;
    bool _828 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _830 = isnan(_744);
    bool _832 = _828 || _830;
    bool _834 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _836 = _832 || _834;
    float _838 = float(_836);
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _840;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _846 = _844 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _848 = -_838;
    float _850 = _848 + 1.0;
    float _852 = fma(_846, _826, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _854 = _780 * _800;
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _856;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _860;
    float _864 = _818 * _850;
    float _866 = fma(_842, _854, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _868 = fma(_858, _854, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _870 = fma(_862, _854, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _872 = _838 * _824;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _876 = _874 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _882 = _868 * _864;
    float _884 = _870 * _864;
    float _886 = _866 * _864;
    float _888 = fma(_876, _826, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _890 = fma(_880, _826, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _892 = -_818;
    float _894 = _892 + 1.0;
    float _896 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[123].y, _884);
    float _898 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[123].x, _882);
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _900;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _904;
    float _908 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[123].z, _886);
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _910;
    float _914 = fma(_852, _872, _898);
    float _916 = fma(_902, _802, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _918 = fma(_906, _802, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _920 = fma(_888, _872, _896);
    float _922 = fma(_912, _802, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _924 = fma(_890, _872, _908);
    float _926 = fma(_916, _820, _914);
    float _928 = fma(_918, _820, _920);
    float _930 = fma(_922, _820, _924);
    float _932 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[126].x, _926);
    float _934 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[126].y, _928);
    float _936 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[126].z, _930);
    bool _938 = !_784;
    float _956;
    if (!_938)
    {
        float _940 = in.m_51.x;
        float _942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _944 = _940 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _946 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _948 = _946 * _942;
        float _950 = floor(_948);
        float _952 = -_950;
        float _954 = _948 + _952;
        _956 = _954;
        _958 = true;
    }
    else
    {
        float _960 = float(_90);
        float _962 = 1.0 / _960;
        float _964 = _124 * _962;
        _956 = _964;
    }
    _958 = false;
    float _966 = _956;
    float _968 = in.m_51.z;
    float _970 = in.m_51.y;
    int _972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _974 = _972 != 0;
    float _976 = in.m_51.x;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _982 = _980 != 0;
    int _984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _986 = _984 != 0;
    int _988 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _990 = _988 != 0;
    float _992 = in.m_42.x;
    float _994 = in.m_42.y;
    float _996 = in.m_42.z;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1000 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1002 = _968 * 2.0;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1006 = _970 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1008 = _970 * 2.0;
    float _1010 = floor(_1002);
    float _1012 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1004);
    float _1014 = _976 * 2.0;
    float _1016 = _976 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1018 = fma(_1006, -2.0, _978);
    float _1020 = _994 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1022 = -_998;
    float _1024 = fma(_1016, 2.0, _1022);
    float _1026 = _994 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1028 = floor(_1014);
    float _1030 = _994 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1032 = fma(_992, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1020);
    float _1034 = fma(_992, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1026);
    float _1036 = _1026;
    if (!_974)
    {
        _1036 = _968;
    }
    float _1038 = _1036;
    float _1040 = fma(_992, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1030);
    float _1042 = _976 + _970;
    bool _1044 = _1010 > 0.0;
    float _1046 = floor(_1008);
    bool _1048 = _1010 >= 0.0;
    bool _1050 = isnan(_1010);
    bool _1052 = _1048 || _1050;
    bool _1054 = isnan(0.0);
    bool _1056 = _1052 || _1054;
    float _1058 = _1042 + (-1.0);
    float _1060 = _1010;
    float _1062 = _1042;
    float _1064 = _1038;
    if (!_974)
    {
        _1060 = _970;
    }
    float _1066 = _1060;
    float _1068 = fma(_996, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1034);
    float _1070 = _1066;
    if (!_974)
    {
        _1062 = _968;
    }
    float _1072 = _1062;
    float _1074 = fma(_1058, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1076 = _1072;
    if (_974)
    {
        _1070 = _976;
    }
    float _1078 = _1070;
    float _1080 = fma(_996, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1032);
    if (_974)
    {
        _1064 = _970;
    }
    float _1082 = _1064;
    float _1084 = fma(_996, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1040);
    if (_974)
    {
        _1076 = _970;
    }
    float _1086 = _1076;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1090 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1092 = _1028 > 0.0;
    float _1094 = -_124;
    float _1096 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1024);
    bool _1098 = _1028 >= 0.0;
    bool _1100 = isnan(_1028);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan(0.0);
    bool _1106 = _1102 || _1104;
    float _1108 = _1068 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1110 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1112 = log2(_1110);
    bool _1114 = !_982;
    int _1116 = _1114 ? 0 : 1;
    float _1118 = _1084 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1120 = _1056 ? 0 : 1;
    bool _1122 = _1046 > 0.0;
    bool _1124 = _1046 >= 0.0;
    bool _1126 = isnan(_1046);
    bool _1128 = _1124 || _1126;
    bool _1130 = isnan(0.0);
    bool _1132 = _1128 || _1130;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1136 = abs(_1116);
    float _1138 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1088);
    int _1140 = ~_1120;
    int _1142 = _1140 + 1;
    int _1144 = _1142 + 1;
    float _1146 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1134);
    float _1148 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1150 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1138);
    int _1152 = _1144;
    if (!_1044)
    {
        int _1154 = ~_1120;
        int _1156 = _1154 + 1;
        _1152 = _1156;
    }
    int _1158 = _1152;
    float _1160 = _1112 * _124;
    float _1162 = -_1000;
    float _1164 = fma(_1148, 2.0, _1162);
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1168 = _1106 ? 0 : 1;
    float _1170 = fma(_1090, -2.0, _1166);
    int _1172 = _1132 ? 0 : 1;
    float _1174 = exp2(_1160);
    float _1176 = float(_1136);
    float _1178 = float(_1158);
    int _1180 = ~_1168;
    int _1182 = _1180 + 1;
    int _1184 = _1182 + 1;
    int _1186 = ~_1172;
    int _1188 = _1186 + 1;
    int _1190 = _1188 + 1;
    float _1192 = _1176 * _1178;
    int _1194 = _1184;
    int _1196 = _1190;
    if (!_1092)
    {
        int _1198 = ~_1168;
        int _1200 = _1198 + 1;
        _1194 = _1200;
    }
    int _1202 = _1194;
    float _1204 = _1192 * (-2.0);
    if (!_1122)
    {
        int _1206 = ~_1172;
        int _1208 = _1206 + 1;
        _1196 = _1208;
    }
    int _1210 = _1196;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1214 = 1.0 + _1212;
    float _1216 = in.m_57.x;
    float _1218 = in.m_57.y;
    float _1220 = in.m_57.z;
    float _1222 = -_1174;
    float _1224 = _1222 + 1.0;
    float _1226 = 1.0 / _1214;
    bool _1228 = !_986;
    int _1230 = _1228 ? 0 : 1;
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1234 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1236 = isnan(1.0);
    bool _1238 = _1234 || _1236;
    bool _1240 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1242 = _1238 || _1240;
    int _1244 = abs(_1230);
    float _1246 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1232);
    bool _1248 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1250 = isnan(0.0);
    bool _1252 = _1248 || _1250;
    bool _1254 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1256 = _1252 || _1254;
    float _1258 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1018);
    float _1260 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1146);
    float _1262 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1246);
    float _1264 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1012);
    float _1266 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1170);
    float _1268 = _1256 ? _1224 : 0.0;
    float _1270 = -_124;
    float _1272 = fma(_1270, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1164);
    float _1274 = float(_1244);
    float _1276 = _976 + (-0.5);
    float _1278 = float(_1202);
    if (_1242)
    {
        float _1280 = _1268 * _1226;
        _128 = _1280;
    }
    float _1282 = _128;
    float _1284 = fma(_1204, _1216, _1216);
    float _1286 = fma(_1074, _1204, _1074);
    bool _1288 = !_990;
    int _1290 = _1288 ? 0 : 1;
    float _1292 = _1274 * _1278;
    float _1294 = _1080 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1296 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1284);
    float _1298 = -_1108;
    float _1300 = _1298 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1302 = float(_1210);
    float _1304 = -_1294;
    float _1306 = _1304 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1308 = fma(_1286, _1282, _1296);
    int _1310 = abs(_1290);
    float _1312 = _970 + _968;
    float _1314 = _1306 * _1306;
    float _1316 = -_1118;
    float _1318 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1320 = float(_1310);
    float _1322 = _1312 + (-1.0);
    float _1324 = fma(_1300, _1300, _1314);
    float _1326 = _1292 * (-2.0);
    float _1328 = _1308 * 0.15915493667125701904296875;
    float _1330 = _1320 * _1302;
    float _1332 = fma(_1318, _1318, _1324);
    float _1334 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1336 = _970 + (-0.5);
    float _1338 = fma(_1326, _1218, _1218);
    float _1340 = _976 + _968;
    float _1342 = fma(_1334, _1326, _1334);
    float _1344 = rsqrt(_1332);
    float _1346 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1338);
    float _1348 = _1340 + (-1.0);
    float _1350 = _1330 * (-2.0);
    float _1352 = fma(_1342, _1282, _1346);
    float _1354 = _968 + (-0.5);
    float _1356 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1358 = fma(_1350, _1220, _1220);
    float _1360 = _1352 * 0.15915493667125701904296875;
    float _1362 = _1328 * 6.283185482025146484375;
    float _1364 = sin(_1362);
    float _1366 = in.m_59.x;
    float _1368 = in.m_59.y;
    float _1370 = in.m_59.z;
    float _1372 = fma(_1356, _1350, _1356);
    float _1374 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1358);
    float _1376 = _1306 * _1344;
    float _1378 = fma(_1372, _1282, _1374);
    float _1380 = _1300 * _1344;
    float _1382 = _1318 * _1344;
    float _1384 = _1328 * 6.283185482025146484375;
    float _1386 = cos(_1384);
    float _1388 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1390 = _1380 * _1388;
    float _1392 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1394 = _1382 * _1392;
    float _1396 = _398 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1398 = _1378 * 0.15915493667125701904296875;
    float _1400 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1402 = -_1390;
    float _1404 = fma(_1382, _1400, _1402);
    float _1406 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1408 = -_1394;
    float _1410 = fma(_1376, _1406, _1408);
    float _1412 = _1360 * 6.283185482025146484375;
    float _1414 = sin(_1412);
    float _1416 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1418 = _1376 * _1416;
    float _1420 = _1404 * _1404;
    float _1422 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1424 = -_1418;
    float _1426 = fma(_1380, _1422, _1424);
    float _1428 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1370);
    float _1430 = fma(_1410, _1410, _1420);
    float _1432 = _1360 * 6.283185482025146484375;
    float _1434 = cos(_1432);
    float _1436 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1366);
    float _1438 = _1396 * _1428;
    float _1440 = fma(_1426, _1426, _1430);
    float _1442 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1368);
    float _1444 = _404 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1446 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1448 = _1398 * 6.283185482025146484375;
    float _1450 = sin(_1448);
    float _1452 = _1386 * _1414;
    float _1454 = _1444 * _1442;
    float _1456 = _1364 * _1414;
    float _1458 = _1446 * _1436;
    float _1460 = _1398 * 6.283185482025146484375;
    float _1462 = cos(_1460);
    float _1464 = _1364 * _1434;
    float _1466 = rsqrt(_1440);
    float _1468 = -_1452;
    float _1470 = fma(_1450, _1464, _1468);
    float _1472 = -_1464;
    float _1474 = fma(_1450, _1452, _1472);
    float _1476 = _1386 * _1434;
    float _1478 = fma(_1450, _1456, _1476);
    float _1480 = _1462 * _1454;
    float _1482 = _1414 * _1462;
    float _1484 = fma(_1450, _1476, _1456);
    float _1486 = _1434 * _1462;
    float _1488 = _1386 * _1480;
    float _1490 = -_1454;
    float _1492 = _1450 * _1490;
    float _1494 = _1364 * _1480;
    float _1496 = _1410 * _1466;
    float _1498 = fma(_1484, _1458, _1488);
    float _1500 = _1404 * _1466;
    float _1502 = fma(_1486, _1458, _1492);
    float _1504 = _1376 * _1496;
    float _1506 = _1426 * _1466;
    float _1508 = fma(_1474, _1438, _1498);
    float _1510 = _1382 * _1500;
    float _1512 = -_1504;
    float _1514 = fma(_1380, _1500, _1512);
    float _1516 = fma(_1470, _1458, _1494);
    float _1518 = fma(_1482, _1438, _1502);
    float _1520 = -_1510;
    float _1522 = fma(_1376, _1506, _1520);
    float _1524 = _1514 * _1508;
    float _1526 = fma(_1478, _1438, _1516);
    float _1528 = _1522 * _1508;
    float _1530 = fma(_1506, _1518, _1524);
    float _1532 = fma(_1496, _1518, _1528);
    float _1534 = fma(_1382, _1526, _1530);
    float _1536 = fma(_1380, _1526, _1532);
    float _1538 = _1118 + _1534;
    float _1540 = _1380 * _1506;
    float _1542 = _1108 + _1536;
    float _1544 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1546 = _1538 + _1544;
    float _1548 = -_1540;
    float _1550 = fma(_1382, _1496, _1548);
    float _1552 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1554 = _1542 + _1552;
    float _1556 = _1546 * _1546;
    float _1558 = _1550 * _1508;
    float _1560 = fma(_1554, _1554, _1556);
    float _1562 = fma(_1500, _1518, _1558);
    float _1564 = sqrt(_1560);
    float _1566 = fma(_1376, _1526, _1562);
    float _1568 = _1294 + _1566;
    bool _1570 = _1564 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1572 = _1556;
    float _1574 = _1542;
    float _1576 = _1538;
    float _1578 = _1546;
    int _1580 = as_type<int>(_1446);
    if (!_1570)
    {
        _1572 = _1542;
    }
    float _1582 = _1572;
    float _1584 = _1582;
    if (!_1570)
    {
        _1574 = _1568;
    }
    float _1586 = _1574;
    bool _1588 = !_1570;
    float _1590 = _1586;
    if (!_1588)
    {
        float _1592 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1594 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1596 = _1564 + _1594;
        float _1598 = _1568 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1600 = rsqrt(_1560);
        float _1602 = _1596 * _1592;
        float _1604 = _1602 * 0.15915493667125701904296875;
        float _1606 = _1604 * 6.283185482025146484375;
        float _1608 = cos(_1606);
        float _1610 = _1604 * 6.283185482025146484375;
        float _1612 = sin(_1610);
        float _1614 = _1608 + (-1.0);
        float _1616 = _1614 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1618 = fma(_1612, _1598, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1620 = fma(_1568, _1608, _1616);
        float _1622 = _1600 * _1618;
        float _1624 = fma(_1554, _1622, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1626 = fma(_1546, _1622, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1590 = _1620;
        _1584 = _1624;
        _1576 = _1626;
    }
    float _1628 = _1590;
    float _1630 = _1584;
    float _1632 = _1576;
    float _1634 = -_1294;
    float _1636 = _1634 + _1628;
    float _1638 = -_1108;
    float _1640 = _1638 + _1630;
    float _1642 = -_1118;
    float _1644 = _1642 + _1632;
    float _1646 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1648 = _1636 * _1636;
    float _1650 = _1294 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1652 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1654 = isnan(0.5);
    bool _1656 = _1652 || _1654;
    bool _1658 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1660 = _1656 || _1658;
    float _1662 = fma(_1640, _1640, _1648);
    float _1664 = fma(_1644, _1644, _1662);
    float _1666 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1646);
    float _1668 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1650);
    float _1670 = sqrt(_1664);
    float _1672 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1666);
    float _1674 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1668);
    float _1676 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1678 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1680 = 1.0 / _1676;
    float _1682 = _1678 + _1676;
    float _1684 = _1678;
    float _1686 = _1682;
    float _1688 = _1628;
    float _1690 = _1630;
    float _1692 = _1636;
    if (_1660)
    {
        _1684 = 1.0;
    }
    float _1694 = _1684;
    bool _1696 = _1670 > 0.0;
    float _1698 = _1682 * _1680;
    float _1700 = _1698 * 0.5;
    float _1702 = _1694;
    if (!_1696)
    {
        _1686 = _1632;
    }
    float _1704 = _1686;
    bool _1706 = !_1696;
    float _1708 = _1704;
    if (!_1706)
    {
        float _1710 = _168 * _168;
        float _1712 = fma(_166, _166, _1710);
        float _1714 = fma(_170, _170, _1712);
        float _1716 = rsqrt(_1664);
        float _1718 = sqrt(_1714);
        float _1720 = _1640 * _1716;
        float _1722 = _1636 * _1716;
        float _1724 = _1644 * _1716;
        bool _1726 = _1718 > 0.0;
        float _1728 = _1716;
        if (!_1726)
        {
            _1728 = _1632;
        }
        float _1730 = _1728;
        bool _1732 = !_1726;
        _1708 = _1730;
        if (!_1732)
        {
            float _1734 = rsqrt(_1714);
            float _1736 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1738 = _168 * _1734;
            float _1740 = _166 * _1734;
            float _1742 = _170 * _1734;
            float _1744 = _1722 * _1738;
            float _1746 = fma(_1720, _1740, _1744);
            float _1748 = _1736 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1750 = fma(_1724, _1742, _1746);
            float _1752 = _1750 * _1748;
            float _1754 = fma(_166, _1752, _1630);
            float _1756 = fma(_168, _1752, _1628);
            float _1758 = fma(_170, _1752, _1632);
            _1688 = _1756;
            _1690 = _1754;
            _1708 = _1758;
            _1692 = _1746;
        }
    }
    float _1760 = _1688;
    float _1762 = _1690;
    float _1764 = _1708;
    float _1766 = _1692;
    float _1768 = _1766;
    if (!_1660)
    {
        float _1770 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1772 = _1770 * 0.15915493667125701904296875;
        float _1774 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1776 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1778 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1776);
        float _1780 = _1772 * 6.283185482025146484375;
        float _1782 = cos(_1780);
        float _1784 = _1774 * 0.15915493667125701904296875;
        float _1786 = _1772 * 6.283185482025146484375;
        float _1788 = sin(_1786);
        float _1790 = 1.0 / _1782;
        float _1792 = _1784 * 6.283185482025146484375;
        float _1794 = cos(_1792);
        float _1796 = _1788 * _1790;
        float _1798 = _1784 * 6.283185482025146484375;
        float _1800 = sin(_1798);
        float _1802 = _1794 * _1796;
        float _1804 = 1.0 / _1778;
        float _1806 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1808 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1806;
        float _1810 = 1.0 / _1802;
        float _1812 = 1.0 / _1808;
        float _1814 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1816 = _1804 * _1814;
        float _1818 = _1800 * _1810;
        float _1820 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1822 = fma(_1818, _1816, _1820);
        float _1824 = _1822 * _1812;
        float _1826 = precise::clamp(_1824, 0.0, 1.0);
        _1768 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
        _1702 = _1826;
    }
    float _1828 = _1768;
    float _1830 = _1702;
    float _1832 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1834 = _1760 + _1832;
    float _1836 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1838 = _1762 + _1836;
    float _1840 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1842 = _1764 + _1840;
    float _1844 = _1834 * _1834;
    float _1846 = fma(_1838, _1838, _1844);
    float _1848 = fma(_1842, _1842, _1846);
    float _1850 = rsqrt(_1848);
    float _1852 = sqrt(_1848);
    float _1854 = _1850 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1856 = _1838 * _1854;
    float _1858 = _1842 * _1854;
    float _1860 = _1856 * _1856;
    float _1862 = _1858 * _1858;
    float _1864 = _1860 + _1862;
    float _1866 = sqrt(_1864);
    bool _1868 = _1866 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1870 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1872 = _1866 + _1870;
    float _1874 = _1850;
    float _1876 = _1864;
    float _1878 = _1872;
    float _1880 = _1828;
    float _1882 = _1834;
    if (_1868)
    {
        float _1884 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1874 = _1884;
    }
    float _1886 = _1874;
    if (_1868)
    {
        float _1888 = rsqrt(_1864);
        _1876 = _1888;
    }
    float _1890 = _1876;
    float _1892 = _1890;
    if (_1868)
    {
        float _1894 = _1872 * _1886;
        _1878 = _1894;
    }
    float _1896 = _1878;
    if (_1868)
    {
        float _1898 = _1896 * 0.15915493667125701904296875;
        _1880 = _1898;
    }
    float _1900 = _1880;
    float _1902 = _1842;
    float _1904 = _1900;
    if (_1868)
    {
        float _1906 = _1900 * 6.283185482025146484375;
        float _1908 = sin(_1906);
        _1902 = _1908;
    }
    float _1910 = _1902;
    float _1912 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1914 = precise::max(0.0, _1912);
    float _1916 = _1886;
    float _1918 = _1914;
    if (_1868)
    {
        float _1920 = _1900 * 6.283185482025146484375;
        float _1922 = cos(_1920);
        _1916 = _1922;
    }
    float _1924 = _1916;
    float _1926 = -_1854;
    float _1928 = -_1914;
    float _1930 = fma(_1834, _1926, _1928);
    if (_1868)
    {
        float _1932 = _1930 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1882 = _1932;
    }
    float _1934 = _1882;
    float _1936 = _1934;
    float _1938 = _1910;
    if (_1868)
    {
        float _1940 = fma(_1910, _1934, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1936 = _1940;
    }
    float _1942 = _1936;
    float _1944 = _1942;
    if (!_1868)
    {
        _1938 = _1856;
    }
    float _1946 = _1938;
    float _1948 = _1946;
    float _1950 = _1924;
    if (_1868)
    {
        float _1952 = _1924 + (-1.0);
        _1918 = _1952;
    }
    float _1954 = _1918;
    float _1956 = _1954;
    if (_1868)
    {
        float _1958 = _1890 * _1942;
        _1578 = _1958;
    }
    float _1960 = _1578;
    if (!_1868)
    {
        _1944 = _1930;
    }
    float _1962 = _1944;
    float _1964 = _1962;
    if (_1868)
    {
        float _1966 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1904 = _1966;
    }
    float _1968 = _1904;
    if (_1868)
    {
        float _1970 = _1856 * _1960;
        _1948 = _1970;
    }
    float _1972 = _1948;
    if (!_1868)
    {
        _1956 = _1858;
    }
    float _1974 = _1956;
    float _1976 = _1974;
    if (_1868)
    {
        float _1978 = _1858 * _1960;
        _1976 = _1978;
    }
    float _1980 = _1976;
    if (!_1868)
    {
        _1892 = _1860;
    }
    float _1982 = _1892;
    float _1984 = _1982;
    if (_1868)
    {
        float _1986 = fma(_1930, _1924, _1968);
        _1964 = _1986;
    }
    float _1988 = _1964;
    if (_1868)
    {
        float _1990 = _1972 * _1972;
        _1984 = _1990;
    }
    float _1992 = _1984;
    if (!_1868)
    {
        _1950 = _1862;
    }
    float _1994 = _1950;
    float _1996 = _1994;
    if (_1868)
    {
        float _1998 = _1980 * _1980;
        _1996 = _1998;
    }
    float _2000 = _1996;
    float _2002 = fma(_1988, _1988, _1992);
    float _2004 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2006 = _2002 + _2000;
    float _2008 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2010 = fma(_1852, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2008);
    float _2012 = precise::clamp(_2010, 0.0, 1.0);
    float _2014 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2004);
    float _2016 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2018 = rsqrt(_2006);
    float _2020 = -_2012;
    float _2022 = _2020 + 1.0;
    float _2024 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2014);
    float _2026 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2028 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2016);
    float _2030 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2032 = _2024 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2034 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2026);
    float _2036 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2028);
    float _2038 = abs(_2022);
    float _2040 = log2(_2038);
    float _2042 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2030);
    float _2044 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2034);
    float _2046 = _2036 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2048 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2050 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2042);
    float _2052 = _2044 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2054 = _2018 * _1972;
    float _2056 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2058 = _2018 * _1988;
    float _2060 = _2018 * _1980;
    float _2062 = _2054 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2064 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2056);
    float _2066 = _2032 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2068 = _2050 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2070 = -_2062;
    float _2072 = fma(_2058, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2070);
    float _2074 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2064);
    float _2076 = _2040 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2078 = -_2066;
    float _2080 = fma(_2078, _2048, 1.0);
    float _2082 = -_2060;
    float _2084 = fma(_2082, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2072);
    float _2086 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2074);
    float _2088 = exp2(_2076);
    float _2090 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2092 = fma(_2084, -0.5, 0.5);
    float _2094 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2096 = fma(_2084, 0.5, 0.5);
    float _2098 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2090);
    float _2100 = _2058 + 1.0;
    float _2102 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2094);
    float _2104 = log2(_2080);
    float _2106 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2098);
    float _2108 = fma(_2096, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2110 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2102);
    float _2112 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2106);
    float _2114 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2110);
    float _2116 = 1.0 / _2086;
    float _2118 = -_2058;
    float _2120 = fma(_2088, _2100, _2118);
    float _2122 = fma(_2096, _2108, -0.212114393711090087890625);
    float _2124 = fma(_2120, 0.5, 0.5);
    float _2126 = fma(_2096, _2122, 1.570728778839111328125);
    float _2128 = sqrt(_2092);
    float _2130 = _2104 * 0.693147182464599609375;
    float _2132 = _2130 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2134 = _2112 * _2116;
    float _2136 = _2114 * _2116;
    float _2138 = fma(_2134, 0.5, 0.5);
    float _2140 = fma(_2136, -0.5, 0.5);
    float _2142 = _2128 * 0.636619746685028076171875;
    float _2144 = -_2126;
    float _2146 = fma(_2142, _2144, 1.0);
    float3 _5811 = float3(_2138, _2140, _2132);
    float _2148 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5811, float3(0.0), isnan(_5811)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5811, float3(0.0), isnan(_5811)), level(0.0)).x;
    float3 _5822 = float3(_2138, _2140, _2132);
    float4 _2151 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5822, float3(0.0), isnan(_5822)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5822, float3(0.0), isnan(_5822)), level(0.0)).xyzw;
    float _2153 = _2151.x;
    float _2155 = _2151.y;
    float _2157 = _2151.z;
    float _2159 = _2151.w;
    float2 _5839 = float2(_2146, _2124);
    float3 _2163 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5839, float2(0.0), isnan(_5839)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5839, float2(0.0), isnan(_5839)), level(0.0)).xyz;
    float _2165 = _2163.x;
    float _2167 = _2163.y;
    float _2169 = _2163.z;
    float _2171 = in.m_61.y;
    float _2173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2175 = in.m_51.w;
    float _2177 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2179 = _2177 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2181 = _2040 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2183 = _2046 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2185 = _976 > 0.5;
    float _2187 = 1.0 / _2179;
    float _2189 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2191 = _2189 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2193 = in.m_61.x;
    int _2195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2197 = _2195 != 0;
    float _2199 = _934 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2203 = _2201 != 0;
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    int _2205 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2207 = _2205 != 0;
    float _2209 = 1.0 / _2191;
    bool _2211 = _970 > 0.5;
    float _2213 = _2173 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2215 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2217 = _2215 != 0;
    float _2219 = _1444 * _2171;
    float _2221 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2183);
    float _2223 = _932 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2225 = _936 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _2227 = _2175 > 0.5;
    float _2229 = -_2219;
    float _2231 = _2229 + 1.0;
    float _2233 = -_2171;
    float _2235 = _2233 + 1.0;
    float _2237 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2239 = _2219;
    float _2241 = _2171;
    bool _2243 = _2227;
    if (_2197)
    {
        float _2245 = _2211 ? _2231 : _2219;
        _2239 = _2245;
    }
    float _2247 = _2239;
    float _2249 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2251 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2249;
    if (_2203)
    {
        float _2253 = _2227 ? _2235 : _2171;
        _2241 = _2253;
    }
    float _2255 = _2241;
    float _2257 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2259 = _2257 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _2261 = _966 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2263 = isnan(_966);
    bool _2265 = _2261 || _2263;
    bool _2267 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2269 = _2265 || _2267;
    float _2271 = float(_2269);
    float _2273 = _2251 * _2187;
    bool _2275 = _966 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2277 = isnan(_966);
    bool _2279 = _2275 || _2277;
    bool _2281 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2283 = _2279 || _2281;
    float _2285 = float(_2283);
    float _2287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2289 = _2255;
    float _2291 = _2273;
    if (_2207)
    {
        bool _2293 = _968 > 0.5;
        _2243 = _2293;
    }
    bool _2295 = _2243;
    float _2297 = _2259 * _2209;
    float _2299 = fma(_2213, _2255, -0.5);
    float _2301 = -_2285;
    float _2303 = _2301 + 1.0;
    bool _2305 = _966 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2307 = isnan(_966);
    bool _2309 = _2305 || _2307;
    bool _2311 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2313 = _2309 || _2311;
    float _2315 = float(_2313);
    float _2317 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2319 = _966 + _2317;
    if (!_2207)
    {
        _2289 = _2193;
    }
    float _2321 = _2289;
    float _2323 = _2271 * _2303;
    float _2325 = -_2271;
    float _2327 = _2325 + 1.0;
    float _2329 = fma(_2273, _2319, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2331 = _2321;
    if (!_2207)
    {
        _2291 = _2321;
    }
    float _2333 = _2291;
    float _2335 = exp2(_2181);
    float _2337 = _2315 * _2327;
    float _2339 = _2333;
    if (_2207)
    {
        _2331 = _2193;
    }
    float _2341 = _2331;
    float _2343 = -_2315;
    float _2345 = _2343 + 1.0;
    float _2347 = _2287 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2349 = _2329 * _2337;
    float _2351 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2353 = _966 + _2351;
    float _2355 = _1446 * _2341;
    float _2357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2359 = fma(_2345, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2349);
    float _2361 = _2355;
    if (_2207)
    {
        float _2363 = -_2341;
        float _2365 = _2363 + 1.0;
        _1580 = as_type<int>(_2365);
    }
    int _2367 = _1580;
    float _2369 = -_2355;
    float _2371 = _2369 + 1.0;
    float _2373 = fma(_2297, _2353, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2375 = fma(_2347, _2247, -0.5);
    float _2377 = -_1266;
    float _2379 = fma(_1150, _2299, _2377);
    if (_2207)
    {
        float _2381 = _2295 ? as_type<float>(_2367) : _2341;
        _2339 = _2381;
    }
    float _2383 = _2339;
    float _2385 = fma(_2373, _2323, _2359);
    if (_2217)
    {
        float _2387 = _2185 ? _2371 : _2355;
        _2361 = _2387;
    }
    float _2389 = _2361;
    float _2391 = _2237 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2393 = -_2335;
    float _2395 = _2393 + 1.0;
    float _2397 = -_1258;
    float _2399 = fma(_1264, _2375, _2397);
    float _2401 = _2199 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2403 = fma(_2391, _2383, -0.5);
    float _2405 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2221);
    float _2407 = _2357 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2409 = _2395 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2411 = fma(_2285, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2385);
    float _2413 = _2223 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2415 = fma(_2407, _2389, -0.5);
    float _2417 = fma(_1260, _2403, _1272);
    float _2419 = _2086 * 0.5;
    float _2421 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2405);
    float _2423 = fma(_1262, _2415, _1096);
    bool _2425 = _1830 > 0.0;
    bool _2427 = isnan(_1830);
    bool _2429 = _2425 || _2427;
    bool _2431 = isnan(0.0);
    bool _2433 = _2429 || _2431;
    float _2435 = _2399 + 0.5;
    float _2437 = _2379 + 0.5;
    float _2439 = _2417 + 0.5;
    float _2441 = _2423 + 0.5;
    float _2443 = fma(_2114, -0.5, _2419);
    float _2445 = _2225 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2447 = -_2409;
    float _2449 = _2447 + 1.0;
    float _2451 = _1830 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2453 = _2421 + _2086;
    float _2455 = _2112 + _2086;
    out.m_65.x = _2441;
    out.m_65.y = _2435;
    out.m_65.z = _2439;
    out.m_65.w = _2437;
    float _2457 = _2411 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2459 = _2453 * 0.5;
    float _2461 = _2455 * 0.5;
    float _2463 = _2451 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.x = _2413;
    out.m_67.y = _2401;
    out.m_67.z = _2445;
    out.m_67.w = _2457;
    out.gl_Position.x = _2112;
    out.gl_Position.y = _2114;
    out.gl_Position.z = _2421;
    out.gl_Position.w = _2086;
    out.m_69.x = _2461;
    out.m_69.y = _2443;
    out.m_69.z = _2459;
    out.m_69.w = _2086;
    out.m_45.x = _2463;
    float _2465 = _2409 * _2148;
    float _2467 = _2159 * _2449;
    float _2469 = _2159 * _2465;
    float _2471 = _2169 * _2465;
    float _2473 = fma(_2165, _2469, _2153);
    float _2475 = fma(_2167, _2469, _2155);
    float _2477 = fma(_2159, _2471, _2157);
    out.m_71.x = _2473;
    out.m_71.y = _2475;
    out.m_71.z = _2477;
    out.m_71.w = _2467;
    if (_2433)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2479 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2479;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

