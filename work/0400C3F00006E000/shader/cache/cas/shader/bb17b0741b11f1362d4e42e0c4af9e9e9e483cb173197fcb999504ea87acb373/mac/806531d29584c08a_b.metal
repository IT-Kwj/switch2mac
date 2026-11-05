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
    float4 m_59 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_61 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
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
    bool _1782 = false;
    bool _822 = false;
    bool _598 = false;
    bool _404 = false;
    bool _290 = false;
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
        float _2396 = as_type<float>(_106);
        out.gl_Position.z = _2396;
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
        float _2466 = as_type<float>(_144);
        out.gl_Position.z = _2466;
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
    float _270 = _262;
    float _288;
    if (!_268)
    {
        float _272 = in.m_53.x;
        float _274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _276 = _272 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _280 = _278 * _274;
        float _282 = floor(_280);
        float _284 = -_282;
        float _286 = _280 + _284;
        _288 = _286;
        _290 = true;
    }
    else
    {
        float _292 = float(_90);
        float _294 = 1.0 / _292;
        float _296 = _124 * _294;
        _288 = _296;
    }
    _290 = false;
    float _298 = _288;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _302 = _298 + _300;
    bool _304 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _306 = isnan(_298);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _316;
    bool _320 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _322 = isnan(_298);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -_314;
    float _334 = _332 + 1.0;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _336;
    float _340 = 1.0 / _318;
    bool _342 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _344 = _330 * _334;
    float _346 = -_330;
    float _348 = _346 + 1.0;
    float _350 = _302 * _340;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _352;
    float _356 = fma(_338, _350, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _358;
    float _362 = fma(_354, _350, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _364 = _356 * _344;
    float _366 = fma(_360, _350, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _368 = _362 * _344;
    float _370 = _366 * _344;
    float _372 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[143].x, _364);
    float _374 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[143].y, _370);
    float _376 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[143].z, _368);
    float _378 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[144].x, _372);
    float _380 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[144].y, _374);
    float _382 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[144].z, _376);
    bool _384 = !_342;
    float _402;
    if (!_384)
    {
        float _386 = in.m_53.x;
        float _388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _390 = _386 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _392 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _394 = _392 * _388;
        float _396 = floor(_394);
        float _398 = -_396;
        float _400 = _394 + _398;
        _402 = _400;
        _404 = true;
    }
    else
    {
        float _406 = float(_90);
        float _408 = 1.0 / _406;
        float _410 = _124 * _408;
        _402 = _410;
    }
    _404 = false;
    float _412 = _402;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _416 = _412 + _414;
    bool _418 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _420 = isnan(_412);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _432 = _412 + _430;
    bool _434 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _436 = isnan(_412);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _454 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _456 = isnan(_412);
    bool _458 = _454 || _456;
    bool _460 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    float _466 = in.m_51.x;
    float _468 = in.m_51.y;
    float _470 = in.m_51.z;
    float _472 = 1.0 / _448;
    float _474 = -_464;
    float _476 = _474 + 1.0;
    bool _478 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _480 = _444 * _476;
    float _482 = -_444;
    float _484 = _482 + 1.0;
    float _486 = 1.0 / _452;
    float _488 = _416 * _472;
    float _490 = -_428;
    float _492 = _490 + 1.0;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _494;
    float _498 = _464 * _492;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _500;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _504;
    float _508 = fma(_496, _488, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _510 = _432 * _486;
    float _512 = fma(_502, _488, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _514 = fma(_506, _488, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _516 = _508 * _480;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _522 = _512 * _480;
    float _524 = _514 * _480;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _534 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[107].x, _522);
    float _536 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[107].y, _516);
    float _538 = fma(_528, _510, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _540 = fma(_520, _510, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _542 = fma(_532, _510, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _544 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[107].z, _524);
    float _546 = fma(_538, _498, _534);
    float _548 = fma(_540, _498, _536);
    float _550 = fma(_542, _498, _544);
    float _552 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[109].x, _546);
    float _554 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[109].y, _548);
    float _556 = _382 * _470;
    float _558 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[109].z, _550);
    float _560 = _552 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _562 = _554 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _566 = _558 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _568 = _560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _570 = _562 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _572 = _380 * _468;
    float _574 = _566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _576 = _378 * _466;
    out.m_55.x = _568;
    out.m_55.y = _570;
    out.m_55.z = _574;
    out.m_55.w = _564;
    bool _578 = !_478;
    float _596;
    if (!_578)
    {
        float _580 = in.m_53.x;
        float _582 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _584 = _580 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _586 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _588 = _586 * _582;
        float _590 = floor(_588);
        float _592 = -_590;
        float _594 = _588 + _592;
        _596 = _594;
        _598 = true;
    }
    else
    {
        float _600 = float(_90);
        float _602 = 1.0 / _600;
        float _604 = _124 * _602;
        _596 = _604;
    }
    _598 = false;
    float _606 = _596;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _610 = _606 + _608;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _614 = _606 + _612;
    bool _616 = _606 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _618 = isnan(_606);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _628;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _634 = _606 + _632;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _636;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _644 = 1.0 / _630;
    bool _646 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _648 = 1.0 / _642;
    float _650 = 1.0 / _638;
    float _652 = _610 * _644;
    bool _654 = _606 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _656 = isnan(_606);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = -_626;
    float _668 = _666 + 1.0;
    float _670 = _664 * _668;
    float _672 = _614 * _648;
    bool _674 = _606 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _676 = isnan(_606);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _686;
    bool _690 = _606 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _692 = isnan(_606);
    bool _694 = _690 || _692;
    bool _696 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _698 = _694 || _696;
    float _700 = float(_698);
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _704 = _702 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _706 = -_664;
    float _708 = _706 + 1.0;
    float _710 = -_684;
    float _712 = _710 + 1.0;
    float _714 = _634 * _650;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _716;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _720;
    float _724 = _700 * _712;
    float _726 = fma(_688, _714, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _728 = fma(_718, _714, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _730 = fma(_722, _714, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _732 = _684 * _708;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _738 = _728 * _724;
    float _740 = _730 * _724;
    float _742 = _726 * _724;
    float _744 = -_700;
    float _746 = _744 + 1.0;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _752 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[123].x, _740);
    float _754 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[123].y, _738);
    float _756 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[123].z, _742);
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _758;
    float _762 = fma(_704, _672, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _764 = fma(_750, _672, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _766 = fma(_736, _672, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _768;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _772;
    float _776 = fma(_762, _732, _752);
    float _778 = fma(_760, _652, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _780 = fma(_770, _652, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _782 = fma(_774, _652, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _784 = fma(_764, _732, _754);
    float _786 = fma(_766, _732, _756);
    float _788 = fma(_778, _670, _776);
    float _790 = fma(_780, _670, _784);
    float _792 = fma(_782, _670, _786);
    float _794 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[126].x, _788);
    float _796 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[126].y, _790);
    float _798 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[126].z, _792);
    bool _800 = !_646;
    float _818;
    float _820;
    if (!_800)
    {
        float _802 = in.m_53.x;
        float _804 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _806 = _802 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _808 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _810 = _808 * _804;
        float _812 = floor(_810);
        float _814 = -_812;
        float _816 = _810 + _814;
        _818 = _812;
        _820 = _816;
        _822 = true;
    }
    else
    {
        float _824 = float(_90);
        float _826 = 1.0 / _824;
        float _828 = _124 * _826;
        _818 = _824;
        _820 = _828;
    }
    _822 = false;
    float _830 = _818;
    float _832 = _820;
    float _834 = in.m_53.z;
    float _836 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _838 = _572 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _842 = _840 != 0;
    float _844 = in.m_53.x;
    float _846 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _836);
    float _848 = _556 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _850 = in.m_53.w;
    float _852 = _576 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _856 = in.m_57.x;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _860 = _830;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_842)
    {
        float _864 = in.m_53.y;
        _860 = _864;
    }
    float _866 = _860;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _870 = _834 * 2.0;
    float _872 = _844 * 2.0;
    float _874 = floor(_870);
    bool _876 = _850 > 0.5;
    float _878 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _880 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _884 = _882 != 0;
    int _886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _888 = _886 != 0;
    int _890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _892 = _890 != 0;
    float _894 = floor(_872);
    float _896 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _880);
    float _898 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _878);
    float _900 = _896;
    bool _902 = _888;
    if (!_842)
    {
        _270 = _834;
    }
    float _904 = _270;
    float _906 = _904;
    if (!_842)
    {
        _862 = _866;
    }
    float _908 = _862;
    float _910 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _896);
    if (!_842)
    {
        _900 = _834;
    }
    float _912 = _900;
    float _914 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _898);
    bool _916 = _874 >= 0.0;
    bool _918 = isnan(_874);
    bool _920 = _916 || _918;
    bool _922 = isnan(0.0);
    bool _924 = _920 || _922;
    float _926 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _846);
    float _928 = _908;
    float _930 = _866;
    float _932 = _912;
    if (_842)
    {
        float _934 = in.m_53.x;
        float _936 = in.m_53.y;
        _928 = _934;
        _930 = _936;
    }
    float _938 = _928;
    float _940 = _930;
    float _942 = _914 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _944 = _924 ? 0 : 1;
    float _946 = _926 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _948 = _894 >= 0.0;
    bool _950 = isnan(_894);
    bool _952 = _948 || _950;
    bool _954 = isnan(0.0);
    bool _956 = _952 || _954;
    float _958 = _910 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _960 = _874 > 0.0;
    float _962 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _964 = _946 + _962;
    bool _966 = !_888;
    int _968 = _966 ? 0 : 1;
    float _970 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _972 = _942 + _970;
    float _974 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _976 = _958 + _974;
    int _978 = abs(_968);
    float _980 = float(_978);
    int _982 = as_type<int>(_940);
    if (_842)
    {
        _932 = _940;
    }
    float _984 = _932;
    float _986 = _938 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_842)
    {
        _906 = _940;
    }
    float _988 = _906;
    float _990 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[83].z, _854);
    bool _992 = _894 > 0.0;
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _996 = _956 ? 0 : 1;
    float _998 = _984 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1000 = _940 * 2.0;
    float _1002 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[83].w, _994);
    int _1004 = ~_996;
    int _1006 = _1004 + 1;
    int _1008 = _1006 + 1;
    float _1010 = fma(_998, -2.0, _858);
    bool _1012 = !_884;
    int _1014 = _1012 ? 0 : 1;
    float _1016 = _834 + _940;
    float _1018 = floor(_1000);
    float _1020 = -_868;
    float _1022 = fma(_986, 2.0, _1020);
    int _1024 = ~_944;
    int _1026 = _1024 + 1;
    int _1028 = _1026 + 1;
    float _1030 = _1016 + (-1.0);
    int _1032 = _1008;
    int _1034 = _1028;
    if (!_992)
    {
        int _1036 = ~_996;
        int _1038 = _1036 + 1;
        _1032 = _1038;
    }
    int _1040 = _1032;
    float _1042 = -_124;
    float _1044 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1022);
    if (!_960)
    {
        int _1046 = ~_944;
        int _1048 = _1046 + 1;
        _1034 = _1048;
    }
    int _1050 = _1034;
    float _1052 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1010);
    float _1054 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1056 = log2(_1054);
    int _1058 = abs(_1014);
    float _1060 = _844 + _940;
    float _1062 = float(_1050);
    float _1064 = float(_1058);
    float _1066 = _1060 + (-1.0);
    float _1068 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1070 = _1018 > 0.0;
    float _1072 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1074 = _964 * _964;
    bool _1076 = _1018 >= 0.0;
    bool _1078 = isnan(_1018);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan(0.0);
    bool _1084 = _1080 || _1082;
    float _1086 = _1064 * _1062;
    bool _1088 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1090 = isnan(0.0);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1096 = _1092 || _1094;
    float _1098 = fma(_972, _972, _1074);
    float _1100 = _1056 * _124;
    float _1102 = in.m_59.x;
    float _1104 = in.m_59.y;
    float _1106 = in.m_59.z;
    float _1108 = float(_1040);
    float _1110 = fma(_976, _976, _1098);
    bool _1112 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1114 = isnan(1.0);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1120 = _1116 || _1118;
    float _1122 = exp2(_1100);
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1126 = 1.0 + _1124;
    float _1128 = _980 * _1108;
    float _1130 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1002);
    int _1132 = _1084 ? 0 : 1;
    float _1134 = 1.0 / _1126;
    float _1136 = -_1122;
    float _1138 = _1136 + 1.0;
    float _1140 = rsqrt(_1110);
    float _1142 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _990);
    float _1144 = _844 + (-0.5);
    float _1146 = _1096 ? _1138 : 0.0;
    int _1148 = ~_1132;
    int _1150 = _1148 + 1;
    int _1152 = _1150 + 1;
    int _1154 = _1152;
    bool _1156 = _1084;
    if (!_1070)
    {
        int _1158 = ~_1132;
        int _1160 = _1158 + 1;
        _1154 = _1160;
    }
    int _1162 = _1154;
    if (_1120)
    {
        float _1164 = _1146 * _1134;
        _126 = _1164;
    }
    float _1166 = _126;
    float _1168 = _1086 * (-2.0);
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1172 = _1170 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1174 = !_892;
    int _1176 = _1174 ? 0 : 1;
    float _1178 = fma(_1168, _1102, _1102);
    float _1180 = fma(_1072, _1168, _1072);
    float _1182 = _964 * _1140;
    int _1184 = abs(_1176);
    float _1186 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1178);
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1190 = _1188 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1192 = -_1182;
    float _1194 = fma(_1192, (*spvDescriptorSet0.vp_c9)._m0[18].w, _964);
    float _1196 = _972 * _1140;
    float _1198 = fma(_1180, _1166, _1186);
    float _1200 = 1.0 / _1190;
    float _1202 = _1194 * _1194;
    float _1204 = -_1196;
    float _1206 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[18].w, _972);
    float _1208 = _976 * _1140;
    float _1210 = _1198 * 0.15915493667125701904296875;
    float _1212 = fma(_1206, _1206, _1202);
    float _1214 = -_1208;
    float _1216 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[18].w, _976);
    float _1218 = _1128 * (-2.0);
    float _1220 = _940 + (-0.5);
    float _1222 = fma(_1216, _1216, _1212);
    float _1224 = float(_1184);
    float _1226 = fma(_1218, _1104, _1104);
    float _1228 = float(_1162);
    float _1230 = fma(_1068, _1218, _1068);
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1234 = _1232 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1236 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1226);
    float _1238 = in.m_61.x;
    float _1240 = in.m_61.y;
    float _1242 = in.m_61.z;
    float _1244 = _1224 * _1228;
    float _1246 = fma(_1230, _1166, _1236);
    float _1248 = _844 + _834;
    float _1250 = _1244 * (-2.0);
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1254 = _1252 != 0;
    float _1256 = _834 + (-0.5);
    float _1258 = _1248 + (-1.0);
    int _1260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1262 = _1260 != 0;
    float _1264 = fma(_1250, _1106, _1106);
    int _1266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1268 = _1266 != 0;
    float _1270 = 1.0 / _1234;
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1274 = _1272 != 0;
    float _1276 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1278 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1264);
    float _1280 = _1246 * 0.15915493667125701904296875;
    float _1282 = fma(_1276, _1250, _1276);
    if (_1254)
    {
        bool _1284 = _844 > 0.5;
        _1156 = _1284;
    }
    bool _1286 = _1156;
    float _1288 = sqrt(_1222);
    float _1290 = fma(_1282, _1166, _1278);
    float _1292 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1242);
    float _1294 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1240);
    float _1296 = _1290 * 0.15915493667125701904296875;
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1298;
    float _1302 = 1.0 / _1172;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1304;
    float _1308 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1238);
    if (_1262)
    {
        bool _1310 = _834 > 0.5;
        _902 = _1310;
    }
    bool _1312 = _902;
    float _1314 = _1306 * _1270;
    float _1316 = _1210 * 6.283185482025146484375;
    float _1318 = sin(_1316);
    float _1320 = _1140 * _1288;
    float _1322 = _838 * _1320;
    float _1324 = _848 * _1320;
    float _1326 = _1210 * 6.283185482025146484375;
    float _1328 = cos(_1326);
    float _1330 = _1300 * _1302;
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1334 = _1332 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1338 = _832 + _1336;
    float _1340 = _1322 * _1294;
    float _1342 = _1324 * _1292;
    float _1344 = _1334 * _1200;
    float _1346 = _852 * _1320;
    float _1348 = _1280 * 6.283185482025146484375;
    float _1350 = sin(_1348);
    float _1352 = fma(_1330, _1338, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1356 = _832 + _1354;
    float _1358 = _1346 * _1308;
    float _1360 = fma(_1344, _1356, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1362 = _1280 * 6.283185482025146484375;
    float _1364 = cos(_1362);
    float _1366 = _1296 * 6.283185482025146484375;
    float _1368 = cos(_1366);
    float _1370 = _1328 * _1350;
    float _1372 = _1318 * _1350;
    float _1374 = _1296 * 6.283185482025146484375;
    float _1376 = sin(_1374);
    float _1378 = _1318 * _1364;
    float _1380 = _1328 * _1364;
    float _1382 = _1368 * _1340;
    float _1384 = _1364 * _1368;
    float _1386 = _1350 * _1368;
    bool _1388 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1390 = isnan(_832);
    bool _1392 = _1388 || _1390;
    bool _1394 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1396 = _1392 || _1394;
    float _1398 = float(_1396);
    float _1400 = _1328 * _1382;
    float _1402 = _1318 * _1382;
    bool _1404 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1406 = isnan(_832);
    bool _1408 = _1404 || _1406;
    bool _1410 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1412 = _1408 || _1410;
    float _1414 = float(_1412);
    float _1416 = -_1370;
    float _1418 = fma(_1376, _1378, _1416);
    float _1420 = -_1378;
    float _1422 = fma(_1376, _1370, _1420);
    float _1424 = fma(_1376, _1380, _1372);
    float _1426 = -_1340;
    float _1428 = _1376 * _1426;
    float _1430 = fma(_1418, _1358, _1402);
    float _1432 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1434 = fma(_1424, _1358, _1400);
    float _1436 = fma(_1376, _1372, _1380);
    float _1438 = fma(_1384, _1358, _1428);
    bool _1440 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1442 = isnan(_832);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1448 = _1444 || _1446;
    float _1450 = float(_1448);
    float _1452 = fma(_1422, _1342, _1434);
    float _1454 = fma(_1436, _1342, _1430);
    float _1456 = fma(_1386, _1342, _1438);
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1460 = _832 + _1458;
    float _1462 = _1452 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1464 = _1452 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1466 = in.m_57.y;
    float _1468 = fma(_1314, _1460, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1470 = fma(_1456, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1462);
    float _1472 = fma(_1456, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1464);
    bool _1474 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1476 = isnan(_832);
    bool _1478 = _1474 || _1476;
    bool _1480 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1482 = _1478 || _1480;
    float _1484 = float(_1482);
    float _1486 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1488 = fma(_1454, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1470);
    float _1490 = fma(_1454, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1472);
    float _1492 = _1432 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1494 = -_1484;
    float _1496 = _1494 + 1.0;
    float _1498 = _942 + _1488;
    float _1500 = _958 + _1490;
    float _1502 = _1452 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1504 = _1450 * _1496;
    float _1506 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1508 = _1498 + _1506;
    float _1510 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1512 = _1500 + _1510;
    float _1514 = -_1450;
    float _1516 = _1514 + 1.0;
    float _1518 = fma(_1456, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1502);
    float _1520 = _1508 * _1508;
    float _1522 = _1512 * _1512;
    float _1524 = _1414 * _1516;
    float _1526 = -_1414;
    float _1528 = _1526 + 1.0;
    float _1530 = _1414;
    float _1532 = _1492;
    float _1534 = _1502;
    float _1536 = _1520;
    float _1538 = _1522;
    float _1540 = _1498;
    float _1542 = _1500;
    float _1544 = _1484;
    if (!_1254)
    {
        _1530 = _856;
    }
    float _1546 = _1530;
    float _1548 = _1520 + _1522;
    float _1550 = -_1466;
    float _1552 = _1550 + 1.0;
    float _1554 = _1486 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1556 = fma(_1454, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1518);
    float _1558 = sqrt(_1548);
    int _1560 = _876 ? as_type<int>(_1552) : as_type<int>(_1466);
    bool _1562 = _940 > 0.5;
    float _1564 = _1466;
    float _1566 = _1546;
    if (_1254)
    {
        float _1568 = -_856;
        float _1570 = _1568 + 1.0;
        _982 = as_type<int>(_1570);
    }
    int _1572 = _982;
    int _1574 = _1268 ? _1560 : as_type<int>(_1466);
    float _1576 = _1398 * _1528;
    float _1578 = -_1398;
    float _1580 = _1578 + 1.0;
    int _1582 = _1574;
    if (_1274)
    {
        float _1584 = _1562 ? _1552 : _1466;
        _1564 = _1584;
    }
    float _1586 = _1564;
    float _1588 = fma(_1492, as_type<float>(_1574), -0.5);
    if (_1262)
    {
        float _1590 = -_856;
        float _1592 = _1590 + 1.0;
        _1582 = as_type<int>(_1592);
    }
    int _1594 = _1582;
    float _1596 = _1352 * _1576;
    if (_1254)
    {
        float _1598 = _1286 ? as_type<float>(_1572) : _856;
        _1566 = _1598;
    }
    float _1600 = _1566;
    float _1602 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1604 = _1558 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1606 = fma(_1580, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1596);
    if (!_1262)
    {
        _1532 = _856;
    }
    float _1608 = _1532;
    float _1610 = _1608;
    if (_1262)
    {
        float _1612 = _1312 ? as_type<float>(_1594) : _856;
        _1610 = _1612;
    }
    float _1614 = _1610;
    float _1616 = fma(_1360, _1524, _1606);
    float _1618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1620 = fma(_1554, _1614, -0.5);
    float _1622 = _946 + _1556;
    if (!_1604)
    {
        _1534 = _1622;
    }
    float _1624 = _1534;
    bool _1626 = !_1604;
    float _1628 = _1624;
    if (!_1626)
    {
        float _1630 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1634 = _1558 + _1632;
        float _1636 = rsqrt(_1548);
        float _1638 = _1634 * _1630;
        float _1640 = _1622 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1642 = _1638 * 0.15915493667125701904296875;
        float _1644 = _1642 * 6.283185482025146484375;
        float _1646 = sin(_1644);
        float _1648 = _1642 * 6.283185482025146484375;
        float _1650 = cos(_1648);
        float _1652 = fma(_1646, _1640, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1654 = _1636 * _1652;
        float _1656 = fma(_1508, _1654, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1658 = _1650 + (-1.0);
        float _1660 = fma(_1512, _1654, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1662 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1664 = _1656 + _1662;
        float _1666 = _1658 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1668 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1670 = _1660 + _1668;
        float _1672 = _1664 * _1664;
        float _1674 = fma(_1622, _1650, _1666);
        float _1676 = _1670 * _1670;
        _1628 = _1674;
        _1536 = _1672;
        _1538 = _1676;
        _1540 = _1656;
        _1542 = _1660;
    }
    float _1678 = _1628;
    float _1680 = _1536;
    float _1682 = _1538;
    float _1684 = _1540;
    float _1686 = _1542;
    float _1688 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1690 = _1678 + _1688;
    float _1692 = fma(_1142, _1620, _1044);
    float _1694 = _1600 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1696 = fma(_1468, _1504, _1616);
    float _1698 = fma(_1690, _1690, _1680);
    float _1700 = -_1052;
    float _1702 = fma(_1130, _1588, _1700);
    float _1704 = _1586 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1706 = _1694 * _1602;
    float _1708 = _1698 + _1682;
    float _1710 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1696);
    float _1712 = _794 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1714 = _796 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1716 = _798 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1718 = _1704 * _1618;
    float _1720 = sqrt(_1708);
    float _1722 = _1712 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1724 = _1714 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1726 = _1716 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1728 = _1692 + 0.5;
    float _1730 = _1710 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1732 = _1702 + 0.5;
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    out.m_65.x = _1722;
    out.m_65.y = _1724;
    out.m_65.z = _1726;
    out.m_65.w = _1730;
    bool _1734 = _1720 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1736 = isnan(_1720);
    bool _1738 = _1734 || _1736;
    bool _1740 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1742 = _1738 || _1740;
    out.m_67.x = _1706;
    out.m_67.y = _1718;
    out.m_67.z = _1728;
    out.m_67.w = _1732;
    float _1744 = _1726;
    float _1746 = _1730;
    if (!_1742)
    {
        _1544 = 1.0;
    }
    float _1748 = _1544;
    bool _1750 = !_1742;
    float _1752 = _1748;
    if (!_1750)
    {
        bool _1754 = _1720 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1756 = isnan(_1720);
        bool _1758 = _1754 || _1756;
        bool _1760 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1762 = _1758 || _1760;
        if (!_1762)
        {
            float _1764 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1766 = _1720 + _1764;
            float _1768 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1770 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1768;
            float _1772 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1774 = _1772 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1776 = 1.0 / _1770;
            float _1778 = _1766 * _1776;
            float _1780 = fma(_1778, _1774, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1752 = _1780;
            _1782 = true;
        }
        else
        {
            bool _1784 = _1720 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1786 = isnan(_1720);
            bool _1788 = _1784 || _1786;
            bool _1790 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1792 = _1788 || _1790;
            if (!_1792)
            {
                float _1794 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1796 = _1720 + _1794;
                float _1798 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1800 = _1798 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1802 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1804 = _1802 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1806 = 1.0 / _1800;
                float _1808 = _1796 * _1806;
                float _1810 = fma(_1808, _1804, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1752 = _1810;
                _1782 = true;
            }
            else
            {
                _1752 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1782 = false;
    float _1812 = _1752;
    float _1814 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1816 = _1678 + _1814;
    float _1818 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1820 = _1684 + _1818;
    float _1822 = fma(_1816, _1812, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1824 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1826 = _1686 + _1824;
    float _1828 = fma(_1820, _1812, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1830 = -_1182;
    float _1832 = fma(_1830, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1822);
    float _1834 = fma(_1826, _1812, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1836 = -_1196;
    float _1838 = fma(_1836, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1828);
    float _1840 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1842 = _1832 + _1840;
    float _1844 = -_1208;
    float _1846 = fma(_1844, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1834);
    float _1848 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1850 = _1838 + _1848;
    float _1852 = _1842 * _1842;
    float _1854 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1856 = _1846 + _1854;
    float _1858 = fma(_1850, _1850, _1852);
    float _1860 = fma(_1856, _1856, _1858);
    float _1862 = rsqrt(_1860);
    float _1864 = _1862 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1866 = _1850 * _1864;
    float _1868 = _1856 * _1864;
    float _1870 = _1866 * _1866;
    float _1872 = _1868 * _1868;
    float _1874 = _1870 + _1872;
    float _1876 = sqrt(_1874);
    bool _1878 = _1876 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1880 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1882 = _1876 + _1880;
    float _1884 = _1856;
    float _1886 = _1874;
    float _1888 = _1882;
    float _1890 = _1866;
    if (_1878)
    {
        float _1892 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1884 = _1892;
    }
    float _1894 = _1884;
    if (_1878)
    {
        float _1896 = rsqrt(_1874);
        _1886 = _1896;
    }
    float _1898 = _1886;
    float _1900 = _1898;
    if (_1878)
    {
        float _1902 = _1882 * _1894;
        _1888 = _1902;
    }
    float _1904 = _1888;
    if (_1878)
    {
        float _1906 = _1904 * 0.15915493667125701904296875;
        _1744 = _1906;
    }
    float _1908 = _1744;
    float _1910 = _1834;
    if (_1878)
    {
        float _1912 = _1908 * 6.283185482025146484375;
        float _1914 = sin(_1912);
        _1910 = _1914;
    }
    float _1916 = _1910;
    float _1918 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1920 = precise::max(0.0, _1918);
    float _1922 = _1862;
    float _1924 = _1920;
    float _1926 = _1918;
    if (_1878)
    {
        float _1928 = _1908 * 6.283185482025146484375;
        float _1930 = cos(_1928);
        _1922 = _1930;
    }
    float _1932 = _1922;
    float _1934 = -_1864;
    float _1936 = -_1920;
    float _1938 = fma(_1842, _1934, _1936);
    float _1940 = _1938;
    if (_1878)
    {
        float _1942 = _1938 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1924 = _1942;
    }
    float _1944 = _1924;
    float _1946 = sqrt(_1860);
    float _1948 = _1916;
    float _1950 = _1944;
    if (_1878)
    {
        float _1952 = fma(_1916, _1944, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1948 = _1952;
    }
    float _1954 = _1948;
    float _1956 = _1954;
    if (!_1878)
    {
        _1950 = _1868;
    }
    float _1958 = _1950;
    float _1960 = _1958;
    if (_1878)
    {
        float _1962 = _1932 + (-1.0);
        _1926 = _1962;
    }
    float _1964 = _1926;
    float _1966 = _1964;
    if (_1878)
    {
        float _1968 = _1898 * _1954;
        _1956 = _1968;
    }
    float _1970 = _1956;
    if (!_1878)
    {
        _1900 = _1870;
    }
    float _1972 = _1900;
    float _1974 = _1972;
    if (_1878)
    {
        float _1976 = _1964 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1746 = _1976;
    }
    float _1978 = _1746;
    if (_1878)
    {
        float _1980 = _1866 * _1970;
        _1890 = _1980;
    }
    float _1982 = _1890;
    if (_1878)
    {
        float _1984 = _1868 * _1970;
        _1960 = _1984;
    }
    float _1986 = _1960;
    if (!_1878)
    {
        _1966 = _1872;
    }
    float _1988 = _1966;
    float _1990 = _1988;
    if (_1878)
    {
        float _1992 = fma(_1938, _1932, _1978);
        _1940 = _1992;
    }
    float _1994 = _1940;
    if (_1878)
    {
        float _1996 = _1982 * _1982;
        _1974 = _1996;
    }
    float _1998 = _1974;
    if (_1878)
    {
        float _2000 = _1986 * _1986;
        _1990 = _2000;
    }
    float _2002 = _1990;
    float _2004 = fma(_1994, _1994, _1998);
    float _2006 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2008 = fma(_1946, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2006);
    float _2010 = precise::clamp(_2008, 0.0, 1.0);
    float _2012 = _2004 + _2002;
    float _2014 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2016 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2018 = -_2010;
    float _2020 = _2018 + 1.0;
    float _2022 = rsqrt(_2012);
    float _2024 = fma(_1838, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2014);
    float _2026 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2028 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2030 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2032 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2024);
    float _2034 = fma(_1838, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2026);
    float _2036 = fma(_1838, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2028);
    float _2038 = fma(_1838, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2030);
    float _2040 = _2032 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2042 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2034);
    float _2044 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2036);
    float _2046 = abs(_2020);
    float _2048 = log2(_2046);
    float _2050 = _2040 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2052 = _2042 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2054 = _2044 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2056 = _2022 * _1982;
    float _2058 = -_2050;
    float _2060 = fma(_2058, _2016, 1.0);
    float _2062 = _2052 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2064 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2038);
    float _2066 = _2056 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2068 = _2022 * _1986;
    float _2070 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2062);
    float _2072 = _2022 * _1994;
    float _2074 = _2064 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2076 = log2(_2060);
    float _2078 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2070);
    float _2080 = -_2066;
    float _2082 = fma(_2072, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2080);
    float _2084 = _2048 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2086 = _2052 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2088 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2078);
    float _2090 = -_2068;
    float _2092 = fma(_2090, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2082);
    float _2094 = _2052 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2096 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2086);
    float _2098 = exp2(_2084);
    float _2100 = fma(_2092, -0.5, 0.5);
    float _2102 = fma(_2092, 0.5, 0.5);
    float _2104 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2094);
    float _2106 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2096);
    float _2108 = _2072 + 1.0;
    float _2110 = fma(_2102, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2112 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2104);
    float _2114 = 1.0 / _2088;
    float _2116 = _2076 * 0.693147182464599609375;
    float _2118 = fma(_2102, _2110, -0.212114393711090087890625);
    float _2120 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2112);
    float _2122 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2106);
    float _2124 = fma(_2102, _2118, 1.570728778839111328125);
    float _2126 = sqrt(_2100);
    float _2128 = -_2072;
    float _2130 = fma(_2098, _2108, _2128);
    float _2132 = fma(_2130, 0.5, 0.5);
    float _2134 = _2120 * _2114;
    float _2136 = _2122 * _2114;
    float _2138 = _2116 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2140 = fma(_2134, 0.5, 0.5);
    float _2142 = fma(_2136, -0.5, 0.5);
    float _2144 = _2126 * 0.636619746685028076171875;
    float _2146 = -_2124;
    float _2148 = fma(_2144, _2146, 1.0);
    float3 _5684 = float3(_2140, _2142, _2138);
    float _2150 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5684, float3(0.0), isnan(_5684)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5684, float3(0.0), isnan(_5684)), level(0.0)).x;
    float3 _5695 = float3(_2140, _2142, _2138);
    float4 _2153 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5695, float3(0.0), isnan(_5695)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5695, float3(0.0), isnan(_5695)), level(0.0)).xyzw;
    float _2155 = _2153.x;
    float _2157 = _2153.y;
    float _2159 = _2153.z;
    float _2161 = _2153.w;
    float2 _5712 = float2(_2148, _2132);
    float3 _2165 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5712, float2(0.0), isnan(_5712)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5712, float2(0.0), isnan(_5712)), level(0.0)).xyz;
    float _2167 = _2165.x;
    float _2169 = _2165.y;
    float _2171 = _2165.z;
    float _2173 = -_1182;
    float _2175 = fma(_2173, (*spvDescriptorSet0.vp_c9)._m0[18].w, _946);
    float _2177 = -_1196;
    float _2179 = fma(_2177, (*spvDescriptorSet0.vp_c9)._m0[18].w, _942);
    float _2181 = -_1208;
    float _2183 = fma(_2181, (*spvDescriptorSet0.vp_c9)._m0[18].w, _958);
    float _2185 = _2052 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2187 = _2175 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2189 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2185);
    float _2191 = fma(_2179, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2187);
    float _2193 = _2175 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2195 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2189);
    float _2197 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2191);
    float _2199 = fma(_2179, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2193);
    bool _2201 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2203 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2205 = _2201 || _2203;
    bool _2207 = isnan(0.5);
    bool _2209 = _2205 || _2207;
    float _2211 = _2048 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2213 = _2197 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2215 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2199);
    float _2217 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2195);
    float _2219 = exp2(_2211);
    float _2221 = _2215 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2223 = _2221 + _2213;
    float _2225 = 1.0 / _2213;
    float _2227 = _2185;
    if (_2209)
    {
        _2227 = 1.0;
    }
    float _2229 = _2227;
    float _2231 = _2223 * _2225;
    float _2233 = _2231 * 0.5;
    float _2235 = _2229;
    if (!_2209)
    {
        float _2237 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2239 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2241 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2239);
        float _2243 = _2237 * 0.15915493667125701904296875;
        float _2245 = _2243 * 6.283185482025146484375;
        float _2247 = cos(_2245);
        float _2249 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2251 = _2249 * 0.15915493667125701904296875;
        float _2253 = _2243 * 6.283185482025146484375;
        float _2255 = sin(_2253);
        float _2257 = 1.0 / _2247;
        float _2259 = _2251 * 6.283185482025146484375;
        float _2261 = cos(_2259);
        float _2263 = _2255 * _2257;
        float _2265 = 1.0 / _2241;
        float _2267 = _2261 * _2263;
        float _2269 = _2251 * 6.283185482025146484375;
        float _2271 = sin(_2269);
        float _2273 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2275 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2273;
        float _2277 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2279 = _2265 * _2277;
        float _2281 = 1.0 / _2267;
        float _2283 = 1.0 / _2275;
        float _2285 = _2271 * _2281;
        float _2287 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2289 = fma(_2285, _2279, _2287);
        float _2291 = _2289 * _2283;
        float _2293 = precise::clamp(_2291, 0.0, 1.0);
        _2235 = _2293;
    }
    float _2295 = _2235;
    float _2297 = -_2219;
    float _2299 = _2297 + 1.0;
    float _2301 = _2217 + _2088;
    bool _2303 = _2295 > 0.0;
    bool _2305 = isnan(_2295);
    bool _2307 = _2303 || _2305;
    bool _2309 = isnan(0.0);
    bool _2311 = _2307 || _2309;
    float _2313 = _2295 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2315 = _2299 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2317 = _2301 * 0.5;
    float _2319 = _2315 * _2150;
    float _2321 = -_2315;
    float _2323 = _2321 + 1.0;
    out.gl_Position.x = _2120;
    out.gl_Position.y = _2122;
    out.gl_Position.z = _2217;
    out.gl_Position.w = _2088;
    float _2325 = _2313 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2327 = _2161 * _2319;
    float _2329 = _2171 * _2319;
    out.m_69.z = _2317;
    out.m_69.w = _2088;
    float _2331 = fma(_2167, _2327, _2155);
    float _2333 = fma(_2169, _2327, _2157);
    float _2335 = _2161 * _2323;
    float _2337 = fma(_2161, _2329, _2159);
    out.m_47.x = _2325;
    out.m_71.x = _2331;
    out.m_71.y = _2333;
    out.m_71.z = _2337;
    out.m_71.w = _2335;
    if (_2311)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1782 = false;
    bool _822 = false;
    bool _598 = false;
    bool _404 = false;
    bool _290 = false;
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
        float _2396 = as_type<float>(_106);
        out.gl_Position.z = _2396;
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
        float _2466 = as_type<float>(_144);
        out.gl_Position.z = _2466;
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
    float _270 = _262;
    float _288;
    if (!_268)
    {
        float _272 = in.m_53.x;
        float _274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _276 = _272 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _280 = _278 * _274;
        float _282 = floor(_280);
        float _284 = -_282;
        float _286 = _280 + _284;
        _288 = _286;
        _290 = true;
    }
    else
    {
        float _292 = float(_90);
        float _294 = 1.0 / _292;
        float _296 = _124 * _294;
        _288 = _296;
    }
    _290 = false;
    float _298 = _288;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _302 = _298 + _300;
    bool _304 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _306 = isnan(_298);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _316;
    bool _320 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _322 = isnan(_298);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -_314;
    float _334 = _332 + 1.0;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _336;
    float _340 = 1.0 / _318;
    bool _342 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _344 = _330 * _334;
    float _346 = -_330;
    float _348 = _346 + 1.0;
    float _350 = _302 * _340;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _352;
    float _356 = fma(_338, _350, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _358;
    float _362 = fma(_354, _350, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _364 = _356 * _344;
    float _366 = fma(_360, _350, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _368 = _362 * _344;
    float _370 = _366 * _344;
    float _372 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[143].x, _364);
    float _374 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[143].y, _370);
    float _376 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[143].z, _368);
    float _378 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[144].x, _372);
    float _380 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[144].y, _374);
    float _382 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[144].z, _376);
    bool _384 = !_342;
    float _402;
    if (!_384)
    {
        float _386 = in.m_53.x;
        float _388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _390 = _386 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _392 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _394 = _392 * _388;
        float _396 = floor(_394);
        float _398 = -_396;
        float _400 = _394 + _398;
        _402 = _400;
        _404 = true;
    }
    else
    {
        float _406 = float(_90);
        float _408 = 1.0 / _406;
        float _410 = _124 * _408;
        _402 = _410;
    }
    _404 = false;
    float _412 = _402;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _416 = _412 + _414;
    bool _418 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _420 = isnan(_412);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _432 = _412 + _430;
    bool _434 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _436 = isnan(_412);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _454 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _456 = isnan(_412);
    bool _458 = _454 || _456;
    bool _460 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    float _466 = in.m_51.x;
    float _468 = in.m_51.y;
    float _470 = in.m_51.z;
    float _472 = 1.0 / _448;
    float _474 = -_464;
    float _476 = _474 + 1.0;
    bool _478 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _480 = _444 * _476;
    float _482 = -_444;
    float _484 = _482 + 1.0;
    float _486 = 1.0 / _452;
    float _488 = _416 * _472;
    float _490 = -_428;
    float _492 = _490 + 1.0;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _494;
    float _498 = _464 * _492;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _500;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _504;
    float _508 = fma(_496, _488, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _510 = _432 * _486;
    float _512 = fma(_502, _488, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _514 = fma(_506, _488, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _516 = _508 * _480;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _522 = _512 * _480;
    float _524 = _514 * _480;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _534 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[107].x, _522);
    float _536 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[107].y, _516);
    float _538 = fma(_528, _510, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _540 = fma(_520, _510, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _542 = fma(_532, _510, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _544 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[107].z, _524);
    float _546 = fma(_538, _498, _534);
    float _548 = fma(_540, _498, _536);
    float _550 = fma(_542, _498, _544);
    float _552 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[109].x, _546);
    float _554 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[109].y, _548);
    float _556 = _382 * _470;
    float _558 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[109].z, _550);
    float _560 = _552 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _562 = _554 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _566 = _558 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _568 = _560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _570 = _562 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _572 = _380 * _468;
    float _574 = _566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _576 = _378 * _466;
    out.m_55.x = _568;
    out.m_55.y = _570;
    out.m_55.z = _574;
    out.m_55.w = _564;
    bool _578 = !_478;
    float _596;
    if (!_578)
    {
        float _580 = in.m_53.x;
        float _582 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _584 = _580 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _586 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _588 = _586 * _582;
        float _590 = floor(_588);
        float _592 = -_590;
        float _594 = _588 + _592;
        _596 = _594;
        _598 = true;
    }
    else
    {
        float _600 = float(_90);
        float _602 = 1.0 / _600;
        float _604 = _124 * _602;
        _596 = _604;
    }
    _598 = false;
    float _606 = _596;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _610 = _606 + _608;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _614 = _606 + _612;
    bool _616 = _606 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _618 = isnan(_606);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _628;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _634 = _606 + _632;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _636;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _644 = 1.0 / _630;
    bool _646 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _648 = 1.0 / _642;
    float _650 = 1.0 / _638;
    float _652 = _610 * _644;
    bool _654 = _606 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _656 = isnan(_606);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = -_626;
    float _668 = _666 + 1.0;
    float _670 = _664 * _668;
    float _672 = _614 * _648;
    bool _674 = _606 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _676 = isnan(_606);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _686;
    bool _690 = _606 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _692 = isnan(_606);
    bool _694 = _690 || _692;
    bool _696 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _698 = _694 || _696;
    float _700 = float(_698);
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _704 = _702 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _706 = -_664;
    float _708 = _706 + 1.0;
    float _710 = -_684;
    float _712 = _710 + 1.0;
    float _714 = _634 * _650;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _716;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _720;
    float _724 = _700 * _712;
    float _726 = fma(_688, _714, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _728 = fma(_718, _714, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _730 = fma(_722, _714, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _732 = _684 * _708;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _738 = _728 * _724;
    float _740 = _730 * _724;
    float _742 = _726 * _724;
    float _744 = -_700;
    float _746 = _744 + 1.0;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _752 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[123].x, _740);
    float _754 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[123].y, _738);
    float _756 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[123].z, _742);
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _758;
    float _762 = fma(_704, _672, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _764 = fma(_750, _672, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _766 = fma(_736, _672, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _768;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _772;
    float _776 = fma(_762, _732, _752);
    float _778 = fma(_760, _652, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _780 = fma(_770, _652, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _782 = fma(_774, _652, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _784 = fma(_764, _732, _754);
    float _786 = fma(_766, _732, _756);
    float _788 = fma(_778, _670, _776);
    float _790 = fma(_780, _670, _784);
    float _792 = fma(_782, _670, _786);
    float _794 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[126].x, _788);
    float _796 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[126].y, _790);
    float _798 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[126].z, _792);
    bool _800 = !_646;
    float _818;
    float _820;
    if (!_800)
    {
        float _802 = in.m_53.x;
        float _804 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _806 = _802 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _808 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _810 = _808 * _804;
        float _812 = floor(_810);
        float _814 = -_812;
        float _816 = _810 + _814;
        _818 = _812;
        _820 = _816;
        _822 = true;
    }
    else
    {
        float _824 = float(_90);
        float _826 = 1.0 / _824;
        float _828 = _124 * _826;
        _818 = _824;
        _820 = _828;
    }
    _822 = false;
    float _830 = _818;
    float _832 = _820;
    float _834 = in.m_53.z;
    float _836 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _838 = _572 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _842 = _840 != 0;
    float _844 = in.m_53.x;
    float _846 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _836);
    float _848 = _556 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _850 = in.m_53.w;
    float _852 = _576 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _856 = in.m_57.x;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _860 = _830;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_842)
    {
        float _864 = in.m_53.y;
        _860 = _864;
    }
    float _866 = _860;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _870 = _834 * 2.0;
    float _872 = _844 * 2.0;
    float _874 = floor(_870);
    bool _876 = _850 > 0.5;
    float _878 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _880 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _884 = _882 != 0;
    int _886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _888 = _886 != 0;
    int _890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _892 = _890 != 0;
    float _894 = floor(_872);
    float _896 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _880);
    float _898 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _878);
    float _900 = _896;
    bool _902 = _888;
    if (!_842)
    {
        _270 = _834;
    }
    float _904 = _270;
    float _906 = _904;
    if (!_842)
    {
        _862 = _866;
    }
    float _908 = _862;
    float _910 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _896);
    if (!_842)
    {
        _900 = _834;
    }
    float _912 = _900;
    float _914 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _898);
    bool _916 = _874 >= 0.0;
    bool _918 = isnan(_874);
    bool _920 = _916 || _918;
    bool _922 = isnan(0.0);
    bool _924 = _920 || _922;
    float _926 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _846);
    float _928 = _908;
    float _930 = _866;
    float _932 = _912;
    if (_842)
    {
        float _934 = in.m_53.x;
        float _936 = in.m_53.y;
        _928 = _934;
        _930 = _936;
    }
    float _938 = _928;
    float _940 = _930;
    float _942 = _914 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _944 = _924 ? 0 : 1;
    float _946 = _926 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _948 = _894 >= 0.0;
    bool _950 = isnan(_894);
    bool _952 = _948 || _950;
    bool _954 = isnan(0.0);
    bool _956 = _952 || _954;
    float _958 = _910 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _960 = _874 > 0.0;
    float _962 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _964 = _946 + _962;
    bool _966 = !_888;
    int _968 = _966 ? 0 : 1;
    float _970 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _972 = _942 + _970;
    float _974 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _976 = _958 + _974;
    int _978 = abs(_968);
    float _980 = float(_978);
    int _982 = as_type<int>(_940);
    if (_842)
    {
        _932 = _940;
    }
    float _984 = _932;
    float _986 = _938 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_842)
    {
        _906 = _940;
    }
    float _988 = _906;
    float _990 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[83].z, _854);
    bool _992 = _894 > 0.0;
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _996 = _956 ? 0 : 1;
    float _998 = _984 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1000 = _940 * 2.0;
    float _1002 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[83].w, _994);
    int _1004 = ~_996;
    int _1006 = _1004 + 1;
    int _1008 = _1006 + 1;
    float _1010 = fma(_998, -2.0, _858);
    bool _1012 = !_884;
    int _1014 = _1012 ? 0 : 1;
    float _1016 = _834 + _940;
    float _1018 = floor(_1000);
    float _1020 = -_868;
    float _1022 = fma(_986, 2.0, _1020);
    int _1024 = ~_944;
    int _1026 = _1024 + 1;
    int _1028 = _1026 + 1;
    float _1030 = _1016 + (-1.0);
    int _1032 = _1008;
    int _1034 = _1028;
    if (!_992)
    {
        int _1036 = ~_996;
        int _1038 = _1036 + 1;
        _1032 = _1038;
    }
    int _1040 = _1032;
    float _1042 = -_124;
    float _1044 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1022);
    if (!_960)
    {
        int _1046 = ~_944;
        int _1048 = _1046 + 1;
        _1034 = _1048;
    }
    int _1050 = _1034;
    float _1052 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1010);
    float _1054 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1056 = log2(_1054);
    int _1058 = abs(_1014);
    float _1060 = _844 + _940;
    float _1062 = float(_1050);
    float _1064 = float(_1058);
    float _1066 = _1060 + (-1.0);
    float _1068 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1070 = _1018 > 0.0;
    float _1072 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1074 = _964 * _964;
    bool _1076 = _1018 >= 0.0;
    bool _1078 = isnan(_1018);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan(0.0);
    bool _1084 = _1080 || _1082;
    float _1086 = _1064 * _1062;
    bool _1088 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1090 = isnan(0.0);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1096 = _1092 || _1094;
    float _1098 = fma(_972, _972, _1074);
    float _1100 = _1056 * _124;
    float _1102 = in.m_59.x;
    float _1104 = in.m_59.y;
    float _1106 = in.m_59.z;
    float _1108 = float(_1040);
    float _1110 = fma(_976, _976, _1098);
    bool _1112 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1114 = isnan(1.0);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1120 = _1116 || _1118;
    float _1122 = exp2(_1100);
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1126 = 1.0 + _1124;
    float _1128 = _980 * _1108;
    float _1130 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1002);
    int _1132 = _1084 ? 0 : 1;
    float _1134 = 1.0 / _1126;
    float _1136 = -_1122;
    float _1138 = _1136 + 1.0;
    float _1140 = rsqrt(_1110);
    float _1142 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _990);
    float _1144 = _844 + (-0.5);
    float _1146 = _1096 ? _1138 : 0.0;
    int _1148 = ~_1132;
    int _1150 = _1148 + 1;
    int _1152 = _1150 + 1;
    int _1154 = _1152;
    bool _1156 = _1084;
    if (!_1070)
    {
        int _1158 = ~_1132;
        int _1160 = _1158 + 1;
        _1154 = _1160;
    }
    int _1162 = _1154;
    if (_1120)
    {
        float _1164 = _1146 * _1134;
        _126 = _1164;
    }
    float _1166 = _126;
    float _1168 = _1086 * (-2.0);
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1172 = _1170 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1174 = !_892;
    int _1176 = _1174 ? 0 : 1;
    float _1178 = fma(_1168, _1102, _1102);
    float _1180 = fma(_1072, _1168, _1072);
    float _1182 = _964 * _1140;
    int _1184 = abs(_1176);
    float _1186 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1178);
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1190 = _1188 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1192 = -_1182;
    float _1194 = fma(_1192, (*spvDescriptorSet0.vp_c9)._m0[18].w, _964);
    float _1196 = _972 * _1140;
    float _1198 = fma(_1180, _1166, _1186);
    float _1200 = 1.0 / _1190;
    float _1202 = _1194 * _1194;
    float _1204 = -_1196;
    float _1206 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[18].w, _972);
    float _1208 = _976 * _1140;
    float _1210 = _1198 * 0.15915493667125701904296875;
    float _1212 = fma(_1206, _1206, _1202);
    float _1214 = -_1208;
    float _1216 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[18].w, _976);
    float _1218 = _1128 * (-2.0);
    float _1220 = _940 + (-0.5);
    float _1222 = fma(_1216, _1216, _1212);
    float _1224 = float(_1184);
    float _1226 = fma(_1218, _1104, _1104);
    float _1228 = float(_1162);
    float _1230 = fma(_1068, _1218, _1068);
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1234 = _1232 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1236 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1226);
    float _1238 = in.m_61.x;
    float _1240 = in.m_61.y;
    float _1242 = in.m_61.z;
    float _1244 = _1224 * _1228;
    float _1246 = fma(_1230, _1166, _1236);
    float _1248 = _844 + _834;
    float _1250 = _1244 * (-2.0);
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1254 = _1252 != 0;
    float _1256 = _834 + (-0.5);
    float _1258 = _1248 + (-1.0);
    int _1260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1262 = _1260 != 0;
    float _1264 = fma(_1250, _1106, _1106);
    int _1266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1268 = _1266 != 0;
    float _1270 = 1.0 / _1234;
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1274 = _1272 != 0;
    float _1276 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1278 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1264);
    float _1280 = _1246 * 0.15915493667125701904296875;
    float _1282 = fma(_1276, _1250, _1276);
    if (_1254)
    {
        bool _1284 = _844 > 0.5;
        _1156 = _1284;
    }
    bool _1286 = _1156;
    float _1288 = sqrt(_1222);
    float _1290 = fma(_1282, _1166, _1278);
    float _1292 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1242);
    float _1294 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1240);
    float _1296 = _1290 * 0.15915493667125701904296875;
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1298;
    float _1302 = 1.0 / _1172;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1304;
    float _1308 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1238);
    if (_1262)
    {
        bool _1310 = _834 > 0.5;
        _902 = _1310;
    }
    bool _1312 = _902;
    float _1314 = _1306 * _1270;
    float _1316 = _1210 * 6.283185482025146484375;
    float _1318 = sin(_1316);
    float _1320 = _1140 * _1288;
    float _1322 = _838 * _1320;
    float _1324 = _848 * _1320;
    float _1326 = _1210 * 6.283185482025146484375;
    float _1328 = cos(_1326);
    float _1330 = _1300 * _1302;
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1334 = _1332 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1338 = _832 + _1336;
    float _1340 = _1322 * _1294;
    float _1342 = _1324 * _1292;
    float _1344 = _1334 * _1200;
    float _1346 = _852 * _1320;
    float _1348 = _1280 * 6.283185482025146484375;
    float _1350 = sin(_1348);
    float _1352 = fma(_1330, _1338, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1356 = _832 + _1354;
    float _1358 = _1346 * _1308;
    float _1360 = fma(_1344, _1356, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1362 = _1280 * 6.283185482025146484375;
    float _1364 = cos(_1362);
    float _1366 = _1296 * 6.283185482025146484375;
    float _1368 = cos(_1366);
    float _1370 = _1328 * _1350;
    float _1372 = _1318 * _1350;
    float _1374 = _1296 * 6.283185482025146484375;
    float _1376 = sin(_1374);
    float _1378 = _1318 * _1364;
    float _1380 = _1328 * _1364;
    float _1382 = _1368 * _1340;
    float _1384 = _1364 * _1368;
    float _1386 = _1350 * _1368;
    bool _1388 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1390 = isnan(_832);
    bool _1392 = _1388 || _1390;
    bool _1394 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1396 = _1392 || _1394;
    float _1398 = float(_1396);
    float _1400 = _1328 * _1382;
    float _1402 = _1318 * _1382;
    bool _1404 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1406 = isnan(_832);
    bool _1408 = _1404 || _1406;
    bool _1410 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1412 = _1408 || _1410;
    float _1414 = float(_1412);
    float _1416 = -_1370;
    float _1418 = fma(_1376, _1378, _1416);
    float _1420 = -_1378;
    float _1422 = fma(_1376, _1370, _1420);
    float _1424 = fma(_1376, _1380, _1372);
    float _1426 = -_1340;
    float _1428 = _1376 * _1426;
    float _1430 = fma(_1418, _1358, _1402);
    float _1432 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1434 = fma(_1424, _1358, _1400);
    float _1436 = fma(_1376, _1372, _1380);
    float _1438 = fma(_1384, _1358, _1428);
    bool _1440 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1442 = isnan(_832);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1448 = _1444 || _1446;
    float _1450 = float(_1448);
    float _1452 = fma(_1422, _1342, _1434);
    float _1454 = fma(_1436, _1342, _1430);
    float _1456 = fma(_1386, _1342, _1438);
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1460 = _832 + _1458;
    float _1462 = _1452 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1464 = _1452 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1466 = in.m_57.y;
    float _1468 = fma(_1314, _1460, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1470 = fma(_1456, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1462);
    float _1472 = fma(_1456, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1464);
    bool _1474 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1476 = isnan(_832);
    bool _1478 = _1474 || _1476;
    bool _1480 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1482 = _1478 || _1480;
    float _1484 = float(_1482);
    float _1486 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1488 = fma(_1454, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1470);
    float _1490 = fma(_1454, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1472);
    float _1492 = _1432 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1494 = -_1484;
    float _1496 = _1494 + 1.0;
    float _1498 = _942 + _1488;
    float _1500 = _958 + _1490;
    float _1502 = _1452 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1504 = _1450 * _1496;
    float _1506 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1508 = _1498 + _1506;
    float _1510 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1512 = _1500 + _1510;
    float _1514 = -_1450;
    float _1516 = _1514 + 1.0;
    float _1518 = fma(_1456, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1502);
    float _1520 = _1508 * _1508;
    float _1522 = _1512 * _1512;
    float _1524 = _1414 * _1516;
    float _1526 = -_1414;
    float _1528 = _1526 + 1.0;
    float _1530 = _1414;
    float _1532 = _1492;
    float _1534 = _1502;
    float _1536 = _1520;
    float _1538 = _1522;
    float _1540 = _1498;
    float _1542 = _1500;
    float _1544 = _1484;
    if (!_1254)
    {
        _1530 = _856;
    }
    float _1546 = _1530;
    float _1548 = _1520 + _1522;
    float _1550 = -_1466;
    float _1552 = _1550 + 1.0;
    float _1554 = _1486 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1556 = fma(_1454, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1518);
    float _1558 = sqrt(_1548);
    int _1560 = _876 ? as_type<int>(_1552) : as_type<int>(_1466);
    bool _1562 = _940 > 0.5;
    float _1564 = _1466;
    float _1566 = _1546;
    if (_1254)
    {
        float _1568 = -_856;
        float _1570 = _1568 + 1.0;
        _982 = as_type<int>(_1570);
    }
    int _1572 = _982;
    int _1574 = _1268 ? _1560 : as_type<int>(_1466);
    float _1576 = _1398 * _1528;
    float _1578 = -_1398;
    float _1580 = _1578 + 1.0;
    int _1582 = _1574;
    if (_1274)
    {
        float _1584 = _1562 ? _1552 : _1466;
        _1564 = _1584;
    }
    float _1586 = _1564;
    float _1588 = fma(_1492, as_type<float>(_1574), -0.5);
    if (_1262)
    {
        float _1590 = -_856;
        float _1592 = _1590 + 1.0;
        _1582 = as_type<int>(_1592);
    }
    int _1594 = _1582;
    float _1596 = _1352 * _1576;
    if (_1254)
    {
        float _1598 = _1286 ? as_type<float>(_1572) : _856;
        _1566 = _1598;
    }
    float _1600 = _1566;
    float _1602 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1604 = _1558 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1606 = fma(_1580, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1596);
    if (!_1262)
    {
        _1532 = _856;
    }
    float _1608 = _1532;
    float _1610 = _1608;
    if (_1262)
    {
        float _1612 = _1312 ? as_type<float>(_1594) : _856;
        _1610 = _1612;
    }
    float _1614 = _1610;
    float _1616 = fma(_1360, _1524, _1606);
    float _1618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1620 = fma(_1554, _1614, -0.5);
    float _1622 = _946 + _1556;
    if (!_1604)
    {
        _1534 = _1622;
    }
    float _1624 = _1534;
    bool _1626 = !_1604;
    float _1628 = _1624;
    if (!_1626)
    {
        float _1630 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1634 = _1558 + _1632;
        float _1636 = rsqrt(_1548);
        float _1638 = _1634 * _1630;
        float _1640 = _1622 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1642 = _1638 * 0.15915493667125701904296875;
        float _1644 = _1642 * 6.283185482025146484375;
        float _1646 = sin(_1644);
        float _1648 = _1642 * 6.283185482025146484375;
        float _1650 = cos(_1648);
        float _1652 = fma(_1646, _1640, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1654 = _1636 * _1652;
        float _1656 = fma(_1508, _1654, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1658 = _1650 + (-1.0);
        float _1660 = fma(_1512, _1654, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1662 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1664 = _1656 + _1662;
        float _1666 = _1658 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1668 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1670 = _1660 + _1668;
        float _1672 = _1664 * _1664;
        float _1674 = fma(_1622, _1650, _1666);
        float _1676 = _1670 * _1670;
        _1628 = _1674;
        _1536 = _1672;
        _1538 = _1676;
        _1540 = _1656;
        _1542 = _1660;
    }
    float _1678 = _1628;
    float _1680 = _1536;
    float _1682 = _1538;
    float _1684 = _1540;
    float _1686 = _1542;
    float _1688 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1690 = _1678 + _1688;
    float _1692 = fma(_1142, _1620, _1044);
    float _1694 = _1600 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1696 = fma(_1468, _1504, _1616);
    float _1698 = fma(_1690, _1690, _1680);
    float _1700 = -_1052;
    float _1702 = fma(_1130, _1588, _1700);
    float _1704 = _1586 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1706 = _1694 * _1602;
    float _1708 = _1698 + _1682;
    float _1710 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1696);
    float _1712 = _794 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1714 = _796 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1716 = _798 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1718 = _1704 * _1618;
    float _1720 = sqrt(_1708);
    float _1722 = _1712 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1724 = _1714 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1726 = _1716 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1728 = _1692 + 0.5;
    float _1730 = _1710 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1732 = _1702 + 0.5;
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    out.m_65.x = _1722;
    out.m_65.y = _1724;
    out.m_65.z = _1726;
    out.m_65.w = _1730;
    bool _1734 = _1720 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1736 = isnan(_1720);
    bool _1738 = _1734 || _1736;
    bool _1740 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1742 = _1738 || _1740;
    out.m_67.x = _1706;
    out.m_67.y = _1718;
    out.m_67.z = _1728;
    out.m_67.w = _1732;
    float _1744 = _1726;
    float _1746 = _1730;
    if (!_1742)
    {
        _1544 = 1.0;
    }
    float _1748 = _1544;
    bool _1750 = !_1742;
    float _1752 = _1748;
    if (!_1750)
    {
        bool _1754 = _1720 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1756 = isnan(_1720);
        bool _1758 = _1754 || _1756;
        bool _1760 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1762 = _1758 || _1760;
        if (!_1762)
        {
            float _1764 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1766 = _1720 + _1764;
            float _1768 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1770 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1768;
            float _1772 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1774 = _1772 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1776 = 1.0 / _1770;
            float _1778 = _1766 * _1776;
            float _1780 = fma(_1778, _1774, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1752 = _1780;
            _1782 = true;
        }
        else
        {
            bool _1784 = _1720 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1786 = isnan(_1720);
            bool _1788 = _1784 || _1786;
            bool _1790 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1792 = _1788 || _1790;
            if (!_1792)
            {
                float _1794 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1796 = _1720 + _1794;
                float _1798 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1800 = _1798 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1802 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1804 = _1802 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1806 = 1.0 / _1800;
                float _1808 = _1796 * _1806;
                float _1810 = fma(_1808, _1804, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1752 = _1810;
                _1782 = true;
            }
            else
            {
                _1752 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1782 = false;
    float _1812 = _1752;
    float _1814 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1816 = _1678 + _1814;
    float _1818 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1820 = _1684 + _1818;
    float _1822 = fma(_1816, _1812, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1824 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1826 = _1686 + _1824;
    float _1828 = fma(_1820, _1812, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1830 = -_1182;
    float _1832 = fma(_1830, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1822);
    float _1834 = fma(_1826, _1812, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1836 = -_1196;
    float _1838 = fma(_1836, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1828);
    float _1840 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1842 = _1832 + _1840;
    float _1844 = -_1208;
    float _1846 = fma(_1844, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1834);
    float _1848 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1850 = _1838 + _1848;
    float _1852 = _1842 * _1842;
    float _1854 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1856 = _1846 + _1854;
    float _1858 = fma(_1850, _1850, _1852);
    float _1860 = fma(_1856, _1856, _1858);
    float _1862 = rsqrt(_1860);
    float _1864 = _1862 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1866 = _1850 * _1864;
    float _1868 = _1856 * _1864;
    float _1870 = _1866 * _1866;
    float _1872 = _1868 * _1868;
    float _1874 = _1870 + _1872;
    float _1876 = sqrt(_1874);
    bool _1878 = _1876 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1880 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1882 = _1876 + _1880;
    float _1884 = _1856;
    float _1886 = _1874;
    float _1888 = _1882;
    float _1890 = _1866;
    if (_1878)
    {
        float _1892 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1884 = _1892;
    }
    float _1894 = _1884;
    if (_1878)
    {
        float _1896 = rsqrt(_1874);
        _1886 = _1896;
    }
    float _1898 = _1886;
    float _1900 = _1898;
    if (_1878)
    {
        float _1902 = _1882 * _1894;
        _1888 = _1902;
    }
    float _1904 = _1888;
    if (_1878)
    {
        float _1906 = _1904 * 0.15915493667125701904296875;
        _1744 = _1906;
    }
    float _1908 = _1744;
    float _1910 = _1834;
    if (_1878)
    {
        float _1912 = _1908 * 6.283185482025146484375;
        float _1914 = sin(_1912);
        _1910 = _1914;
    }
    float _1916 = _1910;
    float _1918 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1920 = precise::max(0.0, _1918);
    float _1922 = _1862;
    float _1924 = _1920;
    float _1926 = _1918;
    if (_1878)
    {
        float _1928 = _1908 * 6.283185482025146484375;
        float _1930 = cos(_1928);
        _1922 = _1930;
    }
    float _1932 = _1922;
    float _1934 = -_1864;
    float _1936 = -_1920;
    float _1938 = fma(_1842, _1934, _1936);
    float _1940 = _1938;
    if (_1878)
    {
        float _1942 = _1938 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1924 = _1942;
    }
    float _1944 = _1924;
    float _1946 = sqrt(_1860);
    float _1948 = _1916;
    float _1950 = _1944;
    if (_1878)
    {
        float _1952 = fma(_1916, _1944, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1948 = _1952;
    }
    float _1954 = _1948;
    float _1956 = _1954;
    if (!_1878)
    {
        _1950 = _1868;
    }
    float _1958 = _1950;
    float _1960 = _1958;
    if (_1878)
    {
        float _1962 = _1932 + (-1.0);
        _1926 = _1962;
    }
    float _1964 = _1926;
    float _1966 = _1964;
    if (_1878)
    {
        float _1968 = _1898 * _1954;
        _1956 = _1968;
    }
    float _1970 = _1956;
    if (!_1878)
    {
        _1900 = _1870;
    }
    float _1972 = _1900;
    float _1974 = _1972;
    if (_1878)
    {
        float _1976 = _1964 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1746 = _1976;
    }
    float _1978 = _1746;
    if (_1878)
    {
        float _1980 = _1866 * _1970;
        _1890 = _1980;
    }
    float _1982 = _1890;
    if (_1878)
    {
        float _1984 = _1868 * _1970;
        _1960 = _1984;
    }
    float _1986 = _1960;
    if (!_1878)
    {
        _1966 = _1872;
    }
    float _1988 = _1966;
    float _1990 = _1988;
    if (_1878)
    {
        float _1992 = fma(_1938, _1932, _1978);
        _1940 = _1992;
    }
    float _1994 = _1940;
    if (_1878)
    {
        float _1996 = _1982 * _1982;
        _1974 = _1996;
    }
    float _1998 = _1974;
    if (_1878)
    {
        float _2000 = _1986 * _1986;
        _1990 = _2000;
    }
    float _2002 = _1990;
    float _2004 = fma(_1994, _1994, _1998);
    float _2006 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2008 = fma(_1946, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2006);
    float _2010 = precise::clamp(_2008, 0.0, 1.0);
    float _2012 = _2004 + _2002;
    float _2014 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2016 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2018 = -_2010;
    float _2020 = _2018 + 1.0;
    float _2022 = rsqrt(_2012);
    float _2024 = fma(_1838, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2014);
    float _2026 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2028 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2030 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2032 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2024);
    float _2034 = fma(_1838, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2026);
    float _2036 = fma(_1838, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2028);
    float _2038 = fma(_1838, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2030);
    float _2040 = _2032 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2042 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2034);
    float _2044 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2036);
    float _2046 = abs(_2020);
    float _2048 = log2(_2046);
    float _2050 = _2040 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2052 = _2042 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2054 = _2044 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2056 = _2022 * _1982;
    float _2058 = -_2050;
    float _2060 = fma(_2058, _2016, 1.0);
    float _2062 = _2052 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2064 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2038);
    float _2066 = _2056 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2068 = _2022 * _1986;
    float _2070 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2062);
    float _2072 = _2022 * _1994;
    float _2074 = _2064 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2076 = log2(_2060);
    float _2078 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2070);
    float _2080 = -_2066;
    float _2082 = fma(_2072, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2080);
    float _2084 = _2048 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2086 = _2052 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2088 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2078);
    float _2090 = -_2068;
    float _2092 = fma(_2090, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2082);
    float _2094 = _2052 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2096 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2086);
    float _2098 = exp2(_2084);
    float _2100 = fma(_2092, -0.5, 0.5);
    float _2102 = fma(_2092, 0.5, 0.5);
    float _2104 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2094);
    float _2106 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2096);
    float _2108 = _2072 + 1.0;
    float _2110 = fma(_2102, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2112 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2104);
    float _2114 = 1.0 / _2088;
    float _2116 = _2076 * 0.693147182464599609375;
    float _2118 = fma(_2102, _2110, -0.212114393711090087890625);
    float _2120 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2112);
    float _2122 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2106);
    float _2124 = fma(_2102, _2118, 1.570728778839111328125);
    float _2126 = sqrt(_2100);
    float _2128 = -_2072;
    float _2130 = fma(_2098, _2108, _2128);
    float _2132 = fma(_2130, 0.5, 0.5);
    float _2134 = _2120 * _2114;
    float _2136 = _2122 * _2114;
    float _2138 = _2116 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2140 = fma(_2134, 0.5, 0.5);
    float _2142 = fma(_2136, -0.5, 0.5);
    float _2144 = _2126 * 0.636619746685028076171875;
    float _2146 = -_2124;
    float _2148 = fma(_2144, _2146, 1.0);
    float3 _5684 = float3(_2140, _2142, _2138);
    float _2150 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5684, float3(0.0), isnan(_5684)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5684, float3(0.0), isnan(_5684)), level(0.0)).x;
    float3 _5695 = float3(_2140, _2142, _2138);
    float4 _2153 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5695, float3(0.0), isnan(_5695)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5695, float3(0.0), isnan(_5695)), level(0.0)).xyzw;
    float _2155 = _2153.x;
    float _2157 = _2153.y;
    float _2159 = _2153.z;
    float _2161 = _2153.w;
    float2 _5712 = float2(_2148, _2132);
    float3 _2165 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5712, float2(0.0), isnan(_5712)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5712, float2(0.0), isnan(_5712)), level(0.0)).xyz;
    float _2167 = _2165.x;
    float _2169 = _2165.y;
    float _2171 = _2165.z;
    float _2173 = -_1182;
    float _2175 = fma(_2173, (*spvDescriptorSet0.vp_c9)._m0[18].w, _946);
    float _2177 = -_1196;
    float _2179 = fma(_2177, (*spvDescriptorSet0.vp_c9)._m0[18].w, _942);
    float _2181 = -_1208;
    float _2183 = fma(_2181, (*spvDescriptorSet0.vp_c9)._m0[18].w, _958);
    float _2185 = _2052 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2187 = _2175 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2189 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2185);
    float _2191 = fma(_2179, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2187);
    float _2193 = _2175 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2195 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2189);
    float _2197 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2191);
    float _2199 = fma(_2179, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2193);
    bool _2201 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2203 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2205 = _2201 || _2203;
    bool _2207 = isnan(0.5);
    bool _2209 = _2205 || _2207;
    float _2211 = _2048 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2213 = _2197 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2215 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2199);
    float _2217 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2195);
    float _2219 = exp2(_2211);
    float _2221 = _2215 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2223 = _2221 + _2213;
    float _2225 = 1.0 / _2213;
    float _2227 = _2185;
    if (_2209)
    {
        _2227 = 1.0;
    }
    float _2229 = _2227;
    float _2231 = _2223 * _2225;
    float _2233 = _2231 * 0.5;
    float _2235 = _2229;
    if (!_2209)
    {
        float _2237 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2239 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2241 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2239);
        float _2243 = _2237 * 0.15915493667125701904296875;
        float _2245 = _2243 * 6.283185482025146484375;
        float _2247 = cos(_2245);
        float _2249 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2251 = _2249 * 0.15915493667125701904296875;
        float _2253 = _2243 * 6.283185482025146484375;
        float _2255 = sin(_2253);
        float _2257 = 1.0 / _2247;
        float _2259 = _2251 * 6.283185482025146484375;
        float _2261 = cos(_2259);
        float _2263 = _2255 * _2257;
        float _2265 = 1.0 / _2241;
        float _2267 = _2261 * _2263;
        float _2269 = _2251 * 6.283185482025146484375;
        float _2271 = sin(_2269);
        float _2273 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2275 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2273;
        float _2277 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2279 = _2265 * _2277;
        float _2281 = 1.0 / _2267;
        float _2283 = 1.0 / _2275;
        float _2285 = _2271 * _2281;
        float _2287 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2289 = fma(_2285, _2279, _2287);
        float _2291 = _2289 * _2283;
        float _2293 = precise::clamp(_2291, 0.0, 1.0);
        _2235 = _2293;
    }
    float _2295 = _2235;
    float _2297 = -_2219;
    float _2299 = _2297 + 1.0;
    float _2301 = _2217 + _2088;
    bool _2303 = _2295 > 0.0;
    bool _2305 = isnan(_2295);
    bool _2307 = _2303 || _2305;
    bool _2309 = isnan(0.0);
    bool _2311 = _2307 || _2309;
    float _2313 = _2295 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2315 = _2299 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2317 = _2301 * 0.5;
    float _2319 = _2315 * _2150;
    float _2321 = -_2315;
    float _2323 = _2321 + 1.0;
    out.gl_Position.x = _2120;
    out.gl_Position.y = _2122;
    out.gl_Position.z = _2217;
    out.gl_Position.w = _2088;
    float _2325 = _2313 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2327 = _2161 * _2319;
    float _2329 = _2171 * _2319;
    out.m_69.z = _2317;
    out.m_69.w = _2088;
    float _2331 = fma(_2167, _2327, _2155);
    float _2333 = fma(_2169, _2327, _2157);
    float _2335 = _2161 * _2323;
    float _2337 = fma(_2161, _2329, _2159);
    out.m_47.x = _2325;
    out.m_71.x = _2331;
    out.m_71.y = _2333;
    out.m_71.z = _2337;
    out.m_71.w = _2335;
    if (_2311)
    {
        return out;
    }
    out.m_47.x = 0.0;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1782 = false;
    bool _822 = false;
    bool _598 = false;
    bool _404 = false;
    bool _290 = false;
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
        float _2396 = as_type<float>(_106);
        out.gl_Position.z = _2396;
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
        float _2466 = as_type<float>(_144);
        out.gl_Position.z = _2466;
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
    float _270 = _262;
    float _288;
    if (!_268)
    {
        float _272 = in.m_53.x;
        float _274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _276 = _272 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _280 = _278 * _274;
        float _282 = floor(_280);
        float _284 = -_282;
        float _286 = _280 + _284;
        _288 = _286;
        _290 = true;
    }
    else
    {
        float _292 = float(_90);
        float _294 = 1.0 / _292;
        float _296 = _124 * _294;
        _288 = _296;
    }
    _290 = false;
    float _298 = _288;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _302 = _298 + _300;
    bool _304 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _306 = isnan(_298);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _316;
    bool _320 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _322 = isnan(_298);
    bool _324 = _320 || _322;
    bool _326 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _328 = _324 || _326;
    float _330 = float(_328);
    float _332 = -_314;
    float _334 = _332 + 1.0;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _336;
    float _340 = 1.0 / _318;
    bool _342 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _344 = _330 * _334;
    float _346 = -_330;
    float _348 = _346 + 1.0;
    float _350 = _302 * _340;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _352;
    float _356 = fma(_338, _350, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _360 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _358;
    float _362 = fma(_354, _350, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _364 = _356 * _344;
    float _366 = fma(_360, _350, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _368 = _362 * _344;
    float _370 = _366 * _344;
    float _372 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[143].x, _364);
    float _374 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[143].y, _370);
    float _376 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[143].z, _368);
    float _378 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[144].x, _372);
    float _380 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[144].y, _374);
    float _382 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[144].z, _376);
    bool _384 = !_342;
    float _402;
    if (!_384)
    {
        float _386 = in.m_53.x;
        float _388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _390 = _386 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _392 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _394 = _392 * _388;
        float _396 = floor(_394);
        float _398 = -_396;
        float _400 = _394 + _398;
        _402 = _400;
        _404 = true;
    }
    else
    {
        float _406 = float(_90);
        float _408 = 1.0 / _406;
        float _410 = _124 * _408;
        _402 = _410;
    }
    _404 = false;
    float _412 = _402;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _416 = _412 + _414;
    bool _418 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _420 = isnan(_412);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _432 = _412 + _430;
    bool _434 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _436 = isnan(_412);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _454 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _456 = isnan(_412);
    bool _458 = _454 || _456;
    bool _460 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    float _466 = in.m_51.x;
    float _468 = in.m_51.y;
    float _470 = in.m_51.z;
    float _472 = 1.0 / _448;
    float _474 = -_464;
    float _476 = _474 + 1.0;
    bool _478 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _480 = _444 * _476;
    float _482 = -_444;
    float _484 = _482 + 1.0;
    float _486 = 1.0 / _452;
    float _488 = _416 * _472;
    float _490 = -_428;
    float _492 = _490 + 1.0;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _494;
    float _498 = _464 * _492;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _500;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _504;
    float _508 = fma(_496, _488, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _510 = _432 * _486;
    float _512 = fma(_502, _488, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _514 = fma(_506, _488, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _516 = _508 * _480;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _522 = _512 * _480;
    float _524 = _514 * _480;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _534 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[107].x, _522);
    float _536 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[107].y, _516);
    float _538 = fma(_528, _510, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _540 = fma(_520, _510, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _542 = fma(_532, _510, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _544 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[107].z, _524);
    float _546 = fma(_538, _498, _534);
    float _548 = fma(_540, _498, _536);
    float _550 = fma(_542, _498, _544);
    float _552 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[109].x, _546);
    float _554 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[109].y, _548);
    float _556 = _382 * _470;
    float _558 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[109].z, _550);
    float _560 = _552 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _562 = _554 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _566 = _558 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _568 = _560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _570 = _562 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _572 = _380 * _468;
    float _574 = _566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _576 = _378 * _466;
    out.m_55.x = _568;
    out.m_55.y = _570;
    out.m_55.z = _574;
    out.m_55.w = _564;
    bool _578 = !_478;
    float _596;
    if (!_578)
    {
        float _580 = in.m_53.x;
        float _582 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _584 = _580 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _586 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _588 = _586 * _582;
        float _590 = floor(_588);
        float _592 = -_590;
        float _594 = _588 + _592;
        _596 = _594;
        _598 = true;
    }
    else
    {
        float _600 = float(_90);
        float _602 = 1.0 / _600;
        float _604 = _124 * _602;
        _596 = _604;
    }
    _598 = false;
    float _606 = _596;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _610 = _606 + _608;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _614 = _606 + _612;
    bool _616 = _606 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _618 = isnan(_606);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _628;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _634 = _606 + _632;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _636;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _644 = 1.0 / _630;
    bool _646 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _648 = 1.0 / _642;
    float _650 = 1.0 / _638;
    float _652 = _610 * _644;
    bool _654 = _606 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _656 = isnan(_606);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = -_626;
    float _668 = _666 + 1.0;
    float _670 = _664 * _668;
    float _672 = _614 * _648;
    bool _674 = _606 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _676 = isnan(_606);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _686;
    bool _690 = _606 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _692 = isnan(_606);
    bool _694 = _690 || _692;
    bool _696 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _698 = _694 || _696;
    float _700 = float(_698);
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _704 = _702 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _706 = -_664;
    float _708 = _706 + 1.0;
    float _710 = -_684;
    float _712 = _710 + 1.0;
    float _714 = _634 * _650;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _716;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _720;
    float _724 = _700 * _712;
    float _726 = fma(_688, _714, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _728 = fma(_718, _714, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _730 = fma(_722, _714, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _732 = _684 * _708;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _738 = _728 * _724;
    float _740 = _730 * _724;
    float _742 = _726 * _724;
    float _744 = -_700;
    float _746 = _744 + 1.0;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _752 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[123].x, _740);
    float _754 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[123].y, _738);
    float _756 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[123].z, _742);
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _758;
    float _762 = fma(_704, _672, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _764 = fma(_750, _672, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _766 = fma(_736, _672, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _768;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _772;
    float _776 = fma(_762, _732, _752);
    float _778 = fma(_760, _652, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _780 = fma(_770, _652, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _782 = fma(_774, _652, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _784 = fma(_764, _732, _754);
    float _786 = fma(_766, _732, _756);
    float _788 = fma(_778, _670, _776);
    float _790 = fma(_780, _670, _784);
    float _792 = fma(_782, _670, _786);
    float _794 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[126].x, _788);
    float _796 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[126].y, _790);
    float _798 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[126].z, _792);
    bool _800 = !_646;
    float _818;
    float _820;
    if (!_800)
    {
        float _802 = in.m_53.x;
        float _804 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _806 = _802 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _808 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _810 = _808 * _804;
        float _812 = floor(_810);
        float _814 = -_812;
        float _816 = _810 + _814;
        _818 = _812;
        _820 = _816;
        _822 = true;
    }
    else
    {
        float _824 = float(_90);
        float _826 = 1.0 / _824;
        float _828 = _124 * _826;
        _818 = _824;
        _820 = _828;
    }
    _822 = false;
    float _830 = _818;
    float _832 = _820;
    float _834 = in.m_53.z;
    float _836 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _838 = _572 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _842 = _840 != 0;
    float _844 = in.m_53.x;
    float _846 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _836);
    float _848 = _556 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _850 = in.m_53.w;
    float _852 = _576 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _856 = in.m_57.x;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _860 = _830;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_842)
    {
        float _864 = in.m_53.y;
        _860 = _864;
    }
    float _866 = _860;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _870 = _834 * 2.0;
    float _872 = _844 * 2.0;
    float _874 = floor(_870);
    bool _876 = _850 > 0.5;
    float _878 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _880 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _884 = _882 != 0;
    int _886 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _888 = _886 != 0;
    int _890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _892 = _890 != 0;
    float _894 = floor(_872);
    float _896 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _880);
    float _898 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _878);
    float _900 = _896;
    bool _902 = _888;
    if (!_842)
    {
        _270 = _834;
    }
    float _904 = _270;
    float _906 = _904;
    if (!_842)
    {
        _862 = _866;
    }
    float _908 = _862;
    float _910 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _896);
    if (!_842)
    {
        _900 = _834;
    }
    float _912 = _900;
    float _914 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _898);
    bool _916 = _874 >= 0.0;
    bool _918 = isnan(_874);
    bool _920 = _916 || _918;
    bool _922 = isnan(0.0);
    bool _924 = _920 || _922;
    float _926 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _846);
    float _928 = _908;
    float _930 = _866;
    float _932 = _912;
    if (_842)
    {
        float _934 = in.m_53.x;
        float _936 = in.m_53.y;
        _928 = _934;
        _930 = _936;
    }
    float _938 = _928;
    float _940 = _930;
    float _942 = _914 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _944 = _924 ? 0 : 1;
    float _946 = _926 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _948 = _894 >= 0.0;
    bool _950 = isnan(_894);
    bool _952 = _948 || _950;
    bool _954 = isnan(0.0);
    bool _956 = _952 || _954;
    float _958 = _910 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _960 = _874 > 0.0;
    float _962 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _964 = _946 + _962;
    bool _966 = !_888;
    int _968 = _966 ? 0 : 1;
    float _970 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _972 = _942 + _970;
    float _974 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _976 = _958 + _974;
    int _978 = abs(_968);
    float _980 = float(_978);
    int _982 = as_type<int>(_940);
    if (_842)
    {
        _932 = _940;
    }
    float _984 = _932;
    float _986 = _938 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_842)
    {
        _906 = _940;
    }
    float _988 = _906;
    float _990 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[83].z, _854);
    bool _992 = _894 > 0.0;
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _996 = _956 ? 0 : 1;
    float _998 = _984 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1000 = _940 * 2.0;
    float _1002 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[83].w, _994);
    int _1004 = ~_996;
    int _1006 = _1004 + 1;
    int _1008 = _1006 + 1;
    float _1010 = fma(_998, -2.0, _858);
    bool _1012 = !_884;
    int _1014 = _1012 ? 0 : 1;
    float _1016 = _834 + _940;
    float _1018 = floor(_1000);
    float _1020 = -_868;
    float _1022 = fma(_986, 2.0, _1020);
    int _1024 = ~_944;
    int _1026 = _1024 + 1;
    int _1028 = _1026 + 1;
    float _1030 = _1016 + (-1.0);
    int _1032 = _1008;
    int _1034 = _1028;
    if (!_992)
    {
        int _1036 = ~_996;
        int _1038 = _1036 + 1;
        _1032 = _1038;
    }
    int _1040 = _1032;
    float _1042 = -_124;
    float _1044 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1022);
    if (!_960)
    {
        int _1046 = ~_944;
        int _1048 = _1046 + 1;
        _1034 = _1048;
    }
    int _1050 = _1034;
    float _1052 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1010);
    float _1054 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1056 = log2(_1054);
    int _1058 = abs(_1014);
    float _1060 = _844 + _940;
    float _1062 = float(_1050);
    float _1064 = float(_1058);
    float _1066 = _1060 + (-1.0);
    float _1068 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1070 = _1018 > 0.0;
    float _1072 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1074 = _964 * _964;
    bool _1076 = _1018 >= 0.0;
    bool _1078 = isnan(_1018);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan(0.0);
    bool _1084 = _1080 || _1082;
    float _1086 = _1064 * _1062;
    bool _1088 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1090 = isnan(0.0);
    bool _1092 = _1088 || _1090;
    bool _1094 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1096 = _1092 || _1094;
    float _1098 = fma(_972, _972, _1074);
    float _1100 = _1056 * _124;
    float _1102 = in.m_59.x;
    float _1104 = in.m_59.y;
    float _1106 = in.m_59.z;
    float _1108 = float(_1040);
    float _1110 = fma(_976, _976, _1098);
    bool _1112 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1114 = isnan(1.0);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1120 = _1116 || _1118;
    float _1122 = exp2(_1100);
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1126 = 1.0 + _1124;
    float _1128 = _980 * _1108;
    float _1130 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1002);
    int _1132 = _1084 ? 0 : 1;
    float _1134 = 1.0 / _1126;
    float _1136 = -_1122;
    float _1138 = _1136 + 1.0;
    float _1140 = rsqrt(_1110);
    float _1142 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _990);
    float _1144 = _844 + (-0.5);
    float _1146 = _1096 ? _1138 : 0.0;
    int _1148 = ~_1132;
    int _1150 = _1148 + 1;
    int _1152 = _1150 + 1;
    int _1154 = _1152;
    bool _1156 = _1084;
    if (!_1070)
    {
        int _1158 = ~_1132;
        int _1160 = _1158 + 1;
        _1154 = _1160;
    }
    int _1162 = _1154;
    if (_1120)
    {
        float _1164 = _1146 * _1134;
        _126 = _1164;
    }
    float _1166 = _126;
    float _1168 = _1086 * (-2.0);
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1172 = _1170 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1174 = !_892;
    int _1176 = _1174 ? 0 : 1;
    float _1178 = fma(_1168, _1102, _1102);
    float _1180 = fma(_1072, _1168, _1072);
    float _1182 = _964 * _1140;
    int _1184 = abs(_1176);
    float _1186 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1178);
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1190 = _1188 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1192 = -_1182;
    float _1194 = fma(_1192, (*spvDescriptorSet0.vp_c9)._m0[18].w, _964);
    float _1196 = _972 * _1140;
    float _1198 = fma(_1180, _1166, _1186);
    float _1200 = 1.0 / _1190;
    float _1202 = _1194 * _1194;
    float _1204 = -_1196;
    float _1206 = fma(_1204, (*spvDescriptorSet0.vp_c9)._m0[18].w, _972);
    float _1208 = _976 * _1140;
    float _1210 = _1198 * 0.15915493667125701904296875;
    float _1212 = fma(_1206, _1206, _1202);
    float _1214 = -_1208;
    float _1216 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[18].w, _976);
    float _1218 = _1128 * (-2.0);
    float _1220 = _940 + (-0.5);
    float _1222 = fma(_1216, _1216, _1212);
    float _1224 = float(_1184);
    float _1226 = fma(_1218, _1104, _1104);
    float _1228 = float(_1162);
    float _1230 = fma(_1068, _1218, _1068);
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1234 = _1232 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1236 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1226);
    float _1238 = in.m_61.x;
    float _1240 = in.m_61.y;
    float _1242 = in.m_61.z;
    float _1244 = _1224 * _1228;
    float _1246 = fma(_1230, _1166, _1236);
    float _1248 = _844 + _834;
    float _1250 = _1244 * (-2.0);
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1254 = _1252 != 0;
    float _1256 = _834 + (-0.5);
    float _1258 = _1248 + (-1.0);
    int _1260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1262 = _1260 != 0;
    float _1264 = fma(_1250, _1106, _1106);
    int _1266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1268 = _1266 != 0;
    float _1270 = 1.0 / _1234;
    int _1272 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1274 = _1272 != 0;
    float _1276 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1278 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1264);
    float _1280 = _1246 * 0.15915493667125701904296875;
    float _1282 = fma(_1276, _1250, _1276);
    if (_1254)
    {
        bool _1284 = _844 > 0.5;
        _1156 = _1284;
    }
    bool _1286 = _1156;
    float _1288 = sqrt(_1222);
    float _1290 = fma(_1282, _1166, _1278);
    float _1292 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1242);
    float _1294 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1240);
    float _1296 = _1290 * 0.15915493667125701904296875;
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1298;
    float _1302 = 1.0 / _1172;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1304;
    float _1308 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1238);
    if (_1262)
    {
        bool _1310 = _834 > 0.5;
        _902 = _1310;
    }
    bool _1312 = _902;
    float _1314 = _1306 * _1270;
    float _1316 = _1210 * 6.283185482025146484375;
    float _1318 = sin(_1316);
    float _1320 = _1140 * _1288;
    float _1322 = _838 * _1320;
    float _1324 = _848 * _1320;
    float _1326 = _1210 * 6.283185482025146484375;
    float _1328 = cos(_1326);
    float _1330 = _1300 * _1302;
    float _1332 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1334 = _1332 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1338 = _832 + _1336;
    float _1340 = _1322 * _1294;
    float _1342 = _1324 * _1292;
    float _1344 = _1334 * _1200;
    float _1346 = _852 * _1320;
    float _1348 = _1280 * 6.283185482025146484375;
    float _1350 = sin(_1348);
    float _1352 = fma(_1330, _1338, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1356 = _832 + _1354;
    float _1358 = _1346 * _1308;
    float _1360 = fma(_1344, _1356, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1362 = _1280 * 6.283185482025146484375;
    float _1364 = cos(_1362);
    float _1366 = _1296 * 6.283185482025146484375;
    float _1368 = cos(_1366);
    float _1370 = _1328 * _1350;
    float _1372 = _1318 * _1350;
    float _1374 = _1296 * 6.283185482025146484375;
    float _1376 = sin(_1374);
    float _1378 = _1318 * _1364;
    float _1380 = _1328 * _1364;
    float _1382 = _1368 * _1340;
    float _1384 = _1364 * _1368;
    float _1386 = _1350 * _1368;
    bool _1388 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1390 = isnan(_832);
    bool _1392 = _1388 || _1390;
    bool _1394 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1396 = _1392 || _1394;
    float _1398 = float(_1396);
    float _1400 = _1328 * _1382;
    float _1402 = _1318 * _1382;
    bool _1404 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1406 = isnan(_832);
    bool _1408 = _1404 || _1406;
    bool _1410 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1412 = _1408 || _1410;
    float _1414 = float(_1412);
    float _1416 = -_1370;
    float _1418 = fma(_1376, _1378, _1416);
    float _1420 = -_1378;
    float _1422 = fma(_1376, _1370, _1420);
    float _1424 = fma(_1376, _1380, _1372);
    float _1426 = -_1340;
    float _1428 = _1376 * _1426;
    float _1430 = fma(_1418, _1358, _1402);
    float _1432 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1434 = fma(_1424, _1358, _1400);
    float _1436 = fma(_1376, _1372, _1380);
    float _1438 = fma(_1384, _1358, _1428);
    bool _1440 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1442 = isnan(_832);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1448 = _1444 || _1446;
    float _1450 = float(_1448);
    float _1452 = fma(_1422, _1342, _1434);
    float _1454 = fma(_1436, _1342, _1430);
    float _1456 = fma(_1386, _1342, _1438);
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1460 = _832 + _1458;
    float _1462 = _1452 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1464 = _1452 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1466 = in.m_57.y;
    float _1468 = fma(_1314, _1460, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1470 = fma(_1456, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1462);
    float _1472 = fma(_1456, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1464);
    bool _1474 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1476 = isnan(_832);
    bool _1478 = _1474 || _1476;
    bool _1480 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1482 = _1478 || _1480;
    float _1484 = float(_1482);
    float _1486 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1488 = fma(_1454, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1470);
    float _1490 = fma(_1454, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1472);
    float _1492 = _1432 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1494 = -_1484;
    float _1496 = _1494 + 1.0;
    float _1498 = _942 + _1488;
    float _1500 = _958 + _1490;
    float _1502 = _1452 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1504 = _1450 * _1496;
    float _1506 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1508 = _1498 + _1506;
    float _1510 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1512 = _1500 + _1510;
    float _1514 = -_1450;
    float _1516 = _1514 + 1.0;
    float _1518 = fma(_1456, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1502);
    float _1520 = _1508 * _1508;
    float _1522 = _1512 * _1512;
    float _1524 = _1414 * _1516;
    float _1526 = -_1414;
    float _1528 = _1526 + 1.0;
    float _1530 = _1414;
    float _1532 = _1492;
    float _1534 = _1502;
    float _1536 = _1520;
    float _1538 = _1522;
    float _1540 = _1498;
    float _1542 = _1500;
    float _1544 = _1484;
    if (!_1254)
    {
        _1530 = _856;
    }
    float _1546 = _1530;
    float _1548 = _1520 + _1522;
    float _1550 = -_1466;
    float _1552 = _1550 + 1.0;
    float _1554 = _1486 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1556 = fma(_1454, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1518);
    float _1558 = sqrt(_1548);
    int _1560 = _876 ? as_type<int>(_1552) : as_type<int>(_1466);
    bool _1562 = _940 > 0.5;
    float _1564 = _1466;
    float _1566 = _1546;
    if (_1254)
    {
        float _1568 = -_856;
        float _1570 = _1568 + 1.0;
        _982 = as_type<int>(_1570);
    }
    int _1572 = _982;
    int _1574 = _1268 ? _1560 : as_type<int>(_1466);
    float _1576 = _1398 * _1528;
    float _1578 = -_1398;
    float _1580 = _1578 + 1.0;
    int _1582 = _1574;
    if (_1274)
    {
        float _1584 = _1562 ? _1552 : _1466;
        _1564 = _1584;
    }
    float _1586 = _1564;
    float _1588 = fma(_1492, as_type<float>(_1574), -0.5);
    if (_1262)
    {
        float _1590 = -_856;
        float _1592 = _1590 + 1.0;
        _1582 = as_type<int>(_1592);
    }
    int _1594 = _1582;
    float _1596 = _1352 * _1576;
    if (_1254)
    {
        float _1598 = _1286 ? as_type<float>(_1572) : _856;
        _1566 = _1598;
    }
    float _1600 = _1566;
    float _1602 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1604 = _1558 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1606 = fma(_1580, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1596);
    if (!_1262)
    {
        _1532 = _856;
    }
    float _1608 = _1532;
    float _1610 = _1608;
    if (_1262)
    {
        float _1612 = _1312 ? as_type<float>(_1594) : _856;
        _1610 = _1612;
    }
    float _1614 = _1610;
    float _1616 = fma(_1360, _1524, _1606);
    float _1618 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1620 = fma(_1554, _1614, -0.5);
    float _1622 = _946 + _1556;
    if (!_1604)
    {
        _1534 = _1622;
    }
    float _1624 = _1534;
    bool _1626 = !_1604;
    float _1628 = _1624;
    if (!_1626)
    {
        float _1630 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1634 = _1558 + _1632;
        float _1636 = rsqrt(_1548);
        float _1638 = _1634 * _1630;
        float _1640 = _1622 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1642 = _1638 * 0.15915493667125701904296875;
        float _1644 = _1642 * 6.283185482025146484375;
        float _1646 = sin(_1644);
        float _1648 = _1642 * 6.283185482025146484375;
        float _1650 = cos(_1648);
        float _1652 = fma(_1646, _1640, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1654 = _1636 * _1652;
        float _1656 = fma(_1508, _1654, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1658 = _1650 + (-1.0);
        float _1660 = fma(_1512, _1654, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1662 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1664 = _1656 + _1662;
        float _1666 = _1658 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1668 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1670 = _1660 + _1668;
        float _1672 = _1664 * _1664;
        float _1674 = fma(_1622, _1650, _1666);
        float _1676 = _1670 * _1670;
        _1628 = _1674;
        _1536 = _1672;
        _1538 = _1676;
        _1540 = _1656;
        _1542 = _1660;
    }
    float _1678 = _1628;
    float _1680 = _1536;
    float _1682 = _1538;
    float _1684 = _1540;
    float _1686 = _1542;
    float _1688 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1690 = _1678 + _1688;
    float _1692 = fma(_1142, _1620, _1044);
    float _1694 = _1600 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1696 = fma(_1468, _1504, _1616);
    float _1698 = fma(_1690, _1690, _1680);
    float _1700 = -_1052;
    float _1702 = fma(_1130, _1588, _1700);
    float _1704 = _1586 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1706 = _1694 * _1602;
    float _1708 = _1698 + _1682;
    float _1710 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1696);
    float _1712 = _794 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1714 = _796 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1716 = _798 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1718 = _1704 * _1618;
    float _1720 = sqrt(_1708);
    float _1722 = _1712 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1724 = _1714 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1726 = _1716 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1728 = _1692 + 0.5;
    float _1730 = _1710 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1732 = _1702 + 0.5;
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    out.m_65.x = _1722;
    out.m_65.y = _1724;
    out.m_65.z = _1726;
    out.m_65.w = _1730;
    bool _1734 = _1720 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1736 = isnan(_1720);
    bool _1738 = _1734 || _1736;
    bool _1740 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1742 = _1738 || _1740;
    out.m_67.x = _1706;
    out.m_67.y = _1718;
    out.m_67.z = _1728;
    out.m_67.w = _1732;
    float _1744 = _1726;
    float _1746 = _1730;
    if (!_1742)
    {
        _1544 = 1.0;
    }
    float _1748 = _1544;
    bool _1750 = !_1742;
    float _1752 = _1748;
    if (!_1750)
    {
        bool _1754 = _1720 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1756 = isnan(_1720);
        bool _1758 = _1754 || _1756;
        bool _1760 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1762 = _1758 || _1760;
        if (!_1762)
        {
            float _1764 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1766 = _1720 + _1764;
            float _1768 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1770 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1768;
            float _1772 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1774 = _1772 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1776 = 1.0 / _1770;
            float _1778 = _1766 * _1776;
            float _1780 = fma(_1778, _1774, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1752 = _1780;
            _1782 = true;
        }
        else
        {
            bool _1784 = _1720 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1786 = isnan(_1720);
            bool _1788 = _1784 || _1786;
            bool _1790 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1792 = _1788 || _1790;
            if (!_1792)
            {
                float _1794 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1796 = _1720 + _1794;
                float _1798 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1800 = _1798 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1802 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1804 = _1802 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1806 = 1.0 / _1800;
                float _1808 = _1796 * _1806;
                float _1810 = fma(_1808, _1804, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1752 = _1810;
                _1782 = true;
            }
            else
            {
                _1752 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1782 = false;
    float _1812 = _1752;
    float _1814 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1816 = _1678 + _1814;
    float _1818 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1820 = _1684 + _1818;
    float _1822 = fma(_1816, _1812, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1824 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1826 = _1686 + _1824;
    float _1828 = fma(_1820, _1812, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1830 = -_1182;
    float _1832 = fma(_1830, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1822);
    float _1834 = fma(_1826, _1812, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1836 = -_1196;
    float _1838 = fma(_1836, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1828);
    float _1840 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1842 = _1832 + _1840;
    float _1844 = -_1208;
    float _1846 = fma(_1844, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1834);
    float _1848 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1850 = _1838 + _1848;
    float _1852 = _1842 * _1842;
    float _1854 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1856 = _1846 + _1854;
    float _1858 = fma(_1850, _1850, _1852);
    float _1860 = fma(_1856, _1856, _1858);
    float _1862 = rsqrt(_1860);
    float _1864 = _1862 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1866 = _1850 * _1864;
    float _1868 = _1856 * _1864;
    float _1870 = _1866 * _1866;
    float _1872 = _1868 * _1868;
    float _1874 = _1870 + _1872;
    float _1876 = sqrt(_1874);
    bool _1878 = _1876 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1880 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1882 = _1876 + _1880;
    float _1884 = _1856;
    float _1886 = _1874;
    float _1888 = _1882;
    float _1890 = _1866;
    if (_1878)
    {
        float _1892 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1884 = _1892;
    }
    float _1894 = _1884;
    if (_1878)
    {
        float _1896 = rsqrt(_1874);
        _1886 = _1896;
    }
    float _1898 = _1886;
    float _1900 = _1898;
    if (_1878)
    {
        float _1902 = _1882 * _1894;
        _1888 = _1902;
    }
    float _1904 = _1888;
    if (_1878)
    {
        float _1906 = _1904 * 0.15915493667125701904296875;
        _1744 = _1906;
    }
    float _1908 = _1744;
    float _1910 = _1834;
    if (_1878)
    {
        float _1912 = _1908 * 6.283185482025146484375;
        float _1914 = sin(_1912);
        _1910 = _1914;
    }
    float _1916 = _1910;
    float _1918 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1920 = precise::max(0.0, _1918);
    float _1922 = _1862;
    float _1924 = _1920;
    float _1926 = _1918;
    if (_1878)
    {
        float _1928 = _1908 * 6.283185482025146484375;
        float _1930 = cos(_1928);
        _1922 = _1930;
    }
    float _1932 = _1922;
    float _1934 = -_1864;
    float _1936 = -_1920;
    float _1938 = fma(_1842, _1934, _1936);
    float _1940 = _1938;
    if (_1878)
    {
        float _1942 = _1938 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1924 = _1942;
    }
    float _1944 = _1924;
    float _1946 = sqrt(_1860);
    float _1948 = _1916;
    float _1950 = _1944;
    if (_1878)
    {
        float _1952 = fma(_1916, _1944, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1948 = _1952;
    }
    float _1954 = _1948;
    float _1956 = _1954;
    if (!_1878)
    {
        _1950 = _1868;
    }
    float _1958 = _1950;
    float _1960 = _1958;
    if (_1878)
    {
        float _1962 = _1932 + (-1.0);
        _1926 = _1962;
    }
    float _1964 = _1926;
    float _1966 = _1964;
    if (_1878)
    {
        float _1968 = _1898 * _1954;
        _1956 = _1968;
    }
    float _1970 = _1956;
    if (!_1878)
    {
        _1900 = _1870;
    }
    float _1972 = _1900;
    float _1974 = _1972;
    if (_1878)
    {
        float _1976 = _1964 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1746 = _1976;
    }
    float _1978 = _1746;
    if (_1878)
    {
        float _1980 = _1866 * _1970;
        _1890 = _1980;
    }
    float _1982 = _1890;
    if (_1878)
    {
        float _1984 = _1868 * _1970;
        _1960 = _1984;
    }
    float _1986 = _1960;
    if (!_1878)
    {
        _1966 = _1872;
    }
    float _1988 = _1966;
    float _1990 = _1988;
    if (_1878)
    {
        float _1992 = fma(_1938, _1932, _1978);
        _1940 = _1992;
    }
    float _1994 = _1940;
    if (_1878)
    {
        float _1996 = _1982 * _1982;
        _1974 = _1996;
    }
    float _1998 = _1974;
    if (_1878)
    {
        float _2000 = _1986 * _1986;
        _1990 = _2000;
    }
    float _2002 = _1990;
    float _2004 = fma(_1994, _1994, _1998);
    float _2006 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2008 = fma(_1946, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2006);
    float _2010 = precise::clamp(_2008, 0.0, 1.0);
    float _2012 = _2004 + _2002;
    float _2014 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2016 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2018 = -_2010;
    float _2020 = _2018 + 1.0;
    float _2022 = rsqrt(_2012);
    float _2024 = fma(_1838, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2014);
    float _2026 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2028 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2030 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2032 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2024);
    float _2034 = fma(_1838, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2026);
    float _2036 = fma(_1838, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2028);
    float _2038 = fma(_1838, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2030);
    float _2040 = _2032 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2042 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2034);
    float _2044 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2036);
    float _2046 = abs(_2020);
    float _2048 = log2(_2046);
    float _2050 = _2040 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2052 = _2042 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2054 = _2044 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2056 = _2022 * _1982;
    float _2058 = -_2050;
    float _2060 = fma(_2058, _2016, 1.0);
    float _2062 = _2052 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2064 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2038);
    float _2066 = _2056 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2068 = _2022 * _1986;
    float _2070 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2062);
    float _2072 = _2022 * _1994;
    float _2074 = _2064 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2076 = log2(_2060);
    float _2078 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2070);
    float _2080 = -_2066;
    float _2082 = fma(_2072, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2080);
    float _2084 = _2048 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2086 = _2052 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2088 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2078);
    float _2090 = -_2068;
    float _2092 = fma(_2090, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2082);
    float _2094 = _2052 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2096 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2086);
    float _2098 = exp2(_2084);
    float _2100 = fma(_2092, -0.5, 0.5);
    float _2102 = fma(_2092, 0.5, 0.5);
    float _2104 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2094);
    float _2106 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2096);
    float _2108 = _2072 + 1.0;
    float _2110 = fma(_2102, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2112 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2104);
    float _2114 = 1.0 / _2088;
    float _2116 = _2076 * 0.693147182464599609375;
    float _2118 = fma(_2102, _2110, -0.212114393711090087890625);
    float _2120 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2112);
    float _2122 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2106);
    float _2124 = fma(_2102, _2118, 1.570728778839111328125);
    float _2126 = sqrt(_2100);
    float _2128 = -_2072;
    float _2130 = fma(_2098, _2108, _2128);
    float _2132 = fma(_2130, 0.5, 0.5);
    float _2134 = _2120 * _2114;
    float _2136 = _2122 * _2114;
    float _2138 = _2116 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2140 = fma(_2134, 0.5, 0.5);
    float _2142 = fma(_2136, -0.5, 0.5);
    float _2144 = _2126 * 0.636619746685028076171875;
    float _2146 = -_2124;
    float _2148 = fma(_2144, _2146, 1.0);
    float3 _5684 = float3(_2140, _2142, _2138);
    float _2150 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5684, float3(0.0), isnan(_5684)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5684, float3(0.0), isnan(_5684)), level(0.0)).x;
    float3 _5695 = float3(_2140, _2142, _2138);
    float4 _2153 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5695, float3(0.0), isnan(_5695)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5695, float3(0.0), isnan(_5695)), level(0.0)).xyzw;
    float _2155 = _2153.x;
    float _2157 = _2153.y;
    float _2159 = _2153.z;
    float _2161 = _2153.w;
    float2 _5712 = float2(_2148, _2132);
    float3 _2165 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5712, float2(0.0), isnan(_5712)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5712, float2(0.0), isnan(_5712)), level(0.0)).xyz;
    float _2167 = _2165.x;
    float _2169 = _2165.y;
    float _2171 = _2165.z;
    float _2173 = -_1182;
    float _2175 = fma(_2173, (*spvDescriptorSet0.vp_c9)._m0[18].w, _946);
    float _2177 = -_1196;
    float _2179 = fma(_2177, (*spvDescriptorSet0.vp_c9)._m0[18].w, _942);
    float _2181 = -_1208;
    float _2183 = fma(_2181, (*spvDescriptorSet0.vp_c9)._m0[18].w, _958);
    float _2185 = _2052 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2187 = _2175 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2189 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2185);
    float _2191 = fma(_2179, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2187);
    float _2193 = _2175 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2195 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2189);
    float _2197 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2191);
    float _2199 = fma(_2179, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2193);
    bool _2201 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2203 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2205 = _2201 || _2203;
    bool _2207 = isnan(0.5);
    bool _2209 = _2205 || _2207;
    float _2211 = _2048 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2213 = _2197 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2215 = fma(_2183, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2199);
    float _2217 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2195);
    float _2219 = exp2(_2211);
    float _2221 = _2215 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2223 = _2221 + _2213;
    float _2225 = 1.0 / _2213;
    float _2227 = _2185;
    if (_2209)
    {
        _2227 = 1.0;
    }
    float _2229 = _2227;
    float _2231 = _2223 * _2225;
    float _2233 = _2231 * 0.5;
    float _2235 = _2229;
    if (!_2209)
    {
        float _2237 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2239 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2241 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2239);
        float _2243 = _2237 * 0.15915493667125701904296875;
        float _2245 = _2243 * 6.283185482025146484375;
        float _2247 = cos(_2245);
        float _2249 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2251 = _2249 * 0.15915493667125701904296875;
        float _2253 = _2243 * 6.283185482025146484375;
        float _2255 = sin(_2253);
        float _2257 = 1.0 / _2247;
        float _2259 = _2251 * 6.283185482025146484375;
        float _2261 = cos(_2259);
        float _2263 = _2255 * _2257;
        float _2265 = 1.0 / _2241;
        float _2267 = _2261 * _2263;
        float _2269 = _2251 * 6.283185482025146484375;
        float _2271 = sin(_2269);
        float _2273 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2275 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2273;
        float _2277 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2279 = _2265 * _2277;
        float _2281 = 1.0 / _2267;
        float _2283 = 1.0 / _2275;
        float _2285 = _2271 * _2281;
        float _2287 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2289 = fma(_2285, _2279, _2287);
        float _2291 = _2289 * _2283;
        float _2293 = precise::clamp(_2291, 0.0, 1.0);
        _2235 = _2293;
    }
    float _2295 = _2235;
    float _2297 = -_2219;
    float _2299 = _2297 + 1.0;
    float _2301 = _2217 + _2088;
    bool _2303 = _2295 > 0.0;
    bool _2305 = isnan(_2295);
    bool _2307 = _2303 || _2305;
    bool _2309 = isnan(0.0);
    bool _2311 = _2307 || _2309;
    float _2313 = _2295 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2315 = _2299 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2317 = _2301 * 0.5;
    float _2319 = _2315 * _2150;
    float _2321 = -_2315;
    float _2323 = _2321 + 1.0;
    out.gl_Position.x = _2120;
    out.gl_Position.y = _2122;
    out.gl_Position.z = _2217;
    out.gl_Position.w = _2088;
    float _2325 = _2313 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2327 = _2161 * _2319;
    float _2329 = _2171 * _2319;
    out.m_69.z = _2317;
    out.m_69.w = _2088;
    float _2331 = fma(_2167, _2327, _2155);
    float _2333 = fma(_2169, _2327, _2157);
    float _2335 = _2161 * _2323;
    float _2337 = fma(_2161, _2329, _2159);
    out.m_47.x = _2325;
    out.m_71.x = _2331;
    out.m_71.y = _2333;
    out.m_71.z = _2337;
    out.m_71.w = _2335;
    if (_2311)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2339 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2339;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

