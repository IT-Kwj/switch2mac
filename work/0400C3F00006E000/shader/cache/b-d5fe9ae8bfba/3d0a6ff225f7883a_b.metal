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
    float4 m_67 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_71 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _468 = false;
    bool _286 = false;
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
        float _1476 = as_type<float>(_106);
        out.gl_Position.z = _1476;
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
        out.m_45.x = 0.0;
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
        float _1545 = as_type<float>(_142);
        out.gl_Position.z = _1545;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_49.w;
    float _146 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_47.x;
    float _160 = in.m_47.y;
    float _162 = in.m_47.z;
    float _164 = in.m_42.x;
    float _166 = in.m_42.y;
    float _168 = in.m_42.z;
    float _170 = 0.0;
    float _172 = _146;
    if (!_156)
    {
        float _174 = _146 * _146;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = _178;
    if (!_156)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    bool _186 = !_156;
    float _188 = _184;
    if (!_186)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _146 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _146);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _218;
    }
    float _220 = _188;
    bool _222 = !_156;
    if (!_222)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = 1.0 / _230;
        float _234 = _146 * _226;
        float _236 = exp2(_234);
        float _238 = -_236;
        float _240 = _238 + 1.0;
        float _242 = _240 * _232;
        _172 = _242;
    }
    float _244 = _172;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _248 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _252 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _254 = fma(_244, _158, _248);
    float _256 = fma(_244, _160, _250);
    float _258 = fma(_244, _162, _252);
    float _260 = fma(_254, _144, _164);
    float _262 = fma(_256, _144, _166);
    float _264 = fma(_258, _144, _168);
    bool _266 = !_246;
    float _284;
    if (!_266)
    {
        float _268 = in.m_51.x;
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        float _288 = float(_90);
        float _290 = 1.0 / _288;
        float _292 = _124 * _290;
        _284 = _292;
    }
    _286 = false;
    float _294 = _284;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _298 = _294 + _296;
    bool _300 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _302 = isnan(_294);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _314 = _294 + _312;
    bool _316 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _318 = isnan(_294);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _336 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _338 = isnan(_294);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -_310;
    float _350 = _348 + 1.0;
    float _352 = 1.0 / _330;
    float _354 = _346 * _350;
    float _356 = -_346;
    float _358 = _356 + 1.0;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _360;
    bool _364 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _366 = 1.0 / _334;
    float _368 = _326 * _358;
    float _370 = -_326;
    float _372 = _370 + 1.0;
    float _374 = _298 * _352;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _380;
    float _384 = fma(_362, _374, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _386 = fma(_378, _374, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _388 = fma(_382, _374, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _390 = _314 * _366;
    float _392 = _384 * _368;
    float _394 = _386 * _368;
    float _396 = _388 * _368;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _410 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[107].x, _392);
    float _412 = fma(_400, _390, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _414 = fma(_404, _390, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _416 = fma(_408, _390, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _418 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[107].y, _394);
    float _420 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[107].z, _396);
    float _422 = fma(_412, _354, _410);
    float _424 = fma(_414, _354, _418);
    float _426 = fma(_416, _354, _420);
    float _428 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[109].x, _422);
    float _430 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[109].y, _424);
    float _432 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[109].z, _426);
    float _434 = _428 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _438 = _430 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _440 = _432 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _442 = _434 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _444 = _438 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _446 = _440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _442;
    out.m_53.y = _444;
    out.m_53.z = _446;
    out.m_53.w = _436;
    bool _448 = !_364;
    float _466;
    if (!_448)
    {
        float _450 = in.m_51.x;
        float _452 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _454 = _450 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _456 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _458 = _456 * _452;
        float _460 = floor(_458);
        float _462 = -_460;
        float _464 = _458 + _462;
        _466 = _464;
        _468 = true;
    }
    else
    {
        float _470 = float(_90);
        float _472 = 1.0 / _470;
        float _474 = _124 * _472;
        _466 = _474;
    }
    _468 = false;
    float _476 = _466;
    float _478 = in.m_49.x;
    float _480 = in.m_49.y;
    float _482 = in.m_49.z;
    float _484 = in.m_55.y;
    bool _486 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _488 = isnan(0.5);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _494 = _490 || _492;
    float _496 = in.m_55.x;
    float _498 = in.m_55.z;
    float _500 = _480 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _502 = _478 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _504 = _482 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _506 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _508 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _484);
    float _510 = _500 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _512 = _502 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _514 = _504 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _516 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _496);
    float _518 = _510 * _508;
    float _520 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _506);
    float _522 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _498);
    float _524 = _512 * _516;
    float _526 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _528 = _518 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _530 = _514 * _522;
    float _532 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].z, _520);
    float _534 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _526);
    float _536 = _518 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _538 = fma(_524, (*spvDescriptorSet0.vp_c10)._m0[10].x, _528);
    float _540 = _532 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _542 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].z, _534);
    float _544 = fma(_524, (*spvDescriptorSet0.vp_c10)._m0[8].x, _536);
    float _546 = fma(_530, (*spvDescriptorSet0.vp_c10)._m0[10].z, _538);
    float _548 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _550 = _542 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _552 = fma(_530, (*spvDescriptorSet0.vp_c10)._m0[8].z, _544);
    float _554 = _540 + _546;
    float _556 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _548);
    float _558 = _518 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _560 = _550 + _552;
    float _562 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _564 = _554 + _562;
    float _566 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].z, _556);
    float _568 = fma(_524, (*spvDescriptorSet0.vp_c10)._m0[9].x, _558);
    float _570 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _572 = _560 + _570;
    float _574 = _564 * _564;
    float _576 = _566 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _578 = fma(_530, (*spvDescriptorSet0.vp_c10)._m0[9].z, _568);
    float _580 = _530;
    float _582 = _554;
    float _584 = _576;
    float _586 = _550;
    if (_494)
    {
        _580 = 1.0;
    }
    float _588 = _580;
    float _590 = fma(_572, _572, _574);
    float _592 = _576 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _594 = _576 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _596 = _576 + _578;
    float _598 = sqrt(_590);
    float _600 = fma(_550, (*spvDescriptorSet0.vp_c8)._m0[11].x, _592);
    float _602 = fma(_550, (*spvDescriptorSet0.vp_c8)._m0[10].x, _594);
    float _604 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[11].z, _600);
    float _606 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[10].z, _602);
    float _608 = _604 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _610 = _606 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _612 = 1.0 / _608;
    float _614 = _610 + _608;
    bool _616 = _598 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _618 = _614 * _612;
    float _620 = _618 * 0.5;
    float _622 = _608;
    float _624 = _614;
    float _626 = _612;
    float _628 = _588;
    if (!_616)
    {
        _622 = _560;
    }
    float _630 = _622;
    float _632 = _630;
    if (!_616)
    {
        _624 = _554;
    }
    float _634 = _624;
    float _636 = _634;
    if (!_616)
    {
        _626 = _596;
    }
    float _638 = _626;
    bool _640 = !_616;
    float _642 = _638;
    if (!_640)
    {
        float _644 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _646 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _648 = _598 + _646;
        float _650 = rsqrt(_590);
        float _652 = _648 * _644;
        float _654 = _596 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _656 = _652 * 0.15915493667125701904296875;
        float _658 = _656 * 6.283185482025146484375;
        float _660 = sin(_658);
        float _662 = _656 * 6.283185482025146484375;
        float _664 = cos(_662);
        float _666 = fma(_660, _654, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _668 = _650 * _666;
        float _670 = _664 + (-1.0);
        float _672 = fma(_572, _668, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _674 = fma(_564, _668, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _676 = _670 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _678 = fma(_596, _664, _676);
        _642 = _678;
        _632 = _672;
        _636 = _674;
    }
    float _680 = _642;
    float _682 = _632;
    float _684 = _636;
    if (!_494)
    {
        float _686 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _688 = _686 * 0.15915493667125701904296875;
        float _690 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _692 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _694 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[30].w, _692);
        float _696 = _688 * 6.283185482025146484375;
        float _698 = cos(_696);
        float _700 = _690 * 0.15915493667125701904296875;
        float _702 = _688 * 6.283185482025146484375;
        float _704 = sin(_702);
        float _706 = 1.0 / _698;
        float _708 = _700 * 6.283185482025146484375;
        float _710 = cos(_708);
        float _712 = _704 * _706;
        float _714 = _700 * 6.283185482025146484375;
        float _716 = sin(_714);
        float _718 = _710 * _712;
        float _720 = 1.0 / _694;
        float _722 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _724 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _722;
        float _726 = 1.0 / _718;
        float _728 = 1.0 / _724;
        float _730 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _732 = _720 * _730;
        float _734 = _716 * _726;
        float _736 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _738 = fma(_734, _732, _736);
        float _740 = _738 * _728;
        float _742 = precise::clamp(_740, 0.0, 1.0);
        float _744 = -_742;
        float _746 = _744 + 1.0;
        _582 = _728;
        _584 = _688;
        _586 = _700;
        _628 = _746;
    }
    float _748 = _582;
    float _750 = _584;
    float _752 = _586;
    float _754 = _628;
    float _756 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _758 = _680 + _756;
    float _760 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _762 = _682 + _760;
    float _764 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _766 = _684 + _764;
    float _768 = _758 * _758;
    float _770 = fma(_762, _762, _768);
    float _772 = fma(_766, _766, _770);
    float _774 = rsqrt(_772);
    float _776 = _774 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _778 = _762 * _776;
    float _780 = _766 * _776;
    float _782 = _778 * _778;
    float _784 = _780 * _780;
    float _786 = _782 + _784;
    float _788 = sqrt(_786);
    bool _790 = _788 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _792 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _794 = _788 + _792;
    float _796 = _748;
    float _798 = _786;
    float _800 = _794;
    float _802 = _750;
    float _804 = _758;
    float _806 = _778;
    if (_790)
    {
        float _808 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _796 = _808;
    }
    float _810 = _796;
    if (_790)
    {
        float _812 = rsqrt(_786);
        _798 = _812;
    }
    float _814 = _798;
    float _816 = _810;
    float _818 = _814;
    if (_790)
    {
        float _820 = _794 * _810;
        _800 = _820;
    }
    float _822 = _800;
    if (_790)
    {
        float _824 = _822 * 0.15915493667125701904296875;
        _802 = _824;
    }
    float _826 = _802;
    float _828 = _766;
    if (_790)
    {
        float _830 = _826 * 6.283185482025146484375;
        float _832 = sin(_830);
        _828 = _832;
    }
    float _834 = _828;
    float _836 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _838 = precise::max(0.0, _836);
    float _840 = _752;
    float _842 = _838;
    if (_790)
    {
        float _844 = _826 * 6.283185482025146484375;
        float _846 = cos(_844);
        _840 = _846;
    }
    float _848 = _840;
    float _850 = -_776;
    float _852 = -_838;
    float _854 = fma(_758, _850, _852);
    if (_790)
    {
        float _856 = _854 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _804 = _856;
    }
    float _858 = _804;
    float _860 = sqrt(_772);
    float _862 = _834;
    float _864 = _858;
    if (_790)
    {
        float _866 = fma(_834, _858, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _862 = _866;
    }
    float _868 = _862;
    float _870 = _868;
    if (!_790)
    {
        _864 = _780;
    }
    float _872 = _864;
    float _874 = _872;
    if (_790)
    {
        float _876 = _848 + (-1.0);
        _842 = _876;
    }
    float _878 = _842;
    float _880 = 0.0;
    float _882 = _878;
    if (_790)
    {
        float _884 = _814 * _868;
        _880 = _884;
    }
    float _886 = _880;
    if (!_790)
    {
        _870 = _854;
    }
    float _888 = _870;
    float _890 = _888;
    if (_790)
    {
        float _892 = _878 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _816 = _892;
    }
    float _894 = _816;
    if (_790)
    {
        float _896 = _778 * _886;
        _806 = _896;
    }
    float _898 = _806;
    if (!_790)
    {
        _818 = _782;
    }
    float _900 = _818;
    float _902 = _900;
    if (_790)
    {
        float _904 = _780 * _886;
        _874 = _904;
    }
    float _906 = _874;
    if (_790)
    {
        float _908 = fma(_854, _848, _894);
        _890 = _908;
    }
    float _910 = _890;
    if (_790)
    {
        float _912 = _898 * _898;
        _902 = _912;
    }
    float _914 = _902;
    if (!_790)
    {
        _882 = _784;
    }
    float _916 = _882;
    float _918 = _916;
    if (_790)
    {
        float _920 = _906 * _906;
        _918 = _920;
    }
    float _922 = _918;
    float _924 = fma(_910, _910, _914);
    float _926 = _924 + _922;
    float _928 = _680 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _930 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _932 = fma(_860, (*spvDescriptorSet0.vp_c15)._m0[23].w, _930);
    float _934 = precise::clamp(_932, 0.0, 1.0);
    float _936 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _938 = rsqrt(_926);
    float _940 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[2].x, _928);
    float _942 = _680 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _944 = _680 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _946 = -_934;
    float _948 = _946 + 1.0;
    float _950 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[2].z, _940);
    float _952 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[1].x, _942);
    float _954 = _680 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _956 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[0].x, _944);
    float _958 = abs(_948);
    float _960 = log2(_958);
    float _962 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[1].z, _952);
    float _964 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[3].x, _954);
    float _966 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[0].z, _956);
    float _968 = _950 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _970 = _962 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _972 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[3].z, _964);
    float _974 = _966 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _976 = _938 * _898;
    float _978 = _970 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _980 = _972 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _982 = _938 * _910;
    float _984 = _938 * _906;
    float _986 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[7].x, _978);
    float _988 = _976 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _990 = _968 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _992 = _960 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _994 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[7].z, _986);
    float _996 = -_988;
    float _998 = fma(_982, (*spvDescriptorSet0.vp_c15)._m0[21].y, _996);
    float _1000 = -_990;
    float _1002 = fma(_1000, _936, 1.0);
    float _1004 = _970 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1006 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[7].w, _994);
    float _1008 = -_984;
    float _1010 = fma(_1008, (*spvDescriptorSet0.vp_c15)._m0[21].z, _998);
    float _1012 = exp2(_992);
    float _1014 = _970 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1016 = fma(_1010, -0.5, 0.5);
    float _1018 = fma(_1010, 0.5, 0.5);
    float _1020 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1014);
    float _1022 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1004);
    float _1024 = _982 + 1.0;
    float _1026 = log2(_1002);
    float _1028 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1020);
    float _1030 = fma(_1018, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1032 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1022);
    float _1034 = fma(_1018, _1030, -0.212114393711090087890625);
    float _1036 = 1.0 / _1006;
    float _1038 = -_982;
    float _1040 = fma(_1012, _1024, _1038);
    float _1042 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1028);
    float _1044 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1032);
    float _1046 = fma(_1018, _1034, 1.570728778839111328125);
    float _1048 = fma(_1040, 0.5, 0.5);
    float _1050 = sqrt(_1016);
    float _1052 = _1026 * 0.693147182464599609375;
    float _1054 = _1052 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1056 = _1042 * _1036;
    float _1058 = _1044 * _1036;
    float _1060 = fma(_1056, 0.5, 0.5);
    float _1062 = fma(_1058, -0.5, 0.5);
    float _1064 = _1050 * 0.636619746685028076171875;
    float _1066 = -_1046;
    float _1068 = fma(_1064, _1066, 1.0);
    float3 _3060 = float3(_1060, _1062, _1054);
    float _1070 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3060, float3(0.0), isnan(_3060)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3060, float3(0.0), isnan(_3060)), level(0.0)).x;
    float3 _3071 = float3(_1060, _1062, _1054);
    float4 _1073 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3071, float3(0.0), isnan(_3071)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3071, float3(0.0), isnan(_3071)), level(0.0)).xyzw;
    float _1075 = _1073.x;
    float _1077 = _1073.y;
    float _1079 = _1073.z;
    float _1081 = _1073.w;
    float2 _3088 = float2(_1068, _1048);
    float3 _1085 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3088, float2(0.0), isnan(_3088)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3088, float2(0.0), isnan(_3088)), level(0.0)).xyz;
    float _1087 = _1085.x;
    float _1089 = _1085.y;
    float _1091 = _1085.z;
    float _1093 = in.m_51.x;
    float _1095 = in.m_51.y;
    float _1097 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1099 = in.m_57.y;
    int _1101 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1103 = _1101 != 0;
    out.m_59.x = _496;
    int _1105 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1107 = _1105 != 0;
    float _1109 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1111 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1109;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1115 = _1113 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1119 = 1.0 / _1111;
    out.m_59.y = _484;
    out.m_59.z = _498;
    float _1121 = 1.0 / _1115;
    float _1123 = 0.0;
    if (_1103)
    {
        float _1125 = in.m_51.x;
        _1123 = _1125;
    }
    float _1127 = _1123;
    float _1129 = _1093 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1131 = _1095 > 0.5;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1135 = -_1117;
    float _1137 = fma(_1129, 2.0, _1135);
    float _1139 = -_1099;
    float _1141 = _1139 + 1.0;
    float _1143 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1145 = _1095 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1147 = in.m_61.w;
    float _1149 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1151 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1143);
    float _1153 = _1099;
    if (_1107)
    {
        float _1155 = _1131 ? _1141 : _1099;
        _1153 = _1155;
    }
    float _1157 = _1153;
    float _1159 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1161 = _476 + _1159;
    float _1163 = fma(_1095, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1149);
    float _1165 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1167 = _476 + _1165;
    float _1169 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1171 = fma(_1145, -2.0, _1133);
    float _1173 = in.m_57.x;
    float _1175 = _1161 * _1119;
    float _1177 = _1167 * _1121;
    float _1179 = fma(_1169, _1157, -0.5);
    float _1181 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1171);
    float _1183 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1163);
    float _1185 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1151);
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1187;
    float _1191 = -_1181;
    float _1193 = fma(_1183, _1179, _1191);
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1197 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1195;
    float _1199 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1199;
    float _1203 = fma(_1189, _1175, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1205 = -_124;
    float _1207 = fma(_1205, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1137);
    float _1209 = fma(_1197, _1175, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1211 = fma(_1201, _1175, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1213 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1215 = isnan(_476);
    bool _1217 = _1213 || _1215;
    bool _1219 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1221 = _1217 || _1219;
    float _1223 = float(_1221);
    out.m_63.w = _1147;
    bool _1225 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1227 = isnan(_476);
    bool _1229 = _1225 || _1227;
    bool _1231 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1233 = _1229 || _1231;
    float _1235 = float(_1233);
    float _1237 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1239 = _1237 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1241 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1243 = isnan(_476);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1249 = _1245 || _1247;
    float _1251 = float(_1249);
    float _1253 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1255 = _1253 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1259 = _1257 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1261 = -_1223;
    float _1263 = _1261 + 1.0;
    float _1265 = -_1235;
    float _1267 = _1265 + 1.0;
    bool _1269 = _1127 > 0.5;
    bool _1271 = _1269 && _1103;
    float _1273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1275 = _1251 * _1263;
    float _1277 = _1223 * _1267;
    float _1279 = fma(_1255, _1177, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1283 = _1255;
    if (_1103)
    {
        _1281 = _1173;
    }
    float _1285 = _1281;
    float _1287 = _1209 * _1275;
    float _1289 = _1285;
    if (!_1103)
    {
        _1283 = _1173;
    }
    float _1291 = _1283;
    float _1293 = _1203 * _1275;
    float _1295 = -_1251;
    float _1297 = _1295 + 1.0;
    float _1299 = _1211 * _1275;
    float _1301 = _1193 + 0.5;
    float _1303 = fma(_1259, _1177, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1305 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1293);
    float _1307 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1287);
    float _1309 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1299);
    float _1311 = _970 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1313 = _960 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1315 = _1291;
    if (_1271)
    {
        float _1317 = -_1285;
        float _1319 = _1317 + 1.0;
        _1289 = _1319;
    }
    float _1321 = _1289;
    float _1323 = _1273 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1325 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1311);
    float _1327 = fma(_1239, _1177, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1329 = fma(_1279, _1277, _1305);
    if (_1103)
    {
        _1315 = _1321;
    }
    float _1331 = _1315;
    float _1333 = exp2(_1313);
    float _1335 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1325);
    float _1337 = _1006 * 0.5;
    float _1339 = fma(_1303, _1277, _1307);
    float _1341 = fma(_1323, _1331, -0.5);
    float _1343 = fma(_1327, _1277, _1309);
    float _1345 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1329);
    float _1347 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1339);
    float _1349 = fma(_1185, _1341, _1207);
    float _1351 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1343);
    float _1353 = _754 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1355 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1335);
    float _1357 = _1349 + 0.5;
    bool _1359 = _754 > 0.0;
    bool _1361 = isnan(_754);
    bool _1363 = _1359 || _1361;
    bool _1365 = isnan(0.0);
    bool _1367 = _1363 || _1365;
    float _1369 = _1345 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1371 = -_1333;
    float _1373 = _1371 + 1.0;
    out.m_65.x = _1357;
    out.m_65.y = _1301;
    float _1375 = _1347 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1377 = _1351 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1379 = _1355 + _1006;
    out.gl_Position.x = _1042;
    out.gl_Position.y = _1044;
    out.gl_Position.z = _1355;
    out.gl_Position.w = _1006;
    float _1381 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1383 = _1369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1385 = _1375 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1387 = _1377 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1389 = fma(_1044, -0.5, _1337);
    float _1391 = _1373 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1393 = _1353 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1395 = _1042 + _1006;
    float _1397 = _1379 * 0.5;
    out.m_67.x = _1383;
    out.m_67.y = _1385;
    out.m_67.z = _1387;
    out.m_67.w = _1381;
    float _1399 = _1395 * 0.5;
    out.m_45.x = _1393;
    out.m_69.x = _1399;
    out.m_69.y = _1389;
    out.m_69.z = _1397;
    out.m_69.w = _1006;
    float _1401 = _1391 * _1070;
    float _1403 = -_1391;
    float _1405 = _1403 + 1.0;
    float _1407 = _1081 * _1401;
    float _1409 = _1091 * _1401;
    float _1411 = fma(_1087, _1407, _1075);
    float _1413 = fma(_1089, _1407, _1077);
    float _1415 = _1081 * _1405;
    float _1417 = fma(_1081, _1409, _1079);
    out.m_71.x = _1411;
    out.m_71.y = _1413;
    out.m_71.z = _1417;
    out.m_71.w = _1415;
    if (_1367)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1419 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1419;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _468 = false;
    bool _286 = false;
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
        float _1476 = as_type<float>(_106);
        out.gl_Position.z = _1476;
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
        out.m_45.x = 0.0;
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
        float _1545 = as_type<float>(_142);
        out.gl_Position.z = _1545;
    }
    if (_134)
    {
        return out;
    }
    float _144 = in.m_49.w;
    float _146 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_47.x;
    float _160 = in.m_47.y;
    float _162 = in.m_47.z;
    float _164 = in.m_42.x;
    float _166 = in.m_42.y;
    float _168 = in.m_42.z;
    float _170 = 0.0;
    float _172 = _146;
    if (!_156)
    {
        float _174 = _146 * _146;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = _178;
    if (!_156)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    bool _186 = !_156;
    float _188 = _184;
    if (!_186)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _146 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _146);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _218;
    }
    float _220 = _188;
    bool _222 = !_156;
    if (!_222)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = 1.0 / _230;
        float _234 = _146 * _226;
        float _236 = exp2(_234);
        float _238 = -_236;
        float _240 = _238 + 1.0;
        float _242 = _240 * _232;
        _172 = _242;
    }
    float _244 = _172;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _248 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _252 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _254 = fma(_244, _158, _248);
    float _256 = fma(_244, _160, _250);
    float _258 = fma(_244, _162, _252);
    float _260 = fma(_254, _144, _164);
    float _262 = fma(_256, _144, _166);
    float _264 = fma(_258, _144, _168);
    bool _266 = !_246;
    float _284;
    if (!_266)
    {
        float _268 = in.m_51.x;
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        float _288 = float(_90);
        float _290 = 1.0 / _288;
        float _292 = _124 * _290;
        _284 = _292;
    }
    _286 = false;
    float _294 = _284;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _298 = _294 + _296;
    bool _300 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _302 = isnan(_294);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _314 = _294 + _312;
    bool _316 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _318 = isnan(_294);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _336 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _338 = isnan(_294);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -_310;
    float _350 = _348 + 1.0;
    float _352 = 1.0 / _330;
    float _354 = _346 * _350;
    float _356 = -_346;
    float _358 = _356 + 1.0;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _360;
    bool _364 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _366 = 1.0 / _334;
    float _368 = _326 * _358;
    float _370 = -_326;
    float _372 = _370 + 1.0;
    float _374 = _298 * _352;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _380;
    float _384 = fma(_362, _374, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _386 = fma(_378, _374, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _388 = fma(_382, _374, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _390 = _314 * _366;
    float _392 = _384 * _368;
    float _394 = _386 * _368;
    float _396 = _388 * _368;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _410 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[107].x, _392);
    float _412 = fma(_400, _390, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _414 = fma(_404, _390, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _416 = fma(_408, _390, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _418 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[107].y, _394);
    float _420 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[107].z, _396);
    float _422 = fma(_412, _354, _410);
    float _424 = fma(_414, _354, _418);
    float _426 = fma(_416, _354, _420);
    float _428 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[109].x, _422);
    float _430 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[109].y, _424);
    float _432 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[109].z, _426);
    float _434 = _428 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _438 = _430 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _440 = _432 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _442 = _434 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _444 = _438 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _446 = _440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _442;
    out.m_53.y = _444;
    out.m_53.z = _446;
    out.m_53.w = _436;
    bool _448 = !_364;
    float _466;
    if (!_448)
    {
        float _450 = in.m_51.x;
        float _452 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _454 = _450 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _456 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _458 = _456 * _452;
        float _460 = floor(_458);
        float _462 = -_460;
        float _464 = _458 + _462;
        _466 = _464;
        _468 = true;
    }
    else
    {
        float _470 = float(_90);
        float _472 = 1.0 / _470;
        float _474 = _124 * _472;
        _466 = _474;
    }
    _468 = false;
    float _476 = _466;
    float _478 = in.m_49.x;
    float _480 = in.m_49.y;
    float _482 = in.m_49.z;
    float _484 = in.m_55.y;
    bool _486 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _488 = isnan(0.5);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _494 = _490 || _492;
    float _496 = in.m_55.x;
    float _498 = in.m_55.z;
    float _500 = _480 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _502 = _478 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _504 = _482 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _506 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _508 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _484);
    float _510 = _500 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _512 = _502 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _514 = _504 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _516 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _496);
    float _518 = _510 * _508;
    float _520 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _506);
    float _522 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _498);
    float _524 = _512 * _516;
    float _526 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _528 = _518 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _530 = _514 * _522;
    float _532 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].z, _520);
    float _534 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _526);
    float _536 = _518 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _538 = fma(_524, (*spvDescriptorSet0.vp_c10)._m0[10].x, _528);
    float _540 = _532 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _542 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].z, _534);
    float _544 = fma(_524, (*spvDescriptorSet0.vp_c10)._m0[8].x, _536);
    float _546 = fma(_530, (*spvDescriptorSet0.vp_c10)._m0[10].z, _538);
    float _548 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _550 = _542 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _552 = fma(_530, (*spvDescriptorSet0.vp_c10)._m0[8].z, _544);
    float _554 = _540 + _546;
    float _556 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _548);
    float _558 = _518 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _560 = _550 + _552;
    float _562 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _564 = _554 + _562;
    float _566 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].z, _556);
    float _568 = fma(_524, (*spvDescriptorSet0.vp_c10)._m0[9].x, _558);
    float _570 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _572 = _560 + _570;
    float _574 = _564 * _564;
    float _576 = _566 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _578 = fma(_530, (*spvDescriptorSet0.vp_c10)._m0[9].z, _568);
    float _580 = _530;
    float _582 = _554;
    float _584 = _576;
    float _586 = _550;
    if (_494)
    {
        _580 = 1.0;
    }
    float _588 = _580;
    float _590 = fma(_572, _572, _574);
    float _592 = _576 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _594 = _576 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _596 = _576 + _578;
    float _598 = sqrt(_590);
    float _600 = fma(_550, (*spvDescriptorSet0.vp_c8)._m0[11].x, _592);
    float _602 = fma(_550, (*spvDescriptorSet0.vp_c8)._m0[10].x, _594);
    float _604 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[11].z, _600);
    float _606 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[10].z, _602);
    float _608 = _604 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _610 = _606 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _612 = 1.0 / _608;
    float _614 = _610 + _608;
    bool _616 = _598 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _618 = _614 * _612;
    float _620 = _618 * 0.5;
    float _622 = _608;
    float _624 = _614;
    float _626 = _612;
    float _628 = _588;
    if (!_616)
    {
        _622 = _560;
    }
    float _630 = _622;
    float _632 = _630;
    if (!_616)
    {
        _624 = _554;
    }
    float _634 = _624;
    float _636 = _634;
    if (!_616)
    {
        _626 = _596;
    }
    float _638 = _626;
    bool _640 = !_616;
    float _642 = _638;
    if (!_640)
    {
        float _644 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _646 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _648 = _598 + _646;
        float _650 = rsqrt(_590);
        float _652 = _648 * _644;
        float _654 = _596 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _656 = _652 * 0.15915493667125701904296875;
        float _658 = _656 * 6.283185482025146484375;
        float _660 = sin(_658);
        float _662 = _656 * 6.283185482025146484375;
        float _664 = cos(_662);
        float _666 = fma(_660, _654, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _668 = _650 * _666;
        float _670 = _664 + (-1.0);
        float _672 = fma(_572, _668, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _674 = fma(_564, _668, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _676 = _670 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _678 = fma(_596, _664, _676);
        _642 = _678;
        _632 = _672;
        _636 = _674;
    }
    float _680 = _642;
    float _682 = _632;
    float _684 = _636;
    if (!_494)
    {
        float _686 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _688 = _686 * 0.15915493667125701904296875;
        float _690 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _692 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _694 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[30].w, _692);
        float _696 = _688 * 6.283185482025146484375;
        float _698 = cos(_696);
        float _700 = _690 * 0.15915493667125701904296875;
        float _702 = _688 * 6.283185482025146484375;
        float _704 = sin(_702);
        float _706 = 1.0 / _698;
        float _708 = _700 * 6.283185482025146484375;
        float _710 = cos(_708);
        float _712 = _704 * _706;
        float _714 = _700 * 6.283185482025146484375;
        float _716 = sin(_714);
        float _718 = _710 * _712;
        float _720 = 1.0 / _694;
        float _722 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _724 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _722;
        float _726 = 1.0 / _718;
        float _728 = 1.0 / _724;
        float _730 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _732 = _720 * _730;
        float _734 = _716 * _726;
        float _736 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _738 = fma(_734, _732, _736);
        float _740 = _738 * _728;
        float _742 = precise::clamp(_740, 0.0, 1.0);
        float _744 = -_742;
        float _746 = _744 + 1.0;
        _582 = _728;
        _584 = _688;
        _586 = _700;
        _628 = _746;
    }
    float _748 = _582;
    float _750 = _584;
    float _752 = _586;
    float _754 = _628;
    float _756 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _758 = _680 + _756;
    float _760 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _762 = _682 + _760;
    float _764 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _766 = _684 + _764;
    float _768 = _758 * _758;
    float _770 = fma(_762, _762, _768);
    float _772 = fma(_766, _766, _770);
    float _774 = rsqrt(_772);
    float _776 = _774 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _778 = _762 * _776;
    float _780 = _766 * _776;
    float _782 = _778 * _778;
    float _784 = _780 * _780;
    float _786 = _782 + _784;
    float _788 = sqrt(_786);
    bool _790 = _788 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _792 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _794 = _788 + _792;
    float _796 = _748;
    float _798 = _786;
    float _800 = _794;
    float _802 = _750;
    float _804 = _758;
    float _806 = _778;
    if (_790)
    {
        float _808 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _796 = _808;
    }
    float _810 = _796;
    if (_790)
    {
        float _812 = rsqrt(_786);
        _798 = _812;
    }
    float _814 = _798;
    float _816 = _810;
    float _818 = _814;
    if (_790)
    {
        float _820 = _794 * _810;
        _800 = _820;
    }
    float _822 = _800;
    if (_790)
    {
        float _824 = _822 * 0.15915493667125701904296875;
        _802 = _824;
    }
    float _826 = _802;
    float _828 = _766;
    if (_790)
    {
        float _830 = _826 * 6.283185482025146484375;
        float _832 = sin(_830);
        _828 = _832;
    }
    float _834 = _828;
    float _836 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _838 = precise::max(0.0, _836);
    float _840 = _752;
    float _842 = _838;
    if (_790)
    {
        float _844 = _826 * 6.283185482025146484375;
        float _846 = cos(_844);
        _840 = _846;
    }
    float _848 = _840;
    float _850 = -_776;
    float _852 = -_838;
    float _854 = fma(_758, _850, _852);
    if (_790)
    {
        float _856 = _854 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _804 = _856;
    }
    float _858 = _804;
    float _860 = sqrt(_772);
    float _862 = _834;
    float _864 = _858;
    if (_790)
    {
        float _866 = fma(_834, _858, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _862 = _866;
    }
    float _868 = _862;
    float _870 = _868;
    if (!_790)
    {
        _864 = _780;
    }
    float _872 = _864;
    float _874 = _872;
    if (_790)
    {
        float _876 = _848 + (-1.0);
        _842 = _876;
    }
    float _878 = _842;
    float _880 = 0.0;
    float _882 = _878;
    if (_790)
    {
        float _884 = _814 * _868;
        _880 = _884;
    }
    float _886 = _880;
    if (!_790)
    {
        _870 = _854;
    }
    float _888 = _870;
    float _890 = _888;
    if (_790)
    {
        float _892 = _878 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _816 = _892;
    }
    float _894 = _816;
    if (_790)
    {
        float _896 = _778 * _886;
        _806 = _896;
    }
    float _898 = _806;
    if (!_790)
    {
        _818 = _782;
    }
    float _900 = _818;
    float _902 = _900;
    if (_790)
    {
        float _904 = _780 * _886;
        _874 = _904;
    }
    float _906 = _874;
    if (_790)
    {
        float _908 = fma(_854, _848, _894);
        _890 = _908;
    }
    float _910 = _890;
    if (_790)
    {
        float _912 = _898 * _898;
        _902 = _912;
    }
    float _914 = _902;
    if (!_790)
    {
        _882 = _784;
    }
    float _916 = _882;
    float _918 = _916;
    if (_790)
    {
        float _920 = _906 * _906;
        _918 = _920;
    }
    float _922 = _918;
    float _924 = fma(_910, _910, _914);
    float _926 = _924 + _922;
    float _928 = _680 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _930 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _932 = fma(_860, (*spvDescriptorSet0.vp_c15)._m0[23].w, _930);
    float _934 = precise::clamp(_932, 0.0, 1.0);
    float _936 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _938 = rsqrt(_926);
    float _940 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[2].x, _928);
    float _942 = _680 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _944 = _680 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _946 = -_934;
    float _948 = _946 + 1.0;
    float _950 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[2].z, _940);
    float _952 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[1].x, _942);
    float _954 = _680 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _956 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[0].x, _944);
    float _958 = abs(_948);
    float _960 = log2(_958);
    float _962 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[1].z, _952);
    float _964 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[3].x, _954);
    float _966 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[0].z, _956);
    float _968 = _950 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _970 = _962 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _972 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[3].z, _964);
    float _974 = _966 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _976 = _938 * _898;
    float _978 = _970 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _980 = _972 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _982 = _938 * _910;
    float _984 = _938 * _906;
    float _986 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[7].x, _978);
    float _988 = _976 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _990 = _968 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _992 = _960 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _994 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[7].z, _986);
    float _996 = -_988;
    float _998 = fma(_982, (*spvDescriptorSet0.vp_c15)._m0[21].y, _996);
    float _1000 = -_990;
    float _1002 = fma(_1000, _936, 1.0);
    float _1004 = _970 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1006 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[7].w, _994);
    float _1008 = -_984;
    float _1010 = fma(_1008, (*spvDescriptorSet0.vp_c15)._m0[21].z, _998);
    float _1012 = exp2(_992);
    float _1014 = _970 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1016 = fma(_1010, -0.5, 0.5);
    float _1018 = fma(_1010, 0.5, 0.5);
    float _1020 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1014);
    float _1022 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1004);
    float _1024 = _982 + 1.0;
    float _1026 = log2(_1002);
    float _1028 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1020);
    float _1030 = fma(_1018, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1032 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1022);
    float _1034 = fma(_1018, _1030, -0.212114393711090087890625);
    float _1036 = 1.0 / _1006;
    float _1038 = -_982;
    float _1040 = fma(_1012, _1024, _1038);
    float _1042 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1028);
    float _1044 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1032);
    float _1046 = fma(_1018, _1034, 1.570728778839111328125);
    float _1048 = fma(_1040, 0.5, 0.5);
    float _1050 = sqrt(_1016);
    float _1052 = _1026 * 0.693147182464599609375;
    float _1054 = _1052 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1056 = _1042 * _1036;
    float _1058 = _1044 * _1036;
    float _1060 = fma(_1056, 0.5, 0.5);
    float _1062 = fma(_1058, -0.5, 0.5);
    float _1064 = _1050 * 0.636619746685028076171875;
    float _1066 = -_1046;
    float _1068 = fma(_1064, _1066, 1.0);
    float3 _3060 = float3(_1060, _1062, _1054);
    float _1070 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3060, float3(0.0), isnan(_3060)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3060, float3(0.0), isnan(_3060)), level(0.0)).x;
    float3 _3071 = float3(_1060, _1062, _1054);
    float4 _1073 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3071, float3(0.0), isnan(_3071)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3071, float3(0.0), isnan(_3071)), level(0.0)).xyzw;
    float _1075 = _1073.x;
    float _1077 = _1073.y;
    float _1079 = _1073.z;
    float _1081 = _1073.w;
    float2 _3088 = float2(_1068, _1048);
    float3 _1085 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3088, float2(0.0), isnan(_3088)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3088, float2(0.0), isnan(_3088)), level(0.0)).xyz;
    float _1087 = _1085.x;
    float _1089 = _1085.y;
    float _1091 = _1085.z;
    float _1093 = in.m_51.x;
    float _1095 = in.m_51.y;
    float _1097 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1099 = in.m_57.y;
    int _1101 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1103 = _1101 != 0;
    out.m_59.x = _496;
    int _1105 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1107 = _1105 != 0;
    float _1109 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1111 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1109;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1115 = _1113 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1119 = 1.0 / _1111;
    out.m_59.y = _484;
    out.m_59.z = _498;
    float _1121 = 1.0 / _1115;
    float _1123 = 0.0;
    if (_1103)
    {
        float _1125 = in.m_51.x;
        _1123 = _1125;
    }
    float _1127 = _1123;
    float _1129 = _1093 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1131 = _1095 > 0.5;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1135 = -_1117;
    float _1137 = fma(_1129, 2.0, _1135);
    float _1139 = -_1099;
    float _1141 = _1139 + 1.0;
    float _1143 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1145 = _1095 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1147 = in.m_61.w;
    float _1149 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1151 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1143);
    float _1153 = _1099;
    if (_1107)
    {
        float _1155 = _1131 ? _1141 : _1099;
        _1153 = _1155;
    }
    float _1157 = _1153;
    float _1159 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1161 = _476 + _1159;
    float _1163 = fma(_1095, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1149);
    float _1165 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1167 = _476 + _1165;
    float _1169 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1171 = fma(_1145, -2.0, _1133);
    float _1173 = in.m_57.x;
    float _1175 = _1161 * _1119;
    float _1177 = _1167 * _1121;
    float _1179 = fma(_1169, _1157, -0.5);
    float _1181 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1171);
    float _1183 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1163);
    float _1185 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1151);
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1187;
    float _1191 = -_1181;
    float _1193 = fma(_1183, _1179, _1191);
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1197 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1195;
    float _1199 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1199;
    float _1203 = fma(_1189, _1175, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1205 = -_124;
    float _1207 = fma(_1205, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1137);
    float _1209 = fma(_1197, _1175, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1211 = fma(_1201, _1175, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1213 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1215 = isnan(_476);
    bool _1217 = _1213 || _1215;
    bool _1219 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1221 = _1217 || _1219;
    float _1223 = float(_1221);
    out.m_63.w = _1147;
    bool _1225 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1227 = isnan(_476);
    bool _1229 = _1225 || _1227;
    bool _1231 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1233 = _1229 || _1231;
    float _1235 = float(_1233);
    float _1237 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1239 = _1237 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1241 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1243 = isnan(_476);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1249 = _1245 || _1247;
    float _1251 = float(_1249);
    float _1253 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1255 = _1253 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1259 = _1257 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1261 = -_1223;
    float _1263 = _1261 + 1.0;
    float _1265 = -_1235;
    float _1267 = _1265 + 1.0;
    bool _1269 = _1127 > 0.5;
    bool _1271 = _1269 && _1103;
    float _1273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1275 = _1251 * _1263;
    float _1277 = _1223 * _1267;
    float _1279 = fma(_1255, _1177, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1283 = _1255;
    if (_1103)
    {
        _1281 = _1173;
    }
    float _1285 = _1281;
    float _1287 = _1209 * _1275;
    float _1289 = _1285;
    if (!_1103)
    {
        _1283 = _1173;
    }
    float _1291 = _1283;
    float _1293 = _1203 * _1275;
    float _1295 = -_1251;
    float _1297 = _1295 + 1.0;
    float _1299 = _1211 * _1275;
    float _1301 = _1193 + 0.5;
    float _1303 = fma(_1259, _1177, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1305 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1293);
    float _1307 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1287);
    float _1309 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1299);
    float _1311 = _970 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1313 = _960 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1315 = _1291;
    if (_1271)
    {
        float _1317 = -_1285;
        float _1319 = _1317 + 1.0;
        _1289 = _1319;
    }
    float _1321 = _1289;
    float _1323 = _1273 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1325 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1311);
    float _1327 = fma(_1239, _1177, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1329 = fma(_1279, _1277, _1305);
    if (_1103)
    {
        _1315 = _1321;
    }
    float _1331 = _1315;
    float _1333 = exp2(_1313);
    float _1335 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1325);
    float _1337 = _1006 * 0.5;
    float _1339 = fma(_1303, _1277, _1307);
    float _1341 = fma(_1323, _1331, -0.5);
    float _1343 = fma(_1327, _1277, _1309);
    float _1345 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1329);
    float _1347 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1339);
    float _1349 = fma(_1185, _1341, _1207);
    float _1351 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1343);
    float _1353 = _754 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1355 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1335);
    float _1357 = _1349 + 0.5;
    bool _1359 = _754 > 0.0;
    bool _1361 = isnan(_754);
    bool _1363 = _1359 || _1361;
    bool _1365 = isnan(0.0);
    bool _1367 = _1363 || _1365;
    float _1369 = _1345 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1371 = -_1333;
    float _1373 = _1371 + 1.0;
    out.m_65.x = _1357;
    out.m_65.y = _1301;
    float _1375 = _1347 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1377 = _1351 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1379 = _1355 + _1006;
    out.gl_Position.x = _1042;
    out.gl_Position.y = _1044;
    out.gl_Position.z = _1355;
    out.gl_Position.w = _1006;
    float _1381 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1383 = _1369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1385 = _1375 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1387 = _1377 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1389 = fma(_1044, -0.5, _1337);
    float _1391 = _1373 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1393 = _1353 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1395 = _1042 + _1006;
    float _1397 = _1379 * 0.5;
    out.m_67.x = _1383;
    out.m_67.y = _1385;
    out.m_67.z = _1387;
    out.m_67.w = _1381;
    float _1399 = _1395 * 0.5;
    out.m_45.x = _1393;
    out.m_69.x = _1399;
    out.m_69.y = _1389;
    out.m_69.z = _1397;
    out.m_69.w = _1006;
    float _1401 = _1391 * _1070;
    float _1403 = -_1391;
    float _1405 = _1403 + 1.0;
    float _1407 = _1081 * _1401;
    float _1409 = _1091 * _1401;
    float _1411 = fma(_1087, _1407, _1075);
    float _1413 = fma(_1089, _1407, _1077);
    float _1415 = _1081 * _1405;
    float _1417 = fma(_1081, _1409, _1079);
    out.m_71.x = _1411;
    out.m_71.y = _1413;
    out.m_71.z = _1417;
    out.m_71.w = _1415;
    if (_1367)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1419 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1419;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _468 = false;
    bool _286 = false;
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
        float _1476 = as_type<float>(_106);
        out.gl_Position.z = _1476;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_47.w;
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
        out.m_45.x = 0.0;
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
        float _1545 = as_type<float>(_142);
        out.gl_Position.z = _1545;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_49.w;
    float _146 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_47.x;
    float _160 = in.m_47.y;
    float _162 = in.m_47.z;
    float _164 = in.m_42.x;
    float _166 = in.m_42.y;
    float _168 = in.m_42.z;
    float _170 = 0.0;
    float _172 = _146;
    if (!_156)
    {
        float _174 = _146 * _146;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = _178;
    if (!_156)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    bool _186 = !_156;
    float _188 = _184;
    if (!_186)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _146 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _146);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _218;
    }
    float _220 = _188;
    bool _222 = !_156;
    if (!_222)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = 1.0 / _230;
        float _234 = _146 * _226;
        float _236 = exp2(_234);
        float _238 = -_236;
        float _240 = _238 + 1.0;
        float _242 = _240 * _232;
        _172 = _242;
    }
    float _244 = _172;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _248 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _252 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _254 = fma(_244, _158, _248);
    float _256 = fma(_244, _160, _250);
    float _258 = fma(_244, _162, _252);
    float _260 = fma(_254, _144, _164);
    float _262 = fma(_256, _144, _166);
    float _264 = fma(_258, _144, _168);
    bool _266 = !_246;
    float _284;
    if (!_266)
    {
        float _268 = in.m_51.x;
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        float _288 = float(_90);
        float _290 = 1.0 / _288;
        float _292 = _124 * _290;
        _284 = _292;
    }
    _286 = false;
    float _294 = _284;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _298 = _294 + _296;
    bool _300 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _302 = isnan(_294);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _314 = _294 + _312;
    bool _316 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _318 = isnan(_294);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _336 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _338 = isnan(_294);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -_310;
    float _350 = _348 + 1.0;
    float _352 = 1.0 / _330;
    float _354 = _346 * _350;
    float _356 = -_346;
    float _358 = _356 + 1.0;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _360;
    bool _364 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _366 = 1.0 / _334;
    float _368 = _326 * _358;
    float _370 = -_326;
    float _372 = _370 + 1.0;
    float _374 = _298 * _352;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _380;
    float _384 = fma(_362, _374, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _386 = fma(_378, _374, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _388 = fma(_382, _374, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _390 = _314 * _366;
    float _392 = _384 * _368;
    float _394 = _386 * _368;
    float _396 = _388 * _368;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _410 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[107].x, _392);
    float _412 = fma(_400, _390, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _414 = fma(_404, _390, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _416 = fma(_408, _390, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _418 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[107].y, _394);
    float _420 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[107].z, _396);
    float _422 = fma(_412, _354, _410);
    float _424 = fma(_414, _354, _418);
    float _426 = fma(_416, _354, _420);
    float _428 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[109].x, _422);
    float _430 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[109].y, _424);
    float _432 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[109].z, _426);
    float _434 = _428 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _438 = _430 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _440 = _432 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _442 = _434 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _444 = _438 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _446 = _440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _442;
    out.m_53.y = _444;
    out.m_53.z = _446;
    out.m_53.w = _436;
    bool _448 = !_364;
    float _466;
    if (!_448)
    {
        float _450 = in.m_51.x;
        float _452 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _454 = _450 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _456 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _458 = _456 * _452;
        float _460 = floor(_458);
        float _462 = -_460;
        float _464 = _458 + _462;
        _466 = _464;
        _468 = true;
    }
    else
    {
        float _470 = float(_90);
        float _472 = 1.0 / _470;
        float _474 = _124 * _472;
        _466 = _474;
    }
    _468 = false;
    float _476 = _466;
    float _478 = in.m_49.x;
    float _480 = in.m_49.y;
    float _482 = in.m_49.z;
    float _484 = in.m_55.y;
    bool _486 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _488 = isnan(0.5);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _494 = _490 || _492;
    float _496 = in.m_55.x;
    float _498 = in.m_55.z;
    float _500 = _480 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _502 = _478 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _504 = _482 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _506 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _508 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _484);
    float _510 = _500 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _512 = _502 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _514 = _504 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _516 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _496);
    float _518 = _510 * _508;
    float _520 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _506);
    float _522 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _498);
    float _524 = _512 * _516;
    float _526 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _528 = _518 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _530 = _514 * _522;
    float _532 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].z, _520);
    float _534 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _526);
    float _536 = _518 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _538 = fma(_524, (*spvDescriptorSet0.vp_c10)._m0[10].x, _528);
    float _540 = _532 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _542 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].z, _534);
    float _544 = fma(_524, (*spvDescriptorSet0.vp_c10)._m0[8].x, _536);
    float _546 = fma(_530, (*spvDescriptorSet0.vp_c10)._m0[10].z, _538);
    float _548 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _550 = _542 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _552 = fma(_530, (*spvDescriptorSet0.vp_c10)._m0[8].z, _544);
    float _554 = _540 + _546;
    float _556 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _548);
    float _558 = _518 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _560 = _550 + _552;
    float _562 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _564 = _554 + _562;
    float _566 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].z, _556);
    float _568 = fma(_524, (*spvDescriptorSet0.vp_c10)._m0[9].x, _558);
    float _570 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _572 = _560 + _570;
    float _574 = _564 * _564;
    float _576 = _566 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _578 = fma(_530, (*spvDescriptorSet0.vp_c10)._m0[9].z, _568);
    float _580 = _530;
    float _582 = _554;
    float _584 = _576;
    float _586 = _550;
    if (_494)
    {
        _580 = 1.0;
    }
    float _588 = _580;
    float _590 = fma(_572, _572, _574);
    float _592 = _576 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _594 = _576 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _596 = _576 + _578;
    float _598 = sqrt(_590);
    float _600 = fma(_550, (*spvDescriptorSet0.vp_c8)._m0[11].x, _592);
    float _602 = fma(_550, (*spvDescriptorSet0.vp_c8)._m0[10].x, _594);
    float _604 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[11].z, _600);
    float _606 = fma(_540, (*spvDescriptorSet0.vp_c8)._m0[10].z, _602);
    float _608 = _604 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _610 = _606 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _612 = 1.0 / _608;
    float _614 = _610 + _608;
    bool _616 = _598 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _618 = _614 * _612;
    float _620 = _618 * 0.5;
    float _622 = _608;
    float _624 = _614;
    float _626 = _612;
    float _628 = _588;
    if (!_616)
    {
        _622 = _560;
    }
    float _630 = _622;
    float _632 = _630;
    if (!_616)
    {
        _624 = _554;
    }
    float _634 = _624;
    float _636 = _634;
    if (!_616)
    {
        _626 = _596;
    }
    float _638 = _626;
    bool _640 = !_616;
    float _642 = _638;
    if (!_640)
    {
        float _644 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _646 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _648 = _598 + _646;
        float _650 = rsqrt(_590);
        float _652 = _648 * _644;
        float _654 = _596 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _656 = _652 * 0.15915493667125701904296875;
        float _658 = _656 * 6.283185482025146484375;
        float _660 = sin(_658);
        float _662 = _656 * 6.283185482025146484375;
        float _664 = cos(_662);
        float _666 = fma(_660, _654, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _668 = _650 * _666;
        float _670 = _664 + (-1.0);
        float _672 = fma(_572, _668, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _674 = fma(_564, _668, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _676 = _670 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _678 = fma(_596, _664, _676);
        _642 = _678;
        _632 = _672;
        _636 = _674;
    }
    float _680 = _642;
    float _682 = _632;
    float _684 = _636;
    if (!_494)
    {
        float _686 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _688 = _686 * 0.15915493667125701904296875;
        float _690 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _692 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _694 = fma(_620, (*spvDescriptorSet0.vp_c8)._m0[30].w, _692);
        float _696 = _688 * 6.283185482025146484375;
        float _698 = cos(_696);
        float _700 = _690 * 0.15915493667125701904296875;
        float _702 = _688 * 6.283185482025146484375;
        float _704 = sin(_702);
        float _706 = 1.0 / _698;
        float _708 = _700 * 6.283185482025146484375;
        float _710 = cos(_708);
        float _712 = _704 * _706;
        float _714 = _700 * 6.283185482025146484375;
        float _716 = sin(_714);
        float _718 = _710 * _712;
        float _720 = 1.0 / _694;
        float _722 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _724 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _722;
        float _726 = 1.0 / _718;
        float _728 = 1.0 / _724;
        float _730 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _732 = _720 * _730;
        float _734 = _716 * _726;
        float _736 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _738 = fma(_734, _732, _736);
        float _740 = _738 * _728;
        float _742 = precise::clamp(_740, 0.0, 1.0);
        float _744 = -_742;
        float _746 = _744 + 1.0;
        _582 = _728;
        _584 = _688;
        _586 = _700;
        _628 = _746;
    }
    float _748 = _582;
    float _750 = _584;
    float _752 = _586;
    float _754 = _628;
    float _756 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _758 = _680 + _756;
    float _760 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _762 = _682 + _760;
    float _764 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _766 = _684 + _764;
    float _768 = _758 * _758;
    float _770 = fma(_762, _762, _768);
    float _772 = fma(_766, _766, _770);
    float _774 = rsqrt(_772);
    float _776 = _774 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _778 = _762 * _776;
    float _780 = _766 * _776;
    float _782 = _778 * _778;
    float _784 = _780 * _780;
    float _786 = _782 + _784;
    float _788 = sqrt(_786);
    bool _790 = _788 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _792 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _794 = _788 + _792;
    float _796 = _748;
    float _798 = _786;
    float _800 = _794;
    float _802 = _750;
    float _804 = _758;
    float _806 = _778;
    if (_790)
    {
        float _808 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _796 = _808;
    }
    float _810 = _796;
    if (_790)
    {
        float _812 = rsqrt(_786);
        _798 = _812;
    }
    float _814 = _798;
    float _816 = _810;
    float _818 = _814;
    if (_790)
    {
        float _820 = _794 * _810;
        _800 = _820;
    }
    float _822 = _800;
    if (_790)
    {
        float _824 = _822 * 0.15915493667125701904296875;
        _802 = _824;
    }
    float _826 = _802;
    float _828 = _766;
    if (_790)
    {
        float _830 = _826 * 6.283185482025146484375;
        float _832 = sin(_830);
        _828 = _832;
    }
    float _834 = _828;
    float _836 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _838 = precise::max(0.0, _836);
    float _840 = _752;
    float _842 = _838;
    if (_790)
    {
        float _844 = _826 * 6.283185482025146484375;
        float _846 = cos(_844);
        _840 = _846;
    }
    float _848 = _840;
    float _850 = -_776;
    float _852 = -_838;
    float _854 = fma(_758, _850, _852);
    if (_790)
    {
        float _856 = _854 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _804 = _856;
    }
    float _858 = _804;
    float _860 = sqrt(_772);
    float _862 = _834;
    float _864 = _858;
    if (_790)
    {
        float _866 = fma(_834, _858, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _862 = _866;
    }
    float _868 = _862;
    float _870 = _868;
    if (!_790)
    {
        _864 = _780;
    }
    float _872 = _864;
    float _874 = _872;
    if (_790)
    {
        float _876 = _848 + (-1.0);
        _842 = _876;
    }
    float _878 = _842;
    float _880 = 0.0;
    float _882 = _878;
    if (_790)
    {
        float _884 = _814 * _868;
        _880 = _884;
    }
    float _886 = _880;
    if (!_790)
    {
        _870 = _854;
    }
    float _888 = _870;
    float _890 = _888;
    if (_790)
    {
        float _892 = _878 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _816 = _892;
    }
    float _894 = _816;
    if (_790)
    {
        float _896 = _778 * _886;
        _806 = _896;
    }
    float _898 = _806;
    if (!_790)
    {
        _818 = _782;
    }
    float _900 = _818;
    float _902 = _900;
    if (_790)
    {
        float _904 = _780 * _886;
        _874 = _904;
    }
    float _906 = _874;
    if (_790)
    {
        float _908 = fma(_854, _848, _894);
        _890 = _908;
    }
    float _910 = _890;
    if (_790)
    {
        float _912 = _898 * _898;
        _902 = _912;
    }
    float _914 = _902;
    if (!_790)
    {
        _882 = _784;
    }
    float _916 = _882;
    float _918 = _916;
    if (_790)
    {
        float _920 = _906 * _906;
        _918 = _920;
    }
    float _922 = _918;
    float _924 = fma(_910, _910, _914);
    float _926 = _924 + _922;
    float _928 = _680 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _930 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _932 = fma(_860, (*spvDescriptorSet0.vp_c15)._m0[23].w, _930);
    float _934 = precise::clamp(_932, 0.0, 1.0);
    float _936 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _938 = rsqrt(_926);
    float _940 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[2].x, _928);
    float _942 = _680 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _944 = _680 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _946 = -_934;
    float _948 = _946 + 1.0;
    float _950 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[2].z, _940);
    float _952 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[1].x, _942);
    float _954 = _680 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _956 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[0].x, _944);
    float _958 = abs(_948);
    float _960 = log2(_958);
    float _962 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[1].z, _952);
    float _964 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[3].x, _954);
    float _966 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[0].z, _956);
    float _968 = _950 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _970 = _962 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _972 = fma(_684, (*spvDescriptorSet0.vp_c8)._m0[3].z, _964);
    float _974 = _966 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _976 = _938 * _898;
    float _978 = _970 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _980 = _972 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _982 = _938 * _910;
    float _984 = _938 * _906;
    float _986 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[7].x, _978);
    float _988 = _976 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _990 = _968 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _992 = _960 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _994 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[7].z, _986);
    float _996 = -_988;
    float _998 = fma(_982, (*spvDescriptorSet0.vp_c15)._m0[21].y, _996);
    float _1000 = -_990;
    float _1002 = fma(_1000, _936, 1.0);
    float _1004 = _970 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1006 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[7].w, _994);
    float _1008 = -_984;
    float _1010 = fma(_1008, (*spvDescriptorSet0.vp_c15)._m0[21].z, _998);
    float _1012 = exp2(_992);
    float _1014 = _970 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1016 = fma(_1010, -0.5, 0.5);
    float _1018 = fma(_1010, 0.5, 0.5);
    float _1020 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1014);
    float _1022 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1004);
    float _1024 = _982 + 1.0;
    float _1026 = log2(_1002);
    float _1028 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1020);
    float _1030 = fma(_1018, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1032 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1022);
    float _1034 = fma(_1018, _1030, -0.212114393711090087890625);
    float _1036 = 1.0 / _1006;
    float _1038 = -_982;
    float _1040 = fma(_1012, _1024, _1038);
    float _1042 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1028);
    float _1044 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1032);
    float _1046 = fma(_1018, _1034, 1.570728778839111328125);
    float _1048 = fma(_1040, 0.5, 0.5);
    float _1050 = sqrt(_1016);
    float _1052 = _1026 * 0.693147182464599609375;
    float _1054 = _1052 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1056 = _1042 * _1036;
    float _1058 = _1044 * _1036;
    float _1060 = fma(_1056, 0.5, 0.5);
    float _1062 = fma(_1058, -0.5, 0.5);
    float _1064 = _1050 * 0.636619746685028076171875;
    float _1066 = -_1046;
    float _1068 = fma(_1064, _1066, 1.0);
    float3 _3060 = float3(_1060, _1062, _1054);
    float _1070 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3060, float3(0.0), isnan(_3060)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3060, float3(0.0), isnan(_3060)), level(0.0)).x;
    float3 _3071 = float3(_1060, _1062, _1054);
    float4 _1073 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3071, float3(0.0), isnan(_3071)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3071, float3(0.0), isnan(_3071)), level(0.0)).xyzw;
    float _1075 = _1073.x;
    float _1077 = _1073.y;
    float _1079 = _1073.z;
    float _1081 = _1073.w;
    float2 _3088 = float2(_1068, _1048);
    float3 _1085 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3088, float2(0.0), isnan(_3088)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3088, float2(0.0), isnan(_3088)), level(0.0)).xyz;
    float _1087 = _1085.x;
    float _1089 = _1085.y;
    float _1091 = _1085.z;
    float _1093 = in.m_51.x;
    float _1095 = in.m_51.y;
    float _1097 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1099 = in.m_57.y;
    int _1101 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1103 = _1101 != 0;
    out.m_59.x = _496;
    int _1105 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1107 = _1105 != 0;
    float _1109 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1111 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1109;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1115 = _1113 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1119 = 1.0 / _1111;
    out.m_59.y = _484;
    out.m_59.z = _498;
    float _1121 = 1.0 / _1115;
    float _1123 = 0.0;
    if (_1103)
    {
        float _1125 = in.m_51.x;
        _1123 = _1125;
    }
    float _1127 = _1123;
    float _1129 = _1093 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1131 = _1095 > 0.5;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1135 = -_1117;
    float _1137 = fma(_1129, 2.0, _1135);
    float _1139 = -_1099;
    float _1141 = _1139 + 1.0;
    float _1143 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1145 = _1095 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1147 = in.m_61.w;
    float _1149 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1151 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1143);
    float _1153 = _1099;
    if (_1107)
    {
        float _1155 = _1131 ? _1141 : _1099;
        _1153 = _1155;
    }
    float _1157 = _1153;
    float _1159 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1161 = _476 + _1159;
    float _1163 = fma(_1095, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1149);
    float _1165 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1167 = _476 + _1165;
    float _1169 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1171 = fma(_1145, -2.0, _1133);
    float _1173 = in.m_57.x;
    float _1175 = _1161 * _1119;
    float _1177 = _1167 * _1121;
    float _1179 = fma(_1169, _1157, -0.5);
    float _1181 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1171);
    float _1183 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1163);
    float _1185 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1151);
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1187;
    float _1191 = -_1181;
    float _1193 = fma(_1183, _1179, _1191);
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1197 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1195;
    float _1199 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1199;
    float _1203 = fma(_1189, _1175, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1205 = -_124;
    float _1207 = fma(_1205, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1137);
    float _1209 = fma(_1197, _1175, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1211 = fma(_1201, _1175, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1213 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1215 = isnan(_476);
    bool _1217 = _1213 || _1215;
    bool _1219 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1221 = _1217 || _1219;
    float _1223 = float(_1221);
    out.m_63.w = _1147;
    bool _1225 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1227 = isnan(_476);
    bool _1229 = _1225 || _1227;
    bool _1231 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1233 = _1229 || _1231;
    float _1235 = float(_1233);
    float _1237 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1239 = _1237 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1241 = _476 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1243 = isnan(_476);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1249 = _1245 || _1247;
    float _1251 = float(_1249);
    float _1253 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1255 = _1253 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1259 = _1257 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1261 = -_1223;
    float _1263 = _1261 + 1.0;
    float _1265 = -_1235;
    float _1267 = _1265 + 1.0;
    bool _1269 = _1127 > 0.5;
    bool _1271 = _1269 && _1103;
    float _1273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1275 = _1251 * _1263;
    float _1277 = _1223 * _1267;
    float _1279 = fma(_1255, _1177, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1283 = _1255;
    if (_1103)
    {
        _1281 = _1173;
    }
    float _1285 = _1281;
    float _1287 = _1209 * _1275;
    float _1289 = _1285;
    if (!_1103)
    {
        _1283 = _1173;
    }
    float _1291 = _1283;
    float _1293 = _1203 * _1275;
    float _1295 = -_1251;
    float _1297 = _1295 + 1.0;
    float _1299 = _1211 * _1275;
    float _1301 = _1193 + 0.5;
    float _1303 = fma(_1259, _1177, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1305 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1293);
    float _1307 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1287);
    float _1309 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1299);
    float _1311 = _970 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1313 = _960 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1315 = _1291;
    if (_1271)
    {
        float _1317 = -_1285;
        float _1319 = _1317 + 1.0;
        _1289 = _1319;
    }
    float _1321 = _1289;
    float _1323 = _1273 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1325 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1311);
    float _1327 = fma(_1239, _1177, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1329 = fma(_1279, _1277, _1305);
    if (_1103)
    {
        _1315 = _1321;
    }
    float _1331 = _1315;
    float _1333 = exp2(_1313);
    float _1335 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1325);
    float _1337 = _1006 * 0.5;
    float _1339 = fma(_1303, _1277, _1307);
    float _1341 = fma(_1323, _1331, -0.5);
    float _1343 = fma(_1327, _1277, _1309);
    float _1345 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1329);
    float _1347 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1339);
    float _1349 = fma(_1185, _1341, _1207);
    float _1351 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1343);
    float _1353 = _754 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1355 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1335);
    float _1357 = _1349 + 0.5;
    bool _1359 = _754 > 0.0;
    bool _1361 = isnan(_754);
    bool _1363 = _1359 || _1361;
    bool _1365 = isnan(0.0);
    bool _1367 = _1363 || _1365;
    float _1369 = _1345 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1371 = -_1333;
    float _1373 = _1371 + 1.0;
    out.m_65.x = _1357;
    out.m_65.y = _1301;
    float _1375 = _1347 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1377 = _1351 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1379 = _1355 + _1006;
    out.gl_Position.x = _1042;
    out.gl_Position.y = _1044;
    out.gl_Position.z = _1355;
    out.gl_Position.w = _1006;
    float _1381 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1383 = _1369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1385 = _1375 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1387 = _1377 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1389 = fma(_1044, -0.5, _1337);
    float _1391 = _1373 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1393 = _1353 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1395 = _1042 + _1006;
    float _1397 = _1379 * 0.5;
    out.m_67.x = _1383;
    out.m_67.y = _1385;
    out.m_67.z = _1387;
    out.m_67.w = _1381;
    float _1399 = _1395 * 0.5;
    out.m_45.x = _1393;
    out.m_69.x = _1399;
    out.m_69.y = _1389;
    out.m_69.z = _1397;
    out.m_69.w = _1006;
    float _1401 = _1391 * _1070;
    float _1403 = -_1391;
    float _1405 = _1403 + 1.0;
    float _1407 = _1081 * _1401;
    float _1409 = _1091 * _1401;
    float _1411 = fma(_1087, _1407, _1075);
    float _1413 = fma(_1089, _1407, _1077);
    float _1415 = _1081 * _1405;
    float _1417 = fma(_1081, _1409, _1079);
    out.m_71.x = _1411;
    out.m_71.y = _1413;
    out.m_71.z = _1417;
    out.m_71.w = _1415;
    if (_1367)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1419 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1419;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

