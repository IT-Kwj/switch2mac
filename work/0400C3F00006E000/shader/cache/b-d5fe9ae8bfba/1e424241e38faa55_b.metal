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
    float4 m_67 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_71 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_59 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_49 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _742 = false;
    bool _290 = false;
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
        float _2882 = as_type<float>(_106);
        out.gl_Position.z = _2882;
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
        float _2951 = as_type<float>(_142);
        out.gl_Position.z = _2951;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_49.y;
    float _146 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _148 = in.m_51.w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_47.x;
    float _162 = in.m_47.y;
    float _164 = in.m_47.z;
    float _166 = in.m_42.x;
    float _168 = in.m_42.y;
    float _170 = in.m_42.z;
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
    out.m_53.y = _144;
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
    float _252 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _254 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _256 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _258 = fma(_248, _160, _252);
    float _260 = fma(_248, _162, _254);
    float _262 = fma(_248, _164, _256);
    float _264 = fma(_258, _148, _166);
    float _266 = fma(_260, _148, _168);
    float _268 = fma(_262, _148, _170);
    bool _270 = !_250;
    float _288;
    if (!_270)
    {
        float _272 = in.m_55.x;
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
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _302 = _298 + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _306 = _298 + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _324 = 1.0 / _310;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _334 = 1.0 / _314;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _344;
    bool _348 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _350 = isnan(_298);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    float _360 = 1.0 / _322;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _362;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _368 = _298 + _366;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _370;
    float _374 = _368 * _324;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _378 = _298 + _376;
    float _380 = 1.0 / _328;
    float _382 = fma(_338, _374, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _384 = _378 * _334;
    bool _386 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _388 = isnan(_298);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    bool _398 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _400 = isnan(_298);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = fma(_342, _384, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _412 = 1.0 / _332;
    float _414 = _302 * _360;
    bool _416 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _418 = isnan(_298);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = -_396;
    float _430 = _428 + 1.0;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _434 = _298 + _432;
    bool _436 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _438 = 1.0 / _318;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _440;
    float _444 = 1.0 / _364;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _448 = _298 + _446;
    float _450 = fma(_442, _374, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _452 = _448 * _380;
    float _454 = _306 * _438;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _458 = _298 + _456;
    float _460 = -_426;
    float _462 = _460 + 1.0;
    float _464 = _458 * _412;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _470 = _426 * _430;
    bool _472 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _474 = isnan(_298);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = _434 * _444;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _486;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _494 = _408 * _462;
    float _496 = -_408;
    float _498 = _496 + 1.0;
    bool _500 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _502 = isnan(_298);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = -_482;
    float _514 = _512 + 1.0;
    float _516 = fma(_492, _384, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _518 = fma(_468, _384, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _520 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _522 = isnan(_298);
    bool _524 = _520 || _522;
    bool _526 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _528 = _524 || _526;
    float _530 = float(_528);
    float _532 = _482 * _498;
    float _534 = _510 * _514;
    float _536 = fma(_488, _374, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _538 = -_510;
    float _540 = _538 + 1.0;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _542;
    float _546 = -_530;
    float _548 = _546 + 1.0;
    float _550 = _530 * _540;
    float _552 = fma(_544, _454, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _554 = fma(_346, _454, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _556 = fma(_372, _454, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _558 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _560 = isnan(_298);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = _358 * _548;
    float _572 = -_358;
    float _574 = _572 + 1.0;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _582 = _580 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _586 = _584 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _588 = _568 * _574;
    float _590 = -_568;
    float _592 = _590 + 1.0;
    float _594 = fma(_578, _414, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _596 = _382 * _588;
    float _598 = _536 * _588;
    float _600 = _450 * _588;
    float _602 = fma(_586, _414, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _604 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[143].x, _596);
    float _606 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[143].y, _598);
    float _608 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[143].z, _600);
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _610;
    float _614 = fma(_410, _570, _604);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _616;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _620;
    float _624 = fma(_516, _570, _606);
    float _626 = fma(_518, _570, _608);
    float _628 = fma(_612, _452, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _630 = fma(_618, _452, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _632 = fma(_622, _452, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _634 = fma(_582, _414, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _640 = fma(_552, _550, _614);
    float _642 = fma(_554, _550, _624);
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _652 = fma(_556, _550, _626);
    float _654 = fma(_638, _464, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _656 = fma(_646, _464, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _658 = fma(_650, _464, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _660 = fma(_602, _534, _640);
    float _662 = fma(_594, _534, _642);
    float _664 = fma(_634, _534, _652);
    float _666 = in.m_51.x;
    float _668 = in.m_51.y;
    float _670 = in.m_51.z;
    float _672 = fma(_628, _532, _660);
    float _674 = fma(_630, _532, _662);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _676;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _680;
    float _684 = fma(_632, _532, _664);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _686;
    float _690 = fma(_678, _484, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _692 = fma(_682, _484, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _694 = fma(_654, _494, _672);
    float _696 = fma(_688, _484, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _698 = fma(_656, _494, _674);
    float _700 = fma(_658, _494, _684);
    float _702 = fma(_690, _470, _694);
    float _704 = fma(_692, _470, _698);
    float _706 = fma(_696, _470, _700);
    float _708 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[150].x, _702);
    float _710 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[150].y, _704);
    float _712 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[150].z, _706);
    float _714 = _708 * _666;
    float _716 = _710 * _668;
    float _718 = _712 * _670;
    bool _720 = !_436;
    int _722 = as_type<int>(_606);
    float _740;
    if (!_720)
    {
        float _724 = in.m_55.x;
        float _726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _728 = _724 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _732 = _730 * _726;
        float _734 = floor(_732);
        float _736 = -_734;
        float _738 = _732 + _736;
        _740 = _738;
        _742 = true;
    }
    else
    {
        float _744 = float(_90);
        float _746 = 1.0 / _744;
        float _748 = _124 * _746;
        _740 = _748;
    }
    _742 = false;
    float _750 = _740;
    float _752 = in.m_55.z;
    float _754 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _756 = log2(_754);
    float _758 = _266 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _760 = _266 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _762 = in.m_57.x;
    float _764 = in.m_57.y;
    float _766 = _266 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _768 = _124 * 0.039999999105930328369140625;
    float _770 = in.m_55.y;
    float _772 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].x, _760);
    float _774 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _776 = in.m_55.x;
    float _778 = _768 * 0.15915493667125701904296875;
    float _780 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].x, _758);
    float _782 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _774);
    float _784 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].x, _766);
    float _786 = _124 * _756;
    float _788 = _778 * 6.283185482025146484375;
    float _790 = sin(_788);
    float _792 = _752 * 2.0;
    float _794 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _796 = exp2(_786);
    float _798 = abs(_762);
    float _800 = abs(_764);
    float _802 = precise::max(_798, _800);
    float _804 = _764 * 0.0625;
    bool _806 = _802 >= 16.0;
    float _808 = _762 * 0.0625;
    float _810 = _770 * 6.283185482025146484375;
    float _812 = floor(_792);
    float _814 = _806 ? _804 : _764;
    float _816 = _776 * 2.0;
    float _818 = _806 ? _808 : _762;
    float _820 = fma(_124, 0.007000000216066837310791015625, _810);
    float _822 = abs(_814);
    bool _824 = _822 != 0.0;
    bool _826 = isnan(_822);
    bool _828 = _824 || _826;
    bool _830 = isnan(0.0);
    bool _832 = _828 || _830;
    float _834 = _770 * 2.0;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _838 = 1.0 + _836;
    float _840 = _820 * 0.15915493667125701904296875;
    float _842 = in.m_55.w;
    float _844 = abs(_818);
    bool _846 = _844 == 0.0;
    bool _848 = !_832;
    bool _850 = _846 && _848;
    float _852 = floor(_816);
    float _854 = abs(_818);
    bool _856 = _854 == 0.0;
    float _858 = _776 + _770;
    bool _860 = _812 > 0.0;
    float _862 = _858 + (-1.0);
    bool _864 = _812 >= 0.0;
    bool _866 = isnan(_812);
    bool _868 = _864 || _866;
    bool _870 = isnan(0.0);
    bool _872 = _868 || _870;
    float _874 = floor(_834);
    float _876 = _776 + _752;
    bool _878 = false;
    if (_850)
    {
        bool _880 = as_type<int>(_818) >= 0;
        _878 = _880;
    }
    bool _882 = _878;
    float _884 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _794);
    float _886 = _876 + (-1.0);
    float _888 = 1.0 / _838;
    int _890 = _882 ? (-1) : 0;
    if (_850)
    {
        int _892 = _882 ? 0 : 1078530011;
        _722 = _892;
    }
    int _894 = _722;
    float _896 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _898 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _900 = _842 * 6.283185482025146484375;
    float _902 = _840 * 6.283185482025146484375;
    float _904 = sin(_902);
    float _906 = fma(_124, 0.010999999940395355224609375, _900);
    float _908 = _906 * 0.15915493667125701904296875;
    float _910 = _906;
    int _912 = _894;
    int _914 = as_type<int>(_900);
    if (_850)
    {
        int _916 = int(0x80000000) & as_type<int>(_814);
        int _918 = _894 | _916;
        _910 = as_type<float>(_918);
    }
    float _920 = _910;
    bool _922 = !_832;
    bool _924 = _922 && _856;
    float _926 = _920;
    float _928 = _920;
    if (!_924)
    {
        float _930 = abs(_814);
        bool _932 = _930 != as_type<float>(0x7f800000u /* inf */);
        bool _934 = isnan(_930);
        bool _936 = _932 || _934;
        bool _938 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _940 = _936 || _938;
        float _942 = abs(_818);
        bool _944 = _942 == as_type<float>(0x7f800000u /* inf */);
        float _946 = abs(_818);
        bool _948 = _946 == as_type<float>(0x7f800000u /* inf */);
        bool _950 = !_940;
        bool _952 = _948 && _950;
        if (_952)
        {
            bool _954 = as_type<int>(_818) >= 0;
            _890 = _954 ? (-1) : 0;
        }
        int _956 = _890;
        if (_952)
        {
            _912 = 1075235812;
        }
        int _958 = _912;
        int _960 = _958;
        if (_952)
        {
            int _962 = ~_956;
            int _964 = (_962 != 0) ? _958 : 1061752795;
            _960 = _964;
        }
        int _966 = _960;
        if (_952)
        {
            int _968 = int(0x80000000) & as_type<int>(_814);
            int _970 = _966 | _968;
            _926 = as_type<float>(_970);
        }
        float _972 = _926;
        bool _974 = !_940;
        bool _976 = _974 && _944;
        _928 = _972;
        if (!_976)
        {
            float _978 = abs(_814);
            float _980 = abs(_818);
            float _982 = precise::max(_978, _980);
            float _984 = abs(_814);
            float _986 = abs(_818);
            float _988 = precise::min(_984, _986);
            float _990 = 1.0 / _982;
            float _992 = abs(_814);
            float _994 = abs(_818);
            bool _996 = _992 > _994;
            bool _998 = as_type<int>(_818) >= 0;
            float _1000 = abs(_814);
            float _1002 = abs(_818);
            float _1004 = _1000 + _1002;
            int _1006 = as_type<int>(_814) & int(0x80000000);
            bool _1008 = _1004 > as_type<float>(0x7f800000u /* inf */);
            bool _1010 = isnan(_1004);
            bool _1012 = _1008 || _1010;
            bool _1014 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1016 = _1012 || _1014;
            float _1018 = _988 * _990;
            float _1020 = _1018 * _1018;
            float _1022 = _1020 + 11.33538818359375;
            float _1024 = fma(_1020, _1022, 28.84246826171875);
            float _1026 = fma(_1020, _1024, 19.6966705322265625);
            float _1028 = fma(_1020, -0.82336294651031494140625, -5.674867153167724609375);
            float _1030 = fma(_1020, _1028, -6.565555095672607421875);
            float _1032 = 1.0 / _1026;
            float _1034 = _1020 * _1030;
            float _1036 = _1018 * _1034;
            float _1038 = fma(_1036, _1032, _1018);
            float _1040 = _1038;
            _928 = _1004;
            if (_996)
            {
                float _1042 = -_1038;
                float _1044 = _1042 + 1.57079637050628662109375;
                _1040 = _1044;
            }
            float _1046 = _1040;
            int _1048 = as_type<int>(_1046);
            if (!_998)
            {
                float _1050 = -_1046;
                float _1052 = _1050 + 3.1415927410125732421875;
                _1048 = as_type<int>(_1052);
            }
            int _1054 = _1048;
            if (!_1016)
            {
                int _1056 = _1006 | _1054;
                _928 = as_type<float>(_1056);
            }
        }
    }
    float _1058 = _928;
    float _1060 = fma(_790, 9.0, _124);
    bool _1062 = _852 > 0.0;
    float _1064 = abs(_904);
    float _1066 = log2(_1064);
    bool _1068 = _852 >= 0.0;
    bool _1070 = isnan(_852);
    bool _1072 = _1068 || _1070;
    bool _1074 = isnan(0.0);
    bool _1076 = _1072 || _1074;
    float _1078 = _1060 * 0.20999999344348907470703125;
    float _1080 = _1060 * (-0.1599999964237213134765625);
    bool _1082 = _874 > 0.0;
    float _1084 = fma(_1058, 5.00000095367431640625, _1078);
    bool _1086 = _874 >= 0.0;
    bool _1088 = isnan(_874);
    bool _1090 = _1086 || _1088;
    bool _1092 = isnan(0.0);
    bool _1094 = _1090 || _1092;
    float _1096 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _782);
    float _1098 = fma(_1058, 4.000000476837158203125, _1080);
    float _1100 = _1084 * 0.15915493667125701904296875;
    float _1102 = -_796;
    float _1104 = _1102 + 1.0;
    bool _1106 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1108 = isnan(0.0);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1114 = _1110 || _1112;
    float _1116 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].z, _784);
    float _1118 = _1098 * 0.15915493667125701904296875;
    float _1120 = _908 * 6.283185482025146484375;
    float _1122 = sin(_1120);
    float _1124 = _1114 ? _1104 : 0.0;
    float _1126 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].z, _780);
    int _1128 = _872 ? 0 : 1;
    float _1130 = _1116 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1132 = _1076 ? 0 : 1;
    float _1134 = _1124 * _888;
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1138 = _1136 != 0;
    int _1140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1142 = _1140 != 0;
    int _1144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1146 = _1144 != 0;
    float _1148 = _1100 * 6.283185482025146484375;
    float _1150 = sin(_1148);
    float _1152 = _1126 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1154 = ~_1128;
    int _1156 = _1154 + 1;
    int _1158 = _1156 + 1;
    float _1160 = -_1130;
    float _1162 = _1160 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _1164 = !_1138;
    int _1166 = _1164 ? 0 : 1;
    float _1168 = _1066 * 120.0;
    int _1170 = _1158;
    float _1172 = _1162;
    bool _1174 = _1082;
    if (!_860)
    {
        int _1176 = ~_1128;
        int _1178 = _1176 + 1;
        _1170 = _1178;
    }
    int _1180 = _1170;
    float _1182 = _1118 * 6.283185482025146484375;
    float _1184 = sin(_1182);
    int _1186 = abs(_1166);
    float _1188 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1190 = _1152 + _1188;
    int _1192 = ~_1132;
    int _1194 = _1192 + 1;
    int _1196 = _1194 + 1;
    int _1198 = _1094 ? 0 : 1;
    int _1200 = _1196;
    if (!_1062)
    {
        int _1202 = ~_1132;
        int _1204 = _1202 + 1;
        _1200 = _1204;
    }
    int _1206 = _1200;
    float _1208 = abs(_1122);
    float _1210 = log2(_1208);
    float _1212 = float(_1180);
    float _1214 = float(_1186);
    bool _1216 = !_1146;
    int _1218 = _1216 ? 0 : 1;
    int _1220 = ~_1198;
    int _1222 = _1220 + 1;
    int _1224 = _1222 + 1;
    float _1226 = rsqrt(_1096);
    int _1228 = _1224;
    if (!_1082)
    {
        int _1230 = ~_1198;
        int _1232 = _1230 + 1;
        _1228 = _1232;
    }
    int _1234 = _1228;
    float _1236 = _1150 + _1184;
    float _1238 = _1214 * _1212;
    int _1240 = abs(_1218);
    float _1242 = in.m_59.x;
    float _1244 = in.m_59.y;
    float _1246 = in.m_59.z;
    float _1248 = precise::max(_1236, -2.0);
    float _1250 = _1238 * (-2.0);
    float _1252 = float(_1234);
    float _1254 = _1210 * 80.0;
    float _1256 = float(_1240);
    float _1258 = fma(_896, _1250, _896);
    float _1260 = abs(_1190);
    float _1262 = abs(_1162);
    float _1264 = precise::max(_1260, _1262);
    float _1266 = exp2(_1254);
    float _1268 = _1256 * _1252;
    float _1270 = precise::min(_1248, 2.0);
    float _1272 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1274 = _1264 >= 16.0;
    float _1276 = _752 + (-0.5);
    bool _1278 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1280 = isnan(1.0);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1286 = _1282 || _1284;
    float _1288 = fma(_1270, 0.25, 0.5);
    float _1290 = exp2(_1168);
    float _1292 = _1268 * (-2.0);
    float _1294 = _1272 * (-0.15915493667125701904296875);
    float _1296 = _1288 * 0.07999999821186065673828125;
    bool _1298 = !_1286;
    float _1300 = _1298 ? _124 : _1134;
    float _1302 = fma(_898, _1292, _898);
    float _1304 = _1276 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1306 = _1296 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1308 = _1190 * 0.0625;
    float _1310 = _776 + (-0.5);
    if (_1274)
    {
        float _1312 = _1162 * 0.0625;
        _1172 = _1312;
    }
    float _1314 = _1172;
    float _1316 = _1294 * 6.283185482025146484375;
    float _1318 = sin(_1316);
    float _1320 = _1310 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1322 = _776 * 6.283185482025146484375;
    float _1324 = abs(_1314);
    bool _1326 = _1324 == 0.0;
    float _1328 = _1266 + _1290;
    float _1330 = fma(_1300, _1258, _1320);
    float _1332 = fma(_1300, _1302, _1304);
    float _1334 = fma(_764, _1306, _1244);
    bool _1336 = !_1142;
    int _1338 = _1336 ? 0 : 1;
    float _1340 = _1330 * 0.15915493667125701904296875;
    float _1342 = _770 + _752;
    float _1344 = _124 * (-0.17000000178813934326171875);
    int _1346 = abs(_1338);
    float _1348 = _1294 * 6.283185482025146484375;
    float _1350 = cos(_1348);
    float _1352 = _1274 ? _1308 : _1190;
    float _1354 = _770 + (-0.5);
    float _1356 = _1342 + (-1.0);
    float _1358 = _1332 * 0.15915493667125701904296875;
    float _1360 = fma(_1334, 16.0, _1344);
    float _1362 = abs(_1352);
    bool _1364 = _1362 != 0.0;
    bool _1366 = isnan(_1362);
    bool _1368 = _1364 || _1366;
    bool _1370 = isnan(0.0);
    bool _1372 = _1368 || _1370;
    float _1374 = _1340 * 6.283185482025146484375;
    float _1376 = sin(_1374);
    float _1378 = float(_1206);
    float _1380 = _1360 + _1322;
    float _1382 = abs(_1314);
    bool _1384 = _1382 == 0.0;
    bool _1386 = !_1372;
    bool _1388 = _1384 && _1386;
    float _1390 = fma(_1356, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1392 = float(_1346);
    float _1394 = _1380 * 0.15915493667125701904296875;
    float _1396 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1398 = _1340 * 6.283185482025146484375;
    float _1400 = cos(_1398);
    float _1402 = _1392 * _1378;
    float _1404 = _124 * (-0.37000000476837158203125);
    float _1406 = _1402 * (-2.0);
    float _1408 = fma(_1334, 5.0, _1404);
    float _1410 = _1358 * 6.283185482025146484375;
    float _1412 = sin(_1410);
    int _1414 = as_type<int>(_1354);
    if (_1388)
    {
        bool _1416 = as_type<int>(_1314) >= 0;
        _1174 = _1416;
    }
    bool _1418 = _1174;
    float _1420 = _770 * (-0.87964594364166259765625);
    float _1422 = _1408 + _900;
    float _1424 = fma(_1390, _1406, _1390);
    int _1426 = _1418 ? (-1) : 0;
    if (_1388)
    {
        int _1428 = _1418 ? 0 : 1078530011;
        _914 = _1428;
    }
    int _1430 = _914;
    float _1432 = fma(_1334, 9.0, _1420);
    float _1434 = _1422 * 0.15915493667125701904296875;
    float _1436 = _1394 * 6.283185482025146484375;
    float _1438 = sin(_1436);
    if (_1388)
    {
        int _1440 = int(0x80000000) & as_type<int>(_1352);
        int _1442 = _1430 | _1440;
        _1414 = _1442;
    }
    int _1444 = _1414;
    bool _1446 = !_1372;
    bool _1448 = _1446 && _1326;
    int _1450 = _1444;
    float _1452 = as_type<float>(_1444);
    if (!_1448)
    {
        float _1454 = abs(_1352);
        bool _1456 = _1454 != as_type<float>(0x7f800000u /* inf */);
        bool _1458 = isnan(_1454);
        bool _1460 = _1456 || _1458;
        bool _1462 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1464 = _1460 || _1462;
        float _1466 = abs(_1314);
        bool _1468 = _1466 == as_type<float>(0x7f800000u /* inf */);
        float _1470 = abs(_1314);
        bool _1472 = _1470 == as_type<float>(0x7f800000u /* inf */);
        bool _1474 = !_1464;
        bool _1476 = _1472 && _1474;
        if (_1476)
        {
            bool _1478 = as_type<int>(_1314) >= 0;
            _1426 = _1478 ? (-1) : 0;
        }
        int _1480 = _1426;
        if (_1476)
        {
            _1450 = 1075235812;
        }
        int _1482 = _1450;
        int _1484 = _1482;
        if (_1476)
        {
            int _1486 = ~_1480;
            int _1488 = (_1486 != 0) ? _1482 : 1061752795;
            _1484 = _1488;
        }
        int _1490 = _1484;
        float _1492 = as_type<float>(_1490);
        if (_1476)
        {
            int _1494 = int(0x80000000) & as_type<int>(_1352);
            int _1496 = _1490 | _1494;
            _1492 = as_type<float>(_1496);
        }
        float _1498 = _1492;
        bool _1500 = !_1464;
        bool _1502 = _1500 && _1468;
        _1452 = _1498;
        if (!_1502)
        {
            float _1504 = abs(_1352);
            float _1506 = abs(_1314);
            float _1508 = precise::max(_1504, _1506);
            float _1510 = abs(_1352);
            float _1512 = abs(_1314);
            float _1514 = precise::min(_1510, _1512);
            float _1516 = 1.0 / _1508;
            float _1518 = abs(_1352);
            float _1520 = abs(_1314);
            bool _1522 = _1518 > _1520;
            bool _1524 = as_type<int>(_1314) >= 0;
            float _1526 = _1514 * _1516;
            float _1528 = _1526 * _1526;
            float _1530 = _1528 + 11.33538818359375;
            float _1532 = fma(_1528, _1530, 28.84246826171875);
            float _1534 = fma(_1528, _1532, 19.6966705322265625);
            float _1536 = fma(_1528, -0.82336294651031494140625, -5.674867153167724609375);
            float _1538 = fma(_1528, _1536, -6.565555095672607421875);
            float _1540 = 1.0 / _1534;
            float _1542 = _1528 * _1538;
            float _1544 = abs(_1352);
            float _1546 = abs(_1314);
            float _1548 = _1544 + _1546;
            int _1550 = as_type<int>(_1352) & int(0x80000000);
            float _1552 = _1526 * _1542;
            bool _1554 = _1548 > as_type<float>(0x7f800000u /* inf */);
            bool _1556 = isnan(_1548);
            bool _1558 = _1554 || _1556;
            bool _1560 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1562 = _1558 || _1560;
            float _1564 = fma(_1552, _1540, _1526);
            float _1566 = _1564;
            _1452 = _1548;
            if (_1522)
            {
                float _1568 = -_1564;
                float _1570 = _1568 + 1.57079637050628662109375;
                _1566 = _1570;
            }
            float _1572 = _1566;
            int _1574 = as_type<int>(_1572);
            if (!_1524)
            {
                float _1576 = -_1572;
                float _1578 = _1576 + 3.1415927410125732421875;
                _1574 = as_type<int>(_1578);
            }
            int _1580 = _1574;
            if (!_1562)
            {
                int _1582 = _1550 | _1580;
                _1452 = as_type<float>(_1582);
            }
        }
    }
    float _1584 = _1452;
    float _1586 = _810 + _1432;
    float _1588 = fma(_1300, _1424, _1396);
    float _1590 = _1434 * 6.283185482025146484375;
    float _1592 = sin(_1590);
    float _1594 = _1586 * 0.15915493667125701904296875;
    float _1596 = _1318 * _1246;
    float _1598 = fma(_1334, 0.5, 0.5);
    float _1600 = precise::clamp(_1598, 0.0, 1.0);
    float _1602 = _1350 * _1246;
    float _1604 = fma(_762, _1306, _1242);
    float _1606 = _1594 * 6.283185482025146484375;
    float _1608 = sin(_1606);
    float _1610 = fma(_1600, -2.0, 3.0);
    float _1612 = _1600 * _1600;
    float _1614 = fma(_1334, 0.58823525905609130859375, 0.411764681339263916015625);
    float _1616 = precise::clamp(_1614, 0.0, 1.0);
    float _1618 = _1438 * 0.064000003039836883544921875;
    float _1620 = _1610 * _1612;
    float _1622 = -_1584;
    float _1624 = _1588 + _1622;
    float _1626 = fma(_1616, -2.0, 3.0);
    float _1628 = _1616 * _1616;
    float _1630 = _1620 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1632 = _1592 * _1328;
    float _1634 = _752 * 6.283185482025146484375;
    float _1636 = _1626 * _1628;
    float _1638 = fma(_1618, _1630, _1604);
    float _1640 = _1632 * 0.180000007152557373046875;
    float _1642 = _1608 * 0.07299999892711639404296875;
    float _1644 = _1624 * 0.15915493667125701904296875;
    float _1646 = _1334 + 0.20000000298023223876953125;
    float _1648 = _1640 * _1636;
    float _1650 = fma(_1642, _1630, _1638);
    float _1652 = fma(_124, 0.310000002384185791015625, _1634);
    float _1654 = _1358 * 6.283185482025146484375;
    float _1656 = cos(_1654);
    float _1658 = -_1596;
    float _1660 = fma(_1350, _1646, _1658);
    float _1662 = fma(_1648, (*spvDescriptorSet0.vp_c9)._m0[191].x, _1650);
    float _1664 = _1652 * 0.15915493667125701904296875;
    float _1666 = _714 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1668 = _1660 + (-0.20000000298023223876953125);
    float _1670 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1662);
    float _1672 = fma(_124, 0.10999999940395355224609375, _1322);
    float _1674 = _1644 * 6.283185482025146484375;
    float _1676 = sin(_1674);
    float _1678 = _716 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1680 = _1670 * _1666;
    float _1682 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1668);
    float _1684 = _1672 * 0.15915493667125701904296875;
    float _1686 = fma(_1318, _1646, _1602);
    float _1688 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1690 = _1678 * _1682;
    float _1692 = _1644 * 6.283185482025146484375;
    float _1694 = cos(_1692);
    float _1696 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1686);
    float _1698 = _1656 * _1690;
    float _1700 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].z, _772);
    float _1702 = -_1690;
    float _1704 = _1412 * _1702;
    float _1706 = _1696 * _1688;
    float _1708 = _1400 * _1698;
    float _1710 = _1376 * _1676;
    float _1712 = _1400 * _1676;
    float _1714 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _884);
    float _1716 = 1.0 / _1678;
    float _1718 = _1700 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1720 = _1376 * _1698;
    float _1722 = _1676 * _1656;
    float _1724 = _1400 * _1694;
    float _1726 = _1376 * _1694;
    float _1728 = _1694 * _1656;
    float _1730 = _1664 * 6.283185482025146484375;
    float _1732 = sin(_1730);
    float _1734 = fma(_1412, _1724, _1710);
    float _1736 = -_1712;
    float _1738 = fma(_1412, _1726, _1736);
    float _1740 = fma(_1412, _1710, _1724);
    float _1742 = fma(_1728, _1680, _1704);
    float _1744 = fma(_1734, _1680, _1708);
    float _1746 = -_1726;
    float _1748 = fma(_1412, _1712, _1746);
    float _1750 = fma(_1738, _1680, _1720);
    float _1752 = sqrt(_1714);
    float _1754 = fma(_1722, _1706, _1742);
    float _1756 = fma(_1748, _1706, _1744);
    float _1758 = fma(_1740, _1706, _1750);
    float _1760 = _1152 + _1754;
    float _1762 = _1718 + _1756;
    float _1764 = _1130 + _1758;
    float _1766 = _1684 * 6.283185482025146484375;
    float _1768 = sin(_1766);
    float _1770 = fma(_1732, 0.12999999523162841796875, 1.0);
    float _1772 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1774 = _1762 + _1772;
    float _1776 = _1774 * _1716;
    float _1778 = _1752 * 0.64999997615814208984375;
    float _1780 = fma(_1776, _1776, _1776);
    float _1782 = _1780 * _1778;
    float _1784 = fma(_1768, 0.300000011920928955078125, _1770);
    float _1786 = _1784 * _1782;
    float _1788 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[32].z, _1764);
    float _1790 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[32].x, _1760);
    float _1792 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[32].y, _1762);
    float _1794 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1796 = _1788 + _1794;
    float _1798 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1800 = _1790 + _1798;
    float _1802 = _1796 * _1796;
    float _1804 = fma(_1800, _1800, _1802);
    float _1806 = sqrt(_1804);
    bool _1808 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1810 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1812 = _1808 || _1810;
    bool _1814 = isnan(0.5);
    bool _1816 = _1812 || _1814;
    bool _1818 = _1806 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1820 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1822 = _1738;
    float _1824 = _1790;
    float _1826 = _1786;
    float _1828 = _1752;
    float _1830 = _1704;
    if (!_1818)
    {
        _1820 = _1788;
    }
    float _1832 = _1820;
    float _1834 = _1832;
    if (!_1818)
    {
        _1822 = _1792;
    }
    float _1836 = _1822;
    bool _1838 = !_1818;
    float _1840 = _1836;
    if (!_1838)
    {
        float _1842 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1844 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1846 = _1806 + _1844;
        float _1848 = rsqrt(_1804);
        float _1850 = _1846 * _1842;
        float _1852 = _1792 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1854 = _1850 * 0.15915493667125701904296875;
        float _1856 = _1854 * 6.283185482025146484375;
        float _1858 = sin(_1856);
        float _1860 = _1854 * 6.283185482025146484375;
        float _1862 = cos(_1860);
        float _1864 = fma(_1858, _1852, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1866 = _1848 * _1864;
        float _1868 = _1862 + (-1.0);
        float _1870 = fma(_1800, _1866, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1872 = fma(_1796, _1866, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1874 = _1868 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1876 = fma(_1792, _1862, _1874);
        _1840 = _1876;
        _1824 = _1870;
        _1834 = _1872;
    }
    float _1878 = _1840;
    float _1880 = _1824;
    float _1882 = _1834;
    float _1884 = _1878;
    float _1886 = _1880;
    float _1888 = _1882;
    if (!_1816)
    {
        float _1890 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1892 = _1718 + _1890;
        float _1894 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1896 = -_1718;
        float _1898 = _1896 + _1878;
        float _1900 = _1892 * _1892;
        float _1902 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1904 = _1130 + _1902;
        float _1906 = fma(_1190, _1190, _1900);
        float _1908 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1910 = fma(_1904, _1904, _1906);
        float _1912 = _1894 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1914 = sqrt(_1910);
        float _1916 = precise::min(_1914, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1918 = _1916 * _1908;
        float _1920 = -_1152;
        float _1922 = _1920 + _1880;
        float _1924 = _1912 * _1918;
        float _1926 = -_1130;
        float _1928 = _1926 + _1882;
        float _1930 = fma(_1922, _1924, _1152);
        float _1932 = fma(_1898, _1924, _1718);
        float _1934 = fma(_1928, _1924, _1130);
        _1884 = _1932;
        _1886 = _1930;
        _1888 = _1934;
    }
    float _1936 = _1884;
    float _1938 = _1886;
    float _1940 = _1888;
    float _1942 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1944 = _1936 + _1942;
    float _1946 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1948 = _1938 + _1946;
    float _1950 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1952 = _1940 + _1950;
    float _1954 = _1944 * _1944;
    float _1956 = fma(_1948, _1948, _1954);
    float _1958 = fma(_1952, _1952, _1956);
    float _1960 = rsqrt(_1958);
    float _1962 = sqrt(_1958);
    float _1964 = _1960 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1966 = _1948 * _1964;
    float _1968 = _1952 * _1964;
    float _1970 = _1966 * _1966;
    float _1972 = _1968 * _1968;
    float _1974 = _1970 + _1972;
    float _1976 = sqrt(_1974);
    bool _1978 = _1976 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1980 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1982 = _1976 + _1980;
    float _1984 = _1952;
    float _1986 = _1982;
    float _1988 = _1944;
    if (_1978)
    {
        float _1990 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1984 = _1990;
    }
    float _1992 = _1984;
    if (_1978)
    {
        float _1994 = rsqrt(_1974);
        _1826 = _1994;
    }
    float _1996 = _1826;
    float _1998 = _1996;
    if (_1978)
    {
        float _2000 = _1982 * _1992;
        _1986 = _2000;
    }
    float _2002 = _1986;
    if (_1978)
    {
        float _2004 = _2002 * 0.15915493667125701904296875;
        _1828 = _2004;
    }
    float _2006 = _1828;
    float _2008 = _1960;
    if (_1978)
    {
        float _2010 = _2006 * 6.283185482025146484375;
        float _2012 = sin(_2010);
        _2008 = _2012;
    }
    float _2014 = _2008;
    float _2016 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2018 = precise::max(0.0, _2016);
    float _2020 = _1954;
    float _2022 = _2018;
    float _2024 = _2016;
    if (_1978)
    {
        float _2026 = _2006 * 6.283185482025146484375;
        float _2028 = cos(_2026);
        _2020 = _2028;
    }
    float _2030 = _2020;
    float _2032 = -_1964;
    float _2034 = -_2018;
    float _2036 = fma(_1944, _2032, _2034);
    if (!_1978)
    {
        _1988 = _1968;
    }
    float _2038 = _1988;
    float _2040 = _2038;
    if (_1978)
    {
        float _2042 = _2036 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2022 = _2042;
    }
    float _2044 = _2022;
    float _2046 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2048 = _1936 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2050 = _2044;
    float _2052 = _2014;
    if (_1978)
    {
        float _2054 = fma(_2014, _2044, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2050 = _2054;
    }
    float _2056 = _2050;
    float _2058 = _2056;
    if (!_1978)
    {
        _2052 = _1966;
    }
    float _2060 = _2052;
    float _2062 = _2060;
    float _2064 = _2030;
    if (_1978)
    {
        float _2066 = _2030 + (-1.0);
        _2024 = _2066;
    }
    float _2068 = _2024;
    float _2070 = _2068;
    if (_1978)
    {
        float _2072 = _1996 * _2056;
        _1830 = _2072;
    }
    float _2074 = _1830;
    if (!_1978)
    {
        _2058 = _2036;
    }
    float _2076 = _2058;
    float _2078 = _2076;
    if (_1978)
    {
        float _2080 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1998 = _2080;
    }
    float _2082 = _1998;
    if (_1978)
    {
        float _2084 = _1966 * _2074;
        _2062 = _2084;
    }
    float _2086 = _2062;
    if (!_1978)
    {
        _2070 = _1970;
    }
    float _2088 = _2070;
    float _2090 = _2088;
    if (_1978)
    {
        float _2092 = _1968 * _2074;
        _2040 = _2092;
    }
    float _2094 = _2040;
    if (_1978)
    {
        float _2096 = fma(_2036, _2030, _2082);
        _2078 = _2096;
    }
    float _2098 = _2078;
    if (_1978)
    {
        float _2100 = _2086 * _2086;
        _2090 = _2100;
    }
    float _2102 = _2090;
    if (!_1978)
    {
        _2064 = _1972;
    }
    float _2104 = _2064;
    float _2106 = _2104;
    if (_1978)
    {
        float _2108 = _2094 * _2094;
        _2106 = _2108;
    }
    float _2110 = _2106;
    float _2112 = fma(_2098, _2098, _2102);
    float _2114 = _1936 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2116 = _2112 + _2110;
    float _2118 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2120 = fma(_1962, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2118);
    float _2122 = precise::clamp(_2120, 0.0, 1.0);
    float _2124 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2114);
    float _2126 = _1936 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2128 = -_2122;
    float _2130 = _2128 + 1.0;
    float _2132 = rsqrt(_2116);
    float _2134 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2124);
    float _2136 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2126);
    float _2138 = _1936 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2140 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2048);
    float _2142 = _2134 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2144 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2136);
    float _2146 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2138);
    float _2148 = abs(_2130);
    float _2150 = log2(_2148);
    float _2152 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2140);
    float _2154 = _2144 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2156 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2146);
    float _2158 = _2142 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2160 = _2152 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2162 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2164 = _2156 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2166 = _2132 * _2086;
    float _2168 = _2132 * _2098;
    float _2170 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2162);
    float _2172 = _2132 * _2094;
    float _2174 = _2166 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2176 = -_2158;
    float _2178 = fma(_2176, _2046, 1.0);
    float _2180 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2170);
    float _2182 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2184 = -_2174;
    float _2186 = fma(_2168, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2184);
    float _2188 = _2150 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2190 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2180);
    float _2192 = log2(_2178);
    float _2194 = -_2172;
    float _2196 = fma(_2194, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2186);
    float _2198 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2200 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2182);
    float _2202 = _2168 + 1.0;
    float _2204 = fma(_2196, -0.5, 0.5);
    float _2206 = fma(_2196, 0.5, 0.5);
    float _2208 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2198);
    float _2210 = exp2(_2188);
    float _2212 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2200);
    float _2214 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2208);
    float _2216 = 1.0 / _2190;
    float _2218 = fma(_2206, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2220 = _2192 * 0.693147182464599609375;
    float _2222 = fma(_2206, _2218, -0.212114393711090087890625);
    float _2224 = _2220 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2226 = sqrt(_2204);
    float _2228 = -_2168;
    float _2230 = fma(_2210, _2202, _2228);
    float _2232 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2212);
    float _2234 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2214);
    float _2236 = fma(_2206, _2222, 1.570728778839111328125);
    float _2238 = fma(_2230, 0.5, 0.5);
    float _2240 = _2232 * _2216;
    float _2242 = _2234 * _2216;
    float _2244 = fma(_2240, 0.5, 0.5);
    float _2246 = fma(_2242, -0.5, 0.5);
    float _2248 = _2226 * 0.636619746685028076171875;
    float _2250 = -_2236;
    float _2252 = fma(_2248, _2250, 1.0);
    float3 _6162 = float3(_2244, _2246, _2224);
    float _2254 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6162, float3(0.0), isnan(_6162)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6162, float3(0.0), isnan(_6162)), level(0.0)).x;
    float3 _6173 = float3(_2244, _2246, _2224);
    float4 _2257 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6173, float3(0.0), isnan(_6173)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6173, float3(0.0), isnan(_6173)), level(0.0)).xyzw;
    float _2259 = _2257.x;
    float _2261 = _2257.y;
    float _2263 = _2257.z;
    float _2265 = _2257.w;
    float2 _6190 = float2(_2252, _2238);
    float3 _2269 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6190, float2(0.0), isnan(_6190)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6190, float2(0.0), isnan(_6190)), level(0.0)).xyz;
    float _2271 = _2269.x;
    float _2273 = _2269.y;
    float _2275 = _2269.z;
    float _2277 = in.m_57.w;
    float _2279 = _776 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2281 = _770 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2285 = _2283 != 0;
    float _2287 = in.m_49.x;
    int _2289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2291 = _2289 != 0;
    float _2293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2297 = _2295 != 0;
    float _2299 = _2150 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2303 = _2301 != 0;
    bool _2305 = _842 > 0.5;
    float _2307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2309 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2311 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2313 = _2309 || _2311;
    bool _2315 = isnan(0.5);
    bool _2317 = _2313 || _2315;
    float _2319 = _1716;
    bool _2321 = _2297;
    bool _2323 = _2303;
    if (_2291)
    {
        float _2325 = in.m_55.z;
        _2319 = _2325;
    }
    float _2327 = _2319;
    int _2329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2331 = _2329 != 0;
    float _2333 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2335 = _2333 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    out.m_61.w = _2277;
    float _2337 = 1.0 / _2335;
    float _2339 = _2293 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2341 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2343 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2345 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2347 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2349 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2351 = _2343 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2353 = _2345 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2355 = _2341 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2357 = -_2347;
    float _2359 = fma(_2279, 2.0, _2357);
    float _2361 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2363 = _2361 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2365 = fma(_2281, -2.0, _2349);
    float _2367 = 1.0 / _2363;
    float _2369 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2371 = _2369 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2373 = -_124;
    float _2375 = fma(_2373, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2359);
    float _2377 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2379 = _2377 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _2381 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2383 = -_144;
    float _2385 = _2383 + 1.0;
    float _2387 = 1.0 / _2379;
    float _2389 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2391 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2389;
    out.m_63.x = _2351;
    out.m_63.y = _2353;
    out.m_63.z = _2355;
    out.m_63.w = _2381;
    int _2393 = _2305 ? as_type<int>(_2385) : as_type<int>(_144);
    float _2395 = _2391 * _2337;
    bool _2397 = _770 > 0.5;
    float _2399 = _2391;
    float _2401 = _2371;
    float _2403 = _2379;
    if (!_2331)
    {
        float _2405 = in.m_55.z;
        _2399 = _2405;
    }
    float _2407 = _2399;
    float _2409 = _2297 ? as_type<float>(_2393) : _144;
    float _2411 = _2371 * _2367;
    if (_2291)
    {
        bool _2413 = _2327 > 0.5;
        _2321 = _2413;
    }
    bool _2415 = _2321;
    float _2417 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2419 = _750 + _2417;
    float _2421 = exp2(_2299);
    if (_2303)
    {
        float _2423 = _2397 ? _2385 : _144;
        _192 = _2423;
    }
    float _2425 = _192;
    if (!_2331)
    {
        _2401 = _770;
    }
    float _2427 = _2401;
    float _2429 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2431 = _750 + _2429;
    float _2433 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2435 = fma(_2395, _2431, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2437 = _2427;
    if (_2285)
    {
        bool _2439 = _776 > 0.5;
        _2323 = _2439;
    }
    bool _2441 = _2323;
    float _2443 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2445 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _2443;
    if (_2331)
    {
        _2437 = _776;
    }
    float _2447 = _2437;
    float _2449 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _2451 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2453 = isnan(_750);
    bool _2455 = _2451 || _2453;
    bool _2457 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2459 = _2455 || _2457;
    float _2461 = float(_2459);
    float _2463 = _2445 * _2387;
    bool _2465 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2467 = isnan(_750);
    bool _2469 = _2465 || _2467;
    bool _2471 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2473 = _2469 || _2471;
    float _2475 = float(_2473);
    float _2477 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2449);
    float _2479 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2481 = _750 + _2479;
    float _2483 = _2481;
    float _2485 = _2449;
    if (!_2285)
    {
        _2403 = _2287;
    }
    float _2487 = _2403;
    float _2489 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2433);
    float _2491 = -_2475;
    float _2493 = _2491 + 1.0;
    float _2495 = fma(_2411, _2481, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2497 = _2407;
    float _2499 = _2487;
    float _2501 = _2495;
    if (!_2331)
    {
        _2483 = _2407;
    }
    float _2503 = _2483;
    float _2505 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2489);
    float _2507 = _2503;
    float _2509 = _2505;
    if (_2331)
    {
        _2507 = _770;
    }
    float _2511 = _2507;
    float _2513 = -_2421;
    float _2515 = _2513 + 1.0;
    if (_2331)
    {
        _2497 = _770;
    }
    float _2517 = _2497;
    float _2519 = _2461 * _2493;
    if (!_2285)
    {
        _2485 = _2487;
    }
    float _2521 = _2485;
    float _2523 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2525 = _2521;
    if (_2285)
    {
        _2499 = _2287;
    }
    float _2527 = _2499;
    float _2529 = -_2461;
    float _2531 = _2529 + 1.0;
    bool _2533 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2535 = isnan(_750);
    bool _2537 = _2533 || _2535;
    bool _2539 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2541 = _2537 || _2539;
    float _2543 = float(_2541);
    float _2545 = _2515 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2547 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2549 = isnan(_750);
    bool _2551 = _2547 || _2549;
    bool _2553 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2555 = _2551 || _2553;
    float _2557 = float(_2555);
    float _2559 = fma(_2409, _2339, -0.5);
    float _2561 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2523);
    float _2563 = fma(_2463, _2419, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2565 = _2557 * _2531;
    float _2567 = -_2557;
    float _2569 = _2567 + 1.0;
    float _2571 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2561);
    float _2573 = _2307 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2575 = _2543 * _2569;
    float _2577 = _2571 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2579 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2581 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2583 = _2435 * _2575;
    float _2585 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2587 = fma(_2447, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2579);
    float _2589 = 1.0 / _2577;
    float _2591 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2581);
    float _2593 = _2447 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2595 = fma(_2573, _2425, -0.5);
    float _2597 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2591);
    float _2599 = -_2585;
    float _2601 = fma(_2593, 2.0, _2599);
    int _2603 = as_type<int>(_2581);
    int _2605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[83].w);
    float _2607 = _2543;
    float _2609 = _2527;
    if (_2291)
    {
        float _2611 = -_2527;
        float _2613 = _2611 + 1.0;
        _2603 = as_type<int>(_2613);
    }
    int _2615 = _2603;
    float _2617 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_2285)
    {
        float _2619 = -_2527;
        float _2621 = _2619 + 1.0;
        _2605 = as_type<int>(_2621);
    }
    int _2623 = _2605;
    float _2625 = _2597 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2629 = fma(_2517, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2617);
    float _2631 = -_124;
    float _2633 = fma(_2631, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2601);
    float _2635 = _2625 + _2577;
    if (_2285)
    {
        float _2637 = _2441 ? as_type<float>(_2623) : _2527;
        _2525 = _2637;
    }
    float _2639 = _2525;
    float _2641 = -_2543;
    float _2643 = _2641 + 1.0;
    if (!_2317)
    {
        _2607 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2645 = _2607;
    float _2647 = _2635 * _2589;
    float _2649 = _2647 * 0.5;
    float _2651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2653 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2365);
    float _2655 = fma(_2643, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2583);
    float _2657 = _2645;
    float _2659 = _2649;
    if (!_2317)
    {
        float _2661 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2663 = fma(_2649, _2645, _2661);
        _2657 = _2663;
    }
    float _2665 = _2657;
    if (!_2317)
    {
        _2659 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2667 = _2659;
    float _2669 = _2511 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_2291)
    {
        float _2671 = _2415 ? as_type<float>(_2615) : _2527;
        _2609 = _2671;
    }
    float _2673 = _2609;
    float _2675 = -_2653;
    float _2677 = fma(_2505, _2595, _2675);
    float _2679 = _2627 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2681 = _2665;
    if (!_2317)
    {
        float _2683 = 1.0 / _2665;
        _2681 = _2683;
    }
    float _2685 = _2681;
    if (!_2317)
    {
        float _2687 = -_2667;
        float _2689 = _2687 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2509 = _2689;
    }
    float _2691 = _2509;
    float _2693 = fma(_2679, _2673, -0.5);
    float _2695 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2629);
    float _2697 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2699 = fma(_2495, _2565, _2655);
    float _2701 = _2651 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2703 = _2677 + 0.5;
    float _2705 = _2673;
    if (!_2317)
    {
        float _2707 = 1.0 / _2691;
        _2705 = _2707;
    }
    float _2709 = _2705;
    float _2711 = fma(_2669, -2.0, _2697);
    float _2713 = fma(_2701, _2639, -0.5);
    float _2715 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2587);
    float _2717 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2477);
    float _2719 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2711);
    float _2721 = fma(_2563, _2519, _2699);
    float _2723 = fma(_2715, _2693, _2633);
    float _2725 = fma(_2717, _2713, _2375);
    float _2727 = _2723;
    if (!_2317)
    {
        float _2729 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2731 = -_2667;
        float _2733 = fma(_2685, _2729, _2731);
        _2501 = _2733;
    }
    float _2735 = _2501;
    float _2737 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2739 = -_2719;
    float _2741 = fma(_2695, _2559, _2739);
    float _2743 = _2723 + 0.5;
    float _2745 = _2725 + 0.5;
    if (_2317)
    {
        _2727 = 1.0;
    }
    float _2747 = _2727;
    float _2749 = fma(_2475, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2721);
    float _2751 = _2747;
    if (!_2317)
    {
        float _2753 = _2735 * _2709;
        float _2755 = precise::clamp(_2753, 0.0, 1.0);
        _2751 = _2755;
    }
    float _2757 = _2751;
    float _2759 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2737);
    float _2761 = _2741 + 0.5;
    float _2763 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2759);
    float _2765 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2767 = _2190 * 0.5;
    float _2769 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2771 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2763);
    float _2773 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2775 = _2757 > 0.0;
    bool _2777 = isnan(_2757);
    bool _2779 = _2775 || _2777;
    bool _2781 = isnan(0.0);
    bool _2783 = _2779 || _2781;
    out.m_65.x = _2745;
    out.m_65.y = _2703;
    out.m_65.z = _2743;
    out.m_65.w = _2761;
    float _2785 = _2765 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2787 = _2769 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2789 = _2773 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2791 = _2749 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2793 = _2757 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2795 = -_2545;
    float _2797 = _2795 + 1.0;
    out.gl_Position.x = _2232;
    out.gl_Position.y = _2234;
    out.gl_Position.z = _2771;
    out.gl_Position.w = _2190;
    float _2799 = _2793 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.x = _2785;
    out.m_67.y = _2787;
    out.m_67.z = _2789;
    out.m_67.w = _2791;
    float _2801 = fma(_2234, -0.5, _2767);
    float _2803 = _2771 + _2190;
    float _2805 = _2232 + _2190;
    out.m_45.x = _2799;
    float _2807 = _2803 * 0.5;
    float _2809 = _2805 * 0.5;
    out.m_69.x = _2809;
    out.m_69.y = _2801;
    out.m_69.z = _2807;
    out.m_69.w = _2190;
    float _2811 = _2545 * _2254;
    float _2813 = _2265 * _2797;
    float _2815 = _2265 * _2811;
    float _2817 = _2275 * _2811;
    float _2819 = fma(_2271, _2815, _2259);
    float _2821 = fma(_2273, _2815, _2261);
    float _2823 = fma(_2265, _2817, _2263);
    out.m_71.x = _2819;
    out.m_71.y = _2821;
    out.m_71.z = _2823;
    out.m_71.w = _2813;
    if (_2783)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2825 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2825;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _742 = false;
    bool _290 = false;
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
        float _2882 = as_type<float>(_106);
        out.gl_Position.z = _2882;
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
        float _2951 = as_type<float>(_142);
        out.gl_Position.z = _2951;
    }
    if (_134)
    {
        return out;
    }
    float _144 = in.m_49.y;
    float _146 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _148 = in.m_51.w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_47.x;
    float _162 = in.m_47.y;
    float _164 = in.m_47.z;
    float _166 = in.m_42.x;
    float _168 = in.m_42.y;
    float _170 = in.m_42.z;
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
    out.m_53.y = _144;
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
    float _252 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _254 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _256 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _258 = fma(_248, _160, _252);
    float _260 = fma(_248, _162, _254);
    float _262 = fma(_248, _164, _256);
    float _264 = fma(_258, _148, _166);
    float _266 = fma(_260, _148, _168);
    float _268 = fma(_262, _148, _170);
    bool _270 = !_250;
    float _288;
    if (!_270)
    {
        float _272 = in.m_55.x;
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
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _302 = _298 + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _306 = _298 + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _324 = 1.0 / _310;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _334 = 1.0 / _314;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _344;
    bool _348 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _350 = isnan(_298);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    float _360 = 1.0 / _322;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _362;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _368 = _298 + _366;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _370;
    float _374 = _368 * _324;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _378 = _298 + _376;
    float _380 = 1.0 / _328;
    float _382 = fma(_338, _374, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _384 = _378 * _334;
    bool _386 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _388 = isnan(_298);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    bool _398 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _400 = isnan(_298);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = fma(_342, _384, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _412 = 1.0 / _332;
    float _414 = _302 * _360;
    bool _416 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _418 = isnan(_298);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = -_396;
    float _430 = _428 + 1.0;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _434 = _298 + _432;
    bool _436 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _438 = 1.0 / _318;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _440;
    float _444 = 1.0 / _364;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _448 = _298 + _446;
    float _450 = fma(_442, _374, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _452 = _448 * _380;
    float _454 = _306 * _438;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _458 = _298 + _456;
    float _460 = -_426;
    float _462 = _460 + 1.0;
    float _464 = _458 * _412;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _470 = _426 * _430;
    bool _472 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _474 = isnan(_298);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = _434 * _444;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _486;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _494 = _408 * _462;
    float _496 = -_408;
    float _498 = _496 + 1.0;
    bool _500 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _502 = isnan(_298);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = -_482;
    float _514 = _512 + 1.0;
    float _516 = fma(_492, _384, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _518 = fma(_468, _384, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _520 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _522 = isnan(_298);
    bool _524 = _520 || _522;
    bool _526 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _528 = _524 || _526;
    float _530 = float(_528);
    float _532 = _482 * _498;
    float _534 = _510 * _514;
    float _536 = fma(_488, _374, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _538 = -_510;
    float _540 = _538 + 1.0;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _542;
    float _546 = -_530;
    float _548 = _546 + 1.0;
    float _550 = _530 * _540;
    float _552 = fma(_544, _454, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _554 = fma(_346, _454, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _556 = fma(_372, _454, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _558 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _560 = isnan(_298);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = _358 * _548;
    float _572 = -_358;
    float _574 = _572 + 1.0;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _582 = _580 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _586 = _584 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _588 = _568 * _574;
    float _590 = -_568;
    float _592 = _590 + 1.0;
    float _594 = fma(_578, _414, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _596 = _382 * _588;
    float _598 = _536 * _588;
    float _600 = _450 * _588;
    float _602 = fma(_586, _414, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _604 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[143].x, _596);
    float _606 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[143].y, _598);
    float _608 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[143].z, _600);
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _610;
    float _614 = fma(_410, _570, _604);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _616;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _620;
    float _624 = fma(_516, _570, _606);
    float _626 = fma(_518, _570, _608);
    float _628 = fma(_612, _452, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _630 = fma(_618, _452, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _632 = fma(_622, _452, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _634 = fma(_582, _414, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _640 = fma(_552, _550, _614);
    float _642 = fma(_554, _550, _624);
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _652 = fma(_556, _550, _626);
    float _654 = fma(_638, _464, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _656 = fma(_646, _464, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _658 = fma(_650, _464, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _660 = fma(_602, _534, _640);
    float _662 = fma(_594, _534, _642);
    float _664 = fma(_634, _534, _652);
    float _666 = in.m_51.x;
    float _668 = in.m_51.y;
    float _670 = in.m_51.z;
    float _672 = fma(_628, _532, _660);
    float _674 = fma(_630, _532, _662);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _676;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _680;
    float _684 = fma(_632, _532, _664);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _686;
    float _690 = fma(_678, _484, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _692 = fma(_682, _484, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _694 = fma(_654, _494, _672);
    float _696 = fma(_688, _484, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _698 = fma(_656, _494, _674);
    float _700 = fma(_658, _494, _684);
    float _702 = fma(_690, _470, _694);
    float _704 = fma(_692, _470, _698);
    float _706 = fma(_696, _470, _700);
    float _708 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[150].x, _702);
    float _710 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[150].y, _704);
    float _712 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[150].z, _706);
    float _714 = _708 * _666;
    float _716 = _710 * _668;
    float _718 = _712 * _670;
    bool _720 = !_436;
    int _722 = as_type<int>(_606);
    float _740;
    if (!_720)
    {
        float _724 = in.m_55.x;
        float _726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _728 = _724 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _732 = _730 * _726;
        float _734 = floor(_732);
        float _736 = -_734;
        float _738 = _732 + _736;
        _740 = _738;
        _742 = true;
    }
    else
    {
        float _744 = float(_90);
        float _746 = 1.0 / _744;
        float _748 = _124 * _746;
        _740 = _748;
    }
    _742 = false;
    float _750 = _740;
    float _752 = in.m_55.z;
    float _754 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _756 = log2(_754);
    float _758 = _266 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _760 = _266 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _762 = in.m_57.x;
    float _764 = in.m_57.y;
    float _766 = _266 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _768 = _124 * 0.039999999105930328369140625;
    float _770 = in.m_55.y;
    float _772 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].x, _760);
    float _774 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _776 = in.m_55.x;
    float _778 = _768 * 0.15915493667125701904296875;
    float _780 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].x, _758);
    float _782 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _774);
    float _784 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].x, _766);
    float _786 = _124 * _756;
    float _788 = _778 * 6.283185482025146484375;
    float _790 = sin(_788);
    float _792 = _752 * 2.0;
    float _794 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _796 = exp2(_786);
    float _798 = abs(_762);
    float _800 = abs(_764);
    float _802 = precise::max(_798, _800);
    float _804 = _764 * 0.0625;
    bool _806 = _802 >= 16.0;
    float _808 = _762 * 0.0625;
    float _810 = _770 * 6.283185482025146484375;
    float _812 = floor(_792);
    float _814 = _806 ? _804 : _764;
    float _816 = _776 * 2.0;
    float _818 = _806 ? _808 : _762;
    float _820 = fma(_124, 0.007000000216066837310791015625, _810);
    float _822 = abs(_814);
    bool _824 = _822 != 0.0;
    bool _826 = isnan(_822);
    bool _828 = _824 || _826;
    bool _830 = isnan(0.0);
    bool _832 = _828 || _830;
    float _834 = _770 * 2.0;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _838 = 1.0 + _836;
    float _840 = _820 * 0.15915493667125701904296875;
    float _842 = in.m_55.w;
    float _844 = abs(_818);
    bool _846 = _844 == 0.0;
    bool _848 = !_832;
    bool _850 = _846 && _848;
    float _852 = floor(_816);
    float _854 = abs(_818);
    bool _856 = _854 == 0.0;
    float _858 = _776 + _770;
    bool _860 = _812 > 0.0;
    float _862 = _858 + (-1.0);
    bool _864 = _812 >= 0.0;
    bool _866 = isnan(_812);
    bool _868 = _864 || _866;
    bool _870 = isnan(0.0);
    bool _872 = _868 || _870;
    float _874 = floor(_834);
    float _876 = _776 + _752;
    bool _878 = false;
    if (_850)
    {
        bool _880 = as_type<int>(_818) >= 0;
        _878 = _880;
    }
    bool _882 = _878;
    float _884 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _794);
    float _886 = _876 + (-1.0);
    float _888 = 1.0 / _838;
    int _890 = _882 ? (-1) : 0;
    if (_850)
    {
        int _892 = _882 ? 0 : 1078530011;
        _722 = _892;
    }
    int _894 = _722;
    float _896 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _898 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _900 = _842 * 6.283185482025146484375;
    float _902 = _840 * 6.283185482025146484375;
    float _904 = sin(_902);
    float _906 = fma(_124, 0.010999999940395355224609375, _900);
    float _908 = _906 * 0.15915493667125701904296875;
    float _910 = _906;
    int _912 = _894;
    int _914 = as_type<int>(_900);
    if (_850)
    {
        int _916 = int(0x80000000) & as_type<int>(_814);
        int _918 = _894 | _916;
        _910 = as_type<float>(_918);
    }
    float _920 = _910;
    bool _922 = !_832;
    bool _924 = _922 && _856;
    float _926 = _920;
    float _928 = _920;
    if (!_924)
    {
        float _930 = abs(_814);
        bool _932 = _930 != as_type<float>(0x7f800000u /* inf */);
        bool _934 = isnan(_930);
        bool _936 = _932 || _934;
        bool _938 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _940 = _936 || _938;
        float _942 = abs(_818);
        bool _944 = _942 == as_type<float>(0x7f800000u /* inf */);
        float _946 = abs(_818);
        bool _948 = _946 == as_type<float>(0x7f800000u /* inf */);
        bool _950 = !_940;
        bool _952 = _948 && _950;
        if (_952)
        {
            bool _954 = as_type<int>(_818) >= 0;
            _890 = _954 ? (-1) : 0;
        }
        int _956 = _890;
        if (_952)
        {
            _912 = 1075235812;
        }
        int _958 = _912;
        int _960 = _958;
        if (_952)
        {
            int _962 = ~_956;
            int _964 = (_962 != 0) ? _958 : 1061752795;
            _960 = _964;
        }
        int _966 = _960;
        if (_952)
        {
            int _968 = int(0x80000000) & as_type<int>(_814);
            int _970 = _966 | _968;
            _926 = as_type<float>(_970);
        }
        float _972 = _926;
        bool _974 = !_940;
        bool _976 = _974 && _944;
        _928 = _972;
        if (!_976)
        {
            float _978 = abs(_814);
            float _980 = abs(_818);
            float _982 = precise::max(_978, _980);
            float _984 = abs(_814);
            float _986 = abs(_818);
            float _988 = precise::min(_984, _986);
            float _990 = 1.0 / _982;
            float _992 = abs(_814);
            float _994 = abs(_818);
            bool _996 = _992 > _994;
            bool _998 = as_type<int>(_818) >= 0;
            float _1000 = abs(_814);
            float _1002 = abs(_818);
            float _1004 = _1000 + _1002;
            int _1006 = as_type<int>(_814) & int(0x80000000);
            bool _1008 = _1004 > as_type<float>(0x7f800000u /* inf */);
            bool _1010 = isnan(_1004);
            bool _1012 = _1008 || _1010;
            bool _1014 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1016 = _1012 || _1014;
            float _1018 = _988 * _990;
            float _1020 = _1018 * _1018;
            float _1022 = _1020 + 11.33538818359375;
            float _1024 = fma(_1020, _1022, 28.84246826171875);
            float _1026 = fma(_1020, _1024, 19.6966705322265625);
            float _1028 = fma(_1020, -0.82336294651031494140625, -5.674867153167724609375);
            float _1030 = fma(_1020, _1028, -6.565555095672607421875);
            float _1032 = 1.0 / _1026;
            float _1034 = _1020 * _1030;
            float _1036 = _1018 * _1034;
            float _1038 = fma(_1036, _1032, _1018);
            float _1040 = _1038;
            _928 = _1004;
            if (_996)
            {
                float _1042 = -_1038;
                float _1044 = _1042 + 1.57079637050628662109375;
                _1040 = _1044;
            }
            float _1046 = _1040;
            int _1048 = as_type<int>(_1046);
            if (!_998)
            {
                float _1050 = -_1046;
                float _1052 = _1050 + 3.1415927410125732421875;
                _1048 = as_type<int>(_1052);
            }
            int _1054 = _1048;
            if (!_1016)
            {
                int _1056 = _1006 | _1054;
                _928 = as_type<float>(_1056);
            }
        }
    }
    float _1058 = _928;
    float _1060 = fma(_790, 9.0, _124);
    bool _1062 = _852 > 0.0;
    float _1064 = abs(_904);
    float _1066 = log2(_1064);
    bool _1068 = _852 >= 0.0;
    bool _1070 = isnan(_852);
    bool _1072 = _1068 || _1070;
    bool _1074 = isnan(0.0);
    bool _1076 = _1072 || _1074;
    float _1078 = _1060 * 0.20999999344348907470703125;
    float _1080 = _1060 * (-0.1599999964237213134765625);
    bool _1082 = _874 > 0.0;
    float _1084 = fma(_1058, 5.00000095367431640625, _1078);
    bool _1086 = _874 >= 0.0;
    bool _1088 = isnan(_874);
    bool _1090 = _1086 || _1088;
    bool _1092 = isnan(0.0);
    bool _1094 = _1090 || _1092;
    float _1096 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _782);
    float _1098 = fma(_1058, 4.000000476837158203125, _1080);
    float _1100 = _1084 * 0.15915493667125701904296875;
    float _1102 = -_796;
    float _1104 = _1102 + 1.0;
    bool _1106 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1108 = isnan(0.0);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1114 = _1110 || _1112;
    float _1116 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].z, _784);
    float _1118 = _1098 * 0.15915493667125701904296875;
    float _1120 = _908 * 6.283185482025146484375;
    float _1122 = sin(_1120);
    float _1124 = _1114 ? _1104 : 0.0;
    float _1126 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].z, _780);
    int _1128 = _872 ? 0 : 1;
    float _1130 = _1116 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1132 = _1076 ? 0 : 1;
    float _1134 = _1124 * _888;
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1138 = _1136 != 0;
    int _1140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1142 = _1140 != 0;
    int _1144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1146 = _1144 != 0;
    float _1148 = _1100 * 6.283185482025146484375;
    float _1150 = sin(_1148);
    float _1152 = _1126 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1154 = ~_1128;
    int _1156 = _1154 + 1;
    int _1158 = _1156 + 1;
    float _1160 = -_1130;
    float _1162 = _1160 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _1164 = !_1138;
    int _1166 = _1164 ? 0 : 1;
    float _1168 = _1066 * 120.0;
    int _1170 = _1158;
    float _1172 = _1162;
    bool _1174 = _1082;
    if (!_860)
    {
        int _1176 = ~_1128;
        int _1178 = _1176 + 1;
        _1170 = _1178;
    }
    int _1180 = _1170;
    float _1182 = _1118 * 6.283185482025146484375;
    float _1184 = sin(_1182);
    int _1186 = abs(_1166);
    float _1188 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1190 = _1152 + _1188;
    int _1192 = ~_1132;
    int _1194 = _1192 + 1;
    int _1196 = _1194 + 1;
    int _1198 = _1094 ? 0 : 1;
    int _1200 = _1196;
    if (!_1062)
    {
        int _1202 = ~_1132;
        int _1204 = _1202 + 1;
        _1200 = _1204;
    }
    int _1206 = _1200;
    float _1208 = abs(_1122);
    float _1210 = log2(_1208);
    float _1212 = float(_1180);
    float _1214 = float(_1186);
    bool _1216 = !_1146;
    int _1218 = _1216 ? 0 : 1;
    int _1220 = ~_1198;
    int _1222 = _1220 + 1;
    int _1224 = _1222 + 1;
    float _1226 = rsqrt(_1096);
    int _1228 = _1224;
    if (!_1082)
    {
        int _1230 = ~_1198;
        int _1232 = _1230 + 1;
        _1228 = _1232;
    }
    int _1234 = _1228;
    float _1236 = _1150 + _1184;
    float _1238 = _1214 * _1212;
    int _1240 = abs(_1218);
    float _1242 = in.m_59.x;
    float _1244 = in.m_59.y;
    float _1246 = in.m_59.z;
    float _1248 = precise::max(_1236, -2.0);
    float _1250 = _1238 * (-2.0);
    float _1252 = float(_1234);
    float _1254 = _1210 * 80.0;
    float _1256 = float(_1240);
    float _1258 = fma(_896, _1250, _896);
    float _1260 = abs(_1190);
    float _1262 = abs(_1162);
    float _1264 = precise::max(_1260, _1262);
    float _1266 = exp2(_1254);
    float _1268 = _1256 * _1252;
    float _1270 = precise::min(_1248, 2.0);
    float _1272 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1274 = _1264 >= 16.0;
    float _1276 = _752 + (-0.5);
    bool _1278 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1280 = isnan(1.0);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1286 = _1282 || _1284;
    float _1288 = fma(_1270, 0.25, 0.5);
    float _1290 = exp2(_1168);
    float _1292 = _1268 * (-2.0);
    float _1294 = _1272 * (-0.15915493667125701904296875);
    float _1296 = _1288 * 0.07999999821186065673828125;
    bool _1298 = !_1286;
    float _1300 = _1298 ? _124 : _1134;
    float _1302 = fma(_898, _1292, _898);
    float _1304 = _1276 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1306 = _1296 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1308 = _1190 * 0.0625;
    float _1310 = _776 + (-0.5);
    if (_1274)
    {
        float _1312 = _1162 * 0.0625;
        _1172 = _1312;
    }
    float _1314 = _1172;
    float _1316 = _1294 * 6.283185482025146484375;
    float _1318 = sin(_1316);
    float _1320 = _1310 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1322 = _776 * 6.283185482025146484375;
    float _1324 = abs(_1314);
    bool _1326 = _1324 == 0.0;
    float _1328 = _1266 + _1290;
    float _1330 = fma(_1300, _1258, _1320);
    float _1332 = fma(_1300, _1302, _1304);
    float _1334 = fma(_764, _1306, _1244);
    bool _1336 = !_1142;
    int _1338 = _1336 ? 0 : 1;
    float _1340 = _1330 * 0.15915493667125701904296875;
    float _1342 = _770 + _752;
    float _1344 = _124 * (-0.17000000178813934326171875);
    int _1346 = abs(_1338);
    float _1348 = _1294 * 6.283185482025146484375;
    float _1350 = cos(_1348);
    float _1352 = _1274 ? _1308 : _1190;
    float _1354 = _770 + (-0.5);
    float _1356 = _1342 + (-1.0);
    float _1358 = _1332 * 0.15915493667125701904296875;
    float _1360 = fma(_1334, 16.0, _1344);
    float _1362 = abs(_1352);
    bool _1364 = _1362 != 0.0;
    bool _1366 = isnan(_1362);
    bool _1368 = _1364 || _1366;
    bool _1370 = isnan(0.0);
    bool _1372 = _1368 || _1370;
    float _1374 = _1340 * 6.283185482025146484375;
    float _1376 = sin(_1374);
    float _1378 = float(_1206);
    float _1380 = _1360 + _1322;
    float _1382 = abs(_1314);
    bool _1384 = _1382 == 0.0;
    bool _1386 = !_1372;
    bool _1388 = _1384 && _1386;
    float _1390 = fma(_1356, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1392 = float(_1346);
    float _1394 = _1380 * 0.15915493667125701904296875;
    float _1396 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1398 = _1340 * 6.283185482025146484375;
    float _1400 = cos(_1398);
    float _1402 = _1392 * _1378;
    float _1404 = _124 * (-0.37000000476837158203125);
    float _1406 = _1402 * (-2.0);
    float _1408 = fma(_1334, 5.0, _1404);
    float _1410 = _1358 * 6.283185482025146484375;
    float _1412 = sin(_1410);
    int _1414 = as_type<int>(_1354);
    if (_1388)
    {
        bool _1416 = as_type<int>(_1314) >= 0;
        _1174 = _1416;
    }
    bool _1418 = _1174;
    float _1420 = _770 * (-0.87964594364166259765625);
    float _1422 = _1408 + _900;
    float _1424 = fma(_1390, _1406, _1390);
    int _1426 = _1418 ? (-1) : 0;
    if (_1388)
    {
        int _1428 = _1418 ? 0 : 1078530011;
        _914 = _1428;
    }
    int _1430 = _914;
    float _1432 = fma(_1334, 9.0, _1420);
    float _1434 = _1422 * 0.15915493667125701904296875;
    float _1436 = _1394 * 6.283185482025146484375;
    float _1438 = sin(_1436);
    if (_1388)
    {
        int _1440 = int(0x80000000) & as_type<int>(_1352);
        int _1442 = _1430 | _1440;
        _1414 = _1442;
    }
    int _1444 = _1414;
    bool _1446 = !_1372;
    bool _1448 = _1446 && _1326;
    int _1450 = _1444;
    float _1452 = as_type<float>(_1444);
    if (!_1448)
    {
        float _1454 = abs(_1352);
        bool _1456 = _1454 != as_type<float>(0x7f800000u /* inf */);
        bool _1458 = isnan(_1454);
        bool _1460 = _1456 || _1458;
        bool _1462 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1464 = _1460 || _1462;
        float _1466 = abs(_1314);
        bool _1468 = _1466 == as_type<float>(0x7f800000u /* inf */);
        float _1470 = abs(_1314);
        bool _1472 = _1470 == as_type<float>(0x7f800000u /* inf */);
        bool _1474 = !_1464;
        bool _1476 = _1472 && _1474;
        if (_1476)
        {
            bool _1478 = as_type<int>(_1314) >= 0;
            _1426 = _1478 ? (-1) : 0;
        }
        int _1480 = _1426;
        if (_1476)
        {
            _1450 = 1075235812;
        }
        int _1482 = _1450;
        int _1484 = _1482;
        if (_1476)
        {
            int _1486 = ~_1480;
            int _1488 = (_1486 != 0) ? _1482 : 1061752795;
            _1484 = _1488;
        }
        int _1490 = _1484;
        float _1492 = as_type<float>(_1490);
        if (_1476)
        {
            int _1494 = int(0x80000000) & as_type<int>(_1352);
            int _1496 = _1490 | _1494;
            _1492 = as_type<float>(_1496);
        }
        float _1498 = _1492;
        bool _1500 = !_1464;
        bool _1502 = _1500 && _1468;
        _1452 = _1498;
        if (!_1502)
        {
            float _1504 = abs(_1352);
            float _1506 = abs(_1314);
            float _1508 = precise::max(_1504, _1506);
            float _1510 = abs(_1352);
            float _1512 = abs(_1314);
            float _1514 = precise::min(_1510, _1512);
            float _1516 = 1.0 / _1508;
            float _1518 = abs(_1352);
            float _1520 = abs(_1314);
            bool _1522 = _1518 > _1520;
            bool _1524 = as_type<int>(_1314) >= 0;
            float _1526 = _1514 * _1516;
            float _1528 = _1526 * _1526;
            float _1530 = _1528 + 11.33538818359375;
            float _1532 = fma(_1528, _1530, 28.84246826171875);
            float _1534 = fma(_1528, _1532, 19.6966705322265625);
            float _1536 = fma(_1528, -0.82336294651031494140625, -5.674867153167724609375);
            float _1538 = fma(_1528, _1536, -6.565555095672607421875);
            float _1540 = 1.0 / _1534;
            float _1542 = _1528 * _1538;
            float _1544 = abs(_1352);
            float _1546 = abs(_1314);
            float _1548 = _1544 + _1546;
            int _1550 = as_type<int>(_1352) & int(0x80000000);
            float _1552 = _1526 * _1542;
            bool _1554 = _1548 > as_type<float>(0x7f800000u /* inf */);
            bool _1556 = isnan(_1548);
            bool _1558 = _1554 || _1556;
            bool _1560 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1562 = _1558 || _1560;
            float _1564 = fma(_1552, _1540, _1526);
            float _1566 = _1564;
            _1452 = _1548;
            if (_1522)
            {
                float _1568 = -_1564;
                float _1570 = _1568 + 1.57079637050628662109375;
                _1566 = _1570;
            }
            float _1572 = _1566;
            int _1574 = as_type<int>(_1572);
            if (!_1524)
            {
                float _1576 = -_1572;
                float _1578 = _1576 + 3.1415927410125732421875;
                _1574 = as_type<int>(_1578);
            }
            int _1580 = _1574;
            if (!_1562)
            {
                int _1582 = _1550 | _1580;
                _1452 = as_type<float>(_1582);
            }
        }
    }
    float _1584 = _1452;
    float _1586 = _810 + _1432;
    float _1588 = fma(_1300, _1424, _1396);
    float _1590 = _1434 * 6.283185482025146484375;
    float _1592 = sin(_1590);
    float _1594 = _1586 * 0.15915493667125701904296875;
    float _1596 = _1318 * _1246;
    float _1598 = fma(_1334, 0.5, 0.5);
    float _1600 = precise::clamp(_1598, 0.0, 1.0);
    float _1602 = _1350 * _1246;
    float _1604 = fma(_762, _1306, _1242);
    float _1606 = _1594 * 6.283185482025146484375;
    float _1608 = sin(_1606);
    float _1610 = fma(_1600, -2.0, 3.0);
    float _1612 = _1600 * _1600;
    float _1614 = fma(_1334, 0.58823525905609130859375, 0.411764681339263916015625);
    float _1616 = precise::clamp(_1614, 0.0, 1.0);
    float _1618 = _1438 * 0.064000003039836883544921875;
    float _1620 = _1610 * _1612;
    float _1622 = -_1584;
    float _1624 = _1588 + _1622;
    float _1626 = fma(_1616, -2.0, 3.0);
    float _1628 = _1616 * _1616;
    float _1630 = _1620 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1632 = _1592 * _1328;
    float _1634 = _752 * 6.283185482025146484375;
    float _1636 = _1626 * _1628;
    float _1638 = fma(_1618, _1630, _1604);
    float _1640 = _1632 * 0.180000007152557373046875;
    float _1642 = _1608 * 0.07299999892711639404296875;
    float _1644 = _1624 * 0.15915493667125701904296875;
    float _1646 = _1334 + 0.20000000298023223876953125;
    float _1648 = _1640 * _1636;
    float _1650 = fma(_1642, _1630, _1638);
    float _1652 = fma(_124, 0.310000002384185791015625, _1634);
    float _1654 = _1358 * 6.283185482025146484375;
    float _1656 = cos(_1654);
    float _1658 = -_1596;
    float _1660 = fma(_1350, _1646, _1658);
    float _1662 = fma(_1648, (*spvDescriptorSet0.vp_c9)._m0[191].x, _1650);
    float _1664 = _1652 * 0.15915493667125701904296875;
    float _1666 = _714 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1668 = _1660 + (-0.20000000298023223876953125);
    float _1670 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1662);
    float _1672 = fma(_124, 0.10999999940395355224609375, _1322);
    float _1674 = _1644 * 6.283185482025146484375;
    float _1676 = sin(_1674);
    float _1678 = _716 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1680 = _1670 * _1666;
    float _1682 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1668);
    float _1684 = _1672 * 0.15915493667125701904296875;
    float _1686 = fma(_1318, _1646, _1602);
    float _1688 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1690 = _1678 * _1682;
    float _1692 = _1644 * 6.283185482025146484375;
    float _1694 = cos(_1692);
    float _1696 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1686);
    float _1698 = _1656 * _1690;
    float _1700 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].z, _772);
    float _1702 = -_1690;
    float _1704 = _1412 * _1702;
    float _1706 = _1696 * _1688;
    float _1708 = _1400 * _1698;
    float _1710 = _1376 * _1676;
    float _1712 = _1400 * _1676;
    float _1714 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _884);
    float _1716 = 1.0 / _1678;
    float _1718 = _1700 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1720 = _1376 * _1698;
    float _1722 = _1676 * _1656;
    float _1724 = _1400 * _1694;
    float _1726 = _1376 * _1694;
    float _1728 = _1694 * _1656;
    float _1730 = _1664 * 6.283185482025146484375;
    float _1732 = sin(_1730);
    float _1734 = fma(_1412, _1724, _1710);
    float _1736 = -_1712;
    float _1738 = fma(_1412, _1726, _1736);
    float _1740 = fma(_1412, _1710, _1724);
    float _1742 = fma(_1728, _1680, _1704);
    float _1744 = fma(_1734, _1680, _1708);
    float _1746 = -_1726;
    float _1748 = fma(_1412, _1712, _1746);
    float _1750 = fma(_1738, _1680, _1720);
    float _1752 = sqrt(_1714);
    float _1754 = fma(_1722, _1706, _1742);
    float _1756 = fma(_1748, _1706, _1744);
    float _1758 = fma(_1740, _1706, _1750);
    float _1760 = _1152 + _1754;
    float _1762 = _1718 + _1756;
    float _1764 = _1130 + _1758;
    float _1766 = _1684 * 6.283185482025146484375;
    float _1768 = sin(_1766);
    float _1770 = fma(_1732, 0.12999999523162841796875, 1.0);
    float _1772 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1774 = _1762 + _1772;
    float _1776 = _1774 * _1716;
    float _1778 = _1752 * 0.64999997615814208984375;
    float _1780 = fma(_1776, _1776, _1776);
    float _1782 = _1780 * _1778;
    float _1784 = fma(_1768, 0.300000011920928955078125, _1770);
    float _1786 = _1784 * _1782;
    float _1788 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[32].z, _1764);
    float _1790 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[32].x, _1760);
    float _1792 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[32].y, _1762);
    float _1794 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1796 = _1788 + _1794;
    float _1798 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1800 = _1790 + _1798;
    float _1802 = _1796 * _1796;
    float _1804 = fma(_1800, _1800, _1802);
    float _1806 = sqrt(_1804);
    bool _1808 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1810 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1812 = _1808 || _1810;
    bool _1814 = isnan(0.5);
    bool _1816 = _1812 || _1814;
    bool _1818 = _1806 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1820 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1822 = _1738;
    float _1824 = _1790;
    float _1826 = _1786;
    float _1828 = _1752;
    float _1830 = _1704;
    if (!_1818)
    {
        _1820 = _1788;
    }
    float _1832 = _1820;
    float _1834 = _1832;
    if (!_1818)
    {
        _1822 = _1792;
    }
    float _1836 = _1822;
    bool _1838 = !_1818;
    float _1840 = _1836;
    if (!_1838)
    {
        float _1842 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1844 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1846 = _1806 + _1844;
        float _1848 = rsqrt(_1804);
        float _1850 = _1846 * _1842;
        float _1852 = _1792 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1854 = _1850 * 0.15915493667125701904296875;
        float _1856 = _1854 * 6.283185482025146484375;
        float _1858 = sin(_1856);
        float _1860 = _1854 * 6.283185482025146484375;
        float _1862 = cos(_1860);
        float _1864 = fma(_1858, _1852, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1866 = _1848 * _1864;
        float _1868 = _1862 + (-1.0);
        float _1870 = fma(_1800, _1866, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1872 = fma(_1796, _1866, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1874 = _1868 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1876 = fma(_1792, _1862, _1874);
        _1840 = _1876;
        _1824 = _1870;
        _1834 = _1872;
    }
    float _1878 = _1840;
    float _1880 = _1824;
    float _1882 = _1834;
    float _1884 = _1878;
    float _1886 = _1880;
    float _1888 = _1882;
    if (!_1816)
    {
        float _1890 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1892 = _1718 + _1890;
        float _1894 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1896 = -_1718;
        float _1898 = _1896 + _1878;
        float _1900 = _1892 * _1892;
        float _1902 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1904 = _1130 + _1902;
        float _1906 = fma(_1190, _1190, _1900);
        float _1908 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1910 = fma(_1904, _1904, _1906);
        float _1912 = _1894 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1914 = sqrt(_1910);
        float _1916 = precise::min(_1914, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1918 = _1916 * _1908;
        float _1920 = -_1152;
        float _1922 = _1920 + _1880;
        float _1924 = _1912 * _1918;
        float _1926 = -_1130;
        float _1928 = _1926 + _1882;
        float _1930 = fma(_1922, _1924, _1152);
        float _1932 = fma(_1898, _1924, _1718);
        float _1934 = fma(_1928, _1924, _1130);
        _1884 = _1932;
        _1886 = _1930;
        _1888 = _1934;
    }
    float _1936 = _1884;
    float _1938 = _1886;
    float _1940 = _1888;
    float _1942 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1944 = _1936 + _1942;
    float _1946 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1948 = _1938 + _1946;
    float _1950 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1952 = _1940 + _1950;
    float _1954 = _1944 * _1944;
    float _1956 = fma(_1948, _1948, _1954);
    float _1958 = fma(_1952, _1952, _1956);
    float _1960 = rsqrt(_1958);
    float _1962 = sqrt(_1958);
    float _1964 = _1960 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1966 = _1948 * _1964;
    float _1968 = _1952 * _1964;
    float _1970 = _1966 * _1966;
    float _1972 = _1968 * _1968;
    float _1974 = _1970 + _1972;
    float _1976 = sqrt(_1974);
    bool _1978 = _1976 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1980 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1982 = _1976 + _1980;
    float _1984 = _1952;
    float _1986 = _1982;
    float _1988 = _1944;
    if (_1978)
    {
        float _1990 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1984 = _1990;
    }
    float _1992 = _1984;
    if (_1978)
    {
        float _1994 = rsqrt(_1974);
        _1826 = _1994;
    }
    float _1996 = _1826;
    float _1998 = _1996;
    if (_1978)
    {
        float _2000 = _1982 * _1992;
        _1986 = _2000;
    }
    float _2002 = _1986;
    if (_1978)
    {
        float _2004 = _2002 * 0.15915493667125701904296875;
        _1828 = _2004;
    }
    float _2006 = _1828;
    float _2008 = _1960;
    if (_1978)
    {
        float _2010 = _2006 * 6.283185482025146484375;
        float _2012 = sin(_2010);
        _2008 = _2012;
    }
    float _2014 = _2008;
    float _2016 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2018 = precise::max(0.0, _2016);
    float _2020 = _1954;
    float _2022 = _2018;
    float _2024 = _2016;
    if (_1978)
    {
        float _2026 = _2006 * 6.283185482025146484375;
        float _2028 = cos(_2026);
        _2020 = _2028;
    }
    float _2030 = _2020;
    float _2032 = -_1964;
    float _2034 = -_2018;
    float _2036 = fma(_1944, _2032, _2034);
    if (!_1978)
    {
        _1988 = _1968;
    }
    float _2038 = _1988;
    float _2040 = _2038;
    if (_1978)
    {
        float _2042 = _2036 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2022 = _2042;
    }
    float _2044 = _2022;
    float _2046 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2048 = _1936 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2050 = _2044;
    float _2052 = _2014;
    if (_1978)
    {
        float _2054 = fma(_2014, _2044, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2050 = _2054;
    }
    float _2056 = _2050;
    float _2058 = _2056;
    if (!_1978)
    {
        _2052 = _1966;
    }
    float _2060 = _2052;
    float _2062 = _2060;
    float _2064 = _2030;
    if (_1978)
    {
        float _2066 = _2030 + (-1.0);
        _2024 = _2066;
    }
    float _2068 = _2024;
    float _2070 = _2068;
    if (_1978)
    {
        float _2072 = _1996 * _2056;
        _1830 = _2072;
    }
    float _2074 = _1830;
    if (!_1978)
    {
        _2058 = _2036;
    }
    float _2076 = _2058;
    float _2078 = _2076;
    if (_1978)
    {
        float _2080 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1998 = _2080;
    }
    float _2082 = _1998;
    if (_1978)
    {
        float _2084 = _1966 * _2074;
        _2062 = _2084;
    }
    float _2086 = _2062;
    if (!_1978)
    {
        _2070 = _1970;
    }
    float _2088 = _2070;
    float _2090 = _2088;
    if (_1978)
    {
        float _2092 = _1968 * _2074;
        _2040 = _2092;
    }
    float _2094 = _2040;
    if (_1978)
    {
        float _2096 = fma(_2036, _2030, _2082);
        _2078 = _2096;
    }
    float _2098 = _2078;
    if (_1978)
    {
        float _2100 = _2086 * _2086;
        _2090 = _2100;
    }
    float _2102 = _2090;
    if (!_1978)
    {
        _2064 = _1972;
    }
    float _2104 = _2064;
    float _2106 = _2104;
    if (_1978)
    {
        float _2108 = _2094 * _2094;
        _2106 = _2108;
    }
    float _2110 = _2106;
    float _2112 = fma(_2098, _2098, _2102);
    float _2114 = _1936 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2116 = _2112 + _2110;
    float _2118 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2120 = fma(_1962, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2118);
    float _2122 = precise::clamp(_2120, 0.0, 1.0);
    float _2124 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2114);
    float _2126 = _1936 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2128 = -_2122;
    float _2130 = _2128 + 1.0;
    float _2132 = rsqrt(_2116);
    float _2134 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2124);
    float _2136 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2126);
    float _2138 = _1936 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2140 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2048);
    float _2142 = _2134 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2144 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2136);
    float _2146 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2138);
    float _2148 = abs(_2130);
    float _2150 = log2(_2148);
    float _2152 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2140);
    float _2154 = _2144 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2156 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2146);
    float _2158 = _2142 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2160 = _2152 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2162 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2164 = _2156 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2166 = _2132 * _2086;
    float _2168 = _2132 * _2098;
    float _2170 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2162);
    float _2172 = _2132 * _2094;
    float _2174 = _2166 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2176 = -_2158;
    float _2178 = fma(_2176, _2046, 1.0);
    float _2180 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2170);
    float _2182 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2184 = -_2174;
    float _2186 = fma(_2168, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2184);
    float _2188 = _2150 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2190 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2180);
    float _2192 = log2(_2178);
    float _2194 = -_2172;
    float _2196 = fma(_2194, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2186);
    float _2198 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2200 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2182);
    float _2202 = _2168 + 1.0;
    float _2204 = fma(_2196, -0.5, 0.5);
    float _2206 = fma(_2196, 0.5, 0.5);
    float _2208 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2198);
    float _2210 = exp2(_2188);
    float _2212 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2200);
    float _2214 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2208);
    float _2216 = 1.0 / _2190;
    float _2218 = fma(_2206, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2220 = _2192 * 0.693147182464599609375;
    float _2222 = fma(_2206, _2218, -0.212114393711090087890625);
    float _2224 = _2220 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2226 = sqrt(_2204);
    float _2228 = -_2168;
    float _2230 = fma(_2210, _2202, _2228);
    float _2232 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2212);
    float _2234 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2214);
    float _2236 = fma(_2206, _2222, 1.570728778839111328125);
    float _2238 = fma(_2230, 0.5, 0.5);
    float _2240 = _2232 * _2216;
    float _2242 = _2234 * _2216;
    float _2244 = fma(_2240, 0.5, 0.5);
    float _2246 = fma(_2242, -0.5, 0.5);
    float _2248 = _2226 * 0.636619746685028076171875;
    float _2250 = -_2236;
    float _2252 = fma(_2248, _2250, 1.0);
    float3 _6162 = float3(_2244, _2246, _2224);
    float _2254 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6162, float3(0.0), isnan(_6162)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6162, float3(0.0), isnan(_6162)), level(0.0)).x;
    float3 _6173 = float3(_2244, _2246, _2224);
    float4 _2257 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6173, float3(0.0), isnan(_6173)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6173, float3(0.0), isnan(_6173)), level(0.0)).xyzw;
    float _2259 = _2257.x;
    float _2261 = _2257.y;
    float _2263 = _2257.z;
    float _2265 = _2257.w;
    float2 _6190 = float2(_2252, _2238);
    float3 _2269 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6190, float2(0.0), isnan(_6190)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6190, float2(0.0), isnan(_6190)), level(0.0)).xyz;
    float _2271 = _2269.x;
    float _2273 = _2269.y;
    float _2275 = _2269.z;
    float _2277 = in.m_57.w;
    float _2279 = _776 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2281 = _770 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2285 = _2283 != 0;
    float _2287 = in.m_49.x;
    int _2289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2291 = _2289 != 0;
    float _2293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2297 = _2295 != 0;
    float _2299 = _2150 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2303 = _2301 != 0;
    bool _2305 = _842 > 0.5;
    float _2307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2309 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2311 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2313 = _2309 || _2311;
    bool _2315 = isnan(0.5);
    bool _2317 = _2313 || _2315;
    float _2319 = _1716;
    bool _2321 = _2297;
    bool _2323 = _2303;
    if (_2291)
    {
        float _2325 = in.m_55.z;
        _2319 = _2325;
    }
    float _2327 = _2319;
    int _2329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2331 = _2329 != 0;
    float _2333 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2335 = _2333 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    out.m_61.w = _2277;
    float _2337 = 1.0 / _2335;
    float _2339 = _2293 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2341 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2343 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2345 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2347 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2349 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2351 = _2343 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2353 = _2345 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2355 = _2341 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2357 = -_2347;
    float _2359 = fma(_2279, 2.0, _2357);
    float _2361 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2363 = _2361 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2365 = fma(_2281, -2.0, _2349);
    float _2367 = 1.0 / _2363;
    float _2369 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2371 = _2369 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2373 = -_124;
    float _2375 = fma(_2373, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2359);
    float _2377 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2379 = _2377 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _2381 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2383 = -_144;
    float _2385 = _2383 + 1.0;
    float _2387 = 1.0 / _2379;
    float _2389 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2391 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2389;
    out.m_63.x = _2351;
    out.m_63.y = _2353;
    out.m_63.z = _2355;
    out.m_63.w = _2381;
    int _2393 = _2305 ? as_type<int>(_2385) : as_type<int>(_144);
    float _2395 = _2391 * _2337;
    bool _2397 = _770 > 0.5;
    float _2399 = _2391;
    float _2401 = _2371;
    float _2403 = _2379;
    if (!_2331)
    {
        float _2405 = in.m_55.z;
        _2399 = _2405;
    }
    float _2407 = _2399;
    float _2409 = _2297 ? as_type<float>(_2393) : _144;
    float _2411 = _2371 * _2367;
    if (_2291)
    {
        bool _2413 = _2327 > 0.5;
        _2321 = _2413;
    }
    bool _2415 = _2321;
    float _2417 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2419 = _750 + _2417;
    float _2421 = exp2(_2299);
    if (_2303)
    {
        float _2423 = _2397 ? _2385 : _144;
        _192 = _2423;
    }
    float _2425 = _192;
    if (!_2331)
    {
        _2401 = _770;
    }
    float _2427 = _2401;
    float _2429 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2431 = _750 + _2429;
    float _2433 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2435 = fma(_2395, _2431, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2437 = _2427;
    if (_2285)
    {
        bool _2439 = _776 > 0.5;
        _2323 = _2439;
    }
    bool _2441 = _2323;
    float _2443 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2445 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _2443;
    if (_2331)
    {
        _2437 = _776;
    }
    float _2447 = _2437;
    float _2449 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _2451 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2453 = isnan(_750);
    bool _2455 = _2451 || _2453;
    bool _2457 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2459 = _2455 || _2457;
    float _2461 = float(_2459);
    float _2463 = _2445 * _2387;
    bool _2465 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2467 = isnan(_750);
    bool _2469 = _2465 || _2467;
    bool _2471 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2473 = _2469 || _2471;
    float _2475 = float(_2473);
    float _2477 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2449);
    float _2479 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2481 = _750 + _2479;
    float _2483 = _2481;
    float _2485 = _2449;
    if (!_2285)
    {
        _2403 = _2287;
    }
    float _2487 = _2403;
    float _2489 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2433);
    float _2491 = -_2475;
    float _2493 = _2491 + 1.0;
    float _2495 = fma(_2411, _2481, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2497 = _2407;
    float _2499 = _2487;
    float _2501 = _2495;
    if (!_2331)
    {
        _2483 = _2407;
    }
    float _2503 = _2483;
    float _2505 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2489);
    float _2507 = _2503;
    float _2509 = _2505;
    if (_2331)
    {
        _2507 = _770;
    }
    float _2511 = _2507;
    float _2513 = -_2421;
    float _2515 = _2513 + 1.0;
    if (_2331)
    {
        _2497 = _770;
    }
    float _2517 = _2497;
    float _2519 = _2461 * _2493;
    if (!_2285)
    {
        _2485 = _2487;
    }
    float _2521 = _2485;
    float _2523 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2525 = _2521;
    if (_2285)
    {
        _2499 = _2287;
    }
    float _2527 = _2499;
    float _2529 = -_2461;
    float _2531 = _2529 + 1.0;
    bool _2533 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2535 = isnan(_750);
    bool _2537 = _2533 || _2535;
    bool _2539 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2541 = _2537 || _2539;
    float _2543 = float(_2541);
    float _2545 = _2515 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2547 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2549 = isnan(_750);
    bool _2551 = _2547 || _2549;
    bool _2553 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2555 = _2551 || _2553;
    float _2557 = float(_2555);
    float _2559 = fma(_2409, _2339, -0.5);
    float _2561 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2523);
    float _2563 = fma(_2463, _2419, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2565 = _2557 * _2531;
    float _2567 = -_2557;
    float _2569 = _2567 + 1.0;
    float _2571 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2561);
    float _2573 = _2307 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2575 = _2543 * _2569;
    float _2577 = _2571 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2579 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2581 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2583 = _2435 * _2575;
    float _2585 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2587 = fma(_2447, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2579);
    float _2589 = 1.0 / _2577;
    float _2591 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2581);
    float _2593 = _2447 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2595 = fma(_2573, _2425, -0.5);
    float _2597 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2591);
    float _2599 = -_2585;
    float _2601 = fma(_2593, 2.0, _2599);
    int _2603 = as_type<int>(_2581);
    int _2605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[83].w);
    float _2607 = _2543;
    float _2609 = _2527;
    if (_2291)
    {
        float _2611 = -_2527;
        float _2613 = _2611 + 1.0;
        _2603 = as_type<int>(_2613);
    }
    int _2615 = _2603;
    float _2617 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_2285)
    {
        float _2619 = -_2527;
        float _2621 = _2619 + 1.0;
        _2605 = as_type<int>(_2621);
    }
    int _2623 = _2605;
    float _2625 = _2597 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2629 = fma(_2517, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2617);
    float _2631 = -_124;
    float _2633 = fma(_2631, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2601);
    float _2635 = _2625 + _2577;
    if (_2285)
    {
        float _2637 = _2441 ? as_type<float>(_2623) : _2527;
        _2525 = _2637;
    }
    float _2639 = _2525;
    float _2641 = -_2543;
    float _2643 = _2641 + 1.0;
    if (!_2317)
    {
        _2607 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2645 = _2607;
    float _2647 = _2635 * _2589;
    float _2649 = _2647 * 0.5;
    float _2651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2653 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2365);
    float _2655 = fma(_2643, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2583);
    float _2657 = _2645;
    float _2659 = _2649;
    if (!_2317)
    {
        float _2661 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2663 = fma(_2649, _2645, _2661);
        _2657 = _2663;
    }
    float _2665 = _2657;
    if (!_2317)
    {
        _2659 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2667 = _2659;
    float _2669 = _2511 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_2291)
    {
        float _2671 = _2415 ? as_type<float>(_2615) : _2527;
        _2609 = _2671;
    }
    float _2673 = _2609;
    float _2675 = -_2653;
    float _2677 = fma(_2505, _2595, _2675);
    float _2679 = _2627 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2681 = _2665;
    if (!_2317)
    {
        float _2683 = 1.0 / _2665;
        _2681 = _2683;
    }
    float _2685 = _2681;
    if (!_2317)
    {
        float _2687 = -_2667;
        float _2689 = _2687 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2509 = _2689;
    }
    float _2691 = _2509;
    float _2693 = fma(_2679, _2673, -0.5);
    float _2695 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2629);
    float _2697 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2699 = fma(_2495, _2565, _2655);
    float _2701 = _2651 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2703 = _2677 + 0.5;
    float _2705 = _2673;
    if (!_2317)
    {
        float _2707 = 1.0 / _2691;
        _2705 = _2707;
    }
    float _2709 = _2705;
    float _2711 = fma(_2669, -2.0, _2697);
    float _2713 = fma(_2701, _2639, -0.5);
    float _2715 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2587);
    float _2717 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2477);
    float _2719 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2711);
    float _2721 = fma(_2563, _2519, _2699);
    float _2723 = fma(_2715, _2693, _2633);
    float _2725 = fma(_2717, _2713, _2375);
    float _2727 = _2723;
    if (!_2317)
    {
        float _2729 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2731 = -_2667;
        float _2733 = fma(_2685, _2729, _2731);
        _2501 = _2733;
    }
    float _2735 = _2501;
    float _2737 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2739 = -_2719;
    float _2741 = fma(_2695, _2559, _2739);
    float _2743 = _2723 + 0.5;
    float _2745 = _2725 + 0.5;
    if (_2317)
    {
        _2727 = 1.0;
    }
    float _2747 = _2727;
    float _2749 = fma(_2475, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2721);
    float _2751 = _2747;
    if (!_2317)
    {
        float _2753 = _2735 * _2709;
        float _2755 = precise::clamp(_2753, 0.0, 1.0);
        _2751 = _2755;
    }
    float _2757 = _2751;
    float _2759 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2737);
    float _2761 = _2741 + 0.5;
    float _2763 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2759);
    float _2765 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2767 = _2190 * 0.5;
    float _2769 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2771 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2763);
    float _2773 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2775 = _2757 > 0.0;
    bool _2777 = isnan(_2757);
    bool _2779 = _2775 || _2777;
    bool _2781 = isnan(0.0);
    bool _2783 = _2779 || _2781;
    out.m_65.x = _2745;
    out.m_65.y = _2703;
    out.m_65.z = _2743;
    out.m_65.w = _2761;
    float _2785 = _2765 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2787 = _2769 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2789 = _2773 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2791 = _2749 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2793 = _2757 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2795 = -_2545;
    float _2797 = _2795 + 1.0;
    out.gl_Position.x = _2232;
    out.gl_Position.y = _2234;
    out.gl_Position.z = _2771;
    out.gl_Position.w = _2190;
    float _2799 = _2793 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.x = _2785;
    out.m_67.y = _2787;
    out.m_67.z = _2789;
    out.m_67.w = _2791;
    float _2801 = fma(_2234, -0.5, _2767);
    float _2803 = _2771 + _2190;
    float _2805 = _2232 + _2190;
    out.m_45.x = _2799;
    float _2807 = _2803 * 0.5;
    float _2809 = _2805 * 0.5;
    out.m_69.x = _2809;
    out.m_69.y = _2801;
    out.m_69.z = _2807;
    out.m_69.w = _2190;
    float _2811 = _2545 * _2254;
    float _2813 = _2265 * _2797;
    float _2815 = _2265 * _2811;
    float _2817 = _2275 * _2811;
    float _2819 = fma(_2271, _2815, _2259);
    float _2821 = fma(_2273, _2815, _2261);
    float _2823 = fma(_2265, _2817, _2263);
    out.m_71.x = _2819;
    out.m_71.y = _2821;
    out.m_71.z = _2823;
    out.m_71.w = _2813;
    if (_2783)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2825 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2825;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _742 = false;
    bool _290 = false;
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
        float _2882 = as_type<float>(_106);
        out.gl_Position.z = _2882;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2951 = as_type<float>(_142);
        out.gl_Position.z = _2951;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_49.y;
    float _146 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _148 = in.m_51.w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_47.x;
    float _162 = in.m_47.y;
    float _164 = in.m_47.z;
    float _166 = in.m_42.x;
    float _168 = in.m_42.y;
    float _170 = in.m_42.z;
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
    out.m_53.y = _144;
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
    float _252 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _254 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _256 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _258 = fma(_248, _160, _252);
    float _260 = fma(_248, _162, _254);
    float _262 = fma(_248, _164, _256);
    float _264 = fma(_258, _148, _166);
    float _266 = fma(_260, _148, _168);
    float _268 = fma(_262, _148, _170);
    bool _270 = !_250;
    float _288;
    if (!_270)
    {
        float _272 = in.m_55.x;
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
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _302 = _298 + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _306 = _298 + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _324 = 1.0 / _310;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _334 = 1.0 / _314;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _344;
    bool _348 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _350 = isnan(_298);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    float _360 = 1.0 / _322;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _362;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _368 = _298 + _366;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _370;
    float _374 = _368 * _324;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _378 = _298 + _376;
    float _380 = 1.0 / _328;
    float _382 = fma(_338, _374, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _384 = _378 * _334;
    bool _386 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _388 = isnan(_298);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    bool _398 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _400 = isnan(_298);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = fma(_342, _384, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _412 = 1.0 / _332;
    float _414 = _302 * _360;
    bool _416 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _418 = isnan(_298);
    bool _420 = _416 || _418;
    bool _422 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _424 = _420 || _422;
    float _426 = float(_424);
    float _428 = -_396;
    float _430 = _428 + 1.0;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _434 = _298 + _432;
    bool _436 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _438 = 1.0 / _318;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _440;
    float _444 = 1.0 / _364;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _448 = _298 + _446;
    float _450 = fma(_442, _374, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _452 = _448 * _380;
    float _454 = _306 * _438;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _458 = _298 + _456;
    float _460 = -_426;
    float _462 = _460 + 1.0;
    float _464 = _458 * _412;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _470 = _426 * _430;
    bool _472 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _474 = isnan(_298);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = _434 * _444;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _486;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _494 = _408 * _462;
    float _496 = -_408;
    float _498 = _496 + 1.0;
    bool _500 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _502 = isnan(_298);
    bool _504 = _500 || _502;
    bool _506 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _508 = _504 || _506;
    float _510 = float(_508);
    float _512 = -_482;
    float _514 = _512 + 1.0;
    float _516 = fma(_492, _384, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _518 = fma(_468, _384, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _520 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _522 = isnan(_298);
    bool _524 = _520 || _522;
    bool _526 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _528 = _524 || _526;
    float _530 = float(_528);
    float _532 = _482 * _498;
    float _534 = _510 * _514;
    float _536 = fma(_488, _374, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _538 = -_510;
    float _540 = _538 + 1.0;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _542;
    float _546 = -_530;
    float _548 = _546 + 1.0;
    float _550 = _530 * _540;
    float _552 = fma(_544, _454, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _554 = fma(_346, _454, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _556 = fma(_372, _454, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _558 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _560 = isnan(_298);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = _358 * _548;
    float _572 = -_358;
    float _574 = _572 + 1.0;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _582 = _580 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _586 = _584 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _588 = _568 * _574;
    float _590 = -_568;
    float _592 = _590 + 1.0;
    float _594 = fma(_578, _414, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _596 = _382 * _588;
    float _598 = _536 * _588;
    float _600 = _450 * _588;
    float _602 = fma(_586, _414, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _604 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[143].x, _596);
    float _606 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[143].y, _598);
    float _608 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[143].z, _600);
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _612 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _610;
    float _614 = fma(_410, _570, _604);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _616;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _620;
    float _624 = fma(_516, _570, _606);
    float _626 = fma(_518, _570, _608);
    float _628 = fma(_612, _452, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _630 = fma(_618, _452, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _632 = fma(_622, _452, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _634 = fma(_582, _414, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _640 = fma(_552, _550, _614);
    float _642 = fma(_554, _550, _624);
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _652 = fma(_556, _550, _626);
    float _654 = fma(_638, _464, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _656 = fma(_646, _464, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _658 = fma(_650, _464, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _660 = fma(_602, _534, _640);
    float _662 = fma(_594, _534, _642);
    float _664 = fma(_634, _534, _652);
    float _666 = in.m_51.x;
    float _668 = in.m_51.y;
    float _670 = in.m_51.z;
    float _672 = fma(_628, _532, _660);
    float _674 = fma(_630, _532, _662);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _676;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _680;
    float _684 = fma(_632, _532, _664);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _686;
    float _690 = fma(_678, _484, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _692 = fma(_682, _484, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _694 = fma(_654, _494, _672);
    float _696 = fma(_688, _484, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _698 = fma(_656, _494, _674);
    float _700 = fma(_658, _494, _684);
    float _702 = fma(_690, _470, _694);
    float _704 = fma(_692, _470, _698);
    float _706 = fma(_696, _470, _700);
    float _708 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[150].x, _702);
    float _710 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[150].y, _704);
    float _712 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[150].z, _706);
    float _714 = _708 * _666;
    float _716 = _710 * _668;
    float _718 = _712 * _670;
    bool _720 = !_436;
    int _722 = as_type<int>(_606);
    float _740;
    if (!_720)
    {
        float _724 = in.m_55.x;
        float _726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _728 = _724 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _732 = _730 * _726;
        float _734 = floor(_732);
        float _736 = -_734;
        float _738 = _732 + _736;
        _740 = _738;
        _742 = true;
    }
    else
    {
        float _744 = float(_90);
        float _746 = 1.0 / _744;
        float _748 = _124 * _746;
        _740 = _748;
    }
    _742 = false;
    float _750 = _740;
    float _752 = in.m_55.z;
    float _754 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _756 = log2(_754);
    float _758 = _266 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _760 = _266 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _762 = in.m_57.x;
    float _764 = in.m_57.y;
    float _766 = _266 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _768 = _124 * 0.039999999105930328369140625;
    float _770 = in.m_55.y;
    float _772 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].x, _760);
    float _774 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _776 = in.m_55.x;
    float _778 = _768 * 0.15915493667125701904296875;
    float _780 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].x, _758);
    float _782 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _774);
    float _784 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].x, _766);
    float _786 = _124 * _756;
    float _788 = _778 * 6.283185482025146484375;
    float _790 = sin(_788);
    float _792 = _752 * 2.0;
    float _794 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _796 = exp2(_786);
    float _798 = abs(_762);
    float _800 = abs(_764);
    float _802 = precise::max(_798, _800);
    float _804 = _764 * 0.0625;
    bool _806 = _802 >= 16.0;
    float _808 = _762 * 0.0625;
    float _810 = _770 * 6.283185482025146484375;
    float _812 = floor(_792);
    float _814 = _806 ? _804 : _764;
    float _816 = _776 * 2.0;
    float _818 = _806 ? _808 : _762;
    float _820 = fma(_124, 0.007000000216066837310791015625, _810);
    float _822 = abs(_814);
    bool _824 = _822 != 0.0;
    bool _826 = isnan(_822);
    bool _828 = _824 || _826;
    bool _830 = isnan(0.0);
    bool _832 = _828 || _830;
    float _834 = _770 * 2.0;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _838 = 1.0 + _836;
    float _840 = _820 * 0.15915493667125701904296875;
    float _842 = in.m_55.w;
    float _844 = abs(_818);
    bool _846 = _844 == 0.0;
    bool _848 = !_832;
    bool _850 = _846 && _848;
    float _852 = floor(_816);
    float _854 = abs(_818);
    bool _856 = _854 == 0.0;
    float _858 = _776 + _770;
    bool _860 = _812 > 0.0;
    float _862 = _858 + (-1.0);
    bool _864 = _812 >= 0.0;
    bool _866 = isnan(_812);
    bool _868 = _864 || _866;
    bool _870 = isnan(0.0);
    bool _872 = _868 || _870;
    float _874 = floor(_834);
    float _876 = _776 + _752;
    bool _878 = false;
    if (_850)
    {
        bool _880 = as_type<int>(_818) >= 0;
        _878 = _880;
    }
    bool _882 = _878;
    float _884 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _794);
    float _886 = _876 + (-1.0);
    float _888 = 1.0 / _838;
    int _890 = _882 ? (-1) : 0;
    if (_850)
    {
        int _892 = _882 ? 0 : 1078530011;
        _722 = _892;
    }
    int _894 = _722;
    float _896 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _898 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _900 = _842 * 6.283185482025146484375;
    float _902 = _840 * 6.283185482025146484375;
    float _904 = sin(_902);
    float _906 = fma(_124, 0.010999999940395355224609375, _900);
    float _908 = _906 * 0.15915493667125701904296875;
    float _910 = _906;
    int _912 = _894;
    int _914 = as_type<int>(_900);
    if (_850)
    {
        int _916 = int(0x80000000) & as_type<int>(_814);
        int _918 = _894 | _916;
        _910 = as_type<float>(_918);
    }
    float _920 = _910;
    bool _922 = !_832;
    bool _924 = _922 && _856;
    float _926 = _920;
    float _928 = _920;
    if (!_924)
    {
        float _930 = abs(_814);
        bool _932 = _930 != as_type<float>(0x7f800000u /* inf */);
        bool _934 = isnan(_930);
        bool _936 = _932 || _934;
        bool _938 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _940 = _936 || _938;
        float _942 = abs(_818);
        bool _944 = _942 == as_type<float>(0x7f800000u /* inf */);
        float _946 = abs(_818);
        bool _948 = _946 == as_type<float>(0x7f800000u /* inf */);
        bool _950 = !_940;
        bool _952 = _948 && _950;
        if (_952)
        {
            bool _954 = as_type<int>(_818) >= 0;
            _890 = _954 ? (-1) : 0;
        }
        int _956 = _890;
        if (_952)
        {
            _912 = 1075235812;
        }
        int _958 = _912;
        int _960 = _958;
        if (_952)
        {
            int _962 = ~_956;
            int _964 = (_962 != 0) ? _958 : 1061752795;
            _960 = _964;
        }
        int _966 = _960;
        if (_952)
        {
            int _968 = int(0x80000000) & as_type<int>(_814);
            int _970 = _966 | _968;
            _926 = as_type<float>(_970);
        }
        float _972 = _926;
        bool _974 = !_940;
        bool _976 = _974 && _944;
        _928 = _972;
        if (!_976)
        {
            float _978 = abs(_814);
            float _980 = abs(_818);
            float _982 = precise::max(_978, _980);
            float _984 = abs(_814);
            float _986 = abs(_818);
            float _988 = precise::min(_984, _986);
            float _990 = 1.0 / _982;
            float _992 = abs(_814);
            float _994 = abs(_818);
            bool _996 = _992 > _994;
            bool _998 = as_type<int>(_818) >= 0;
            float _1000 = abs(_814);
            float _1002 = abs(_818);
            float _1004 = _1000 + _1002;
            int _1006 = as_type<int>(_814) & int(0x80000000);
            bool _1008 = _1004 > as_type<float>(0x7f800000u /* inf */);
            bool _1010 = isnan(_1004);
            bool _1012 = _1008 || _1010;
            bool _1014 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1016 = _1012 || _1014;
            float _1018 = _988 * _990;
            float _1020 = _1018 * _1018;
            float _1022 = _1020 + 11.33538818359375;
            float _1024 = fma(_1020, _1022, 28.84246826171875);
            float _1026 = fma(_1020, _1024, 19.6966705322265625);
            float _1028 = fma(_1020, -0.82336294651031494140625, -5.674867153167724609375);
            float _1030 = fma(_1020, _1028, -6.565555095672607421875);
            float _1032 = 1.0 / _1026;
            float _1034 = _1020 * _1030;
            float _1036 = _1018 * _1034;
            float _1038 = fma(_1036, _1032, _1018);
            float _1040 = _1038;
            _928 = _1004;
            if (_996)
            {
                float _1042 = -_1038;
                float _1044 = _1042 + 1.57079637050628662109375;
                _1040 = _1044;
            }
            float _1046 = _1040;
            int _1048 = as_type<int>(_1046);
            if (!_998)
            {
                float _1050 = -_1046;
                float _1052 = _1050 + 3.1415927410125732421875;
                _1048 = as_type<int>(_1052);
            }
            int _1054 = _1048;
            if (!_1016)
            {
                int _1056 = _1006 | _1054;
                _928 = as_type<float>(_1056);
            }
        }
    }
    float _1058 = _928;
    float _1060 = fma(_790, 9.0, _124);
    bool _1062 = _852 > 0.0;
    float _1064 = abs(_904);
    float _1066 = log2(_1064);
    bool _1068 = _852 >= 0.0;
    bool _1070 = isnan(_852);
    bool _1072 = _1068 || _1070;
    bool _1074 = isnan(0.0);
    bool _1076 = _1072 || _1074;
    float _1078 = _1060 * 0.20999999344348907470703125;
    float _1080 = _1060 * (-0.1599999964237213134765625);
    bool _1082 = _874 > 0.0;
    float _1084 = fma(_1058, 5.00000095367431640625, _1078);
    bool _1086 = _874 >= 0.0;
    bool _1088 = isnan(_874);
    bool _1090 = _1086 || _1088;
    bool _1092 = isnan(0.0);
    bool _1094 = _1090 || _1092;
    float _1096 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _782);
    float _1098 = fma(_1058, 4.000000476837158203125, _1080);
    float _1100 = _1084 * 0.15915493667125701904296875;
    float _1102 = -_796;
    float _1104 = _1102 + 1.0;
    bool _1106 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1108 = isnan(0.0);
    bool _1110 = _1106 || _1108;
    bool _1112 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1114 = _1110 || _1112;
    float _1116 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].z, _784);
    float _1118 = _1098 * 0.15915493667125701904296875;
    float _1120 = _908 * 6.283185482025146484375;
    float _1122 = sin(_1120);
    float _1124 = _1114 ? _1104 : 0.0;
    float _1126 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].z, _780);
    int _1128 = _872 ? 0 : 1;
    float _1130 = _1116 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1132 = _1076 ? 0 : 1;
    float _1134 = _1124 * _888;
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1138 = _1136 != 0;
    int _1140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1142 = _1140 != 0;
    int _1144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1146 = _1144 != 0;
    float _1148 = _1100 * 6.283185482025146484375;
    float _1150 = sin(_1148);
    float _1152 = _1126 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1154 = ~_1128;
    int _1156 = _1154 + 1;
    int _1158 = _1156 + 1;
    float _1160 = -_1130;
    float _1162 = _1160 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _1164 = !_1138;
    int _1166 = _1164 ? 0 : 1;
    float _1168 = _1066 * 120.0;
    int _1170 = _1158;
    float _1172 = _1162;
    bool _1174 = _1082;
    if (!_860)
    {
        int _1176 = ~_1128;
        int _1178 = _1176 + 1;
        _1170 = _1178;
    }
    int _1180 = _1170;
    float _1182 = _1118 * 6.283185482025146484375;
    float _1184 = sin(_1182);
    int _1186 = abs(_1166);
    float _1188 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1190 = _1152 + _1188;
    int _1192 = ~_1132;
    int _1194 = _1192 + 1;
    int _1196 = _1194 + 1;
    int _1198 = _1094 ? 0 : 1;
    int _1200 = _1196;
    if (!_1062)
    {
        int _1202 = ~_1132;
        int _1204 = _1202 + 1;
        _1200 = _1204;
    }
    int _1206 = _1200;
    float _1208 = abs(_1122);
    float _1210 = log2(_1208);
    float _1212 = float(_1180);
    float _1214 = float(_1186);
    bool _1216 = !_1146;
    int _1218 = _1216 ? 0 : 1;
    int _1220 = ~_1198;
    int _1222 = _1220 + 1;
    int _1224 = _1222 + 1;
    float _1226 = rsqrt(_1096);
    int _1228 = _1224;
    if (!_1082)
    {
        int _1230 = ~_1198;
        int _1232 = _1230 + 1;
        _1228 = _1232;
    }
    int _1234 = _1228;
    float _1236 = _1150 + _1184;
    float _1238 = _1214 * _1212;
    int _1240 = abs(_1218);
    float _1242 = in.m_59.x;
    float _1244 = in.m_59.y;
    float _1246 = in.m_59.z;
    float _1248 = precise::max(_1236, -2.0);
    float _1250 = _1238 * (-2.0);
    float _1252 = float(_1234);
    float _1254 = _1210 * 80.0;
    float _1256 = float(_1240);
    float _1258 = fma(_896, _1250, _896);
    float _1260 = abs(_1190);
    float _1262 = abs(_1162);
    float _1264 = precise::max(_1260, _1262);
    float _1266 = exp2(_1254);
    float _1268 = _1256 * _1252;
    float _1270 = precise::min(_1248, 2.0);
    float _1272 = _1226 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1274 = _1264 >= 16.0;
    float _1276 = _752 + (-0.5);
    bool _1278 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1280 = isnan(1.0);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1286 = _1282 || _1284;
    float _1288 = fma(_1270, 0.25, 0.5);
    float _1290 = exp2(_1168);
    float _1292 = _1268 * (-2.0);
    float _1294 = _1272 * (-0.15915493667125701904296875);
    float _1296 = _1288 * 0.07999999821186065673828125;
    bool _1298 = !_1286;
    float _1300 = _1298 ? _124 : _1134;
    float _1302 = fma(_898, _1292, _898);
    float _1304 = _1276 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1306 = _1296 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1308 = _1190 * 0.0625;
    float _1310 = _776 + (-0.5);
    if (_1274)
    {
        float _1312 = _1162 * 0.0625;
        _1172 = _1312;
    }
    float _1314 = _1172;
    float _1316 = _1294 * 6.283185482025146484375;
    float _1318 = sin(_1316);
    float _1320 = _1310 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1322 = _776 * 6.283185482025146484375;
    float _1324 = abs(_1314);
    bool _1326 = _1324 == 0.0;
    float _1328 = _1266 + _1290;
    float _1330 = fma(_1300, _1258, _1320);
    float _1332 = fma(_1300, _1302, _1304);
    float _1334 = fma(_764, _1306, _1244);
    bool _1336 = !_1142;
    int _1338 = _1336 ? 0 : 1;
    float _1340 = _1330 * 0.15915493667125701904296875;
    float _1342 = _770 + _752;
    float _1344 = _124 * (-0.17000000178813934326171875);
    int _1346 = abs(_1338);
    float _1348 = _1294 * 6.283185482025146484375;
    float _1350 = cos(_1348);
    float _1352 = _1274 ? _1308 : _1190;
    float _1354 = _770 + (-0.5);
    float _1356 = _1342 + (-1.0);
    float _1358 = _1332 * 0.15915493667125701904296875;
    float _1360 = fma(_1334, 16.0, _1344);
    float _1362 = abs(_1352);
    bool _1364 = _1362 != 0.0;
    bool _1366 = isnan(_1362);
    bool _1368 = _1364 || _1366;
    bool _1370 = isnan(0.0);
    bool _1372 = _1368 || _1370;
    float _1374 = _1340 * 6.283185482025146484375;
    float _1376 = sin(_1374);
    float _1378 = float(_1206);
    float _1380 = _1360 + _1322;
    float _1382 = abs(_1314);
    bool _1384 = _1382 == 0.0;
    bool _1386 = !_1372;
    bool _1388 = _1384 && _1386;
    float _1390 = fma(_1356, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1392 = float(_1346);
    float _1394 = _1380 * 0.15915493667125701904296875;
    float _1396 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1398 = _1340 * 6.283185482025146484375;
    float _1400 = cos(_1398);
    float _1402 = _1392 * _1378;
    float _1404 = _124 * (-0.37000000476837158203125);
    float _1406 = _1402 * (-2.0);
    float _1408 = fma(_1334, 5.0, _1404);
    float _1410 = _1358 * 6.283185482025146484375;
    float _1412 = sin(_1410);
    int _1414 = as_type<int>(_1354);
    if (_1388)
    {
        bool _1416 = as_type<int>(_1314) >= 0;
        _1174 = _1416;
    }
    bool _1418 = _1174;
    float _1420 = _770 * (-0.87964594364166259765625);
    float _1422 = _1408 + _900;
    float _1424 = fma(_1390, _1406, _1390);
    int _1426 = _1418 ? (-1) : 0;
    if (_1388)
    {
        int _1428 = _1418 ? 0 : 1078530011;
        _914 = _1428;
    }
    int _1430 = _914;
    float _1432 = fma(_1334, 9.0, _1420);
    float _1434 = _1422 * 0.15915493667125701904296875;
    float _1436 = _1394 * 6.283185482025146484375;
    float _1438 = sin(_1436);
    if (_1388)
    {
        int _1440 = int(0x80000000) & as_type<int>(_1352);
        int _1442 = _1430 | _1440;
        _1414 = _1442;
    }
    int _1444 = _1414;
    bool _1446 = !_1372;
    bool _1448 = _1446 && _1326;
    int _1450 = _1444;
    float _1452 = as_type<float>(_1444);
    if (!_1448)
    {
        float _1454 = abs(_1352);
        bool _1456 = _1454 != as_type<float>(0x7f800000u /* inf */);
        bool _1458 = isnan(_1454);
        bool _1460 = _1456 || _1458;
        bool _1462 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1464 = _1460 || _1462;
        float _1466 = abs(_1314);
        bool _1468 = _1466 == as_type<float>(0x7f800000u /* inf */);
        float _1470 = abs(_1314);
        bool _1472 = _1470 == as_type<float>(0x7f800000u /* inf */);
        bool _1474 = !_1464;
        bool _1476 = _1472 && _1474;
        if (_1476)
        {
            bool _1478 = as_type<int>(_1314) >= 0;
            _1426 = _1478 ? (-1) : 0;
        }
        int _1480 = _1426;
        if (_1476)
        {
            _1450 = 1075235812;
        }
        int _1482 = _1450;
        int _1484 = _1482;
        if (_1476)
        {
            int _1486 = ~_1480;
            int _1488 = (_1486 != 0) ? _1482 : 1061752795;
            _1484 = _1488;
        }
        int _1490 = _1484;
        float _1492 = as_type<float>(_1490);
        if (_1476)
        {
            int _1494 = int(0x80000000) & as_type<int>(_1352);
            int _1496 = _1490 | _1494;
            _1492 = as_type<float>(_1496);
        }
        float _1498 = _1492;
        bool _1500 = !_1464;
        bool _1502 = _1500 && _1468;
        _1452 = _1498;
        if (!_1502)
        {
            float _1504 = abs(_1352);
            float _1506 = abs(_1314);
            float _1508 = precise::max(_1504, _1506);
            float _1510 = abs(_1352);
            float _1512 = abs(_1314);
            float _1514 = precise::min(_1510, _1512);
            float _1516 = 1.0 / _1508;
            float _1518 = abs(_1352);
            float _1520 = abs(_1314);
            bool _1522 = _1518 > _1520;
            bool _1524 = as_type<int>(_1314) >= 0;
            float _1526 = _1514 * _1516;
            float _1528 = _1526 * _1526;
            float _1530 = _1528 + 11.33538818359375;
            float _1532 = fma(_1528, _1530, 28.84246826171875);
            float _1534 = fma(_1528, _1532, 19.6966705322265625);
            float _1536 = fma(_1528, -0.82336294651031494140625, -5.674867153167724609375);
            float _1538 = fma(_1528, _1536, -6.565555095672607421875);
            float _1540 = 1.0 / _1534;
            float _1542 = _1528 * _1538;
            float _1544 = abs(_1352);
            float _1546 = abs(_1314);
            float _1548 = _1544 + _1546;
            int _1550 = as_type<int>(_1352) & int(0x80000000);
            float _1552 = _1526 * _1542;
            bool _1554 = _1548 > as_type<float>(0x7f800000u /* inf */);
            bool _1556 = isnan(_1548);
            bool _1558 = _1554 || _1556;
            bool _1560 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1562 = _1558 || _1560;
            float _1564 = fma(_1552, _1540, _1526);
            float _1566 = _1564;
            _1452 = _1548;
            if (_1522)
            {
                float _1568 = -_1564;
                float _1570 = _1568 + 1.57079637050628662109375;
                _1566 = _1570;
            }
            float _1572 = _1566;
            int _1574 = as_type<int>(_1572);
            if (!_1524)
            {
                float _1576 = -_1572;
                float _1578 = _1576 + 3.1415927410125732421875;
                _1574 = as_type<int>(_1578);
            }
            int _1580 = _1574;
            if (!_1562)
            {
                int _1582 = _1550 | _1580;
                _1452 = as_type<float>(_1582);
            }
        }
    }
    float _1584 = _1452;
    float _1586 = _810 + _1432;
    float _1588 = fma(_1300, _1424, _1396);
    float _1590 = _1434 * 6.283185482025146484375;
    float _1592 = sin(_1590);
    float _1594 = _1586 * 0.15915493667125701904296875;
    float _1596 = _1318 * _1246;
    float _1598 = fma(_1334, 0.5, 0.5);
    float _1600 = precise::clamp(_1598, 0.0, 1.0);
    float _1602 = _1350 * _1246;
    float _1604 = fma(_762, _1306, _1242);
    float _1606 = _1594 * 6.283185482025146484375;
    float _1608 = sin(_1606);
    float _1610 = fma(_1600, -2.0, 3.0);
    float _1612 = _1600 * _1600;
    float _1614 = fma(_1334, 0.58823525905609130859375, 0.411764681339263916015625);
    float _1616 = precise::clamp(_1614, 0.0, 1.0);
    float _1618 = _1438 * 0.064000003039836883544921875;
    float _1620 = _1610 * _1612;
    float _1622 = -_1584;
    float _1624 = _1588 + _1622;
    float _1626 = fma(_1616, -2.0, 3.0);
    float _1628 = _1616 * _1616;
    float _1630 = _1620 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1632 = _1592 * _1328;
    float _1634 = _752 * 6.283185482025146484375;
    float _1636 = _1626 * _1628;
    float _1638 = fma(_1618, _1630, _1604);
    float _1640 = _1632 * 0.180000007152557373046875;
    float _1642 = _1608 * 0.07299999892711639404296875;
    float _1644 = _1624 * 0.15915493667125701904296875;
    float _1646 = _1334 + 0.20000000298023223876953125;
    float _1648 = _1640 * _1636;
    float _1650 = fma(_1642, _1630, _1638);
    float _1652 = fma(_124, 0.310000002384185791015625, _1634);
    float _1654 = _1358 * 6.283185482025146484375;
    float _1656 = cos(_1654);
    float _1658 = -_1596;
    float _1660 = fma(_1350, _1646, _1658);
    float _1662 = fma(_1648, (*spvDescriptorSet0.vp_c9)._m0[191].x, _1650);
    float _1664 = _1652 * 0.15915493667125701904296875;
    float _1666 = _714 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1668 = _1660 + (-0.20000000298023223876953125);
    float _1670 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1662);
    float _1672 = fma(_124, 0.10999999940395355224609375, _1322);
    float _1674 = _1644 * 6.283185482025146484375;
    float _1676 = sin(_1674);
    float _1678 = _716 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1680 = _1670 * _1666;
    float _1682 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1668);
    float _1684 = _1672 * 0.15915493667125701904296875;
    float _1686 = fma(_1318, _1646, _1602);
    float _1688 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1690 = _1678 * _1682;
    float _1692 = _1644 * 6.283185482025146484375;
    float _1694 = cos(_1692);
    float _1696 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1686);
    float _1698 = _1656 * _1690;
    float _1700 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].z, _772);
    float _1702 = -_1690;
    float _1704 = _1412 * _1702;
    float _1706 = _1696 * _1688;
    float _1708 = _1400 * _1698;
    float _1710 = _1376 * _1676;
    float _1712 = _1400 * _1676;
    float _1714 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _884);
    float _1716 = 1.0 / _1678;
    float _1718 = _1700 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1720 = _1376 * _1698;
    float _1722 = _1676 * _1656;
    float _1724 = _1400 * _1694;
    float _1726 = _1376 * _1694;
    float _1728 = _1694 * _1656;
    float _1730 = _1664 * 6.283185482025146484375;
    float _1732 = sin(_1730);
    float _1734 = fma(_1412, _1724, _1710);
    float _1736 = -_1712;
    float _1738 = fma(_1412, _1726, _1736);
    float _1740 = fma(_1412, _1710, _1724);
    float _1742 = fma(_1728, _1680, _1704);
    float _1744 = fma(_1734, _1680, _1708);
    float _1746 = -_1726;
    float _1748 = fma(_1412, _1712, _1746);
    float _1750 = fma(_1738, _1680, _1720);
    float _1752 = sqrt(_1714);
    float _1754 = fma(_1722, _1706, _1742);
    float _1756 = fma(_1748, _1706, _1744);
    float _1758 = fma(_1740, _1706, _1750);
    float _1760 = _1152 + _1754;
    float _1762 = _1718 + _1756;
    float _1764 = _1130 + _1758;
    float _1766 = _1684 * 6.283185482025146484375;
    float _1768 = sin(_1766);
    float _1770 = fma(_1732, 0.12999999523162841796875, 1.0);
    float _1772 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1774 = _1762 + _1772;
    float _1776 = _1774 * _1716;
    float _1778 = _1752 * 0.64999997615814208984375;
    float _1780 = fma(_1776, _1776, _1776);
    float _1782 = _1780 * _1778;
    float _1784 = fma(_1768, 0.300000011920928955078125, _1770);
    float _1786 = _1784 * _1782;
    float _1788 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[32].z, _1764);
    float _1790 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[32].x, _1760);
    float _1792 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[32].y, _1762);
    float _1794 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1796 = _1788 + _1794;
    float _1798 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1800 = _1790 + _1798;
    float _1802 = _1796 * _1796;
    float _1804 = fma(_1800, _1800, _1802);
    float _1806 = sqrt(_1804);
    bool _1808 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1810 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1812 = _1808 || _1810;
    bool _1814 = isnan(0.5);
    bool _1816 = _1812 || _1814;
    bool _1818 = _1806 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1820 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1822 = _1738;
    float _1824 = _1790;
    float _1826 = _1786;
    float _1828 = _1752;
    float _1830 = _1704;
    if (!_1818)
    {
        _1820 = _1788;
    }
    float _1832 = _1820;
    float _1834 = _1832;
    if (!_1818)
    {
        _1822 = _1792;
    }
    float _1836 = _1822;
    bool _1838 = !_1818;
    float _1840 = _1836;
    if (!_1838)
    {
        float _1842 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1844 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1846 = _1806 + _1844;
        float _1848 = rsqrt(_1804);
        float _1850 = _1846 * _1842;
        float _1852 = _1792 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1854 = _1850 * 0.15915493667125701904296875;
        float _1856 = _1854 * 6.283185482025146484375;
        float _1858 = sin(_1856);
        float _1860 = _1854 * 6.283185482025146484375;
        float _1862 = cos(_1860);
        float _1864 = fma(_1858, _1852, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1866 = _1848 * _1864;
        float _1868 = _1862 + (-1.0);
        float _1870 = fma(_1800, _1866, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1872 = fma(_1796, _1866, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1874 = _1868 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1876 = fma(_1792, _1862, _1874);
        _1840 = _1876;
        _1824 = _1870;
        _1834 = _1872;
    }
    float _1878 = _1840;
    float _1880 = _1824;
    float _1882 = _1834;
    float _1884 = _1878;
    float _1886 = _1880;
    float _1888 = _1882;
    if (!_1816)
    {
        float _1890 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1892 = _1718 + _1890;
        float _1894 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1896 = -_1718;
        float _1898 = _1896 + _1878;
        float _1900 = _1892 * _1892;
        float _1902 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1904 = _1130 + _1902;
        float _1906 = fma(_1190, _1190, _1900);
        float _1908 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1910 = fma(_1904, _1904, _1906);
        float _1912 = _1894 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1914 = sqrt(_1910);
        float _1916 = precise::min(_1914, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1918 = _1916 * _1908;
        float _1920 = -_1152;
        float _1922 = _1920 + _1880;
        float _1924 = _1912 * _1918;
        float _1926 = -_1130;
        float _1928 = _1926 + _1882;
        float _1930 = fma(_1922, _1924, _1152);
        float _1932 = fma(_1898, _1924, _1718);
        float _1934 = fma(_1928, _1924, _1130);
        _1884 = _1932;
        _1886 = _1930;
        _1888 = _1934;
    }
    float _1936 = _1884;
    float _1938 = _1886;
    float _1940 = _1888;
    float _1942 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1944 = _1936 + _1942;
    float _1946 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1948 = _1938 + _1946;
    float _1950 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1952 = _1940 + _1950;
    float _1954 = _1944 * _1944;
    float _1956 = fma(_1948, _1948, _1954);
    float _1958 = fma(_1952, _1952, _1956);
    float _1960 = rsqrt(_1958);
    float _1962 = sqrt(_1958);
    float _1964 = _1960 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1966 = _1948 * _1964;
    float _1968 = _1952 * _1964;
    float _1970 = _1966 * _1966;
    float _1972 = _1968 * _1968;
    float _1974 = _1970 + _1972;
    float _1976 = sqrt(_1974);
    bool _1978 = _1976 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1980 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1982 = _1976 + _1980;
    float _1984 = _1952;
    float _1986 = _1982;
    float _1988 = _1944;
    if (_1978)
    {
        float _1990 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1984 = _1990;
    }
    float _1992 = _1984;
    if (_1978)
    {
        float _1994 = rsqrt(_1974);
        _1826 = _1994;
    }
    float _1996 = _1826;
    float _1998 = _1996;
    if (_1978)
    {
        float _2000 = _1982 * _1992;
        _1986 = _2000;
    }
    float _2002 = _1986;
    if (_1978)
    {
        float _2004 = _2002 * 0.15915493667125701904296875;
        _1828 = _2004;
    }
    float _2006 = _1828;
    float _2008 = _1960;
    if (_1978)
    {
        float _2010 = _2006 * 6.283185482025146484375;
        float _2012 = sin(_2010);
        _2008 = _2012;
    }
    float _2014 = _2008;
    float _2016 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2018 = precise::max(0.0, _2016);
    float _2020 = _1954;
    float _2022 = _2018;
    float _2024 = _2016;
    if (_1978)
    {
        float _2026 = _2006 * 6.283185482025146484375;
        float _2028 = cos(_2026);
        _2020 = _2028;
    }
    float _2030 = _2020;
    float _2032 = -_1964;
    float _2034 = -_2018;
    float _2036 = fma(_1944, _2032, _2034);
    if (!_1978)
    {
        _1988 = _1968;
    }
    float _2038 = _1988;
    float _2040 = _2038;
    if (_1978)
    {
        float _2042 = _2036 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2022 = _2042;
    }
    float _2044 = _2022;
    float _2046 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2048 = _1936 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2050 = _2044;
    float _2052 = _2014;
    if (_1978)
    {
        float _2054 = fma(_2014, _2044, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2050 = _2054;
    }
    float _2056 = _2050;
    float _2058 = _2056;
    if (!_1978)
    {
        _2052 = _1966;
    }
    float _2060 = _2052;
    float _2062 = _2060;
    float _2064 = _2030;
    if (_1978)
    {
        float _2066 = _2030 + (-1.0);
        _2024 = _2066;
    }
    float _2068 = _2024;
    float _2070 = _2068;
    if (_1978)
    {
        float _2072 = _1996 * _2056;
        _1830 = _2072;
    }
    float _2074 = _1830;
    if (!_1978)
    {
        _2058 = _2036;
    }
    float _2076 = _2058;
    float _2078 = _2076;
    if (_1978)
    {
        float _2080 = _2068 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1998 = _2080;
    }
    float _2082 = _1998;
    if (_1978)
    {
        float _2084 = _1966 * _2074;
        _2062 = _2084;
    }
    float _2086 = _2062;
    if (!_1978)
    {
        _2070 = _1970;
    }
    float _2088 = _2070;
    float _2090 = _2088;
    if (_1978)
    {
        float _2092 = _1968 * _2074;
        _2040 = _2092;
    }
    float _2094 = _2040;
    if (_1978)
    {
        float _2096 = fma(_2036, _2030, _2082);
        _2078 = _2096;
    }
    float _2098 = _2078;
    if (_1978)
    {
        float _2100 = _2086 * _2086;
        _2090 = _2100;
    }
    float _2102 = _2090;
    if (!_1978)
    {
        _2064 = _1972;
    }
    float _2104 = _2064;
    float _2106 = _2104;
    if (_1978)
    {
        float _2108 = _2094 * _2094;
        _2106 = _2108;
    }
    float _2110 = _2106;
    float _2112 = fma(_2098, _2098, _2102);
    float _2114 = _1936 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2116 = _2112 + _2110;
    float _2118 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2120 = fma(_1962, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2118);
    float _2122 = precise::clamp(_2120, 0.0, 1.0);
    float _2124 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2114);
    float _2126 = _1936 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2128 = -_2122;
    float _2130 = _2128 + 1.0;
    float _2132 = rsqrt(_2116);
    float _2134 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2124);
    float _2136 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2126);
    float _2138 = _1936 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2140 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2048);
    float _2142 = _2134 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2144 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2136);
    float _2146 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2138);
    float _2148 = abs(_2130);
    float _2150 = log2(_2148);
    float _2152 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2140);
    float _2154 = _2144 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2156 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2146);
    float _2158 = _2142 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2160 = _2152 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2162 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2164 = _2156 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2166 = _2132 * _2086;
    float _2168 = _2132 * _2098;
    float _2170 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2162);
    float _2172 = _2132 * _2094;
    float _2174 = _2166 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2176 = -_2158;
    float _2178 = fma(_2176, _2046, 1.0);
    float _2180 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2170);
    float _2182 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2184 = -_2174;
    float _2186 = fma(_2168, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2184);
    float _2188 = _2150 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2190 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2180);
    float _2192 = log2(_2178);
    float _2194 = -_2172;
    float _2196 = fma(_2194, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2186);
    float _2198 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2200 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2182);
    float _2202 = _2168 + 1.0;
    float _2204 = fma(_2196, -0.5, 0.5);
    float _2206 = fma(_2196, 0.5, 0.5);
    float _2208 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2198);
    float _2210 = exp2(_2188);
    float _2212 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2200);
    float _2214 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2208);
    float _2216 = 1.0 / _2190;
    float _2218 = fma(_2206, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2220 = _2192 * 0.693147182464599609375;
    float _2222 = fma(_2206, _2218, -0.212114393711090087890625);
    float _2224 = _2220 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2226 = sqrt(_2204);
    float _2228 = -_2168;
    float _2230 = fma(_2210, _2202, _2228);
    float _2232 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2212);
    float _2234 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2214);
    float _2236 = fma(_2206, _2222, 1.570728778839111328125);
    float _2238 = fma(_2230, 0.5, 0.5);
    float _2240 = _2232 * _2216;
    float _2242 = _2234 * _2216;
    float _2244 = fma(_2240, 0.5, 0.5);
    float _2246 = fma(_2242, -0.5, 0.5);
    float _2248 = _2226 * 0.636619746685028076171875;
    float _2250 = -_2236;
    float _2252 = fma(_2248, _2250, 1.0);
    float3 _6162 = float3(_2244, _2246, _2224);
    float _2254 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6162, float3(0.0), isnan(_6162)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6162, float3(0.0), isnan(_6162)), level(0.0)).x;
    float3 _6173 = float3(_2244, _2246, _2224);
    float4 _2257 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6173, float3(0.0), isnan(_6173)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6173, float3(0.0), isnan(_6173)), level(0.0)).xyzw;
    float _2259 = _2257.x;
    float _2261 = _2257.y;
    float _2263 = _2257.z;
    float _2265 = _2257.w;
    float2 _6190 = float2(_2252, _2238);
    float3 _2269 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6190, float2(0.0), isnan(_6190)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6190, float2(0.0), isnan(_6190)), level(0.0)).xyz;
    float _2271 = _2269.x;
    float _2273 = _2269.y;
    float _2275 = _2269.z;
    float _2277 = in.m_57.w;
    float _2279 = _776 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2281 = _770 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2285 = _2283 != 0;
    float _2287 = in.m_49.x;
    int _2289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2291 = _2289 != 0;
    float _2293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2297 = _2295 != 0;
    float _2299 = _2150 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2303 = _2301 != 0;
    bool _2305 = _842 > 0.5;
    float _2307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2309 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2311 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2313 = _2309 || _2311;
    bool _2315 = isnan(0.5);
    bool _2317 = _2313 || _2315;
    float _2319 = _1716;
    bool _2321 = _2297;
    bool _2323 = _2303;
    if (_2291)
    {
        float _2325 = in.m_55.z;
        _2319 = _2325;
    }
    float _2327 = _2319;
    int _2329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2331 = _2329 != 0;
    float _2333 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2335 = _2333 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    out.m_61.w = _2277;
    float _2337 = 1.0 / _2335;
    float _2339 = _2293 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2341 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2343 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2345 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2347 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2349 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2351 = _2343 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2353 = _2345 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2355 = _2341 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2357 = -_2347;
    float _2359 = fma(_2279, 2.0, _2357);
    float _2361 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2363 = _2361 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2365 = fma(_2281, -2.0, _2349);
    float _2367 = 1.0 / _2363;
    float _2369 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2371 = _2369 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2373 = -_124;
    float _2375 = fma(_2373, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2359);
    float _2377 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2379 = _2377 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _2381 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2383 = -_144;
    float _2385 = _2383 + 1.0;
    float _2387 = 1.0 / _2379;
    float _2389 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2391 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2389;
    out.m_63.x = _2351;
    out.m_63.y = _2353;
    out.m_63.z = _2355;
    out.m_63.w = _2381;
    int _2393 = _2305 ? as_type<int>(_2385) : as_type<int>(_144);
    float _2395 = _2391 * _2337;
    bool _2397 = _770 > 0.5;
    float _2399 = _2391;
    float _2401 = _2371;
    float _2403 = _2379;
    if (!_2331)
    {
        float _2405 = in.m_55.z;
        _2399 = _2405;
    }
    float _2407 = _2399;
    float _2409 = _2297 ? as_type<float>(_2393) : _144;
    float _2411 = _2371 * _2367;
    if (_2291)
    {
        bool _2413 = _2327 > 0.5;
        _2321 = _2413;
    }
    bool _2415 = _2321;
    float _2417 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2419 = _750 + _2417;
    float _2421 = exp2(_2299);
    if (_2303)
    {
        float _2423 = _2397 ? _2385 : _144;
        _192 = _2423;
    }
    float _2425 = _192;
    if (!_2331)
    {
        _2401 = _770;
    }
    float _2427 = _2401;
    float _2429 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2431 = _750 + _2429;
    float _2433 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2435 = fma(_2395, _2431, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2437 = _2427;
    if (_2285)
    {
        bool _2439 = _776 > 0.5;
        _2323 = _2439;
    }
    bool _2441 = _2323;
    float _2443 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2445 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _2443;
    if (_2331)
    {
        _2437 = _776;
    }
    float _2447 = _2437;
    float _2449 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _2451 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2453 = isnan(_750);
    bool _2455 = _2451 || _2453;
    bool _2457 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2459 = _2455 || _2457;
    float _2461 = float(_2459);
    float _2463 = _2445 * _2387;
    bool _2465 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2467 = isnan(_750);
    bool _2469 = _2465 || _2467;
    bool _2471 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2473 = _2469 || _2471;
    float _2475 = float(_2473);
    float _2477 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2449);
    float _2479 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2481 = _750 + _2479;
    float _2483 = _2481;
    float _2485 = _2449;
    if (!_2285)
    {
        _2403 = _2287;
    }
    float _2487 = _2403;
    float _2489 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2433);
    float _2491 = -_2475;
    float _2493 = _2491 + 1.0;
    float _2495 = fma(_2411, _2481, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2497 = _2407;
    float _2499 = _2487;
    float _2501 = _2495;
    if (!_2331)
    {
        _2483 = _2407;
    }
    float _2503 = _2483;
    float _2505 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2489);
    float _2507 = _2503;
    float _2509 = _2505;
    if (_2331)
    {
        _2507 = _770;
    }
    float _2511 = _2507;
    float _2513 = -_2421;
    float _2515 = _2513 + 1.0;
    if (_2331)
    {
        _2497 = _770;
    }
    float _2517 = _2497;
    float _2519 = _2461 * _2493;
    if (!_2285)
    {
        _2485 = _2487;
    }
    float _2521 = _2485;
    float _2523 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2525 = _2521;
    if (_2285)
    {
        _2499 = _2287;
    }
    float _2527 = _2499;
    float _2529 = -_2461;
    float _2531 = _2529 + 1.0;
    bool _2533 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2535 = isnan(_750);
    bool _2537 = _2533 || _2535;
    bool _2539 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2541 = _2537 || _2539;
    float _2543 = float(_2541);
    float _2545 = _2515 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2547 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2549 = isnan(_750);
    bool _2551 = _2547 || _2549;
    bool _2553 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2555 = _2551 || _2553;
    float _2557 = float(_2555);
    float _2559 = fma(_2409, _2339, -0.5);
    float _2561 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2523);
    float _2563 = fma(_2463, _2419, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2565 = _2557 * _2531;
    float _2567 = -_2557;
    float _2569 = _2567 + 1.0;
    float _2571 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2561);
    float _2573 = _2307 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2575 = _2543 * _2569;
    float _2577 = _2571 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2579 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2581 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2583 = _2435 * _2575;
    float _2585 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2587 = fma(_2447, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2579);
    float _2589 = 1.0 / _2577;
    float _2591 = fma(_1152, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2581);
    float _2593 = _2447 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2595 = fma(_2573, _2425, -0.5);
    float _2597 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2591);
    float _2599 = -_2585;
    float _2601 = fma(_2593, 2.0, _2599);
    int _2603 = as_type<int>(_2581);
    int _2605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[83].w);
    float _2607 = _2543;
    float _2609 = _2527;
    if (_2291)
    {
        float _2611 = -_2527;
        float _2613 = _2611 + 1.0;
        _2603 = as_type<int>(_2613);
    }
    int _2615 = _2603;
    float _2617 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_2285)
    {
        float _2619 = -_2527;
        float _2621 = _2619 + 1.0;
        _2605 = as_type<int>(_2621);
    }
    int _2623 = _2605;
    float _2625 = _2597 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2629 = fma(_2517, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2617);
    float _2631 = -_124;
    float _2633 = fma(_2631, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2601);
    float _2635 = _2625 + _2577;
    if (_2285)
    {
        float _2637 = _2441 ? as_type<float>(_2623) : _2527;
        _2525 = _2637;
    }
    float _2639 = _2525;
    float _2641 = -_2543;
    float _2643 = _2641 + 1.0;
    if (!_2317)
    {
        _2607 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2645 = _2607;
    float _2647 = _2635 * _2589;
    float _2649 = _2647 * 0.5;
    float _2651 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2653 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2365);
    float _2655 = fma(_2643, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2583);
    float _2657 = _2645;
    float _2659 = _2649;
    if (!_2317)
    {
        float _2661 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2663 = fma(_2649, _2645, _2661);
        _2657 = _2663;
    }
    float _2665 = _2657;
    if (!_2317)
    {
        _2659 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2667 = _2659;
    float _2669 = _2511 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_2291)
    {
        float _2671 = _2415 ? as_type<float>(_2615) : _2527;
        _2609 = _2671;
    }
    float _2673 = _2609;
    float _2675 = -_2653;
    float _2677 = fma(_2505, _2595, _2675);
    float _2679 = _2627 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2681 = _2665;
    if (!_2317)
    {
        float _2683 = 1.0 / _2665;
        _2681 = _2683;
    }
    float _2685 = _2681;
    if (!_2317)
    {
        float _2687 = -_2667;
        float _2689 = _2687 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2509 = _2689;
    }
    float _2691 = _2509;
    float _2693 = fma(_2679, _2673, -0.5);
    float _2695 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2629);
    float _2697 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2699 = fma(_2495, _2565, _2655);
    float _2701 = _2651 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2703 = _2677 + 0.5;
    float _2705 = _2673;
    if (!_2317)
    {
        float _2707 = 1.0 / _2691;
        _2705 = _2707;
    }
    float _2709 = _2705;
    float _2711 = fma(_2669, -2.0, _2697);
    float _2713 = fma(_2701, _2639, -0.5);
    float _2715 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2587);
    float _2717 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2477);
    float _2719 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2711);
    float _2721 = fma(_2563, _2519, _2699);
    float _2723 = fma(_2715, _2693, _2633);
    float _2725 = fma(_2717, _2713, _2375);
    float _2727 = _2723;
    if (!_2317)
    {
        float _2729 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2731 = -_2667;
        float _2733 = fma(_2685, _2729, _2731);
        _2501 = _2733;
    }
    float _2735 = _2501;
    float _2737 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2739 = -_2719;
    float _2741 = fma(_2695, _2559, _2739);
    float _2743 = _2723 + 0.5;
    float _2745 = _2725 + 0.5;
    if (_2317)
    {
        _2727 = 1.0;
    }
    float _2747 = _2727;
    float _2749 = fma(_2475, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2721);
    float _2751 = _2747;
    if (!_2317)
    {
        float _2753 = _2735 * _2709;
        float _2755 = precise::clamp(_2753, 0.0, 1.0);
        _2751 = _2755;
    }
    float _2757 = _2751;
    float _2759 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2737);
    float _2761 = _2741 + 0.5;
    float _2763 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2759);
    float _2765 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2767 = _2190 * 0.5;
    float _2769 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2771 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2763);
    float _2773 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2775 = _2757 > 0.0;
    bool _2777 = isnan(_2757);
    bool _2779 = _2775 || _2777;
    bool _2781 = isnan(0.0);
    bool _2783 = _2779 || _2781;
    out.m_65.x = _2745;
    out.m_65.y = _2703;
    out.m_65.z = _2743;
    out.m_65.w = _2761;
    float _2785 = _2765 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2787 = _2769 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2789 = _2773 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2791 = _2749 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2793 = _2757 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2795 = -_2545;
    float _2797 = _2795 + 1.0;
    out.gl_Position.x = _2232;
    out.gl_Position.y = _2234;
    out.gl_Position.z = _2771;
    out.gl_Position.w = _2190;
    float _2799 = _2793 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.x = _2785;
    out.m_67.y = _2787;
    out.m_67.z = _2789;
    out.m_67.w = _2791;
    float _2801 = fma(_2234, -0.5, _2767);
    float _2803 = _2771 + _2190;
    float _2805 = _2232 + _2190;
    out.m_45.x = _2799;
    float _2807 = _2803 * 0.5;
    float _2809 = _2805 * 0.5;
    out.m_69.x = _2809;
    out.m_69.y = _2801;
    out.m_69.z = _2807;
    out.m_69.w = _2190;
    float _2811 = _2545 * _2254;
    float _2813 = _2265 * _2797;
    float _2815 = _2265 * _2811;
    float _2817 = _2275 * _2811;
    float _2819 = fma(_2271, _2815, _2259);
    float _2821 = fma(_2273, _2815, _2261);
    float _2823 = fma(_2265, _2817, _2263);
    out.m_71.x = _2819;
    out.m_71.y = _2821;
    out.m_71.z = _2823;
    out.m_71.w = _2813;
    if (_2783)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2825 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2825;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

