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
    float4 m_59 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_55 [[user(locn5)]];
    float4 m_63 [[user(locn6)]];
    float4 m_71 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_67 [[attribute(5)]];
    float4 m_57 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_51 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1448 = false;
    bool _726 = false;
    bool _558 = false;
    bool _416 = false;
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
        float _1942 = as_type<float>(_106);
        out.gl_Position.z = _1942;
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
    if (_120)
    {
        float _126 = float(_90);
        _100 = _126;
    }
    float _128 = _100;
    bool _130 = _124 >= _128;
    bool _132 = !_120;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_47.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _108 = as_type<int>(_140);
    }
    int _142 = _108;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2011 = as_type<float>(_142);
        out.gl_Position.z = _2011;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_51.y;
    float _146 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _148 = in.m_53.w;
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
    float _174 = _146;
    if (!_158)
    {
        float _176 = _146 * _146;
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
    out.m_55.y = _144;
    bool _188 = !_158;
    float _190 = _186;
    float _192 = _144;
    if (!_188)
    {
        float _194 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = log2(_194);
        float _198 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _200 = _198 + 1.0;
        float _202 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = _146 * _196;
        float _206 = 1.0 / _200;
        float _208 = _202 * 0.693147182464599609375;
        float _210 = exp2(_204);
        float _212 = 1.0 / _208;
        float _214 = _210 + (-1.0);
        float _216 = -_214;
        float _218 = fma(_216, _212, _146);
        float _220 = _218 * _206;
        float _222 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _222;
    }
    float _224 = _190;
    bool _226 = !_158;
    if (!_226)
    {
        float _228 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = log2(_228);
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _234 = _232 + 1.0;
        float _236 = 1.0 / _234;
        float _238 = _146 * _230;
        float _240 = exp2(_238);
        float _242 = -_240;
        float _244 = _242 + 1.0;
        float _246 = _244 * _236;
        _174 = _246;
    }
    float _248 = _174;
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _252 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _254 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _256 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _258 = fma(_248, _162, _252);
    float _260 = fma(_248, _160, _254);
    float _262 = fma(_248, _164, _256);
    float _264 = fma(_258, _148, _168);
    float _266 = fma(_260, _148, _166);
    float _268 = fma(_262, _148, _170);
    bool _270 = !_250;
    float _288;
    if (!_270)
    {
        float _272 = in.m_57.x;
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
    float _320 = 1.0 / _318;
    bool _322 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _324 = isnan(_298);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    float _334 = -_314;
    float _336 = _334 + 1.0;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _342;
    bool _346 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _348;
    float _352 = _332 * _336;
    float _354 = -_332;
    float _356 = _354 + 1.0;
    float _358 = _302 * _320;
    float _360 = in.m_53.x;
    float _362 = in.m_53.y;
    float _364 = in.m_53.z;
    float _366 = fma(_340, _358, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _368 = fma(_350, _358, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _370 = fma(_344, _358, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _372 = _366 * _352;
    float _374 = _368 * _352;
    float _376 = _370 * _352;
    float _378 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[143].x, _372);
    float _380 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[143].y, _374);
    float _382 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[143].z, _376);
    float _384 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[144].x, _378);
    float _386 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[144].y, _380);
    float _388 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[144].z, _382);
    float _390 = _384 * _360;
    float _392 = _386 * _362;
    float _394 = _388 * _364;
    bool _396 = !_346;
    float _414;
    if (!_396)
    {
        float _398 = in.m_57.x;
        float _400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _402 = _398 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _404 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _406 = _404 * _400;
        float _408 = floor(_406);
        float _410 = -_408;
        float _412 = _406 + _410;
        _414 = _412;
        _416 = true;
    }
    else
    {
        float _418 = float(_90);
        float _420 = 1.0 / _418;
        float _422 = _124 * _420;
        _414 = _422;
    }
    _416 = false;
    float _424 = _414;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _428 = _424 + _426;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _434 = _424 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _436 = isnan(_424);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _450 = _424 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _452 = isnan(_424);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _462;
    bool _466 = _424 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _468 = isnan(_424);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = 1.0 / _432;
    float _480 = -_444;
    float _482 = _480 + 1.0;
    bool _484 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _486 = _460 * _482;
    float _488 = -_460;
    float _490 = _488 + 1.0;
    float _492 = 1.0 / _448;
    float _494 = _464 * _478;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _500 = fma(_494, _428, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _502 = _498 * _492;
    float _504 = _500 * _486;
    float _506 = -_476;
    float _508 = _506 + 1.0;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _512 = _424 + _510;
    float _514 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[115].x, _504);
    float _516 = _444 * _508;
    float _518 = fma(_502, _512, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _522 = fma(_518, _516, _514);
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _528 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[117].x, _522);
    float _530 = _520 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _532 = _524 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _534 = _526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _536 = _528 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _530;
    out.m_59.y = _532;
    out.m_59.z = _534;
    out.m_59.w = _536;
    bool _538 = !_484;
    float _556;
    if (!_538)
    {
        float _540 = in.m_57.x;
        float _542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _544 = _540 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _546 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _548 = _546 * _542;
        float _550 = floor(_548);
        float _552 = -_550;
        float _554 = _548 + _552;
        _556 = _554;
        _558 = true;
    }
    else
    {
        float _560 = float(_90);
        float _562 = 1.0 / _560;
        float _564 = _124 * _562;
        _556 = _564;
    }
    _558 = false;
    float _566 = _556;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _570 = _566 + _568;
    bool _572 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _574 = isnan(_566);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _586 = _566 + _584;
    bool _588 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _590 = isnan(_566);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _600;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _608 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _610 = isnan(_566);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _616 = _612 || _614;
    float _618 = float(_616);
    float _620 = -_582;
    float _622 = _620 + 1.0;
    float _624 = 1.0 / _606;
    float _626 = _618 * _622;
    float _628 = -_618;
    float _630 = _628 + 1.0;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _632;
    bool _636 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _638 = 1.0 / _602;
    float _640 = _598 * _630;
    float _642 = -_598;
    float _644 = _642 + 1.0;
    float _646 = _586 * _624;
    float _648 = _570 * _638;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _650;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _654;
    float _658 = fma(_634, _648, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _660 = fma(_652, _648, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _662 = fma(_656, _648, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _664 = _658 * _640;
    float _666 = _660 * _640;
    float _668 = _662 * _640;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _676 = _674 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _680 = _678 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _682 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[123].x, _664);
    float _684 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[123].y, _666);
    float _686 = fma(_672, _646, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _688 = fma(_676, _646, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _690 = fma(_680, _646, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _692 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[123].z, _668);
    float _694 = fma(_686, _626, _682);
    float _696 = fma(_688, _626, _684);
    float _698 = fma(_690, _626, _692);
    float _700 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[125].x, _694);
    float _702 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[125].y, _696);
    float _704 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[125].z, _698);
    bool _706 = !_636;
    float _724;
    if (!_706)
    {
        float _708 = in.m_57.x;
        float _710 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _712 = _708 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _714 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _716 = _714 * _710;
        float _718 = floor(_716);
        float _720 = -_718;
        float _722 = _716 + _720;
        _724 = _722;
        _726 = true;
    }
    else
    {
        float _728 = float(_90);
        float _730 = 1.0 / _728;
        float _732 = _124 * _730;
        _724 = _732;
    }
    _726 = false;
    float _734 = _724;
    float _736 = in.m_57.x;
    float _738 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _740 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _742 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _746 = _744 != 0;
    float _748 = in.m_57.y;
    int _750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _752 = _750 != 0;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _760 = _758 != 0;
    float _762 = in.m_57.z;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _766 = _764 != 0;
    float _768 = 1.0 / _756;
    int _770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _772 = _770 != 0;
    float _774 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].x, _738);
    float _776 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].x, _740);
    float _778 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].x, _742);
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _786 = _784 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _788 = _736 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _790 = 1.0 / _782;
    float _792 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].z, _774);
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _796;
    float _800 = in.m_51.x;
    float _802 = _798 * _768;
    float _804 = 1.0 / _786;
    float _806 = -_794;
    float _808 = fma(_788, 2.0, _806);
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _812 = _748 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _814 = _762 > 0.5;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _818;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _824 = _812;
    bool _826 = _814;
    float _828 = _802;
    if (_772)
    {
        _822 = _736;
    }
    float _830 = _822;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _836 = _830;
    if (!_772)
    {
        _836 = _762;
    }
    float _838 = _836;
    float _840 = -_144;
    float _842 = _840 + 1.0;
    float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _846 = fma(_812, -2.0, _810);
    float _848 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].z, _776);
    float _850 = _820 * _804;
    float _852 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].z, _778);
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    if (_772)
    {
        _824 = _748;
    }
    float _856 = _824;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _860 = _814 ? as_type<int>(_842) : as_type<int>(_144);
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _864 = _856;
    if (_746)
    {
        bool _866 = _736 > 0.5;
        _826 = _866;
    }
    bool _868 = _826;
    float _870 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[78].z, _816);
    float _872 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[88].z, _858);
    if (!_772)
    {
        _864 = _736;
    }
    float _874 = _864;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _878 = _734 + _876;
    float _880 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _882 = _834 * _790;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _886 = _734 + _884;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _890 = _734 + _888;
    bool _892 = _748 > 0.5;
    float _894 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[78].w, _854);
    float _896 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[88].w, _862);
    float _898 = fma(_850, _878, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _900 = _734 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _902 = isnan(_734);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    float _912 = fma(_802, _886, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _914 = fma(_882, _890, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _916 = _734 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _918 = isnan(_734);
    bool _920 = _916 || _918;
    bool _922 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _924 = _920 || _922;
    float _926 = float(_924);
    float _928 = _844 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _930 = _760 ? as_type<float>(_860) : _144;
    float _932 = _838 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _934 = _734 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _936 = isnan(_734);
    bool _938 = _934 || _936;
    bool _940 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _942 = _938 || _940;
    float _944 = float(_942);
    float _946 = -_926;
    float _948 = _946 + 1.0;
    int _950 = as_type<int>(_912);
    float _952 = _874;
    if (_766)
    {
        float _954 = _892 ? _842 : _144;
        _192 = _954;
    }
    float _956 = _192;
    float _958 = -_910;
    float _960 = _958 + 1.0;
    bool _962 = _734 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _964 = isnan(_734);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _970 = _966 || _968;
    float _972 = float(_970);
    float _974 = _910 * _948;
    float _976 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _894);
    float _978 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _846);
    float _980 = _972 * _960;
    float _982 = -_972;
    float _984 = _982 + 1.0;
    float _986 = fma(_930, _928, -0.5);
    float _988 = _880 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _990 = _944 * _984;
    float _992 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _994 = fma(_988, _956, -0.5);
    int _996 = as_type<int>(_956);
    if (_746)
    {
        float _998 = -_800;
        float _1000 = _998 + 1.0;
        _996 = as_type<int>(_1000);
    }
    int _1002 = _996;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1008 = -_978;
    float _1010 = fma(_976, _994, _1008);
    float _1012 = _874 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1014 = _912 * _990;
    float _1016 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1018 = as_type<int>(_1010);
    if (_752)
    {
        float _1020 = -_800;
        float _1022 = _1020 + 1.0;
        _950 = as_type<int>(_1022);
    }
    int _1024 = _950;
    if (!_746)
    {
        _828 = _800;
    }
    float _1026 = _828;
    float _1028 = -_944;
    float _1030 = _1028 + 1.0;
    float _1032 = -_1004;
    float _1034 = fma(_932, 2.0, _1032);
    float _1036 = fma(_1012, -2.0, _1006);
    float _1038 = _1026;
    if (_746)
    {
        float _1040 = _868 ? as_type<float>(_1002) : _800;
        _1038 = _1040;
    }
    float _1042 = _1038;
    float _1044 = _848 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1046 = _1042;
    if (!_752)
    {
        _952 = _800;
    }
    float _1048 = _952;
    float _1050 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1014);
    float _1052 = _1048;
    if (_752)
    {
        float _1054 = _892 ? as_type<float>(_1024) : _800;
        _1052 = _1054;
    }
    float _1056 = _1052;
    float _1058 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _870);
    float _1060 = -_124;
    float _1062 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[76].x, _808);
    float _1064 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _872);
    float _1066 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _896);
    float _1068 = -_124;
    float _1070 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1034);
    float _1072 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1036);
    float _1074 = _792 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1076 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1078 = _1044 + _1076;
    float _1080 = fma(_914, _980, _1050);
    float _1082 = _852 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1086 = _1074 + _1084;
    float _1088 = _1078 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1090 = _992 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1092 = _1016 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1094 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1096 = _1082 + _1094;
    float _1098 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1088);
    float _1100 = fma(_1090, _1042, -0.5);
    float _1102 = fma(_1092, _1056, -0.5);
    float _1104 = fma(_898, _974, _1080);
    float _1106 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1098);
    float _1108 = fma(_1058, _1100, _1062);
    float _1110 = _1078 * _1078;
    float _1112 = fma(_1064, _1102, _1070);
    float _1114 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1104);
    bool _1116 = _1106 >= 0.0;
    float _1118 = fma(_1086, _1086, _1110);
    float _1120 = _700 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1122 = _702 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1124 = -_1072;
    float _1126 = fma(_1066, _986, _1124);
    float _1128 = fma(_1096, _1096, _1118);
    float _1130 = _704 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1132 = _1108 + 0.5;
    float _1134 = rsqrt(_1128);
    float _1136 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1138 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1140 = _1130 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1142 = as_type<int>(_1108);
    if (_1116)
    {
        _1046 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1144 = _1046;
    float _1146 = _1010 + 0.5;
    float _1148 = _1126 + 0.5;
    float _1150 = _1112 + 0.5;
    float _1152 = _1114 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_1116)
    {
        float _1154 = _1144 * 5.0;
        _1142 = as_type<int>(_1154);
    }
    int _1156 = _1142;
    out.m_61.x = _1132;
    out.m_61.y = _1146;
    out.m_63.x = _1150;
    out.m_63.y = _1148;
    float _1158 = _1078 * _1134;
    float _1160 = _1086 * _1134;
    out.m_65.x = _1136;
    out.m_65.y = _1138;
    out.m_65.z = _1140;
    out.m_65.w = _1152;
    if (_1116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3719 = as_type<float>(_1156);
        out.gl_Position.z = _3719;
    }
    if (_1116)
    {
        out.m_47.x = 0.0;
    }
    if (_1116)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1162 = -_1158;
    float _1164 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1044);
    float _1166 = _1096 * _1134;
    float _1168 = -_1160;
    float _1170 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1074);
    float _1172 = -_1158;
    float _1174 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1078);
    float _1176 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1178 = _1164 + _1176;
    float _1180 = -_1166;
    float _1182 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1082);
    float _1184 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1186 = _1170 + _1184;
    float _1188 = -_1160;
    float _1190 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1086);
    float _1192 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1194 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1196 = _1182 + _1194;
    float _1198 = -_1166;
    float _1200 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1096);
    float _1202 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1192);
    float _1204 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1202);
    bool _1206 = _1204 >= 0.0;
    float _1208 = _1174 * _1174;
    float _1210 = fma(_1190, _1190, _1208);
    float _1212 = fma(_1200, _1200, _1210);
    float _1214 = _1186;
    if (_1206)
    {
        _1214 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1216 = _1214;
    if (_1206)
    {
        out.m_47.x = 0.0;
    }
    if (_1206)
    {
        float _1218 = _1216 * 5.0;
        _1018 = as_type<int>(_1218);
    }
    int _1220 = _1018;
    if (_1206)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3844 = as_type<float>(_1220);
        out.gl_Position.z = _3844;
    }
    if (_1206)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1222 = in.m_67.x;
    float _1224 = in.m_67.y;
    float _1226 = in.m_67.z;
    float _1228 = sqrt(_1212);
    float _1230 = _392 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1232 = _390 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1234 = _394 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1236 = _1134 * _1228;
    float _1238 = _1236 * _1230;
    float _1240 = _1236 * _1232;
    float _1242 = _1236 * _1234;
    float _1244 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1224);
    float _1246 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1222);
    float _1248 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1226);
    float _1250 = _1238 * _1244;
    float _1252 = _1240 * _1246;
    float _1254 = _1242 * _1248;
    float _1256 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1258 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1260 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1262 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1256);
    float _1264 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1258);
    float _1266 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1260);
    float _1268 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1262);
    float _1270 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1264);
    float _1272 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1266);
    float _1274 = _1268 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1276 = _1270 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1278 = _1074 + _1274;
    float _1280 = _1082 + _1276;
    float _1282 = _1272 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1284 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1286 = _1278 + _1284;
    float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1290 = _1280 + _1288;
    float _1292 = _1044 + _1282;
    float _1294 = _1286 * _1286;
    float _1296 = _1290 * _1290;
    float _1298 = _1294 + _1296;
    float _1300 = sqrt(_1298);
    bool _1302 = _1300 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1304 = _1282;
    float _1306 = _1252;
    float _1308 = _1294;
    float _1310 = _1278;
    float _1312 = _1280;
    float _1314 = _1300;
    if (!_1302)
    {
        _1304 = _1294;
    }
    float _1316 = _1304;
    float _1318 = _1316;
    if (!_1302)
    {
        _1306 = _1296;
    }
    float _1320 = _1306;
    float _1322 = _1320;
    if (!_1302)
    {
        _1308 = _1292;
    }
    float _1324 = _1308;
    bool _1326 = !_1302;
    float _1328 = _1324;
    if (!_1326)
    {
        float _1330 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1332 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1334 = _1300 + _1332;
        float _1336 = _1292 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1338 = rsqrt(_1298);
        float _1340 = _1334 * _1330;
        float _1342 = _1340 * 0.15915493667125701904296875;
        float _1344 = _1342 * 6.283185482025146484375;
        float _1346 = sin(_1344);
        float _1348 = _1342 * 6.283185482025146484375;
        float _1350 = cos(_1348);
        float _1352 = fma(_1346, _1336, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1354 = _1338 * _1352;
        float _1356 = _1350 + (-1.0);
        float _1358 = fma(_1286, _1354, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1360 = fma(_1290, _1354, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1362 = _1356 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1364 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1366 = _1358 + _1364;
        float _1368 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1370 = _1360 + _1368;
        float _1372 = fma(_1292, _1350, _1362);
        float _1374 = _1366 * _1366;
        float _1376 = _1370 * _1370;
        _1328 = _1372;
        _1318 = _1374;
        _1322 = _1376;
        _1310 = _1358;
        _1312 = _1360;
        _1314 = _1334;
    }
    float _1378 = _1328;
    float _1380 = _1318;
    float _1382 = _1322;
    float _1384 = _1310;
    float _1386 = _1312;
    float _1388 = _1314;
    float _1390 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1392 = _1378 + _1390;
    float _1394 = fma(_1392, _1392, _1380);
    float _1396 = _1394 + _1382;
    float _1398 = sqrt(_1396);
    bool _1400 = _1398 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1402 = isnan(_1398);
    bool _1404 = _1400 || _1402;
    bool _1406 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1408 = _1404 || _1406;
    float _1410 = _1380;
    float _1412 = _1388;
    if (!_1408)
    {
        _1410 = 1.0;
    }
    float _1414 = _1410;
    bool _1416 = !_1408;
    float _1418 = _1414;
    if (!_1416)
    {
        bool _1420 = _1398 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1422 = isnan(_1398);
        bool _1424 = _1420 || _1422;
        bool _1426 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1428 = _1424 || _1426;
        if (!_1428)
        {
            float _1430 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1432 = _1398 + _1430;
            float _1434 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1436 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1434;
            float _1438 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1440 = _1438 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1442 = 1.0 / _1436;
            float _1444 = _1432 * _1442;
            float _1446 = fma(_1444, _1440, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1418 = _1446;
            _1448 = true;
        }
        else
        {
            bool _1450 = _1398 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1452 = isnan(_1398);
            bool _1454 = _1450 || _1452;
            bool _1456 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1458 = _1454 || _1456;
            if (!_1458)
            {
                float _1460 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1462 = _1398 + _1460;
                float _1464 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1466 = _1464 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1468 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1470 = _1468 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1472 = 1.0 / _1466;
                float _1474 = _1462 * _1472;
                float _1476 = fma(_1474, _1470, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1418 = _1476;
                _1448 = true;
            }
            else
            {
                _1418 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1448 = false;
    float _1478 = _1418;
    float _1480 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1482 = _1378 + _1480;
    float _1484 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1486 = _1384 + _1484;
    float _1488 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1490 = _1386 + _1488;
    float _1492 = fma(_1482, _1478, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1494 = fma(_1486, _1478, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1496 = fma(_1490, _1478, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1498 = -_1158;
    float _1500 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1492);
    float _1502 = -_1160;
    float _1504 = fma(_1502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1494);
    float _1506 = -_1166;
    float _1508 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1496);
    float _1510 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1512 = _1500 + _1510;
    float _1514 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1516 = _1504 + _1514;
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1520 = _1508 + _1518;
    float _1522 = _1512 * _1512;
    float _1524 = fma(_1516, _1516, _1522);
    float _1526 = fma(_1520, _1520, _1524);
    float _1528 = rsqrt(_1526);
    float _1530 = _1528 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1532 = _1516 * _1530;
    float _1534 = _1520 * _1530;
    float _1536 = _1532 * _1532;
    float _1538 = _1534 * _1534;
    float _1540 = _1536 + _1538;
    float _1542 = sqrt(_1540);
    bool _1544 = _1542 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1546 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1548 = _1542 + _1546;
    float _1550 = _1520;
    float _1552 = _1540;
    float _1554 = _1548;
    float _1556 = _1530;
    float _1558 = _1532;
    if (_1544)
    {
        float _1560 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1550 = _1560;
    }
    float _1562 = _1550;
    if (_1544)
    {
        float _1564 = rsqrt(_1540);
        _1552 = _1564;
    }
    float _1566 = _1552;
    if (_1544)
    {
        float _1568 = _1548 * _1562;
        _1554 = _1568;
    }
    float _1570 = _1554;
    if (_1544)
    {
        float _1572 = _1570 * 0.15915493667125701904296875;
        _1412 = _1572;
    }
    float _1574 = _1412;
    float _1576 = _1528;
    float _1578 = _1574;
    if (_1544)
    {
        float _1580 = _1574 * 6.283185482025146484375;
        float _1582 = sin(_1580);
        _1576 = _1582;
    }
    float _1584 = _1576;
    float _1586 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1588 = precise::max(0.0, _1586);
    float _1590 = _1524;
    float _1592 = _1588;
    float _1594 = _1586;
    if (_1544)
    {
        float _1596 = _1574 * 6.283185482025146484375;
        float _1598 = cos(_1596);
        _1590 = _1598;
    }
    float _1600 = _1590;
    float _1602 = -_1530;
    float _1604 = -_1588;
    float _1606 = fma(_1512, _1602, _1604);
    float _1608 = _1606;
    if (!_1544)
    {
        _1592 = _1534;
    }
    float _1610 = _1592;
    float _1612 = _1610;
    if (_1544)
    {
        float _1614 = _1606 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1594 = _1614;
    }
    float _1616 = _1594;
    float _1618 = _1584;
    float _1620 = _1616;
    if (_1544)
    {
        float _1622 = fma(_1584, _1616, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1618 = _1622;
    }
    float _1624 = _1618;
    float _1626 = _1624;
    if (_1544)
    {
        float _1628 = _1600 + (-1.0);
        _1620 = _1628;
    }
    float _1630 = _1620;
    float _1632 = _1630;
    if (_1544)
    {
        float _1634 = _1566 * _1624;
        _1556 = _1634;
    }
    float _1636 = _1556;
    if (!_1544)
    {
        _1626 = _1606;
    }
    float _1638 = _1626;
    float _1640 = sqrt(_1526);
    float _1642 = _1638;
    if (_1544)
    {
        float _1644 = _1630 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1578 = _1644;
    }
    float _1646 = _1578;
    if (_1544)
    {
        float _1648 = _1532 * _1636;
        _1558 = _1648;
    }
    float _1650 = _1558;
    if (!_1544)
    {
        _1632 = _1536;
    }
    float _1652 = _1632;
    float _1654 = _1652;
    if (_1544)
    {
        float _1656 = _1534 * _1636;
        _1612 = _1656;
    }
    float _1658 = _1612;
    if (_1544)
    {
        float _1660 = fma(_1606, _1600, _1646);
        _1642 = _1660;
    }
    float _1662 = _1642;
    if (_1544)
    {
        float _1664 = _1650 * _1650;
        _1654 = _1664;
    }
    float _1666 = _1654;
    if (!_1544)
    {
        _1608 = _1538;
    }
    float _1668 = _1608;
    float _1670 = _1668;
    if (_1544)
    {
        float _1672 = _1658 * _1658;
        _1670 = _1672;
    }
    float _1674 = _1670;
    float _1676 = fma(_1662, _1662, _1666);
    float _1678 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1680 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1682 = _1676 + _1674;
    float _1684 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1678);
    float _1686 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1688 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1690 = fma(_1640, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1688);
    float _1692 = precise::clamp(_1690, 0.0, 1.0);
    float _1694 = rsqrt(_1682);
    float _1696 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1684);
    float _1698 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1686);
    float _1700 = -_1692;
    float _1702 = _1700 + 1.0;
    float _1704 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1706 = _1696 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1708 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1680);
    float _1710 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1698);
    float _1712 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1714 = _1706 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1716 = abs(_1702);
    float _1718 = log2(_1716);
    float _1720 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1704);
    float _1722 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1708);
    float _1724 = _1710 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1726 = -_1714;
    float _1728 = fma(_1726, _1712, 1.0);
    float _1730 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1720);
    float _1732 = _1694 * _1650;
    float _1734 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1736 = _1724 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1738 = _1694 * _1662;
    float _1740 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1742 = _1694 * _1658;
    float _1744 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1736);
    float _1746 = _1730 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1748 = -_1740;
    float _1750 = fma(_1738, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1748);
    float _1752 = log2(_1728);
    float _1754 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1744);
    float _1756 = _1718 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1758 = -_1742;
    float _1760 = fma(_1758, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1750);
    float _1762 = _1724 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1764 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1754);
    float _1766 = _1724 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1768 = fma(_1760, -0.5, 0.5);
    float _1770 = exp2(_1756);
    float _1772 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1762);
    float _1774 = fma(_1760, 0.5, 0.5);
    float _1776 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1766);
    float _1778 = _1738 + 1.0;
    float _1780 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1772);
    float _1782 = 1.0 / _1764;
    float _1784 = fma(_1774, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1786 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1776);
    float _1788 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1780);
    float _1790 = fma(_1774, _1784, -0.212114393711090087890625);
    float _1792 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1786);
    float _1794 = sqrt(_1768);
    float _1796 = -_1738;
    float _1798 = fma(_1770, _1778, _1796);
    float _1800 = _1752 * 0.693147182464599609375;
    float _1802 = fma(_1774, _1790, 1.570728778839111328125);
    float _1804 = fma(_1798, 0.5, 0.5);
    float _1806 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1808 = _1788 * _1782;
    float _1810 = _1792 * _1782;
    float _1812 = fma(_1808, 0.5, 0.5);
    float _1814 = fma(_1810, -0.5, 0.5);
    float _1816 = _1794 * 0.636619746685028076171875;
    float3 _4832 = float3(_1812, _1814, _1806);
    float _1818 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4832, float3(0.0), isnan(_4832)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4832, float3(0.0), isnan(_4832)), level(0.0)).x;
    float _1820 = -_1802;
    float _1822 = fma(_1816, _1820, 1.0);
    float3 _4848 = float3(_1812, _1814, _1806);
    float4 _1825 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4848, float3(0.0), isnan(_4848)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4848, float3(0.0), isnan(_4848)), level(0.0)).xyzw;
    float _1827 = _1825.x;
    float _1829 = _1825.y;
    float _1831 = _1825.z;
    float _1833 = _1825.w;
    float2 _4865 = float2(_1822, _1804);
    float3 _1837 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4865, float2(0.0), isnan(_4865)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4865, float2(0.0), isnan(_4865)), level(0.0)).xyz;
    float _1839 = _1837.x;
    float _1841 = _1837.y;
    float _1843 = _1837.z;
    float _1845 = _1718 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1847 = _1724 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1849 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1847);
    float _1851 = exp2(_1845);
    float _1853 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1849);
    float _1855 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1853);
    float _1857 = _1855 + _1764;
    float _1859 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1788;
    out.gl_Position.y = _1792;
    out.gl_Position.z = _1855;
    out.gl_Position.w = _1764;
    float _1861 = _1857 * 0.5;
    float _1863 = -_1851;
    float _1865 = _1863 + 1.0;
    out.m_47.x = _1859;
    float _1867 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _1861;
    out.m_69.w = _1764;
    float _1869 = _1867 * _1818;
    float _1871 = -_1867;
    float _1873 = _1871 + 1.0;
    float _1875 = _1833 * _1869;
    float _1877 = _1833 * _1873;
    float _1879 = _1843 * _1869;
    float _1881 = fma(_1839, _1875, _1827);
    float _1883 = fma(_1841, _1875, _1829);
    float _1885 = fma(_1833, _1879, _1831);
    out.m_71.x = _1881;
    out.m_71.y = _1883;
    out.m_71.z = _1885;
    out.m_71.w = _1877;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1448 = false;
    bool _726 = false;
    bool _558 = false;
    bool _416 = false;
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
        float _1942 = as_type<float>(_106);
        out.gl_Position.z = _1942;
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
    if (_120)
    {
        float _126 = float(_90);
        _100 = _126;
    }
    float _128 = _100;
    bool _130 = _124 >= _128;
    bool _132 = !_120;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_47.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _108 = as_type<int>(_140);
    }
    int _142 = _108;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2011 = as_type<float>(_142);
        out.gl_Position.z = _2011;
    }
    if (_134)
    {
        return out;
    }
    float _144 = in.m_51.y;
    float _146 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _148 = in.m_53.w;
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
    float _174 = _146;
    if (!_158)
    {
        float _176 = _146 * _146;
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
    out.m_55.y = _144;
    bool _188 = !_158;
    float _190 = _186;
    float _192 = _144;
    if (!_188)
    {
        float _194 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = log2(_194);
        float _198 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _200 = _198 + 1.0;
        float _202 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = _146 * _196;
        float _206 = 1.0 / _200;
        float _208 = _202 * 0.693147182464599609375;
        float _210 = exp2(_204);
        float _212 = 1.0 / _208;
        float _214 = _210 + (-1.0);
        float _216 = -_214;
        float _218 = fma(_216, _212, _146);
        float _220 = _218 * _206;
        float _222 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _222;
    }
    float _224 = _190;
    bool _226 = !_158;
    if (!_226)
    {
        float _228 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = log2(_228);
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _234 = _232 + 1.0;
        float _236 = 1.0 / _234;
        float _238 = _146 * _230;
        float _240 = exp2(_238);
        float _242 = -_240;
        float _244 = _242 + 1.0;
        float _246 = _244 * _236;
        _174 = _246;
    }
    float _248 = _174;
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _252 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _254 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _256 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _258 = fma(_248, _162, _252);
    float _260 = fma(_248, _160, _254);
    float _262 = fma(_248, _164, _256);
    float _264 = fma(_258, _148, _168);
    float _266 = fma(_260, _148, _166);
    float _268 = fma(_262, _148, _170);
    bool _270 = !_250;
    float _288;
    if (!_270)
    {
        float _272 = in.m_57.x;
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
    float _320 = 1.0 / _318;
    bool _322 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _324 = isnan(_298);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    float _334 = -_314;
    float _336 = _334 + 1.0;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _342;
    bool _346 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _348;
    float _352 = _332 * _336;
    float _354 = -_332;
    float _356 = _354 + 1.0;
    float _358 = _302 * _320;
    float _360 = in.m_53.x;
    float _362 = in.m_53.y;
    float _364 = in.m_53.z;
    float _366 = fma(_340, _358, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _368 = fma(_350, _358, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _370 = fma(_344, _358, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _372 = _366 * _352;
    float _374 = _368 * _352;
    float _376 = _370 * _352;
    float _378 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[143].x, _372);
    float _380 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[143].y, _374);
    float _382 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[143].z, _376);
    float _384 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[144].x, _378);
    float _386 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[144].y, _380);
    float _388 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[144].z, _382);
    float _390 = _384 * _360;
    float _392 = _386 * _362;
    float _394 = _388 * _364;
    bool _396 = !_346;
    float _414;
    if (!_396)
    {
        float _398 = in.m_57.x;
        float _400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _402 = _398 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _404 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _406 = _404 * _400;
        float _408 = floor(_406);
        float _410 = -_408;
        float _412 = _406 + _410;
        _414 = _412;
        _416 = true;
    }
    else
    {
        float _418 = float(_90);
        float _420 = 1.0 / _418;
        float _422 = _124 * _420;
        _414 = _422;
    }
    _416 = false;
    float _424 = _414;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _428 = _424 + _426;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _434 = _424 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _436 = isnan(_424);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _450 = _424 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _452 = isnan(_424);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _462;
    bool _466 = _424 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _468 = isnan(_424);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = 1.0 / _432;
    float _480 = -_444;
    float _482 = _480 + 1.0;
    bool _484 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _486 = _460 * _482;
    float _488 = -_460;
    float _490 = _488 + 1.0;
    float _492 = 1.0 / _448;
    float _494 = _464 * _478;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _500 = fma(_494, _428, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _502 = _498 * _492;
    float _504 = _500 * _486;
    float _506 = -_476;
    float _508 = _506 + 1.0;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _512 = _424 + _510;
    float _514 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[115].x, _504);
    float _516 = _444 * _508;
    float _518 = fma(_502, _512, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _522 = fma(_518, _516, _514);
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _528 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[117].x, _522);
    float _530 = _520 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _532 = _524 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _534 = _526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _536 = _528 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _530;
    out.m_59.y = _532;
    out.m_59.z = _534;
    out.m_59.w = _536;
    bool _538 = !_484;
    float _556;
    if (!_538)
    {
        float _540 = in.m_57.x;
        float _542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _544 = _540 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _546 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _548 = _546 * _542;
        float _550 = floor(_548);
        float _552 = -_550;
        float _554 = _548 + _552;
        _556 = _554;
        _558 = true;
    }
    else
    {
        float _560 = float(_90);
        float _562 = 1.0 / _560;
        float _564 = _124 * _562;
        _556 = _564;
    }
    _558 = false;
    float _566 = _556;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _570 = _566 + _568;
    bool _572 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _574 = isnan(_566);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _586 = _566 + _584;
    bool _588 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _590 = isnan(_566);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _600;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _608 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _610 = isnan(_566);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _616 = _612 || _614;
    float _618 = float(_616);
    float _620 = -_582;
    float _622 = _620 + 1.0;
    float _624 = 1.0 / _606;
    float _626 = _618 * _622;
    float _628 = -_618;
    float _630 = _628 + 1.0;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _632;
    bool _636 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _638 = 1.0 / _602;
    float _640 = _598 * _630;
    float _642 = -_598;
    float _644 = _642 + 1.0;
    float _646 = _586 * _624;
    float _648 = _570 * _638;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _650;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _654;
    float _658 = fma(_634, _648, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _660 = fma(_652, _648, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _662 = fma(_656, _648, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _664 = _658 * _640;
    float _666 = _660 * _640;
    float _668 = _662 * _640;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _676 = _674 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _680 = _678 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _682 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[123].x, _664);
    float _684 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[123].y, _666);
    float _686 = fma(_672, _646, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _688 = fma(_676, _646, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _690 = fma(_680, _646, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _692 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[123].z, _668);
    float _694 = fma(_686, _626, _682);
    float _696 = fma(_688, _626, _684);
    float _698 = fma(_690, _626, _692);
    float _700 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[125].x, _694);
    float _702 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[125].y, _696);
    float _704 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[125].z, _698);
    bool _706 = !_636;
    float _724;
    if (!_706)
    {
        float _708 = in.m_57.x;
        float _710 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _712 = _708 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _714 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _716 = _714 * _710;
        float _718 = floor(_716);
        float _720 = -_718;
        float _722 = _716 + _720;
        _724 = _722;
        _726 = true;
    }
    else
    {
        float _728 = float(_90);
        float _730 = 1.0 / _728;
        float _732 = _124 * _730;
        _724 = _732;
    }
    _726 = false;
    float _734 = _724;
    float _736 = in.m_57.x;
    float _738 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _740 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _742 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _746 = _744 != 0;
    float _748 = in.m_57.y;
    int _750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _752 = _750 != 0;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _760 = _758 != 0;
    float _762 = in.m_57.z;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _766 = _764 != 0;
    float _768 = 1.0 / _756;
    int _770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _772 = _770 != 0;
    float _774 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].x, _738);
    float _776 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].x, _740);
    float _778 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].x, _742);
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _786 = _784 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _788 = _736 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _790 = 1.0 / _782;
    float _792 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].z, _774);
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _796;
    float _800 = in.m_51.x;
    float _802 = _798 * _768;
    float _804 = 1.0 / _786;
    float _806 = -_794;
    float _808 = fma(_788, 2.0, _806);
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _812 = _748 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _814 = _762 > 0.5;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _818;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _824 = _812;
    bool _826 = _814;
    float _828 = _802;
    if (_772)
    {
        _822 = _736;
    }
    float _830 = _822;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _836 = _830;
    if (!_772)
    {
        _836 = _762;
    }
    float _838 = _836;
    float _840 = -_144;
    float _842 = _840 + 1.0;
    float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _846 = fma(_812, -2.0, _810);
    float _848 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].z, _776);
    float _850 = _820 * _804;
    float _852 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].z, _778);
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    if (_772)
    {
        _824 = _748;
    }
    float _856 = _824;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _860 = _814 ? as_type<int>(_842) : as_type<int>(_144);
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _864 = _856;
    if (_746)
    {
        bool _866 = _736 > 0.5;
        _826 = _866;
    }
    bool _868 = _826;
    float _870 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[78].z, _816);
    float _872 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[88].z, _858);
    if (!_772)
    {
        _864 = _736;
    }
    float _874 = _864;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _878 = _734 + _876;
    float _880 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _882 = _834 * _790;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _886 = _734 + _884;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _890 = _734 + _888;
    bool _892 = _748 > 0.5;
    float _894 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[78].w, _854);
    float _896 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[88].w, _862);
    float _898 = fma(_850, _878, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _900 = _734 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _902 = isnan(_734);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    float _912 = fma(_802, _886, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _914 = fma(_882, _890, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _916 = _734 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _918 = isnan(_734);
    bool _920 = _916 || _918;
    bool _922 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _924 = _920 || _922;
    float _926 = float(_924);
    float _928 = _844 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _930 = _760 ? as_type<float>(_860) : _144;
    float _932 = _838 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _934 = _734 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _936 = isnan(_734);
    bool _938 = _934 || _936;
    bool _940 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _942 = _938 || _940;
    float _944 = float(_942);
    float _946 = -_926;
    float _948 = _946 + 1.0;
    int _950 = as_type<int>(_912);
    float _952 = _874;
    if (_766)
    {
        float _954 = _892 ? _842 : _144;
        _192 = _954;
    }
    float _956 = _192;
    float _958 = -_910;
    float _960 = _958 + 1.0;
    bool _962 = _734 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _964 = isnan(_734);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _970 = _966 || _968;
    float _972 = float(_970);
    float _974 = _910 * _948;
    float _976 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _894);
    float _978 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _846);
    float _980 = _972 * _960;
    float _982 = -_972;
    float _984 = _982 + 1.0;
    float _986 = fma(_930, _928, -0.5);
    float _988 = _880 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _990 = _944 * _984;
    float _992 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _994 = fma(_988, _956, -0.5);
    int _996 = as_type<int>(_956);
    if (_746)
    {
        float _998 = -_800;
        float _1000 = _998 + 1.0;
        _996 = as_type<int>(_1000);
    }
    int _1002 = _996;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1008 = -_978;
    float _1010 = fma(_976, _994, _1008);
    float _1012 = _874 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1014 = _912 * _990;
    float _1016 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1018 = as_type<int>(_1010);
    if (_752)
    {
        float _1020 = -_800;
        float _1022 = _1020 + 1.0;
        _950 = as_type<int>(_1022);
    }
    int _1024 = _950;
    if (!_746)
    {
        _828 = _800;
    }
    float _1026 = _828;
    float _1028 = -_944;
    float _1030 = _1028 + 1.0;
    float _1032 = -_1004;
    float _1034 = fma(_932, 2.0, _1032);
    float _1036 = fma(_1012, -2.0, _1006);
    float _1038 = _1026;
    if (_746)
    {
        float _1040 = _868 ? as_type<float>(_1002) : _800;
        _1038 = _1040;
    }
    float _1042 = _1038;
    float _1044 = _848 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1046 = _1042;
    if (!_752)
    {
        _952 = _800;
    }
    float _1048 = _952;
    float _1050 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1014);
    float _1052 = _1048;
    if (_752)
    {
        float _1054 = _892 ? as_type<float>(_1024) : _800;
        _1052 = _1054;
    }
    float _1056 = _1052;
    float _1058 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _870);
    float _1060 = -_124;
    float _1062 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[76].x, _808);
    float _1064 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _872);
    float _1066 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _896);
    float _1068 = -_124;
    float _1070 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1034);
    float _1072 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1036);
    float _1074 = _792 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1076 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1078 = _1044 + _1076;
    float _1080 = fma(_914, _980, _1050);
    float _1082 = _852 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1086 = _1074 + _1084;
    float _1088 = _1078 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1090 = _992 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1092 = _1016 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1094 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1096 = _1082 + _1094;
    float _1098 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1088);
    float _1100 = fma(_1090, _1042, -0.5);
    float _1102 = fma(_1092, _1056, -0.5);
    float _1104 = fma(_898, _974, _1080);
    float _1106 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1098);
    float _1108 = fma(_1058, _1100, _1062);
    float _1110 = _1078 * _1078;
    float _1112 = fma(_1064, _1102, _1070);
    float _1114 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1104);
    bool _1116 = _1106 >= 0.0;
    float _1118 = fma(_1086, _1086, _1110);
    float _1120 = _700 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1122 = _702 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1124 = -_1072;
    float _1126 = fma(_1066, _986, _1124);
    float _1128 = fma(_1096, _1096, _1118);
    float _1130 = _704 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1132 = _1108 + 0.5;
    float _1134 = rsqrt(_1128);
    float _1136 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1138 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1140 = _1130 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1142 = as_type<int>(_1108);
    if (_1116)
    {
        _1046 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1144 = _1046;
    float _1146 = _1010 + 0.5;
    float _1148 = _1126 + 0.5;
    float _1150 = _1112 + 0.5;
    float _1152 = _1114 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_1116)
    {
        float _1154 = _1144 * 5.0;
        _1142 = as_type<int>(_1154);
    }
    int _1156 = _1142;
    out.m_61.x = _1132;
    out.m_61.y = _1146;
    out.m_63.x = _1150;
    out.m_63.y = _1148;
    float _1158 = _1078 * _1134;
    float _1160 = _1086 * _1134;
    out.m_65.x = _1136;
    out.m_65.y = _1138;
    out.m_65.z = _1140;
    out.m_65.w = _1152;
    if (_1116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3719 = as_type<float>(_1156);
        out.gl_Position.z = _3719;
    }
    if (_1116)
    {
        out.m_47.x = 0.0;
    }
    if (_1116)
    {
        return out;
    }
    float _1162 = -_1158;
    float _1164 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1044);
    float _1166 = _1096 * _1134;
    float _1168 = -_1160;
    float _1170 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1074);
    float _1172 = -_1158;
    float _1174 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1078);
    float _1176 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1178 = _1164 + _1176;
    float _1180 = -_1166;
    float _1182 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1082);
    float _1184 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1186 = _1170 + _1184;
    float _1188 = -_1160;
    float _1190 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1086);
    float _1192 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1194 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1196 = _1182 + _1194;
    float _1198 = -_1166;
    float _1200 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1096);
    float _1202 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1192);
    float _1204 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1202);
    bool _1206 = _1204 >= 0.0;
    float _1208 = _1174 * _1174;
    float _1210 = fma(_1190, _1190, _1208);
    float _1212 = fma(_1200, _1200, _1210);
    float _1214 = _1186;
    if (_1206)
    {
        _1214 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1216 = _1214;
    if (_1206)
    {
        out.m_47.x = 0.0;
    }
    if (_1206)
    {
        float _1218 = _1216 * 5.0;
        _1018 = as_type<int>(_1218);
    }
    int _1220 = _1018;
    if (_1206)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3844 = as_type<float>(_1220);
        out.gl_Position.z = _3844;
    }
    if (_1206)
    {
        return out;
    }
    float _1222 = in.m_67.x;
    float _1224 = in.m_67.y;
    float _1226 = in.m_67.z;
    float _1228 = sqrt(_1212);
    float _1230 = _392 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1232 = _390 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1234 = _394 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1236 = _1134 * _1228;
    float _1238 = _1236 * _1230;
    float _1240 = _1236 * _1232;
    float _1242 = _1236 * _1234;
    float _1244 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1224);
    float _1246 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1222);
    float _1248 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1226);
    float _1250 = _1238 * _1244;
    float _1252 = _1240 * _1246;
    float _1254 = _1242 * _1248;
    float _1256 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1258 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1260 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1262 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1256);
    float _1264 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1258);
    float _1266 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1260);
    float _1268 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1262);
    float _1270 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1264);
    float _1272 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1266);
    float _1274 = _1268 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1276 = _1270 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1278 = _1074 + _1274;
    float _1280 = _1082 + _1276;
    float _1282 = _1272 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1284 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1286 = _1278 + _1284;
    float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1290 = _1280 + _1288;
    float _1292 = _1044 + _1282;
    float _1294 = _1286 * _1286;
    float _1296 = _1290 * _1290;
    float _1298 = _1294 + _1296;
    float _1300 = sqrt(_1298);
    bool _1302 = _1300 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1304 = _1282;
    float _1306 = _1252;
    float _1308 = _1294;
    float _1310 = _1278;
    float _1312 = _1280;
    float _1314 = _1300;
    if (!_1302)
    {
        _1304 = _1294;
    }
    float _1316 = _1304;
    float _1318 = _1316;
    if (!_1302)
    {
        _1306 = _1296;
    }
    float _1320 = _1306;
    float _1322 = _1320;
    if (!_1302)
    {
        _1308 = _1292;
    }
    float _1324 = _1308;
    bool _1326 = !_1302;
    float _1328 = _1324;
    if (!_1326)
    {
        float _1330 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1332 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1334 = _1300 + _1332;
        float _1336 = _1292 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1338 = rsqrt(_1298);
        float _1340 = _1334 * _1330;
        float _1342 = _1340 * 0.15915493667125701904296875;
        float _1344 = _1342 * 6.283185482025146484375;
        float _1346 = sin(_1344);
        float _1348 = _1342 * 6.283185482025146484375;
        float _1350 = cos(_1348);
        float _1352 = fma(_1346, _1336, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1354 = _1338 * _1352;
        float _1356 = _1350 + (-1.0);
        float _1358 = fma(_1286, _1354, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1360 = fma(_1290, _1354, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1362 = _1356 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1364 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1366 = _1358 + _1364;
        float _1368 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1370 = _1360 + _1368;
        float _1372 = fma(_1292, _1350, _1362);
        float _1374 = _1366 * _1366;
        float _1376 = _1370 * _1370;
        _1328 = _1372;
        _1318 = _1374;
        _1322 = _1376;
        _1310 = _1358;
        _1312 = _1360;
        _1314 = _1334;
    }
    float _1378 = _1328;
    float _1380 = _1318;
    float _1382 = _1322;
    float _1384 = _1310;
    float _1386 = _1312;
    float _1388 = _1314;
    float _1390 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1392 = _1378 + _1390;
    float _1394 = fma(_1392, _1392, _1380);
    float _1396 = _1394 + _1382;
    float _1398 = sqrt(_1396);
    bool _1400 = _1398 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1402 = isnan(_1398);
    bool _1404 = _1400 || _1402;
    bool _1406 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1408 = _1404 || _1406;
    float _1410 = _1380;
    float _1412 = _1388;
    if (!_1408)
    {
        _1410 = 1.0;
    }
    float _1414 = _1410;
    bool _1416 = !_1408;
    float _1418 = _1414;
    if (!_1416)
    {
        bool _1420 = _1398 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1422 = isnan(_1398);
        bool _1424 = _1420 || _1422;
        bool _1426 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1428 = _1424 || _1426;
        if (!_1428)
        {
            float _1430 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1432 = _1398 + _1430;
            float _1434 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1436 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1434;
            float _1438 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1440 = _1438 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1442 = 1.0 / _1436;
            float _1444 = _1432 * _1442;
            float _1446 = fma(_1444, _1440, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1418 = _1446;
            _1448 = true;
        }
        else
        {
            bool _1450 = _1398 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1452 = isnan(_1398);
            bool _1454 = _1450 || _1452;
            bool _1456 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1458 = _1454 || _1456;
            if (!_1458)
            {
                float _1460 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1462 = _1398 + _1460;
                float _1464 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1466 = _1464 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1468 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1470 = _1468 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1472 = 1.0 / _1466;
                float _1474 = _1462 * _1472;
                float _1476 = fma(_1474, _1470, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1418 = _1476;
                _1448 = true;
            }
            else
            {
                _1418 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1448 = false;
    float _1478 = _1418;
    float _1480 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1482 = _1378 + _1480;
    float _1484 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1486 = _1384 + _1484;
    float _1488 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1490 = _1386 + _1488;
    float _1492 = fma(_1482, _1478, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1494 = fma(_1486, _1478, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1496 = fma(_1490, _1478, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1498 = -_1158;
    float _1500 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1492);
    float _1502 = -_1160;
    float _1504 = fma(_1502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1494);
    float _1506 = -_1166;
    float _1508 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1496);
    float _1510 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1512 = _1500 + _1510;
    float _1514 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1516 = _1504 + _1514;
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1520 = _1508 + _1518;
    float _1522 = _1512 * _1512;
    float _1524 = fma(_1516, _1516, _1522);
    float _1526 = fma(_1520, _1520, _1524);
    float _1528 = rsqrt(_1526);
    float _1530 = _1528 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1532 = _1516 * _1530;
    float _1534 = _1520 * _1530;
    float _1536 = _1532 * _1532;
    float _1538 = _1534 * _1534;
    float _1540 = _1536 + _1538;
    float _1542 = sqrt(_1540);
    bool _1544 = _1542 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1546 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1548 = _1542 + _1546;
    float _1550 = _1520;
    float _1552 = _1540;
    float _1554 = _1548;
    float _1556 = _1530;
    float _1558 = _1532;
    if (_1544)
    {
        float _1560 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1550 = _1560;
    }
    float _1562 = _1550;
    if (_1544)
    {
        float _1564 = rsqrt(_1540);
        _1552 = _1564;
    }
    float _1566 = _1552;
    if (_1544)
    {
        float _1568 = _1548 * _1562;
        _1554 = _1568;
    }
    float _1570 = _1554;
    if (_1544)
    {
        float _1572 = _1570 * 0.15915493667125701904296875;
        _1412 = _1572;
    }
    float _1574 = _1412;
    float _1576 = _1528;
    float _1578 = _1574;
    if (_1544)
    {
        float _1580 = _1574 * 6.283185482025146484375;
        float _1582 = sin(_1580);
        _1576 = _1582;
    }
    float _1584 = _1576;
    float _1586 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1588 = precise::max(0.0, _1586);
    float _1590 = _1524;
    float _1592 = _1588;
    float _1594 = _1586;
    if (_1544)
    {
        float _1596 = _1574 * 6.283185482025146484375;
        float _1598 = cos(_1596);
        _1590 = _1598;
    }
    float _1600 = _1590;
    float _1602 = -_1530;
    float _1604 = -_1588;
    float _1606 = fma(_1512, _1602, _1604);
    float _1608 = _1606;
    if (!_1544)
    {
        _1592 = _1534;
    }
    float _1610 = _1592;
    float _1612 = _1610;
    if (_1544)
    {
        float _1614 = _1606 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1594 = _1614;
    }
    float _1616 = _1594;
    float _1618 = _1584;
    float _1620 = _1616;
    if (_1544)
    {
        float _1622 = fma(_1584, _1616, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1618 = _1622;
    }
    float _1624 = _1618;
    float _1626 = _1624;
    if (_1544)
    {
        float _1628 = _1600 + (-1.0);
        _1620 = _1628;
    }
    float _1630 = _1620;
    float _1632 = _1630;
    if (_1544)
    {
        float _1634 = _1566 * _1624;
        _1556 = _1634;
    }
    float _1636 = _1556;
    if (!_1544)
    {
        _1626 = _1606;
    }
    float _1638 = _1626;
    float _1640 = sqrt(_1526);
    float _1642 = _1638;
    if (_1544)
    {
        float _1644 = _1630 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1578 = _1644;
    }
    float _1646 = _1578;
    if (_1544)
    {
        float _1648 = _1532 * _1636;
        _1558 = _1648;
    }
    float _1650 = _1558;
    if (!_1544)
    {
        _1632 = _1536;
    }
    float _1652 = _1632;
    float _1654 = _1652;
    if (_1544)
    {
        float _1656 = _1534 * _1636;
        _1612 = _1656;
    }
    float _1658 = _1612;
    if (_1544)
    {
        float _1660 = fma(_1606, _1600, _1646);
        _1642 = _1660;
    }
    float _1662 = _1642;
    if (_1544)
    {
        float _1664 = _1650 * _1650;
        _1654 = _1664;
    }
    float _1666 = _1654;
    if (!_1544)
    {
        _1608 = _1538;
    }
    float _1668 = _1608;
    float _1670 = _1668;
    if (_1544)
    {
        float _1672 = _1658 * _1658;
        _1670 = _1672;
    }
    float _1674 = _1670;
    float _1676 = fma(_1662, _1662, _1666);
    float _1678 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1680 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1682 = _1676 + _1674;
    float _1684 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1678);
    float _1686 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1688 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1690 = fma(_1640, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1688);
    float _1692 = precise::clamp(_1690, 0.0, 1.0);
    float _1694 = rsqrt(_1682);
    float _1696 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1684);
    float _1698 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1686);
    float _1700 = -_1692;
    float _1702 = _1700 + 1.0;
    float _1704 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1706 = _1696 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1708 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1680);
    float _1710 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1698);
    float _1712 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1714 = _1706 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1716 = abs(_1702);
    float _1718 = log2(_1716);
    float _1720 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1704);
    float _1722 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1708);
    float _1724 = _1710 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1726 = -_1714;
    float _1728 = fma(_1726, _1712, 1.0);
    float _1730 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1720);
    float _1732 = _1694 * _1650;
    float _1734 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1736 = _1724 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1738 = _1694 * _1662;
    float _1740 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1742 = _1694 * _1658;
    float _1744 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1736);
    float _1746 = _1730 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1748 = -_1740;
    float _1750 = fma(_1738, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1748);
    float _1752 = log2(_1728);
    float _1754 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1744);
    float _1756 = _1718 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1758 = -_1742;
    float _1760 = fma(_1758, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1750);
    float _1762 = _1724 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1764 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1754);
    float _1766 = _1724 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1768 = fma(_1760, -0.5, 0.5);
    float _1770 = exp2(_1756);
    float _1772 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1762);
    float _1774 = fma(_1760, 0.5, 0.5);
    float _1776 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1766);
    float _1778 = _1738 + 1.0;
    float _1780 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1772);
    float _1782 = 1.0 / _1764;
    float _1784 = fma(_1774, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1786 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1776);
    float _1788 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1780);
    float _1790 = fma(_1774, _1784, -0.212114393711090087890625);
    float _1792 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1786);
    float _1794 = sqrt(_1768);
    float _1796 = -_1738;
    float _1798 = fma(_1770, _1778, _1796);
    float _1800 = _1752 * 0.693147182464599609375;
    float _1802 = fma(_1774, _1790, 1.570728778839111328125);
    float _1804 = fma(_1798, 0.5, 0.5);
    float _1806 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1808 = _1788 * _1782;
    float _1810 = _1792 * _1782;
    float _1812 = fma(_1808, 0.5, 0.5);
    float _1814 = fma(_1810, -0.5, 0.5);
    float _1816 = _1794 * 0.636619746685028076171875;
    float3 _4832 = float3(_1812, _1814, _1806);
    float _1818 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4832, float3(0.0), isnan(_4832)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4832, float3(0.0), isnan(_4832)), level(0.0)).x;
    float _1820 = -_1802;
    float _1822 = fma(_1816, _1820, 1.0);
    float3 _4848 = float3(_1812, _1814, _1806);
    float4 _1825 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4848, float3(0.0), isnan(_4848)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4848, float3(0.0), isnan(_4848)), level(0.0)).xyzw;
    float _1827 = _1825.x;
    float _1829 = _1825.y;
    float _1831 = _1825.z;
    float _1833 = _1825.w;
    float2 _4865 = float2(_1822, _1804);
    float3 _1837 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4865, float2(0.0), isnan(_4865)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4865, float2(0.0), isnan(_4865)), level(0.0)).xyz;
    float _1839 = _1837.x;
    float _1841 = _1837.y;
    float _1843 = _1837.z;
    float _1845 = _1718 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1847 = _1724 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1849 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1847);
    float _1851 = exp2(_1845);
    float _1853 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1849);
    float _1855 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1853);
    float _1857 = _1855 + _1764;
    float _1859 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1788;
    out.gl_Position.y = _1792;
    out.gl_Position.z = _1855;
    out.gl_Position.w = _1764;
    float _1861 = _1857 * 0.5;
    float _1863 = -_1851;
    float _1865 = _1863 + 1.0;
    out.m_47.x = _1859;
    float _1867 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _1861;
    out.m_69.w = _1764;
    float _1869 = _1867 * _1818;
    float _1871 = -_1867;
    float _1873 = _1871 + 1.0;
    float _1875 = _1833 * _1869;
    float _1877 = _1833 * _1873;
    float _1879 = _1843 * _1869;
    float _1881 = fma(_1839, _1875, _1827);
    float _1883 = fma(_1841, _1875, _1829);
    float _1885 = fma(_1833, _1879, _1831);
    out.m_71.x = _1881;
    out.m_71.y = _1883;
    out.m_71.z = _1885;
    out.m_71.w = _1877;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1448 = false;
    bool _726 = false;
    bool _558 = false;
    bool _416 = false;
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
        float _1942 = as_type<float>(_106);
        out.gl_Position.z = _1942;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_49.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_120)
    {
        float _126 = float(_90);
        _100 = _126;
    }
    float _128 = _100;
    bool _130 = _124 >= _128;
    bool _132 = !_120;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_47.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _108 = as_type<int>(_140);
    }
    int _142 = _108;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2011 = as_type<float>(_142);
        out.gl_Position.z = _2011;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_51.y;
    float _146 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _148 = in.m_53.w;
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
    float _174 = _146;
    if (!_158)
    {
        float _176 = _146 * _146;
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
    out.m_55.y = _144;
    bool _188 = !_158;
    float _190 = _186;
    float _192 = _144;
    if (!_188)
    {
        float _194 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = log2(_194);
        float _198 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _200 = _198 + 1.0;
        float _202 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = _146 * _196;
        float _206 = 1.0 / _200;
        float _208 = _202 * 0.693147182464599609375;
        float _210 = exp2(_204);
        float _212 = 1.0 / _208;
        float _214 = _210 + (-1.0);
        float _216 = -_214;
        float _218 = fma(_216, _212, _146);
        float _220 = _218 * _206;
        float _222 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _222;
    }
    float _224 = _190;
    bool _226 = !_158;
    if (!_226)
    {
        float _228 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = log2(_228);
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _234 = _232 + 1.0;
        float _236 = 1.0 / _234;
        float _238 = _146 * _230;
        float _240 = exp2(_238);
        float _242 = -_240;
        float _244 = _242 + 1.0;
        float _246 = _244 * _236;
        _174 = _246;
    }
    float _248 = _174;
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _252 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _254 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _256 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _258 = fma(_248, _162, _252);
    float _260 = fma(_248, _160, _254);
    float _262 = fma(_248, _164, _256);
    float _264 = fma(_258, _148, _168);
    float _266 = fma(_260, _148, _166);
    float _268 = fma(_262, _148, _170);
    bool _270 = !_250;
    float _288;
    if (!_270)
    {
        float _272 = in.m_57.x;
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
    float _320 = 1.0 / _318;
    bool _322 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _324 = isnan(_298);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    float _334 = -_314;
    float _336 = _334 + 1.0;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _342;
    bool _346 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _348;
    float _352 = _332 * _336;
    float _354 = -_332;
    float _356 = _354 + 1.0;
    float _358 = _302 * _320;
    float _360 = in.m_53.x;
    float _362 = in.m_53.y;
    float _364 = in.m_53.z;
    float _366 = fma(_340, _358, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _368 = fma(_350, _358, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _370 = fma(_344, _358, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _372 = _366 * _352;
    float _374 = _368 * _352;
    float _376 = _370 * _352;
    float _378 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[143].x, _372);
    float _380 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[143].y, _374);
    float _382 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[143].z, _376);
    float _384 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[144].x, _378);
    float _386 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[144].y, _380);
    float _388 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[144].z, _382);
    float _390 = _384 * _360;
    float _392 = _386 * _362;
    float _394 = _388 * _364;
    bool _396 = !_346;
    float _414;
    if (!_396)
    {
        float _398 = in.m_57.x;
        float _400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _402 = _398 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _404 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _406 = _404 * _400;
        float _408 = floor(_406);
        float _410 = -_408;
        float _412 = _406 + _410;
        _414 = _412;
        _416 = true;
    }
    else
    {
        float _418 = float(_90);
        float _420 = 1.0 / _418;
        float _422 = _124 * _420;
        _414 = _422;
    }
    _416 = false;
    float _424 = _414;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _428 = _424 + _426;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _434 = _424 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _436 = isnan(_424);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _450 = _424 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _452 = isnan(_424);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _462;
    bool _466 = _424 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _468 = isnan(_424);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = 1.0 / _432;
    float _480 = -_444;
    float _482 = _480 + 1.0;
    bool _484 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _486 = _460 * _482;
    float _488 = -_460;
    float _490 = _488 + 1.0;
    float _492 = 1.0 / _448;
    float _494 = _464 * _478;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _500 = fma(_494, _428, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _502 = _498 * _492;
    float _504 = _500 * _486;
    float _506 = -_476;
    float _508 = _506 + 1.0;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _512 = _424 + _510;
    float _514 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[115].x, _504);
    float _516 = _444 * _508;
    float _518 = fma(_502, _512, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _522 = fma(_518, _516, _514);
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _528 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[117].x, _522);
    float _530 = _520 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _532 = _524 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _534 = _526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _536 = _528 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _530;
    out.m_59.y = _532;
    out.m_59.z = _534;
    out.m_59.w = _536;
    bool _538 = !_484;
    float _556;
    if (!_538)
    {
        float _540 = in.m_57.x;
        float _542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _544 = _540 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _546 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _548 = _546 * _542;
        float _550 = floor(_548);
        float _552 = -_550;
        float _554 = _548 + _552;
        _556 = _554;
        _558 = true;
    }
    else
    {
        float _560 = float(_90);
        float _562 = 1.0 / _560;
        float _564 = _124 * _562;
        _556 = _564;
    }
    _558 = false;
    float _566 = _556;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _570 = _566 + _568;
    bool _572 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _574 = isnan(_566);
    bool _576 = _572 || _574;
    bool _578 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _580 = _576 || _578;
    float _582 = float(_580);
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _586 = _566 + _584;
    bool _588 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _590 = isnan(_566);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _600;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _608 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _610 = isnan(_566);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _616 = _612 || _614;
    float _618 = float(_616);
    float _620 = -_582;
    float _622 = _620 + 1.0;
    float _624 = 1.0 / _606;
    float _626 = _618 * _622;
    float _628 = -_618;
    float _630 = _628 + 1.0;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _632;
    bool _636 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _638 = 1.0 / _602;
    float _640 = _598 * _630;
    float _642 = -_598;
    float _644 = _642 + 1.0;
    float _646 = _586 * _624;
    float _648 = _570 * _638;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _650;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _654;
    float _658 = fma(_634, _648, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _660 = fma(_652, _648, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _662 = fma(_656, _648, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _664 = _658 * _640;
    float _666 = _660 * _640;
    float _668 = _662 * _640;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _676 = _674 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _680 = _678 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _682 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[123].x, _664);
    float _684 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[123].y, _666);
    float _686 = fma(_672, _646, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _688 = fma(_676, _646, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _690 = fma(_680, _646, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _692 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[123].z, _668);
    float _694 = fma(_686, _626, _682);
    float _696 = fma(_688, _626, _684);
    float _698 = fma(_690, _626, _692);
    float _700 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[125].x, _694);
    float _702 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[125].y, _696);
    float _704 = fma(_582, (*spvDescriptorSet0.vp_c9)._m0[125].z, _698);
    bool _706 = !_636;
    float _724;
    if (!_706)
    {
        float _708 = in.m_57.x;
        float _710 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _712 = _708 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _714 = fma(_712, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _716 = _714 * _710;
        float _718 = floor(_716);
        float _720 = -_718;
        float _722 = _716 + _720;
        _724 = _722;
        _726 = true;
    }
    else
    {
        float _728 = float(_90);
        float _730 = 1.0 / _728;
        float _732 = _124 * _730;
        _724 = _732;
    }
    _726 = false;
    float _734 = _724;
    float _736 = in.m_57.x;
    float _738 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _740 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _742 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _746 = _744 != 0;
    float _748 = in.m_57.y;
    int _750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _752 = _750 != 0;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _760 = _758 != 0;
    float _762 = in.m_57.z;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _766 = _764 != 0;
    float _768 = 1.0 / _756;
    int _770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _772 = _770 != 0;
    float _774 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].x, _738);
    float _776 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].x, _740);
    float _778 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].x, _742);
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _786 = _784 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _788 = _736 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _790 = 1.0 / _782;
    float _792 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].z, _774);
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _796;
    float _800 = in.m_51.x;
    float _802 = _798 * _768;
    float _804 = 1.0 / _786;
    float _806 = -_794;
    float _808 = fma(_788, 2.0, _806);
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _812 = _748 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _814 = _762 > 0.5;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _818;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _824 = _812;
    bool _826 = _814;
    float _828 = _802;
    if (_772)
    {
        _822 = _736;
    }
    float _830 = _822;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _836 = _830;
    if (!_772)
    {
        _836 = _762;
    }
    float _838 = _836;
    float _840 = -_144;
    float _842 = _840 + 1.0;
    float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _846 = fma(_812, -2.0, _810);
    float _848 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].z, _776);
    float _850 = _820 * _804;
    float _852 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].z, _778);
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    if (_772)
    {
        _824 = _748;
    }
    float _856 = _824;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _860 = _814 ? as_type<int>(_842) : as_type<int>(_144);
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _864 = _856;
    if (_746)
    {
        bool _866 = _736 > 0.5;
        _826 = _866;
    }
    bool _868 = _826;
    float _870 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[78].z, _816);
    float _872 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[88].z, _858);
    if (!_772)
    {
        _864 = _736;
    }
    float _874 = _864;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _878 = _734 + _876;
    float _880 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _882 = _834 * _790;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _886 = _734 + _884;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _890 = _734 + _888;
    bool _892 = _748 > 0.5;
    float _894 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[78].w, _854);
    float _896 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[88].w, _862);
    float _898 = fma(_850, _878, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _900 = _734 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _902 = isnan(_734);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    float _912 = fma(_802, _886, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _914 = fma(_882, _890, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _916 = _734 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _918 = isnan(_734);
    bool _920 = _916 || _918;
    bool _922 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _924 = _920 || _922;
    float _926 = float(_924);
    float _928 = _844 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _930 = _760 ? as_type<float>(_860) : _144;
    float _932 = _838 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _934 = _734 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _936 = isnan(_734);
    bool _938 = _934 || _936;
    bool _940 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _942 = _938 || _940;
    float _944 = float(_942);
    float _946 = -_926;
    float _948 = _946 + 1.0;
    int _950 = as_type<int>(_912);
    float _952 = _874;
    if (_766)
    {
        float _954 = _892 ? _842 : _144;
        _192 = _954;
    }
    float _956 = _192;
    float _958 = -_910;
    float _960 = _958 + 1.0;
    bool _962 = _734 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _964 = isnan(_734);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _970 = _966 || _968;
    float _972 = float(_970);
    float _974 = _910 * _948;
    float _976 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _894);
    float _978 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _846);
    float _980 = _972 * _960;
    float _982 = -_972;
    float _984 = _982 + 1.0;
    float _986 = fma(_930, _928, -0.5);
    float _988 = _880 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _990 = _944 * _984;
    float _992 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _994 = fma(_988, _956, -0.5);
    int _996 = as_type<int>(_956);
    if (_746)
    {
        float _998 = -_800;
        float _1000 = _998 + 1.0;
        _996 = as_type<int>(_1000);
    }
    int _1002 = _996;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1008 = -_978;
    float _1010 = fma(_976, _994, _1008);
    float _1012 = _874 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1014 = _912 * _990;
    float _1016 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1018 = as_type<int>(_1010);
    if (_752)
    {
        float _1020 = -_800;
        float _1022 = _1020 + 1.0;
        _950 = as_type<int>(_1022);
    }
    int _1024 = _950;
    if (!_746)
    {
        _828 = _800;
    }
    float _1026 = _828;
    float _1028 = -_944;
    float _1030 = _1028 + 1.0;
    float _1032 = -_1004;
    float _1034 = fma(_932, 2.0, _1032);
    float _1036 = fma(_1012, -2.0, _1006);
    float _1038 = _1026;
    if (_746)
    {
        float _1040 = _868 ? as_type<float>(_1002) : _800;
        _1038 = _1040;
    }
    float _1042 = _1038;
    float _1044 = _848 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1046 = _1042;
    if (!_752)
    {
        _952 = _800;
    }
    float _1048 = _952;
    float _1050 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1014);
    float _1052 = _1048;
    if (_752)
    {
        float _1054 = _892 ? as_type<float>(_1024) : _800;
        _1052 = _1054;
    }
    float _1056 = _1052;
    float _1058 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _870);
    float _1060 = -_124;
    float _1062 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[76].x, _808);
    float _1064 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _872);
    float _1066 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _896);
    float _1068 = -_124;
    float _1070 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1034);
    float _1072 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1036);
    float _1074 = _792 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1076 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1078 = _1044 + _1076;
    float _1080 = fma(_914, _980, _1050);
    float _1082 = _852 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1086 = _1074 + _1084;
    float _1088 = _1078 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1090 = _992 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1092 = _1016 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1094 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1096 = _1082 + _1094;
    float _1098 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1088);
    float _1100 = fma(_1090, _1042, -0.5);
    float _1102 = fma(_1092, _1056, -0.5);
    float _1104 = fma(_898, _974, _1080);
    float _1106 = fma(_1096, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1098);
    float _1108 = fma(_1058, _1100, _1062);
    float _1110 = _1078 * _1078;
    float _1112 = fma(_1064, _1102, _1070);
    float _1114 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1104);
    bool _1116 = _1106 >= 0.0;
    float _1118 = fma(_1086, _1086, _1110);
    float _1120 = _700 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1122 = _702 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1124 = -_1072;
    float _1126 = fma(_1066, _986, _1124);
    float _1128 = fma(_1096, _1096, _1118);
    float _1130 = _704 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1132 = _1108 + 0.5;
    float _1134 = rsqrt(_1128);
    float _1136 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1138 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1140 = _1130 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1142 = as_type<int>(_1108);
    if (_1116)
    {
        _1046 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1144 = _1046;
    float _1146 = _1010 + 0.5;
    float _1148 = _1126 + 0.5;
    float _1150 = _1112 + 0.5;
    float _1152 = _1114 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_1116)
    {
        float _1154 = _1144 * 5.0;
        _1142 = as_type<int>(_1154);
    }
    int _1156 = _1142;
    out.m_61.x = _1132;
    out.m_61.y = _1146;
    out.m_63.x = _1150;
    out.m_63.y = _1148;
    float _1158 = _1078 * _1134;
    float _1160 = _1086 * _1134;
    out.m_65.x = _1136;
    out.m_65.y = _1138;
    out.m_65.z = _1140;
    out.m_65.w = _1152;
    if (_1116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3719 = as_type<float>(_1156);
        out.gl_Position.z = _3719;
    }
    if (_1116)
    {
        out.m_47.x = 0.0;
    }
    if (_1116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1162 = -_1158;
    float _1164 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1044);
    float _1166 = _1096 * _1134;
    float _1168 = -_1160;
    float _1170 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1074);
    float _1172 = -_1158;
    float _1174 = fma(_1172, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1078);
    float _1176 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1178 = _1164 + _1176;
    float _1180 = -_1166;
    float _1182 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1082);
    float _1184 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1186 = _1170 + _1184;
    float _1188 = -_1160;
    float _1190 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1086);
    float _1192 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1194 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1196 = _1182 + _1194;
    float _1198 = -_1166;
    float _1200 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1096);
    float _1202 = fma(_1186, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1192);
    float _1204 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1202);
    bool _1206 = _1204 >= 0.0;
    float _1208 = _1174 * _1174;
    float _1210 = fma(_1190, _1190, _1208);
    float _1212 = fma(_1200, _1200, _1210);
    float _1214 = _1186;
    if (_1206)
    {
        _1214 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1216 = _1214;
    if (_1206)
    {
        out.m_47.x = 0.0;
    }
    if (_1206)
    {
        float _1218 = _1216 * 5.0;
        _1018 = as_type<int>(_1218);
    }
    int _1220 = _1018;
    if (_1206)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3844 = as_type<float>(_1220);
        out.gl_Position.z = _3844;
    }
    if (_1206)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1222 = in.m_67.x;
    float _1224 = in.m_67.y;
    float _1226 = in.m_67.z;
    float _1228 = sqrt(_1212);
    float _1230 = _392 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1232 = _390 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1234 = _394 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1236 = _1134 * _1228;
    float _1238 = _1236 * _1230;
    float _1240 = _1236 * _1232;
    float _1242 = _1236 * _1234;
    float _1244 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1224);
    float _1246 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1222);
    float _1248 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1226);
    float _1250 = _1238 * _1244;
    float _1252 = _1240 * _1246;
    float _1254 = _1242 * _1248;
    float _1256 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1258 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1260 = _1250 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1262 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1256);
    float _1264 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1258);
    float _1266 = fma(_1252, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1260);
    float _1268 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1262);
    float _1270 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1264);
    float _1272 = fma(_1254, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1266);
    float _1274 = _1268 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1276 = _1270 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1278 = _1074 + _1274;
    float _1280 = _1082 + _1276;
    float _1282 = _1272 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1284 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1286 = _1278 + _1284;
    float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1290 = _1280 + _1288;
    float _1292 = _1044 + _1282;
    float _1294 = _1286 * _1286;
    float _1296 = _1290 * _1290;
    float _1298 = _1294 + _1296;
    float _1300 = sqrt(_1298);
    bool _1302 = _1300 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1304 = _1282;
    float _1306 = _1252;
    float _1308 = _1294;
    float _1310 = _1278;
    float _1312 = _1280;
    float _1314 = _1300;
    if (!_1302)
    {
        _1304 = _1294;
    }
    float _1316 = _1304;
    float _1318 = _1316;
    if (!_1302)
    {
        _1306 = _1296;
    }
    float _1320 = _1306;
    float _1322 = _1320;
    if (!_1302)
    {
        _1308 = _1292;
    }
    float _1324 = _1308;
    bool _1326 = !_1302;
    float _1328 = _1324;
    if (!_1326)
    {
        float _1330 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1332 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1334 = _1300 + _1332;
        float _1336 = _1292 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1338 = rsqrt(_1298);
        float _1340 = _1334 * _1330;
        float _1342 = _1340 * 0.15915493667125701904296875;
        float _1344 = _1342 * 6.283185482025146484375;
        float _1346 = sin(_1344);
        float _1348 = _1342 * 6.283185482025146484375;
        float _1350 = cos(_1348);
        float _1352 = fma(_1346, _1336, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1354 = _1338 * _1352;
        float _1356 = _1350 + (-1.0);
        float _1358 = fma(_1286, _1354, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1360 = fma(_1290, _1354, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1362 = _1356 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1364 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1366 = _1358 + _1364;
        float _1368 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1370 = _1360 + _1368;
        float _1372 = fma(_1292, _1350, _1362);
        float _1374 = _1366 * _1366;
        float _1376 = _1370 * _1370;
        _1328 = _1372;
        _1318 = _1374;
        _1322 = _1376;
        _1310 = _1358;
        _1312 = _1360;
        _1314 = _1334;
    }
    float _1378 = _1328;
    float _1380 = _1318;
    float _1382 = _1322;
    float _1384 = _1310;
    float _1386 = _1312;
    float _1388 = _1314;
    float _1390 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1392 = _1378 + _1390;
    float _1394 = fma(_1392, _1392, _1380);
    float _1396 = _1394 + _1382;
    float _1398 = sqrt(_1396);
    bool _1400 = _1398 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1402 = isnan(_1398);
    bool _1404 = _1400 || _1402;
    bool _1406 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1408 = _1404 || _1406;
    float _1410 = _1380;
    float _1412 = _1388;
    if (!_1408)
    {
        _1410 = 1.0;
    }
    float _1414 = _1410;
    bool _1416 = !_1408;
    float _1418 = _1414;
    if (!_1416)
    {
        bool _1420 = _1398 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1422 = isnan(_1398);
        bool _1424 = _1420 || _1422;
        bool _1426 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1428 = _1424 || _1426;
        if (!_1428)
        {
            float _1430 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1432 = _1398 + _1430;
            float _1434 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1436 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1434;
            float _1438 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1440 = _1438 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1442 = 1.0 / _1436;
            float _1444 = _1432 * _1442;
            float _1446 = fma(_1444, _1440, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1418 = _1446;
            _1448 = true;
        }
        else
        {
            bool _1450 = _1398 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1452 = isnan(_1398);
            bool _1454 = _1450 || _1452;
            bool _1456 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1458 = _1454 || _1456;
            if (!_1458)
            {
                float _1460 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1462 = _1398 + _1460;
                float _1464 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1466 = _1464 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1468 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1470 = _1468 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1472 = 1.0 / _1466;
                float _1474 = _1462 * _1472;
                float _1476 = fma(_1474, _1470, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1418 = _1476;
                _1448 = true;
            }
            else
            {
                _1418 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1448 = false;
    float _1478 = _1418;
    float _1480 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1482 = _1378 + _1480;
    float _1484 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1486 = _1384 + _1484;
    float _1488 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1490 = _1386 + _1488;
    float _1492 = fma(_1482, _1478, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1494 = fma(_1486, _1478, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1496 = fma(_1490, _1478, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1498 = -_1158;
    float _1500 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1492);
    float _1502 = -_1160;
    float _1504 = fma(_1502, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1494);
    float _1506 = -_1166;
    float _1508 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1496);
    float _1510 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1512 = _1500 + _1510;
    float _1514 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1516 = _1504 + _1514;
    float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1520 = _1508 + _1518;
    float _1522 = _1512 * _1512;
    float _1524 = fma(_1516, _1516, _1522);
    float _1526 = fma(_1520, _1520, _1524);
    float _1528 = rsqrt(_1526);
    float _1530 = _1528 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1532 = _1516 * _1530;
    float _1534 = _1520 * _1530;
    float _1536 = _1532 * _1532;
    float _1538 = _1534 * _1534;
    float _1540 = _1536 + _1538;
    float _1542 = sqrt(_1540);
    bool _1544 = _1542 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1546 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1548 = _1542 + _1546;
    float _1550 = _1520;
    float _1552 = _1540;
    float _1554 = _1548;
    float _1556 = _1530;
    float _1558 = _1532;
    if (_1544)
    {
        float _1560 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1550 = _1560;
    }
    float _1562 = _1550;
    if (_1544)
    {
        float _1564 = rsqrt(_1540);
        _1552 = _1564;
    }
    float _1566 = _1552;
    if (_1544)
    {
        float _1568 = _1548 * _1562;
        _1554 = _1568;
    }
    float _1570 = _1554;
    if (_1544)
    {
        float _1572 = _1570 * 0.15915493667125701904296875;
        _1412 = _1572;
    }
    float _1574 = _1412;
    float _1576 = _1528;
    float _1578 = _1574;
    if (_1544)
    {
        float _1580 = _1574 * 6.283185482025146484375;
        float _1582 = sin(_1580);
        _1576 = _1582;
    }
    float _1584 = _1576;
    float _1586 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1588 = precise::max(0.0, _1586);
    float _1590 = _1524;
    float _1592 = _1588;
    float _1594 = _1586;
    if (_1544)
    {
        float _1596 = _1574 * 6.283185482025146484375;
        float _1598 = cos(_1596);
        _1590 = _1598;
    }
    float _1600 = _1590;
    float _1602 = -_1530;
    float _1604 = -_1588;
    float _1606 = fma(_1512, _1602, _1604);
    float _1608 = _1606;
    if (!_1544)
    {
        _1592 = _1534;
    }
    float _1610 = _1592;
    float _1612 = _1610;
    if (_1544)
    {
        float _1614 = _1606 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1594 = _1614;
    }
    float _1616 = _1594;
    float _1618 = _1584;
    float _1620 = _1616;
    if (_1544)
    {
        float _1622 = fma(_1584, _1616, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1618 = _1622;
    }
    float _1624 = _1618;
    float _1626 = _1624;
    if (_1544)
    {
        float _1628 = _1600 + (-1.0);
        _1620 = _1628;
    }
    float _1630 = _1620;
    float _1632 = _1630;
    if (_1544)
    {
        float _1634 = _1566 * _1624;
        _1556 = _1634;
    }
    float _1636 = _1556;
    if (!_1544)
    {
        _1626 = _1606;
    }
    float _1638 = _1626;
    float _1640 = sqrt(_1526);
    float _1642 = _1638;
    if (_1544)
    {
        float _1644 = _1630 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1578 = _1644;
    }
    float _1646 = _1578;
    if (_1544)
    {
        float _1648 = _1532 * _1636;
        _1558 = _1648;
    }
    float _1650 = _1558;
    if (!_1544)
    {
        _1632 = _1536;
    }
    float _1652 = _1632;
    float _1654 = _1652;
    if (_1544)
    {
        float _1656 = _1534 * _1636;
        _1612 = _1656;
    }
    float _1658 = _1612;
    if (_1544)
    {
        float _1660 = fma(_1606, _1600, _1646);
        _1642 = _1660;
    }
    float _1662 = _1642;
    if (_1544)
    {
        float _1664 = _1650 * _1650;
        _1654 = _1664;
    }
    float _1666 = _1654;
    if (!_1544)
    {
        _1608 = _1538;
    }
    float _1668 = _1608;
    float _1670 = _1668;
    if (_1544)
    {
        float _1672 = _1658 * _1658;
        _1670 = _1672;
    }
    float _1674 = _1670;
    float _1676 = fma(_1662, _1662, _1666);
    float _1678 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1680 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1682 = _1676 + _1674;
    float _1684 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1678);
    float _1686 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1688 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1690 = fma(_1640, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1688);
    float _1692 = precise::clamp(_1690, 0.0, 1.0);
    float _1694 = rsqrt(_1682);
    float _1696 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1684);
    float _1698 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1686);
    float _1700 = -_1692;
    float _1702 = _1700 + 1.0;
    float _1704 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1706 = _1696 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1708 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1680);
    float _1710 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1698);
    float _1712 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1714 = _1706 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1716 = abs(_1702);
    float _1718 = log2(_1716);
    float _1720 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1704);
    float _1722 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1708);
    float _1724 = _1710 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1726 = -_1714;
    float _1728 = fma(_1726, _1712, 1.0);
    float _1730 = fma(_1508, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1720);
    float _1732 = _1694 * _1650;
    float _1734 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1736 = _1724 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1738 = _1694 * _1662;
    float _1740 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1742 = _1694 * _1658;
    float _1744 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1736);
    float _1746 = _1730 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1748 = -_1740;
    float _1750 = fma(_1738, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1748);
    float _1752 = log2(_1728);
    float _1754 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1744);
    float _1756 = _1718 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1758 = -_1742;
    float _1760 = fma(_1758, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1750);
    float _1762 = _1724 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1764 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1754);
    float _1766 = _1724 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1768 = fma(_1760, -0.5, 0.5);
    float _1770 = exp2(_1756);
    float _1772 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1762);
    float _1774 = fma(_1760, 0.5, 0.5);
    float _1776 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1766);
    float _1778 = _1738 + 1.0;
    float _1780 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1772);
    float _1782 = 1.0 / _1764;
    float _1784 = fma(_1774, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1786 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1776);
    float _1788 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1780);
    float _1790 = fma(_1774, _1784, -0.212114393711090087890625);
    float _1792 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1786);
    float _1794 = sqrt(_1768);
    float _1796 = -_1738;
    float _1798 = fma(_1770, _1778, _1796);
    float _1800 = _1752 * 0.693147182464599609375;
    float _1802 = fma(_1774, _1790, 1.570728778839111328125);
    float _1804 = fma(_1798, 0.5, 0.5);
    float _1806 = _1800 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1808 = _1788 * _1782;
    float _1810 = _1792 * _1782;
    float _1812 = fma(_1808, 0.5, 0.5);
    float _1814 = fma(_1810, -0.5, 0.5);
    float _1816 = _1794 * 0.636619746685028076171875;
    float3 _4832 = float3(_1812, _1814, _1806);
    float _1818 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4832, float3(0.0), isnan(_4832)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4832, float3(0.0), isnan(_4832)), level(0.0)).x;
    float _1820 = -_1802;
    float _1822 = fma(_1816, _1820, 1.0);
    float3 _4848 = float3(_1812, _1814, _1806);
    float4 _1825 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4848, float3(0.0), isnan(_4848)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4848, float3(0.0), isnan(_4848)), level(0.0)).xyzw;
    float _1827 = _1825.x;
    float _1829 = _1825.y;
    float _1831 = _1825.z;
    float _1833 = _1825.w;
    float2 _4865 = float2(_1822, _1804);
    float3 _1837 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4865, float2(0.0), isnan(_4865)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4865, float2(0.0), isnan(_4865)), level(0.0)).xyz;
    float _1839 = _1837.x;
    float _1841 = _1837.y;
    float _1843 = _1837.z;
    float _1845 = _1718 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1847 = _1724 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1849 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1847);
    float _1851 = exp2(_1845);
    float _1853 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1849);
    float _1855 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1853);
    float _1857 = _1855 + _1764;
    float _1859 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1788;
    out.gl_Position.y = _1792;
    out.gl_Position.z = _1855;
    out.gl_Position.w = _1764;
    float _1861 = _1857 * 0.5;
    float _1863 = -_1851;
    float _1865 = _1863 + 1.0;
    out.m_47.x = _1859;
    float _1867 = _1865 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _1861;
    out.m_69.w = _1764;
    float _1869 = _1867 * _1818;
    float _1871 = -_1867;
    float _1873 = _1871 + 1.0;
    float _1875 = _1833 * _1869;
    float _1877 = _1833 * _1873;
    float _1879 = _1843 * _1869;
    float _1881 = fma(_1839, _1875, _1827);
    float _1883 = fma(_1841, _1875, _1829);
    float _1885 = fma(_1833, _1879, _1831);
    out.m_71.x = _1881;
    out.m_71.y = _1883;
    out.m_71.z = _1885;
    out.m_71.w = _1877;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

