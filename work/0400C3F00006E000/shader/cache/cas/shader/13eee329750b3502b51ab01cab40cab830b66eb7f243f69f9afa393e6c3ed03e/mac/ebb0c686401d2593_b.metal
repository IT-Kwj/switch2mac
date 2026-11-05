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
    float4 m_63 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_61 [[user(locn2)]];
    float4 m_73 [[user(locn3)]];
    float4 m_81 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_75 [[user(locn6)]];
    float4 m_79 [[user(locn8)]];
    float4 m_77 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_59 [[attribute(1)]];
    float4 m_51 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_71 [[attribute(5)]];
    float4 m_67 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_69 [[attribute(8)]];
    float4 m_55 [[attribute(10)]];
    float4 m_65 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2141 = false;
    bool _312 = false;
    bool _204 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_44.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    float _108 = as_type<float>(_100);
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _106;
    if (!_104)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2441 = as_type<float>(_116);
        out.gl_Position.z = _2441;
    }
    if (!_104)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _120 = in.m_49.w;
    float _122 = float(_100);
    float _124 = -_120;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_120);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    bool _138 = _126 >= _122;
    bool _140 = !_136;
    bool _142 = _138 || _140;
    float _144 = _126;
    if (_142)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _108;
    if (_142)
    {
        out.m_47.x = 0.0;
    }
    if (_142)
    {
        float _148 = _146 * 5.0;
        _118 = as_type<int>(_148);
    }
    int _150 = _118;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2505 = as_type<float>(_150);
        out.gl_Position.z = _2505;
    }
    if (_142)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _152 = in.m_51.x;
    float _154 = in.m_51.y;
    float _156 = in.m_51.z;
    float _158 = 1.0 / _122;
    bool _160 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _162 = _126 * _158;
    float _164 = _154 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _166 = _154 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _168 = _154 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _170 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[4].x, _164);
    float _172 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[5].x, _166);
    float _174 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[6].x, _168);
    float _176 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[4].z, _170);
    float _178 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[5].z, _172);
    float _180 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[6].z, _174);
    bool _182 = !_160;
    float _184 = _176;
    float _202;
    if (!_182)
    {
        float _186 = in.m_53.x;
        float _188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _192 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _194 = _192 * _188;
        float _196 = floor(_194);
        float _198 = -_196;
        float _200 = _194 + _198;
        _202 = _200;
        _204 = true;
    }
    else
    {
        _202 = _162;
    }
    _204 = false;
    float _206 = _202;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _210 = _206 + _208;
    bool _212 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _214 = isnan(_206);
    bool _216 = _212 || _214;
    bool _218 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _220 = _216 || _218;
    float _222 = float(_220);
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _224;
    bool _228 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _230 = isnan(_206);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    float _240 = -_222;
    float _242 = _240 + 1.0;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _244;
    float _248 = 1.0 / _226;
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _252 = _238 * _242;
    float _254 = -_238;
    float _256 = _254 + 1.0;
    float _258 = _210 * _248;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _260;
    float _264 = fma(_246, _258, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _266;
    float _270 = fma(_262, _258, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _272 = _264 * _252;
    float _274 = fma(_268, _258, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _276 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[143].x, _272);
    float _278 = _274 * _252;
    float _280 = _270 * _252;
    float _282 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[144].x, _276);
    float _284 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[143].y, _278);
    float _286 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[143].z, _280);
    float _288 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[144].y, _284);
    float _290 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[144].z, _286);
    bool _292 = !_250;
    float _310;
    if (!_292)
    {
        float _294 = in.m_53.x;
        float _296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _298 = _294 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _302 = _300 * _296;
        float _304 = floor(_302);
        float _306 = -_304;
        float _308 = _302 + _306;
        _310 = _308;
        _312 = true;
    }
    else
    {
        _310 = _162;
    }
    _312 = false;
    float _314 = _310;
    float _316 = in.m_53.y;
    float _318 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _320 = log2(_318);
    float _322 = in.m_44.x;
    float _324 = in.m_44.y;
    float _326 = in.m_44.z;
    int _328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _330 = _328 != 0;
    int _332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _334 = _332 != 0;
    float _336 = in.m_53.z;
    float _338 = abs(_162);
    float _340 = log2(_338);
    float _342 = in.m_55.y;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _348 = in.m_53.x;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _352 = _320 * _126;
    float _354 = in.m_55.x;
    float _356 = 1.0 / _346;
    float _358 = _350 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _360;
    bool _364 = _316 > 0.5;
    float _366 = _316 * 2.0;
    int _368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _370 = _368 != 0;
    int _372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _374 = _372 != 0;
    int _376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _378 = _376 != 0;
    float _380 = _324 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _382 = _324 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _384 = _324 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _386 = _336 * 2.0;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _394 = -_342;
    float _396 = _394 + 1.0;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _400 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[5].x, _382);
    float _402 = 1.0 / _392;
    float _404 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[6].x, _384);
    float _406 = _342;
    float _408 = _358;
    if (_330)
    {
        float _410 = _364 ? _396 : _342;
        _406 = _410;
    }
    float _412 = _406;
    float _414 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[5].z, _400);
    float _416 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[6].z, _404);
    bool _418 = _348 > 0.5;
    bool _420 = _418 && _334;
    float _422 = floor(_386);
    float _424 = _388 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _426 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[4].x, _380);
    float _428 = _348 * 2.0;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _436 = !_378;
    int _438 = _436 ? 0 : 1;
    float _440 = _430 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _442 = floor(_428);
    float _444 = _434 * _356;
    float _446 = _348 + _316;
    float _448 = _362 * _402;
    out.m_57.x = _358;
    out.m_57.y = _440;
    out.m_57.z = _424;
    out.m_57.w = _398;
    float _450 = _316 + _336;
    float _452 = _446 + (-1.0);
    bool _454 = _422 > 0.0;
    float _456 = _450 + (-1.0);
    bool _458 = _422 >= 0.0;
    bool _460 = isnan(_422);
    bool _462 = _458 || _460;
    bool _464 = isnan(0.0);
    bool _466 = _462 || _464;
    float _468 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _470 = exp2(_352);
    float _472 = _452;
    if (!_334)
    {
        _472 = _354;
    }
    float _474 = _472;
    float _476 = _474;
    if (_334)
    {
        _408 = _354;
    }
    float _478 = _408;
    float _480 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _482 = _466 ? 0 : 1;
    float _484 = floor(_366);
    bool _486 = _442 > 0.0;
    float _488 = _478;
    if (_420)
    {
        float _490 = -_478;
        float _492 = _490 + 1.0;
        _488 = _492;
    }
    float _494 = _488;
    bool _496 = _442 >= 0.0;
    bool _498 = isnan(_442);
    bool _500 = _496 || _498;
    bool _502 = isnan(0.0);
    bool _504 = _500 || _502;
    if (_334)
    {
        _476 = _494;
    }
    float _506 = _476;
    float _508 = -_470;
    float _510 = _508 + 1.0;
    bool _512 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _514 = isnan(_314);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _526 = 1.0 + _524;
    int _528 = ~_482;
    int _530 = _528 + 1;
    int _532 = _530 + 1;
    float _534 = _506 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _536 = _532;
    if (!_454)
    {
        int _538 = ~_482;
        int _540 = _538 + 1;
        _536 = _540;
    }
    int _542 = _536;
    float _544 = -_522;
    float _546 = _544 + 1.0;
    bool _548 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _550 = isnan(_314);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _562 = _314 + _560;
    bool _564 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _566 = isnan(0.0);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _572 = _568 || _570;
    float _574 = 1.0 / _526;
    bool _576 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _578 = isnan(_314);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _584 = _580 || _582;
    float _586 = float(_584);
    float _588 = _558 * _546;
    float _590 = fma(_448, _562, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _592 = -_558;
    float _594 = _592 + 1.0;
    bool _596 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _598 = isnan(1.0);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _604 = _600 || _602;
    float _606 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[4].z, _426);
    float _608 = _572 ? _510 : 0.0;
    float _610 = _414 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _612 = _586 * _594;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _616 = _314 + _614;
    float _618 = _606 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _620 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _622 = _610 + _620;
    float _624 = _590 * _612;
    float _626 = -_586;
    float _628 = _626 + 1.0;
    float _630 = fma(_444, _616, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _632 = _416 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _634 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _636 = _618 + _634;
    float _638 = _622 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _640 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _642 = _504 ? 0 : 1;
    float _644 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[115].x, _624);
    bool _646 = _484 > 0.0;
    float _648 = _610;
    if (_604)
    {
        float _650 = _608 * _574;
        _144 = _650;
    }
    float _652 = _144;
    float _654 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _656 = _632 + _654;
    float _658 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[28].x, _638);
    int _660 = ~_642;
    int _662 = _660 + 1;
    int _664 = _662 + 1;
    float _666 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _668 = _484 >= 0.0;
    bool _670 = isnan(_484);
    bool _672 = _668 || _670;
    bool _674 = isnan(0.0);
    bool _676 = _672 || _674;
    float _678 = fma(_656, (*spvDescriptorSet0.vp_c8)._m0[28].z, _658);
    int _680 = _664;
    if (!_486)
    {
        int _682 = ~_642;
        int _684 = _682 + 1;
        _680 = _684;
    }
    int _686 = _680;
    float _688 = _622 * _622;
    int _690 = _676 ? 0 : 1;
    float _692 = fma(_630, _588, _644);
    bool _694 = _678 >= 0.0;
    float _696 = fma(_636, _636, _688);
    int _698 = ~_690;
    int _700 = _698 + 1;
    int _702 = _700 + 1;
    float _704 = _412 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _706 = _702;
    int _708 = _686;
    if (!_646)
    {
        int _710 = ~_690;
        int _712 = _710 + 1;
        _706 = _712;
    }
    int _714 = _706;
    float _716 = fma(_656, _656, _696);
    float _718 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[117].x, _692);
    float _720 = _534 * _640;
    float _722 = in.m_59.x;
    float _724 = in.m_59.y;
    float _726 = in.m_59.z;
    float _728 = _704 * _666;
    float _730 = rsqrt(_716);
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _734 = !_370;
    int _736 = _734 ? 0 : 1;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _740 = !_374;
    int _742 = _740 ? 0 : 1;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _746 = abs(_736);
    float _748 = 0.0;
    if (_694)
    {
        _748 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _750 = _748;
    float _752 = _732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _754 = abs(_742);
    float _756 = _738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _758 = float(_746);
    float _760 = _744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _762 = float(_542);
    float _764 = _718 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _766 = float(_686);
    if (_694)
    {
        float _768 = _750 * 5.0;
        _708 = as_type<int>(_768);
    }
    int _770 = _708;
    float _772 = float(_754);
    float _774 = _758 * _762;
    out.m_61.x = _720;
    out.m_61.y = _728;
    float _776 = _622 * _730;
    float _778 = _772 * _766;
    out.m_63.x = _752;
    out.m_63.y = _756;
    out.m_63.z = _760;
    out.m_63.w = _764;
    float _780 = _774 * (-2.0);
    float _782 = _636 * _730;
    float _784 = as_type<float>(_770);
    if (_694)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3511 = as_type<float>(_770);
        out.gl_Position.z = _3511;
    }
    if (_694)
    {
        out.m_47.x = 0.0;
    }
    if (_694)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _786 = -_776;
    float _788 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[18].w, _610);
    float _790 = _656 * _730;
    float _792 = -_782;
    float _794 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[18].w, _618);
    float _796 = fma(_468, _780, _468);
    float _798 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _800 = _788 + _798;
    float _802 = fma(_780, _722, _722);
    float _804 = -_790;
    float _806 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[18].w, _632);
    float _808 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _810 = _794 + _808;
    float _812 = _800 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _814 = _348 + (-0.5);
    float _816 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _818 = _806 + _816;
    float _820 = _778 * (-2.0);
    float _822 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[28].x, _812);
    float _824 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[196].x, _802);
    float _826 = _316 + (-0.5);
    float _828 = fma(_820, _724, _724);
    float _830 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[28].z, _822);
    float _832 = fma(_480, _820, _480);
    float _834 = fma(_796, _652, _824);
    float _836 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[196].y, _828);
    int _838 = abs(_438);
    float _840 = _348 + _336;
    bool _842 = _830 >= 0.0;
    float _844 = -_776;
    float _846 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[18].w, _622);
    float _848 = _834 * 0.15915493667125701904296875;
    float _850 = fma(_832, _652, _836);
    float _852 = _340 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _854 = _840 + (-1.0);
    float _856 = float(_838);
    float _858 = -_782;
    float _860 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[18].w, _636);
    float _862 = float(_714);
    float _864 = _846 * _846;
    float _866 = exp2(_852);
    float _868 = _850 * 0.15915493667125701904296875;
    int _870 = as_type<int>(_846);
    float _872 = _790;
    if (_842)
    {
        _784 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _874 = _784;
    float _876 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _878 = _856 * _862;
    float _880 = fma(_860, _860, _864);
    float _882 = -_790;
    float _884 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[18].w, _656);
    if (_842)
    {
        float _886 = _874 * 5.0;
        _870 = as_type<int>(_886);
    }
    int _888 = _870;
    float _890 = _848 * 6.283185482025146484375;
    float _892 = sin(_890);
    float _894 = in.m_65.x;
    float _896 = in.m_65.y;
    float _898 = in.m_65.z;
    float _900 = _878 * (-2.0);
    float _902 = in.m_67.x;
    float _904 = in.m_67.y;
    float _906 = in.m_67.z;
    float _908 = _848 * 6.283185482025146484375;
    float _910 = cos(_908);
    if (_842)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3727 = as_type<float>(_888);
        out.gl_Position.z = _3727;
    }
    if (_842)
    {
        out.m_47.x = 0.0;
    }
    float _912 = _868 * 6.283185482025146484375;
    float _914 = sin(_912);
    float _916 = in.m_69.x;
    float _918 = in.m_69.y;
    float _920 = in.m_69.z;
    float _922 = _868 * 6.283185482025146484375;
    float _924 = cos(_922);
    if (_842)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _926 = -_610;
    float _928 = _926 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _930 = -_618;
    float _932 = _930 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _934 = -_632;
    float _936 = _934 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _938 = fma(_884, _884, _880);
    float _940 = _928 * _928;
    float _942 = fma(_900, _726, _726);
    float _944 = _336 + (-0.5);
    float _946 = fma(_932, _932, _940);
    float _948 = sqrt(_938);
    float _950 = fma(_876, _900, _876);
    float _952 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[196].z, _942);
    float _954 = fma(_936, _936, _946);
    float _956 = fma(_894, 2.0, -1.0);
    float _958 = fma(_896, 2.0, -1.0);
    float _960 = fma(_950, _652, _952);
    float _962 = fma(_898, 2.0, -1.0);
    float _964 = -_902;
    float _966 = _956 + _964;
    float _968 = rsqrt(_954);
    float _970 = _960 * 0.15915493667125701904296875;
    float _972 = -_906;
    float _974 = _962 + _972;
    float _976 = _282 * _916;
    float _978 = fma(_866, _966, _902);
    float _980 = -_904;
    float _982 = _958 + _980;
    float _984 = fma(_866, _974, _906);
    float _986 = _730 * _948;
    float _988 = _970 * 6.283185482025146484375;
    float _990 = sin(_988);
    float _992 = _288 * _918;
    float _994 = _290 * _920;
    float _996 = fma(_866, _982, _904);
    float _998 = _892 * _914;
    float _1000 = _910 * _924;
    float _1002 = _992 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1004 = _932 * _968;
    float _1006 = _936 * _968;
    float _1008 = _928 * _968;
    float _1010 = _970 * 6.283185482025146484375;
    float _1012 = cos(_1010);
    float _1014 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1016 = _1004 * _1014;
    float _1018 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1020 = _1006 * _1018;
    float _1022 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1024 = _1008 * _1022;
    float _1026 = _976 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1028 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1030 = -_1016;
    float _1032 = fma(_1006, _1028, _1030);
    float _1034 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1036 = -_1020;
    float _1038 = fma(_1008, _1034, _1036);
    float _1040 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1042 = -_1024;
    float _1044 = fma(_1004, _1040, _1042);
    float _1046 = fma(_990, _1000, _998);
    float _1048 = _1032 * _1032;
    float _1050 = _986 * _1002;
    float _1052 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _996);
    float _1054 = fma(_990, _998, _1000);
    float _1056 = fma(_1038, _1038, _1048);
    float _1058 = _994 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1060 = _910 * _914;
    float _1062 = _910 * _1012;
    float _1064 = fma(_1044, _1044, _1056);
    float _1066 = _892 * _924;
    float _1068 = _892 * _1012;
    float _1070 = _1052 * _1050;
    float _1072 = _986 * _1026;
    float _1074 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _978);
    float _1076 = rsqrt(_1064);
    float _1078 = _924 * _1012;
    float _1080 = _914 * _1012;
    float _1082 = _986 * _1058;
    float _1084 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _984);
    float _1086 = -_1060;
    float _1088 = fma(_990, _1066, _1086);
    float _1090 = -_1066;
    float _1092 = fma(_990, _1060, _1090);
    float _1094 = _1074 * _1072;
    float _1096 = _1062 * _1070;
    float _1098 = _1084 * _1082;
    float _1100 = -_1070;
    float _1102 = _990 * _1100;
    float _1104 = _1068 * _1070;
    float _1106 = fma(_1046, _1094, _1096);
    float _1108 = fma(_1078, _1094, _1102);
    float _1110 = fma(_1088, _1094, _1104);
    float _1112 = _1038 * _1076;
    float _1114 = _1032 * _1076;
    float _1116 = _1044 * _1076;
    float _1118 = fma(_1092, _1098, _1106);
    float _1120 = _1008 * _1112;
    float _1122 = _1006 * _1114;
    float _1124 = fma(_1080, _1098, _1108);
    float _1126 = fma(_1054, _1098, _1110);
    float _1128 = -_1120;
    float _1130 = fma(_1004, _1114, _1128);
    float _1132 = -_1122;
    float _1134 = fma(_1008, _1116, _1132);
    float _1136 = _1004 * _1116;
    float _1138 = _1130 * _1118;
    float _1140 = _1134 * _1118;
    float _1142 = -_1136;
    float _1144 = fma(_1006, _1112, _1142);
    float _1146 = fma(_1116, _1124, _1138);
    float _1148 = fma(_1112, _1124, _1140);
    float _1150 = _1144 * _1118;
    float _1152 = fma(_1006, _1126, _1146);
    float _1154 = fma(_1004, _1126, _1148);
    float _1156 = fma(_1114, _1124, _1150);
    float _1158 = _632 + _1152;
    float _1160 = _618 + _1154;
    float _1162 = fma(_1008, _1126, _1156);
    float _1164 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1166 = _1158 + _1164;
    float _1168 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1170 = _1160 + _1168;
    float _1172 = _610 + _1162;
    float _1174 = _1166 * _1166;
    float _1176 = fma(_1170, _1170, _1174);
    float _1178 = sqrt(_1176);
    bool _1180 = _1178 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1182 = _1174;
    float _1184 = _1124;
    float _1186 = _1150;
    if (!_1180)
    {
        _1182 = _1160;
    }
    float _1188 = _1182;
    float _1190 = _1188;
    if (!_1180)
    {
        _1184 = _1158;
    }
    float _1192 = _1184;
    float _1194 = _1192;
    if (!_1180)
    {
        _1186 = _1172;
    }
    float _1196 = _1186;
    bool _1198 = !_1180;
    float _1200 = _1196;
    if (!_1198)
    {
        float _1202 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1206 = _1178 + _1204;
        float _1208 = rsqrt(_1176);
        float _1210 = _1206 * _1202;
        float _1212 = _1172 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1214 = _1210 * 0.15915493667125701904296875;
        float _1216 = _1214 * 6.283185482025146484375;
        float _1218 = cos(_1216);
        float _1220 = _1214 * 6.283185482025146484375;
        float _1222 = sin(_1220);
        float _1224 = _1218 + (-1.0);
        float _1226 = fma(_1222, _1212, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1228 = _1224 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1230 = _1208 * _1226;
        float _1232 = fma(_1172, _1218, _1228);
        float _1234 = fma(_1170, _1230, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1236 = fma(_1166, _1230, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1200 = _1232;
        _1190 = _1234;
        _1194 = _1236;
    }
    float _1238 = _1200;
    float _1240 = _1190;
    float _1242 = _1194;
    float _1244 = -_610;
    float _1246 = _1244 + _1238;
    float _1248 = -_618;
    float _1250 = _1248 + _1240;
    float _1252 = -_632;
    float _1254 = _1252 + _1242;
    float _1256 = _1246 * _1246;
    bool _1258 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1260 = isnan(0.5);
    bool _1262 = _1258 || _1260;
    bool _1264 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1266 = _1262 || _1264;
    bool _1268 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1270 = isnan(0.5);
    bool _1272 = _1268 || _1270;
    bool _1274 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1276 = _1272 || _1274;
    float _1278 = fma(_1250, _1250, _1256);
    float _1280 = _788 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1282 = fma(_1254, _1254, _1278);
    float _1284 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1280);
    float _1286 = _788 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1288 = sqrt(_1282);
    float _1290 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1284);
    float _1292 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1286);
    float _1294 = _1290 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1296 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1292);
    float _1298 = _1296 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1300 = _1298 + _1294;
    bool _1302 = _1288 > 0.0;
    float _1304 = 1.0 / _1294;
    bool _1306 = !_1302;
    float _1308 = _1238;
    float _1310 = _1242;
    float _1312 = _1240;
    float _1314 = _1250;
    if (!_1306)
    {
        float _1316 = _178 * _178;
        float _1318 = fma(_176, _176, _1316);
        float _1320 = fma(_180, _180, _1318);
        float _1322 = rsqrt(_1282);
        float _1324 = sqrt(_1320);
        float _1326 = _1250 * _1322;
        float _1328 = _1254 * _1322;
        bool _1330 = _1324 > 0.0;
        float _1332 = _1246 * _1322;
        bool _1334 = !_1330;
        if (!_1334)
        {
            float _1336 = rsqrt(_1320);
            float _1338 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1340 = _178 * _1336;
            float _1342 = _176 * _1336;
            float _1344 = _1332 * _1340;
            float _1346 = _180 * _1336;
            float _1348 = fma(_1326, _1342, _1344);
            float _1350 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1352 = fma(_1328, _1346, _1348);
            float _1354 = _1352 * _1350;
            float _1356 = fma(_176, _1354, _1240);
            float _1358 = fma(_178, _1354, _1238);
            float _1360 = fma(_180, _1354, _1242);
            _1308 = _1358;
            _1310 = _1360;
            _1312 = _1356;
            _1314 = _1354;
        }
    }
    float _1362 = _1308;
    float _1364 = _1310;
    float _1366 = _1312;
    float _1368 = _1314;
    float _1370 = -_776;
    float _1372 = fma(_1370, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1362);
    float _1374 = -_790;
    float _1376 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1364);
    float _1378 = -_782;
    float _1380 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1366);
    float _1382 = _1300 * _1304;
    float _1384 = _1382 * 0.5;
    float _1386 = _1372;
    float _1388 = _1380;
    float _1390 = _1364;
    float _1392 = _1368;
    if (_1276)
    {
        _184 = 1.0;
    }
    float _1394 = _184;
    float _1396 = _1394;
    if (_1266)
    {
        _872 = _1372;
    }
    float _1398 = _872;
    float _1400 = _1398;
    if (_1266)
    {
        _1386 = _1376;
    }
    float _1402 = _1386;
    float _1404 = _1402;
    if (!_1266)
    {
        float _1406 = _800 * _800;
        float _1408 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1410 = -_632;
        float _1412 = _1410 + _1364;
        float _1414 = -_618;
        float _1416 = _1414 + _1366;
        float _1418 = fma(_810, _810, _1406);
        float _1420 = -_610;
        float _1422 = _1420 + _1362;
        float _1424 = fma(_818, _818, _1418);
        float _1426 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1428 = sqrt(_1424);
        float _1430 = 1.0 / _986;
        float _1432 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1434 = precise::min(_1428, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1436 = _1434 * _1408;
        float _1438 = _1436 * _1430;
        float _1440 = _1432 * _1438;
        float _1442 = _1412 * _1438;
        float _1444 = fma(_1416, _1440, _794);
        float _1446 = fma(_1422, _1440, _788);
        float _1448 = fma(_1432, _1442, _806);
        _1400 = _1446;
        _1388 = _1444;
        _1404 = _1448;
        _1390 = _1442;
    }
    float _1450 = _1400;
    float _1452 = _1388;
    float _1454 = _1404;
    float _1456 = _1390;
    float _1458 = _1456;
    if (!_1276)
    {
        float _1460 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1462 = _1460 * 0.15915493667125701904296875;
        float _1464 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1468 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1466);
        float _1470 = _1462 * 6.283185482025146484375;
        float _1472 = cos(_1470);
        float _1474 = _1464 * 0.15915493667125701904296875;
        float _1476 = _1462 * 6.283185482025146484375;
        float _1478 = sin(_1476);
        float _1480 = 1.0 / _1472;
        float _1482 = _1474 * 6.283185482025146484375;
        float _1484 = cos(_1482);
        float _1486 = _1478 * _1480;
        float _1488 = _1474 * 6.283185482025146484375;
        float _1490 = sin(_1488);
        float _1492 = _1484 * _1486;
        float _1494 = 1.0 / _1468;
        float _1496 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1498 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1496;
        float _1500 = 1.0 / _1492;
        float _1502 = 1.0 / _1498;
        float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1506 = _1494 * _1504;
        float _1508 = _1490 * _1500;
        float _1510 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1512 = fma(_1508, _1506, _1510);
        float _1514 = _1512 * _1502;
        float _1516 = precise::clamp(_1514, 0.0, 1.0);
        _1458 = _1502;
        _1396 = _1516;
    }
    float _1518 = _1458;
    float _1520 = _1396;
    float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1524 = _1450 + _1522;
    float _1526 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1528 = _1452 + _1526;
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1532 = _1454 + _1530;
    float _1534 = _1524 * _1524;
    float _1536 = fma(_1528, _1528, _1534);
    float _1538 = fma(_1532, _1532, _1536);
    float _1540 = rsqrt(_1538);
    float _1542 = sqrt(_1538);
    float _1544 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1546 = _1528 * _1544;
    float _1548 = _1532 * _1544;
    float _1550 = _1546 * _1546;
    float _1552 = _1548 * _1548;
    float _1554 = _1550 + _1552;
    float _1556 = sqrt(_1554);
    bool _1558 = _1556 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1562 = _1556 + _1560;
    float _1564 = _1532;
    float _1566 = _1518;
    float _1568 = _1562;
    float _1570 = _1524;
    if (_1558)
    {
        float _1572 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1564 = _1572;
    }
    float _1574 = _1564;
    if (_1558)
    {
        float _1576 = rsqrt(_1554);
        _1566 = _1576;
    }
    float _1578 = _1566;
    float _1580 = _1578;
    if (_1558)
    {
        float _1582 = _1562 * _1574;
        _1568 = _1582;
    }
    float _1584 = _1568;
    if (_1558)
    {
        float _1586 = _1584 * 0.15915493667125701904296875;
        _1392 = _1586;
    }
    float _1588 = _1392;
    float _1590 = _1534;
    if (_1558)
    {
        float _1592 = _1588 * 6.283185482025146484375;
        float _1594 = sin(_1592);
        _1590 = _1594;
    }
    float _1596 = _1590;
    float _1598 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1600 = precise::max(0.0, _1598);
    float _1602 = _1540;
    float _1604 = _1600;
    float _1606 = _1598;
    if (_1558)
    {
        float _1608 = _1588 * 6.283185482025146484375;
        float _1610 = cos(_1608);
        _1602 = _1610;
    }
    float _1612 = _1602;
    float _1614 = -_1544;
    float _1616 = -_1600;
    float _1618 = fma(_1524, _1614, _1616);
    if (!_1558)
    {
        _1604 = _1546;
    }
    float _1620 = _1604;
    float _1622 = _1620;
    if (_1558)
    {
        float _1624 = _1618 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1606 = _1624;
    }
    float _1626 = _1606;
    float _1628 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1630 = _1626;
    float _1632 = _1596;
    if (_1558)
    {
        float _1634 = fma(_1596, _1626, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1630 = _1634;
    }
    float _1636 = _1630;
    float _1638 = _1636;
    if (!_1558)
    {
        _1632 = _1550;
    }
    float _1640 = _1632;
    float _1642 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1644 = _1640;
    float _1646 = _1612;
    if (_1558)
    {
        float _1648 = _1612 + (-1.0);
        _1570 = _1648;
    }
    float _1650 = _1570;
    float _1652 = _1650;
    if (_1558)
    {
        float _1654 = _1578 * _1636;
        _648 = _1654;
    }
    float _1656 = _648;
    if (!_1558)
    {
        _1638 = _1618;
    }
    float _1658 = _1638;
    float _1660 = _1658;
    if (_1558)
    {
        float _1662 = _1650 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1580 = _1662;
    }
    float _1664 = _1580;
    if (_1558)
    {
        float _1666 = _1546 * _1656;
        _1622 = _1666;
    }
    float _1668 = _1622;
    if (!_1558)
    {
        _1652 = _1548;
    }
    float _1670 = _1652;
    float _1672 = _1670;
    if (_1558)
    {
        float _1674 = _1548 * _1656;
        _1672 = _1674;
    }
    float _1676 = _1672;
    if (_1558)
    {
        float _1678 = fma(_1618, _1612, _1664);
        _1660 = _1678;
    }
    float _1680 = _1660;
    if (_1558)
    {
        float _1682 = _1668 * _1668;
        _1644 = _1682;
    }
    float _1684 = _1644;
    if (!_1558)
    {
        _1646 = _1552;
    }
    float _1686 = _1646;
    float _1688 = _1686;
    if (_1558)
    {
        float _1690 = _1676 * _1676;
        _1688 = _1690;
    }
    float _1692 = _1688;
    float _1694 = fma(_1680, _1680, _1684);
    float _1696 = _1694 + _1692;
    float _1698 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1628);
    float _1700 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1702 = fma(_1542, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1700);
    float _1704 = precise::clamp(_1702, 0.0, 1.0);
    float _1706 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1708 = rsqrt(_1696);
    float _1710 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1698);
    float _1712 = -_1704;
    float _1714 = _1712 + 1.0;
    float _1716 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1718 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1706);
    float _1720 = _1710 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1722 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1724 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1716);
    float _1726 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1718);
    float _1728 = abs(_1714);
    float _1730 = log2(_1728);
    float _1732 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1722);
    float _1734 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1724);
    float _1736 = _1726 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1738 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1740 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1732);
    float _1742 = _1734 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1744 = _1708 * _1668;
    float _1746 = _1708 * _1680;
    float _1748 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1750 = _1708 * _1676;
    float _1752 = _1744 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1754 = _1740 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1756 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1748);
    float _1758 = -_1738;
    float _1760 = fma(_1758, _1642, 1.0);
    float _1762 = -_1752;
    float _1764 = fma(_1746, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1762);
    float _1766 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1768 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1756);
    float _1770 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1772 = -_1750;
    float _1774 = fma(_1772, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1764);
    float _1776 = log2(_1760);
    float _1778 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1768);
    float _1780 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1782 = fma(_1774, -0.5, 0.5);
    float _1784 = fma(_1774, 0.5, 0.5);
    float _1786 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1770);
    float _1788 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1780);
    float _1790 = 1.0 / _1778;
    float _1792 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1786);
    float _1794 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1788);
    float _1796 = fma(_1784, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1798 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1792);
    float _1800 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1794);
    float _1802 = fma(_1784, _1796, -0.212114393711090087890625);
    float _1804 = sqrt(_1782);
    float _1806 = _1776 * 0.693147182464599609375;
    float _1808 = fma(_1784, _1802, 1.570728778839111328125);
    float _1810 = _1806 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1812 = exp2(_1766);
    float _1814 = _1800 * _1790;
    float _1816 = _1798 * _1790;
    float _1818 = fma(_1814, 0.5, 0.5);
    float _1820 = fma(_1816, -0.5, 0.5);
    float _1822 = _1804 * 0.636619746685028076171875;
    float _1824 = _1746 + 1.0;
    float3 _5167 = float3(_1818, _1820, _1810);
    float _1826 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5167, float3(0.0), isnan(_5167)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5167, float3(0.0), isnan(_5167)), level(0.0)).x;
    float _1828 = -_1808;
    float _1830 = fma(_1822, _1828, 1.0);
    float _1832 = -_1746;
    float _1834 = fma(_1812, _1824, _1832);
    float _1836 = fma(_1834, 0.5, 0.5);
    float3 _5191 = float3(_1818, _1820, _1810);
    float4 _1839 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5191, float3(0.0), isnan(_5191)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5191, float3(0.0), isnan(_5191)), level(0.0)).xyzw;
    float _1841 = _1839.x;
    float _1843 = _1839.y;
    float _1845 = _1839.z;
    float _1847 = _1839.w;
    float2 _5208 = float2(_1830, _1836);
    float3 _1851 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5208, float2(0.0), isnan(_5208)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5208, float2(0.0), isnan(_5208)), level(0.0)).xyz;
    float _1853 = _1851.x;
    float _1855 = _1851.y;
    float _1857 = _1851.z;
    float _1859 = in.m_71.x;
    float _1861 = in.m_71.y;
    float _1863 = in.m_71.z;
    bool _1865 = _996 != 0.0;
    bool _1867 = isnan(_996);
    bool _1869 = _1865 || _1867;
    bool _1871 = isnan(0.0);
    bool _1873 = _1869 || _1871;
    float _1875 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1877 = _1062 * _1134;
    float _1879 = _1062 * _1144;
    bool _1881 = _978 == 0.0;
    bool _1883 = !_1873;
    bool _1885 = _1881 && _1883;
    float _1887 = _1062 * _1130;
    float _1889 = _1046 * _1134;
    float _1891 = exp2(_1875);
    bool _1893 = _984 == 0.0;
    bool _1895 = _1893 && _1885;
    float _1897 = -_990;
    float _1899 = fma(_1897, _1112, _1877);
    float _1901 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1903 = _1046 * _1144;
    float _1905 = _1046 * _1130;
    float _1907 = _1092 * _1134;
    float _1909 = _1092 * _1144;
    float _1911 = _1092 * _1130;
    float _1913 = -_990;
    float _1915 = fma(_1913, _1114, _1879);
    float _1917 = -_990;
    float _1919 = fma(_1917, _1116, _1887);
    float _1921 = fma(_1078, _1112, _1889);
    float _1923 = fma(_1068, _1004, _1899);
    float _1925 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1901);
    float _1927 = fma(_1078, _1114, _1903);
    float _1929 = fma(_1078, _1116, _1905);
    float _1931 = _1861;
    float _1933 = _1859;
    float _1935 = _1863;
    float _1937 = _1778;
    float _1939 = _1798;
    if (!_1895)
    {
        float _1941 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1861);
        _1931 = _1941;
    }
    float _1943 = _1931;
    float _1945 = -_1891;
    float _1947 = _1945 + 1.0;
    float _1949 = fma(_1080, _1112, _1907);
    float _1951 = fma(_1080, _1114, _1909);
    float _1953 = fma(_1080, _1116, _1911);
    float _1955 = fma(_1068, _1008, _1915);
    float _1957 = fma(_1068, _1006, _1919);
    float _1959 = fma(_1088, _1004, _1921);
    if (!_1895)
    {
        float _1961 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1859);
        _1933 = _1961;
    }
    float _1963 = _1933;
    float _1965 = _1923 * _1943;
    float _1967 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1925);
    float _1969 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1971 = fma(_1088, _1008, _1927);
    float _1973 = fma(_1088, _1006, _1929);
    float _1975 = _1955 * _1943;
    float _1977 = _1957 * _1943;
    float _1979 = fma(_1054, _1004, _1949);
    float _1981 = fma(_1959, _1963, _1965);
    if (!_1895)
    {
        float _1983 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1863);
        _1935 = _1983;
    }
    float _1985 = _1935;
    float _1987 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1967);
    float _1989 = fma(_1971, _1963, _1975);
    float _1991 = fma(_1973, _1963, _1977);
    float _1993 = fma(_1979, _1985, _1981);
    float _1995 = _1987 + _1778;
    float _1997 = fma(_1054, _1008, _1951);
    float _1999 = fma(_1054, _1006, _1953);
    float _2001 = _1995 * 0.5;
    float _2003 = fma(_1997, _1985, _1989);
    float _2005 = fma(_1999, _1985, _1991);
    bool _2007 = _1542 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2009 = isnan(_1542);
    bool _2011 = _2007 || _2009;
    bool _2013 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2015 = _2011 || _2013;
    out.m_73.z = _2001;
    out.m_73.w = _1778;
    out.m_75.x = _1993;
    out.m_75.y = _2003;
    out.m_75.z = _2005;
    out.gl_Position.x = _1800;
    out.gl_Position.y = _1798;
    out.gl_Position.z = _1987;
    out.gl_Position.w = _1778;
    float _2017 = _1987;
    float _2019 = _1800;
    if (!_2015)
    {
        _1937 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2021 = _1937;
    float _2023 = _2021;
    float _2025 = _2021;
    if (!_2015)
    {
        _2017 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2027 = _2017;
    float _2029 = _2027;
    float _2031 = _2027;
    if (!_2015)
    {
        _1939 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2033 = _1939;
    float _2035 = _2033;
    float _2037 = _2033;
    if (!_2015)
    {
        _2019 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2039 = _2019;
    float _2041 = _1969 * _1826;
    float _2043 = -_1969;
    float _2045 = _2043 + 1.0;
    float _2047 = _1847 * _2041;
    float _2049 = _1847 * _2045;
    float _2051 = _1857 * _2041;
    float _2053 = fma(_1853, _2047, _1841);
    float _2055 = fma(_1855, _2047, _1843);
    float _2057 = _1843;
    float _2059 = _1841;
    float _2061 = _2039;
    float _2063 = _2039;
    if (!_2015)
    {
        _2057 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2065 = _2057;
    float _2067 = fma(_1847, _2051, _1845);
    float _2069 = _2065;
    float _2071 = _2065;
    if (!_2015)
    {
        _2059 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2073 = _2059;
    out.m_77.x = _2053;
    out.m_77.y = _2055;
    out.m_77.z = _2067;
    out.m_77.w = _2049;
    bool _2075 = !_2015;
    float _2077 = _2073;
    float _2079 = _2073;
    if (!_2075)
    {
        bool _2081 = _1542 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2083 = isnan(_1542);
        bool _2085 = _2081 || _2083;
        bool _2087 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2089 = _2085 || _2087;
        if (!_2089)
        {
            float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2093 = _1542 + _2091;
            float _2095 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2097 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2095;
            float _2099 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2101 = _2099 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2103 = 1.0 / _2097;
            float _2105 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2107 = _2105 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2109 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2111 = _2109 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2113 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2115 = _2113 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2117 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2119 = _2117 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2121 = _2093 * _2103;
            float _2123 = precise::clamp(_2121, 0.0, 1.0);
            float _2125 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2127 = _2125 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2129 = fma(_2123, _2101, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2131 = fma(_2123, _2127, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2133 = fma(_2123, _2107, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2135 = fma(_2123, _2111, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2137 = fma(_2123, _2115, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2139 = fma(_2123, _2119, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2079 = _2133;
            _2037 = _2137;
            _2071 = _2129;
            _2031 = _2135;
            _2025 = _2131;
            _2063 = _2139;
            _2141 = true;
        }
        else
        {
            bool _2143 = _1542 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2145 = isnan(_1542);
            bool _2147 = _2143 || _2145;
            bool _2149 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2151 = _2147 || _2149;
            if (!_2151)
            {
                _2069 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2153 = _2069;
            _2071 = _2153;
            if (!_2151)
            {
                _2077 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2155 = _2077;
            _2079 = _2155;
            if (!_2151)
            {
                _2023 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2157 = _2023;
            _2025 = _2157;
            if (!_2151)
            {
                _2029 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2159 = _2029;
            _2031 = _2159;
            if (!_2151)
            {
                _2035 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2161 = _2035;
            _2037 = _2161;
            if (!_2151)
            {
                _2061 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2163 = _2061;
            bool _2165 = !_2151;
            _2063 = _2163;
            if (!_2165)
            {
                bool _2167 = _1542 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2169 = isnan(_1542);
                bool _2171 = _2167 || _2169;
                bool _2173 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2175 = _2171 || _2173;
                if (!_2175)
                {
                    float _2177 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2179 = _1542 + _2177;
                    float _2181 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2183 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2181;
                    float _2185 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2187 = _2185 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2189 = 1.0 / _2183;
                    float _2191 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2193 = _2191 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2195 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2197 = _2195 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2199 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2201 = _2199 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2203 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2205 = _2203 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2207 = _2179 * _2189;
                    float _2209 = precise::clamp(_2207, 0.0, 1.0);
                    float _2211 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2213 = _2211 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2215 = fma(_2209, _2187, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2217 = fma(_2209, _2213, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2219 = fma(_2209, _2193, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2221 = fma(_2209, _2197, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2223 = fma(_2209, _2201, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2225 = fma(_2209, _2205, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2079 = _2219;
                    _2037 = _2223;
                    _2071 = _2215;
                    _2031 = _2221;
                    _2025 = _2217;
                    _2063 = _2225;
                    _2141 = true;
                }
                else
                {
                    _2079 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2037 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2071 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2031 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2025 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2063 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2141 = false;
    float _2227 = _2079;
    float _2229 = _2037;
    float _2231 = _2071;
    float _2233 = _2031;
    float _2235 = _2025;
    float _2237 = _2063;
    float _2239 = fma(_2003, -0.5, 0.5);
    float _2241 = precise::clamp(_2239, 0.0, 1.0);
    float _2243 = -_2227;
    float _2245 = _2243 + _2229;
    float _2247 = -_2231;
    float _2249 = _2247 + _2233;
    out.m_79.x = 0.0;
    float _2251 = fma(_2241, _2245, _2227);
    float _2253 = -_2235;
    float _2255 = _2253 + _2237;
    float _2257 = fma(_2241, _2249, _2231);
    float _2259 = _2251 * 0.586610972881317138671875;
    bool _2261 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2263 = fma(_2241, _2255, _2235);
    float _2265 = _1520 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2267 = fma(_2257, 0.298911988735198974609375, _2259);
    bool _2269 = _1520 > 0.0;
    bool _2271 = isnan(_1520);
    bool _2273 = _2269 || _2271;
    bool _2275 = isnan(0.0);
    bool _2277 = _2273 || _2275;
    float _2279 = fma(_2263, 0.114477999508380889892578125, _2267);
    out.m_47.x = _2265;
    float _2281 = -_2279;
    float _2283 = _2257 + _2281;
    float _2285 = -_2279;
    float _2287 = _2251 + _2285;
    float _2289 = -_2279;
    float _2291 = _2263 + _2289;
    float _2293 = fma(_2283, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2279);
    float _2295 = fma(_2287, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2279);
    float _2297 = fma(_2291, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2279);
    bool _2299 = !_2261;
    if (!_2299)
    {
        float _2301 = -_1450;
        float _2303 = _2301 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2305 = -_1452;
        float _2307 = _2305 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2309 = -_1454;
        float _2311 = _2309 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2313 = _2303 * _2303;
        float _2315 = fma(_2307, _2307, _2313);
        float _2317 = fma(_2311, _2311, _2315);
        float _2319 = sqrt(_2317);
        float _2321 = rsqrt(_2317);
        float _2323 = -_2319;
        float _2325 = _2323 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2327 = _2325 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2329 = precise::clamp(_2327, 0.0, 1.0);
        float _2331 = _2307 * _2321;
        float _2333 = _2303 * _2321;
        float _2335 = abs(_2329);
        float _2337 = log2(_2335);
        float _2339 = _2311 * _2321;
        float _2341 = _2331 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2343 = _2003 * _2333;
        float _2345 = -_2333;
        float _2347 = -_2341;
        float _2349 = fma(_2345, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2347);
        float _2351 = fma(_1993, _2331, _2343);
        float _2353 = -_2339;
        float _2355 = fma(_2353, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2349);
        float _2357 = fma(_2005, _2339, _2351);
        float _2359 = precise::clamp(_2357, 0.0, 1.0);
        float _2361 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2363 = _2355 + _2361;
        float _2365 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2367 = _2363 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2369 = precise::clamp(_2367, 0.0, 1.0);
        float _2371 = exp2(_2365);
        float _2373 = _2371 * _2369;
        float _2375 = _2359 * _2373;
        float _2377 = _2375 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2379 = _2375 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2381 = _2375 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_79.x = _2377;
        out.m_79.y = _2379;
        out.m_79.z = _2381;
    }
    out.m_81.x = _2293;
    out.m_81.y = _2295;
    out.m_81.z = _2297;
    if (_2277)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2383 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2383;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2141 = false;
    bool _312 = false;
    bool _204 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_44.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    float _108 = as_type<float>(_100);
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _106;
    if (!_104)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2441 = as_type<float>(_116);
        out.gl_Position.z = _2441;
    }
    if (!_104)
    {
        return out;
    }
    float _120 = in.m_49.w;
    float _122 = float(_100);
    float _124 = -_120;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_120);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    bool _138 = _126 >= _122;
    bool _140 = !_136;
    bool _142 = _138 || _140;
    float _144 = _126;
    if (_142)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _108;
    if (_142)
    {
        out.m_47.x = 0.0;
    }
    if (_142)
    {
        float _148 = _146 * 5.0;
        _118 = as_type<int>(_148);
    }
    int _150 = _118;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2505 = as_type<float>(_150);
        out.gl_Position.z = _2505;
    }
    if (_142)
    {
        return out;
    }
    float _152 = in.m_51.x;
    float _154 = in.m_51.y;
    float _156 = in.m_51.z;
    float _158 = 1.0 / _122;
    bool _160 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _162 = _126 * _158;
    float _164 = _154 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _166 = _154 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _168 = _154 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _170 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[4].x, _164);
    float _172 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[5].x, _166);
    float _174 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[6].x, _168);
    float _176 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[4].z, _170);
    float _178 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[5].z, _172);
    float _180 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[6].z, _174);
    bool _182 = !_160;
    float _184 = _176;
    float _202;
    if (!_182)
    {
        float _186 = in.m_53.x;
        float _188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _192 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _194 = _192 * _188;
        float _196 = floor(_194);
        float _198 = -_196;
        float _200 = _194 + _198;
        _202 = _200;
        _204 = true;
    }
    else
    {
        _202 = _162;
    }
    _204 = false;
    float _206 = _202;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _210 = _206 + _208;
    bool _212 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _214 = isnan(_206);
    bool _216 = _212 || _214;
    bool _218 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _220 = _216 || _218;
    float _222 = float(_220);
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _224;
    bool _228 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _230 = isnan(_206);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    float _240 = -_222;
    float _242 = _240 + 1.0;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _244;
    float _248 = 1.0 / _226;
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _252 = _238 * _242;
    float _254 = -_238;
    float _256 = _254 + 1.0;
    float _258 = _210 * _248;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _260;
    float _264 = fma(_246, _258, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _266;
    float _270 = fma(_262, _258, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _272 = _264 * _252;
    float _274 = fma(_268, _258, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _276 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[143].x, _272);
    float _278 = _274 * _252;
    float _280 = _270 * _252;
    float _282 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[144].x, _276);
    float _284 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[143].y, _278);
    float _286 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[143].z, _280);
    float _288 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[144].y, _284);
    float _290 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[144].z, _286);
    bool _292 = !_250;
    float _310;
    if (!_292)
    {
        float _294 = in.m_53.x;
        float _296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _298 = _294 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _302 = _300 * _296;
        float _304 = floor(_302);
        float _306 = -_304;
        float _308 = _302 + _306;
        _310 = _308;
        _312 = true;
    }
    else
    {
        _310 = _162;
    }
    _312 = false;
    float _314 = _310;
    float _316 = in.m_53.y;
    float _318 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _320 = log2(_318);
    float _322 = in.m_44.x;
    float _324 = in.m_44.y;
    float _326 = in.m_44.z;
    int _328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _330 = _328 != 0;
    int _332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _334 = _332 != 0;
    float _336 = in.m_53.z;
    float _338 = abs(_162);
    float _340 = log2(_338);
    float _342 = in.m_55.y;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _348 = in.m_53.x;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _352 = _320 * _126;
    float _354 = in.m_55.x;
    float _356 = 1.0 / _346;
    float _358 = _350 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _360;
    bool _364 = _316 > 0.5;
    float _366 = _316 * 2.0;
    int _368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _370 = _368 != 0;
    int _372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _374 = _372 != 0;
    int _376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _378 = _376 != 0;
    float _380 = _324 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _382 = _324 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _384 = _324 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _386 = _336 * 2.0;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _394 = -_342;
    float _396 = _394 + 1.0;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _400 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[5].x, _382);
    float _402 = 1.0 / _392;
    float _404 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[6].x, _384);
    float _406 = _342;
    float _408 = _358;
    if (_330)
    {
        float _410 = _364 ? _396 : _342;
        _406 = _410;
    }
    float _412 = _406;
    float _414 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[5].z, _400);
    float _416 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[6].z, _404);
    bool _418 = _348 > 0.5;
    bool _420 = _418 && _334;
    float _422 = floor(_386);
    float _424 = _388 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _426 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[4].x, _380);
    float _428 = _348 * 2.0;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _436 = !_378;
    int _438 = _436 ? 0 : 1;
    float _440 = _430 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _442 = floor(_428);
    float _444 = _434 * _356;
    float _446 = _348 + _316;
    float _448 = _362 * _402;
    out.m_57.x = _358;
    out.m_57.y = _440;
    out.m_57.z = _424;
    out.m_57.w = _398;
    float _450 = _316 + _336;
    float _452 = _446 + (-1.0);
    bool _454 = _422 > 0.0;
    float _456 = _450 + (-1.0);
    bool _458 = _422 >= 0.0;
    bool _460 = isnan(_422);
    bool _462 = _458 || _460;
    bool _464 = isnan(0.0);
    bool _466 = _462 || _464;
    float _468 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _470 = exp2(_352);
    float _472 = _452;
    if (!_334)
    {
        _472 = _354;
    }
    float _474 = _472;
    float _476 = _474;
    if (_334)
    {
        _408 = _354;
    }
    float _478 = _408;
    float _480 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _482 = _466 ? 0 : 1;
    float _484 = floor(_366);
    bool _486 = _442 > 0.0;
    float _488 = _478;
    if (_420)
    {
        float _490 = -_478;
        float _492 = _490 + 1.0;
        _488 = _492;
    }
    float _494 = _488;
    bool _496 = _442 >= 0.0;
    bool _498 = isnan(_442);
    bool _500 = _496 || _498;
    bool _502 = isnan(0.0);
    bool _504 = _500 || _502;
    if (_334)
    {
        _476 = _494;
    }
    float _506 = _476;
    float _508 = -_470;
    float _510 = _508 + 1.0;
    bool _512 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _514 = isnan(_314);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _526 = 1.0 + _524;
    int _528 = ~_482;
    int _530 = _528 + 1;
    int _532 = _530 + 1;
    float _534 = _506 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _536 = _532;
    if (!_454)
    {
        int _538 = ~_482;
        int _540 = _538 + 1;
        _536 = _540;
    }
    int _542 = _536;
    float _544 = -_522;
    float _546 = _544 + 1.0;
    bool _548 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _550 = isnan(_314);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _562 = _314 + _560;
    bool _564 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _566 = isnan(0.0);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _572 = _568 || _570;
    float _574 = 1.0 / _526;
    bool _576 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _578 = isnan(_314);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _584 = _580 || _582;
    float _586 = float(_584);
    float _588 = _558 * _546;
    float _590 = fma(_448, _562, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _592 = -_558;
    float _594 = _592 + 1.0;
    bool _596 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _598 = isnan(1.0);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _604 = _600 || _602;
    float _606 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[4].z, _426);
    float _608 = _572 ? _510 : 0.0;
    float _610 = _414 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _612 = _586 * _594;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _616 = _314 + _614;
    float _618 = _606 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _620 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _622 = _610 + _620;
    float _624 = _590 * _612;
    float _626 = -_586;
    float _628 = _626 + 1.0;
    float _630 = fma(_444, _616, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _632 = _416 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _634 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _636 = _618 + _634;
    float _638 = _622 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _640 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _642 = _504 ? 0 : 1;
    float _644 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[115].x, _624);
    bool _646 = _484 > 0.0;
    float _648 = _610;
    if (_604)
    {
        float _650 = _608 * _574;
        _144 = _650;
    }
    float _652 = _144;
    float _654 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _656 = _632 + _654;
    float _658 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[28].x, _638);
    int _660 = ~_642;
    int _662 = _660 + 1;
    int _664 = _662 + 1;
    float _666 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _668 = _484 >= 0.0;
    bool _670 = isnan(_484);
    bool _672 = _668 || _670;
    bool _674 = isnan(0.0);
    bool _676 = _672 || _674;
    float _678 = fma(_656, (*spvDescriptorSet0.vp_c8)._m0[28].z, _658);
    int _680 = _664;
    if (!_486)
    {
        int _682 = ~_642;
        int _684 = _682 + 1;
        _680 = _684;
    }
    int _686 = _680;
    float _688 = _622 * _622;
    int _690 = _676 ? 0 : 1;
    float _692 = fma(_630, _588, _644);
    bool _694 = _678 >= 0.0;
    float _696 = fma(_636, _636, _688);
    int _698 = ~_690;
    int _700 = _698 + 1;
    int _702 = _700 + 1;
    float _704 = _412 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _706 = _702;
    int _708 = _686;
    if (!_646)
    {
        int _710 = ~_690;
        int _712 = _710 + 1;
        _706 = _712;
    }
    int _714 = _706;
    float _716 = fma(_656, _656, _696);
    float _718 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[117].x, _692);
    float _720 = _534 * _640;
    float _722 = in.m_59.x;
    float _724 = in.m_59.y;
    float _726 = in.m_59.z;
    float _728 = _704 * _666;
    float _730 = rsqrt(_716);
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _734 = !_370;
    int _736 = _734 ? 0 : 1;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _740 = !_374;
    int _742 = _740 ? 0 : 1;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _746 = abs(_736);
    float _748 = 0.0;
    if (_694)
    {
        _748 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _750 = _748;
    float _752 = _732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _754 = abs(_742);
    float _756 = _738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _758 = float(_746);
    float _760 = _744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _762 = float(_542);
    float _764 = _718 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _766 = float(_686);
    if (_694)
    {
        float _768 = _750 * 5.0;
        _708 = as_type<int>(_768);
    }
    int _770 = _708;
    float _772 = float(_754);
    float _774 = _758 * _762;
    out.m_61.x = _720;
    out.m_61.y = _728;
    float _776 = _622 * _730;
    float _778 = _772 * _766;
    out.m_63.x = _752;
    out.m_63.y = _756;
    out.m_63.z = _760;
    out.m_63.w = _764;
    float _780 = _774 * (-2.0);
    float _782 = _636 * _730;
    float _784 = as_type<float>(_770);
    if (_694)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3511 = as_type<float>(_770);
        out.gl_Position.z = _3511;
    }
    if (_694)
    {
        out.m_47.x = 0.0;
    }
    if (_694)
    {
        return out;
    }
    float _786 = -_776;
    float _788 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[18].w, _610);
    float _790 = _656 * _730;
    float _792 = -_782;
    float _794 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[18].w, _618);
    float _796 = fma(_468, _780, _468);
    float _798 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _800 = _788 + _798;
    float _802 = fma(_780, _722, _722);
    float _804 = -_790;
    float _806 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[18].w, _632);
    float _808 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _810 = _794 + _808;
    float _812 = _800 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _814 = _348 + (-0.5);
    float _816 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _818 = _806 + _816;
    float _820 = _778 * (-2.0);
    float _822 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[28].x, _812);
    float _824 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[196].x, _802);
    float _826 = _316 + (-0.5);
    float _828 = fma(_820, _724, _724);
    float _830 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[28].z, _822);
    float _832 = fma(_480, _820, _480);
    float _834 = fma(_796, _652, _824);
    float _836 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[196].y, _828);
    int _838 = abs(_438);
    float _840 = _348 + _336;
    bool _842 = _830 >= 0.0;
    float _844 = -_776;
    float _846 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[18].w, _622);
    float _848 = _834 * 0.15915493667125701904296875;
    float _850 = fma(_832, _652, _836);
    float _852 = _340 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _854 = _840 + (-1.0);
    float _856 = float(_838);
    float _858 = -_782;
    float _860 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[18].w, _636);
    float _862 = float(_714);
    float _864 = _846 * _846;
    float _866 = exp2(_852);
    float _868 = _850 * 0.15915493667125701904296875;
    int _870 = as_type<int>(_846);
    float _872 = _790;
    if (_842)
    {
        _784 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _874 = _784;
    float _876 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _878 = _856 * _862;
    float _880 = fma(_860, _860, _864);
    float _882 = -_790;
    float _884 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[18].w, _656);
    if (_842)
    {
        float _886 = _874 * 5.0;
        _870 = as_type<int>(_886);
    }
    int _888 = _870;
    float _890 = _848 * 6.283185482025146484375;
    float _892 = sin(_890);
    float _894 = in.m_65.x;
    float _896 = in.m_65.y;
    float _898 = in.m_65.z;
    float _900 = _878 * (-2.0);
    float _902 = in.m_67.x;
    float _904 = in.m_67.y;
    float _906 = in.m_67.z;
    float _908 = _848 * 6.283185482025146484375;
    float _910 = cos(_908);
    if (_842)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3727 = as_type<float>(_888);
        out.gl_Position.z = _3727;
    }
    if (_842)
    {
        out.m_47.x = 0.0;
    }
    float _912 = _868 * 6.283185482025146484375;
    float _914 = sin(_912);
    float _916 = in.m_69.x;
    float _918 = in.m_69.y;
    float _920 = in.m_69.z;
    float _922 = _868 * 6.283185482025146484375;
    float _924 = cos(_922);
    if (_842)
    {
        return out;
    }
    float _926 = -_610;
    float _928 = _926 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _930 = -_618;
    float _932 = _930 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _934 = -_632;
    float _936 = _934 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _938 = fma(_884, _884, _880);
    float _940 = _928 * _928;
    float _942 = fma(_900, _726, _726);
    float _944 = _336 + (-0.5);
    float _946 = fma(_932, _932, _940);
    float _948 = sqrt(_938);
    float _950 = fma(_876, _900, _876);
    float _952 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[196].z, _942);
    float _954 = fma(_936, _936, _946);
    float _956 = fma(_894, 2.0, -1.0);
    float _958 = fma(_896, 2.0, -1.0);
    float _960 = fma(_950, _652, _952);
    float _962 = fma(_898, 2.0, -1.0);
    float _964 = -_902;
    float _966 = _956 + _964;
    float _968 = rsqrt(_954);
    float _970 = _960 * 0.15915493667125701904296875;
    float _972 = -_906;
    float _974 = _962 + _972;
    float _976 = _282 * _916;
    float _978 = fma(_866, _966, _902);
    float _980 = -_904;
    float _982 = _958 + _980;
    float _984 = fma(_866, _974, _906);
    float _986 = _730 * _948;
    float _988 = _970 * 6.283185482025146484375;
    float _990 = sin(_988);
    float _992 = _288 * _918;
    float _994 = _290 * _920;
    float _996 = fma(_866, _982, _904);
    float _998 = _892 * _914;
    float _1000 = _910 * _924;
    float _1002 = _992 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1004 = _932 * _968;
    float _1006 = _936 * _968;
    float _1008 = _928 * _968;
    float _1010 = _970 * 6.283185482025146484375;
    float _1012 = cos(_1010);
    float _1014 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1016 = _1004 * _1014;
    float _1018 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1020 = _1006 * _1018;
    float _1022 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1024 = _1008 * _1022;
    float _1026 = _976 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1028 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1030 = -_1016;
    float _1032 = fma(_1006, _1028, _1030);
    float _1034 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1036 = -_1020;
    float _1038 = fma(_1008, _1034, _1036);
    float _1040 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1042 = -_1024;
    float _1044 = fma(_1004, _1040, _1042);
    float _1046 = fma(_990, _1000, _998);
    float _1048 = _1032 * _1032;
    float _1050 = _986 * _1002;
    float _1052 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _996);
    float _1054 = fma(_990, _998, _1000);
    float _1056 = fma(_1038, _1038, _1048);
    float _1058 = _994 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1060 = _910 * _914;
    float _1062 = _910 * _1012;
    float _1064 = fma(_1044, _1044, _1056);
    float _1066 = _892 * _924;
    float _1068 = _892 * _1012;
    float _1070 = _1052 * _1050;
    float _1072 = _986 * _1026;
    float _1074 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _978);
    float _1076 = rsqrt(_1064);
    float _1078 = _924 * _1012;
    float _1080 = _914 * _1012;
    float _1082 = _986 * _1058;
    float _1084 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _984);
    float _1086 = -_1060;
    float _1088 = fma(_990, _1066, _1086);
    float _1090 = -_1066;
    float _1092 = fma(_990, _1060, _1090);
    float _1094 = _1074 * _1072;
    float _1096 = _1062 * _1070;
    float _1098 = _1084 * _1082;
    float _1100 = -_1070;
    float _1102 = _990 * _1100;
    float _1104 = _1068 * _1070;
    float _1106 = fma(_1046, _1094, _1096);
    float _1108 = fma(_1078, _1094, _1102);
    float _1110 = fma(_1088, _1094, _1104);
    float _1112 = _1038 * _1076;
    float _1114 = _1032 * _1076;
    float _1116 = _1044 * _1076;
    float _1118 = fma(_1092, _1098, _1106);
    float _1120 = _1008 * _1112;
    float _1122 = _1006 * _1114;
    float _1124 = fma(_1080, _1098, _1108);
    float _1126 = fma(_1054, _1098, _1110);
    float _1128 = -_1120;
    float _1130 = fma(_1004, _1114, _1128);
    float _1132 = -_1122;
    float _1134 = fma(_1008, _1116, _1132);
    float _1136 = _1004 * _1116;
    float _1138 = _1130 * _1118;
    float _1140 = _1134 * _1118;
    float _1142 = -_1136;
    float _1144 = fma(_1006, _1112, _1142);
    float _1146 = fma(_1116, _1124, _1138);
    float _1148 = fma(_1112, _1124, _1140);
    float _1150 = _1144 * _1118;
    float _1152 = fma(_1006, _1126, _1146);
    float _1154 = fma(_1004, _1126, _1148);
    float _1156 = fma(_1114, _1124, _1150);
    float _1158 = _632 + _1152;
    float _1160 = _618 + _1154;
    float _1162 = fma(_1008, _1126, _1156);
    float _1164 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1166 = _1158 + _1164;
    float _1168 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1170 = _1160 + _1168;
    float _1172 = _610 + _1162;
    float _1174 = _1166 * _1166;
    float _1176 = fma(_1170, _1170, _1174);
    float _1178 = sqrt(_1176);
    bool _1180 = _1178 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1182 = _1174;
    float _1184 = _1124;
    float _1186 = _1150;
    if (!_1180)
    {
        _1182 = _1160;
    }
    float _1188 = _1182;
    float _1190 = _1188;
    if (!_1180)
    {
        _1184 = _1158;
    }
    float _1192 = _1184;
    float _1194 = _1192;
    if (!_1180)
    {
        _1186 = _1172;
    }
    float _1196 = _1186;
    bool _1198 = !_1180;
    float _1200 = _1196;
    if (!_1198)
    {
        float _1202 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1206 = _1178 + _1204;
        float _1208 = rsqrt(_1176);
        float _1210 = _1206 * _1202;
        float _1212 = _1172 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1214 = _1210 * 0.15915493667125701904296875;
        float _1216 = _1214 * 6.283185482025146484375;
        float _1218 = cos(_1216);
        float _1220 = _1214 * 6.283185482025146484375;
        float _1222 = sin(_1220);
        float _1224 = _1218 + (-1.0);
        float _1226 = fma(_1222, _1212, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1228 = _1224 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1230 = _1208 * _1226;
        float _1232 = fma(_1172, _1218, _1228);
        float _1234 = fma(_1170, _1230, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1236 = fma(_1166, _1230, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1200 = _1232;
        _1190 = _1234;
        _1194 = _1236;
    }
    float _1238 = _1200;
    float _1240 = _1190;
    float _1242 = _1194;
    float _1244 = -_610;
    float _1246 = _1244 + _1238;
    float _1248 = -_618;
    float _1250 = _1248 + _1240;
    float _1252 = -_632;
    float _1254 = _1252 + _1242;
    float _1256 = _1246 * _1246;
    bool _1258 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1260 = isnan(0.5);
    bool _1262 = _1258 || _1260;
    bool _1264 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1266 = _1262 || _1264;
    bool _1268 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1270 = isnan(0.5);
    bool _1272 = _1268 || _1270;
    bool _1274 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1276 = _1272 || _1274;
    float _1278 = fma(_1250, _1250, _1256);
    float _1280 = _788 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1282 = fma(_1254, _1254, _1278);
    float _1284 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1280);
    float _1286 = _788 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1288 = sqrt(_1282);
    float _1290 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1284);
    float _1292 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1286);
    float _1294 = _1290 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1296 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1292);
    float _1298 = _1296 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1300 = _1298 + _1294;
    bool _1302 = _1288 > 0.0;
    float _1304 = 1.0 / _1294;
    bool _1306 = !_1302;
    float _1308 = _1238;
    float _1310 = _1242;
    float _1312 = _1240;
    float _1314 = _1250;
    if (!_1306)
    {
        float _1316 = _178 * _178;
        float _1318 = fma(_176, _176, _1316);
        float _1320 = fma(_180, _180, _1318);
        float _1322 = rsqrt(_1282);
        float _1324 = sqrt(_1320);
        float _1326 = _1250 * _1322;
        float _1328 = _1254 * _1322;
        bool _1330 = _1324 > 0.0;
        float _1332 = _1246 * _1322;
        bool _1334 = !_1330;
        if (!_1334)
        {
            float _1336 = rsqrt(_1320);
            float _1338 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1340 = _178 * _1336;
            float _1342 = _176 * _1336;
            float _1344 = _1332 * _1340;
            float _1346 = _180 * _1336;
            float _1348 = fma(_1326, _1342, _1344);
            float _1350 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1352 = fma(_1328, _1346, _1348);
            float _1354 = _1352 * _1350;
            float _1356 = fma(_176, _1354, _1240);
            float _1358 = fma(_178, _1354, _1238);
            float _1360 = fma(_180, _1354, _1242);
            _1308 = _1358;
            _1310 = _1360;
            _1312 = _1356;
            _1314 = _1354;
        }
    }
    float _1362 = _1308;
    float _1364 = _1310;
    float _1366 = _1312;
    float _1368 = _1314;
    float _1370 = -_776;
    float _1372 = fma(_1370, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1362);
    float _1374 = -_790;
    float _1376 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1364);
    float _1378 = -_782;
    float _1380 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1366);
    float _1382 = _1300 * _1304;
    float _1384 = _1382 * 0.5;
    float _1386 = _1372;
    float _1388 = _1380;
    float _1390 = _1364;
    float _1392 = _1368;
    if (_1276)
    {
        _184 = 1.0;
    }
    float _1394 = _184;
    float _1396 = _1394;
    if (_1266)
    {
        _872 = _1372;
    }
    float _1398 = _872;
    float _1400 = _1398;
    if (_1266)
    {
        _1386 = _1376;
    }
    float _1402 = _1386;
    float _1404 = _1402;
    if (!_1266)
    {
        float _1406 = _800 * _800;
        float _1408 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1410 = -_632;
        float _1412 = _1410 + _1364;
        float _1414 = -_618;
        float _1416 = _1414 + _1366;
        float _1418 = fma(_810, _810, _1406);
        float _1420 = -_610;
        float _1422 = _1420 + _1362;
        float _1424 = fma(_818, _818, _1418);
        float _1426 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1428 = sqrt(_1424);
        float _1430 = 1.0 / _986;
        float _1432 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1434 = precise::min(_1428, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1436 = _1434 * _1408;
        float _1438 = _1436 * _1430;
        float _1440 = _1432 * _1438;
        float _1442 = _1412 * _1438;
        float _1444 = fma(_1416, _1440, _794);
        float _1446 = fma(_1422, _1440, _788);
        float _1448 = fma(_1432, _1442, _806);
        _1400 = _1446;
        _1388 = _1444;
        _1404 = _1448;
        _1390 = _1442;
    }
    float _1450 = _1400;
    float _1452 = _1388;
    float _1454 = _1404;
    float _1456 = _1390;
    float _1458 = _1456;
    if (!_1276)
    {
        float _1460 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1462 = _1460 * 0.15915493667125701904296875;
        float _1464 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1468 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1466);
        float _1470 = _1462 * 6.283185482025146484375;
        float _1472 = cos(_1470);
        float _1474 = _1464 * 0.15915493667125701904296875;
        float _1476 = _1462 * 6.283185482025146484375;
        float _1478 = sin(_1476);
        float _1480 = 1.0 / _1472;
        float _1482 = _1474 * 6.283185482025146484375;
        float _1484 = cos(_1482);
        float _1486 = _1478 * _1480;
        float _1488 = _1474 * 6.283185482025146484375;
        float _1490 = sin(_1488);
        float _1492 = _1484 * _1486;
        float _1494 = 1.0 / _1468;
        float _1496 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1498 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1496;
        float _1500 = 1.0 / _1492;
        float _1502 = 1.0 / _1498;
        float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1506 = _1494 * _1504;
        float _1508 = _1490 * _1500;
        float _1510 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1512 = fma(_1508, _1506, _1510);
        float _1514 = _1512 * _1502;
        float _1516 = precise::clamp(_1514, 0.0, 1.0);
        _1458 = _1502;
        _1396 = _1516;
    }
    float _1518 = _1458;
    float _1520 = _1396;
    float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1524 = _1450 + _1522;
    float _1526 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1528 = _1452 + _1526;
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1532 = _1454 + _1530;
    float _1534 = _1524 * _1524;
    float _1536 = fma(_1528, _1528, _1534);
    float _1538 = fma(_1532, _1532, _1536);
    float _1540 = rsqrt(_1538);
    float _1542 = sqrt(_1538);
    float _1544 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1546 = _1528 * _1544;
    float _1548 = _1532 * _1544;
    float _1550 = _1546 * _1546;
    float _1552 = _1548 * _1548;
    float _1554 = _1550 + _1552;
    float _1556 = sqrt(_1554);
    bool _1558 = _1556 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1562 = _1556 + _1560;
    float _1564 = _1532;
    float _1566 = _1518;
    float _1568 = _1562;
    float _1570 = _1524;
    if (_1558)
    {
        float _1572 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1564 = _1572;
    }
    float _1574 = _1564;
    if (_1558)
    {
        float _1576 = rsqrt(_1554);
        _1566 = _1576;
    }
    float _1578 = _1566;
    float _1580 = _1578;
    if (_1558)
    {
        float _1582 = _1562 * _1574;
        _1568 = _1582;
    }
    float _1584 = _1568;
    if (_1558)
    {
        float _1586 = _1584 * 0.15915493667125701904296875;
        _1392 = _1586;
    }
    float _1588 = _1392;
    float _1590 = _1534;
    if (_1558)
    {
        float _1592 = _1588 * 6.283185482025146484375;
        float _1594 = sin(_1592);
        _1590 = _1594;
    }
    float _1596 = _1590;
    float _1598 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1600 = precise::max(0.0, _1598);
    float _1602 = _1540;
    float _1604 = _1600;
    float _1606 = _1598;
    if (_1558)
    {
        float _1608 = _1588 * 6.283185482025146484375;
        float _1610 = cos(_1608);
        _1602 = _1610;
    }
    float _1612 = _1602;
    float _1614 = -_1544;
    float _1616 = -_1600;
    float _1618 = fma(_1524, _1614, _1616);
    if (!_1558)
    {
        _1604 = _1546;
    }
    float _1620 = _1604;
    float _1622 = _1620;
    if (_1558)
    {
        float _1624 = _1618 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1606 = _1624;
    }
    float _1626 = _1606;
    float _1628 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1630 = _1626;
    float _1632 = _1596;
    if (_1558)
    {
        float _1634 = fma(_1596, _1626, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1630 = _1634;
    }
    float _1636 = _1630;
    float _1638 = _1636;
    if (!_1558)
    {
        _1632 = _1550;
    }
    float _1640 = _1632;
    float _1642 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1644 = _1640;
    float _1646 = _1612;
    if (_1558)
    {
        float _1648 = _1612 + (-1.0);
        _1570 = _1648;
    }
    float _1650 = _1570;
    float _1652 = _1650;
    if (_1558)
    {
        float _1654 = _1578 * _1636;
        _648 = _1654;
    }
    float _1656 = _648;
    if (!_1558)
    {
        _1638 = _1618;
    }
    float _1658 = _1638;
    float _1660 = _1658;
    if (_1558)
    {
        float _1662 = _1650 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1580 = _1662;
    }
    float _1664 = _1580;
    if (_1558)
    {
        float _1666 = _1546 * _1656;
        _1622 = _1666;
    }
    float _1668 = _1622;
    if (!_1558)
    {
        _1652 = _1548;
    }
    float _1670 = _1652;
    float _1672 = _1670;
    if (_1558)
    {
        float _1674 = _1548 * _1656;
        _1672 = _1674;
    }
    float _1676 = _1672;
    if (_1558)
    {
        float _1678 = fma(_1618, _1612, _1664);
        _1660 = _1678;
    }
    float _1680 = _1660;
    if (_1558)
    {
        float _1682 = _1668 * _1668;
        _1644 = _1682;
    }
    float _1684 = _1644;
    if (!_1558)
    {
        _1646 = _1552;
    }
    float _1686 = _1646;
    float _1688 = _1686;
    if (_1558)
    {
        float _1690 = _1676 * _1676;
        _1688 = _1690;
    }
    float _1692 = _1688;
    float _1694 = fma(_1680, _1680, _1684);
    float _1696 = _1694 + _1692;
    float _1698 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1628);
    float _1700 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1702 = fma(_1542, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1700);
    float _1704 = precise::clamp(_1702, 0.0, 1.0);
    float _1706 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1708 = rsqrt(_1696);
    float _1710 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1698);
    float _1712 = -_1704;
    float _1714 = _1712 + 1.0;
    float _1716 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1718 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1706);
    float _1720 = _1710 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1722 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1724 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1716);
    float _1726 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1718);
    float _1728 = abs(_1714);
    float _1730 = log2(_1728);
    float _1732 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1722);
    float _1734 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1724);
    float _1736 = _1726 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1738 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1740 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1732);
    float _1742 = _1734 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1744 = _1708 * _1668;
    float _1746 = _1708 * _1680;
    float _1748 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1750 = _1708 * _1676;
    float _1752 = _1744 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1754 = _1740 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1756 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1748);
    float _1758 = -_1738;
    float _1760 = fma(_1758, _1642, 1.0);
    float _1762 = -_1752;
    float _1764 = fma(_1746, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1762);
    float _1766 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1768 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1756);
    float _1770 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1772 = -_1750;
    float _1774 = fma(_1772, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1764);
    float _1776 = log2(_1760);
    float _1778 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1768);
    float _1780 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1782 = fma(_1774, -0.5, 0.5);
    float _1784 = fma(_1774, 0.5, 0.5);
    float _1786 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1770);
    float _1788 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1780);
    float _1790 = 1.0 / _1778;
    float _1792 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1786);
    float _1794 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1788);
    float _1796 = fma(_1784, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1798 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1792);
    float _1800 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1794);
    float _1802 = fma(_1784, _1796, -0.212114393711090087890625);
    float _1804 = sqrt(_1782);
    float _1806 = _1776 * 0.693147182464599609375;
    float _1808 = fma(_1784, _1802, 1.570728778839111328125);
    float _1810 = _1806 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1812 = exp2(_1766);
    float _1814 = _1800 * _1790;
    float _1816 = _1798 * _1790;
    float _1818 = fma(_1814, 0.5, 0.5);
    float _1820 = fma(_1816, -0.5, 0.5);
    float _1822 = _1804 * 0.636619746685028076171875;
    float _1824 = _1746 + 1.0;
    float3 _5167 = float3(_1818, _1820, _1810);
    float _1826 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5167, float3(0.0), isnan(_5167)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5167, float3(0.0), isnan(_5167)), level(0.0)).x;
    float _1828 = -_1808;
    float _1830 = fma(_1822, _1828, 1.0);
    float _1832 = -_1746;
    float _1834 = fma(_1812, _1824, _1832);
    float _1836 = fma(_1834, 0.5, 0.5);
    float3 _5191 = float3(_1818, _1820, _1810);
    float4 _1839 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5191, float3(0.0), isnan(_5191)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5191, float3(0.0), isnan(_5191)), level(0.0)).xyzw;
    float _1841 = _1839.x;
    float _1843 = _1839.y;
    float _1845 = _1839.z;
    float _1847 = _1839.w;
    float2 _5208 = float2(_1830, _1836);
    float3 _1851 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5208, float2(0.0), isnan(_5208)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5208, float2(0.0), isnan(_5208)), level(0.0)).xyz;
    float _1853 = _1851.x;
    float _1855 = _1851.y;
    float _1857 = _1851.z;
    float _1859 = in.m_71.x;
    float _1861 = in.m_71.y;
    float _1863 = in.m_71.z;
    bool _1865 = _996 != 0.0;
    bool _1867 = isnan(_996);
    bool _1869 = _1865 || _1867;
    bool _1871 = isnan(0.0);
    bool _1873 = _1869 || _1871;
    float _1875 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1877 = _1062 * _1134;
    float _1879 = _1062 * _1144;
    bool _1881 = _978 == 0.0;
    bool _1883 = !_1873;
    bool _1885 = _1881 && _1883;
    float _1887 = _1062 * _1130;
    float _1889 = _1046 * _1134;
    float _1891 = exp2(_1875);
    bool _1893 = _984 == 0.0;
    bool _1895 = _1893 && _1885;
    float _1897 = -_990;
    float _1899 = fma(_1897, _1112, _1877);
    float _1901 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1903 = _1046 * _1144;
    float _1905 = _1046 * _1130;
    float _1907 = _1092 * _1134;
    float _1909 = _1092 * _1144;
    float _1911 = _1092 * _1130;
    float _1913 = -_990;
    float _1915 = fma(_1913, _1114, _1879);
    float _1917 = -_990;
    float _1919 = fma(_1917, _1116, _1887);
    float _1921 = fma(_1078, _1112, _1889);
    float _1923 = fma(_1068, _1004, _1899);
    float _1925 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1901);
    float _1927 = fma(_1078, _1114, _1903);
    float _1929 = fma(_1078, _1116, _1905);
    float _1931 = _1861;
    float _1933 = _1859;
    float _1935 = _1863;
    float _1937 = _1778;
    float _1939 = _1798;
    if (!_1895)
    {
        float _1941 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1861);
        _1931 = _1941;
    }
    float _1943 = _1931;
    float _1945 = -_1891;
    float _1947 = _1945 + 1.0;
    float _1949 = fma(_1080, _1112, _1907);
    float _1951 = fma(_1080, _1114, _1909);
    float _1953 = fma(_1080, _1116, _1911);
    float _1955 = fma(_1068, _1008, _1915);
    float _1957 = fma(_1068, _1006, _1919);
    float _1959 = fma(_1088, _1004, _1921);
    if (!_1895)
    {
        float _1961 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1859);
        _1933 = _1961;
    }
    float _1963 = _1933;
    float _1965 = _1923 * _1943;
    float _1967 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1925);
    float _1969 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1971 = fma(_1088, _1008, _1927);
    float _1973 = fma(_1088, _1006, _1929);
    float _1975 = _1955 * _1943;
    float _1977 = _1957 * _1943;
    float _1979 = fma(_1054, _1004, _1949);
    float _1981 = fma(_1959, _1963, _1965);
    if (!_1895)
    {
        float _1983 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1863);
        _1935 = _1983;
    }
    float _1985 = _1935;
    float _1987 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1967);
    float _1989 = fma(_1971, _1963, _1975);
    float _1991 = fma(_1973, _1963, _1977);
    float _1993 = fma(_1979, _1985, _1981);
    float _1995 = _1987 + _1778;
    float _1997 = fma(_1054, _1008, _1951);
    float _1999 = fma(_1054, _1006, _1953);
    float _2001 = _1995 * 0.5;
    float _2003 = fma(_1997, _1985, _1989);
    float _2005 = fma(_1999, _1985, _1991);
    bool _2007 = _1542 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2009 = isnan(_1542);
    bool _2011 = _2007 || _2009;
    bool _2013 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2015 = _2011 || _2013;
    out.m_73.z = _2001;
    out.m_73.w = _1778;
    out.m_75.x = _1993;
    out.m_75.y = _2003;
    out.m_75.z = _2005;
    out.gl_Position.x = _1800;
    out.gl_Position.y = _1798;
    out.gl_Position.z = _1987;
    out.gl_Position.w = _1778;
    float _2017 = _1987;
    float _2019 = _1800;
    if (!_2015)
    {
        _1937 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2021 = _1937;
    float _2023 = _2021;
    float _2025 = _2021;
    if (!_2015)
    {
        _2017 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2027 = _2017;
    float _2029 = _2027;
    float _2031 = _2027;
    if (!_2015)
    {
        _1939 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2033 = _1939;
    float _2035 = _2033;
    float _2037 = _2033;
    if (!_2015)
    {
        _2019 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2039 = _2019;
    float _2041 = _1969 * _1826;
    float _2043 = -_1969;
    float _2045 = _2043 + 1.0;
    float _2047 = _1847 * _2041;
    float _2049 = _1847 * _2045;
    float _2051 = _1857 * _2041;
    float _2053 = fma(_1853, _2047, _1841);
    float _2055 = fma(_1855, _2047, _1843);
    float _2057 = _1843;
    float _2059 = _1841;
    float _2061 = _2039;
    float _2063 = _2039;
    if (!_2015)
    {
        _2057 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2065 = _2057;
    float _2067 = fma(_1847, _2051, _1845);
    float _2069 = _2065;
    float _2071 = _2065;
    if (!_2015)
    {
        _2059 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2073 = _2059;
    out.m_77.x = _2053;
    out.m_77.y = _2055;
    out.m_77.z = _2067;
    out.m_77.w = _2049;
    bool _2075 = !_2015;
    float _2077 = _2073;
    float _2079 = _2073;
    if (!_2075)
    {
        bool _2081 = _1542 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2083 = isnan(_1542);
        bool _2085 = _2081 || _2083;
        bool _2087 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2089 = _2085 || _2087;
        if (!_2089)
        {
            float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2093 = _1542 + _2091;
            float _2095 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2097 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2095;
            float _2099 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2101 = _2099 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2103 = 1.0 / _2097;
            float _2105 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2107 = _2105 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2109 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2111 = _2109 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2113 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2115 = _2113 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2117 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2119 = _2117 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2121 = _2093 * _2103;
            float _2123 = precise::clamp(_2121, 0.0, 1.0);
            float _2125 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2127 = _2125 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2129 = fma(_2123, _2101, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2131 = fma(_2123, _2127, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2133 = fma(_2123, _2107, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2135 = fma(_2123, _2111, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2137 = fma(_2123, _2115, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2139 = fma(_2123, _2119, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2079 = _2133;
            _2037 = _2137;
            _2071 = _2129;
            _2031 = _2135;
            _2025 = _2131;
            _2063 = _2139;
            _2141 = true;
        }
        else
        {
            bool _2143 = _1542 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2145 = isnan(_1542);
            bool _2147 = _2143 || _2145;
            bool _2149 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2151 = _2147 || _2149;
            if (!_2151)
            {
                _2069 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2153 = _2069;
            _2071 = _2153;
            if (!_2151)
            {
                _2077 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2155 = _2077;
            _2079 = _2155;
            if (!_2151)
            {
                _2023 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2157 = _2023;
            _2025 = _2157;
            if (!_2151)
            {
                _2029 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2159 = _2029;
            _2031 = _2159;
            if (!_2151)
            {
                _2035 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2161 = _2035;
            _2037 = _2161;
            if (!_2151)
            {
                _2061 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2163 = _2061;
            bool _2165 = !_2151;
            _2063 = _2163;
            if (!_2165)
            {
                bool _2167 = _1542 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2169 = isnan(_1542);
                bool _2171 = _2167 || _2169;
                bool _2173 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2175 = _2171 || _2173;
                if (!_2175)
                {
                    float _2177 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2179 = _1542 + _2177;
                    float _2181 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2183 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2181;
                    float _2185 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2187 = _2185 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2189 = 1.0 / _2183;
                    float _2191 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2193 = _2191 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2195 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2197 = _2195 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2199 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2201 = _2199 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2203 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2205 = _2203 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2207 = _2179 * _2189;
                    float _2209 = precise::clamp(_2207, 0.0, 1.0);
                    float _2211 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2213 = _2211 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2215 = fma(_2209, _2187, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2217 = fma(_2209, _2213, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2219 = fma(_2209, _2193, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2221 = fma(_2209, _2197, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2223 = fma(_2209, _2201, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2225 = fma(_2209, _2205, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2079 = _2219;
                    _2037 = _2223;
                    _2071 = _2215;
                    _2031 = _2221;
                    _2025 = _2217;
                    _2063 = _2225;
                    _2141 = true;
                }
                else
                {
                    _2079 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2037 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2071 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2031 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2025 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2063 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2141 = false;
    float _2227 = _2079;
    float _2229 = _2037;
    float _2231 = _2071;
    float _2233 = _2031;
    float _2235 = _2025;
    float _2237 = _2063;
    float _2239 = fma(_2003, -0.5, 0.5);
    float _2241 = precise::clamp(_2239, 0.0, 1.0);
    float _2243 = -_2227;
    float _2245 = _2243 + _2229;
    float _2247 = -_2231;
    float _2249 = _2247 + _2233;
    out.m_79.x = 0.0;
    float _2251 = fma(_2241, _2245, _2227);
    float _2253 = -_2235;
    float _2255 = _2253 + _2237;
    float _2257 = fma(_2241, _2249, _2231);
    float _2259 = _2251 * 0.586610972881317138671875;
    bool _2261 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2263 = fma(_2241, _2255, _2235);
    float _2265 = _1520 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2267 = fma(_2257, 0.298911988735198974609375, _2259);
    bool _2269 = _1520 > 0.0;
    bool _2271 = isnan(_1520);
    bool _2273 = _2269 || _2271;
    bool _2275 = isnan(0.0);
    bool _2277 = _2273 || _2275;
    float _2279 = fma(_2263, 0.114477999508380889892578125, _2267);
    out.m_47.x = _2265;
    float _2281 = -_2279;
    float _2283 = _2257 + _2281;
    float _2285 = -_2279;
    float _2287 = _2251 + _2285;
    float _2289 = -_2279;
    float _2291 = _2263 + _2289;
    float _2293 = fma(_2283, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2279);
    float _2295 = fma(_2287, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2279);
    float _2297 = fma(_2291, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2279);
    bool _2299 = !_2261;
    if (!_2299)
    {
        float _2301 = -_1450;
        float _2303 = _2301 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2305 = -_1452;
        float _2307 = _2305 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2309 = -_1454;
        float _2311 = _2309 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2313 = _2303 * _2303;
        float _2315 = fma(_2307, _2307, _2313);
        float _2317 = fma(_2311, _2311, _2315);
        float _2319 = sqrt(_2317);
        float _2321 = rsqrt(_2317);
        float _2323 = -_2319;
        float _2325 = _2323 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2327 = _2325 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2329 = precise::clamp(_2327, 0.0, 1.0);
        float _2331 = _2307 * _2321;
        float _2333 = _2303 * _2321;
        float _2335 = abs(_2329);
        float _2337 = log2(_2335);
        float _2339 = _2311 * _2321;
        float _2341 = _2331 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2343 = _2003 * _2333;
        float _2345 = -_2333;
        float _2347 = -_2341;
        float _2349 = fma(_2345, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2347);
        float _2351 = fma(_1993, _2331, _2343);
        float _2353 = -_2339;
        float _2355 = fma(_2353, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2349);
        float _2357 = fma(_2005, _2339, _2351);
        float _2359 = precise::clamp(_2357, 0.0, 1.0);
        float _2361 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2363 = _2355 + _2361;
        float _2365 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2367 = _2363 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2369 = precise::clamp(_2367, 0.0, 1.0);
        float _2371 = exp2(_2365);
        float _2373 = _2371 * _2369;
        float _2375 = _2359 * _2373;
        float _2377 = _2375 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2379 = _2375 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2381 = _2375 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_79.x = _2377;
        out.m_79.y = _2379;
        out.m_79.z = _2381;
    }
    out.m_81.x = _2293;
    out.m_81.y = _2295;
    out.m_81.z = _2297;
    if (_2277)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2383 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2383;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2141 = false;
    bool _312 = false;
    bool _204 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_44.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    float _108 = as_type<float>(_100);
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _106;
    if (!_104)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2441 = as_type<float>(_116);
        out.gl_Position.z = _2441;
    }
    if (!_104)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _120 = in.m_49.w;
    float _122 = float(_100);
    float _124 = -_120;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_120);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    bool _138 = _126 >= _122;
    bool _140 = !_136;
    bool _142 = _138 || _140;
    float _144 = _126;
    if (_142)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _108;
    if (_142)
    {
        out.m_47.x = 0.0;
    }
    if (_142)
    {
        float _148 = _146 * 5.0;
        _118 = as_type<int>(_148);
    }
    int _150 = _118;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2505 = as_type<float>(_150);
        out.gl_Position.z = _2505;
    }
    if (_142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = in.m_51.x;
    float _154 = in.m_51.y;
    float _156 = in.m_51.z;
    float _158 = 1.0 / _122;
    bool _160 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _162 = _126 * _158;
    float _164 = _154 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _166 = _154 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _168 = _154 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _170 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[4].x, _164);
    float _172 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[5].x, _166);
    float _174 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[6].x, _168);
    float _176 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[4].z, _170);
    float _178 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[5].z, _172);
    float _180 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[6].z, _174);
    bool _182 = !_160;
    float _184 = _176;
    float _202;
    if (!_182)
    {
        float _186 = in.m_53.x;
        float _188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _190 = _186 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _192 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[12].x, _126);
        float _194 = _192 * _188;
        float _196 = floor(_194);
        float _198 = -_196;
        float _200 = _194 + _198;
        _202 = _200;
        _204 = true;
    }
    else
    {
        _202 = _162;
    }
    _204 = false;
    float _206 = _202;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _210 = _206 + _208;
    bool _212 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _214 = isnan(_206);
    bool _216 = _212 || _214;
    bool _218 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _220 = _216 || _218;
    float _222 = float(_220);
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _224;
    bool _228 = _206 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _230 = isnan(_206);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    float _240 = -_222;
    float _242 = _240 + 1.0;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _244;
    float _248 = 1.0 / _226;
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _252 = _238 * _242;
    float _254 = -_238;
    float _256 = _254 + 1.0;
    float _258 = _210 * _248;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _260;
    float _264 = fma(_246, _258, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _266;
    float _270 = fma(_262, _258, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _272 = _264 * _252;
    float _274 = fma(_268, _258, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _276 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[143].x, _272);
    float _278 = _274 * _252;
    float _280 = _270 * _252;
    float _282 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[144].x, _276);
    float _284 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[143].y, _278);
    float _286 = fma(_256, (*spvDescriptorSet0.vp_c9)._m0[143].z, _280);
    float _288 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[144].y, _284);
    float _290 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[144].z, _286);
    bool _292 = !_250;
    float _310;
    if (!_292)
    {
        float _294 = in.m_53.x;
        float _296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _298 = _294 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _302 = _300 * _296;
        float _304 = floor(_302);
        float _306 = -_304;
        float _308 = _302 + _306;
        _310 = _308;
        _312 = true;
    }
    else
    {
        _310 = _162;
    }
    _312 = false;
    float _314 = _310;
    float _316 = in.m_53.y;
    float _318 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _320 = log2(_318);
    float _322 = in.m_44.x;
    float _324 = in.m_44.y;
    float _326 = in.m_44.z;
    int _328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _330 = _328 != 0;
    int _332 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _334 = _332 != 0;
    float _336 = in.m_53.z;
    float _338 = abs(_162);
    float _340 = log2(_338);
    float _342 = in.m_55.y;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _348 = in.m_53.x;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _352 = _320 * _126;
    float _354 = in.m_55.x;
    float _356 = 1.0 / _346;
    float _358 = _350 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _360;
    bool _364 = _316 > 0.5;
    float _366 = _316 * 2.0;
    int _368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _370 = _368 != 0;
    int _372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _374 = _372 != 0;
    int _376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _378 = _376 != 0;
    float _380 = _324 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _382 = _324 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _384 = _324 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _386 = _336 * 2.0;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _394 = -_342;
    float _396 = _394 + 1.0;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _400 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[5].x, _382);
    float _402 = 1.0 / _392;
    float _404 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[6].x, _384);
    float _406 = _342;
    float _408 = _358;
    if (_330)
    {
        float _410 = _364 ? _396 : _342;
        _406 = _410;
    }
    float _412 = _406;
    float _414 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[5].z, _400);
    float _416 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[6].z, _404);
    bool _418 = _348 > 0.5;
    bool _420 = _418 && _334;
    float _422 = floor(_386);
    float _424 = _388 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _426 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[4].x, _380);
    float _428 = _348 * 2.0;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _436 = !_378;
    int _438 = _436 ? 0 : 1;
    float _440 = _430 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _442 = floor(_428);
    float _444 = _434 * _356;
    float _446 = _348 + _316;
    float _448 = _362 * _402;
    out.m_57.x = _358;
    out.m_57.y = _440;
    out.m_57.z = _424;
    out.m_57.w = _398;
    float _450 = _316 + _336;
    float _452 = _446 + (-1.0);
    bool _454 = _422 > 0.0;
    float _456 = _450 + (-1.0);
    bool _458 = _422 >= 0.0;
    bool _460 = isnan(_422);
    bool _462 = _458 || _460;
    bool _464 = isnan(0.0);
    bool _466 = _462 || _464;
    float _468 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _470 = exp2(_352);
    float _472 = _452;
    if (!_334)
    {
        _472 = _354;
    }
    float _474 = _472;
    float _476 = _474;
    if (_334)
    {
        _408 = _354;
    }
    float _478 = _408;
    float _480 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _482 = _466 ? 0 : 1;
    float _484 = floor(_366);
    bool _486 = _442 > 0.0;
    float _488 = _478;
    if (_420)
    {
        float _490 = -_478;
        float _492 = _490 + 1.0;
        _488 = _492;
    }
    float _494 = _488;
    bool _496 = _442 >= 0.0;
    bool _498 = isnan(_442);
    bool _500 = _496 || _498;
    bool _502 = isnan(0.0);
    bool _504 = _500 || _502;
    if (_334)
    {
        _476 = _494;
    }
    float _506 = _476;
    float _508 = -_470;
    float _510 = _508 + 1.0;
    bool _512 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _514 = isnan(_314);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _526 = 1.0 + _524;
    int _528 = ~_482;
    int _530 = _528 + 1;
    int _532 = _530 + 1;
    float _534 = _506 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _536 = _532;
    if (!_454)
    {
        int _538 = ~_482;
        int _540 = _538 + 1;
        _536 = _540;
    }
    int _542 = _536;
    float _544 = -_522;
    float _546 = _544 + 1.0;
    bool _548 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _550 = isnan(_314);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _562 = _314 + _560;
    bool _564 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _566 = isnan(0.0);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _572 = _568 || _570;
    float _574 = 1.0 / _526;
    bool _576 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _578 = isnan(_314);
    bool _580 = _576 || _578;
    bool _582 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _584 = _580 || _582;
    float _586 = float(_584);
    float _588 = _558 * _546;
    float _590 = fma(_448, _562, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _592 = -_558;
    float _594 = _592 + 1.0;
    bool _596 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _598 = isnan(1.0);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _604 = _600 || _602;
    float _606 = fma(_326, (*spvDescriptorSet0.vp_c10)._m0[4].z, _426);
    float _608 = _572 ? _510 : 0.0;
    float _610 = _414 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _612 = _586 * _594;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _616 = _314 + _614;
    float _618 = _606 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _620 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _622 = _610 + _620;
    float _624 = _590 * _612;
    float _626 = -_586;
    float _628 = _626 + 1.0;
    float _630 = fma(_444, _616, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _632 = _416 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _634 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _636 = _618 + _634;
    float _638 = _622 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _640 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _642 = _504 ? 0 : 1;
    float _644 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[115].x, _624);
    bool _646 = _484 > 0.0;
    float _648 = _610;
    if (_604)
    {
        float _650 = _608 * _574;
        _144 = _650;
    }
    float _652 = _144;
    float _654 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _656 = _632 + _654;
    float _658 = fma(_636, (*spvDescriptorSet0.vp_c8)._m0[28].x, _638);
    int _660 = ~_642;
    int _662 = _660 + 1;
    int _664 = _662 + 1;
    float _666 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _668 = _484 >= 0.0;
    bool _670 = isnan(_484);
    bool _672 = _668 || _670;
    bool _674 = isnan(0.0);
    bool _676 = _672 || _674;
    float _678 = fma(_656, (*spvDescriptorSet0.vp_c8)._m0[28].z, _658);
    int _680 = _664;
    if (!_486)
    {
        int _682 = ~_642;
        int _684 = _682 + 1;
        _680 = _684;
    }
    int _686 = _680;
    float _688 = _622 * _622;
    int _690 = _676 ? 0 : 1;
    float _692 = fma(_630, _588, _644);
    bool _694 = _678 >= 0.0;
    float _696 = fma(_636, _636, _688);
    int _698 = ~_690;
    int _700 = _698 + 1;
    int _702 = _700 + 1;
    float _704 = _412 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _706 = _702;
    int _708 = _686;
    if (!_646)
    {
        int _710 = ~_690;
        int _712 = _710 + 1;
        _706 = _712;
    }
    int _714 = _706;
    float _716 = fma(_656, _656, _696);
    float _718 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[117].x, _692);
    float _720 = _534 * _640;
    float _722 = in.m_59.x;
    float _724 = in.m_59.y;
    float _726 = in.m_59.z;
    float _728 = _704 * _666;
    float _730 = rsqrt(_716);
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _734 = !_370;
    int _736 = _734 ? 0 : 1;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _740 = !_374;
    int _742 = _740 ? 0 : 1;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _746 = abs(_736);
    float _748 = 0.0;
    if (_694)
    {
        _748 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _750 = _748;
    float _752 = _732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _754 = abs(_742);
    float _756 = _738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _758 = float(_746);
    float _760 = _744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _762 = float(_542);
    float _764 = _718 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _766 = float(_686);
    if (_694)
    {
        float _768 = _750 * 5.0;
        _708 = as_type<int>(_768);
    }
    int _770 = _708;
    float _772 = float(_754);
    float _774 = _758 * _762;
    out.m_61.x = _720;
    out.m_61.y = _728;
    float _776 = _622 * _730;
    float _778 = _772 * _766;
    out.m_63.x = _752;
    out.m_63.y = _756;
    out.m_63.z = _760;
    out.m_63.w = _764;
    float _780 = _774 * (-2.0);
    float _782 = _636 * _730;
    float _784 = as_type<float>(_770);
    if (_694)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3511 = as_type<float>(_770);
        out.gl_Position.z = _3511;
    }
    if (_694)
    {
        out.m_47.x = 0.0;
    }
    if (_694)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _786 = -_776;
    float _788 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[18].w, _610);
    float _790 = _656 * _730;
    float _792 = -_782;
    float _794 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[18].w, _618);
    float _796 = fma(_468, _780, _468);
    float _798 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _800 = _788 + _798;
    float _802 = fma(_780, _722, _722);
    float _804 = -_790;
    float _806 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[18].w, _632);
    float _808 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _810 = _794 + _808;
    float _812 = _800 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _814 = _348 + (-0.5);
    float _816 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _818 = _806 + _816;
    float _820 = _778 * (-2.0);
    float _822 = fma(_810, (*spvDescriptorSet0.vp_c8)._m0[28].x, _812);
    float _824 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[196].x, _802);
    float _826 = _316 + (-0.5);
    float _828 = fma(_820, _724, _724);
    float _830 = fma(_818, (*spvDescriptorSet0.vp_c8)._m0[28].z, _822);
    float _832 = fma(_480, _820, _480);
    float _834 = fma(_796, _652, _824);
    float _836 = fma(_826, (*spvDescriptorSet0.vp_c9)._m0[196].y, _828);
    int _838 = abs(_438);
    float _840 = _348 + _336;
    bool _842 = _830 >= 0.0;
    float _844 = -_776;
    float _846 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[18].w, _622);
    float _848 = _834 * 0.15915493667125701904296875;
    float _850 = fma(_832, _652, _836);
    float _852 = _340 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _854 = _840 + (-1.0);
    float _856 = float(_838);
    float _858 = -_782;
    float _860 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[18].w, _636);
    float _862 = float(_714);
    float _864 = _846 * _846;
    float _866 = exp2(_852);
    float _868 = _850 * 0.15915493667125701904296875;
    int _870 = as_type<int>(_846);
    float _872 = _790;
    if (_842)
    {
        _784 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _874 = _784;
    float _876 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _878 = _856 * _862;
    float _880 = fma(_860, _860, _864);
    float _882 = -_790;
    float _884 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[18].w, _656);
    if (_842)
    {
        float _886 = _874 * 5.0;
        _870 = as_type<int>(_886);
    }
    int _888 = _870;
    float _890 = _848 * 6.283185482025146484375;
    float _892 = sin(_890);
    float _894 = in.m_65.x;
    float _896 = in.m_65.y;
    float _898 = in.m_65.z;
    float _900 = _878 * (-2.0);
    float _902 = in.m_67.x;
    float _904 = in.m_67.y;
    float _906 = in.m_67.z;
    float _908 = _848 * 6.283185482025146484375;
    float _910 = cos(_908);
    if (_842)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3727 = as_type<float>(_888);
        out.gl_Position.z = _3727;
    }
    if (_842)
    {
        out.m_47.x = 0.0;
    }
    float _912 = _868 * 6.283185482025146484375;
    float _914 = sin(_912);
    float _916 = in.m_69.x;
    float _918 = in.m_69.y;
    float _920 = in.m_69.z;
    float _922 = _868 * 6.283185482025146484375;
    float _924 = cos(_922);
    if (_842)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _926 = -_610;
    float _928 = _926 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _930 = -_618;
    float _932 = _930 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _934 = -_632;
    float _936 = _934 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _938 = fma(_884, _884, _880);
    float _940 = _928 * _928;
    float _942 = fma(_900, _726, _726);
    float _944 = _336 + (-0.5);
    float _946 = fma(_932, _932, _940);
    float _948 = sqrt(_938);
    float _950 = fma(_876, _900, _876);
    float _952 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[196].z, _942);
    float _954 = fma(_936, _936, _946);
    float _956 = fma(_894, 2.0, -1.0);
    float _958 = fma(_896, 2.0, -1.0);
    float _960 = fma(_950, _652, _952);
    float _962 = fma(_898, 2.0, -1.0);
    float _964 = -_902;
    float _966 = _956 + _964;
    float _968 = rsqrt(_954);
    float _970 = _960 * 0.15915493667125701904296875;
    float _972 = -_906;
    float _974 = _962 + _972;
    float _976 = _282 * _916;
    float _978 = fma(_866, _966, _902);
    float _980 = -_904;
    float _982 = _958 + _980;
    float _984 = fma(_866, _974, _906);
    float _986 = _730 * _948;
    float _988 = _970 * 6.283185482025146484375;
    float _990 = sin(_988);
    float _992 = _288 * _918;
    float _994 = _290 * _920;
    float _996 = fma(_866, _982, _904);
    float _998 = _892 * _914;
    float _1000 = _910 * _924;
    float _1002 = _992 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1004 = _932 * _968;
    float _1006 = _936 * _968;
    float _1008 = _928 * _968;
    float _1010 = _970 * 6.283185482025146484375;
    float _1012 = cos(_1010);
    float _1014 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1016 = _1004 * _1014;
    float _1018 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1020 = _1006 * _1018;
    float _1022 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1024 = _1008 * _1022;
    float _1026 = _976 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1028 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1030 = -_1016;
    float _1032 = fma(_1006, _1028, _1030);
    float _1034 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1036 = -_1020;
    float _1038 = fma(_1008, _1034, _1036);
    float _1040 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1042 = -_1024;
    float _1044 = fma(_1004, _1040, _1042);
    float _1046 = fma(_990, _1000, _998);
    float _1048 = _1032 * _1032;
    float _1050 = _986 * _1002;
    float _1052 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _996);
    float _1054 = fma(_990, _998, _1000);
    float _1056 = fma(_1038, _1038, _1048);
    float _1058 = _994 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1060 = _910 * _914;
    float _1062 = _910 * _1012;
    float _1064 = fma(_1044, _1044, _1056);
    float _1066 = _892 * _924;
    float _1068 = _892 * _1012;
    float _1070 = _1052 * _1050;
    float _1072 = _986 * _1026;
    float _1074 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _978);
    float _1076 = rsqrt(_1064);
    float _1078 = _924 * _1012;
    float _1080 = _914 * _1012;
    float _1082 = _986 * _1058;
    float _1084 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _984);
    float _1086 = -_1060;
    float _1088 = fma(_990, _1066, _1086);
    float _1090 = -_1066;
    float _1092 = fma(_990, _1060, _1090);
    float _1094 = _1074 * _1072;
    float _1096 = _1062 * _1070;
    float _1098 = _1084 * _1082;
    float _1100 = -_1070;
    float _1102 = _990 * _1100;
    float _1104 = _1068 * _1070;
    float _1106 = fma(_1046, _1094, _1096);
    float _1108 = fma(_1078, _1094, _1102);
    float _1110 = fma(_1088, _1094, _1104);
    float _1112 = _1038 * _1076;
    float _1114 = _1032 * _1076;
    float _1116 = _1044 * _1076;
    float _1118 = fma(_1092, _1098, _1106);
    float _1120 = _1008 * _1112;
    float _1122 = _1006 * _1114;
    float _1124 = fma(_1080, _1098, _1108);
    float _1126 = fma(_1054, _1098, _1110);
    float _1128 = -_1120;
    float _1130 = fma(_1004, _1114, _1128);
    float _1132 = -_1122;
    float _1134 = fma(_1008, _1116, _1132);
    float _1136 = _1004 * _1116;
    float _1138 = _1130 * _1118;
    float _1140 = _1134 * _1118;
    float _1142 = -_1136;
    float _1144 = fma(_1006, _1112, _1142);
    float _1146 = fma(_1116, _1124, _1138);
    float _1148 = fma(_1112, _1124, _1140);
    float _1150 = _1144 * _1118;
    float _1152 = fma(_1006, _1126, _1146);
    float _1154 = fma(_1004, _1126, _1148);
    float _1156 = fma(_1114, _1124, _1150);
    float _1158 = _632 + _1152;
    float _1160 = _618 + _1154;
    float _1162 = fma(_1008, _1126, _1156);
    float _1164 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1166 = _1158 + _1164;
    float _1168 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1170 = _1160 + _1168;
    float _1172 = _610 + _1162;
    float _1174 = _1166 * _1166;
    float _1176 = fma(_1170, _1170, _1174);
    float _1178 = sqrt(_1176);
    bool _1180 = _1178 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1182 = _1174;
    float _1184 = _1124;
    float _1186 = _1150;
    if (!_1180)
    {
        _1182 = _1160;
    }
    float _1188 = _1182;
    float _1190 = _1188;
    if (!_1180)
    {
        _1184 = _1158;
    }
    float _1192 = _1184;
    float _1194 = _1192;
    if (!_1180)
    {
        _1186 = _1172;
    }
    float _1196 = _1186;
    bool _1198 = !_1180;
    float _1200 = _1196;
    if (!_1198)
    {
        float _1202 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1206 = _1178 + _1204;
        float _1208 = rsqrt(_1176);
        float _1210 = _1206 * _1202;
        float _1212 = _1172 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1214 = _1210 * 0.15915493667125701904296875;
        float _1216 = _1214 * 6.283185482025146484375;
        float _1218 = cos(_1216);
        float _1220 = _1214 * 6.283185482025146484375;
        float _1222 = sin(_1220);
        float _1224 = _1218 + (-1.0);
        float _1226 = fma(_1222, _1212, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1228 = _1224 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1230 = _1208 * _1226;
        float _1232 = fma(_1172, _1218, _1228);
        float _1234 = fma(_1170, _1230, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1236 = fma(_1166, _1230, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1200 = _1232;
        _1190 = _1234;
        _1194 = _1236;
    }
    float _1238 = _1200;
    float _1240 = _1190;
    float _1242 = _1194;
    float _1244 = -_610;
    float _1246 = _1244 + _1238;
    float _1248 = -_618;
    float _1250 = _1248 + _1240;
    float _1252 = -_632;
    float _1254 = _1252 + _1242;
    float _1256 = _1246 * _1246;
    bool _1258 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1260 = isnan(0.5);
    bool _1262 = _1258 || _1260;
    bool _1264 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1266 = _1262 || _1264;
    bool _1268 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1270 = isnan(0.5);
    bool _1272 = _1268 || _1270;
    bool _1274 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1276 = _1272 || _1274;
    float _1278 = fma(_1250, _1250, _1256);
    float _1280 = _788 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1282 = fma(_1254, _1254, _1278);
    float _1284 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1280);
    float _1286 = _788 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1288 = sqrt(_1282);
    float _1290 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1284);
    float _1292 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1286);
    float _1294 = _1290 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1296 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1292);
    float _1298 = _1296 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1300 = _1298 + _1294;
    bool _1302 = _1288 > 0.0;
    float _1304 = 1.0 / _1294;
    bool _1306 = !_1302;
    float _1308 = _1238;
    float _1310 = _1242;
    float _1312 = _1240;
    float _1314 = _1250;
    if (!_1306)
    {
        float _1316 = _178 * _178;
        float _1318 = fma(_176, _176, _1316);
        float _1320 = fma(_180, _180, _1318);
        float _1322 = rsqrt(_1282);
        float _1324 = sqrt(_1320);
        float _1326 = _1250 * _1322;
        float _1328 = _1254 * _1322;
        bool _1330 = _1324 > 0.0;
        float _1332 = _1246 * _1322;
        bool _1334 = !_1330;
        if (!_1334)
        {
            float _1336 = rsqrt(_1320);
            float _1338 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1340 = _178 * _1336;
            float _1342 = _176 * _1336;
            float _1344 = _1332 * _1340;
            float _1346 = _180 * _1336;
            float _1348 = fma(_1326, _1342, _1344);
            float _1350 = _1338 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1352 = fma(_1328, _1346, _1348);
            float _1354 = _1352 * _1350;
            float _1356 = fma(_176, _1354, _1240);
            float _1358 = fma(_178, _1354, _1238);
            float _1360 = fma(_180, _1354, _1242);
            _1308 = _1358;
            _1310 = _1360;
            _1312 = _1356;
            _1314 = _1354;
        }
    }
    float _1362 = _1308;
    float _1364 = _1310;
    float _1366 = _1312;
    float _1368 = _1314;
    float _1370 = -_776;
    float _1372 = fma(_1370, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1362);
    float _1374 = -_790;
    float _1376 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1364);
    float _1378 = -_782;
    float _1380 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1366);
    float _1382 = _1300 * _1304;
    float _1384 = _1382 * 0.5;
    float _1386 = _1372;
    float _1388 = _1380;
    float _1390 = _1364;
    float _1392 = _1368;
    if (_1276)
    {
        _184 = 1.0;
    }
    float _1394 = _184;
    float _1396 = _1394;
    if (_1266)
    {
        _872 = _1372;
    }
    float _1398 = _872;
    float _1400 = _1398;
    if (_1266)
    {
        _1386 = _1376;
    }
    float _1402 = _1386;
    float _1404 = _1402;
    if (!_1266)
    {
        float _1406 = _800 * _800;
        float _1408 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1410 = -_632;
        float _1412 = _1410 + _1364;
        float _1414 = -_618;
        float _1416 = _1414 + _1366;
        float _1418 = fma(_810, _810, _1406);
        float _1420 = -_610;
        float _1422 = _1420 + _1362;
        float _1424 = fma(_818, _818, _1418);
        float _1426 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1428 = sqrt(_1424);
        float _1430 = 1.0 / _986;
        float _1432 = _1426 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1434 = precise::min(_1428, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1436 = _1434 * _1408;
        float _1438 = _1436 * _1430;
        float _1440 = _1432 * _1438;
        float _1442 = _1412 * _1438;
        float _1444 = fma(_1416, _1440, _794);
        float _1446 = fma(_1422, _1440, _788);
        float _1448 = fma(_1432, _1442, _806);
        _1400 = _1446;
        _1388 = _1444;
        _1404 = _1448;
        _1390 = _1442;
    }
    float _1450 = _1400;
    float _1452 = _1388;
    float _1454 = _1404;
    float _1456 = _1390;
    float _1458 = _1456;
    if (!_1276)
    {
        float _1460 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1462 = _1460 * 0.15915493667125701904296875;
        float _1464 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1468 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1466);
        float _1470 = _1462 * 6.283185482025146484375;
        float _1472 = cos(_1470);
        float _1474 = _1464 * 0.15915493667125701904296875;
        float _1476 = _1462 * 6.283185482025146484375;
        float _1478 = sin(_1476);
        float _1480 = 1.0 / _1472;
        float _1482 = _1474 * 6.283185482025146484375;
        float _1484 = cos(_1482);
        float _1486 = _1478 * _1480;
        float _1488 = _1474 * 6.283185482025146484375;
        float _1490 = sin(_1488);
        float _1492 = _1484 * _1486;
        float _1494 = 1.0 / _1468;
        float _1496 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1498 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1496;
        float _1500 = 1.0 / _1492;
        float _1502 = 1.0 / _1498;
        float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1506 = _1494 * _1504;
        float _1508 = _1490 * _1500;
        float _1510 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1512 = fma(_1508, _1506, _1510);
        float _1514 = _1512 * _1502;
        float _1516 = precise::clamp(_1514, 0.0, 1.0);
        _1458 = _1502;
        _1396 = _1516;
    }
    float _1518 = _1458;
    float _1520 = _1396;
    float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1524 = _1450 + _1522;
    float _1526 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1528 = _1452 + _1526;
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1532 = _1454 + _1530;
    float _1534 = _1524 * _1524;
    float _1536 = fma(_1528, _1528, _1534);
    float _1538 = fma(_1532, _1532, _1536);
    float _1540 = rsqrt(_1538);
    float _1542 = sqrt(_1538);
    float _1544 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1546 = _1528 * _1544;
    float _1548 = _1532 * _1544;
    float _1550 = _1546 * _1546;
    float _1552 = _1548 * _1548;
    float _1554 = _1550 + _1552;
    float _1556 = sqrt(_1554);
    bool _1558 = _1556 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1562 = _1556 + _1560;
    float _1564 = _1532;
    float _1566 = _1518;
    float _1568 = _1562;
    float _1570 = _1524;
    if (_1558)
    {
        float _1572 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1564 = _1572;
    }
    float _1574 = _1564;
    if (_1558)
    {
        float _1576 = rsqrt(_1554);
        _1566 = _1576;
    }
    float _1578 = _1566;
    float _1580 = _1578;
    if (_1558)
    {
        float _1582 = _1562 * _1574;
        _1568 = _1582;
    }
    float _1584 = _1568;
    if (_1558)
    {
        float _1586 = _1584 * 0.15915493667125701904296875;
        _1392 = _1586;
    }
    float _1588 = _1392;
    float _1590 = _1534;
    if (_1558)
    {
        float _1592 = _1588 * 6.283185482025146484375;
        float _1594 = sin(_1592);
        _1590 = _1594;
    }
    float _1596 = _1590;
    float _1598 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1600 = precise::max(0.0, _1598);
    float _1602 = _1540;
    float _1604 = _1600;
    float _1606 = _1598;
    if (_1558)
    {
        float _1608 = _1588 * 6.283185482025146484375;
        float _1610 = cos(_1608);
        _1602 = _1610;
    }
    float _1612 = _1602;
    float _1614 = -_1544;
    float _1616 = -_1600;
    float _1618 = fma(_1524, _1614, _1616);
    if (!_1558)
    {
        _1604 = _1546;
    }
    float _1620 = _1604;
    float _1622 = _1620;
    if (_1558)
    {
        float _1624 = _1618 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1606 = _1624;
    }
    float _1626 = _1606;
    float _1628 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1630 = _1626;
    float _1632 = _1596;
    if (_1558)
    {
        float _1634 = fma(_1596, _1626, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1630 = _1634;
    }
    float _1636 = _1630;
    float _1638 = _1636;
    if (!_1558)
    {
        _1632 = _1550;
    }
    float _1640 = _1632;
    float _1642 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1644 = _1640;
    float _1646 = _1612;
    if (_1558)
    {
        float _1648 = _1612 + (-1.0);
        _1570 = _1648;
    }
    float _1650 = _1570;
    float _1652 = _1650;
    if (_1558)
    {
        float _1654 = _1578 * _1636;
        _648 = _1654;
    }
    float _1656 = _648;
    if (!_1558)
    {
        _1638 = _1618;
    }
    float _1658 = _1638;
    float _1660 = _1658;
    if (_1558)
    {
        float _1662 = _1650 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1580 = _1662;
    }
    float _1664 = _1580;
    if (_1558)
    {
        float _1666 = _1546 * _1656;
        _1622 = _1666;
    }
    float _1668 = _1622;
    if (!_1558)
    {
        _1652 = _1548;
    }
    float _1670 = _1652;
    float _1672 = _1670;
    if (_1558)
    {
        float _1674 = _1548 * _1656;
        _1672 = _1674;
    }
    float _1676 = _1672;
    if (_1558)
    {
        float _1678 = fma(_1618, _1612, _1664);
        _1660 = _1678;
    }
    float _1680 = _1660;
    if (_1558)
    {
        float _1682 = _1668 * _1668;
        _1644 = _1682;
    }
    float _1684 = _1644;
    if (!_1558)
    {
        _1646 = _1552;
    }
    float _1686 = _1646;
    float _1688 = _1686;
    if (_1558)
    {
        float _1690 = _1676 * _1676;
        _1688 = _1690;
    }
    float _1692 = _1688;
    float _1694 = fma(_1680, _1680, _1684);
    float _1696 = _1694 + _1692;
    float _1698 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1628);
    float _1700 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1702 = fma(_1542, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1700);
    float _1704 = precise::clamp(_1702, 0.0, 1.0);
    float _1706 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1708 = rsqrt(_1696);
    float _1710 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1698);
    float _1712 = -_1704;
    float _1714 = _1712 + 1.0;
    float _1716 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1718 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1706);
    float _1720 = _1710 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1722 = _1450 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1724 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1716);
    float _1726 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1718);
    float _1728 = abs(_1714);
    float _1730 = log2(_1728);
    float _1732 = fma(_1452, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1722);
    float _1734 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1724);
    float _1736 = _1726 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1738 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1740 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1732);
    float _1742 = _1734 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1744 = _1708 * _1668;
    float _1746 = _1708 * _1680;
    float _1748 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1750 = _1708 * _1676;
    float _1752 = _1744 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1754 = _1740 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1756 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1748);
    float _1758 = -_1738;
    float _1760 = fma(_1758, _1642, 1.0);
    float _1762 = -_1752;
    float _1764 = fma(_1746, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1762);
    float _1766 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1768 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1756);
    float _1770 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1772 = -_1750;
    float _1774 = fma(_1772, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1764);
    float _1776 = log2(_1760);
    float _1778 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1768);
    float _1780 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1782 = fma(_1774, -0.5, 0.5);
    float _1784 = fma(_1774, 0.5, 0.5);
    float _1786 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1770);
    float _1788 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1780);
    float _1790 = 1.0 / _1778;
    float _1792 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1786);
    float _1794 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1788);
    float _1796 = fma(_1784, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1798 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1792);
    float _1800 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1794);
    float _1802 = fma(_1784, _1796, -0.212114393711090087890625);
    float _1804 = sqrt(_1782);
    float _1806 = _1776 * 0.693147182464599609375;
    float _1808 = fma(_1784, _1802, 1.570728778839111328125);
    float _1810 = _1806 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1812 = exp2(_1766);
    float _1814 = _1800 * _1790;
    float _1816 = _1798 * _1790;
    float _1818 = fma(_1814, 0.5, 0.5);
    float _1820 = fma(_1816, -0.5, 0.5);
    float _1822 = _1804 * 0.636619746685028076171875;
    float _1824 = _1746 + 1.0;
    float3 _5167 = float3(_1818, _1820, _1810);
    float _1826 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5167, float3(0.0), isnan(_5167)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5167, float3(0.0), isnan(_5167)), level(0.0)).x;
    float _1828 = -_1808;
    float _1830 = fma(_1822, _1828, 1.0);
    float _1832 = -_1746;
    float _1834 = fma(_1812, _1824, _1832);
    float _1836 = fma(_1834, 0.5, 0.5);
    float3 _5191 = float3(_1818, _1820, _1810);
    float4 _1839 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5191, float3(0.0), isnan(_5191)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5191, float3(0.0), isnan(_5191)), level(0.0)).xyzw;
    float _1841 = _1839.x;
    float _1843 = _1839.y;
    float _1845 = _1839.z;
    float _1847 = _1839.w;
    float2 _5208 = float2(_1830, _1836);
    float3 _1851 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5208, float2(0.0), isnan(_5208)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5208, float2(0.0), isnan(_5208)), level(0.0)).xyz;
    float _1853 = _1851.x;
    float _1855 = _1851.y;
    float _1857 = _1851.z;
    float _1859 = in.m_71.x;
    float _1861 = in.m_71.y;
    float _1863 = in.m_71.z;
    bool _1865 = _996 != 0.0;
    bool _1867 = isnan(_996);
    bool _1869 = _1865 || _1867;
    bool _1871 = isnan(0.0);
    bool _1873 = _1869 || _1871;
    float _1875 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1877 = _1062 * _1134;
    float _1879 = _1062 * _1144;
    bool _1881 = _978 == 0.0;
    bool _1883 = !_1873;
    bool _1885 = _1881 && _1883;
    float _1887 = _1062 * _1130;
    float _1889 = _1046 * _1134;
    float _1891 = exp2(_1875);
    bool _1893 = _984 == 0.0;
    bool _1895 = _1893 && _1885;
    float _1897 = -_990;
    float _1899 = fma(_1897, _1112, _1877);
    float _1901 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1903 = _1046 * _1144;
    float _1905 = _1046 * _1130;
    float _1907 = _1092 * _1134;
    float _1909 = _1092 * _1144;
    float _1911 = _1092 * _1130;
    float _1913 = -_990;
    float _1915 = fma(_1913, _1114, _1879);
    float _1917 = -_990;
    float _1919 = fma(_1917, _1116, _1887);
    float _1921 = fma(_1078, _1112, _1889);
    float _1923 = fma(_1068, _1004, _1899);
    float _1925 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1901);
    float _1927 = fma(_1078, _1114, _1903);
    float _1929 = fma(_1078, _1116, _1905);
    float _1931 = _1861;
    float _1933 = _1859;
    float _1935 = _1863;
    float _1937 = _1778;
    float _1939 = _1798;
    if (!_1895)
    {
        float _1941 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1861);
        _1931 = _1941;
    }
    float _1943 = _1931;
    float _1945 = -_1891;
    float _1947 = _1945 + 1.0;
    float _1949 = fma(_1080, _1112, _1907);
    float _1951 = fma(_1080, _1114, _1909);
    float _1953 = fma(_1080, _1116, _1911);
    float _1955 = fma(_1068, _1008, _1915);
    float _1957 = fma(_1068, _1006, _1919);
    float _1959 = fma(_1088, _1004, _1921);
    if (!_1895)
    {
        float _1961 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1859);
        _1933 = _1961;
    }
    float _1963 = _1933;
    float _1965 = _1923 * _1943;
    float _1967 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1925);
    float _1969 = _1947 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1971 = fma(_1088, _1008, _1927);
    float _1973 = fma(_1088, _1006, _1929);
    float _1975 = _1955 * _1943;
    float _1977 = _1957 * _1943;
    float _1979 = fma(_1054, _1004, _1949);
    float _1981 = fma(_1959, _1963, _1965);
    if (!_1895)
    {
        float _1983 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1863);
        _1935 = _1983;
    }
    float _1985 = _1935;
    float _1987 = fma(_1754, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1967);
    float _1989 = fma(_1971, _1963, _1975);
    float _1991 = fma(_1973, _1963, _1977);
    float _1993 = fma(_1979, _1985, _1981);
    float _1995 = _1987 + _1778;
    float _1997 = fma(_1054, _1008, _1951);
    float _1999 = fma(_1054, _1006, _1953);
    float _2001 = _1995 * 0.5;
    float _2003 = fma(_1997, _1985, _1989);
    float _2005 = fma(_1999, _1985, _1991);
    bool _2007 = _1542 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2009 = isnan(_1542);
    bool _2011 = _2007 || _2009;
    bool _2013 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2015 = _2011 || _2013;
    out.m_73.z = _2001;
    out.m_73.w = _1778;
    out.m_75.x = _1993;
    out.m_75.y = _2003;
    out.m_75.z = _2005;
    out.gl_Position.x = _1800;
    out.gl_Position.y = _1798;
    out.gl_Position.z = _1987;
    out.gl_Position.w = _1778;
    float _2017 = _1987;
    float _2019 = _1800;
    if (!_2015)
    {
        _1937 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2021 = _1937;
    float _2023 = _2021;
    float _2025 = _2021;
    if (!_2015)
    {
        _2017 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2027 = _2017;
    float _2029 = _2027;
    float _2031 = _2027;
    if (!_2015)
    {
        _1939 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2033 = _1939;
    float _2035 = _2033;
    float _2037 = _2033;
    if (!_2015)
    {
        _2019 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2039 = _2019;
    float _2041 = _1969 * _1826;
    float _2043 = -_1969;
    float _2045 = _2043 + 1.0;
    float _2047 = _1847 * _2041;
    float _2049 = _1847 * _2045;
    float _2051 = _1857 * _2041;
    float _2053 = fma(_1853, _2047, _1841);
    float _2055 = fma(_1855, _2047, _1843);
    float _2057 = _1843;
    float _2059 = _1841;
    float _2061 = _2039;
    float _2063 = _2039;
    if (!_2015)
    {
        _2057 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2065 = _2057;
    float _2067 = fma(_1847, _2051, _1845);
    float _2069 = _2065;
    float _2071 = _2065;
    if (!_2015)
    {
        _2059 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2073 = _2059;
    out.m_77.x = _2053;
    out.m_77.y = _2055;
    out.m_77.z = _2067;
    out.m_77.w = _2049;
    bool _2075 = !_2015;
    float _2077 = _2073;
    float _2079 = _2073;
    if (!_2075)
    {
        bool _2081 = _1542 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2083 = isnan(_1542);
        bool _2085 = _2081 || _2083;
        bool _2087 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2089 = _2085 || _2087;
        if (!_2089)
        {
            float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2093 = _1542 + _2091;
            float _2095 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2097 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2095;
            float _2099 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2101 = _2099 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2103 = 1.0 / _2097;
            float _2105 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2107 = _2105 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2109 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2111 = _2109 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2113 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2115 = _2113 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2117 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2119 = _2117 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2121 = _2093 * _2103;
            float _2123 = precise::clamp(_2121, 0.0, 1.0);
            float _2125 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2127 = _2125 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2129 = fma(_2123, _2101, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2131 = fma(_2123, _2127, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2133 = fma(_2123, _2107, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2135 = fma(_2123, _2111, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2137 = fma(_2123, _2115, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2139 = fma(_2123, _2119, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2079 = _2133;
            _2037 = _2137;
            _2071 = _2129;
            _2031 = _2135;
            _2025 = _2131;
            _2063 = _2139;
            _2141 = true;
        }
        else
        {
            bool _2143 = _1542 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2145 = isnan(_1542);
            bool _2147 = _2143 || _2145;
            bool _2149 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2151 = _2147 || _2149;
            if (!_2151)
            {
                _2069 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2153 = _2069;
            _2071 = _2153;
            if (!_2151)
            {
                _2077 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2155 = _2077;
            _2079 = _2155;
            if (!_2151)
            {
                _2023 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2157 = _2023;
            _2025 = _2157;
            if (!_2151)
            {
                _2029 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2159 = _2029;
            _2031 = _2159;
            if (!_2151)
            {
                _2035 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2161 = _2035;
            _2037 = _2161;
            if (!_2151)
            {
                _2061 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2163 = _2061;
            bool _2165 = !_2151;
            _2063 = _2163;
            if (!_2165)
            {
                bool _2167 = _1542 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2169 = isnan(_1542);
                bool _2171 = _2167 || _2169;
                bool _2173 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2175 = _2171 || _2173;
                if (!_2175)
                {
                    float _2177 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2179 = _1542 + _2177;
                    float _2181 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2183 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2181;
                    float _2185 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2187 = _2185 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2189 = 1.0 / _2183;
                    float _2191 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2193 = _2191 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2195 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2197 = _2195 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2199 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2201 = _2199 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2203 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2205 = _2203 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2207 = _2179 * _2189;
                    float _2209 = precise::clamp(_2207, 0.0, 1.0);
                    float _2211 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2213 = _2211 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2215 = fma(_2209, _2187, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2217 = fma(_2209, _2213, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2219 = fma(_2209, _2193, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2221 = fma(_2209, _2197, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2223 = fma(_2209, _2201, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2225 = fma(_2209, _2205, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2079 = _2219;
                    _2037 = _2223;
                    _2071 = _2215;
                    _2031 = _2221;
                    _2025 = _2217;
                    _2063 = _2225;
                    _2141 = true;
                }
                else
                {
                    _2079 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2037 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2071 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2031 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2025 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2063 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2141 = false;
    float _2227 = _2079;
    float _2229 = _2037;
    float _2231 = _2071;
    float _2233 = _2031;
    float _2235 = _2025;
    float _2237 = _2063;
    float _2239 = fma(_2003, -0.5, 0.5);
    float _2241 = precise::clamp(_2239, 0.0, 1.0);
    float _2243 = -_2227;
    float _2245 = _2243 + _2229;
    float _2247 = -_2231;
    float _2249 = _2247 + _2233;
    out.m_79.x = 0.0;
    float _2251 = fma(_2241, _2245, _2227);
    float _2253 = -_2235;
    float _2255 = _2253 + _2237;
    float _2257 = fma(_2241, _2249, _2231);
    float _2259 = _2251 * 0.586610972881317138671875;
    bool _2261 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2263 = fma(_2241, _2255, _2235);
    float _2265 = _1520 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2267 = fma(_2257, 0.298911988735198974609375, _2259);
    bool _2269 = _1520 > 0.0;
    bool _2271 = isnan(_1520);
    bool _2273 = _2269 || _2271;
    bool _2275 = isnan(0.0);
    bool _2277 = _2273 || _2275;
    float _2279 = fma(_2263, 0.114477999508380889892578125, _2267);
    out.m_47.x = _2265;
    float _2281 = -_2279;
    float _2283 = _2257 + _2281;
    float _2285 = -_2279;
    float _2287 = _2251 + _2285;
    float _2289 = -_2279;
    float _2291 = _2263 + _2289;
    float _2293 = fma(_2283, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2279);
    float _2295 = fma(_2287, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2279);
    float _2297 = fma(_2291, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2279);
    bool _2299 = !_2261;
    if (!_2299)
    {
        float _2301 = -_1450;
        float _2303 = _2301 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2305 = -_1452;
        float _2307 = _2305 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2309 = -_1454;
        float _2311 = _2309 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2313 = _2303 * _2303;
        float _2315 = fma(_2307, _2307, _2313);
        float _2317 = fma(_2311, _2311, _2315);
        float _2319 = sqrt(_2317);
        float _2321 = rsqrt(_2317);
        float _2323 = -_2319;
        float _2325 = _2323 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2327 = _2325 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2329 = precise::clamp(_2327, 0.0, 1.0);
        float _2331 = _2307 * _2321;
        float _2333 = _2303 * _2321;
        float _2335 = abs(_2329);
        float _2337 = log2(_2335);
        float _2339 = _2311 * _2321;
        float _2341 = _2331 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2343 = _2003 * _2333;
        float _2345 = -_2333;
        float _2347 = -_2341;
        float _2349 = fma(_2345, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2347);
        float _2351 = fma(_1993, _2331, _2343);
        float _2353 = -_2339;
        float _2355 = fma(_2353, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2349);
        float _2357 = fma(_2005, _2339, _2351);
        float _2359 = precise::clamp(_2357, 0.0, 1.0);
        float _2361 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2363 = _2355 + _2361;
        float _2365 = _2337 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2367 = _2363 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2369 = precise::clamp(_2367, 0.0, 1.0);
        float _2371 = exp2(_2365);
        float _2373 = _2371 * _2369;
        float _2375 = _2359 * _2373;
        float _2377 = _2375 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2379 = _2375 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2381 = _2375 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_79.x = _2377;
        out.m_79.y = _2379;
        out.m_79.z = _2381;
    }
    out.m_81.x = _2293;
    out.m_81.y = _2295;
    out.m_81.z = _2297;
    if (_2277)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2383 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2383;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

