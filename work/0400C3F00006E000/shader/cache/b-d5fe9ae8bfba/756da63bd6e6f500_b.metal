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
    float4 m_53 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_73 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_75 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_57 [[attribute(2)]];
    float4 m_59 [[attribute(3)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_71 [[attribute(8)]];
    float4 m_51 [[attribute(9)]];
    float4 m_49 [[attribute(10)]];
    float4 m_61 [[attribute(11)]];
    float4 m_63 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _558 = false;
    bool _416 = false;
    bool _290 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_45.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1634 = as_type<float>(_110);
        out.gl_Position.z = _1634;
    }
    if (!_98)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _114 = in.m_47.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _130 = 0.0;
    if (_124)
    {
        float _132 = float(_94);
        _130 = _132;
    }
    float _134 = _130;
    bool _136 = _128 >= _134;
    bool _138 = !_124;
    bool _140 = _136 || _138;
    if (_140)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _104;
    if (_140)
    {
        out.m_45.x = 0.0;
    }
    if (_140)
    {
        float _144 = _142 * 5.0;
        _112 = as_type<int>(_144);
    }
    int _146 = _112;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1702 = as_type<float>(_146);
        out.gl_Position.z = _1702;
    }
    if (_140)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_49.w;
    float _150 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_47.x;
    float _164 = in.m_47.y;
    float _166 = in.m_47.z;
    float _168 = in.m_42.x;
    float _170 = in.m_42.y;
    float _172 = in.m_42.z;
    float _174 = 0.0;
    float _176 = _150;
    if (!_160)
    {
        float _178 = _150 * _150;
        float _180 = _178 * 0.5;
        _174 = _180;
    }
    float _182 = _174;
    float _184 = _182;
    if (!_160)
    {
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    bool _190 = !_160;
    float _192 = _188;
    if (!_190)
    {
        float _194 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = log2(_194);
        float _198 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _200 = _198 + 1.0;
        float _202 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = _150 * _196;
        float _206 = 1.0 / _200;
        float _208 = _202 * 0.693147182464599609375;
        float _210 = exp2(_204);
        float _212 = 1.0 / _208;
        float _214 = _210 + (-1.0);
        float _216 = -_214;
        float _218 = fma(_216, _212, _150);
        float _220 = _218 * _206;
        float _222 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _222;
    }
    float _224 = _192;
    bool _226 = !_160;
    if (!_226)
    {
        float _228 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = log2(_228);
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _234 = _232 + 1.0;
        float _236 = 1.0 / _234;
        float _238 = _150 * _230;
        float _240 = exp2(_238);
        float _242 = -_240;
        float _244 = _242 + 1.0;
        float _246 = _244 * _236;
        _176 = _246;
    }
    float _248 = _176;
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _252 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _254 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _256 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _258 = fma(_248, _162, _252);
    float _260 = fma(_248, _164, _254);
    float _262 = fma(_248, _166, _256);
    float _264 = fma(_258, _148, _168);
    float _266 = fma(_260, _148, _170);
    float _268 = fma(_262, _148, _172);
    bool _270 = !_250;
    float _288;
    if (!_270)
    {
        float _272 = in.m_51.x;
        float _274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _276 = _272 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _280 = _278 * _274;
        float _282 = floor(_280);
        float _284 = -_282;
        float _286 = _280 + _284;
        _288 = _286;
        _290 = true;
    }
    else
    {
        float _292 = float(_94);
        float _294 = 1.0 / _292;
        float _296 = _128 * _294;
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
    float _320 = -_314;
    float _322 = _320 + 1.0;
    bool _324 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _326 = isnan(_298);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = 1.0 / _318;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _342;
    bool _346 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _348 = _302 * _336;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _350;
    float _354 = in.m_49.x;
    float _356 = in.m_49.y;
    float _358 = in.m_49.z;
    float _360 = _334 * _322;
    float _362 = fma(_340, _348, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _364 = fma(_352, _348, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _366 = fma(_344, _348, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _368 = -_334;
    float _370 = _368 + 1.0;
    float _372 = _362 * _360;
    float _374 = _364 * _360;
    float _376 = _366 * _360;
    float _378 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].x, _372);
    float _380 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].y, _374);
    float _382 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].z, _376);
    float _384 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[144].x, _378);
    float _386 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[144].y, _380);
    float _388 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[144].z, _382);
    float _390 = _384 * _354;
    float _392 = _386 * _356;
    float _394 = _388 * _358;
    bool _396 = !_346;
    float _414;
    if (!_396)
    {
        float _398 = in.m_51.x;
        float _400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _402 = _398 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _404 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _406 = _404 * _400;
        float _408 = floor(_406);
        float _410 = -_408;
        float _412 = _406 + _410;
        _414 = _412;
        _416 = true;
    }
    else
    {
        float _418 = float(_94);
        float _420 = 1.0 / _418;
        float _422 = _128 * _420;
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
    bool _484 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _486 = 1.0 / _448;
    float _488 = _464 * _478;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _494 = -_476;
    float _496 = _494 + 1.0;
    float _498 = fma(_488, _428, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _500 = _460 * _482;
    float _502 = -_460;
    float _504 = _502 + 1.0;
    float _506 = _444 * _496;
    float _508 = _492 * _486;
    float _510 = _498 * _500;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _514 = _424 + _512;
    float _516 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[115].x, _510);
    float _518 = fma(_508, _514, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _522 = fma(_518, _506, _516);
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _528 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[117].x, _522);
    float _530 = _520 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _532 = _524 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _534 = _526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _536 = _528 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _530;
    out.m_53.y = _532;
    out.m_53.z = _534;
    out.m_53.w = _536;
    bool _538 = !_484;
    float _556;
    if (!_538)
    {
        float _540 = in.m_51.x;
        float _542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _544 = _540 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _546 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[11].w, _128);
        float _548 = _546 * _542;
        float _550 = floor(_548);
        float _552 = -_550;
        float _554 = _548 + _552;
        _556 = _554;
        _558 = true;
    }
    else
    {
        float _560 = float(_94);
        float _562 = 1.0 / _560;
        float _564 = _128 * _562;
        _556 = _564;
    }
    _558 = false;
    float _566 = _556;
    float _568 = in.m_51.w;
    float _570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _572 = in.m_55.x;
    float _574 = in.m_55.y;
    float _576 = in.m_55.z;
    float _578 = in.m_55.w;
    int _580 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _582 = _580 != 0;
    int _584 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _586 = _584 != 0;
    float _588 = in.m_57.x;
    float _590 = in.m_57.y;
    float _592 = in.m_57.z;
    float _594 = in.m_57.w;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _598 = _596 != 0;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _602 = _600 != 0;
    float _604 = in.m_59.x;
    float _606 = in.m_59.y;
    float _608 = in.m_59.z;
    float _610 = in.m_59.w;
    float _612 = in.m_51.x;
    float _614 = in.m_51.y;
    bool _616 = _568 > 0.5;
    float _618 = 0.0;
    bool _620 = _616;
    if (_582)
    {
        float _622 = in.m_51.z;
        _618 = _622;
    }
    float _624 = _618;
    float _626 = _266 * _574;
    float _628 = in.m_61.x;
    float _630 = _266 * _590;
    float _632 = fma(_264, _572, _626);
    float _634 = _266 * _606;
    float _636 = fma(_264, _588, _630);
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _644 = _612 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _646 = fma(_264, _604, _634);
    float _648 = 1.0 / _642;
    float _650 = -_638;
    float _652 = fma(_644, 2.0, _650);
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _660 = in.m_61.y;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _666 = _614 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _668 = 1.0 / _658;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _672 = _614 > 0.5;
    float _674 = fma(_666, -2.0, _654);
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _678 = fma(_268, _576, _632);
    float _680 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[78].z, _670);
    float _682 = 1.0 / _664;
    float _684 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[78].w, _676);
    float _686 = fma(_268, _608, _646);
    float _688 = fma(_268, _592, _636);
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _692 = _566 + _690;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _694;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _702;
    bool _706 = false;
    int _708 = as_type<int>(_578);
    if (_586)
    {
        bool _710 = _612 > 0.5;
        _706 = _710;
    }
    bool _712 = _706;
    float _714 = _696 * _648;
    bool _716 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _718 = isnan(_566);
    bool _720 = _716 || _718;
    bool _722 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _724 = _720 || _722;
    float _726 = float(_724);
    float _728 = _700 * _668;
    float _730 = -_660;
    float _732 = _730 + 1.0;
    float _734 = -_128;
    float _736 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[76].x, _652);
    float _738 = fma(_714, _692, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _740 = _704 * _682;
    float _742 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _674);
    float _744 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _680);
    float _746 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _684);
    bool _748 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _750 = isnan(_566);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = -_726;
    float _762 = _760 + 1.0;
    bool _764 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _766 = isnan(_566);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _778 = _566 + _776;
    int _780 = _616 ? as_type<int>(_732) : as_type<int>(_660);
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _784 = _566 + _782;
    float _786 = _774;
    float _788 = _660;
    if (_582)
    {
        bool _790 = _624 > 0.5;
        _620 = _790;
    }
    bool _792 = _620;
    float _794 = _758 * _762;
    float _796 = -_758;
    float _798 = _796 + 1.0;
    bool _800 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _802 = isnan(_566);
    bool _804 = _800 || _802;
    bool _806 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _808 = _804 || _806;
    float _810 = float(_808);
    float _812 = -_774;
    float _814 = _812 + 1.0;
    float _816 = fma(_728, _778, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _818 = _774 * _798;
    float _820 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _822 = _810 * _814;
    float _824 = -_810;
    float _826 = _824 + 1.0;
    float _828 = _678 + _578;
    int _830 = as_type<int>(_826);
    if (_586)
    {
        float _832 = -_628;
        float _834 = _832 + 1.0;
        _708 = as_type<int>(_834);
    }
    int _836 = _708;
    float _838 = _738 * _822;
    float _840 = _688 + _594;
    if (!_586)
    {
        _786 = _628;
    }
    float _842 = _786;
    float _844 = fma(_740, _784, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _846 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[131].x, _838);
    float _848 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _850 = _840 + _848;
    float _852 = _842;
    float _854 = _844;
    if (_586)
    {
        float _856 = _712 ? as_type<float>(_836) : _628;
        _852 = _856;
    }
    float _858 = _852;
    float _860 = _686 + _610;
    float _862 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _864 = _828 + _862;
    float _866 = _850 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _868 = fma(_816, _818, _846);
    float _870 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _872 = _860 + _870;
    float _874 = _598 ? as_type<float>(_780) : _660;
    float _876 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[28].x, _866);
    float _878 = fma(_844, _794, _868);
    if (_602)
    {
        float _880 = _672 ? _732 : _660;
        _788 = _880;
    }
    float _882 = _788;
    float _884 = _570 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _886 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[28].z, _876);
    float _888 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[134].x, _878);
    float _890 = _850 * _850;
    float _892 = in.m_63.w;
    float _894 = _820 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _896 = _882;
    if (_582)
    {
        float _898 = -_628;
        float _900 = _898 + 1.0;
        _830 = as_type<int>(_900);
    }
    int _902 = _830;
    bool _904 = _886 >= 0.0;
    float _906 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _908 = fma(_864, _864, _890);
    float _910 = fma(_884, _882, -0.5);
    if (!_582)
    {
        _896 = _628;
    }
    float _912 = _896;
    float _914 = fma(_894, _858, -0.5);
    float _916 = _912;
    if (_582)
    {
        float _918 = _792 ? as_type<float>(_902) : _628;
        _916 = _918;
    }
    float _920 = _916;
    float _922 = fma(_872, _872, _908);
    float _924 = -_742;
    float _926 = fma(_746, _910, _924);
    float _928 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _930 = fma(_744, _914, _736);
    float _932 = _920 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _934 = _874 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _938 = rsqrt(_922);
    int _940 = as_type<int>(_930);
    if (_904)
    {
        _854 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _942 = _854;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _948 = _926 + 0.5;
    float _950 = _932 * _906;
    float _952 = _930 + 0.5;
    float _954 = _934 * _928;
    float _956 = _936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _958 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _960 = _946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _962 = _888 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _964 = as_type<int>(_960);
    if (_904)
    {
        float _966 = _942 * 5.0;
        _940 = as_type<int>(_966);
    }
    int _968 = _940;
    out.m_65.w = _892;
    float _970 = _850 * _938;
    float _972 = _864 * _938;
    out.m_67.x = _952;
    out.m_67.y = _948;
    out.m_67.z = _950;
    out.m_67.w = _954;
    out.m_69.x = _956;
    out.m_69.y = _958;
    out.m_69.z = _960;
    out.m_69.w = _962;
    if (_904)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3047 = as_type<float>(_968);
        out.gl_Position.z = _3047;
    }
    if (_904)
    {
        out.m_45.x = 0.0;
    }
    if (_904)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _974 = -_970;
    float _976 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[18].w, _840);
    float _978 = _872 * _938;
    float _980 = -_972;
    float _982 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[18].w, _828);
    float _984 = -_970;
    float _986 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[18].w, _850);
    float _988 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _990 = _976 + _988;
    float _992 = -_978;
    float _994 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[18].w, _860);
    float _996 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _998 = _982 + _996;
    float _1000 = -_972;
    float _1002 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[18].w, _864);
    float _1004 = _990 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1006 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1008 = _994 + _1006;
    float _1010 = -_978;
    float _1012 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[18].w, _872);
    float _1014 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1004);
    float _1016 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1014);
    bool _1018 = _1016 >= 0.0;
    float _1020 = _986 * _986;
    float _1022 = fma(_1002, _1002, _1020);
    float _1024 = fma(_1012, _1012, _1022);
    float _1026 = _998;
    if (_1018)
    {
        _1026 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1028 = _1026;
    if (_1018)
    {
        out.m_45.x = 0.0;
    }
    if (_1018)
    {
        float _1030 = _1028 * 5.0;
        _964 = as_type<int>(_1030);
    }
    int _1032 = _964;
    if (_1018)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3172 = as_type<float>(_1032);
        out.gl_Position.z = _3172;
    }
    if (_1018)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1034 = in.m_71.x;
    float _1036 = in.m_71.y;
    float _1038 = in.m_71.z;
    float _1040 = sqrt(_1024);
    float _1042 = _392 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1044 = _390 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1046 = _394 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1048 = _938 * _1040;
    float _1050 = _1048 * _1042;
    float _1052 = _1048 * _1044;
    float _1054 = _1048 * _1046;
    float _1056 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1036);
    float _1058 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1034);
    float _1060 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1038);
    float _1062 = _1050 * _1056;
    float _1064 = _1052 * _1058;
    float _1066 = _1054 * _1060;
    float _1068 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1070 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1072 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1074 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1068);
    float _1076 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1070);
    float _1078 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1072);
    float _1080 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1074);
    float _1082 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1076);
    float _1084 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1078);
    float _1086 = _1080 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1088 = _1082 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1090 = _1084 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1092 = _860 + _1086;
    float _1094 = _828 + _1088;
    float _1096 = _840 + _1090;
    float _1098 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1100 = _1092 + _1098;
    float _1102 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1104 = _1094 + _1102;
    float _1106 = _1100 * _1100;
    float _1108 = fma(_1104, _1104, _1106);
    float _1110 = sqrt(_1108);
    bool _1112 = _1110 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1114 = _1066;
    float _1116 = _1084;
    float _1118 = _1090;
    float _1120 = _1094;
    float _1122 = _1096;
    float _1124 = _1046;
    if (!_1112)
    {
        _1114 = _1094;
    }
    float _1126 = _1114;
    float _1128 = _1126;
    if (!_1112)
    {
        _1116 = _1092;
    }
    float _1130 = _1116;
    float _1132 = _1130;
    if (!_1112)
    {
        _1118 = _1096;
    }
    float _1134 = _1118;
    bool _1136 = !_1112;
    float _1138 = _1134;
    if (!_1136)
    {
        float _1140 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1142 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1144 = _1110 + _1142;
        float _1146 = _1096 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1148 = rsqrt(_1108);
        float _1150 = _1144 * _1140;
        float _1152 = _1150 * 0.15915493667125701904296875;
        float _1154 = _1152 * 6.283185482025146484375;
        float _1156 = cos(_1154);
        float _1158 = _1152 * 6.283185482025146484375;
        float _1160 = sin(_1158);
        float _1162 = _1156 + (-1.0);
        float _1164 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1166 = fma(_1160, _1146, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1168 = fma(_1096, _1156, _1164);
        float _1170 = _1148 * _1166;
        float _1172 = fma(_1104, _1170, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1174 = fma(_1100, _1170, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1138 = _1168;
        _1128 = _1172;
        _1132 = _1174;
        _1120 = _1170;
    }
    float _1176 = _1138;
    float _1178 = _1128;
    float _1180 = _1132;
    float _1182 = _1120;
    float _1184 = -_970;
    float _1186 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1176);
    float _1188 = -_972;
    float _1190 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1178);
    float _1192 = -_978;
    float _1194 = fma(_1192, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1180);
    float _1196 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1198 = _1186 + _1196;
    float _1200 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1202 = _1190 + _1200;
    float _1204 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1206 = _1194 + _1204;
    float _1208 = _1198 * _1198;
    float _1210 = fma(_1202, _1202, _1208);
    float _1212 = fma(_1206, _1206, _1210);
    float _1214 = rsqrt(_1212);
    float _1216 = _1214 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1218 = _1202 * _1216;
    float _1220 = _1206 * _1216;
    float _1222 = _1218 * _1218;
    float _1224 = _1220 * _1220;
    float _1226 = _1222 + _1224;
    float _1228 = sqrt(_1226);
    bool _1230 = _1228 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1232 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1234 = _1228 + _1232;
    float _1236 = _1214;
    float _1238 = _1182;
    float _1240 = _1234;
    float _1242 = _1198;
    float _1244 = _1218;
    if (_1230)
    {
        float _1246 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1236 = _1246;
    }
    float _1248 = _1236;
    if (_1230)
    {
        float _1250 = rsqrt(_1226);
        _1238 = _1250;
    }
    float _1252 = _1238;
    float _1254 = _1252;
    if (_1230)
    {
        float _1256 = _1234 * _1248;
        _1240 = _1256;
    }
    float _1258 = _1240;
    if (_1230)
    {
        float _1260 = _1258 * 0.15915493667125701904296875;
        _1122 = _1260;
    }
    float _1262 = _1122;
    float _1264 = _1206;
    if (_1230)
    {
        float _1266 = _1262 * 6.283185482025146484375;
        float _1268 = sin(_1266);
        _1264 = _1268;
    }
    float _1270 = _1264;
    float _1272 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1274 = precise::max(0.0, _1272);
    float _1276 = _1248;
    float _1278 = _1274;
    if (_1230)
    {
        float _1280 = _1262 * 6.283185482025146484375;
        float _1282 = cos(_1280);
        _1276 = _1282;
    }
    float _1284 = _1276;
    float _1286 = -_1216;
    float _1288 = -_1274;
    float _1290 = fma(_1198, _1286, _1288);
    if (_1230)
    {
        float _1292 = _1290 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1242 = _1292;
    }
    float _1294 = _1242;
    float _1296 = sqrt(_1212);
    float _1298 = _1294;
    float _1300 = _1270;
    if (_1230)
    {
        float _1302 = fma(_1270, _1294, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1298 = _1302;
    }
    float _1304 = _1298;
    float _1306 = _1304;
    if (!_1230)
    {
        _1300 = _1290;
    }
    float _1308 = _1300;
    float _1310 = _1308;
    float _1312 = _1284;
    if (_1230)
    {
        float _1314 = _1284 + (-1.0);
        _1278 = _1314;
    }
    float _1316 = _1278;
    float _1318 = _1316;
    if (_1230)
    {
        float _1320 = _1252 * _1304;
        _1124 = _1320;
    }
    float _1322 = _1124;
    if (!_1230)
    {
        _1306 = _1222;
    }
    float _1324 = _1306;
    float _1326 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1328 = _1324;
    if (_1230)
    {
        float _1330 = _1316 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1254 = _1330;
    }
    float _1332 = _1254;
    if (_1230)
    {
        float _1334 = _1218 * _1322;
        _1244 = _1334;
    }
    float _1336 = _1244;
    if (!_1230)
    {
        _1318 = _1220;
    }
    float _1338 = _1318;
    float _1340 = _1338;
    if (_1230)
    {
        float _1342 = _1220 * _1322;
        _1340 = _1342;
    }
    float _1344 = _1340;
    if (_1230)
    {
        float _1346 = fma(_1290, _1284, _1332);
        _1310 = _1346;
    }
    float _1348 = _1310;
    if (_1230)
    {
        float _1350 = _1336 * _1336;
        _1328 = _1350;
    }
    float _1352 = _1328;
    if (!_1230)
    {
        _1312 = _1224;
    }
    float _1354 = _1312;
    float _1356 = _1354;
    if (_1230)
    {
        float _1358 = _1344 * _1344;
        _1356 = _1358;
    }
    float _1360 = _1356;
    float _1362 = fma(_1348, _1348, _1352);
    float _1364 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1366 = _1362 + _1360;
    float _1368 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1370 = fma(_1296, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1368);
    float _1372 = precise::clamp(_1370, 0.0, 1.0);
    float _1374 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1364);
    float _1376 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1378 = rsqrt(_1366);
    float _1380 = -_1372;
    float _1382 = _1380 + 1.0;
    float _1384 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1374);
    float _1386 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1388 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1376);
    float _1390 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1392 = _1384 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1394 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1386);
    float _1396 = abs(_1382);
    float _1398 = log2(_1396);
    float _1400 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1388);
    float _1402 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1326);
    float _1404 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1394);
    float _1406 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1408 = _1400 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1410 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1402);
    float _1412 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1414 = _1378 * _1336;
    float _1416 = -_1406;
    float _1418 = fma(_1416, _1390, 1.0);
    float _1420 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1422 = _1378 * _1348;
    float _1424 = _1414 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1426 = _1378 * _1344;
    float _1428 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1420);
    float _1430 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1432 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1434 = -_1424;
    float _1436 = fma(_1422, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1434);
    float _1438 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1428);
    float _1440 = log2(_1418);
    float _1442 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1444 = -_1426;
    float _1446 = fma(_1444, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1436);
    float _1448 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1438);
    float _1450 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1452 = fma(_1446, -0.5, 0.5);
    float _1454 = fma(_1446, 0.5, 0.5);
    float _1456 = exp2(_1432);
    float _1458 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1450);
    float _1460 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1442);
    float _1462 = _1422 + 1.0;
    float _1464 = fma(_1454, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1466 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1458);
    float _1468 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1460);
    float _1470 = 1.0 / _1448;
    float _1472 = sqrt(_1452);
    float _1474 = -_1422;
    float _1476 = fma(_1456, _1462, _1474);
    float _1478 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1466);
    float _1480 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1468);
    float _1482 = fma(_1454, _1464, -0.212114393711090087890625);
    float _1484 = _1440 * 0.693147182464599609375;
    float _1486 = _1478 * _1470;
    float _1488 = _1480 * _1470;
    float _1490 = fma(_1454, _1482, 1.570728778839111328125);
    float _1492 = _1484 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1494 = fma(_1486, 0.5, 0.5);
    float _1496 = fma(_1488, -0.5, 0.5);
    float _1498 = fma(_1476, 0.5, 0.5);
    float _1500 = _1472 * 0.636619746685028076171875;
    float3 _3954 = float3(_1494, _1496, _1492);
    float _1502 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3954, float3(0.0), isnan(_3954)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3954, float3(0.0), isnan(_3954)), level(0.0)).x;
    float3 _3965 = float3(_1494, _1496, _1492);
    float4 _1505 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3965, float3(0.0), isnan(_3965)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3965, float3(0.0), isnan(_3965)), level(0.0)).xyzw;
    float _1507 = _1505.x;
    float _1509 = _1505.y;
    float _1511 = _1505.z;
    float _1513 = _1505.w;
    float _1515 = -_1490;
    float _1517 = fma(_1500, _1515, 1.0);
    float2 _3987 = float2(_1517, _1498);
    float3 _1521 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3987, float2(0.0), isnan(_3987)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3987, float2(0.0), isnan(_3987)), level(0.0)).xyz;
    float _1523 = _1521.x;
    float _1525 = _1521.y;
    float _1527 = _1521.z;
    float _1529 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1531 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1533 = _1478 + _1448;
    float _1535 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1529);
    float _1537 = _1533 * 0.5;
    float _1539 = exp2(_1531);
    float _1541 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1535);
    float _1543 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1541);
    float _1545 = _1448 * 0.5;
    float _1547 = _1543 + _1448;
    float _1549 = -_1539;
    float _1551 = _1549 + 1.0;
    float _1553 = fma(_1480, -0.5, _1545);
    float _1555 = _1547 * 0.5;
    float _1557 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1478;
    out.gl_Position.y = _1480;
    out.gl_Position.z = _1543;
    out.gl_Position.w = _1448;
    float _1559 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.x = _1537;
    out.m_73.y = _1553;
    out.m_73.z = _1555;
    out.m_73.w = _1448;
    out.m_45.x = _1559;
    float _1561 = _1557 * _1502;
    float _1563 = -_1557;
    float _1565 = _1563 + 1.0;
    float _1567 = _1513 * _1561;
    float _1569 = _1527 * _1561;
    float _1571 = fma(_1523, _1567, _1507);
    float _1573 = fma(_1525, _1567, _1509);
    float _1575 = _1513 * _1565;
    float _1577 = fma(_1513, _1569, _1511);
    out.m_75.x = _1571;
    out.m_75.y = _1573;
    out.m_75.z = _1577;
    out.m_75.w = _1575;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _558 = false;
    bool _416 = false;
    bool _290 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_45.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1634 = as_type<float>(_110);
        out.gl_Position.z = _1634;
    }
    if (!_98)
    {
        return out;
    }
    float _114 = in.m_47.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _130 = 0.0;
    if (_124)
    {
        float _132 = float(_94);
        _130 = _132;
    }
    float _134 = _130;
    bool _136 = _128 >= _134;
    bool _138 = !_124;
    bool _140 = _136 || _138;
    if (_140)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _104;
    if (_140)
    {
        out.m_45.x = 0.0;
    }
    if (_140)
    {
        float _144 = _142 * 5.0;
        _112 = as_type<int>(_144);
    }
    int _146 = _112;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1702 = as_type<float>(_146);
        out.gl_Position.z = _1702;
    }
    if (_140)
    {
        return out;
    }
    float _148 = in.m_49.w;
    float _150 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_47.x;
    float _164 = in.m_47.y;
    float _166 = in.m_47.z;
    float _168 = in.m_42.x;
    float _170 = in.m_42.y;
    float _172 = in.m_42.z;
    float _174 = 0.0;
    float _176 = _150;
    if (!_160)
    {
        float _178 = _150 * _150;
        float _180 = _178 * 0.5;
        _174 = _180;
    }
    float _182 = _174;
    float _184 = _182;
    if (!_160)
    {
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    bool _190 = !_160;
    float _192 = _188;
    if (!_190)
    {
        float _194 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = log2(_194);
        float _198 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _200 = _198 + 1.0;
        float _202 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = _150 * _196;
        float _206 = 1.0 / _200;
        float _208 = _202 * 0.693147182464599609375;
        float _210 = exp2(_204);
        float _212 = 1.0 / _208;
        float _214 = _210 + (-1.0);
        float _216 = -_214;
        float _218 = fma(_216, _212, _150);
        float _220 = _218 * _206;
        float _222 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _222;
    }
    float _224 = _192;
    bool _226 = !_160;
    if (!_226)
    {
        float _228 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = log2(_228);
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _234 = _232 + 1.0;
        float _236 = 1.0 / _234;
        float _238 = _150 * _230;
        float _240 = exp2(_238);
        float _242 = -_240;
        float _244 = _242 + 1.0;
        float _246 = _244 * _236;
        _176 = _246;
    }
    float _248 = _176;
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _252 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _254 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _256 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _258 = fma(_248, _162, _252);
    float _260 = fma(_248, _164, _254);
    float _262 = fma(_248, _166, _256);
    float _264 = fma(_258, _148, _168);
    float _266 = fma(_260, _148, _170);
    float _268 = fma(_262, _148, _172);
    bool _270 = !_250;
    float _288;
    if (!_270)
    {
        float _272 = in.m_51.x;
        float _274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _276 = _272 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _280 = _278 * _274;
        float _282 = floor(_280);
        float _284 = -_282;
        float _286 = _280 + _284;
        _288 = _286;
        _290 = true;
    }
    else
    {
        float _292 = float(_94);
        float _294 = 1.0 / _292;
        float _296 = _128 * _294;
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
    float _320 = -_314;
    float _322 = _320 + 1.0;
    bool _324 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _326 = isnan(_298);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = 1.0 / _318;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _342;
    bool _346 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _348 = _302 * _336;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _350;
    float _354 = in.m_49.x;
    float _356 = in.m_49.y;
    float _358 = in.m_49.z;
    float _360 = _334 * _322;
    float _362 = fma(_340, _348, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _364 = fma(_352, _348, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _366 = fma(_344, _348, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _368 = -_334;
    float _370 = _368 + 1.0;
    float _372 = _362 * _360;
    float _374 = _364 * _360;
    float _376 = _366 * _360;
    float _378 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].x, _372);
    float _380 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].y, _374);
    float _382 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].z, _376);
    float _384 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[144].x, _378);
    float _386 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[144].y, _380);
    float _388 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[144].z, _382);
    float _390 = _384 * _354;
    float _392 = _386 * _356;
    float _394 = _388 * _358;
    bool _396 = !_346;
    float _414;
    if (!_396)
    {
        float _398 = in.m_51.x;
        float _400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _402 = _398 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _404 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _406 = _404 * _400;
        float _408 = floor(_406);
        float _410 = -_408;
        float _412 = _406 + _410;
        _414 = _412;
        _416 = true;
    }
    else
    {
        float _418 = float(_94);
        float _420 = 1.0 / _418;
        float _422 = _128 * _420;
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
    bool _484 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _486 = 1.0 / _448;
    float _488 = _464 * _478;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _494 = -_476;
    float _496 = _494 + 1.0;
    float _498 = fma(_488, _428, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _500 = _460 * _482;
    float _502 = -_460;
    float _504 = _502 + 1.0;
    float _506 = _444 * _496;
    float _508 = _492 * _486;
    float _510 = _498 * _500;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _514 = _424 + _512;
    float _516 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[115].x, _510);
    float _518 = fma(_508, _514, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _522 = fma(_518, _506, _516);
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _528 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[117].x, _522);
    float _530 = _520 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _532 = _524 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _534 = _526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _536 = _528 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _530;
    out.m_53.y = _532;
    out.m_53.z = _534;
    out.m_53.w = _536;
    bool _538 = !_484;
    float _556;
    if (!_538)
    {
        float _540 = in.m_51.x;
        float _542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _544 = _540 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _546 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[11].w, _128);
        float _548 = _546 * _542;
        float _550 = floor(_548);
        float _552 = -_550;
        float _554 = _548 + _552;
        _556 = _554;
        _558 = true;
    }
    else
    {
        float _560 = float(_94);
        float _562 = 1.0 / _560;
        float _564 = _128 * _562;
        _556 = _564;
    }
    _558 = false;
    float _566 = _556;
    float _568 = in.m_51.w;
    float _570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _572 = in.m_55.x;
    float _574 = in.m_55.y;
    float _576 = in.m_55.z;
    float _578 = in.m_55.w;
    int _580 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _582 = _580 != 0;
    int _584 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _586 = _584 != 0;
    float _588 = in.m_57.x;
    float _590 = in.m_57.y;
    float _592 = in.m_57.z;
    float _594 = in.m_57.w;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _598 = _596 != 0;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _602 = _600 != 0;
    float _604 = in.m_59.x;
    float _606 = in.m_59.y;
    float _608 = in.m_59.z;
    float _610 = in.m_59.w;
    float _612 = in.m_51.x;
    float _614 = in.m_51.y;
    bool _616 = _568 > 0.5;
    float _618 = 0.0;
    bool _620 = _616;
    if (_582)
    {
        float _622 = in.m_51.z;
        _618 = _622;
    }
    float _624 = _618;
    float _626 = _266 * _574;
    float _628 = in.m_61.x;
    float _630 = _266 * _590;
    float _632 = fma(_264, _572, _626);
    float _634 = _266 * _606;
    float _636 = fma(_264, _588, _630);
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _644 = _612 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _646 = fma(_264, _604, _634);
    float _648 = 1.0 / _642;
    float _650 = -_638;
    float _652 = fma(_644, 2.0, _650);
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _660 = in.m_61.y;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _666 = _614 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _668 = 1.0 / _658;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _672 = _614 > 0.5;
    float _674 = fma(_666, -2.0, _654);
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _678 = fma(_268, _576, _632);
    float _680 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[78].z, _670);
    float _682 = 1.0 / _664;
    float _684 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[78].w, _676);
    float _686 = fma(_268, _608, _646);
    float _688 = fma(_268, _592, _636);
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _692 = _566 + _690;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _694;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _702;
    bool _706 = false;
    int _708 = as_type<int>(_578);
    if (_586)
    {
        bool _710 = _612 > 0.5;
        _706 = _710;
    }
    bool _712 = _706;
    float _714 = _696 * _648;
    bool _716 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _718 = isnan(_566);
    bool _720 = _716 || _718;
    bool _722 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _724 = _720 || _722;
    float _726 = float(_724);
    float _728 = _700 * _668;
    float _730 = -_660;
    float _732 = _730 + 1.0;
    float _734 = -_128;
    float _736 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[76].x, _652);
    float _738 = fma(_714, _692, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _740 = _704 * _682;
    float _742 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _674);
    float _744 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _680);
    float _746 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _684);
    bool _748 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _750 = isnan(_566);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = -_726;
    float _762 = _760 + 1.0;
    bool _764 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _766 = isnan(_566);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _778 = _566 + _776;
    int _780 = _616 ? as_type<int>(_732) : as_type<int>(_660);
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _784 = _566 + _782;
    float _786 = _774;
    float _788 = _660;
    if (_582)
    {
        bool _790 = _624 > 0.5;
        _620 = _790;
    }
    bool _792 = _620;
    float _794 = _758 * _762;
    float _796 = -_758;
    float _798 = _796 + 1.0;
    bool _800 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _802 = isnan(_566);
    bool _804 = _800 || _802;
    bool _806 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _808 = _804 || _806;
    float _810 = float(_808);
    float _812 = -_774;
    float _814 = _812 + 1.0;
    float _816 = fma(_728, _778, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _818 = _774 * _798;
    float _820 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _822 = _810 * _814;
    float _824 = -_810;
    float _826 = _824 + 1.0;
    float _828 = _678 + _578;
    int _830 = as_type<int>(_826);
    if (_586)
    {
        float _832 = -_628;
        float _834 = _832 + 1.0;
        _708 = as_type<int>(_834);
    }
    int _836 = _708;
    float _838 = _738 * _822;
    float _840 = _688 + _594;
    if (!_586)
    {
        _786 = _628;
    }
    float _842 = _786;
    float _844 = fma(_740, _784, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _846 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[131].x, _838);
    float _848 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _850 = _840 + _848;
    float _852 = _842;
    float _854 = _844;
    if (_586)
    {
        float _856 = _712 ? as_type<float>(_836) : _628;
        _852 = _856;
    }
    float _858 = _852;
    float _860 = _686 + _610;
    float _862 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _864 = _828 + _862;
    float _866 = _850 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _868 = fma(_816, _818, _846);
    float _870 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _872 = _860 + _870;
    float _874 = _598 ? as_type<float>(_780) : _660;
    float _876 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[28].x, _866);
    float _878 = fma(_844, _794, _868);
    if (_602)
    {
        float _880 = _672 ? _732 : _660;
        _788 = _880;
    }
    float _882 = _788;
    float _884 = _570 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _886 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[28].z, _876);
    float _888 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[134].x, _878);
    float _890 = _850 * _850;
    float _892 = in.m_63.w;
    float _894 = _820 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _896 = _882;
    if (_582)
    {
        float _898 = -_628;
        float _900 = _898 + 1.0;
        _830 = as_type<int>(_900);
    }
    int _902 = _830;
    bool _904 = _886 >= 0.0;
    float _906 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _908 = fma(_864, _864, _890);
    float _910 = fma(_884, _882, -0.5);
    if (!_582)
    {
        _896 = _628;
    }
    float _912 = _896;
    float _914 = fma(_894, _858, -0.5);
    float _916 = _912;
    if (_582)
    {
        float _918 = _792 ? as_type<float>(_902) : _628;
        _916 = _918;
    }
    float _920 = _916;
    float _922 = fma(_872, _872, _908);
    float _924 = -_742;
    float _926 = fma(_746, _910, _924);
    float _928 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _930 = fma(_744, _914, _736);
    float _932 = _920 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _934 = _874 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _938 = rsqrt(_922);
    int _940 = as_type<int>(_930);
    if (_904)
    {
        _854 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _942 = _854;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _948 = _926 + 0.5;
    float _950 = _932 * _906;
    float _952 = _930 + 0.5;
    float _954 = _934 * _928;
    float _956 = _936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _958 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _960 = _946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _962 = _888 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _964 = as_type<int>(_960);
    if (_904)
    {
        float _966 = _942 * 5.0;
        _940 = as_type<int>(_966);
    }
    int _968 = _940;
    out.m_65.w = _892;
    float _970 = _850 * _938;
    float _972 = _864 * _938;
    out.m_67.x = _952;
    out.m_67.y = _948;
    out.m_67.z = _950;
    out.m_67.w = _954;
    out.m_69.x = _956;
    out.m_69.y = _958;
    out.m_69.z = _960;
    out.m_69.w = _962;
    if (_904)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3047 = as_type<float>(_968);
        out.gl_Position.z = _3047;
    }
    if (_904)
    {
        out.m_45.x = 0.0;
    }
    if (_904)
    {
        return out;
    }
    float _974 = -_970;
    float _976 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[18].w, _840);
    float _978 = _872 * _938;
    float _980 = -_972;
    float _982 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[18].w, _828);
    float _984 = -_970;
    float _986 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[18].w, _850);
    float _988 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _990 = _976 + _988;
    float _992 = -_978;
    float _994 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[18].w, _860);
    float _996 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _998 = _982 + _996;
    float _1000 = -_972;
    float _1002 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[18].w, _864);
    float _1004 = _990 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1006 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1008 = _994 + _1006;
    float _1010 = -_978;
    float _1012 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[18].w, _872);
    float _1014 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1004);
    float _1016 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1014);
    bool _1018 = _1016 >= 0.0;
    float _1020 = _986 * _986;
    float _1022 = fma(_1002, _1002, _1020);
    float _1024 = fma(_1012, _1012, _1022);
    float _1026 = _998;
    if (_1018)
    {
        _1026 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1028 = _1026;
    if (_1018)
    {
        out.m_45.x = 0.0;
    }
    if (_1018)
    {
        float _1030 = _1028 * 5.0;
        _964 = as_type<int>(_1030);
    }
    int _1032 = _964;
    if (_1018)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3172 = as_type<float>(_1032);
        out.gl_Position.z = _3172;
    }
    if (_1018)
    {
        return out;
    }
    float _1034 = in.m_71.x;
    float _1036 = in.m_71.y;
    float _1038 = in.m_71.z;
    float _1040 = sqrt(_1024);
    float _1042 = _392 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1044 = _390 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1046 = _394 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1048 = _938 * _1040;
    float _1050 = _1048 * _1042;
    float _1052 = _1048 * _1044;
    float _1054 = _1048 * _1046;
    float _1056 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1036);
    float _1058 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1034);
    float _1060 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1038);
    float _1062 = _1050 * _1056;
    float _1064 = _1052 * _1058;
    float _1066 = _1054 * _1060;
    float _1068 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1070 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1072 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1074 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1068);
    float _1076 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1070);
    float _1078 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1072);
    float _1080 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1074);
    float _1082 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1076);
    float _1084 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1078);
    float _1086 = _1080 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1088 = _1082 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1090 = _1084 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1092 = _860 + _1086;
    float _1094 = _828 + _1088;
    float _1096 = _840 + _1090;
    float _1098 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1100 = _1092 + _1098;
    float _1102 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1104 = _1094 + _1102;
    float _1106 = _1100 * _1100;
    float _1108 = fma(_1104, _1104, _1106);
    float _1110 = sqrt(_1108);
    bool _1112 = _1110 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1114 = _1066;
    float _1116 = _1084;
    float _1118 = _1090;
    float _1120 = _1094;
    float _1122 = _1096;
    float _1124 = _1046;
    if (!_1112)
    {
        _1114 = _1094;
    }
    float _1126 = _1114;
    float _1128 = _1126;
    if (!_1112)
    {
        _1116 = _1092;
    }
    float _1130 = _1116;
    float _1132 = _1130;
    if (!_1112)
    {
        _1118 = _1096;
    }
    float _1134 = _1118;
    bool _1136 = !_1112;
    float _1138 = _1134;
    if (!_1136)
    {
        float _1140 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1142 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1144 = _1110 + _1142;
        float _1146 = _1096 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1148 = rsqrt(_1108);
        float _1150 = _1144 * _1140;
        float _1152 = _1150 * 0.15915493667125701904296875;
        float _1154 = _1152 * 6.283185482025146484375;
        float _1156 = cos(_1154);
        float _1158 = _1152 * 6.283185482025146484375;
        float _1160 = sin(_1158);
        float _1162 = _1156 + (-1.0);
        float _1164 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1166 = fma(_1160, _1146, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1168 = fma(_1096, _1156, _1164);
        float _1170 = _1148 * _1166;
        float _1172 = fma(_1104, _1170, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1174 = fma(_1100, _1170, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1138 = _1168;
        _1128 = _1172;
        _1132 = _1174;
        _1120 = _1170;
    }
    float _1176 = _1138;
    float _1178 = _1128;
    float _1180 = _1132;
    float _1182 = _1120;
    float _1184 = -_970;
    float _1186 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1176);
    float _1188 = -_972;
    float _1190 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1178);
    float _1192 = -_978;
    float _1194 = fma(_1192, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1180);
    float _1196 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1198 = _1186 + _1196;
    float _1200 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1202 = _1190 + _1200;
    float _1204 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1206 = _1194 + _1204;
    float _1208 = _1198 * _1198;
    float _1210 = fma(_1202, _1202, _1208);
    float _1212 = fma(_1206, _1206, _1210);
    float _1214 = rsqrt(_1212);
    float _1216 = _1214 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1218 = _1202 * _1216;
    float _1220 = _1206 * _1216;
    float _1222 = _1218 * _1218;
    float _1224 = _1220 * _1220;
    float _1226 = _1222 + _1224;
    float _1228 = sqrt(_1226);
    bool _1230 = _1228 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1232 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1234 = _1228 + _1232;
    float _1236 = _1214;
    float _1238 = _1182;
    float _1240 = _1234;
    float _1242 = _1198;
    float _1244 = _1218;
    if (_1230)
    {
        float _1246 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1236 = _1246;
    }
    float _1248 = _1236;
    if (_1230)
    {
        float _1250 = rsqrt(_1226);
        _1238 = _1250;
    }
    float _1252 = _1238;
    float _1254 = _1252;
    if (_1230)
    {
        float _1256 = _1234 * _1248;
        _1240 = _1256;
    }
    float _1258 = _1240;
    if (_1230)
    {
        float _1260 = _1258 * 0.15915493667125701904296875;
        _1122 = _1260;
    }
    float _1262 = _1122;
    float _1264 = _1206;
    if (_1230)
    {
        float _1266 = _1262 * 6.283185482025146484375;
        float _1268 = sin(_1266);
        _1264 = _1268;
    }
    float _1270 = _1264;
    float _1272 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1274 = precise::max(0.0, _1272);
    float _1276 = _1248;
    float _1278 = _1274;
    if (_1230)
    {
        float _1280 = _1262 * 6.283185482025146484375;
        float _1282 = cos(_1280);
        _1276 = _1282;
    }
    float _1284 = _1276;
    float _1286 = -_1216;
    float _1288 = -_1274;
    float _1290 = fma(_1198, _1286, _1288);
    if (_1230)
    {
        float _1292 = _1290 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1242 = _1292;
    }
    float _1294 = _1242;
    float _1296 = sqrt(_1212);
    float _1298 = _1294;
    float _1300 = _1270;
    if (_1230)
    {
        float _1302 = fma(_1270, _1294, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1298 = _1302;
    }
    float _1304 = _1298;
    float _1306 = _1304;
    if (!_1230)
    {
        _1300 = _1290;
    }
    float _1308 = _1300;
    float _1310 = _1308;
    float _1312 = _1284;
    if (_1230)
    {
        float _1314 = _1284 + (-1.0);
        _1278 = _1314;
    }
    float _1316 = _1278;
    float _1318 = _1316;
    if (_1230)
    {
        float _1320 = _1252 * _1304;
        _1124 = _1320;
    }
    float _1322 = _1124;
    if (!_1230)
    {
        _1306 = _1222;
    }
    float _1324 = _1306;
    float _1326 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1328 = _1324;
    if (_1230)
    {
        float _1330 = _1316 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1254 = _1330;
    }
    float _1332 = _1254;
    if (_1230)
    {
        float _1334 = _1218 * _1322;
        _1244 = _1334;
    }
    float _1336 = _1244;
    if (!_1230)
    {
        _1318 = _1220;
    }
    float _1338 = _1318;
    float _1340 = _1338;
    if (_1230)
    {
        float _1342 = _1220 * _1322;
        _1340 = _1342;
    }
    float _1344 = _1340;
    if (_1230)
    {
        float _1346 = fma(_1290, _1284, _1332);
        _1310 = _1346;
    }
    float _1348 = _1310;
    if (_1230)
    {
        float _1350 = _1336 * _1336;
        _1328 = _1350;
    }
    float _1352 = _1328;
    if (!_1230)
    {
        _1312 = _1224;
    }
    float _1354 = _1312;
    float _1356 = _1354;
    if (_1230)
    {
        float _1358 = _1344 * _1344;
        _1356 = _1358;
    }
    float _1360 = _1356;
    float _1362 = fma(_1348, _1348, _1352);
    float _1364 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1366 = _1362 + _1360;
    float _1368 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1370 = fma(_1296, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1368);
    float _1372 = precise::clamp(_1370, 0.0, 1.0);
    float _1374 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1364);
    float _1376 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1378 = rsqrt(_1366);
    float _1380 = -_1372;
    float _1382 = _1380 + 1.0;
    float _1384 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1374);
    float _1386 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1388 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1376);
    float _1390 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1392 = _1384 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1394 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1386);
    float _1396 = abs(_1382);
    float _1398 = log2(_1396);
    float _1400 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1388);
    float _1402 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1326);
    float _1404 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1394);
    float _1406 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1408 = _1400 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1410 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1402);
    float _1412 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1414 = _1378 * _1336;
    float _1416 = -_1406;
    float _1418 = fma(_1416, _1390, 1.0);
    float _1420 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1422 = _1378 * _1348;
    float _1424 = _1414 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1426 = _1378 * _1344;
    float _1428 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1420);
    float _1430 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1432 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1434 = -_1424;
    float _1436 = fma(_1422, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1434);
    float _1438 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1428);
    float _1440 = log2(_1418);
    float _1442 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1444 = -_1426;
    float _1446 = fma(_1444, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1436);
    float _1448 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1438);
    float _1450 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1452 = fma(_1446, -0.5, 0.5);
    float _1454 = fma(_1446, 0.5, 0.5);
    float _1456 = exp2(_1432);
    float _1458 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1450);
    float _1460 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1442);
    float _1462 = _1422 + 1.0;
    float _1464 = fma(_1454, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1466 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1458);
    float _1468 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1460);
    float _1470 = 1.0 / _1448;
    float _1472 = sqrt(_1452);
    float _1474 = -_1422;
    float _1476 = fma(_1456, _1462, _1474);
    float _1478 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1466);
    float _1480 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1468);
    float _1482 = fma(_1454, _1464, -0.212114393711090087890625);
    float _1484 = _1440 * 0.693147182464599609375;
    float _1486 = _1478 * _1470;
    float _1488 = _1480 * _1470;
    float _1490 = fma(_1454, _1482, 1.570728778839111328125);
    float _1492 = _1484 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1494 = fma(_1486, 0.5, 0.5);
    float _1496 = fma(_1488, -0.5, 0.5);
    float _1498 = fma(_1476, 0.5, 0.5);
    float _1500 = _1472 * 0.636619746685028076171875;
    float3 _3954 = float3(_1494, _1496, _1492);
    float _1502 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3954, float3(0.0), isnan(_3954)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3954, float3(0.0), isnan(_3954)), level(0.0)).x;
    float3 _3965 = float3(_1494, _1496, _1492);
    float4 _1505 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3965, float3(0.0), isnan(_3965)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3965, float3(0.0), isnan(_3965)), level(0.0)).xyzw;
    float _1507 = _1505.x;
    float _1509 = _1505.y;
    float _1511 = _1505.z;
    float _1513 = _1505.w;
    float _1515 = -_1490;
    float _1517 = fma(_1500, _1515, 1.0);
    float2 _3987 = float2(_1517, _1498);
    float3 _1521 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3987, float2(0.0), isnan(_3987)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3987, float2(0.0), isnan(_3987)), level(0.0)).xyz;
    float _1523 = _1521.x;
    float _1525 = _1521.y;
    float _1527 = _1521.z;
    float _1529 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1531 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1533 = _1478 + _1448;
    float _1535 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1529);
    float _1537 = _1533 * 0.5;
    float _1539 = exp2(_1531);
    float _1541 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1535);
    float _1543 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1541);
    float _1545 = _1448 * 0.5;
    float _1547 = _1543 + _1448;
    float _1549 = -_1539;
    float _1551 = _1549 + 1.0;
    float _1553 = fma(_1480, -0.5, _1545);
    float _1555 = _1547 * 0.5;
    float _1557 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1478;
    out.gl_Position.y = _1480;
    out.gl_Position.z = _1543;
    out.gl_Position.w = _1448;
    float _1559 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.x = _1537;
    out.m_73.y = _1553;
    out.m_73.z = _1555;
    out.m_73.w = _1448;
    out.m_45.x = _1559;
    float _1561 = _1557 * _1502;
    float _1563 = -_1557;
    float _1565 = _1563 + 1.0;
    float _1567 = _1513 * _1561;
    float _1569 = _1527 * _1561;
    float _1571 = fma(_1523, _1567, _1507);
    float _1573 = fma(_1525, _1567, _1509);
    float _1575 = _1513 * _1565;
    float _1577 = fma(_1513, _1569, _1511);
    out.m_75.x = _1571;
    out.m_75.y = _1573;
    out.m_75.z = _1577;
    out.m_75.w = _1575;
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
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _558 = false;
    bool _416 = false;
    bool _290 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_45.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1634 = as_type<float>(_110);
        out.gl_Position.z = _1634;
    }
    if (!_98)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _114 = in.m_47.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _130 = 0.0;
    if (_124)
    {
        float _132 = float(_94);
        _130 = _132;
    }
    float _134 = _130;
    bool _136 = _128 >= _134;
    bool _138 = !_124;
    bool _140 = _136 || _138;
    if (_140)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _104;
    if (_140)
    {
        out.m_45.x = 0.0;
    }
    if (_140)
    {
        float _144 = _142 * 5.0;
        _112 = as_type<int>(_144);
    }
    int _146 = _112;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1702 = as_type<float>(_146);
        out.gl_Position.z = _1702;
    }
    if (_140)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_49.w;
    float _150 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_47.x;
    float _164 = in.m_47.y;
    float _166 = in.m_47.z;
    float _168 = in.m_42.x;
    float _170 = in.m_42.y;
    float _172 = in.m_42.z;
    float _174 = 0.0;
    float _176 = _150;
    if (!_160)
    {
        float _178 = _150 * _150;
        float _180 = _178 * 0.5;
        _174 = _180;
    }
    float _182 = _174;
    float _184 = _182;
    if (!_160)
    {
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    bool _190 = !_160;
    float _192 = _188;
    if (!_190)
    {
        float _194 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = log2(_194);
        float _198 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _200 = _198 + 1.0;
        float _202 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = _150 * _196;
        float _206 = 1.0 / _200;
        float _208 = _202 * 0.693147182464599609375;
        float _210 = exp2(_204);
        float _212 = 1.0 / _208;
        float _214 = _210 + (-1.0);
        float _216 = -_214;
        float _218 = fma(_216, _212, _150);
        float _220 = _218 * _206;
        float _222 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _222;
    }
    float _224 = _192;
    bool _226 = !_160;
    if (!_226)
    {
        float _228 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = log2(_228);
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _234 = _232 + 1.0;
        float _236 = 1.0 / _234;
        float _238 = _150 * _230;
        float _240 = exp2(_238);
        float _242 = -_240;
        float _244 = _242 + 1.0;
        float _246 = _244 * _236;
        _176 = _246;
    }
    float _248 = _176;
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _252 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _254 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _256 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _258 = fma(_248, _162, _252);
    float _260 = fma(_248, _164, _254);
    float _262 = fma(_248, _166, _256);
    float _264 = fma(_258, _148, _168);
    float _266 = fma(_260, _148, _170);
    float _268 = fma(_262, _148, _172);
    bool _270 = !_250;
    float _288;
    if (!_270)
    {
        float _272 = in.m_51.x;
        float _274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _276 = _272 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _280 = _278 * _274;
        float _282 = floor(_280);
        float _284 = -_282;
        float _286 = _280 + _284;
        _288 = _286;
        _290 = true;
    }
    else
    {
        float _292 = float(_94);
        float _294 = 1.0 / _292;
        float _296 = _128 * _294;
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
    float _320 = -_314;
    float _322 = _320 + 1.0;
    bool _324 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _326 = isnan(_298);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = 1.0 / _318;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _342;
    bool _346 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _348 = _302 * _336;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _350;
    float _354 = in.m_49.x;
    float _356 = in.m_49.y;
    float _358 = in.m_49.z;
    float _360 = _334 * _322;
    float _362 = fma(_340, _348, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _364 = fma(_352, _348, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _366 = fma(_344, _348, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _368 = -_334;
    float _370 = _368 + 1.0;
    float _372 = _362 * _360;
    float _374 = _364 * _360;
    float _376 = _366 * _360;
    float _378 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].x, _372);
    float _380 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].y, _374);
    float _382 = fma(_370, (*spvDescriptorSet0.vp_c9)._m0[143].z, _376);
    float _384 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[144].x, _378);
    float _386 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[144].y, _380);
    float _388 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[144].z, _382);
    float _390 = _384 * _354;
    float _392 = _386 * _356;
    float _394 = _388 * _358;
    bool _396 = !_346;
    float _414;
    if (!_396)
    {
        float _398 = in.m_51.x;
        float _400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _402 = _398 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _404 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _406 = _404 * _400;
        float _408 = floor(_406);
        float _410 = -_408;
        float _412 = _406 + _410;
        _414 = _412;
        _416 = true;
    }
    else
    {
        float _418 = float(_94);
        float _420 = 1.0 / _418;
        float _422 = _128 * _420;
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
    bool _484 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _486 = 1.0 / _448;
    float _488 = _464 * _478;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _494 = -_476;
    float _496 = _494 + 1.0;
    float _498 = fma(_488, _428, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _500 = _460 * _482;
    float _502 = -_460;
    float _504 = _502 + 1.0;
    float _506 = _444 * _496;
    float _508 = _492 * _486;
    float _510 = _498 * _500;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _514 = _424 + _512;
    float _516 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[115].x, _510);
    float _518 = fma(_508, _514, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _522 = fma(_518, _506, _516);
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _528 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[117].x, _522);
    float _530 = _520 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _532 = _524 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _534 = _526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _536 = _528 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _530;
    out.m_53.y = _532;
    out.m_53.z = _534;
    out.m_53.w = _536;
    bool _538 = !_484;
    float _556;
    if (!_538)
    {
        float _540 = in.m_51.x;
        float _542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _544 = _540 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _546 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[11].w, _128);
        float _548 = _546 * _542;
        float _550 = floor(_548);
        float _552 = -_550;
        float _554 = _548 + _552;
        _556 = _554;
        _558 = true;
    }
    else
    {
        float _560 = float(_94);
        float _562 = 1.0 / _560;
        float _564 = _128 * _562;
        _556 = _564;
    }
    _558 = false;
    float _566 = _556;
    float _568 = in.m_51.w;
    float _570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _572 = in.m_55.x;
    float _574 = in.m_55.y;
    float _576 = in.m_55.z;
    float _578 = in.m_55.w;
    int _580 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _582 = _580 != 0;
    int _584 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _586 = _584 != 0;
    float _588 = in.m_57.x;
    float _590 = in.m_57.y;
    float _592 = in.m_57.z;
    float _594 = in.m_57.w;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _598 = _596 != 0;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _602 = _600 != 0;
    float _604 = in.m_59.x;
    float _606 = in.m_59.y;
    float _608 = in.m_59.z;
    float _610 = in.m_59.w;
    float _612 = in.m_51.x;
    float _614 = in.m_51.y;
    bool _616 = _568 > 0.5;
    float _618 = 0.0;
    bool _620 = _616;
    if (_582)
    {
        float _622 = in.m_51.z;
        _618 = _622;
    }
    float _624 = _618;
    float _626 = _266 * _574;
    float _628 = in.m_61.x;
    float _630 = _266 * _590;
    float _632 = fma(_264, _572, _626);
    float _634 = _266 * _606;
    float _636 = fma(_264, _588, _630);
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _644 = _612 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _646 = fma(_264, _604, _634);
    float _648 = 1.0 / _642;
    float _650 = -_638;
    float _652 = fma(_644, 2.0, _650);
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _660 = in.m_61.y;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _666 = _614 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _668 = 1.0 / _658;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _672 = _614 > 0.5;
    float _674 = fma(_666, -2.0, _654);
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _678 = fma(_268, _576, _632);
    float _680 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[78].z, _670);
    float _682 = 1.0 / _664;
    float _684 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[78].w, _676);
    float _686 = fma(_268, _608, _646);
    float _688 = fma(_268, _592, _636);
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _692 = _566 + _690;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _694;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _702;
    bool _706 = false;
    int _708 = as_type<int>(_578);
    if (_586)
    {
        bool _710 = _612 > 0.5;
        _706 = _710;
    }
    bool _712 = _706;
    float _714 = _696 * _648;
    bool _716 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _718 = isnan(_566);
    bool _720 = _716 || _718;
    bool _722 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _724 = _720 || _722;
    float _726 = float(_724);
    float _728 = _700 * _668;
    float _730 = -_660;
    float _732 = _730 + 1.0;
    float _734 = -_128;
    float _736 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[76].x, _652);
    float _738 = fma(_714, _692, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _740 = _704 * _682;
    float _742 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _674);
    float _744 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _680);
    float _746 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _684);
    bool _748 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _750 = isnan(_566);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = -_726;
    float _762 = _760 + 1.0;
    bool _764 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _766 = isnan(_566);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _778 = _566 + _776;
    int _780 = _616 ? as_type<int>(_732) : as_type<int>(_660);
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _784 = _566 + _782;
    float _786 = _774;
    float _788 = _660;
    if (_582)
    {
        bool _790 = _624 > 0.5;
        _620 = _790;
    }
    bool _792 = _620;
    float _794 = _758 * _762;
    float _796 = -_758;
    float _798 = _796 + 1.0;
    bool _800 = _566 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _802 = isnan(_566);
    bool _804 = _800 || _802;
    bool _806 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _808 = _804 || _806;
    float _810 = float(_808);
    float _812 = -_774;
    float _814 = _812 + 1.0;
    float _816 = fma(_728, _778, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _818 = _774 * _798;
    float _820 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _822 = _810 * _814;
    float _824 = -_810;
    float _826 = _824 + 1.0;
    float _828 = _678 + _578;
    int _830 = as_type<int>(_826);
    if (_586)
    {
        float _832 = -_628;
        float _834 = _832 + 1.0;
        _708 = as_type<int>(_834);
    }
    int _836 = _708;
    float _838 = _738 * _822;
    float _840 = _688 + _594;
    if (!_586)
    {
        _786 = _628;
    }
    float _842 = _786;
    float _844 = fma(_740, _784, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _846 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[131].x, _838);
    float _848 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _850 = _840 + _848;
    float _852 = _842;
    float _854 = _844;
    if (_586)
    {
        float _856 = _712 ? as_type<float>(_836) : _628;
        _852 = _856;
    }
    float _858 = _852;
    float _860 = _686 + _610;
    float _862 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _864 = _828 + _862;
    float _866 = _850 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _868 = fma(_816, _818, _846);
    float _870 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _872 = _860 + _870;
    float _874 = _598 ? as_type<float>(_780) : _660;
    float _876 = fma(_864, (*spvDescriptorSet0.vp_c8)._m0[28].x, _866);
    float _878 = fma(_844, _794, _868);
    if (_602)
    {
        float _880 = _672 ? _732 : _660;
        _788 = _880;
    }
    float _882 = _788;
    float _884 = _570 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _886 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[28].z, _876);
    float _888 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[134].x, _878);
    float _890 = _850 * _850;
    float _892 = in.m_63.w;
    float _894 = _820 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _896 = _882;
    if (_582)
    {
        float _898 = -_628;
        float _900 = _898 + 1.0;
        _830 = as_type<int>(_900);
    }
    int _902 = _830;
    bool _904 = _886 >= 0.0;
    float _906 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _908 = fma(_864, _864, _890);
    float _910 = fma(_884, _882, -0.5);
    if (!_582)
    {
        _896 = _628;
    }
    float _912 = _896;
    float _914 = fma(_894, _858, -0.5);
    float _916 = _912;
    if (_582)
    {
        float _918 = _792 ? as_type<float>(_902) : _628;
        _916 = _918;
    }
    float _920 = _916;
    float _922 = fma(_872, _872, _908);
    float _924 = -_742;
    float _926 = fma(_746, _910, _924);
    float _928 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _930 = fma(_744, _914, _736);
    float _932 = _920 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _934 = _874 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _938 = rsqrt(_922);
    int _940 = as_type<int>(_930);
    if (_904)
    {
        _854 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _942 = _854;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _948 = _926 + 0.5;
    float _950 = _932 * _906;
    float _952 = _930 + 0.5;
    float _954 = _934 * _928;
    float _956 = _936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _958 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _960 = _946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _962 = _888 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _964 = as_type<int>(_960);
    if (_904)
    {
        float _966 = _942 * 5.0;
        _940 = as_type<int>(_966);
    }
    int _968 = _940;
    out.m_65.w = _892;
    float _970 = _850 * _938;
    float _972 = _864 * _938;
    out.m_67.x = _952;
    out.m_67.y = _948;
    out.m_67.z = _950;
    out.m_67.w = _954;
    out.m_69.x = _956;
    out.m_69.y = _958;
    out.m_69.z = _960;
    out.m_69.w = _962;
    if (_904)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3047 = as_type<float>(_968);
        out.gl_Position.z = _3047;
    }
    if (_904)
    {
        out.m_45.x = 0.0;
    }
    if (_904)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _974 = -_970;
    float _976 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[18].w, _840);
    float _978 = _872 * _938;
    float _980 = -_972;
    float _982 = fma(_980, (*spvDescriptorSet0.vp_c9)._m0[18].w, _828);
    float _984 = -_970;
    float _986 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[18].w, _850);
    float _988 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _990 = _976 + _988;
    float _992 = -_978;
    float _994 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[18].w, _860);
    float _996 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _998 = _982 + _996;
    float _1000 = -_972;
    float _1002 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[18].w, _864);
    float _1004 = _990 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1006 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1008 = _994 + _1006;
    float _1010 = -_978;
    float _1012 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[18].w, _872);
    float _1014 = fma(_998, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1004);
    float _1016 = fma(_1008, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1014);
    bool _1018 = _1016 >= 0.0;
    float _1020 = _986 * _986;
    float _1022 = fma(_1002, _1002, _1020);
    float _1024 = fma(_1012, _1012, _1022);
    float _1026 = _998;
    if (_1018)
    {
        _1026 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1028 = _1026;
    if (_1018)
    {
        out.m_45.x = 0.0;
    }
    if (_1018)
    {
        float _1030 = _1028 * 5.0;
        _964 = as_type<int>(_1030);
    }
    int _1032 = _964;
    if (_1018)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3172 = as_type<float>(_1032);
        out.gl_Position.z = _3172;
    }
    if (_1018)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1034 = in.m_71.x;
    float _1036 = in.m_71.y;
    float _1038 = in.m_71.z;
    float _1040 = sqrt(_1024);
    float _1042 = _392 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1044 = _390 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1046 = _394 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1048 = _938 * _1040;
    float _1050 = _1048 * _1042;
    float _1052 = _1048 * _1044;
    float _1054 = _1048 * _1046;
    float _1056 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1036);
    float _1058 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1034);
    float _1060 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1038);
    float _1062 = _1050 * _1056;
    float _1064 = _1052 * _1058;
    float _1066 = _1054 * _1060;
    float _1068 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1070 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1072 = _1062 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1074 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1068);
    float _1076 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1070);
    float _1078 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1072);
    float _1080 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1074);
    float _1082 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1076);
    float _1084 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1078);
    float _1086 = _1080 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1088 = _1082 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1090 = _1084 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1092 = _860 + _1086;
    float _1094 = _828 + _1088;
    float _1096 = _840 + _1090;
    float _1098 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1100 = _1092 + _1098;
    float _1102 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1104 = _1094 + _1102;
    float _1106 = _1100 * _1100;
    float _1108 = fma(_1104, _1104, _1106);
    float _1110 = sqrt(_1108);
    bool _1112 = _1110 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1114 = _1066;
    float _1116 = _1084;
    float _1118 = _1090;
    float _1120 = _1094;
    float _1122 = _1096;
    float _1124 = _1046;
    if (!_1112)
    {
        _1114 = _1094;
    }
    float _1126 = _1114;
    float _1128 = _1126;
    if (!_1112)
    {
        _1116 = _1092;
    }
    float _1130 = _1116;
    float _1132 = _1130;
    if (!_1112)
    {
        _1118 = _1096;
    }
    float _1134 = _1118;
    bool _1136 = !_1112;
    float _1138 = _1134;
    if (!_1136)
    {
        float _1140 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1142 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1144 = _1110 + _1142;
        float _1146 = _1096 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1148 = rsqrt(_1108);
        float _1150 = _1144 * _1140;
        float _1152 = _1150 * 0.15915493667125701904296875;
        float _1154 = _1152 * 6.283185482025146484375;
        float _1156 = cos(_1154);
        float _1158 = _1152 * 6.283185482025146484375;
        float _1160 = sin(_1158);
        float _1162 = _1156 + (-1.0);
        float _1164 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1166 = fma(_1160, _1146, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1168 = fma(_1096, _1156, _1164);
        float _1170 = _1148 * _1166;
        float _1172 = fma(_1104, _1170, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1174 = fma(_1100, _1170, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1138 = _1168;
        _1128 = _1172;
        _1132 = _1174;
        _1120 = _1170;
    }
    float _1176 = _1138;
    float _1178 = _1128;
    float _1180 = _1132;
    float _1182 = _1120;
    float _1184 = -_970;
    float _1186 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1176);
    float _1188 = -_972;
    float _1190 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1178);
    float _1192 = -_978;
    float _1194 = fma(_1192, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1180);
    float _1196 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1198 = _1186 + _1196;
    float _1200 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1202 = _1190 + _1200;
    float _1204 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1206 = _1194 + _1204;
    float _1208 = _1198 * _1198;
    float _1210 = fma(_1202, _1202, _1208);
    float _1212 = fma(_1206, _1206, _1210);
    float _1214 = rsqrt(_1212);
    float _1216 = _1214 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1218 = _1202 * _1216;
    float _1220 = _1206 * _1216;
    float _1222 = _1218 * _1218;
    float _1224 = _1220 * _1220;
    float _1226 = _1222 + _1224;
    float _1228 = sqrt(_1226);
    bool _1230 = _1228 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1232 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1234 = _1228 + _1232;
    float _1236 = _1214;
    float _1238 = _1182;
    float _1240 = _1234;
    float _1242 = _1198;
    float _1244 = _1218;
    if (_1230)
    {
        float _1246 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1236 = _1246;
    }
    float _1248 = _1236;
    if (_1230)
    {
        float _1250 = rsqrt(_1226);
        _1238 = _1250;
    }
    float _1252 = _1238;
    float _1254 = _1252;
    if (_1230)
    {
        float _1256 = _1234 * _1248;
        _1240 = _1256;
    }
    float _1258 = _1240;
    if (_1230)
    {
        float _1260 = _1258 * 0.15915493667125701904296875;
        _1122 = _1260;
    }
    float _1262 = _1122;
    float _1264 = _1206;
    if (_1230)
    {
        float _1266 = _1262 * 6.283185482025146484375;
        float _1268 = sin(_1266);
        _1264 = _1268;
    }
    float _1270 = _1264;
    float _1272 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1274 = precise::max(0.0, _1272);
    float _1276 = _1248;
    float _1278 = _1274;
    if (_1230)
    {
        float _1280 = _1262 * 6.283185482025146484375;
        float _1282 = cos(_1280);
        _1276 = _1282;
    }
    float _1284 = _1276;
    float _1286 = -_1216;
    float _1288 = -_1274;
    float _1290 = fma(_1198, _1286, _1288);
    if (_1230)
    {
        float _1292 = _1290 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1242 = _1292;
    }
    float _1294 = _1242;
    float _1296 = sqrt(_1212);
    float _1298 = _1294;
    float _1300 = _1270;
    if (_1230)
    {
        float _1302 = fma(_1270, _1294, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1298 = _1302;
    }
    float _1304 = _1298;
    float _1306 = _1304;
    if (!_1230)
    {
        _1300 = _1290;
    }
    float _1308 = _1300;
    float _1310 = _1308;
    float _1312 = _1284;
    if (_1230)
    {
        float _1314 = _1284 + (-1.0);
        _1278 = _1314;
    }
    float _1316 = _1278;
    float _1318 = _1316;
    if (_1230)
    {
        float _1320 = _1252 * _1304;
        _1124 = _1320;
    }
    float _1322 = _1124;
    if (!_1230)
    {
        _1306 = _1222;
    }
    float _1324 = _1306;
    float _1326 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1328 = _1324;
    if (_1230)
    {
        float _1330 = _1316 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1254 = _1330;
    }
    float _1332 = _1254;
    if (_1230)
    {
        float _1334 = _1218 * _1322;
        _1244 = _1334;
    }
    float _1336 = _1244;
    if (!_1230)
    {
        _1318 = _1220;
    }
    float _1338 = _1318;
    float _1340 = _1338;
    if (_1230)
    {
        float _1342 = _1220 * _1322;
        _1340 = _1342;
    }
    float _1344 = _1340;
    if (_1230)
    {
        float _1346 = fma(_1290, _1284, _1332);
        _1310 = _1346;
    }
    float _1348 = _1310;
    if (_1230)
    {
        float _1350 = _1336 * _1336;
        _1328 = _1350;
    }
    float _1352 = _1328;
    if (!_1230)
    {
        _1312 = _1224;
    }
    float _1354 = _1312;
    float _1356 = _1354;
    if (_1230)
    {
        float _1358 = _1344 * _1344;
        _1356 = _1358;
    }
    float _1360 = _1356;
    float _1362 = fma(_1348, _1348, _1352);
    float _1364 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1366 = _1362 + _1360;
    float _1368 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1370 = fma(_1296, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1368);
    float _1372 = precise::clamp(_1370, 0.0, 1.0);
    float _1374 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1364);
    float _1376 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1378 = rsqrt(_1366);
    float _1380 = -_1372;
    float _1382 = _1380 + 1.0;
    float _1384 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1374);
    float _1386 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1388 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1376);
    float _1390 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1392 = _1384 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1394 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1386);
    float _1396 = abs(_1382);
    float _1398 = log2(_1396);
    float _1400 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1388);
    float _1402 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1326);
    float _1404 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1394);
    float _1406 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1408 = _1400 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1410 = fma(_1194, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1402);
    float _1412 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1414 = _1378 * _1336;
    float _1416 = -_1406;
    float _1418 = fma(_1416, _1390, 1.0);
    float _1420 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1422 = _1378 * _1348;
    float _1424 = _1414 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1426 = _1378 * _1344;
    float _1428 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1420);
    float _1430 = _1410 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1432 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1434 = -_1424;
    float _1436 = fma(_1422, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1434);
    float _1438 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1428);
    float _1440 = log2(_1418);
    float _1442 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1444 = -_1426;
    float _1446 = fma(_1444, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1436);
    float _1448 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1438);
    float _1450 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1452 = fma(_1446, -0.5, 0.5);
    float _1454 = fma(_1446, 0.5, 0.5);
    float _1456 = exp2(_1432);
    float _1458 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1450);
    float _1460 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1442);
    float _1462 = _1422 + 1.0;
    float _1464 = fma(_1454, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1466 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1458);
    float _1468 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1460);
    float _1470 = 1.0 / _1448;
    float _1472 = sqrt(_1452);
    float _1474 = -_1422;
    float _1476 = fma(_1456, _1462, _1474);
    float _1478 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1466);
    float _1480 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1468);
    float _1482 = fma(_1454, _1464, -0.212114393711090087890625);
    float _1484 = _1440 * 0.693147182464599609375;
    float _1486 = _1478 * _1470;
    float _1488 = _1480 * _1470;
    float _1490 = fma(_1454, _1482, 1.570728778839111328125);
    float _1492 = _1484 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1494 = fma(_1486, 0.5, 0.5);
    float _1496 = fma(_1488, -0.5, 0.5);
    float _1498 = fma(_1476, 0.5, 0.5);
    float _1500 = _1472 * 0.636619746685028076171875;
    float3 _3954 = float3(_1494, _1496, _1492);
    float _1502 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3954, float3(0.0), isnan(_3954)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3954, float3(0.0), isnan(_3954)), level(0.0)).x;
    float3 _3965 = float3(_1494, _1496, _1492);
    float4 _1505 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3965, float3(0.0), isnan(_3965)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3965, float3(0.0), isnan(_3965)), level(0.0)).xyzw;
    float _1507 = _1505.x;
    float _1509 = _1505.y;
    float _1511 = _1505.z;
    float _1513 = _1505.w;
    float _1515 = -_1490;
    float _1517 = fma(_1500, _1515, 1.0);
    float2 _3987 = float2(_1517, _1498);
    float3 _1521 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3987, float2(0.0), isnan(_3987)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3987, float2(0.0), isnan(_3987)), level(0.0)).xyz;
    float _1523 = _1521.x;
    float _1525 = _1521.y;
    float _1527 = _1521.z;
    float _1529 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1531 = _1398 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1533 = _1478 + _1448;
    float _1535 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1529);
    float _1537 = _1533 * 0.5;
    float _1539 = exp2(_1531);
    float _1541 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1535);
    float _1543 = fma(_1430, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1541);
    float _1545 = _1448 * 0.5;
    float _1547 = _1543 + _1448;
    float _1549 = -_1539;
    float _1551 = _1549 + 1.0;
    float _1553 = fma(_1480, -0.5, _1545);
    float _1555 = _1547 * 0.5;
    float _1557 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1478;
    out.gl_Position.y = _1480;
    out.gl_Position.z = _1543;
    out.gl_Position.w = _1448;
    float _1559 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.x = _1537;
    out.m_73.y = _1553;
    out.m_73.z = _1555;
    out.m_73.w = _1448;
    out.m_45.x = _1559;
    float _1561 = _1557 * _1502;
    float _1563 = -_1557;
    float _1565 = _1563 + 1.0;
    float _1567 = _1513 * _1561;
    float _1569 = _1527 * _1561;
    float _1571 = fma(_1523, _1567, _1507);
    float _1573 = fma(_1525, _1567, _1509);
    float _1575 = _1513 * _1565;
    float _1577 = fma(_1513, _1569, _1511);
    out.m_75.x = _1571;
    out.m_75.y = _1573;
    out.m_75.z = _1577;
    out.m_75.w = _1575;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

