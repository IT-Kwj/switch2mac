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
    float4 m_57 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_71 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_61 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_63 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1412 = false;
    bool _636 = false;
    bool _508 = false;
    bool _286 = false;
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
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_94)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2003 = as_type<float>(_104);
        out.gl_Position.z = _2003;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_49.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    if (_118)
    {
        float _126 = float(_90);
        _124 = _126;
    }
    float _128 = _124;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    float _136 = 0.0;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    float _140 = _138;
    if (_134)
    {
        out.m_47.x = 0.0;
    }
    if (_134)
    {
        float _142 = _138 * 5.0;
        _106 = as_type<int>(_142);
    }
    int _144 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2072 = as_type<float>(_144);
        out.gl_Position.z = _2072;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_51.w;
    float _148 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _172 = _148;
    if (!_158)
    {
        float _174 = _148 * _148;
        float _176 = _174 * 0.5;
        _140 = _176;
    }
    float _178 = _140;
    float _180 = _178;
    if (!_158)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    bool _186 = !_158;
    float _188 = _184;
    if (!_186)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _148 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _148);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _218;
    }
    float _220 = _188;
    bool _222 = !_158;
    if (!_222)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = 1.0 / _230;
        float _234 = _148 * _226;
        float _236 = exp2(_234);
        float _238 = -_236;
        float _240 = _238 + 1.0;
        float _242 = _240 * _232;
        _172 = _242;
    }
    float _244 = _172;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _248 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _252 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _254 = fma(_244, _160, _248);
    float _256 = fma(_244, _162, _250);
    float _258 = fma(_244, _164, _252);
    float _260 = fma(_254, _146, _166);
    float _262 = fma(_256, _146, _168);
    float _264 = fma(_258, _146, _170);
    bool _266 = !_246;
    float _284;
    if (!_266)
    {
        float _268 = in.m_53.x;
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
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
        float _292 = _122 * _290;
        _284 = _292;
    }
    _286 = false;
    float _294 = _284;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _298 = _294 + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = _294 + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _306 = _294 + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _316;
    float _320 = 1.0 / _310;
    bool _322 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _324 = 1.0 / _318;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _326;
    float _330 = 1.0 / _314;
    float _332 = _298 * _320;
    bool _334 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _336 = isnan(_294);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _346;
    float _350 = fma(_328, _332, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _352 = fma(_348, _332, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _354 = _302 * _324;
    bool _356 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _358 = isnan(_294);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -_344;
    float _370 = _368 + 1.0;
    float _372 = _366 * _370;
    bool _374 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _376 = isnan(_294);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _382 = _378 || _380;
    float _384 = float(_382);
    float _386 = _306 * _330;
    bool _388 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _390 = isnan(_294);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _400;
    float _404 = -_366;
    float _406 = _404 + 1.0;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _412 = fma(_402, _332, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _414 = -_398;
    float _416 = _414 + 1.0;
    float _418 = _398 * _406;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _428 = _384 * _416;
    float _430 = -_384;
    float _432 = _430 + 1.0;
    float _434 = fma(_410, _386, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _436 = fma(_422, _386, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _438 = _350 * _428;
    float _440 = _352 * _428;
    float _442 = _412 * _428;
    float _444 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[143].x, _438);
    float _446 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[143].y, _440);
    float _448 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[143].z, _442);
    float _450 = fma(_426, _386, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _456;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _460;
    float _464 = fma(_434, _418, _444);
    float _466 = fma(_454, _354, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _468 = fma(_458, _354, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _470 = fma(_462, _354, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _472 = fma(_436, _418, _446);
    float _474 = fma(_450, _418, _448);
    float _476 = fma(_466, _372, _464);
    float _478 = fma(_468, _372, _472);
    float _480 = fma(_470, _372, _474);
    float _482 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[146].x, _476);
    float _484 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[146].y, _478);
    float _486 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[146].z, _480);
    bool _488 = !_322;
    float _506;
    if (!_488)
    {
        float _490 = in.m_53.x;
        float _492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _494 = _490 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _496 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _498 = _496 * _492;
        float _500 = floor(_498);
        float _502 = -_500;
        float _504 = _498 + _502;
        _506 = _504;
        _508 = true;
    }
    else
    {
        float _510 = float(_90);
        float _512 = 1.0 / _510;
        float _514 = _122 * _512;
        _506 = _514;
    }
    _508 = false;
    float _516 = _506;
    bool _518 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _520 = isnan(_516);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _534 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _536 = isnan(_516);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _546;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _552 = _516 + _550;
    float _554 = 1.0 / _532;
    float _556 = -_528;
    float _558 = _556 + 1.0;
    float _560 = _544 * _558;
    float _562 = -_544;
    float _564 = _562 + 1.0;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _570 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _574 = _566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _578 = _568 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _580 = _548 * _554;
    float _582 = _572 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _584 = _576 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _586 = fma(_580, _552, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _588 = _586 * _560;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _592 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[115].x, _588);
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _596 = _590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _598 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[116].x, _592);
    float _600 = _594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _602 = in.m_51.x;
    float _604 = in.m_51.y;
    float _606 = in.m_51.z;
    float _608 = _598 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _600;
    out.m_55.y = _596;
    out.m_55.z = _584;
    out.m_57.x = _574;
    out.m_57.y = _578;
    out.m_57.z = _582;
    out.m_57.w = _608;
    float _610 = _486 * _606;
    float _612 = _484 * _604;
    float _614 = _482 * _602;
    bool _616 = !_570;
    float _634;
    if (!_616)
    {
        float _618 = in.m_53.x;
        float _620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _622 = _618 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[14].x, _122);
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
        float _642 = _122 * _640;
        _634 = _642;
    }
    _636 = false;
    float _644 = _634;
    float _646 = _612 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _656 = 1.0 / _650;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _666 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _668 = isnan(_644);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    bool _678 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _680 = isnan(_644);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _686 = _682 || _684;
    float _688 = float(_686);
    float _690 = 1.0 / _654;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _692;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _696;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _708 = 1.0 / _660;
    float _710 = _694 * _656;
    bool _712 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _714 = isnan(_644);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    float _724 = -_722;
    float _726 = _724 + 1.0;
    float _728 = 1.0 / _664;
    float _730 = _698 * _690;
    float _732 = _702 * _708;
    bool _734 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _736 = isnan(_644);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    bool _746 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _748 = isnan(_644);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _754 = _750 || _752;
    float _756 = float(_754);
    float _758 = _706 * _728;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _762 = _760 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _764 = _744 * _726;
    float _766 = -_744;
    float _768 = _766 + 1.0;
    float _770 = -_756;
    float _772 = _770 + 1.0;
    float _774 = 1.0 / _762;
    float _776 = _756 * _768;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _780 = _644 + _778;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _784 = _782 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _786 = _676 * _772;
    float _788 = -_676;
    float _790 = _788 + 1.0;
    float _792 = fma(_710, _780, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _794 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _796 = isnan(_644);
    bool _798 = _794 || _796;
    bool _800 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _802 = _798 || _800;
    float _804 = float(_802);
    float _806 = 1.0 / _784;
    float _808 = _688 * _790;
    float _810 = -_688;
    float _812 = _810 + 1.0;
    bool _814 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _816 = isnan(_644);
    bool _818 = _814 || _816;
    bool _820 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _822 = _818 || _820;
    float _824 = float(_822);
    float _826 = -_804;
    float _828 = _826 + 1.0;
    float _830 = _804 * _812;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _836 = _824 * _828;
    float _838 = -_824;
    float _840 = _838 + 1.0;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _842;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _850 = _792 * _836;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _854 = _644 + _852;
    float _856 = _844 * _774;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _860 = _644 + _858;
    float _862 = _848 * _806;
    float _864 = fma(_730, _854, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _866 = fma(_840, (*spvDescriptorSet0.vp_c9)._m0[159].x, _850);
    float _868 = fma(_732, _860, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _870 = in.m_59.w;
    float _872 = 1.0 / _834;
    float _874 = fma(_868, _830, _866);
    float _876 = in.m_61.x;
    float _878 = in.m_61.y;
    float _880 = in.m_61.z;
    float _882 = fma(_864, _808, _874);
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _886 = _644 + _884;
    bool _888 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _890 = isnan(_644);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _902 = _644 + _900;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _904;
    float _908 = fma(_862, _886, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _910 = fma(_758, _902, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _914 = _644 + _912;
    float _916 = -_898;
    float _918 = _916 + 1.0;
    float _920 = _906 * _872;
    float _922 = fma(_910, _786, _882);
    float _924 = fma(_856, _914, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _928 = _644 + _926;
    float _930 = _722 * _918;
    float _932 = in.m_53.w;
    float _934 = fma(_924, _776, _922);
    float _936 = fma(_920, _928, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _938 = -_870;
    float _940 = _938 + 1.0;
    float _942 = _610 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _944 = fma(_908, _764, _934);
    float _946 = fma(_936, _930, _944);
    float _948 = _940 * _880;
    int _950 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _952 = _950 != 0;
    float _954 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[166].x, _946);
    float _956 = _940 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _958 = -_948;
    float _960 = _958 + _880;
    float _962 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[191].x, _948);
    float _964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _966 = _954 * _956;
    float _968 = fma(_954, _962, _960);
    float _970 = _614 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _972 = fma(_876, _966, _876);
    float _974 = fma(_878, _966, _878);
    float _976 = _878;
    int _978 = as_type<int>(_774);
    float _980 = _870;
    if (!_952)
    {
        float _982 = in.m_53.y;
        _976 = _982;
    }
    float _984 = _976;
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _988 = _986 != 0;
    float _990 = in.m_63.x;
    int _992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _994 = _992 != 0;
    float _996 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _974);
    float _998 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _972);
    int _1000 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1002 = _1000 != 0;
    float _1004 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _968);
    float _1006 = _996 * _646;
    float _1008 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1012 = _1010 != 0;
    float _1014 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1016 = _932 > 0.5;
    float _1018 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1008);
    float _1020 = _930;
    float _1022 = _998;
    bool _1024 = _1016;
    if (_988)
    {
        float _1026 = in.m_53.x;
        _1020 = _1026;
    }
    float _1028 = _1020;
    float _1030 = _998 * _970;
    float _1032 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1034 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1018);
    float _1036 = in.m_63.y;
    float _1038 = _1006 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1040 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1032);
    float _1042 = _1006 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1044 = _1004 * _942;
    float _1046 = fma(_1030, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1038);
    float _1048 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1040);
    float _1050 = fma(_1030, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1042);
    float _1052 = _1034 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1054 = fma(_1044, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1046);
    float _1056 = _1048 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1058 = fma(_1044, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1050);
    float _1060 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1014);
    float _1062 = _1052 + _1054;
    float _1064 = _1060;
    float _1066 = _1058;
    if (!_952)
    {
        _1022 = _984;
    }
    float _1068 = _1022;
    float _1070 = _1056 + _1058;
    float _1072 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1060);
    if (!_988)
    {
        _1064 = _990;
    }
    float _1074 = _1064;
    float _1076 = _920;
    float _1078 = _1074;
    if (!_952)
    {
        float _1080 = in.m_53.z;
        _1076 = _1080;
    }
    float _1082 = _1076;
    float _1084 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1086 = _1070 + _1084;
    bool _1088 = false;
    if (_988)
    {
        bool _1090 = _1028 > 0.5;
        _1088 = _1090;
    }
    bool _1092 = _1088;
    float _1094 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1096 = _1062 + _1094;
    float _1098 = _1068;
    float _1100 = _984;
    if (_952)
    {
        float _1102 = in.m_53.x;
        float _1104 = in.m_53.y;
        _1098 = _1102;
        _1100 = _1104;
    }
    float _1106 = _1098;
    float _1108 = _1100;
    float _1110 = _1086 * _1086;
    float _1112 = -_1036;
    float _1114 = _1112 + 1.0;
    float _1116 = _1096 * _1096;
    float _1118 = _808;
    float _1120 = _1036;
    if (_994)
    {
        float _1122 = in.m_53.z;
        _1118 = _1122;
    }
    float _1124 = _1118;
    if (!_988)
    {
        _1066 = _1074;
    }
    float _1126 = _1066;
    float _1128 = _964 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1130 = _1116 + _1110;
    int _1132 = _1016 ? as_type<int>(_1114) : as_type<int>(_1036);
    float _1134 = _1006 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1136 = _964;
    float _1138 = _1126;
    if (_988)
    {
        _1078 = _990;
    }
    float _1140 = _1078;
    float _1142 = sqrt(_1130);
    int _1144 = _1002 ? _1132 : as_type<int>(_1036);
    int _1146 = _1144;
    float _1148 = _1140;
    if (_994)
    {
        float _1150 = -_1140;
        float _1152 = _1150 + 1.0;
        _978 = as_type<int>(_1152);
    }
    int _1154 = _978;
    float _1156 = fma(_1128, as_type<float>(_1144), -0.5);
    if (_988)
    {
        float _1158 = -_1140;
        float _1160 = _1158 + 1.0;
        _1146 = as_type<int>(_1160);
    }
    int _1162 = _1146;
    float _1164 = _1082;
    if (!_952)
    {
        _1136 = _1082;
    }
    float _1166 = _1136;
    float _1168 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1170 = _1166;
    float _1172 = _1168;
    if (_988)
    {
        float _1174 = _1092 ? as_type<float>(_1162) : _1140;
        _1138 = _1174;
    }
    float _1176 = _1138;
    float _1178 = fma(_1030, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1134);
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1184 = _1142 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1186 = fma(_1044, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1178);
    float _1188 = _1072 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1190 = _1106;
    if (_952)
    {
        _1170 = _1108;
    }
    float _1192 = _1170;
    float _1194 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1180);
    if (_952)
    {
        _1164 = _1108;
    }
    float _1196 = _1164;
    float _1198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1200 = _1108 > 0.5;
    float _1202 = _1106 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1204 = _1196;
    float _1206 = _1202;
    if (_994)
    {
        bool _1208 = _1124 > 0.5;
        _1024 = _1208;
    }
    bool _1210 = _1024;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1214 = _1188 + _1186;
    float _1216 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1168);
    float _1218 = _1212;
    if (_994)
    {
        float _1220 = _1210 ? as_type<float>(_1154) : _1140;
        _1148 = _1220;
    }
    float _1222 = _1148;
    float _1224 = -_1212;
    float _1226 = fma(_1202, 2.0, _1224);
    if (!_1184)
    {
        _1172 = _1110;
    }
    float _1228 = _1172;
    float _1230 = _1228;
    if (!_1184)
    {
        _1204 = _1116;
    }
    float _1232 = _1204;
    float _1234 = _1232;
    if (!_1184)
    {
        _1190 = _1062;
    }
    float _1236 = _1190;
    float _1238 = _1236;
    if (!_1184)
    {
        _1218 = _1070;
    }
    float _1240 = _1218;
    float _1242 = _1240;
    if (!_1184)
    {
        _1206 = _1214;
    }
    float _1244 = _1206;
    bool _1246 = !_1184;
    float _1248 = _1244;
    if (!_1246)
    {
        float _1250 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1252 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1254 = _1142 + _1252;
        float _1256 = _1214 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1258 = rsqrt(_1130);
        float _1260 = _1254 * _1250;
        float _1262 = _1260 * 0.15915493667125701904296875;
        float _1264 = _1262 * 6.283185482025146484375;
        float _1266 = sin(_1264);
        float _1268 = _1262 * 6.283185482025146484375;
        float _1270 = cos(_1268);
        float _1272 = fma(_1266, _1256, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1274 = _1258 * _1272;
        float _1276 = _1270 + (-1.0);
        float _1278 = fma(_1096, _1274, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1280 = fma(_1086, _1274, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1282 = _1276 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1284 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1286 = _1278 + _1284;
        float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1290 = _1280 + _1288;
        float _1292 = fma(_1214, _1270, _1282);
        float _1294 = _1286 * _1286;
        float _1296 = _1290 * _1290;
        _1248 = _1292;
        _1234 = _1294;
        _1230 = _1296;
        _1238 = _1278;
        _1242 = _1280;
    }
    float _1298 = _1248;
    float _1300 = _1234;
    float _1302 = _1230;
    float _1304 = _1238;
    float _1306 = _1242;
    float _1308 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1310 = _1298 + _1308;
    float _1312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1316 = _1192 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1318 = fma(_1310, _1310, _1300);
    float _1320 = _1182 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_1012)
    {
        float _1322 = _1200 ? _1114 : _1036;
        _1120 = _1322;
    }
    float _1324 = _1120;
    float _1326 = fma(_1316, -2.0, _1314);
    float _1328 = _1318 + _1302;
    float _1330 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1194);
    float _1332 = -_122;
    float _1334 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1226);
    float _1336 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1216);
    float _1338 = fma(_1320, _1222, -0.5);
    float _1340 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1326);
    float _1342 = sqrt(_1328);
    float _1344 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1346 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1348 = fma(_1330, _1338, _1334);
    float _1350 = -_1340;
    float _1352 = fma(_1336, _1156, _1350);
    float _1354 = _1344 * _1198;
    float _1356 = _1346 * _1312;
    float _1358 = _1348 + 0.5;
    float _1360 = _1352 + 0.5;
    out.m_65.w = _870;
    out.m_67.x = _1354;
    out.m_67.y = _1356;
    out.m_67.z = _1358;
    out.m_67.w = _1360;
    bool _1362 = _1342 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1364 = isnan(_1342);
    bool _1366 = _1362 || _1364;
    bool _1368 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1370 = _1366 || _1368;
    float _1372 = _1324;
    float _1374 = _1330;
    float _1376 = _1342;
    if (!_1370)
    {
        _1372 = 1.0;
    }
    float _1378 = _1372;
    bool _1380 = !_1370;
    float _1382 = _1378;
    if (!_1380)
    {
        bool _1384 = _1342 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1386 = isnan(_1342);
        bool _1388 = _1384 || _1386;
        bool _1390 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1392 = _1388 || _1390;
        if (!_1392)
        {
            float _1394 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1396 = _1342 + _1394;
            float _1398 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1400 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1398;
            float _1402 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1404 = _1402 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1406 = 1.0 / _1400;
            float _1408 = _1396 * _1406;
            float _1410 = fma(_1408, _1404, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1382 = _1410;
            _1412 = true;
        }
        else
        {
            bool _1414 = _1342 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1416 = isnan(_1342);
            bool _1418 = _1414 || _1416;
            bool _1420 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1422 = _1418 || _1420;
            if (!_1422)
            {
                float _1424 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1426 = _1342 + _1424;
                float _1428 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1430 = _1428 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1432 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1434 = _1432 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1436 = 1.0 / _1430;
                float _1438 = _1426 * _1436;
                float _1440 = fma(_1438, _1434, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1382 = _1440;
                _1412 = true;
            }
            else
            {
                _1382 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1412 = false;
    float _1442 = _1382;
    float _1444 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1446 = _1298 + _1444;
    float _1448 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1450 = _1304 + _1448;
    float _1452 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1454 = _1306 + _1452;
    float _1456 = fma(_1446, _1442, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1458 = fma(_1450, _1442, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1460 = fma(_1454, _1442, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1462 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1464 = _1456 + _1462;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1468 = _1458 + _1466;
    float _1470 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1472 = _1460 + _1470;
    float _1474 = _1464 * _1464;
    float _1476 = fma(_1468, _1468, _1474);
    float _1478 = fma(_1472, _1472, _1476);
    float _1480 = rsqrt(_1478);
    float _1482 = _1480 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1484 = _1468 * _1482;
    float _1486 = _1472 * _1482;
    float _1488 = _1484 * _1484;
    float _1490 = _1486 * _1486;
    float _1492 = _1488 + _1490;
    float _1494 = sqrt(_1492);
    bool _1496 = _1494 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1498 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1500 = _1494 + _1498;
    float _1502 = _1476;
    float _1504 = _1500;
    float _1506 = _1464;
    float _1508 = _1484;
    if (_1496)
    {
        float _1510 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1502 = _1510;
    }
    float _1512 = _1502;
    if (_1496)
    {
        float _1514 = rsqrt(_1492);
        _1374 = _1514;
    }
    float _1516 = _1374;
    float _1518 = _1516;
    if (_1496)
    {
        float _1520 = _1500 * _1512;
        _1504 = _1520;
    }
    float _1522 = _1504;
    if (_1496)
    {
        float _1524 = _1522 * 0.15915493667125701904296875;
        _980 = _1524;
    }
    float _1526 = _980;
    float _1528 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1530 = _1472;
    if (_1496)
    {
        float _1532 = _1526 * 6.283185482025146484375;
        float _1534 = sin(_1532);
        _1530 = _1534;
    }
    float _1536 = _1530;
    float _1538 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1540 = precise::max(0.0, _1538);
    float _1542 = _1512;
    float _1544 = _1540;
    if (_1496)
    {
        float _1546 = _1526 * 6.283185482025146484375;
        float _1548 = cos(_1546);
        _1542 = _1548;
    }
    float _1550 = _1542;
    float _1552 = -_1482;
    float _1554 = -_1540;
    float _1556 = fma(_1464, _1552, _1554);
    if (_1496)
    {
        float _1558 = _1556 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1506 = _1558;
    }
    float _1560 = _1506;
    float _1562 = sqrt(_1478);
    float _1564 = _1560;
    float _1566 = _1536;
    if (_1496)
    {
        float _1568 = fma(_1536, _1560, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1564 = _1568;
    }
    float _1570 = _1564;
    float _1572 = _1570;
    if (!_1496)
    {
        _1566 = _1486;
    }
    float _1574 = _1566;
    float _1576 = _1574;
    float _1578 = _1550;
    if (_1496)
    {
        float _1580 = _1550 + (-1.0);
        _1544 = _1580;
    }
    float _1582 = _1544;
    float _1584 = _1582;
    if (_1496)
    {
        float _1586 = _1516 * _1570;
        _1376 = _1586;
    }
    float _1588 = _1376;
    if (!_1496)
    {
        _1572 = _1556;
    }
    float _1590 = _1572;
    float _1592 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1594 = _1590;
    if (_1496)
    {
        float _1596 = _1582 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1518 = _1596;
    }
    float _1598 = _1518;
    if (_1496)
    {
        float _1600 = _1484 * _1588;
        _1508 = _1600;
    }
    float _1602 = _1508;
    if (!_1496)
    {
        _1584 = _1488;
    }
    float _1604 = _1584;
    float _1606 = _1604;
    if (_1496)
    {
        float _1608 = _1486 * _1588;
        _1576 = _1608;
    }
    float _1610 = _1576;
    if (_1496)
    {
        float _1612 = fma(_1556, _1550, _1598);
        _1594 = _1612;
    }
    float _1614 = _1594;
    if (_1496)
    {
        float _1616 = _1602 * _1602;
        _1606 = _1616;
    }
    float _1618 = _1606;
    if (!_1496)
    {
        _1578 = _1490;
    }
    float _1620 = _1578;
    float _1622 = _1620;
    if (_1496)
    {
        float _1624 = _1610 * _1610;
        _1622 = _1624;
    }
    float _1626 = _1622;
    float _1628 = fma(_1614, _1614, _1618);
    float _1630 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1592);
    float _1632 = _1628 + _1626;
    float _1634 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1636 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1638 = fma(_1562, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1636);
    float _1640 = precise::clamp(_1638, 0.0, 1.0);
    float _1642 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1630);
    float _1644 = rsqrt(_1632);
    float _1646 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1634);
    float _1648 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1650 = -_1640;
    float _1652 = _1650 + 1.0;
    float _1654 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1656 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1646);
    float _1658 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1648);
    float _1660 = _1642 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1662 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1654);
    float _1664 = _1656 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1666 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1658);
    float _1668 = abs(_1652);
    float _1670 = log2(_1668);
    float _1672 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1662);
    float _1674 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1676 = _1666 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1678 = _1644 * _1602;
    float _1680 = _1644 * _1610;
    float _1682 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1684 = -_1674;
    float _1686 = fma(_1684, _1528, 1.0);
    float _1688 = _1678 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1690 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1692 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1682);
    float _1694 = _1644 * _1614;
    float _1696 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1698 = log2(_1686);
    float _1700 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1692);
    float _1702 = -_1688;
    float _1704 = fma(_1694, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1702);
    float _1706 = _1670 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1708 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1700);
    float _1710 = -_1680;
    float _1712 = fma(_1710, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1704);
    float _1714 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1716 = exp2(_1706);
    float _1718 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1696);
    float _1720 = fma(_1712, -0.5, 0.5);
    float _1722 = fma(_1712, 0.5, 0.5);
    float _1724 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1714);
    float _1726 = _1694 + 1.0;
    float _1728 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1718);
    float _1730 = fma(_1722, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1732 = 1.0 / _1708;
    float _1734 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1724);
    float _1736 = _1698 * 0.693147182464599609375;
    float _1738 = fma(_1722, _1730, -0.212114393711090087890625);
    float _1740 = _1736 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1742 = fma(_1722, _1738, 1.570728778839111328125);
    float _1744 = sqrt(_1720);
    float _1746 = -_1694;
    float _1748 = fma(_1716, _1726, _1746);
    float _1750 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1734);
    float _1752 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1728);
    float _1754 = fma(_1748, 0.5, 0.5);
    float _1756 = _1750 * _1732;
    float _1758 = _1752 * _1732;
    float _1760 = fma(_1756, 0.5, 0.5);
    float _1762 = fma(_1758, -0.5, 0.5);
    float _1764 = _1744 * 0.636619746685028076171875;
    float _1766 = -_1742;
    float _1768 = fma(_1764, _1766, 1.0);
    float3 _4747 = float3(_1760, _1762, _1740);
    float _1770 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4747, float3(0.0), isnan(_4747)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4747, float3(0.0), isnan(_4747)), level(0.0)).x;
    float3 _4758 = float3(_1760, _1762, _1740);
    float4 _1773 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4758, float3(0.0), isnan(_4758)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4758, float3(0.0), isnan(_4758)), level(0.0)).xyzw;
    float _1775 = _1773.x;
    float _1777 = _1773.y;
    float _1779 = _1773.z;
    float _1781 = _1773.w;
    float2 _4775 = float2(_1768, _1754);
    float3 _1785 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4775, float2(0.0), isnan(_4775)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4775, float2(0.0), isnan(_4775)), level(0.0)).xyz;
    float _1787 = _1785.x;
    float _1789 = _1785.y;
    float _1791 = _1785.z;
    float _1793 = _1188 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1795 = _1670 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1797 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1793);
    float _1799 = _1188 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1801 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1803 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1805 = _1801 || _1803;
    bool _1807 = isnan(0.5);
    bool _1809 = _1805 || _1807;
    float _1811 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1797);
    float _1813 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1799);
    float _1815 = exp2(_1795);
    float _1817 = _1811 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1819 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1813);
    float _1821 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1823 = _1819 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1825 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1821);
    float _1827 = 1.0 / _1817;
    float _1829 = _1823 + _1817;
    float _1831 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1825);
    float _1833 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1831);
    float _1835 = _1829 * _1827;
    float _1837 = _1835 * 0.5;
    float _1839 = _1827;
    if (_1809)
    {
        _1839 = 1.0;
    }
    float _1841 = _1839;
    float _1843 = _1841;
    if (!_1809)
    {
        float _1845 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1847 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1849 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1847);
        float _1851 = _1845 * 0.15915493667125701904296875;
        float _1853 = _1851 * 6.283185482025146484375;
        float _1855 = cos(_1853);
        float _1857 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1859 = _1857 * 0.15915493667125701904296875;
        float _1861 = _1851 * 6.283185482025146484375;
        float _1863 = sin(_1861);
        float _1865 = 1.0 / _1855;
        float _1867 = _1859 * 6.283185482025146484375;
        float _1869 = cos(_1867);
        float _1871 = _1863 * _1865;
        float _1873 = 1.0 / _1849;
        float _1875 = _1869 * _1871;
        float _1877 = _1859 * 6.283185482025146484375;
        float _1879 = sin(_1877);
        float _1881 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1883 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1881;
        float _1885 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1887 = _1873 * _1885;
        float _1889 = 1.0 / _1875;
        float _1891 = 1.0 / _1883;
        float _1893 = _1879 * _1889;
        float _1895 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1897 = fma(_1893, _1887, _1895);
        float _1899 = _1897 * _1891;
        float _1901 = precise::clamp(_1899, 0.0, 1.0);
        _1843 = _1901;
    }
    float _1903 = _1843;
    float _1905 = -_1815;
    float _1907 = _1905 + 1.0;
    float _1909 = _1833 + _1708;
    float _1911 = _1903 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1913 = _1903 > 0.0;
    bool _1915 = isnan(_1903);
    bool _1917 = _1913 || _1915;
    bool _1919 = isnan(0.0);
    bool _1921 = _1917 || _1919;
    float _1923 = _1907 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1925 = _1909 * 0.5;
    float _1927 = _1911 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1929 = _1923 * _1770;
    float _1931 = -_1923;
    float _1933 = _1931 + 1.0;
    out.gl_Position.x = _1750;
    out.gl_Position.y = _1752;
    out.gl_Position.z = _1833;
    out.gl_Position.w = _1708;
    float _1935 = _1781 * _1929;
    float _1937 = _1791 * _1929;
    float _1939 = _1781 * _1933;
    out.m_47.x = _1927;
    float _1941 = fma(_1787, _1935, _1775);
    float _1943 = fma(_1789, _1935, _1777);
    float _1945 = fma(_1781, _1937, _1779);
    out.m_69.z = _1925;
    out.m_69.w = _1708;
    out.m_71.x = _1941;
    out.m_71.y = _1943;
    out.m_71.z = _1945;
    out.m_71.w = _1939;
    if (_1921)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1947 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1947;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1412 = false;
    bool _636 = false;
    bool _508 = false;
    bool _286 = false;
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
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_94)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2003 = as_type<float>(_104);
        out.gl_Position.z = _2003;
    }
    if (!_94)
    {
        return out;
    }
    float _108 = in.m_49.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    if (_118)
    {
        float _126 = float(_90);
        _124 = _126;
    }
    float _128 = _124;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    float _136 = 0.0;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    float _140 = _138;
    if (_134)
    {
        out.m_47.x = 0.0;
    }
    if (_134)
    {
        float _142 = _138 * 5.0;
        _106 = as_type<int>(_142);
    }
    int _144 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2072 = as_type<float>(_144);
        out.gl_Position.z = _2072;
    }
    if (_134)
    {
        return out;
    }
    float _146 = in.m_51.w;
    float _148 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _172 = _148;
    if (!_158)
    {
        float _174 = _148 * _148;
        float _176 = _174 * 0.5;
        _140 = _176;
    }
    float _178 = _140;
    float _180 = _178;
    if (!_158)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    bool _186 = !_158;
    float _188 = _184;
    if (!_186)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _148 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _148);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _218;
    }
    float _220 = _188;
    bool _222 = !_158;
    if (!_222)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = 1.0 / _230;
        float _234 = _148 * _226;
        float _236 = exp2(_234);
        float _238 = -_236;
        float _240 = _238 + 1.0;
        float _242 = _240 * _232;
        _172 = _242;
    }
    float _244 = _172;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _248 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _252 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _254 = fma(_244, _160, _248);
    float _256 = fma(_244, _162, _250);
    float _258 = fma(_244, _164, _252);
    float _260 = fma(_254, _146, _166);
    float _262 = fma(_256, _146, _168);
    float _264 = fma(_258, _146, _170);
    bool _266 = !_246;
    float _284;
    if (!_266)
    {
        float _268 = in.m_53.x;
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
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
        float _292 = _122 * _290;
        _284 = _292;
    }
    _286 = false;
    float _294 = _284;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _298 = _294 + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = _294 + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _306 = _294 + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _316;
    float _320 = 1.0 / _310;
    bool _322 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _324 = 1.0 / _318;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _326;
    float _330 = 1.0 / _314;
    float _332 = _298 * _320;
    bool _334 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _336 = isnan(_294);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _346;
    float _350 = fma(_328, _332, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _352 = fma(_348, _332, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _354 = _302 * _324;
    bool _356 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _358 = isnan(_294);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -_344;
    float _370 = _368 + 1.0;
    float _372 = _366 * _370;
    bool _374 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _376 = isnan(_294);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _382 = _378 || _380;
    float _384 = float(_382);
    float _386 = _306 * _330;
    bool _388 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _390 = isnan(_294);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _400;
    float _404 = -_366;
    float _406 = _404 + 1.0;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _412 = fma(_402, _332, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _414 = -_398;
    float _416 = _414 + 1.0;
    float _418 = _398 * _406;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _428 = _384 * _416;
    float _430 = -_384;
    float _432 = _430 + 1.0;
    float _434 = fma(_410, _386, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _436 = fma(_422, _386, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _438 = _350 * _428;
    float _440 = _352 * _428;
    float _442 = _412 * _428;
    float _444 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[143].x, _438);
    float _446 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[143].y, _440);
    float _448 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[143].z, _442);
    float _450 = fma(_426, _386, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _456;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _460;
    float _464 = fma(_434, _418, _444);
    float _466 = fma(_454, _354, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _468 = fma(_458, _354, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _470 = fma(_462, _354, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _472 = fma(_436, _418, _446);
    float _474 = fma(_450, _418, _448);
    float _476 = fma(_466, _372, _464);
    float _478 = fma(_468, _372, _472);
    float _480 = fma(_470, _372, _474);
    float _482 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[146].x, _476);
    float _484 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[146].y, _478);
    float _486 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[146].z, _480);
    bool _488 = !_322;
    float _506;
    if (!_488)
    {
        float _490 = in.m_53.x;
        float _492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _494 = _490 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _496 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _498 = _496 * _492;
        float _500 = floor(_498);
        float _502 = -_500;
        float _504 = _498 + _502;
        _506 = _504;
        _508 = true;
    }
    else
    {
        float _510 = float(_90);
        float _512 = 1.0 / _510;
        float _514 = _122 * _512;
        _506 = _514;
    }
    _508 = false;
    float _516 = _506;
    bool _518 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _520 = isnan(_516);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _534 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _536 = isnan(_516);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _546;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _552 = _516 + _550;
    float _554 = 1.0 / _532;
    float _556 = -_528;
    float _558 = _556 + 1.0;
    float _560 = _544 * _558;
    float _562 = -_544;
    float _564 = _562 + 1.0;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _570 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _574 = _566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _578 = _568 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _580 = _548 * _554;
    float _582 = _572 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _584 = _576 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _586 = fma(_580, _552, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _588 = _586 * _560;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _592 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[115].x, _588);
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _596 = _590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _598 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[116].x, _592);
    float _600 = _594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _602 = in.m_51.x;
    float _604 = in.m_51.y;
    float _606 = in.m_51.z;
    float _608 = _598 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _600;
    out.m_55.y = _596;
    out.m_55.z = _584;
    out.m_57.x = _574;
    out.m_57.y = _578;
    out.m_57.z = _582;
    out.m_57.w = _608;
    float _610 = _486 * _606;
    float _612 = _484 * _604;
    float _614 = _482 * _602;
    bool _616 = !_570;
    float _634;
    if (!_616)
    {
        float _618 = in.m_53.x;
        float _620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _622 = _618 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[14].x, _122);
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
        float _642 = _122 * _640;
        _634 = _642;
    }
    _636 = false;
    float _644 = _634;
    float _646 = _612 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _656 = 1.0 / _650;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _666 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _668 = isnan(_644);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    bool _678 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _680 = isnan(_644);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _686 = _682 || _684;
    float _688 = float(_686);
    float _690 = 1.0 / _654;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _692;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _696;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _708 = 1.0 / _660;
    float _710 = _694 * _656;
    bool _712 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _714 = isnan(_644);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    float _724 = -_722;
    float _726 = _724 + 1.0;
    float _728 = 1.0 / _664;
    float _730 = _698 * _690;
    float _732 = _702 * _708;
    bool _734 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _736 = isnan(_644);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    bool _746 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _748 = isnan(_644);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _754 = _750 || _752;
    float _756 = float(_754);
    float _758 = _706 * _728;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _762 = _760 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _764 = _744 * _726;
    float _766 = -_744;
    float _768 = _766 + 1.0;
    float _770 = -_756;
    float _772 = _770 + 1.0;
    float _774 = 1.0 / _762;
    float _776 = _756 * _768;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _780 = _644 + _778;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _784 = _782 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _786 = _676 * _772;
    float _788 = -_676;
    float _790 = _788 + 1.0;
    float _792 = fma(_710, _780, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _794 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _796 = isnan(_644);
    bool _798 = _794 || _796;
    bool _800 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _802 = _798 || _800;
    float _804 = float(_802);
    float _806 = 1.0 / _784;
    float _808 = _688 * _790;
    float _810 = -_688;
    float _812 = _810 + 1.0;
    bool _814 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _816 = isnan(_644);
    bool _818 = _814 || _816;
    bool _820 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _822 = _818 || _820;
    float _824 = float(_822);
    float _826 = -_804;
    float _828 = _826 + 1.0;
    float _830 = _804 * _812;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _836 = _824 * _828;
    float _838 = -_824;
    float _840 = _838 + 1.0;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _842;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _850 = _792 * _836;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _854 = _644 + _852;
    float _856 = _844 * _774;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _860 = _644 + _858;
    float _862 = _848 * _806;
    float _864 = fma(_730, _854, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _866 = fma(_840, (*spvDescriptorSet0.vp_c9)._m0[159].x, _850);
    float _868 = fma(_732, _860, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _870 = in.m_59.w;
    float _872 = 1.0 / _834;
    float _874 = fma(_868, _830, _866);
    float _876 = in.m_61.x;
    float _878 = in.m_61.y;
    float _880 = in.m_61.z;
    float _882 = fma(_864, _808, _874);
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _886 = _644 + _884;
    bool _888 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _890 = isnan(_644);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _902 = _644 + _900;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _904;
    float _908 = fma(_862, _886, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _910 = fma(_758, _902, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _914 = _644 + _912;
    float _916 = -_898;
    float _918 = _916 + 1.0;
    float _920 = _906 * _872;
    float _922 = fma(_910, _786, _882);
    float _924 = fma(_856, _914, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _928 = _644 + _926;
    float _930 = _722 * _918;
    float _932 = in.m_53.w;
    float _934 = fma(_924, _776, _922);
    float _936 = fma(_920, _928, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _938 = -_870;
    float _940 = _938 + 1.0;
    float _942 = _610 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _944 = fma(_908, _764, _934);
    float _946 = fma(_936, _930, _944);
    float _948 = _940 * _880;
    int _950 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _952 = _950 != 0;
    float _954 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[166].x, _946);
    float _956 = _940 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _958 = -_948;
    float _960 = _958 + _880;
    float _962 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[191].x, _948);
    float _964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _966 = _954 * _956;
    float _968 = fma(_954, _962, _960);
    float _970 = _614 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _972 = fma(_876, _966, _876);
    float _974 = fma(_878, _966, _878);
    float _976 = _878;
    int _978 = as_type<int>(_774);
    float _980 = _870;
    if (!_952)
    {
        float _982 = in.m_53.y;
        _976 = _982;
    }
    float _984 = _976;
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _988 = _986 != 0;
    float _990 = in.m_63.x;
    int _992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _994 = _992 != 0;
    float _996 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _974);
    float _998 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _972);
    int _1000 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1002 = _1000 != 0;
    float _1004 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _968);
    float _1006 = _996 * _646;
    float _1008 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1012 = _1010 != 0;
    float _1014 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1016 = _932 > 0.5;
    float _1018 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1008);
    float _1020 = _930;
    float _1022 = _998;
    bool _1024 = _1016;
    if (_988)
    {
        float _1026 = in.m_53.x;
        _1020 = _1026;
    }
    float _1028 = _1020;
    float _1030 = _998 * _970;
    float _1032 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1034 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1018);
    float _1036 = in.m_63.y;
    float _1038 = _1006 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1040 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1032);
    float _1042 = _1006 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1044 = _1004 * _942;
    float _1046 = fma(_1030, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1038);
    float _1048 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1040);
    float _1050 = fma(_1030, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1042);
    float _1052 = _1034 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1054 = fma(_1044, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1046);
    float _1056 = _1048 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1058 = fma(_1044, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1050);
    float _1060 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1014);
    float _1062 = _1052 + _1054;
    float _1064 = _1060;
    float _1066 = _1058;
    if (!_952)
    {
        _1022 = _984;
    }
    float _1068 = _1022;
    float _1070 = _1056 + _1058;
    float _1072 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1060);
    if (!_988)
    {
        _1064 = _990;
    }
    float _1074 = _1064;
    float _1076 = _920;
    float _1078 = _1074;
    if (!_952)
    {
        float _1080 = in.m_53.z;
        _1076 = _1080;
    }
    float _1082 = _1076;
    float _1084 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1086 = _1070 + _1084;
    bool _1088 = false;
    if (_988)
    {
        bool _1090 = _1028 > 0.5;
        _1088 = _1090;
    }
    bool _1092 = _1088;
    float _1094 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1096 = _1062 + _1094;
    float _1098 = _1068;
    float _1100 = _984;
    if (_952)
    {
        float _1102 = in.m_53.x;
        float _1104 = in.m_53.y;
        _1098 = _1102;
        _1100 = _1104;
    }
    float _1106 = _1098;
    float _1108 = _1100;
    float _1110 = _1086 * _1086;
    float _1112 = -_1036;
    float _1114 = _1112 + 1.0;
    float _1116 = _1096 * _1096;
    float _1118 = _808;
    float _1120 = _1036;
    if (_994)
    {
        float _1122 = in.m_53.z;
        _1118 = _1122;
    }
    float _1124 = _1118;
    if (!_988)
    {
        _1066 = _1074;
    }
    float _1126 = _1066;
    float _1128 = _964 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1130 = _1116 + _1110;
    int _1132 = _1016 ? as_type<int>(_1114) : as_type<int>(_1036);
    float _1134 = _1006 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1136 = _964;
    float _1138 = _1126;
    if (_988)
    {
        _1078 = _990;
    }
    float _1140 = _1078;
    float _1142 = sqrt(_1130);
    int _1144 = _1002 ? _1132 : as_type<int>(_1036);
    int _1146 = _1144;
    float _1148 = _1140;
    if (_994)
    {
        float _1150 = -_1140;
        float _1152 = _1150 + 1.0;
        _978 = as_type<int>(_1152);
    }
    int _1154 = _978;
    float _1156 = fma(_1128, as_type<float>(_1144), -0.5);
    if (_988)
    {
        float _1158 = -_1140;
        float _1160 = _1158 + 1.0;
        _1146 = as_type<int>(_1160);
    }
    int _1162 = _1146;
    float _1164 = _1082;
    if (!_952)
    {
        _1136 = _1082;
    }
    float _1166 = _1136;
    float _1168 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1170 = _1166;
    float _1172 = _1168;
    if (_988)
    {
        float _1174 = _1092 ? as_type<float>(_1162) : _1140;
        _1138 = _1174;
    }
    float _1176 = _1138;
    float _1178 = fma(_1030, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1134);
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1184 = _1142 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1186 = fma(_1044, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1178);
    float _1188 = _1072 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1190 = _1106;
    if (_952)
    {
        _1170 = _1108;
    }
    float _1192 = _1170;
    float _1194 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1180);
    if (_952)
    {
        _1164 = _1108;
    }
    float _1196 = _1164;
    float _1198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1200 = _1108 > 0.5;
    float _1202 = _1106 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1204 = _1196;
    float _1206 = _1202;
    if (_994)
    {
        bool _1208 = _1124 > 0.5;
        _1024 = _1208;
    }
    bool _1210 = _1024;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1214 = _1188 + _1186;
    float _1216 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1168);
    float _1218 = _1212;
    if (_994)
    {
        float _1220 = _1210 ? as_type<float>(_1154) : _1140;
        _1148 = _1220;
    }
    float _1222 = _1148;
    float _1224 = -_1212;
    float _1226 = fma(_1202, 2.0, _1224);
    if (!_1184)
    {
        _1172 = _1110;
    }
    float _1228 = _1172;
    float _1230 = _1228;
    if (!_1184)
    {
        _1204 = _1116;
    }
    float _1232 = _1204;
    float _1234 = _1232;
    if (!_1184)
    {
        _1190 = _1062;
    }
    float _1236 = _1190;
    float _1238 = _1236;
    if (!_1184)
    {
        _1218 = _1070;
    }
    float _1240 = _1218;
    float _1242 = _1240;
    if (!_1184)
    {
        _1206 = _1214;
    }
    float _1244 = _1206;
    bool _1246 = !_1184;
    float _1248 = _1244;
    if (!_1246)
    {
        float _1250 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1252 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1254 = _1142 + _1252;
        float _1256 = _1214 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1258 = rsqrt(_1130);
        float _1260 = _1254 * _1250;
        float _1262 = _1260 * 0.15915493667125701904296875;
        float _1264 = _1262 * 6.283185482025146484375;
        float _1266 = sin(_1264);
        float _1268 = _1262 * 6.283185482025146484375;
        float _1270 = cos(_1268);
        float _1272 = fma(_1266, _1256, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1274 = _1258 * _1272;
        float _1276 = _1270 + (-1.0);
        float _1278 = fma(_1096, _1274, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1280 = fma(_1086, _1274, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1282 = _1276 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1284 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1286 = _1278 + _1284;
        float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1290 = _1280 + _1288;
        float _1292 = fma(_1214, _1270, _1282);
        float _1294 = _1286 * _1286;
        float _1296 = _1290 * _1290;
        _1248 = _1292;
        _1234 = _1294;
        _1230 = _1296;
        _1238 = _1278;
        _1242 = _1280;
    }
    float _1298 = _1248;
    float _1300 = _1234;
    float _1302 = _1230;
    float _1304 = _1238;
    float _1306 = _1242;
    float _1308 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1310 = _1298 + _1308;
    float _1312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1316 = _1192 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1318 = fma(_1310, _1310, _1300);
    float _1320 = _1182 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_1012)
    {
        float _1322 = _1200 ? _1114 : _1036;
        _1120 = _1322;
    }
    float _1324 = _1120;
    float _1326 = fma(_1316, -2.0, _1314);
    float _1328 = _1318 + _1302;
    float _1330 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1194);
    float _1332 = -_122;
    float _1334 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1226);
    float _1336 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1216);
    float _1338 = fma(_1320, _1222, -0.5);
    float _1340 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1326);
    float _1342 = sqrt(_1328);
    float _1344 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1346 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1348 = fma(_1330, _1338, _1334);
    float _1350 = -_1340;
    float _1352 = fma(_1336, _1156, _1350);
    float _1354 = _1344 * _1198;
    float _1356 = _1346 * _1312;
    float _1358 = _1348 + 0.5;
    float _1360 = _1352 + 0.5;
    out.m_65.w = _870;
    out.m_67.x = _1354;
    out.m_67.y = _1356;
    out.m_67.z = _1358;
    out.m_67.w = _1360;
    bool _1362 = _1342 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1364 = isnan(_1342);
    bool _1366 = _1362 || _1364;
    bool _1368 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1370 = _1366 || _1368;
    float _1372 = _1324;
    float _1374 = _1330;
    float _1376 = _1342;
    if (!_1370)
    {
        _1372 = 1.0;
    }
    float _1378 = _1372;
    bool _1380 = !_1370;
    float _1382 = _1378;
    if (!_1380)
    {
        bool _1384 = _1342 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1386 = isnan(_1342);
        bool _1388 = _1384 || _1386;
        bool _1390 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1392 = _1388 || _1390;
        if (!_1392)
        {
            float _1394 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1396 = _1342 + _1394;
            float _1398 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1400 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1398;
            float _1402 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1404 = _1402 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1406 = 1.0 / _1400;
            float _1408 = _1396 * _1406;
            float _1410 = fma(_1408, _1404, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1382 = _1410;
            _1412 = true;
        }
        else
        {
            bool _1414 = _1342 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1416 = isnan(_1342);
            bool _1418 = _1414 || _1416;
            bool _1420 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1422 = _1418 || _1420;
            if (!_1422)
            {
                float _1424 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1426 = _1342 + _1424;
                float _1428 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1430 = _1428 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1432 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1434 = _1432 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1436 = 1.0 / _1430;
                float _1438 = _1426 * _1436;
                float _1440 = fma(_1438, _1434, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1382 = _1440;
                _1412 = true;
            }
            else
            {
                _1382 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1412 = false;
    float _1442 = _1382;
    float _1444 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1446 = _1298 + _1444;
    float _1448 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1450 = _1304 + _1448;
    float _1452 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1454 = _1306 + _1452;
    float _1456 = fma(_1446, _1442, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1458 = fma(_1450, _1442, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1460 = fma(_1454, _1442, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1462 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1464 = _1456 + _1462;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1468 = _1458 + _1466;
    float _1470 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1472 = _1460 + _1470;
    float _1474 = _1464 * _1464;
    float _1476 = fma(_1468, _1468, _1474);
    float _1478 = fma(_1472, _1472, _1476);
    float _1480 = rsqrt(_1478);
    float _1482 = _1480 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1484 = _1468 * _1482;
    float _1486 = _1472 * _1482;
    float _1488 = _1484 * _1484;
    float _1490 = _1486 * _1486;
    float _1492 = _1488 + _1490;
    float _1494 = sqrt(_1492);
    bool _1496 = _1494 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1498 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1500 = _1494 + _1498;
    float _1502 = _1476;
    float _1504 = _1500;
    float _1506 = _1464;
    float _1508 = _1484;
    if (_1496)
    {
        float _1510 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1502 = _1510;
    }
    float _1512 = _1502;
    if (_1496)
    {
        float _1514 = rsqrt(_1492);
        _1374 = _1514;
    }
    float _1516 = _1374;
    float _1518 = _1516;
    if (_1496)
    {
        float _1520 = _1500 * _1512;
        _1504 = _1520;
    }
    float _1522 = _1504;
    if (_1496)
    {
        float _1524 = _1522 * 0.15915493667125701904296875;
        _980 = _1524;
    }
    float _1526 = _980;
    float _1528 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1530 = _1472;
    if (_1496)
    {
        float _1532 = _1526 * 6.283185482025146484375;
        float _1534 = sin(_1532);
        _1530 = _1534;
    }
    float _1536 = _1530;
    float _1538 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1540 = precise::max(0.0, _1538);
    float _1542 = _1512;
    float _1544 = _1540;
    if (_1496)
    {
        float _1546 = _1526 * 6.283185482025146484375;
        float _1548 = cos(_1546);
        _1542 = _1548;
    }
    float _1550 = _1542;
    float _1552 = -_1482;
    float _1554 = -_1540;
    float _1556 = fma(_1464, _1552, _1554);
    if (_1496)
    {
        float _1558 = _1556 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1506 = _1558;
    }
    float _1560 = _1506;
    float _1562 = sqrt(_1478);
    float _1564 = _1560;
    float _1566 = _1536;
    if (_1496)
    {
        float _1568 = fma(_1536, _1560, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1564 = _1568;
    }
    float _1570 = _1564;
    float _1572 = _1570;
    if (!_1496)
    {
        _1566 = _1486;
    }
    float _1574 = _1566;
    float _1576 = _1574;
    float _1578 = _1550;
    if (_1496)
    {
        float _1580 = _1550 + (-1.0);
        _1544 = _1580;
    }
    float _1582 = _1544;
    float _1584 = _1582;
    if (_1496)
    {
        float _1586 = _1516 * _1570;
        _1376 = _1586;
    }
    float _1588 = _1376;
    if (!_1496)
    {
        _1572 = _1556;
    }
    float _1590 = _1572;
    float _1592 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1594 = _1590;
    if (_1496)
    {
        float _1596 = _1582 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1518 = _1596;
    }
    float _1598 = _1518;
    if (_1496)
    {
        float _1600 = _1484 * _1588;
        _1508 = _1600;
    }
    float _1602 = _1508;
    if (!_1496)
    {
        _1584 = _1488;
    }
    float _1604 = _1584;
    float _1606 = _1604;
    if (_1496)
    {
        float _1608 = _1486 * _1588;
        _1576 = _1608;
    }
    float _1610 = _1576;
    if (_1496)
    {
        float _1612 = fma(_1556, _1550, _1598);
        _1594 = _1612;
    }
    float _1614 = _1594;
    if (_1496)
    {
        float _1616 = _1602 * _1602;
        _1606 = _1616;
    }
    float _1618 = _1606;
    if (!_1496)
    {
        _1578 = _1490;
    }
    float _1620 = _1578;
    float _1622 = _1620;
    if (_1496)
    {
        float _1624 = _1610 * _1610;
        _1622 = _1624;
    }
    float _1626 = _1622;
    float _1628 = fma(_1614, _1614, _1618);
    float _1630 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1592);
    float _1632 = _1628 + _1626;
    float _1634 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1636 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1638 = fma(_1562, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1636);
    float _1640 = precise::clamp(_1638, 0.0, 1.0);
    float _1642 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1630);
    float _1644 = rsqrt(_1632);
    float _1646 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1634);
    float _1648 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1650 = -_1640;
    float _1652 = _1650 + 1.0;
    float _1654 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1656 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1646);
    float _1658 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1648);
    float _1660 = _1642 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1662 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1654);
    float _1664 = _1656 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1666 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1658);
    float _1668 = abs(_1652);
    float _1670 = log2(_1668);
    float _1672 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1662);
    float _1674 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1676 = _1666 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1678 = _1644 * _1602;
    float _1680 = _1644 * _1610;
    float _1682 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1684 = -_1674;
    float _1686 = fma(_1684, _1528, 1.0);
    float _1688 = _1678 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1690 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1692 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1682);
    float _1694 = _1644 * _1614;
    float _1696 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1698 = log2(_1686);
    float _1700 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1692);
    float _1702 = -_1688;
    float _1704 = fma(_1694, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1702);
    float _1706 = _1670 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1708 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1700);
    float _1710 = -_1680;
    float _1712 = fma(_1710, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1704);
    float _1714 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1716 = exp2(_1706);
    float _1718 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1696);
    float _1720 = fma(_1712, -0.5, 0.5);
    float _1722 = fma(_1712, 0.5, 0.5);
    float _1724 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1714);
    float _1726 = _1694 + 1.0;
    float _1728 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1718);
    float _1730 = fma(_1722, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1732 = 1.0 / _1708;
    float _1734 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1724);
    float _1736 = _1698 * 0.693147182464599609375;
    float _1738 = fma(_1722, _1730, -0.212114393711090087890625);
    float _1740 = _1736 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1742 = fma(_1722, _1738, 1.570728778839111328125);
    float _1744 = sqrt(_1720);
    float _1746 = -_1694;
    float _1748 = fma(_1716, _1726, _1746);
    float _1750 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1734);
    float _1752 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1728);
    float _1754 = fma(_1748, 0.5, 0.5);
    float _1756 = _1750 * _1732;
    float _1758 = _1752 * _1732;
    float _1760 = fma(_1756, 0.5, 0.5);
    float _1762 = fma(_1758, -0.5, 0.5);
    float _1764 = _1744 * 0.636619746685028076171875;
    float _1766 = -_1742;
    float _1768 = fma(_1764, _1766, 1.0);
    float3 _4747 = float3(_1760, _1762, _1740);
    float _1770 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4747, float3(0.0), isnan(_4747)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4747, float3(0.0), isnan(_4747)), level(0.0)).x;
    float3 _4758 = float3(_1760, _1762, _1740);
    float4 _1773 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4758, float3(0.0), isnan(_4758)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4758, float3(0.0), isnan(_4758)), level(0.0)).xyzw;
    float _1775 = _1773.x;
    float _1777 = _1773.y;
    float _1779 = _1773.z;
    float _1781 = _1773.w;
    float2 _4775 = float2(_1768, _1754);
    float3 _1785 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4775, float2(0.0), isnan(_4775)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4775, float2(0.0), isnan(_4775)), level(0.0)).xyz;
    float _1787 = _1785.x;
    float _1789 = _1785.y;
    float _1791 = _1785.z;
    float _1793 = _1188 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1795 = _1670 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1797 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1793);
    float _1799 = _1188 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1801 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1803 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1805 = _1801 || _1803;
    bool _1807 = isnan(0.5);
    bool _1809 = _1805 || _1807;
    float _1811 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1797);
    float _1813 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1799);
    float _1815 = exp2(_1795);
    float _1817 = _1811 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1819 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1813);
    float _1821 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1823 = _1819 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1825 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1821);
    float _1827 = 1.0 / _1817;
    float _1829 = _1823 + _1817;
    float _1831 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1825);
    float _1833 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1831);
    float _1835 = _1829 * _1827;
    float _1837 = _1835 * 0.5;
    float _1839 = _1827;
    if (_1809)
    {
        _1839 = 1.0;
    }
    float _1841 = _1839;
    float _1843 = _1841;
    if (!_1809)
    {
        float _1845 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1847 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1849 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1847);
        float _1851 = _1845 * 0.15915493667125701904296875;
        float _1853 = _1851 * 6.283185482025146484375;
        float _1855 = cos(_1853);
        float _1857 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1859 = _1857 * 0.15915493667125701904296875;
        float _1861 = _1851 * 6.283185482025146484375;
        float _1863 = sin(_1861);
        float _1865 = 1.0 / _1855;
        float _1867 = _1859 * 6.283185482025146484375;
        float _1869 = cos(_1867);
        float _1871 = _1863 * _1865;
        float _1873 = 1.0 / _1849;
        float _1875 = _1869 * _1871;
        float _1877 = _1859 * 6.283185482025146484375;
        float _1879 = sin(_1877);
        float _1881 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1883 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1881;
        float _1885 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1887 = _1873 * _1885;
        float _1889 = 1.0 / _1875;
        float _1891 = 1.0 / _1883;
        float _1893 = _1879 * _1889;
        float _1895 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1897 = fma(_1893, _1887, _1895);
        float _1899 = _1897 * _1891;
        float _1901 = precise::clamp(_1899, 0.0, 1.0);
        _1843 = _1901;
    }
    float _1903 = _1843;
    float _1905 = -_1815;
    float _1907 = _1905 + 1.0;
    float _1909 = _1833 + _1708;
    float _1911 = _1903 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1913 = _1903 > 0.0;
    bool _1915 = isnan(_1903);
    bool _1917 = _1913 || _1915;
    bool _1919 = isnan(0.0);
    bool _1921 = _1917 || _1919;
    float _1923 = _1907 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1925 = _1909 * 0.5;
    float _1927 = _1911 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1929 = _1923 * _1770;
    float _1931 = -_1923;
    float _1933 = _1931 + 1.0;
    out.gl_Position.x = _1750;
    out.gl_Position.y = _1752;
    out.gl_Position.z = _1833;
    out.gl_Position.w = _1708;
    float _1935 = _1781 * _1929;
    float _1937 = _1791 * _1929;
    float _1939 = _1781 * _1933;
    out.m_47.x = _1927;
    float _1941 = fma(_1787, _1935, _1775);
    float _1943 = fma(_1789, _1935, _1777);
    float _1945 = fma(_1781, _1937, _1779);
    out.m_69.z = _1925;
    out.m_69.w = _1708;
    out.m_71.x = _1941;
    out.m_71.y = _1943;
    out.m_71.z = _1945;
    out.m_71.w = _1939;
    if (_1921)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1947 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1947;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1412 = false;
    bool _636 = false;
    bool _508 = false;
    bool _286 = false;
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
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_94)
    {
        float _102 = _98 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2003 = as_type<float>(_104);
        out.gl_Position.z = _2003;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_49.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    if (_118)
    {
        float _126 = float(_90);
        _124 = _126;
    }
    float _128 = _124;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    float _136 = 0.0;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    float _140 = _138;
    if (_134)
    {
        out.m_47.x = 0.0;
    }
    if (_134)
    {
        float _142 = _138 * 5.0;
        _106 = as_type<int>(_142);
    }
    int _144 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2072 = as_type<float>(_144);
        out.gl_Position.z = _2072;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_51.w;
    float _148 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _172 = _148;
    if (!_158)
    {
        float _174 = _148 * _148;
        float _176 = _174 * 0.5;
        _140 = _176;
    }
    float _178 = _140;
    float _180 = _178;
    if (!_158)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    bool _186 = !_158;
    float _188 = _184;
    if (!_186)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _148 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _148);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _218;
    }
    float _220 = _188;
    bool _222 = !_158;
    if (!_222)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = 1.0 / _230;
        float _234 = _148 * _226;
        float _236 = exp2(_234);
        float _238 = -_236;
        float _240 = _238 + 1.0;
        float _242 = _240 * _232;
        _172 = _242;
    }
    float _244 = _172;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _248 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _252 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _254 = fma(_244, _160, _248);
    float _256 = fma(_244, _162, _250);
    float _258 = fma(_244, _164, _252);
    float _260 = fma(_254, _146, _166);
    float _262 = fma(_256, _146, _168);
    float _264 = fma(_258, _146, _170);
    bool _266 = !_246;
    float _284;
    if (!_266)
    {
        float _268 = in.m_53.x;
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
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
        float _292 = _122 * _290;
        _284 = _292;
    }
    _286 = false;
    float _294 = _284;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _298 = _294 + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _302 = _294 + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _306 = _294 + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _316;
    float _320 = 1.0 / _310;
    bool _322 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _324 = 1.0 / _318;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _326;
    float _330 = 1.0 / _314;
    float _332 = _298 * _320;
    bool _334 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _336 = isnan(_294);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _346;
    float _350 = fma(_328, _332, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _352 = fma(_348, _332, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _354 = _302 * _324;
    bool _356 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _358 = isnan(_294);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -_344;
    float _370 = _368 + 1.0;
    float _372 = _366 * _370;
    bool _374 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _376 = isnan(_294);
    bool _378 = _374 || _376;
    bool _380 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _382 = _378 || _380;
    float _384 = float(_382);
    float _386 = _306 * _330;
    bool _388 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _390 = isnan(_294);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _400;
    float _404 = -_366;
    float _406 = _404 + 1.0;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _412 = fma(_402, _332, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _414 = -_398;
    float _416 = _414 + 1.0;
    float _418 = _398 * _406;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _428 = _384 * _416;
    float _430 = -_384;
    float _432 = _430 + 1.0;
    float _434 = fma(_410, _386, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _436 = fma(_422, _386, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _438 = _350 * _428;
    float _440 = _352 * _428;
    float _442 = _412 * _428;
    float _444 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[143].x, _438);
    float _446 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[143].y, _440);
    float _448 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[143].z, _442);
    float _450 = fma(_426, _386, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _456;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _460;
    float _464 = fma(_434, _418, _444);
    float _466 = fma(_454, _354, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _468 = fma(_458, _354, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _470 = fma(_462, _354, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _472 = fma(_436, _418, _446);
    float _474 = fma(_450, _418, _448);
    float _476 = fma(_466, _372, _464);
    float _478 = fma(_468, _372, _472);
    float _480 = fma(_470, _372, _474);
    float _482 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[146].x, _476);
    float _484 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[146].y, _478);
    float _486 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[146].z, _480);
    bool _488 = !_322;
    float _506;
    if (!_488)
    {
        float _490 = in.m_53.x;
        float _492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _494 = _490 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _496 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _498 = _496 * _492;
        float _500 = floor(_498);
        float _502 = -_500;
        float _504 = _498 + _502;
        _506 = _504;
        _508 = true;
    }
    else
    {
        float _510 = float(_90);
        float _512 = 1.0 / _510;
        float _514 = _122 * _512;
        _506 = _514;
    }
    _508 = false;
    float _516 = _506;
    bool _518 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _520 = isnan(_516);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _534 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _536 = isnan(_516);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _546;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _552 = _516 + _550;
    float _554 = 1.0 / _532;
    float _556 = -_528;
    float _558 = _556 + 1.0;
    float _560 = _544 * _558;
    float _562 = -_544;
    float _564 = _562 + 1.0;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _570 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _574 = _566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _578 = _568 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _580 = _548 * _554;
    float _582 = _572 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _584 = _576 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _586 = fma(_580, _552, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _588 = _586 * _560;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _592 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[115].x, _588);
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _596 = _590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _598 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[116].x, _592);
    float _600 = _594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _602 = in.m_51.x;
    float _604 = in.m_51.y;
    float _606 = in.m_51.z;
    float _608 = _598 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _600;
    out.m_55.y = _596;
    out.m_55.z = _584;
    out.m_57.x = _574;
    out.m_57.y = _578;
    out.m_57.z = _582;
    out.m_57.w = _608;
    float _610 = _486 * _606;
    float _612 = _484 * _604;
    float _614 = _482 * _602;
    bool _616 = !_570;
    float _634;
    if (!_616)
    {
        float _618 = in.m_53.x;
        float _620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _622 = _618 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[14].x, _122);
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
        float _642 = _122 * _640;
        _634 = _642;
    }
    _636 = false;
    float _644 = _634;
    float _646 = _612 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _656 = 1.0 / _650;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _666 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _668 = isnan(_644);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    bool _678 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _680 = isnan(_644);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _686 = _682 || _684;
    float _688 = float(_686);
    float _690 = 1.0 / _654;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _692;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _696;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _708 = 1.0 / _660;
    float _710 = _694 * _656;
    bool _712 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _714 = isnan(_644);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    float _724 = -_722;
    float _726 = _724 + 1.0;
    float _728 = 1.0 / _664;
    float _730 = _698 * _690;
    float _732 = _702 * _708;
    bool _734 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _736 = isnan(_644);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    bool _746 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _748 = isnan(_644);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _754 = _750 || _752;
    float _756 = float(_754);
    float _758 = _706 * _728;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _762 = _760 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _764 = _744 * _726;
    float _766 = -_744;
    float _768 = _766 + 1.0;
    float _770 = -_756;
    float _772 = _770 + 1.0;
    float _774 = 1.0 / _762;
    float _776 = _756 * _768;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _780 = _644 + _778;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _784 = _782 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _786 = _676 * _772;
    float _788 = -_676;
    float _790 = _788 + 1.0;
    float _792 = fma(_710, _780, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _794 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _796 = isnan(_644);
    bool _798 = _794 || _796;
    bool _800 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _802 = _798 || _800;
    float _804 = float(_802);
    float _806 = 1.0 / _784;
    float _808 = _688 * _790;
    float _810 = -_688;
    float _812 = _810 + 1.0;
    bool _814 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _816 = isnan(_644);
    bool _818 = _814 || _816;
    bool _820 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _822 = _818 || _820;
    float _824 = float(_822);
    float _826 = -_804;
    float _828 = _826 + 1.0;
    float _830 = _804 * _812;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _836 = _824 * _828;
    float _838 = -_824;
    float _840 = _838 + 1.0;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _842;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _850 = _792 * _836;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _854 = _644 + _852;
    float _856 = _844 * _774;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _860 = _644 + _858;
    float _862 = _848 * _806;
    float _864 = fma(_730, _854, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _866 = fma(_840, (*spvDescriptorSet0.vp_c9)._m0[159].x, _850);
    float _868 = fma(_732, _860, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _870 = in.m_59.w;
    float _872 = 1.0 / _834;
    float _874 = fma(_868, _830, _866);
    float _876 = in.m_61.x;
    float _878 = in.m_61.y;
    float _880 = in.m_61.z;
    float _882 = fma(_864, _808, _874);
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _886 = _644 + _884;
    bool _888 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _890 = isnan(_644);
    bool _892 = _888 || _890;
    bool _894 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _896 = _892 || _894;
    float _898 = float(_896);
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _902 = _644 + _900;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _904;
    float _908 = fma(_862, _886, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _910 = fma(_758, _902, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _914 = _644 + _912;
    float _916 = -_898;
    float _918 = _916 + 1.0;
    float _920 = _906 * _872;
    float _922 = fma(_910, _786, _882);
    float _924 = fma(_856, _914, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _928 = _644 + _926;
    float _930 = _722 * _918;
    float _932 = in.m_53.w;
    float _934 = fma(_924, _776, _922);
    float _936 = fma(_920, _928, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _938 = -_870;
    float _940 = _938 + 1.0;
    float _942 = _610 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _944 = fma(_908, _764, _934);
    float _946 = fma(_936, _930, _944);
    float _948 = _940 * _880;
    int _950 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _952 = _950 != 0;
    float _954 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[166].x, _946);
    float _956 = _940 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _958 = -_948;
    float _960 = _958 + _880;
    float _962 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[191].x, _948);
    float _964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _966 = _954 * _956;
    float _968 = fma(_954, _962, _960);
    float _970 = _614 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _972 = fma(_876, _966, _876);
    float _974 = fma(_878, _966, _878);
    float _976 = _878;
    int _978 = as_type<int>(_774);
    float _980 = _870;
    if (!_952)
    {
        float _982 = in.m_53.y;
        _976 = _982;
    }
    float _984 = _976;
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _988 = _986 != 0;
    float _990 = in.m_63.x;
    int _992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _994 = _992 != 0;
    float _996 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _974);
    float _998 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _972);
    int _1000 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1002 = _1000 != 0;
    float _1004 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _968);
    float _1006 = _996 * _646;
    float _1008 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1012 = _1010 != 0;
    float _1014 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1016 = _932 > 0.5;
    float _1018 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1008);
    float _1020 = _930;
    float _1022 = _998;
    bool _1024 = _1016;
    if (_988)
    {
        float _1026 = in.m_53.x;
        _1020 = _1026;
    }
    float _1028 = _1020;
    float _1030 = _998 * _970;
    float _1032 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1034 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1018);
    float _1036 = in.m_63.y;
    float _1038 = _1006 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1040 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1032);
    float _1042 = _1006 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1044 = _1004 * _942;
    float _1046 = fma(_1030, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1038);
    float _1048 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1040);
    float _1050 = fma(_1030, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1042);
    float _1052 = _1034 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1054 = fma(_1044, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1046);
    float _1056 = _1048 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1058 = fma(_1044, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1050);
    float _1060 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1014);
    float _1062 = _1052 + _1054;
    float _1064 = _1060;
    float _1066 = _1058;
    if (!_952)
    {
        _1022 = _984;
    }
    float _1068 = _1022;
    float _1070 = _1056 + _1058;
    float _1072 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1060);
    if (!_988)
    {
        _1064 = _990;
    }
    float _1074 = _1064;
    float _1076 = _920;
    float _1078 = _1074;
    if (!_952)
    {
        float _1080 = in.m_53.z;
        _1076 = _1080;
    }
    float _1082 = _1076;
    float _1084 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1086 = _1070 + _1084;
    bool _1088 = false;
    if (_988)
    {
        bool _1090 = _1028 > 0.5;
        _1088 = _1090;
    }
    bool _1092 = _1088;
    float _1094 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1096 = _1062 + _1094;
    float _1098 = _1068;
    float _1100 = _984;
    if (_952)
    {
        float _1102 = in.m_53.x;
        float _1104 = in.m_53.y;
        _1098 = _1102;
        _1100 = _1104;
    }
    float _1106 = _1098;
    float _1108 = _1100;
    float _1110 = _1086 * _1086;
    float _1112 = -_1036;
    float _1114 = _1112 + 1.0;
    float _1116 = _1096 * _1096;
    float _1118 = _808;
    float _1120 = _1036;
    if (_994)
    {
        float _1122 = in.m_53.z;
        _1118 = _1122;
    }
    float _1124 = _1118;
    if (!_988)
    {
        _1066 = _1074;
    }
    float _1126 = _1066;
    float _1128 = _964 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1130 = _1116 + _1110;
    int _1132 = _1016 ? as_type<int>(_1114) : as_type<int>(_1036);
    float _1134 = _1006 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1136 = _964;
    float _1138 = _1126;
    if (_988)
    {
        _1078 = _990;
    }
    float _1140 = _1078;
    float _1142 = sqrt(_1130);
    int _1144 = _1002 ? _1132 : as_type<int>(_1036);
    int _1146 = _1144;
    float _1148 = _1140;
    if (_994)
    {
        float _1150 = -_1140;
        float _1152 = _1150 + 1.0;
        _978 = as_type<int>(_1152);
    }
    int _1154 = _978;
    float _1156 = fma(_1128, as_type<float>(_1144), -0.5);
    if (_988)
    {
        float _1158 = -_1140;
        float _1160 = _1158 + 1.0;
        _1146 = as_type<int>(_1160);
    }
    int _1162 = _1146;
    float _1164 = _1082;
    if (!_952)
    {
        _1136 = _1082;
    }
    float _1166 = _1136;
    float _1168 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1170 = _1166;
    float _1172 = _1168;
    if (_988)
    {
        float _1174 = _1092 ? as_type<float>(_1162) : _1140;
        _1138 = _1174;
    }
    float _1176 = _1138;
    float _1178 = fma(_1030, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1134);
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1184 = _1142 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1186 = fma(_1044, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1178);
    float _1188 = _1072 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1190 = _1106;
    if (_952)
    {
        _1170 = _1108;
    }
    float _1192 = _1170;
    float _1194 = fma(_1106, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1180);
    if (_952)
    {
        _1164 = _1108;
    }
    float _1196 = _1164;
    float _1198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1200 = _1108 > 0.5;
    float _1202 = _1106 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1204 = _1196;
    float _1206 = _1202;
    if (_994)
    {
        bool _1208 = _1124 > 0.5;
        _1024 = _1208;
    }
    bool _1210 = _1024;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1214 = _1188 + _1186;
    float _1216 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1168);
    float _1218 = _1212;
    if (_994)
    {
        float _1220 = _1210 ? as_type<float>(_1154) : _1140;
        _1148 = _1220;
    }
    float _1222 = _1148;
    float _1224 = -_1212;
    float _1226 = fma(_1202, 2.0, _1224);
    if (!_1184)
    {
        _1172 = _1110;
    }
    float _1228 = _1172;
    float _1230 = _1228;
    if (!_1184)
    {
        _1204 = _1116;
    }
    float _1232 = _1204;
    float _1234 = _1232;
    if (!_1184)
    {
        _1190 = _1062;
    }
    float _1236 = _1190;
    float _1238 = _1236;
    if (!_1184)
    {
        _1218 = _1070;
    }
    float _1240 = _1218;
    float _1242 = _1240;
    if (!_1184)
    {
        _1206 = _1214;
    }
    float _1244 = _1206;
    bool _1246 = !_1184;
    float _1248 = _1244;
    if (!_1246)
    {
        float _1250 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1252 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1254 = _1142 + _1252;
        float _1256 = _1214 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1258 = rsqrt(_1130);
        float _1260 = _1254 * _1250;
        float _1262 = _1260 * 0.15915493667125701904296875;
        float _1264 = _1262 * 6.283185482025146484375;
        float _1266 = sin(_1264);
        float _1268 = _1262 * 6.283185482025146484375;
        float _1270 = cos(_1268);
        float _1272 = fma(_1266, _1256, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1274 = _1258 * _1272;
        float _1276 = _1270 + (-1.0);
        float _1278 = fma(_1096, _1274, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1280 = fma(_1086, _1274, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1282 = _1276 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1284 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1286 = _1278 + _1284;
        float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1290 = _1280 + _1288;
        float _1292 = fma(_1214, _1270, _1282);
        float _1294 = _1286 * _1286;
        float _1296 = _1290 * _1290;
        _1248 = _1292;
        _1234 = _1294;
        _1230 = _1296;
        _1238 = _1278;
        _1242 = _1280;
    }
    float _1298 = _1248;
    float _1300 = _1234;
    float _1302 = _1230;
    float _1304 = _1238;
    float _1306 = _1242;
    float _1308 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1310 = _1298 + _1308;
    float _1312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1316 = _1192 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1318 = fma(_1310, _1310, _1300);
    float _1320 = _1182 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_1012)
    {
        float _1322 = _1200 ? _1114 : _1036;
        _1120 = _1322;
    }
    float _1324 = _1120;
    float _1326 = fma(_1316, -2.0, _1314);
    float _1328 = _1318 + _1302;
    float _1330 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1194);
    float _1332 = -_122;
    float _1334 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1226);
    float _1336 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1216);
    float _1338 = fma(_1320, _1222, -0.5);
    float _1340 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1326);
    float _1342 = sqrt(_1328);
    float _1344 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1346 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1348 = fma(_1330, _1338, _1334);
    float _1350 = -_1340;
    float _1352 = fma(_1336, _1156, _1350);
    float _1354 = _1344 * _1198;
    float _1356 = _1346 * _1312;
    float _1358 = _1348 + 0.5;
    float _1360 = _1352 + 0.5;
    out.m_65.w = _870;
    out.m_67.x = _1354;
    out.m_67.y = _1356;
    out.m_67.z = _1358;
    out.m_67.w = _1360;
    bool _1362 = _1342 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1364 = isnan(_1342);
    bool _1366 = _1362 || _1364;
    bool _1368 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1370 = _1366 || _1368;
    float _1372 = _1324;
    float _1374 = _1330;
    float _1376 = _1342;
    if (!_1370)
    {
        _1372 = 1.0;
    }
    float _1378 = _1372;
    bool _1380 = !_1370;
    float _1382 = _1378;
    if (!_1380)
    {
        bool _1384 = _1342 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1386 = isnan(_1342);
        bool _1388 = _1384 || _1386;
        bool _1390 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1392 = _1388 || _1390;
        if (!_1392)
        {
            float _1394 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1396 = _1342 + _1394;
            float _1398 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1400 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1398;
            float _1402 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1404 = _1402 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1406 = 1.0 / _1400;
            float _1408 = _1396 * _1406;
            float _1410 = fma(_1408, _1404, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1382 = _1410;
            _1412 = true;
        }
        else
        {
            bool _1414 = _1342 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1416 = isnan(_1342);
            bool _1418 = _1414 || _1416;
            bool _1420 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1422 = _1418 || _1420;
            if (!_1422)
            {
                float _1424 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1426 = _1342 + _1424;
                float _1428 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1430 = _1428 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1432 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1434 = _1432 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1436 = 1.0 / _1430;
                float _1438 = _1426 * _1436;
                float _1440 = fma(_1438, _1434, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1382 = _1440;
                _1412 = true;
            }
            else
            {
                _1382 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1412 = false;
    float _1442 = _1382;
    float _1444 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1446 = _1298 + _1444;
    float _1448 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1450 = _1304 + _1448;
    float _1452 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1454 = _1306 + _1452;
    float _1456 = fma(_1446, _1442, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1458 = fma(_1450, _1442, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1460 = fma(_1454, _1442, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1462 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1464 = _1456 + _1462;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1468 = _1458 + _1466;
    float _1470 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1472 = _1460 + _1470;
    float _1474 = _1464 * _1464;
    float _1476 = fma(_1468, _1468, _1474);
    float _1478 = fma(_1472, _1472, _1476);
    float _1480 = rsqrt(_1478);
    float _1482 = _1480 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1484 = _1468 * _1482;
    float _1486 = _1472 * _1482;
    float _1488 = _1484 * _1484;
    float _1490 = _1486 * _1486;
    float _1492 = _1488 + _1490;
    float _1494 = sqrt(_1492);
    bool _1496 = _1494 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1498 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1500 = _1494 + _1498;
    float _1502 = _1476;
    float _1504 = _1500;
    float _1506 = _1464;
    float _1508 = _1484;
    if (_1496)
    {
        float _1510 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1502 = _1510;
    }
    float _1512 = _1502;
    if (_1496)
    {
        float _1514 = rsqrt(_1492);
        _1374 = _1514;
    }
    float _1516 = _1374;
    float _1518 = _1516;
    if (_1496)
    {
        float _1520 = _1500 * _1512;
        _1504 = _1520;
    }
    float _1522 = _1504;
    if (_1496)
    {
        float _1524 = _1522 * 0.15915493667125701904296875;
        _980 = _1524;
    }
    float _1526 = _980;
    float _1528 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1530 = _1472;
    if (_1496)
    {
        float _1532 = _1526 * 6.283185482025146484375;
        float _1534 = sin(_1532);
        _1530 = _1534;
    }
    float _1536 = _1530;
    float _1538 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1540 = precise::max(0.0, _1538);
    float _1542 = _1512;
    float _1544 = _1540;
    if (_1496)
    {
        float _1546 = _1526 * 6.283185482025146484375;
        float _1548 = cos(_1546);
        _1542 = _1548;
    }
    float _1550 = _1542;
    float _1552 = -_1482;
    float _1554 = -_1540;
    float _1556 = fma(_1464, _1552, _1554);
    if (_1496)
    {
        float _1558 = _1556 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1506 = _1558;
    }
    float _1560 = _1506;
    float _1562 = sqrt(_1478);
    float _1564 = _1560;
    float _1566 = _1536;
    if (_1496)
    {
        float _1568 = fma(_1536, _1560, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1564 = _1568;
    }
    float _1570 = _1564;
    float _1572 = _1570;
    if (!_1496)
    {
        _1566 = _1486;
    }
    float _1574 = _1566;
    float _1576 = _1574;
    float _1578 = _1550;
    if (_1496)
    {
        float _1580 = _1550 + (-1.0);
        _1544 = _1580;
    }
    float _1582 = _1544;
    float _1584 = _1582;
    if (_1496)
    {
        float _1586 = _1516 * _1570;
        _1376 = _1586;
    }
    float _1588 = _1376;
    if (!_1496)
    {
        _1572 = _1556;
    }
    float _1590 = _1572;
    float _1592 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1594 = _1590;
    if (_1496)
    {
        float _1596 = _1582 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1518 = _1596;
    }
    float _1598 = _1518;
    if (_1496)
    {
        float _1600 = _1484 * _1588;
        _1508 = _1600;
    }
    float _1602 = _1508;
    if (!_1496)
    {
        _1584 = _1488;
    }
    float _1604 = _1584;
    float _1606 = _1604;
    if (_1496)
    {
        float _1608 = _1486 * _1588;
        _1576 = _1608;
    }
    float _1610 = _1576;
    if (_1496)
    {
        float _1612 = fma(_1556, _1550, _1598);
        _1594 = _1612;
    }
    float _1614 = _1594;
    if (_1496)
    {
        float _1616 = _1602 * _1602;
        _1606 = _1616;
    }
    float _1618 = _1606;
    if (!_1496)
    {
        _1578 = _1490;
    }
    float _1620 = _1578;
    float _1622 = _1620;
    if (_1496)
    {
        float _1624 = _1610 * _1610;
        _1622 = _1624;
    }
    float _1626 = _1622;
    float _1628 = fma(_1614, _1614, _1618);
    float _1630 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1592);
    float _1632 = _1628 + _1626;
    float _1634 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1636 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1638 = fma(_1562, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1636);
    float _1640 = precise::clamp(_1638, 0.0, 1.0);
    float _1642 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1630);
    float _1644 = rsqrt(_1632);
    float _1646 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1634);
    float _1648 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1650 = -_1640;
    float _1652 = _1650 + 1.0;
    float _1654 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1656 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1646);
    float _1658 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1648);
    float _1660 = _1642 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1662 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1654);
    float _1664 = _1656 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1666 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1658);
    float _1668 = abs(_1652);
    float _1670 = log2(_1668);
    float _1672 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1662);
    float _1674 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1676 = _1666 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1678 = _1644 * _1602;
    float _1680 = _1644 * _1610;
    float _1682 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1684 = -_1674;
    float _1686 = fma(_1684, _1528, 1.0);
    float _1688 = _1678 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1690 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1692 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1682);
    float _1694 = _1644 * _1614;
    float _1696 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1698 = log2(_1686);
    float _1700 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1692);
    float _1702 = -_1688;
    float _1704 = fma(_1694, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1702);
    float _1706 = _1670 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1708 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1700);
    float _1710 = -_1680;
    float _1712 = fma(_1710, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1704);
    float _1714 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1716 = exp2(_1706);
    float _1718 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1696);
    float _1720 = fma(_1712, -0.5, 0.5);
    float _1722 = fma(_1712, 0.5, 0.5);
    float _1724 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1714);
    float _1726 = _1694 + 1.0;
    float _1728 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1718);
    float _1730 = fma(_1722, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1732 = 1.0 / _1708;
    float _1734 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1724);
    float _1736 = _1698 * 0.693147182464599609375;
    float _1738 = fma(_1722, _1730, -0.212114393711090087890625);
    float _1740 = _1736 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1742 = fma(_1722, _1738, 1.570728778839111328125);
    float _1744 = sqrt(_1720);
    float _1746 = -_1694;
    float _1748 = fma(_1716, _1726, _1746);
    float _1750 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1734);
    float _1752 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1728);
    float _1754 = fma(_1748, 0.5, 0.5);
    float _1756 = _1750 * _1732;
    float _1758 = _1752 * _1732;
    float _1760 = fma(_1756, 0.5, 0.5);
    float _1762 = fma(_1758, -0.5, 0.5);
    float _1764 = _1744 * 0.636619746685028076171875;
    float _1766 = -_1742;
    float _1768 = fma(_1764, _1766, 1.0);
    float3 _4747 = float3(_1760, _1762, _1740);
    float _1770 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4747, float3(0.0), isnan(_4747)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4747, float3(0.0), isnan(_4747)), level(0.0)).x;
    float3 _4758 = float3(_1760, _1762, _1740);
    float4 _1773 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4758, float3(0.0), isnan(_4758)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4758, float3(0.0), isnan(_4758)), level(0.0)).xyzw;
    float _1775 = _1773.x;
    float _1777 = _1773.y;
    float _1779 = _1773.z;
    float _1781 = _1773.w;
    float2 _4775 = float2(_1768, _1754);
    float3 _1785 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4775, float2(0.0), isnan(_4775)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4775, float2(0.0), isnan(_4775)), level(0.0)).xyz;
    float _1787 = _1785.x;
    float _1789 = _1785.y;
    float _1791 = _1785.z;
    float _1793 = _1188 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1795 = _1670 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1797 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1793);
    float _1799 = _1188 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1801 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1803 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1805 = _1801 || _1803;
    bool _1807 = isnan(0.5);
    bool _1809 = _1805 || _1807;
    float _1811 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1797);
    float _1813 = fma(_1052, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1799);
    float _1815 = exp2(_1795);
    float _1817 = _1811 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1819 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1813);
    float _1821 = _1676 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1823 = _1819 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1825 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1821);
    float _1827 = 1.0 / _1817;
    float _1829 = _1823 + _1817;
    float _1831 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1825);
    float _1833 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1831);
    float _1835 = _1829 * _1827;
    float _1837 = _1835 * 0.5;
    float _1839 = _1827;
    if (_1809)
    {
        _1839 = 1.0;
    }
    float _1841 = _1839;
    float _1843 = _1841;
    if (!_1809)
    {
        float _1845 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1847 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1849 = fma(_1837, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1847);
        float _1851 = _1845 * 0.15915493667125701904296875;
        float _1853 = _1851 * 6.283185482025146484375;
        float _1855 = cos(_1853);
        float _1857 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1859 = _1857 * 0.15915493667125701904296875;
        float _1861 = _1851 * 6.283185482025146484375;
        float _1863 = sin(_1861);
        float _1865 = 1.0 / _1855;
        float _1867 = _1859 * 6.283185482025146484375;
        float _1869 = cos(_1867);
        float _1871 = _1863 * _1865;
        float _1873 = 1.0 / _1849;
        float _1875 = _1869 * _1871;
        float _1877 = _1859 * 6.283185482025146484375;
        float _1879 = sin(_1877);
        float _1881 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1883 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1881;
        float _1885 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1887 = _1873 * _1885;
        float _1889 = 1.0 / _1875;
        float _1891 = 1.0 / _1883;
        float _1893 = _1879 * _1889;
        float _1895 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1897 = fma(_1893, _1887, _1895);
        float _1899 = _1897 * _1891;
        float _1901 = precise::clamp(_1899, 0.0, 1.0);
        _1843 = _1901;
    }
    float _1903 = _1843;
    float _1905 = -_1815;
    float _1907 = _1905 + 1.0;
    float _1909 = _1833 + _1708;
    float _1911 = _1903 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1913 = _1903 > 0.0;
    bool _1915 = isnan(_1903);
    bool _1917 = _1913 || _1915;
    bool _1919 = isnan(0.0);
    bool _1921 = _1917 || _1919;
    float _1923 = _1907 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1925 = _1909 * 0.5;
    float _1927 = _1911 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1929 = _1923 * _1770;
    float _1931 = -_1923;
    float _1933 = _1931 + 1.0;
    out.gl_Position.x = _1750;
    out.gl_Position.y = _1752;
    out.gl_Position.z = _1833;
    out.gl_Position.w = _1708;
    float _1935 = _1781 * _1929;
    float _1937 = _1791 * _1929;
    float _1939 = _1781 * _1933;
    out.m_47.x = _1927;
    float _1941 = fma(_1787, _1935, _1775);
    float _1943 = fma(_1789, _1935, _1777);
    float _1945 = fma(_1781, _1937, _1779);
    out.m_69.z = _1925;
    out.m_69.w = _1708;
    out.m_71.x = _1941;
    out.m_71.y = _1943;
    out.m_71.z = _1945;
    out.m_71.w = _1939;
    if (_1921)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1947 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1947;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

