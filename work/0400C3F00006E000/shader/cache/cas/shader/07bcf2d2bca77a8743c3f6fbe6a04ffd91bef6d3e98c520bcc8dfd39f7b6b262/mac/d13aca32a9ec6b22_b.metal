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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
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
    float4 m_55 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_61 [[user(locn6)]];
    float4 m_65 [[user(locn7)]];
    float4 m_71 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_67 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_57 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _584 = false;
    bool _454 = false;
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
    if (!_94)
    {
        out.m_45.x = 0.0;
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
        float _2586 = as_type<float>(_104);
        out.gl_Position.z = _2586;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_47.w;
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
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2655 = as_type<float>(_142);
        out.gl_Position.z = _2655;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_49.w;
    float _146 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
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
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
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
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _298 = _294 + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _308 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _310 = isnan(_294);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _324 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _326 = isnan(_294);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = 1.0 / _302;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _338;
    float _342 = -_318;
    float _344 = _342 + 1.0;
    bool _346 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _348 = isnan(_294);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    bool _358 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _360 = 1.0 / _306;
    float _362 = 1.0 / _322;
    float _364 = _340 * _336;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _370 = _334 * _344;
    float _372 = -_334;
    float _374 = _372 + 1.0;
    float _376 = fma(_364, _298, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _378;
    float _382 = _356 * _374;
    float _384 = _368 * _360;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _388 = _294 + _386;
    bool _390 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _392 = isnan(_294);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = _376 * _382;
    float _404 = -_356;
    float _406 = _404 + 1.0;
    float _408 = fma(_384, _388, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _412 = _294 + _410;
    float _414 = _380 * _362;
    float _416 = -_400;
    float _418 = _416 + 1.0;
    float _420 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[115].x, _402);
    float _422 = fma(_414, _412, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _424 = _318 * _418;
    float _426 = fma(_408, _370, _420);
    float _428 = fma(_422, _424, _426);
    float _430 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[118].x, _428);
    float _432 = _430 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.w = _432;
    bool _434 = !_358;
    float _452;
    if (!_434)
    {
        float _436 = in.m_51.x;
        float _438 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _440 = _436 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _442 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _444 = _442 * _438;
        float _446 = floor(_444);
        float _448 = -_446;
        float _450 = _444 + _448;
        _452 = _450;
        _454 = true;
    }
    else
    {
        float _456 = float(_90);
        float _458 = 1.0 / _456;
        float _460 = _122 * _458;
        _452 = _460;
    }
    _454 = false;
    float _462 = _452;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _466 = _462 + _464;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _472 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _474 = isnan(_462);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _488 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _490 = isnan(_462);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _496 = _492 || _494;
    float _498 = float(_496);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _500;
    bool _504 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _506 = isnan(_462);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = 1.0 / _470;
    float _518 = -_482;
    float _520 = _518 + 1.0;
    bool _522 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _524 = _498 * _520;
    float _526 = -_498;
    float _528 = _526 + 1.0;
    float _530 = 1.0 / _486;
    float _532 = _502 * _516;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _538 = fma(_532, _466, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _540 = _536 * _530;
    float _542 = _538 * _524;
    float _544 = -_514;
    float _546 = _544 + 1.0;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _550 = _462 + _548;
    float _552 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[131].x, _542);
    float _554 = _482 * _546;
    float _556 = fma(_540, _550, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _558 = fma(_556, _554, _552);
    float _560 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[133].x, _558);
    float _562 = _560 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_55.w = _562;
    bool _564 = !_522;
    float _582;
    if (!_564)
    {
        float _566 = in.m_51.x;
        float _568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _570 = _566 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _572 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[14].x, _122);
        float _574 = _572 * _568;
        float _576 = floor(_574);
        float _578 = -_576;
        float _580 = _574 + _578;
        _582 = _580;
        _584 = true;
    }
    else
    {
        float _586 = float(_90);
        float _588 = 1.0 / _586;
        float _590 = _122 * _588;
        _582 = _590;
    }
    _584 = false;
    float _592 = _582;
    float _594 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _596 = int(_594);
    float _598 = in.m_57.y;
    float _600 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _602 = float(_90);
    float _604 = in.m_51.y;
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _608 = _606 != 0;
    float _610 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _612 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _614 = int(_612);
    float _616 = in.m_51.z;
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _620 = _618 != 0;
    float _622 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _610);
    int _624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _626 = _624 != 0;
    float _628 = in.m_57.x;
    float _630 = float(_596);
    float _632 = 1.0 / _602;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _638 = float(uint(_614));
    float _640 = 1.0 / _630;
    int _642 = ~_614;
    int _644 = _642 + 1;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _650 = _604 > 0.5;
    float _652 = 1.0 / _638;
    bool _654 = _616 > 0.5;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _664 = float(_614);
    float _666 = _122 * _640;
    float _668 = 1.0 / _636;
    float _670 = in.m_51.w;
    int _672 = as_type<int>(_652) + (-2);
    float _674 = trunc(_666);
    int _676 = int(_674);
    float _678 = 1.0 / _648;
    float _680 = float(uint(_676));
    float _682 = 1.0 / _658;
    bool _684 = _670 > 0.5;
    float _686 = _670;
    float _688 = _598;
    float _690 = _616;
    if (!_608)
    {
        _686 = _628;
    }
    float _692 = _686;
    float _694 = as_type<float>(_672) * _680;
    float _696 = trunc(_694);
    float _698 = precise::max(_696, 0.0);
    uint _701 = uint(_698);
    float _703 = 1.0 / _662;
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _707 = _705 != 0;
    int _709 = _644 * int(_701);
    int _711 = _709 + _676;
    bool _713 = !_707;
    float _715 = _713 ? 5.839270114898681640625 : 1.0;
    float _717 = in.m_51.x;
    float _719 = float(uint(_711));
    float _721 = as_type<float>(_672) * _719;
    float _723 = -_598;
    float _725 = _723 + 1.0;
    float _727 = trunc(_721);
    float _729 = precise::max(_727, 0.0);
    uint _731 = uint(_729);
    int _733 = _650 ? as_type<int>(_725) : as_type<int>(_598);
    float _735 = _620 ? as_type<float>(_733) : _598;
    int _737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _739 = _737 != 0;
    int _741 = _654 ? as_type<int>(_725) : as_type<int>(_598);
    float _743 = _739 ? as_type<float>(_741) : _598;
    int _745 = _741;
    bool _747 = _739;
    float _749 = _692;
    if (_608)
    {
        float _751 = -_628;
        float _753 = _751 + 1.0;
        _745 = as_type<int>(_753);
    }
    int _755 = _745;
    if (_608)
    {
        bool _757 = _717 > 0.5;
        _747 = _757;
    }
    bool _759 = _747;
    int _761 = int(_701) + int(_731);
    int _763 = ~_614;
    int _765 = _763 + 1;
    if (_626)
    {
        float _767 = _684 ? _725 : _598;
        _688 = _767;
    }
    float _769 = _688;
    if (_608)
    {
        float _771 = _759 ? as_type<float>(_755) : _628;
        _749 = _771;
    }
    float _773 = _749;
    int _775 = _765 * _761;
    int _777 = _775 + _676;
    bool _779 = uint(_777) >= uint(_614);
    float _781 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _787 = _785 != 0;
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _791 = _789 != 0;
    int _793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _795 = _793 != 0;
    float _797 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _781);
    bool _799 = !_779;
    int _801 = _799 ? 0 : (-1);
    float _803 = _717 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _807 = _805 != 0;
    float _809 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _600);
    bool _811 = !_791;
    int _813 = _811 ? 0 : 1;
    float _815 = _604 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _817 = !_787;
    int _819 = _817 ? 0 : 1;
    float _821 = -_783;
    float _823 = fma(_803, 2.0, _821);
    bool _825 = !_795;
    int _827 = _825 ? 0 : 1;
    float _829 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].z, _797);
    bool _831 = !_807;
    int _833 = _831 ? 0 : 1;
    float _835 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].z, _809);
    int _837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _839 = _837 != 0;
    float _841 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].z, _622);
    int _843 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _845 = _843 != 0;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _847;
    int _851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _853 = _851 != 0;
    float _855 = -_122;
    float _857 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[76].x, _823);
    int _859 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _861 = _859 != 0;
    float _863 = _849 * _668;
    float _865 = _841 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _867 = float(_676);
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _871 = ~_761;
    int _873 = _871 + _801;
    int _875 = _873 + 1;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _879 = _877 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _881 = _867 >= _664;
    bool _883 = isnan(_867);
    bool _885 = _881 || _883;
    bool _887 = isnan(_664);
    bool _889 = _885 || _887;
    float _891 = float(_889);
    float _893 = fma(_815, -2.0, _869);
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _897 = _895 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _899 = !_707;
    float _901 = _899 ? _616 : _717;
    int _903 = 0;
    if (_861)
    {
        float _905 = -_628;
        float _907 = _905 + 1.0;
        _903 = as_type<int>(_907);
    }
    int _909 = _903;
    float _911 = 1.0 / _879;
    float _913 = _901 * _715;
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _917 = _915 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _919 = abs(_819);
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _925 = floor(_913);
    float _927 = _917 * _678;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _931 = _929 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _933 = _931 * _703;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _937 = _935 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _939 = 1.0 / _897;
    float _941 = trunc(_891);
    int _943 = int(_941);
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _945;
    float _949 = -_925;
    float _951 = _913 + _949;
    bool _953 = !_839;
    int _955 = _953 ? 0 : 1;
    float _957 = _947 * _682;
    float _959 = _951 * _664;
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _961;
    float _965 = _122 * _664;
    bool _967 = _614 == 0;
    float _969 = 1.0 / _923;
    float _971 = _963 * _911;
    float _973 = _937 * _939;
    int _975 = _614 * _875;
    int _977 = _975 + _676;
    float _979 = _965 * _632;
    int _981 = ~_943;
    int _983 = _981 + 1;
    int _985 = _983 + 1;
    float _987 = trunc(_959);
    int _989 = int(_987);
    bool _991 = !_967;
    int _993 = _991 ? _977 : (-1);
    int _995 = _614 + (-1);
    int _997 = abs(_813);
    int _999 = _993 * _985;
    int _1001 = abs(_955);
    float _1003 = trunc(_979);
    int _1005 = int(_1003);
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1007;
    int _1011 = _943 * _995;
    int _1013 = _1011 + _999;
    int _1015 = abs(_833);
    float _1017 = _1009 * _969;
    bool _1019 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1021 = isnan(_592);
    bool _1023 = _1019 || _1021;
    bool _1025 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1027 = _1023 || _1025;
    float _1029 = float(_1027);
    int _1031 = _1013 * _997;
    int _1033 = ~_614;
    int _1035 = _1033 + 1;
    int _1037 = _989 * _1001;
    int _1039 = _1037 + _676;
    int _1041 = abs(_827);
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1045 = _592 + _1043;
    float _1047 = -_1029;
    float _1049 = _1047 + 1.0;
    float _1051 = fma(_863, _1045, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _1053 = _1005 * _919;
    int _1055 = _1053 + _1031;
    float _1057 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1061 = _592 + _1059;
    float _1063 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1065 = _592 + _1063;
    int _1067 = _1039 * _1041;
    int _1069 = _1067 + _1055;
    float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1073 = _592 + _1071;
    float _1075 = fma(_927, _1065, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _1077 = _989 * _1015;
    int _1079 = _1077 + _1069;
    float _1081 = fma(_957, _1061, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1085 = _592 + _1083;
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1089 = _592 + _1087;
    bool _1091 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1093 = isnan(_592);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1099 = _1095 || _1097;
    float _1101 = float(_1099);
    float _1103 = float(uint(_1079));
    float _1105 = fma(_933, _1085, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1109 = _592 + _1107;
    float _1111 = fma(_971, _1089, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1113 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1115 = as_type<float>(_672) * _1103;
    bool _1117 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1119 = isnan(_592);
    bool _1121 = _1117 || _1119;
    bool _1123 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1125 = _1121 || _1123;
    float _1127 = float(_1125);
    float _1129 = fma(_973, _1109, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _1131 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1133 = isnan(_592);
    bool _1135 = _1131 || _1133;
    bool _1137 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1139 = _1135 || _1137;
    float _1141 = float(_1139);
    float _1143 = fma(_1113, _735, -0.5);
    bool _1145 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1147 = isnan(_592);
    bool _1149 = _1145 || _1147;
    bool _1151 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1153 = _1149 || _1151;
    float _1155 = float(_1153);
    float _1157 = trunc(_1115);
    float _1159 = precise::max(_1157, 0.0);
    uint _1161 = uint(_1159);
    float _1163 = -_1127;
    float _1165 = _1163 + 1.0;
    float _1167 = -_1141;
    float _1169 = _1167 + 1.0;
    bool _1171 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1173 = isnan(_592);
    bool _1175 = _1171 || _1173;
    bool _1177 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1179 = _1175 || _1177;
    float _1181 = float(_1179);
    float _1183 = _1141 * _1165;
    float _1185 = _1155 * _1169;
    float _1187 = -_1155;
    float _1189 = _1187 + 1.0;
    bool _1191 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1193 = isnan(_592);
    bool _1195 = _1191 || _1193;
    bool _1197 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1199 = _1195 || _1197;
    float _1201 = float(_1199);
    bool _1203 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1205 = isnan(_592);
    bool _1207 = _1203 || _1205;
    bool _1209 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1211 = _1207 || _1209;
    float _1213 = float(_1211);
    float _1215 = _1029 * _1189;
    float _1217 = float(uint(_1039));
    float _1219 = _1201 * _1049;
    float _1221 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1223 = -_1201;
    float _1225 = _1223 + 1.0;
    int _1227 = _1035 * int(_1161);
    int _1229 = _1227 + _1079;
    float _1231 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1233 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1221);
    float _1235 = _1101 * _1225;
    float _1237 = float(uint(_1229));
    float _1239 = -_1101;
    float _1241 = _1239 + 1.0;
    float _1243 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1233);
    float _1245 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _893);
    float _1247 = fma(_1017, _1073, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1249 = as_type<float>(_672) * _1237;
    float _1251 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1253 = -_1181;
    float _1255 = _1253 + 1.0;
    float _1257 = _1181 * _1241;
    float _1259 = trunc(_1249);
    float _1261 = precise::max(_1259, 0.0);
    uint _1263 = uint(_1261);
    float _1265 = _1241;
    float _1267 = _1017;
    int _1269 = as_type<int>(_1249);
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    float _1273 = _1143;
    float _1275 = _1213;
    float _1277 = _1231;
    if (!_707)
    {
        _1265 = _604;
    }
    float _1279 = _1265;
    float _1281 = _1213 * _1255;
    float _1283 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1251);
    float _1285 = _1279;
    if (_707)
    {
        _1267 = _717;
    }
    float _1287 = _1267;
    float _1289 = _1051 * _1281;
    int _1291 = ~_614;
    int _1293 = _1291 + 1;
    float _1295 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1283);
    float _1297 = _1287;
    if (_853)
    {
        float _1299 = -_628;
        float _1301 = _1299 + 1.0;
        _1269 = as_type<int>(_1301);
    }
    int _1303 = _1269;
    if (!_707)
    {
        _1297 = _616;
    }
    float _1305 = _1297;
    if (!_707)
    {
        _1271 = _1279;
    }
    float _1307 = _1271;
    float _1309 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1311 = _1307;
    if (_707)
    {
        _1285 = _604;
    }
    float _1313 = _1285;
    float _1315 = -_1245;
    float _1317 = fma(_1243, _1143, _1315);
    int _1319 = int(_1161) + int(_1263);
    float _1321 = _1305 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1323 = _1313;
    if (!_861)
    {
        _1273 = _628;
    }
    float _1325 = _1273;
    float _1327 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1329 = _1325;
    if (_861)
    {
        float _1331 = _650 ? as_type<float>(_909) : _628;
        _1329 = _1331;
    }
    float _1333 = _1329;
    int _1335 = _1293 * _1319;
    int _1337 = _1335 + _1079;
    float _1339 = -_1309;
    float _1341 = fma(_1321, 2.0, _1339);
    float _1343 = -_1213;
    float _1345 = _1343 + 1.0;
    float _1347 = fma(_1327, _769, -0.5);
    if (!_707)
    {
        _1275 = _616;
    }
    float _1349 = _1275;
    float _1351 = -_122;
    float _1353 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1341);
    bool _1355 = uint(_1337) >= uint(_614);
    float _1357 = fma(_1345, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1289);
    float _1359 = fma(_1075, _1257, _1357);
    float _1361 = _1349;
    if (_707)
    {
        _1361 = _1313;
    }
    float _1363 = _1361;
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_853)
    {
        _1277 = _628;
    }
    float _1367 = _1277;
    float _1369 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1371 = _1367;
    if (_707)
    {
        _1311 = _717;
    }
    float _1373 = _1311;
    float _1375 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1365);
    if (_853)
    {
        float _1377 = _654 ? as_type<float>(_1303) : _628;
        _1371 = _1377;
    }
    float _1379 = _1371;
    float _1381 = fma(_1373, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1369);
    float _1383 = _1373 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1385 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1389 = !_1355;
    int _1391 = _1389 ? 0 : (-1);
    float _1393 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_707)
    {
        _690 = _1313;
    }
    float _1395 = _690;
    float _1397 = -_1387;
    float _1399 = fma(_1383, 2.0, _1397);
    int _1401 = ~_1319;
    int _1403 = _1401 + _1391;
    int _1405 = _1403 + 1;
    float _1407 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1393);
    float _1409 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1411 = as_type<float>(_672) * _1217;
    int _1413 = _614 * _1405;
    int _1415 = _1413 + _1079;
    float _1417 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1381);
    if (!_707)
    {
        _1323 = _717;
    }
    float _1419 = _1323;
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1423 = trunc(_1411);
    float _1425 = precise::max(_1423, 0.0);
    uint _1427 = uint(_1425);
    float _1429 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1431 = !_967;
    int _1433 = _1431 ? _1415 : (-1);
    float _1435 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1421);
    float _1437 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1439 = fma(_1429, _773, -0.5);
    int _1441 = _1433 >> 31;
    float _1443 = _1395 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1445 = _1409 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _1447 = ~_614;
    int _1449 = _1447 + 1;
    float _1451 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1435);
    int _1453 = _1441 & 3;
    float _1455 = fma(_1445, _1379, -0.5);
    float _1457 = fma(_1443, -2.0, _1437);
    float _1459 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1407);
    int _1461 = _1433 + _1453;
    int _1463 = _1449 * int(_1427);
    int _1465 = _1463 + _1039;
    float _1467 = -_122;
    float _1469 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1399);
    float _1471 = _1419 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1473 = _1461 >> 2;
    float _1475 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1457);
    float _1477 = float(uint(_1465));
    float _1479 = fma(_1081, _1235, _1359);
    float _1481 = fma(_1459, _1439, _857);
    float _1483 = _835 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1485 = fma(_1417, _1455, _1469);
    int _1487 = _1473 << 4;
    int _1489 = _1487 + 656;
    float _1491 = _829 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1493 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1495 = _1483 + _1493;
    float _1497 = as_type<float>(_672) * _1477;
    float _1499 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1501 = _865 + _1499;
    uint _1503 = uint(int(uint(_1489) >> uint(2)));
    uint _1505 = uint(int(uint(int(_1503)) >> uint(2)));
    int _1507 = int(_1503) & 3;
    float _1509 = (*spvDescriptorSet0.vp_c9)._m0[int(_1505)][_1507];
    int _1511 = int(_1503) + 1;
    uint _1513 = uint(int(uint(_1511) >> uint(2)));
    int _1515 = _1511 & 3;
    float _1517 = (*spvDescriptorSet0.vp_c9)._m0[int(_1513)][_1515];
    float _1519 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1521 = _1491 + _1519;
    float _1523 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1525 = _1433 & 3;
    bool _1527 = _1525 != 0;
    float _1529 = trunc(_1497);
    float _1531 = precise::max(_1529, 0.0);
    uint _1533 = uint(_1531);
    float _1535 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1523);
    bool _1537 = uint(_1525) > 1u;
    float _1539 = fma(_1105, _1219, _1479);
    int _1541 = _1433 & 3;
    bool _1543 = _1541 != 0;
    float _1545 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1535);
    float _1547 = fma(_1333, (*spvDescriptorSet0.vp_c9)._m0[90].x, -0.5);
    int _1549 = _1489 + 8;
    uint _1551 = uint(int(uint(_1549) >> uint(2)));
    uint _1553 = uint(int(uint(int(_1551)) >> uint(2)));
    int _1555 = int(_1551) & 3;
    float _1557 = (*spvDescriptorSet0.vp_c9)._m0[int(_1553)][_1555];
    int _1559 = int(_1551) + 1;
    uint _1561 = uint(int(uint(_1559) >> uint(2)));
    int _1563 = _1559 & 3;
    float _1565 = (*spvDescriptorSet0.vp_c9)._m0[int(_1561)][_1563];
    float _1567 = fma(_1111, _1215, _1539);
    float _1569 = fma(_1451, _1547, _1353);
    int _1571 = _1543 ? 0 : 1;
    float _1573 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[90].y, -0.5);
    float _1575 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _1577 = uint(_1525) >= 2u;
    float _1579 = fma(_1129, _1185, _1567);
    int _1581 = ~_1571;
    int _1583 = _1581 + 1;
    int _1585 = _1583 + 1;
    float _1587 = fma(_1471, -2.0, _1575);
    int _1589 = _1585;
    float _1591 = _1573;
    if (!_1537)
    {
        int _1593 = ~_1571;
        int _1595 = _1593 + 1;
        _1589 = _1595;
    }
    int _1597 = _1589;
    float _1599 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1375);
    bool _1601 = _1525 != 3;
    float _1603 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1587);
    int _1605 = ~_614;
    int _1607 = _1605 + 1;
    float _1609 = fma(_1247, _1183, _1579);
    int _1611 = int(_1427) + int(_1533);
    float _1613 = -_1475;
    float _1615 = fma(_1599, _1347, _1613);
    float _1617 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1609);
    int _1619 = _1577 ? 0 : 1;
    float _1621 = _1317 + 0.5;
    int _1623 = abs(_1597);
    int _1625 = _1607 * _1611;
    int _1627 = _1625 + _1039;
    bool _1629 = !_1527;
    int _1631 = _1629 ? 0 : 1;
    float _1633 = _1481 + 0.5;
    int _1635 = ~_1619;
    int _1637 = _1635 + 1;
    int _1639 = _1637 + 1;
    out.m_59.x = _1617;
    bool _1641 = _1525 != 3;
    int _1643 = _1639;
    if (_1601)
    {
        int _1645 = ~_1619;
        int _1647 = _1645 + 1;
        _1643 = _1647;
    }
    int _1649 = _1643;
    int _1651 = ~_1623;
    int _1653 = _1651 + 1;
    int _1655 = _1653 + 1;
    int _1657 = abs(_1631);
    bool _1659 = uint(_1627) >= uint(_614);
    int _1661 = _1655 * as_type<int>(_1517);
    bool _1663 = !_1641;
    int _1665 = _1663 ? 0 : (-1);
    int _1667 = abs(_1649);
    bool _1669 = !_845;
    int _1671 = _1669 ? 0 : 1;
    int _1673 = abs(_1665);
    int _1675 = ~_1657;
    int _1677 = _1675 + 1;
    int _1679 = _1677 + 1;
    bool _1681 = !_1659;
    int _1683 = _1681 ? 0 : (-1);
    int _1685 = _1679 * as_type<int>(_1509);
    int _1687 = _1685 + _1661;
    int _1689 = abs(_1671);
    int _1691 = ~_1667;
    int _1693 = _1691 + 1;
    int _1695 = _1693 + 1;
    int _1697 = ~_1611;
    int _1699 = _1697 + _1683;
    int _1701 = _1699 + 1;
    int _1703 = ~_1673;
    int _1705 = _1703 + 1;
    int _1707 = _1705 + 1;
    int _1709 = _1695 * as_type<int>(_1557);
    int _1711 = _1709 + _1687;
    bool _1713 = _1545 >= 0.0;
    int _1715 = _614 * _1701;
    int _1717 = _1715 + _1039;
    float _1719 = _1495 * _1495;
    int _1721 = _1707 * as_type<int>(_1565);
    int _1723 = _1721 + _1711;
    float _1725 = -_1603;
    float _1727 = fma(_1295, _1573, _1725);
    float _1729 = fma(_1521, _1521, _1719);
    int _1731 = ~_1689;
    int _1733 = _1731 + 1;
    int _1735 = _1733 + 1;
    float _1737 = _1485 + 0.5;
    bool _1739 = !_967;
    int _1741 = _1739 ? _1717 : (-1);
    float _1743 = fma(_1501, _1501, _1729);
    float _1745 = _1727 + 0.5;
    int _1747 = _1723 * _1735;
    if (_1713)
    {
        _1591 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1749 = _1591;
    float _1751 = rsqrt(_1743);
    int _1753 = as_type<int>(_1749);
    if (_1713)
    {
        out.m_45.x = 0.0;
    }
    int _1755 = _1741 * _1689;
    int _1757 = _1755 + _1747;
    float _1759 = _1569 + 0.5;
    float _1761 = _1615 + 0.5;
    if (_1713)
    {
        float _1763 = _1749 * 5.0;
        _1753 = as_type<int>(_1763);
    }
    int _1765 = _1753;
    float _1767 = float(_1757);
    out.m_61.x = _1759;
    out.m_61.y = _1745;
    out.m_63.x = _1633;
    out.m_63.y = _1621;
    out.m_63.z = _1737;
    out.m_63.w = _1761;
    float _1769 = as_type<float>(_1765);
    if (_1713)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5173 = as_type<float>(_1765);
        out.gl_Position.z = _5173;
    }
    float _1771 = _1495 * _1751;
    float _1773 = _1521 * _1751;
    out.m_65.z = _1767;
    if (_1713)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1775 = -_1771;
    float _1777 = fma(_1775, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1483);
    float _1779 = _1501 * _1751;
    float _1781 = -_1773;
    float _1783 = fma(_1781, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1491);
    float _1785 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1787 = _1777 + _1785;
    float _1789 = -_1779;
    float _1791 = fma(_1789, (*spvDescriptorSet0.vp_c9)._m0[18].w, _865);
    float _1793 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1795 = _1783 + _1793;
    float _1797 = _1787 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1799 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1801 = _1791 + _1799;
    float _1803 = fma(_1795, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1797);
    float _1805 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1803);
    bool _1807 = _1805 >= 0.0;
    float _1809 = _1787;
    if (_1807)
    {
        _1769 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1811 = _1769;
    int _1813 = as_type<int>(_1811);
    if (_1807)
    {
        out.m_45.x = 0.0;
    }
    if (_1807)
    {
        float _1815 = _1811 * 5.0;
        _1813 = as_type<int>(_1815);
    }
    int _1817 = _1813;
    if (_1807)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5272 = as_type<float>(_1817);
        out.gl_Position.z = _5272;
    }
    if (_1807)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1819 = -_1483;
    float _1821 = _1819 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1823 = -_1491;
    float _1825 = _1823 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1827 = -_865;
    float _1829 = _1827 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1831 = -_1771;
    float _1833 = fma(_1831, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1495);
    float _1835 = _1821 * _1821;
    float _1837 = -_1773;
    float _1839 = fma(_1837, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1521);
    float _1841 = -_1779;
    float _1843 = fma(_1841, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1501);
    float _1845 = _1833 * _1833;
    float _1847 = fma(_1825, _1825, _1835);
    bool _1849 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1851 = isnan(0.5);
    bool _1853 = _1849 || _1851;
    bool _1855 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1857 = _1853 || _1855;
    float _1859 = fma(_1839, _1839, _1845);
    float _1861 = fma(_1829, _1829, _1847);
    float _1863 = in.m_49.x;
    float _1865 = in.m_49.y;
    float _1867 = in.m_49.z;
    float _1869 = fma(_1843, _1843, _1859);
    float _1871 = rsqrt(_1861);
    float _1873 = _1825 * _1871;
    float _1875 = _1829 * _1871;
    float _1877 = _1821 * _1871;
    float _1879 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1881 = _1873 * _1879;
    float _1883 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1885 = _1875 * _1883;
    float _1887 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1889 = _1877 * _1887;
    float _1891 = _1865 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1893 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1895 = -_1881;
    float _1897 = fma(_1875, _1893, _1895);
    float _1899 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1901 = -_1885;
    float _1903 = fma(_1877, _1899, _1901);
    float _1905 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1907 = -_1889;
    float _1909 = fma(_1873, _1905, _1907);
    float _1911 = in.m_67.x;
    float _1913 = in.m_67.y;
    float _1915 = in.m_67.z;
    float _1917 = _1897 * _1897;
    float _1919 = sqrt(_1869);
    float _1921 = _1863 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1923 = _1867 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1925 = fma(_1903, _1903, _1917);
    float _1927 = _1921 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1929 = _1923 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1931 = fma(_1909, _1909, _1925);
    float _1933 = rsqrt(_1931);
    float _1935 = _1751 * _1919;
    float _1937 = _1891 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1939 = _1935 * _1927;
    float _1941 = _1935 * _1937;
    float _1943 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1913);
    float _1945 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1911);
    float _1947 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1915);
    float _1949 = _1935 * _1929;
    float _1951 = _1943 * _1941;
    float _1953 = _1945 * _1939;
    float _1955 = _1903 * _1933;
    float _1957 = _1897 * _1933;
    float _1959 = _1909 * _1933;
    float _1961 = _1947 * _1949;
    float _1963 = _1877 * _1955;
    float _1965 = _1875 * _1957;
    float _1967 = -_1963;
    float _1969 = fma(_1873, _1957, _1967);
    float _1971 = -_1965;
    float _1973 = fma(_1877, _1959, _1971);
    float _1975 = _1951 * _1969;
    float _1977 = _1951 * _1973;
    float _1979 = fma(_1953, _1959, _1975);
    float _1981 = fma(_1953, _1955, _1977);
    float _1983 = fma(_1961, _1875, _1979);
    float _1985 = fma(_1961, _1873, _1981);
    float _1987 = _1873 * _1959;
    float _1989 = _865 + _1983;
    float _1991 = _1491 + _1985;
    float _1993 = -_1987;
    float _1995 = fma(_1875, _1955, _1993);
    float _1997 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1999 = _1989 + _1997;
    float _2001 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2003 = _1991 + _2001;
    float _2005 = _1951 * _1995;
    float _2007 = _1999 * _1999;
    float _2009 = fma(_1953, _1957, _2005);
    float _2011 = fma(_2003, _2003, _2007);
    float _2013 = fma(_1961, _1877, _2009);
    float _2015 = sqrt(_2011);
    float _2017 = _1483 + _2013;
    bool _2019 = _2015 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2021 = _1877;
    float _2023 = _1987;
    float _2025 = _1991;
    if (!_2019)
    {
        _2021 = _1991;
    }
    float _2027 = _2021;
    float _2029 = _2027;
    if (!_2019)
    {
        _2023 = _1989;
    }
    float _2031 = _2023;
    float _2033 = _2031;
    if (!_2019)
    {
        _2025 = _2017;
    }
    float _2035 = _2025;
    bool _2037 = !_2019;
    float _2039 = _2035;
    if (!_2037)
    {
        float _2041 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2043 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2045 = _2015 + _2043;
        float _2047 = rsqrt(_2011);
        float _2049 = _2045 * _2041;
        float _2051 = _2017 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2053 = _2049 * 0.15915493667125701904296875;
        float _2055 = _2053 * 6.283185482025146484375;
        float _2057 = cos(_2055);
        float _2059 = _2053 * 6.283185482025146484375;
        float _2061 = sin(_2059);
        float _2063 = _2057 + (-1.0);
        float _2065 = fma(_2061, _2051, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2067 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2069 = _2047 * _2065;
        float _2071 = fma(_2017, _2057, _2067);
        float _2073 = fma(_2003, _2069, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2075 = fma(_1999, _2069, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2029 = _2073;
        _2039 = _2071;
        _2033 = _2075;
    }
    float _2077 = _2029;
    float _2079 = _2039;
    float _2081 = _2033;
    float _2083 = -_1773;
    float _2085 = fma(_2083, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2077);
    float _2087 = -_1771;
    float _2089 = fma(_2087, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2079);
    float _2091 = -_1779;
    float _2093 = fma(_2091, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2081);
    float _2095 = _2089;
    float _2097 = _2085;
    float _2099 = _2093;
    float _2101 = _2081;
    if (!_1857)
    {
        float _2103 = _1787 * _1787;
        float _2105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2107 = -_1483;
        float _2109 = _2107 + _2079;
        float _2111 = fma(_1795, _1795, _2103);
        float _2113 = fma(_1801, _1801, _2111);
        float _2115 = 1.0 / _1935;
        float _2117 = sqrt(_2113);
        float _2119 = precise::min(_2117, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2121 = _2119 * _2105;
        float _2123 = -_1491;
        float _2125 = _2123 + _2077;
        float _2127 = _2121 * _2115;
        float _2129 = -_865;
        float _2131 = _2129 + _2081;
        float _2133 = fma(_2125, _2127, _1783);
        float _2135 = fma(_2109, _2127, _1777);
        float _2137 = fma(_2131, _2127, _1791);
        _2095 = _2135;
        _2097 = _2133;
        _2099 = _2137;
        _1809 = _2117;
    }
    float _2139 = _2095;
    float _2141 = _2097;
    float _2143 = _2099;
    float _2145 = _1809;
    float _2147 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2149 = _2139 + _2147;
    float _2151 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2153 = _2141 + _2151;
    float _2155 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2157 = _2143 + _2155;
    float _2159 = _2149 * _2149;
    float _2161 = fma(_2153, _2153, _2159);
    float _2163 = fma(_2157, _2157, _2161);
    float _2165 = rsqrt(_2163);
    float _2167 = _2165 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2169 = _2153 * _2167;
    float _2171 = _2157 * _2167;
    float _2173 = _2169 * _2169;
    float _2175 = _2171 * _2171;
    float _2177 = _2173 + _2175;
    float _2179 = sqrt(_2177);
    bool _2181 = _2179 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2185 = _2179 + _2183;
    float _2187 = _2145;
    float _2189 = _2177;
    float _2191 = _2185;
    float _2193 = _2149;
    float _2195 = _2167;
    float _2197 = _2169;
    if (_2181)
    {
        float _2199 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2187 = _2199;
    }
    float _2201 = _2187;
    if (_2181)
    {
        float _2203 = rsqrt(_2177);
        _2189 = _2203;
    }
    float _2205 = _2189;
    float _2207 = _2201;
    if (_2181)
    {
        float _2209 = _2185 * _2201;
        _2191 = _2209;
    }
    float _2211 = _2191;
    if (_2181)
    {
        float _2213 = _2211 * 0.15915493667125701904296875;
        _2207 = _2213;
    }
    float _2215 = _2207;
    float _2217 = _2165;
    float _2219 = _2215;
    if (_2181)
    {
        float _2221 = _2215 * 6.283185482025146484375;
        float _2223 = sin(_2221);
        _2217 = _2223;
    }
    float _2225 = _2217;
    float _2227 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2229 = precise::max(0.0, _2227);
    float _2231 = _2157;
    float _2233 = _2229;
    if (_2181)
    {
        float _2235 = _2215 * 6.283185482025146484375;
        float _2237 = cos(_2235);
        _2231 = _2237;
    }
    float _2239 = _2231;
    float _2241 = -_2167;
    float _2243 = -_2229;
    float _2245 = fma(_2149, _2241, _2243);
    if (_2181)
    {
        float _2247 = _2245 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2193 = _2247;
    }
    float _2249 = _2193;
    float _2251 = _2249;
    if (!_2181)
    {
        _2219 = _2173;
    }
    float _2253 = _2219;
    float _2255 = _2225;
    float _2257 = _2253;
    if (_2181)
    {
        float _2259 = fma(_2225, _2249, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2251 = _2259;
    }
    float _2261 = _2251;
    float _2263 = _2261;
    if (!_2181)
    {
        _2255 = _2245;
    }
    float _2265 = _2255;
    float _2267 = _2265;
    if (_2181)
    {
        float _2269 = _2239 + (-1.0);
        _2233 = _2269;
    }
    float _2271 = _2233;
    float _2273 = _2271;
    if (_2181)
    {
        float _2275 = _2205 * _2261;
        _2101 = _2275;
    }
    float _2277 = _2101;
    if (!_2181)
    {
        _2263 = _2171;
    }
    float _2279 = _2263;
    float _2281 = sqrt(_2163);
    float _2283 = _2279;
    if (_2181)
    {
        float _2285 = _2271 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2195 = _2285;
    }
    float _2287 = _2195;
    if (_2181)
    {
        float _2289 = _2169 * _2277;
        _2197 = _2289;
    }
    float _2291 = _2197;
    if (_2181)
    {
        float _2293 = _2171 * _2277;
        _2283 = _2293;
    }
    float _2295 = _2283;
    if (!_2181)
    {
        _2273 = _2175;
    }
    float _2297 = _2273;
    float _2299 = _2297;
    if (_2181)
    {
        float _2301 = fma(_2245, _2239, _2287);
        _2267 = _2301;
    }
    float _2303 = _2267;
    if (_2181)
    {
        float _2305 = _2291 * _2291;
        _2257 = _2305;
    }
    float _2307 = _2257;
    if (_2181)
    {
        float _2309 = _2295 * _2295;
        _2299 = _2309;
    }
    float _2311 = _2299;
    float _2313 = _2139 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2315 = fma(_2303, _2303, _2307);
    float _2317 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2319 = _2315 + _2311;
    float _2321 = _2139 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2323 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2325 = fma(_2281, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2323);
    float _2327 = precise::clamp(_2325, 0.0, 1.0);
    float _2329 = rsqrt(_2319);
    float _2331 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2321);
    float _2333 = _2139 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2335 = -_2327;
    float _2337 = _2335 + 1.0;
    float _2339 = _2139 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2341 = fma(_2143, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2331);
    float _2343 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2333);
    float _2345 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2339);
    float _2347 = _2341 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2349 = fma(_2143, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2343);
    float _2351 = abs(_2337);
    float _2353 = log2(_2351);
    float _2355 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2313);
    float _2357 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2359 = fma(_2143, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2345);
    float _2361 = _2349 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2363 = _2329 * _2291;
    float _2365 = -_2357;
    float _2367 = fma(_2365, _2317, 1.0);
    float _2369 = fma(_2143, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2355);
    float _2371 = _2359 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2373 = _2361 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2375 = _2329 * _2303;
    float _2377 = _2363 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2379 = _2329 * _2295;
    float _2381 = fma(_2371, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2373);
    float _2383 = _2369 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2385 = -_2377;
    float _2387 = fma(_2375, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2385);
    float _2389 = _2353 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2391 = fma(_2347, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2381);
    float _2393 = _2361 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2395 = -_2379;
    float _2397 = fma(_2395, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2387);
    float _2399 = log2(_2367);
    float _2401 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2391);
    float _2403 = _2361 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2405 = fma(_2397, -0.5, 0.5);
    float _2407 = fma(_2371, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2393);
    float _2409 = _2375 + 1.0;
    float _2411 = fma(_2371, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2403);
    float _2413 = fma(_2397, 0.5, 0.5);
    float _2415 = exp2(_2389);
    float _2417 = fma(_2347, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2407);
    float _2419 = fma(_2347, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2411);
    float _2421 = fma(_2413, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2423 = fma(_2413, _2421, -0.212114393711090087890625);
    float _2425 = 1.0 / _2401;
    float _2427 = _2399 * 0.693147182464599609375;
    float _2429 = fma(_2413, _2423, 1.570728778839111328125);
    float _2431 = _2427 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2433 = sqrt(_2405);
    float _2435 = -_2375;
    float _2437 = fma(_2415, _2409, _2435);
    float _2439 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2417);
    float _2441 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2419);
    float _2443 = _2439 * _2425;
    float _2445 = _2441 * _2425;
    float _2447 = fma(_2443, 0.5, 0.5);
    float _2449 = fma(_2445, -0.5, 0.5);
    float _2451 = fma(_2437, 0.5, 0.5);
    float _2453 = _2433 * 0.636619746685028076171875;
    float3 _6297 = float3(_2447, _2449, _2431);
    float _2455 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6297, float3(0.0), isnan(_6297)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6297, float3(0.0), isnan(_6297)), level(0.0)).x;
    float3 _6308 = float3(_2447, _2449, _2431);
    float4 _2458 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6308, float3(0.0), isnan(_6308)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6308, float3(0.0), isnan(_6308)), level(0.0)).xyzw;
    float _2460 = _2458.x;
    float _2462 = _2458.y;
    float _2464 = _2458.z;
    float _2466 = _2458.w;
    float _2468 = -_2429;
    float _2470 = fma(_2453, _2468, 1.0);
    float2 _6330 = float2(_2470, _2451);
    float3 _2474 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6330, float2(0.0), isnan(_6330)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6330, float2(0.0), isnan(_6330)), level(0.0)).xyz;
    float _2476 = _2474.x;
    float _2478 = _2474.y;
    float _2480 = _2474.z;
    float _2482 = _2361 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2484 = _2353 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2486 = _2439 + _2401;
    float _2488 = fma(_2371, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2482);
    float _2490 = _2486 * 0.5;
    float _2492 = exp2(_2484);
    float _2494 = fma(_2347, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2488);
    float _2496 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2494);
    float _2498 = _2401 * 0.5;
    float _2500 = _2496 + _2401;
    float _2502 = -_2492;
    float _2504 = _2502 + 1.0;
    float _2506 = fma(_2441, -0.5, _2498);
    float _2508 = _2500 * 0.5;
    float _2510 = _2504 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2439;
    out.gl_Position.y = _2441;
    out.gl_Position.z = _2496;
    out.gl_Position.w = _2401;
    float _2512 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _2490;
    out.m_69.y = _2506;
    out.m_69.z = _2508;
    out.m_69.w = _2401;
    out.m_45.x = _2512;
    float _2514 = _2510 * _2455;
    float _2516 = -_2510;
    float _2518 = _2516 + 1.0;
    float _2520 = _2466 * _2514;
    float _2522 = _2480 * _2514;
    float _2524 = fma(_2476, _2520, _2460);
    float _2526 = fma(_2478, _2520, _2462);
    float _2528 = _2466 * _2518;
    float _2530 = fma(_2466, _2522, _2464);
    out.m_71.x = _2524;
    out.m_71.y = _2526;
    out.m_71.z = _2530;
    out.m_71.w = _2528;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _584 = false;
    bool _454 = false;
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
    if (!_94)
    {
        out.m_45.x = 0.0;
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
        float _2586 = as_type<float>(_104);
        out.gl_Position.z = _2586;
    }
    if (!_94)
    {
        return out;
    }
    float _108 = in.m_47.w;
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
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2655 = as_type<float>(_142);
        out.gl_Position.z = _2655;
    }
    if (_134)
    {
        return out;
    }
    float _144 = in.m_49.w;
    float _146 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
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
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
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
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _298 = _294 + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _308 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _310 = isnan(_294);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _324 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _326 = isnan(_294);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = 1.0 / _302;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _338;
    float _342 = -_318;
    float _344 = _342 + 1.0;
    bool _346 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _348 = isnan(_294);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    bool _358 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _360 = 1.0 / _306;
    float _362 = 1.0 / _322;
    float _364 = _340 * _336;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _370 = _334 * _344;
    float _372 = -_334;
    float _374 = _372 + 1.0;
    float _376 = fma(_364, _298, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _378;
    float _382 = _356 * _374;
    float _384 = _368 * _360;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _388 = _294 + _386;
    bool _390 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _392 = isnan(_294);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = _376 * _382;
    float _404 = -_356;
    float _406 = _404 + 1.0;
    float _408 = fma(_384, _388, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _412 = _294 + _410;
    float _414 = _380 * _362;
    float _416 = -_400;
    float _418 = _416 + 1.0;
    float _420 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[115].x, _402);
    float _422 = fma(_414, _412, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _424 = _318 * _418;
    float _426 = fma(_408, _370, _420);
    float _428 = fma(_422, _424, _426);
    float _430 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[118].x, _428);
    float _432 = _430 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.w = _432;
    bool _434 = !_358;
    float _452;
    if (!_434)
    {
        float _436 = in.m_51.x;
        float _438 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _440 = _436 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _442 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _444 = _442 * _438;
        float _446 = floor(_444);
        float _448 = -_446;
        float _450 = _444 + _448;
        _452 = _450;
        _454 = true;
    }
    else
    {
        float _456 = float(_90);
        float _458 = 1.0 / _456;
        float _460 = _122 * _458;
        _452 = _460;
    }
    _454 = false;
    float _462 = _452;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _466 = _462 + _464;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _472 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _474 = isnan(_462);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _488 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _490 = isnan(_462);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _496 = _492 || _494;
    float _498 = float(_496);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _500;
    bool _504 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _506 = isnan(_462);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = 1.0 / _470;
    float _518 = -_482;
    float _520 = _518 + 1.0;
    bool _522 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _524 = _498 * _520;
    float _526 = -_498;
    float _528 = _526 + 1.0;
    float _530 = 1.0 / _486;
    float _532 = _502 * _516;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _538 = fma(_532, _466, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _540 = _536 * _530;
    float _542 = _538 * _524;
    float _544 = -_514;
    float _546 = _544 + 1.0;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _550 = _462 + _548;
    float _552 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[131].x, _542);
    float _554 = _482 * _546;
    float _556 = fma(_540, _550, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _558 = fma(_556, _554, _552);
    float _560 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[133].x, _558);
    float _562 = _560 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_55.w = _562;
    bool _564 = !_522;
    float _582;
    if (!_564)
    {
        float _566 = in.m_51.x;
        float _568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _570 = _566 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _572 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[14].x, _122);
        float _574 = _572 * _568;
        float _576 = floor(_574);
        float _578 = -_576;
        float _580 = _574 + _578;
        _582 = _580;
        _584 = true;
    }
    else
    {
        float _586 = float(_90);
        float _588 = 1.0 / _586;
        float _590 = _122 * _588;
        _582 = _590;
    }
    _584 = false;
    float _592 = _582;
    float _594 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _596 = int(_594);
    float _598 = in.m_57.y;
    float _600 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _602 = float(_90);
    float _604 = in.m_51.y;
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _608 = _606 != 0;
    float _610 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _612 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _614 = int(_612);
    float _616 = in.m_51.z;
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _620 = _618 != 0;
    float _622 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _610);
    int _624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _626 = _624 != 0;
    float _628 = in.m_57.x;
    float _630 = float(_596);
    float _632 = 1.0 / _602;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _638 = float(uint(_614));
    float _640 = 1.0 / _630;
    int _642 = ~_614;
    int _644 = _642 + 1;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _650 = _604 > 0.5;
    float _652 = 1.0 / _638;
    bool _654 = _616 > 0.5;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _664 = float(_614);
    float _666 = _122 * _640;
    float _668 = 1.0 / _636;
    float _670 = in.m_51.w;
    int _672 = as_type<int>(_652) + (-2);
    float _674 = trunc(_666);
    int _676 = int(_674);
    float _678 = 1.0 / _648;
    float _680 = float(uint(_676));
    float _682 = 1.0 / _658;
    bool _684 = _670 > 0.5;
    float _686 = _670;
    float _688 = _598;
    float _690 = _616;
    if (!_608)
    {
        _686 = _628;
    }
    float _692 = _686;
    float _694 = as_type<float>(_672) * _680;
    float _696 = trunc(_694);
    float _698 = precise::max(_696, 0.0);
    uint _701 = uint(_698);
    float _703 = 1.0 / _662;
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _707 = _705 != 0;
    int _709 = _644 * int(_701);
    int _711 = _709 + _676;
    bool _713 = !_707;
    float _715 = _713 ? 5.839270114898681640625 : 1.0;
    float _717 = in.m_51.x;
    float _719 = float(uint(_711));
    float _721 = as_type<float>(_672) * _719;
    float _723 = -_598;
    float _725 = _723 + 1.0;
    float _727 = trunc(_721);
    float _729 = precise::max(_727, 0.0);
    uint _731 = uint(_729);
    int _733 = _650 ? as_type<int>(_725) : as_type<int>(_598);
    float _735 = _620 ? as_type<float>(_733) : _598;
    int _737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _739 = _737 != 0;
    int _741 = _654 ? as_type<int>(_725) : as_type<int>(_598);
    float _743 = _739 ? as_type<float>(_741) : _598;
    int _745 = _741;
    bool _747 = _739;
    float _749 = _692;
    if (_608)
    {
        float _751 = -_628;
        float _753 = _751 + 1.0;
        _745 = as_type<int>(_753);
    }
    int _755 = _745;
    if (_608)
    {
        bool _757 = _717 > 0.5;
        _747 = _757;
    }
    bool _759 = _747;
    int _761 = int(_701) + int(_731);
    int _763 = ~_614;
    int _765 = _763 + 1;
    if (_626)
    {
        float _767 = _684 ? _725 : _598;
        _688 = _767;
    }
    float _769 = _688;
    if (_608)
    {
        float _771 = _759 ? as_type<float>(_755) : _628;
        _749 = _771;
    }
    float _773 = _749;
    int _775 = _765 * _761;
    int _777 = _775 + _676;
    bool _779 = uint(_777) >= uint(_614);
    float _781 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _787 = _785 != 0;
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _791 = _789 != 0;
    int _793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _795 = _793 != 0;
    float _797 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _781);
    bool _799 = !_779;
    int _801 = _799 ? 0 : (-1);
    float _803 = _717 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _807 = _805 != 0;
    float _809 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _600);
    bool _811 = !_791;
    int _813 = _811 ? 0 : 1;
    float _815 = _604 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _817 = !_787;
    int _819 = _817 ? 0 : 1;
    float _821 = -_783;
    float _823 = fma(_803, 2.0, _821);
    bool _825 = !_795;
    int _827 = _825 ? 0 : 1;
    float _829 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].z, _797);
    bool _831 = !_807;
    int _833 = _831 ? 0 : 1;
    float _835 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].z, _809);
    int _837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _839 = _837 != 0;
    float _841 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].z, _622);
    int _843 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _845 = _843 != 0;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _847;
    int _851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _853 = _851 != 0;
    float _855 = -_122;
    float _857 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[76].x, _823);
    int _859 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _861 = _859 != 0;
    float _863 = _849 * _668;
    float _865 = _841 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _867 = float(_676);
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _871 = ~_761;
    int _873 = _871 + _801;
    int _875 = _873 + 1;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _879 = _877 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _881 = _867 >= _664;
    bool _883 = isnan(_867);
    bool _885 = _881 || _883;
    bool _887 = isnan(_664);
    bool _889 = _885 || _887;
    float _891 = float(_889);
    float _893 = fma(_815, -2.0, _869);
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _897 = _895 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _899 = !_707;
    float _901 = _899 ? _616 : _717;
    int _903 = 0;
    if (_861)
    {
        float _905 = -_628;
        float _907 = _905 + 1.0;
        _903 = as_type<int>(_907);
    }
    int _909 = _903;
    float _911 = 1.0 / _879;
    float _913 = _901 * _715;
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _917 = _915 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _919 = abs(_819);
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _925 = floor(_913);
    float _927 = _917 * _678;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _931 = _929 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _933 = _931 * _703;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _937 = _935 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _939 = 1.0 / _897;
    float _941 = trunc(_891);
    int _943 = int(_941);
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _945;
    float _949 = -_925;
    float _951 = _913 + _949;
    bool _953 = !_839;
    int _955 = _953 ? 0 : 1;
    float _957 = _947 * _682;
    float _959 = _951 * _664;
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _961;
    float _965 = _122 * _664;
    bool _967 = _614 == 0;
    float _969 = 1.0 / _923;
    float _971 = _963 * _911;
    float _973 = _937 * _939;
    int _975 = _614 * _875;
    int _977 = _975 + _676;
    float _979 = _965 * _632;
    int _981 = ~_943;
    int _983 = _981 + 1;
    int _985 = _983 + 1;
    float _987 = trunc(_959);
    int _989 = int(_987);
    bool _991 = !_967;
    int _993 = _991 ? _977 : (-1);
    int _995 = _614 + (-1);
    int _997 = abs(_813);
    int _999 = _993 * _985;
    int _1001 = abs(_955);
    float _1003 = trunc(_979);
    int _1005 = int(_1003);
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1007;
    int _1011 = _943 * _995;
    int _1013 = _1011 + _999;
    int _1015 = abs(_833);
    float _1017 = _1009 * _969;
    bool _1019 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1021 = isnan(_592);
    bool _1023 = _1019 || _1021;
    bool _1025 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1027 = _1023 || _1025;
    float _1029 = float(_1027);
    int _1031 = _1013 * _997;
    int _1033 = ~_614;
    int _1035 = _1033 + 1;
    int _1037 = _989 * _1001;
    int _1039 = _1037 + _676;
    int _1041 = abs(_827);
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1045 = _592 + _1043;
    float _1047 = -_1029;
    float _1049 = _1047 + 1.0;
    float _1051 = fma(_863, _1045, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _1053 = _1005 * _919;
    int _1055 = _1053 + _1031;
    float _1057 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1061 = _592 + _1059;
    float _1063 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1065 = _592 + _1063;
    int _1067 = _1039 * _1041;
    int _1069 = _1067 + _1055;
    float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1073 = _592 + _1071;
    float _1075 = fma(_927, _1065, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _1077 = _989 * _1015;
    int _1079 = _1077 + _1069;
    float _1081 = fma(_957, _1061, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1085 = _592 + _1083;
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1089 = _592 + _1087;
    bool _1091 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1093 = isnan(_592);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1099 = _1095 || _1097;
    float _1101 = float(_1099);
    float _1103 = float(uint(_1079));
    float _1105 = fma(_933, _1085, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1109 = _592 + _1107;
    float _1111 = fma(_971, _1089, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1113 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1115 = as_type<float>(_672) * _1103;
    bool _1117 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1119 = isnan(_592);
    bool _1121 = _1117 || _1119;
    bool _1123 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1125 = _1121 || _1123;
    float _1127 = float(_1125);
    float _1129 = fma(_973, _1109, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _1131 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1133 = isnan(_592);
    bool _1135 = _1131 || _1133;
    bool _1137 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1139 = _1135 || _1137;
    float _1141 = float(_1139);
    float _1143 = fma(_1113, _735, -0.5);
    bool _1145 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1147 = isnan(_592);
    bool _1149 = _1145 || _1147;
    bool _1151 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1153 = _1149 || _1151;
    float _1155 = float(_1153);
    float _1157 = trunc(_1115);
    float _1159 = precise::max(_1157, 0.0);
    uint _1161 = uint(_1159);
    float _1163 = -_1127;
    float _1165 = _1163 + 1.0;
    float _1167 = -_1141;
    float _1169 = _1167 + 1.0;
    bool _1171 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1173 = isnan(_592);
    bool _1175 = _1171 || _1173;
    bool _1177 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1179 = _1175 || _1177;
    float _1181 = float(_1179);
    float _1183 = _1141 * _1165;
    float _1185 = _1155 * _1169;
    float _1187 = -_1155;
    float _1189 = _1187 + 1.0;
    bool _1191 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1193 = isnan(_592);
    bool _1195 = _1191 || _1193;
    bool _1197 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1199 = _1195 || _1197;
    float _1201 = float(_1199);
    bool _1203 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1205 = isnan(_592);
    bool _1207 = _1203 || _1205;
    bool _1209 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1211 = _1207 || _1209;
    float _1213 = float(_1211);
    float _1215 = _1029 * _1189;
    float _1217 = float(uint(_1039));
    float _1219 = _1201 * _1049;
    float _1221 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1223 = -_1201;
    float _1225 = _1223 + 1.0;
    int _1227 = _1035 * int(_1161);
    int _1229 = _1227 + _1079;
    float _1231 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1233 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1221);
    float _1235 = _1101 * _1225;
    float _1237 = float(uint(_1229));
    float _1239 = -_1101;
    float _1241 = _1239 + 1.0;
    float _1243 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1233);
    float _1245 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _893);
    float _1247 = fma(_1017, _1073, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1249 = as_type<float>(_672) * _1237;
    float _1251 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1253 = -_1181;
    float _1255 = _1253 + 1.0;
    float _1257 = _1181 * _1241;
    float _1259 = trunc(_1249);
    float _1261 = precise::max(_1259, 0.0);
    uint _1263 = uint(_1261);
    float _1265 = _1241;
    float _1267 = _1017;
    int _1269 = as_type<int>(_1249);
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    float _1273 = _1143;
    float _1275 = _1213;
    float _1277 = _1231;
    if (!_707)
    {
        _1265 = _604;
    }
    float _1279 = _1265;
    float _1281 = _1213 * _1255;
    float _1283 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1251);
    float _1285 = _1279;
    if (_707)
    {
        _1267 = _717;
    }
    float _1287 = _1267;
    float _1289 = _1051 * _1281;
    int _1291 = ~_614;
    int _1293 = _1291 + 1;
    float _1295 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1283);
    float _1297 = _1287;
    if (_853)
    {
        float _1299 = -_628;
        float _1301 = _1299 + 1.0;
        _1269 = as_type<int>(_1301);
    }
    int _1303 = _1269;
    if (!_707)
    {
        _1297 = _616;
    }
    float _1305 = _1297;
    if (!_707)
    {
        _1271 = _1279;
    }
    float _1307 = _1271;
    float _1309 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1311 = _1307;
    if (_707)
    {
        _1285 = _604;
    }
    float _1313 = _1285;
    float _1315 = -_1245;
    float _1317 = fma(_1243, _1143, _1315);
    int _1319 = int(_1161) + int(_1263);
    float _1321 = _1305 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1323 = _1313;
    if (!_861)
    {
        _1273 = _628;
    }
    float _1325 = _1273;
    float _1327 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1329 = _1325;
    if (_861)
    {
        float _1331 = _650 ? as_type<float>(_909) : _628;
        _1329 = _1331;
    }
    float _1333 = _1329;
    int _1335 = _1293 * _1319;
    int _1337 = _1335 + _1079;
    float _1339 = -_1309;
    float _1341 = fma(_1321, 2.0, _1339);
    float _1343 = -_1213;
    float _1345 = _1343 + 1.0;
    float _1347 = fma(_1327, _769, -0.5);
    if (!_707)
    {
        _1275 = _616;
    }
    float _1349 = _1275;
    float _1351 = -_122;
    float _1353 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1341);
    bool _1355 = uint(_1337) >= uint(_614);
    float _1357 = fma(_1345, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1289);
    float _1359 = fma(_1075, _1257, _1357);
    float _1361 = _1349;
    if (_707)
    {
        _1361 = _1313;
    }
    float _1363 = _1361;
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_853)
    {
        _1277 = _628;
    }
    float _1367 = _1277;
    float _1369 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1371 = _1367;
    if (_707)
    {
        _1311 = _717;
    }
    float _1373 = _1311;
    float _1375 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1365);
    if (_853)
    {
        float _1377 = _654 ? as_type<float>(_1303) : _628;
        _1371 = _1377;
    }
    float _1379 = _1371;
    float _1381 = fma(_1373, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1369);
    float _1383 = _1373 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1385 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1389 = !_1355;
    int _1391 = _1389 ? 0 : (-1);
    float _1393 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_707)
    {
        _690 = _1313;
    }
    float _1395 = _690;
    float _1397 = -_1387;
    float _1399 = fma(_1383, 2.0, _1397);
    int _1401 = ~_1319;
    int _1403 = _1401 + _1391;
    int _1405 = _1403 + 1;
    float _1407 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1393);
    float _1409 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1411 = as_type<float>(_672) * _1217;
    int _1413 = _614 * _1405;
    int _1415 = _1413 + _1079;
    float _1417 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1381);
    if (!_707)
    {
        _1323 = _717;
    }
    float _1419 = _1323;
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1423 = trunc(_1411);
    float _1425 = precise::max(_1423, 0.0);
    uint _1427 = uint(_1425);
    float _1429 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1431 = !_967;
    int _1433 = _1431 ? _1415 : (-1);
    float _1435 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1421);
    float _1437 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1439 = fma(_1429, _773, -0.5);
    int _1441 = _1433 >> 31;
    float _1443 = _1395 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1445 = _1409 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _1447 = ~_614;
    int _1449 = _1447 + 1;
    float _1451 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1435);
    int _1453 = _1441 & 3;
    float _1455 = fma(_1445, _1379, -0.5);
    float _1457 = fma(_1443, -2.0, _1437);
    float _1459 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1407);
    int _1461 = _1433 + _1453;
    int _1463 = _1449 * int(_1427);
    int _1465 = _1463 + _1039;
    float _1467 = -_122;
    float _1469 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1399);
    float _1471 = _1419 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1473 = _1461 >> 2;
    float _1475 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1457);
    float _1477 = float(uint(_1465));
    float _1479 = fma(_1081, _1235, _1359);
    float _1481 = fma(_1459, _1439, _857);
    float _1483 = _835 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1485 = fma(_1417, _1455, _1469);
    int _1487 = _1473 << 4;
    int _1489 = _1487 + 656;
    float _1491 = _829 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1493 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1495 = _1483 + _1493;
    float _1497 = as_type<float>(_672) * _1477;
    float _1499 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1501 = _865 + _1499;
    uint _1503 = uint(int(uint(_1489) >> uint(2)));
    uint _1505 = uint(int(uint(int(_1503)) >> uint(2)));
    int _1507 = int(_1503) & 3;
    float _1509 = (*spvDescriptorSet0.vp_c9)._m0[int(_1505)][_1507];
    int _1511 = int(_1503) + 1;
    uint _1513 = uint(int(uint(_1511) >> uint(2)));
    int _1515 = _1511 & 3;
    float _1517 = (*spvDescriptorSet0.vp_c9)._m0[int(_1513)][_1515];
    float _1519 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1521 = _1491 + _1519;
    float _1523 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1525 = _1433 & 3;
    bool _1527 = _1525 != 0;
    float _1529 = trunc(_1497);
    float _1531 = precise::max(_1529, 0.0);
    uint _1533 = uint(_1531);
    float _1535 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1523);
    bool _1537 = uint(_1525) > 1u;
    float _1539 = fma(_1105, _1219, _1479);
    int _1541 = _1433 & 3;
    bool _1543 = _1541 != 0;
    float _1545 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1535);
    float _1547 = fma(_1333, (*spvDescriptorSet0.vp_c9)._m0[90].x, -0.5);
    int _1549 = _1489 + 8;
    uint _1551 = uint(int(uint(_1549) >> uint(2)));
    uint _1553 = uint(int(uint(int(_1551)) >> uint(2)));
    int _1555 = int(_1551) & 3;
    float _1557 = (*spvDescriptorSet0.vp_c9)._m0[int(_1553)][_1555];
    int _1559 = int(_1551) + 1;
    uint _1561 = uint(int(uint(_1559) >> uint(2)));
    int _1563 = _1559 & 3;
    float _1565 = (*spvDescriptorSet0.vp_c9)._m0[int(_1561)][_1563];
    float _1567 = fma(_1111, _1215, _1539);
    float _1569 = fma(_1451, _1547, _1353);
    int _1571 = _1543 ? 0 : 1;
    float _1573 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[90].y, -0.5);
    float _1575 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _1577 = uint(_1525) >= 2u;
    float _1579 = fma(_1129, _1185, _1567);
    int _1581 = ~_1571;
    int _1583 = _1581 + 1;
    int _1585 = _1583 + 1;
    float _1587 = fma(_1471, -2.0, _1575);
    int _1589 = _1585;
    float _1591 = _1573;
    if (!_1537)
    {
        int _1593 = ~_1571;
        int _1595 = _1593 + 1;
        _1589 = _1595;
    }
    int _1597 = _1589;
    float _1599 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1375);
    bool _1601 = _1525 != 3;
    float _1603 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1587);
    int _1605 = ~_614;
    int _1607 = _1605 + 1;
    float _1609 = fma(_1247, _1183, _1579);
    int _1611 = int(_1427) + int(_1533);
    float _1613 = -_1475;
    float _1615 = fma(_1599, _1347, _1613);
    float _1617 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1609);
    int _1619 = _1577 ? 0 : 1;
    float _1621 = _1317 + 0.5;
    int _1623 = abs(_1597);
    int _1625 = _1607 * _1611;
    int _1627 = _1625 + _1039;
    bool _1629 = !_1527;
    int _1631 = _1629 ? 0 : 1;
    float _1633 = _1481 + 0.5;
    int _1635 = ~_1619;
    int _1637 = _1635 + 1;
    int _1639 = _1637 + 1;
    out.m_59.x = _1617;
    bool _1641 = _1525 != 3;
    int _1643 = _1639;
    if (_1601)
    {
        int _1645 = ~_1619;
        int _1647 = _1645 + 1;
        _1643 = _1647;
    }
    int _1649 = _1643;
    int _1651 = ~_1623;
    int _1653 = _1651 + 1;
    int _1655 = _1653 + 1;
    int _1657 = abs(_1631);
    bool _1659 = uint(_1627) >= uint(_614);
    int _1661 = _1655 * as_type<int>(_1517);
    bool _1663 = !_1641;
    int _1665 = _1663 ? 0 : (-1);
    int _1667 = abs(_1649);
    bool _1669 = !_845;
    int _1671 = _1669 ? 0 : 1;
    int _1673 = abs(_1665);
    int _1675 = ~_1657;
    int _1677 = _1675 + 1;
    int _1679 = _1677 + 1;
    bool _1681 = !_1659;
    int _1683 = _1681 ? 0 : (-1);
    int _1685 = _1679 * as_type<int>(_1509);
    int _1687 = _1685 + _1661;
    int _1689 = abs(_1671);
    int _1691 = ~_1667;
    int _1693 = _1691 + 1;
    int _1695 = _1693 + 1;
    int _1697 = ~_1611;
    int _1699 = _1697 + _1683;
    int _1701 = _1699 + 1;
    int _1703 = ~_1673;
    int _1705 = _1703 + 1;
    int _1707 = _1705 + 1;
    int _1709 = _1695 * as_type<int>(_1557);
    int _1711 = _1709 + _1687;
    bool _1713 = _1545 >= 0.0;
    int _1715 = _614 * _1701;
    int _1717 = _1715 + _1039;
    float _1719 = _1495 * _1495;
    int _1721 = _1707 * as_type<int>(_1565);
    int _1723 = _1721 + _1711;
    float _1725 = -_1603;
    float _1727 = fma(_1295, _1573, _1725);
    float _1729 = fma(_1521, _1521, _1719);
    int _1731 = ~_1689;
    int _1733 = _1731 + 1;
    int _1735 = _1733 + 1;
    float _1737 = _1485 + 0.5;
    bool _1739 = !_967;
    int _1741 = _1739 ? _1717 : (-1);
    float _1743 = fma(_1501, _1501, _1729);
    float _1745 = _1727 + 0.5;
    int _1747 = _1723 * _1735;
    if (_1713)
    {
        _1591 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1749 = _1591;
    float _1751 = rsqrt(_1743);
    int _1753 = as_type<int>(_1749);
    if (_1713)
    {
        out.m_45.x = 0.0;
    }
    int _1755 = _1741 * _1689;
    int _1757 = _1755 + _1747;
    float _1759 = _1569 + 0.5;
    float _1761 = _1615 + 0.5;
    if (_1713)
    {
        float _1763 = _1749 * 5.0;
        _1753 = as_type<int>(_1763);
    }
    int _1765 = _1753;
    float _1767 = float(_1757);
    out.m_61.x = _1759;
    out.m_61.y = _1745;
    out.m_63.x = _1633;
    out.m_63.y = _1621;
    out.m_63.z = _1737;
    out.m_63.w = _1761;
    float _1769 = as_type<float>(_1765);
    if (_1713)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5173 = as_type<float>(_1765);
        out.gl_Position.z = _5173;
    }
    float _1771 = _1495 * _1751;
    float _1773 = _1521 * _1751;
    out.m_65.z = _1767;
    if (_1713)
    {
        return out;
    }
    float _1775 = -_1771;
    float _1777 = fma(_1775, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1483);
    float _1779 = _1501 * _1751;
    float _1781 = -_1773;
    float _1783 = fma(_1781, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1491);
    float _1785 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1787 = _1777 + _1785;
    float _1789 = -_1779;
    float _1791 = fma(_1789, (*spvDescriptorSet0.vp_c9)._m0[18].w, _865);
    float _1793 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1795 = _1783 + _1793;
    float _1797 = _1787 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1799 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1801 = _1791 + _1799;
    float _1803 = fma(_1795, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1797);
    float _1805 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1803);
    bool _1807 = _1805 >= 0.0;
    float _1809 = _1787;
    if (_1807)
    {
        _1769 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1811 = _1769;
    int _1813 = as_type<int>(_1811);
    if (_1807)
    {
        out.m_45.x = 0.0;
    }
    if (_1807)
    {
        float _1815 = _1811 * 5.0;
        _1813 = as_type<int>(_1815);
    }
    int _1817 = _1813;
    if (_1807)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5272 = as_type<float>(_1817);
        out.gl_Position.z = _5272;
    }
    if (_1807)
    {
        return out;
    }
    float _1819 = -_1483;
    float _1821 = _1819 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1823 = -_1491;
    float _1825 = _1823 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1827 = -_865;
    float _1829 = _1827 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1831 = -_1771;
    float _1833 = fma(_1831, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1495);
    float _1835 = _1821 * _1821;
    float _1837 = -_1773;
    float _1839 = fma(_1837, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1521);
    float _1841 = -_1779;
    float _1843 = fma(_1841, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1501);
    float _1845 = _1833 * _1833;
    float _1847 = fma(_1825, _1825, _1835);
    bool _1849 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1851 = isnan(0.5);
    bool _1853 = _1849 || _1851;
    bool _1855 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1857 = _1853 || _1855;
    float _1859 = fma(_1839, _1839, _1845);
    float _1861 = fma(_1829, _1829, _1847);
    float _1863 = in.m_49.x;
    float _1865 = in.m_49.y;
    float _1867 = in.m_49.z;
    float _1869 = fma(_1843, _1843, _1859);
    float _1871 = rsqrt(_1861);
    float _1873 = _1825 * _1871;
    float _1875 = _1829 * _1871;
    float _1877 = _1821 * _1871;
    float _1879 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1881 = _1873 * _1879;
    float _1883 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1885 = _1875 * _1883;
    float _1887 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1889 = _1877 * _1887;
    float _1891 = _1865 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1893 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1895 = -_1881;
    float _1897 = fma(_1875, _1893, _1895);
    float _1899 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1901 = -_1885;
    float _1903 = fma(_1877, _1899, _1901);
    float _1905 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1907 = -_1889;
    float _1909 = fma(_1873, _1905, _1907);
    float _1911 = in.m_67.x;
    float _1913 = in.m_67.y;
    float _1915 = in.m_67.z;
    float _1917 = _1897 * _1897;
    float _1919 = sqrt(_1869);
    float _1921 = _1863 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1923 = _1867 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1925 = fma(_1903, _1903, _1917);
    float _1927 = _1921 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1929 = _1923 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1931 = fma(_1909, _1909, _1925);
    float _1933 = rsqrt(_1931);
    float _1935 = _1751 * _1919;
    float _1937 = _1891 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1939 = _1935 * _1927;
    float _1941 = _1935 * _1937;
    float _1943 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1913);
    float _1945 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1911);
    float _1947 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1915);
    float _1949 = _1935 * _1929;
    float _1951 = _1943 * _1941;
    float _1953 = _1945 * _1939;
    float _1955 = _1903 * _1933;
    float _1957 = _1897 * _1933;
    float _1959 = _1909 * _1933;
    float _1961 = _1947 * _1949;
    float _1963 = _1877 * _1955;
    float _1965 = _1875 * _1957;
    float _1967 = -_1963;
    float _1969 = fma(_1873, _1957, _1967);
    float _1971 = -_1965;
    float _1973 = fma(_1877, _1959, _1971);
    float _1975 = _1951 * _1969;
    float _1977 = _1951 * _1973;
    float _1979 = fma(_1953, _1959, _1975);
    float _1981 = fma(_1953, _1955, _1977);
    float _1983 = fma(_1961, _1875, _1979);
    float _1985 = fma(_1961, _1873, _1981);
    float _1987 = _1873 * _1959;
    float _1989 = _865 + _1983;
    float _1991 = _1491 + _1985;
    float _1993 = -_1987;
    float _1995 = fma(_1875, _1955, _1993);
    float _1997 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1999 = _1989 + _1997;
    float _2001 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2003 = _1991 + _2001;
    float _2005 = _1951 * _1995;
    float _2007 = _1999 * _1999;
    float _2009 = fma(_1953, _1957, _2005);
    float _2011 = fma(_2003, _2003, _2007);
    float _2013 = fma(_1961, _1877, _2009);
    float _2015 = sqrt(_2011);
    float _2017 = _1483 + _2013;
    bool _2019 = _2015 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2021 = _1877;
    float _2023 = _1987;
    float _2025 = _1991;
    if (!_2019)
    {
        _2021 = _1991;
    }
    float _2027 = _2021;
    float _2029 = _2027;
    if (!_2019)
    {
        _2023 = _1989;
    }
    float _2031 = _2023;
    float _2033 = _2031;
    if (!_2019)
    {
        _2025 = _2017;
    }
    float _2035 = _2025;
    bool _2037 = !_2019;
    float _2039 = _2035;
    if (!_2037)
    {
        float _2041 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2043 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2045 = _2015 + _2043;
        float _2047 = rsqrt(_2011);
        float _2049 = _2045 * _2041;
        float _2051 = _2017 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2053 = _2049 * 0.15915493667125701904296875;
        float _2055 = _2053 * 6.283185482025146484375;
        float _2057 = cos(_2055);
        float _2059 = _2053 * 6.283185482025146484375;
        float _2061 = sin(_2059);
        float _2063 = _2057 + (-1.0);
        float _2065 = fma(_2061, _2051, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2067 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2069 = _2047 * _2065;
        float _2071 = fma(_2017, _2057, _2067);
        float _2073 = fma(_2003, _2069, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2075 = fma(_1999, _2069, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2029 = _2073;
        _2039 = _2071;
        _2033 = _2075;
    }
    float _2077 = _2029;
    float _2079 = _2039;
    float _2081 = _2033;
    float _2083 = -_1773;
    float _2085 = fma(_2083, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2077);
    float _2087 = -_1771;
    float _2089 = fma(_2087, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2079);
    float _2091 = -_1779;
    float _2093 = fma(_2091, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2081);
    float _2095 = _2089;
    float _2097 = _2085;
    float _2099 = _2093;
    float _2101 = _2081;
    if (!_1857)
    {
        float _2103 = _1787 * _1787;
        float _2105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2107 = -_1483;
        float _2109 = _2107 + _2079;
        float _2111 = fma(_1795, _1795, _2103);
        float _2113 = fma(_1801, _1801, _2111);
        float _2115 = 1.0 / _1935;
        float _2117 = sqrt(_2113);
        float _2119 = precise::min(_2117, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2121 = _2119 * _2105;
        float _2123 = -_1491;
        float _2125 = _2123 + _2077;
        float _2127 = _2121 * _2115;
        float _2129 = -_865;
        float _2131 = _2129 + _2081;
        float _2133 = fma(_2125, _2127, _1783);
        float _2135 = fma(_2109, _2127, _1777);
        float _2137 = fma(_2131, _2127, _1791);
        _2095 = _2135;
        _2097 = _2133;
        _2099 = _2137;
        _1809 = _2117;
    }
    float _2139 = _2095;
    float _2141 = _2097;
    float _2143 = _2099;
    float _2145 = _1809;
    float _2147 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2149 = _2139 + _2147;
    float _2151 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2153 = _2141 + _2151;
    float _2155 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2157 = _2143 + _2155;
    float _2159 = _2149 * _2149;
    float _2161 = fma(_2153, _2153, _2159);
    float _2163 = fma(_2157, _2157, _2161);
    float _2165 = rsqrt(_2163);
    float _2167 = _2165 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2169 = _2153 * _2167;
    float _2171 = _2157 * _2167;
    float _2173 = _2169 * _2169;
    float _2175 = _2171 * _2171;
    float _2177 = _2173 + _2175;
    float _2179 = sqrt(_2177);
    bool _2181 = _2179 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2185 = _2179 + _2183;
    float _2187 = _2145;
    float _2189 = _2177;
    float _2191 = _2185;
    float _2193 = _2149;
    float _2195 = _2167;
    float _2197 = _2169;
    if (_2181)
    {
        float _2199 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2187 = _2199;
    }
    float _2201 = _2187;
    if (_2181)
    {
        float _2203 = rsqrt(_2177);
        _2189 = _2203;
    }
    float _2205 = _2189;
    float _2207 = _2201;
    if (_2181)
    {
        float _2209 = _2185 * _2201;
        _2191 = _2209;
    }
    float _2211 = _2191;
    if (_2181)
    {
        float _2213 = _2211 * 0.15915493667125701904296875;
        _2207 = _2213;
    }
    float _2215 = _2207;
    float _2217 = _2165;
    float _2219 = _2215;
    if (_2181)
    {
        float _2221 = _2215 * 6.283185482025146484375;
        float _2223 = sin(_2221);
        _2217 = _2223;
    }
    float _2225 = _2217;
    float _2227 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2229 = precise::max(0.0, _2227);
    float _2231 = _2157;
    float _2233 = _2229;
    if (_2181)
    {
        float _2235 = _2215 * 6.283185482025146484375;
        float _2237 = cos(_2235);
        _2231 = _2237;
    }
    float _2239 = _2231;
    float _2241 = -_2167;
    float _2243 = -_2229;
    float _2245 = fma(_2149, _2241, _2243);
    if (_2181)
    {
        float _2247 = _2245 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2193 = _2247;
    }
    float _2249 = _2193;
    float _2251 = _2249;
    if (!_2181)
    {
        _2219 = _2173;
    }
    float _2253 = _2219;
    float _2255 = _2225;
    float _2257 = _2253;
    if (_2181)
    {
        float _2259 = fma(_2225, _2249, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2251 = _2259;
    }
    float _2261 = _2251;
    float _2263 = _2261;
    if (!_2181)
    {
        _2255 = _2245;
    }
    float _2265 = _2255;
    float _2267 = _2265;
    if (_2181)
    {
        float _2269 = _2239 + (-1.0);
        _2233 = _2269;
    }
    float _2271 = _2233;
    float _2273 = _2271;
    if (_2181)
    {
        float _2275 = _2205 * _2261;
        _2101 = _2275;
    }
    float _2277 = _2101;
    if (!_2181)
    {
        _2263 = _2171;
    }
    float _2279 = _2263;
    float _2281 = sqrt(_2163);
    float _2283 = _2279;
    if (_2181)
    {
        float _2285 = _2271 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2195 = _2285;
    }
    float _2287 = _2195;
    if (_2181)
    {
        float _2289 = _2169 * _2277;
        _2197 = _2289;
    }
    float _2291 = _2197;
    if (_2181)
    {
        float _2293 = _2171 * _2277;
        _2283 = _2293;
    }
    float _2295 = _2283;
    if (!_2181)
    {
        _2273 = _2175;
    }
    float _2297 = _2273;
    float _2299 = _2297;
    if (_2181)
    {
        float _2301 = fma(_2245, _2239, _2287);
        _2267 = _2301;
    }
    float _2303 = _2267;
    if (_2181)
    {
        float _2305 = _2291 * _2291;
        _2257 = _2305;
    }
    float _2307 = _2257;
    if (_2181)
    {
        float _2309 = _2295 * _2295;
        _2299 = _2309;
    }
    float _2311 = _2299;
    float _2313 = _2139 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2315 = fma(_2303, _2303, _2307);
    float _2317 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2319 = _2315 + _2311;
    float _2321 = _2139 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2323 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2325 = fma(_2281, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2323);
    float _2327 = precise::clamp(_2325, 0.0, 1.0);
    float _2329 = rsqrt(_2319);
    float _2331 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2321);
    float _2333 = _2139 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2335 = -_2327;
    float _2337 = _2335 + 1.0;
    float _2339 = _2139 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2341 = fma(_2143, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2331);
    float _2343 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2333);
    float _2345 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2339);
    float _2347 = _2341 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2349 = fma(_2143, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2343);
    float _2351 = abs(_2337);
    float _2353 = log2(_2351);
    float _2355 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2313);
    float _2357 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2359 = fma(_2143, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2345);
    float _2361 = _2349 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2363 = _2329 * _2291;
    float _2365 = -_2357;
    float _2367 = fma(_2365, _2317, 1.0);
    float _2369 = fma(_2143, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2355);
    float _2371 = _2359 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2373 = _2361 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2375 = _2329 * _2303;
    float _2377 = _2363 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2379 = _2329 * _2295;
    float _2381 = fma(_2371, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2373);
    float _2383 = _2369 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2385 = -_2377;
    float _2387 = fma(_2375, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2385);
    float _2389 = _2353 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2391 = fma(_2347, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2381);
    float _2393 = _2361 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2395 = -_2379;
    float _2397 = fma(_2395, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2387);
    float _2399 = log2(_2367);
    float _2401 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2391);
    float _2403 = _2361 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2405 = fma(_2397, -0.5, 0.5);
    float _2407 = fma(_2371, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2393);
    float _2409 = _2375 + 1.0;
    float _2411 = fma(_2371, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2403);
    float _2413 = fma(_2397, 0.5, 0.5);
    float _2415 = exp2(_2389);
    float _2417 = fma(_2347, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2407);
    float _2419 = fma(_2347, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2411);
    float _2421 = fma(_2413, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2423 = fma(_2413, _2421, -0.212114393711090087890625);
    float _2425 = 1.0 / _2401;
    float _2427 = _2399 * 0.693147182464599609375;
    float _2429 = fma(_2413, _2423, 1.570728778839111328125);
    float _2431 = _2427 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2433 = sqrt(_2405);
    float _2435 = -_2375;
    float _2437 = fma(_2415, _2409, _2435);
    float _2439 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2417);
    float _2441 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2419);
    float _2443 = _2439 * _2425;
    float _2445 = _2441 * _2425;
    float _2447 = fma(_2443, 0.5, 0.5);
    float _2449 = fma(_2445, -0.5, 0.5);
    float _2451 = fma(_2437, 0.5, 0.5);
    float _2453 = _2433 * 0.636619746685028076171875;
    float3 _6297 = float3(_2447, _2449, _2431);
    float _2455 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6297, float3(0.0), isnan(_6297)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6297, float3(0.0), isnan(_6297)), level(0.0)).x;
    float3 _6308 = float3(_2447, _2449, _2431);
    float4 _2458 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6308, float3(0.0), isnan(_6308)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6308, float3(0.0), isnan(_6308)), level(0.0)).xyzw;
    float _2460 = _2458.x;
    float _2462 = _2458.y;
    float _2464 = _2458.z;
    float _2466 = _2458.w;
    float _2468 = -_2429;
    float _2470 = fma(_2453, _2468, 1.0);
    float2 _6330 = float2(_2470, _2451);
    float3 _2474 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6330, float2(0.0), isnan(_6330)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6330, float2(0.0), isnan(_6330)), level(0.0)).xyz;
    float _2476 = _2474.x;
    float _2478 = _2474.y;
    float _2480 = _2474.z;
    float _2482 = _2361 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2484 = _2353 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2486 = _2439 + _2401;
    float _2488 = fma(_2371, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2482);
    float _2490 = _2486 * 0.5;
    float _2492 = exp2(_2484);
    float _2494 = fma(_2347, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2488);
    float _2496 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2494);
    float _2498 = _2401 * 0.5;
    float _2500 = _2496 + _2401;
    float _2502 = -_2492;
    float _2504 = _2502 + 1.0;
    float _2506 = fma(_2441, -0.5, _2498);
    float _2508 = _2500 * 0.5;
    float _2510 = _2504 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2439;
    out.gl_Position.y = _2441;
    out.gl_Position.z = _2496;
    out.gl_Position.w = _2401;
    float _2512 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _2490;
    out.m_69.y = _2506;
    out.m_69.z = _2508;
    out.m_69.w = _2401;
    out.m_45.x = _2512;
    float _2514 = _2510 * _2455;
    float _2516 = -_2510;
    float _2518 = _2516 + 1.0;
    float _2520 = _2466 * _2514;
    float _2522 = _2480 * _2514;
    float _2524 = fma(_2476, _2520, _2460);
    float _2526 = fma(_2478, _2520, _2462);
    float _2528 = _2466 * _2518;
    float _2530 = fma(_2466, _2522, _2464);
    out.m_71.x = _2524;
    out.m_71.y = _2526;
    out.m_71.z = _2530;
    out.m_71.w = _2528;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _584 = false;
    bool _454 = false;
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
    if (!_94)
    {
        out.m_45.x = 0.0;
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
        float _2586 = as_type<float>(_104);
        out.gl_Position.z = _2586;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_47.w;
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
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2655 = as_type<float>(_142);
        out.gl_Position.z = _2655;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_49.w;
    float _146 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
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
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
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
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _298 = _294 + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _308 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _310 = isnan(_294);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _324 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _326 = isnan(_294);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = 1.0 / _302;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _338;
    float _342 = -_318;
    float _344 = _342 + 1.0;
    bool _346 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _348 = isnan(_294);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    bool _358 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _360 = 1.0 / _306;
    float _362 = 1.0 / _322;
    float _364 = _340 * _336;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _370 = _334 * _344;
    float _372 = -_334;
    float _374 = _372 + 1.0;
    float _376 = fma(_364, _298, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _378;
    float _382 = _356 * _374;
    float _384 = _368 * _360;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _388 = _294 + _386;
    bool _390 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _392 = isnan(_294);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = _376 * _382;
    float _404 = -_356;
    float _406 = _404 + 1.0;
    float _408 = fma(_384, _388, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _412 = _294 + _410;
    float _414 = _380 * _362;
    float _416 = -_400;
    float _418 = _416 + 1.0;
    float _420 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[115].x, _402);
    float _422 = fma(_414, _412, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _424 = _318 * _418;
    float _426 = fma(_408, _370, _420);
    float _428 = fma(_422, _424, _426);
    float _430 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[118].x, _428);
    float _432 = _430 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.w = _432;
    bool _434 = !_358;
    float _452;
    if (!_434)
    {
        float _436 = in.m_51.x;
        float _438 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _440 = _436 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _442 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _444 = _442 * _438;
        float _446 = floor(_444);
        float _448 = -_446;
        float _450 = _444 + _448;
        _452 = _450;
        _454 = true;
    }
    else
    {
        float _456 = float(_90);
        float _458 = 1.0 / _456;
        float _460 = _122 * _458;
        _452 = _460;
    }
    _454 = false;
    float _462 = _452;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _466 = _462 + _464;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _472 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _474 = isnan(_462);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _488 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _490 = isnan(_462);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _496 = _492 || _494;
    float _498 = float(_496);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _500;
    bool _504 = _462 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _506 = isnan(_462);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = 1.0 / _470;
    float _518 = -_482;
    float _520 = _518 + 1.0;
    bool _522 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _524 = _498 * _520;
    float _526 = -_498;
    float _528 = _526 + 1.0;
    float _530 = 1.0 / _486;
    float _532 = _502 * _516;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _538 = fma(_532, _466, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _540 = _536 * _530;
    float _542 = _538 * _524;
    float _544 = -_514;
    float _546 = _544 + 1.0;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _550 = _462 + _548;
    float _552 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[131].x, _542);
    float _554 = _482 * _546;
    float _556 = fma(_540, _550, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _558 = fma(_556, _554, _552);
    float _560 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[133].x, _558);
    float _562 = _560 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_55.w = _562;
    bool _564 = !_522;
    float _582;
    if (!_564)
    {
        float _566 = in.m_51.x;
        float _568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _570 = _566 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _572 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[14].x, _122);
        float _574 = _572 * _568;
        float _576 = floor(_574);
        float _578 = -_576;
        float _580 = _574 + _578;
        _582 = _580;
        _584 = true;
    }
    else
    {
        float _586 = float(_90);
        float _588 = 1.0 / _586;
        float _590 = _122 * _588;
        _582 = _590;
    }
    _584 = false;
    float _592 = _582;
    float _594 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _596 = int(_594);
    float _598 = in.m_57.y;
    float _600 = _262 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _602 = float(_90);
    float _604 = in.m_51.y;
    int _606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _608 = _606 != 0;
    float _610 = _262 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _612 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _614 = int(_612);
    float _616 = in.m_51.z;
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _620 = _618 != 0;
    float _622 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _610);
    int _624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _626 = _624 != 0;
    float _628 = in.m_57.x;
    float _630 = float(_596);
    float _632 = 1.0 / _602;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _638 = float(uint(_614));
    float _640 = 1.0 / _630;
    int _642 = ~_614;
    int _644 = _642 + 1;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _650 = _604 > 0.5;
    float _652 = 1.0 / _638;
    bool _654 = _616 > 0.5;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _664 = float(_614);
    float _666 = _122 * _640;
    float _668 = 1.0 / _636;
    float _670 = in.m_51.w;
    int _672 = as_type<int>(_652) + (-2);
    float _674 = trunc(_666);
    int _676 = int(_674);
    float _678 = 1.0 / _648;
    float _680 = float(uint(_676));
    float _682 = 1.0 / _658;
    bool _684 = _670 > 0.5;
    float _686 = _670;
    float _688 = _598;
    float _690 = _616;
    if (!_608)
    {
        _686 = _628;
    }
    float _692 = _686;
    float _694 = as_type<float>(_672) * _680;
    float _696 = trunc(_694);
    float _698 = precise::max(_696, 0.0);
    uint _701 = uint(_698);
    float _703 = 1.0 / _662;
    int _705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _707 = _705 != 0;
    int _709 = _644 * int(_701);
    int _711 = _709 + _676;
    bool _713 = !_707;
    float _715 = _713 ? 5.839270114898681640625 : 1.0;
    float _717 = in.m_51.x;
    float _719 = float(uint(_711));
    float _721 = as_type<float>(_672) * _719;
    float _723 = -_598;
    float _725 = _723 + 1.0;
    float _727 = trunc(_721);
    float _729 = precise::max(_727, 0.0);
    uint _731 = uint(_729);
    int _733 = _650 ? as_type<int>(_725) : as_type<int>(_598);
    float _735 = _620 ? as_type<float>(_733) : _598;
    int _737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _739 = _737 != 0;
    int _741 = _654 ? as_type<int>(_725) : as_type<int>(_598);
    float _743 = _739 ? as_type<float>(_741) : _598;
    int _745 = _741;
    bool _747 = _739;
    float _749 = _692;
    if (_608)
    {
        float _751 = -_628;
        float _753 = _751 + 1.0;
        _745 = as_type<int>(_753);
    }
    int _755 = _745;
    if (_608)
    {
        bool _757 = _717 > 0.5;
        _747 = _757;
    }
    bool _759 = _747;
    int _761 = int(_701) + int(_731);
    int _763 = ~_614;
    int _765 = _763 + 1;
    if (_626)
    {
        float _767 = _684 ? _725 : _598;
        _688 = _767;
    }
    float _769 = _688;
    if (_608)
    {
        float _771 = _759 ? as_type<float>(_755) : _628;
        _749 = _771;
    }
    float _773 = _749;
    int _775 = _765 * _761;
    int _777 = _775 + _676;
    bool _779 = uint(_777) >= uint(_614);
    float _781 = _262 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _787 = _785 != 0;
    int _789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _791 = _789 != 0;
    int _793 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _795 = _793 != 0;
    float _797 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _781);
    bool _799 = !_779;
    int _801 = _799 ? 0 : (-1);
    float _803 = _717 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _807 = _805 != 0;
    float _809 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _600);
    bool _811 = !_791;
    int _813 = _811 ? 0 : 1;
    float _815 = _604 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _817 = !_787;
    int _819 = _817 ? 0 : 1;
    float _821 = -_783;
    float _823 = fma(_803, 2.0, _821);
    bool _825 = !_795;
    int _827 = _825 ? 0 : 1;
    float _829 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].z, _797);
    bool _831 = !_807;
    int _833 = _831 ? 0 : 1;
    float _835 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].z, _809);
    int _837 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _839 = _837 != 0;
    float _841 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].z, _622);
    int _843 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _845 = _843 != 0;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _847;
    int _851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _853 = _851 != 0;
    float _855 = -_122;
    float _857 = fma(_855, (*spvDescriptorSet0.vp_c9)._m0[76].x, _823);
    int _859 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _861 = _859 != 0;
    float _863 = _849 * _668;
    float _865 = _841 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _867 = float(_676);
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _871 = ~_761;
    int _873 = _871 + _801;
    int _875 = _873 + 1;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _879 = _877 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _881 = _867 >= _664;
    bool _883 = isnan(_867);
    bool _885 = _881 || _883;
    bool _887 = isnan(_664);
    bool _889 = _885 || _887;
    float _891 = float(_889);
    float _893 = fma(_815, -2.0, _869);
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _897 = _895 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _899 = !_707;
    float _901 = _899 ? _616 : _717;
    int _903 = 0;
    if (_861)
    {
        float _905 = -_628;
        float _907 = _905 + 1.0;
        _903 = as_type<int>(_907);
    }
    int _909 = _903;
    float _911 = 1.0 / _879;
    float _913 = _901 * _715;
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _917 = _915 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _919 = abs(_819);
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _923 = _921 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _925 = floor(_913);
    float _927 = _917 * _678;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _931 = _929 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _933 = _931 * _703;
    float _935 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _937 = _935 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _939 = 1.0 / _897;
    float _941 = trunc(_891);
    int _943 = int(_941);
    float _945 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _945;
    float _949 = -_925;
    float _951 = _913 + _949;
    bool _953 = !_839;
    int _955 = _953 ? 0 : 1;
    float _957 = _947 * _682;
    float _959 = _951 * _664;
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _961;
    float _965 = _122 * _664;
    bool _967 = _614 == 0;
    float _969 = 1.0 / _923;
    float _971 = _963 * _911;
    float _973 = _937 * _939;
    int _975 = _614 * _875;
    int _977 = _975 + _676;
    float _979 = _965 * _632;
    int _981 = ~_943;
    int _983 = _981 + 1;
    int _985 = _983 + 1;
    float _987 = trunc(_959);
    int _989 = int(_987);
    bool _991 = !_967;
    int _993 = _991 ? _977 : (-1);
    int _995 = _614 + (-1);
    int _997 = abs(_813);
    int _999 = _993 * _985;
    int _1001 = abs(_955);
    float _1003 = trunc(_979);
    int _1005 = int(_1003);
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1009 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1007;
    int _1011 = _943 * _995;
    int _1013 = _1011 + _999;
    int _1015 = abs(_833);
    float _1017 = _1009 * _969;
    bool _1019 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1021 = isnan(_592);
    bool _1023 = _1019 || _1021;
    bool _1025 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1027 = _1023 || _1025;
    float _1029 = float(_1027);
    int _1031 = _1013 * _997;
    int _1033 = ~_614;
    int _1035 = _1033 + 1;
    int _1037 = _989 * _1001;
    int _1039 = _1037 + _676;
    int _1041 = abs(_827);
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1045 = _592 + _1043;
    float _1047 = -_1029;
    float _1049 = _1047 + 1.0;
    float _1051 = fma(_863, _1045, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _1053 = _1005 * _919;
    int _1055 = _1053 + _1031;
    float _1057 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1059 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1061 = _592 + _1059;
    float _1063 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1065 = _592 + _1063;
    int _1067 = _1039 * _1041;
    int _1069 = _1067 + _1055;
    float _1071 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1073 = _592 + _1071;
    float _1075 = fma(_927, _1065, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _1077 = _989 * _1015;
    int _1079 = _1077 + _1069;
    float _1081 = fma(_957, _1061, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1085 = _592 + _1083;
    float _1087 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1089 = _592 + _1087;
    bool _1091 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1093 = isnan(_592);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1099 = _1095 || _1097;
    float _1101 = float(_1099);
    float _1103 = float(uint(_1079));
    float _1105 = fma(_933, _1085, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1109 = _592 + _1107;
    float _1111 = fma(_971, _1089, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1113 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1115 = as_type<float>(_672) * _1103;
    bool _1117 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1119 = isnan(_592);
    bool _1121 = _1117 || _1119;
    bool _1123 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1125 = _1121 || _1123;
    float _1127 = float(_1125);
    float _1129 = fma(_973, _1109, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _1131 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1133 = isnan(_592);
    bool _1135 = _1131 || _1133;
    bool _1137 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1139 = _1135 || _1137;
    float _1141 = float(_1139);
    float _1143 = fma(_1113, _735, -0.5);
    bool _1145 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1147 = isnan(_592);
    bool _1149 = _1145 || _1147;
    bool _1151 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1153 = _1149 || _1151;
    float _1155 = float(_1153);
    float _1157 = trunc(_1115);
    float _1159 = precise::max(_1157, 0.0);
    uint _1161 = uint(_1159);
    float _1163 = -_1127;
    float _1165 = _1163 + 1.0;
    float _1167 = -_1141;
    float _1169 = _1167 + 1.0;
    bool _1171 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1173 = isnan(_592);
    bool _1175 = _1171 || _1173;
    bool _1177 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1179 = _1175 || _1177;
    float _1181 = float(_1179);
    float _1183 = _1141 * _1165;
    float _1185 = _1155 * _1169;
    float _1187 = -_1155;
    float _1189 = _1187 + 1.0;
    bool _1191 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1193 = isnan(_592);
    bool _1195 = _1191 || _1193;
    bool _1197 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1199 = _1195 || _1197;
    float _1201 = float(_1199);
    bool _1203 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1205 = isnan(_592);
    bool _1207 = _1203 || _1205;
    bool _1209 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1211 = _1207 || _1209;
    float _1213 = float(_1211);
    float _1215 = _1029 * _1189;
    float _1217 = float(uint(_1039));
    float _1219 = _1201 * _1049;
    float _1221 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1223 = -_1201;
    float _1225 = _1223 + 1.0;
    int _1227 = _1035 * int(_1161);
    int _1229 = _1227 + _1079;
    float _1231 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1233 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1221);
    float _1235 = _1101 * _1225;
    float _1237 = float(uint(_1229));
    float _1239 = -_1101;
    float _1241 = _1239 + 1.0;
    float _1243 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1233);
    float _1245 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _893);
    float _1247 = fma(_1017, _1073, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1249 = as_type<float>(_672) * _1237;
    float _1251 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1253 = -_1181;
    float _1255 = _1253 + 1.0;
    float _1257 = _1181 * _1241;
    float _1259 = trunc(_1249);
    float _1261 = precise::max(_1259, 0.0);
    uint _1263 = uint(_1261);
    float _1265 = _1241;
    float _1267 = _1017;
    int _1269 = as_type<int>(_1249);
    float _1271 = (*spvDescriptorSet0.vp_c9)._m0[78].w;
    float _1273 = _1143;
    float _1275 = _1213;
    float _1277 = _1231;
    if (!_707)
    {
        _1265 = _604;
    }
    float _1279 = _1265;
    float _1281 = _1213 * _1255;
    float _1283 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1251);
    float _1285 = _1279;
    if (_707)
    {
        _1267 = _717;
    }
    float _1287 = _1267;
    float _1289 = _1051 * _1281;
    int _1291 = ~_614;
    int _1293 = _1291 + 1;
    float _1295 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1283);
    float _1297 = _1287;
    if (_853)
    {
        float _1299 = -_628;
        float _1301 = _1299 + 1.0;
        _1269 = as_type<int>(_1301);
    }
    int _1303 = _1269;
    if (!_707)
    {
        _1297 = _616;
    }
    float _1305 = _1297;
    if (!_707)
    {
        _1271 = _1279;
    }
    float _1307 = _1271;
    float _1309 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1311 = _1307;
    if (_707)
    {
        _1285 = _604;
    }
    float _1313 = _1285;
    float _1315 = -_1245;
    float _1317 = fma(_1243, _1143, _1315);
    int _1319 = int(_1161) + int(_1263);
    float _1321 = _1305 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1323 = _1313;
    if (!_861)
    {
        _1273 = _628;
    }
    float _1325 = _1273;
    float _1327 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1329 = _1325;
    if (_861)
    {
        float _1331 = _650 ? as_type<float>(_909) : _628;
        _1329 = _1331;
    }
    float _1333 = _1329;
    int _1335 = _1293 * _1319;
    int _1337 = _1335 + _1079;
    float _1339 = -_1309;
    float _1341 = fma(_1321, 2.0, _1339);
    float _1343 = -_1213;
    float _1345 = _1343 + 1.0;
    float _1347 = fma(_1327, _769, -0.5);
    if (!_707)
    {
        _1275 = _616;
    }
    float _1349 = _1275;
    float _1351 = -_122;
    float _1353 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1341);
    bool _1355 = uint(_1337) >= uint(_614);
    float _1357 = fma(_1345, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1289);
    float _1359 = fma(_1075, _1257, _1357);
    float _1361 = _1349;
    if (_707)
    {
        _1361 = _1313;
    }
    float _1363 = _1361;
    float _1365 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_853)
    {
        _1277 = _628;
    }
    float _1367 = _1277;
    float _1369 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1371 = _1367;
    if (_707)
    {
        _1311 = _717;
    }
    float _1373 = _1311;
    float _1375 = fma(_1363, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1365);
    if (_853)
    {
        float _1377 = _654 ? as_type<float>(_1303) : _628;
        _1371 = _1377;
    }
    float _1379 = _1371;
    float _1381 = fma(_1373, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1369);
    float _1383 = _1373 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1385 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1389 = !_1355;
    int _1391 = _1389 ? 0 : (-1);
    float _1393 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_707)
    {
        _690 = _1313;
    }
    float _1395 = _690;
    float _1397 = -_1387;
    float _1399 = fma(_1383, 2.0, _1397);
    int _1401 = ~_1319;
    int _1403 = _1401 + _1391;
    int _1405 = _1403 + 1;
    float _1407 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1393);
    float _1409 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1411 = as_type<float>(_672) * _1217;
    int _1413 = _614 * _1405;
    int _1415 = _1413 + _1079;
    float _1417 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1381);
    if (!_707)
    {
        _1323 = _717;
    }
    float _1419 = _1323;
    float _1421 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1423 = trunc(_1411);
    float _1425 = precise::max(_1423, 0.0);
    uint _1427 = uint(_1425);
    float _1429 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1431 = !_967;
    int _1433 = _1431 ? _1415 : (-1);
    float _1435 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1421);
    float _1437 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1439 = fma(_1429, _773, -0.5);
    int _1441 = _1433 >> 31;
    float _1443 = _1395 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1445 = _1409 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _1447 = ~_614;
    int _1449 = _1447 + 1;
    float _1451 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1435);
    int _1453 = _1441 & 3;
    float _1455 = fma(_1445, _1379, -0.5);
    float _1457 = fma(_1443, -2.0, _1437);
    float _1459 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1407);
    int _1461 = _1433 + _1453;
    int _1463 = _1449 * int(_1427);
    int _1465 = _1463 + _1039;
    float _1467 = -_122;
    float _1469 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1399);
    float _1471 = _1419 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1473 = _1461 >> 2;
    float _1475 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1457);
    float _1477 = float(uint(_1465));
    float _1479 = fma(_1081, _1235, _1359);
    float _1481 = fma(_1459, _1439, _857);
    float _1483 = _835 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1485 = fma(_1417, _1455, _1469);
    int _1487 = _1473 << 4;
    int _1489 = _1487 + 656;
    float _1491 = _829 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1493 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1495 = _1483 + _1493;
    float _1497 = as_type<float>(_672) * _1477;
    float _1499 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1501 = _865 + _1499;
    uint _1503 = uint(int(uint(_1489) >> uint(2)));
    uint _1505 = uint(int(uint(int(_1503)) >> uint(2)));
    int _1507 = int(_1503) & 3;
    float _1509 = (*spvDescriptorSet0.vp_c9)._m0[int(_1505)][_1507];
    int _1511 = int(_1503) + 1;
    uint _1513 = uint(int(uint(_1511) >> uint(2)));
    int _1515 = _1511 & 3;
    float _1517 = (*spvDescriptorSet0.vp_c9)._m0[int(_1513)][_1515];
    float _1519 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1521 = _1491 + _1519;
    float _1523 = _1495 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1525 = _1433 & 3;
    bool _1527 = _1525 != 0;
    float _1529 = trunc(_1497);
    float _1531 = precise::max(_1529, 0.0);
    uint _1533 = uint(_1531);
    float _1535 = fma(_1521, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1523);
    bool _1537 = uint(_1525) > 1u;
    float _1539 = fma(_1105, _1219, _1479);
    int _1541 = _1433 & 3;
    bool _1543 = _1541 != 0;
    float _1545 = fma(_1501, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1535);
    float _1547 = fma(_1333, (*spvDescriptorSet0.vp_c9)._m0[90].x, -0.5);
    int _1549 = _1489 + 8;
    uint _1551 = uint(int(uint(_1549) >> uint(2)));
    uint _1553 = uint(int(uint(int(_1551)) >> uint(2)));
    int _1555 = int(_1551) & 3;
    float _1557 = (*spvDescriptorSet0.vp_c9)._m0[int(_1553)][_1555];
    int _1559 = int(_1551) + 1;
    uint _1561 = uint(int(uint(_1559) >> uint(2)));
    int _1563 = _1559 & 3;
    float _1565 = (*spvDescriptorSet0.vp_c9)._m0[int(_1561)][_1563];
    float _1567 = fma(_1111, _1215, _1539);
    float _1569 = fma(_1451, _1547, _1353);
    int _1571 = _1543 ? 0 : 1;
    float _1573 = fma(_743, (*spvDescriptorSet0.vp_c9)._m0[90].y, -0.5);
    float _1575 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _1577 = uint(_1525) >= 2u;
    float _1579 = fma(_1129, _1185, _1567);
    int _1581 = ~_1571;
    int _1583 = _1581 + 1;
    int _1585 = _1583 + 1;
    float _1587 = fma(_1471, -2.0, _1575);
    int _1589 = _1585;
    float _1591 = _1573;
    if (!_1537)
    {
        int _1593 = ~_1571;
        int _1595 = _1593 + 1;
        _1589 = _1595;
    }
    int _1597 = _1589;
    float _1599 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1375);
    bool _1601 = _1525 != 3;
    float _1603 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1587);
    int _1605 = ~_614;
    int _1607 = _1605 + 1;
    float _1609 = fma(_1247, _1183, _1579);
    int _1611 = int(_1427) + int(_1533);
    float _1613 = -_1475;
    float _1615 = fma(_1599, _1347, _1613);
    float _1617 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1609);
    int _1619 = _1577 ? 0 : 1;
    float _1621 = _1317 + 0.5;
    int _1623 = abs(_1597);
    int _1625 = _1607 * _1611;
    int _1627 = _1625 + _1039;
    bool _1629 = !_1527;
    int _1631 = _1629 ? 0 : 1;
    float _1633 = _1481 + 0.5;
    int _1635 = ~_1619;
    int _1637 = _1635 + 1;
    int _1639 = _1637 + 1;
    out.m_59.x = _1617;
    bool _1641 = _1525 != 3;
    int _1643 = _1639;
    if (_1601)
    {
        int _1645 = ~_1619;
        int _1647 = _1645 + 1;
        _1643 = _1647;
    }
    int _1649 = _1643;
    int _1651 = ~_1623;
    int _1653 = _1651 + 1;
    int _1655 = _1653 + 1;
    int _1657 = abs(_1631);
    bool _1659 = uint(_1627) >= uint(_614);
    int _1661 = _1655 * as_type<int>(_1517);
    bool _1663 = !_1641;
    int _1665 = _1663 ? 0 : (-1);
    int _1667 = abs(_1649);
    bool _1669 = !_845;
    int _1671 = _1669 ? 0 : 1;
    int _1673 = abs(_1665);
    int _1675 = ~_1657;
    int _1677 = _1675 + 1;
    int _1679 = _1677 + 1;
    bool _1681 = !_1659;
    int _1683 = _1681 ? 0 : (-1);
    int _1685 = _1679 * as_type<int>(_1509);
    int _1687 = _1685 + _1661;
    int _1689 = abs(_1671);
    int _1691 = ~_1667;
    int _1693 = _1691 + 1;
    int _1695 = _1693 + 1;
    int _1697 = ~_1611;
    int _1699 = _1697 + _1683;
    int _1701 = _1699 + 1;
    int _1703 = ~_1673;
    int _1705 = _1703 + 1;
    int _1707 = _1705 + 1;
    int _1709 = _1695 * as_type<int>(_1557);
    int _1711 = _1709 + _1687;
    bool _1713 = _1545 >= 0.0;
    int _1715 = _614 * _1701;
    int _1717 = _1715 + _1039;
    float _1719 = _1495 * _1495;
    int _1721 = _1707 * as_type<int>(_1565);
    int _1723 = _1721 + _1711;
    float _1725 = -_1603;
    float _1727 = fma(_1295, _1573, _1725);
    float _1729 = fma(_1521, _1521, _1719);
    int _1731 = ~_1689;
    int _1733 = _1731 + 1;
    int _1735 = _1733 + 1;
    float _1737 = _1485 + 0.5;
    bool _1739 = !_967;
    int _1741 = _1739 ? _1717 : (-1);
    float _1743 = fma(_1501, _1501, _1729);
    float _1745 = _1727 + 0.5;
    int _1747 = _1723 * _1735;
    if (_1713)
    {
        _1591 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1749 = _1591;
    float _1751 = rsqrt(_1743);
    int _1753 = as_type<int>(_1749);
    if (_1713)
    {
        out.m_45.x = 0.0;
    }
    int _1755 = _1741 * _1689;
    int _1757 = _1755 + _1747;
    float _1759 = _1569 + 0.5;
    float _1761 = _1615 + 0.5;
    if (_1713)
    {
        float _1763 = _1749 * 5.0;
        _1753 = as_type<int>(_1763);
    }
    int _1765 = _1753;
    float _1767 = float(_1757);
    out.m_61.x = _1759;
    out.m_61.y = _1745;
    out.m_63.x = _1633;
    out.m_63.y = _1621;
    out.m_63.z = _1737;
    out.m_63.w = _1761;
    float _1769 = as_type<float>(_1765);
    if (_1713)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5173 = as_type<float>(_1765);
        out.gl_Position.z = _5173;
    }
    float _1771 = _1495 * _1751;
    float _1773 = _1521 * _1751;
    out.m_65.z = _1767;
    if (_1713)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1775 = -_1771;
    float _1777 = fma(_1775, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1483);
    float _1779 = _1501 * _1751;
    float _1781 = -_1773;
    float _1783 = fma(_1781, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1491);
    float _1785 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1787 = _1777 + _1785;
    float _1789 = -_1779;
    float _1791 = fma(_1789, (*spvDescriptorSet0.vp_c9)._m0[18].w, _865);
    float _1793 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1795 = _1783 + _1793;
    float _1797 = _1787 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1799 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1801 = _1791 + _1799;
    float _1803 = fma(_1795, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1797);
    float _1805 = fma(_1801, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1803);
    bool _1807 = _1805 >= 0.0;
    float _1809 = _1787;
    if (_1807)
    {
        _1769 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1811 = _1769;
    int _1813 = as_type<int>(_1811);
    if (_1807)
    {
        out.m_45.x = 0.0;
    }
    if (_1807)
    {
        float _1815 = _1811 * 5.0;
        _1813 = as_type<int>(_1815);
    }
    int _1817 = _1813;
    if (_1807)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5272 = as_type<float>(_1817);
        out.gl_Position.z = _5272;
    }
    if (_1807)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1819 = -_1483;
    float _1821 = _1819 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1823 = -_1491;
    float _1825 = _1823 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1827 = -_865;
    float _1829 = _1827 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1831 = -_1771;
    float _1833 = fma(_1831, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1495);
    float _1835 = _1821 * _1821;
    float _1837 = -_1773;
    float _1839 = fma(_1837, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1521);
    float _1841 = -_1779;
    float _1843 = fma(_1841, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1501);
    float _1845 = _1833 * _1833;
    float _1847 = fma(_1825, _1825, _1835);
    bool _1849 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1851 = isnan(0.5);
    bool _1853 = _1849 || _1851;
    bool _1855 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1857 = _1853 || _1855;
    float _1859 = fma(_1839, _1839, _1845);
    float _1861 = fma(_1829, _1829, _1847);
    float _1863 = in.m_49.x;
    float _1865 = in.m_49.y;
    float _1867 = in.m_49.z;
    float _1869 = fma(_1843, _1843, _1859);
    float _1871 = rsqrt(_1861);
    float _1873 = _1825 * _1871;
    float _1875 = _1829 * _1871;
    float _1877 = _1821 * _1871;
    float _1879 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1881 = _1873 * _1879;
    float _1883 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1885 = _1875 * _1883;
    float _1887 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1889 = _1877 * _1887;
    float _1891 = _1865 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1893 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1895 = -_1881;
    float _1897 = fma(_1875, _1893, _1895);
    float _1899 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1901 = -_1885;
    float _1903 = fma(_1877, _1899, _1901);
    float _1905 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1907 = -_1889;
    float _1909 = fma(_1873, _1905, _1907);
    float _1911 = in.m_67.x;
    float _1913 = in.m_67.y;
    float _1915 = in.m_67.z;
    float _1917 = _1897 * _1897;
    float _1919 = sqrt(_1869);
    float _1921 = _1863 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1923 = _1867 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1925 = fma(_1903, _1903, _1917);
    float _1927 = _1921 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1929 = _1923 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1931 = fma(_1909, _1909, _1925);
    float _1933 = rsqrt(_1931);
    float _1935 = _1751 * _1919;
    float _1937 = _1891 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1939 = _1935 * _1927;
    float _1941 = _1935 * _1937;
    float _1943 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1913);
    float _1945 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1911);
    float _1947 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1915);
    float _1949 = _1935 * _1929;
    float _1951 = _1943 * _1941;
    float _1953 = _1945 * _1939;
    float _1955 = _1903 * _1933;
    float _1957 = _1897 * _1933;
    float _1959 = _1909 * _1933;
    float _1961 = _1947 * _1949;
    float _1963 = _1877 * _1955;
    float _1965 = _1875 * _1957;
    float _1967 = -_1963;
    float _1969 = fma(_1873, _1957, _1967);
    float _1971 = -_1965;
    float _1973 = fma(_1877, _1959, _1971);
    float _1975 = _1951 * _1969;
    float _1977 = _1951 * _1973;
    float _1979 = fma(_1953, _1959, _1975);
    float _1981 = fma(_1953, _1955, _1977);
    float _1983 = fma(_1961, _1875, _1979);
    float _1985 = fma(_1961, _1873, _1981);
    float _1987 = _1873 * _1959;
    float _1989 = _865 + _1983;
    float _1991 = _1491 + _1985;
    float _1993 = -_1987;
    float _1995 = fma(_1875, _1955, _1993);
    float _1997 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1999 = _1989 + _1997;
    float _2001 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2003 = _1991 + _2001;
    float _2005 = _1951 * _1995;
    float _2007 = _1999 * _1999;
    float _2009 = fma(_1953, _1957, _2005);
    float _2011 = fma(_2003, _2003, _2007);
    float _2013 = fma(_1961, _1877, _2009);
    float _2015 = sqrt(_2011);
    float _2017 = _1483 + _2013;
    bool _2019 = _2015 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2021 = _1877;
    float _2023 = _1987;
    float _2025 = _1991;
    if (!_2019)
    {
        _2021 = _1991;
    }
    float _2027 = _2021;
    float _2029 = _2027;
    if (!_2019)
    {
        _2023 = _1989;
    }
    float _2031 = _2023;
    float _2033 = _2031;
    if (!_2019)
    {
        _2025 = _2017;
    }
    float _2035 = _2025;
    bool _2037 = !_2019;
    float _2039 = _2035;
    if (!_2037)
    {
        float _2041 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2043 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2045 = _2015 + _2043;
        float _2047 = rsqrt(_2011);
        float _2049 = _2045 * _2041;
        float _2051 = _2017 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2053 = _2049 * 0.15915493667125701904296875;
        float _2055 = _2053 * 6.283185482025146484375;
        float _2057 = cos(_2055);
        float _2059 = _2053 * 6.283185482025146484375;
        float _2061 = sin(_2059);
        float _2063 = _2057 + (-1.0);
        float _2065 = fma(_2061, _2051, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2067 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2069 = _2047 * _2065;
        float _2071 = fma(_2017, _2057, _2067);
        float _2073 = fma(_2003, _2069, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2075 = fma(_1999, _2069, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2029 = _2073;
        _2039 = _2071;
        _2033 = _2075;
    }
    float _2077 = _2029;
    float _2079 = _2039;
    float _2081 = _2033;
    float _2083 = -_1773;
    float _2085 = fma(_2083, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2077);
    float _2087 = -_1771;
    float _2089 = fma(_2087, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2079);
    float _2091 = -_1779;
    float _2093 = fma(_2091, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2081);
    float _2095 = _2089;
    float _2097 = _2085;
    float _2099 = _2093;
    float _2101 = _2081;
    if (!_1857)
    {
        float _2103 = _1787 * _1787;
        float _2105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2107 = -_1483;
        float _2109 = _2107 + _2079;
        float _2111 = fma(_1795, _1795, _2103);
        float _2113 = fma(_1801, _1801, _2111);
        float _2115 = 1.0 / _1935;
        float _2117 = sqrt(_2113);
        float _2119 = precise::min(_2117, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2121 = _2119 * _2105;
        float _2123 = -_1491;
        float _2125 = _2123 + _2077;
        float _2127 = _2121 * _2115;
        float _2129 = -_865;
        float _2131 = _2129 + _2081;
        float _2133 = fma(_2125, _2127, _1783);
        float _2135 = fma(_2109, _2127, _1777);
        float _2137 = fma(_2131, _2127, _1791);
        _2095 = _2135;
        _2097 = _2133;
        _2099 = _2137;
        _1809 = _2117;
    }
    float _2139 = _2095;
    float _2141 = _2097;
    float _2143 = _2099;
    float _2145 = _1809;
    float _2147 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2149 = _2139 + _2147;
    float _2151 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2153 = _2141 + _2151;
    float _2155 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2157 = _2143 + _2155;
    float _2159 = _2149 * _2149;
    float _2161 = fma(_2153, _2153, _2159);
    float _2163 = fma(_2157, _2157, _2161);
    float _2165 = rsqrt(_2163);
    float _2167 = _2165 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2169 = _2153 * _2167;
    float _2171 = _2157 * _2167;
    float _2173 = _2169 * _2169;
    float _2175 = _2171 * _2171;
    float _2177 = _2173 + _2175;
    float _2179 = sqrt(_2177);
    bool _2181 = _2179 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2185 = _2179 + _2183;
    float _2187 = _2145;
    float _2189 = _2177;
    float _2191 = _2185;
    float _2193 = _2149;
    float _2195 = _2167;
    float _2197 = _2169;
    if (_2181)
    {
        float _2199 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2187 = _2199;
    }
    float _2201 = _2187;
    if (_2181)
    {
        float _2203 = rsqrt(_2177);
        _2189 = _2203;
    }
    float _2205 = _2189;
    float _2207 = _2201;
    if (_2181)
    {
        float _2209 = _2185 * _2201;
        _2191 = _2209;
    }
    float _2211 = _2191;
    if (_2181)
    {
        float _2213 = _2211 * 0.15915493667125701904296875;
        _2207 = _2213;
    }
    float _2215 = _2207;
    float _2217 = _2165;
    float _2219 = _2215;
    if (_2181)
    {
        float _2221 = _2215 * 6.283185482025146484375;
        float _2223 = sin(_2221);
        _2217 = _2223;
    }
    float _2225 = _2217;
    float _2227 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2229 = precise::max(0.0, _2227);
    float _2231 = _2157;
    float _2233 = _2229;
    if (_2181)
    {
        float _2235 = _2215 * 6.283185482025146484375;
        float _2237 = cos(_2235);
        _2231 = _2237;
    }
    float _2239 = _2231;
    float _2241 = -_2167;
    float _2243 = -_2229;
    float _2245 = fma(_2149, _2241, _2243);
    if (_2181)
    {
        float _2247 = _2245 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2193 = _2247;
    }
    float _2249 = _2193;
    float _2251 = _2249;
    if (!_2181)
    {
        _2219 = _2173;
    }
    float _2253 = _2219;
    float _2255 = _2225;
    float _2257 = _2253;
    if (_2181)
    {
        float _2259 = fma(_2225, _2249, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2251 = _2259;
    }
    float _2261 = _2251;
    float _2263 = _2261;
    if (!_2181)
    {
        _2255 = _2245;
    }
    float _2265 = _2255;
    float _2267 = _2265;
    if (_2181)
    {
        float _2269 = _2239 + (-1.0);
        _2233 = _2269;
    }
    float _2271 = _2233;
    float _2273 = _2271;
    if (_2181)
    {
        float _2275 = _2205 * _2261;
        _2101 = _2275;
    }
    float _2277 = _2101;
    if (!_2181)
    {
        _2263 = _2171;
    }
    float _2279 = _2263;
    float _2281 = sqrt(_2163);
    float _2283 = _2279;
    if (_2181)
    {
        float _2285 = _2271 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2195 = _2285;
    }
    float _2287 = _2195;
    if (_2181)
    {
        float _2289 = _2169 * _2277;
        _2197 = _2289;
    }
    float _2291 = _2197;
    if (_2181)
    {
        float _2293 = _2171 * _2277;
        _2283 = _2293;
    }
    float _2295 = _2283;
    if (!_2181)
    {
        _2273 = _2175;
    }
    float _2297 = _2273;
    float _2299 = _2297;
    if (_2181)
    {
        float _2301 = fma(_2245, _2239, _2287);
        _2267 = _2301;
    }
    float _2303 = _2267;
    if (_2181)
    {
        float _2305 = _2291 * _2291;
        _2257 = _2305;
    }
    float _2307 = _2257;
    if (_2181)
    {
        float _2309 = _2295 * _2295;
        _2299 = _2309;
    }
    float _2311 = _2299;
    float _2313 = _2139 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2315 = fma(_2303, _2303, _2307);
    float _2317 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2319 = _2315 + _2311;
    float _2321 = _2139 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2323 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2325 = fma(_2281, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2323);
    float _2327 = precise::clamp(_2325, 0.0, 1.0);
    float _2329 = rsqrt(_2319);
    float _2331 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2321);
    float _2333 = _2139 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2335 = -_2327;
    float _2337 = _2335 + 1.0;
    float _2339 = _2139 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2341 = fma(_2143, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2331);
    float _2343 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2333);
    float _2345 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2339);
    float _2347 = _2341 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2349 = fma(_2143, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2343);
    float _2351 = abs(_2337);
    float _2353 = log2(_2351);
    float _2355 = fma(_2141, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2313);
    float _2357 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2359 = fma(_2143, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2345);
    float _2361 = _2349 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2363 = _2329 * _2291;
    float _2365 = -_2357;
    float _2367 = fma(_2365, _2317, 1.0);
    float _2369 = fma(_2143, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2355);
    float _2371 = _2359 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2373 = _2361 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2375 = _2329 * _2303;
    float _2377 = _2363 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2379 = _2329 * _2295;
    float _2381 = fma(_2371, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2373);
    float _2383 = _2369 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2385 = -_2377;
    float _2387 = fma(_2375, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2385);
    float _2389 = _2353 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2391 = fma(_2347, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2381);
    float _2393 = _2361 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2395 = -_2379;
    float _2397 = fma(_2395, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2387);
    float _2399 = log2(_2367);
    float _2401 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2391);
    float _2403 = _2361 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2405 = fma(_2397, -0.5, 0.5);
    float _2407 = fma(_2371, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2393);
    float _2409 = _2375 + 1.0;
    float _2411 = fma(_2371, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2403);
    float _2413 = fma(_2397, 0.5, 0.5);
    float _2415 = exp2(_2389);
    float _2417 = fma(_2347, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2407);
    float _2419 = fma(_2347, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2411);
    float _2421 = fma(_2413, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2423 = fma(_2413, _2421, -0.212114393711090087890625);
    float _2425 = 1.0 / _2401;
    float _2427 = _2399 * 0.693147182464599609375;
    float _2429 = fma(_2413, _2423, 1.570728778839111328125);
    float _2431 = _2427 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2433 = sqrt(_2405);
    float _2435 = -_2375;
    float _2437 = fma(_2415, _2409, _2435);
    float _2439 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2417);
    float _2441 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2419);
    float _2443 = _2439 * _2425;
    float _2445 = _2441 * _2425;
    float _2447 = fma(_2443, 0.5, 0.5);
    float _2449 = fma(_2445, -0.5, 0.5);
    float _2451 = fma(_2437, 0.5, 0.5);
    float _2453 = _2433 * 0.636619746685028076171875;
    float3 _6297 = float3(_2447, _2449, _2431);
    float _2455 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6297, float3(0.0), isnan(_6297)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6297, float3(0.0), isnan(_6297)), level(0.0)).x;
    float3 _6308 = float3(_2447, _2449, _2431);
    float4 _2458 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6308, float3(0.0), isnan(_6308)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6308, float3(0.0), isnan(_6308)), level(0.0)).xyzw;
    float _2460 = _2458.x;
    float _2462 = _2458.y;
    float _2464 = _2458.z;
    float _2466 = _2458.w;
    float _2468 = -_2429;
    float _2470 = fma(_2453, _2468, 1.0);
    float2 _6330 = float2(_2470, _2451);
    float3 _2474 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6330, float2(0.0), isnan(_6330)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6330, float2(0.0), isnan(_6330)), level(0.0)).xyz;
    float _2476 = _2474.x;
    float _2478 = _2474.y;
    float _2480 = _2474.z;
    float _2482 = _2361 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2484 = _2353 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2486 = _2439 + _2401;
    float _2488 = fma(_2371, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2482);
    float _2490 = _2486 * 0.5;
    float _2492 = exp2(_2484);
    float _2494 = fma(_2347, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2488);
    float _2496 = fma(_2383, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2494);
    float _2498 = _2401 * 0.5;
    float _2500 = _2496 + _2401;
    float _2502 = -_2492;
    float _2504 = _2502 + 1.0;
    float _2506 = fma(_2441, -0.5, _2498);
    float _2508 = _2500 * 0.5;
    float _2510 = _2504 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2439;
    out.gl_Position.y = _2441;
    out.gl_Position.z = _2496;
    out.gl_Position.w = _2401;
    float _2512 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _2490;
    out.m_69.y = _2506;
    out.m_69.z = _2508;
    out.m_69.w = _2401;
    out.m_45.x = _2512;
    float _2514 = _2510 * _2455;
    float _2516 = -_2510;
    float _2518 = _2516 + 1.0;
    float _2520 = _2466 * _2514;
    float _2522 = _2480 * _2514;
    float _2524 = fma(_2476, _2520, _2460);
    float _2526 = fma(_2478, _2520, _2462);
    float _2528 = _2466 * _2518;
    float _2530 = fma(_2466, _2522, _2464);
    out.m_71.x = _2524;
    out.m_71.y = _2526;
    out.m_71.z = _2530;
    out.m_71.w = _2528;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

